Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 393477AEF39
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 17:09:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD823C6B479;
	Tue, 26 Sep 2023 15:09:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E23FC6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 15:09:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38QF8mah003009; Tue, 26 Sep 2023 17:09:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=rUIrzMNQoZKNH8x92R/xCgZ9bqmivxX/RzXmBb+e2SQ=; b=EC
 oS1KCdBRaeumBo2yxyORtfSuVQdTi23AxCQgvUzJoTvaaodgfzg2srxv879Vm2gN
 BVPv1EDnDOYwomVfaGt7WgkULmwQtSqJC8gTpPbyBgZgatTpiLGy2UeG6ubC92sm
 C4D8jxTxp09E5QlV8ALl4TPydlT9gwzTkJPvVIaWqH4zof69j9KheU4+tA24aBb1
 d4USnayJG0UTOYxyFvtol9u1/CsPB++MrLWDOQDQF78nj3bn0dT97WduIvh7RwkH
 uvAZFQ86CLqKZMXctUvjDbxxp/5dyglfNZO/b4AarzPw4oSWPDNFUPprc8mKuCTq
 D3DwJe0I9744hMY+vOhg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9nefnam2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 17:09:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBD61100062;
 Tue, 26 Sep 2023 17:09:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B23612C41E8;
 Tue, 26 Sep 2023 17:09:28 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 17:09:28 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Sep 2023 17:09:18 +0200
Message-ID: <20230926150924.1150082-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_12,2023-09-26_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 1/6] ARM: dts: stm32mp: alignment with
	v6.6-rc1
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

Device tree alignment with Linux kernel v6.6.rc1.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp131.dtsi                  |  52 +--
 arch/arm/dts/stm32mp135f-dk.dts               |  68 ++--
 arch/arm/dts/stm32mp15-pinctrl.dtsi           | 364 +++++++++++++++++-
 arch/arm/dts/stm32mp15-scmi.dtsi              |   7 +-
 arch/arm/dts/stm32mp151.dtsi                  |  34 +-
 arch/arm/dts/stm32mp157.dtsi                  |  15 +-
 arch/arm/dts/stm32mp157a-dk1-scmi.dts         |   7 +-
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts |   3 +
 arch/arm/dts/stm32mp157c-dk2-scmi.dts         |   7 +-
 arch/arm/dts/stm32mp157c-dk2.dts              |  30 +-
 arch/arm/dts/stm32mp157c-ed1-scmi.dts         |   7 +-
 arch/arm/dts/stm32mp157c-ed1.dts              |  24 +-
 arch/arm/dts/stm32mp157c-ev1-scmi.dts         |   7 +-
 arch/arm/dts/stm32mp157c-ev1.dts              |  34 +-
 arch/arm/dts/stm32mp15xx-dkx.dtsi             |  42 +-
 include/dt-bindings/clock/stm32mp1-clks.h     |   2 +-
 include/dt-bindings/clock/stm32mp13-clks.h    |   2 +-
 .../regulator/st,stm32mp13-regulator.h        |  42 ++
 include/dt-bindings/reset/stm32mp1-resets.h   |   2 +-
 include/dt-bindings/reset/stm32mp13-resets.h  |   2 +-
 20 files changed, 585 insertions(+), 166 deletions(-)
 create mode 100644 include/dt-bindings/regulator/st,stm32mp13-regulator.h

diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index d23bbc3639d..ac90fcbf0c0 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -33,6 +33,8 @@
 		optee {
 			method = "smc";
 			compatible = "linaro,optee-tz";
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
 		scmi: scmi {
@@ -50,6 +52,28 @@
 				reg = <0x16>;
 				#reset-cells = <1>;
 			};
+
+			scmi_voltd: protocol@17 {
+				reg = <0x17>;
+
+				scmi_regu: regulators {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					scmi_reg11: regulator@0 {
+						reg = <VOLTD_SCMI_REG11>;
+						regulator-name = "reg11";
+					};
+					scmi_reg18: regulator@1 {
+						reg = <VOLTD_SCMI_REG18>;
+						regulator-name = "reg18";
+					};
+					scmi_usb33: regulator@2 {
+						reg = <VOLTD_SCMI_USB33>;
+						regulator-name = "usb33";
+					};
+				};
+			};
 		};
 	};
 
