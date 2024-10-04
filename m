Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315F991296
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Oct 2024 00:59:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27B3DC7802F;
	Fri,  4 Oct 2024 22:59:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5474AC7802C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 22:59:40 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D95FE88AFF;
 Sat,  5 Oct 2024 00:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728082780;
 bh=u44+On0Wjsb09E30D1ohoofMlW64pSikwxY8mwDLBCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tmzkUlTc7dQxpny6hQ9zCLdRlQY0wxXKs8DOeERkOzhxWk7jfrX47rKuUsUZoGg15
 +NIkhrIMeG9LutPu1upQ/EgaDxQgBG6jh46y/Gejv676lvIFVc16chGjR5jhpCskWh
 P7LyNzRJ5nt6ww33LcpUiDT5DwDW9UoGz+Kr1L8xwNwPp88cKI7oBloUvTeNUPrilY
 pkKRltysgh6tE48pZZUiR/TlwWWMsmjH65vSEHHJBT5J9VKMaVmQ0kqxWAMaGcdDkO
 31/ZRNjwt+g5cgtDPRIu/g/OJzV+gcBxoaiyaFZj4a4dLw6toaI7VqXz8xnWif/g/O
 jFZf/BKh3OoFQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  5 Oct 2024 00:57:53 +0200
Message-ID: <20241004225916.361000-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004225916.361000-1-marex@denx.de>
References: <20241004225916.361000-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/3] ARM: dts: stm32: Switch to using upstream
	DT on DH STM32 DHSOM
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

Enable OF_UPSTREAM to use upstream DT and add st/ prefix to the
DEFAULT_DEVICE_TREE. And thereby directly build DTB from dts/upstream/src/
including *-u-boot.dtsi from arch/$(ARCH)/dts/ directory.

The previous setup used generic SoC prefix like stm32mp15xx-dhco* for
generic DTs which could be used on any STM32MP15xx DHSOM variant. The
new setup uses specific SoC prefix stm32mp157c-dhco* to match Linux DT
names. Since the hardware present on STM32MP153 and STM32MP157 is not
enabled in the board configuration and not supported by U-Boot except
for the DSI host, using the existing Linux DTs poses no issue even on
plain STM32MP151A based SoMs.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 ...> stm32mp151a-dhcor-testbench-u-boot.dtsi} |   0
 ...si => stm32mp153c-dhcom-drc02-u-boot.dtsi} |   0
 ...stm32mp153c-dhcor-drc-compact-u-boot.dtsi} |   0
 ...> stm32mp157a-dhcor-avenger96-u-boot.dtsi} |   0
 ...tsi => stm32mp157c-dhcom-pdk2-u-boot.dtsi} |   0
 ... => stm32mp157c-dhcom-picoitx-u-boot.dtsi} |   0
 arch/arm/dts/stm32mp15xx-dhcom-drc02.dts      |  17 -
 arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi     | 169 ------
 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts       |  17 -
 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi      | 329 -----------
 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts    |  17 -
 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi   | 151 -----
 arch/arm/dts/stm32mp15xx-dhcom-som.dtsi       | 544 ------------------
 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts  |  20 -
 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi | 437 --------------
 .../arm/dts/stm32mp15xx-dhcor-drc-compact.dts |  18 -
 .../dts/stm32mp15xx-dhcor-drc-compact.dtsi    | 326 -----------
 arch/arm/dts/stm32mp15xx-dhcor-io1v8.dtsi     |  28 -
 arch/arm/dts/stm32mp15xx-dhcor-som.dtsi       | 221 -------
 arch/arm/dts/stm32mp15xx-dhcor-testbench.dts  | 180 ------
 .../dh_stm32mp1/u-boot-dhcom.its              |  18 +-
 .../dh_stm32mp1/u-boot-dhcor.its              |  12 +-
 configs/stm32mp15_dhcom_basic_defconfig       |   5 +-
 configs/stm32mp15_dhcor_basic_defconfig       |   5 +-
 24 files changed, 21 insertions(+), 2493 deletions(-)
 rename arch/arm/dts/{stm32mp15xx-dhcor-testbench-u-boot.dtsi => stm32mp151a-dhcor-testbench-u-boot.dtsi} (100%)
 rename arch/arm/dts/{stm32mp15xx-dhcom-drc02-u-boot.dtsi => stm32mp153c-dhcom-drc02-u-boot.dtsi} (100%)
 rename arch/arm/dts/{stm32mp15xx-dhcor-drc-compact-u-boot.dtsi => stm32mp153c-dhcor-drc-compact-u-boot.dtsi} (100%)
 rename arch/arm/dts/{stm32mp15xx-dhcor-avenger96-u-boot.dtsi => stm32mp157a-dhcor-avenger96-u-boot.dtsi} (100%)
 rename arch/arm/dts/{stm32mp15xx-dhcom-pdk2-u-boot.dtsi => stm32mp157c-dhcom-pdk2-u-boot.dtsi} (100%)
 rename arch/arm/dts/{stm32mp15xx-dhcom-picoitx-u-boot.dtsi => stm32mp157c-dhcom-picoitx-u-boot.dtsi} (100%)
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dtsi
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-io1v8.dtsi
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-som.dtsi
 delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-testbench.dts

