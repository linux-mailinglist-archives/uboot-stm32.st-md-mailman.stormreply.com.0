Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 246F38B3174
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 09:35:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFD7EC71292;
	Fri, 26 Apr 2024 07:35:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 436B1C71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 07:35:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q1MWI6032284;
 Fri, 26 Apr 2024 09:34:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=22OY++XdwDqv8EY4mw/S/IB+sbP3L6dQP1c7AhbQucQ=; b=Ns
 074OJAnswn1RNK4IxUQ45RKkJPvrxU7vb6huPQrp/ywu41vLre9+JxHDL5rkP/Ny
 FP2N1LEHnyVEj3pAYRNf+jogvgW0KWlf74o+AjgIN71BqaukKhX12yqkI+Z+43Ec
 iuZMct0d0FGuyZPCl4wP65bCOxnvWx6zPaNhCvuvJTBj8bJgv57Tb3u2TpP2OlJP
 n2C9pq2E6tLnlIb1v4SnMXTpMe/IeEazecMMNu2QeYFVapn75b2lUA7vdPgnlLm3
 kvsUqTIgj6raVlTcvmDx3RTlS0/bdqFZO3Z9+xk+BEeu0IP4WpnUO412PlGFC6RO
 N+yZMm3oYGsBqOf+ZV7g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4kbggy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 09:34:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 860C040044;
 Fri, 26 Apr 2024 09:34:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C7482122F7;
 Fri, 26 Apr 2024 09:34:34 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 09:34:33 +0200
Message-ID: <15a54d0f-0a74-4f87-a998-1219814cbc01@foss.st.com>
Date: Fri, 26 Apr 2024 09:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240319024534.103299-1-marex@denx.de>
 <20240319024534.103299-2-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240319024534.103299-2-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: stm32: Make PWR regulator driver
 available on STM32MP13xx
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



On 3/19/24 03:45, Marek Vasut wrote:
> This patch makes STM32 PWR regulators available on stm32mp13xx.
> This requires TFA to clear RCC_SECCFGR, is disabled by default
> on stm32mp13xx and can only be enabled on board config level.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/Kconfig     | 17 +++++++++++++++++
>  arch/arm/mach-stm32mp/Kconfig.15x | 16 ----------------
>  2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index b9af03d57e3..d5934a92771 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -155,4 +155,21 @@ source "arch/arm/mach-stm32mp/Kconfig.13x"
>  source "arch/arm/mach-stm32mp/Kconfig.15x"
>  source "arch/arm/mach-stm32mp/Kconfig.25x"
>  source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
> +
> +config STM32MP15_PWR
> +	bool "Enable driver for STM32MP15x PWR"
> +	depends on DM_REGULATOR && DM_PMIC && (STM32MP13X || STM32MP15X)
> +	default y if STM32MP15X
> +	help
> +		This config enables implementation of driver-model pmic and
> +		regulator uclass features for access to STM32MP15x PWR.
> +
> +config SPL_STM32MP15_PWR
> +	bool "Enable driver for STM32MP15x PWR in SPL"
> +	depends on SPL && SPL_DM_REGULATOR && SPL_DM_PMIC && (STM32MP13X || STM32MP15X)
> +	default y if STM32MP15X
> +	help
> +		This config enables implementation of driver-model pmic and
> +		regulator uclass features for access to STM32MP15x PWR in SPL.
> +
>  endif
> diff --git a/arch/arm/mach-stm32mp/Kconfig.15x b/arch/arm/mach-stm32mp/Kconfig.15x
> index 71c14eb4955..d99aa9fd694 100644
> --- a/arch/arm/mach-stm32mp/Kconfig.15x
> +++ b/arch/arm/mach-stm32mp/Kconfig.15x
> @@ -77,22 +77,6 @@ config TARGET_ICORE_STM32MP1
>  
>  endchoice
>  
> -config STM32MP15_PWR
> -	bool "Enable driver for STM32MP15x PWR"
> -	depends on DM_REGULATOR && DM_PMIC
> -	default y
> -	help
> -		This config enables implementation of driver-model pmic and
> -		regulator uclass features for access to STM32MP15x PWR.
> -
> -config SPL_STM32MP15_PWR
> -	bool "Enable driver for STM32MP15x PWR in SPL"
> -	depends on SPL && SPL_DM_REGULATOR && SPL_DM_PMIC
> -	default y
> -	help
> -		This config enables implementation of driver-model pmic and
> -		regulator uclass features for access to STM32MP15x PWR in SPL.
> -
>  config TEXT_BASE
>  	default 0xC0100000
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
