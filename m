Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF1D7D9BE6
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Oct 2023 16:44:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73248C6C855;
	Fri, 27 Oct 2023 14:44:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BAD0C6C85C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 14:44:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39RCMk4c017745; Fri, 27 Oct 2023 16:44:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=/hlf/zR4ArzC4/pfyRgYpgTg5N4+Kq0VGTzeAF97NTI=; b=aT
 lNRJJalW143ZbbAnT5GFJmNKXWiM7RNolHDtfOs9rz0+wMf9EMxXN4LhhRuN02uK
 GclMgFikgvufvC/UwWviSj1DEE6A/SPtEKjaGuGu6G1sFiO4NqQoDbr0fEnwZ6zQ
 1lilklJgg30+hchMKiziraWkmZq4BeD2XDvoslqi+07a+Ar5kXHI2zR/WDICGS8i
 kZeaJYSL9loxuYfVBJ2UY+WqMxkMILPYGNvUYUS/BUjXYcM+zaIJK7QZZzA7sUAc
 FOw0H0HPGS7mCgCb2l7aaTHX/TSWUWsNSucNz6KAw4IBPNW3jqEcHIGIdYmHwR6B
 UBL2t93EwK/iSMDLhjeg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tywqqc9vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:44:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88A25100062;
 Fri, 27 Oct 2023 16:44:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80C2026DDDB;
 Fri, 27 Oct 2023 16:44:15 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 27 Oct
 2023 16:44:15 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Oct 2023 16:43:03 +0200
Message-ID: <20231027144304.1002307-9-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_13,2023-10-27_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 8/9] ARM: dts: stm32: Add STM32MP257F
	Evaluation board support
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

Add STM32MP257F Evaluation board support. It embeds a STM32MP257FAI SoC,
with 4GB of DDR4, TSN switch (2+1 ports), 2*USB typeA, 1*USB2 typeC,
SNOR OctoSPI, mini PCIe, STPMIC2 for power distribution ...

Sync device tree with kernel v6.6-rc1.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/Makefile                       |   3 +
 arch/arm/dts/stm32mp25-pinctrl.dtsi         |  38 +++
 arch/arm/dts/stm32mp25-u-boot.dtsi          | 102 +++++++
 arch/arm/dts/stm32mp251.dtsi                | 285 ++++++++++++++++++++
 arch/arm/dts/stm32mp253.dtsi                |  23 ++
 arch/arm/dts/stm32mp255.dtsi                |   9 +
 arch/arm/dts/stm32mp257.dtsi                |   9 +
 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi    |  20 ++
 arch/arm/dts/stm32mp257f-ev1.dts            |  55 ++++
 arch/arm/dts/stm32mp25xc.dtsi               |   8 +
 arch/arm/dts/stm32mp25xf.dtsi               |   8 +
 arch/arm/dts/stm32mp25xxai-pinctrl.dtsi     |  83 ++++++
 arch/arm/dts/stm32mp25xxak-pinctrl.dtsi     |  71 +++++
 arch/arm/dts/stm32mp25xxal-pinctrl.dtsi     |  71 +++++
 include/dt-bindings/pinctrl/stm32-pinfunc.h |   3 +
 15 files changed, 788 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp25-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp25-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp251.dtsi
 create mode 100644 arch/arm/dts/stm32mp253.dtsi
 create mode 100644 arch/arm/dts/stm32mp255.dtsi
 create mode 100644 arch/arm/dts/stm32mp257.dtsi
 create mode 100644 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp257f-ev1.dts
 create mode 100644 arch/arm/dts/stm32mp25xc.dtsi
 create mode 100644 arch/arm/dts/stm32mp25xf.dtsi
 create mode 100644 arch/arm/dts/stm32mp25xxai-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp25xxak-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp25xxal-pinctrl.dtsi

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 96066a2b6b8..387e9f30378 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -1348,6 +1348,9 @@ dtb-$(CONFIG_STM32MP15x) += \
 	stm32mp15xx-dhcor-drc-compact.dtb \
 	stm32mp15xx-dhcor-testbench.dtb
 
