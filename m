Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 756A9ABF6A6
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 15:54:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35F79C78F6B;
	Wed, 21 May 2025 13:54:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C39D0C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 13:54:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LCYTHH025517;
 Wed, 21 May 2025 15:53:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UQtPC2XLQLdfYg0LfpCKUv9f06QITH3EvI4e5v4K6Zg=; b=gj3UXeUzvtw9Xiri
 le2SgK65G35c3A7rhVZWgvk+Ex+sL8Y0P8qARnDaP2jUY+UAtzp5Dpxqbu0jdLOx
 oWskeLJOa179aKtETDJA/C1dy4v9spMnEJL/XrpZwK+uoA20SobFjfkgt1RLoCkw
 9OOPFUGd4QgTAtEfvs09zSkFVPhRKhzDSKK5geSsl5rBMWdKb0StCtl9fgO7SAcf
 qbKbHCEfLiFMU0tZSUo6qEy0lhVWivijJjuEEJtURPsVNnNxD7+l3njwesv5YOVw
 kpkGoQmXGHvQPAQD/YFECBfQEUvGAUvFvPj+nxXwGBs3e/Kn1YFYrMmtf+LrtCq+
 f0cQ3w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwff4fnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 15:53:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 85ED140066;
 Wed, 21 May 2025 15:52:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47177B5B64F;
 Wed, 21 May 2025 15:50:54 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 15:50:53 +0200
Message-ID: <3eca3ca5-60ef-4780-8dce-de77f6f10e02@foss.st.com>
Date: Wed, 21 May 2025 15:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512164418.147714-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250512164418.147714-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Fix SYSRAM size on STM32MP13xx
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



On 5/12/25 18:44, Marek Vasut wrote:
> The STM32MP13xx has only 128 kiB of SYSRAM starting at address 0x2ffe0000 .
> The STM32MP15xx has 256 kiB of SYSRAM starting at address 0x2ffc0000 . Make
> sure both SoCs configure ARMV7_SECURE_BASE correctly . Define the SYSRAM
> base in stm32.h to be consistent with the STM32MP15xx macro.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/cpu/armv7/Kconfig                 | 3 ++-
>  arch/arm/mach-stm32mp/include/mach/stm32.h | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/cpu/armv7/Kconfig b/arch/arm/cpu/armv7/Kconfig
> index 4eb34b7b449..ab86d642eee 100644
> --- a/arch/arm/cpu/armv7/Kconfig
> +++ b/arch/arm/cpu/armv7/Kconfig
> @@ -36,7 +36,8 @@ config ARMV7_SECURE_BASE
>  	hex "Base address for secure mode memory"
>  	depends on HAS_ARMV7_SECURE_BASE
>  	default 0xfff00000 if TEGRA124
> -	default 0x2ffc0000 if ARCH_STM32MP
> +	default 0x2ffe0000 if STM32MP13X
> +	default 0x2ffc0000 if STM32MP15X
>  	default 0x2f000000 if ARCH_MX7ULP
>  	default 0x10010000 if ARCH_LS1021A
>  	default 0x00900000 if ARCH_MX7
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index a9ac49bc5d2..47b459b75d1 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -110,6 +110,11 @@ enum forced_boot_mode {
>  #define STM32_SDMMC2_BASE		0x58007000
>  #define STM32_SDMMC3_BASE		0x48004000
>  
> +#ifdef CONFIG_STM32MP13X
> +#define STM32_SYSRAM_BASE		0x2FFE0000
> +#define STM32_SYSRAM_SIZE		SZ_128K
> +#endif
> +
>  #ifdef CONFIG_STM32MP15X
>  #define STM32_SYSRAM_BASE		0x2FFC0000
>  #define STM32_SYSRAM_SIZE		SZ_256K

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
