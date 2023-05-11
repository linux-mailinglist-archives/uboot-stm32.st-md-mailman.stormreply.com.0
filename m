Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7F6FEBD2
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 May 2023 08:39:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF1D0C6904F;
	Thu, 11 May 2023 06:39:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB53FC6904E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 06:39:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34B6bMxa010448; Thu, 11 May 2023 08:39:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ITU/Yue4gs2GU35gkdJYRCJMv1hhAc0sUCQSTzjfFO4=;
 b=1pmh8X2bFmVZLg+KuNK0MJ6z5m+vaWKaQeDI+ulpnclc3lX9kvf2RHB/0b5oNNAwHj9Z
 Uq781gdfcfBln+6j2VwMLrtnImbULZ1SGAqhYaeyKQZe5aJ76Yuvc3IX73xwU3UvCMKB
 JhgZME3ZVShQC7gCl2ma7Bu6kBQ2klmUwvBhCRwf2YEuBQNWvAMN5cjSXpknSA0eskzr
 pWOC0sjkQ4AIeCWJR6lmKnB4XewBjDkC8FIzvX9Tc7Hf0NVIuoJyWKQRGzyRRs9FeCYr
 6JieV5bWs80TJ18YzAyp3RcoNF1z0RdPcLzvK8Q0hJg+3N8w6NVFupD8mo/xPkNnRb4/ rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qg6k5y8k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 08:39:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9FA53100034;
 Thu, 11 May 2023 08:39:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91391212313;
 Thu, 11 May 2023 08:39:17 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 11 May
 2023 08:39:17 +0200
Message-ID: <f30a7447-89e3-c3b3-3b8a-3ff048d0695b@foss.st.com>
Date: Thu, 11 May 2023 08:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230511002206.180116-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230511002206.180116-1-marex@denx.de>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add IWDG handling into PSCI
	suspend code
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



