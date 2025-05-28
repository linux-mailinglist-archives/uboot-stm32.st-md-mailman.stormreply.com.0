Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67213AC6251
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 May 2025 08:47:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E5D2C36B2B;
	Wed, 28 May 2025 06:47:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3BE3C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 06:47:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S10wUH023635;
 Wed, 28 May 2025 08:47:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 N/xzrcAbalkFsaHw6EPaPziKtcfEzNMqbAMoVUOVLsY=; b=R12fZkpofHeV0Vad
 PLhe0PIEPP+WqJPS+XFjO7W6GDrtLqlQ/a4lyPD1ehlzKr0D5h6yZ4JfkxmNqc4N
 E6eT8wQ6KXa6pGRiwgcVK+DyrM4Trv5+FWDZAC/1pprS2zv56lRNfb1YUU9u6QYc
 /qyHzR/rqpPiqdYvKMM5wn9z/KPaQ8Q9qbKPj/md6wbTKmQj+/KaeV9TQF0fTnZx
 Y2/BOR449upc0zMxlqNa/IDNMtFCg21aC6ZyuJjVlBDZLF2hQZ+BRdNSv11mn3wm
 y7+lYLxGc+trBgnEU0Ng/Rk8Y3Q2dbZNcLaRVsQb1s7BzNeZoWvP7/TfuNw8x72A
 vtVtEg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk7rve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 08:47:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C2C034007D;
 Wed, 28 May 2025 08:45:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF680B2342F;
 Wed, 28 May 2025 08:44:26 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 08:44:26 +0200
Message-ID: <54a67b9d-11d7-4028-a225-26b13146ed1b@foss.st.com>
Date: Wed, 28 May 2025 08:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-10-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250512172149.150214-10-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 09/10] ARM: dts: stm32: Add SPL specifics
 for DH STM32MP13xx DHCOR DHSBC
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