+dtb-$(CONFIG_STM32MP25X) += \
+	stm32mp257f-ev1.dtb
+
 dtb-$(CONFIG_SOC_K3_AM654) += \
 	k3-am654-base-board.dtb \
 	k3-am654-r5-base-board.dtb \
diff --git a/arch/arm/dts/stm32mp25-pinctrl.dtsi b/arch/arm/dts/stm32mp25-pinctrl.dtsi
new file mode 100644
index 00000000000..d34a1d5e79c
--- /dev/null
+++ b/arch/arm/dts/stm32mp25-pinctrl.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
+&pinctrl {
+	usart2_pins_a: usart2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 4, AF6)>; /* USART2_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 8, AF8)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_idle_pins_a: usart2-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>; /* USART2_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 8, AF8)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_a: usart2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 8, ANALOG)>; /* USART2_RX */
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32mp25-u-boot.dtsi b/arch/arm/dts/stm32mp25-u-boot.dtsi
new file mode 100644
index 00000000000..f4f26add2a4
--- /dev/null
+++ b/arch/arm/dts/stm32mp25-u-boot.dtsi
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright : STMicroelectronics 2023
+ */
+
+/ {
+	aliases {
+		gpio0 = &gpioa;
+		gpio1 = &gpiob;
+		gpio2 = &gpioc;
+		gpio3 = &gpiod;
+		gpio4 = &gpioe;
+		gpio5 = &gpiof;
+		gpio6 = &gpiog;
+		gpio7 = &gpioh;
+		gpio8 = &gpioi;
+		gpio9 = &gpioj;
+		gpio10 = &gpiok;
+		gpio25 = &gpioz;
+		pinctrl0 = &pinctrl;
+		pinctrl1 = &pinctrl_z;
+	};
+
+	firmware {
+		optee {
+			bootph-all;
+		};
+	};
+
+	/* need PSCI for sysreset during board_f */
+	psci {
+		bootph-all;
+	};
+
+	soc@0 {
+		bootph-all;
+	};
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
+&syscfg {
+	bootph-all;
+};
diff --git a/arch/arm/dts/stm32mp251.dtsi b/arch/arm/dts/stm32mp251.dtsi
new file mode 100644
index 00000000000..cf2f28dc158
--- /dev/null
+++ b/arch/arm/dts/stm32mp251.dtsi
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a35";
+			device_type = "cpu";
+			reg = <0>;
+			enable-method = "psci";
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a35-pmu";
+		interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>;
+		interrupt-parent = <&intc>;
+	};
+
+	arm_wdt: watchdog {
+		compatible = "arm,smc-wdt";
+		arm,smc-id = <0xb200005a>;
+		status = "disabled";
+	};
+
+	clocks {
+		ck_flexgen_08: ck-flexgen-08 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <100000000>;
+		};
+
+		ck_flexgen_51: ck-flexgen-51 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+		};
+
+		ck_icn_ls_mcu: ck-icn-ls-mcu {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		scmi {
+			compatible = "linaro,scmi-optee";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			linaro,optee-channel-id = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+	};
+
+	intc: interrupt-controller@4ac00000 {
+		compatible = "arm,cortex-a7-gic";
+		#interrupt-cells = <3>;
+		#address-cells = <1>;
+		interrupt-controller;
+		reg = <0x0 0x4ac10000 0x0 0x1000>,
+		      <0x0 0x4ac20000 0x0 0x2000>,
+		      <0x0 0x4ac40000 0x0 0x2000>,
+		      <0x0 0x4ac60000 0x0 0x2000>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+		ranges = <0x0 0x0 0x0 0x80000000>;
+
+		rifsc: rifsc-bus@42080000 {
+			compatible = "simple-bus";
+			reg = <0x42080000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			usart2: serial@400e0000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x400e0000 0x400>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&ck_flexgen_08>;
+				status = "disabled";
+			};
+		};
+
+		syscfg: syscon@44230000 {
+			compatible = "st,stm32mp25-syscfg", "syscon";
+			reg = <0x44230000 0x10000>;
+		};
+
+		pinctrl: pinctrl@44240000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "st,stm32mp257-pinctrl";
+			ranges = <0 0x44240000 0xa0400>;
+			pins-are-numbered;
+
+			gpioa: gpio@44240000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x0 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOA";
+				status = "disabled";
+			};
+
+			gpiob: gpio@44250000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x10000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOB";
+				status = "disabled";
+			};
+
+			gpioc: gpio@44260000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x20000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOC";
+				status = "disabled";
+			};
+
+			gpiod: gpio@44270000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x30000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOD";
+				status = "disabled";
+			};
+
+			gpioe: gpio@44280000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x40000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOE";
+				status = "disabled";
+			};
+
+			gpiof: gpio@44290000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x50000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOF";
+				status = "disabled";
+			};
+
+			gpiog: gpio@442a0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x60000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOG";
+				status = "disabled";
+			};
+
+			gpioh: gpio@442b0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x70000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOH";
+				status = "disabled";
+			};
+
+			gpioi: gpio@442c0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x80000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOI";
+				status = "disabled";
+			};
+
+			gpioj: gpio@442d0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x90000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOJ";
+				status = "disabled";
+			};
+
+			gpiok: gpio@442e0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0xa0000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOK";
+				status = "disabled";
+			};
+		};
+
+		pinctrl_z: pinctrl@46200000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "st,stm32mp257-z-pinctrl";
+			ranges = <0 0x46200000 0x400>;
+			pins-are-numbered;
+
+			gpioz: gpio@46200000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOZ";
+				st,bank-ioport = <11>;
+				status = "disabled";
+			};
+
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32mp253.dtsi b/arch/arm/dts/stm32mp253.dtsi
new file mode 100644
index 00000000000..af48e82efe8
--- /dev/null
+++ b/arch/arm/dts/stm32mp253.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include "stm32mp251.dtsi"
+
+/ {
+	cpus {
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a35";
+			device_type = "cpu";
+			reg = <1>;
+			enable-method = "psci";
+		};
+	};
+
+	arm-pmu {
+		interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+};
diff --git a/arch/arm/dts/stm32mp255.dtsi b/arch/arm/dts/stm32mp255.dtsi
new file mode 100644
index 00000000000..e6fa596211f
--- /dev/null
+++ b/arch/arm/dts/stm32mp255.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include "stm32mp253.dtsi"
+
+/ {
+};
diff --git a/arch/arm/dts/stm32mp257.dtsi b/arch/arm/dts/stm32mp257.dtsi
new file mode 100644
index 00000000000..5c5000d3d9d
--- /dev/null
+++ b/arch/arm/dts/stm32mp257.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include "stm32mp255.dtsi"
+
+/ {
+};
diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
new file mode 100644
index 00000000000..a35a9b90388
--- /dev/null
+++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ */
+
+#include "stm32mp25-u-boot.dtsi"
+
+&usart2 {
+	bootph-all;
+};
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/dts/stm32mp257f-ev1.dts b/arch/arm/dts/stm32mp257f-ev1.dts
new file mode 100644
index 00000000000..a88494eed34
--- /dev/null
+++ b/arch/arm/dts/stm32mp257f-ev1.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/dts-v1/;
+
+#include "stm32mp257.dtsi"
+#include "stm32mp25xf.dtsi"
+#include "stm32mp25-pinctrl.dtsi"
+#include "stm32mp25xxai-pinctrl.dtsi"
+
+/ {
+	model = "STMicroelectronics STM32MP257F-EV1 Evaluation Board";
+	compatible = "st,stm32mp257f-ev1", "st,stm32mp257";
+
+	aliases {
+		serial0 = &usart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x1 0x0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		fw@80000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80000000 0x0 0x4000000>;
+			no-map;
+		};
+	};
+};
+
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&usart2 {
+	pinctrl-names = "default", "idle", "sleep";
+	pinctrl-0 = <&usart2_pins_a>;
+	pinctrl-1 = <&usart2_idle_pins_a>;
+	pinctrl-2 = <&usart2_sleep_pins_a>;
+	status = "okay";
+};
diff --git a/arch/arm/dts/stm32mp25xc.dtsi b/arch/arm/dts/stm32mp25xc.dtsi
new file mode 100644
index 00000000000..5e83a692648
--- /dev/null
+++ b/arch/arm/dts/stm32mp25xc.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/ {
+};
diff --git a/arch/arm/dts/stm32mp25xf.dtsi b/arch/arm/dts/stm32mp25xf.dtsi
new file mode 100644
index 00000000000..5e83a692648
--- /dev/null
+++ b/arch/arm/dts/stm32mp25xf.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/ {
+};
diff --git a/arch/arm/dts/stm32mp25xxai-pinctrl.dtsi b/arch/arm/dts/stm32mp25xxai-pinctrl.dtsi
new file mode 100644
index 00000000000..abdbc7aebc7
--- /dev/null
+++ b/arch/arm/dts/stm32mp25xxai-pinctrl.dtsi
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AI>;
+
+	gpioa: gpio@44240000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@44250000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@44260000 {
+		status = "okay";
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+	};
+
+	gpiod: gpio@44270000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@44280000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@44290000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@442a0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@442b0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 2 114 12>;
+	};
+
+	gpioi: gpio@442c0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 128 16>;
+	};
+
+	gpioj: gpio@442d0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 144 16>;
+	};
+
+	gpiok: gpio@442e0000 {
+		status = "okay";
+		ngpios = <8>;
+		gpio-ranges = <&pinctrl 0 160 8>;
+	};
+};
+
+&pinctrl_z {
+	gpioz: gpio@46200000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl_z 0 400 10>;
+	};
+};
diff --git a/arch/arm/dts/stm32mp25xxak-pinctrl.dtsi b/arch/arm/dts/stm32mp25xxak-pinctrl.dtsi
new file mode 100644
index 00000000000..2e0d4d349d1
--- /dev/null
+++ b/arch/arm/dts/stm32mp25xxak-pinctrl.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AK>;
+
+	gpioa: gpio@44240000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@44250000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@44260000 {
+		status = "okay";
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+	};
+
+	gpiod: gpio@44270000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@44280000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@44290000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@442a0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@442b0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 2 114 12>;
+	};
+
+	gpioi: gpio@442c0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 0 128 12>;
+	};
+};
+
+&pinctrl_z {
+	gpioz: gpio@46200000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl_z 0 400 10>;
+	};
+};
diff --git a/arch/arm/dts/stm32mp25xxal-pinctrl.dtsi b/arch/arm/dts/stm32mp25xxal-pinctrl.dtsi
new file mode 100644
index 00000000000..2406e972554
--- /dev/null
+++ b/arch/arm/dts/stm32mp25xxal-pinctrl.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AL>;
+
+	gpioa: gpio@44240000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@44250000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@44260000 {
+		status = "okay";
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+	};
+
+	gpiod: gpio@44270000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@44280000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@44290000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@442a0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@442b0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 2 114 12>;
+	};
+
+	gpioi: gpio@442c0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 0 128 12>;
+	};
+};
+
+&pinctrl_z {
+	gpioz: gpio@46200000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl_z 0 400 10>;
+	};
+};
diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
index e6fb8ada3f4..28ad0235086 100644
--- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
+++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
@@ -37,6 +37,9 @@
 #define STM32MP_PKG_AB	0x2
 #define STM32MP_PKG_AC	0x4
 #define STM32MP_PKG_AD	0x8
+#define STM32MP_PKG_AI	0x100
+#define STM32MP_PKG_AK	0x400
+#define STM32MP_PKG_AL	0x800
 
 #endif /* _DT_BINDINGS_STM32_PINFUNC_H */
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