@@ -76,28 +100,6 @@
 		always-on;
 	};
 
-	/* PWR 1v1, 1v8 and 3v3 regulators defined as fixed, waiting for SCMI */
-	reg11: reg11 {
-		compatible = "regulator-fixed";
-		regulator-name = "reg11";
-		regulator-min-microvolt = <1100000>;
-		regulator-max-microvolt = <1100000>;
-	};
-
-	reg18: reg18 {
-		compatible = "regulator-fixed";
-		regulator-name = "reg18";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
-	usb33: usb33 {
-		compatible = "regulator-fixed";
-		regulator-name = "usb33";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -799,7 +801,7 @@
 			g-tx-fifo-size = <256 16 16 16 16 16 16 16>;
 			dr_mode = "otg";
 			otg-rev = <0x200>;
-			usb33d-supply = <&usb33>;
+			usb33d-supply = <&scmi_usb33>;
 			status = "disabled";
 		};
 
@@ -1329,8 +1331,8 @@
 			reg = <0x5a006000 0x1000>;
 			clocks = <&rcc USBPHY_K>;
 			resets = <&rcc USBPHY_R>;
-			vdda1v1-supply = <&reg11>;
-			vdda1v8-supply = <&reg18>;
+			vdda1v1-supply = <&scmi_reg11>;
+			vdda1v8-supply = <&scmi_reg18>;
 			status = "disabled";
 
 			usbphyc_port0: usb-phy@0 {
diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
index f0900ca672b..eea740d097c 100644
--- a/arch/arm/dts/stm32mp135f-dk.dts
+++ b/arch/arm/dts/stm32mp135f-dk.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/st,stm32mp13-regulator.h>
 #include "stm32mp135.dtsi"
 #include "stm32mp13xf.dtsi"
 #include "stm32mp13-pinctrl.dtsi"
@@ -65,45 +66,13 @@
 			default-state = "off";
 		};
 	};
-
-	v3v3_sw: v3v3-sw {
-		compatible = "regulator-fixed";
-		regulator-name = "v3v3_sw";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
-	vdd_adc: vdd-adc {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_adc";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
-	vdd_sd: vdd-sd {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_sd";
-		regulator-min-microvolt = <2900000>;
-		regulator-max-microvolt = <2900000>;
-		regulator-always-on;
-	};
-
-	vdd_usb: vdd-usb {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_usb";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
 };
 
 &adc_1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&adc1_usb_cc_pins_a>;
-	vdda-supply = <&vdd_adc>;
-	vref-supply = <&vdd_adc>;
+	vdda-supply = <&scmi_vdd_adc>;
+	vref-supply = <&scmi_vdd_adc>;
 	status = "okay";
 	adc1: adc@0 {
 		status = "okay";
@@ -195,6 +164,29 @@
 	status = "okay";
 };
 
+&scmi_regu {
+	scmi_vdd_adc: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO1>;
+		regulator-name = "vdd_adc";
+	};
+	scmi_vdd_usb: regulator@13 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO4>;
+		regulator-name = "vdd_usb";
+	};
+	scmi_vdd_sd: regulator@14 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO5>;
+		regulator-name = "vdd_sd";
+	};
+	scmi_v1v8_periph: regulator@15 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO6>;
+		regulator-name = "v1v8_periph";
+	};
+	scmi_v3v3_sw: regulator@19 {
+		reg = <VOLTD_SCMI_STPMIC1_PWR_SW2>;
+		regulator-name = "v3v3_sw";
+	};
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
@@ -204,7 +196,7 @@
 	disable-wp;
 	st,neg-edge;
 	bus-width = <4>;
-	vmmc-supply = <&vdd_sd>;
+	vmmc-supply = <&scmi_vdd_sd>;
 	status = "okay";
 };
 
@@ -321,7 +313,7 @@
 	hub@1 {
 		compatible = "usb424,2514";
 		reg = <1>;
-		vdd-supply = <&v3v3_sw>;
+		vdd-supply = <&scmi_v3v3_sw>;
 	};
 };
 
@@ -342,7 +334,7 @@
 };
 
 &usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
+	phy-supply = <&scmi_vdd_usb>;
 	st,current-boost-microamp = <1000>;
 	st,decrease-hs-slew-rate;
 	st,tune-hs-dc-level = <2>;
