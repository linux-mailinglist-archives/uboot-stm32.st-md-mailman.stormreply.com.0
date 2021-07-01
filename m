Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 679F63B8E36
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:34:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B885C59783;
	Thu,  1 Jul 2021 07:34:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26FFCC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:34:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617UiJM011584; Thu, 1 Jul 2021 09:34:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=II+coauh2g7sbqc5W1GF+pqB8Kv1Yv8vf6I5KT45Z2g=;
 b=FCDrXXLWbBU4vVKIymPPUKrRTbU1mKqBc8uF2Dq1hCmda/SDQO9SABD2xQYvRR1MGOty
 baKekBl2wZDMG1XooLzIMfdjhj6ltuULnwNdbYiQWvyuVkKR7Ggen9s1a6Lm0h67LLak
 EitnMDTjiaGosQ7WpNPeCMKPMWcoe/IBOkAw2R73IT6WY7dMiB4Co44YYywizklXh3hG
 HdMQjHZEqL4mR7C7lKH5XwfR6z6byqSSd3iv8eCil1M3yT4MRbuIT26mUOZvIscONaJV
 XIxwWmYRcuR/fpRKpwqM6oGsLai+gKFBn5nifQUBEPeyuiDo0N05ewk9f7HmeuFTmMt/ Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h1xqa8g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:34:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8439810002A;
 Thu,  1 Jul 2021 09:34:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7611D212FCE;
 Thu,  1 Jul 2021 09:34:40 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:34:39 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210629120054.1.I66434b41cf76f1e6becd7612fea5f60f631b37d0@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6f2e517b-0f1f-b8fd-f2ec-396217d7ee47@foss.st.com>
Date: Thu, 1 Jul 2021 09:34:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629120054.1.I66434b41cf76f1e6becd7612fea5f60f631b37d0@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with v5.13
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

