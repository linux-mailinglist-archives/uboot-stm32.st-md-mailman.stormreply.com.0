Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9DA77BE5
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:19:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95E9EC78F90;
	Tue,  1 Apr 2025 13:19:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69AFEC78F8C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:19:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531CMwM2019608;
 Tue, 1 Apr 2025 15:18:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +suC8QtpZPycdzTa6Z1pBPSaDgnJc4l/GtlGc0Takek=; b=0nwNo6S+MtNaShsZ
 szbiOxOxPp2CDjmDYPOMl4sksYu9BSJP1enf+o7tq/rGkquNKdXKr/dTYCnPpUtM
 bNyAFw1w0jbzpGykKMqk7mzMzajOXqhJ+ZxG0FaSKy5bW85Pbl0LaOgH4sXwsBR2
 aIx/drLTtZacxvX9Huax6WjI4YPA00YKiy5gqGKpFchbIFadaDfidrafaViuLOKy
 iwjDQbN9Jk2d0vnnwtOkqoDp1iLd4HokxgObQTi8iI3U/wJ6G+4PidVE2teHgUtn
 09XuJd+urf17HgLijwUIkFuMnY5KnecaLHnzXBrImna5USDu0ecRtMjn6cpYQZq1
 ZkT3cQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p8mmn570-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:18:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 66A834004D;
 Tue,  1 Apr 2025 15:16:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 679898A18D9;
 Tue,  1 Apr 2025 15:14:40 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:14:40 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:14:12 +0200
Message-ID: <20250401131413.387139-13-patrice.chotard@foss.st.com>
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
Cc: Fabio Estevam <festevam@denx.de>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sumit Garg <sumit.garg@kernel.org>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Prasad Kummari <prasad.kummari@amd.com>, Adam Ford <aford173@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 12/13] ARM: dts: stm32: convert stm32mp2 board
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

Enable OF_UPSTREAM flag for STM32MP2 platforms.
Add fixed-clock ck_flexgen_08 and ck_icn_ls_mcu until STM32MP25
clock driver will be available.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/Makefile                    |   3 -
 arch/arm/dts/stm32mp25-pinctrl.dtsi      |  38 ---
 arch/arm/dts/stm32mp251.dtsi             | 301 -----------------------
 arch/arm/dts/stm32mp253.dtsi             |  23 --
 arch/arm/dts/stm32mp255.dtsi             |   9 -
 arch/arm/dts/stm32mp257.dtsi             |   9 -
 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi |  65 +++++
 arch/arm/dts/stm32mp257f-ev1.dts         |  55 -----
 arch/arm/dts/stm32mp25xc.dtsi            |   8 -
 arch/arm/dts/stm32mp25xf.dtsi            |   8 -
 arch/arm/dts/stm32mp25xxai-pinctrl.dtsi  |  83 -------
 arch/arm/dts/stm32mp25xxak-pinctrl.dtsi  |  71 ------
 arch/arm/dts/stm32mp25xxal-pinctrl.dtsi  |  71 ------
 arch/arm/mach-stm32mp/Kconfig            |   1 +
 configs/stm32mp25_defconfig              |   2 +-
 15 files changed, 67 insertions(+), 680 deletions(-)
 delete mode 100644 arch/arm/dts/stm32mp25-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32mp251.dtsi
 delete mode 100644 arch/arm/dts/stm32mp253.dtsi
 delete mode 100644 arch/arm/dts/stm32mp255.dtsi
 delete mode 100644 arch/arm/dts/stm32mp257.dtsi
 delete mode 100644 arch/arm/dts/stm32mp257f-ev1.dts
 delete mode 100644 arch/arm/dts/stm32mp25xc.dtsi
 delete mode 100644 arch/arm/dts/stm32mp25xf.dtsi
 delete mode 100644 arch/arm/dts/stm32mp25xxai-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32mp25xxak-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32mp25xxal-pinctrl.dtsi

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 1e98d95de60..b74277fe6b5 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -1068,9 +1068,6 @@ dtb-$(CONFIG_ASPEED_AST2600) += \
 dtb-$(CONFIG_STM32MP15X) += \
 	stm32mp157c-odyssey.dtb
 
