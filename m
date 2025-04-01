Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80CA77BED
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:20:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0A57C78F90;
	Tue,  1 Apr 2025 13:20:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A252C78F8C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:20:18 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531BI6Eu010841;
 Tue, 1 Apr 2025 15:18:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 jUcMiSN+uMwZZ6lfE5twxHNu17I+JarSV939mpLOb7Q=; b=DdaC9FAZ/BI7KMfr
 GFpW7VF0X6c02TZ+LdRloEpL0HbWEU8ApopgCEK6PitGwCDDFrDApheiZ/xNBbev
 U5ovc7WZbJnOG0HNwULEzefC0dbtVm14OhrRgIp0OgknI7deNCJK2SvL//Lma11x
 s3XpJ07O//oDhqpLfwAnMd1BTh93Qjp2tl6wO4tSUlmj8umrRIXZDO98RhejNewJ
 0S4dEwtbDnIkzaXfSuSRzzSk6ohXuM+vANFb3Veh3VQgKLr0z+19H1Q1N6vSuCIF
 hCFNyxVIg9AM9doaIFTGCmoi553PXKaBh/hQLcKqFRG4GB6BdVnqAByMu3nPQoEc
 vp/H7Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45pua7u2nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:18:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BE7B64002D;
 Tue,  1 Apr 2025 15:16:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 533BF894090;
 Tue,  1 Apr 2025 15:14:31 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:14:30 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:14:03 +0200
Message-ID: <20250401131413.387139-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401131413.387139-1-patrice.chotard@foss.st.com>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Fabio Estevam <festevam@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sumit Garg <sumit.garg@kernel.org>, Tom Rini <trini@konsulko.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Prasad Kummari <prasad.kummari@amd.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>
Subject: [Uboot-stm32] [PATCH 03/13] ARM: dts: stm32: convert stm23f7 boards
	to OF_UPSTREAM
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

Enable OF_UPSTREAM flag for STM32F7 platforms.

Use upstream device tree for DSI and LTDC nodes,
As now in upstream DT, in panel@0 node, power-supply property is
present, which is a fixed-regulator, add DM_REGULATOR_FIXED flag
for stm32f769-disco boards.

Set also DEFAULT_FDT_FILE in defconfigs and use it in stm32f746-disco.h
to indicate which FDT file to load (All STM32F7 boards are using this
file).

If something is missing, it must be added in upstream device tree
in linux kernel ("px_clk" for DSI by example).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/Makefile                    |   4 -
 arch/arm/dts/stm32746g-eval.dts          | 186 -------
 arch/arm/dts/stm32f7-pinctrl.dtsi        | 415 ---------------
 arch/arm/dts/stm32f746-disco-u-boot.dtsi |  13 +-
 arch/arm/dts/stm32f746-disco.dts         | 169 -------
 arch/arm/dts/stm32f746-pinctrl.dtsi      |  11 -
 arch/arm/dts/stm32f746.dtsi              | 613 -----------------------
 arch/arm/dts/stm32f769-disco-u-boot.dtsi |  60 +--
 arch/arm/dts/stm32f769-disco.dts         | 133 -----
 arch/arm/dts/stm32f769-pinctrl.dtsi      |  11 -
 arch/arm/mach-stm32/Kconfig              |   1 +
 configs/stm32746g-eval_defconfig         |   3 +-
 configs/stm32746g-eval_spl_defconfig     |   3 +-
 configs/stm32f746-disco_defconfig        |   3 +-
 configs/stm32f746-disco_spl_defconfig    |   3 +-
 configs/stm32f769-disco_defconfig        |   4 +-
 configs/stm32f769-disco_spl_defconfig    |   4 +-
 include/configs/stm32f746-disco.h        |   2 +-
 18 files changed, 34 insertions(+), 1604 deletions(-)
 delete mode 100644 arch/arm/dts/stm32746g-eval.dts
 delete mode 100644 arch/arm/dts/stm32f7-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32f746-disco.dts
 delete mode 100644 arch/arm/dts/stm32f746-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32f746.dtsi
 delete mode 100644 arch/arm/dts/stm32f769-disco.dts
 delete mode 100644 arch/arm/dts/stm32f769-pinctrl.dtsi

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6425e424334..2a3c12431c5 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -523,10 +523,6 @@ dtb-$(CONFIG_STM32F4) += stm32f429-disco.dtb \
 	stm32429i-eval.dtb \
 	stm32f469-disco.dtb
 
-dtb-$(CONFIG_STM32F7) += stm32f746-disco.dtb \
-	stm32f769-disco.dtb \
-	stm32746g-eval.dtb
-
 dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-inet-3f.dtb \
 	sun4i-a10-inet-3w.dtb
