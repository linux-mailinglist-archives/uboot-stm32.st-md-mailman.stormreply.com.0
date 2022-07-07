Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A866569BCE
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:42:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E92D9C640F5;
	Thu,  7 Jul 2022 07:42:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 617A5C640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:42:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675wo79004707;
 Thu, 7 Jul 2022 09:42:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qyLHiyyRmnVu2puJ7zliVp0iBqCKyCkO47rPtl13xlc=;
 b=wYAcBBKiBYdzxcUlaOKbwxrHqQgowjsjjRfPgMk+wek430TW8An6YTipNE0o5deqvIqt
 irp0qhx7thKJxztVFTnAUtS+k3PIVQ6NqDJGMseg6kykQv8UBVVe87wdgA9LttlfpG7H
 gpju+JiTUi5CTCYbuPm0Tgxgmz8buZy3wsbEUYGTtJ5X6JP86OrImWMUZPhUhnk4V/Po
 Qasow3+EnEnzpNnIyWjsdtMBU3kVKxl089xeVQJYlL28OPr5TXDfDxLPrYKoRU9dTptQ
 ywUXtL5hKh2mDwfzokShOmcW5QRhN1UJX2WhuLbifc49k3s8zfcnyQqyjYK2/6ixbRFV Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ub43ue7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:42:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E80210002A;
 Thu,  7 Jul 2022 09:42:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A763210F8A;
 Thu,  7 Jul 2022 09:42:22 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:42:21 +0200
Message-ID: <956fef75-e81a-91bc-2555-6cc78b3edf35@foss.st.com>
Date: Thu, 7 Jul 2022 09:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] ARM: dts: stm32mp15: alignment with
	v5.19
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