-dtb-$(CONFIG_STM32MP25X) += \
-	stm32mp257f-ev1.dtb
-
 dtb-$(CONFIG_SOC_K3_AM654) += \
 	k3-am654-r5-base-board.dtb
 
diff --git a/arch/arm/dts/stm32mp25-pinctrl.dtsi b/arch/arm/dts/stm32mp25-pinctrl.dtsi
deleted file mode 100644
index d34a1d5e79c..00000000000
--- a/arch/arm/dts/stm32mp25-pinctrl.dtsi
+++ /dev/null
@@ -1,38 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-#include <dt-bindings/pinctrl/stm32-pinfunc.h>
-
-&pinctrl {
-	usart2_pins_a: usart2-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('A', 4, AF6)>; /* USART2_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('A', 8, AF8)>; /* USART2_RX */
-			bias-disable;
-		};
-	};
-
-	usart2_idle_pins_a: usart2-idle-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('A', 4, ANALOG)>; /* USART2_TX */
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('A', 8, AF8)>; /* USART2_RX */
-			bias-disable;
-		};
-	};
-
-	usart2_sleep_pins_a: usart2-sleep-0 {
-		pins {
-			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* USART2_TX */
-				 <STM32_PINMUX('A', 8, ANALOG)>; /* USART2_RX */
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32mp251.dtsi b/arch/arm/dts/stm32mp251.dtsi
deleted file mode 100644
index e2d1c88a57f..00000000000
--- a/arch/arm/dts/stm32mp251.dtsi
+++ /dev/null
@@ -1,301 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-
-/ {
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			compatible = "arm,cortex-a35";
-			device_type = "cpu";
-			reg = <0>;
-			enable-method = "psci";
-		};
-	};
-
-	arm-pmu {
-		compatible = "arm,cortex-a35-pmu";
-		interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu0>;
-		interrupt-parent = <&intc>;
-	};
-
-	arm_wdt: watchdog {
-		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xb200005a>;
-		status = "disabled";
-	};
-
-	clocks {
-		ck_flexgen_08: ck-flexgen-08 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <64000000>;
-		};
-
-		ck_flexgen_51: ck-flexgen-51 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <200000000>;
-		};
-
-		ck_icn_ls_mcu: ck-icn-ls-mcu {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <200000000>;
-		};
-	};
-
-	firmware {
-		optee {
-			compatible = "linaro,optee-tz";
-			method = "smc";
-		};
-
-		scmi {
-			compatible = "linaro,scmi-optee";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			linaro,optee-channel-id = <0>;
-
-			scmi_clk: protocol@14 {
-				reg = <0x14>;
-				#clock-cells = <1>;
-			};
-
-			scmi_reset: protocol@16 {
-				reg = <0x16>;
-				#reset-cells = <1>;
-			};
-		};
-	};
-
-	intc: interrupt-controller@4ac00000 {
-		compatible = "arm,cortex-a7-gic";
-		#interrupt-cells = <3>;
-		#address-cells = <1>;
-		interrupt-controller;
-		reg = <0x0 0x4ac10000 0x0 0x1000>,
-		      <0x0 0x4ac20000 0x0 0x2000>,
-		      <0x0 0x4ac40000 0x0 0x2000>,
-		      <0x0 0x4ac60000 0x0 0x2000>;
-	};
-
-	psci {
-		compatible = "arm,psci-1.0";
-		method = "smc";
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupt-parent = <&intc>;
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-		always-on;
-	};
-
-	soc@0 {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		interrupt-parent = <&intc>;
-		ranges = <0x0 0x0 0x0 0x80000000>;
-
-		rifsc: rifsc-bus@42080000 {
-			compatible = "simple-bus";
-			reg = <0x42080000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			usart2: serial@400e0000 {
-				compatible = "st,stm32h7-uart";
-				reg = <0x400e0000 0x400>;
-				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&ck_flexgen_08>;
-				status = "disabled";
-			};
-		};
-
-		bsec: efuse@44000000 {
-			compatible = "st,stm32mp25-bsec";
-			reg = <0x44000000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			part_number_otp@24 {
-				reg = <0x24 0x4>;
-			};
-
-			package_otp@1e8 {
-				reg = <0x1e8 0x1>;
-				bits = <0 3>;
-			};
-		};
-
-		syscfg: syscon@44230000 {
-			compatible = "st,stm32mp25-syscfg", "syscon";
-			reg = <0x44230000 0x10000>;
-		};
-
-		pinctrl: pinctrl@44240000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "st,stm32mp257-pinctrl";
-			ranges = <0 0x44240000 0xa0400>;
-			pins-are-numbered;
-
-			gpioa: gpio@44240000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x0 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOA";
-				status = "disabled";
-			};
-
-			gpiob: gpio@44250000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x10000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOB";
-				status = "disabled";
-			};
-
-			gpioc: gpio@44260000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x20000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOC";
-				status = "disabled";
-			};
-
-			gpiod: gpio@44270000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x30000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOD";
-				status = "disabled";
-			};
-
-			gpioe: gpio@44280000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x40000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOE";
-				status = "disabled";
-			};
-
-			gpiof: gpio@44290000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x50000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOF";
-				status = "disabled";
-			};
-
-			gpiog: gpio@442a0000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x60000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOG";
-				status = "disabled";
-			};
-
-			gpioh: gpio@442b0000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x70000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOH";
-				status = "disabled";
-			};
-
-			gpioi: gpio@442c0000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x80000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOI";
-				status = "disabled";
-			};
-
-			gpioj: gpio@442d0000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x90000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOJ";
-				status = "disabled";
-			};
-
-			gpiok: gpio@442e0000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0xa0000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOK";
-				status = "disabled";
-			};
-		};
-
-		pinctrl_z: pinctrl@46200000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "st,stm32mp257-z-pinctrl";
-			ranges = <0 0x46200000 0x400>;
-			pins-are-numbered;
-
-			gpioz: gpio@46200000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
-				st,bank-name = "GPIOZ";
-				st,bank-ioport = <11>;
-				status = "disabled";
-			};
-
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32mp253.dtsi b/arch/arm/dts/stm32mp253.dtsi
deleted file mode 100644
index af48e82efe8..00000000000
--- a/arch/arm/dts/stm32mp253.dtsi
+++ /dev/null
@@ -1,23 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-#include "stm32mp251.dtsi"
-
-/ {
-	cpus {
-		cpu1: cpu@1 {
-			compatible = "arm,cortex-a35";
-			device_type = "cpu";
-			reg = <1>;
-			enable-method = "psci";
-		};
-	};
-
-	arm-pmu {
-		interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu0>, <&cpu1>;
-	};
-};
diff --git a/arch/arm/dts/stm32mp255.dtsi b/arch/arm/dts/stm32mp255.dtsi
deleted file mode 100644
index e6fa596211f..00000000000
--- a/arch/arm/dts/stm32mp255.dtsi
+++ /dev/null
@@ -1,9 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-#include "stm32mp253.dtsi"
-
-/ {
-};
diff --git a/arch/arm/dts/stm32mp257.dtsi b/arch/arm/dts/stm32mp257.dtsi
deleted file mode 100644
index 5c5000d3d9d..00000000000
--- a/arch/arm/dts/stm32mp257.dtsi
+++ /dev/null
@@ -1,9 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-#include "stm32mp255.dtsi"
-
-/ {
-};
diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
index a35a9b90388..3beeaa19c12 100644
--- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
@@ -5,8 +5,73 @@
 
 #include "stm32mp25-u-boot.dtsi"
 
