Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656065C076
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 14:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7845C64110;
	Tue,  3 Jan 2023 13:10:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E102BC03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 13:10:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3039O0v3015000; Tue, 3 Jan 2023 14:10:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=H+a0v8tqqFHe3K5Xb9fGWozOvOS7TYXfhK6sz8EdziI=;
 b=RUwRDqH6OK3OyOdKqFoD1IKS5pClH/i6zfUUtlTeMrGC9fa89eMSOZ2sELWcSsuDNjc1
 VMiffpBNIPCXK17C7IZkROJZ/URYITjQZQ4RwUZQapdgqSOqzs7kfxCTLyPoYUg8VI4o
 7yj8LeOWRfMKjxYZzGw/et9kIOvhqqlIZfVhjfNPE4Buttk+tVQvLbX9TYZPOWwKV7qn
 Gc9NzL8pxwV7hjApkDznoM39z0JWGzw+WRYcam237ailrUMHClQJ+XwGPs4pAN1KkhPB
 0eR8esvT2D8nN8AJ5Zm0ArtpZQKLHyvRfFiwwtAwTSjK8ozSx0gXRcuEcLFPdyOIfea0 YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtcupn80k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 14:10:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C19810002A;
 Tue,  3 Jan 2023 14:10:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0131421D3D0;
 Tue,  3 Jan 2023 14:10:19 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 14:10:18 +0100
Message-ID: <f608fc63-2e2d-61cc-9f9d-60ed5ffba30d@foss.st.com>
Date: Tue, 3 Jan 2023 14:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221215095446.1.Ia16a826f3adcee45569a6d47e8ba5b5e3c1d7373@changeid>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221215095446.1.Ia16a826f3adcee45569a6d47e8ba5b5e3c1d7373@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_04,2023-01-03_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] optee: bind the TA drivers on OP-TEE node
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick

just one typo

On 12/15/22 09:54, Patrick Delaunay wrote:
> In U-Boot driver model the devices can be referenced by
> phandle in the U-Boot configuration nodes.
> 
> Without a valid node provided during the bind, the driver
> associated to OP-TEE TA can't be referenced.
> 
> For example to force the sequence number with alias
> (.flags = DM_UC_FLAG_SEQ_ALIAS)
> 
>  	aliases {
> 		rng0 = &optee;
>  	};
> 
> or other configuration:
> 
> board-sysinfo {
>    compatible = "vendor,sysinfo-board";
>    ramdom = <&optee>;
> }
> 
> With this patch all drivers bound from OP-TEE service
> discovery are now associated are associated to OP-TEE

s/are now associated are associated/are now associated

> node, allowing to identify by phandle the driver
> provided by the TA for one UCLASS without modifying
> device tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/tee/optee/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index 9240277579be..96f08074443f 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -92,7 +92,8 @@ static int bind_service_list(struct udevice *dev, struct tee_shm *service_list,
>  		if (!service)
>  			continue;
>  
> -		ret = device_bind_driver(dev, service->driver_name, service->driver_name, NULL);
> +		ret = device_bind_driver_to_node(dev, service->driver_name, service->driver_name,
> +						 dev_ofnode(dev), NULL);
>  		if (ret) {
>  			dev_warn(dev, "%s was not bound: %d, ignored\n", service->driver_name, ret);
>  			continue;
> @@ -832,7 +833,8 @@ static int optee_probe(struct udevice *dev)
>  		 * Discovery of TAs on the TEE bus is not supported in U-Boot:
>  		 * only bind the drivers associated to the supported OP-TEE TA
>  		 */
> -		ret = device_bind_driver(dev, "optee-rng", "optee-rng", NULL);
> +		ret = device_bind_driver_to_node(dev, "optee-rng", "optee-rng",
> +						 dev_ofnode(dev), NULL);
>  		if (ret)
>  			return ret;
>  	}
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
