Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA1A9F277
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Apr 2025 15:35:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 187DEC78034;
	Mon, 28 Apr 2025 13:35:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0E66C78F63
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 13:25:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9eUif010502;
 Mon, 28 Apr 2025 15:24:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 hdHJvOymgIGnXU1s0UgN0+vvcL4D2v09lc1j8T1ViVU=; b=AyfQUcWIWgD7G40Y
 dcCONaTBRbQrXRi+rKB+jeKA1oCNi1z7PuxsipkJ37zMv82+bf0YU98Ua/HVomnf
 FqjE1+6iuQQ4/ctqTDt8O97HNKPA+wzqygl4vJLjHUzFkXlOIiY5nWEduuVdtsdi
 R0gSd21rt3PRImCIdNunByBKnx47kOxyC4yk+joZG1qnaf/n7wd8Bh+dhqam5p8q
 9zAuGTE3AbjoHq0LyuLuXjItarm5iG/uJh/HXI0W8iSfRc7vPH/wgtPlRo249Szr
 cA8wu0cWV1OfxaPWugXZL1FNQTIeDky7h83MgzSLEJHxBkDKoba1fxe9uXh946LY
 hM7E1Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg6qp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 15:24:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4EE5B4008F;
 Mon, 28 Apr 2025 15:23:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52A22A7B069;
 Mon, 28 Apr 2025 15:21:23 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 15:21:20 +0200
Message-ID: <3c37899a-4904-4d08-b735-e3de8cbc76f0@foss.st.com>
Date: Mon, 28 Apr 2025 15:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250422131229.415020-1-patrice.chotard@foss.st.com>
 <20250422131229.415020-6-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250422131229.415020-6-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Mailman-Approved-At: Mon, 28 Apr 2025 13:35:36 +0000
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Fabio Estevam <festevam@denx.de>,
 Bernhard Messerklinger <bernhard.messerklinger@br-automation.com>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Prasad
 Kummari <prasad.kummari@amd.com>, Sughosh
 Ganu <sughosh.ganu@linaro.org>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Michal Simek <michal.simek@amd.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v2 05/13] ARM: dts: stm32: convert
 stm32mp13 board to OF_UPSTREAM
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



