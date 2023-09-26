Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D127AE860
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 10:55:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 806A1C6B473;
	Tue, 26 Sep 2023 08:55:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B05C9C6B462
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 08:55:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38Q8QVNA002682; Tue, 26 Sep 2023 10:55:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=N9HQ+DBWjPVAo3lMs1Lx0XxBB7mUf8ptGawnUzKz8wk=; b=iK
 8hDaGHZ/xXs5i8N7mxtxjBv6RpjGHCozAtwzOzW1zBMBInfizkl52eyaR/DSHtq5
 1ioBqdiNY/cILKclwSeWdjHC4Lmy9MW+as909rjgsoRlsS208j1xr+6saNyOmMuV
 4wPkvuJBft3M4e06DRUgnRVOjzDSDiEKi7jp1B4c8E8yol7CseNLJzTAM0D+uJDS
 l8pr7QGnrHDG+HHnWZxCsuIVs+gM5sSt6yCJ9kzM7GsknChwZwGJDhsQCRV2IfXZ
 FhJeA03AwhsiIz0Sqij5EbZCHl1qGunDwxpI1l2A1/HwvwWW38kx56oY+tAfuD+h
 q3B/or4gyJy6IFWcGQGw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9qbwuawp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 10:55:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B653110005A;
 Tue, 26 Sep 2023 10:55:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD85922A6D5;
 Tue, 26 Sep 2023 10:55:18 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 10:55:18 +0200
Message-ID: <1742a775-d3d5-a418-54ba-eaf0a7704217@foss.st.com>
Date: Tue, 26 Sep 2023 10:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
 <20230903204849.660722-11-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230903204849.660722-11-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 10/10] ARM: dts: stm32: support display on
 stm32f746-disco board
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



