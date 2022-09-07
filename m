Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC775AFCAE
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 08:41:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44E66C0D2BF;
	Wed,  7 Sep 2022 06:41:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 129BBC03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 06:41:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2875KcOQ016204;
 Wed, 7 Sep 2022 08:41:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LvxA9bqyA6PF2BmHKi1624uF5X6kqr5SBNefT7dkDN0=;
 b=K/r7UBjUBnUwy3rMdksP7dzRXqKbdd2ysURjltZd9Kn3AK29T2oAEv/bTRPLr0n3+Okl
 u2lYxAXeVx4HNKRr33spYkKCU3GKi5WUF2vaZjVsf8b0ec9QZnMhspTcKIWVc7DyJDWq
 9nlpe2ulv+sBKQZ5vd9gCCEgrTaUqdq2jky6K4sibH6uguoVnZbPXJK+dCw2anMMRaQv
 0QF+4M2X75K4Wcs8eMRiJGsX10tKWUUeahHbLNnWFav8T5/3UF3UH6EH1KL+bpCZNgUA
 NfIT5XVRrYoZwWg1wP2U7NGXTyM0KUHQkn14nOv77TpMW1Q4TP7B8oWKvGfxC4eUrvUv cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbx91mebk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 08:41:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B556310002A;
 Wed,  7 Sep 2022 08:41:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9720C2128B5;
 Wed,  7 Sep 2022 08:41:08 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 7 Sep 2022
 08:41:08 +0200
Message-ID: <4e4ad9a2-0865-b639-2f64-b7ce2c1608c3@foss.st.com>
Date: Wed, 7 Sep 2022 08:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220906185314.1.I9928b88f3a453611043b484158b02efe9b0c06bf@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220906185314.1.I9928b88f3a453611043b484158b02efe9b0c06bf@changeid>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_04,2022-09-06_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] stm32mp: stm32prog: support empty
	flashlayout
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

On 9/6/22 18:53, Patrick Delaunay wrote:
> When the STM32CubeProgrammer sent a empty flashlayout.tsv
> file, the command stm32prog correctly parse the file
> but data->dev_nb = 0 and the stm32prog_devices_init
> operations should be skipped.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index c391b6c7abb..65e32288af7 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -1884,6 +1884,10 @@ static void stm32prog_devices_init(struct stm32prog_data *data)
>  	if (ret)
>  		goto error;
>  
> +	/* empty flashlayout */
> +	if (!data->dev_nb)
> +		return;
> +
>  	/* initialize the selected device */
>  	for (i = 0; i < data->dev_nb; i++) {
>  		ret = init_device(data, &data->dev[i]);

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