On 4/22/25 15:12, Patrice Chotard wrote:
> Enable OF_UPSTREAM flag for STM32MP13 platforms.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm/dts/Makefile               |    3 -
>  arch/arm/dts/stm32mp13-pinctrl.dtsi |  888 ---------------
>  arch/arm/dts/stm32mp131.dtsi        | 1567 ---------------------------
>  arch/arm/dts/stm32mp133.dtsi        |   98 --
>  arch/arm/dts/stm32mp135.dtsi        |   12 -
>  arch/arm/dts/stm32mp135f-dk.dts     |  376 -------
>  arch/arm/dts/stm32mp13xc.dtsi       |   18 -
>  arch/arm/dts/stm32mp13xf.dtsi       |   18 -
>  arch/arm/mach-stm32mp/Kconfig       |    1 +
>  configs/stm32mp13_defconfig         |    2 +-
>  10 files changed, 2 insertions(+), 2981 deletions(-)
>  delete mode 100644 arch/arm/dts/stm32mp13-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp131.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp133.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp135.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp135f-dk.dts
>  delete mode 100644 arch/arm/dts/stm32mp13xc.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp13xf.dtsi
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 0cb5807844e..33e70bf0137 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -1076,9 +1076,6 @@ dtb-$(CONFIG_ASPEED_AST2600) += \
>  	ast2600-sbp1.dtb \
>  	ast2600-x4tf.dtb
>  
> -dtb-$(CONFIG_STM32MP13X) += \
> -	stm32mp135f-dk.dtb
> -
>  dtb-$(CONFIG_STM32MP15X) += \
>  	stm32mp157a-dk1.dtb \
>  	stm32mp157a-dk1-scmi.dtb \
> diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> deleted file mode 100644
> index 52c2a9f24d7..00000000000
> --- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
> +++ /dev/null
> @@ -1,888 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> -/*
> - * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> - * Author: Alexandre Torgue <alexandre.torgue@foss.st.com>
> - */
> -#include <dt-bindings/pinctrl/stm32-pinfunc.h>
> -
> -&pinctrl {
> -	adc1_pins_a: adc1-pins-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('A', 3, ANALOG)>; /* ADC1 in12 */
> -		};
> -	};
> -
> -	adc1_usb_cc_pins_a: adc1-usb-cc-pins-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
> -				 <STM32_PINMUX('A', 3, ANALOG)>; /* ADC1 in12 */
> -		};
> -	};
> -
> -	adc1_usb_cc_pins_b: adc1-usb-cc-pins-1 {
> -		pins {
> -			pinmux = <STM32_PINMUX('A', 5, ANALOG)>, /* ADC1_INP2 */
> -				 <STM32_PINMUX('F', 13, ANALOG)>; /* ADC1_INP11 */
> -		};
> -	};
> -
> -	eth1_rgmii_pins_a: eth1-rgmii-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
> -				 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
> -				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
> -				 <STM32_PINMUX('E', 5, AF10)>, /* ETH_RGMII_TXD3 */
> -				 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
> -				 <STM32_PINMUX('C', 1, AF11)>, /* ETH_RGMII_GTX_CLK */
> -				 <STM32_PINMUX('A', 2, AF11)>, /* ETH_MDIO */
> -				 <STM32_PINMUX('G', 2, AF11)>; /* ETH_MDC */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <2>;
> -		};
> -
> -		pins2 {
> -			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
> -				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
> -				 <STM32_PINMUX('B', 0, AF11)>, /* ETH_RGMII_RXD2 */
> -				 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
> -				 <STM32_PINMUX('A', 7, AF11)>, /* ETH_RGMII_RX_CTL */
> -				 <STM32_PINMUX('D', 7, AF10)>; /* ETH_RGMII_RX_CLK */
> -			bias-disable;
> -		};
> -
> -	};
> -
> -	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
> -				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
> -				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
> -				 <STM32_PINMUX('E', 5, ANALOG)>, /* ETH_RGMII_TXD3 */
> -				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
> -				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_GTX_CLK */
> -				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
> -				 <STM32_PINMUX('G', 2, ANALOG)>, /* ETH_MDC */
> -				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
> -				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
> -				 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH_RGMII_RXD1 */
> -				 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH_RGMII_RXD1 */
> -				 <STM32_PINMUX('A', 7, ANALOG)>, /* ETH_RGMII_RX_CTL */
> -				 <STM32_PINMUX('D', 7, ANALOG)>; /* ETH_RGMII_RX_CLK */
> -		};
> -	};
> -
> -	eth2_rgmii_pins_a: eth2-rgmii-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('F', 7, AF11)>, /* ETH_RGMII_TXD0 */
> -				 <STM32_PINMUX('G', 11, AF10)>, /* ETH_RGMII_TXD1 */
> -				 <STM32_PINMUX('G', 1, AF10)>, /* ETH_RGMII_TXD2 */
> -				 <STM32_PINMUX('E', 6, AF11)>, /* ETH_RGMII_TXD3 */
> -				 <STM32_PINMUX('F', 6, AF11)>, /* ETH_RGMII_TX_CTL */
> -				 <STM32_PINMUX('G', 3, AF10)>, /* ETH_RGMII_GTX_CLK */
> -				 <STM32_PINMUX('B', 6, AF11)>, /* ETH_MDIO */
> -				 <STM32_PINMUX('G', 5, AF10)>; /* ETH_MDC */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <2>;
> -		};
> -
> -		pins2 {
> -			pinmux = <STM32_PINMUX('F', 4, AF11)>, /* ETH_RGMII_RXD0 */
> -				 <STM32_PINMUX('E', 2, AF10)>, /* ETH_RGMII_RXD1 */
> -				 <STM32_PINMUX('H', 6, AF12)>, /* ETH_RGMII_RXD2 */
> -				 <STM32_PINMUX('A', 8, AF11)>, /* ETH_RGMII_RXD3 */
> -				 <STM32_PINMUX('A', 12, AF11)>, /* ETH_RGMII_RX_CTL */
> -				 <STM32_PINMUX('H', 11, AF11)>; /* ETH_RGMII_RX_CLK */
> -			bias-disable;
> -		};
> -	};
> -
> -	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
> -				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD1 */
> -				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD2 */
> -				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
> -				 <STM32_PINMUX('G', 8, ANALOG)>, /* ETH_RGMII_TX_CTL */
> -				 <STM32_PINMUX('F', 6, ANALOG)>, /* ETH_RGMII_GTX_CLK */
> -				 <STM32_PINMUX('B', 2, ANALOG)>, /* ETH_MDIO */
> -				 <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_MDC */
> -				 <STM32_PINMUX('F', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
> -				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
> -				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD2 */
> -				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD3 */
> -				 <STM32_PINMUX('A', 12, ANALOG)>, /* ETH_RGMII_RX_CTL */
> -				 <STM32_PINMUX('H', 11, ANALOG)>; /* ETH_RGMII_RX_CLK */
> -		};
> -	};
> -
> -	i2c1_pins_a: i2c1-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
> -				 <STM32_PINMUX('E', 8, AF5)>; /* I2C1_SDA */
> -			bias-disable;
> -			drive-open-drain;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	i2c1_sleep_pins_a: i2c1-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
> -				 <STM32_PINMUX('E', 8, ANALOG)>; /* I2C1_SDA */
> -		};
> -	};
> -
> -	i2c5_pins_a: i2c5-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
> -				 <STM32_PINMUX('H', 6, AF4)>; /* I2C5_SDA */
> -			bias-disable;
> -			drive-open-drain;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	i2c5_sleep_pins_a: i2c5-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
> -				 <STM32_PINMUX('H', 6, ANALOG)>; /* I2C5_SDA */
> -		};
> -	};
> -
> -	i2c5_pins_b: i2c5-1 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
> -				 <STM32_PINMUX('E', 13, AF4)>; /* I2C5_SDA */
> -			bias-disable;
> -			drive-open-drain;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	i2c5_sleep_pins_b: i2c5-sleep-1 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
> -				 <STM32_PINMUX('E', 13, ANALOG)>; /* I2C5_SDA */
> -		};
> -	};
> -
> -	m_can1_pins_a: m-can1-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('G', 10, AF9)>; /* CAN1_TX */
> -			slew-rate = <1>;
> -			drive-push-pull;
> -			bias-disable;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 0, AF9)>; /* CAN1_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	m_can1_sleep_pins_a: m_can1-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('G', 10, ANALOG)>, /* CAN1_TX */
> -				 <STM32_PINMUX('D', 0, ANALOG)>; /* CAN1_RX */
> -		};
> -	};
> -
> -	m_can2_pins_a: m-can2-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('G', 0, AF9)>; /* CAN2_TX */
> -			slew-rate = <1>;
> -			drive-push-pull;
> -			bias-disable;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('E', 0, AF9)>; /* CAN2_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	m_can2_sleep_pins_a: m_can2-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('G', 0, ANALOG)>, /* CAN2_TX */
> -				 <STM32_PINMUX('E', 0, ANALOG)>; /* CAN2_RX */
> -		};
> -	};
> -
> -	mcp23017_pins_a: mcp23017-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('G', 12, GPIO)>;
> -			bias-pull-up;
> -		};
> -	};
> -
> -	pwm1_ch3n_pins_a: pwm1-ch3n-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('E', 12, AF1)>; /* TIM1_CH3N */
> -			bias-pull-down;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pwm1_ch3n_sleep_pins_a: pwm1-ch3n-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('E', 12, ANALOG)>; /* TIM1_CH3N */
> -		};
> -	};
> -
> -	pwm3_pins_a: pwm3-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('B', 1, AF2)>; /* TIM3_CH4 */
> -			bias-pull-down;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pwm3_sleep_pins_a: pwm3-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('B', 1, ANALOG)>; /* TIM3_CH4 */
> -		};
> -	};
> -
> -	pwm4_pins_a: pwm4-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 13, AF2)>; /* TIM4_CH2 */
> -			bias-pull-down;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pwm4_sleep_pins_a: pwm4-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 13, ANALOG)>; /* TIM4_CH2 */
> -		};
> -	};
> -
> -	pwm5_pins_a: pwm5-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('H', 12, AF2)>; /* TIM5_CH3 */
> -			bias-pull-down;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pwm5_sleep_pins_a: pwm5-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('H', 12, ANALOG)>; /* TIM5_CH3 */
> -		};
> -	};
> -
> -	pwm8_pins_a: pwm8-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('E', 5, AF3)>; /* TIM8_CH3 */
> -			bias-pull-down;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pwm8_sleep_pins_a: pwm8-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('E', 5, ANALOG)>; /* TIM8_CH3 */
> -		};
> -	};
> -
> -	pwm13_pins_a: pwm13-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('A', 6, AF9)>; /* TIM13_CH1 */
> -			bias-pull-down;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pwm13_sleep_pins_a: pwm13-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('A', 6, ANALOG)>; /* TIM13_CH1 */
> -		};
> -	};
> -
> -	pwm14_pins_a: pwm14-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 9, AF9)>; /* TIM14_CH1 */
> -			bias-pull-down;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pwm14_sleep_pins_a: pwm14-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 9, ANALOG)>; /* TIM14_CH1 */
> -		};
> -	};
> -
> -	qspi_clk_pins_a: qspi-clk-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 10, AF9)>; /* QSPI_CLK */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <3>;
> -		};
> -	};
> -
> -	qspi_clk_sleep_pins_a: qspi-clk-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 10, ANALOG)>; /* QSPI_CLK */
> -		};
> -	};
> -
> -	qspi_bk1_pins_a: qspi-bk1-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
> -				 <STM32_PINMUX('F', 9, AF10)>, /* QSPI_BK1_IO1 */
> -				 <STM32_PINMUX('D', 11, AF9)>, /* QSPI_BK1_IO2 */
> -				 <STM32_PINMUX('H', 7, AF13)>; /* QSPI_BK1_IO3 */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <1>;
> -		};
> -	};
> -
> -	qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
> -				 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
> -				 <STM32_PINMUX('D', 11, ANALOG)>, /* QSPI_BK1_IO2 */
> -				 <STM32_PINMUX('H', 7, ANALOG)>; /* QSPI_BK1_IO3 */
> -		};
> -	};
> -
> -	qspi_cs1_pins_a: qspi-cs1-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('B', 2, AF9)>; /* QSPI_BK1_NCS */
> -			bias-pull-up;
> -			drive-push-pull;
> -			slew-rate = <1>;
> -		};
> -	};
> -
> -	qspi_cs1_sleep_pins_a: qspi-cs1-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('B', 2, ANALOG)>; /* QSPI_BK1_NCS */
> -		};
> -	};
> -
> -	sai1a_pins_a: sai1a-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('A', 4, AF12)>, /* SAI1_SCK_A */
> -				 <STM32_PINMUX('D', 6, AF6)>, /* SAI1_SD_A */
> -				 <STM32_PINMUX('E', 11, AF6)>; /* SAI1_FS_A */
> -			slew-rate = <0>;
> -			drive-push-pull;
> -			bias-disable;
> -		};
> -	};
> -
> -	sai1a_sleep_pins_a: sai1a-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* SAI1_SCK_A */
> -				 <STM32_PINMUX('D', 6, ANALOG)>, /* SAI1_SD_A */
> -				 <STM32_PINMUX('E', 11, ANALOG)>; /* SAI1_FS_A */
> -		};
> -	};
> -
> -	sai1b_pins_a: sai1b-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('A', 0, AF6)>; /* SAI1_SD_B */
> -			bias-disable;
> -		};
> -	};
> -
> -	sai1b_sleep_pins_a: sai1b-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('A', 0, ANALOG)>; /* SAI1_SD_B */
> -		};
> -	};
> -
> -	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> -				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> -				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> -				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> -				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> -			slew-rate = <1>;
> -			drive-push-pull;
> -			bias-disable;
> -		};
> -	};
> -
> -	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> -				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> -				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> -				 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
> -			slew-rate = <1>;
> -			drive-push-pull;
> -			bias-disable;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> -			slew-rate = <1>;
> -			drive-open-drain;
> -			bias-disable;
> -		};
> -	};
> -
> -	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> -				 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
> -				 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
> -				 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
> -				 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
> -				 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
> -		};
> -	};
> -
> -	sdmmc1_clk_pins_a: sdmmc1-clk-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> -			slew-rate = <1>;
> -			drive-push-pull;
> -			bias-disable;
> -		};
> -	};
> -
> -	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC2_D0 */
> -				 <STM32_PINMUX('B', 15, AF10)>, /* SDMMC2_D1 */
> -				 <STM32_PINMUX('B', 3, AF10)>, /* SDMMC2_D2 */
> -				 <STM32_PINMUX('B', 4, AF10)>, /* SDMMC2_D3 */
> -				 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
> -			slew-rate = <1>;
> -			drive-push-pull;
> -			bias-pull-up;
> -		};
> -	};
> -
> -	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC2_D0 */
> -				 <STM32_PINMUX('B', 15, AF10)>, /* SDMMC2_D1 */
> -				 <STM32_PINMUX('B', 3, AF10)>, /* SDMMC2_D2 */
> -				 <STM32_PINMUX('B', 4, AF10)>; /* SDMMC2_D3 */
> -			slew-rate = <1>;
> -			drive-push-pull;
> -			bias-pull-up;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
> -			slew-rate = <1>;
> -			drive-open-drain;
> -			bias-pull-up;
> -		};
> -	};
> -
> -	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
> -				 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
> -				 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
> -				 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
> -				 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
> -				 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
> -		};
> -	};
> -
> -	sdmmc2_clk_pins_a: sdmmc2-clk-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC2_CK */
> -			slew-rate = <1>;
> -			drive-push-pull;
> -			bias-pull-up;
> -		};
> -	};
> -
> -	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 0, AF10)>, /* SDMMC2_D4 */
> -				 <STM32_PINMUX('B', 9, AF10)>, /* SDMMC2_D5 */
> -				 <STM32_PINMUX('C', 6, AF10)>, /* SDMMC2_D6 */
> -				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
> -			slew-rate = <1>;
> -			drive-push-pull;
> -			bias-pull-up;
> -		};
> -	};
> -
> -	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* SDMMC2_D4 */
> -				 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC2_D5 */
> -				 <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC2_D6 */
> -				 <STM32_PINMUX('C', 7, ANALOG)>; /* SDMMC2_D7 */
> -		};
> -	};
> -
> -	spi2_pins_a: spi2-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('B', 10, AF6)>, /* SPI2_SCK */
> -				 <STM32_PINMUX('H', 10, AF6)>; /* SPI2_MOSI */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <1>;
> -		};
> -
> -		pins2 {
> -			pinmux = <STM32_PINMUX('B', 5, AF5)>; /* SPI2_MISO */
> -			bias-disable;
> -		};
> -	};
> -
> -	spi2_sleep_pins_a: spi2-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* SPI2_SCK */
> -				 <STM32_PINMUX('B', 5, ANALOG)>, /* SPI2_MISO */
> -				 <STM32_PINMUX('H', 10, ANALOG)>; /* SPI2_MOSI */
> -		};
> -	};
> -
> -	spi3_pins_a: spi3-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('H', 13, AF6)>, /* SPI3_SCK */
> -				 <STM32_PINMUX('F', 1, AF5)>; /* SPI3_MOSI */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <1>;
> -		};
> -
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 4, AF5)>; /* SPI3_MISO */
> -			bias-disable;
> -		};
> -	};
> -
> -	spi3_sleep_pins_a: spi3-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* SPI3_SCK */
> -				 <STM32_PINMUX('D', 4, ANALOG)>, /* SPI3_MISO */
> -				 <STM32_PINMUX('F', 1, ANALOG)>; /* SPI3_MOSI */
> -		};
> -	};
> -
> -	spi5_pins_a: spi5-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('H', 7, AF6)>, /* SPI5_SCK */
> -				 <STM32_PINMUX('H', 3, AF5)>; /* SPI5_MOSI */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <1>;
> -		};
> -
> -		pins2 {
> -			pinmux = <STM32_PINMUX('A', 8, AF5)>; /* SPI5_MISO */
> -			bias-disable;
> -		};
> -	};
> -
> -	spi5_sleep_pins_a: spi5-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('H', 7, ANALOG)>, /* SPI5_SCK */
> -				 <STM32_PINMUX('A', 8, ANALOG)>, /* SPI5_MISO */
> -				 <STM32_PINMUX('H', 3, ANALOG)>; /* SPI5_MOSI */
> -		};
> -	};
> -
> -	stm32g0_intn_pins_a: stm32g0-intn-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('I', 2, GPIO)>;
> -			bias-pull-up;
> -		};
> -	};
> -
> -	uart4_pins_a: uart4-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('D', 6, AF8)>; /* UART4_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 8, AF8)>; /* UART4_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	uart4_idle_pins_a: uart4-idle-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('D', 6, ANALOG)>; /* UART4_TX */
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 8, AF8)>; /* UART4_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	uart4_sleep_pins_a: uart4-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 6, ANALOG)>, /* UART4_TX */
> -				 <STM32_PINMUX('D', 8, ANALOG)>; /* UART4_RX */
> -		};
> -	};
> -
> -	uart4_pins_b: uart4-1 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('A', 9, AF8)>; /* UART4_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 8, AF8)>; /* UART4_RX */
> -			bias-pull-up;
> -		};
> -	};
> -
> -	uart4_idle_pins_b: uart4-idle-1 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('A', 9, ANALOG)>; /* UART4_TX */
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 8, AF8)>; /* UART4_RX */
> -			bias-pull-up;
> -		};
> -	};
> -
> -	uart4_sleep_pins_b: uart4-sleep-1 {
> -		pins {
> -			pinmux = <STM32_PINMUX('A', 9, ANALOG)>, /* UART4_TX */
> -				 <STM32_PINMUX('D', 8, ANALOG)>; /* UART4_RX */
> -		};
> -	};
> -
> -	uart7_pins_a: uart7-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('H', 2, AF8)>, /* UART7_TX */
> -				 <STM32_PINMUX('B', 12, AF7)>; /* UART7_RTS */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('E', 10, AF7)>, /* UART7_RX */
> -				 <STM32_PINMUX('G', 7, AF8)>; /* UART7_CTS_NSS */
> -			bias-disable;
> -		};
> -	};
> -
> -	uart7_idle_pins_a: uart7-idle-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* UART7_TX */
> -				 <STM32_PINMUX('G', 7, ANALOG)>; /* UART7_CTS_NSS */
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('B', 12, AF7)>; /* UART7_RTS */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins3 {
> -			pinmux = <STM32_PINMUX('E', 10, AF7)>; /* UART7_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	uart7_sleep_pins_a: uart7-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* UART7_TX */
> -				 <STM32_PINMUX('B', 12, ANALOG)>, /* UART7_RTS */
> -				 <STM32_PINMUX('E', 10, ANALOG)>, /* UART7_RX */
> -				 <STM32_PINMUX('G', 7, ANALOG)>; /* UART7_CTS_NSS */
> -		};
> -	};
> -
> -	uart8_pins_a: uart8-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('F', 9, AF8)>; /* UART8_RX */
> -			bias-pull-up;
> -		};
> -	};
> -
> -	uart8_idle_pins_a: uart8-idle-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('E', 1, ANALOG)>; /* UART8_TX */
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('F', 9, AF8)>; /* UART8_RX */
> -			bias-pull-up;
> -		};
> -	};
> -
> -	uart8_sleep_pins_a: uart8-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('E', 1, ANALOG)>, /* UART8_TX */
> -				 <STM32_PINMUX('F', 9, ANALOG)>; /* UART8_RX */
> -		};
> -	};
> -
> -	usart1_pins_a: usart1-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('C', 0, AF7)>, /* USART1_TX */
> -				 <STM32_PINMUX('C', 2, AF7)>; /* USART1_RTS */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('B', 0, AF4)>, /* USART1_RX */
> -				 <STM32_PINMUX('A', 7, AF7)>; /* USART1_CTS_NSS */
> -			bias-pull-up;
> -		};
> -	};
> -
> -	usart1_idle_pins_a: usart1-idle-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('C', 0, ANALOG)>, /* USART1_TX */
> -				 <STM32_PINMUX('A', 7, ANALOG)>; /* USART1_CTS_NSS */
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('C', 2, AF7)>; /* USART1_RTS */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins3 {
> -			pinmux = <STM32_PINMUX('B', 0, AF4)>; /* USART1_RX */
> -			bias-pull-up;
> -		};
> -	};
> -
> -	usart1_sleep_pins_a: usart1-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('C', 0, ANALOG)>, /* USART1_TX */
> -				 <STM32_PINMUX('C', 2, ANALOG)>, /* USART1_RTS */
> -				 <STM32_PINMUX('A', 7, ANALOG)>, /* USART1_CTS_NSS */
> -				 <STM32_PINMUX('B', 0, ANALOG)>; /* USART1_RX */
> -		};
> -	};
> -
> -	usart1_pins_b: usart1-1 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('C', 0, AF7)>; /* USART1_TX */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 14, AF7)>; /* USART1_RX */
> -			bias-pull-up;
> -		};
> -	};
> -
> -	usart1_idle_pins_b: usart1-idle-1 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('C', 0, ANALOG)>; /* USART1_TX */
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 14, AF7)>; /* USART1_RX */
> -			bias-pull-up;
> -		};
> -	};
> -
> -	usart1_sleep_pins_b: usart1-sleep-1 {
> -		pins {
> -			pinmux = <STM32_PINMUX('C', 0, ANALOG)>, /* USART1_TX */
> -				 <STM32_PINMUX('D', 14, ANALOG)>; /* USART1_RX */
> -		};
> -	};
> -
> -	usart2_pins_a: usart2-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('H', 12, AF1)>, /* USART2_TX */
> -				 <STM32_PINMUX('D', 4, AF3)>; /* USART2_RTS */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 15, AF1)>, /* USART2_RX */
> -				 <STM32_PINMUX('E', 11, AF2)>; /* USART2_CTS_NSS */
> -			bias-disable;
> -		};
> -	};
> -
> -	usart2_idle_pins_a: usart2-idle-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('H', 12, ANALOG)>, /* USART2_TX */
> -				 <STM32_PINMUX('E', 11, ANALOG)>; /* USART2_CTS_NSS */
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 4, AF3)>; /* USART2_RTS */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins3 {
> -			pinmux = <STM32_PINMUX('D', 15, AF1)>; /* USART2_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	usart2_sleep_pins_a: usart2-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('H', 12, ANALOG)>, /* USART2_TX */
> -				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
> -				 <STM32_PINMUX('D', 15, ANALOG)>, /* USART2_RX */
> -				 <STM32_PINMUX('E', 11, ANALOG)>; /* USART2_CTS_NSS */
> -		};
> -	};
> -
> -	usart2_pins_b: usart2-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('F', 11, AF1)>, /* USART2_TX */
> -				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('D', 15, AF1)>, /* USART2_RX */
> -				 <STM32_PINMUX('E', 15, AF3)>; /* USART2_CTS_NSS */
> -			bias-disable;
> -		};
> -	};
> -
> -	usart2_idle_pins_b: usart2-idle-0 {
> -		pins1 {
> -			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
> -				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
> -		};
> -		pins2 {
> -			pinmux = <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
> -			bias-disable;
> -			drive-push-pull;
> -			slew-rate = <0>;
> -		};
> -		pins3 {
> -			pinmux = <STM32_PINMUX('D', 15, AF1)>; /* USART2_RX */
> -			bias-disable;
> -		};
> -	};
> -
> -	usart2_sleep_pins_b: usart2-sleep-0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
> -				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
> -				 <STM32_PINMUX('D', 15, ANALOG)>, /* USART2_RX */
> -				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
> -		};
> -	};
> -};
> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
> deleted file mode 100644
> index ad331b73d18..00000000000
> --- a/arch/arm/dts/stm32mp131.dtsi
> +++ /dev/null
> @@ -1,1567 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> -/*
> - * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> - * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> - */
> -#include <dt-bindings/interrupt-controller/arm-gic.h>
> -#include <dt-bindings/clock/stm32mp13-clks.h>
> -#include <dt-bindings/reset/stm32mp13-resets.h>
> -
> -/ {
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -
> -	cpus {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		cpu0: cpu@0 {
> -			compatible = "arm,cortex-a7";
> -			device_type = "cpu";
> -			reg = <0>;
> -		};
> -	};
> -
> -	arm-pmu {
> -		compatible = "arm,cortex-a7-pmu";
> -		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-affinity = <&cpu0>;
> -		interrupt-parent = <&intc>;
> -	};
> -
> -	firmware {
> -		optee {
> -			method = "smc";
> -			compatible = "linaro,optee-tz";
> -			interrupt-parent = <&intc>;
> -			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> -		};
> -
> -		scmi: scmi {
> -			compatible = "linaro,scmi-optee";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			linaro,optee-channel-id = <0>;
> -
> -			scmi_clk: protocol@14 {
> -				reg = <0x14>;
> -				#clock-cells = <1>;
> -			};
> -
> -			scmi_reset: protocol@16 {
> -				reg = <0x16>;
> -				#reset-cells = <1>;
> -			};
> -
> -			scmi_voltd: protocol@17 {
> -				reg = <0x17>;
> -
> -				scmi_regu: regulators {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					scmi_reg11: regulator@0 {
> -						reg = <VOLTD_SCMI_REG11>;
> -						regulator-name = "reg11";
> -					};
> -					scmi_reg18: regulator@1 {
> -						reg = <VOLTD_SCMI_REG18>;
> -						regulator-name = "reg18";
> -					};
> -					scmi_usb33: regulator@2 {
> -						reg = <VOLTD_SCMI_USB33>;
> -						regulator-name = "usb33";
> -					};
> -				};
> -			};
> -		};
> -	};
> -
> -	intc: interrupt-controller@a0021000 {
> -		compatible = "arm,cortex-a7-gic";
> -		#interrupt-cells = <3>;
> -		interrupt-controller;
> -		reg = <0xa0021000 0x1000>,
> -		      <0xa0022000 0x2000>;
> -	};
> -
> -	psci {
> -		compatible = "arm,psci-1.0";
> -		method = "smc";
> -	};
> -
> -	timer {
> -		compatible = "arm,armv7-timer";
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> -		interrupt-parent = <&intc>;
> -		always-on;
> -	};
> -
> -	soc {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		interrupt-parent = <&intc>;
> -		ranges;
> -
> -		timers2: timer@40000000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x40000000 0x400>;
> -			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM2_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 18 0x400 0x1>,
> -			       <&dmamux1 19 0x400 0x1>,
> -			       <&dmamux1 20 0x400 0x1>,
> -			       <&dmamux1 21 0x400 0x1>,
> -			       <&dmamux1 22 0x400 0x1>;
> -			dma-names = "ch1", "ch2", "ch3", "ch4", "up";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@1 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <1>;
> -				status = "disabled";
> -			};
> -
> -			counter {
> -				compatible = "st,stm32-timer-counter";
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers3: timer@40001000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x40001000 0x400>;
> -			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM3_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 23 0x400 0x1>,
> -			       <&dmamux1 24 0x400 0x1>,
> -			       <&dmamux1 25 0x400 0x1>,
> -			       <&dmamux1 26 0x400 0x1>,
> -			       <&dmamux1 27 0x400 0x1>,
> -			       <&dmamux1 28 0x400 0x1>;
> -			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@2 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <2>;
> -				status = "disabled";
> -			};
> -
> -			counter {
> -				compatible = "st,stm32-timer-counter";
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers4: timer@40002000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x40002000 0x400>;
> -			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM4_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 29 0x400 0x1>,
> -			       <&dmamux1 30 0x400 0x1>,
> -			       <&dmamux1 31 0x400 0x1>,
> -			       <&dmamux1 32 0x400 0x1>;
> -			dma-names = "ch1", "ch2", "ch3", "up";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@3 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <3>;
> -				status = "disabled";
> -			};
> -
> -			counter {
> -				compatible = "st,stm32-timer-counter";
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers5: timer@40003000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x40003000 0x400>;
> -			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM5_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 55 0x400 0x1>,
> -			       <&dmamux1 56 0x400 0x1>,
> -			       <&dmamux1 57 0x400 0x1>,
> -			       <&dmamux1 58 0x400 0x1>,
> -			       <&dmamux1 59 0x400 0x1>,
> -			       <&dmamux1 60 0x400 0x1>;
> -			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@4 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <4>;
> -				status = "disabled";
> -			};
> -
> -			counter {
> -				compatible = "st,stm32-timer-counter";
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers6: timer@40004000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x40004000 0x400>;
> -			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM6_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 69 0x400 0x1>;
> -			dma-names = "up";
> -			status = "disabled";
> -
> -			timer@5 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <5>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers7: timer@40005000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x40005000 0x400>;
> -			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM7_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 70 0x400 0x1>;
> -			dma-names = "up";
> -			status = "disabled";
> -
> -			timer@6 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <6>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		lptimer1: timer@40009000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-lptimer";
> -			reg = <0x40009000 0x400>;
> -			interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc LPTIM1_K>;
> -			clock-names = "mux";
> -			wakeup-source;
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm-lp";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			trigger@0 {
> -				compatible = "st,stm32-lptimer-trigger";
> -				reg = <0>;
> -				status = "disabled";
> -			};
> -
> -			counter {
> -				compatible = "st,stm32-lptimer-counter";
> -				status = "disabled";
> -			};
> -
> -			timer {
> -				compatible = "st,stm32-lptimer-timer";
> -				status = "disabled";
> -			};
> -		};
> -
> -		i2s2: audio-controller@4000b000 {
> -			compatible = "st,stm32h7-i2s";
> -			reg = <0x4000b000 0x400>;
> -			#sound-dai-cells = <0>;
> -			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&dmamux1 39 0x400 0x01>,
> -			       <&dmamux1 40 0x400 0x01>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		spi2: spi@4000b000 {
> -			compatible = "st,stm32h7-spi";
> -			reg = <0x4000b000 0x400>;
> -			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc SPI2_K>;
> -			resets = <&rcc SPI2_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 39 0x400 0x01>,
> -			       <&dmamux1 40 0x400 0x01>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		i2s3: audio-controller@4000c000 {
> -			compatible = "st,stm32h7-i2s";
> -			reg = <0x4000c000 0x400>;
> -			#sound-dai-cells = <0>;
> -			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&dmamux1 61 0x400 0x01>,
> -			       <&dmamux1 62 0x400 0x01>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		spi3: spi@4000c000 {
> -			compatible = "st,stm32h7-spi";
> -			reg = <0x4000c000 0x400>;
> -			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc SPI3_K>;
> -			resets = <&rcc SPI3_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 61 0x400 0x01>,
> -			       <&dmamux1 62 0x400 0x01>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		spdifrx: audio-controller@4000d000 {
> -			compatible = "st,stm32h7-spdifrx";
> -			reg = <0x4000d000 0x400>;
> -			#sound-dai-cells = <0>;
> -			clocks = <&rcc SPDIF_K>;
> -			clock-names = "kclk";
> -			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&dmamux1 93 0x400 0x01>,
> -			       <&dmamux1 94 0x400 0x01>;
> -			dma-names = "rx", "rx-ctrl";
> -			status = "disabled";
> -		};
> -
> -		usart3: serial@4000f000 {
> -			compatible = "st,stm32h7-uart";
> -			reg = <0x4000f000 0x400>;
> -			interrupts-extended = <&exti 28 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc USART3_K>;
> -			resets = <&rcc USART3_R>;
> -			wakeup-source;
> -			dmas = <&dmamux1 45 0x400 0x5>,
> -			       <&dmamux1 46 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		uart4: serial@40010000 {
> -			compatible = "st,stm32h7-uart";
> -			reg = <0x40010000 0x400>;
> -			interrupts-extended = <&exti 30 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc UART4_K>;
> -			resets = <&rcc UART4_R>;
> -			wakeup-source;
> -			dmas = <&dmamux1 63 0x400 0x5>,
> -			       <&dmamux1 64 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		uart5: serial@40011000 {
> -			compatible = "st,stm32h7-uart";
> -			reg = <0x40011000 0x400>;
> -			interrupts-extended = <&exti 31 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc UART5_K>;
> -			resets = <&rcc UART5_R>;
> -			wakeup-source;
> -			dmas = <&dmamux1 65 0x400 0x5>,
> -			       <&dmamux1 66 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		i2c1: i2c@40012000 {
> -			compatible = "st,stm32mp13-i2c";
> -			reg = <0x40012000 0x400>;
> -			interrupt-names = "event", "error";
> -			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc I2C1_K>;
> -			resets = <&rcc I2C1_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 33 0x400 0x1>,
> -			       <&dmamux1 34 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			st,syscfg-fmp = <&syscfg 0x4 0x1>;
> -			i2c-analog-filter;
> -			status = "disabled";
> -		};
> -
> -		i2c2: i2c@40013000 {
> -			compatible = "st,stm32mp13-i2c";
> -			reg = <0x40013000 0x400>;
> -			interrupt-names = "event", "error";
> -			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc I2C2_K>;
> -			resets = <&rcc I2C2_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 35 0x400 0x1>,
> -			       <&dmamux1 36 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			st,syscfg-fmp = <&syscfg 0x4 0x2>;
> -			i2c-analog-filter;
> -			status = "disabled";
> -		};
> -
> -		uart7: serial@40018000 {
> -			compatible = "st,stm32h7-uart";
> -			reg = <0x40018000 0x400>;
> -			interrupts-extended = <&exti 32 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc UART7_K>;
> -			resets = <&rcc UART7_R>;
> -			wakeup-source;
> -			dmas = <&dmamux1 79 0x400 0x5>,
> -			       <&dmamux1 80 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		uart8: serial@40019000 {
> -			compatible = "st,stm32h7-uart";
> -			reg = <0x40019000 0x400>;
> -			interrupts-extended = <&exti 33 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc UART8_K>;
> -			resets = <&rcc UART8_R>;
> -			wakeup-source;
> -			dmas = <&dmamux1 81 0x400 0x5>,
> -			       <&dmamux1 82 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		timers1: timer@44000000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x44000000 0x400>;
> -			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "brk", "up", "trg-com", "cc";
> -			clocks = <&rcc TIM1_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 11 0x400 0x1>,
> -			       <&dmamux1 12 0x400 0x1>,
> -			       <&dmamux1 13 0x400 0x1>,
> -			       <&dmamux1 14 0x400 0x1>,
> -			       <&dmamux1 15 0x400 0x1>,
> -			       <&dmamux1 16 0x400 0x1>,
> -			       <&dmamux1 17 0x400 0x1>;
> -			dma-names = "ch1", "ch2", "ch3", "ch4",
> -				    "up", "trig", "com";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@0 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <0>;
> -				status = "disabled";
> -			};
> -
> -			counter {
> -				compatible = "st,stm32-timer-counter";
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers8: timer@44001000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x44001000 0x400>;
> -			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "brk", "up", "trg-com", "cc";
> -			clocks = <&rcc TIM8_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 47 0x400 0x1>,
> -			       <&dmamux1 48 0x400 0x1>,
> -			       <&dmamux1 49 0x400 0x1>,
> -			       <&dmamux1 50 0x400 0x1>,
> -			       <&dmamux1 51 0x400 0x1>,
> -			       <&dmamux1 52 0x400 0x1>,
> -			       <&dmamux1 53 0x400 0x1>;
> -			dma-names = "ch1", "ch2", "ch3", "ch4",
> -				    "up", "trig", "com";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@7 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <7>;
> -				status = "disabled";
> -			};
> -
> -			counter {
> -				compatible = "st,stm32-timer-counter";
> -				status = "disabled";
> -			};
> -		};
> -
> -		usart6: serial@44003000 {
> -			compatible = "st,stm32h7-uart";
> -			reg = <0x44003000 0x400>;
> -			interrupts-extended = <&exti 29 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc USART6_K>;
> -			resets = <&rcc USART6_R>;
> -			wakeup-source;
> -			dmas = <&dmamux1 71 0x400 0x5>,
> -			       <&dmamux1 72 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		i2s1: audio-controller@44004000 {
> -			compatible = "st,stm32h7-i2s";
> -			reg = <0x44004000 0x400>;
> -			#sound-dai-cells = <0>;
> -			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&dmamux1 37 0x400 0x01>,
> -			       <&dmamux1 38 0x400 0x01>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		spi1: spi@44004000 {
> -			compatible = "st,stm32h7-spi";
> -			reg = <0x44004000 0x400>;
> -			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc SPI1_K>;
> -			resets = <&rcc SPI1_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 37 0x400 0x01>,
> -			       <&dmamux1 38 0x400 0x01>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		sai1: sai@4400a000 {
> -			compatible = "st,stm32h7-sai";
> -			reg = <0x4400a000 0x4>, <0x4400a3f0 0x10>;
> -			ranges = <0 0x4400a000 0x400>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> -			resets = <&rcc SAI1_R>;
> -			status = "disabled";
> -
> -			sai1a: audio-controller@4400a004 {
> -				compatible = "st,stm32-sai-sub-a";
> -				reg = <0x4 0x20>;
> -				#sound-dai-cells = <0>;
> -				clocks = <&rcc SAI1_K>;
> -				clock-names = "sai_ck";
> -				dmas = <&dmamux1 87 0x400 0x01>;
> -				status = "disabled";
> -			};
> -
> -			sai1b: audio-controller@4400a024 {
> -				compatible = "st,stm32-sai-sub-b";
> -				reg = <0x24 0x20>;
> -				#sound-dai-cells = <0>;
> -				clocks = <&rcc SAI1_K>;
> -				clock-names = "sai_ck";
> -				dmas = <&dmamux1 88 0x400 0x01>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		sai2: sai@4400b000 {
> -			compatible = "st,stm32h7-sai";
> -			reg = <0x4400b000 0x4>, <0x4400b3f0 0x10>;
> -			ranges = <0 0x4400b000 0x400>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> -			resets = <&rcc SAI2_R>;
> -			status = "disabled";
> -
> -			sai2a: audio-controller@4400b004 {
> -				compatible = "st,stm32-sai-sub-a";
> -				reg = <0x4 0x20>;
> -				#sound-dai-cells = <0>;
> -				clocks = <&rcc SAI2_K>;
> -				clock-names = "sai_ck";
> -				dmas = <&dmamux1 89 0x400 0x01>;
> -				status = "disabled";
> -			};
> -
> -			sai2b: audio-controller@4400b024 {
> -				compatible = "st,stm32-sai-sub-b";
> -				reg = <0x24 0x20>;
> -				#sound-dai-cells = <0>;
> -				clocks = <&rcc SAI2_K>;
> -				clock-names = "sai_ck";
> -				dmas = <&dmamux1 90 0x400 0x01>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		dfsdm: dfsdm@4400d000 {
> -			compatible = "st,stm32mp1-dfsdm";
> -			reg = <0x4400d000 0x800>;
> -			clocks = <&rcc DFSDM_K>;
> -			clock-names = "dfsdm";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			status = "disabled";
> -
> -			dfsdm0: filter@0 {
> -				compatible = "st,stm32-dfsdm-adc";
> -				reg = <0>;
> -				#io-channel-cells = <1>;
> -				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> -				dmas = <&dmamux1 101 0x400 0x01>;
> -				dma-names = "rx";
> -				status = "disabled";
> -			};
> -
> -			dfsdm1: filter@1 {
> -				compatible = "st,stm32-dfsdm-adc";
> -				reg = <1>;
> -				#io-channel-cells = <1>;
> -				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> -				dmas = <&dmamux1 102 0x400 0x01>;
> -				dma-names = "rx";
> -				status = "disabled";
> -			};
> -		};
> -
> -		dma1: dma-controller@48000000 {
> -			compatible = "st,stm32-dma";
> -			reg = <0x48000000 0x400>;
> -			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc DMA1>;
> -			resets = <&rcc DMA1_R>;
> -			#dma-cells = <4>;
> -			st,mem2mem;
> -			dma-requests = <8>;
> -		};
> -
> -		dma2: dma-controller@48001000 {
> -			compatible = "st,stm32-dma";
> -			reg = <0x48001000 0x400>;
> -			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc DMA2>;
> -			resets = <&rcc DMA2_R>;
> -			#dma-cells = <4>;
> -			st,mem2mem;
> -			dma-requests = <8>;
> -		};
> -
> -		dmamux1: dma-router@48002000 {
> -			compatible = "st,stm32h7-dmamux";
> -			reg = <0x48002000 0x40>;
> -			clocks = <&rcc DMAMUX1>;
> -			resets = <&rcc DMAMUX1_R>;
> -			#dma-cells = <3>;
> -			dma-masters = <&dma1 &dma2>;
> -			dma-requests = <128>;
> -			dma-channels = <16>;
> -		};
> -
> -		adc_2: adc@48004000 {
> -			compatible = "st,stm32mp13-adc-core";
> -			reg = <0x48004000 0x400>;
> -			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc ADC2>, <&rcc ADC2_K>;
> -			clock-names = "bus", "adc";
> -			interrupt-controller;
> -			#interrupt-cells = <1>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			status = "disabled";
> -
> -			adc2: adc@0 {
> -				compatible = "st,stm32mp13-adc";
> -				#io-channel-cells = <1>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -				reg = <0x0>;
> -				interrupt-parent = <&adc_2>;
> -				interrupts = <0>;
> -				dmas = <&dmamux1 10 0x400 0x80000001>;
> -				dma-names = "rx";
> -				status = "disabled";
> -
> -				channel@13 {
> -					reg = <13>;
> -					label = "vrefint";
> -				};
> -				channel@14 {
> -					reg = <14>;
> -					label = "vddcore";
> -				};
> -				channel@16 {
> -					reg = <16>;
> -					label = "vddcpu";
> -				};
> -				channel@17 {
> -					reg = <17>;
> -					label = "vddq_ddr";
> -				};
> -			};
> -		};
> -
> -		usbotg_hs: usb@49000000 {
> -			compatible = "st,stm32mp15-hsotg", "snps,dwc2";
> -			reg = <0x49000000 0x40000>;
> -			clocks = <&rcc USBO_K>;
> -			clock-names = "otg";
> -			resets = <&rcc USBO_R>;
> -			reset-names = "dwc2";
> -			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> -			g-rx-fifo-size = <512>;
> -			g-np-tx-fifo-size = <32>;
> -			g-tx-fifo-size = <256 16 16 16 16 16 16 16>;
> -			dr_mode = "otg";
> -			otg-rev = <0x200>;
> -			usb33d-supply = <&scmi_usb33>;
> -			status = "disabled";
> -		};
> -
> -		usart1: serial@4c000000 {
> -			compatible = "st,stm32h7-uart";
> -			reg = <0x4c000000 0x400>;
> -			interrupts-extended = <&exti 26 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc USART1_K>;
> -			resets = <&rcc USART1_R>;
> -			wakeup-source;
> -			dmas = <&dmamux1 41 0x400 0x5>,
> -			       <&dmamux1 42 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		usart2: serial@4c001000 {
> -			compatible = "st,stm32h7-uart";
> -			reg = <0x4c001000 0x400>;
> -			interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc USART2_K>;
> -			resets = <&rcc USART2_R>;
> -			wakeup-source;
> -			dmas = <&dmamux1 43 0x400 0x5>,
> -			       <&dmamux1 44 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		i2s4: audio-controller@4c002000 {
> -			compatible = "st,stm32h7-i2s";
> -			reg = <0x4c002000 0x400>;
> -			#sound-dai-cells = <0>;
> -			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&dmamux1 83 0x400 0x01>,
> -			       <&dmamux1 84 0x400 0x01>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		spi4: spi@4c002000 {
> -			compatible = "st,stm32h7-spi";
> -			reg = <0x4c002000 0x400>;
> -			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc SPI4_K>;
> -			resets = <&rcc SPI4_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 83 0x400 0x01>,
> -			       <&dmamux1 84 0x400 0x01>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		spi5: spi@4c003000 {
> -			compatible = "st,stm32h7-spi";
> -			reg = <0x4c003000 0x400>;
> -			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc SPI5_K>;
> -			resets = <&rcc SPI5_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 85 0x400 0x01>,
> -			       <&dmamux1 86 0x400 0x01>;
> -			dma-names = "rx", "tx";
> -			status = "disabled";
> -		};
> -
> -		i2c3: i2c@4c004000 {
> -			compatible = "st,stm32mp13-i2c";
> -			reg = <0x4c004000 0x400>;
> -			interrupt-names = "event", "error";
> -			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc I2C3_K>;
> -			resets = <&rcc I2C3_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 73 0x400 0x1>,
> -			       <&dmamux1 74 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			st,syscfg-fmp = <&syscfg 0x4 0x4>;
> -			i2c-analog-filter;
> -			status = "disabled";
> -		};
> -
> -		i2c4: i2c@4c005000 {
> -			compatible = "st,stm32mp13-i2c";
> -			reg = <0x4c005000 0x400>;
> -			interrupt-names = "event", "error";
> -			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc I2C4_K>;
> -			resets = <&rcc I2C4_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 75 0x400 0x1>,
> -			       <&dmamux1 76 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			st,syscfg-fmp = <&syscfg 0x4 0x8>;
> -			i2c-analog-filter;
> -			status = "disabled";
> -		};
> -
> -		i2c5: i2c@4c006000 {
> -			compatible = "st,stm32mp13-i2c";
> -			reg = <0x4c006000 0x400>;
> -			interrupt-names = "event", "error";
> -			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc I2C5_K>;
> -			resets = <&rcc I2C5_R>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			dmas = <&dmamux1 115 0x400 0x1>,
> -			       <&dmamux1 116 0x400 0x1>;
> -			dma-names = "rx", "tx";
> -			st,syscfg-fmp = <&syscfg 0x4 0x10>;
> -			i2c-analog-filter;
> -			status = "disabled";
> -		};
> -
> -		timers12: timer@4c007000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x4c007000 0x400>;
> -			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM12_K>;
> -			clock-names = "int";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@11 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <11>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers13: timer@4c008000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x4c008000 0x400>;
> -			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM13_K>;
> -			clock-names = "int";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@12 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <12>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers14: timer@4c009000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x4c009000 0x400>;
> -			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM14_K>;
> -			clock-names = "int";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@13 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <13>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers15: timer@4c00a000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x4c00a000 0x400>;
> -			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM15_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 105 0x400 0x1>,
> -			       <&dmamux1 106 0x400 0x1>,
> -			       <&dmamux1 107 0x400 0x1>,
> -			       <&dmamux1 108 0x400 0x1>;
> -			dma-names = "ch1", "up", "trig", "com";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@14 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <14>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers16: timer@4c00b000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x4c00b000 0x400>;
> -			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM16_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 109 0x400 0x1>,
> -			       <&dmamux1 110 0x400 0x1>;
> -			dma-names = "ch1", "up";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@15 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <15>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		timers17: timer@4c00c000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-timers";
> -			reg = <0x4c00c000 0x400>;
> -			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "global";
> -			clocks = <&rcc TIM17_K>;
> -			clock-names = "int";
> -			dmas = <&dmamux1 111 0x400 0x1>,
> -			       <&dmamux1 112 0x400 0x1>;
> -			dma-names = "ch1", "up";
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer@16 {
> -				compatible = "st,stm32h7-timer-trigger";
> -				reg = <16>;
> -				status = "disabled";
> -			};
> -		};
> -
> -		rcc: rcc@50000000 {
> -			compatible = "st,stm32mp13-rcc", "syscon";
> -			reg = <0x50000000 0x1000>;
> -			#clock-cells = <1>;
> -			#reset-cells = <1>;
> -			clock-names = "hse", "hsi", "csi", "lse", "lsi";
> -			clocks = <&scmi_clk CK_SCMI_HSE>,
> -				 <&scmi_clk CK_SCMI_HSI>,
> -				 <&scmi_clk CK_SCMI_CSI>,
> -				 <&scmi_clk CK_SCMI_LSE>,
> -				 <&scmi_clk CK_SCMI_LSI>;
> -		};
> -
> -		pwr_regulators: pwr@50001000 {
> -			compatible = "st,stm32mp1,pwr-reg";
> -			reg = <0x50001000 0x10>;
> -			status = "disabled";
> -
> -			reg11: reg11 {
> -				regulator-name = "reg11";
> -				regulator-min-microvolt = <1100000>;
> -				regulator-max-microvolt = <1100000>;
> -			};
> -
> -			reg18: reg18 {
> -				regulator-name = "reg18";
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> -			};
> -
> -			usb33: usb33 {
> -				regulator-name = "usb33";
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
> -			};
> -		};
> -
> -		exti: interrupt-controller@5000d000 {
> -			compatible = "st,stm32mp13-exti", "syscon";
> -			interrupt-controller;
> -			#interrupt-cells = <2>;
> -			reg = <0x5000d000 0x400>;
> -		};
> -
> -		syscfg: syscon@50020000 {
> -			compatible = "st,stm32mp157-syscfg", "syscon";
> -			reg = <0x50020000 0x400>;
> -			clocks = <&rcc SYSCFG>;
> -		};
> -
> -		lptimer2: timer@50021000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-lptimer";
> -			reg = <0x50021000 0x400>;
> -			interrupts-extended = <&exti 48 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc LPTIM2_K>;
> -			clock-names = "mux";
> -			wakeup-source;
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm-lp";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			trigger@1 {
> -				compatible = "st,stm32-lptimer-trigger";
> -				reg = <1>;
> -				status = "disabled";
> -			};
> -
> -			counter {
> -				compatible = "st,stm32-lptimer-counter";
> -				status = "disabled";
> -			};
> -
> -			timer {
> -				compatible = "st,stm32-lptimer-timer";
> -				status = "disabled";
> -			};
> -		};
> -
> -		lptimer3: timer@50022000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "st,stm32-lptimer";
> -			reg = <0x50022000 0x400>;
> -			interrupts-extended = <&exti 50 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc LPTIM3_K>;
> -			clock-names = "mux";
> -			wakeup-source;
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm-lp";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			trigger@2 {
> -				compatible = "st,stm32-lptimer-trigger";
> -				reg = <2>;
> -				status = "disabled";
> -			};
> -
> -			timer {
> -				compatible = "st,stm32-lptimer-timer";
> -				status = "disabled";
> -			};
> -		};
> -
> -		lptimer4: timer@50023000 {
> -			compatible = "st,stm32-lptimer";
> -			reg = <0x50023000 0x400>;
> -			interrupts-extended = <&exti 52 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc LPTIM4_K>;
> -			clock-names = "mux";
> -			wakeup-source;
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm-lp";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer {
> -				compatible = "st,stm32-lptimer-timer";
> -				status = "disabled";
> -			};
> -		};
> -
> -		lptimer5: timer@50024000 {
> -			compatible = "st,stm32-lptimer";
> -			reg = <0x50024000 0x400>;
> -			interrupts-extended = <&exti 53 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc LPTIM5_K>;
> -			clock-names = "mux";
> -			wakeup-source;
> -			status = "disabled";
> -
> -			pwm {
> -				compatible = "st,stm32-pwm-lp";
> -				#pwm-cells = <3>;
> -				status = "disabled";
> -			};
> -
> -			timer {
> -				compatible = "st,stm32-lptimer-timer";
> -				status = "disabled";
> -			};
> -		};
> -
> -		rng: rng@54004000 {
> -			compatible = "st,stm32mp13-rng";
> -			reg = <0x54004000 0x400>;
> -			clocks = <&rcc RNG1_K>;
> -			resets = <&rcc RNG1_R>;
> -			status = "disabled";
> -		};
> -
> -		mdma: dma-controller@58000000 {
> -			compatible = "st,stm32h7-mdma";
> -			reg = <0x58000000 0x1000>;
> -			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc MDMA>;
> -			#dma-cells = <5>;
> -			dma-channels = <32>;
> -			dma-requests = <48>;
> -		};
> -
> -		fmc: memory-controller@58002000 {
> -			compatible = "st,stm32mp1-fmc2-ebi";
> -			reg = <0x58002000 0x1000>;
> -			ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
> -				 <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
> -				 <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
> -				 <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
> -				 <4 0 0x80000000 0x10000000>; /* NAND */
> -			#address-cells = <2>;
> -			#size-cells = <1>;
> -			clocks = <&rcc FMC_K>;
> -			resets = <&rcc FMC_R>;
> -			status = "disabled";
> -
> -			nand-controller@4,0 {
> -				compatible = "st,stm32mp1-fmc2-nfc";
> -				reg = <4 0x00000000 0x1000>,
> -				      <4 0x08010000 0x1000>,
> -				      <4 0x08020000 0x1000>,
> -				      <4 0x01000000 0x1000>,
> -				      <4 0x09010000 0x1000>,
> -				      <4 0x09020000 0x1000>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> -				dmas = <&mdma 24 0x2 0x12000a02 0x0 0x0>,
> -				       <&mdma 24 0x2 0x12000a08 0x0 0x0>,
> -				       <&mdma 25 0x2 0x12000a0a 0x0 0x0>;
> -				dma-names = "tx", "rx", "ecc";
> -				status = "disabled";
> -			};
> -		};
> -
> -		qspi: spi@58003000 {
> -			compatible = "st,stm32f469-qspi";
> -			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
> -			reg-names = "qspi", "qspi_mm";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&mdma 26 0x2 0x10100002 0x0 0x0>,
> -			       <&mdma 26 0x2 0x10100008 0x0 0x0>;
> -			dma-names = "tx", "rx";
> -			clocks = <&rcc QSPI_K>;
> -			resets = <&rcc QSPI_R>;
> -			status = "disabled";
> -		};
> -
> -		sdmmc1: mmc@58005000 {
> -			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
> -			arm,primecell-periphid = <0x20253180>;
> -			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
> -			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc SDMMC1_K>;
> -			clock-names = "apb_pclk";
> -			resets = <&rcc SDMMC1_R>;
> -			cap-sd-highspeed;
> -			cap-mmc-highspeed;
> -			max-frequency = <130000000>;
> -			status = "disabled";
> -		};
> -
> -		sdmmc2: mmc@58007000 {
> -			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
> -			arm,primecell-periphid = <0x20253180>;
> -			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
> -			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc SDMMC2_K>;
> -			clock-names = "apb_pclk";
> -			resets = <&rcc SDMMC2_R>;
> -			cap-sd-highspeed;
> -			cap-mmc-highspeed;
> -			max-frequency = <130000000>;
> -			status = "disabled";
> -		};
> -
> -		eth1: eth1@5800a000 {
> -			compatible = "snps,dwmac-4.20a", "st,stm32mp13-dwmac";
> -			reg = <0x5800a000 0x2000>;
> -			reg-names = "stmmaceth";
> -			interrupts-extended = <&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&exti 68 1>;
> -			interrupt-names = "macirq", "eth_wake_irq";
> -			clock-names = "stmmaceth",
> -				      "mac-clk-tx",
> -				      "mac-clk-rx",
> -				      "ethstp",
> -				      "eth-ck";
> -			clocks = <&rcc ETH1MAC>,
> -				 <&rcc ETH1TX>,
> -				 <&rcc ETH1RX>,
> -				 <&rcc ETH1STP>,
> -				 <&rcc ETH1CK_K>;
> -			st,syscon = <&syscfg 0x4 0xff0000>;
> -			snps,mixed-burst;
> -			snps,pbl = <2>;
> -			snps,axi-config = <&stmmac_axi_config_1>;
> -			snps,tso;
> -			status = "disabled";
> -
> -			stmmac_axi_config_1: stmmac-axi-config {
> -				snps,wr_osr_lmt = <0x7>;
> -				snps,rd_osr_lmt = <0x7>;
> -				snps,blen = <0 0 0 0 16 8 4>;
> -			};
> -		};
> -
> -		usbh_ohci: usb@5800c000 {
> -			compatible = "generic-ohci";
> -			reg = <0x5800c000 0x1000>;
> -			clocks = <&usbphyc>, <&rcc USBH>;
> -			resets = <&rcc USBH_R>;
> -			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> -
> -		usbh_ehci: usb@5800d000 {
> -			compatible = "generic-ehci";
> -			reg = <0x5800d000 0x1000>;
> -			clocks = <&usbphyc>, <&rcc USBH>;
> -			resets = <&rcc USBH_R>;
> -			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> -			companion = <&usbh_ohci>;
> -			status = "disabled";
> -		};
> -
> -		iwdg2: watchdog@5a002000 {
> -			compatible = "st,stm32mp1-iwdg";
> -			reg = <0x5a002000 0x400>;
> -			clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
> -			clock-names = "pclk", "lsi";
> -			status = "disabled";
> -		};
> -
> -		usbphyc: usbphyc@5a006000 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			#clock-cells = <0>;
> -			compatible = "st,stm32mp1-usbphyc";
> -			reg = <0x5a006000 0x1000>;
> -			clocks = <&rcc USBPHY_K>;
> -			resets = <&rcc USBPHY_R>;
> -			vdda1v1-supply = <&scmi_reg11>;
> -			vdda1v8-supply = <&scmi_reg18>;
> -			status = "disabled";
> -
> -			usbphyc_port0: usb-phy@0 {
> -				#phy-cells = <0>;
> -				reg = <0>;
> -			};
> -
> -			usbphyc_port1: usb-phy@1 {
> -				#phy-cells = <1>;
> -				reg = <1>;
> -			};
> -		};
> -
> -		rtc: rtc@5c004000 {
> -			compatible = "st,stm32mp1-rtc";
> -			reg = <0x5c004000 0x400>;
> -			interrupts-extended = <&exti 19 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&scmi_clk CK_SCMI_RTCAPB>,
> -				 <&scmi_clk CK_SCMI_RTC>;
> -			clock-names = "pclk", "rtc_ck";
> -			status = "disabled";
> -		};
> -
> -		bsec: efuse@5c005000 {
> -			compatible = "st,stm32mp13-bsec";
> -			reg = <0x5c005000 0x400>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -
> -			part_number_otp: part_number_otp@4 {
> -				reg = <0x4 0x2>;
> -				bits = <0 12>;
> -			};
> -			ts_cal1: calib@5c {
> -				reg = <0x5c 0x2>;
> -			};
> -			ts_cal2: calib@5e {
> -				reg = <0x5e 0x2>;
> -			};
> -			ethernet_mac1_address: mac1@e4 {
> -				reg = <0xe4 0x6>;
> -			};
> -			ethernet_mac2_address: mac2@ea {
> -				reg = <0xea 0x6>;
> -			};
> -		};
> -
> -		/*
> -		 * Break node order to solve dependency probe issue between
> -		 * pinctrl and exti.
> -		 */
> -		pinctrl: pinctrl@50002000 {
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			compatible = "st,stm32mp135-pinctrl";
> -			ranges = <0 0x50002000 0x8400>;
> -			interrupt-parent = <&exti>;
> -			st,syscfg = <&exti 0x60 0xff>;
> -
> -			gpioa: gpio@50002000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				reg = <0x0 0x400>;
> -				clocks = <&rcc GPIOA>;
> -				st,bank-name = "GPIOA";
> -				ngpios = <16>;
> -				gpio-ranges = <&pinctrl 0 0 16>;
> -			};
> -
> -			gpiob: gpio@50003000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				reg = <0x1000 0x400>;
> -				clocks = <&rcc GPIOB>;
> -				st,bank-name = "GPIOB";
> -				ngpios = <16>;
> -				gpio-ranges = <&pinctrl 0 16 16>;
> -			};
> -
> -			gpioc: gpio@50004000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				reg = <0x2000 0x400>;
> -				clocks = <&rcc GPIOC>;
> -				st,bank-name = "GPIOC";
> -				ngpios = <16>;
> -				gpio-ranges = <&pinctrl 0 32 16>;
> -			};
> -
> -			gpiod: gpio@50005000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				reg = <0x3000 0x400>;
> -				clocks = <&rcc GPIOD>;
> -				st,bank-name = "GPIOD";
> -				ngpios = <16>;
> -				gpio-ranges = <&pinctrl 0 48 16>;
> -			};
> -
> -			gpioe: gpio@50006000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				reg = <0x4000 0x400>;
> -				clocks = <&rcc GPIOE>;
> -				st,bank-name = "GPIOE";
> -				ngpios = <16>;
> -				gpio-ranges = <&pinctrl 0 64 16>;
> -			};
> -
> -			gpiof: gpio@50007000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				reg = <0x5000 0x400>;
> -				clocks = <&rcc GPIOF>;
> -				st,bank-name = "GPIOF";
> -				ngpios = <16>;
> -				gpio-ranges = <&pinctrl 0 80 16>;
> -			};
> -
> -			gpiog: gpio@50008000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				reg = <0x6000 0x400>;
> -				clocks = <&rcc GPIOG>;
> -				st,bank-name = "GPIOG";
> -				ngpios = <16>;
> -				gpio-ranges = <&pinctrl 0 96 16>;
> -			};
> -
> -			gpioh: gpio@50009000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				reg = <0x7000 0x400>;
> -				clocks = <&rcc GPIOH>;
> -				st,bank-name = "GPIOH";
> -				ngpios = <15>;
> -				gpio-ranges = <&pinctrl 0 112 15>;
> -			};
> -
> -			gpioi: gpio@5000a000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -				reg = <0x8000 0x400>;
> -				clocks = <&rcc GPIOI>;
> -				st,bank-name = "GPIOI";
> -				ngpios = <8>;
> -				gpio-ranges = <&pinctrl 0 128 8>;
> -			};
> -		};
> -	};
> -};
> diff --git a/arch/arm/dts/stm32mp133.dtsi b/arch/arm/dts/stm32mp133.dtsi
> deleted file mode 100644
> index 5cd5bde9535..00000000000
> --- a/arch/arm/dts/stm32mp133.dtsi
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> -/*
> - * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> - * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> - */
> -
> -#include "stm32mp131.dtsi"
> -
> -/ {
> -	soc {
> -		m_can1: can@4400e000 {
> -			compatible = "bosch,m_can";
> -			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
> -			reg-names = "m_can", "message_ram";
> -			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "int0", "int1";
> -			clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
> -			clock-names = "hclk", "cclk";
> -			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
> -			status = "disabled";
> -		};
> -
> -		m_can2: can@4400f000 {
> -			compatible = "bosch,m_can";
> -			reg = <0x4400f000 0x400>, <0x44011000 0x2800>;
> -			reg-names = "m_can", "message_ram";
> -			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "int0", "int1";
> -			clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
> -			clock-names = "hclk", "cclk";
> -			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
> -			status = "disabled";
> -		};
> -
> -		adc_1: adc@48003000 {
> -			compatible = "st,stm32mp13-adc-core";
> -			reg = <0x48003000 0x400>;
> -			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc ADC1>, <&rcc ADC1_K>;
> -			clock-names = "bus", "adc";
> -			interrupt-controller;
> -			#interrupt-cells = <1>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			status = "disabled";
> -
> -			adc1: adc@0 {
> -				compatible = "st,stm32mp13-adc";
> -				#io-channel-cells = <1>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -				reg = <0x0>;
> -				interrupt-parent = <&adc_1>;
> -				interrupts = <0>;
> -				dmas = <&dmamux1 9 0x400 0x80000001>;
> -				dma-names = "rx";
> -				status = "disabled";
> -
> -				channel@18 {
> -					reg = <18>;
> -					label = "vrefint";
> -				};
> -			};
> -		};
> -
> -		eth2: eth2@5800e000 {
> -			compatible = "snps,dwmac-4.20a", "st,stm32mp13-dwmac";
> -			reg = <0x5800e000 0x2000>;
> -			reg-names = "stmmaceth";
> -			interrupts-extended = <&intc GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "macirq";
> -			clock-names = "stmmaceth",
> -				      "mac-clk-tx",
> -				      "mac-clk-rx",
> -				      "ethstp",
> -				      "eth-ck";
> -			clocks = <&rcc ETH2MAC>,
> -				 <&rcc ETH2TX>,
> -				 <&rcc ETH2RX>,
> -				 <&rcc ETH2STP>,
> -				 <&rcc ETH2CK_K>;
> -			st,syscon = <&syscfg 0x4 0xff000000>;
> -			snps,mixed-burst;
> -			snps,pbl = <2>;
> -			snps,axi-config = <&stmmac_axi_config_2>;
> -			snps,tso;
> -			status = "disabled";
> -
> -			stmmac_axi_config_2: stmmac-axi-config {
> -				snps,wr_osr_lmt = <0x7>;
> -				snps,rd_osr_lmt = <0x7>;
> -				snps,blen = <0 0 0 0 16 8 4>;
> -			};
> -		};
> -	};
> -};
> diff --git a/arch/arm/dts/stm32mp135.dtsi b/arch/arm/dts/stm32mp135.dtsi
> deleted file mode 100644
> index abf2acd37b4..00000000000
> --- a/arch/arm/dts/stm32mp135.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> -/*
> - * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> - * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> - */
> -
> -#include "stm32mp133.dtsi"
> -
> -/ {
> -	soc {
> -	};
> -};
> diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
> deleted file mode 100644
> index 275823da3c6..00000000000
> --- a/arch/arm/dts/stm32mp135f-dk.dts
> +++ /dev/null
> @@ -1,376 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> -/*
> - * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> - * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> - */
> -
> -/dts-v1/;
> -
> -#include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/input/input.h>
> -#include <dt-bindings/leds/common.h>
> -#include <dt-bindings/pwm/pwm.h>
> -#include <dt-bindings/regulator/st,stm32mp13-regulator.h>
> -#include "stm32mp135.dtsi"
> -#include "stm32mp13xf.dtsi"
> -#include "stm32mp13-pinctrl.dtsi"
> -
> -/ {
> -	model = "STMicroelectronics STM32MP135F-DK Discovery Board";
> -	compatible = "st,stm32mp135f-dk", "st,stm32mp135";
> -
> -	aliases {
> -		serial0 = &uart4;
> -		serial1 = &usart1;
> -		serial2 = &uart8;
> -		serial3 = &usart2;
> -	};
> -
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -	};
> -
> -	memory@c0000000 {
> -		device_type = "memory";
> -		reg = <0xc0000000 0x20000000>;
> -	};
> -
> -	reserved-memory {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -
> -		optee@dd000000 {
> -			reg = <0xdd000000 0x3000000>;
> -			no-map;
> -		};
> -	};
> -
> -	gpio-keys {
> -		compatible = "gpio-keys";
> -
> -		button-user {
> -			label = "User-PA13";
> -			linux,code = <BTN_1>;
> -			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> -		};
> -	};
> -
> -	leds {
> -		compatible = "gpio-leds";
> -
> -		led-blue {
> -			function = LED_FUNCTION_HEARTBEAT;
> -			color = <LED_COLOR_ID_BLUE>;
> -			gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> -			linux,default-trigger = "heartbeat";
> -			default-state = "off";
> -		};
> -	};
> -};
> -
> -&adc_1 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&adc1_usb_cc_pins_a>;
> -	vdda-supply = <&scmi_vdd_adc>;
> -	vref-supply = <&scmi_vdd_adc>;
> -	status = "okay";
> -	adc1: adc@0 {
> -		status = "okay";
> -		/*
> -		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in6 & in12.
> -		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
> -		 * 5 * (5.1 + 47kOhms) * 5pF => 1.3us.
> -		 * Use arbitrary margin here (e.g. 5us).
> -		 */
> -		channel@6 {
> -			reg = <6>;
> -			st,min-sample-time-ns = <5000>;
> -		};
> -		channel@12 {
> -			reg = <12>;
> -			st,min-sample-time-ns = <5000>;
> -		};
> -	};
> -};
> -
> -&i2c1 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&i2c1_pins_a>;
> -	pinctrl-1 = <&i2c1_sleep_pins_a>;
> -	i2c-scl-rising-time-ns = <96>;
> -	i2c-scl-falling-time-ns = <3>;
> -	clock-frequency = <1000000>;
> -	status = "okay";
> -	/* spare dmas for other usage */
> -	/delete-property/dmas;
> -	/delete-property/dma-names;
> -
> -	mcp23017: pinctrl@21 {
> -		compatible = "microchip,mcp23017";
> -		reg = <0x21>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
> -		interrupt-parent = <&gpiog>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&mcp23017_pins_a>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		microchip,irq-mirror;
> -	};
> -
> -	typec@53 {
> -		compatible = "st,stm32g0-typec";
> -		reg = <0x53>;
> -		/* Alert pin on PI2 */
> -		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> -		interrupt-parent = <&gpioi>;
> -		/* Internal pull-up on PI2 */
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&stm32g0_intn_pins_a>;
> -		firmware-name = "stm32g0-ucsi.mp135f-dk.fw";
> -		connector {
> -			compatible = "usb-c-connector";
> -			label = "USB-C";
> -
> -			port {
> -				con_usb_c_g0_ep: endpoint {
> -					remote-endpoint = <&usbotg_hs_ep>;
> -				};
> -			};
> -		};
> -	};
> -};
> -
> -&i2c5 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&i2c5_pins_a>;
> -	pinctrl-1 = <&i2c5_sleep_pins_a>;
> -	i2c-scl-rising-time-ns = <170>;
> -	i2c-scl-falling-time-ns = <5>;
> -	clock-frequency = <400000>;
> -	status = "okay";
> -	/* spare dmas for other usage */
> -	/delete-property/dmas;
> -	/delete-property/dma-names;
> -};
> -
> -&iwdg2 {
> -	timeout-sec = <32>;
> -	status = "okay";
> -};
> -
> -&rtc {
> -	status = "okay";
> -};
> -
> -&scmi_regu {
> -	scmi_vdd_adc: regulator@10 {
> -		reg = <VOLTD_SCMI_STPMIC1_LDO1>;
> -		regulator-name = "vdd_adc";
> -	};
> -	scmi_vdd_usb: regulator@13 {
> -		reg = <VOLTD_SCMI_STPMIC1_LDO4>;
> -		regulator-name = "vdd_usb";
> -	};
> -	scmi_vdd_sd: regulator@14 {
> -		reg = <VOLTD_SCMI_STPMIC1_LDO5>;
> -		regulator-name = "vdd_sd";
> -	};
> -	scmi_v1v8_periph: regulator@15 {
> -		reg = <VOLTD_SCMI_STPMIC1_LDO6>;
> -		regulator-name = "v1v8_periph";
> -	};
> -	scmi_v3v3_sw: regulator@19 {
> -		reg = <VOLTD_SCMI_STPMIC1_PWR_SW2>;
> -		regulator-name = "v3v3_sw";
> -	};
> -};
> -
> -&sdmmc1 {
> -	pinctrl-names = "default", "opendrain", "sleep";
> -	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
> -	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_clk_pins_a>;
> -	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> -	cd-gpios = <&gpioh 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> -	disable-wp;
> -	st,neg-edge;
> -	bus-width = <4>;
> -	vmmc-supply = <&scmi_vdd_sd>;
> -	status = "okay";
> -};
> -
> -&spi5 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&spi5_pins_a>;
> -	pinctrl-1 = <&spi5_sleep_pins_a>;
> -	status = "disabled";
> -};
> -
> -&timers1 {
> -	/* spare dmas for other usage */
> -	/delete-property/dmas;
> -	/delete-property/dma-names;
> -	status = "okay";
> -	pwm1: pwm {
> -		pinctrl-0 = <&pwm1_ch3n_pins_a>;
> -		pinctrl-1 = <&pwm1_ch3n_sleep_pins_a>;
> -		pinctrl-names = "default", "sleep";
> -		status = "okay";
> -	};
> -};
> -
> -&timers3 {
> -	/delete-property/dmas;
> -	/delete-property/dma-names;
> -	status = "disabled";
> -	pwm {
> -		pinctrl-0 = <&pwm3_pins_a>;
> -		pinctrl-1 = <&pwm3_sleep_pins_a>;
> -		pinctrl-names = "default", "sleep";
> -		status = "okay";
> -	};
> -	timer@2 {
> -		status = "okay";
> -	};
> -};
> -
> -&timers4 {
> -	/delete-property/dmas;
> -	/delete-property/dma-names;
> -	status = "disabled";
> -	pwm {
> -		pinctrl-0 = <&pwm4_pins_a>;
> -		pinctrl-1 = <&pwm4_sleep_pins_a>;
> -		pinctrl-names = "default", "sleep";
> -		status = "okay";
> -	};
> -	timer@3 {
> -		status = "okay";
> -	};
> -};
> -
> -&timers8 {
> -	/delete-property/dmas;
> -	/delete-property/dma-names;
> -	status = "disabled";
> -	pwm {
> -		pinctrl-0 = <&pwm8_pins_a>;
> -		pinctrl-1 = <&pwm8_sleep_pins_a>;
> -		pinctrl-names = "default", "sleep";
> -		status = "okay";
> -	};
> -	timer@7 {
> -		status = "okay";
> -	};
> -};
> -
> -&timers14 {
> -	status = "disabled";
> -	pwm {
> -		pinctrl-0 = <&pwm14_pins_a>;
> -		pinctrl-1 = <&pwm14_sleep_pins_a>;
> -		pinctrl-names = "default", "sleep";
> -		status = "okay";
> -	};
> -	timer@13 {
> -		status = "okay";
> -	};
> -};
> -
> -&uart4 {
> -	pinctrl-names = "default", "sleep", "idle";
> -	pinctrl-0 = <&uart4_pins_a>;
> -	pinctrl-1 = <&uart4_sleep_pins_a>;
> -	pinctrl-2 = <&uart4_idle_pins_a>;
> -	/delete-property/dmas;
> -	/delete-property/dma-names;
> -	status = "okay";
> -};
> -
> -&uart8 {
> -	pinctrl-names = "default", "sleep", "idle";
> -	pinctrl-0 = <&uart8_pins_a>;
> -	pinctrl-1 = <&uart8_sleep_pins_a>;
> -	pinctrl-2 = <&uart8_idle_pins_a>;
> -	/delete-property/dmas;
> -	/delete-property/dma-names;
> -	status = "disabled";
> -};
> -
> -&usart1 {
> -	pinctrl-names = "default", "sleep", "idle";
> -	pinctrl-0 = <&usart1_pins_a>;
> -	pinctrl-1 = <&usart1_sleep_pins_a>;
> -	pinctrl-2 = <&usart1_idle_pins_a>;
> -	uart-has-rtscts;
> -	status = "disabled";
> -};
> -
> -/* Bluetooth */
> -&usart2 {
> -	pinctrl-names = "default", "sleep", "idle";
> -	pinctrl-0 = <&usart2_pins_a>;
> -	pinctrl-1 = <&usart2_sleep_pins_a>;
> -	pinctrl-2 = <&usart2_idle_pins_a>;
> -	uart-has-rtscts;
> -	status = "okay";
> -};
> -
> -&usbh_ehci {
> -	phys = <&usbphyc_port0>;
> -	status = "okay";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	/* onboard HUB */
> -	hub@1 {
> -		compatible = "usb424,2514";
> -		reg = <1>;
> -		vdd-supply = <&scmi_v3v3_sw>;
> -	};
> -};
> -
> -&usbotg_hs {
> -	phys = <&usbphyc_port1 0>;
> -	phy-names = "usb2-phy";
> -	usb-role-switch;
> -	status = "okay";
> -	port {
> -		usbotg_hs_ep: endpoint {
> -			remote-endpoint = <&con_usb_c_g0_ep>;
> -		};
> -	};
> -};
> -
> -&usbphyc {
> -	status = "okay";
> -};
> -
> -&usbphyc_port0 {
> -	phy-supply = <&scmi_vdd_usb>;
> -	st,current-boost-microamp = <1000>;
> -	st,decrease-hs-slew-rate;
> -	st,tune-hs-dc-level = <2>;
> -	st,enable-hs-rftime-reduction;
> -	st,trim-hs-current = <11>;
> -	st,trim-hs-impedance = <2>;
> -	st,tune-squelch-level = <1>;
> -	st,enable-hs-rx-gain-eq;
> -	st,no-hs-ftime-ctrl;
> -	st,no-lsfs-sc;
> -};
> -
> -&usbphyc_port1 {
> -	phy-supply = <&scmi_vdd_usb>;
> -	st,current-boost-microamp = <1000>;
> -	st,decrease-hs-slew-rate;
> -	st,tune-hs-dc-level = <2>;
> -	st,enable-hs-rftime-reduction;
> -	st,trim-hs-current = <11>;
> -	st,trim-hs-impedance = <2>;
> -	st,tune-squelch-level = <1>;
> -	st,enable-hs-rx-gain-eq;
> -	st,no-hs-ftime-ctrl;
> -	st,no-lsfs-sc;
> -};
> diff --git a/arch/arm/dts/stm32mp13xc.dtsi b/arch/arm/dts/stm32mp13xc.dtsi
> deleted file mode 100644
> index 4d00e759288..00000000000
> --- a/arch/arm/dts/stm32mp13xc.dtsi
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> -/*
> - * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> - * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> - */
> -
> -/ {
> -	soc {
> -		cryp: crypto@54002000 {
> -			compatible = "st,stm32mp1-cryp";
> -			reg = <0x54002000 0x400>;
> -			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc CRYP1>;
> -			resets = <&rcc CRYP1_R>;
> -			status = "disabled";
> -		};
> -	};
> -};
> diff --git a/arch/arm/dts/stm32mp13xf.dtsi b/arch/arm/dts/stm32mp13xf.dtsi
> deleted file mode 100644
> index 4d00e759288..00000000000
> --- a/arch/arm/dts/stm32mp13xf.dtsi
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> -/*
> - * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> - * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> - */
> -
> -/ {
> -	soc {
> -		cryp: crypto@54002000 {
> -			compatible = "st,stm32mp1-cryp";
> -			reg = <0x54002000 0x400>;
> -			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&rcc CRYP1>;
> -			resets = <&rcc CRYP1_R>;
> -			status = "disabled";
> -		};
> -	};
> -};
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 002da2e3d3b..3a5f488fe10 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -52,6 +52,7 @@ config STM32MP13X
>  	select STM32_SERIAL
>  	select SYS_ARCH_TIMER
>  	imply CMD_NVEDIT_INFO
> +	imply OF_UPSTREAM
>  	help
>  		support of STMicroelectronics SOC STM32MP13x family
>  		STMicroelectronics MPU with core ARMv7
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 4c6a7f82fe5..530f6aa6380 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -4,7 +4,7 @@ CONFIG_TFABOOT=y
>  CONFIG_SYS_MALLOC_F_LEN=0x180000
>  CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0400000
>  CONFIG_ENV_OFFSET=0x900000
> -CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dk"
> +CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp135f-dk"
>  CONFIG_SYS_BOOTM_LEN=0x2000000
>  CONFIG_SYS_LOAD_ADDR=0xc2000000
>  CONFIG_STM32MP13X=y
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
