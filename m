Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2B32733F
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Feb 2021 16:53:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68B34C56630;
	Sun, 28 Feb 2021 15:53:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81C76C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:53:14 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id b8so5494346plh.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zGWFmcq9mc86o9MR9vmjdfE0Lev+0u1aNZ87aPHzIFE=;
 b=hgDCA9lqQHgkcPU5tgbTylg0tQ3IBuv40lgb8LdJ349YN8TyGQLiDwG/lbSG5QBb0d
 pYd+og3Vol06AXjuBU54ZE0kqw8Pe8VwSDw5R1pzHMJTxwv//oyBpKUR0wXENFUXWunW
 bN436PLTM3CcUTW2PXQw/B3qUixFUhbb3BlVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGWFmcq9mc86o9MR9vmjdfE0Lev+0u1aNZ87aPHzIFE=;
 b=m7MjuXet6ucZGA/2SRRwTynHJDjp61j/GzZ83d7BdFMCK6xRGUczEBuUMFhCd9By1i
 M3qUzMCbDKfoaxmEih9/3QFb6ahFsBxYPHxOv0mKDMXLW+iTy88AsmUf9tC0kmbAWdNg
 8Sf65j285jPIPt2fzgCamTPePQ6I14kWtmmMLnxl0m5C6jkKEbtviLqK36JH290cWKAT
 Pu00q9o+R+QF3yBLtn2mxPqwwWKAXAUJS5XGREOM3isaRJvzzUATWvQeqaoJjkXDBCaT
 qsfr6uVSMVK2bruBvIik2TK1c9KjkPmNB7I896CRlMKAN55XmuyMeKMKmjs4TmuMw9g9
 vNZw==
X-Gm-Message-State: AOAM5333ajzyfmchDxKoyVM/BhFqOxgUurpmL5nhVQ1s/QcVQfZE59VA
 jv3q7l6B49+i9Nmtz5bxk0k95A==
X-Google-Smtp-Source: ABdhPJzhKX3LgJSf1mpEcjjMGABfCpIWAq027BuvG30fIbxE1SJN+ZQwcvtCBeyz99I845Qr6aYBlw==
X-Received: by 2002:a17:90a:d0c1:: with SMTP id
 y1mr12737551pjw.164.1614527593120; 
 Sun, 28 Feb 2021 07:53:13 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id o18sm14725779pjq.44.2021.02.28.07.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:53:12 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Sun, 28 Feb 2021 21:22:26 +0530
Message-Id: <20210228155226.77904-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228155226.77904-1-jagan@amarulasolutions.com>
References: <20210228155226.77904-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 9/9] board: stm32: Add Engicam MicroGEA
	STM32MP1 MicroDev 2.0 7" OF
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

7" OF is a capacitive touch 7" Open Frame panel solutions with
- 7" AUO B101AW03 LVDS panel
- EDT, FT5526 Touch

MicroGEA STM32MP1 is a STM32MP157A based Micro SoM.

MicroDev 2.0 is a general purpose miniature carrier board with CAN,
LTE and LVDS panel interfaces.

MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0
7" Open Frame Solution board.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/dts/Makefile                         |   1 +
 ...rogea-stm32mp1-microdev2.0-of7-u-boot.dtsi |  51 ++++++
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts | 154 ++++++++++++++++++
 arch/arm/mach-stm32mp/Kconfig                 |   7 +
 board/engicam/stm32mp1/MAINTAINERS            |   6 +
 ...-microgea-stm32mp1-microdev2-of7_defconfig |  80 +++++++++
 6 files changed, 299 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
 create mode 100644 configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 7b275fe46c..7a9a05310d 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -980,6 +980,7 @@ dtb-$(CONFIG_STM32MP15x) += \
 	stm32mp157a-dk1.dtb \
 	stm32mp157a-avenger96.dtb \
 	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
+	stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb \
 	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
 	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
 	stm32mp157c-dk2.dtb \
diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7-u-boot.dtsi b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7-u-boot.dtsi
new file mode 100644
index 0000000000..e4bd215812
--- /dev/null
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7-u-boot.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Amarula Solutions(India)
+ * Author: Jagan Teki <jagan@amarulasolutions.com>
+ */
+
+#include "stm32mp157a-microgea-stm32mp1-u-boot.dtsi"
+
+/{
+	aliases {
+		mmc0 = &sdmmc1;
+	};
+
+	chosen {
+		stdout-path = &uart4;
+	};
+};
+
+&sdmmc1 {
+	u-boot,dm-pre-reloc;
+};
+
+&sdmmc1_b4_pins_a {
+	u-boot,dm-pre-reloc;
+
+	pins1 {
+		u-boot,dm-pre-reloc;
+	};
+
+	pins2 {
+		u-boot,dm-pre-reloc;
+	};
+};
+
+&uart4 {
+	u-boot,dm-pre-reloc;
+};
+
+&uart4_pins_a {
+	u-boot,dm-pre-reloc;
+
+	pins1 {
+		u-boot,dm-pre-reloc;
+	};
+
+	pins2 {
+		u-boot,dm-pre-reloc;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
new file mode 100644
index 0000000000..674b2d330d
--- /dev/null
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/dts-v1/;
+#include "stm32mp157.dtsi"
+#include "stm32mp157a-microgea-stm32mp1.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Engicam MicroGEA STM32MP1 MicroDev 2.0 7\" Open Frame";
+	compatible = "engicam,microgea-stm32mp1-microdev2.0-of7",
+		     "engicam,microgea-stm32mp1", "st,stm32mp157";
+
+	aliases {
+		serial0 = &uart4;
+		serial1 = &uart8;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpiod 13 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+
+	lcd_3v3: regulator-lcd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpiof 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		power-supply = <&panel_pwr>;
+	};
+
+	panel_pwr: regulator-panel-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpiob 10 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+	};
+
+	panel {
+		compatible = "auo,b101aw03";
+		backlight = <&backlight>;
+		enable-gpios = <&gpiof 2 GPIO_ACTIVE_HIGH>;
+		power-supply = <&lcd_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	i2c-scl-falling-time-ns = <20>;
+	i2c-scl-rising-time-ns = <185>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_a>;
+	pinctrl-1 = <&i2c2_sleep_pins_a>;
+	status = "okay";
+};
+
+&ltdc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ltdc_pins>;
+	status = "okay";
+
+	port {
+		ltdc_ep0_out: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&pinctrl {
+	ltdc_pins: ltdc {
+		pins {
+			pinmux = <STM32_PINMUX('G', 10, AF14)>,	/* LTDC_B2 */
+				 <STM32_PINMUX('H', 12, AF14)>,	/* LTDC_R6 */
+				 <STM32_PINMUX('H', 11, AF14)>,	/* LTDC_R5 */
+				 <STM32_PINMUX('D', 10, AF14)>,	/* LTDC_B3 */
+				 <STM32_PINMUX('D', 9, AF14)>,	/* LTDC_B0 */
+				 <STM32_PINMUX('E', 5, AF14)>,	/* LTDC_G0 */
+				 <STM32_PINMUX('E', 6, AF14)>,	/* LTDC_G1 */
+				 <STM32_PINMUX('E', 13, AF14)>,	/* LTDC_DE */
+				 <STM32_PINMUX('E', 15, AF14)>,	/* LTDC_R7 */
+				 <STM32_PINMUX('G', 7, AF14)>,	/* LTDC_CLK */
+				 <STM32_PINMUX('G', 12, AF14)>,	/* LTDC_B1 */
+				 <STM32_PINMUX('H', 2, AF14)>,	/* LTDC_R0 */
+				 <STM32_PINMUX('H', 3, AF14)>,	/* LTDC_R1 */
+				 <STM32_PINMUX('H', 8, AF14)>,	/* LTDC_R2 */
+				 <STM32_PINMUX('H', 9, AF14)>,	/* LTDC_R3 */
+				 <STM32_PINMUX('H', 10, AF14)>,	/* LTDC_R4 */
+				 <STM32_PINMUX('H', 13, AF14)>,	/* LTDC_G2 */
+				 <STM32_PINMUX('H', 14, AF14)>,	/* LTDC_G3 */
+				 <STM32_PINMUX('H', 15, AF14)>,	/* LTDC_G4 */
+				 <STM32_PINMUX('I', 0, AF14)>,	/* LTDC_G5 */
+				 <STM32_PINMUX('I', 1, AF14)>,	/* LTDC_G6 */
+				 <STM32_PINMUX('I', 2, AF14)>,	/* LTDC_G7 */
+				 <STM32_PINMUX('I', 4, AF14)>,	/* LTDC_B4 */
+				 <STM32_PINMUX('I', 5, AF14)>,	/* LTDC_B5 */
+				 <STM32_PINMUX('B', 8, AF14)>,	/* LTDC_B6 */
+				 <STM32_PINMUX('I', 7, AF14)>,	/* LTDC_B7 */
+				 <STM32_PINMUX('I', 9, AF14)>,	/* LTDC_VSYNC */
+				 <STM32_PINMUX('I', 10, AF14)>;	/* LTDC_HSYNC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+	};
+};
+
+&sdmmc1 {
+	bus-width = <4>;
+	disable-wp;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	st,neg-edge;
+	vmmc-supply = <&vdd>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
+	status = "okay";
+};
+
+/* J31: RS323 */
+&uart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8_pins_a>;
+	status = "okay";
+};
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index c1622df7f3..c22b132ac1 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -97,6 +97,13 @@ config TARGET_MICROGEA_STM32MP1
 	  * MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
 	    for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.
 
+	  MicroGEA STM32MP1 MicroDev 2.0 7" OF:
+	  * 7" OF is a capacitive touch 7" Open Frame panel solutions with LVDS
+	    panel and toucscreen.
+	  * MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
+	    pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0 7"
+	    Open Frame Solution board.
+
 config TARGET_ICORE_STM32MP1
 	bool "Engicam i.Core STM32MP1 SOM"
 	select STM32MP15x
diff --git a/board/engicam/stm32mp1/MAINTAINERS b/board/engicam/stm32mp1/MAINTAINERS
index c0bb767782..712e312665 100644
--- a/board/engicam/stm32mp1/MAINTAINERS
+++ b/board/engicam/stm32mp1/MAINTAINERS
@@ -4,6 +4,12 @@ M:	Matteo Lisi <matteo.lisi@engicam.com>
 S:	Maintained
 F:	configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
 
+MicroGEA-STM32MP1-MICRODEV2.0-OF7
+M:	Jagan Teki <jagan@amarulasolutions.com>
+M:	Matteo Lisi <matteo.lisi@engicam.com>
+S:	Maintained
+F:	configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
+
 i.Core-STM32MP1-CTOUCH2.0
 M:	Jagan Teki <jagan@amarulasolutions.com>
 M:	Matteo Lisi <matteo.lisi@engicam.com>
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
new file mode 100644
index 0000000000..96f52fca55
--- /dev/null
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
@@ -0,0 +1,80 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_SYS_MEMTEST_START=0xc0000000
+CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_ENV_OFFSET=0x280000
+CONFIG_SPL_TEXT_BASE=0x2FFC2500
+CONFIG_SPL_MMC_SUPPORT=y
+CONFIG_SPL=y
+CONFIG_TARGET_MICROGEA_STM32MP1=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
+# CONFIG_ARMV7_VIRT is not set
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp157a-microgea-stm32mp1-microdev2.0-of7"
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_FIT=y
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_BOARD_EARLY_INIT_F=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
+CONFIG_SPL_ENV_SUPPORT=y
+CONFIG_SPL_I2C_SUPPORT=y
+CONFIG_SPL_POWER_SUPPORT=y
+CONFIG_SYS_PROMPT="STM32MP> "
+CONFIG_CMD_ADTIMG=y
+CONFIG_CMD_ERASEENV=y
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_ADC=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_FUSE=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_REMOTEPROC=y
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_PMIC=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_EXT4_WRITE=y
+# CONFIG_SPL_DOS_PARTITION is not set
+CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+# CONFIG_SPL_ENV_IS_NOWHERE is not set
+CONFIG_DM_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_STM32F7=y
+CONFIG_LED=y
+CONFIG_LED_GPIO=y
+CONFIG_DM_MAILBOX=y
+CONFIG_STM32_IPCC=y
+CONFIG_STM32_FMC2_EBI=y
+CONFIG_DM_MMC=y
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_STM32_SDMMC2=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_ETH=y
+CONFIG_DWC_ETH_QOS=y
+CONFIG_PHY=y
+CONFIG_PINCONF=y
+# CONFIG_SPL_PINCTRL_FULL is not set
+CONFIG_PINCTRL_STMFX=y
+CONFIG_DM_PMIC=y
+# CONFIG_SPL_PMIC_CHILDREN is not set
+CONFIG_PMIC_STPMIC1=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_REMOTEPROC_STM32_COPRO=y
+CONFIG_DM_RTC=y
+CONFIG_RTC_STM32=y
+CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
+CONFIG_LZO=y
+CONFIG_ERRNO_STR=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