@@ -356,7 +348,7 @@
 };
 
 &usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
+	phy-supply = <&scmi_vdd_usb>;
 	st,current-boost-microamp = <1000>;
 	st,decrease-hs-slew-rate;
 	st,tune-hs-dc-level = <2>;
diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index e86d989dd35..098153ee99a 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -6,6 +6,17 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	adc1_ain_pins_a: adc1-ain-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* ADC1_INP2 */
+				 <STM32_PINMUX('B', 1, ANALOG)>, /* ADC1_INP5 */
+				 <STM32_PINMUX('B', 0, ANALOG)>, /* ADC1_INP9 */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* ADC1_INP10 */
+				 <STM32_PINMUX('C', 3, ANALOG)>, /* ADC1_INP13 */
+				 <STM32_PINMUX('A', 3, ANALOG)>; /* ADC1_INP15 */
+		};
+	};
+
 	adc1_in6_pins_a: adc1-in6-0 {
 		pins {
 			pinmux = <STM32_PINMUX('F', 12, ANALOG)>;
@@ -341,6 +352,96 @@
 		};
 	};
 
+	ethernet0_rgmii_pins_d: rgmii-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('G', 13, AF11)>,	/* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, AF11)>,	/* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('B', 11, AF11)>,	/* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 6, AF11)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
+				 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+	};
+
+	ethernet0_rgmii_sleep_pins_d: rgmii-sleep-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 1, ANALOG)>, /* ETH_RGMII_RX_CLK */
+				 <STM32_PINMUX('A', 7, ANALOG)>; /* ETH_RGMII_RX_CTL */
+		};
+	};
+
+	ethernet0_rgmii_pins_e: rgmii-4 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('B', 11, AF11)>; /* ETH_RGMII_TX_CTL */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 6, AF11)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 7, AF11)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
+				 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+	};
+
+	ethernet0_rgmii_sleep_pins_e: rgmii-sleep-4 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 7, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 1, ANALOG)>, /* ETH_RGMII_RX_CLK */
+				 <STM32_PINMUX('A', 7, ANALOG)>; /* ETH_RGMII_RX_CTL */
+		};
+	};
+
 	ethernet0_rmii_pins_a: rmii-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH1_RMII_TXD0 */
@@ -1104,6 +1205,20 @@
 		};
 	};
 
+	pwm1_pins_c: pwm1-2 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 11, AF1)>; /* TIM1_CH2 */
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm1_sleep_pins_c: pwm1-sleep-2 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 11, ANALOG)>; /* TIM1_CH2 */
+		};
+	};
+
 	pwm2_pins_a: pwm2-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 3, AF1)>; /* TIM2_CH4 */
@@ -1230,6 +1345,26 @@
 		};
 	};
 
+	pwm8_pins_b: pwm8-1 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 5, AF3)>, /* TIM8_CH1 */
+				 <STM32_PINMUX('I', 6, AF3)>, /* TIM8_CH2 */
+				 <STM32_PINMUX('I', 7, AF3)>, /* TIM8_CH3 */
+				 <STM32_PINMUX('C', 9, AF3)>; /* TIM8_CH4 */
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm8_sleep_pins_b: pwm8-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 5, ANALOG)>, /* TIM8_CH1 */
+				 <STM32_PINMUX('I', 6, ANALOG)>, /* TIM8_CH2 */
+				 <STM32_PINMUX('I', 7, ANALOG)>, /* TIM8_CH3 */
+				 <STM32_PINMUX('C', 9, ANALOG)>; /* TIM8_CH4 */
+		};
+	};
+
 	pwm12_pins_a: pwm12-0 {
 		pins {
 			pinmux = <STM32_PINMUX('H', 6, AF2)>; /* TIM12_CH1 */
@@ -1441,6 +1576,30 @@
 		};
 	};
 
+	sai2b_pins_d: sai2b-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 2, AF10)>, /* SAI2_SCK_B */
+				 <STM32_PINMUX('C', 0, AF8)>, /* SAI2_FS_B */
+				 <STM32_PINMUX('H', 3, AF10)>; /* SAI2_MCLK_B */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
+			bias-disable;
+		};
+	};
+
+	sai2b_sleep_pins_d: sai2b-sleep-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* SAI2_SCK_B */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* SAI2_FS_B */
+				 <STM32_PINMUX('H', 3, ANALOG)>, /* SAI2_MCLK_B */
+				 <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
+		};
+	};
+
 	sai4a_pins_a: sai4a-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 5, AF10)>; /* SAI4_SD_A */
