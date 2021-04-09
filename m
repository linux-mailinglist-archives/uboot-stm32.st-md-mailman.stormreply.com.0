Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FE3599C2
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 11:47:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30A2EC5719D;
	Fri,  9 Apr 2021 09:47:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9C91C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 09:47:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1399lcaO015051; Fri, 9 Apr 2021 11:47:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+BrUmTSxl2rgh5JMaBVyOWwUdbk2iuS9Jt9eOowBTYQ=;
 b=VpCH9IWESkAryCkKVtcZgkpYXGTibomNDm1+H1EIVKAWw6UPvC7ckxzW99T2pJ34QXlp
 g0wzY5c2UB1VuT9Yp77nij+cd5Y7AfLZGBewZF1IbJyGvJfp7ad7jdtvABkuAAKPNBg0
 g0hF9c3gl5N3yqYSE4Cq7c/ZODDFFStOQcKmU+k49FEOiif0N8joMyaaZPFMZQ1yhBAN
 oRurOTrUd0OMktw8bgF3zd0C174/wfV0tY2HoggN6TdUlxaUmOEYritWa1izHdF7v0Pm
 UCTj0flTu2b8WTtze94W3CGD/qedUmWY87CE6r/1IVmHo2tR4H0bZ6lU1rZwRjJT/ges oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tj16h4rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 11:47:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 722BA10002A;
 Fri,  9 Apr 2021 11:47:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56843228456;
 Fri,  9 Apr 2021 11:47:33 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 11:47:32 +0200
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <sjg@chromium.org>
References: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
 <1617953326-3110-6-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <e135c38b-284b-2f6c-9032-3832aa5c1606@foss.st.com>
Date: Fri, 9 Apr 2021 11:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617953326-3110-6-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v5 5/7] ARM: dts: stm32: add support for
 art-pi board based on stm32h750xbh6
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

Hi Dillon

