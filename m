Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0252E50C
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:31:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB021C56630;
	Fri, 20 May 2022 06:31:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A8A5C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:31:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JLrLtY004845;
 Fri, 20 May 2022 08:31:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6ub4sPmilAaTu/Af/4AFQJXiRYv7nbmQAGRfI/tHBbI=;
 b=e2i1PixjtnyfrkTVd2GRAYQt4Ux6KIJCAtCO6xsvSrUlqOvIX0lB1hiQj9h3UB283j4M
 Iwz1FbZIS1qFGqB7oGuuYbL0fy/pTKvR4TzWouDdWNSWorPon0Qqf3WI1IkaPmSXVuwA
 QPU633g0oJlR3RQwTjjTL1m+rFQnKOYzjGjvzGJqPgPzlhLgbG7r+CZs4CtpA9dWfkIj
 CWU7Nb4y0ccGDzNWROvjHDLc7WMX/5XuzmNNBLE6y1ucBNubO7nh9buXxIe2mHpPUkKM
 i1HrvI2HLfXfQTVIXlqE4eQSE0iLAkWwtrIPZtqo7R2obdClIfklzm19zEirh/I3WFT2 Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21umahem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:31:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0031100034;
 Fri, 20 May 2022 08:31:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8B6F211F0D;
 Fri, 20 May 2022 08:31:38 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:31:38 +0200
Message-ID: <53833f74-60c4-d3f7-b1f5-b9b636336983@foss.st.com>
Date: Fri, 20 May 2022 08:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.1.Ie3d027b1bf2a425d996e07a09ea8e5042ea26449@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.1.Ie3d027b1bf2a425d996e07a09ea8e5042ea26449@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 01/16] ARM: dts: stm32: add STM32MP13 SoCs
	support
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

