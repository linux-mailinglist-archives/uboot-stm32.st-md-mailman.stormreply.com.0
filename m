Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBF146656
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 12:11:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E4C9C36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 11:11:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61648C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 09:57:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N9sUo5006019; Thu, 23 Jan 2020 10:57:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=p67H/kdwxLDVRxLWT9szdTWBn7oXxpocW6ff8Vx1U9Q=;
 b=PBC9XVO45IRL9BKQx4Te/+ZLCwrOQZY5slkKQv1rfVATVBHEFOaf12oW30j4OEZiyHT3
 vl7qdLqstI3oEx3q11Q1A5IRiOacK32G8bcnySHS6iWR+4eQP63wpMng6+Yz/dOtsaoO
 4OPrq83j2WwE0UQnH0vafmGNi5MtXTH+3RhZV0ikjLh40CESx2HIm4c2cXt9RfPKKeAT
 FZ47S8qviAkanYxdHhczzPqLOlk1QuT2a5E5a9amMJR6yLvH4y6/DrlNgD8BV+RDjDdT
 t+uuE8mMRCtvNLlOj+BhHwtpzCndvzbkImaHw8mfxxSm1lZAk201RTcaRtG75TpGoNjW 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrc59h6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 10:57:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9053F10002A;
 Thu, 23 Jan 2020 10:57:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AD6B22030C;
 Thu, 23 Jan 2020 10:57:49 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jan
 2020 10:57:49 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 10:57:49 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH V2] ARM: dts: stm32: Add DH Electronics DHCOM SoM and
 PDK2 board
Thread-Index: AQHV0KMryLx9QThJ9EOH4Im7yQ/I+Kf25pcg
Date: Thu, 23 Jan 2020 09:57:48 +0000
Message-ID: <09fea5052c6a48f7bc5353b5ce5ad884@SFHDAG6NODE3.st.com>
References: <20200121213843.96709-1-marex@denx.de>
In-Reply-To: <20200121213843.96709-1-marex@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_01:2020-01-23,
 2020-01-22 signatures=0
X-Mailman-Approved-At: Thu, 23 Jan 2020 11:11:08 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH V2] ARM: dts: stm32: Add DH Electronics
 DHCOM SoM and PDK2 board
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

Hi Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: mardi 21 janvier 2020 22:39
> 
> Add support for DH Electronics DHCOM SoM and PDK2 rev. 400 carrier board.
> This is an SoM with STM32MP157C and an evaluation kit. The baseboard
> provides Ethernet, UART, USB, CAN and optional display.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>