On 6/29/21 12:01 PM, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v5.13
> - ARM: dts: stm32: Add PTP clock to Ethernet controller
> - ARM: dts: stm32: enable the analog filter for all I2C nodes in
>   stm32mp151
> - ARM: dts: stm32: fix usart 2 & 3 pinconf to wake up with flow control
> - ARM: dts: stm32: Add wakeup management on stm32mp15x UART nodes
> - ARM: dts: stm32: add #clock-cells property to usbphyc node on stm32mp151
> - ARM: dts: stm32: Add STM32MP1 I2C6 SDA/SCL pinmux
> - ARM: dts: stm32: Rename mmc controller nodes to mmc@
> - ARM: dts: stm32: Add additional init state for SDMMC1 pins
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-pinctrl.dtsi | 61 +++++++++++++++++++++++++++--
>  arch/arm/dts/stm32mp151.dtsi        | 39 ++++++++++++------
>  2 files changed, 86 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> index 20a59e8f7a..060baa8b7e 100644
> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> @@ -1273,6 +1273,18 @@
>  		};
>  	};
>  
> +	sdmmc1_b4_init_pins_a: sdmmc1-b4-init-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +
>  	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> @@ -1299,6 +1311,17 @@
>  		};
>  	};
>  
> +	sdmmc1_dir_init_pins_a: sdmmc1-dir-init-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
> +				 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
> +				 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
> +			slew-rate = <1>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* SDMMC1_D0DIR */
> @@ -1868,10 +1891,15 @@
>  	usart2_idle_pins_c: usart2-idle-2 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
> -				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
>  				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
>  		};
>  		pins2 {
> +			pinmux = <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <3>;
> +		};
> +		pins3 {
>  			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
>  			bias-disable;
>  		};
> @@ -1917,10 +1945,15 @@
>  	usart3_idle_pins_b: usart3-idle-1 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
> -				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
>  				 <STM32_PINMUX('I', 10, ANALOG)>; /* USART3_CTS_NSS */
>  		};
>  		pins2 {
> +			pinmux = <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
>  			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
>  			bias-disable;
>  		};
> @@ -1953,10 +1986,15 @@
>  	usart3_idle_pins_c: usart3-idle-2 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
> -				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
>  				 <STM32_PINMUX('B', 13, ANALOG)>; /* USART3_CTS_NSS */
>  		};
>  		pins2 {
> +			pinmux = <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
>  			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
>  			bias-disable;
>  		};
> @@ -2018,6 +2056,23 @@
>  		};
>  	};
>  
> +	i2c6_pins_a: i2c6-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 6, AF2)>, /* I2C6_SCL */
> +				 <STM32_PINMUX('Z', 7, AF2)>; /* I2C6_SDA */
> +			bias-disable;
> +			drive-open-drain;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c6_sleep_pins_a: i2c6-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('Z', 6, ANALOG)>, /* I2C6_SCL */
> +				 <STM32_PINMUX('Z', 7, ANALOG)>; /* I2C6_SDA */
> +		};
> +	};
> +
>  	spi1_pins_a: spi1-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('Z', 0, AF5)>, /* SPI1_SCK */
> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
> index b564fc6269..177927d14e 100644
> --- a/arch/arm/dts/stm32mp151.dtsi
> +++ b/arch/arm/dts/stm32mp151.dtsi
> @@ -470,32 +470,36 @@
>  		usart2: serial@4000e000 {
>  			compatible = "st,stm32h7-uart";
>  			reg = <0x4000e000 0x400>;
> -			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc USART2_K>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
>  		usart3: serial@4000f000 {
>  			compatible = "st,stm32h7-uart";
>  			reg = <0x4000f000 0x400>;
> -			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&exti 28 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc USART3_K>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
>  		uart4: serial@40010000 {
>  			compatible = "st,stm32h7-uart";
>  			reg = <0x40010000 0x400>;
> -			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&exti 30 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc UART4_K>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
>  		uart5: serial@40011000 {
>  			compatible = "st,stm32h7-uart";
>  			reg = <0x40011000 0x400>;
> -			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&exti 31 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc UART5_K>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -511,6 +515,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x1>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -526,6 +531,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x2>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -541,6 +547,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x4>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -556,6 +563,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x10>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -595,16 +603,18 @@
>  		uart7: serial@40018000 {
>  			compatible = "st,stm32h7-uart";
>  			reg = <0x40018000 0x400>;
> -			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&exti 32 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc UART7_K>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
>  		uart8: serial@40019000 {
>  			compatible = "st,stm32h7-uart";
>  			reg = <0x40019000 0x400>;
> -			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&exti 33 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc UART8_K>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -683,8 +693,9 @@
>  		usart6: serial@44003000 {
>  			compatible = "st,stm32h7-uart";
>  			reg = <0x44003000 0x400>;
> -			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&exti 29 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc USART6_K>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -1065,7 +1076,7 @@
>  			};
>  		};
>  
> -		sdmmc3: sdmmc@48004000 {
> +		sdmmc3: mmc@48004000 {
>  			compatible = "arm,pl18x", "arm,primecell";
>  			arm,primecell-periphid = <0x00253180>;
>  			reg = <0x48004000 0x400>;
> @@ -1398,7 +1409,7 @@
>  			status = "disabled";
>  		};
>  
> -		sdmmc1: sdmmc@58005000 {
> +		sdmmc1: mmc@58005000 {
>  			compatible = "arm,pl18x", "arm,primecell";
>  			arm,primecell-periphid = <0x00253180>;
>  			reg = <0x58005000 0x1000>;
> @@ -1413,7 +1424,7 @@
>  			status = "disabled";
>  		};
>  
> -		sdmmc2: sdmmc@58007000 {
> +		sdmmc2: mmc@58007000 {
>  			compatible = "arm,pl18x", "arm,primecell";
>  			arm,primecell-periphid = <0x00253180>;
>  			reg = <0x58007000 0x1000>;
> @@ -1451,11 +1462,13 @@
>  				      "mac-clk-tx",
>  				      "mac-clk-rx",
>  				      "eth-ck",
> +				      "ptp_ref",
>  				      "ethstp";
>  			clocks = <&rcc ETHMAC>,
>  				 <&rcc ETHTX>,
>  				 <&rcc ETHRX>,
>  				 <&rcc ETHCK_K>,
> +				 <&rcc ETHPTP_K>,
>  				 <&rcc ETHSTP>;
>  			st,syscon = <&syscfg 0x4>;
>  			snps,mixed-burst;
> @@ -1512,6 +1525,7 @@
>  		usbphyc: usbphyc@5a006000 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			#clock-cells = <0>;
>  			compatible = "st,stm32mp1-usbphyc";
>  			reg = <0x5a006000 0x1000>;
>  			clocks = <&rcc USBPHY_K>;
> @@ -1534,8 +1548,9 @@
>  		usart1: serial@5c000000 {
>  			compatible = "st,stm32h7-uart";
>  			reg = <0x5c000000 0x400>;
> -			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&exti 26 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc USART1_K>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -1565,6 +1580,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x8>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -1605,6 +1621,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x20>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
