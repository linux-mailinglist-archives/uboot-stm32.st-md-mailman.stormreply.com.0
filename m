Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 161FAAC5251
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 May 2025 17:49:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAFCBC36B19;
	Tue, 27 May 2025 15:49:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E29AC36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 15:49:34 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RDvhWR011023;
 Tue, 27 May 2025 17:49:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 d+yqajrAFLeV4sLJBcd4TIoL/h9giQGDudm6B++//JU=; b=2Jh/bt5ZFnZJn4tg
 9toPo9DB9soU604W72dSDnIYig493JFuFgV6sFS1Z58D1kGBZHk3yBJfWjjrrsqZ
 KOswMLUrjzf50qML97dcGYILVQl0Ttj2iIM5kVCuzJdXj5sd1L2JGCK709xtPwDz
 DJ6EkWB6xuXyKnD5DKjYzRFH9h3uY7FCInfUoTJ7gTo5Pdu7Jh8+rcokMUnWxikI
 +GYMfQ5Rajg016UYCwUI6W/pHj0upi3Pqj6xx2VBZDx3XtJwOeVdfsgRqik4YAeP
 bSLaaGo8wu64gEKIcLyonrZel8dDACqWsC/UQ+HVTVulD2O/2ViMOdsx1mTNpX9w
 0SEJng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk54sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 17:49:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 197A040049;
 Tue, 27 May 2025 17:48:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DC51B20C54;
 Tue, 27 May 2025 17:47:53 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 17:47:52 +0200
Message-ID: <3691b299-39e2-485a-b820-27e6b8df2f65@foss.st.com>
Date: Tue, 27 May 2025 17:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512170847.149172-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250512170847.149172-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32mp13: Add SPL support and clock
 tree init to STM32MP13 RCC driver
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



