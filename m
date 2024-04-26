Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2911F8B320D
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 10:11:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA8DAC71292;
	Fri, 26 Apr 2024 08:11:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D23B2C71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 08:11:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q1bxNd032319;
 Fri, 26 Apr 2024 10:10:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=POKq1+VDahlvoZDRI8E2sLiv12jSjBhpszteObYIos8=; b=FV
 sa+A/fS0XdwmBjX7iIw9V+xPiBvTr/Ld7ipR7K4ZYZI5bRg1YJWaGXnVSiKQV3SC
 b2YB6QnvdbdKIT+tOcX2qwfU3he4qLYGtV8xctTYxqZIYmwSeLYF3tYbBOGCFLKU
 in7OB7Z6yfJg1vYutjIoVsG+f35XyvUIYeePcwYSCpNAh/Z4gFn1SUBHD1EbrQQl
 YFU3XkFgzc6cP7pVfyT0qALPFdWzqrp1CEiNNkctSaWoVCFGhAqkhsZUd/9oG9h6
 6NytbUzcZr2/aMYMa5JcR5hke9tjQ6TgbMWd4+WpfZZyYjnR1TAYsajpQ8tl+mjg
 Y3Lm8LJ90v9ms0HFsolA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4kbgnsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 10:10:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BEA5B40045;
 Fri, 26 Apr 2024 10:10:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E798B214546;
 Fri, 26 Apr 2024 10:10:36 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 10:10:36 +0200
Message-ID: <190e501b-d986-437e-aeb3-af2df3c1610d@foss.st.com>
Date: Fri, 26 Apr 2024 10:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240421231849.194648-1-marex@denx.de>
 <20240421231849.194648-19-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240421231849.194648-19-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 19/19] ARM: dts: stm32: Add support for
 STM32MP13xx DHCOR SoM and DHSBC board
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