diff --git a/arch/arm/dts/stm32746g-eval.dts b/arch/arm/dts/stm32746g-eval.dts
deleted file mode 100644
index 0e6445a539e..00000000000
--- a/arch/arm/dts/stm32746g-eval.dts
+++ /dev/null
@@ -1,186 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR X11
-/*
- * Copyright 2015 - Maxime Coquelin <mcoquelin.stm32@gmail.com>
- *
- */
-
-/dts-v1/;
-#include "stm32f746.dtsi"
-#include "stm32f746-pinctrl.dtsi"
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-
-/ {
-	model = "STMicroelectronics STM32746g-EVAL board";
-	compatible = "st,stm32746g-eval", "st,stm32f746";
-
-	chosen {
-		bootargs = "root=/dev/ram";
-		stdout-path = "serial0:115200n8";
-	};
-
-	memory@c0000000 {
-		device_type = "memory";
-		reg = <0xc0000000 0x2000000>;
-	};
-
-	aliases {
-		serial0 = &usart1;
-	};
-
-	leds {
-		compatible = "gpio-leds";
-		led-green {
-			gpios = <&gpiof 10 1>;
-			linux,default-trigger = "heartbeat";
-		};
-		led-orange {
-			gpios = <&stmfx_pinctrl 17 1>;
-		};
-		led-red {
-			gpios = <&gpiob 7 1>;
-		};
-		led-blue {
-			gpios = <&stmfx_pinctrl 19 1>;
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		autorepeat;
-		button-0 {
-			label = "Wake up";
-			linux,code = <KEY_WAKEUP>;
-			gpios = <&gpioc 13 0>;
-		};
-	};
-
-	joystick {
-		compatible = "gpio-keys";
-		pinctrl-0 = <&joystick_pins>;
-		pinctrl-names = "default";
-		button-0 {
-			label = "JoySel";
-			linux,code = <KEY_ENTER>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
-		};
-		button-1 {
-			label = "JoyDown";
-			linux,code = <KEY_DOWN>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
-		};
-		button-2 {
-			label = "JoyLeft";
-			linux,code = <KEY_LEFT>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
-		};
-		button-3 {
-			label = "JoyRight";
-			linux,code = <KEY_RIGHT>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
-		};
-		button-4 {
-			label = "JoyUp";
-			linux,code = <KEY_UP>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
-		};
-	};
-
-	usbotg_hs_phy: usb-phy {
-		#phy-cells = <0>;
-		compatible = "usb-nop-xceiv";
-		clocks = <&rcc 0 STM32F7_AHB1_CLOCK(OTGHSULPI)>;
-		clock-names = "main_clk";
-	};
-
-	mmc_vcard: mmc_vcard {
-		compatible = "regulator-fixed";
-		regulator-name = "mmc_vcard";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-};
-
-&clk_hse {
-	clock-frequency = <25000000>;
-};
-
-&crc {
-	status = "okay";
-};
-
-&i2c1 {
-	pinctrl-0 = <&i2c1_pins_b>;
-	pinctrl-names = "default";
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-
-	stmfx: stmfx@42 {
-		compatible = "st,stmfx-0300";
-		reg = <0x42>;
-		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
-		interrupt-parent = <&gpioi>;
-
-		stmfx_pinctrl: pinctrl {
-			compatible = "st,stmfx-0300-pinctrl";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
-
-			joystick_pins: joystick {
-				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
-				drive-push-pull;
-				bias-pull-up;
-			};
-		};
-	};
-};
-
-&rtc {
-	status = "okay";
-};
-
-&sdio1 {
-	status = "okay";
-	vmmc-supply = <&mmc_vcard>;
-	broken-cd;
-	pinctrl-names = "default", "opendrain";
-	pinctrl-0 = <&sdio_pins_a>;
-	pinctrl-1 = <&sdio_pins_od_a>;
-	bus-width = <4>;
-};
-
-&timers5 {
-	/* Override timer5 to act as clockevent */
-	compatible = "st,stm32-timer";
-	interrupts = <50>;
-	status = "okay";
-	/delete-property/#address-cells;
-	/delete-property/#size-cells;
-	/delete-property/clock-names;
-	/delete-node/pwm;
-	/delete-node/timer@4;
-};
-
-&usart1 {
-	pinctrl-0 = <&usart1_pins_a>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&usbotg_hs {
-	dr_mode = "otg";
-	phys = <&usbotg_hs_phy>;
-	phy-names = "usb2-phy";
-	pinctrl-0 = <&usbotg_hs_pins_a>;
-	pinctrl-names = "default";
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32f7-pinctrl.dtsi b/arch/arm/dts/stm32f7-pinctrl.dtsi
deleted file mode 100644
index d3706ee33b5..00000000000
--- a/arch/arm/dts/stm32f7-pinctrl.dtsi
+++ /dev/null
@@ -1,415 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
- * Author: Alexandre Torgue  <alexandre.torgue@st.com> for STMicroelectronics.
- */
-
-#include <dt-bindings/pinctrl/stm32-pinfunc.h>
-#include <dt-bindings/mfd/stm32f7-rcc.h>
-
-/ {
-	soc {
-		pinctrl: pinctrl@40020000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x40020000 0x3000>;
-			interrupt-parent = <&exti>;
-			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
-
-			gpioa: gpio@40020000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x0 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOA)>;
-				st,bank-name = "GPIOA";
-			};
-
-			gpiob: gpio@40020400 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x400 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOB)>;
-				st,bank-name = "GPIOB";
-			};
-
-			gpioc: gpio@40020800 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x800 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOC)>;
-				st,bank-name = "GPIOC";
-			};
-
-			gpiod: gpio@40020c00 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0xc00 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOD)>;
-				st,bank-name = "GPIOD";
-			};
-
-			gpioe: gpio@40021000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1000 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOE)>;
-				st,bank-name = "GPIOE";
-			};
-
-			gpiof: gpio@40021400 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1400 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOF)>;
-				st,bank-name = "GPIOF";
-			};
-
-			gpiog: gpio@40021800 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1800 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOG)>;
-				st,bank-name = "GPIOG";
-			};
-
-			gpioh: gpio@40021c00 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1c00 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOH)>;
-				st,bank-name = "GPIOH";
-			};
-
-			gpioi: gpio@40022000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x2000 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOI)>;
-				st,bank-name = "GPIOI";
-			};
-
-			gpioj: gpio@40022400 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x2400 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOJ)>;
-				st,bank-name = "GPIOJ";
-			};
-
-			gpiok: gpio@40022800 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x2800 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOK)>;
-				st,bank-name = "GPIOK";
-			};
-
-			cec_pins_a: cec-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 15, AF4)>; /* HDMI CEC */
-					slew-rate = <0>;
-					drive-open-drain;
-					bias-disable;
-				};
-			};
-
-			usart1_pins_a: usart1-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('A', 10, AF7)>; /* USART1_RX */
-					bias-disable;
-				};
-			};
-
-			usart1_pins_b: usart1-1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 7, AF7)>; /* USART1_RX */
-					bias-disable;
-				};
-			};
-
-			i2c1_pins_b: i2c1-0 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 9, AF4)>, /* I2C1 SDA */
-						 <STM32_PINMUX('B', 8, AF4)>; /* I2C1 SCL */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c3_pins_a: i2c3-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 8, AF4)>, /* I2C3_SDA */
-						 <STM32_PINMUX('H', 7, AF4)>; /* I2C3_SCL */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			usbotg_hs_pins_a: usbotg-hs-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
-						 <STM32_PINMUX('I', 11, AF10)>, /* OTG_HS_ULPI_DIR */
-						 <STM32_PINMUX('C', 0, AF10)>, /* OTG_HS_ULPI_STP */
-						 <STM32_PINMUX('A', 5, AF10)>, /* OTG_HS_ULPI_CK */
-						 <STM32_PINMUX('A', 3, AF10)>, /* OTG_HS_ULPI_D0 */
-						 <STM32_PINMUX('B', 0, AF10)>, /* OTG_HS_ULPI_D1 */
-						 <STM32_PINMUX('B', 1, AF10)>, /* OTG_HS_ULPI_D2 */
-						 <STM32_PINMUX('B', 10, AF10)>, /* OTG_HS_ULPI_D3 */
-						 <STM32_PINMUX('B', 11, AF10)>, /* OTG_HS_ULPI_D4 */
-						 <STM32_PINMUX('B', 12, AF10)>, /* OTG_HS_ULPI_D5 */
-						 <STM32_PINMUX('B', 13, AF10)>, /* OTG_HS_ULPI_D6 */
-						 <STM32_PINMUX('B', 5, AF10)>; /* OTG_HS_ULPI_D7 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-			};
-
-			usbotg_hs_pins_b: usbotg-hs-1 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
-						 <STM32_PINMUX('C', 2, AF10)>, /* OTG_HS_ULPI_DIR */
-						 <STM32_PINMUX('C', 0, AF10)>, /* OTG_HS_ULPI_STP */
-						 <STM32_PINMUX('A', 5, AF10)>, /* OTG_HS_ULPI_CK */
-						 <STM32_PINMUX('A', 3, AF10)>, /* OTG_HS_ULPI_D0 */
-						 <STM32_PINMUX('B', 0, AF10)>, /* OTG_HS_ULPI_D1 */
-						 <STM32_PINMUX('B', 1, AF10)>, /* OTG_HS_ULPI_D2 */
-						 <STM32_PINMUX('B', 10, AF10)>, /* OTG_HS_ULPI_D3 */
-						 <STM32_PINMUX('B', 11, AF10)>, /* OTG_HS_ULPI_D4 */
-						 <STM32_PINMUX('B', 12, AF10)>, /* OTG_HS_ULPI_D5 */
-						 <STM32_PINMUX('B', 13, AF10)>, /* OTG_HS_ULPI_D6 */
-						 <STM32_PINMUX('B', 5, AF10)>; /* OTG_HS_ULPI_D7 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-			};
-
-			usbotg_fs_pins_a: usbotg-fs-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 10, AF10)>, /* OTG_FS_ID */
-						 <STM32_PINMUX('A', 11, AF10)>, /* OTG_FS_DM */
-						 <STM32_PINMUX('A', 12, AF10)>; /* OTG_FS_DP */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-			};
-
-			sdio_pins_a: sdio-pins-a-0 {
-				pins {
-					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1 D0 */
-						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1 D1 */
-						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1 D2 */
-						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1 D3 */
-						 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1 CLK */
-						 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1 CMD */
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-			};
-
-			sdio_pins_od_a: sdio-pins-od-a-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1 D0 */
-						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1 D1 */
-						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1 D2 */
-						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1 D3 */
-						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1 CLK */
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-
-				pins2 {
-					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1 CMD */
-					drive-open-drain;
-					slew-rate = <2>;
-				};
-			};
-
-			sdio_pins_b: sdio-pins-b-0 {
-				pins {
-					pinmux = <STM32_PINMUX('G', 9, AF11)>, /* SDMMC2 D0 */
-						 <STM32_PINMUX('G', 10, AF11)>, /* SDMMC2 D1 */
-						 <STM32_PINMUX('B', 3, AF10)>, /* SDMMC2 D2 */
-						 <STM32_PINMUX('B', 4, AF10)>, /* SDMMC2 D3 */
-						 <STM32_PINMUX('D', 6, AF11)>, /* SDMMC2 CLK */
-						 <STM32_PINMUX('D', 7, AF11)>; /* SDMMC2 CMD */
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-			};
-
-			sdio_pins_od_b: sdio-pins-od-b-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('G', 9, AF11)>, /* SDMMC2 D0 */
-						 <STM32_PINMUX('G', 10, AF11)>, /* SDMMC2 D1 */
-						 <STM32_PINMUX('B', 3, AF10)>, /* SDMMC2 D2 */
-						 <STM32_PINMUX('B', 4, AF10)>, /* SDMMC2 D3 */
-						 <STM32_PINMUX('D', 6, AF11)>; /* SDMMC2 CLK */
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-
-				pins2 {
-					pinmux = <STM32_PINMUX('D', 7, AF11)>; /* SDMMC2 CMD */
-					drive-open-drain;
-					slew-rate = <2>;
-				};
-			};
-
-			can1_pins_a: can1-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('A', 12, AF9)>; /* CAN1_TX */
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('A', 11, AF9)>; /* CAN1_RX */
-					bias-pull-up;
-				};
-			};
-
-			can1_pins_b: can1-1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 9, AF9)>; /* CAN1_TX */
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 8, AF9)>; /* CAN1_RX */
-					bias-pull-up;
-				};
-			};
-
-			can1_pins_c: can1-2 {
-				pins1 {
-					pinmux = <STM32_PINMUX('D', 1, AF9)>; /* CAN1_TX */
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('D', 0, AF9)>; /* CAN1_RX */
-					bias-pull-up;
-
-				};
-			};
-
-			can1_pins_d: can1-3 {
-				pins1 {
-					pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('H', 14, AF9)>; /* CAN1_RX */
-					bias-pull-up;
-
-				};
-			};
-
-			can2_pins_a: can2-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 6, AF9)>; /* CAN2_TX */
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 5, AF9)>; /* CAN2_RX */
-					bias-pull-up;
-				};
-			};
-
-			can2_pins_b: can2-1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 12, AF9)>; /* CAN2_RX */
-					bias-pull-up;
-				};
-			};
-
-			can3_pins_a: can3-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('A', 15, AF11)>; /* CAN3_TX */
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('A', 8, AF11)>; /* CAN3_RX */
-					bias-pull-up;
-				};
-			};
-
-			can3_pins_b: can3-1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 4, AF11)>;  /* CAN3_TX */
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 3, AF11)>; /* CAN3_RX */
-					bias-pull-up;
-				};
-			};
-
-			ltdc_pins_a: ltdc-0 {
-				pins {
-					pinmux = <STM32_PINMUX('E', 4, AF14)>, /* LCD_B0 */
-						 <STM32_PINMUX('G',12, AF9)>,  /* LCD_B4 */
-						 <STM32_PINMUX('I', 9, AF14)>, /* LCD_VSYNC */
-						 <STM32_PINMUX('I',10, AF14)>, /* LCD_HSYNC */
-						 <STM32_PINMUX('I',14, AF14)>, /* LCD_CLK */
-						 <STM32_PINMUX('I',15, AF14)>, /* LCD_R0 */
-						 <STM32_PINMUX('J', 0, AF14)>, /* LCD_R1 */
-						 <STM32_PINMUX('J', 1, AF14)>, /* LCD_R2 */
-						 <STM32_PINMUX('J', 2, AF14)>, /* LCD_R3 */
-						 <STM32_PINMUX('J', 3, AF14)>, /* LCD_R4 */
-						 <STM32_PINMUX('J', 4, AF14)>, /* LCD_R5 */
-						 <STM32_PINMUX('J', 5, AF14)>, /* LCD_R6 */
-						 <STM32_PINMUX('J', 6, AF14)>, /* LCD_R7 */
-						 <STM32_PINMUX('J', 7, AF14)>, /* LCD_G0 */
-						 <STM32_PINMUX('J', 8, AF14)>, /* LCD_G1 */
-						 <STM32_PINMUX('J', 9, AF14)>, /* LCD_G2 */
-						 <STM32_PINMUX('J',10, AF14)>, /* LCD_G3 */
-						 <STM32_PINMUX('J',11, AF14)>, /* LCD_G4 */
-						 <STM32_PINMUX('J',13, AF14)>, /* LCD_B1 */
-						 <STM32_PINMUX('J',14, AF14)>, /* LCD_B2 */
-						 <STM32_PINMUX('J',15, AF14)>, /* LCD_B3 */
-						 <STM32_PINMUX('K', 0, AF14)>, /* LCD_G5 */
-						 <STM32_PINMUX('K', 1, AF14)>, /* LCD_G6 */
-						 <STM32_PINMUX('K', 2, AF14)>, /* LCD_G7 */
-						 <STM32_PINMUX('K', 4, AF14)>, /* LCD_B5 */
-						 <STM32_PINMUX('K', 5, AF14)>, /* LCD_B6 */
-						 <STM32_PINMUX('K', 6, AF14)>, /* LCD_B7 */
-						 <STM32_PINMUX('K', 7, AF14)>; /* LCD_DE */
-					slew-rate = <2>;
-				};
-			};
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index 38d797e49a0..8ea4ea6c248 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -24,11 +24,6 @@
 	};
 };
 
