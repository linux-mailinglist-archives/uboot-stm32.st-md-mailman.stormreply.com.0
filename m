Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8C33B8E25
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:25:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AC96C59783;
	Thu,  1 Jul 2021 07:25:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 644EEC59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:25:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617N5sq010272; Thu, 1 Jul 2021 09:25:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sEtbnUuGjWEb+ocgHAEexx7hFWkgvNgAc+DnEA6C96o=;
 b=U+2PNQGxHgoIJDod6XcLeTFBiPMLayQLYes15kDvGsQnybiIrM61xa+UJTGCkvymawQr
 F6ArnTLQXqdpPr3Xr2D94hPlcaSIyqaHK6HhKyljigNEfoD4UQa9d1VREo64fZgxjTHF
 j4hfMxdH3fFeqPa2vQTorBhmkwVyCreNc5+pT1qUQZvH4qAVnekULizsYq9jDAJcsEu/
 TwU4aS7NSa8bALsubjq9QRwL0Cdax0H/Aird1zADxfFjuf58yDgEvWhud5Q5sCYRzvsh
 zB/JM1XOP4f6oCT2aQWimjh9yu0TKBEmJ0JhGatfLK1gKtJ51gWVxlwWKLFeq850usS2 TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39gn11eu28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:25:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C9FE100034;
 Thu,  1 Jul 2021 09:25:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2C5A2128A2;
 Thu,  1 Jul 2021 09:25:36 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:25:36 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210629120824.1.Ie6808c79e8d3fc567c03ce44ff9dbfc44ee105d3@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <e862e8b9-c73c-15eb-87c9-1a0fac2dd6ff@foss.st.com>
Date: Thu, 1 Jul 2021 09:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629120824.1.Ie6808c79e8d3fc567c03ce44ff9dbfc44ee105d3@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: activate command rng
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

On 6/29/21 12:08 PM, Patrick Delaunay wrote:
> Activate the command rng with CONFIG_CMD_RNG, used to test
> the rng driver
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig   | 2 +-
>  configs/stm32mp15_trusted_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 3ff46f7048..9239658aee 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -54,6 +54,7 @@ CONFIG_CMD_BMP=y
>  CONFIG_CMD_CACHE=y
>  CONFIG_CMD_EFIDEBUG=y
>  CONFIG_CMD_TIME=y
> +CONFIG_CMD_RNG=y
>  CONFIG_CMD_TIMER=y
>  CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
> @@ -168,7 +169,6 @@ CONFIG_BMP_32BPP=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  CONFIG_ERRNO_STR=y
> -# CONFIG_HEXDUMP is not set
>  CONFIG_FDT_FIXUP_PARTITIONS=y
>  # CONFIG_LMB_USE_MAX_REGIONS is not set
>  CONFIG_LMB_MEMORY_REGIONS=2
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index afbf721299..6122fd28b8 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -37,6 +37,7 @@ CONFIG_CMD_BMP=y
>  CONFIG_CMD_CACHE=y
>  CONFIG_CMD_EFIDEBUG=y
>  CONFIG_CMD_TIME=y
> +CONFIG_CMD_RNG=y
>  CONFIG_CMD_TIMER=y
>  CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
> @@ -150,7 +151,6 @@ CONFIG_BMP_32BPP=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  CONFIG_ERRNO_STR=y
> -# CONFIG_HEXDUMP is not set
>  CONFIG_FDT_FIXUP_PARTITIONS=y
>  # CONFIG_LMB_USE_MAX_REGIONS is not set
>  CONFIG_LMB_MEMORY_REGIONS=2
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