On 5/12/25 19:21, Marek Vasut wrote:
> Add SPL specific DT additions to DH STM32MP13xx DHCOR DHSBC . These
> include I2C3 configuration which is required to access the PMIC,
> PMIC regulator and QSPI NOR bootph-all properties to allow SPL to
> configure PMIC buck regulators and load from QSPI NOR respectively,
> etzpc bus switch to simple-bus to prevent interference from TFABOOT
> specific configuration, and RCC configuration to define clock tree
> configuration used by this platform.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Cheick Traore <cheick.traore@foss.st.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi | 155 ++++++++++++++++++++-
>  1 file changed, 154 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> index 6117da10bbf..b5952637442 100644
> --- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2024 Marek Vasut <marex@denx.de>
>   */
>  
> +#include <dt-bindings/clock/stm32mp13-clksrc.h>
>  #include "stm32mp13-u-boot.dtsi"
>  #include "stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi"
>  
> @@ -19,8 +20,12 @@
>  	};
>  };
>  
> +&etzpc {
> +	compatible = "simple-bus";
> +};
> +
>  &flash0 {
> -	bootph-pre-ram;
> +	bootph-all;
>  
>  	partitions {
>  		compatible = "fixed-partitions";
> @@ -49,6 +54,134 @@
>  	};
>  };
>  
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins_a>;
> +};
> +
> +&qspi {
> +	bootph-all;
> +};
> +
> +&qspi_clk_pins_a {
> +	bootph-all;
> +	pins {
> +		bootph-all;
> +	};
> +};
> +
> +&qspi_bk1_pins_a {
> +	bootph-all;
> +	pins {
> +		bootph-all;
> +	};
> +};
> +
> +&qspi_cs1_pins_a {
> +	bootph-all;
> +	pins {
> +		bootph-all;
> +	};
> +};
> +
> +&pinctrl {
> +	bootph-all;
> +	i2c3_pins_a: i2c3-0 {
> +	        bootph-all;
> +		pins {
> +			bootph-all;
> +			pinmux = <STM32_PINMUX('B', 8, AF5)>, /* I2C3_SCL */
> +				 <STM32_PINMUX('H', 14, AF4)>; /* I2C3_SDA */
> +			bias-disable;
> +			drive-open-drain;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
> +&rcc {
> +	clocks = <&clk_hse>, <&clk_hsi>, <&clk_csi>, <&clk_lse>, <&clk_lsi>;
> +
> +	st,clksrc = <
> +		CLK_MPU_PLL1P
> +		CLK_AXI_PLL2P
> +		CLK_MLAHBS_PLL3
> +		CLK_PLL12_HSE
> +		CLK_PLL3_HSE
> +		CLK_PLL4_HSE
> +		CLK_CKPER_HSE
> +		CLK_RTC_LSE
> +		CLK_MCO1_LSI
> +		CLK_MCO2_HSI
> +	>;
> +
> +	st,clkdiv = <
> +		0 /*AXI*/
> +		0 /*MLHAB*/
> +		1 /*APB1*/
> +		1 /*APB2*/
> +		1 /*APB3*/
> +		1 /*APB4*/
> +		2 /*APB5*/
> +		1 /*APB6*/
> +		0 /*RTC*/
> +	>;
> +
> +	st,pkcs = <
> +		CLK_I2C12_HSI
> +		CLK_I2C3_HSI
> +		CLK_QSPI_PLL3R
> +		CLK_SAES_AXI
> +		CLK_SDMMC1_PLL3R
> +		CLK_SDMMC2_PLL3R
> +		CLK_STGEN_HSE
> +		CLK_UART2_HSI
> +		CLK_UART4_HSI
> +		CLK_USBO_USBPHY
> +		CLK_USBPHY_HSE
> +	>;
> +
> +	/*
> +	 * cfg = < DIVM1 DIVN P Q R PQR(p,q,r) >;
> +	 * frac = < f >;
> +	 *
> +	 * PRQ(p,q,r) ... for p,q,r: 0-output disabled / 1-output enabled
> +	 * DIVN ... actually multiplier, but RCC_PLL1CFGR1 calls the field DIVN
> +	 * m ... for PLL1,2: m=2 ; for PLL3,4: m=1
> +	 * XTAL = 24 MHz
> +	 *
> +	 * VCO = ( XTAL / (DIVM1 + 1) ) * m * ( DIVN + 1 + ( f / 8192 ) )
> +	 *   P = VCO / (P + 1)
> +	 *   Q = VCO / (Q + 1)
> +	 *   R = VCO / (R + 1)
> +	 */
> +
> +	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 266, R = 533 (DDR) */
> +	pll2: st,pll@1 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <1>;
> +		cfg = < 2 65 1 1 0 PQR(1,1,1) >;
> +		frac = < 0x1400 >;
> +		bootph-all;
> +	};
> +
> +	/* VCO = 600 MHz => P = 200, Q = 150, R = 200 */
> +	pll3: st,pll@2 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <2>;
> +		cfg = < 2 74 2 3 2 PQR(1,1,1) >;
> +		bootph-all;
> +	};
> +
> +	/* VCO = 750.0 MHz => P = 125, Q = 83, R = 75 */
> +	pll4: st,pll@3 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <3>;
> +		cfg = < 3 124 5 8 9 PQR(1,1,1) >;
> +		bootph-all;
> +	};
> +};
> +
>  &sdmmc1 {
>  	status = "disabled";
>  };
> @@ -56,3 +189,23 @@
>  &usbotg_hs {
>  	u-boot,force-b-session-valid;
>  };
> +
> +&vddcpu {
> +	bootph-all;
> +};
> +
> +&vdd_ddr {
> +	bootph-all;
> +};
> +
> +&vdd {
> +	bootph-all;
> +};
> +
> +&vddcore {
> +	bootph-all;
> +};
> +
> +&vref_ddr {
> +	bootph-all;
> +};
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