+/ {
+	clocks {
+		ck_flexgen_08: ck-flexgen-08 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <64000000>;
+		};
+
+		ck_icn_ls_mcu: ck-icn-ls-mcu {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+		};
+	};
+};
+
+&gpioa {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpiob {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpioc {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpiod {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpioe {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpiof {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpiog {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpioh {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpioi {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpioj {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpiok {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
+&gpioz {
+	clocks = <&ck_icn_ls_mcu>;
+};
+
 &usart2 {
 	bootph-all;
+	clocks = <&ck_flexgen_08>;
 };
 
 &usart2_pins_a {
diff --git a/arch/arm/dts/stm32mp257f-ev1.dts b/arch/arm/dts/stm32mp257f-ev1.dts
deleted file mode 100644
index a88494eed34..00000000000
--- a/arch/arm/dts/stm32mp257f-ev1.dts
+++ /dev/null
@@ -1,55 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/dts-v1/;
-
-#include "stm32mp257.dtsi"
-#include "stm32mp25xf.dtsi"
-#include "stm32mp25-pinctrl.dtsi"
-#include "stm32mp25xxai-pinctrl.dtsi"
-
-/ {
-	model = "STMicroelectronics STM32MP257F-EV1 Evaluation Board";
-	compatible = "st,stm32mp257f-ev1", "st,stm32mp257";
-
-	aliases {
-		serial0 = &usart2;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x0 0x80000000 0x1 0x0>;
-	};
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		fw@80000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x0 0x80000000 0x0 0x4000000>;
-			no-map;
-		};
-	};
-};
-
-&arm_wdt {
-	timeout-sec = <32>;
-	status = "okay";
-};
-
-&usart2 {
-	pinctrl-names = "default", "idle", "sleep";
-	pinctrl-0 = <&usart2_pins_a>;
-	pinctrl-1 = <&usart2_idle_pins_a>;
-	pinctrl-2 = <&usart2_sleep_pins_a>;
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32mp25xc.dtsi b/arch/arm/dts/stm32mp25xc.dtsi
deleted file mode 100644
index 5e83a692648..00000000000
--- a/arch/arm/dts/stm32mp25xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm/dts/stm32mp25xf.dtsi b/arch/arm/dts/stm32mp25xf.dtsi
deleted file mode 100644
index 5e83a692648..00000000000
--- a/arch/arm/dts/stm32mp25xf.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm/dts/stm32mp25xxai-pinctrl.dtsi b/arch/arm/dts/stm32mp25xxai-pinctrl.dtsi
deleted file mode 100644
index abdbc7aebc7..00000000000
--- a/arch/arm/dts/stm32mp25xxai-pinctrl.dtsi
+++ /dev/null
@@ -1,83 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-&pinctrl {
-	st,package = <STM32MP_PKG_AI>;
-
-	gpioa: gpio@44240000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 0 16>;
-	};
-
-	gpiob: gpio@44250000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 16 16>;
-	};
-
-	gpioc: gpio@44260000 {
-		status = "okay";
-		ngpios = <14>;
-		gpio-ranges = <&pinctrl 0 32 14>;
-	};
-
-	gpiod: gpio@44270000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 48 16>;
-	};
-
-	gpioe: gpio@44280000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 64 16>;
-	};
-
-	gpiof: gpio@44290000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 80 16>;
-	};
-
-	gpiog: gpio@442a0000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 96 16>;
-	};
-
-	gpioh: gpio@442b0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 2 114 12>;
-	};
-
-	gpioi: gpio@442c0000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 128 16>;
-	};
-
-	gpioj: gpio@442d0000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 144 16>;
-	};
-
-	gpiok: gpio@442e0000 {
-		status = "okay";
-		ngpios = <8>;
-		gpio-ranges = <&pinctrl 0 160 8>;
-	};
-};
-
-&pinctrl_z {
-	gpioz: gpio@46200000 {
-		status = "okay";
-		ngpios = <10>;
-		gpio-ranges = <&pinctrl_z 0 400 10>;
-	};
-};
diff --git a/arch/arm/dts/stm32mp25xxak-pinctrl.dtsi b/arch/arm/dts/stm32mp25xxak-pinctrl.dtsi
deleted file mode 100644
index 2e0d4d349d1..00000000000
--- a/arch/arm/dts/stm32mp25xxak-pinctrl.dtsi
+++ /dev/null
@@ -1,71 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-&pinctrl {
-	st,package = <STM32MP_PKG_AK>;
-
-	gpioa: gpio@44240000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 0 16>;
-	};
-
-	gpiob: gpio@44250000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 16 16>;
-	};
-
-	gpioc: gpio@44260000 {
-		status = "okay";
-		ngpios = <14>;
-		gpio-ranges = <&pinctrl 0 32 14>;
-	};
-
-	gpiod: gpio@44270000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 48 16>;
-	};
-
-	gpioe: gpio@44280000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 64 16>;
-	};
-
-	gpiof: gpio@44290000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 80 16>;
-	};
-
-	gpiog: gpio@442a0000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 96 16>;
-	};
-
-	gpioh: gpio@442b0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 2 114 12>;
-	};
-
-	gpioi: gpio@442c0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 0 128 12>;
-	};
-};
-
-&pinctrl_z {
-	gpioz: gpio@46200000 {
-		status = "okay";
-		ngpios = <10>;
-		gpio-ranges = <&pinctrl_z 0 400 10>;
-	};
-};
diff --git a/arch/arm/dts/stm32mp25xxal-pinctrl.dtsi b/arch/arm/dts/stm32mp25xxal-pinctrl.dtsi
deleted file mode 100644
index 2406e972554..00000000000
--- a/arch/arm/dts/stm32mp25xxal-pinctrl.dtsi
+++ /dev/null
@@ -1,71 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-&pinctrl {
-	st,package = <STM32MP_PKG_AL>;
-
-	gpioa: gpio@44240000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 0 16>;
-	};
-
-	gpiob: gpio@44250000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 16 16>;
-	};
-
-	gpioc: gpio@44260000 {
-		status = "okay";
-		ngpios = <14>;
-		gpio-ranges = <&pinctrl 0 32 14>;
-	};
-
-	gpiod: gpio@44270000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 48 16>;
-	};
-
-	gpioe: gpio@44280000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 64 16>;
-	};
-
-	gpiof: gpio@44290000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 80 16>;
-	};
-
-	gpiog: gpio@442a0000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 96 16>;
-	};
-
-	gpioh: gpio@442b0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 2 114 12>;
-	};
-
-	gpioi: gpio@442c0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 0 128 12>;
-	};
-};
-
-&pinctrl_z {
-	gpioz: gpio@46200000 {
-		status = "okay";
-		ngpios = <10>;
-		gpio-ranges = <&pinctrl_z 0 400 10>;
-	};
-};
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index ad925201fca..58250901101 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -96,6 +96,7 @@ config STM32MP25X
 	imply CMD_NVEDIT_INFO
 	imply DM_REGULATOR
 	imply DM_REGULATOR_SCMI
+	imply OF_UPSTREAM
 	imply OPTEE
 	imply RESET_SCMI
 	imply SYSRESET_PSCI
diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 4538ff0ff7e..2f8d34d15ff 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -2,7 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
 CONFIG_SYS_MALLOC_F_LEN=0x400000
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x90000000
-CONFIG_DEFAULT_DEVICE_TREE="stm32mp257f-ev1"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp257f-ev1"
 CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SYS_LOAD_ADDR=0x84000000
 CONFIG_STM32MP25X=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