-&ltdc {
-	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
-	bootph-all;
-};
-
 &fmc {
 	/* Memory configuration from sdram datasheet MT48LC_4M32_B2B5-6A */
 	bank1: bank@0 {
@@ -53,8 +48,14 @@
 	};
 };
 
+&ltdc {
+	bootph-all;
+
+	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
+};
+
 &panel_rgb {
-	compatible = "simple-panel";
+	compatible = "rocktech,rk043fn48h", "simple-panel";
 
 	display-timings {
 		timing@0 {
diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
deleted file mode 100644
index 43127513403..00000000000
--- a/arch/arm/dts/stm32f746-disco.dts
+++ /dev/null
@@ -1,169 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR X11
-/*
- * Copyright 2017 - Vikas MANOCHA <vikas.manocha@st.com>
- *
- */
-
-/dts-v1/;
-#include "stm32f746.dtsi"
-#include "stm32f746-pinctrl.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-
-/ {
-	model = "STMicroelectronics STM32F746-DISCO board";
-	compatible = "st,stm32f746-disco", "st,stm32f746";
-
-	chosen {
-		bootargs = "root=/dev/ram";
-		stdout-path = "serial0:115200n8";
-	};
-
-	memory@c0000000 {
-		device_type = "memory";
-		reg = <0xC0000000 0x800000>;
-	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		linux,cma {
-			compatible = "shared-dma-pool";
-			no-map;
-			size = <0x80000>;
-			linux,dma-default;
-		};
-	};
-
-	aliases {
-		serial0 = &usart1;
-	};
-
-	usbotg_hs_phy: usb-phy {
-		#phy-cells = <0>;
-		compatible = "usb-nop-xceiv";
-		clocks = <&rcc 0 STM32F7_AHB1_CLOCK(OTGHSULPI)>;
-		clock-names = "main_clk";
-	};
-
-	/* This turns on vbus for otg fs for host mode (dwc2) */
-	vcc5v_otg_fs: vcc5v-otg-fs-regulator {
-		compatible = "regulator-fixed";
-		gpio = <&gpiod 5 0>;
-		regulator-name = "vcc5_host1";
-		regulator-always-on;
-	};
-
-	vcc_3v3: vcc-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	backlight: backlight {
-		compatible = "gpio-backlight";
-		gpios = <&gpiok 3 GPIO_ACTIVE_HIGH>;
-		status = "okay";
-	};
-
-	panel_rgb: panel-rgb {
-		compatible = "rocktech,rk043fn48h";
-		power-supply = <&vcc_3v3>;
-		backlight = <&backlight>;
-		enable-gpios = <&gpioi 12 GPIO_ACTIVE_HIGH>;
-		status = "okay";
-		port {
-			panel_in_rgb: endpoint {
-				remote-endpoint = <&ltdc_out_rgb>;
-			};
-		};
-	};
-};
-
-&clk_hse {
-	clock-frequency = <25000000>;
-};
-
-&i2c1 {
-	pinctrl-0 = <&i2c1_pins_b>;
-	pinctrl-names = "default";
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-};
-
-&i2c3 {
-	pinctrl-0 = <&i2c3_pins_a>;
-	pinctrl-names = "default";
-	clock-frequency = <400000>;
-	status = "okay";
-
-	touchscreen@38 {
-		compatible = "edt,edt-ft5306";
-		reg = <0x38>;
-		interrupt-parent = <&gpioi>;
-		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
-		touchscreen-size-x = <480>;
-		touchscreen-size-y = <272>;
-	};
-};
-
-&ltdc {
-	pinctrl-0 = <&ltdc_pins_a>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	port {
-		ltdc_out_rgb: endpoint {
-			remote-endpoint = <&panel_in_rgb>;
-		};
-	};
-};
-
-&sdio1 {
-	status = "okay";
-	vmmc-supply = <&vcc_3v3>;
-	cd-gpios = <&gpioc 13 GPIO_ACTIVE_LOW>;
-	pinctrl-names = "default", "opendrain";
-	pinctrl-0 = <&sdio_pins_a>;
-	pinctrl-1 = <&sdio_pins_od_a>;
-	bus-width = <4>;
-};
-
-&timers5 {
-	/* Override timer5 to act as clockevent */
-	compatible = "st,stm32-timer";
-	interrupts = <50>;
-	status = "okay";
-	/delete-property/#address-cells;
-	/delete-property/#size-cells;
-	/delete-property/clock-names;
-	/delete-node/pwm;
-	/delete-node/timer@4;
-};
-
-&usart1 {
-	pinctrl-0 = <&usart1_pins_b>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&usbotg_fs {
-	dr_mode = "host";
-	pinctrl-0 = <&usbotg_fs_pins_a>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&usbotg_hs {
-	dr_mode = "host";
-	phys = <&usbotg_hs_phy>;
-	phy-names = "usb2-phy";
-	pinctrl-0 = <&usbotg_hs_pins_b>;
-	pinctrl-names = "default";
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32f746-pinctrl.dtsi b/arch/arm/dts/stm32f746-pinctrl.dtsi
deleted file mode 100644
index fcfd2ac7239..00000000000
--- a/arch/arm/dts/stm32f746-pinctrl.dtsi
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
- * Author: Alexandre Torgue  <alexandre.torgue@st.com> for STMicroelectronics.
- */
-
-#include "stm32f7-pinctrl.dtsi"
-
-&pinctrl{
-	compatible = "st,stm32f746-pinctrl";
-};
diff --git a/arch/arm/dts/stm32f746.dtsi b/arch/arm/dts/stm32f746.dtsi
deleted file mode 100644
index 79dad3192e1..00000000000
--- a/arch/arm/dts/stm32f746.dtsi
+++ /dev/null
@@ -1,613 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR X11
-/*
- * Copyright 2015 - Maxime Coquelin <mcoquelin.stm32@gmail.com>
- *
- */
-
-#include "armv7-m.dtsi"
-#include <dt-bindings/clock/stm32fx-clock.h>
-#include <dt-bindings/mfd/stm32f7-rcc.h>
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	clocks {
-		clk_hse: clk-hse {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <0>;
-		};
-
-		clk-lse {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <32768>;
-		};
-
-		clk-lsi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <32000>;
-		};
-
-		clk_i2s_ckin: clk-i2s-ckin {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <48000000>;
-		};
-	};
-
-	soc {
-		timers2: timers@40000000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40000000 0x400>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM2)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@1 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <1>;
-				status = "disabled";
-			};
-		};
-
-		timers3: timers@40000400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40000400 0x400>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM3)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@2 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <2>;
-				status = "disabled";
-			};
-		};
-
-		timers4: timers@40000800 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40000800 0x400>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM4)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@3 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <3>;
-				status = "disabled";
-			};
-		};
-
-		timers5: timers@40000c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40000C00 0x400>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM5)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@4 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <4>;
-				status = "disabled";
-			};
-		};
-
-		timers6: timers@40001000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40001000 0x400>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM6)>;
-			clock-names = "int";
-			status = "disabled";
-
-			timer@5 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <5>;
-				status = "disabled";
-			};
-		};
-
-		timers7: timers@40001400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40001400 0x400>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM7)>;
-			clock-names = "int";
-			status = "disabled";
-
-			timer@6 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <6>;
-				status = "disabled";
-			};
-		};
-
-		timers12: timers@40001800 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40001800 0x400>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM12)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@11 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <11>;
-				status = "disabled";
-			};
-		};
-
-		timers13: timers@40001c00 {
-			compatible = "st,stm32-timers";
-			reg = <0x40001C00 0x400>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM13)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-		};
-
-		timers14: timers@40002000 {
-			compatible = "st,stm32-timers";
-			reg = <0x40002000 0x400>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM14)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-		};
-
-		rtc: rtc@40002800 {
-			compatible = "st,stm32-rtc";
-			reg = <0x40002800 0x400>;
-			clocks = <&rcc 1 CLK_RTC>;
-			assigned-clocks = <&rcc 1 CLK_RTC>;
-			assigned-clock-parents = <&rcc 1 CLK_LSE>;
-			interrupt-parent = <&exti>;
-			interrupts = <17 1>;
-			st,syscfg = <&pwrcfg 0x00 0x100>;
-			status = "disabled";
-		};
-
-		can3: can@40003400 {
-			compatible = "st,stm32f4-bxcan";
-			reg = <0x40003400 0x200>;
-			interrupts = <104>, <105>, <106>, <107>;
-			interrupt-names = "tx", "rx0", "rx1", "sce";
-			resets = <&rcc STM32F7_APB1_RESET(CAN3)>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN3)>;
-			st,gcan = <&gcan3>;
-			status = "disabled";
-		};
-
-		gcan3: gcan@40003600 {
-			compatible = "st,stm32f4-gcan", "syscon";
-			reg = <0x40003600 0x200>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN3)>;
-		};
-
-		usart2: serial@40004400 {
-			compatible = "st,stm32f7-uart";
-			reg = <0x40004400 0x400>;
-			interrupts = <38>;
-			clocks = <&rcc 1 CLK_USART2>;
-			status = "disabled";
-		};
-
-		usart3: serial@40004800 {
-			compatible = "st,stm32f7-uart";
-			reg = <0x40004800 0x400>;
-			interrupts = <39>;
-			clocks = <&rcc 1 CLK_USART3>;
-			status = "disabled";
-		};
-
-		usart4: serial@40004c00 {
-			compatible = "st,stm32f7-uart";
-			reg = <0x40004c00 0x400>;
-			interrupts = <52>;
-			clocks = <&rcc 1 CLK_UART4>;
-			status = "disabled";
-		};
-
-		usart5: serial@40005000 {
-			compatible = "st,stm32f7-uart";
-			reg = <0x40005000 0x400>;
-			interrupts = <53>;
-			clocks = <&rcc 1 CLK_UART5>;
-			status = "disabled";
-		};
-
-		i2c1: i2c@40005400 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x40005400 0x400>;
-			interrupts = <31>,
-				     <32>;
-			resets = <&rcc STM32F7_APB1_RESET(I2C1)>;
-			clocks = <&rcc 1 CLK_I2C1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		i2c2: i2c@40005800 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x40005800 0x400>;
-			interrupts = <33>,
-				     <34>;
-			resets = <&rcc STM32F7_APB1_RESET(I2C2)>;
-			clocks = <&rcc 1 CLK_I2C2>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		i2c3: i2c@40005c00 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x40005c00 0x400>;
-			interrupts = <72>,
-				     <73>;
-			resets = <&rcc STM32F7_APB1_RESET(I2C3)>;
-			clocks = <&rcc 1 CLK_I2C3>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		i2c4: i2c@40006000 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x40006000 0x400>;
-			interrupts = <95>,
-				     <96>;
-			resets = <&rcc STM32F7_APB1_RESET(I2C4)>;
-			clocks = <&rcc 1 CLK_I2C4>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		can1: can@40006400 {
-			compatible = "st,stm32f4-bxcan";
-			reg = <0x40006400 0x200>;
-			interrupts = <19>, <20>, <21>, <22>;
-			interrupt-names = "tx", "rx0", "rx1", "sce";
-			resets = <&rcc STM32F7_APB1_RESET(CAN1)>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN1)>;
-			st,can-primary;
-			st,gcan = <&gcan1>;
-			status = "disabled";
-		};
-
-		gcan1: gcan@40006600 {
-			compatible = "st,stm32f4-gcan", "syscon";
-			reg = <0x40006600 0x200>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN1)>;
-		};
-
-		can2: can@40006800 {
-			compatible = "st,stm32f4-bxcan";
-			reg = <0x40006800 0x200>;
-			interrupts = <63>, <64>, <65>, <66>;
-			interrupt-names = "tx", "rx0", "rx1", "sce";
-			resets = <&rcc STM32F7_APB1_RESET(CAN2)>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN2)>;
-			st,can-secondary;
-			st,gcan = <&gcan1>;
-			status = "disabled";
-		};
-
-		cec: cec@40006c00 {
-			compatible = "st,stm32-cec";
-			reg = <0x40006C00 0x400>;
-			interrupts = <94>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CEC)>, <&rcc 1 CLK_HDMI_CEC>;
-			clock-names = "cec", "hdmi-cec";
-			status = "disabled";
-		};
-
-		usart7: serial@40007800 {
-			compatible = "st,stm32f7-uart";
-			reg = <0x40007800 0x400>;
-			interrupts = <82>;
-			clocks = <&rcc 1 CLK_UART7>;
-			status = "disabled";
-		};
-
-		usart8: serial@40007c00 {
-			compatible = "st,stm32f7-uart";
-			reg = <0x40007c00 0x400>;
-			interrupts = <83>;
-			clocks = <&rcc 1 CLK_UART8>;
-			status = "disabled";
-		};
-
-		timers1: timers@40010000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40010000 0x400>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM1)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@0 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <0>;
-				status = "disabled";
-			};
-		};
-
-		timers8: timers@40010400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40010400 0x400>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM8)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@7 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <7>;
-				status = "disabled";
-			};
-		};
-
-		usart1: serial@40011000 {
-			compatible = "st,stm32f7-uart";
-			reg = <0x40011000 0x400>;
-			interrupts = <37>;
-			clocks = <&rcc 1 CLK_USART1>;
-			status = "disabled";
-		};
-
-		usart6: serial@40011400 {
-			compatible = "st,stm32f7-uart";
-			reg = <0x40011400 0x400>;
-			interrupts = <71>;
-			clocks = <&rcc 1 CLK_USART6>;
-			status = "disabled";
-		};
-
-		sdio2: mmc@40011c00 {
-			compatible = "arm,pl180", "arm,primecell";
-			arm,primecell-periphid = <0x00880180>;
-			reg = <0x40011c00 0x400>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(SDMMC2)>;
-			clock-names = "apb_pclk";
-			interrupts = <103>;
-			max-frequency = <48000000>;
-			status = "disabled";
-		};
-
-		sdio1: mmc@40012c00 {
-			compatible = "arm,pl180", "arm,primecell";
-			arm,primecell-periphid = <0x00880180>;
-			reg = <0x40012c00 0x400>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(SDMMC1)>;
-			clock-names = "apb_pclk";
-			interrupts = <49>;
-			max-frequency = <48000000>;
-			status = "disabled";
-		};
-
-		syscfg: syscon@40013800 {
-			compatible = "st,stm32-syscfg", "syscon";
-			reg = <0x40013800 0x400>;
-		};
-
-		exti: interrupt-controller@40013c00 {
-			compatible = "st,stm32-exti";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			reg = <0x40013C00 0x400>;
-			interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
-		};
-
-		timers9: timers@40014000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40014000 0x400>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM9)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@8 {
-				compatible = "st,stm32-timer-trigger";
-				reg = <8>;
-				status = "disabled";
-			};
-		};
-
-		timers10: timers@40014400 {
-			compatible = "st,stm32-timers";
-			reg = <0x40014400 0x400>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM10)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-		};
-
-		timers11: timers@40014800 {
-			compatible = "st,stm32-timers";
-			reg = <0x40014800 0x400>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM11)>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-		};
-
-		ltdc: display-controller@40016800 {
-			compatible = "st,stm32-ltdc";
-			reg = <0x40016800 0x200>;
-			interrupts = <88>, <89>;
-			resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
-			clocks = <&rcc 1 CLK_LCD>;
-			clock-names = "lcd";
-			status = "disabled";
-		};
-
-		pwrcfg: power-config@40007000 {
-			compatible = "st,stm32-power-config", "syscon";
-			reg = <0x40007000 0x400>;
-		};
-
-		crc: crc@40023000 {
-			compatible = "st,stm32f7-crc";
-			reg = <0x40023000 0x400>;
-			clocks = <&rcc 0 STM32F7_AHB1_CLOCK(CRC)>;
-			status = "disabled";
-		};
-
-		rcc: rcc@40023800 {
-			#reset-cells = <1>;
-			#clock-cells = <2>;
-			compatible = "st,stm32f746-rcc", "st,stm32-rcc";
-			reg = <0x40023800 0x400>;
-			clocks = <&clk_hse>, <&clk_i2s_ckin>;
-			st,syscfg = <&pwrcfg>;
-			assigned-clocks = <&rcc 1 CLK_HSE_RTC>;
-			assigned-clock-rates = <1000000>;
-		};
-
-		dma1: dma-controller@40026000 {
-			compatible = "st,stm32-dma";
-			reg = <0x40026000 0x400>;
-			interrupts = <11>,
-				     <12>,
-				     <13>,
-				     <14>,
-				     <15>,
-				     <16>,
-				     <17>,
-				     <47>;
-			clocks = <&rcc 0 STM32F7_AHB1_CLOCK(DMA1)>;
-			#dma-cells = <4>;
-			status = "disabled";
-		};
-
-		dma2: dma-controller@40026400 {
-			compatible = "st,stm32-dma";
-			reg = <0x40026400 0x400>;
-			interrupts = <56>,
-				     <57>,
-				     <58>,
-				     <59>,
-				     <60>,
-				     <68>,
-				     <69>,
-				     <70>;
-			clocks = <&rcc 0 STM32F7_AHB1_CLOCK(DMA2)>;
-			#dma-cells = <4>;
-			st,mem2mem;
-			status = "disabled";
-		};
-
-		usbotg_hs: usb@40040000 {
-			compatible = "st,stm32f7-hsotg";
-			reg = <0x40040000 0x40000>;
-			interrupts = <77>;
-			clocks = <&rcc 0 STM32F7_AHB1_CLOCK(OTGHS)>;
-			clock-names = "otg";
-			g-rx-fifo-size = <256>;
-			g-np-tx-fifo-size = <32>;
-			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
-			status = "disabled";
-		};
-
-		usbotg_fs: usb@50000000 {
-			compatible = "st,stm32f4x9-fsotg";
-			reg = <0x50000000 0x40000>;
-			interrupts = <67>;
-			clocks = <&rcc 0 STM32F7_AHB2_CLOCK(OTGFS)>;
-			clock-names = "otg";
-			status = "disabled";
-		};
-	};
-};
-
-&systick {
-	clocks = <&rcc 1 0>;
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index 7c99a6e61b6..8413264a73c 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -23,57 +23,13 @@
 		spi0 = &qspi;
 	};
 