On 4/22/24 01:17, Marek Vasut wrote:
> This stm32mp135f-dhcor-dhsbc board is a stack of DHCOR SoM based on
> STM32MP135F SoC (900MHz / crypto capabilities) populated on DHSBC
> carrier board.
> 
> The SoM contains the following peripherals:
> - STPMIC (power delivery)
> - 512MB DDR3L memory
> - eMMC and SDIO WiFi module
> 
> The DHSBC carrier board contains the following peripherals:
> - Two RGMII Ethernet ports
> - USB-A Host port, USB-C peripheral port, USB-C power supply plug
> - Expansion connector
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/Makefile                         |   1 +
>  .../dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi   |  25 ++
>  arch/arm/dts/stm32mp135f-dhcor-dhsbc.dts      | 383 ++++++++++++++++++
>  arch/arm/dts/stm32mp13xx-dhcor-som.dtsi       | 308 ++++++++++++++
>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi    |  55 +++
>  configs/stm32mp13_dhcor_defconfig             | 148 +++++++
>  6 files changed, 920 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp135f-dhcor-dhsbc.dts
>  create mode 100644 arch/arm/dts/stm32mp13xx-dhcor-som.dtsi
>  create mode 100644 arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>  create mode 100644 configs/stm32mp13_dhcor_defconfig
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index b1c9c6222e5..ca1e3bf3fc8 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -1290,6 +1290,7 @@ dtb-$(CONFIG_ASPEED_AST2600) += \
>  dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
>  
>  dtb-$(CONFIG_STM32MP13X) += \
> +	stm32mp135f-dhcor-dhsbc.dtb \
>  	stm32mp135f-dk.dtb
>  
>  dtb-$(CONFIG_STM32MP15X) += \
> diff --git a/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
> new file mode 100644
> index 00000000000..d718aae16ca
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2024 Marek Vasut <marex@denx.de>
> + */
> +
> +#include "stm32mp13xx-dhcor-u-boot.dtsi"
> +
> +&uart4 {
> +	bootph-all;
> +};
> +
> +&uart4_pins_b {
> +	bootph-all;
> +
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};
> +
> +&usbphyc {
> +	bootph-all;
> +};
> diff --git a/arch/arm/dts/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/dts/stm32mp135f-dhcor-dhsbc.dts
> new file mode 100644
> index 00000000000..fc1c48ad56d
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp135f-dhcor-dhsbc.dts
> @@ -0,0 +1,383 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2024 Marek Vasut <marex@denx.de>
> + *
> + * DHCOR STM32MP13 variant:
> + * DHCR-STM32MP135F-C100-R051-EE-F0409-SPI4-RTC-WBT-I-01LG
> + * DHCOR PCB number: 718-100 or newer
> + * DHSBC PCB number: 719-100 or newer
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/regulator/st,stm32mp13-regulator.h>
> +#include "stm32mp135.dtsi"
> +#include "stm32mp13xf.dtsi"
> +#include "stm32mp13xx-dhcor-som.dtsi"
> +
> +/ {
> +	model = "DH electronics STM32MP135F DHCOR DHSBC";
> +	compatible = "dh,stm32mp135f-dhcor-dhsbc",
> +		     "dh,stm32mp135f-dhcor-som",
> +		     "st,stm32mp135";
> +
> +	aliases {
> +		ethernet0 = &eth1;
> +		ethernet1 = &eth2;
> +		serial2 = &usart1;
> +		serial3 = &usart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&adc_1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&adc1_pins_a &adc1_usb_cc_pins_b>;
> +	vdda-supply = <&vdd_adc>;
> +	vref-supply = <&vdd_adc>;
> +	status = "okay";
> +
> +	adc1: adc@0 {
> +		status = "okay";
> +
> +		/*
> +		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in2 & in11.
> +		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
> +		 * 5 * (5.1 + 47kOhms) * 5pF => 1.3us.
> +		 * Use arbitrary margin here (e.g. 5us).
> +		 *
> +		 * The pinmux pins must be set as ANALOG, use datasheet
> +		 * DS13483 Table 7. STM32MP135C/F ball definitions to
> +		 * find out which 'pin name' maps to which 'additional
> +		 * functions', which lists the mapping between pin and
> +		 * ADC channel. In this case, PA5 maps to ADC1_INP2 and
> +		 * PF13 maps to ADC1_INP11 .
> +		 */
> +		channel@2 {
> +			reg = <2>;
> +			st,min-sample-time-ns = <5000>;
> +		};
> +
> +		channel@11 {
> +			reg = <11>;
> +			st,min-sample-time-ns = <5000>;
> +		};
> +
> +		/* Expansion connector: INP12:pin29 */
> +		channel@12 {
> +			reg = <12>;
> +			st,min-sample-time-ns = <5000>;
> +		};
> +	};
> +};
> +
> +&eth1 {
> +	status = "okay";
> +	pinctrl-0 = <&eth1_rgmii_pins_a>;
> +	pinctrl-1 = <&eth1_rgmii_sleep_pins_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +	st,ext-phyclk;
> +	nvmem-cells = <&ethernet_mac1_address>;
> +	nvmem-cell-names = "mac-address";
> +
> +	mdio1 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +
> +		ethphy1: ethernet-phy@1 {
> +			/* RTL8211F */
> +			compatible = "ethernet-phy-id001c.c916",
> +				     "ethernet-phy-ieee802.3-c22";
> +			interrupt-parent = <&gpiog>;
> +			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
> +			reg = <1>;
> +			reset-assert-us = <15000>;
> +			reset-deassert-us = <55000>;
> +			reset-gpios = <&gpioa 11 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&eth2 {
> +	status = "okay";
> +	pinctrl-0 = <&eth2_rgmii_pins_a>;
> +	pinctrl-1 = <&eth2_rgmii_sleep_pins_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy2>;
> +	st,ext-phyclk;
> +	nvmem-cells = <&ethernet_mac2_address>;
> +	nvmem-cell-names = "mac-address";
> +
> +	mdio1 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +
> +		ethphy2: ethernet-phy@1 {
> +			/* RTL8211F */
> +			compatible = "ethernet-phy-id001c.c916",
> +				     "ethernet-phy-ieee802.3-c22";
> +			interrupt-parent = <&gpiog>;
> +			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +			reg = <1>;
> +			reset-assert-us = <15000>;
> +			reset-deassert-us = <55000>;
> +			reset-gpios = <&gpiog 8 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&gpioa {
> +	gpio-line-names = "", "", "", "",
> +			  "", "DHSBC_USB_PWR_CC1", "", "",
> +			  "", "", "", "DHSBC_nETH1_RST",
> +			  "", "DHCOR_HW-CODING_0", "", "";
> +};
> +
> +&gpiob {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "DHCOR_BT_HOST_WAKE",
> +			  "", "", "", "",
> +			  "", "DHSBC_nTPM_CS", "", "";
> +};
> +
> +&gpioc {
> +	gpio-line-names = "", "", "", "DHSBC_USB_5V_MEAS",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "";
> +};
> +
> +&gpiod {
> +	gpio-line-names = "", "", "", "",
> +			  "", "DHCOR_RAM-CODING_0", "", "",
> +			  "", "DHCOR_RAM-CODING_1", "", "",
> +			  "", "", "", "";
> +};
> +
> +&gpioe {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "",
> +			  "", "DHSBC_nTPM_RST", "", "",
> +			  "DHSBC_nTPM_PIRQ", "", "DHCOR_WL_HOST_WAKE", "";
> +};
> +
> +&gpiof {
> +	gpio-line-names = "", "", "DHSBC_USB_PWR_nFLT", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "DHCOR_WL_REG_ON", "DHSBC_USB_PWR_CC2", "", "";
> +};
> +
> +&gpiog {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "",
> +			  "DHSBC_nETH2_RST", "DHCOR_BT_DEV_WAKE", "", "",
> +			  "DHSBC_ETH1_INTB", "", "", "DHSBC_ETH2_INTB";
> +};
> +
> +&gpioi {
> +	gpio-line-names = "DHCOR_RTC_nINT", "DHCOR_HW-CODING_1",
> +			  "DHCOR_BT_REG_ON", "DHCOR_PMIC_nINT",
> +			  "DHSBC_BOOT0", "DHSBC_BOOT1",
> +			  "DHSBC_BOOT2", "DHSBC_USB-C_DATA_VBUS";
> +};
> +
> +&i2c1 { /* Expansion connector: SDA:pin27 SCL:pin28 */
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c1_pins_a>;
> +	pinctrl-1 = <&i2c1_sleep_pins_a>;
> +	i2c-scl-rising-time-ns = <96>;
> +	i2c-scl-falling-time-ns = <3>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +};
> +
> +&i2c5 { /* Expansion connector: SDA:pin3 SCL:pin5 */
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c5_pins_b>;
> +	pinctrl-1 = <&i2c5_sleep_pins_b>;
> +	i2c-scl-rising-time-ns = <96>;
> +	i2c-scl-falling-time-ns = <3>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +};
> +
> +&m_can1 { /* Expansion connector: TX:pin16 RX:pin18 */
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&m_can1_pins_a>;
> +	pinctrl-1 = <&m_can1_sleep_pins_a>;
> +	status = "okay";
> +};
> +
> +&m_can2 { /* Expansion connector: TX:pin22 RX:pin26 */
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&m_can2_pins_a>;
> +	pinctrl-1 = <&m_can2_sleep_pins_a>;
> +	status = "okay";
> +};
> +
> +&pwr_regulators {
> +	vdd-supply = <&vdd>;
> +	vdd_3v3_usbfs-supply = <&vdd_usb>;
> +	status = "okay";
> +};
> +
> +&sai1 { /* Expansion connector: SCK-A:pin12 FS-A:pin35 SD-A:pin38 SD-B:pin40 */
> +	clocks = <&rcc SAI1>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
> +	clock-names = "pclk", "x8k", "x11k";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sai1a_pins_a &sai1b_pins_a>;
> +	pinctrl-1 = <&sai1a_sleep_pins_a &sai1b_sleep_pins_a>;
> +};
> +
> +&scmi_voltd {
> +	status = "disabled";
> +};
> +
> +&spi2 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&spi2_pins_a>;
> +	pinctrl-1 = <&spi2_sleep_pins_a>;
> +	cs-gpios = <&gpiob 13 0>;
> +	status = "okay";
> +
> +	st33htph: tpm@0 {
> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
> +		reg = <0>;
> +		spi-max-frequency = <24000000>;
> +	};
> +};
> +
> +&spi3 { /* Expansion connector: MOSI:pin19 MISO:pin21 SCK:pin22 nCS:pin24 */
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&spi3_pins_a>;
> +	pinctrl-1 = <&spi3_sleep_pins_a>;
> +	cs-gpios = <&gpiof 3 0>;
> +	status = "disabled";
> +};
> +
> +&timers5 { /* Expansion connector: CH3:pin31 */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "okay";
> +
> +	pwm {
> +		pinctrl-0 = <&pwm5_pins_a>;
> +		pinctrl-1 = <&pwm5_sleep_pins_a>;
> +		pinctrl-names = "default", "sleep";
> +		status = "okay";
> +	};
> +	timer@4 {
> +		status = "okay";
> +	};
> +};
> +
> +&timers13 { /* Expansion connector: CH1:pin32 */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "okay";
> +
> +	pwm {
> +		pinctrl-0 = <&pwm13_pins_a>;
> +		pinctrl-1 = <&pwm13_sleep_pins_a>;
> +		pinctrl-names = "default", "sleep";
> +		status = "okay";
> +	};
> +	timer@12 {
> +		status = "okay";
> +	};
> +};
> +
> +&usart1 { /* Expansion connector: RX:pin33 TX:pin37 */
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&usart1_pins_b>;
> +	pinctrl-1 = <&usart1_sleep_pins_b>;
> +	pinctrl-2 = <&usart1_idle_pins_b>;
> +	status = "okay";
> +};
> +
> +&usart2 { /* Expansion connector: RX:pin10 TX:pin8 RTS:pin11 CTS:pin36 */
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&usart2_pins_b>;
> +	pinctrl-1 = <&usart2_sleep_pins_b>;
> +	pinctrl-2 = <&usart2_idle_pins_b>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&usbh_ehci {
> +	phys = <&usbphyc_port0>;
> +	status = "okay";
> +};
> +
> +&usbh_ohci {
> +	phys = <&usbphyc_port0>;
> +	status = "okay";
> +};
> +
> +&usbotg_hs {
> +	dr_mode = "peripheral";
> +	phys = <&usbphyc_port1 0>;
> +	phy-names = "usb2-phy";
> +	usb33d-supply = <&usb33>;
> +	status = "okay";
> +};
> +
> +&usbphyc {
> +	status = "okay";
> +	vdda1v1-supply = <&reg11>;
> +	vdda1v8-supply = <&reg18>;
> +};
> +
> +&usbphyc_port0 {
> +	phy-supply = <&vdd_usb>;
> +	st,current-boost-microamp = <1000>;
> +	st,decrease-hs-slew-rate;
> +	st,tune-hs-dc-level = <2>;
> +	st,enable-hs-rftime-reduction;
> +	st,trim-hs-current = <11>;
> +	st,trim-hs-impedance = <2>;
> +	st,tune-squelch-level = <1>;
> +	st,enable-hs-rx-gain-eq;
> +	st,no-hs-ftime-ctrl;
> +	st,no-lsfs-sc;
> +	connector {
> +		compatible = "usb-a-connector";
> +		vbus-supply = <&vbus_sw>;
> +	};
> +};
> +
> +&usbphyc_port1 {
> +	phy-supply = <&vdd_usb>;
> +	st,current-boost-microamp = <1000>;
> +	st,decrease-hs-slew-rate;
> +	st,tune-hs-dc-level = <2>;
> +	st,enable-hs-rftime-reduction;
> +	st,trim-hs-current = <11>;
> +	st,trim-hs-impedance = <2>;
> +	st,tune-squelch-level = <1>;
> +	st,enable-hs-rx-gain-eq;
> +	st,no-hs-ftime-ctrl;
> +	st,no-lsfs-sc;
> +	connector {
> +		compatible = "gpio-usb-b-connector", "usb-b-connector";
> +		vbus-gpios = <&gpioi 7 GPIO_ACTIVE_HIGH>;
> +		label = "Type-C";
> +		self-powered;
> +		type = "micro";
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-som.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-som.dtsi
> new file mode 100644
> index 00000000000..ddad6497775
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp13xx-dhcor-som.dtsi
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2024 Marek Vasut <marex@denx.de>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/mfd/st,stpmic1.h>
> +#include <dt-bindings/regulator/st,stm32mp13-regulator.h>
> +#include "stm32mp13-pinctrl.dtsi"
> +
> +/ {
> +	model = "DH electronics STM32MP13xx DHCOR SoM";
> +	compatible = "dh,stm32mp131a-dhcor-som",
> +		     "st,stm32mp131";
> +
> +	aliases {
> +		mmc0 = &sdmmc2;
> +		mmc1 = &sdmmc1;
> +		serial0 = &uart4;
> +		serial1 = &uart7;
> +		rtc0 = &rv3032;
> +		spi0 = &qspi;
> +	};
> +
> +	memory@c0000000 {
> +		device_type = "memory";
> +		reg = <0xc0000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		optee@dd000000 {
> +			reg = <0xdd000000 0x3000000>;
> +			no-map;
> +		};
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpiof 12 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	vin: vin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vin";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&i2c3 {
> +	i2c-scl-rising-time-ns = <96>;
> +	i2c-scl-falling-time-ns = <3>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +
> +	pmic: stpmic@33 {
> +		compatible = "st,stpmic1";
> +		reg = <0x33>;
> +		interrupts-extended = <&gpioi 3 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		status = "okay";
> +
> +		regulators {
> +			compatible = "st,stpmic1-regulators";
> +
> +			ldo1-supply = <&vin>;
> +			ldo2-supply = <&vin>;
> +			ldo3-supply = <&vin>;
> +			ldo4-supply = <&vin>;
> +			ldo5-supply = <&vin>;
> +			ldo6-supply = <&vin>;
> +			pwr_sw1-supply = <&bst_out>;
> +			pwr_sw2-supply = <&bst_out>;
> +
> +			vddcpu: buck1 { /* VDD_CPU_1V2 */
> +				regulator-name = "vddcpu";
> +				regulator-min-microvolt = <1250000>;
> +				regulator-max-microvolt = <1250000>;
> +				regulator-always-on;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd_ddr: buck2 { /* VDD_DDR_1V35 */
> +				regulator-name = "vdd_ddr";
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-always-on;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd: buck3 { /* VDD_3V3_1V8 */
> +				regulator-name = "vdd";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vddcore: buck4 { /* VDD_CORE_1V2 */
> +				regulator-name = "vddcore";
> +				regulator-min-microvolt = <1250000>;
> +				regulator-max-microvolt = <1250000>;
> +				regulator-always-on;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd_adc: ldo1 { /* VDD_ADC_1V8 */
> +				regulator-name = "vdd_adc";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				interrupts = <IT_CURLIM_LDO1 0>;
> +			};
> +
> +			vdd_ldo2: ldo2 { /* LDO2_OUT_1V8 */
> +				regulator-name = "vdd_ldo2";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				interrupts = <IT_CURLIM_LDO2 0>;
> +			};
> +
> +			vdd_ldo3: ldo3 { /* LDO3_OUT */
> +				regulator-name = "vdd_ldo3";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				interrupts = <IT_CURLIM_LDO3 0>;
> +			};
> +
> +			vdd_usb: ldo4 { /* VDD_USB_3V3 */
> +				regulator-name = "vdd_usb";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				interrupts = <IT_CURLIM_LDO4 0>;
> +			};
> +
> +			vdd_sd: ldo5 { /* VDD_SD_3V3_1V8 */
> +				regulator-name = "vdd_sd";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				interrupts = <IT_CURLIM_LDO5 0>;
> +			};
> +
> +			vdd_sd2: ldo6 { /* VDD_SD2_3V3_1V8 */
> +				regulator-name = "vdd_sd2";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				interrupts = <IT_CURLIM_LDO6 0>;
> +			};
> +
> +			vref_ddr: vref_ddr { /* VREF_DDR_0V675 */
> +				regulator-name = "vref_ddr";
> +				regulator-always-on;
> +			};
> +
> +			bst_out: boost { /* BST_OUT_5V2 */
> +				regulator-name = "bst_out";
> +			};
> +
> +			vbus_otg: pwr_sw1 {
> +				regulator-name = "vbus_otg";
> +				interrupts = <IT_OCP_OTG 0>;
> +			};
> +
> +			vbus_sw: pwr_sw2 {
> +				regulator-name = "vbus_sw";
> +				interrupts = <IT_OCP_SWOUT 0>;
> +				regulator-active-discharge = <1>;
> +			};
> +		};
> +
> +		onkey {
> +			compatible = "st,stpmic1-onkey";
> +			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
> +			interrupt-names = "onkey-falling", "onkey-rising";
> +			status = "okay";
> +		};
> +
> +		watchdog {
> +			compatible = "st,stpmic1-wdt";
> +			status = "disabled";
> +		};
> +	};
> +
> +	eeprom0: eeprom@50 {
> +		compatible = "atmel,24c256";	/* ST M24256 */
> +		reg = <0x50>;
> +		pagesize = <64>;
> +	};
> +
> +	rv3032: rtc@51 {
> +		compatible = "microcrystal,rv3032";
> +		reg = <0x51>;
> +		interrupts-extended = <&gpioi 0 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};
> +
> +&iwdg2 {
> +	timeout-sec = <32>;
> +	status = "okay";
> +};
> +
> +&qspi {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&qspi_clk_pins_a
> +		     &qspi_bk1_pins_a
> +		     &qspi_cs1_pins_a>;
> +	pinctrl-1 = <&qspi_clk_sleep_pins_a
> +		     &qspi_bk1_sleep_pins_a
> +		     &qspi_cs1_sleep_pins_a>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	flash0: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <108000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
> +};
> +
> +/* Console UART */
> +&uart4 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart4_pins_b>;
> +	pinctrl-1 = <&uart4_sleep_pins_b>;
> +	pinctrl-2 = <&uart4_idle_pins_b>;
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "okay";
> +};
> +
> +/* Bluetooth */
> +&uart7 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart7_pins_a>;
> +	pinctrl-1 = <&uart7_sleep_pins_a>;
> +	pinctrl-2 = <&uart7_idle_pins_a>;
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
> +		max-speed = <3000000>;
> +		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +/* SDIO WiFi */
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_clk_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	bus-width = <4>;
> +	cap-power-off-card;
> +	keep-power-in-suspend;
> +	non-removable;
> +	st,neg-edge;
> +	vmmc-supply = <&vdd>;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	brcmf: bcrmf@1 {	/* muRata 1YN */
> +		reg = <1>;
> +		compatible = "infineon,cyw43439-fmac", "brcm,bcm4329-fmac";
> +		interrupt-parent = <&gpioe>;
> +		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "host-wake";
> +	};
> +};
> +
> +/* eMMC */
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a &sdmmc2_clk_pins_a>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a &sdmmc2_clk_pins_a>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
> +	bus-width = <8>;
> +	mmc-ddr-3_3v;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	st,neg-edge;
> +	vmmc-supply = <&vdd>;
> +	vqmmc-supply = <&vdd>;
> +	status = "okay";
> +};
> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> new file mode 100644
> index 00000000000..30e3b91bccc
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2024 Marek Vasut <marex@denx.de>
> + */
> +
> +#include "stm32mp13-u-boot.dtsi"
> +
> +/ {
> +	aliases {
> +		eeprom0 = &eeprom0;
> +	};
> +
> +	config {
> +		dh,ddr3-coding-gpios = <&gpiod 5 0>, <&gpiod 9 0>;
> +		dh,som-coding-gpios = <&gpioa 13 0>, <&gpioi 1 0>;
> +	};
> +};
> +
> +&flash0 {
> +	bootph-pre-ram;
> +
> +	partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		partition@0 {
> +			label = "fsbl1";
> +			reg = <0x00000000 0x00040000>;
> +		};
> +		partition@40000 {
> +			label = "fsbl2";
> +			reg = <0x00040000 0x00040000>;
> +		};
> +		partition@80000 {
> +			label = "u-boot";
> +			reg = <0x00080000 0x00360000>;
> +		};
> +		partition@3e0000 {
> +			label = "u-boot-env-a";
> +			reg = <0x003e0000 0x00010000>;
> +		};
> +		partition@3f0000 {
> +			label = "u-boot-env-b";
> +			reg = <0x003f0000 0x00010000>;
> +		};
> +	};
> +};
> +
> +&sdmmc1 {
> +	status = "disabled";
> +};
> +
> +&usbotg_hs {
> +	u-boot,force-b-session-valid;
> +};
> diff --git a/configs/stm32mp13_dhcor_defconfig b/configs/stm32mp13_dhcor_defconfig
> new file mode 100644
> index 00000000000..fb3d86deb64
> --- /dev/null
> +++ b/configs/stm32mp13_dhcor_defconfig
> @@ -0,0 +1,148 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_STM32MP=y
> +CONFIG_TFABOOT=y
> +CONFIG_SYS_MALLOC_F_LEN=0x1c0000
> +CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0400000
> +CONFIG_ENV_SIZE=0x4000
> +CONFIG_ENV_OFFSET=0x3E0000
> +CONFIG_ENV_SECT_SIZE=0x1000
> +CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dhcor-dhsbc"
> +CONFIG_STM32MP13X=y
> +CONFIG_DDR_CACHEABLE_SIZE=0x8000000
> +CONFIG_CMD_STM32KEY=y
> +CONFIG_TARGET_ST_STM32MP13X=y
> +CONFIG_ENV_OFFSET_REDUND=0x3F0000
> +CONFIG_CMD_STM32PROG=y
> +CONFIG_STM32MP15_PWR=y
> +# CONFIG_ARMV7_NONSEC is not set
> +CONFIG_SYS_LOAD_ADDR=0xc2000000
> +CONFIG_SYS_MEMTEST_START=0xc0000000
> +CONFIG_SYS_MEMTEST_END=0xc4000000
> +CONFIG_FIT=y
> +CONFIG_SYS_BOOTM_LEN=0x2000000
> +CONFIG_DISTRO_DEFAULTS=y
> +CONFIG_BOOTSTAGE_RECORD_COUNT=100
> +CONFIG_BOOTDELAY=3
> +CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> +CONFIG_SYS_CONSOLE_IS_IN_ENV=y
> +CONFIG_SYS_PROMPT="STM32MP> "
> +# CONFIG_CMD_ELF is not set
> +CONFIG_CMD_ASKENV=y
> +# CONFIG_CMD_EXPORTENV is not set
> +CONFIG_CMD_ERASEENV=y
> +CONFIG_CMD_EEPROM=y
> +CONFIG_CMD_MEMINFO=y
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_CMD_UNZIP=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_DFU=y
> +CONFIG_CMD_FUSE=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_I2C=y
> +CONFIG_CMD_LSBLK=y
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_SPI=y
> +CONFIG_CMD_USB=y
> +CONFIG_CMD_USB_MASS_STORAGE=y
> +CONFIG_CMD_CAT=y
> +CONFIG_CMD_SETEXPR_FMT=y
> +CONFIG_CMD_XXD=y
> +CONFIG_CMD_DHCP6=y
> +CONFIG_CMD_TFTPPUT=y
> +CONFIG_SYS_DISABLE_AUTOLOAD=y
> +CONFIG_CMD_WGET=y
> +CONFIG_CMD_BOOTCOUNT=y
> +CONFIG_CMD_CACHE=y
> +CONFIG_CMD_TIME=y
> +CONFIG_CMD_RNG=y
> +CONFIG_CMD_TIMER=y
> +CONFIG_CMD_PMIC=y
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_CMD_BTRFS=y
> +CONFIG_CMD_EXT4_WRITE=y
> +CONFIG_CMD_LOG=y
> +CONFIG_CMD_UBI=y
> +# CONFIG_ISO_PARTITION is not set
> +CONFIG_OF_LIVE=y
> +CONFIG_ENV_IS_NOWHERE=y
> +CONFIG_ENV_IS_IN_SPI_FLASH=y
> +CONFIG_ENV_SPI_MAX_HZ=50000000
> +CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_VERSION_VARIABLE=y
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_IP_DEFRAG=y
> +CONFIG_TFTP_TSIZE=y
> +CONFIG_PROT_TCP_SACK=y
> +CONFIG_IPV6=y
> +CONFIG_BOOTCOUNT_LIMIT=y
> +CONFIG_SYS_BOOTCOUNT_MAGIC=0xB0C40000
> +CONFIG_CLK_SCMI=y
> +CONFIG_SET_DFU_ALT_INFO=y
> +CONFIG_GPIO_HOG=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_STM32F7=y
> +CONFIG_LED=y
> +CONFIG_LED_GPIO=y
> +CONFIG_STM32_FMC2_EBI=y
> +CONFIG_I2C_EEPROM=y
> +CONFIG_SYS_I2C_EEPROM_ADDR=0x50
> +CONFIG_SUPPORT_EMMC_BOOT=y
> +CONFIG_STM32_SDMMC2=y
> +CONFIG_MTD=y
> +CONFIG_DM_MTD=y
> +CONFIG_DM_SPI_FLASH=y
> +CONFIG_SPI_FLASH_SFDP_SUPPORT=y
> +CONFIG_SPI_FLASH_MACRONIX=y
> +CONFIG_SPI_FLASH_SPANSION=y
> +CONFIG_SPI_FLASH_STMICRO=y
> +CONFIG_SPI_FLASH_WINBOND=y
> +CONFIG_SPI_FLASH_MTD=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_DWC_ETH_QOS=y
> +CONFIG_PHY=y
> +CONFIG_PHY_STM32_USBPHYC=y
> +CONFIG_PINCONF=y
> +CONFIG_DM_PMIC=y
> +CONFIG_PMIC_STPMIC1=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_REGULATOR_GPIO=y
> +CONFIG_DM_REGULATOR_STPMIC1=y
> +CONFIG_DM_REGULATOR_SCMI=y
> +CONFIG_RESET_SCMI=y
> +CONFIG_DM_RNG=y
> +CONFIG_RNG_STM32=y
> +CONFIG_DM_RTC=y
> +CONFIG_RTC_STM32=y
> +CONFIG_SERIAL_RX_BUFFER=y
> +CONFIG_SPI=y
> +CONFIG_DM_SPI=y
> +CONFIG_STM32_QSPI=y
> +CONFIG_STM32_SPI=y
> +CONFIG_SYSRESET_PSCI=y
> +CONFIG_TEE=y
> +CONFIG_OPTEE=y
> +# CONFIG_OPTEE_TA_AVB is not set
> +CONFIG_USB=y
> +CONFIG_DM_USB_GADGET=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_GENERIC=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_GENERIC=y
> +CONFIG_USB_DWC2=y
> +CONFIG_USB_ONBOARD_HUB=y
> +CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
> +CONFIG_USB_HOST_ETHER=y
> +CONFIG_USB_ETHER_ASIX=y
> +CONFIG_USB_GADGET=y
> +CONFIG_USB_GADGET_MANUFACTURER="dh"
> +CONFIG_USB_GADGET_VENDOR_NUM=0x0483
> +CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
> +CONFIG_USB_GADGET_DWC2_OTG=y
> +CONFIG_USB_GADGET_DOWNLOAD=y
> +CONFIG_WDT=y
> +CONFIG_WDT_STM32MP=y
> +CONFIG_FAT_WRITE=y
> +CONFIG_ERRNO_STR=y
> +# CONFIG_EFI_LOADER is not set


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