On 5/6/22 16:06, Patrick Delaunay wrote:
> Add initial support of STM32MP13 family based on v5.18-rc2
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp13-pinctrl.dtsi | 123 ++++++++++
>  arch/arm/dts/stm32mp131.dtsi        | 358 ++++++++++++++++++++++++++++
>  arch/arm/dts/stm32mp133.dtsi        |  37 +++
>  arch/arm/dts/stm32mp135.dtsi        |  12 +
>  arch/arm/dts/stm32mp135f-dk.dts     |  57 +++++
>  arch/arm/dts/stm32mp13xc.dtsi       |  17 ++
>  arch/arm/dts/stm32mp13xf.dtsi       |  17 ++
>  board/st/stm32mp1/MAINTAINERS       |   1 +
>  8 files changed, 622 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp13-pinctrl.dtsi
>  create mode 100644 arch/arm/dts/stm32mp131.dtsi
>  create mode 100644 arch/arm/dts/stm32mp133.dtsi
>  create mode 100644 arch/arm/dts/stm32mp135.dtsi
>  create mode 100644 arch/arm/dts/stm32mp135f-dk.dts
>  create mode 100644 arch/arm/dts/stm32mp13xc.dtsi
>  create mode 100644 arch/arm/dts/stm32mp13xf.dtsi
> 
> diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> new file mode 100644
> index 0000000000..d2472cd8f1
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com>
> + */
> +#include <dt-bindings/pinctrl/stm32-pinfunc.h>
> +
> +&pinctrl {
> +	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> +			slew-rate = <1>;
> +			drive-open-drain;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
> +				 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
> +		};
> +	};
> +
> +	sdmmc1_clk_pins_a: sdmmc1-clk-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC2_D0 */
> +				 <STM32_PINMUX('B', 15, AF10)>, /* SDMMC2_D1 */
> +				 <STM32_PINMUX('B', 3, AF10)>, /* SDMMC2_D2 */
> +				 <STM32_PINMUX('B', 4, AF10)>, /* SDMMC2_D3 */
> +				 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC2_D0 */
> +				 <STM32_PINMUX('B', 15, AF10)>, /* SDMMC2_D1 */
> +				 <STM32_PINMUX('B', 3, AF10)>, /* SDMMC2_D2 */
> +				 <STM32_PINMUX('B', 4, AF10)>; /* SDMMC2_D3 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
> +			slew-rate = <1>;
> +			drive-open-drain;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
> +				 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
> +				 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
> +				 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
> +				 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
> +				 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
> +		};
> +	};
> +
> +	sdmmc2_clk_pins_a: sdmmc2-clk-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC2_CK */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	uart4_pins_a: uart4-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('D', 6, AF8)>; /* UART4_TX */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('D', 8, AF8)>; /* UART4_RX */
> +			bias-disable;
> +		};
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
> new file mode 100644
> index 0000000000..950e172e45
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp131.dtsi
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a7";
> +			device_type = "cpu";
> +			reg = <0>;
> +		};
> +	};
> +
> +	arm-pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>;
> +		interrupt-parent = <&intc>;
> +	};
> +
> +	clocks {
> +		clk_axi: clk-axi {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <266500000>;
> +		};
> +
> +		clk_hse: clk-hse {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +		};
> +
> +		clk_hsi: clk-hsi {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <64000000>;
> +		};
> +
> +		clk_lsi: clk-lsi {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +		};
> +
> +		clk_pclk3: clk-pclk3 {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <104438965>;
> +		};
> +
> +		clk_pclk4: clk-pclk4 {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <133250000>;
> +		};
> +
> +		clk_pll4_p: clk-pll4_p {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <50000000>;
> +		};
> +
> +		clk_pll4_r: clk-pll4_r {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <99000000>;
> +		};
> +	};
> +
> +	intc: interrupt-controller@a0021000 {
> +		compatible = "arm,cortex-a7-gic";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0xa0021000 0x1000>,
> +		      <0xa0022000 0x2000>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupt-parent = <&intc>;
> +		always-on;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +		ranges;
> +
> +		uart4: serial@40010000 {
> +			compatible = "st,stm32h7-uart";
> +			reg = <0x40010000 0x400>;
> +			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_hsi>;
> +			status = "disabled";
> +		};
> +
> +		dma1: dma-controller@48000000 {
> +			compatible = "st,stm32-dma";
> +			reg = <0x48000000 0x400>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_pclk4>;
> +			#dma-cells = <4>;
> +			st,mem2mem;
> +			dma-requests = <8>;
> +		};
> +
> +		dma2: dma-controller@48001000 {
> +			compatible = "st,stm32-dma";
> +			reg = <0x48001000 0x400>;
> +			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_pclk4>;
> +			#dma-cells = <4>;
> +			st,mem2mem;
> +			dma-requests = <8>;
> +		};
> +
> +		dmamux1: dma-router@48002000 {
> +			compatible = "st,stm32h7-dmamux";
> +			reg = <0x48002000 0x40>;
> +			clocks = <&clk_pclk4>;
> +			#dma-cells = <3>;
> +			dma-masters = <&dma1 &dma2>;
> +			dma-requests = <128>;
> +			dma-channels = <16>;
> +		};
> +
> +		exti: interrupt-controller@5000d000 {
> +			compatible = "st,stm32mp13-exti", "syscon";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			reg = <0x5000d000 0x400>;
> +		};
> +
> +		syscfg: syscon@50020000 {
> +			compatible = "st,stm32mp157-syscfg", "syscon";
> +			reg = <0x50020000 0x400>;
> +			clocks = <&clk_pclk3>;
> +		};
> +
> +		mdma: dma-controller@58000000 {
> +			compatible = "st,stm32h7-mdma";
> +			reg = <0x58000000 0x1000>;
> +			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_pclk4>;
> +			#dma-cells = <5>;
> +			dma-channels = <32>;
> +			dma-requests = <48>;
> +		};
> +
> +		sdmmc1: mmc@58005000 {
> +			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
> +			arm,primecell-periphid = <0x20253180>;
> +			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cmd_irq";
> +			clocks = <&clk_pll4_p>;
> +			clock-names = "apb_pclk";
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			max-frequency = <130000000>;
> +			status = "disabled";
> +		};
> +
> +		sdmmc2: mmc@58007000 {
> +			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
> +			arm,primecell-periphid = <0x20253180>;
> +			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
> +			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cmd_irq";
> +			clocks = <&clk_pll4_p>;
> +			clock-names = "apb_pclk";
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			max-frequency = <130000000>;
> +			status = "disabled";
> +		};
> +
> +		iwdg2: watchdog@5a002000 {
> +			compatible = "st,stm32mp1-iwdg";
> +			reg = <0x5a002000 0x400>;
> +			clocks = <&clk_pclk4>, <&clk_lsi>;
> +			clock-names = "pclk", "lsi";
> +			status = "disabled";
> +		};
> +
> +		bsec: efuse@5c005000 {
> +			compatible = "st,stm32mp13-bsec";
> +			reg = <0x5c005000 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			part_number_otp: part_number_otp@4 {
> +				reg = <0x4 0x2>;
> +			};
> +			ts_cal1: calib@5c {
> +				reg = <0x5c 0x2>;
> +			};
> +			ts_cal2: calib@5e {
> +				reg = <0x5e 0x2>;
> +			};
> +		};
> +
> +		/*
> +		 * Break node order to solve dependency probe issue between
> +		 * pinctrl and exti.
> +		 */
> +		pinctrl: pin-controller@50002000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "st,stm32mp135-pinctrl";
> +			ranges = <0 0x50002000 0x8400>;
> +			pins-are-numbered;
> +
> +			gpioa: gpio@50002000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				reg = <0x0 0x400>;
> +				clocks = <&clk_pclk4>;
> +				st,bank-name = "GPIOA";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 0 16>;
> +			};
> +
> +			gpiob: gpio@50003000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				reg = <0x1000 0x400>;
> +				clocks = <&clk_pclk4>;
> +				st,bank-name = "GPIOB";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 16 16>;
> +			};
> +
> +			gpioc: gpio@50004000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				reg = <0x2000 0x400>;
> +				clocks = <&clk_pclk4>;
> +				st,bank-name = "GPIOC";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 32 16>;
> +			};
> +
> +			gpiod: gpio@50005000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				reg = <0x3000 0x400>;
> +				clocks = <&clk_pclk4>;
> +				st,bank-name = "GPIOD";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 48 16>;
> +			};
> +
> +			gpioe: gpio@50006000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				reg = <0x4000 0x400>;
> +				clocks = <&clk_pclk4>;
> +				st,bank-name = "GPIOE";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 64 16>;
> +			};
> +
> +			gpiof: gpio@50007000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				reg = <0x5000 0x400>;
> +				clocks = <&clk_pclk4>;
> +				st,bank-name = "GPIOF";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 80 16>;
> +			};
> +
> +			gpiog: gpio@50008000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				reg = <0x6000 0x400>;
> +				clocks = <&clk_pclk4>;
> +				st,bank-name = "GPIOG";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 96 16>;
> +			};
> +
> +			gpioh: gpio@50009000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				reg = <0x7000 0x400>;
> +				clocks = <&clk_pclk4>;
> +				st,bank-name = "GPIOH";
> +				ngpios = <15>;
> +				gpio-ranges = <&pinctrl 0 112 15>;
> +			};
> +
> +			gpioi: gpio@5000a000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				reg = <0x8000 0x400>;
> +				clocks = <&clk_pclk4>;
> +				st,bank-name = "GPIOI";
> +				ngpios = <8>;
> +				gpio-ranges = <&pinctrl 0 128 8>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp133.dtsi b/arch/arm/dts/stm32mp133.dtsi
> new file mode 100644
> index 0000000000..0fb1386257
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp133.dtsi
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +#include "stm32mp131.dtsi"
> +
> +/ {
> +	soc {
> +		m_can1: can@4400e000 {
> +			compatible = "bosch,m_can";
> +			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&clk_hse>, <&clk_pll4_r>;
> +			clock-names = "hclk", "cclk";
> +			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
> +			status = "disabled";
> +		};
> +
> +		m_can2: can@4400f000 {
> +			compatible = "bosch,m_can";
> +			reg = <0x4400f000 0x400>, <0x44011000 0x2800>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&clk_hse>, <&clk_pll4_r>;
> +			clock-names = "hclk", "cclk";
> +			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
> +			status = "disabled";
> +		};
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp135.dtsi b/arch/arm/dts/stm32mp135.dtsi
> new file mode 100644
> index 0000000000..abf2acd37b
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp135.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +#include "stm32mp133.dtsi"
> +
> +/ {
> +	soc {
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
> new file mode 100644
> index 0000000000..ee100d108e
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp135f-dk.dts
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +/dts-v1/;
> +
> +#include "stm32mp135.dtsi"
> +#include "stm32mp13xf.dtsi"
> +#include "stm32mp13-pinctrl.dtsi"
> +
> +/ {
> +	model = "STMicroelectronics STM32MP135F-DK Discovery Board";
> +	compatible = "st,stm32mp135f-dk", "st,stm32mp135";
> +
> +	aliases {
> +		serial0 = &uart4;
> +	};
> +
> +	memory@c0000000 {
> +		device_type = "memory";
> +		reg = <0xc0000000 0x20000000>;
> +	};
> +
> +	vdd_sd: vdd-sd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_sd";
> +		regulator-min-microvolt = <2900000>;
> +		regulator-max-microvolt = <2900000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&iwdg2 {
> +	timeout-sec = <32>;
> +	status = "okay";
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_clk_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	broken-cd;
> +	disable-wp;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&vdd_sd>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart4_pins_a>;
> +	status = "okay";
> +};
> diff --git a/arch/arm/dts/stm32mp13xc.dtsi b/arch/arm/dts/stm32mp13xc.dtsi
> new file mode 100644
> index 0000000000..fa6889e305
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp13xc.dtsi
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +/ {
> +	soc {
> +		cryp: crypto@54002000 {
> +			compatible = "st,stm32mp1-cryp";
> +			reg = <0x54002000 0x400>;
> +			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_axi>;
> +			status = "disabled";
> +		};
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp13xf.dtsi b/arch/arm/dts/stm32mp13xf.dtsi
> new file mode 100644
> index 0000000000..fa6889e305
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp13xf.dtsi
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +/ {
> +	soc {
> +		cryp: crypto@54002000 {
> +			compatible = "st,stm32mp1-cryp";
> +			reg = <0x54002000 0x400>;
> +			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_axi>;
> +			status = "disabled";
> +		};
> +	};
> +};
> diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
> index 6451195269..d57a49820e 100644
> --- a/board/st/stm32mp1/MAINTAINERS
> +++ b/board/st/stm32mp1/MAINTAINERS
> @@ -3,6 +3,7 @@ M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
>  L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
>  T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
>  S:	Maintained
> +F:	arch/arm/dts/stm32mp13*
>  F:	arch/arm/dts/stm32mp15*
>  F:	board/st/stm32mp1/
>  F:	configs/stm32mp15_defconfig
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
