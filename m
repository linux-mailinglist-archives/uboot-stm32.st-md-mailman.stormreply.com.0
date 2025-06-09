Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BFCAD1972
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 09:58:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EB71C3F93A;
	Mon,  9 Jun 2025 07:58:39 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C40FC3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 07:58:38 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5597m0qR025193;
 Mon, 9 Jun 2025 09:58:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dnFAE0y//s5XYUjsRyA1whtFM13cKRcbqj0eURgPAaw=; b=GmtAstQ/XaiEWQLK
 hfXziWQYMtPcLAM9G9tHIw8p884PdX+159SeIpnfjs/m2lRV1YmCX5TJgFI+yMEn
 tCipUne8J+yug/d7xoFdMG0H7+P93lOMXVZ13WI0oW4qDoPKpXYaaZByl0lL/fzF
 07tgcSMXAvB0WhT2uWzncQacNMmYHoh5t1xqmuVhr3cPOenhp8onA5sGdu8M6dJE
 K1c4ceGA95cqyoopl7JLYaRrLotlMDawoxMeHXnjCbyHaZBRj3XJFMrLTg0a6sRN
 jtHkTcbzUT5UZcxNfay2ICTFSFdjBxUd44Pxp5/bu7W6c1DBPXpLmSucO5Xzt/Ws
 Jm5kwg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cnkjpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 09:58:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2CB4A40047;
 Mon,  9 Jun 2025 09:57:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9FA5B722A9;
 Mon,  9 Jun 2025 09:57:12 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 09:57:12 +0200
Message-ID: <f6792cac-7b3f-4745-ba3e-124eb8594f3f@foss.st.com>
Date: Mon, 9 Jun 2025 09:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <20250607093730.2249536-8-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250607093730.2249536-8-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_03,2025-06-05_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sumit Garg <sumit.garg@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 7/9] ARM: dts: stm32: support
	STM32h747i-disco board
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



On 6/7/25 11:37, Dario Binacchi wrote:
> The board includes an STM32H747XI SoC with the following resources:
>  - 2 Mbytes Flash
>  - 1 Mbyte SRAM
>  - LCD-TFT controller
>  - MIPI-DSI interface
>  - FD-CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>  - camera interface
> 
> Detailed information can be found at:
> https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Link: https://lore.kernel.org/r/20250427074404.3278732-9-dario.binacchi@amarulasolutions.com
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> [ backport upstream commit: 49ba8fc6eab63165639ffbb9f976222d39739cab ]
> 
> ---
> 
>  dts/upstream/src/arm/st/stm32h747i-disco.dts | 136 +++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 dts/upstream/src/arm/st/stm32h747i-disco.dts
> 
> diff --git a/dts/upstream/src/arm/st/stm32h747i-disco.dts b/dts/upstream/src/arm/st/stm32h747i-disco.dts
> new file mode 100644
> index 000000000000..99f0255dae8e
> --- /dev/null
> +++ b/dts/upstream/src/arm/st/stm32h747i-disco.dts
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + */
> +
> +/dts-v1/;
> +#include "stm32h743.dtsi"
> +#include "stm32h7-pinctrl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "STMicroelectronics STM32H747i-Discovery board";
> +	compatible = "st,stm32h747i-disco", "st,stm32h747";
> +
> +	chosen {
> +		bootargs = "root=/dev/ram";
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@d0000000 {
> +		device_type = "memory";
> +		reg = <0xd0000000 0x2000000>;
> +	};
> +
> +	aliases {
> +		serial0 = &usart1;
> +		serial1 = &uart8;
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
> +	leds {
> +		compatible = "gpio-leds";
> +		led-green {
> +			gpios = <&gpioi 12 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +		led-orange {
> +			gpios = <&gpioi 13 GPIO_ACTIVE_LOW>;
> +		};
> +		led-red {
> +			gpios = <&gpioi 14 GPIO_ACTIVE_LOW>;
> +		};
> +		led-blue {
> +			gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +		button-0 {
> +			label = "User";
> +			linux,code = <KEY_WAKEUP>;
> +			gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
> +		};
> +		button-1 {
> +			label = "JoySel";
> +			linux,code = <KEY_ENTER>;
> +			gpios = <&gpiok 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
> +		button-2 {
> +			label = "JoyDown";
> +			linux,code = <KEY_DOWN>;
> +			gpios = <&gpiok 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
> +		button-3 {
> +			label = "JoyUp";
> +			linux,code = <KEY_UP>;
> +			gpios = <&gpiok 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
> +		button-4 {
> +			label = "JoyLeft";
> +			linux,code = <KEY_LEFT>;
> +			gpios = <&gpiok 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
> +		button-5 {
> +			label = "JoyRight";
> +			linux,code = <KEY_RIGHT>;
> +			gpios = <&gpiok 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
> +	};
> +};
> +
> +&clk_hse {
> +	clock-frequency = <25000000>;
> +};
> +
> +&mac {
> +	status = "disabled";
> +	pinctrl-0 = <&ethernet_rmii>;
> +	pinctrl-names = "default";
> +	phy-mode = "rmii";
> +	phy-handle = <&phy0>;
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
> +	cd-gpios = <&gpioi 8 GPIO_ACTIVE_LOW>;
> +	broken-cd;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&usart1 {
> +	pinctrl-0 = <&usart1_pins_b>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&uart8 {
> +	pinctrl-0 = <&uart8_pins_a>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