-	panel: panel {
-		compatible = "orisetech,otm8009a";
-		reset-gpios = <&gpioj 15 1>;
-		status = "okay";
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-	};
-
-	soc {
-		dsi: dsi@40016c00 {
-			compatible = "st,stm32-dsi";
-			reg = <0x40016c00 0x800>;
-			resets = <&rcc STM32F7_APB2_RESET(DSI)>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(DSI)>,
-				  <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>,
-				  <&clk_hse>;
-			clock-names = "pclk", "px_clk", "ref";
-			bootph-all;
-			status = "okay";
-
-			ports {
-				port@0 {
-					dsi_out: endpoint {
-						remote-endpoint = <&panel_in>;
-					};
-				};
-				port@1 {
-					dsi_in: endpoint {
-						remote-endpoint = <&dp_out>;
-					};
-				};
-			};
-		};
-	};
 };
 
-&ltdc {
-	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
-	bootph-all;
-
-	ports {
-		port@0 {
-			dp_out: endpoint {
-				remote-endpoint = <&dsi_in>;
-			};
-		};
-	};
+&dsi {
+	clocks = <&rcc 0 STM32F7_APB2_CLOCK(DSI)>,
+		 <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>,
+		 <&clk_hse>;
+	clock-names = "pclk", "px_clk", "ref";
 };
 
 &fmc {
@@ -100,6 +56,12 @@
 	};
 };
 