On 5/11/23 02:22, Marek Vasut wrote:
> In case the IWDG is enabled by either U-Boot or Linux, the IWDG can never
> be disabled again. That includes low power states, which means that if the
> IWDG is enabled, the SoC would reset itself after a while in suspend via
> the IWDG. This is not desired behavior.
> 
> It is possible to enable IWDG pre-timeout IRQ which is routed into the EXTI,
> and use that IRQ to wake the CPU up before the IWDG timeout is reached and
> reset is triggered. This pre-timeout IRQ can be used to reload the WDT and
> then suspend the CPU again every once in a while.
> 
> Implement this functionality for both IWDG1 and IWDG2 by reading out all
> the unmasked IRQs, comparing the list with currently pending IRQs in GICv3:
> - If any IRQ is pending and it is NOT IWDG1 or IWDG2 pre-timeout IRQ,
>   wake up and let OS handle the IRQs
> - If IWDG1 or IWDG2 IRQ is pending and no other IRQ is pending,
>   ping the respective IWDG and suspend again
> 
> This does not seem to have any adverse impact on power consumption in suspend.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/include/mach/stm32.h |  2 +
>  arch/arm/mach-stm32mp/psci.c               | 66 ++++++++++++++++++++--
>  2 files changed, 63 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index c85ae6a34ee..1cdc5e3b186 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -21,8 +21,10 @@
>  #define STM32_DBGMCU_BASE		0x50081000
>  #endif
>  #define STM32_FMC2_BASE			0x58002000
> +#define STM32_IWDG2_BASE		0x5A002000
>  #define STM32_DDRCTRL_BASE		0x5A003000
>  #define STM32_DDRPHYC_BASE		0x5A004000
> +#define STM32_IWDG1_BASE		0x5C003000
>  #define STM32_TZC_BASE			0x5C006000
>  #define STM32_ETZPC_BASE		0x5C007000
>  #define STM32_STGEN_BASE		0x5C008000
> diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/psci.c
> index 1e69673e88b..89b093d6d89 100644
> --- a/arch/arm/mach-stm32mp/psci.c
> +++ b/arch/arm/mach-stm32mp/psci.c
> @@ -161,6 +161,12 @@
>  #define RCC_MP_GRSTCSETR_MPUP0RST		BIT(4)
>  #define RCC_MP_GRSTCSETR_MPUP1RST		BIT(5)
>  
> +/* IWDG */
> +#define IWDG_KR					0x00
> +#define IWDG_KR_RELOAD_KEY			0xaaaa
> +#define IWDG_EWCR				0x14
> +#define IWDG_EWCR_EWIC				BIT(14)
> +
>  #define STM32MP1_PSCI_NR_CPUS			2
>  #if STM32MP1_PSCI_NR_CPUS > CONFIG_ARMV7_PSCI_NR_CPUS
>  #error "invalid value for CONFIG_ARMV7_PSCI_NR_CPUS"
> @@ -696,7 +702,18 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
>  				  u32 ep, u32 context_id)
>  {
>  	u32 saved_mcudivr, saved_pll3cr, saved_pll4cr, saved_mssckselr;
> +	u32 gicd_addr = stm32mp_get_gicd_base_address();
> +	bool iwdg1_wake = false;
> +	bool iwdg2_wake = false;
> +	bool other_wake = false;
>  	u32 saved_pwrctl, reg;
> +	u32 gic_enabled[8];
> +	u32 irqs;
> +	int i;
> +
> +	/* Cache enable mask of all 256 SPI */
> +	for (i = 0; i < ARRAY_SIZE(gic_enabled); i++)
> +		gic_enabled[i] = readl(gicd_addr + GICD_ISENABLERn + 0x4 + 4 * i);
>  
>  	/* Disable IO compensation */
>  
> @@ -725,11 +742,50 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
>  	setbits_le32(STM32_PWR_BASE + PWR_CR3, PWR_CR3_DDRSREN);
>  	writel(0x3, STM32_RCC_BASE + RCC_MP_SREQSETR);
>  
> -	/* Zzz, enter stop mode */
> -	asm volatile(
> -		"isb\n"
> -		"dsb\n"
> -		"wfi\n");
> +	for (;;) {
> +		/* Zzz, enter stop mode */
> +		asm volatile(
> +			"isb\n"
> +			"dsb\n"
> +			"wfi\n");
> +
> +		/* Determine the wake up source */
> +		for (i = 0; i < ARRAY_SIZE(gic_enabled); i++) {
> +			irqs = readl(gicd_addr + GICR_IGROUPMODRn + 0x4 + 4 * i);
> +			irqs &= gic_enabled[i];
> +			if (!irqs)
> +				continue;
> +
> +			/* Test whether IWDG pretimeout triggered the wake up. */
> +			if (i == 4) {	/* SPI Num 128..159 */
> +				iwdg1_wake = !!(irqs & BIT(22));	/* SPI 150 */
> +				iwdg2_wake = !!(irqs & BIT(23));	/* SPI 151 */
> +				irqs &= ~(BIT(22) | BIT(23));
> +			}
> +
> +			/* Test whether there is any other wake up trigger. */
> +			if (irqs) {
> +				other_wake = true;
> +				break;
> +			}
> +		}
> +
> +		/* Other wake up triggers pending, let OS deal with all of it. */
> +		if (other_wake)
> +			break;
> +
> +		/* Ping IWDG1 and ACK pretimer IRQ */
> +		if (iwdg1_wake) {
> +			writel(IWDG_KR_RELOAD_KEY, STM32_IWDG1_BASE + IWDG_KR);
> +			writel(IWDG_EWCR_EWIC, STM32_IWDG1_BASE + IWDG_EWCR);
> +		}
> +
> +		/* Ping IWDG2 and ACK pretimer IRQ */
> +		if (iwdg2_wake) {
> +			writel(IWDG_KR_RELOAD_KEY, STM32_IWDG2_BASE + IWDG_KR);
> +			writel(IWDG_EWCR_EWIC, STM32_IWDG2_BASE + IWDG_EWCR);
> +		}
> +	}
>  
>  	writel(0x3, STM32_RCC_BASE + RCC_MP_SREQCLRR);
>  	ddr_sw_self_refresh_exit();


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
