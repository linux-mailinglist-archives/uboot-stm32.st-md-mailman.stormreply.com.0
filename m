Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F5034950F
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Mar 2021 16:13:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19A4FC57B5E;
	Thu, 25 Mar 2021 15:13:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA320C5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 15:13:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PFB8kq022055; Thu, 25 Mar 2021 16:13:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1z5XbeQxbCw2sCz5zQZMJC7Cz0FV4vD2qUCJHlqAcoY=;
 b=Q9iQVbL0I2+JTpbSHKtvzVU8nT5XqiY4j/S7WZP2LbX1HdlYryLa4ZJhIDmV3NkUHQIE
 I6A+C8T87V3lfVk1a/yrOva+t15T+qK6jcThCmnbbH1rBQqDRVEIdNjNZQAR9A2+MgnX
 ZrrYNpxInhtrO5e4GKIxHiWp24UGtclYDiTpgJrxDl1hw1tX+9vVBniRcPnxvFReOoLa
 9vfhCx9qZJJqhatraLFwPC0J1FZjCFSjjahWi/M1pWgW90Pb+2reNJssYnQGfdpFfDTt
 XMUapGRApgzQJ1oQQMOhYjO3JWGjk2RKrhyJfPJCEWZVWl4X6WYSjjMtezLNkRJz4yTN 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d996w6tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 16:13:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07E4F10002A;
 Thu, 25 Mar 2021 16:13:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB34A27397E;
 Thu, 25 Mar 2021 16:13:16 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 16:13:15 +0100
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>, <uboot-stm32@st-md-mailman.stormreply.com>
References: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
 <1615445040-13757-3-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <ba9ce311-67c9-eab0-73cf-183f7a09f7c5@foss.st.com>
Date: Thu, 25 Mar 2021 16:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615445040-13757-3-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_04:2021-03-24,
 2021-03-25 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 2/4] ARM: dts: stm32: Add RT-Thread art-pi
	board support
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

Some remarks below

On 3/11/21 7:43 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> All these files are add for support rt-thread art-pi board
> 
> the detail board information can be found at:
> https://art-pi.gitee.io/website/
> 
> board resources:
> - stm32h750xbh6 128k flash, 1024k sram
> - 32MiB sdram
> - 16MiB spi flash
> - 8MiB qspi flash
> - onboard wifi, bt, fm
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  arch/arm/dts/Makefile                      |   3 +-
>  arch/arm/dts/stm32h743.dtsi                |   8 +
>  arch/arm/dts/stm32h750-pinctrl.dtsi        | 319 +++++++++++++++++++++++++++++
>  arch/arm/dts/stm32h750.dtsi                |   5 +
>  arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi |  81 ++++++++
>  arch/arm/dts/stm32h750i-art-pi.dts         |  75 +++++++
>  include/dt-bindings/memory/stm32-sdram.h   |   2 +
>  7 files changed, 492 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/stm32h750-pinctrl.dtsi
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
> diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
> index e4e4723..bb3e2bf 100644
> --- a/arch/arm/dts/stm32h743.dtsi
> +++ b/arch/arm/dts/stm32h743.dtsi
> @@ -99,6 +99,14 @@
>  			clocks = <&rcc USART2_CK>;
>  		};
>  
> +		uart4: serial@40004c00 {
> +			compatible = "st,stm32h7-uart";
> +			reg = <0x40004c00 0x400>;
> +			interrupts = <52>;
> +			status = "disabled";
> +			clocks = <&rcc UART4_CK>;
> +		};
> +
>  		i2c1: i2c@40005400 {
>  			compatible = "st,stm32f7-i2c";
>  			#address-cells = <1>;
> diff --git a/arch/arm/dts/stm32h750-pinctrl.dtsi b/arch/arm/dts/stm32h750-pinctrl.dtsi
> new file mode 100644
> index 0000000..dd88ace
> --- /dev/null
> +++ b/arch/arm/dts/stm32h750-pinctrl.dtsi
> @@ -0,0 +1,319 @@
> +/*
> + * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
> + *


Should be your name here. But this file should be replaced by the kernel version as i explained in the cover-letter

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
> index 0000000..79e8ba5
> --- /dev/null
> +++ b/arch/arm/dts/stm32h750i-art-pi.dts
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
> +/*
> + * Copyright 2021 - Dillon Min <dillon.minfei@gmail.com>
> + *
> + */
> +
> +/dts-v1/;
> +#include "stm32h750.dtsi"
> +#include "stm32h750-pinctrl.dtsi"
> +
> +/ {
> +	model = "RT-Thread STM32H750i-Art-Pi board";
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
> +	aliases {
> +		serial0 = &uart4;
> +	};
> +
> +	v3v3: regulator-v3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&clk_hse {
> +	clock-frequency = <25000000>;
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
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