Few remarks (see after) about
1/ name of dts file (I prefer to don't add a file "-u-boot.dts")
2/ stusb1600 support (it seens that the PDK2 board hav no this USB type C controller, so part of code can be dropped)
3/ ST board specific part are not needed : OTP_BOARD / command stboard

But anayway:

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

I propose something for the first point on the custodians git, branch "dh"
https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git

see " fixup! ARM: dts: stm32: Add DH Electronics DHCOM SoM and PDK2 board" on dh branch

Are you are ok with this proposal ?

In the same branch I propose 2 other modifications to reduce the size of board.c
(remove feature note needed).

- remove stusb1600 support
- remove OTP_BOARD support and cmd_stboard

Regards

Patrick

> ---
> V2: Rebase on u-boot/master and multi-board changes.
> ---
>  arch/arm/dts/Makefile                         |   1 +
>  .../arm/dts/stm32mp157c-dhcom-pdk2-u-boot.dts |   7 +
>  arch/arm/dts/stm32mp157c-dhcom-pdk2.dts       |  88 ++
>  arch/arm/dts/stm32mp157c-dhcom-u-boot.dtsi    | 238 ++++++
>  arch/arm/dts/stm32mp157c-dhcom.dtsi           | 379 +++++++++
>  arch/arm/mach-stm32mp/Kconfig                 |   9 +
>  board/dhelectronics/dh_stm32mp1/Kconfig       |  21 +
>  board/dhelectronics/dh_stm32mp1/MAINTAINERS   |   7 +
>  board/dhelectronics/dh_stm32mp1/Makefile      |  12 +
>  board/dhelectronics/dh_stm32mp1/board.c       | 778 ++++++++++++++++++
>  configs/stm32mp15_dhcom_basic_defconfig       | 138 ++++
>  11 files changed, 1678 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp157c-dhcom-pdk2-u-boot.dts

I prefer to use the directly dts name from kernel.

And "stm32mp157c-dhcom-pdk2-u-boot.dtsi" is automatically included
when stm32mp157c-dhcom-pdk2.dtb is compiled (by ./scripts/Makefile.lib:166)


>  create mode 100644 arch/arm/dts/stm32mp157c-dhcom-pdk2.dts
>  create mode 100644 arch/arm/dts/stm32mp157c-dhcom-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157c-dhcom.dtsi
>  create mode 100644 board/dhelectronics/dh_stm32mp1/Kconfig
>  create mode 100644 board/dhelectronics/dh_stm32mp1/MAINTAINERS
>  create mode 100644 board/dhelectronics/dh_stm32mp1/Makefile
>  create mode 100644 board/dhelectronics/dh_stm32mp1/board.c
>  create mode 100644 configs/stm32mp15_dhcom_basic_defconfig
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile index
> e469d191fb..cf0c75e006 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -866,6 +866,7 @@ dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
>  dtb-$(CONFIG_STM32MP15x) += \
>  	stm32mp157a-dk1.dtb \
>  	stm32mp157a-avenger96.dtb \
> +	stm32mp157c-dhcom-pdk2-u-boot.dtb \

+ stm32mp157c-dhcom-pdk2.dtb

>  	stm32mp157c-dk2.dtb \
>  	stm32mp157c-ed1.dtb \
>  	stm32mp157c-ev1.dtb
> diff --git a/arch/arm/dts/stm32mp157c-dhcom-pdk2-u-boot.dts
> b/arch/arm/dts/stm32mp157c-dhcom-pdk2-u-boot.dts
> new file mode 100644
> index 0000000000..fd99988570
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-dhcom-pdk2-u-boot.dts
> @@ -0,0 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2019 Marek Vasut <marex@denx.de>  */
> +
> +#include "stm32mp157c-dhcom-pdk2.dts"
> +#include "stm32mp157c-dhcom-u-boot.dtsi"

+#include "stm32mp157c-dhcom-pdk2.dts"
-#include "stm32mp157c-dhcom-u-boot.dtsi"

> diff --git a/arch/arm/dts/stm32mp157c-dhcom-pdk2.dts
> b/arch/arm/dts/stm32mp157c-dhcom-pdk2.dts
> new file mode 100644
> index 0000000000..05aa545f55
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-dhcom-pdk2.dts
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2019 Marek Vasut <marex@denx.de>  */
> +
> +#include "stm32mp157c-dhcom.dtsi"
> +
> +/ {
> +	model = "STMicroelectronics STM32MP157C DHCOM Premium
> Developer Kit (2)";
> +	compatible = "dh,stm32mp157c-dhcom-pdk2", "st,stm32mp157";
> +
> +	aliases {
> +		serial0 = &uart4;
> +		ethernet0 = &ethernet0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	ethernet_vio: vioregulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vio";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpiog 3 GPIO_ACTIVE_LOW>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&ethernet0 {
> +	status = "okay";
> +	pinctrl-0 = <&ethernet0_rmii_pins_a>;
> +	pinctrl-1 = <&ethernet0_rmii_pins_sleep_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rmii";
> +	max-speed = <100>;
> +	phy-handle = <&phy0>;
> +	st,eth_ref_clk_sel;
> +	phy-reset-gpios = <&gpioh 15 GPIO_ACTIVE_LOW>;
> +
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +
> +		phy0: ethernet-phy@1 {
> +			reg = <1>;
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	ethernet0_rmii_pins_a: rmii-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 13, AF11)>, /*
> ETH1_RMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, AF11)>, /*
> ETH1_RMII_TXD1 */
> +				 <STM32_PINMUX('B', 11, AF11)>, /*
> ETH1_RMII_TX_EN */
> +				 <STM32_PINMUX('A', 1, AF0)>,   /*
> ETH1_RMII_REF_CLK */
> +				 <STM32_PINMUX('A', 2, AF11)>,  /* ETH1_MDIO
> */
> +				 <STM32_PINMUX('C', 1, AF11)>;  /* ETH1_MDC
> */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('C', 4, AF11)>,  /*
> ETH1_RMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, AF11)>,  /*
> ETH1_RMII_RXD1 */
> +				 <STM32_PINMUX('A', 7, AF11)>;  /*
> ETH1_RMII_CRS_DV */
> +			bias-disable;
> +		};
> +	};
> +
> +	ethernet0_rmii_pins_sleep_a: rmii-sleep-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /*
> ETH1_RMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, ANALOG)>, /*
> ETH1_RMII_TXD1 */
> +				 <STM32_PINMUX('B', 11, ANALOG)>, /*
> ETH1_RMII_TX_EN */
> +				 <STM32_PINMUX('A', 2, ANALOG)>,  /*
> ETH1_MDIO */
> +				 <STM32_PINMUX('C', 1, ANALOG)>,  /*
> ETH1_MDC */
> +				 <STM32_PINMUX('C', 4, ANALOG)>,  /*
> ETH1_RMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, ANALOG)>,  /*
> ETH1_RMII_RXD1 */
> +				 <STM32_PINMUX('A', 1, ANALOG)>,  /*
> ETH1_RMII_REF_CLK */
> +				 <STM32_PINMUX('A', 7, ANALOG)>;  /*
> ETH1_RMII_CRS_DV */
> +		};
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp157c-dhcom-u-boot.dtsi
> b/arch/arm/dts/stm32mp157c-dhcom-u-boot.dtsi
> new file mode 100644
> index 0000000000..320912edd8
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-dhcom-u-boot.dtsi
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2019 Marek Vasut <marex@denx.de>  */
> +
> +#include <dt-bindings/clock/stm32mp1-clksrc.h>
> +#include "stm32mp157-u-boot.dtsi"
> +#include "stm32mp15-ddr3-2x4Gb-1066-binG.dtsi"
> +
> +/ {
> +	aliases {
> +		i2c1 = &i2c2;
> +		i2c3 = &i2c4;
> +		i2c4 = &i2c5;
> +		mmc0 = &sdmmc1;
> +		mmc1 = &sdmmc2;
> +		spi0 = &qspi;
> +		usb0 = &usbotg_hs;
> +	};
> +
> +	config {
> +		u-boot,boot-led = "heartbeat";
> +		u-boot,error-led = "error";
> +		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> +		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	led {
> +		red {
> +			label = "error";
> +			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +			status = "okay";
> +		};
> +
> +		blue {
> +			default-state = "on";
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&i2c4_pins_a {
> +	u-boot,dm-pre-reloc;
> +	pins {
> +		u-boot,dm-pre-reloc;
> +	};
> +};
> +
> +&pmic {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&flash0 {
> +	u-boot,dm-spl;
> +};
> +
> +&qspi {
> +	u-boot,dm-spl;
> +};
> +
> +&qspi_clk_pins_a {
> +	u-boot,dm-spl;
> +	pins {
> +		u-boot,dm-spl;
> +	};
> +};
> +
> +&qspi_bk1_pins_a {
> +	u-boot,dm-spl;
> +	pins1 {
> +		u-boot,dm-spl;
> +	};
> +	pins2 {
> +		u-boot,dm-spl;
> +	};
> +};
> +
> +&qspi_bk2_pins_a {
> +	u-boot,dm-spl;
> +	pins1 {
> +		u-boot,dm-spl;
> +	};
> +	pins2 {
> +		u-boot,dm-spl;
> +	};
> +};
> +
> +&rcc {
> +	st,clksrc = <
> +		CLK_MPU_PLL1P
> +		CLK_AXI_PLL2P
> +		CLK_MCU_PLL3P
> +		CLK_PLL12_HSE
> +		CLK_PLL3_HSE
> +		CLK_PLL4_HSE
> +		CLK_RTC_LSE
> +		CLK_MCO1_DISABLED
> +		CLK_MCO2_DISABLED
> +	>;
> +
> +	st,clkdiv = <
> +		1 /*MPU*/
> +		0 /*AXI*/
> +		0 /*MCU*/
> +		1 /*APB1*/
> +		1 /*APB2*/
> +		1 /*APB3*/
> +		1 /*APB4*/
> +		2 /*APB5*/
> +		23 /*RTC*/
> +		0 /*MCO1*/
> +		0 /*MCO2*/
> +	>;
> +
> +	st,pkcs = <
> +		CLK_CKPER_HSE
> +		CLK_FMC_ACLK
> +		CLK_QSPI_ACLK
> +		CLK_ETH_PLL4P
> +		CLK_SDMMC12_PLL4P
> +		CLK_DSI_DSIPLL
> +		CLK_STGEN_HSE
> +		CLK_USBPHY_HSE
> +		CLK_SPI2S1_PLL3Q
> +		CLK_SPI2S23_PLL3Q
> +		CLK_SPI45_HSI
> +		CLK_SPI6_HSI
> +		CLK_I2C46_HSI
> +		CLK_SDMMC3_PLL4P
> +		CLK_USBO_USBPHY
> +		CLK_ADC_CKPER
> +		CLK_CEC_LSE
> +		CLK_I2C12_HSI
> +		CLK_I2C35_HSI
> +		CLK_UART1_HSI
> +		CLK_UART24_HSI
> +		CLK_UART35_HSI
> +		CLK_UART6_HSI
> +		CLK_UART78_HSI
> +		CLK_SPDIF_PLL4P
> +		CLK_FDCAN_PLL4Q
> +		CLK_SAI1_PLL3Q
> +		CLK_SAI2_PLL3Q
> +		CLK_SAI3_PLL3Q
> +		CLK_SAI4_PLL3Q
> +		CLK_RNG1_LSI
> +		CLK_RNG2_LSI
> +		CLK_LPTIM1_PCLK1
> +		CLK_LPTIM23_PCLK3
> +		CLK_LPTIM45_LSE
> +	>;
> +
> +	/* VCO = 1300.0 MHz => P = 650 (CPU) */
> +	pll1: st,pll@0 {
> +		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
> +		frac = < 0x800 >;
> +		u-boot,dm-pre-reloc;
> +	};
> +
> +	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
> +	pll2: st,pll@1 {
> +		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
> +		frac = < 0x1400 >;
> +		u-boot,dm-pre-reloc;
> +	};
> +
> +	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
> +	pll3: st,pll@2 {
> +		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
> +		frac = < 0x1a04 >;
> +		u-boot,dm-pre-reloc;
> +	};
> +
> +	/* VCO = 600.0 MHz => P = 50, Q = 50, R = 50 */
> +	pll4: st,pll@3 {
> +		cfg = < 1 49 11 11 11 PQR(1,1,1) >;
> +		u-boot,dm-pre-reloc;
> +	};
> +};
> +
> +&sdmmc1 {
> +	u-boot,dm-spl;
> +};
> +
> +&sdmmc1_b4_pins_a {
> +	u-boot,dm-spl;
> +	pins {
> +		u-boot,dm-spl;
> +	};
> +};
> +
> +&sdmmc1_dir_pins_a {
> +	u-boot,dm-spl;
> +	pins1 {
> +		u-boot,dm-spl;
> +	};
> +	pins2 {
> +		u-boot,dm-spl;
> +	};
> +};
> +
> +&sdmmc2 {
> +	u-boot,dm-spl;
> +};
> +
> +&sdmmc2_b4_pins_a {
> +	u-boot,dm-spl;
> +	pins {
> +		u-boot,dm-spl;
> +	};
> +};
> +
> +&sdmmc2_d47_pins_a {
> +	u-boot,dm-spl;
> +	pins {
> +		u-boot,dm-spl;
> +	};
> +};
> +
> +&uart4 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&uart4_pins_a {
> +	u-boot,dm-pre-reloc;
> +	pins1 {
> +		u-boot,dm-pre-reloc;
> +	};
> +	pins2 {
> +		u-boot,dm-pre-reloc;
> +		/* pull-up on rx to avoid floating level */
> +		bias-pull-up;
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp157c-dhcom.dtsi b/arch/arm/dts/stm32mp157c-
> dhcom.dtsi
> new file mode 100644
> index 0000000000..96661ae783
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-dhcom.dtsi
> @@ -0,0 +1,379 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2019 Marek Vasut <marex@denx.de>  */ /dts-v1/;
> +
> +#include "stm32mp157c.dtsi"
> +#include "stm32mp157xaa-pinctrl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/mfd/st,stpmic1.h>
> +
> +/ {
> +	memory@c0000000 {
> +		device_type = "memory";
> +		reg = <0xC0000000 0x40000000>;
> +	};
> +};
> +
> +&cec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&cec_pins_a>;
> +	status = "okay";
> +};
> +
> +&dcmi {
> +	status = "okay";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&dcmi_pins_a>;
> +	pinctrl-1 = <&dcmi_sleep_pins_a>;
> +};
> +
> +&dts {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c4_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +
> +	pmic: stpmic@33 {
> +		compatible = "st,stpmic1";
> +		reg = <0x33>;
> +		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		status = "okay";
> +
> +		regulators {
> +			compatible = "st,stpmic1-regulators";
> +			ldo1-supply = <&v3v3>;
> +			ldo2-supply = <&v3v3>;
> +			ldo3-supply = <&vdd_ddr>;
> +			ldo5-supply = <&v3v3>;
> +			ldo6-supply = <&v3v3>;
> +			pwr_sw1-supply = <&bst_out>;
> +			pwr_sw2-supply = <&bst_out>;
> +
> +			vddcore: buck1 {
> +				regulator-name = "vddcore";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-always-on;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd_ddr: buck2 {
> +				regulator-name = "vdd_ddr";
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-always-on;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd: buck3 {
> +				regulator-name = "vdd";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				st,mask-reset;
> +				regulator-initial-mode = <0>;
> +				regulator-over-current-protection;
> +			};
> +
> +			v3v3: buck4 {
> +				regulator-name = "v3v3";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-over-current-protection;
> +				regulator-initial-mode = <0>;
> +			};
> +
> +			vdda: ldo1 {
> +				regulator-name = "vdda";
> +				regulator-min-microvolt = <2900000>;
> +				regulator-max-microvolt = <2900000>;
> +				interrupts = <IT_CURLIM_LDO1 0>;
> +			};
> +
> +			v2v8: ldo2 {
> +				regulator-name = "v2v8";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				interrupts = <IT_CURLIM_LDO2 0>;
> +			};
> +
> +			vtt_ddr: ldo3 {
> +				regulator-name = "vtt_ddr";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <750000>;
> +				regulator-always-on;
> +				regulator-over-current-protection;
> +			};
> +
> +			vdd_usb: ldo4 {
> +				regulator-name = "vdd_usb";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				interrupts = <IT_CURLIM_LDO4 0>;
> +			};
> +
> +			vdd_sd: ldo5 {
> +				regulator-name = "vdd_sd";
> +				regulator-min-microvolt = <2900000>;
> +				regulator-max-microvolt = <2900000>;
> +				interrupts = <IT_CURLIM_LDO5 0>;
> +				regulator-boot-on;
> +			};
> +
> +			v1v8: ldo6 {
> +				regulator-name = "v1v8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				interrupts = <IT_CURLIM_LDO6 0>;
> +			};
> +
> +			vref_ddr: vref_ddr {
> +				regulator-name = "vref_ddr";
> +				regulator-always-on;
> +				regulator-over-current-protection;
> +			};
> +
> +			 bst_out: boost {
> +				regulator-name = "bst_out";
> +				interrupts = <IT_OCP_BOOST 0>;
> +			 };
> +
> +			vbus_otg: pwr_sw1 {
> +				regulator-name = "vbus_otg";
> +				interrupts = <IT_OCP_OTG 0>;
> +			 };
> +
> +			 vbus_sw: pwr_sw2 {
> +				regulator-name = "vbus_sw";
> +				interrupts = <IT_OCP_SWOUT 0>;
> +				regulator-active-discharge;
> +			 };
> +		};
> +
> +		onkey {
> +			compatible = "st,stpmic1-onkey";
> +			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
> +			interrupt-names = "onkey-falling", "onkey-rising";
> +			power-off-time-sec = <10>;
> +			status = "okay";
> +		};
> +
> +		watchdog {
> +			compatible = "st,stpmic1-wdt";
> +			status = "disabled";
> +		};
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&i2c5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	status = "okay";
> +};
> +
> +&ipcc {
> +	status = "okay";
> +};
> +
> +&iwdg2 {
> +	timeout-sec = <32>;
> +	status = "okay";
> +};
> +
> +&m4_rproc {
> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> +	mbox-names = "vq0", "vq1", "shutdown";
> +	status = "okay";
> +};
> +
> +&pwr {
> +	pwr-regulators {
> +		vdd-supply = <&vdd>;
> +		vdd_3v3_usbfs-supply = <&vdd_usb>;
> +	};
> +};
> +
> +&qspi {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
> +	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a
> &qspi_bk2_sleep_pins_a>;
> +	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	flash0: mx66l51235l@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <108000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
> +
> +	flash1: mx66l51235l@1 {
> +		compatible = "jedec,spi-nor";
> +		reg = <1>;
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <108000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
> +};
> +
> +&rng1 {
> +	status = "okay";
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
> +	broken-cd;
> +	st,sig-dir;
> +	st,neg-edge;
> +	st,use-ckin;
> +	bus-width = <4>;
> +	vmmc-supply = <&vdd_sd>;
> +	status = "okay";
> +};
> +
> +&sdmmc2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	st,sig-dir;
> +	st,neg-edge;
> +	bus-width = <8>;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&spi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi1_pins_a>;
> +	status = "disabled";
> +};
> +
> +&timers2 {
> +	/* spare dmas for other usage (un-delete to enable pwm capture) */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "disabled";
> +	pwm {
> +		pinctrl-0 = <&pwm2_pins_a>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +	timer@1 {
> +		status = "okay";
> +	};
> +};
> +
> +&timers6 {
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	timer@5 {
> +		status = "okay";
> +	};
> +};
> +
> +&timers8 {
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "disabled";
> +	pwm {
> +		pinctrl-0 = <&pwm8_pins_a>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +	timer@7 {
> +		status = "okay";
> +	};
> +};
> +
> +&timers12 {
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "disabled";
> +	pwm {
> +		pinctrl-0 = <&pwm12_pins_a>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +	timer@11 {
> +		status = "okay";
> +	};
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart4_pins_a>;
> +	status = "okay";
> +};
> +
> +&usbh_ehci {
> +	phys = <&usbphyc_port0>;
> +	phy-names = "usb";
> +	status = "okay";
> +};
> +
> +&usbotg_hs {
> +	dr_mode = "peripheral";
> +	phys = <&usbphyc_port1 0>;
> +	phy-names = "usb2-phy";
> +	vbus-supply = <&vbus_otg>;
> +	status = "okay";
> +};
> +
> +&usbphyc {
> +	status = "okay";
> +};
> +
> +&usbphyc_port0 {
> +	phy-supply = <&vdd_usb>;
> +};
> +
> +&usbphyc_port1 {
> +	phy-supply = <&vdd_usb>;
> +};
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 137178aa45..e4d621dee8 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -73,6 +73,14 @@ config TARGET_ST_STM32MP15x
>  		Evalulation board (EV1) or Discovery board (DK1 and DK2).
>  		The difference between board are managed with devicetree
> 
> +config TARGET_DH_STM32MP1_PDK2
> +	bool "DH STM32MP1 PDK2"
> +	select STM32MP15x
> +	imply BOOTCOUNT_LIMIT
> +	imply CMD_BOOTCOUNT
> +	help
> +		Target the DH PDK2 development kit with STM32MP15x SoM.
> +
>  endchoice
> 
>  config STM32MP1_TRUSTED
> @@ -158,5 +166,6 @@ config DEBUG_UART_CLOCK  endif
> 
>  source "board/st/stm32mp1/Kconfig"
> +source "board/dhelectronics/dh_stm32mp1/Kconfig"
> 
>  endif
> diff --git a/board/dhelectronics/dh_stm32mp1/Kconfig
> b/board/dhelectronics/dh_stm32mp1/Kconfig
> new file mode 100644
> index 0000000000..8eab986640
> --- /dev/null
> +++ b/board/dhelectronics/dh_stm32mp1/Kconfig
> @@ -0,0 +1,21 @@
> +if TARGET_DH_STM32MP1_PDK2
> +
> +config SYS_BOARD
> +	default "dh_stm32mp1"
> +
> +config SYS_VENDOR
> +	default "dhelectronics"
> +
> +config SYS_CONFIG_NAME
> +	default "stm32mp1"
> +
> +config ENV_SECT_SIZE
> +	default 0x10000 if ENV_IS_IN_SPI_FLASH
> +
> +config ENV_OFFSET
> +	default 0x1E0000 if ENV_IS_IN_SPI_FLASH
> +
> +config ENV_OFFSET_REDUND
> +	default 0x1F0000 if ENV_IS_IN_SPI_FLASH
> +
> +endif
> diff --git a/board/dhelectronics/dh_stm32mp1/MAINTAINERS
> b/board/dhelectronics/dh_stm32mp1/MAINTAINERS
> new file mode 100644
> index 0000000000..38f54a3da4
> --- /dev/null
> +++ b/board/dhelectronics/dh_stm32mp1/MAINTAINERS
> @@ -0,0 +1,7 @@
> +DH_STM32MP1_PDK2 BOARD
> +M:	Marek Vasut <marex@denx.de>
> +S:	Maintained
> +F:	arch/arm/dts/stm32mp157c-dhcom*
> +F:	board/dhelectronics/dh_stm32mp1/
> +F:	configs/stm32mp15_dhcom_basic_defconfig
> +F:	include/configs/stm32mp1.h
> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile
> b/board/dhelectronics/dh_stm32mp1/Makefile
> new file mode 100644
> index 0000000000..a9d28218ef
> --- /dev/null
> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause # # Copyright (C)
> +2018, STMicroelectronics - All Rights Reserved #
> +
> +ifdef CONFIG_SPL_BUILD
> +obj-y += ../../st/stm32mp1/spl.o
> +else
> +obj-$(CONFIG_CMD_STBOARD) += ../../st/stm32mp1/cmd_stboard.o endif

Do you really need to have the STMicroelectornics specific "stboard" command for dh som/board ?

> +
> +obj-y += ../../st/stm32mp1/board.o board.o
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c
> b/board/dhelectronics/dh_stm32mp1/board.c
> new file mode 100644
> index 0000000000..0bf6b116ca
> --- /dev/null
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -0,0 +1,778 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2018, STMicroelectronics - All Rights Reserved  */
> +
> +#include <common.h>
> +#include <adc.h>
> +#include <asm/arch/stm32.h>
> +#include <asm/arch/sys_proto.h>
> +#include <asm/gpio.h>
> +#include <asm/io.h>
> +#include <bootm.h>
> +#include <clk.h>
> +#include <config.h>
> +#include <dm.h>
> +#include <dm/device.h>
> +#include <dm/uclass.h>
> +#include <env.h>
> +#include <env_internal.h>
> +#include <g_dnl.h>
> +#include <generic-phy.h>
> +#include <hang.h>
> +#include <i2c.h>
> +#include <i2c_eeprom.h>
> +#include <init.h>
> +#include <led.h>
> +#include <memalign.h>
> +#include <misc.h>
> +#include <mtd.h>
> +#include <mtd_node.h>
> +#include <netdev.h>
> +#include <phy.h>
> +#include <power/regulator.h>
> +#include <remoteproc.h>
> +#include <reset.h>
> +#include <syscon.h>
> +#include <usb.h>
> +#include <usb/dwc2_udc.h>
> +#include <watchdog.h>
> +
> +/* SYSCFG registers */
> +#define SYSCFG_BOOTR		0x00
> +#define SYSCFG_PMCSETR		0x04
> +#define SYSCFG_IOCTRLSETR	0x18
> +#define SYSCFG_ICNR		0x1C
> +#define SYSCFG_CMPCR		0x20
> +#define SYSCFG_CMPENSETR	0x24
> +#define SYSCFG_PMCCLRR		0x44
> +
> +#define SYSCFG_BOOTR_BOOT_MASK		GENMASK(2, 0)
> +#define SYSCFG_BOOTR_BOOTPD_SHIFT	4
> +
> +#define SYSCFG_IOCTRLSETR_HSLVEN_TRACE		BIT(0)
> +#define SYSCFG_IOCTRLSETR_HSLVEN_QUADSPI	BIT(1)
> +#define SYSCFG_IOCTRLSETR_HSLVEN_ETH		BIT(2)
> +#define SYSCFG_IOCTRLSETR_HSLVEN_SDMMC		BIT(3)
> +#define SYSCFG_IOCTRLSETR_HSLVEN_SPI		BIT(4)
> +
> +#define SYSCFG_CMPCR_SW_CTRL		BIT(1)
> +#define SYSCFG_CMPCR_READY		BIT(8)
> +
> +#define SYSCFG_CMPENSETR_MPU_EN		BIT(0)
> +
> +#define SYSCFG_PMCSETR_ETH_CLK_SEL	BIT(16)
> +#define SYSCFG_PMCSETR_ETH_REF_CLK_SEL	BIT(17)
> +
> +#define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
> +
> +#define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
> +#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
> +#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
> +#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
> +
> +/*
> + * Get a global data pointer
> + */
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +int setup_mac_address(void)
> +{
> +	struct udevice *dev;
> +	ofnode eeprom;
> +	unsigned char enetaddr[6];
> +	int ret;
> +
> +	ret = eth_env_get_enetaddr("ethaddr", enetaddr);
> +	if (ret)	/* ethaddr is already set */
> +		return 0;
> +
> +	eeprom = ofnode_path("/soc/i2c@5c002000/eeprom@50");
> +	if (!ofnode_valid(eeprom)) {
> +		printf("Invalid hardware path to EEPROM!\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = uclass_get_device_by_ofnode(UCLASS_I2C_EEPROM, eeprom,
> &dev);
> +	if (ret) {
> +		printf("Cannot find EEPROM!\n");
> +		return ret;
> +	}
> +
> +	ret = i2c_eeprom_read(dev, 0xfa, enetaddr, 0x6);
> +	if (ret) {
> +		printf("Error reading configuration EEPROM!\n");
> +		return ret;
> +	}
> +
> +	if (is_valid_ethaddr(enetaddr))
> +		eth_env_set_enetaddr("ethaddr", enetaddr);
> +
> +	return 0;
> +}
> +
> +int checkboard(void)
> +{
> +	int ret;
> +	char *mode;
> +	u32 otp;
> +	struct udevice *dev;
> +	const char *fdt_compat;
> +	int fdt_compat_len;
> +
> +	if (IS_ENABLED(CONFIG_STM32MP1_OPTEE))
> +		mode = "trusted with OP-TEE";
> +	else if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
> +		mode = "trusted";
> +	else
> +		mode = "basic";
> +
> +	printf("Board: stm32mp1 in %s mode", mode);
> +	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
> +				 &fdt_compat_len);
> +	if (fdt_compat && fdt_compat_len)
> +		printf(" (%s)", fdt_compat);
> +	puts("\n");
> +
> +	ret = uclass_get_device_by_driver(UCLASS_MISC,
> +					  DM_GET_DRIVER(stm32mp_bsec),
> +					  &dev);
> +
> +	if (!ret)
> +		ret = misc_read(dev,
> STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
> +				&otp, sizeof(otp));

The next lines about BSEC_OTP_BOARD  and MBxxxx is only ST microelectronics board, it can be remove I think

> +	if (ret > 0 && otp) {
> +		printf("Board: MB%04x Var%d Rev.%c-%02d\n",
> +		       otp >> 16,
> +		       (otp >> 12) & 0xF,
> +		       ((otp >> 8) & 0xF) - 1 + 'A',
> +		       otp & 0xF);
> +	}
> +
> +	return 0;
> +}
> +
> +static void board_key_check(void)
> +{
> +#if defined(CONFIG_FASTBOOT) || defined(CONFIG_CMD_STM32PROG)
> +	ofnode node;
> +	struct gpio_desc gpio;
> +	enum forced_boot_mode boot_mode = BOOT_NORMAL;
> +
> +	node = ofnode_path("/config");
> +	if (!ofnode_valid(node)) {
> +		debug("%s: no /config node?\n", __func__);
> +		return;
> +	}
> +#ifdef CONFIG_FASTBOOT
> +	if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
> +				       &gpio, GPIOD_IS_IN)) {
> +		debug("%s: could not find a /config/st,fastboot-gpios\n",
> +		      __func__);
> +	} else {
> +		if (dm_gpio_get_value(&gpio)) {
> +			puts("Fastboot key pressed, ");
> +			boot_mode = BOOT_FASTBOOT;
> +		}
> +
> +		dm_gpio_free(NULL, &gpio);
> +	}
> +#endif
> +#ifdef CONFIG_CMD_STM32PROG
> +	if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
> +				       &gpio, GPIOD_IS_IN)) {
> +		debug("%s: could not find a /config/st,stm32prog-gpios\n",
> +		      __func__);
> +	} else {
> +		if (dm_gpio_get_value(&gpio)) {
> +			puts("STM32Programmer key pressed, ");
> +			boot_mode = BOOT_STM32PROG;
> +		}
> +		dm_gpio_free(NULL, &gpio);
> +	}
> +#endif
> +
> +	if (boot_mode != BOOT_NORMAL) {
> +		puts("entering download mode...\n");
> +		clrsetbits_le32(TAMP_BOOT_CONTEXT,
> +				TAMP_BOOT_FORCED_MASK,
> +				boot_mode);
> +	}
> +#endif
> +}
> +
> +#if defined(CONFIG_USB_GADGET) &&
> defined(CONFIG_USB_GADGET_DWC2_OTG)
> +
> +/* STMicroelectronics STUSB1600 Type-C controller */
> +#define STUSB1600_CC_CONNECTION_STATUS		0x0E
> +
> +/* STUSB1600_CC_CONNECTION_STATUS bitfields */
> +#define STUSB1600_CC_ATTACH			BIT(0)
> +
> +static int stusb1600_init(struct udevice **dev_stusb1600) {
> +	ofnode node;
> +	struct udevice *dev, *bus;
> +	int ret;
> +	u32 chip_addr;
> +
> +	*dev_stusb1600 = NULL;
> +
> +	/* if node stusb1600 is present, means DK1 or DK2 board */
> +	node = ofnode_by_compatible(ofnode_null(), "st,stusb1600");
> +	if (!ofnode_valid(node))
> +		return -ENODEV;
> +
> +	ret = ofnode_read_u32(node, "reg", &chip_addr);
> +	if (ret)
> +		return -EINVAL;
> +
> +	ret = uclass_get_device_by_ofnode(UCLASS_I2C,
> ofnode_get_parent(node),
> +					  &bus);
> +	if (ret) {
> +		printf("bus for stusb1600 not found\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = dm_i2c_probe(bus, chip_addr, 0, &dev);
> +	if (!ret)
> +		*dev_stusb1600 = dev;
> +
> +	return ret;
> +}
> +
> +static int stusb1600_cable_connected(struct udevice *dev) {
> +	u8 status;
> +
> +	if (dm_i2c_read(dev, STUSB1600_CC_CONNECTION_STATUS, &status,
> 1))
> +		return 0;
> +
> +	return status & STUSB1600_CC_ATTACH;
> +}
> +
> +#include <usb/dwc2_udc.h>
> +int g_dnl_board_usb_cable_connected(void)
> +{
> +	struct udevice *stusb1600;
> +	struct udevice *dwc2_udc_otg;
> +	int ret;
> +
> +	if (!stusb1600_init(&stusb1600))
> +		return stusb1600_cable_connected(stusb1600);
> +
> +	ret = uclass_get_device_by_driver(UCLASS_USB_GADGET_GENERIC,
> +					  DM_GET_DRIVER(dwc2_udc_otg),
> +					  &dwc2_udc_otg);
> +	if (!ret)
> +		debug("dwc2_udc_otg init failed\n");
> +
> +	return dwc2_udc_B_session_valid(dwc2_udc_otg);
> +}

All the stusb1600 can be removed (not present on PDK2 / DHCOM according device tree)

> +#define STM32MP1_G_DNL_DFU_PRODUCT_NUM 0xdf11 #define
> +STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM 0x0afb
> +
> +int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char
> +*name) {
> +	if (!strcmp(name, "usb_dnl_dfu"))
> +		put_unaligned(STM32MP1_G_DNL_DFU_PRODUCT_NUM, &dev-
> >idProduct);
> +	else if (!strcmp(name, "usb_dnl_fastboot"))
> +
> 	put_unaligned(STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM,
> +			      &dev->idProduct);
> +	else
> +		put_unaligned(CONFIG_USB_GADGET_PRODUCT_NUM, &dev-
> >idProduct);
> +
> +	return 0;
> +}
> +
> +#endif /* CONFIG_USB_GADGET */
> +
> +#ifdef CONFIG_LED
> +static int get_led(struct udevice **dev, char *led_string) {
> +	char *led_name;
> +	int ret;
> +
> +	led_name = fdtdec_get_config_string(gd->fdt_blob, led_string);
> +	if (!led_name) {
> +		pr_debug("%s: could not find %s config string\n",
> +			 __func__, led_string);
> +		return -ENOENT;
> +	}
> +	ret = led_get_by_label(led_name, dev);
> +	if (ret) {
> +		debug("%s: get=%d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int setup_led(enum led_state_t cmd) {
> +	struct udevice *dev;
> +	int ret;
> +
> +	ret = get_led(&dev, "u-boot,boot-led");
> +	if (ret)
> +		return ret;
> +
> +	ret = led_set_state(dev, cmd);
> +	return ret;
> +}
> +#endif
> +
> +static void __maybe_unused led_error_blink(u32 nb_blink) { #ifdef
> +CONFIG_LED
> +	int ret;
> +	struct udevice *led;
> +	u32 i;
> +#endif
> +
> +	if (!nb_blink)
> +		return;
> +
> +#ifdef CONFIG_LED
> +	ret = get_led(&led, "u-boot,error-led");
> +	if (!ret) {
> +		/* make u-boot,error-led blinking */
> +		/* if U32_MAX and 125ms interval, for 17.02 years */
> +		for (i = 0; i < 2 * nb_blink; i++) {
> +			led_set_state(led, LEDST_TOGGLE);
> +			mdelay(125);
> +			WATCHDOG_RESET();
> +		}
> +	}
> +#endif
> +
> +	/* infinite: the boot process must be stopped */
> +	if (nb_blink == U32_MAX)
> +		hang();
> +}
> +
> +static void sysconf_init(void)
> +{
> +#ifndef CONFIG_STM32MP1_TRUSTED
> +	u8 *syscfg;
> +#ifdef CONFIG_DM_REGULATOR
> +	struct udevice *pwr_dev;
> +	struct udevice *pwr_reg;
> +	struct udevice *dev;
> +	int ret;
> +	u32 otp = 0;
> +#endif
> +	u32 bootr;
> +
> +	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
> +
> +	/* interconnect update : select master using the port 1 */
> +	/* LTDC = AXI_M9 */
> +	/* GPU  = AXI_M8 */
> +	/* today information is hardcoded in U-Boot */
> +	writel(BIT(9), syscfg + SYSCFG_ICNR);
> +
> +	/* disable Pull-Down for boot pin connected to VDD */
> +	bootr = readl(syscfg + SYSCFG_BOOTR);
> +	bootr &= ~(SYSCFG_BOOTR_BOOT_MASK <<
> SYSCFG_BOOTR_BOOTPD_SHIFT);
> +	bootr |= (bootr & SYSCFG_BOOTR_BOOT_MASK) <<
> SYSCFG_BOOTR_BOOTPD_SHIFT;
> +	writel(bootr, syscfg + SYSCFG_BOOTR);
> +
> +#ifdef CONFIG_DM_REGULATOR
> +	/* High Speed Low Voltage Pad mode Enable for SPI, SDMMC, ETH,
> QSPI
> +	 * and TRACE. Needed above ~50MHz and conditioned by AFMUX
> selection.
> +	 * The customer will have to disable this for low frequencies
> +	 * or if AFMUX is selected but the function not used, typically for
> +	 * TRACE. Otherwise, impact on power consumption.
> +	 *
> +	 * WARNING:
> +	 *   enabling High Speed mode while VDD>2.7V
> +	 *   with the OTP product_below_2v5 (OTP 18, BIT 13)
> +	 *   erroneously set to 1 can damage the IC!
> +	 *   => U-Boot set the register only if VDD < 2.7V (in DT)
> +	 *      but this value need to be consistent with board design
> +	 */
> +	ret = uclass_get_device_by_driver(UCLASS_PMIC,
> +					  DM_GET_DRIVER(stm32mp_pwr_pmic),
> +					  &pwr_dev);
> +	if (!ret) {
> +		ret = uclass_get_device_by_driver(UCLASS_MISC,
> +
> DM_GET_DRIVER(stm32mp_bsec),
> +						  &dev);
> +		if (ret) {
> +			pr_err("Can't find stm32mp_bsec driver\n");
> +			return;
> +		}
> +
> +		ret = misc_read(dev, STM32_BSEC_SHADOW(18), &otp, 4);
> +		if (ret > 0)
> +			otp = otp & BIT(13);
> +
> +		/* get VDD = vdd-supply */
> +		ret = device_get_supply_regulator(pwr_dev, "vdd-supply",
> +						  &pwr_reg);
> +
> +		/* check if VDD is Low Voltage */
> +		if (!ret) {
> +			if (regulator_get_value(pwr_reg) < 2700000) {
> +				writel(SYSCFG_IOCTRLSETR_HSLVEN_TRACE |
> +				       SYSCFG_IOCTRLSETR_HSLVEN_QUADSPI
> |
> +				       SYSCFG_IOCTRLSETR_HSLVEN_ETH |
> +				       SYSCFG_IOCTRLSETR_HSLVEN_SDMMC |
> +				       SYSCFG_IOCTRLSETR_HSLVEN_SPI,
> +				       syscfg + SYSCFG_IOCTRLSETR);
> +
> +				if (!otp)
> +					pr_err("product_below_2v5=0: HSLVEN
> protected by HW\n");
> +			} else {
> +				if (otp)
> +					pr_err("product_below_2v5=1: HSLVEN
> update is destructive, no update as VDD>2.7V\n");
> +			}
> +		} else {
> +			debug("VDD unknown");
> +		}
> +	}
> +#endif
> +
> +	/* activate automatic I/O compensation
> +	 * warning: need to ensure CSI enabled and ready in clock driver
> +	 */
> +	writel(SYSCFG_CMPENSETR_MPU_EN, syscfg +
> SYSCFG_CMPENSETR);
> +
> +	while (!(readl(syscfg + SYSCFG_CMPCR) & SYSCFG_CMPCR_READY))
> +		;
> +	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
> #endif }
> +
> +/* board dependent setup after realloc */ int board_init(void) {
> +	struct udevice *dev;
> +
> +	/* address of boot parameters */
> +	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
> +
> +	/* probe all PINCTRL for hog */
> +	for (uclass_first_device(UCLASS_PINCTRL, &dev);
> +	     dev;
> +	     uclass_next_device(&dev)) {
> +		pr_debug("probe pincontrol = %s\n", dev->name);
> +	}
> +
> +	board_key_check();
> +
> +#ifdef CONFIG_DM_REGULATOR
> +	regulators_enable_boot_on(_DEBUG);
> +#endif
> +
> +	sysconf_init();
> +
> +	if (CONFIG_IS_ENABLED(CONFIG_LED))
> +		led_default_state();
> +
> +	return 0;
> +}
> +
> +int board_late_init(void)
> +{
> +	char *boot_device;
> +#ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
> +	const void *fdt_compat;
> +	int fdt_compat_len;
> +	int ret;
> +	u32 otp;
> +	struct udevice *dev;
> +	char buf[10];
> +
> +	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
> +				 &fdt_compat_len);
> +	if (fdt_compat && fdt_compat_len) {
> +		if (strncmp(fdt_compat, "st,", 3) != 0)
> +			env_set("board_name", fdt_compat);
> +		else
> +			env_set("board_name", fdt_compat + 3);
> +	}
> +	ret = uclass_get_device_by_driver(UCLASS_MISC,
> +					  DM_GET_DRIVER(stm32mp_bsec),
> +					  &dev);
> +
> +	if (!ret)
> +		ret = misc_read(dev,
> STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
> +				&otp, sizeof(otp));
> +	if (!ret && otp) {
> +		snprintf(buf, sizeof(buf), "0x%04x", otp >> 16);
> +		env_set("board_id", buf);
> +
> +		snprintf(buf, sizeof(buf), "0x%04x",
> +			 ((otp >> 8) & 0xF) - 1 + 0xA);
> +		env_set("board_rev", buf);
> +	}

Part on BSEC_OTP_BOARD can be removed (ST Microelectronics specific use of OTP).

> +#endif
> +
> +	/* Check the boot-source to disable bootdelay */
> +	boot_device = env_get("boot_device");
> +	if (!strcmp(boot_device, "serial") || !strcmp(boot_device, "usb"))
> +		env_set("bootdelay", "0");
> +
> +	return 0;
> +}
> +
> +void board_quiesce_devices(void)
> +{
> +#ifdef CONFIG_LED
> +	setup_led(LEDST_OFF);
> +#endif
> +}
> +
> +/* eth init function : weak called in eqos driver */ int
> +board_interface_eth_init(struct udevice *dev,
> +			     phy_interface_t interface_type) {
> +	u8 *syscfg;
> +	u32 value;
> +	bool eth_clk_sel_reg = false;
> +	bool eth_ref_clk_sel_reg = false;
> +
> +	/* Gigabit Ethernet 125MHz clock selection. */
> +	eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
> +
> +	/* Ethernet 50Mhz RMII clock selection */
> +	eth_ref_clk_sel_reg =
> +		dev_read_bool(dev, "st,eth_ref_clk_sel");
> +
> +	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
> +
> +	if (!syscfg)
> +		return -ENODEV;
> +
> +	switch (interface_type) {
> +	case PHY_INTERFACE_MODE_MII:
> +		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
> +			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> +		debug("%s: PHY_INTERFACE_MODE_MII\n", __func__);
> +		break;
> +	case PHY_INTERFACE_MODE_GMII:
> +		if (eth_clk_sel_reg)
> +			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
> +				SYSCFG_PMCSETR_ETH_CLK_SEL;
> +		else
> +			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
> +		debug("%s: PHY_INTERFACE_MODE_GMII\n", __func__);
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		if (eth_ref_clk_sel_reg)
> +			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
> +				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> +		else
> +			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
> +		debug("%s: PHY_INTERFACE_MODE_RMII\n", __func__);
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		if (eth_clk_sel_reg)
> +			value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
> +				SYSCFG_PMCSETR_ETH_CLK_SEL;
> +		else
> +			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
> +		debug("%s: PHY_INTERFACE_MODE_RGMII\n", __func__);
> +		break;
> +	default:
> +		debug("%s: Do not manage %d interface\n",
> +		      __func__, interface_type);
> +		/* Do not manage others interfaces */
> +		return -EINVAL;
> +	}
> +
> +	/* clear and set ETH configuration bits */
> +	writel(SYSCFG_PMCSETR_ETH_SEL_MASK |
> SYSCFG_PMCSETR_ETH_SELMII |
> +	       SYSCFG_PMCSETR_ETH_REF_CLK_SEL |
> SYSCFG_PMCSETR_ETH_CLK_SEL,
> +	       syscfg + SYSCFG_PMCCLRR);
> +	writel(value, syscfg + SYSCFG_PMCSETR);
> +
> +	return 0;
> +}
> +
> +enum env_location env_get_location(enum env_operation op, int prio) {
> +	if (prio)
> +		return ENVL_UNKNOWN;
> +
> +#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
> +	return ENVL_SPI_FLASH;
> +#else
> +	return ENVL_NOWHERE;
> +#endif
> +}
> +
> +#ifdef CONFIG_SYS_MTDPARTS_RUNTIME
> +
> +#define MTDPARTS_LEN		256
> +#define MTDIDS_LEN		128
> +
> +/**
> + * The mtdparts_nand0 and mtdparts_nor0 variable tends to be long.
> + * If we need to access it before the env is relocated, then we need
> + * to use our own stack buffer. gd->env_buf will be too small.
> + *
> + * @param buf temporary buffer pointer MTDPARTS_LEN long
> + * @return mtdparts variable string, NULL if not found  */ static const
> +char *env_get_mtdparts(const char *str, char *buf) {
> +	if (gd->flags & GD_FLG_ENV_READY)
> +		return env_get(str);
> +	if (env_get_f(str, buf, MTDPARTS_LEN) != -1)
> +		return buf;
> +
> +	return NULL;
> +}
> +
> +/**
> + * update the variables "mtdids" and "mtdparts" with content of
> +mtdparts_<dev>  */ static void board_get_mtdparts(const char *dev,
> +			       char *mtdids,
> +			       char *mtdparts)
> +{
> +	char env_name[32] = "mtdparts_";
> +	char tmp_mtdparts[MTDPARTS_LEN];
> +	const char *tmp;
> +
> +	/* name of env variable to read = mtdparts_<dev> */
> +	strcat(env_name, dev);
> +	tmp = env_get_mtdparts(env_name, tmp_mtdparts);
> +	if (tmp) {
> +		/* mtdids: "<dev>=<dev>, ...." */
> +		if (mtdids[0] != '\0')
> +			strcat(mtdids, ",");
> +		strcat(mtdids, dev);
> +		strcat(mtdids, "=");
> +		strcat(mtdids, dev);
> +
> +		/* mtdparts: "mtdparts=<dev>:<mtdparts_<dev>>;..." */
> +		if (mtdparts[0] != '\0')
> +			strncat(mtdparts, ";", MTDPARTS_LEN);
> +		else
> +			strcat(mtdparts, "mtdparts=");
> +		strncat(mtdparts, dev, MTDPARTS_LEN);
> +		strncat(mtdparts, ":", MTDPARTS_LEN);
> +		strncat(mtdparts, tmp, MTDPARTS_LEN);
> +	}
> +}
> +
> +void board_mtdparts_default(const char **mtdids, const char **mtdparts)
> +{
> +	struct udevice *dev;
> +	static char parts[3 * MTDPARTS_LEN + 1];
> +	static char ids[MTDIDS_LEN + 1];
> +	static bool mtd_initialized;
> +
> +	if (mtd_initialized) {
> +		*mtdids = ids;
> +		*mtdparts = parts;
> +		return;
> +	}
> +
> +	memset(parts, 0, sizeof(parts));
> +	memset(ids, 0, sizeof(ids));
> +
> +	/* probe all MTD devices */
> +	for (uclass_first_device(UCLASS_MTD, &dev);
> +	     dev;
> +	     uclass_next_device(&dev)) {
> +		pr_debug("mtd device = %s\n", dev->name);
> +	}
> +
> +	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
> +		board_get_mtdparts("nor0", ids, parts);
> +
> +	mtd_initialized = true;
> +	*mtdids = ids;
> +	*mtdparts = parts;
> +	debug("%s:mtdids=%s & mtdparts=%s\n", __func__, ids, parts); } #endif
> +
> +#if defined(CONFIG_OF_BOARD_SETUP)
> +int ft_board_setup(void *blob, bd_t *bd) {
> +	return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_SET_DFU_ALT_INFO
> +#define DFU_ALT_BUF_LEN SZ_1K
> +
> +static void board_get_alt_info(const char *dev, char *buff) {
> +	char var_name[32] = "dfu_alt_info_";
> +	int ret;
> +
> +	ALLOC_CACHE_ALIGN_BUFFER(char, tmp_alt, DFU_ALT_BUF_LEN);
> +
> +	/* name of env variable to read = dfu_alt_info_<dev> */
> +	strcat(var_name, dev);
> +	ret = env_get_f(var_name, tmp_alt, DFU_ALT_BUF_LEN);
> +	if (ret) {
> +		if (buff[0] != '\0')
> +			strcat(buff, "&");
> +		strncat(buff, tmp_alt, DFU_ALT_BUF_LEN);
> +	}
> +}
> +
> +void set_dfu_alt_info(char *interface, char *devstr) {
> +	struct udevice *dev;
> +
> +	ALLOC_CACHE_ALIGN_BUFFER(char, buf, DFU_ALT_BUF_LEN);
> +
> +	if (env_get("dfu_alt_info"))
> +		return;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	/* probe all MTD devices */
> +	mtd_probe_devices();
> +
> +	board_get_alt_info("ram", buf);
> +
> +	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
> +		board_get_alt_info("mmc0", buf);
> +
> +	if (!uclass_get_device(UCLASS_MMC, 1, &dev))
> +		board_get_alt_info("mmc1", buf);
> +
> +	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
> +		board_get_alt_info("nor0", buf);
> +
> +	env_set("dfu_alt_info", buf);
> +	puts("DFU alt info setting: done\n");
> +}
> +#endif
> +
> +static void board_copro_image_process(ulong fw_image, size_t fw_size) {
> +	int ret, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
> +
> +	if (!rproc_is_initialized())
> +		if (rproc_init()) {
> +			printf("Remote Processor %d initialization failed\n",
> +			       id);
> +			return;
> +		}
> +
> +	ret = rproc_load(id, fw_image, fw_size);
> +	printf("Load Remote Processor %d with data@addr=0x%08lx %u
> bytes:%s\n",
> +	       id, fw_image, fw_size, ret ? " Failed!" : " Success!");
> +
> +	if (!ret) {
> +		rproc_start(id);
> +		env_set("copro_state", "booted");
> +	}
> +}
> +
> +U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO,
> board_copro_image_process);
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig
> b/configs/stm32mp15_dhcom_basic_defconfig
> new file mode 100644
> index 0000000000..58f9dbf7cc
> --- /dev/null
> +++ b/configs/stm32mp15_dhcom_basic_defconfig
> @@ -0,0 +1,138 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_STM32MP=y
> +CONFIG_SYS_MALLOC_F_LEN=0x3000
> +CONFIG_ENV_SIZE=0x4000
> +CONFIG_SPL_MMC_SUPPORT=y
> +CONFIG_SPL=y
> +CONFIG_TARGET_DH_STM32MP1_PDK2=y
> +CONFIG_SPL_SPI_FLASH_SUPPORT=y
> +CONFIG_SPL_SPI_SUPPORT=y
> +# CONFIG_ARMV7_VIRT is not set
> +CONFIG_SPL_TEXT_BASE=0x2FFC2500
> +CONFIG_DISTRO_DEFAULTS=y
> +CONFIG_FIT=y
> +CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
> +CONFIG_SPL_I2C_SUPPORT=y
> +CONFIG_SPL_MTD_SUPPORT=y
> +CONFIG_SPL_POWER_SUPPORT=y
> +CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
> +CONFIG_SYS_PROMPT="STM32MP> "
> +# CONFIG_CMD_BOOTD is not set
> +# CONFIG_CMD_ELF is not set
> +# CONFIG_CMD_IMI is not set
> +# CONFIG_CMD_XIMG is not set
> +# CONFIG_CMD_EXPORTENV is not set
> +CONFIG_CMD_EEPROM=y
> +CONFIG_CMD_MEMINFO=y
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_CMD_ADC=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_DFU=y
> +CONFIG_CMD_FUSE=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_GPT=y
> +CONFIG_CMD_I2C=y
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_MTD=y
> +CONFIG_CMD_REMOTEPROC=y
> +CONFIG_CMD_SPI=y
> +CONFIG_CMD_USB=y
> +CONFIG_CMD_USB_MASS_STORAGE=y
> +CONFIG_CMD_BMP=y
> +CONFIG_CMD_CACHE=y
> +CONFIG_CMD_TIME=y
> +CONFIG_CMD_TIMER=y
> +CONFIG_CMD_PMIC=y
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_CMD_EXT4_WRITE=y
> +CONFIG_CMD_MTDPARTS=y
> +# CONFIG_SPL_DOS_PARTITION is not set
> +CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-dhcom-pdk2-u-boot"
> +CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-
> extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names
> assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
> +CONFIG_ENV_IS_IN_SPI_FLASH=y
> +CONFIG_USE_ENV_SPI_BUS=y
> +CONFIG_ENV_SPI_BUS=0
> +CONFIG_USE_ENV_SPI_CS=y
> +CONFIG_ENV_SPI_CS=0
> +CONFIG_USE_ENV_SPI_MAX_HZ=y
> +CONFIG_ENV_SPI_MAX_HZ=10000000
> +CONFIG_USE_ENV_SPI_MODE=y
> +CONFIG_ENV_SPI_MODE=0x0
> +CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_IP_DEFRAG=y
> +CONFIG_TFTP_BLOCKSIZE=1536
> +CONFIG_STM32_ADC=y
> +CONFIG_SPL_BLOCK_CACHE=y
> +CONFIG_DFU_MMC=y
> +CONFIG_DFU_RAM=y
> +CONFIG_DFU_VIRT=y
> +CONFIG_DM_HWSPINLOCK=y
> +CONFIG_HWSPINLOCK_STM32=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_STM32F7=y
> +CONFIG_LED=y
> +CONFIG_LED_GPIO=y
> +CONFIG_DM_MAILBOX=y
> +CONFIG_STM32_IPCC=y
> +CONFIG_I2C_EEPROM=y
> +CONFIG_DM_MMC=y
> +CONFIG_SUPPORT_EMMC_BOOT=y
> +CONFIG_STM32_SDMMC2=y
> +CONFIG_MTD=y
> +CONFIG_DM_SPI_FLASH=y
> +CONFIG_SPI_FLASH_MACRONIX=y
> +CONFIG_SPI_FLASH_SPANSION=y
> +CONFIG_SPI_FLASH_STMICRO=y
> +CONFIG_SPI_FLASH_WINBOND=y
> +# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
> CONFIG_SPI_FLASH_MTD=y
> +CONFIG_SPL_SPI_FLASH_MTD=y CONFIG_DM_ETH=y
> CONFIG_DWC_ETH_QOS=y
> +CONFIG_PHY=y CONFIG_PHY_STM32_USBPHYC=y CONFIG_PINCONF=y #
> +CONFIG_SPL_PINCTRL_FULL is not set CONFIG_PINCTRL_STMFX=y
> +CONFIG_DM_PMIC=y # CONFIG_SPL_PMIC_CHILDREN is not set
> +CONFIG_PMIC_STPMIC1=y CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_REGULATOR_GPIO=y
> CONFIG_DM_REGULATOR_STM32_VREFBUF=y
> +CONFIG_DM_REGULATOR_STPMIC1=y
> +CONFIG_REMOTEPROC_STM32_COPRO=y
> +CONFIG_DM_RTC=y
> +CONFIG_RTC_STM32=y
> +CONFIG_SERIAL_RX_BUFFER=y
> +CONFIG_SPI=y
> +CONFIG_DM_SPI=y
> +CONFIG_STM32_QSPI=y
> +CONFIG_STM32_SPI=y
> +CONFIG_USB=y
> +CONFIG_DM_USB=y
> +CONFIG_DM_USB_GADGET=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_GENERIC=y
> +CONFIG_USB_GADGET=y
> +CONFIG_USB_GADGET_MANUFACTURER="dh"
> +CONFIG_USB_GADGET_VENDOR_NUM=0x0483
> +CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
> +CONFIG_USB_GADGET_DWC2_OTG=y
> +CONFIG_USB_GADGET_DOWNLOAD=y
> +CONFIG_USB_HOST_ETHER=y
> +CONFIG_USB_ETHER_ASIX=y
> +CONFIG_DM_VIDEO=y
> +CONFIG_BACKLIGHT_GPIO=y
> +CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
> +CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
> +CONFIG_VIDEO_STM32=y
> +CONFIG_VIDEO_STM32_DSI=y
> +CONFIG_VIDEO_STM32_MAX_XRES=1280
> +CONFIG_VIDEO_STM32_MAX_YRES=800
> +CONFIG_LZO=y
> +CONFIG_FDT_FIXUP_PARTITIONS=y
> --
> 2.24.1
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