On 4/9/21 9:28 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> This patchset has following changes:
> 
> - introduce stm32h750.dtsi to support stm32h750 value line
> - add pin groups for usart3/uart4/spi1/sdmmc2
> - add stm32h750i-art-pi.dtb (arch/arm/boot/dts/Makefile)
> - add stm32h750i-art-pi.dts to support art-pi board
> - add stm32h750i-art-pi-u-boot.dtsi to support art-pi board (u-boot)
> 
> art-pi board component:
> - 8MiB qspi flash
> - 16MiB spi flash
> - 32MiB sdram
> - ap6212 wifi&bt&fm
> 
> the detail board information can be found at:
> https://art-pi.gitee.io/website/
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> v5: no changes
> 
>  arch/arm/dts/Makefile                      |   3 +-
>  arch/arm/dts/stm32h7-pinctrl.dtsi          |  89 ++++++++++++++
>  arch/arm/dts/stm32h750.dtsi                |   5 +
>  arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi |  81 +++++++++++++
>  arch/arm/dts/stm32h750i-art-pi.dts         | 188 +++++++++++++++++++++++++++++
>  include/dt-bindings/memory/stm32-sdram.h   |   2 +
>  6 files changed, 367 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/stm32h750.dtsi
>  create mode 100644 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32h750i-art-pi.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index c671082..0f54801 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -454,7 +454,8 @@ dtb-$(CONFIG_STM32F7) += stm32f746-disco.dtb \
>  	stm32f769-disco.dtb \
>  	stm32746g-eval.dtb
>  dtb-$(CONFIG_STM32H7) += stm32h743i-disco.dtb \
> -	stm32h743i-eval.dtb
> +	stm32h743i-eval.dtb \
> +	stm32h750i-art-pi.dtb
>  
>  dtb-$(CONFIG_MACH_SUN4I) += \
>  	sun4i-a10-a1000.dtb \
> diff --git a/arch/arm/dts/stm32h7-pinctrl.dtsi b/arch/arm/dts/stm32h7-pinctrl.dtsi
> index f6968b5..aefa324 100644
> --- a/arch/arm/dts/stm32h7-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32h7-pinctrl.dtsi
> @@ -137,6 +137,80 @@
>  		};
>  	};
>  
> +	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('D', 6, AF11)>, /* SDMMC1_CK */
> +				 <STM32_PINMUX('D', 7, AF11)>; /* SDMMC1_CMD */
> +			slew-rate = <3>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
> +				 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('D', 6, AF11)>; /* SDMMC1_CK */
> +			slew-rate = <3>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2{
> +			pinmux = <STM32_PINMUX('D', 7, AF11)>; /* SDMMC1_CMD */
> +			slew-rate = <3>;
> +			drive-open-drain;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('D', 6, ANALOG)>, /* SDMMC1_CK */
> +				 <STM32_PINMUX('D', 7, ANALOG)>; /* SDMMC1_CMD */
> +		};
> +	};
> +
> +	spi1_pins: spi1-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 5, AF5)>,
> +				/* SPI1_CLK */
> +				 <STM32_PINMUX('B', 5, AF5)>;
> +				/* SPI1_MOSI */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('G', 9, AF5)>;
> +				/* SPI1_MISO */
> +			bias-disable;
> +		};
> +	};
> +
> +	uart4_pins: uart4-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('A', 0, AF8)>; /* UART4_TX */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('I', 9, AF8)>; /* UART4_RX */
> +			bias-disable;
> +		};
> +	};
> +
>  	usart1_pins: usart1-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
> @@ -163,6 +237,21 @@
>  		};
>  	};
>  
> +	usart3_pins: usart3-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
> +				 <STM32_PINMUX('D', 12, AF7)>; /* USART3_RTS_DE */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 11, AF7)>, /* USART3_RX */
> +				 <STM32_PINMUX('D', 11, AF7)>; /* USART3_CTS_NSS */
> +			bias-disable;
> +		};
> +	};
> +
>  	usbotg_hs_pins_a: usbotg-hs-0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('H', 4, AF10)>,	/* ULPI_NXT */
> diff --git a/arch/arm/dts/stm32h750.dtsi b/arch/arm/dts/stm32h750.dtsi
> new file mode 100644
> index 0000000..99533f3
> --- /dev/null
> +++ b/arch/arm/dts/stm32h750.dtsi
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/* Copyright (C) STMicroelectronics 2021 - All Rights Reserved */
> +
> +#include "stm32h743.dtsi"
> +
> diff --git a/arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi b/arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
> new file mode 100644
> index 0000000..326a553
> --- /dev/null
> +++ b/arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <stm32h7-u-boot.dtsi>
> +
> +&fmc {
> +	/*
> +	 * Memory configuration from sdram datasheet W9825G6KH
> +	 * first bank is bank@0
> +	 * second bank is bank@1
> +	 */
> +	bank1: bank@0 {
> +		st,sdram-control = /bits/ 8 <NO_COL_9
> +					     NO_ROW_13
> +					     MWIDTH_16
> +					     BANKS_4
> +					     CAS_2
> +					     SDCLK_3
> +					     RD_BURST_EN
> +					     RD_PIPE_DL_0>;
> +		st,sdram-timing = /bits/ 8 <TMRD_2
> +					    TXSR_6
> +					    TRAS_6
> +					    TRC_6
> +					    TRP_2
> +					    TWR_2
> +					    TRCD_2>;
> +		st,sdram-refcount = <677>;
> +	};
> +};
> +
> +&pinctrl {
> +	fmc_pins: fmc@0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('D', 0, AF12)>,
> +				 <STM32_PINMUX('D', 1, AF12)>,
> +				 <STM32_PINMUX('D', 8, AF12)>,
> +				 <STM32_PINMUX('D', 9, AF12)>,
> +				 <STM32_PINMUX('D',10, AF12)>,
> +				 <STM32_PINMUX('D',14, AF12)>,
> +				 <STM32_PINMUX('D',15, AF12)>,
> +
> +				 <STM32_PINMUX('E', 0, AF12)>,
> +				 <STM32_PINMUX('E', 1, AF12)>,
> +				 <STM32_PINMUX('E', 7, AF12)>,
> +				 <STM32_PINMUX('E', 8, AF12)>,
> +				 <STM32_PINMUX('E', 9, AF12)>,
> +				 <STM32_PINMUX('E',10, AF12)>,
> +				 <STM32_PINMUX('E',11, AF12)>,
> +				 <STM32_PINMUX('E',12, AF12)>,
> +				 <STM32_PINMUX('E',13, AF12)>,
> +				 <STM32_PINMUX('E',14, AF12)>,
> +				 <STM32_PINMUX('E',15, AF12)>,
> +
> +				 <STM32_PINMUX('F', 0, AF12)>,
> +				 <STM32_PINMUX('F', 1, AF12)>,
> +				 <STM32_PINMUX('F', 2, AF12)>,
> +				 <STM32_PINMUX('F', 3, AF12)>,
> +				 <STM32_PINMUX('F', 4, AF12)>,
> +				 <STM32_PINMUX('F', 5, AF12)>,
> +				 <STM32_PINMUX('F',11, AF12)>,
> +				 <STM32_PINMUX('F',12, AF12)>,
> +				 <STM32_PINMUX('F',13, AF12)>,
> +				 <STM32_PINMUX('F',14, AF12)>,
> +				 <STM32_PINMUX('F',15, AF12)>,
> +
> +				 <STM32_PINMUX('G', 0, AF12)>,
> +				 <STM32_PINMUX('G', 1, AF12)>,
> +				 <STM32_PINMUX('G', 2, AF12)>,
> +				 <STM32_PINMUX('G', 4, AF12)>,
> +				 <STM32_PINMUX('G', 5, AF12)>,
> +				 <STM32_PINMUX('G', 8, AF12)>,
> +				 <STM32_PINMUX('G',15, AF12)>,
> +
> +				 <STM32_PINMUX('H', 5, AF12)>,
> +				 <STM32_PINMUX('C', 2, AF12)>,
> +				 <STM32_PINMUX('C', 3, AF12)>;
> +
> +			slew-rate = <3>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/dts/stm32h750i-art-pi.dts b/arch/arm/dts/stm32h750i-art-pi.dts
> new file mode 100644
> index 0000000..2a4d1cb
> --- /dev/null
> +++ b/arch/arm/dts/stm32h750i-art-pi.dts
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
> +/*
> + * Copyright 2021 - Dillon Min <dillon.minfei@gmail.com>
> + *
> + */
> +
> +/dts-v1/;
> +#include "stm32h750.dtsi"
> +#include "stm32h7-pinctrl.dtsi"
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "RT-Thread STM32H750i-ART-PI board";
> +	compatible = "st,stm32h750i-art-pi", "st,stm32h750";
> +
> +	chosen {
> +		bootargs = "root=/dev/ram";
> +		stdout-path = "serial0:2000000n8";
> +	};
> +
> +	memory@c0000000 {
> +		device_type = "memory";
> +		reg = <0xc0000000 0x2000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			no-map;
> +			size = <0x100000>;
> +			linux,dma-default;
> +		};
> +	};
> +
> +	aliases {
> +		serial0 = &uart4;
> +		serial1 = &usart3;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		led-red {
> +			gpios = <&gpioi 8 0>;
> +		};
> +		led-green {
> +			gpios = <&gpioc 15 0>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	v3v3: regulator-v3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	wlan_pwr: regulator-wlan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "wl-reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&clk_hse {
> +	clock-frequency = <25000000>;
> +};
> +
> +&dma1 {
> +	status = "okay";
> +};
> +
> +&dma2 {
> +	status = "okay";
> +};
> +
> +&mac {
> +	status = "disabled";
> +	pinctrl-0	= <&ethernet_rmii>;
> +	pinctrl-names	= "default";
> +	phy-mode	= "rmii";
> +	phy-handle	= <&phy0>;
> +
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +	};
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	broken-cd;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc2_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
> +	broken-cd;
> +	non-removable;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&wlan_pwr>;
> +	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	brcmf: bcrmf@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-0 = <&spi1_pins>;
> +	pinctrl-names = "default";
> +	cs-gpios = <&gpioa 4 GPIO_ACTIVE_LOW>;
> +	dmas = <&dmamux1 37 0x400 0x05>,
> +	       <&dmamux1 38 0x400 0x05>;
> +	dma-names = "rx", "tx";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "winbond,w25q128", "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <80000000>;
> +
> +		partition@0 {
> +			label = "root filesystem";
> +			reg = <0 0x1000000>;
> +		};
> +	};
> +};
> +
> +&usart2 {
> +	pinctrl-0 = <&usart2_pins>;
> +	pinctrl-names = "default";
> +	status = "disabled";
> +};
> +
> +&usart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usart3_pins>;
> +	dmas = <&dmamux1 45 0x400 0x05>,
> +	       <&dmamux1 46 0x400 0x05>;
> +	dma-names = "rx", "tx";
> +	st,hw-flow-ctrl;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		host-wakeup-gpios = <&gpioc 0 GPIO_ACTIVE_HIGH>;
> +		device-wakeup-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
> +		max-speed = <115200>;
> +	};
> +};
> +
> +&uart4 {
> +	pinctrl-0 = <&uart4_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> diff --git a/include/dt-bindings/memory/stm32-sdram.h b/include/dt-bindings/memory/stm32-sdram.h
> index ab91d2b..90ef2e1 100644
> --- a/include/dt-bindings/memory/stm32-sdram.h
> +++ b/include/dt-bindings/memory/stm32-sdram.h
> @@ -34,8 +34,10 @@
>  #define TXSR_1		(1 - 1)
>  #define TXSR_6		(6 - 1)
>  #define TXSR_7		(7 - 1)
> +#define TXSR_8		(8 - 1)
>  #define TRAS_1		(1 - 1)
>  #define TRAS_4		(4 - 1)
> +#define TRAS_6		(6 - 1)
>  #define TRC_6		(6 - 1)
>  #define TWR_1		(1 - 1)
>  #define TWR_2		(2 - 1)
> 

Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