On 9/3/23 22:48, Dario Binacchi wrote:
> The patch applies the changes from Linux commit 10a970bc3ebfa ("ARM: dts:
> stm32: support display on stm32f746-disco board") and removes the same
> settings from stm32f746-disco-u-boot.dtsi.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  arch/arm/dts/stm32f746-disco-u-boot.dtsi | 89 ++++++------------------
>  arch/arm/dts/stm32f746-disco.dts         | 44 ++++++++++++
>  2 files changed, 66 insertions(+), 67 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> index 3c2b9fc59512..1b42d6cbbc19 100644
> --- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> @@ -23,12 +23,6 @@
>  		spi0 = &qspi;
>  	};
>  
> -	backlight: backlight {
> -		compatible = "gpio-backlight";
> -		gpios = <&gpiok 3 0>;
> -		status = "okay";
> -	};
> -
>  	button1 {
>  		compatible = "st,button1";
>  		button-gpio = <&gpioi 11 0>;
> @@ -38,37 +32,10 @@
>  		compatible = "st,led1";
>  		led-gpio = <&gpioi 1 0>;
>  	};
> -
> -	panel-rgb@0 {
> -		compatible = "simple-panel";
> -		backlight = <&backlight>;
> -		enable-gpios = <&gpioi 12 0>;
> -		status = "okay";
> -
> -		display-timings {
> -			timing@0 {
> -				clock-frequency = <9000000>;
> -				hactive = <480>;
> -				vactive = <272>;
> -				hfront-porch = <2>;
> -				hback-porch = <2>;
> -				hsync-len = <41>;
> -				vfront-porch = <2>;
> -				vback-porch = <2>;
> -				vsync-len = <10>;
> -				hsync-active = <0>;
> -				vsync-active = <0>;
> -				de-active = <1>;
> -				pixelclk-active = <1>;
> -			};
> -		};
> -	};
>  };
>  
>  &ltdc {
>  	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
> -	pinctrl-0 = <&ltdc_pins>;
> -	status = "okay";
>  	bootph-all;
>  };
>  
> @@ -96,6 +63,28 @@
>  	};
>  };
>  
> +&panel_rgb {
> +	compatible = "simple-panel";
> +
> +	display-timings {
> +		timing@0 {
> +			clock-frequency = <9000000>;
> +			hactive = <480>;
> +			vactive = <272>;
> +			hfront-porch = <2>;
> +			hback-porch = <2>;
> +			hsync-len = <41>;
> +			vfront-porch = <2>;
> +			vback-porch = <2>;
> +			vsync-len = <10>;
> +			hsync-active = <0>;
> +			vsync-active = <0>;
> +			de-active = <1>;
> +			pixelclk-active = <1>;
> +		};
> +	};
> +};
> +
>  &pinctrl {
>  	ethernet_mii: mii@0 {
>  		pins {
> @@ -160,40 +149,6 @@
>  		};
>  	};
>  
> -	ltdc_pins: ltdc@0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('E', 4, AF14)>, /* B0 */
> -				 <STM32_PINMUX('G',12, AF9)>,  /* B4 */
> -				 <STM32_PINMUX('I', 9, AF14)>, /* VSYNC */
> -				 <STM32_PINMUX('I',10, AF14)>, /* HSYNC */
> -				 <STM32_PINMUX('I',14, AF14)>, /* CLK */
> -				 <STM32_PINMUX('I',15, AF14)>, /* R0 */
> -				 <STM32_PINMUX('J', 0, AF14)>, /* R1 */
> -				 <STM32_PINMUX('J', 1, AF14)>, /* R2 */
> -				 <STM32_PINMUX('J', 2, AF14)>, /* R3 */
> -				 <STM32_PINMUX('J', 3, AF14)>, /* R4 */
> -				 <STM32_PINMUX('J', 4, AF14)>, /* R5 */
> -				 <STM32_PINMUX('J', 5, AF14)>, /* R6 */
> -				 <STM32_PINMUX('J', 6, AF14)>, /* R7 */
> -				 <STM32_PINMUX('J', 7, AF14)>, /* G0 */
> -				 <STM32_PINMUX('J', 8, AF14)>, /* G1 */
> -				 <STM32_PINMUX('J', 9, AF14)>, /* G2 */
> -				 <STM32_PINMUX('J',10, AF14)>, /* G3 */
> -				 <STM32_PINMUX('J',11, AF14)>, /* G4 */
> -				 <STM32_PINMUX('J',13, AF14)>, /* B1 */
> -				 <STM32_PINMUX('J',14, AF14)>, /* B2 */
> -				 <STM32_PINMUX('J',15, AF14)>, /* B3 */
> -				 <STM32_PINMUX('K', 0, AF14)>, /* G5 */
> -				 <STM32_PINMUX('K', 1, AF14)>, /* G6 */
> -				 <STM32_PINMUX('K', 2, AF14)>, /* G7 */
> -				 <STM32_PINMUX('K', 4, AF14)>, /* B5 */
> -				 <STM32_PINMUX('K', 5, AF14)>, /* B6 */
> -				 <STM32_PINMUX('K', 6, AF14)>, /* B7 */
> -				 <STM32_PINMUX('K', 7, AF14)>; /* DE */
> -			slew-rate = <2>;
> -		};
> -	};
> -
>  	qspi_pins: qspi@0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('B', 2, AF9)>, /* CLK */
> diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
> index e1564d69f9f6..431275134033 100644
> --- a/arch/arm/dts/stm32f746-disco.dts
> +++ b/arch/arm/dts/stm32f746-disco.dts
> @@ -25,6 +25,19 @@
>  		reg = <0xC0000000 0x800000>;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			no-map;
> +			size = <0x80000>;
> +			linux,dma-default;
> +		};
> +	};
> +
>  	aliases {
>  		serial0 = &usart1;
>  	};
> @@ -50,6 +63,25 @@
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  	};
> +
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&gpiok 3 GPIO_ACTIVE_HIGH>;
> +		status = "okay";
> +	};
> +
> +	panel_rgb: panel-rgb {
> +		compatible = "rocktech,rk043fn48h";
> +		power-supply = <&vcc_3v3>;
> +		backlight = <&backlight>;
> +		enable-gpios = <&gpioi 12 GPIO_ACTIVE_HIGH>;
> +		status = "okay";
> +		port {
> +			panel_in_rgb: endpoint {
> +				remote-endpoint = <&ltdc_out_rgb>;
> +			};
> +		};
> +	};
>  };
>  
>  &clk_hse {
> @@ -80,6 +112,18 @@
>  	};
>  };
>  
> +&ltdc {
> +	pinctrl-0 = <&ltdc_pins_a>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	port {
> +		ltdc_out_rgb: endpoint {
> +			remote-endpoint = <&panel_in_rgb>;
> +		};
> +	};
> +};
> +
>  &sdio1 {
>  	status = "okay";
>  	vmmc-supply = <&vcc_3v3>;

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
