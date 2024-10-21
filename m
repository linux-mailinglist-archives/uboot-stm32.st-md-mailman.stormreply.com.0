Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5F9A8FEF
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2024 21:35:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 532BCC78012;
	Mon, 21 Oct 2024 19:35:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C40CEC6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 19:35:35 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D629B88CC5;
 Mon, 21 Oct 2024 21:35:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729539335;
 bh=NRZ6BC0Lokl1PaYMy8LmoxIks9TsqfXB/sqWF7+kLgs=;
 h=From:To:Cc:Subject:Date:From;
 b=x8REX4CgJJ8XpH+f8nyPl4Pk012mPNEczYj9Mo75gzOv7oEJZ5PaIHvsfaKVLWACf
 ghM8ZaV4PfyH9F5IPcULZYglfqOtWnWANbgXjqL3yaUxVtQ/q89UMK1h5X6TrbTKBl
 HnhdhT72T8zv1zjs6opTLBtKfkCm/QTBB5MOYDRjE0NN5f6QmKfO0BChXNqOCcrHjn
 8JFempnn/mLmN1Nr07ULo+M8BC01FBDVDAsm2dXAYjmDyD5VrvLN4cU4h6riQk6r3M
 S6HGbrjhrZDM9Ff6bCtZ+0Y1pDZ6XwrVLs9vya6ahNJs5qByAiDPsNywlluBkfA3bw
 axf6gts6qR+sw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 21 Oct 2024 21:34:57 +0200
Message-ID: <20241021193522.195834-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Drop remnants of upstream DT
	switch on DH STM32 DHSOM
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

Remove unused local DT copies after the OF_UPSTREAM conversion.

Fixes: cccb29fc1270 ("ARM: dts: stm32: Switch to using upstream DT on DH STM32 DHSOM")
Reported-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13xx-dhcor-som.dtsi       | 308 ------------------
 .../arm/dts/stm32mp153c-dhcor-drc-compact.dts |  30 --
 arch/arm/dts/stm32mp157a-dhcor-avenger96.dts  |  38 ---
 3 files changed, 376 deletions(-)
 delete mode 100644 arch/arm/dts/stm32mp13xx-dhcor-som.dtsi
 delete mode 100644 arch/arm/dts/stm32mp153c-dhcor-drc-compact.dts
 delete mode 100644 arch/arm/dts/stm32mp157a-dhcor-avenger96.dts