@@ -1522,6 +1681,60 @@
 		};
 	};
 
+	sdmmc1_b4_pins_b: sdmmc1-b4-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('E', 6, AF8)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sdmmc1_b4_od_pins_b: sdmmc1-b4-od-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('E', 6, AF8)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
+	sdmmc1_b4_sleep_pins_b: sdmmc1-b4-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
+				 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
+		};
+	};
+
 	sdmmc1_dir_pins_a: sdmmc1-dir-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
@@ -1531,7 +1744,7 @@
 			drive-push-pull;
 			bias-pull-up;
 		};
-		pins2{
+		pins2 {
 			pinmux = <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
 			bias-pull-up;
 		};
@@ -1566,7 +1779,7 @@
 			drive-push-pull;
 			bias-pull-up;
 		};
-		pins2{
+		pins2 {
 			pinmux = <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
 			bias-pull-up;
 		};
@@ -1759,6 +1972,27 @@
 		};
 	};
 
+	sdmmc2_d47_pins_e: sdmmc2-d47-4 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, AF9)>,	/* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 9, AF10)>,	/* SDMMC2_D5 */
+				 <STM32_PINMUX('C', 6, AF10)>,	/* SDMMC2_D6 */
+				 <STM32_PINMUX('D', 3, AF9)>;	/* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	sdmmc2_d47_sleep_pins_e: sdmmc2-d47-sleep-4 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('D', 3, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	sdmmc3_b4_pins_a: sdmmc3-b4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
@@ -1925,6 +2159,20 @@
 		};
 	};
 
+	spi2_pins_c: spi2-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
+				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
+			bias-disable;
+			drive-push-pull;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
+			bias-pull-down;
+		};
+	};
+
 	spi4_pins_a: spi4-0 {
 		pins {
 			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
@@ -1939,6 +2187,21 @@
 		};
 	};
 
+	spi5_pins_a: spi5-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 7, AF5)>, /* SPI5_SCK */
+				 <STM32_PINMUX('F', 9, AF5)>; /* SPI5_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 8, AF5)>; /* SPI5_MISO */
+			bias-disable;
+		};
+	};
+
 	stusb1600_pins_a: stusb1600-0 {
 		pins {
 			pinmux = <STM32_PINMUX('I', 11, GPIO)>;
@@ -2124,6 +2387,33 @@
 		};
 	};
 
+	usart1_pins_a: usart1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* USART1_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 11, AF7)>; /* USART1_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart1_idle_pins_a: usart1-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>, /* USART1_RTS */
+				 <STM32_PINMUX('A', 11, AF7)>; /* USART1_CTS_NSS */
+		};
+	};
+
+	usart1_sleep_pins_a: usart1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>, /* USART1_RTS */
+				 <STM32_PINMUX('A', 11, ANALOG)>; /* USART1_CTS_NSS */
+		};
+	};
+
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
@@ -2226,6 +2516,23 @@
 		};
 	};
 
+	usart3_idle_pins_a: usart3-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>; /* USART3_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
+			bias-disable;
+		};
+	};
+
+	usart3_sleep_pins_a: usart3-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART3_RX */
+		};
+	};
+
 	usart3_pins_b: usart3-1 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
@@ -2385,6 +2692,21 @@
 		};
 	};
 
+	usart3_pins_f: usart3-5 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
+				 <STM32_PINMUX('D', 12, AF7)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
+				 <STM32_PINMUX('D', 11, AF7)>; /* USART3_CTS_NSS */
+			bias-disable;
+		};
+	};
+
 	usbotg_hs_pins_a: usbotg-hs-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
@@ -2463,4 +2785,42 @@
 			bias-disable;
 		};
 	};
+
+	spi1_sleep_pins_a: spi1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* SPI1_SCK */
+				 <STM32_PINMUX('Z', 1, ANALOG)>, /* SPI1_MISO */
+				 <STM32_PINMUX('Z', 2, ANALOG)>; /* SPI1_MOSI */
+		};
+	};
+
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('Z', 7, AF7)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('Z', 6, AF7)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('Z', 7, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('Z', 6, AF7)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 7, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('Z', 6, ANALOG)>; /* USART1_RX */
+		};
+	};
 };