On 5/12/25 19:08, Marek Vasut wrote:
> Add SPL support and clock tree init to STM32MP13 RCC driver. This
> consists of two parts, make SCMI into an optional dependency and
> add clock tree initialization. The SCMI dependency is made optional
> first by registering the few core clock provided by SCMI clock as
> fixed clock, and second by letting the clock core parse out the
> clock configuration from SoC registers. The clock initialization
> code is derived from STM32MP15xx clock tree initialization code,
> which is almost identical, except for the use of new PLL2000 for
> PLL1 on STM32MP13xx .
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Huge work !!

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/clk/stm32/clk-stm32-core.h           |    1 +
>  drivers/clk/stm32/clk-stm32mp13.c            | 1303 +++++++++++++++++-
>  drivers/clk/stm32/stm32mp13_rcc.h            |   93 ++
>  include/dt-bindings/clock/stm32mp13-clksrc.h |  399 ++++++
>  4 files changed, 1744 insertions(+), 52 deletions(-)
>  create mode 100644 include/dt-bindings/clock/stm32mp13-clksrc.h
> 
> diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
> index f9ef0702005..123643b03a6 100644
> --- a/drivers/clk/stm32/clk-stm32-core.h
> +++ b/drivers/clk/stm32/clk-stm32-core.h
> @@ -144,6 +144,7 @@ struct stm32mp_rcc_priv {
>  	void __iomem *base;
>  	u8 *gate_cpt;
>  	const struct clk_stm32_clock_data *data;
> +	struct clk osc_clk[6];
>  };
>  
>  int stm32_rcc_init(struct udevice *dev,
> diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
> index 11dc40383a4..fabef4dbd3f 100644
> --- a/drivers/clk/stm32/clk-stm32mp13.c
> +++ b/drivers/clk/stm32/clk-stm32mp13.c
> @@ -3,7 +3,6 @@
>   * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
>   * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
>   */
> -
>  #define LOG_CATEGORY UCLASS_CLK
>  
>  #include <clk-uclass.h>
> @@ -12,6 +11,22 @@
>  #include <asm/io.h>
>  #include <dt-bindings/clock/stm32mp13-clks.h>
>  #include <linux/clk-provider.h>
> +#include <dt-bindings/clock/stm32mp13-clksrc.h>
> +#include <asm/arch/sys_proto.h>
> +#include <asm/global_data.h>
> +#include <clk-uclass.h>
> +#include <div64.h>
> +#include <dm/device_compat.h>
> +#include <init.h>
> +#include <linux/bitops.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <regmap.h>
> +#include <spl.h>
> +#include <syscon.h>
> +#include <time.h>
> +#include <vsprintf.h>
> +#include <asm/arch/sys_proto.h>
>  
>  #include "clk-stm32-core.h"
>  #include "stm32mp13_rcc.h"
> @@ -130,46 +145,6 @@ static const char * const usbphy_src[] = {
>  	"ck_hse", "pll4_r", "clk-hse-div2"
>  };
>  
> -enum enum_mux_cfg {
> -	MUX_I2C12,
> -	MUX_LPTIM45,
> -	MUX_SPI23,
> -	MUX_UART35,
> -	MUX_UART78,
> -	MUX_ADC1,
> -	MUX_ADC2,
> -	MUX_DCMIPP,
> -	MUX_ETH1,
> -	MUX_ETH2,
> -	MUX_FDCAN,
> -	MUX_FMC,
> -	MUX_I2C3,
> -	MUX_I2C4,
> -	MUX_I2C5,
> -	MUX_LPTIM1,
> -	MUX_LPTIM2,
> -	MUX_LPTIM3,
> -	MUX_QSPI,
> -	MUX_RNG1,
> -	MUX_SAES,
> -	MUX_SAI1,
> -	MUX_SAI2,
> -	MUX_SDMMC1,
> -	MUX_SDMMC2,
> -	MUX_SPDIF,
> -	MUX_SPI1,
> -	MUX_SPI4,
> -	MUX_SPI5,
> -	MUX_STGEN,
> -	MUX_UART1,
> -	MUX_UART2,
> -	MUX_UART4,
> -	MUX_UART6,
> -	MUX_USBO,
> -	MUX_USBPHY,
> -	MUX_MCO1,
> -	MUX_MCO2
> -};
>  
>  #define MUX_CFG(id, src, _offset, _shift, _witdh) \
>  	[id] = { \
> @@ -471,15 +446,6 @@ static const struct clk_div_table ck_trace_div_table[] = {
>  	{ 0 },
>  };
>  
> -enum enum_div_cfg {
> -	DIV_MCO1,
> -	DIV_MCO2,
> -	DIV_TRACE,
> -	DIV_ETH1PTP,
> -	DIV_ETH2PTP,
> -	LAST_DIV
> -};
> -
>  #define DIV_CFG(id, _offset, _shift, _width, _flags, _table) \
>  	[id] = { \
>  		.reg_off	= _offset, \
> @@ -489,7 +455,7 @@ enum enum_div_cfg {
>  		.table	= _table, \
>  	}
>  
> -static const struct stm32_div_cfg stm32mp13_dividers[LAST_DIV] = {
> +static const struct stm32_div_cfg stm32mp13_dividers[] = {
>  	DIV_CFG(DIV_MCO1, RCC_MCO1CFGR, 4, 4, 0, NULL),
>  	DIV_CFG(DIV_MCO2, RCC_MCO2CFGR, 4, 4, 0, NULL),
>  	DIV_CFG(DIV_TRACE, RCC_DBGCFGR, 0, 3, 0, ck_trace_div_table),
> @@ -566,6 +532,7 @@ enum securit_clk {
>  		.bit_idx	= _bit_idx, \
>  	}
>  
> +#ifdef CONFIG_TFABOOT
>  static const struct clk_stm32_security stm32mp13_security[] = {
>  	SECF(SECF_LPTIM2, RCC_APB3SECSR, RCC_APB3SECSR_LPTIM2SECF),
>  	SECF(SECF_LPTIM3, RCC_APB3SECSR, RCC_APB3SECSR_LPTIM3SECF),
> @@ -622,6 +589,7 @@ static const struct clk_stm32_security stm32mp13_security[] = {
>  	SECF(SECF_MCO1, RCC_SECCFGR, RCC_SECCFGR_MCO1SECF),
>  	SECF(SECF_MCO2, RCC_SECCFGR, RCC_SECCFGR_MCO2SECF),
>  };
> +#endif
>  
>  #define PCLK(_id, _name, _parent, _flags, _gate_id, _sec_id) \
>  	STM32_GATE(_id, _name, _parent, _flags, _gate_id, _sec_id)
> @@ -635,6 +603,7 @@ static const struct clk_stm32_security stm32mp13_security[] = {
>  			_gate_id, _mux_id, NO_STM32_DIV)
>  
>  static const struct clock_config stm32mp13_clock_cfg[] = {
> +#ifndef CONFIG_XPL_BUILD
>  	TIMER(TIM2_K, "tim2_k", "timg1_ck", 0, GATE_TIM2, SECF_NONE),
>  	TIMER(TIM3_K, "tim3_k", "timg1_ck", 0, GATE_TIM3, SECF_NONE),
>  	TIMER(TIM4_K, "tim4_k", "timg1_ck", 0, GATE_TIM4, SECF_NONE),
> @@ -649,23 +618,28 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
>  	TIMER(TIM15_K, "tim15_k", "timg3_ck", 0, GATE_TIM15, SECF_TIM15),
>  	TIMER(TIM16_K, "tim16_k", "timg3_ck", 0, GATE_TIM16, SECF_TIM16),
>  	TIMER(TIM17_K, "tim17_k", "timg3_ck", 0, GATE_TIM17, SECF_TIM17),
> +#endif
>  
>  	/* Peripheral clocks */
>  	PCLK(SYSCFG, "syscfg", "pclk3", 0, GATE_SYSCFG, SECF_NONE),
>  	PCLK(VREF, "vref", "pclk3", 0, GATE_VREF, SECF_VREF),
> +#ifndef CONFIG_XPL_BUILD
>  	PCLK(PMBCTRL, "pmbctrl", "pclk3", 0, GATE_PMBCTRL, SECF_NONE),
>  	PCLK(HDP, "hdp", "pclk3", 0, GATE_HDP, SECF_NONE),
> +#endif
>  	PCLK(IWDG2, "iwdg2", "pclk4", 0, GATE_IWDG2APB, SECF_NONE),
>  	PCLK(STGENRO, "stgenro", "pclk4", 0, GATE_STGENRO, SECF_STGENRO),
>  	PCLK(TZPC, "tzpc", "pclk5", 0, GATE_TZC, SECF_TZC),
>  	PCLK(IWDG1, "iwdg1", "pclk5", 0, GATE_IWDG1APB, SECF_IWDG1),
>  	PCLK(BSEC, "bsec", "pclk5", 0, GATE_BSEC, SECF_BSEC),
> +#ifndef CONFIG_XPL_BUILD
>  	PCLK(DMA1, "dma1", "ck_mlahb", 0, GATE_DMA1, SECF_NONE),
>  	PCLK(DMA2, "dma2", "ck_mlahb",  0, GATE_DMA2, SECF_NONE),
>  	PCLK(DMAMUX1, "dmamux1", "ck_mlahb", 0, GATE_DMAMUX1, SECF_NONE),
>  	PCLK(DMAMUX2, "dmamux2", "ck_mlahb", 0, GATE_DMAMUX2, SECF_DMAMUX2),
>  	PCLK(ADC1, "adc1", "ck_mlahb", 0, GATE_ADC1, SECF_ADC1),
>  	PCLK(ADC2, "adc2", "ck_mlahb", 0, GATE_ADC2, SECF_ADC2),
> +#endif
>  	PCLK(GPIOA, "gpioa", "pclk4", 0, GATE_GPIOA, SECF_NONE),
>  	PCLK(GPIOB, "gpiob", "pclk4", 0, GATE_GPIOB, SECF_NONE),
>  	PCLK(GPIOC, "gpioc", "pclk4", 0, GATE_GPIOC, SECF_NONE),
> @@ -681,17 +655,23 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
>  	PCLK(HASH1, "hash1", "ck_axi", 0, GATE_HASH1, SECF_HASH1),
>  	PCLK(BKPSRAM, "bkpsram", "ck_axi", 0, GATE_BKPSRAM, SECF_BKPSRAM),
>  	PCLK(MDMA, "mdma", "ck_axi", 0, GATE_MDMA, SECF_NONE),
> +#ifndef CONFIG_XPL_BUILD
>  	PCLK(ETH1TX, "eth1tx", "ck_axi", 0, GATE_ETH1TX, SECF_ETH1TX),
>  	PCLK(ETH1RX, "eth1rx", "ck_axi", 0, GATE_ETH1RX, SECF_ETH1RX),
>  	PCLK(ETH1MAC, "eth1mac", "ck_axi", 0, GATE_ETH1MAC, SECF_ETH1MAC),
>  	PCLK(ETH2TX, "eth2tx", "ck_axi", 0, GATE_ETH2TX, SECF_ETH2TX),
>  	PCLK(ETH2RX, "eth2rx", "ck_axi", 0, GATE_ETH2RX, SECF_ETH2RX),
>  	PCLK(ETH2MAC, "eth2mac", "ck_axi", 0, GATE_ETH2MAC, SECF_ETH2MAC),
> +#endif
>  	PCLK(CRC1, "crc1", "ck_axi", 0, GATE_CRC1, SECF_NONE),
> +#ifndef CONFIG_XPL_BUILD
>  	PCLK(USBH, "usbh", "ck_axi", 0, GATE_USBH, SECF_NONE),
> +#endif
>  	PCLK(DDRPERFM, "ddrperfm", "pclk4", 0, GATE_DDRPERFM, SECF_NONE),
> +#ifndef CONFIG_XPL_BUILD
>  	PCLK(ETH1STP, "eth1stp", "ck_axi", 0, GATE_ETH1STP, SECF_ETH1STP),
>  	PCLK(ETH2STP, "eth2stp", "ck_axi", 0, GATE_ETH2STP, SECF_ETH2STP),
> +#endif
>  
>  	/* Kernel clocks */
>  	KCLK(SDMMC1_K, "sdmmc1_k", 0, GATE_SDMMC1, MUX_SDMMC1, SECF_SDMMC1),
> @@ -702,8 +682,10 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
>  	KCLK(SPI3_K, "spi3_k", 0, GATE_SPI3, MUX_SPI23, SECF_NONE),
>  	KCLK(I2C1_K, "i2c1_k", 0, GATE_I2C1, MUX_I2C12, SECF_NONE),
>  	KCLK(I2C2_K, "i2c2_k", 0, GATE_I2C2, MUX_I2C12, SECF_NONE),
> +#ifndef CONFIG_XPL_BUILD
>  	KCLK(LPTIM4_K, "lptim4_k", 0, GATE_LPTIM4, MUX_LPTIM45, SECF_NONE),
>  	KCLK(LPTIM5_K, "lptim5_k", 0, GATE_LPTIM5, MUX_LPTIM45, SECF_NONE),
> +#endif
>  	KCLK(USART3_K, "usart3_k", 0, GATE_USART3, MUX_UART35, SECF_NONE),
>  	KCLK(UART5_K, "uart5_k", 0, GATE_UART5, MUX_UART35, SECF_NONE),
>  	KCLK(UART7_K, "uart7_k", 0, GATE_UART7, MUX_UART78, SECF_NONE),
> @@ -711,20 +693,29 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
>  	KCLK(RNG1_K, "rng1_k", 0, GATE_RNG1, MUX_RNG1, SECF_RNG1),
>  	KCLK(USBPHY_K, "usbphy_k", 0, GATE_USBPHY, MUX_USBPHY, SECF_USBPHY),
>  	KCLK(STGEN_K, "stgen_k", 0, GATE_STGENC, MUX_STGEN, SECF_STGENC),
> +#ifndef CONFIG_XPL_BUILD
>  	KCLK(SPDIF_K, "spdif_k", 0, GATE_SPDIF, MUX_SPDIF, SECF_NONE),
> +#endif
>  	KCLK(SPI1_K, "spi1_k", 0, GATE_SPI1, MUX_SPI1, SECF_NONE),
>  	KCLK(SPI4_K, "spi4_k", 0, GATE_SPI4, MUX_SPI4, SECF_SPI4),
>  	KCLK(SPI5_K, "spi5_k", 0, GATE_SPI5, MUX_SPI5, SECF_SPI5),
> +#ifdef CONFIG_TFABOOT
>  	KCLK(I2C3_K, "i2c3_k", 0, GATE_I2C3, MUX_I2C3, SECF_I2C3),
> +#else
> +	KCLK(I2C3_K, "i2c3_k", 0, GATE_I2C3, MUX_I2C3, SECF_NONE),
> +#endif
>  	KCLK(I2C4_K, "i2c4_k", 0, GATE_I2C4, MUX_I2C4, SECF_I2C4),
>  	KCLK(I2C5_K, "i2c5_k", 0, GATE_I2C5, MUX_I2C5, SECF_I2C5),
> +#ifndef CONFIG_XPL_BUILD
>  	KCLK(LPTIM1_K, "lptim1_k", 0, GATE_LPTIM1, MUX_LPTIM1, SECF_NONE),
>  	KCLK(LPTIM2_K, "lptim2_k", 0, GATE_LPTIM2, MUX_LPTIM2, SECF_LPTIM2),
>  	KCLK(LPTIM3_K, "lptim3_k", 0, GATE_LPTIM3, MUX_LPTIM3, SECF_LPTIM3),
> +#endif
>  	KCLK(USART1_K, "usart1_k", 0, GATE_USART1, MUX_UART1, SECF_USART1),
>  	KCLK(USART2_K, "usart2_k", 0, GATE_USART2, MUX_UART2, SECF_USART2),
>  	KCLK(UART4_K, "uart4_k", 0, GATE_UART4, MUX_UART4, SECF_NONE),
>  	KCLK(USART6_K, "uart6_k", 0, GATE_USART6, MUX_UART6, SECF_NONE),
> +#ifndef CONFIG_XPL_BUILD
>  	KCLK(FDCAN_K, "fdcan_k", 0, GATE_FDCAN, MUX_FDCAN, SECF_NONE),
>  	KCLK(SAI1_K, "sai1_k", 0, GATE_SAI1, MUX_SAI1, SECF_NONE),
>  	KCLK(SAI2_K, "sai2_k", 0, GATE_SAI2, MUX_SAI2, SECF_NONE),
> @@ -732,7 +723,9 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
>  	KCLK(ADC2_K, "adc2_k", 0, GATE_ADC2, MUX_ADC2, SECF_ADC2),
>  	KCLK(DCMIPP_K, "dcmipp_k", 0, GATE_DCMIPP, MUX_DCMIPP, SECF_DCMIPP),
>  	KCLK(ADFSDM_K, "adfsdm_k", 0, GATE_ADFSDM, MUX_SAI1, SECF_NONE),
> +#endif
>  	KCLK(USBO_K, "usbo_k", 0, GATE_USBO, MUX_USBO, SECF_USBO),
> +#ifndef CONFIG_XPL_BUILD
>  	KCLK(ETH1CK_K, "eth1ck_k", 0, GATE_ETH1CK, MUX_ETH1, SECF_ETH1CK),
>  	KCLK(ETH2CK_K, "eth2ck_k", 0, GATE_ETH2CK, MUX_ETH2, SECF_ETH2CK),
>  	KCLK(SAES_K, "saes_k", 0, GATE_SAES, MUX_SAES, SECF_SAES),
> @@ -742,6 +735,7 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
>  		   GATE_LTDC, SECF_NONE),
>  
>  	STM32_GATE(DTS_K, "dts_k", "ck_lse", 0, GATE_DTS, SECF_NONE),
> +#endif
>  
>  	STM32_COMPOSITE(ETH1PTP_K, "eth1ptp_k", CLK_OPS_PARENT_ENABLE |
>  		  CLK_SET_RATE_NO_REPARENT, SECF_ETH1CK,
> @@ -767,8 +761,22 @@ static const struct clock_config stm32mp13_clock_cfg[] = {
>  	STM32_COMPOSITE_NOMUX(CK_TRACE, "ck_trace", "ck_axi",
>  			      CLK_OPS_PARENT_ENABLE, SECF_NONE,
>  			      GATE_TRACECK, DIV_TRACE),
> +
> +#ifdef CONFIG_XPL_BUILD
> +	STM32_GATE(AXIDCG, "axidcg", "ck_axi", CLK_IGNORE_UNUSED,
> +		   GATE_AXIDCG, SECF_NONE),
> +	STM32_GATE(DDRC1, "ddrc1", "ck_axi", CLK_IGNORE_UNUSED,
> +		   GATE_DDRC1, SECF_NONE),
> +	STM32_GATE(DDRPHYC, "ddrphyc", "pll2_r", CLK_IGNORE_UNUSED,
> +		   GATE_DDRPHYC, SECF_NONE),
> +	STM32_GATE(DDRCAPB, "ddrcapb", "pclk4", CLK_IGNORE_UNUSED,
> +		   GATE_DDRCAPB, SECF_NONE),
> +	STM32_GATE(DDRPHYCAPB, "ddrphycapb", "pclk4", CLK_IGNORE_UNUSED,
> +		   GATE_DDRPHYCAPB, SECF_NONE),
> +#endif
>  };
>  
> +#ifdef CONFIG_TFABOOT
>  static int stm32mp13_check_security(void __iomem *base,
>  				    const struct clock_config *cfg)
>  {
> @@ -784,6 +792,7 @@ static int stm32mp13_check_security(void __iomem *base,
>  
>  	return secured;
>  }
> +#endif
>  
>  static const struct stm32_clock_match_data stm32mp13_data = {
>  	.tab_clocks	= stm32mp13_clock_cfg,
> @@ -794,16 +803,1204 @@ static const struct stm32_clock_match_data stm32mp13_data = {
>  		.muxes		= stm32mp13_muxes,
>  		.dividers	= stm32mp13_dividers,
>  	},
> +#ifdef CONFIG_TFABOOT
>  	.check_security = stm32mp13_check_security,
> +#endif
> +};
> +
> +#ifndef CONFIG_TFABOOT
> +
> +enum stm32mp1_parent_id {
> +/*
> + * _HSI, _HSE, _CSI, _LSI, _LSE should not be moved
> + * they are used as index in osc_clk[] as clock reference
> + */
> +	_HSI,
> +	_HSE,
> +	_CSI,
> +	_LSI,
> +	_LSE,
> +	_I2S_CKIN,
> +	NB_OSC,
> +
> +/* other parent source */
> +	_HSI_KER = NB_OSC,
> +	_HSE_KER,
> +	_HSE_KER_DIV2,
> +	_CSI_KER,
> +	_PLL1_P,
> +	_PLL1_Q,
> +	_PLL1_R,
> +	_PLL2_P,
> +	_PLL2_Q,
> +	_PLL2_R,
> +	_PLL3_P,
> +	_PLL3_Q,
> +	_PLL3_R,
> +	_PLL4_P,
> +	_PLL4_Q,
> +	_PLL4_R,
> +	_ACLK,
> +	_PCLK1,
> +	_PCLK2,
> +	_PCLK3,
> +	_PCLK4,
> +	_PCLK5,
> +	_HCLK6,
> +	_HCLK2,
> +	_CK_PER,
> +	_CK_MPU,
> +	_CK_MCU,
> +	_DSI_PHY,
> +	_USB_PHY_48,
> +	_PARENT_NB,
> +	_UNKNOWN_ID = 0xff,
> +};
> +
> +#if defined(CONFIG_XPL_BUILD)
> +
> +#define MAX_HSI_HZ		64000000
> +
> +/* TIMEOUT */
> +#define TIMEOUT_200MS		200000
> +#define TIMEOUT_1S		1000000
> +
> +/* STGEN registers */
> +#define STGENC_CNTCR		0x00
> +#define STGENC_CNTSR		0x04
> +#define STGENC_CNTCVL		0x08
> +#define STGENC_CNTCVU		0x0C
> +#define STGENC_CNTFID0		0x20
> +
> +#define STGENC_CNTCR_EN		BIT(0)
> +
> +enum stm32mp1_clksrc_id {
> +	CLKSRC_MPU,
> +	CLKSRC_AXI,
> +	CLKSRC_MLAHB,
> +	CLKSRC_PLL12,
> +	CLKSRC_PLL3,
> +	CLKSRC_PLL4,
> +	CLKSRC_RTC,
> +	CLKSRC_MCO1,
> +	CLKSRC_MCO2,
> +	CLKSRC_NB
> +};
> +
> +enum stm32mp1_clkdiv_id {
> +	CLKDIV_AXI,
> +	CLKDIV_MLAHB,
> +	CLKDIV_APB1,
> +	CLKDIV_APB2,
> +	CLKDIV_APB3,
> +	CLKDIV_APB4,
> +	CLKDIV_APB5,
> +	CLKDIV_APB6,
> +	CLKDIV_RTC,
> +	CLKDIV_NB
> +};
> +
> +enum stm32mp1_pll_id {
> +	_PLL1,
> +	_PLL2,
> +	_PLL3,
> +	_PLL4,
> +	_PLL_NB
> +};
> +
> +enum stm32mp1_div_id {
> +	_DIV_P,
> +	_DIV_Q,
> +	_DIV_R,
> +	_DIV_NB,
> +};
> +
> +/* define characteristic of PLL according type */
> +#define DIVM_MIN	1
> +#define DIVM_MAX	63
> +#define DIVN_MIN	24
> +#define DIVP_MIN	0
> +#define DIVP_MAX	127
> +#define FRAC_MAX	8192
> +
> +#define PLL2000_VCO_MIN	992000000
> +#define PLL2000_VCO_MAX	2000000000
> +
> +enum stm32mp1_pllcfg {
> +	PLLCFG_M,
> +	PLLCFG_N,
> +	PLLCFG_P,
> +	PLLCFG_Q,
> +	PLLCFG_R,
> +	PLLCFG_O,
> +	PLLCFG_NB
> +};
> +
> +enum stm32mp1_pllcsg {
> +	PLLCSG_MOD_PER,
> +	PLLCSG_INC_STEP,
> +	PLLCSG_SSCG_MODE,
> +	PLLCSG_NB
> +};
> +
> +enum stm32mp1_plltype {
> +	PLL_800,
> +	PLL_1600,
> +	PLL_2000,
> +	PLL_TYPE_NB
> +};
> +
> +struct stm32mp1_pll {
> +	u8 refclk_min;
> +	u8 refclk_max;
> +	u8 divn_max;
> +};
> +
> +#define REFCLK_SIZE 4
> +struct stm32mp1_clk_pll {
> +	enum stm32mp1_plltype plltype;
> +	u16 rckxselr;
> +	u16 pllxcfgr1;
> +	u16 pllxcfgr2;
> +	u16 pllxfracr;
> +	u16 pllxcr;
> +	u16 pllxcsgr;
> +	u8 refclk[REFCLK_SIZE];
> +};
> +
> +static const struct stm32mp1_pll stm32mp1_pll[PLL_TYPE_NB] = {
> +	[PLL_800] = {
> +		.refclk_min = 4,
> +		.refclk_max = 16,
> +		.divn_max = 99,
> +		},
> +	[PLL_1600] = {
> +		.refclk_min = 8,
> +		.refclk_max = 16,
> +		.divn_max = 199,
> +		},
> +	[PLL_2000] = {
> +		.refclk_min = 8,
> +		.refclk_max = 16,
> +		.divn_max = 99,
> +		},
> +};
> +
> +#define STM32MP1_CLK_PLL(idx, type, off1, off2, off3, off4, off5, off6,\
> +			p1, p2, p3, p4) \
> +	[(idx)] = {				\
> +		.plltype = (type),			\
> +		.rckxselr = (off1),		\
> +		.pllxcfgr1 = (off2),		\
> +		.pllxcfgr2 = (off3),		\
> +		.pllxfracr = (off4),		\
> +		.pllxcr = (off5),		\
> +		.pllxcsgr = (off6),		\
> +		.refclk[0] = (p1),		\
> +		.refclk[1] = (p2),		\
> +		.refclk[2] = (p3),		\
> +		.refclk[3] = (p4),		\
> +	}
> +
> +static const struct stm32mp1_clk_pll stm32mp1_clk_pll[_PLL_NB] = {
> +	STM32MP1_CLK_PLL(_PLL1, PLL_2000,
> +			 RCC_RCK12SELR, RCC_PLL1CFGR1, RCC_PLL1CFGR2,
> +			 RCC_PLL1FRACR, RCC_PLL1CR, RCC_PLL1CSGR,
> +			 _HSI, _HSE, _UNKNOWN_ID, _UNKNOWN_ID),
> +	STM32MP1_CLK_PLL(_PLL2, PLL_1600,
> +			 RCC_RCK12SELR, RCC_PLL2CFGR1, RCC_PLL2CFGR2,
> +			 RCC_PLL2FRACR, RCC_PLL2CR, RCC_PLL2CSGR,
> +			 _HSI, _HSE, _UNKNOWN_ID, _UNKNOWN_ID),
> +	STM32MP1_CLK_PLL(_PLL3, PLL_800,
> +			 RCC_RCK3SELR, RCC_PLL3CFGR1, RCC_PLL3CFGR2,
> +			 RCC_PLL3FRACR, RCC_PLL3CR, RCC_PLL3CSGR,
> +			 _HSI, _HSE, _CSI, _UNKNOWN_ID),
> +	STM32MP1_CLK_PLL(_PLL4, PLL_800,
> +			 RCC_RCK4SELR, RCC_PLL4CFGR1, RCC_PLL4CFGR2,
> +			 RCC_PLL4FRACR, RCC_PLL4CR, RCC_PLL4CSGR,
> +			 _HSI, _HSE, _CSI, _I2S_CKIN),
>  };
>  
> +static ulong stm32mp1_clk_get_fixed(struct stm32mp_rcc_priv *priv, int idx)
> +{
> +	if (idx >= NB_OSC) {
> +		log_debug("clk id %d not found\n", idx);
> +		return 0;
> +	}
> +
> +	return clk_get_rate(&priv->osc_clk[idx]);
> +}
> +
> +bool stm32mp1_supports_opp(u32 opp_id, u32 cpu_type)
> +{
> +	/* 650 MHz is always supported */
> +	if (opp_id == 1)
> +		return true;
> +
> +	/*
> +	 * 1000 MHz is supported on STM32MP13xDxx and STM32MP13xFxx,
> +	 * which all have bit 11 i.e. 0x800 set in CPU ID.
> +	 */
> +	if (opp_id == 2)
> +		return !!(cpu_type & BIT(11));
> +
> +	/* Any other OPP is invalid. */
> +	return false;
> +}
> +
> +__weak void board_vddcore_init(u32 voltage_mv)
> +{
> +}
> +
> +/*
> + * gets OPP parameters (frequency in KHz and voltage in mV) from
> + * an OPP table subnode. Platform HW support capabilities are also checked.
> + * Returns 0 on success and a negative FDT error code on failure.
> + */
> +static int stm32mp1_get_opp(u32 cpu_type, ofnode subnode,
> +			    u32 *freq_khz, u32 *voltage_mv)
> +{
> +	u32 opp_hw;
> +	u64 read_freq_64;
> +	u32 read_voltage_32;
> +
> +	*freq_khz = 0;
> +	*voltage_mv = 0;
> +
> +	opp_hw = ofnode_read_u32_default(subnode, "opp-supported-hw", 0);
> +	if (opp_hw)
> +		if (!stm32mp1_supports_opp(opp_hw, cpu_type))
> +			return -FDT_ERR_BADVALUE;
> +
> +	read_freq_64 = ofnode_read_u64_default(subnode, "opp-hz", 0) /
> +		       1000ULL;
> +	read_voltage_32 = ofnode_read_u32_default(subnode, "opp-microvolt", 0) /
> +			  1000U;
> +
> +	if (!read_voltage_32 || !read_freq_64)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	/* Frequency value expressed in KHz must fit on 32 bits */
> +	if (read_freq_64 > U32_MAX)
> +		return -FDT_ERR_BADVALUE;
> +
> +	/* Millivolt value must fit on 16 bits */
> +	if (read_voltage_32 > U16_MAX)
> +		return -FDT_ERR_BADVALUE;
> +
> +	*freq_khz = (u32)read_freq_64;
> +	*voltage_mv = read_voltage_32;
> +
> +	return 0;
> +}
> +
> +/*
> + * parses OPP table in DT and finds the parameters for the
> + * highest frequency supported by the HW platform.
> + * Returns 0 on success and a negative FDT error code on failure.
> + */
> +int stm32mp1_get_max_opp_freq(struct stm32mp_rcc_priv *priv, u64 *freq_hz)
> +{
> +	ofnode node, subnode;
> +	int ret;
> +	u32 freq = 0U, voltage = 0U;
> +	u32 cpu_type = get_cpu_type();
> +
> +	node = ofnode_by_compatible(ofnode_null(), "operating-points-v2");
> +	if (!ofnode_valid(node))
> +		return -FDT_ERR_NOTFOUND;
> +
> +	ofnode_for_each_subnode(subnode, node) {
> +		unsigned int read_freq;
> +		unsigned int read_voltage;
> +
> +		ret = stm32mp1_get_opp(cpu_type, subnode,
> +				       &read_freq, &read_voltage);
> +		if (ret)
> +			continue;
> +
> +		if (read_freq > freq) {
> +			freq = read_freq;
> +			voltage = read_voltage;
> +		}
> +	}
> +
> +	if (!freq || !voltage)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	*freq_hz = (u64)1000U * freq;
> +	board_vddcore_init(voltage);
> +
> +	return 0;
> +}
> +
> +static int stm32mp1_pll1_opp(struct stm32mp_rcc_priv *priv, int clksrc,
> +			     u32 *pllcfg, u32 *fracv)
> +{
> +	u32 post_divm;
> +	u32 input_freq;
> +	u64 output_freq;
> +	u64 freq;
> +	u64 vco;
> +	u32 divm, divn, divp, frac;
> +	int i, ret;
> +	u32 diff;
> +	u32 best_diff = U32_MAX;
> +
> +	/* PLL1 is 2000 */
> +	const u32 DIVN_MAX = stm32mp1_pll[PLL_2000].divn_max;
> +	const u32 POST_DIVM_MIN = stm32mp1_pll[PLL_2000].refclk_min * 1000000U;
> +	const u32 POST_DIVM_MAX = stm32mp1_pll[PLL_2000].refclk_max * 1000000U;
> +
> +	ret = stm32mp1_get_max_opp_freq(priv, &output_freq);
> +	if (ret) {
> +		log_debug("PLL1 OPP configuration not found (%d).\n", ret);
> +		return ret;
> +	}
> +
> +	switch (clksrc) {
> +	case CLK_PLL12_HSI:
> +		input_freq = stm32mp1_clk_get_fixed(priv, _HSI);
> +		break;
> +	case CLK_PLL12_HSE:
> +		input_freq = stm32mp1_clk_get_fixed(priv, _HSE);
> +		break;
> +	default:
> +		return -EINTR;
> +	}
> +
> +	/* Following parameters have always the same value */
> +	pllcfg[PLLCFG_Q] = 0;
> +	pllcfg[PLLCFG_R] = 0;
> +	pllcfg[PLLCFG_O] = PQR(1, 1, 1);
> +
> +	for (divm = DIVM_MAX; divm >= DIVM_MIN; divm--)	{
> +		post_divm = (u32)(input_freq / (divm + 1));
> +		if (post_divm < POST_DIVM_MIN || post_divm > POST_DIVM_MAX)
> +			continue;
> +
> +		for (divp = DIVP_MIN; divp <= DIVP_MAX; divp++) {
> +			freq = output_freq * (divm + 1) * (divp + 1);
> +			divn = (u32)((freq / input_freq) - 1);
> +			if (divn < DIVN_MIN || divn > DIVN_MAX)
> +				continue;
> +
> +			frac = (u32)(((freq * FRAC_MAX) / input_freq) -
> +				     ((divn + 1) * FRAC_MAX));
> +			/* 2 loops to refine the fractional part */
> +			for (i = 2; i != 0; i--) {
> +				if (frac > FRAC_MAX)
> +					break;
> +
> +				vco = (post_divm * (divn + 1)) +
> +				      ((post_divm * (u64)frac) /
> +				       FRAC_MAX);
> +				if (vco < (PLL2000_VCO_MIN / 2) ||
> +				    vco > (PLL2000_VCO_MAX / 2)) {
> +					frac++;
> +					continue;
> +				}
> +				freq = vco / (divp + 1);
> +				if (output_freq < freq)
> +					diff = (u32)(freq - output_freq);
> +				else
> +					diff = (u32)(output_freq - freq);
> +				if (diff < best_diff)  {
> +					pllcfg[PLLCFG_M] = divm;
> +					pllcfg[PLLCFG_N] = divn;
> +					pllcfg[PLLCFG_P] = divp;
> +					*fracv = frac;
> +
> +					if (diff == 0) {
> +						return 0;
> +					}
> +
> +					best_diff = diff;
> +				}
> +				frac++;
> +			}
> +		}
> +	}
> +
> +	if (best_diff == U32_MAX)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static void stm32mp1_ls_osc_set(int enable, fdt_addr_t rcc, u32 offset,
> +				u32 mask_on)
> +{
> +	u32 address = rcc + offset;
> +
> +	if (enable)
> +		setbits_le32(address, mask_on);
> +	else
> +		clrbits_le32(address, mask_on);
> +}
> +
> +static void stm32mp1_hs_ocs_set(int enable, fdt_addr_t rcc, u32 mask_on)
> +{
> +	writel(mask_on, rcc + (enable ? RCC_OCENSETR : RCC_OCENCLRR));
> +}
> +
> +static int stm32mp1_osc_wait(int enable, fdt_addr_t rcc, u32 offset,
> +			     u32 mask_rdy)
> +{
> +	u32 mask_test = 0;
> +	u32 address = rcc + offset;
> +	u32 val;
> +	int ret;
> +
> +	if (enable)
> +		mask_test = mask_rdy;
> +
> +	ret = readl_poll_timeout(address, val,
> +				 (val & mask_rdy) == mask_test,
> +				 TIMEOUT_1S);
> +
> +	if (ret)
> +		log_err("OSC %x @ %x timeout for enable=%d : 0x%x\n",
> +			mask_rdy, address, enable, readl(address));
> +
> +	return ret;
> +}
> +
> +static void stm32mp1_lse_enable(fdt_addr_t rcc, int bypass, int digbyp,
> +				u32 lsedrv)
> +{
> +	u32 value;
> +
> +	if (digbyp)
> +		setbits_le32(rcc + RCC_BDCR, RCC_BDCR_DIGBYP);
> +
> +	if (bypass || digbyp)
> +		setbits_le32(rcc + RCC_BDCR, RCC_BDCR_LSEBYP);
> +
> +	/*
> +	 * warning: not recommended to switch directly from "high drive"
> +	 * to "medium low drive", and vice-versa.
> +	 */
> +	value = (readl(rcc + RCC_BDCR) & RCC_BDCR_LSEDRV_MASK)
> +		>> RCC_BDCR_LSEDRV_SHIFT;
> +
> +	while (value != lsedrv) {
> +		if (value > lsedrv)
> +			value--;
> +		else
> +			value++;
> +
> +		clrsetbits_le32(rcc + RCC_BDCR,
> +				RCC_BDCR_LSEDRV_MASK,
> +				value << RCC_BDCR_LSEDRV_SHIFT);
> +	}
> +
> +	stm32mp1_ls_osc_set(1, rcc, RCC_BDCR, RCC_BDCR_LSEON);
> +}
> +
> +static void stm32mp1_lse_wait(fdt_addr_t rcc)
> +{
> +	stm32mp1_osc_wait(1, rcc, RCC_BDCR, RCC_BDCR_LSERDY);
> +}
> +
> +static void stm32mp1_lsi_set(fdt_addr_t rcc, int enable)
> +{
> +	stm32mp1_ls_osc_set(enable, rcc, RCC_RDLSICR, RCC_RDLSICR_LSION);
> +	stm32mp1_osc_wait(enable, rcc, RCC_RDLSICR, RCC_RDLSICR_LSIRDY);
> +}
> +
> +static void stm32mp1_hse_enable(fdt_addr_t rcc, int bypass, int digbyp, int css)
> +{
> +	if (digbyp)
> +		writel(RCC_OCENR_DIGBYP, rcc + RCC_OCENSETR);
> +	if (bypass || digbyp)
> +		writel(RCC_OCENR_HSEBYP, rcc + RCC_OCENSETR);
> +
> +	stm32mp1_hs_ocs_set(1, rcc, RCC_OCENR_HSEON);
> +	stm32mp1_osc_wait(1, rcc, RCC_OCRDYR, RCC_OCRDYR_HSERDY);
> +
> +	if (css)
> +		writel(RCC_OCENR_HSECSSON, rcc + RCC_OCENSETR);
> +}
> +
> +static void stm32mp1_csi_set(fdt_addr_t rcc, int enable)
> +{
> +	stm32mp1_hs_ocs_set(enable, rcc, RCC_OCENR_CSION);
> +	stm32mp1_osc_wait(enable, rcc, RCC_OCRDYR, RCC_OCRDYR_CSIRDY);
> +}
> +
> +static void stm32mp1_hsi_set(fdt_addr_t rcc, int enable)
> +{
> +	stm32mp1_hs_ocs_set(enable, rcc, RCC_OCENR_HSION);
> +	stm32mp1_osc_wait(enable, rcc, RCC_OCRDYR, RCC_OCRDYR_HSIRDY);
> +}
> +
> +static int stm32mp1_set_hsidiv(fdt_addr_t rcc, u8 hsidiv)
> +{
> +	u32 address = rcc + RCC_OCRDYR;
> +	u32 val;
> +	int ret;
> +
> +	clrsetbits_le32(rcc + RCC_HSICFGR,
> +			RCC_HSICFGR_HSIDIV_MASK,
> +			RCC_HSICFGR_HSIDIV_MASK & hsidiv);
> +
> +	ret = readl_poll_timeout(address, val,
> +				 val & RCC_OCRDYR_HSIDIVRDY,
> +				 TIMEOUT_200MS);
> +	if (ret)
> +		log_err("HSIDIV failed @ 0x%x: 0x%x\n",
> +			address, readl(address));
> +
> +	return ret;
> +}
> +
> +static int stm32mp1_hsidiv(fdt_addr_t rcc, ulong hsifreq)
> +{
> +	u8 hsidiv;
> +	u32 hsidivfreq = MAX_HSI_HZ;
> +
> +	for (hsidiv = 0; hsidiv < 4; hsidiv++,
> +	     hsidivfreq = hsidivfreq / 2)
> +		if (hsidivfreq == hsifreq)
> +			break;
> +
> +	if (hsidiv == 4) {
> +		log_err("hsi frequency invalid");
> +		return -1;
> +	}
> +
> +	if (hsidiv > 0)
> +		return stm32mp1_set_hsidiv(rcc, hsidiv);
> +
> +	return 0;
> +}
> +
> +static void pll_start(struct stm32mp_rcc_priv *priv, int pll_id)
> +{
> +	clrsetbits_le32((u32)(priv->base) + stm32mp1_clk_pll[pll_id].pllxcr,
> +			RCC_PLLNCR_DIVPEN | RCC_PLLNCR_DIVQEN |
> +			RCC_PLLNCR_DIVREN,
> +			RCC_PLLNCR_PLLON);
> +}
> +
> +static int pll_output(struct stm32mp_rcc_priv *priv, int pll_id, int output)
> +{
> +	u32 pllxcr = (u32)(priv->base) + stm32mp1_clk_pll[pll_id].pllxcr;
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_poll_timeout(pllxcr, val, val & RCC_PLLNCR_PLLRDY,
> +				 TIMEOUT_200MS);
> +
> +	if (ret) {
> +		log_err("PLL%d start failed @ 0x%x: 0x%x\n",
> +			pll_id, pllxcr, readl(pllxcr));
> +		return ret;
> +	}
> +
> +	/* start the requested output */
> +	setbits_le32(pllxcr, output << RCC_PLLNCR_DIVEN_SHIFT);
> +
> +	return 0;
> +}
> +
> +static int pll_stop(struct stm32mp_rcc_priv *priv, int pll_id)
> +{
> +	u32 pllxcr = (u32)(priv->base) + stm32mp1_clk_pll[pll_id].pllxcr;
> +	u32 val;
> +
> +	/* stop all output */
> +	clrbits_le32(pllxcr,
> +		     RCC_PLLNCR_DIVPEN | RCC_PLLNCR_DIVQEN | RCC_PLLNCR_DIVREN);
> +
> +	/* stop PLL */
> +	clrbits_le32(pllxcr, RCC_PLLNCR_PLLON);
> +
> +	/* wait PLL stopped */
> +	return readl_poll_timeout(pllxcr, val, (val & RCC_PLLNCR_PLLRDY) == 0,
> +				  TIMEOUT_200MS);
> +}
> +
> +static void pll_config_output(struct stm32mp_rcc_priv *priv,
> +			      int pll_id, u32 *pllcfg)
> +{
> +	fdt_addr_t rcc = (u32)(priv->base);
> +	u32 value;
> +
> +	value = (pllcfg[PLLCFG_P] << RCC_PLLNCFGR2_DIVP_SHIFT)
> +		& RCC_PLLNCFGR2_DIVP_MASK;
> +	value |= (pllcfg[PLLCFG_Q] << RCC_PLLNCFGR2_DIVQ_SHIFT)
> +		 & RCC_PLLNCFGR2_DIVQ_MASK;
> +	value |= (pllcfg[PLLCFG_R] << RCC_PLLNCFGR2_DIVR_SHIFT)
> +		 & RCC_PLLNCFGR2_DIVR_MASK;
> +	writel(value, rcc + stm32mp1_clk_pll[pll_id].pllxcfgr2);
> +}
> +
> +static int pll_config(struct stm32mp_rcc_priv *priv, int pll_id,
> +		      u32 *pllcfg, u32 fracv)
> +{
> +	fdt_addr_t rcc = (u32)(priv->base);
> +	enum stm32mp1_plltype type = stm32mp1_clk_pll[pll_id].plltype;
> +	int src;
> +	ulong refclk;
> +	u8 ifrge = 0;
> +	u32 value;
> +
> +	src = readl((u32)(priv->base) + stm32mp1_clk_pll[pll_id].rckxselr) & RCC_SELR_SRC_MASK;
> +	refclk = stm32mp1_clk_get_fixed(priv, stm32mp1_clk_pll[pll_id].refclk[src]) /
> +		 (pllcfg[PLLCFG_M] + 1);
> +
> +	if (refclk < (stm32mp1_pll[type].refclk_min * 1000000) ||
> +	    refclk > (stm32mp1_pll[type].refclk_max * 1000000)) {
> +		log_err("invalid refclk = %x\n", (u32)refclk);
> +		return -EINVAL;
> +	}
> +
> +
> +	if (type == PLL_800 && refclk >= 8000000)
> +		ifrge = 1;
> +
> +	value = (pllcfg[PLLCFG_N] << RCC_PLLNCFGR1_DIVN_SHIFT)
> +		 & RCC_PLLNCFGR1_DIVN_MASK;
> +	value |= (pllcfg[PLLCFG_M] << RCC_PLLNCFGR1_DIVM_SHIFT)
> +		 & RCC_PLLNCFGR1_DIVM_MASK;
> +	value |= (ifrge << RCC_PLLNCFGR1_IFRGE_SHIFT)
> +		 & RCC_PLLNCFGR1_IFRGE_MASK;
> +	writel(value, rcc + stm32mp1_clk_pll[pll_id].pllxcfgr1);
> +
> +	/* fractional configuration: load sigma-delta modulator (SDM) */
> +
> +	/* Write into FRACV the new fractional value , and FRACLE to 0 */
> +	writel(fracv << RCC_PLLNFRACR_FRACV_SHIFT,
> +	       rcc + stm32mp1_clk_pll[pll_id].pllxfracr);
> +
> +	/* Write FRACLE to 1 : FRACV value is loaded into the SDM */
> +	setbits_le32(rcc + stm32mp1_clk_pll[pll_id].pllxfracr,
> +		     RCC_PLLNFRACR_FRACLE);
> +
> +	pll_config_output(priv, pll_id, pllcfg);
> +
> +	return 0;
> +}
> +
> +static void pll_csg(struct stm32mp_rcc_priv *priv, int pll_id, u32 *csg)
> +{
> +	u32 pllxcsg;
> +
> +	pllxcsg = ((csg[PLLCSG_MOD_PER] << RCC_PLLNCSGR_MOD_PER_SHIFT) &
> +		    RCC_PLLNCSGR_MOD_PER_MASK) |
> +		  ((csg[PLLCSG_INC_STEP] << RCC_PLLNCSGR_INC_STEP_SHIFT) &
> +		    RCC_PLLNCSGR_INC_STEP_MASK) |
> +		  ((csg[PLLCSG_SSCG_MODE] << RCC_PLLNCSGR_SSCG_MODE_SHIFT) &
> +		    RCC_PLLNCSGR_SSCG_MODE_MASK);
> +
> +	writel(pllxcsg, (u32)(priv->base) + stm32mp1_clk_pll[pll_id].pllxcsgr);
> +
> +	setbits_le32((u32)(priv->base) + stm32mp1_clk_pll[pll_id].pllxcr, RCC_PLLNCR_SSCG_CTRL);
> +}
> +
> +static ulong pll_get_fref_ck(struct stm32mp_rcc_priv *priv,
> +			      int pll_id)
> +{
> +	u32 selr;
> +	int src;
> +
> +	/* Get current refclk */
> +	selr = readl(priv->base + stm32mp1_clk_pll[pll_id].rckxselr);
> +	src = selr & RCC_SELR_SRC_MASK;
> +
> +	return stm32mp1_clk_get_fixed(priv, stm32mp1_clk_pll[pll_id].refclk[src]);
> +}
> +
> +static  __maybe_unused int pll_set_rate(struct udevice *dev,
> +					int pll_id,
> +					int div_id,
> +					unsigned long clk_rate)
> +{
> +	struct stm32mp_rcc_priv *priv = dev_get_priv(dev);
> +	unsigned int pllcfg[PLLCFG_NB];
> +	ofnode plloff;
> +	char name[12];
> +	enum stm32mp1_plltype type = stm32mp1_clk_pll[pll_id].plltype;
> +	int divm, divn, divy;
> +	int ret;
> +	ulong fck_ref;
> +	u32 fracv;
> +	u64 value;
> +
> +	if (div_id > _DIV_NB)
> +		return -EINVAL;
> +
> +	sprintf(name, "st,pll@%d", pll_id);
> +	plloff = dev_read_subnode(dev, name);
> +	if (!ofnode_valid(plloff))
> +		return -FDT_ERR_NOTFOUND;
> +
> +	ret = ofnode_read_u32_array(plloff, "cfg",
> +				    pllcfg, PLLCFG_NB);
> +	if (ret < 0)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	fck_ref = pll_get_fref_ck(priv, pll_id);
> +
> +	divm = pllcfg[PLLCFG_M];
> +	/* select output divider = 0: for _DIV_P, 1:_DIV_Q 2:_DIV_R */
> +	divy = pllcfg[PLLCFG_P + div_id];
> +
> +	/* For: PLL1 & PLL2 => VCO is * 2 but ck_pll_y is also / 2
> +	 * So same final result than PLL2 et 4
> +	 * with FRACV
> +	 * Fck_pll_y = Fck_ref * ((DIVN + 1) + FRACV / 2^13)
> +	 *             / (DIVy + 1) * (DIVM + 1)
> +	 * value = (DIVN + 1) * 2^13 + FRACV / 2^13
> +	 *       = Fck_pll_y (DIVy + 1) * (DIVM + 1) * 2^13 / Fck_ref
> +	 */
> +	value = ((u64)clk_rate * (divy + 1) * (divm + 1)) << 13;
> +	value = lldiv(value, fck_ref);
> +
> +	divn = (value >> 13) - 1;
> +	if (divn < DIVN_MIN ||
> +	    divn > stm32mp1_pll[type].divn_max) {
> +		dev_err(dev, "divn invalid = %d", divn);
> +		return -EINVAL;
> +	}
> +	fracv = value - ((divn + 1) << 13);
> +	pllcfg[PLLCFG_N] = divn;
> +
> +	/* reconfigure PLL */
> +	pll_stop(priv, pll_id);
> +	pll_config(priv, pll_id, pllcfg, fracv);
> +	pll_start(priv, pll_id);
> +	pll_output(priv, pll_id, pllcfg[PLLCFG_O]);
> +
> +	return 0;
> +}
> +
> +static int set_clksrc(struct stm32mp_rcc_priv *priv, unsigned int clksrc)
> +{
> +	u32 address = (u32)(priv->base);
> +	u32 mux = (clksrc & MUX_ID_MASK) >> MUX_ID_SHIFT;
> +	u32 val;
> +	int ret;
> +
> +	/* List of relevant muxes to keep the size down */
> +	if (mux == MUX_PLL12)
> +		address += RCC_RCK12SELR;
> +	else if (mux == MUX_PLL3)
> +		address += RCC_RCK3SELR;
> +	else if (mux == MUX_PLL4)
> +		address += RCC_RCK4SELR;
> +	else if (mux == MUX_MPU)
> +		address += RCC_MPCKSELR;
> +	else if (mux == MUX_AXI)
> +		address += RCC_ASSCKSELR;
> +	else if (mux == MUX_MLAHB)
> +		address += RCC_MSSCKSELR;
> +	else if (mux == MUX_CKPER)
> +		address += RCC_CPERCKSELR;
> +	else
> +		return -EINVAL;
> +
> +	clrsetbits_le32(address, RCC_SELR_SRC_MASK, clksrc & RCC_SELR_SRC_MASK);
> +	ret = readl_poll_timeout(address, val, val & RCC_SELR_SRCRDY,
> +				 TIMEOUT_200MS);
> +	if (ret)
> +		log_err("CLKSRC %x start failed @ 0x%x: 0x%x\n",
> +			clksrc, address, readl(address));
> +
> +	return ret;
> +}
> +
> +static void stgen_config(struct stm32mp_rcc_priv *priv)
> +{
> +	u32 stgenc, cntfid0;
> +	ulong rate = clk_get_rate(&priv->osc_clk[_HSI]);
> +	stgenc = STM32_STGEN_BASE;
> +	cntfid0 = readl(stgenc + STGENC_CNTFID0);
> +
> +	if (cntfid0 != rate) {
> +		u64 counter;
> +
> +		log_debug("System Generic Counter (STGEN) update\n");
> +		clrbits_le32(stgenc + STGENC_CNTCR, STGENC_CNTCR_EN);
> +		counter = (u64)readl(stgenc + STGENC_CNTCVL);
> +		counter |= ((u64)(readl(stgenc + STGENC_CNTCVU))) << 32;
> +		counter = lldiv(counter * (u64)rate, cntfid0);
> +		writel((u32)counter, stgenc + STGENC_CNTCVL);
> +		writel((u32)(counter >> 32), stgenc + STGENC_CNTCVU);
> +		writel(rate, stgenc + STGENC_CNTFID0);
> +		setbits_le32(stgenc + STGENC_CNTCR, STGENC_CNTCR_EN);
> +
> +		__asm__ volatile("mcr p15, 0, %0, c14, c0, 0" : : "r" (rate));
> +
> +		/* need to update gd->arch.timer_rate_hz with new frequency */
> +		timer_init();
> +	}
> +}
> +
> +static int set_clkdiv(unsigned int clkdiv, u32 address)
> +{
> +	u32 val;
> +	int ret;
> +
> +
> +	clrsetbits_le32(address, RCC_DIVR_DIV_MASK, clkdiv & RCC_DIVR_DIV_MASK);
> +	ret = readl_poll_timeout(address, val, val & RCC_DIVR_DIVRDY,
> +				 TIMEOUT_200MS);
> +	if (ret)
> +		log_err("CLKDIV %x start failed @ 0x%x: 0x%x\n",
> +			clkdiv, address, readl(address));
> +
> +	return ret;
> +}
> +
> +static void set_rtcsrc(struct stm32mp_rcc_priv *priv,
> +		       unsigned int clksrc,
> +		       int lse_css)
> +{
> +	u32 address = (u32)(priv->base) + RCC_BDCR;
> +
> +	if (readl(address) & RCC_BDCR_RTCCKEN)
> +		goto skip_rtc;
> +
> +	if (clksrc == CLK_RTC_DISABLED)
> +		goto skip_rtc;
> +
> +	clrsetbits_le32(address,
> +			RCC_BDCR_RTCSRC_MASK,
> +			clksrc << RCC_BDCR_RTCSRC_SHIFT);
> +
> +	setbits_le32(address, RCC_BDCR_RTCCKEN);
> +
> +skip_rtc:
> +	if (lse_css)
> +		setbits_le32(address, RCC_BDCR_LSECSSON);
> +}
> +
> +static void pkcs_config(struct stm32mp_rcc_priv *priv, u32 pkcs)
> +{
> +	u32 mux = (pkcs & MUX_ID_MASK) >> MUX_ID_SHIFT;
> +	u32 address = (u32)(priv->base) + stm32mp13_muxes[mux].reg_off;
> +	u32 mask = (BIT(stm32mp13_muxes[mux].width) - 1) << stm32mp13_muxes[mux].shift;
> +	u32 value = (pkcs << stm32mp13_muxes[mux].shift) & mask;
> +
> +	clrsetbits_le32(address, mask, value);
> +}
> +
> +static int stm32mp1_clktree(struct udevice *dev)
> +{
> +	struct stm32mp_rcc_priv *priv = dev_get_priv(dev);
> +	fdt_addr_t rcc = (u32)(priv->base);
> +	unsigned int clksrc[CLKSRC_NB];
> +	unsigned int clkdiv[CLKDIV_NB];
> +	unsigned int pllcfg[_PLL_NB][PLLCFG_NB];
> +	unsigned int pllfracv[_PLL_NB];
> +	unsigned int pllcsg[_PLL_NB][PLLCSG_NB];
> +	bool pllcfg_valid[_PLL_NB];
> +	bool pllcsg_set[_PLL_NB];
> +	int ret;
> +	int i, len;
> +	int lse_css = 0;
> +	const u32 *pkcs_cell;
> +
> +	/* check mandatory field */
> +	ret = dev_read_u32_array(dev, "st,clksrc", clksrc, CLKSRC_NB);
> +	if (ret < 0) {
> +		dev_dbg(dev, "field st,clksrc invalid: error %d\n", ret);
> +		return -FDT_ERR_NOTFOUND;
> +	}
> +
> +	ret = dev_read_u32_array(dev, "st,clkdiv", clkdiv, CLKDIV_NB);
> +	if (ret < 0) {
> +		dev_dbg(dev, "field st,clkdiv invalid: error %d\n", ret);
> +		return -FDT_ERR_NOTFOUND;
> +	}
> +
> +	/* check mandatory field in each pll */
> +	for (i = 0; i < _PLL_NB; i++) {
> +		char name[12];
> +		ofnode node;
> +
> +		sprintf(name, "st,pll@%d", i);
> +		node = dev_read_subnode(dev, name);
> +		pllcfg_valid[i] = ofnode_valid(node);
> +		pllcsg_set[i] = false;
> +		if (pllcfg_valid[i]) {
> +			dev_dbg(dev, "DT for PLL %d @ %s\n", i, name);
> +			ret = ofnode_read_u32_array(node, "cfg",
> +						    pllcfg[i], PLLCFG_NB);
> +			if (ret < 0) {
> +				dev_dbg(dev, "field cfg invalid: error %d\n", ret);
> +				return -FDT_ERR_NOTFOUND;
> +			}
> +			pllfracv[i] = ofnode_read_u32_default(node, "frac", 0);
> +
> +			ret = ofnode_read_u32_array(node, "csg", pllcsg[i],
> +						    PLLCSG_NB);
> +			if (!ret) {
> +				pllcsg_set[i] = true;
> +			} else if (ret != -FDT_ERR_NOTFOUND) {
> +				dev_dbg(dev, "invalid csg node for pll@%d res=%d\n",
> +					i, ret);
> +				return ret;
> +			}
> +		} else if (i == _PLL1)	{
> +			/* use OPP for PLL1 for A7 CPU */
> +			dev_dbg(dev, "DT for PLL %d with OPP\n", i);
> +			ret = stm32mp1_pll1_opp(priv,
> +						clksrc[CLKSRC_PLL12],
> +						pllcfg[i],
> +						&pllfracv[i]);
> +			if (ret) {
> +				dev_dbg(dev, "PLL %d with OPP error = %d\n", i, ret);
> +				return ret;
> +			}
> +			pllcfg_valid[i] = true;
> +		}
> +	}
> +
> +	dev_dbg(dev, "switch ON osillator\n");
> +	/*
> +	 * switch ON oscillator found in device-tree,
> +	 * HSI already ON after bootrom
> +	 */
> +	if (clk_valid(&priv->osc_clk[_LSI]))
> +		stm32mp1_lsi_set(rcc, 1);
> +
> +	if (clk_valid(&priv->osc_clk[_LSE])) {
> +		int bypass, digbyp;
> +		u32 lsedrv;
> +		struct udevice *dev = priv->osc_clk[_LSE].dev;
> +
> +		bypass = dev_read_bool(dev, "st,bypass");
> +		digbyp = dev_read_bool(dev, "st,digbypass");
> +		lse_css = dev_read_bool(dev, "st,css");
> +		lsedrv = dev_read_u32_default(dev, "st,drive",
> +					      LSEDRV_MEDIUM_HIGH);
> +
> +		stm32mp1_lse_enable(rcc, bypass, digbyp, lsedrv);
> +	}
> +
> +
> +	if (clk_valid(&priv->osc_clk[_HSE])) {
> +		int bypass, digbyp, css;
> +		struct udevice *dev = priv->osc_clk[_HSE].dev;
> +
> +		bypass = dev_read_bool(dev, "st,bypass");
> +		digbyp = dev_read_bool(dev, "st,digbypass");
> +		css = dev_read_bool(dev, "st,css");
> +
> +		stm32mp1_hse_enable(rcc, bypass, digbyp, css);
> +	}
> +
> +	/* CSI is mandatory for automatic I/O compensation (SYSCFG_CMPCR)
> +	 * => switch on CSI even if node is not present in device tree
> +	 */
> +	stm32mp1_csi_set(rcc, 1);
> +
> +	/* come back to HSI */
> +	dev_dbg(dev, "come back to HSI\n");
> +	set_clksrc(priv, CLK_MPU_HSI);
> +	set_clksrc(priv, CLK_AXI_HSI);
> +	set_clksrc(priv, CLK_MLAHBS_HSI);
> +
> +	dev_dbg(dev, "pll stop\n");
> +	for (i = 0; i < _PLL_NB; i++)
> +		pll_stop(priv, i);
> +
> +	/* configure HSIDIV */
> +	dev_dbg(dev, "configure HSIDIV\n");
> +	if (clk_valid(&priv->osc_clk[_HSI])) {
> +		stm32mp1_hsidiv(rcc, clk_get_rate(&priv->osc_clk[_HSI]));
> +		stgen_config(priv);
> +	}
> +
> +	/* select DIV */
> +	dev_dbg(dev, "select DIV\n");
> +	/* no ready bit when MPUSRC != CLK_MPU_PLL1P_DIV, MPUDIV is disabled */
> +	set_clkdiv(clkdiv[CLKDIV_AXI], rcc + RCC_AXIDIVR);
> +	set_clkdiv(clkdiv[CLKDIV_APB4], rcc + RCC_APB4DIVR);
> +	set_clkdiv(clkdiv[CLKDIV_APB5], rcc + RCC_APB5DIVR);
> +	set_clkdiv(clkdiv[CLKDIV_APB6], rcc + RCC_APB6DIVR);
> +	set_clkdiv(clkdiv[CLKDIV_APB1], rcc + RCC_APB1DIVR);
> +	set_clkdiv(clkdiv[CLKDIV_APB2], rcc + RCC_APB2DIVR);
> +	set_clkdiv(clkdiv[CLKDIV_APB3], rcc + RCC_APB3DIVR);
> +
> +	/* no ready bit for RTC */
> +	writel(clkdiv[CLKDIV_RTC] & RCC_DIVR_DIV_MASK, rcc + RCC_RTCDIVR);
> +
> +	/* configure PLLs source */
> +	dev_dbg(dev, "configure PLLs source\n");
> +	set_clksrc(priv, clksrc[CLKSRC_PLL12]);
> +	set_clksrc(priv, clksrc[CLKSRC_PLL3]);
> +	set_clksrc(priv, clksrc[CLKSRC_PLL4]);
> +
> +	/* configure and start PLLs */
> +	dev_dbg(dev, "configure PLLs\n");
> +	for (i = 0; i < _PLL_NB; i++) {
> +		if (!pllcfg_valid[i])
> +			continue;
> +		dev_dbg(dev, "configure PLL %d\n", i);
> +		pll_config(priv, i, pllcfg[i], pllfracv[i]);
> +		if (pllcsg_set[i])
> +			pll_csg(priv, i, pllcsg[i]);
> +		pll_start(priv, i);
> +	}
> +
> +	/* wait and start PLLs ouptut when ready */
> +	for (i = 0; i < _PLL_NB; i++) {
> +		if (!pllcfg_valid[i])
> +			continue;
> +		dev_dbg(dev, "output PLL %d\n", i);
> +		pll_output(priv, i, pllcfg[i][PLLCFG_O]);
> +	}
> +
> +	/* wait LSE ready before to use it */
> +	if (clk_valid(&priv->osc_clk[_LSE]))
> +		stm32mp1_lse_wait(rcc);
> +
> +	/* configure with expected clock source */
> +	dev_dbg(dev, "CLKSRC\n");
> +	set_clksrc(priv, clksrc[CLKSRC_MPU]);
> +	set_clksrc(priv, clksrc[CLKSRC_AXI]);
> +	set_clksrc(priv, clksrc[CLKSRC_MLAHB]);
> +	set_rtcsrc(priv, clksrc[CLKSRC_RTC], lse_css);
> +
> +	/* configure PKCK */
> +	dev_dbg(dev, "PKCK\n");
> +	pkcs_cell = dev_read_prop(dev, "st,pkcs", &len);
> +	if (pkcs_cell) {
> +		bool ckper_disabled = false;
> +
> +		for (i = 0; i < len / sizeof(u32); i++) {
> +			u32 pkcs = (u32)fdt32_to_cpu(pkcs_cell[i]);
> +
> +			if (pkcs == CLK_CKPER_DISABLED) {
> +				ckper_disabled = true;
> +				continue;
> +			}
> +			pkcs_config(priv, pkcs);
> +		}
> +		/* CKPER is source for some peripheral clock
> +		 * (FMC-NAND / QPSI-NOR) and switching source is allowed
> +		 * only if previous clock is still ON
> +		 * => deactivated CKPER only after switching clock
> +		 */
> +		if (ckper_disabled)
> +			pkcs_config(priv, CLK_CKPER_DISABLED);
> +	}
> +
> +	/* STGEN clock source can change with CLK_STGEN_XXX */
> +	stgen_config(priv);
> +
> +	dev_dbg(dev, "oscillator off\n");
> +	/* switch OFF HSI if not found in device-tree */
> +	if (!clk_valid(&priv->osc_clk[_HSI]))
> +		stm32mp1_hsi_set(rcc, 0);
> +
> +	/* Software Self-Refresh mode (SSR) during DDR initilialization */
> +	clrsetbits_le32((u32)(priv->base) + RCC_DDRITFCR,
> +			RCC_DDRITFCR_DDRCKMOD_MASK,
> +			RCC_DDRITFCR_DDRCKMOD_SSR <<
> +			RCC_DDRITFCR_DDRCKMOD_SHIFT);
> +
> +	return 0;
> +}
> +#endif
> +
> +static int stm32mp1_osc_init(struct udevice *dev)
> +{
> +	struct stm32mp_rcc_priv *priv = dev_get_priv(dev);
> +	fdt_addr_t base = dev_read_addr(dev->parent);
> +	struct clk *ck;
> +	int i;
> +
> +	const char *name[NB_OSC] = {
> +		[_LSI] = "lsi",
> +		[_LSE] = "lse",
> +		[_HSI] = "hsi",
> +		[_HSE] = "hse",
> +		[_CSI] = "csi",
> +		[_I2S_CKIN] = "i2s_ckin",
> +	};
> +
> +	const struct {
> +		const char *name;
> +		const int rate;
> +	} fixed_clk[] = {
> +		{ "bsec", 66625000 },
> +		{ "ck_axi", 266500000 },
> +		{ "ck_mlahb", 200000000 },
> +		{ "ck_mpu", 1000000000 },
> +		{ "ck_per", 24000000 },
> +		{ "ck_rtc", 32768 },
> +		{ "clk-hse-div2", 12000000 },
> +		{ "pclk1", 100000000 },
> +		{ "pclk2", 100000000 },
> +		{ "pclk3", 100000000 },
> +		{ "pclk4", 133250000 },
> +		{ "pclk5", 66625000 },
> +		{ "pclk6", 100000000 },
> +		{ "pll2_q", 266500000 },
> +		{ "pll2_r", 533000000 },
> +		{ "pll3_p", 200000000 },
> +		{ "pll3_q", 150000000 },
> +		{ "pll3_r", 200000000 },
> +		{ "pll4_p", 125000000 },
> +		{ "pll4_q", 83333333 },
> +		{ "pll4_r", 75000000 },
> +		{ "rtcapb", 66625000 },
> +		{ "timg1_ck", 200000000 },
> +		{ "timg2_ck", 200000000 },
> +		{ "timg3_ck", 200000000 },
> +	};
> +
> +	if (base == FDT_ADDR_T_NONE)
> +		return -EINVAL;
> +
> +	priv->base = (void __iomem *)base;
> +
> +	for (i = 0; i < NB_OSC; i++) {
> +		if (clk_get_by_name(dev, name[i], &priv->osc_clk[i]))
> +			dev_dbg(dev, "No source clock \"%s\"\n", name[i]);
> +		else
> +			dev_dbg(dev, "%s clock rate: %luHz\n",
> +				name[i], clk_get_rate(&priv->osc_clk[i]));
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(fixed_clk); i++) {
> +		ck = clk_register_fixed_rate(NULL, fixed_clk[i].name, fixed_clk[i].rate);
> +		if (!ck)
> +			dev_dbg(dev, "Cannot register fixed clock \"%s\"\n", fixed_clk[i].name);
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
>  static int stm32mp1_clk_probe(struct udevice *dev)
>  {
> -	struct udevice *scmi;
>  	int err;
>  
> +#ifdef CONFIG_TFABOOT
> +	struct udevice *scmi;
> +
>  	/* force SCMI probe to register all SCMI clocks */
>  	uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(scmi_clock), &scmi);
> +#else
> +	err = stm32mp1_osc_init(dev);
> +	if (err)
> +		return err;
> +
> +#if defined(CONFIG_XPL_BUILD)
> +	/* clock tree init is done only one time, before relocation */
> +	if (!(gd->flags & GD_FLG_RELOC))
> +		err = stm32mp1_clktree(dev);
> +	if (err)
> +		dev_err(dev, "clock tree initialization failed (%d)\n", err);
> +#endif
> +#endif
>  
>  	err = stm32_rcc_init(dev, &stm32mp13_data);
>  	if (err)
> @@ -815,6 +2012,7 @@ static int stm32mp1_clk_probe(struct udevice *dev)
>  	/* DDRPHYC father */
>  	gd->mem_clk = clk_stm32_get_rate_by_name("pll2_r");
>  
> +#ifndef CONFIG_XPL_BUILD
>  	if (IS_ENABLED(CONFIG_DISPLAY_CPUINFO)) {
>  		if (gd->flags & GD_FLG_RELOC) {
>  			char buf[32];
> @@ -827,6 +2025,7 @@ static int stm32mp1_clk_probe(struct udevice *dev)
>  			log_info("- DDR : %s MHz\n", strmhz(buf, gd->mem_clk));
>  		}
>  	}
> +#endif
>  
>  	return 0;
>  }
> diff --git a/drivers/clk/stm32/stm32mp13_rcc.h b/drivers/clk/stm32/stm32mp13_rcc.h
> index e7191b428af..b9b44b213c3 100644
> --- a/drivers/clk/stm32/stm32mp13_rcc.h
> +++ b/drivers/clk/stm32/stm32mp13_rcc.h
> @@ -285,4 +285,97 @@
>  #define RCC_AHB6SECSR_ETH2MACSECF	30
>  #define RCC_AHB6SECSR_ETH2STPSECF	31
>  
> +/* Fields of RCC_BDCR register */
> +#define RCC_BDCR_LSEON			BIT(0)
> +#define RCC_BDCR_LSEBYP			BIT(1)
> +#define RCC_BDCR_LSERDY			BIT(2)
> +#define RCC_BDCR_DIGBYP			BIT(3)
> +#define RCC_BDCR_LSEDRV_MASK		GENMASK(5, 4)
> +#define RCC_BDCR_LSEDRV_SHIFT		4
> +#define RCC_BDCR_LSECSSON		BIT(8)
> +#define RCC_BDCR_RTCCKEN		BIT(20)
> +#define RCC_BDCR_RTCSRC_MASK		GENMASK(17, 16)
> +#define RCC_BDCR_RTCSRC_SHIFT		16
> +
> +/* Fields of RCC_RDLSICR register */
> +#define RCC_RDLSICR_LSION		BIT(0)
> +#define RCC_RDLSICR_LSIRDY		BIT(1)
> +
> +/* used for ALL PLLNCR registers */
> +#define RCC_PLLNCR_PLLON		BIT(0)
> +#define RCC_PLLNCR_PLLRDY		BIT(1)
> +#define RCC_PLLNCR_SSCG_CTRL		BIT(2)
> +#define RCC_PLLNCR_DIVPEN		BIT(4)
> +#define RCC_PLLNCR_DIVQEN		BIT(5)
> +#define RCC_PLLNCR_DIVREN		BIT(6)
> +#define RCC_PLLNCR_DIVEN_SHIFT		4
> +
> +/* used for ALL PLLNCFGR1 registers */
> +#define RCC_PLLNCFGR1_DIVM_SHIFT	16
> +#define RCC_PLLNCFGR1_DIVM_MASK		GENMASK(21, 16)
> +#define RCC_PLLNCFGR1_DIVN_SHIFT	0
> +#define RCC_PLLNCFGR1_DIVN_MASK		GENMASK(8, 0)
> +/* only for PLL3 and PLL4 */
> +#define RCC_PLLNCFGR1_IFRGE_SHIFT	24
> +#define RCC_PLLNCFGR1_IFRGE_MASK	GENMASK(25, 24)
> +
> +/* used for ALL PLLNCFGR2 registers , using stm32mp1_div_id */
> +#define RCC_PLLNCFGR2_SHIFT(div_id)	((div_id) * 8)
> +#define RCC_PLLNCFGR2_DIVX_MASK		GENMASK(6, 0)
> +#define RCC_PLLNCFGR2_DIVP_SHIFT	RCC_PLLNCFGR2_SHIFT(_DIV_P)
> +#define RCC_PLLNCFGR2_DIVP_MASK		GENMASK(6, 0)
> +#define RCC_PLLNCFGR2_DIVQ_SHIFT	RCC_PLLNCFGR2_SHIFT(_DIV_Q)
> +#define RCC_PLLNCFGR2_DIVQ_MASK		GENMASK(14, 8)
> +#define RCC_PLLNCFGR2_DIVR_SHIFT	RCC_PLLNCFGR2_SHIFT(_DIV_R)
> +#define RCC_PLLNCFGR2_DIVR_MASK		GENMASK(22, 16)
> +
> +/* used for ALL PLLNFRACR registers */
> +#define RCC_PLLNFRACR_FRACV_SHIFT	3
> +#define RCC_PLLNFRACR_FRACV_MASK	GENMASK(15, 3)
> +#define RCC_PLLNFRACR_FRACLE		BIT(16)
> +
> +/* used for ALL PLLNCSGR registers */
> +#define RCC_PLLNCSGR_INC_STEP_SHIFT	16
> +#define RCC_PLLNCSGR_INC_STEP_MASK	GENMASK(30, 16)
> +#define RCC_PLLNCSGR_MOD_PER_SHIFT	0
> +#define RCC_PLLNCSGR_MOD_PER_MASK	GENMASK(12, 0)
> +#define RCC_PLLNCSGR_SSCG_MODE_SHIFT	15
> +#define RCC_PLLNCSGR_SSCG_MODE_MASK	BIT(15)
> +
> +/* used for RCC_OCENSETR and RCC_OCENCLRR registers */
> +#define RCC_OCENR_HSION			BIT(0)
> +#define RCC_OCENR_CSION			BIT(4)
> +#define RCC_OCENR_DIGBYP		BIT(7)
> +#define RCC_OCENR_HSEON			BIT(8)
> +#define RCC_OCENR_HSEBYP		BIT(10)
> +#define RCC_OCENR_HSECSSON		BIT(11)
> +
> +/* Fields of RCC_OCRDYR register */
> +#define RCC_OCRDYR_HSIRDY		BIT(0)
> +#define RCC_OCRDYR_HSIDIVRDY		BIT(2)
> +#define RCC_OCRDYR_CSIRDY		BIT(4)
> +#define RCC_OCRDYR_HSERDY		BIT(8)
> +
> +/* Fields of DDRITFCR register */
> +#define RCC_DDRITFCR_DDRCKMOD_MASK	GENMASK(22, 20)
> +#define RCC_DDRITFCR_DDRCKMOD_SHIFT	20
> +#define RCC_DDRITFCR_DDRCKMOD_SSR	0
> +
> +/* Fields of RCC_HSICFGR register */
> +#define RCC_HSICFGR_HSIDIV_MASK		GENMASK(1, 0)
> +
> +/* used for MCO related operations */
> +#define RCC_MCOCFG_MCOON		BIT(12)
> +#define RCC_MCOCFG_MCODIV_MASK		GENMASK(7, 4)
> +#define RCC_MCOCFG_MCODIV_SHIFT		4
> +#define RCC_MCOCFG_MCOSRC_MASK		GENMASK(2, 0)
> +
> +/* used for most of SELR register */
> +#define RCC_SELR_SRC_MASK	GENMASK(2, 0)
> +#define RCC_SELR_SRCRDY		BIT(31)
> +
> +/* used for most of DIVR register : max div for RTC */
> +#define RCC_DIVR_DIV_MASK	GENMASK(5, 0)
> +#define RCC_DIVR_DIVRDY		BIT(31)
> +
>  #endif /* STM32MP13_RCC_H */
> diff --git a/include/dt-bindings/clock/stm32mp13-clksrc.h b/include/dt-bindings/clock/stm32mp13-clksrc.h
> new file mode 100644
> index 00000000000..312a6054699
> --- /dev/null
> +++ b/include/dt-bindings/clock/stm32mp13-clksrc.h
> @@ -0,0 +1,399 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_STM32MP13_CLKSRC_H_
> +#define _DT_BINDINGS_CLOCK_STM32MP13_CLKSRC_H_
> +
> +/* PLL output is enable when x=1, with x=p,q or r */
> +#define PQR(p, q, r)	(((p) & 1) | (((q) & 1) << 1) | (((r) & 1) << 2))
> +
> +/* st,clksrc: mandatory clock source */
> +
> +#define CMD_DIV		0
> +#define CMD_MUX		1
> +#define CMD_CLK		2
> +#define CMD_RESERVED1	3
> +
> +#define CMD_SHIFT	26
> +#define CMD_MASK	0xFC000000
> +#define CMD_DATA_MASK	0x03FFFFFF
> +
> +#define DIV_ID_SHIFT	8
> +#define DIV_ID_MASK	0x0000FF00
> +
> +#define DIV_DIVN_SHIFT	0
> +#define DIV_DIVN_MASK	0x000000FF
> +
> +#define MUX_ID_SHIFT	4
> +#define MUX_ID_MASK	0x00000FF0
> +
> +#define MUX_SEL_SHIFT	0
> +#define MUX_SEL_MASK	0x0000000F
> +
> +#define CLK_ID_MASK	GENMASK_32(19, 11)
> +#define CLK_ID_SHIFT	11
> +#define CLK_ON_MASK	0x00000400
> +#define CLK_ON_SHIFT	10
> +#define CLK_DIV_MASK	GENMASK_32(9, 4)
> +#define CLK_DIV_SHIFT	4
> +#define CLK_SEL_MASK	GENMASK_32(3, 0)
> +#define CLK_SEL_SHIFT	0
> +
> +#define DIV_PLL1DIVP	0
> +#define DIV_PLL2DIVP	1
> +#define DIV_PLL2DIVQ	2
> +#define DIV_PLL2DIVR	3
> +#define DIV_PLL3DIVP	4
> +#define DIV_PLL3DIVQ	5
> +#define DIV_PLL3DIVR	6
> +#define DIV_PLL4DIVP	7
> +#define DIV_PLL4DIVQ	8
> +#define DIV_PLL4DIVR	9
> +#define DIV_MPU		10
> +#define DIV_AXI		11
> +#define DIV_MLAHB	12
> +#define DIV_APB1	13
> +#define DIV_APB2	14
> +#define DIV_APB3	15
> +#define DIV_APB4	16
> +#define DIV_APB5	17
> +#define DIV_APB6	18
> +#define DIV_RTC		19
> +#define DIV_MCO1	20
> +#define DIV_MCO2	21
> +#define DIV_HSI		22
> +#define DIV_TRACE	23
> +#define DIV_ETH1PTP	24
> +#define DIV_ETH2PTP	25
> +#define DIV_MAX		26
> +
> +#define DIV(div_id, div)	((CMD_DIV << CMD_SHIFT) |\
> +				 ((div_id) << DIV_ID_SHIFT |\
> +				 (div)))
> +
> +#define CLKSRC(mux_id, sel)	((CMD_MUX << CMD_SHIFT) |\
> +				 ((mux_id) << MUX_ID_SHIFT |\
> +				 (sel)))
> +
> +/* MCO output is enable */
> +#define MCO_SRC(mco_id, sel)	((CMD_CLK << CMD_SHIFT) |\
> +				 (((mco_id) << CLK_ID_SHIFT) |\
> +				 (sel)) | CLK_ON_MASK)
> +
> +#define MCO_DISABLED(mco_id)	((CMD_CLK << CMD_SHIFT) |\
> +				 ((mco_id) << CLK_ID_SHIFT))
> +
> +/* CLK output is enable */
> +#define CLK_SRC(clk_id, sel)	((CMD_CLK << CMD_SHIFT) |\
> +				 (((clk_id) << CLK_ID_SHIFT) |\
> +				 (sel)) | CLK_ON_MASK)
> +
> +#define CLK_DISABLED(clk_id)	((CMD_CLK << CMD_SHIFT) |\
> +				 ((clk_id) << CLK_ID_SHIFT))
> +
> +#define MUX_MPU			0
> +#define MUX_AXI			1
> +#define MUX_MLAHB		2
> +#define MUX_PLL12		3
> +#define MUX_PLL3		4
> +#define MUX_PLL4		5
> +#define MUX_RTC			6
> +#define MUX_MCO1		7
> +#define MUX_MCO2		8
> +#define MUX_CKPER		9
> +#define MUX_KERNEL_BEGIN	10
> +#define MUX_ADC1		10
> +#define MUX_ADC2		11
> +#define MUX_DCMIPP		12
> +#define MUX_ETH1		13
> +#define MUX_ETH2		14
> +#define MUX_FDCAN		15
> +#define MUX_FMC			16
> +#define MUX_I2C12		17
> +#define MUX_I2C3		18
> +#define MUX_I2C4		19
> +#define MUX_I2C5		20
> +#define MUX_LPTIM1		21
> +#define MUX_LPTIM2		22
> +#define MUX_LPTIM3		23
> +#define MUX_LPTIM45		24
> +#define MUX_QSPI		25
> +#define MUX_RNG1		26
> +#define MUX_SAES		27
> +#define MUX_SAI1		28
> +#define MUX_SAI2		29
> +#define MUX_SDMMC1		30
> +#define MUX_SDMMC2		31
> +#define MUX_SPDIF		32
> +#define MUX_SPI1		33
> +#define MUX_SPI23		34
> +#define MUX_SPI4		35
> +#define MUX_SPI5		36
> +#define MUX_STGEN		37
> +#define MUX_UART1		38
> +#define MUX_UART2		39
> +#define MUX_UART35		40
> +#define MUX_UART4		41
> +#define MUX_UART6		42
> +#define MUX_UART78		43
> +#define MUX_USBO		44
> +#define MUX_USBPHY		45
> +#define MUX_MAX			46
> +
> +#define CLK_MPU_HSI		CLKSRC(MUX_MPU, 0)
> +#define CLK_MPU_HSE		CLKSRC(MUX_MPU, 1)
> +#define CLK_MPU_PLL1P		CLKSRC(MUX_MPU, 2)
> +#define CLK_MPU_PLL1P_DIV	CLKSRC(MUX_MPU, 3)
> +
> +#define CLK_AXI_HSI		CLKSRC(MUX_AXI, 0)
> +#define CLK_AXI_HSE		CLKSRC(MUX_AXI, 1)
> +#define CLK_AXI_PLL2P		CLKSRC(MUX_AXI, 2)
> +
> +#define CLK_MLAHBS_HSI		CLKSRC(MUX_MLAHB, 0)
> +#define CLK_MLAHBS_HSE		CLKSRC(MUX_MLAHB, 1)
> +#define CLK_MLAHBS_CSI		CLKSRC(MUX_MLAHB, 2)
> +#define CLK_MLAHBS_PLL3		CLKSRC(MUX_MLAHB, 3)
> +
> +#define CLK_PLL12_HSI		CLKSRC(MUX_PLL12, 0)
> +#define CLK_PLL12_HSE		CLKSRC(MUX_PLL12, 1)
> +
> +#define CLK_PLL3_HSI		CLKSRC(MUX_PLL3, 0)
> +#define CLK_PLL3_HSE		CLKSRC(MUX_PLL3, 1)
> +#define CLK_PLL3_CSI		CLKSRC(MUX_PLL3, 2)
> +
> +#define CLK_PLL4_HSI		CLKSRC(MUX_PLL4, 0)
> +#define CLK_PLL4_HSE		CLKSRC(MUX_PLL4, 1)
> +#define CLK_PLL4_CSI		CLKSRC(MUX_PLL4, 2)
> +
> +#define CLK_RTC_DISABLED	CLK_DISABLED(RTC)
> +#define CLK_RTC_LSE		CLK_SRC(RTC, 1)
> +#define CLK_RTC_LSI		CLK_SRC(RTC, 2)
> +#define CLK_RTC_HSE		CLK_SRC(RTC, 3)
> +
> +#define CLK_MCO1_HSI		CLK_SRC(CK_MCO1, 0)
> +#define CLK_MCO1_HSE		CLK_SRC(CK_MCO1, 1)
> +#define CLK_MCO1_CSI		CLK_SRC(CK_MCO1, 2)
> +#define CLK_MCO1_LSI		CLK_SRC(CK_MCO1, 3)
> +#define CLK_MCO1_LSE		CLK_SRC(CK_MCO1, 4)
> +#define CLK_MCO1_DISABLED	CLK_DISABLED(CK_MCO1)
> +
> +#define CLK_MCO2_MPU		CLK_SRC(CK_MCO2, 0)
> +#define CLK_MCO2_AXI		CLK_SRC(CK_MCO2, 1)
> +#define CLK_MCO2_MLAHB		CLK_SRC(CK_MCO2, 2)
> +#define CLK_MCO2_PLL4		CLK_SRC(CK_MCO2, 3)
> +#define CLK_MCO2_HSE		CLK_SRC(CK_MCO2, 4)
> +#define CLK_MCO2_HSI		CLK_SRC(CK_MCO2, 5)
> +#define CLK_MCO2_DISABLED	CLK_DISABLED(CK_MCO2)
> +
> +#define CLK_CKPER_HSI		CLKSRC(MUX_CKPER, 0)
> +#define CLK_CKPER_CSI		CLKSRC(MUX_CKPER, 1)
> +#define CLK_CKPER_HSE		CLKSRC(MUX_CKPER, 2)
> +#define CLK_CKPER_DISABLED	CLKSRC(MUX_CKPER, 3)
> +
> +#define CLK_I2C12_PCLK1		CLKSRC(MUX_I2C12, 0)
> +#define CLK_I2C12_PLL4R		CLKSRC(MUX_I2C12, 1)
> +#define CLK_I2C12_HSI		CLKSRC(MUX_I2C12, 2)
> +#define CLK_I2C12_CSI		CLKSRC(MUX_I2C12, 3)
> +
> +#define CLK_I2C3_PCLK6		CLKSRC(MUX_I2C3, 0)
> +#define CLK_I2C3_PLL4R		CLKSRC(MUX_I2C3, 1)
> +#define CLK_I2C3_HSI		CLKSRC(MUX_I2C3, 2)
> +#define CLK_I2C3_CSI		CLKSRC(MUX_I2C3, 3)
> +
> +#define CLK_I2C4_PCLK6		CLKSRC(MUX_I2C4, 0)
> +#define CLK_I2C4_PLL4R		CLKSRC(MUX_I2C4, 1)
> +#define CLK_I2C4_HSI		CLKSRC(MUX_I2C4, 2)
> +#define CLK_I2C4_CSI		CLKSRC(MUX_I2C4, 3)
> +
> +#define CLK_I2C5_PCLK6		CLKSRC(MUX_I2C5, 0)
> +#define CLK_I2C5_PLL4R		CLKSRC(MUX_I2C5, 1)
> +#define CLK_I2C5_HSI		CLKSRC(MUX_I2C5, 2)
> +#define CLK_I2C5_CSI		CLKSRC(MUX_I2C5, 3)
> +
> +#define CLK_SPI1_PLL4P		CLKSRC(MUX_SPI1, 0)
> +#define CLK_SPI1_PLL3Q		CLKSRC(MUX_SPI1, 1)
> +#define CLK_SPI1_I2SCKIN	CLKSRC(MUX_SPI1, 2)
> +#define CLK_SPI1_CKPER		CLKSRC(MUX_SPI1, 3)
> +#define CLK_SPI1_PLL3R		CLKSRC(MUX_SPI1, 4)
> +
> +#define CLK_SPI23_PLL4P		CLKSRC(MUX_SPI23, 0)
> +#define CLK_SPI23_PLL3Q		CLKSRC(MUX_SPI23, 1)
> +#define CLK_SPI23_I2SCKIN	CLKSRC(MUX_SPI23, 2)
> +#define CLK_SPI23_CKPER		CLKSRC(MUX_SPI23, 3)
> +#define CLK_SPI23_PLL3R		CLKSRC(MUX_SPI23, 4)
> +
> +#define CLK_SPI4_PCLK6		CLKSRC(MUX_SPI4, 0)
> +#define CLK_SPI4_PLL4Q		CLKSRC(MUX_SPI4, 1)
> +#define CLK_SPI4_HSI		CLKSRC(MUX_SPI4, 2)
> +#define CLK_SPI4_CSI		CLKSRC(MUX_SPI4, 3)
> +#define CLK_SPI4_HSE		CLKSRC(MUX_SPI4, 4)
> +#define CLK_SPI4_I2SCKIN	CLKSRC(MUX_SPI4, 5)
> +
> +#define CLK_SPI5_PCLK6		CLKSRC(MUX_SPI5, 0)
> +#define CLK_SPI5_PLL4Q		CLKSRC(MUX_SPI5, 1)
> +#define CLK_SPI5_HSI		CLKSRC(MUX_SPI5, 2)
> +#define CLK_SPI5_CSI		CLKSRC(MUX_SPI5, 3)
> +#define CLK_SPI5_HSE		CLKSRC(MUX_SPI5, 4)
> +
> +#define CLK_UART1_PCLK6		CLKSRC(MUX_UART1, 0)
> +#define CLK_UART1_PLL3Q		CLKSRC(MUX_UART1, 1)
> +#define CLK_UART1_HSI		CLKSRC(MUX_UART1, 2)
> +#define CLK_UART1_CSI		CLKSRC(MUX_UART1, 3)
> +#define CLK_UART1_PLL4Q		CLKSRC(MUX_UART1, 4)
> +#define CLK_UART1_HSE		CLKSRC(MUX_UART1, 5)
> +
> +#define CLK_UART2_PCLK6		CLKSRC(MUX_UART2, 0)
> +#define CLK_UART2_PLL3Q		CLKSRC(MUX_UART2, 1)
> +#define CLK_UART2_HSI		CLKSRC(MUX_UART2, 2)
> +#define CLK_UART2_CSI		CLKSRC(MUX_UART2, 3)
> +#define CLK_UART2_PLL4Q		CLKSRC(MUX_UART2, 4)
> +#define CLK_UART2_HSE		CLKSRC(MUX_UART2, 5)
> +
> +#define CLK_UART35_PCLK1	CLKSRC(MUX_UART35, 0)
> +#define CLK_UART35_PLL4Q	CLKSRC(MUX_UART35, 1)
> +#define CLK_UART35_HSI		CLKSRC(MUX_UART35, 2)
> +#define CLK_UART35_CSI		CLKSRC(MUX_UART35, 3)
> +#define CLK_UART35_HSE		CLKSRC(MUX_UART35, 4)
> +
> +#define CLK_UART4_PCLK1		CLKSRC(MUX_UART4, 0)
> +#define CLK_UART4_PLL4Q		CLKSRC(MUX_UART4, 1)
> +#define CLK_UART4_HSI		CLKSRC(MUX_UART4, 2)
> +#define CLK_UART4_CSI		CLKSRC(MUX_UART4, 3)
> +#define CLK_UART4_HSE		CLKSRC(MUX_UART4, 4)
> +
> +#define CLK_UART6_PCLK2		CLKSRC(MUX_UART6, 0)
> +#define CLK_UART6_PLL4Q		CLKSRC(MUX_UART6, 1)
> +#define CLK_UART6_HSI		CLKSRC(MUX_UART6, 2)
> +#define CLK_UART6_CSI		CLKSRC(MUX_UART6, 3)
> +#define CLK_UART6_HSE		CLKSRC(MUX_UART6, 4)
> +
> +#define CLK_UART78_PCLK1	CLKSRC(MUX_UART78, 0)
> +#define CLK_UART78_PLL4Q	CLKSRC(MUX_UART78, 1)
> +#define CLK_UART78_HSI		CLKSRC(MUX_UART78, 2)
> +#define CLK_UART78_CSI		CLKSRC(MUX_UART78, 3)
> +#define CLK_UART78_HSE		CLKSRC(MUX_UART78, 4)
> +
> +#define CLK_LPTIM1_PCLK1	CLKSRC(MUX_LPTIM1, 0)
> +#define CLK_LPTIM1_PLL4P	CLKSRC(MUX_LPTIM1, 1)
> +#define CLK_LPTIM1_PLL3Q	CLKSRC(MUX_LPTIM1, 2)
> +#define CLK_LPTIM1_LSE		CLKSRC(MUX_LPTIM1, 3)
> +#define CLK_LPTIM1_LSI		CLKSRC(MUX_LPTIM1, 4)
> +#define CLK_LPTIM1_CKPER	CLKSRC(MUX_LPTIM1, 5)
> +
> +#define CLK_LPTIM2_PCLK3	CLKSRC(MUX_LPTIM2, 0)
> +#define CLK_LPTIM2_PLL4Q	CLKSRC(MUX_LPTIM2, 1)
> +#define CLK_LPTIM2_CKPER	CLKSRC(MUX_LPTIM2, 2)
> +#define CLK_LPTIM2_LSE		CLKSRC(MUX_LPTIM2, 3)
> +#define CLK_LPTIM2_LSI		CLKSRC(MUX_LPTIM2, 4)
> +
> +#define CLK_LPTIM3_PCLK3	CLKSRC(MUX_LPTIM3, 0)
> +#define CLK_LPTIM3_PLL4Q	CLKSRC(MUX_LPTIM3, 1)
> +#define CLK_LPTIM3_CKPER	CLKSRC(MUX_LPTIM3, 2)
> +#define CLK_LPTIM3_LSE		CLKSRC(MUX_LPTIM3, 3)
> +#define CLK_LPTIM3_LSI		CLKSRC(MUX_LPTIM3, 4)
> +
> +#define CLK_LPTIM45_PCLK3	CLKSRC(MUX_LPTIM45, 0)
> +#define CLK_LPTIM45_PLL4P	CLKSRC(MUX_LPTIM45, 1)
> +#define CLK_LPTIM45_PLL3Q	CLKSRC(MUX_LPTIM45, 2)
> +#define CLK_LPTIM45_LSE		CLKSRC(MUX_LPTIM45, 3)
> +#define CLK_LPTIM45_LSI		CLKSRC(MUX_LPTIM45, 4)
> +#define CLK_LPTIM45_CKPER	CLKSRC(MUX_LPTIM45, 5)
> +
> +#define CLK_SAI1_PLL4Q		CLKSRC(MUX_SAI1, 0)
> +#define CLK_SAI1_PLL3Q		CLKSRC(MUX_SAI1, 1)
> +#define CLK_SAI1_I2SCKIN	CLKSRC(MUX_SAI1, 2)
> +#define CLK_SAI1_CKPER		CLKSRC(MUX_SAI1, 3)
> +#define CLK_SAI1_PLL3R		CLKSRC(MUX_SAI1, 4)
> +
> +#define CLK_SAI2_PLL4Q		CLKSRC(MUX_SAI2, 0)
> +#define CLK_SAI2_PLL3Q		CLKSRC(MUX_SAI2, 1)
> +#define CLK_SAI2_I2SCKIN	CLKSRC(MUX_SAI2, 2)
> +#define CLK_SAI2_CKPER		CLKSRC(MUX_SAI2, 3)
> +#define CLK_SAI2_SPDIF		CLKSRC(MUX_SAI2, 4)
> +#define CLK_SAI2_PLL3R		CLKSRC(MUX_SAI2, 5)
> +
> +#define CLK_FDCAN_HSE		CLKSRC(MUX_FDCAN, 0)
> +#define CLK_FDCAN_PLL3Q		CLKSRC(MUX_FDCAN, 1)
> +#define CLK_FDCAN_PLL4Q		CLKSRC(MUX_FDCAN, 2)
> +#define CLK_FDCAN_PLL4R		CLKSRC(MUX_FDCAN, 3)
> +
> +#define CLK_SPDIF_PLL4P		CLKSRC(MUX_SPDIF, 0)
> +#define CLK_SPDIF_PLL3Q		CLKSRC(MUX_SPDIF, 1)
> +#define CLK_SPDIF_HSI		CLKSRC(MUX_SPDIF, 2)
> +
> +#define CLK_ADC1_PLL4R		CLKSRC(MUX_ADC1, 0)
> +#define CLK_ADC1_CKPER		CLKSRC(MUX_ADC1, 1)
> +#define CLK_ADC1_PLL3Q		CLKSRC(MUX_ADC1, 2)
> +
> +#define CLK_ADC2_PLL4R		CLKSRC(MUX_ADC2, 0)
> +#define CLK_ADC2_CKPER		CLKSRC(MUX_ADC2, 1)
> +#define CLK_ADC2_PLL3Q		CLKSRC(MUX_ADC2, 2)
> +
> +#define CLK_SDMMC1_HCLK6	CLKSRC(MUX_SDMMC1, 0)
> +#define CLK_SDMMC1_PLL3R	CLKSRC(MUX_SDMMC1, 1)
> +#define CLK_SDMMC1_PLL4P	CLKSRC(MUX_SDMMC1, 2)
> +#define CLK_SDMMC1_HSI		CLKSRC(MUX_SDMMC1, 3)
> +
> +#define CLK_SDMMC2_HCLK6	CLKSRC(MUX_SDMMC2, 0)
> +#define CLK_SDMMC2_PLL3R	CLKSRC(MUX_SDMMC2, 1)
> +#define CLK_SDMMC2_PLL4P	CLKSRC(MUX_SDMMC2, 2)
> +#define CLK_SDMMC2_HSI		CLKSRC(MUX_SDMMC2, 3)
> +
> +#define CLK_ETH1_PLL4P		CLKSRC(MUX_ETH1, 0)
> +#define CLK_ETH1_PLL3Q		CLKSRC(MUX_ETH1, 1)
> +
> +#define CLK_ETH2_PLL4P		CLKSRC(MUX_ETH2, 0)
> +#define CLK_ETH2_PLL3Q		CLKSRC(MUX_ETH2, 1)
> +
> +#define CLK_USBPHY_HSE		CLKSRC(MUX_USBPHY, 0)
> +#define CLK_USBPHY_PLL4R	CLKSRC(MUX_USBPHY, 1)
> +#define CLK_USBPHY_HSE_DIV2	CLKSRC(MUX_USBPHY, 2)
> +
> +#define CLK_USBO_PLL4R		CLKSRC(MUX_USBO, 0)
> +#define CLK_USBO_USBPHY		CLKSRC(MUX_USBO, 1)
> +
> +#define CLK_QSPI_ACLK		CLKSRC(MUX_QSPI, 0)
> +#define CLK_QSPI_PLL3R		CLKSRC(MUX_QSPI, 1)
> +#define CLK_QSPI_PLL4P		CLKSRC(MUX_QSPI, 2)
> +#define CLK_QSPI_CKPER		CLKSRC(MUX_QSPI, 3)
> +
> +#define CLK_FMC_ACLK		CLKSRC(MUX_FMC, 0)
> +#define CLK_FMC_PLL3R		CLKSRC(MUX_FMC, 1)
> +#define CLK_FMC_PLL4P		CLKSRC(MUX_FMC, 2)
> +#define CLK_FMC_CKPER		CLKSRC(MUX_FMC, 3)
> +
> +#define CLK_RNG1_CSI		CLKSRC(MUX_RNG1, 0)
> +#define CLK_RNG1_PLL4R		CLKSRC(MUX_RNG1, 1)
> +/* WARNING: POSITION 2 OF RNG1 MUX IS RESERVED */
> +#define CLK_RNG1_LSI		CLKSRC(MUX_RNG1, 3)
> +
> +#define CLK_STGEN_HSI		CLKSRC(MUX_STGEN, 0)
> +#define CLK_STGEN_HSE		CLKSRC(MUX_STGEN, 1)
> +
> +#define CLK_DCMIPP_ACLK		CLKSRC(MUX_DCMIPP, 0)
> +#define CLK_DCMIPP_PLL2Q	CLKSRC(MUX_DCMIPP, 1)
> +#define CLK_DCMIPP_PLL4P	CLKSRC(MUX_DCMIPP, 2)
> +#define CLK_DCMIPP_CKPER	CLKSRC(MUX_DCMIPP, 3)
> +
> +#define CLK_SAES_AXI		CLKSRC(MUX_SAES, 0)
> +#define CLK_SAES_CKPER		CLKSRC(MUX_SAES, 1)
> +#define CLK_SAES_PLL4R		CLKSRC(MUX_SAES, 2)
> +#define CLK_SAES_LSI		CLKSRC(MUX_SAES, 3)
> +
> +/* PLL output is enable when x=1, with x=p,q or r */
> +#define PQR(p, q, r)	(((p) & 1) | (((q) & 1) << 1) | (((r) & 1) << 2))
> +
> +/* define for st,pll /csg */
> +#define SSCG_MODE_CENTER_SPREAD	0
> +#define SSCG_MODE_DOWN_SPREAD	1
> +
> +/* define for st,drive */
> +#define LSEDRV_LOWEST		0
> +#define LSEDRV_MEDIUM_LOW	1
> +#define LSEDRV_MEDIUM_HIGH	2
> +#define LSEDRV_HIGHEST		3
> +
> +#endif
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