On 7/5/22 16:55, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v5.19-rc1
> 
> - ARM: dts: stm32: Add alternate pinmux for ethernet0 pins
> - ARM: dts: stm32: Add alternate pinmux for mco2 pins
> - ARM: dts: stm32: fix pinctrl node name warnings (MPU soc)
> - ARM: dts: stm32: stm32mp15-pinctrl: add spi1-1 pinmux group
> - dt-bindings: clock: add IDs for SCMI clocks on stm32mp15
> - dt-bindings: reset: add IDs for SCMI reset domains on stm32mp15
> - dt-bindings: clock: stm32mp15: rename CK_SCMI define
> - dt-bindings: reset: stm32mp15: rename RST_SCMI define
> - dt-bindings: reset: add MCU HOLD BOOT ID for SCMI reset domains
>   on stm32mp15
> - dt-bindings: clk: cleanup comments
> - ARM: dts: align SPI NOR node name with dtschema
> - ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP15
> - ARM: dts: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)
> - ARM: dts: stm32: move SCMI related nodes in a dedicated file for
>   stm32mp15
> 
> + patch from stm32-dt-for-v5.19-fixes-2
> 
> - ARM: dts: stm32: move SCMI related nodes in a dedicated file for
>   stm32mp15
> - ARM: dts: stm32: fix pwr regulators references to use scmi
> - ARM: dts: stm32: use the correct clock source for CEC on stm32mp151
> - ARM: dts: stm32: DSI should use LSE SCMI clock on DK1/ED1 STM32 board
> - ARM: dts: stm32: delete fixed clock node on STM32MP15-SCMI
> - ARM: dts: stm32: add missing usbh clock and fix clk order on stm32mp15
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-pinctrl.dtsi         |  64 ++++++++++++
>  arch/arm/dts/stm32mp15-scmi.dtsi            | 109 ++++++++++++++++++++
>  arch/arm/dts/stm32mp151.dtsi                |  10 +-
>  arch/arm/dts/stm32mp157a-dk1-scmi.dts       |  79 ++++++++++++++
>  arch/arm/dts/stm32mp157c-dk2-scmi.dts       |  85 +++++++++++++++
>  arch/arm/dts/stm32mp157c-ed1-scmi.dts       |  84 +++++++++++++++
>  arch/arm/dts/stm32mp157c-ev1-scmi.dts       |  90 ++++++++++++++++
>  arch/arm/dts/stm32mp157c-ev1.dts            |   4 +-
>  include/dt-bindings/clock/stm32fx-clock.h   |   4 +-
>  include/dt-bindings/clock/stm32mp1-clks.h   |  23 +++++
>  include/dt-bindings/pinctrl/stm32-pinfunc.h |   1 +
>  include/dt-bindings/reset/stm32mp1-resets.h |  14 +++
>  12 files changed, 558 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm/dts/stm32mp15-scmi.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157a-dk1-scmi.dts
>  create mode 100644 arch/arm/dts/stm32mp157c-dk2-scmi.dts
>  create mode 100644 arch/arm/dts/stm32mp157c-ed1-scmi.dts
>  create mode 100644 arch/arm/dts/stm32mp157c-ev1-scmi.dts
> 
> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> index b92a149a186..d3ed10335df 100644
> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> @@ -379,6 +379,40 @@
>  		};
>  	};
>  
> +	ethernet0_rmii_pins_c: rmii-2 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH1_RMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, AF11)>, /* ETH1_RMII_TXD1 */
> +				 <STM32_PINMUX('B', 11, AF11)>, /* ETH1_RMII_TX_EN */
> +				 <STM32_PINMUX('A', 1, AF11)>,  /* ETH1_RMII_REF_CLK */
> +				 <STM32_PINMUX('A', 2, AF11)>,  /* ETH1_MDIO */
> +				 <STM32_PINMUX('C', 1, AF11)>;  /* ETH1_MDC */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('C', 4, AF11)>,  /* ETH1_RMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, AF11)>,  /* ETH1_RMII_RXD1 */
> +				 <STM32_PINMUX('A', 7, AF11)>;  /* ETH1_RMII_CRS_DV */
> +			bias-disable;
> +		};
> +	};
> +
> +	ethernet0_rmii_sleep_pins_c: rmii-sleep-2 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH1_RMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH1_RMII_TXD1 */
> +				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH1_RMII_TX_EN */
> +				 <STM32_PINMUX('A', 2, ANALOG)>,  /* ETH1_MDIO */
> +				 <STM32_PINMUX('C', 1, ANALOG)>,  /* ETH1_MDC */
> +				 <STM32_PINMUX('C', 4, ANALOG)>,  /* ETH1_RMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, ANALOG)>,  /* ETH1_RMII_RXD1 */
> +				 <STM32_PINMUX('A', 1, ANALOG)>,  /* ETH1_RMII_REF_CLK */
> +				 <STM32_PINMUX('A', 7, ANALOG)>;  /* ETH1_RMII_CRS_DV */
> +		};
> +	};
> +
>  	fmc_pins_a: fmc-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
> @@ -889,6 +923,21 @@
>  		};
>  	};
>  
> +	mco2_pins_a: mco2-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('G', 2, AF1)>; /* MCO2 */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +	};
> +
> +	mco2_sleep_pins_a: mco2-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('G', 2, ANALOG)>; /* MCO2 */
> +		};
> +	};
> +
>  	m_can1_pins_a: m-can1-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
> @@ -2331,4 +2380,19 @@
>  			bias-disable;
>  		};
>  	};
> +
> +	spi1_pins_b: spi1-1 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 5, AF5)>, /* SPI1_SCK */
> +				 <STM32_PINMUX('B', 5, AF5)>; /* SPI1_MOSI */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 6, AF5)>; /* SPI1_MISO */
> +			bias-disable;
> +		};
> +	};
>  };
> diff --git a/arch/arm/dts/stm32mp15-scmi.dtsi b/arch/arm/dts/stm32mp15-scmi.dtsi
> new file mode 100644
> index 00000000000..37d4547b3e8
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp15-scmi.dtsi
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +/ {
> +	firmware {
> +		optee: optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +
> +		scmi: scmi {
> +			compatible = "linaro,scmi-optee";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			linaro,optee-channel-id = <0>;
> +			shmem = <&scmi_shm>;
> +
> +			scmi_clk: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
> +
> +			scmi_reset: protocol@16 {
> +				reg = <0x16>;
> +				#reset-cells = <1>;
> +			};
> +
> +			scmi_voltd: protocol@17 {
> +				reg = <0x17>;
> +
> +				scmi_reguls: regulators {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					scmi_reg11: reg11@0 {
> +						reg = <0>;
> +						regulator-name = "reg11";
> +						regulator-min-microvolt = <1100000>;
> +						regulator-max-microvolt = <1100000>;
> +					};
> +
> +					scmi_reg18: reg18@1 {
> +						voltd-name = "reg18";
> +						reg = <1>;
> +						regulator-name = "reg18";
> +						regulator-min-microvolt = <1800000>;
> +						regulator-max-microvolt = <1800000>;
> +					};
> +
> +					scmi_usb33: usb33@2 {
> +						reg = <2>;
> +						regulator-name = "usb33";
> +						regulator-min-microvolt = <3300000>;
> +						regulator-max-microvolt = <3300000>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	soc {
> +		scmi_sram: sram@2ffff000 {
> +			compatible = "mmio-sram";
> +			reg = <0x2ffff000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x2ffff000 0x1000>;
> +
> +			scmi_shm: scmi-sram@0 {
> +				compatible = "arm,scmi-shmem";
> +				reg = <0 0x80>;
> +			};
> +		};
> +	};
> +};
> +
> +&reg11 {
> +	status = "disabled";
> +};
> +
> +&reg18 {
> +	status = "disabled";
> +};
> +
> +&usb33 {
> +	status = "disabled";
> +};
> +
> +&usbotg_hs {
> +	usb33d-supply = <&scmi_usb33>;
> +};
> +
> +&usbphyc {
> +	vdda1v1-supply = <&scmi_reg11>;
> +	vdda1v8-supply = <&scmi_reg18>;
> +};
> +
> +/delete-node/ &clk_hse;
> +/delete-node/ &clk_hsi;
> +/delete-node/ &clk_lse;
> +/delete-node/ &clk_lsi;
> +/delete-node/ &clk_csi;
> +/delete-node/ &reg11;
> +/delete-node/ &reg18;
> +/delete-node/ &usb33;
> +/delete-node/ &pwr_regulators;
> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
> index e74a5faf4a3..a5ac62c83d3 100644
> --- a/arch/arm/dts/stm32mp151.dtsi
> +++ b/arch/arm/dts/stm32mp151.dtsi
> @@ -583,7 +583,7 @@
>  			compatible = "st,stm32-cec";
>  			reg = <0x40016000 0x400>;
>  			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc CEC_K>, <&clk_lse>;
> +			clocks = <&rcc CEC_K>, <&rcc CEC>;
>  			clock-names = "cec", "hdmi-cec";
>  			status = "disabled";
>  		};
> @@ -1504,7 +1504,7 @@
>  		usbh_ohci: usb@5800c000 {
>  			compatible = "generic-ohci";
>  			reg = <0x5800c000 0x1000>;
> -			clocks = <&rcc USBH>, <&usbphyc>;
> +			clocks = <&usbphyc>, <&rcc USBH>;
>  			resets = <&rcc USBH_R>;
>  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
> @@ -1513,7 +1513,7 @@
>  		usbh_ehci: usb@5800d000 {
>  			compatible = "generic-ehci";
>  			reg = <0x5800d000 0x1000>;
> -			clocks = <&rcc USBH>;
> +			clocks = <&usbphyc>, <&rcc USBH>;
>  			resets = <&rcc USBH_R>;
>  			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
>  			companion = <&usbh_ohci>;
> @@ -1656,7 +1656,7 @@
>  		 * Break node order to solve dependency probe issue between
>  		 * pinctrl and exti.
>  		 */
> -		pinctrl: pin-controller@50002000 {
> +		pinctrl: pinctrl@50002000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "st,stm32mp157-pinctrl";
> @@ -1788,7 +1788,7 @@
>  			};
>  		};
>  
> -		pinctrl_z: pin-controller-z@54004000 {
> +		pinctrl_z: pinctrl@54004000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "st,stm32mp157-z-pinctrl";
> diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi.dts b/arch/arm/dts/stm32mp157a-dk1-scmi.dts
> new file mode 100644
> index 00000000000..e539cc80bef
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-dk1-scmi.dts
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +/dts-v1/;
> +
> +#include "stm32mp157a-dk1.dts"
> +#include "stm32mp15-scmi.dtsi"
> +
> +/ {
> +	model = "STMicroelectronics STM32MP157A-DK1 SCMI Discovery Board";
> +	compatible = "st,stm32mp157a-dk1-scmi", "st,stm32mp157a-dk1", "st,stm32mp157";
> +
> +	reserved-memory {
> +		optee@de000000 {
> +			reg = <0xde000000 0x2000000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	clocks = <&scmi_clk CK_SCMI_MPU>;
> +};
> +
> +&cpu1 {
> +	clocks = <&scmi_clk CK_SCMI_MPU>;
> +};
> +
> +&dsi {
> +	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +};
> +
> +&gpioz {
> +	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
> +};
> +
> +&hash1 {
> +	clocks = <&scmi_clk CK_SCMI_HASH1>;
> +	resets = <&scmi_reset RST_SCMI_HASH1>;
> +};
> +
> +&i2c4 {
> +	clocks = <&scmi_clk CK_SCMI_I2C4>;
> +	resets = <&scmi_reset RST_SCMI_I2C4>;
> +};
> +
> +&iwdg2 {
> +	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
> +};
> +
> +&mdma1 {
> +	resets = <&scmi_reset RST_SCMI_MDMA>;
> +};
> +
> +&mlahb {
> +	resets = <&scmi_reset RST_SCMI_MCU>;
> +};
> +
> +&rcc {
> +	compatible = "st,stm32mp1-rcc-secure", "syscon";
> +	clock-names = "hse", "hsi", "csi", "lse", "lsi";
> +	clocks = <&scmi_clk CK_SCMI_HSE>,
> +		 <&scmi_clk CK_SCMI_HSI>,
> +		 <&scmi_clk CK_SCMI_CSI>,
> +		 <&scmi_clk CK_SCMI_LSE>,
> +		 <&scmi_clk CK_SCMI_LSI>;
> +};
> +
> +&rng1 {
> +	clocks = <&scmi_clk CK_SCMI_RNG1>;
> +	resets = <&scmi_reset RST_SCMI_RNG1>;
> +};
> +
> +&rtc {
> +	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
> +};
> diff --git a/arch/arm/dts/stm32mp157c-dk2-scmi.dts b/arch/arm/dts/stm32mp157c-dk2-scmi.dts
> new file mode 100644
> index 00000000000..97e4f94b0a2
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-dk2-scmi.dts
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +/dts-v1/;
> +
> +#include "stm32mp157c-dk2.dts"
> +#include "stm32mp15-scmi.dtsi"
> +
> +/ {
> +	model = "STMicroelectronics STM32MP157C-DK2 SCMI Discovery Board";
> +	compatible = "st,stm32mp157c-dk2-scmi", "st,stm32mp157c-dk2", "st,stm32mp157";
> +
> +	reserved-memory {
> +		optee@de000000 {
> +			reg = <0xde000000 0x2000000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	clocks = <&scmi_clk CK_SCMI_MPU>;
> +};
> +
> +&cpu1 {
> +	clocks = <&scmi_clk CK_SCMI_MPU>;
> +};
> +
> +&cryp1 {
> +	clocks = <&scmi_clk CK_SCMI_CRYP1>;
> +	resets = <&scmi_reset RST_SCMI_CRYP1>;
> +};
> +
> +&dsi {
> +	phy-dsi-supply = <&scmi_reg18>;
> +	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +};
> +
> +&gpioz {
> +	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
> +};
> +
> +&hash1 {
> +	clocks = <&scmi_clk CK_SCMI_HASH1>;
> +	resets = <&scmi_reset RST_SCMI_HASH1>;
> +};
> +
> +&i2c4 {
> +	clocks = <&scmi_clk CK_SCMI_I2C4>;
> +	resets = <&scmi_reset RST_SCMI_I2C4>;
> +};
> +
> +&iwdg2 {
> +	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
> +};
> +
> +&mdma1 {
> +	resets = <&scmi_reset RST_SCMI_MDMA>;
> +};
> +
> +&mlahb {
> +	resets = <&scmi_reset RST_SCMI_MCU>;
> +};
> +
> +&rcc {
> +	compatible = "st,stm32mp1-rcc-secure", "syscon";
> +	clock-names = "hse", "hsi", "csi", "lse", "lsi";
> +	clocks = <&scmi_clk CK_SCMI_HSE>,
> +		 <&scmi_clk CK_SCMI_HSI>,
> +		 <&scmi_clk CK_SCMI_CSI>,
> +		 <&scmi_clk CK_SCMI_LSE>,
> +		 <&scmi_clk CK_SCMI_LSI>;
> +};
> +
> +&rng1 {
> +	clocks = <&scmi_clk CK_SCMI_RNG1>;
> +	resets = <&scmi_reset RST_SCMI_RNG1>;
> +};
> +
> +&rtc {
> +	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
> +};
> diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi.dts b/arch/arm/dts/stm32mp157c-ed1-scmi.dts
> new file mode 100644
> index 00000000000..9cf0a44d2f4
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-ed1-scmi.dts
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +/dts-v1/;
> +
> +#include "stm32mp157c-ed1.dts"
> +#include "stm32mp15-scmi.dtsi"
> +
> +/ {
> +	model = "STMicroelectronics STM32MP157C-ED1 SCMI eval daughter";
> +	compatible = "st,stm32mp157c-ed1-scmi", "st,stm32mp157c-ed1", "st,stm32mp157";
> +
> +	reserved-memory {
> +		optee@fe000000 {
> +			reg = <0xfe000000 0x2000000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	clocks = <&scmi_clk CK_SCMI_MPU>;
> +};
> +
> +&cpu1 {
> +	clocks = <&scmi_clk CK_SCMI_MPU>;
> +};
> +
> +&cryp1 {
> +	clocks = <&scmi_clk CK_SCMI_CRYP1>;
> +	resets = <&scmi_reset RST_SCMI_CRYP1>;
> +};
> +
> +&dsi {
> +	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +};
> +
> +&gpioz {
> +	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
> +};
> +
> +&hash1 {
> +	clocks = <&scmi_clk CK_SCMI_HASH1>;
> +	resets = <&scmi_reset RST_SCMI_HASH1>;
> +};
> +
> +&i2c4 {
> +	clocks = <&scmi_clk CK_SCMI_I2C4>;
> +	resets = <&scmi_reset RST_SCMI_I2C4>;
> +};
> +
> +&iwdg2 {
> +	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
> +};
> +
> +&mdma1 {
> +	resets = <&scmi_reset RST_SCMI_MDMA>;
> +};
> +
> +&mlahb {
> +	resets = <&scmi_reset RST_SCMI_MCU>;
> +};
> +
> +&rcc {
> +	compatible = "st,stm32mp1-rcc-secure", "syscon";
> +	clock-names = "hse", "hsi", "csi", "lse", "lsi";
> +	clocks = <&scmi_clk CK_SCMI_HSE>,
> +		 <&scmi_clk CK_SCMI_HSI>,
> +		 <&scmi_clk CK_SCMI_CSI>,
> +		 <&scmi_clk CK_SCMI_LSE>,
> +		 <&scmi_clk CK_SCMI_LSI>;
> +};
> +
> +&rng1 {
> +	clocks = <&scmi_clk CK_SCMI_RNG1>;
> +	resets = <&scmi_reset RST_SCMI_RNG1>;
> +};
> +
> +&rtc {
> +	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
> +};
> diff --git a/arch/arm/dts/stm32mp157c-ev1-scmi.dts b/arch/arm/dts/stm32mp157c-ev1-scmi.dts
> new file mode 100644
> index 00000000000..3b9dd6f4ccc
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-ev1-scmi.dts
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +/dts-v1/;
> +
> +#include "stm32mp157c-ev1.dts"
> +#include "stm32mp15-scmi.dtsi"
> +
> +/ {
> +	model = "STMicroelectronics STM32MP157C-EV1 SCMI eval daughter on eval mother";
> +	compatible = "st,stm32mp157c-ev1-scmi", "st,stm32mp157c-ev1", "st,stm32mp157c-ed1",
> +		     "st,stm32mp157";
> +
> +	reserved-memory {
> +		optee@fe000000 {
> +			reg = <0xfe000000 0x2000000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	clocks = <&scmi_clk CK_SCMI_MPU>;
> +};
> +
> +&cpu1 {
> +	clocks = <&scmi_clk CK_SCMI_MPU>;
> +};
> +
> +&cryp1 {
> +	clocks = <&scmi_clk CK_SCMI_CRYP1>;
> +	resets = <&scmi_reset RST_SCMI_CRYP1>;
> +};
> +
> +&dsi {
> +	phy-dsi-supply = <&scmi_reg18>;
> +	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +};
> +
> +&gpioz {
> +	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
> +};
> +
> +&hash1 {
> +	clocks = <&scmi_clk CK_SCMI_HASH1>;
> +	resets = <&scmi_reset RST_SCMI_HASH1>;
> +};
> +
> +&i2c4 {
> +	clocks = <&scmi_clk CK_SCMI_I2C4>;
> +	resets = <&scmi_reset RST_SCMI_I2C4>;
> +};
> +
> +&iwdg2 {
> +	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
> +};
> +
> +&m_can1 {
> +	clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
> +};
> +
> +&mdma1 {
> +	resets = <&scmi_reset RST_SCMI_MDMA>;
> +};
> +
> +&mlahb {
> +	resets = <&scmi_reset RST_SCMI_MCU>;
> +};
> +
> +&rcc {
> +	compatible = "st,stm32mp1-rcc-secure", "syscon";
> +	clock-names = "hse", "hsi", "csi", "lse", "lsi";
> +	clocks = <&scmi_clk CK_SCMI_HSE>,
> +		 <&scmi_clk CK_SCMI_HSI>,
> +		 <&scmi_clk CK_SCMI_CSI>,
> +		 <&scmi_clk CK_SCMI_LSE>,
> +		 <&scmi_clk CK_SCMI_LSI>;
> +};
> +
> +&rng1 {
> +	clocks = <&scmi_clk CK_SCMI_RNG1>;
> +	resets = <&scmi_reset RST_SCMI_RNG1>;
> +};
> +
> +&rtc {
> +	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
> +};
> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
> index e222d2d2cb4..d142dd30e16 100644
> --- a/arch/arm/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
> @@ -262,7 +262,7 @@
>  	#size-cells = <0>;
>  	status = "okay";
>  
> -	flash0: mx66l51235l@0 {
> +	flash0: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-rx-bus-width = <4>;
> @@ -271,7 +271,7 @@
>  		#size-cells = <1>;
>  	};
>  
> -	flash1: mx66l51235l@1 {
> +	flash1: flash@1 {
>  		compatible = "jedec,spi-nor";
>  		reg = <1>;
>  		spi-rx-bus-width = <4>;
> diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
> index 1cc89c54857..e5dad050d51 100644
> --- a/include/dt-bindings/clock/stm32fx-clock.h
> +++ b/include/dt-bindings/clock/stm32fx-clock.h
> @@ -7,10 +7,10 @@
>   */
>  
>  /*
> - * List of clocks wich are not derived from system clock (SYSCLOCK)
> + * List of clocks which are not derived from system clock (SYSCLOCK)
>   *
>   * The index of these clocks is the secondary index of DT bindings
> - * (see Documentatoin/devicetree/bindings/clock/st,stm32-rcc.txt)
> + * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
>   *
>   * e.g:
>  	<assigned-clocks = <&rcc 1 CLK_LSE>;
> diff --git a/include/dt-bindings/clock/stm32mp1-clks.h b/include/dt-bindings/clock/stm32mp1-clks.h
> index 4cdaf135829..25e8cfd4345 100644
> --- a/include/dt-bindings/clock/stm32mp1-clks.h
> +++ b/include/dt-bindings/clock/stm32mp1-clks.h
> @@ -248,4 +248,27 @@
>  
>  #define STM32MP1_LAST_CLK 232
>  
> +/* SCMI clock identifiers */
> +#define CK_SCMI_HSE		0
> +#define CK_SCMI_HSI		1
> +#define CK_SCMI_CSI		2
> +#define CK_SCMI_LSE		3
> +#define CK_SCMI_LSI		4
> +#define CK_SCMI_PLL2_Q		5
> +#define CK_SCMI_PLL2_R		6
> +#define CK_SCMI_MPU		7
> +#define CK_SCMI_AXI		8
> +#define CK_SCMI_BSEC		9
> +#define CK_SCMI_CRYP1		10
> +#define CK_SCMI_GPIOZ		11
> +#define CK_SCMI_HASH1		12
> +#define CK_SCMI_I2C4		13
> +#define CK_SCMI_I2C6		14
> +#define CK_SCMI_IWDG1		15
> +#define CK_SCMI_RNG1		16
> +#define CK_SCMI_RTC		17
> +#define CK_SCMI_RTCAPB		18
> +#define CK_SCMI_SPI6		19
> +#define CK_SCMI_USART1		20
> +
>  #endif /* _DT_BINDINGS_STM32MP1_CLKS_H_ */
> diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> index e6e07807894..e6fb8ada3f4 100644
> --- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
> +++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> @@ -39,3 +39,4 @@
>  #define STM32MP_PKG_AD	0x8
>  
>  #endif /* _DT_BINDINGS_STM32_PINFUNC_H */
> +
> diff --git a/include/dt-bindings/reset/stm32mp1-resets.h b/include/dt-bindings/reset/stm32mp1-resets.h
> index 702da37a2e8..4ffa7c3612e 100644
> --- a/include/dt-bindings/reset/stm32mp1-resets.h
> +++ b/include/dt-bindings/reset/stm32mp1-resets.h
> @@ -106,4 +106,18 @@
>  #define GPIOJ_R		19785
>  #define GPIOK_R		19786
>  
> +/* SCMI reset domain identifiers */
> +#define RST_SCMI_SPI6		0
> +#define RST_SCMI_I2C4		1
> +#define RST_SCMI_I2C6		2
> +#define RST_SCMI_USART1	3
> +#define RST_SCMI_STGEN		4
> +#define RST_SCMI_GPIOZ		5
> +#define RST_SCMI_CRYP1		6
> +#define RST_SCMI_HASH1		7
> +#define RST_SCMI_RNG1		8
> +#define RST_SCMI_MDMA		9
> +#define RST_SCMI_MCU		10
> +#define RST_SCMI_MCU_HOLD_BOOT	11
> +
>  #endif /* _DT_BINDINGS_STM32MP1_RESET_H_ */
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
