Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E333C239C
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Jul 2021 14:41:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 774C9C424BD;
	Fri,  9 Jul 2021 12:41:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24B3ECFAC5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 12:41:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169CfVvj012304; Fri, 9 Jul 2021 14:41:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5cTNrzFu5iQhcqNZXK2Ddt6K/PPWyoNSF48iGOkzvLs=;
 b=U4NvVmi+KdxYJF480snSLotnGQE4jBHwmmPrJVWnyqGnCn7E5TiIlE0yXrhSE+OYcYLR
 H8EICi4orQfm2R4uPc6FpCOFY1bRp08bUKvmxIlnnG4rMergeaLf+x4eg0lPvcvZmlUP
 iXMZxqUIJBsEuDhZhUITByxyN4WaQiutF+4q1V2N+dV23oniyZjI3zR7qtSovw7X37wn
 5CuaPzdipFM83HKd6yZvOTs38kZHf0zgkd+fO32w4pPO+qGhYlsITYSpYYh6mFZZu6I8
 wvyx3MDZK5tV369Ht+nd4jWa0iph9bQsbhLsr1PA7bnb1YENh0eUtT1jPqujl8dfvjMQ 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39p4vbcxfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 14:41:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40AF010002A;
 Fri,  9 Jul 2021 14:41:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32AB621FEA9;
 Fri,  9 Jul 2021 14:41:47 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 14:41:46 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
 <20210708111743.1.I75c3a4359a6e42c20360fb1774a2e371a08a6270@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <c35d0882-5bf8-8766-4fd4-ae0d8751f02c@foss.st.com>
Date: Fri, 9 Jul 2021 14:41:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708111743.1.I75c3a4359a6e42c20360fb1774a2e371a08a6270@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_05:2021-07-09,
 2021-07-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] arm: stm32mp: add config for
	STM32IMAGE support
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

On 7/8/21 11:17 AM, Patrick Delaunay wrote:
> By default for trusted boot with TF-A, U-Boot (u-boot-nodtb)
> is located in FIP container with its device tree and with
> the secure monitor (provided by TF-A or OP-TEE).
> The FIP file is loaded by TF-A BL2 and each components is
> extracted at the final location.
> 
> This patch add CONFIG_STM32MP15x_STM32IMAGE to request the
> STM32 image generation for SOC STM32MP15x
> when FIP container is not used (u-boot.stm32 is loaded by TF-A
> as done previously to keep the backward compatibility).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/Kconfig       |  7 +++++++
>  arch/arm/mach-stm32mp/config.mk     |  2 +-
>  board/st/stm32mp1/stm32mp1.c        | 10 +++++++---
>  configs/stm32mp15_trusted_defconfig |  1 +
>  4 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 7c25266f33..09d0b4096f 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -56,6 +56,13 @@ config STM32MP15x
>  		dual core A7 for STM32MP157/3, monocore for STM32MP151
>  		target all the STMicroelectronics board with SOC STM32MP1 family
>  
> +config STM32MP15x_STM32IMAGE
> +	bool "Support STM32 image for generated U-Boot image"
> +	depends on STM32MP15x && TFABOOT
> +	help
> +		Support of STM32 image generation for SOC STM32MP15x
> +		for TF-A boot when FIP container is not used
> +
>  choice
>  	prompt "STM32MP15x board select"
>  	optional
> diff --git a/arch/arm/mach-stm32mp/config.mk b/arch/arm/mach-stm32mp/config.mk
> index c30bf482f7..f7f5b77c41 100644
> --- a/arch/arm/mach-stm32mp/config.mk
> +++ b/arch/arm/mach-stm32mp/config.mk
> @@ -4,7 +4,7 @@
>  #
>  
>  ifndef CONFIG_SPL
> -INPUTS-y += u-boot.stm32
> +INPUTS-$(CONFIG_STM32MP15x_STM32IMAGE) += u-boot.stm32
>  else
>  ifdef CONFIG_SPL_BUILD
>  INPUTS-y += u-boot-spl.stm32
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 261ec15e1b..d8335efa53 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -105,10 +105,14 @@ int checkboard(void)
>  	const char *fdt_compat;
>  	int fdt_compat_len;
>  
> -	if (IS_ENABLED(CONFIG_TFABOOT))
> -		mode = "trusted";
> -	else
> +	if (IS_ENABLED(CONFIG_TFABOOT)) {
> +		if (IS_ENABLED(CONFIG_STM32MP15x_STM32IMAGE))
> +			mode = "trusted - stm32image";
> +		else
> +			mode = "trusted";
> +	} else {
>  		mode = "basic";
> +	}
>  
>  	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
>  				 &fdt_compat_len);
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 5bc5e79400..e008d1fba7 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -7,6 +7,7 @@ CONFIG_SYS_MEMTEST_END=0xc4000000
>  CONFIG_ENV_OFFSET=0x280000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
> +CONFIG_STM32MP15x_STM32IMAGE=y
>  CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_CMD_STM32PROG=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
