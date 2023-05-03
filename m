Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1306F5014
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 May 2023 08:27:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24B11C6A60C;
	Wed,  3 May 2023 06:27:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAC5BC0356E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 06:27:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34311mKv025693; Wed, 3 May 2023 08:27:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=eD1es7gT497nt0AScVKjk9gWyTuVDgCt330EwSJb6Xo=;
 b=15qtPv19CCowptiCM8eIlFlQnl9puc4toKlq6dDNHAWGByOyBvXyDO8bpqNq5t2lHiIT
 DilwSHLtWPUQgeQjv+4lYv0DeGfnKloJzCqOBmWW9FBFiMZfgOMG3Y5/FEFQoN+L8oIE
 YehEUAnQLdC+aPjM1ZnXO0Bbu1R7m77EOwRlU8CYcY5pF/wYZSsVXGloXO/HjAx+KPQr
 nxsDuqgGQU4HImHOA51RQHhoN7VfpLo7V1c6iuf3U1IyRm5mfsJfwzaZ+oDP0bmo3Ity
 9TILVTpyK5UVu/SvCgs2Kqn16qqz2Y4OSpE0CybVXv/nq5NbS5ysSCoznEAYCeD5D99l 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q8rnmn6j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 08:27:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D2E5C10002A;
 Wed,  3 May 2023 08:27:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8EDE211F3D;
 Wed,  3 May 2023 08:27:40 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 3 May
 2023 08:27:40 +0200
Message-ID: <5ead2bec-9bd9-7d09-8e02-43cbab4142ef@foss.st.com>
Date: Wed, 3 May 2023 08:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
 <20230427153632.2.Ie06da6845013adef7bc23ff4c379fda001542fa6@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230427153632.2.Ie06da6845013adef7bc23ff4c379fda001542fa6@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_03,2023-04-27_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/6] stm32mp: bsec: add check on null size
	in misc ops
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



On 4/27/23 15:36, Patrick Delaunay wrote:
> Add a protection in misc bsec ops for request with null size.
> 
> For example OP-TEE error occurs when get_eth_nb() return 0 in
> setup_mac_address() for unknown part number because U-Boot read 0 OTPs.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index f5f4b20d4776..0dc1e5c3fdc4 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -622,7 +622,7 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
>  		shadow = false;
>  	}
>  
> -	if ((offs % 4) || (size % 4))
> +	if ((offs % 4) || (size % 4) || !size)
>  		return -EINVAL;
>  
>  	if (IS_ENABLED(CONFIG_OPTEE) && priv->tee) {
> @@ -678,7 +678,7 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
>  		shadow = false;
>  	}
>  
> -	if ((offs % 4) || (size % 4))
> +	if ((offs % 4) || (size % 4) || !size)
>  		return -EINVAL;
>  
>  	if (IS_ENABLED(CONFIG_OPTEE) && priv->tee) {
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