diff --git a/arch/arm/dts/stm32mp13xx-dhcor-som.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-som.dtsi
deleted file mode 100644
index ddad6497775..00000000000
--- a/arch/arm/dts/stm32mp13xx-dhcor-som.dtsi
+++ /dev/null
@@ -1,308 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) 2024 Marek Vasut <marex@denx.de>
- */
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/leds/common.h>
-#include <dt-bindings/mfd/st,stpmic1.h>
-#include <dt-bindings/regulator/st,stm32mp13-regulator.h>
-#include "stm32mp13-pinctrl.dtsi"
-
-/ {
-	model = "DH electronics STM32MP13xx DHCOR SoM";
-	compatible = "dh,stm32mp131a-dhcor-som",
-		     "st,stm32mp131";
-
-	aliases {
-		mmc0 = &sdmmc2;
-		mmc1 = &sdmmc1;
-		serial0 = &uart4;
-		serial1 = &uart7;
-		rtc0 = &rv3032;
-		spi0 = &qspi;
-	};
-
-	memory@c0000000 {
-		device_type = "memory";
-		reg = <0xc0000000 0x20000000>;
-	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		optee@dd000000 {
-			reg = <0xdd000000 0x3000000>;
-			no-map;
-		};
-	};
-
-	sdio_pwrseq: sdio-pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&gpiof 12 GPIO_ACTIVE_LOW>;
-	};
-
-	vin: vin {
-		compatible = "regulator-fixed";
-		regulator-name = "vin";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-	};
-};
-
-&i2c3 {
-	i2c-scl-rising-time-ns = <96>;
-	i2c-scl-falling-time-ns = <3>;
-	clock-frequency = <400000>;
-	status = "okay";
-	/* spare dmas for other usage */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-
-	pmic: stpmic@33 {
-		compatible = "st,stpmic1";
-		reg = <0x33>;
-		interrupts-extended = <&gpioi 3 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		status = "okay";
-
-		regulators {
-			compatible = "st,stpmic1-regulators";
-
-			ldo1-supply = <&vin>;
-			ldo2-supply = <&vin>;
-			ldo3-supply = <&vin>;
-			ldo4-supply = <&vin>;
-			ldo5-supply = <&vin>;
-			ldo6-supply = <&vin>;
-			pwr_sw1-supply = <&bst_out>;
-			pwr_sw2-supply = <&bst_out>;
-
-			vddcpu: buck1 { /* VDD_CPU_1V2 */
-				regulator-name = "vddcpu";
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <1250000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd_ddr: buck2 { /* VDD_DDR_1V35 */
-				regulator-name = "vdd_ddr";
-				regulator-min-microvolt = <1350000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd: buck3 { /* VDD_3V3_1V8 */
-				regulator-name = "vdd";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vddcore: buck4 { /* VDD_CORE_1V2 */
-				regulator-name = "vddcore";
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <1250000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd_adc: ldo1 { /* VDD_ADC_1V8 */
-				regulator-name = "vdd_adc";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				interrupts = <IT_CURLIM_LDO1 0>;
-			};
-
-			vdd_ldo2: ldo2 { /* LDO2_OUT_1V8 */
-				regulator-name = "vdd_ldo2";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				interrupts = <IT_CURLIM_LDO2 0>;
-			};
-
-			vdd_ldo3: ldo3 { /* LDO3_OUT */
-				regulator-name = "vdd_ldo3";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				interrupts = <IT_CURLIM_LDO3 0>;
-			};
-
-			vdd_usb: ldo4 { /* VDD_USB_3V3 */
-				regulator-name = "vdd_usb";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				interrupts = <IT_CURLIM_LDO4 0>;
-			};
-
-			vdd_sd: ldo5 { /* VDD_SD_3V3_1V8 */
-				regulator-name = "vdd_sd";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				interrupts = <IT_CURLIM_LDO5 0>;
-			};
-
-			vdd_sd2: ldo6 { /* VDD_SD2_3V3_1V8 */
-				regulator-name = "vdd_sd2";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				interrupts = <IT_CURLIM_LDO6 0>;
-			};
-
-			vref_ddr: vref_ddr { /* VREF_DDR_0V675 */
-				regulator-name = "vref_ddr";
-				regulator-always-on;
-			};
-
-			bst_out: boost { /* BST_OUT_5V2 */
-				regulator-name = "bst_out";
-			};
-
-			vbus_otg: pwr_sw1 {
-				regulator-name = "vbus_otg";
-				interrupts = <IT_OCP_OTG 0>;
-			};
-
-			vbus_sw: pwr_sw2 {
-				regulator-name = "vbus_sw";
-				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge = <1>;
-			};
-		};
-
-		onkey {
-			compatible = "st,stpmic1-onkey";
-			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
-			interrupt-names = "onkey-falling", "onkey-rising";
-			status = "okay";
-		};
-
-		watchdog {
-			compatible = "st,stpmic1-wdt";
-			status = "disabled";
-		};
-	};
-
-	eeprom0: eeprom@50 {
-		compatible = "atmel,24c256";	/* ST M24256 */
-		reg = <0x50>;
-		pagesize = <64>;
-	};
-
-	rv3032: rtc@51 {
-		compatible = "microcrystal,rv3032";
-		reg = <0x51>;
-		interrupts-extended = <&gpioi 0 IRQ_TYPE_EDGE_FALLING>;
-	};
-};
-
-&iwdg2 {
-	timeout-sec = <32>;
-	status = "okay";
-};
-
-&qspi {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a
-		     &qspi_bk1_pins_a
-		     &qspi_cs1_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a
-		     &qspi_bk1_sleep_pins_a
-		     &qspi_cs1_sleep_pins_a>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	status = "okay";
-
-	flash0: flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-rx-bus-width = <4>;
-		spi-max-frequency = <108000000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-};
-
-/* Console UART */
-&uart4 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart4_pins_b>;
-	pinctrl-1 = <&uart4_sleep_pins_b>;
-	pinctrl-2 = <&uart4_idle_pins_b>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-/* Bluetooth */
-&uart7 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart7_pins_a>;
-	pinctrl-1 = <&uart7_sleep_pins_a>;
-	pinctrl-2 = <&uart7_idle_pins_a>;
-	uart-has-rtscts;
-	status = "okay";
-
-	bluetooth {
-		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
-		max-speed = <3000000>;
-		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
-		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
-	};
-};
-
-/* SDIO WiFi */
-&sdmmc1 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_clk_pins_a>;
-	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
-	bus-width = <4>;
-	cap-power-off-card;
-	keep-power-in-suspend;
-	non-removable;
-	st,neg-edge;
-	vmmc-supply = <&vdd>;
-	mmc-pwrseq = <&sdio_pwrseq>;
-	status = "okay";
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	brcmf: bcrmf@1 {	/* muRata 1YN */
-		reg = <1>;
-		compatible = "infineon,cyw43439-fmac", "brcm,bcm4329-fmac";
-		interrupt-parent = <&gpioe>;
-		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-names = "host-wake";
-	};
-};
-
-/* eMMC */
-&sdmmc2 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a &sdmmc2_clk_pins_a>;
-	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a &sdmmc2_clk_pins_a>;
-	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
-	bus-width = <8>;
-	mmc-ddr-3_3v;
-	no-sd;
-	no-sdio;
-	non-removable;
-	st,neg-edge;
-	vmmc-supply = <&vdd>;
-	vqmmc-supply = <&vdd>;
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32mp153c-dhcor-drc-compact.dts b/arch/arm/dts/stm32mp153c-dhcor-drc-compact.dts
deleted file mode 100644
index c8b9818499e..00000000000
--- a/arch/arm/dts/stm32mp153c-dhcor-drc-compact.dts
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-/*
- * Copyright (C) 2022 Marek Vasut <marex@denx.de>
- *
- * DHCOR STM32MP1 variant:
- * DHCR-STM32MP153C-C065-R051-V33-SPI-I-01LG
- * DHCOR PCB number: 586-100 or newer
- * DRC Compact PCB number: 627-100 or newer
- */
-
-/dts-v1/;
-
-#include "stm32mp153.dtsi"
-#include "stm32mp15xc.dtsi"
-#include "stm32mp15xx-dhcor-som.dtsi"
-#include "stm32mp15xx-dhcor-drc-compact.dtsi"
-
-/ {
-	model = "DH electronics STM32MP153C DHCOR DRC Compact";
-	compatible = "dh,stm32mp153c-dhcor-drc-compact",
-		     "dh,stm32mp153c-dhcor-som",
-		     "st,stm32mp153";
-};
-
-&m_can1 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&m_can1_pins_c>;
-	pinctrl-1 = <&m_can1_sleep_pins_c>;
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32mp157a-dhcor-avenger96.dts b/arch/arm/dts/stm32mp157a-dhcor-avenger96.dts
deleted file mode 100644
index 2e3c9fbb4eb..00000000000
--- a/arch/arm/dts/stm32mp157a-dhcor-avenger96.dts
+++ /dev/null
@@ -1,38 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-/*
- * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
- * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- * Copyright (C) 2020 Marek Vasut <marex@denx.de>
- *
- * DHCOR STM32MP1 variant:
- * DHCR-STM32MP157A-C065-R102-V18-SPI-C-01LG
- * DHCOR PCB number: 586-100 or newer
- * Avenger96 PCB number: 588-200 or newer
- */
-
-/dts-v1/;
-
-#include "stm32mp157.dtsi"
-#include "stm32mp15xc.dtsi"
-#include "stm32mp15xx-dhcor-som.dtsi"
-#include "stm32mp15xx-dhcor-avenger96.dtsi"
-
-/ {
-	model = "Arrow Electronics STM32MP157A Avenger96 board";
-	compatible = "arrow,stm32mp157a-avenger96", "dh,stm32mp157a-dhcor-som",
-		     "st,stm32mp157";
-};
-
-&m_can1 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&m_can1_pins_b>;
-	pinctrl-1 = <&m_can1_sleep_pins_b>;
-	status = "disabled";
-};
-
-&m_can2 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&m_can2_pins_a>;
-	pinctrl-1 = <&m_can2_sleep_pins_a>;
-	status = "disabled";
-};
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