diff --git a/arch/arm/dts/stm32mp15-scmi.dtsi b/arch/arm/dts/stm32mp15-scmi.dtsi
index ad2584213d9..dc3b09f2f2a 100644
--- a/arch/arm/dts/stm32mp15-scmi.dtsi
+++ b/arch/arm/dts/stm32mp15-scmi.dtsi
@@ -34,22 +34,21 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					scmi_reg11: reg11@0 {
+					scmi_reg11: regulator@0 {
 						reg = <0>;
 						regulator-name = "reg11";
 						regulator-min-microvolt = <1100000>;
 						regulator-max-microvolt = <1100000>;
 					};
 
-					scmi_reg18: reg18@1 {
-						voltd-name = "reg18";
+					scmi_reg18: regulator@1 {
 						reg = <1>;
 						regulator-name = "reg18";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
 					};
 
-					scmi_usb33: usb33@2 {
+					scmi_usb33: regulator@2 {
 						reg = <2>;
 						regulator-name = "usb33";
 						regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index 21d11be328c..e277140d36b 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -1111,6 +1111,8 @@
 			adc1: adc@0 {
 				compatible = "st,stm32mp1-adc";
 				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x0>;
 				interrupt-parent = <&adc>;
 				interrupts = <0>;
@@ -1122,12 +1124,24 @@
 			adc2: adc@100 {
 				compatible = "st,stm32mp1-adc";
 				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x100>;
 				interrupt-parent = <&adc>;
 				interrupts = <1>;
 				dmas = <&dmamux1 10 0x400 0x01>;
 				dma-names = "rx";
+				nvmem-cells = <&vrefint>;
+				nvmem-cell-names = "vrefint";
 				status = "disabled";
+				channel@13 {
+					reg = <13>;
+					label = "vrefint";
+				};
+				channel@14 {
+					reg = <14>;
+					label = "vddcore";
+				};
 			};
 		};
 
@@ -1162,14 +1176,6 @@
 			status = "disabled";
 		};
 
-		hwspinlock: hwspinlock@4c000000 {
-			compatible = "st,stm32-hwspinlock";
-			#hwlock-cells = <1>;
-			reg = <0x4c000000 0x400>;
-			clocks = <&rcc HSEM>;
-			clock-names = "hwspinlock";
-		};
-
 		ipcc: mailbox@4c001000 {
 			compatible = "st,stm32mp1-ipcc";
 			#mbox-cells = <1>;
@@ -1559,11 +1565,6 @@
 			clock-names = "lcd";
 			resets = <&rcc LTDC_R>;
 			status = "disabled";
-
-			port {
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
 		};
 
 		iwdg2: watchdog@5a002000 {
@@ -1650,9 +1651,12 @@
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			part_number_otp: part_number_otp@4 {
+			part_number_otp: part-number-otp@4 {
 				reg = <0x4 0x1>;
 			};
+			vrefint: vrefin-cal@52 {
+				reg = <0x52 0x2>;
+			};
 			ts_cal1: calib@5c {
 				reg = <0x5c 0x2>;
 			};
@@ -1853,8 +1857,8 @@
 			      <0x30000000 0x40000>,
 			      <0x38000000 0x10000>;
 			resets = <&rcc MCU_R>;
+			reset-names = "mcu_rst";
 			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
-			st,syscfg-tz = <&rcc 0x000 0x1>;
 			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
 			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
 			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
diff --git a/arch/arm/dts/stm32mp157.dtsi b/arch/arm/dts/stm32mp157.dtsi
index 54e73ccea44..6197d878894 100644
--- a/arch/arm/dts/stm32mp157.dtsi
+++ b/arch/arm/dts/stm32mp157.dtsi
@@ -22,15 +22,26 @@
 			reg = <0x5a000000 0x800>;
 			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
 			clock-names = "pclk", "ref", "px_clk";
+			phy-dsi-supply = <&reg18>;
 			resets = <&rcc DSI_R>;
 			reset-names = "apb";
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out: endpoint {
+					};
+				};
 			};
 		};
 	};
diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi.dts b/arch/arm/dts/stm32mp157a-dk1-scmi.dts
index e539cc80bef..afcd6285890 100644
--- a/arch/arm/dts/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/dts/stm32mp157a-dk1-scmi.dts
@@ -55,8 +55,11 @@
 	resets = <&scmi_reset RST_SCMI_MDMA>;
 };
 
-&mlahb {
-	resets = <&scmi_reset RST_SCMI_MCU>;
+&m4_rproc {
+	/delete-property/ st,syscfg-holdboot;
+	resets = <&scmi_reset RST_SCMI_MCU>,
+		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
+	reset-names =  "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
index fae656edd82..f4a49429852 100644
--- a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -81,6 +81,9 @@
 	status = "okay";
 
 	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		ltdc_ep0_out: endpoint@0 {
 			reg = <0>;
 			remote-endpoint = <&panel_in>;
diff --git a/arch/arm/dts/stm32mp157c-dk2-scmi.dts b/arch/arm/dts/stm32mp157c-dk2-scmi.dts
index 97e4f94b0a2..39358d90200 100644
--- a/arch/arm/dts/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/dts/stm32mp157c-dk2-scmi.dts
@@ -61,8 +61,11 @@
 	resets = <&scmi_reset RST_SCMI_MDMA>;
 };
 
-&mlahb {
-	resets = <&scmi_reset RST_SCMI_MCU>;
+&m4_rproc {
+	/delete-property/ st,syscfg-holdboot;
+	resets = <&scmi_reset RST_SCMI_MCU>,
+		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
+	reset-names =  "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/dts/stm32mp157c-dk2.dts b/arch/arm/dts/stm32mp157c-dk2.dts
index ab13e340f4e..510cca5acb7 100644
--- a/arch/arm/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/dts/stm32mp157c-dk2.dts
@@ -31,24 +31,9 @@
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
-	phy-dsi-supply = <&reg18>;
-
-	ports {
-		port@0 {
-			reg = <0>;
-			dsi_in: endpoint {
-				remote-endpoint = <&ltdc_ep1_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-			dsi_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
 
 	panel@0 {
 		compatible = "orisetech,otm8009a";
@@ -65,6 +50,14 @@
 	};
 };
 
+&dsi_in {
+	remote-endpoint = <&ltdc_ep1_out>;
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
 &i2c1 {
 	touchscreen@38 {
 		compatible = "focaltech,ft6236";
@@ -82,6 +75,9 @@
 	status = "okay";
 
 	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		ltdc_ep1_out: endpoint@1 {
 			reg = <1>;
 			remote-endpoint = <&dsi_in>;
diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi.dts b/arch/arm/dts/stm32mp157c-ed1-scmi.dts
index 9cf0a44d2f4..07ea765a455 100644
--- a/arch/arm/dts/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/dts/stm32mp157c-ed1-scmi.dts
@@ -60,8 +60,11 @@
 	resets = <&scmi_reset RST_SCMI_MDMA>;
 };
 
-&mlahb {
-	resets = <&scmi_reset RST_SCMI_MCU>;
+&m4_rproc {
+	/delete-property/ st,syscfg-holdboot;
+	resets = <&scmi_reset RST_SCMI_MCU>,
+		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
+	reset-names =  "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index 3541a17dceb..66ed5f9921b 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -103,21 +103,23 @@
 	vref-supply = <&vdda>;
 	status = "disabled";
 	adc1: adc@0 {
-		st,adc-channels = <0 1 6>;
-		/* 16.5 ck_cycles sampling time */
-		st,min-sample-time-nsecs = <400>;
 		status = "okay";
+		channel@0 {
+			reg = <0>;
+			/* 16.5 ck_cycles sampling time */
+			st,min-sample-time-ns = <400>;
+		};
+		channel@1 {
+			reg = <1>;
+			st,min-sample-time-ns = <400>;
+		};
+		channel@6 {
+			reg = <6>;
+			st,min-sample-time-ns = <400>;
+		};
 	};
 };
 
-&cpu0{
-	cpu-supply = <&vddcore>;
-};
-
-&cpu1{
-	cpu-supply = <&vddcore>;
-};
-
 &crc1 {
 	status = "okay";
 };
diff --git a/arch/arm/dts/stm32mp157c-ev1-scmi.dts b/arch/arm/dts/stm32mp157c-ev1-scmi.dts
index 3b9dd6f4ccc..813086ec248 100644
--- a/arch/arm/dts/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/dts/stm32mp157c-ev1-scmi.dts
@@ -66,8 +66,11 @@
 	resets = <&scmi_reset RST_SCMI_MDMA>;
 };
 
-&mlahb {
-	resets = <&scmi_reset RST_SCMI_MCU>;
+&m4_rproc {
+	/delete-property/ st,syscfg-holdboot;
+	resets = <&scmi_reset RST_SCMI_MCU>,
+		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
+	reset-names =  "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index ba8e9d9a42f..cd9c3ff5378 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -100,26 +100,11 @@
 };
 
 &dsi {
-	phy-dsi-supply = <&reg18>;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
-	ports {
-		port@0 {
-			reg = <0>;
-			dsi_in: endpoint {
-				remote-endpoint = <&ltdc_ep0_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-			dsi_out: endpoint {
-				remote-endpoint = <&dsi_panel_in>;
-			};
-		};
-	};
-
-	panel-dsi@0 {
+	panel@0 {
 		compatible = "raydium,rm68200";
 		reg = <0>;
 		reset-gpios = <&gpiof 15 GPIO_ACTIVE_LOW>;
@@ -135,6 +120,14 @@
 	};
 };
 
+&dsi_in {
+	remote-endpoint = <&ltdc_ep0_out>;
+};
+
+&dsi_out {
+	remote-endpoint = <&dsi_panel_in>;
+};
+
 &ethernet0 {
 	status = "okay";
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
@@ -185,7 +178,9 @@
 		reg = <0x3c>;
 		clocks = <&clk_ext_camera>;
 		clock-names = "xclk";
+		AVDD-supply = <&v2v8>;
 		DOVDD-supply = <&v2v8>;
+		DVDD-supply = <&v2v8>;
 		powerdown-gpios = <&stmfx_pinctrl 18 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
 		reset-gpios = <&stmfx_pinctrl 19 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
 		rotation = <180>;
@@ -239,8 +234,7 @@
 	status = "okay";
 
 	port {
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
+		ltdc_ep0_out: endpoint {
 			remote-endpoint = <&dsi_in>;
 		};
 	};
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
index f4de6c0b758..511113f2e39 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -93,28 +93,39 @@
 
 &adc {
 	pinctrl-names = "default";
-	pinctrl-0 = <&adc12_ain_pins_a>, <&adc12_usb_cc_pins_a>;
+	pinctrl-0 = <&adc12_usb_cc_pins_a>;
 	vdd-supply = <&vdd>;
 	vdda-supply = <&vdd>;
 	vref-supply = <&vrefbuf>;
-	status = "disabled";
+	status = "okay";
 	adc1: adc@0 {
+		status = "okay";
 		/*
 		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in18 & in19.
 		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
 		 * 5 * (56 + 47kOhms) * 5pF => 2.5us.
 		 * Use arbitrary margin here (e.g. 5us).
 		 */
-		st,min-sample-time-nsecs = <5000>;
-		/* AIN connector, USB Type-C CC1 & CC2 */
-		st,adc-channels = <0 1 6 13 18 19>;
-		status = "okay";
+		channel@18 {
+			reg = <18>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@19 {
+			reg = <19>;
+			st,min-sample-time-ns = <5000>;
+		};
 	};
 	adc2: adc@100 {
-		/* AIN connector, USB Type-C CC1 & CC2 */
-		st,adc-channels = <0 1 2 6 18 19>;
-		st,min-sample-time-nsecs = <5000>;
 		status = "okay";
+		/* USB Type-C CC1 & CC2 */
+		channel@18 {
+			reg = <18>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@19 {
+			reg = <19>;
+			st,min-sample-time-ns = <5000>;
+		};
 	};
 };
 
@@ -133,14 +144,6 @@
 	status = "okay";
 };
 
-&cpu0{
-	cpu-supply = <&vddcore>;
-};
-
-&cpu1{
-	cpu-supply = <&vddcore>;
-};
-
 &ethernet0 {
 	status = "okay";
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
@@ -443,7 +446,7 @@
 	i2s2_port: port {
 		i2s2_endpoint: endpoint {
 			remote-endpoint = <&sii9022_tx_endpoint>;
-			format = "i2s";
+			dai-format = "i2s";
 			mclk-fs = <256>;
 		};
 	};
@@ -465,8 +468,7 @@
 	status = "okay";
 
 	port {
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
+		ltdc_ep0_out: endpoint {
 			remote-endpoint = <&sii9022_in>;
 		};
 	};
diff --git a/include/dt-bindings/clock/stm32mp1-clks.h b/include/dt-bindings/clock/stm32mp1-clks.h
index 25e8cfd4345..0a5324bcdbd 100644
--- a/include/dt-bindings/clock/stm32mp1-clks.h
+++ b/include/dt-bindings/clock/stm32mp1-clks.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 or BSD-3-Clause */
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
 /*
  * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
  * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
diff --git a/include/dt-bindings/clock/stm32mp13-clks.h b/include/dt-bindings/clock/stm32mp13-clks.h
index da4cb756743..0bd7b54c65f 100644
--- a/include/dt-bindings/clock/stm32mp13-clks.h
+++ b/include/dt-bindings/clock/stm32mp13-clks.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
 /*
  * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
diff --git a/include/dt-bindings/regulator/st,stm32mp13-regulator.h b/include/dt-bindings/regulator/st,stm32mp13-regulator.h
new file mode 100644
index 00000000000..b3a974dfc58
--- /dev/null
+++ b/include/dt-bindings/regulator/st,stm32mp13-regulator.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef __DT_BINDINGS_REGULATOR_ST_STM32MP13_REGULATOR_H
+#define __DT_BINDINGS_REGULATOR_ST_STM32MP13_REGULATOR_H
+
+/* SCMI voltage domains identifiers */
+
+/* SOC Internal regulators */
+#define VOLTD_SCMI_REG11		0
+#define VOLTD_SCMI_REG18		1
+#define VOLTD_SCMI_USB33		2
+#define VOLTD_SCMI_SDMMC1_IO		3
+#define VOLTD_SCMI_SDMMC2_IO		4
+#define VOLTD_SCMI_VREFBUF		5
+
+/* STPMIC1 regulators */
+#define VOLTD_SCMI_STPMIC1_BUCK1	6
+#define VOLTD_SCMI_STPMIC1_BUCK2	7
+#define VOLTD_SCMI_STPMIC1_BUCK3	8
+#define VOLTD_SCMI_STPMIC1_BUCK4	9
+#define VOLTD_SCMI_STPMIC1_LDO1	        10
+#define VOLTD_SCMI_STPMIC1_LDO2	        11
+#define VOLTD_SCMI_STPMIC1_LDO3	        12
+#define VOLTD_SCMI_STPMIC1_LDO4	        13
+#define VOLTD_SCMI_STPMIC1_LDO5	        14
+#define VOLTD_SCMI_STPMIC1_LDO6	        15
+#define VOLTD_SCMI_STPMIC1_VREFDDR	16
+#define VOLTD_SCMI_STPMIC1_BOOST	17
+#define VOLTD_SCMI_STPMIC1_PWR_SW1	18
+#define VOLTD_SCMI_STPMIC1_PWR_SW2	19
+
+/* External regulators */
+#define VOLTD_SCMI_REGU0		20
+#define VOLTD_SCMI_REGU1		21
+#define VOLTD_SCMI_REGU2		22
+#define VOLTD_SCMI_REGU3		23
+#define VOLTD_SCMI_REGU4		24
+
+#endif /*__DT_BINDINGS_REGULATOR_ST_STM32MP13_REGULATOR_H */
diff --git a/include/dt-bindings/reset/stm32mp1-resets.h b/include/dt-bindings/reset/stm32mp1-resets.h
index 4ffa7c3612e..9071f139649 100644
--- a/include/dt-bindings/reset/stm32mp1-resets.h
+++ b/include/dt-bindings/reset/stm32mp1-resets.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 or BSD-3-Clause */
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
 /*
  * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
  * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
diff --git a/include/dt-bindings/reset/stm32mp13-resets.h b/include/dt-bindings/reset/stm32mp13-resets.h
index 1b83a01de8f..ecb37c7ddde 100644
--- a/include/dt-bindings/reset/stm32mp13-resets.h
+++ b/include/dt-bindings/reset/stm32mp13-resets.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
 /*
  * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