diff --git a/arch/arm/dts/stm32mp15xx-dhcor-testbench-u-boot.dtsi b/arch/arm/dts/stm32mp151a-dhcor-testbench-u-boot.dtsi
similarity index 100%
rename from arch/arm/dts/stm32mp15xx-dhcor-testbench-u-boot.dtsi
rename to arch/arm/dts/stm32mp151a-dhcor-testbench-u-boot.dtsi
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-drc02-u-boot.dtsi b/arch/arm/dts/stm32mp153c-dhcom-drc02-u-boot.dtsi
similarity index 100%
rename from arch/arm/dts/stm32mp15xx-dhcom-drc02-u-boot.dtsi
rename to arch/arm/dts/stm32mp153c-dhcom-drc02-u-boot.dtsi
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-drc-compact-u-boot.dtsi b/arch/arm/dts/stm32mp153c-dhcor-drc-compact-u-boot.dtsi
similarity index 100%
rename from arch/arm/dts/stm32mp15xx-dhcor-drc-compact-u-boot.dtsi
rename to arch/arm/dts/stm32mp153c-dhcor-drc-compact-u-boot.dtsi
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-avenger96-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dhcor-avenger96-u-boot.dtsi
similarity index 100%
rename from arch/arm/dts/stm32mp15xx-dhcor-avenger96-u-boot.dtsi
rename to arch/arm/dts/stm32mp157a-dhcor-avenger96-u-boot.dtsi
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-pdk2-u-boot.dtsi b/arch/arm/dts/stm32mp157c-dhcom-pdk2-u-boot.dtsi
similarity index 100%
rename from arch/arm/dts/stm32mp15xx-dhcom-pdk2-u-boot.dtsi
rename to arch/arm/dts/stm32mp157c-dhcom-pdk2-u-boot.dtsi
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-picoitx-u-boot.dtsi b/arch/arm/dts/stm32mp157c-dhcom-picoitx-u-boot.dtsi
similarity index 100%
rename from arch/arm/dts/stm32mp15xx-dhcom-picoitx-u-boot.dtsi
rename to arch/arm/dts/stm32mp157c-dhcom-picoitx-u-boot.dtsi
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts b/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
deleted file mode 100644
index 90625bf6b60..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-/*
- * Copyright (C) 2020 Marek Vasut <marex@denx.de>
- */
-/dts-v1/;
-
-#include "stm32mp151.dtsi"
-#include "stm32mp15xc.dtsi"
-#include "stm32mp15xx-dhcom-som.dtsi"
-#include "stm32mp15xx-dhcom-drc02.dtsi"
-
-/ {
-	model = "DH Electronics STM32MP15xx DHCOM DRC02";
-	compatible = "dh,stm32mp15xx-dhcom-drc02",
-		     "dh,stm32mp15xx-dhcom-som",
-		     "st,stm32mp1xx";
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi
deleted file mode 100644
index 35b1034aa3c..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi
+++ /dev/null
@@ -1,169 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-/*
- * Copyright (C) 2020 Marek Vasut <marex@denx.de>
- */
-
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/pwm/pwm.h>
-
-/ {
-	aliases {
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart8;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
-
-&adc {
-	status = "disabled";
-};
-
-&dac {
-	status = "disabled";
-};
-
-&gpiob {
-	/*
-	 * NOTE: On DRC02, the RS485_RX_En is controlled by a separate
-	 * GPIO line, however the STM32 UART driver assumes RX happens
-	 * during TX anyway and that it only controls drive enable DE
-	 * line. Hence, the RX is always enabled here.
-	 */
-	rs485-rx-en-hog {
-		gpio-hog;
-		gpios = <8 0>;
-		output-low;
-		line-name = "rs485-rx-en";
-	};
-};
-
-&gpiod {
-	gpio-line-names = "", "", "", "",
-			  "", "", "DHCOM-B", "",
-			  "", "", "", "DRC02-Out1",
-			  "DRC02-Out2", "", "", "";
-};
-
-&gpioi {
-	gpio-line-names = "DRC02-In1", "DHCOM-O", "DHCOM-H", "DHCOM-I",
-			  "DHCOM-R", "DHCOM-M", "", "",
-			  "DRC02-In2", "", "", "",
-			  "", "", "", "";
-
-	/*
-	 * NOTE: The USB Hub on the DRC02 needs a reset signal to be
-	 * pulled high in order to be detected by the USB Controller.
-	 * This signal should be handled by USB power sequencing in
-	 * order to reset the Hub when USB bus is powered down, but
-	 * so far there is no such functionality.
-	 */
-	usb-hub-hog {
-		gpio-hog;
-		gpios = <2 0>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
-};
-
-&i2c2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-
-	eeprom@50 {
-		compatible = "atmel,24c04";
-		reg = <0x50>;
-		pagesize = <16>;
-	};
-};
-
-&i2c4 {
-	touchscreen@49 {
-		status = "disabled";
-	};
-};
-
-&i2c5 {	/* TP7/TP8 */
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c5_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-};
-
-&sdmmc3 {
-	/*
-	 * On DRC02, the SoM does not have SDIO WiFi. The pins
-	 * are used for on-board microSD slot instead.
-	 */
-	/delete-property/broken-cd;
-	cd-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
-	disable-wp;
-};
-
-&spi1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi1_pins_a>;
-	cs-gpios = <&gpioz 3 0>;
-	/* Use PIO for the display */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "disabled";	/* Enable once there is display driver */
-	/*
-	 * Note: PF3/GPIO_A , PD6/GPIO_B , PG0/GPIO_C , PC6/GPIO_E are
-	 * also connected to the display board connector.
-	 */
-};
-
-&usart3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usart3_pins_a>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-/*
- * Note: PI3 is UART1_RTS and PI5 is UART1_CTS on DRC02 (uart4 of STM32MP1),
- *       however the STM32MP1 pinmux cannot map them to UART4 .
- */
-
-&uart8 {	/* RS485 */
-	linux,rs485-enabled-at-boot-time;
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart8_pins_a>;
-	rts-gpios = <&gpioe 6 GPIO_ACTIVE_HIGH>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&usbh_ehci {
-	phys = <&usbphyc_port0>;
-	status = "okay";
-};
-
-&usbphyc {
-	status = "okay";
-};
-
-&usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
-};
-
-&usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts b/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
deleted file mode 100644
index b2e450aa13b..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-/*
- * Copyright (C) 2019 Marek Vasut <marex@denx.de>
- */
-/dts-v1/;
-
-#include "stm32mp151.dtsi"
-#include "stm32mp15xc.dtsi"
-#include "stm32mp15xx-dhcom-som.dtsi"
-#include "stm32mp15xx-dhcom-pdk2.dtsi"
-
-/ {
-	model = "STMicroelectronics STM32MP15xx DHCOM Premium Developer Kit (2)";
-	compatible = "dh,stm32mp15xx-dhcom-pdk2",
-		     "dh,stm32mp15xx-dhcom-som",
-		     "st,stm32mp15x";
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi
deleted file mode 100644
index 5f586f02406..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ /dev/null
@@ -1,329 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-/*
- * Copyright (C) 2019-2020 Marek Vasut <marex@denx.de>
- */
-
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/pwm/pwm.h>
-
-/ {
-	aliases {
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart8;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	clk_ext_audio_codec: clock-codec {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-	};
-
-	display_bl: display-bl {
-		compatible = "pwm-backlight";
-		pwms = <&pwm2 3 500000 PWM_POLARITY_INVERTED>;
-		brightness-levels = <0 16 22 30 40 55 75 102 138 188 255>;
-		default-brightness-level = <8>;
-		enable-gpios = <&gpioi 0 GPIO_ACTIVE_HIGH>;
-		power-supply = <&reg_panel_bl>;
-		status = "okay";
-	};
-
-	gpio-keys-polled {
-		compatible = "gpio-keys-polled";
-		poll-interval = <20>;
-
-		/*
-		 * The EXTi IRQ line 3 is shared with ethernet,
-		 * so mark this as polled GPIO key.
-		 */
-		button-0 {
-			label = "TA1-GPIO-A";
-			linux,code = <KEY_A>;
-			gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
-		};
-
-		/*
-		 * The EXTi IRQ line 6 is shared with touchscreen,
-		 * so mark this as polled GPIO key.
-		 */
-		button-1 {
-			label = "TA2-GPIO-B";
-			linux,code = <KEY_B>;
-			gpios = <&gpiod 6 GPIO_ACTIVE_LOW>;
-		};
-
-		/*
-		 * The EXTi IRQ line 0 is shared with PMIC,
-		 * so mark this as polled GPIO key.
-		 */
-		button-2 {
-			label = "TA3-GPIO-C";
-			linux,code = <KEY_C>;
-			gpios = <&gpiog 0 GPIO_ACTIVE_LOW>;
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		button-3 {
-			label = "TA4-GPIO-D";
-			linux,code = <KEY_D>;
-			gpios = <&gpiod 12 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
-	};
-
-	led {
-		compatible = "gpio-leds";
-
-		led-0 {
-			label = "green:led5";
-			gpios = <&gpioc 6 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
-			status = "disabled";
-		};
-
-		led-1 {
-			label = "green:led6";
-			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
-		};
-
-		led-2 {
-			label = "green:led7";
-			gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
-		};
-
-		led-3 {
-			label = "green:led8";
-			gpios = <&gpioi 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
-		};
-	};
-
-	panel {
-		compatible = "edt,etm0700g0edh6";
-		backlight = <&display_bl>;
-		power-supply = <&reg_panel_bl>;
-
-		port {
-			lcd_panel_in: endpoint {
-				remote-endpoint = <&lcd_display_out>;
-			};
-		};
-	};
-
-	reg_panel_bl: regulator-panel-bl {
-		compatible = "regulator-fixed";
-		regulator-name = "panel_backlight";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&reg_panel_supply>;
-	};
-
-	reg_panel_supply: regulator-panel-supply {
-		compatible = "regulator-fixed";
-		regulator-name = "panel_supply";
-		regulator-min-microvolt = <24000000>;
-		regulator-max-microvolt = <24000000>;
-	};
-
-	sound {
-		compatible = "audio-graph-card";
-		routing =
-			"MIC_IN", "Capture",
-			"Capture", "Mic Bias",
-			"Playback", "HP_OUT";
-		dais = <&sai2a_port &sai2b_port>;
-		status = "okay";
-	};
-};
-
-&cec {
-	pinctrl-names = "default";
-	pinctrl-0 = <&cec_pins_a>;
-	status = "okay";
-};
-
-&i2c2 {	/* Header X22 */
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&i2c5 {	/* Header X21 */
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c5_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-
-	sgtl5000: codec@a {
-		compatible = "fsl,sgtl5000";
-		reg = <0x0a>;
-		#sound-dai-cells = <0>;
-		clocks = <&clk_ext_audio_codec>;
-		VDDA-supply = <&v3v3>;
-		VDDIO-supply = <&vdd>;
-
-		sgtl5000_port: port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			sgtl5000_tx_endpoint: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&sai2a_endpoint>;
-				frame-master = <&sgtl5000_tx_endpoint>;
-				bitclock-master = <&sgtl5000_tx_endpoint>;
-			};
-
-			sgtl5000_rx_endpoint: endpoint@1 {
-				reg = <1>;
-				remote-endpoint = <&sai2b_endpoint>;
-				frame-master = <&sgtl5000_rx_endpoint>;
-				bitclock-master = <&sgtl5000_rx_endpoint>;
-			};
-		};
-
-	};
-
-	touchscreen@38 {
-		compatible = "edt,edt-ft5406";
-		reg = <0x38>;
-		interrupt-parent = <&gpioc>;
-		interrupts = <6 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
-	};
-};
-
-&ltdc {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&ltdc_pins_b>;
-	pinctrl-1 = <&ltdc_sleep_pins_b>;
-	status = "okay";
-
-	port {
-		lcd_display_out: endpoint {
-			remote-endpoint = <&lcd_panel_in>;
-		};
-	};
-};
-
-&sai2 {
-	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
-	clock-names = "pclk", "x8k", "x11k";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sai2a_pins_b &sai2b_pins_b>;
-	pinctrl-1 = <&sai2a_sleep_pins_b &sai2b_sleep_pins_b>;
-	status = "okay";
-
-	sai2a: audio-controller@4400b004 {
-		#clock-cells = <0>;
-		dma-names = "tx";
-		clocks = <&rcc SAI2_K>;
-		clock-names = "sai_ck";
-		status = "okay";
-
-		sai2a_port: port {
-			sai2a_endpoint: endpoint {
-				remote-endpoint = <&sgtl5000_tx_endpoint>;
-				format = "i2s";
-				mclk-fs = <512>;
-				dai-tdm-slot-num = <2>;
-				dai-tdm-slot-width = <16>;
-			};
-		};
-	};
-
-	sai2b: audio-controller@4400b024 {
-		dma-names = "rx";
-		st,sync = <&sai2a 2>;
-		clocks = <&rcc SAI2_K>, <&sai2a>;
-		clock-names = "sai_ck", "MCLK";
-		status = "okay";
-
-		sai2b_port: port {
-			sai2b_endpoint: endpoint {
-				remote-endpoint = <&sgtl5000_rx_endpoint>;
-				format = "i2s";
-				mclk-fs = <512>;
-				dai-tdm-slot-num = <2>;
-				dai-tdm-slot-width = <16>;
-			};
-		};
-	};
-};
-
-&timers2 {
-	/* spare dmas for other usage (un-delete to enable pwm capture) */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-	pwm2: pwm {
-		pinctrl-0 = <&pwm2_pins_a>;
-		pinctrl-names = "default";
-		status = "okay";
-	};
-	timer@1 {
-		status = "okay";
-	};
-};
-
-&usart3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usart3_pins_a>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&uart8 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart8_pins_a &uart8_rtscts_pins_a>;
-	uart-has-rtscts;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&usbh_ehci {
-	phys = <&usbphyc_port0>;
-	status = "okay";
-};
-
-&usbotg_hs {
-	dr_mode = "otg";
-	pinctrl-0 = <&usbotg_hs_pins_a>;
-	pinctrl-names = "default";
-	phy-names = "usb2-phy";
-	phys = <&usbphyc_port1 0>;
-	vbus-supply = <&vbus_otg>;
-	status = "okay";
-};
-
-&usbphyc {
-	status = "okay";
-};
-
-&usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
-};
-
-&usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts b/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
deleted file mode 100644
index 3e908102f61..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-/*
- * Copyright (C) 2020 Marek Vasut <marex@denx.de>
- */
-/dts-v1/;
-
-#include "stm32mp157.dtsi"
-#include "stm32mp15xc.dtsi"
-#include "stm32mp15xx-dhcom-som.dtsi"
-#include "stm32mp15xx-dhcom-picoitx.dtsi"
-
-/ {
-	model = "DH Electronics STM32MP15xx DHCOM PicoITX";
-	compatible = "dh,stm32mp15xx-dhcom-picoitx",
-		     "dh,stm32mp15xx-dhcom-som",
-		     "st,stm32mp1xx";
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi
deleted file mode 100644
index abc595350e7..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi
+++ /dev/null
@@ -1,151 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-/*
- * Copyright (C) 2020 Marek Vasut <marex@denx.de>
- */
-
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/pwm/pwm.h>
-
-/ {
-	aliases {
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart8;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	led {
-		compatible = "gpio-leds";
-
-		led-0 {
-			label = "yellow:led";
-			gpios = <&gpioi 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
-		};
-	};
-};
-
-&adc {
-	status = "disabled";
-};
-
-&dac {
-	status = "disabled";
-};
-
-&fmc {
-	status = "disabled";
-};
-
-&gpioa {
-	/*
-	 * NOTE: The USB Port on the PicoITX needs a PWR_EN signal to enable
-	 * port power. This signal should be handled by USB power sequencing
-	 * in order to turn on port power when USB bus is powered up, but so
-	 * far there is no such functionality.
-	 */
-	usb-port-power-hog {
-		gpio-hog;
-		gpios = <13 0>;
-		output-low;
-		line-name = "usb-port-power";
-	};
-};
-
-&gpioc {
-	gpio-line-names = "", "", "", "",
-			  "", "", "PicoITX-In1", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiod {
-	gpio-line-names = "", "", "", "",
-			  "", "", "DHCOM-B", "",
-			  "", "", "", "PicoITX-Out1",
-			  "PicoITX-Out2", "", "", "";
-};
-
-&gpiog {
-	gpio-line-names = "PicoITX-In2", "", "", "",
-			  "", "", "", "",
-			  "DHCOM-L", "", "", "",
-			  "", "", "", "";
-};
-
-&i2c2 {	/* On board-to-board connector (optional) */
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-};
-
-&i2c5 {	/* On board-to-board connector */
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c5_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-};
-
-&ksz8851 {
-	status = "disabled";
-};
-
-&usart3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usart3_pins_a>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&uart8 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart8_pins_a &uart8_rtscts_pins_a>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&usbh_ehci {
-	phys = <&usbphyc_port0>;
-	status = "okay";
-};
-
-&usbh_ohci {
-	phys = <&usbphyc_port0>;
-	status = "okay";
-};
-
-&usbotg_hs {
-	dr_mode = "otg";
-	pinctrl-0 = <&usbotg_hs_pins_a>;
-	pinctrl-names = "default";
-	phy-names = "usb2-phy";
-	phys = <&usbphyc_port1 0>;
-	vbus-supply = <&vbus_otg>;
-	status = "okay";
-};
-
-&usbphyc {
-	status = "okay";
-};
-
-&usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
-};
-
-&usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
deleted file mode 100644
index d3b85a8764d..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
+++ /dev/null
@@ -1,544 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) 2019-2020 Marek Vasut <marex@denx.de>
- */
-
-#include "stm32mp15-pinctrl.dtsi"
-#include "stm32mp15xxaa-pinctrl.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/mfd/st,stpmic1.h>
-
-/ {
-	aliases {
-		ethernet0 = &ethernet0;
-		ethernet1 = &ksz8851;
-		rtc0 = &hwrtc;
-		rtc1 = &rtc;
-	};
-
-	memory@c0000000 {
-		device_type = "memory";
-		reg = <0xC0000000 0x40000000>;
-	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		mcuram2: mcuram2@10000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10000000 0x40000>;
-			no-map;
-		};
-
-		vdev0vring0: vdev0vring0@10040000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10040000 0x1000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@10041000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10041000 0x1000>;
-			no-map;
-		};
-
-		vdev0buffer: vdev0buffer@10042000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10042000 0x4000>;
-			no-map;
-		};
-
-		mcuram: mcuram@30000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x30000000 0x40000>;
-			no-map;
-		};
-
-		retram: retram@38000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x38000000 0x10000>;
-			no-map;
-		};
-	};
-
-	ethernet_vio: vioregulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vio";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpiog 3 GPIO_ACTIVE_LOW>;
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&vdd>;
-	};
-};
-
-&adc {
-	vdd-supply = <&vdd>;
-	vdda-supply = <&vdda>;
-	vref-supply = <&vdda>;
-	status = "okay";
-
-	adc1: adc@0 {
-		st,min-sample-time-nsecs = <5000>;
-		st,adc-channels = <0>;
-		status = "okay";
-	};
-
-	adc2: adc@100 {
-		st,adc-channels = <1>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
-	};
-};
-
-&crc1 {
-	status = "okay";
-};
-
-&dac {
-	pinctrl-names = "default";
-	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
-	vref-supply = <&vdda>;
-	status = "okay";
-
-	dac1: dac@1 {
-		status = "okay";
-	};
-	dac2: dac@2 {
-		status = "okay";
-	};
-};
-
-&dts {
-	status = "okay";
-};
-
-&ethernet0 {
-	status = "okay";
-	pinctrl-0 = <&ethernet0_rmii_pins_c &mco2_pins_a>;
-	pinctrl-1 = <&ethernet0_rmii_sleep_pins_c &mco2_sleep_pins_a>;
-	pinctrl-names = "default", "sleep";
-	phy-mode = "rmii";
-	max-speed = <100>;
-	phy-handle = <&phy0>;
-
-	mdio0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-
-		phy0: ethernet-phy@1 {
-			reg = <1>;
-			/* LAN8710Ai */
-			compatible = "ethernet-phy-id0007.c0f0",
-				     "ethernet-phy-ieee802.3-c22";
-			clocks = <&rcc CK_MCO2>;
-			reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <500>;
-			reset-deassert-us = <500>;
-			smsc,disable-energy-detect;
-			interrupt-parent = <&gpioi>;
-			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-		};
-	};
-};
-
-&fmc {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&fmc_pins_b>;
-	pinctrl-1 = <&fmc_sleep_pins_b>;
-	status = "okay";
-
-	ksz8851: ethernet@1,0 {
-		compatible = "micrel,ks8851-mll";
-		reg = <1 0x0 0x2>, <1 0x2 0x20000>;
-		interrupt-parent = <&gpioc>;
-		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-		bank-width = <2>;
-
-		/* Timing values are in nS */
-		st,fmc2-ebi-cs-mux-enable;
-		st,fmc2-ebi-cs-transaction-type = <4>;
-		st,fmc2-ebi-cs-buswidth = <16>;
-		st,fmc2-ebi-cs-address-setup-ns = <5>;
-		st,fmc2-ebi-cs-address-hold-ns = <5>;
-		st,fmc2-ebi-cs-bus-turnaround-ns = <5>;
-		st,fmc2-ebi-cs-data-setup-ns = <45>;
-		st,fmc2-ebi-cs-data-hold-ns = <1>;
-		st,fmc2-ebi-cs-write-address-setup-ns = <5>;
-		st,fmc2-ebi-cs-write-address-hold-ns = <5>;
-		st,fmc2-ebi-cs-write-bus-turnaround-ns = <5>;
-		st,fmc2-ebi-cs-write-data-setup-ns = <45>;
-		st,fmc2-ebi-cs-write-data-hold-ns = <1>;
-	};
-};
-
-&gpioa {
-	gpio-line-names = "", "", "", "",
-			  "", "", "DHCOM-K", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiob {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "DHCOM-Q", "", "", "",
-			  "", "", "", "";
-};
-
-&gpioc {
-	gpio-line-names = "", "", "", "",
-			  "", "", "DHCOM-E", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiod {
-	gpio-line-names = "", "", "", "",
-			  "", "", "DHCOM-B", "",
-			  "", "", "", "DHCOM-F",
-			  "DHCOM-D", "", "", "";
-};
-
-&gpioe {
-	gpio-line-names = "", "", "", "",
-			  "", "", "DHCOM-P", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiof {
-	gpio-line-names = "", "", "", "DHCOM-A",
-			  "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiog {
-	gpio-line-names = "DHCOM-C", "", "", "",
-			  "", "", "", "",
-			  "DHCOM-L", "", "", "",
-			  "", "", "", "";
-};
-
-&gpioh {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "DHCOM-N",
-			  "DHCOM-J", "DHCOM-W", "DHCOM-V", "DHCOM-U",
-			  "DHCOM-T", "", "DHCOM-S", "";
-};
-
-&gpioi {
-	gpio-line-names = "DHCOM-G", "DHCOM-O", "DHCOM-H", "DHCOM-I",
-			  "DHCOM-R", "DHCOM-M", "", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&i2c4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c4_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-
-	hwrtc: rtc@32 {
-		compatible = "microcrystal,rv8803";
-		reg = <0x32>;
-	};
-
-	pmic: stpmic@33 {
-		compatible = "st,stpmic1";
-		reg = <0x33>;
-		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		status = "okay";
-
-		regulators {
-			compatible = "st,stpmic1-regulators";
-			ldo1-supply = <&v3v3>;
-			ldo2-supply = <&v3v3>;
-			ldo3-supply = <&vdd_ddr>;
-			ldo5-supply = <&v3v3>;
-			ldo6-supply = <&v3v3>;
-			pwr_sw1-supply = <&bst_out>;
-			pwr_sw2-supply = <&bst_out>;
-
-			vddcore: buck1 {
-				regulator-name = "vddcore";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd_ddr: buck2 {
-				regulator-name = "vdd_ddr";
-				regulator-min-microvolt = <1350000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd: buck3 {
-				regulator-name = "vdd";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				st,mask-reset;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			v3v3: buck4 {
-				regulator-name = "v3v3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-				regulator-initial-mode = <0>;
-			};
-
-			vdda: ldo1 {
-				regulator-name = "vdda";
-				regulator-always-on;
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
-				interrupts = <IT_CURLIM_LDO1 0>;
-			};
-
-			v2v8: ldo2 {
-				regulator-name = "v2v8";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				interrupts = <IT_CURLIM_LDO2 0>;
-			};
-
-			vtt_ddr: ldo3 {
-				regulator-name = "vtt_ddr";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <750000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-			};
-
-			vdd_usb: ldo4 {
-				regulator-name = "vdd_usb";
-				interrupts = <IT_CURLIM_LDO4 0>;
-			};
-
-			vdd_sd: ldo5 {
-				regulator-name = "vdd_sd";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
-				interrupts = <IT_CURLIM_LDO5 0>;
-				regulator-boot-on;
-			};
-
-			v1v8: ldo6 {
-				regulator-name = "v1v8";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				interrupts = <IT_CURLIM_LDO6 0>;
-			};
-
-			vref_ddr: vref_ddr {
-				regulator-name = "vref_ddr";
-				regulator-always-on;
-			};
-
-			bst_out: boost {
-				regulator-name = "bst_out";
-				interrupts = <IT_OCP_BOOST 0>;
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
-			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
-			interrupt-names = "onkey-falling", "onkey-rising";
-			power-off-time-sec = <10>;
-			status = "okay";
-		};
-
-		watchdog {
-			compatible = "st,stpmic1-wdt";
-			status = "disabled";
-		};
-	};
-
-	touchscreen@49 {
-		compatible = "ti,tsc2004";
-		reg = <0x49>;
-		vio-supply = <&v3v3>;
-		interrupts-extended = <&gpioh 15 IRQ_TYPE_EDGE_FALLING>;
-	};
-
-	eeprom@50 {
-		compatible = "atmel,24c02";
-		reg = <0x50>;
-		pagesize = <16>;
-	};
-};
-
-&ipcc {
-	status = "okay";
-};
-
-&iwdg2 {
-	timeout-sec = <32>;
-	status = "okay";
-};
-
-&m4_rproc {
-	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
-			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
-	mbox-names = "vq0", "vq1", "shutdown";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
-	status = "okay";
-};
-
-&pwr_regulators {
-	vdd-supply = <&vdd>;
-	vdd_3v3_usbfs-supply = <&vdd_usb>;
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
-	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
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
-&rcc {
-	/* Connect MCO2 output to ETH_RX_CLK input via pad-pad connection */
-	clocks = <&rcc CK_MCO2>;
-	clock-names = "ETH_RX_CLK/ETH_REF_CLK";
-
-	/*
-	 * Set PLL4P output to 100 MHz to supply SDMMC with faster clock,
-	 * set MCO2 output to 50 MHz to supply ETHRX clock with PLL4P/2,
-	 * so that MCO2 behaves as a divider for the ETHRX clock here.
-	 */
-	assigned-clocks = <&rcc CK_MCO2>, <&rcc PLL4_P>;
-	assigned-clock-parents = <&rcc PLL4_P>;
-	assigned-clock-rates = <50000000>, <100000000>;
-};
-
-&rng1 {
-	status = "okay";
-};
-
-&rtc {
-	status = "okay";
-};
-
-&sdmmc1 {
-	pinctrl-names = "default", "opendrain", "sleep", "init";
-	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
-	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
-	pinctrl-3 = <&sdmmc1_b4_init_pins_a &sdmmc1_dir_init_pins_a>;
-	cd-gpios = <&gpiog 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-	disable-wp;
-	st,sig-dir;
-	st,neg-edge;
-	st,use-ckin;
-	st,cmd-gpios = <&gpiod 2 0>;
-	st,ck-gpios = <&gpioc 12 0>;
-	st,ckin-gpios = <&gpioe 4 0>;
-	bus-width = <4>;
-	vmmc-supply = <&vdd_sd>;
-	status = "okay";
-};
-
-&sdmmc1_b4_pins_a {
-	/*
-	 * SD bus pull-up resistors:
-	 * - optional on SoMs with SD voltage translator
-	 * - mandatory on SoMs without SD voltage translator
-	 */
-	pins1 {
-		bias-pull-up;
-	};
-	pins2 {
-		bias-pull-up;
-	};
-};
-
-&sdmmc2 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
-	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
-	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
-	non-removable;
-	no-sd;
-	no-sdio;
-	st,neg-edge;
-	bus-width = <8>;
-	vmmc-supply = <&v3v3>;
-	vqmmc-supply = <&v3v3>;
-	mmc-ddr-3_3v;
-	status = "okay";
-};
-
-&sdmmc3 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc3_b4_pins_a>;
-	pinctrl-1 = <&sdmmc3_b4_od_pins_a>;
-	pinctrl-2 = <&sdmmc3_b4_sleep_pins_a>;
-	broken-cd;
-	st,neg-edge;
-	bus-width = <4>;
-	vmmc-supply = <&v3v3>;
-	vqmmc-supply = <&v3v3>;
-	mmc-ddr-3_3v;
-	status = "okay";
-};
-
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart4_pins_a>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
deleted file mode 100644
index dd8fcecbca5..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
+++ /dev/null
@@ -1,20 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-/*
- * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
- * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- * Copyright (C) 2020 Marek Vasut <marex@denx.de>
- */
-
-/dts-v1/;
-
-#include "stm32mp151.dtsi"
-#include "stm32mp15xc.dtsi"
-#include "stm32mp15xx-dhcor-som.dtsi"
-#include "stm32mp15xx-dhcor-avenger96.dtsi"
-
-/ {
-	model = "Arrow Electronics STM32MP15xx Avenger96 board";
-	compatible = "arrow,stm32mp15xx-avenger96",
-		     "dh,stm32mp15xx-dhcor-som",
-		     "st,stm32mp15x";
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi
deleted file mode 100644
index 61e17f44ce8..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ /dev/null
@@ -1,437 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-/*
- * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
- * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- * Copyright (C) 2020 Marek Vasut <marex@denx.de>
- */
-
-/* Avenger96 uses DHCOR SoM configured for 1V8 IO operation */
-#include "stm32mp15xx-dhcor-io1v8.dtsi"
-
-/ {
-	aliases {
-		ethernet0 = &ethernet0;
-		mmc0 = &sdmmc1;
-		serial0 = &uart4;
-		serial1 = &uart7;
-		serial2 = &usart2;
-		spi0 = &qspi;
-	};
-
-	/* XTal Q1 */
-	cec_clock: clk-cec-fixed {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	hdmi-out {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_con: endpoint {
-				remote-endpoint = <&adv7513_out>;
-			};
-		};
-	};
-
-	led {
-		compatible = "gpio-leds";
-		led1 {
-			label = "green:user0";
-			gpios = <&gpioz 7 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
-			default-state = "off";
-		};
-
-		led2 {
-			label = "green:user1";
-			gpios = <&gpiof 3 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "mmc0";
-			default-state = "off";
-		};
-
-		led3 {
-			label = "green:user2";
-			gpios = <&gpiog 0 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "mmc1";
-			default-state = "off";
-		};
-
-		led4 {
-			label = "green:user3";
-			gpios = <&gpiog 1 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "none";
-			default-state = "off";
-			panic-indicator;
-		};
-	};
-
-	sd_switch: regulator-sd_switch {
-		compatible = "regulator-gpio";
-		regulator-name = "sd_switch";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
-		regulator-always-on;
-
-		gpios = <&gpioi 5 GPIO_ACTIVE_HIGH>;
-		gpios-states = <0>;
-		states = <1800000 0x1>,
-			 <2900000 0x0>;
-	};
-
-	sound {
-		compatible = "audio-graph-card";
-		label = "STM32MP1-AV96-HDMI";
-		dais = <&sai2a_port>;
-		status = "okay";
-	};
-
-	wlan_pwr: regulator-wlan {
-		compatible = "regulator-fixed";
-
-		regulator-name = "wl-reg";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpios = <&gpioz 3 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-};
-
-&adc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&adc12_ain_pins_b>;
-	vdd-supply = <&vdd>;
-	vdda-supply = <&vdda>;
-	vref-supply = <&vdda>;
-	status = "okay";
-
-	adc1: adc@0 {
-		st,adc-channels = <0 1 6>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
-	};
-
-	adc2: adc@100 {
-		st,adc-channels = <0 1 2>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
-	};
-};
-
-&ethernet0 {
-	status = "okay";
-	pinctrl-0 = <&ethernet0_rgmii_pins_c>;
-	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_c>;
-	pinctrl-names = "default", "sleep";
-	phy-mode = "rgmii";
-	max-speed = <1000>;
-	phy-handle = <&phy0>;
-
-	mdio0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-		reset-gpios = <&gpioz 2 GPIO_ACTIVE_LOW>;
-		reset-delay-us = <1000>;
-
-		phy0: ethernet-phy@7 {
-			reg = <7>;
-
-			rxc-skew-ps = <1500>;
-			rxdv-skew-ps = <540>;
-			rxd0-skew-ps = <420>;
-			rxd1-skew-ps = <420>;
-			rxd2-skew-ps = <420>;
-			rxd3-skew-ps = <420>;
-
-			txc-skew-ps = <1440>;
-			txen-skew-ps = <540>;
-			txd0-skew-ps = <420>;
-			txd1-skew-ps = <420>;
-			txd2-skew-ps = <420>;
-			txd3-skew-ps = <420>;
-		};
-	};
-};
-
-&gpioa {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "AV96-K",
-			  "AV96-I", "", "AV96-A", "";
-};
-
-&gpiob {
-	gpio-line-names = "", "", "", "",
-			  "", "AV96-J", "", "",
-			  "", "", "", "AV96-B",
-			  "", "AV96-L", "", "";
-};
-
-&gpioc {
-	gpio-line-names = "", "", "", "AV96-C",
-			  "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiod {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "AV96-D", "", "", "",
-			  "", "", "AV96-E", "AV96-F";
-};
-
-&gpiof {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "",
-			  "AV96-G", "AV96-H", "", "";
-};
-
-&i2c1 {	/* X6 I2C1 */
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c1_pins_b>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
-};
-
-&i2c2 {	/* X6 I2C2 */
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2_pins_c>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
-};
-
-&i2c4 {
-	hdmi-transmitter@3d {
-		compatible = "adi,adv7513";
-		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
-		reg-names = "main", "edid", "cec", "packet";
-		clocks = <&cec_clock>;
-		clock-names = "cec";
-
-		avdd-supply = <&v3v3>;
-		dvdd-supply = <&v3v3>;
-		pvdd-supply = <&v3v3>;
-		dvdd-3v-supply = <&v3v3>;
-		bgvdd-supply = <&v3v3>;
-
-		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-parent = <&gpiog>;
-
-		status = "okay";
-
-		adi,input-depth = <8>;
-		adi,input-colorspace = "rgb";
-		adi,input-clock = "1x";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7513_in: endpoint {
-					remote-endpoint = <&ltdc_ep0_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				adv7513_out: endpoint {
-					remote-endpoint = <&hdmi_con>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-				adv7513_i2s0: endpoint {
-					remote-endpoint = <&sai2a_endpoint>;
-				};
-			};
-		};
-	};
-};
-
-&ltdc {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&ltdc_pins_d>;
-	pinctrl-1 = <&ltdc_sleep_pins_d>;
-	status = "okay";
-
-	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
-			remote-endpoint = <&adv7513_in>;
-		};
-	};
-};
-
-&sai2 {
-	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sai2a_pins_c>;
-	pinctrl-1 = <&sai2a_sleep_pins_c>;
-	clock-names = "pclk", "x8k", "x11k";
-	status = "okay";
-
-	sai2a: audio-controller@4400b004 {
-		#clock-cells = <0>;
-		dma-names = "tx";
-		clocks = <&rcc SAI2_K>;
-		clock-names = "sai_ck";
-		status = "okay";
-
-		sai2a_port: port {
-			sai2a_endpoint: endpoint {
-				remote-endpoint = <&adv7513_i2s0>;
-				format = "i2s";
-				mclk-fs = <256>;
-			};
-		};
-	};
-};
-
-&sdmmc1 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_b>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_b>;
-	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_b>;
-	cd-gpios = <&gpioi 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-	disable-wp;
-	st,sig-dir;
-	st,neg-edge;
-	st,use-ckin;
-	bus-width = <4>;
-	vmmc-supply = <&vdd_sd>;
-	vqmmc-supply = <&sd_switch>;
-	status = "okay";
-};
-
-&sdmmc2 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
-	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_c>;
-	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_c>;
-	bus-width = <8>;
-	mmc-ddr-1_8v;
-	no-sd;
-	no-sdio;
-	non-removable;
-	st,neg-edge;
-	vmmc-supply = <&v3v3>;
-	vqmmc-supply = <&vdd_io>;
-	status = "okay";
-};
-
-&sdmmc3 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc3_b4_pins_b>;
-	pinctrl-1 = <&sdmmc3_b4_od_pins_b>;
-	pinctrl-2 = <&sdmmc3_b4_sleep_pins_b>;
-	broken-cd;
-	non-removable;
-	st,neg-edge;
-	bus-width = <4>;
-	vmmc-supply = <&wlan_pwr>;
-	status = "okay";
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-	brcmf: bcrmf@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
-};
-
-&spi2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi2_pins_a>;
-	cs-gpios = <&gpioi 0 0>;
-	status = "disabled";
-	/delete-property/dmas;
-	/delete-property/dma-names;
-};
-
-&uart4 {
-	/* On Low speed expansion header */
-	label = "LS-UART1";
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart4_pins_b>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&uart7 {
-	/* On Low speed expansion header */
-	label = "LS-UART0";
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart7_pins_a>;
-	uart-has-rtscts;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-/* Bluetooth */
-&usart2 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&usart2_pins_a>;
-	pinctrl-1 = <&usart2_sleep_pins_a>;
-	st,hw-flow-ctrl;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-
-	bluetooth {
-		compatible = "brcm,bcm43438-bt";
-		max-speed = <3000000>;
-		shutdown-gpios = <&gpioz 6 GPIO_ACTIVE_HIGH>;
-	};
-};
-
-&usbh_ehci {
-	phys = <&usbphyc_port0>;
-	phy-names = "usb";
-	status = "okay";
-};
-
-&usbotg_hs {
-	pinctrl-0 = <&usbotg_hs_pins_a>;
-	pinctrl-names = "default";
-	phy-names = "usb2-phy";
-	phys = <&usbphyc_port1 0>;
-	status = "okay";
-	vbus-supply = <&vbus_otg>;
-};
-
-&usbphyc {
-	status = "okay";
-};
-
-&usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
-};
-
-&usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts b/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
deleted file mode 100644
index c1f99c1685e..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
+++ /dev/null
@@ -1,18 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-/*
- * Copyright (C) 2022 Marek Vasut <marex@denx.de>
- */
-
-/dts-v1/;
-
-#include "stm32mp151.dtsi"
-#include "stm32mp15xc.dtsi"
-#include "stm32mp15xx-dhcor-som.dtsi"
-#include "stm32mp15xx-dhcor-drc-compact.dtsi"
-
-/ {
-	model = "DH electronics STM32MP15xx DHCOR DRC Compact";
-	compatible = "dh,stm32mp15xx-dhcor-drc-compact",
-		     "dh,stm32mp15xx-dhcor-som",
-		     "st,stm32mp1xx";
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dtsi
deleted file mode 100644
index bedccf0f00a..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dtsi
+++ /dev/null
@@ -1,326 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-/*
- * Copyright (C) 2022 Marek Vasut <marex@denx.de>
- */
-
-/ {
-	aliases {
-		ethernet0 = &ethernet0;
-		ethernet1 = &ksz8851;
-		mmc0 = &sdmmc1;
-		rtc0 = &hwrtc;
-		rtc1 = &rtc;
-		serial0 = &uart4;
-		serial1 = &uart8;
-		serial2 = &usart3;
-		serial3 = &uart5;
-		spi0 = &qspi;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	led {
-		compatible = "gpio-leds";
-		led1 {
-			label = "yellow:user0";
-			gpios = <&gpioz 6 GPIO_ACTIVE_LOW>;
-			default-state = "off";
-		};
-
-		led2 {
-			label = "red:user1";
-			gpios = <&gpioz 3 GPIO_ACTIVE_LOW>;
-			default-state = "off";
-		};
-	};
-
-	ethernet_vio: vioregulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vio";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpioh 2 GPIO_ACTIVE_LOW>;
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&vdd>;
-	};
-};
-
-&adc {	/* X11 ADC inputs */
-	pinctrl-names = "default";
-	pinctrl-0 = <&adc12_ain_pins_b>;
-	vdd-supply = <&vdd>;
-	vdda-supply = <&vdda>;
-	vref-supply = <&vdda>;
-	status = "okay";
-
-	adc1: adc@0 {
-		st,adc-channels = <0 1 6>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
-	};
-
-	adc2: adc@100 {
-		st,adc-channels = <0 1 2>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
-	};
-};
-
-&ethernet0 {
-	status = "okay";
-	pinctrl-0 = <&ethernet0_rgmii_pins_c>;
-	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_c>;
-	pinctrl-names = "default", "sleep";
-	phy-mode = "rgmii";
-	max-speed = <1000>;
-	phy-handle = <&phy0>;
-
-	mdio0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-		reset-gpios = <&gpioz 2 GPIO_ACTIVE_LOW>;
-		reset-delay-us = <1000>;
-		reset-post-delay-us = <1000>;
-
-		phy0: ethernet-phy@7 {
-			reg = <7>;
-
-			rxc-skew-ps = <1500>;
-			rxdv-skew-ps = <540>;
-			rxd0-skew-ps = <420>;
-			rxd1-skew-ps = <420>;
-			rxd2-skew-ps = <420>;
-			rxd3-skew-ps = <420>;
-
-			txc-skew-ps = <1440>;
-			txen-skew-ps = <540>;
-			txd0-skew-ps = <420>;
-			txd1-skew-ps = <420>;
-			txd2-skew-ps = <420>;
-			txd3-skew-ps = <420>;
-		};
-	};
-};
-
-&fmc {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&fmc_pins_b>;
-	pinctrl-1 = <&fmc_sleep_pins_b>;
-	status = "okay";
-
-	ksz8851: ethernet@1,0 {
-		compatible = "micrel,ks8851-mll";
-		reg = <1 0x0 0x2>, <1 0x2 0x20000>;
-		interrupt-parent = <&gpioc>;
-		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-		bank-width = <2>;
-
-		/* Timing values are in nS */
-		st,fmc2-ebi-cs-mux-enable;
-		st,fmc2-ebi-cs-transaction-type = <4>;
-		st,fmc2-ebi-cs-buswidth = <16>;
-		st,fmc2-ebi-cs-address-setup-ns = <5>;
-		st,fmc2-ebi-cs-address-hold-ns = <5>;
-		st,fmc2-ebi-cs-bus-turnaround-ns = <5>;
-		st,fmc2-ebi-cs-data-setup-ns = <45>;
-		st,fmc2-ebi-cs-data-hold-ns = <1>;
-		st,fmc2-ebi-cs-write-address-setup-ns = <5>;
-		st,fmc2-ebi-cs-write-address-hold-ns = <5>;
-		st,fmc2-ebi-cs-write-bus-turnaround-ns = <5>;
-		st,fmc2-ebi-cs-write-data-setup-ns = <45>;
-		st,fmc2-ebi-cs-write-data-hold-ns = <1>;
-	};
-};
-
-&gpioa {
-	gpio-line-names = "", "", "", "",
-			  "DRCC-VAR2", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpioe {
-	gpio-line-names = "", "", "", "",
-			  "", "DRCC-GPIO0", "", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiog {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "",
-			  "DRCC-GPIO5", "", "", "";
-};
-
-&gpioh {
-	gpio-line-names = "", "", "", "DRCC-HW2",
-			  "DRCC-GPIO4", "", "", "",
-			  "DRCC-HW1", "DRCC-HW0", "", "DRCC-VAR1",
-			  "DRCC-VAR0", "", "", "DRCC-GPIO6";
-};
-
-&gpioi {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "DRCC-GPIO2",
-			  "", "DRCC-GPIO1", "", "",
-			  "", "", "", "";
-};
-
-&i2c1 {	/* X11 I2C1 */
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c1_pins_b>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
-};
-
-&i2c4 {
-	hwrtc: rtc@32 {
-		compatible = "microcrystal,rv8803";
-		reg = <0x32>;
-	};
-
-	eeprom@50 {
-		compatible = "atmel,24c04";
-		reg = <0x50>;
-		pagesize = <16>;
-	};
-};
-
-&sdmmc1 {	/* MicroSD */
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
-	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
-	cd-gpios = <&gpioi 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-	disable-wp;
-	st,neg-edge;
-	bus-width = <4>;
-	vmmc-supply = <&vdd>;
-	vqmmc-supply = <&vdd>;
-	status = "okay";
-};
-
-&sdmmc2 {	/* eMMC */
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
-	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_c>;
-	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_c>;
-	bus-width = <8>;
-	no-sd;
-	no-sdio;
-	non-removable;
-	st,neg-edge;
-	vmmc-supply = <&v3v3>;
-	vqmmc-supply = <&vdd>;
-	status = "okay";
-};
-
-&sdmmc3 {	/* SDIO Wi-Fi */
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc3_b4_pins_a>;
-	pinctrl-1 = <&sdmmc3_b4_od_pins_a>;
-	pinctrl-2 = <&sdmmc3_b4_sleep_pins_a>;
-	broken-cd;
-	bus-width = <4>;
-	mmc-ddr-3_3v;
-	st,neg-edge;
-	vmmc-supply = <&v3v3>;
-	vqmmc-supply = <&v3v3>;
-	status = "okay";
-};
-
-&spi2 {	/* X11 SPI */
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi2_pins_b>;
-	cs-gpios = <&gpioi 0 0>;
-	status = "disabled";
-	/delete-property/dmas;
-	/delete-property/dma-names;
-};
-
-&uart4 {
-	label = "UART0";
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart4_pins_d>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&uart5 {	/* X11 UART */
-	label = "X11-UART5";
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart5_pins_a>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&uart8 {
-	label = "RS485-1";
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart8_pins_a &uart8_rtscts_pins_a>;
-	uart-has-rtscts;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&usart3 {	/* RS485 or RS232 */
-	label = "RS485-2";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&usart3_pins_e>;
-	pinctrl-1 = <&usart3_sleep_pins_e>;
-	uart-has-rtscts;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&usbh_ehci {
-	phys = <&usbphyc_port0>;
-	status = "okay";
-};
-
-&usbh_ohci {
-	phys = <&usbphyc_port0>;
-	status = "okay";
-};
-
-&usbotg_hs {
-	dr_mode = "otg";
-	pinctrl-0 = <&usbotg_hs_pins_a>;
-	pinctrl-names = "default";
-	phy-names = "usb2-phy";
-	phys = <&usbphyc_port1 0>;
-	vbus-supply = <&vbus_otg>;
-	status = "okay";
-};
-
-&usbphyc {
-	status = "okay";
-};
-
-&usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
-	vdda1v1-supply = <&reg11>;
-	vdda1v8-supply = <&reg18>;
-	connector {
-		compatible = "usb-a-connector";
-		vbus-supply = <&vbus_sw>;
-	};
-};
-
-&usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
-	vdda1v1-supply = <&reg11>;
-	vdda1v8-supply = <&reg18>;
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-io1v8.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-io1v8.dtsi
deleted file mode 100644
index e20917824bf..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcor-io1v8.dtsi
+++ /dev/null
@@ -1,28 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-/*
- * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
- * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- * Copyright (C) 2020 Marek Vasut <marex@denx.de>
- */
-
-/ {
-	/* Enpirion EP3A8LQI U2 on the DHCOR */
-	vdd_io: regulator-buck-io {
-		compatible = "regulator-fixed";
-		regulator-name = "buck-io";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&vdd>;
-	};
-};
-
-&vdd {
-	regulator-min-microvolt = <1800000>;
-	regulator-max-microvolt = <2900000>;
-};
-
-&pwr_regulators {
-	vdd-supply = <&vdd_io>;
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-som.dtsi
deleted file mode 100644
index f36eec1b4ac..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcor-som.dtsi
+++ /dev/null
@@ -1,221 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-/*
- * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
- * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- * Copyright (C) 2020 Marek Vasut <marex@denx.de>
- */
-
-#include "stm32mp15-pinctrl.dtsi"
-#include "stm32mp15xxac-pinctrl.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/mfd/st,stpmic1.h>
-
-/ {
-	aliases {
-		spi0 = &qspi;
-	};
-
-	memory@c0000000 {
-		device_type = "memory";
-		reg = <0xc0000000 0x40000000>;
-	};
-};
-
-&crc1 {
-	status = "okay";
-};
-
-&dts {
-	status = "okay";
-};
-
-&i2c4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c4_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
-
-	pmic: stpmic@33 {
-		compatible = "st,stpmic1";
-		reg = <0x33>;
-		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		status = "okay";
-
-		regulators {
-			compatible = "st,stpmic1-regulators";
-
-			ldo1-supply = <&v3v3>;
-			ldo2-supply = <&v3v3>;
-			ldo3-supply = <&vdd_ddr>;
-			ldo5-supply = <&v3v3>;
-			ldo6-supply = <&v3v3>;
-			pwr_sw1-supply = <&bst_out>;
-			pwr_sw2-supply = <&bst_out>;
-
-			vddcore: buck1 {
-				regulator-name = "vddcore";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd_ddr: buck2 {
-				regulator-name = "vdd_ddr";
-				regulator-min-microvolt = <1350000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd: buck3 {
-				regulator-name = "vdd";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			v3v3: buck4 {
-				regulator-name = "v3v3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-				regulator-initial-mode = <0>;
-			};
-
-			vdda: ldo1 {
-				regulator-name = "vdda";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
-				interrupts = <IT_CURLIM_LDO1 0>;
-			};
-
-			v2v8: ldo2 {
-				regulator-name = "v2v8";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				interrupts = <IT_CURLIM_LDO2 0>;
-			};
-
-			vtt_ddr: ldo3 {
-				regulator-name = "vtt_ddr";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <750000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-			};
-
-			vdd_usb: ldo4 {
-				regulator-name = "vdd_usb";
-				interrupts = <IT_CURLIM_LDO4 0>;
-			};
-
-			vdd_sd: ldo5 {
-				regulator-name = "vdd_sd";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
-				interrupts = <IT_CURLIM_LDO5 0>;
-				regulator-boot-on;
-			};
-
-			v1v8: ldo6 {
-				regulator-name = "v1v8";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				interrupts = <IT_CURLIM_LDO6 0>;
-				regulator-enable-ramp-delay = <300000>;
-			};
-
-			vref_ddr: vref_ddr {
-				regulator-name = "vref_ddr";
-				regulator-always-on;
-			};
-
-			bst_out: boost {
-				regulator-name = "bst_out";
-				interrupts = <IT_OCP_BOOST 0>;
-			};
-
-			vbus_otg: pwr_sw1 {
-				regulator-name = "vbus_otg";
-				interrupts = <IT_OCP_OTG 0>;
-				regulator-active-discharge = <1>;
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
-	eeprom@53 {
-		compatible = "atmel,24c02";
-		reg = <0x53>;
-		pagesize = <16>;
-	};
-};
-
-&iwdg2 {
-	timeout-sec = <32>;
-	status = "okay";
-};
-
-&pwr_regulators {
-	vdd-supply = <&vdd>;
-	vdd_3v3_usbfs-supply = <&vdd_usb>;
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
-	reg = <0x58003000 0x1000>, <0x70000000 0x200000>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	status = "okay";
-
-	flash0: flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-rx-bus-width = <4>;
-		spi-max-frequency = <50000000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-};
-
-&rng1 {
-	status = "okay";
-};
-
-&rtc {
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts b/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts
deleted file mode 100644
index 5fdd762ddbf..00000000000
--- a/arch/arm/dts/stm32mp15xx-dhcor-testbench.dts
+++ /dev/null
@@ -1,180 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-/*
- * Copyright (C) 2022 Marek Vasut <marex@denx.de>
- */
-/dts-v1/;
-
-#include "stm32mp151.dtsi"
-#include "stm32mp15xx-dhcor-som.dtsi"
-
-/ {
-	model = "DH electronics STM32MP15xx DHCOR Testbench";
-	compatible = "dh,stm32mp15xx-dhcor-testbench",
-		     "dh,stm32mp15xx-dhcor-som",
-		     "st,stm32mp1xx";
-
-	aliases {
-		ethernet0 = &ethernet0;
-		mmc0 = &sdmmc1;
-		mmc1 = &sdmmc2;
-		serial0 = &uart4;
-		serial1 = &uart7;
-		spi0 = &qspi;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	sd_switch: regulator-sd_switch {
-		compatible = "regulator-gpio";
-		regulator-name = "sd_switch";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
-		regulator-always-on;
-
-		gpios = <&gpioi 5 GPIO_ACTIVE_HIGH>;
-		gpios-states = <0>;
-		states = <1800000 0x1>,
-			 <2900000 0x0>;
-	};
-};
-
-&adc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&adc12_ain_pins_b>;
-	vdd-supply = <&vdd>;
-	vdda-supply = <&vdda>;
-	vref-supply = <&vdda>;
-	status = "okay";
-
-	adc1: adc@0 {
-		st,adc-channels = <0 1 6>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
-	};
-
-	adc2: adc@100 {
-		st,adc-channels = <0 1 2>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
-	};
-};
-
-&ethernet0 {
-	status = "okay";
-	pinctrl-0 = <&ethernet0_rgmii_pins_c>;
-	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_c>;
-	pinctrl-names = "default", "sleep";
-	phy-mode = "rgmii";
-	max-speed = <1000>;
-	phy-handle = <&phy0>;
-
-	mdio0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-		reset-gpios = <&gpioz 2 GPIO_ACTIVE_LOW>;
-		reset-delay-us = <1000>;
-
-		phy0: ethernet-phy@7 {
-			reg = <7>;
-
-			rxc-skew-ps = <1500>;
-			rxdv-skew-ps = <540>;
-			rxd0-skew-ps = <420>;
-			rxd1-skew-ps = <420>;
-			rxd2-skew-ps = <420>;
-			rxd3-skew-ps = <420>;
-
-			txc-skew-ps = <1440>;
-			txen-skew-ps = <540>;
-			txd0-skew-ps = <420>;
-			txd1-skew-ps = <420>;
-			txd2-skew-ps = <420>;
-			txd3-skew-ps = <420>;
-		};
-	};
-};
-
-&sdmmc1 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_b>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_b>;
-	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_b>;
-	cd-gpios = <&gpioi 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-	disable-wp;
-	st,sig-dir;
-	st,neg-edge;
-	st,use-ckin;
-	bus-width = <4>;
-	vmmc-supply = <&vdd_sd>;
-	vqmmc-supply = <&sd_switch>;
-	status = "okay";
-};
-
-&sdmmc2 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
-	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_c>;
-	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_c>;
-	bus-width = <8>;
-	mmc-ddr-1_8v;
-	no-sd;
-	no-sdio;
-	non-removable;
-	st,neg-edge;
-	vmmc-supply = <&v3v3>;
-	vqmmc-supply = <&v3v3>;
-	status = "okay";
-};
-
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart4_pins_b>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&uart7 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart7_pins_a>;
-	uart-has-rtscts;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-&usbh_ehci {
-	phys = <&usbphyc_port0>;
-	phy-names = "usb";
-	status = "okay";
-};
-
-&usbotg_hs {
-	pinctrl-0 = <&usbotg_hs_pins_a>;
-	pinctrl-names = "default";
-	phy-names = "usb2-phy";
-	phys = <&usbphyc_port1 0>;
-	status = "okay";
-	vbus-supply = <&vbus_otg>;
-};
-
-&usbphyc {
-	status = "okay";
-};
-
-&usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
-};
-
-&usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
-};
-
-&vdd {
-	/delete-property/ regulator-always-on;
-	regulator-min-microvolt = <1200000>;
-};
diff --git a/board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its b/board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its
index 8eed9d0fb24..38ecb601190 100644
--- a/board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its
+++ b/board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its
@@ -18,7 +18,7 @@
 
 		fdt-1 {
 			description = ".dtb";
-			data = /incbin/("arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtb");
+			data = /incbin/("dts/upstream/src/arm/st/stm32mp157c-dhcom-pdk2.dtb");
 			type = "flat_dt";
 			arch = "arm";
 			compression = "none";
@@ -26,7 +26,7 @@
 
 		fdt-2 {
 			description = ".dtb";
-			data = /incbin/("arch/arm/dts/stm32mp15xx-dhcom-drc02.dtb");
+			data = /incbin/("dts/upstream/src/arm/st/stm32mp153c-dhcom-drc02.dtb");
 			type = "flat_dt";
 			arch = "arm";
 			compression = "none";
@@ -34,7 +34,7 @@
 
 		fdt-3 {
 			description = ".dtb";
-			data = /incbin/("arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtb");
+			data = /incbin/("dts/upstream/src/arm/st/stm32mp157c-dhcom-picoitx.dtb");
 			type = "flat_dt";
 			arch = "arm";
 			compression = "none";
@@ -46,42 +46,42 @@
 
 		config-1 {
 			/* DT+SoM+board model */
-			description = "dh,stm32mp15xx-dhcom-pdk2_somrev0_boardrev0";
+			description = "dh,stm32mp157c-dhcom-pdk2_somrev0_boardrev0";
 			firmware = "uboot";
 			fdt = "fdt-1";
 		};
 
 		config-2 {
 			/* DT+SoM+board model */
-			description = "dh,stm32mp15xx-dhcom-pdk2_somrev1_boardrev0";
+			description = "dh,stm32mp157c-dhcom-pdk2_somrev1_boardrev0";
 			firmware = "uboot";
 			fdt = "fdt-1";
 		};
 
 		config-3 {
 			/* DT+SoM+board model */
-			description = "dh,stm32mp15xx-dhcom-drc02_somrev0_boardrev0";
+			description = "dh,stm32mp153c-dhcom-drc02_somrev0_boardrev0";
 			firmware = "uboot";
 			fdt = "fdt-2";
 		};
 
 		config-4 {
 			/* DT+SoM+board model */
-			description = "dh,stm32mp15xx-dhcom-drc02_somrev1_boardrev0";
+			description = "dh,stm32mp153c-dhcom-drc02_somrev1_boardrev0";
 			firmware = "uboot";
 			fdt = "fdt-2";
 		};
 
 		config-5 {
 			/* DT+SoM+board model */
-			description = "dh,stm32mp15xx-dhcom-picoitx_somrev0_boardrev0";
+			description = "dh,stm32mp157c-dhcom-picoitx_somrev0_boardrev0";
 			loadables = "uboot";
 			fdt = "fdt-3";
 		};
 
 		config-6 {
 			/* DT+SoM+board model */
-			description = "dh,stm32mp15xx-dhcom-picoitx_somrev1_boardrev0";
+			description = "dh,stm32mp157c-dhcom-picoitx_somrev1_boardrev0";
 			loadables = "uboot";
 			fdt = "fdt-3";
 		};
diff --git a/board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its b/board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its
index f9c1075616b..e17dac77804 100644
--- a/board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its
+++ b/board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its
@@ -18,7 +18,7 @@
 
 		fdt-1 {
 			description = ".dtb";
-			data = /incbin/("arch/arm/dts/stm32mp15xx-dhcor-testbench.dtb");
+			data = /incbin/("dts/upstream/src/arm/st/stm32mp151a-dhcor-testbench.dtb");
 			type = "flat_dt";
 			arch = "arm";
 			compression = "none";
@@ -26,7 +26,7 @@
 
 		fdt-2 {
 			description = ".dtb";
-			data = /incbin/("arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtb");
+			data = /incbin/("dts/upstream/src/arm/st/stm32mp157a-dhcor-avenger96.dtb");
 			type = "flat_dt";
 			arch = "arm";
 			compression = "none";
@@ -34,7 +34,7 @@
 
 		fdt-3 {
 			description = ".dtb";
-			data = /incbin/("arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dtb");
+			data = /incbin/("dts/upstream/src/arm/st/stm32mp153c-dhcor-drc-compact.dtb");
 			type = "flat_dt";
 			arch = "arm";
 			compression = "none";
@@ -46,21 +46,21 @@
 
 		config-1 {
 			/* DT+SoM+board model */
-			description = "dh,stm32mp15xx-dhcor-testbench_somrev0_boardrev1";
+			description = "dh,stm32mp151a-dhcor-testbench_somrev0_boardrev1";
 			firmware = "uboot";
 			fdt = "fdt-1";
 		};
 
 		config-2 {
 			/* DT+SoM+board model */
-			description = "arrow,stm32mp15xx-avenger96_somrev0_boardrev1";
+			description = "arrow,stm32mp157a-avenger96_somrev0_boardrev1";
 			firmware = "uboot";
 			fdt = "fdt-2";
 		};
 
 		config-3 {
 			/* DT+SoM+board model */
-			description = "dh,stm32mp15xx-dhcor-drc-compact_somrev0_boardrev0";
+			description = "dh,stm32mp153c-dhcor-drc-compact_somrev0_boardrev0";
 			firmware = "uboot";
 			fdt = "fdt-3";
 		};
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index c9095a9d2d8..e2a26e2b774 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -7,7 +7,7 @@ CONFIG_SF_DEFAULT_SPEED=50000000
 CONFIG_ENV_SIZE=0x4000
 CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_SPL_DM_SPI=y
-CONFIG_DEFAULT_DEVICE_TREE="stm32mp15xx-dhcom-pdk2"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157c-dhcom-pdk2"
 CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_SPL_MMC=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
@@ -95,7 +95,8 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_OF_LIVE=y
-CONFIG_OF_LIST="stm32mp15xx-dhcom-pdk2 stm32mp15xx-dhcom-drc02 stm32mp15xx-dhcom-picoitx"
+CONFIG_OF_UPSTREAM=y
+CONFIG_OF_LIST="st/stm32mp157c-dhcom-pdk2 st/stm32mp153c-dhcom-drc02 st/stm32mp157c-dhcom-picoitx"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index fe4540278f4..f73bd2fa12c 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -7,7 +7,7 @@ CONFIG_SF_DEFAULT_SPEED=50000000
 CONFIG_ENV_SIZE=0x4000
 CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_SPL_DM_SPI=y
-CONFIG_DEFAULT_DEVICE_TREE="stm32mp15xx-dhcor-avenger96"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157a-dhcor-avenger96"
 CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_SPL_MMC=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
@@ -93,7 +93,8 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_OF_LIVE=y
-CONFIG_OF_LIST="stm32mp15xx-dhcor-avenger96 stm32mp15xx-dhcor-testbench stm32mp15xx-dhcor-drc-compact"
+CONFIG_OF_UPSTREAM=y
+CONFIG_OF_LIST="st/stm32mp157a-dhcor-avenger96 st/stm32mp151a-dhcor-testbench st/stm32mp153c-dhcor-drc-compact"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