+&ltdc {
+	bootph-all;
+
+	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
+};
+
 &pinctrl {
 	ethernet_mii: mii@0 {
 		pins {
diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
deleted file mode 100644
index d63cd2ba7eb..00000000000
--- a/arch/arm/dts/stm32f769-disco.dts
+++ /dev/null
@@ -1,133 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR X11
-/*
- * Copyright 2017 - Vikas MANOCHA <vikas.manocha@st.com>
- *
- */
-
-/dts-v1/;
-#include "stm32f746.dtsi"
-#include "stm32f769-pinctrl.dtsi"
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/gpio/gpio.h>
-
-/ {
-	model = "STMicroelectronics STM32F769-DISCO board";
-	compatible = "st,stm32f769-disco", "st,stm32f769";
-
-	chosen {
-		bootargs = "root=/dev/ram";
-		stdout-path = "serial0:115200n8";
-	};
-
-	memory@c0000000 {
-		device_type = "memory";
-		reg = <0xC0000000 0x1000000>;
-	};
-
-	aliases {
-		serial0 = &usart1;
-	};
-
-	leds {
-		compatible = "gpio-leds";
-		led-green {
-			gpios = <&gpioj 5 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
-		};
-		led-red {
-			gpios = <&gpioj 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		autorepeat;
-		button-0 {
-			label = "User";
-			linux,code = <KEY_HOME>;
-			gpios = <&gpioa 0 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-	usbotg_hs_phy: usb-phy {
-		#phy-cells = <0>;
-		compatible = "usb-nop-xceiv";
-		clocks = <&rcc 0 STM32F7_AHB1_CLOCK(OTGHSULPI)>;
-		clock-names = "main_clk";
-	};
-
-	mmc_vcard: mmc_vcard {
-		compatible = "regulator-fixed";
-		regulator-name = "mmc_vcard";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-};
-
-&rcc {
-	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
-};
-
-&cec {
-	pinctrl-0 = <&cec_pins_a>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&clk_hse {
-	clock-frequency = <25000000>;
-};
-
-&i2c1 {
-	pinctrl-0 = <&i2c1_pins_b>;
-	pinctrl-names = "default";
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-};
-
-&ltdc {
-	status = "okay";
-};
-
-&rtc {
-	status = "okay";
-};
-
-&sdio2 {
-	status = "okay";
-	vmmc-supply = <&mmc_vcard>;
-	cd-gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
-	broken-cd;
-	pinctrl-names = "default", "opendrain";
-	pinctrl-0 = <&sdio_pins_b>;
-	pinctrl-1 = <&sdio_pins_od_b>;
-	bus-width = <4>;
-};
-
-&timers5 {
-	/* Override timer5 to act as clockevent */
-	compatible = "st,stm32-timer";
-	interrupts = <50>;
-	status = "okay";
-	/delete-property/#address-cells;
-	/delete-property/#size-cells;
-	/delete-property/clock-names;
-	/delete-node/pwm;
-	/delete-node/timer@4;
-};
-
-&usart1 {
-	pinctrl-0 = <&usart1_pins_a>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&usbotg_hs {
-	dr_mode = "otg";
-	phys = <&usbotg_hs_phy>;
-	phy-names = "usb2-phy";
-	pinctrl-0 = <&usbotg_hs_pins_a>;
-	pinctrl-names = "default";
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32f769-pinctrl.dtsi b/arch/arm/dts/stm32f769-pinctrl.dtsi
deleted file mode 100644
index 31005dd9929..00000000000
--- a/arch/arm/dts/stm32f769-pinctrl.dtsi
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
- * Author: Alexandre Torgue  <alexandre.torgue@st.com> for STMicroelectronics.
- */
-
-#include "stm32f7-pinctrl.dtsi"
-
-&pinctrl{
-	compatible = "st,stm32f769-pinctrl";
-};
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 0824ee320d0..031fb9a934c 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -32,6 +32,7 @@ config STM32F7
 	select STM32_TIMER
 	select SUPPORT_SPL
 	select TIMER
+	imply OF_UPSTREAM
 	imply SPL_OS_BOOT
 
 config STM32H7
diff --git a/configs/stm32746g-eval_defconfig b/configs/stm32746g-eval_defconfig
index bd3a48b20a2..c95cb60b0fb 100644
--- a/configs/stm32746g-eval_defconfig
+++ b/configs/stm32746g-eval_defconfig
@@ -6,7 +6,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20050000
 CONFIG_ENV_SIZE=0x2000
-CONFIG_DEFAULT_DEVICE_TREE="stm32746g-eval"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32746g-eval"
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SYS_MONITOR_LEN=524288
 CONFIG_SYS_LOAD_ADDR=0x8008000
@@ -20,6 +20,7 @@ CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 CONFIG_SYS_PBSIZE=1050
+CONFIG_DEFAULT_FDT_FILE="stm32746g-eval"
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_GPT=y
diff --git a/configs/stm32746g-eval_spl_defconfig b/configs/stm32746g-eval_spl_defconfig
index d47d059d23b..8a0b1e21fb5 100644
--- a/configs/stm32746g-eval_spl_defconfig
+++ b/configs/stm32746g-eval_spl_defconfig
@@ -9,7 +9,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20050000
 CONFIG_ENV_SIZE=0x2000
-CONFIG_DEFAULT_DEVICE_TREE="stm32746g-eval"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32746g-eval"
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SYS_MONITOR_LEN=524288
 CONFIG_SPL_SERIAL=y
@@ -28,6 +28,7 @@ CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
 CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+CONFIG_DEFAULT_FDT_FILE="stm32746g-eval"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SPL_PAD_TO=0x9000
diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index f6fbf83f68f..2d18d777a00 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -6,7 +6,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20050000
 CONFIG_ENV_SIZE=0x2000
-CONFIG_DEFAULT_DEVICE_TREE="stm32f746-disco"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32f746-disco"
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SYS_MONITOR_LEN=524288
 CONFIG_SYS_LOAD_ADDR=0x8008000
@@ -19,6 +19,7 @@ CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
 CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+CONFIG_DEFAULT_FDT_FILE="stm32f746-disco"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SYS_PROMPT="U-Boot > "
diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
index dcf077dbfee..8a8f506959b 100644
--- a/configs/stm32f746-disco_spl_defconfig
+++ b/configs/stm32f746-disco_spl_defconfig
@@ -9,7 +9,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20050000
 CONFIG_ENV_SIZE=0x2000
-CONFIG_DEFAULT_DEVICE_TREE="stm32f746-disco"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32f746-disco"
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SYS_MONITOR_LEN=524288
 CONFIG_SPL_SERIAL=y
@@ -28,6 +28,7 @@ CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
 CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+CONFIG_DEFAULT_FDT_FILE="stm32f746-disco"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SPL_PAD_TO=0x9000
diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index 9edda0e36b2..0f145f2c8f4 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -6,7 +6,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20050000
 CONFIG_ENV_SIZE=0x2000
-CONFIG_DEFAULT_DEVICE_TREE="stm32f769-disco"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32f769-disco"
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SYS_MONITOR_LEN=524288
 CONFIG_SYS_LOAD_ADDR=0x8008000
@@ -19,6 +19,7 @@ CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
 CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttySTM0,115200n8 earlyprintk consoleblank=0 ignore_loglevel"
+CONFIG_DEFAULT_FDT_FILE="stm32f769-disco"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_CYCLIC_MAX_CPU_TIME_US=8000
@@ -52,6 +53,7 @@ CONFIG_DW_ALTDESCRIPTOR=y
 CONFIG_MII=y
 # CONFIG_PINCTRL_FULL is not set
 CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
index 7d4bda44068..6a3cdd4a0e4 100644
--- a/configs/stm32f769-disco_spl_defconfig
+++ b/configs/stm32f769-disco_spl_defconfig
@@ -9,7 +9,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20050000
 CONFIG_ENV_SIZE=0x2000
-CONFIG_DEFAULT_DEVICE_TREE="stm32f769-disco"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32f769-disco"
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SYS_MONITOR_LEN=524288
 CONFIG_SPL_SERIAL=y
@@ -28,6 +28,7 @@ CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
 CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+CONFIG_DEFAULT_FDT_FILE="stm32f769-disco"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_CYCLIC_MAX_CPU_TIME_US=8000
@@ -75,6 +76,7 @@ CONFIG_MII=y
 # CONFIG_PINCTRL_FULL is not set
 CONFIG_SPL_PINCTRL=y
 CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_SPL_RAM=y
 CONFIG_SPECIFY_CONSOLE_INDEX=y
 CONFIG_SPI=y
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 00ec9efba57..e6f8dee668d 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -30,7 +30,7 @@
 #include <config_distro_bootcmd.h>
 #define CFG_EXTRA_ENV_SETTINGS				\
 			"kernel_addr_r=0xC0008000\0"		\
-			"fdtfile="CONFIG_DEFAULT_DEVICE_TREE".dtb\0"	\
+			"fdtfile="CONFIG_DEFAULT_FDT_FILE".dtb\0"	\
 			"fdt_addr_r=0xC0408000\0"		\
 			"scriptaddr=0xC0418000\0"		\
 			"pxefile_addr_r=0xC0428000\0" \
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
