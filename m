Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7289050FF3A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Apr 2022 15:38:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39152C60466;
	Tue, 26 Apr 2022 13:38:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82AB3C5F1F2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 13:38:25 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QAPApX009385;
 Tue, 26 Apr 2022 15:38:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=WmJCf3THf3HcropNfU5tlu8wNKn59XPAa1mzg05j0f8=;
 b=X876sG6zAIvVHIAxum+Z7Ln4pjWzfKmL1FK2eqWTERFybulG4ST+sFtkmH3MuZYP/DVl
 83C9sCKuQWJomPPberIkNAVy1jHTCdyqB6Kxo0qIUr2LpMMZF7WM8k49npD5SFy7X3+T
 TybZ4bVkcpX1OV4L5SQZEDfP82WDEyldhuaFGaiPnLbbsJomN8WCVQR68piwBRso4iWV
 JbMfskI9C/8RTtEGgqPdmU+0UaLDgW5PbAc7UXGvScAIhsDhRM/+oIeQWLPBaRBin8Sr
 AZ1pE9oh+4EegJrUXDQu1xu/MXWMP88SXO2Xz7zYOdvZ/U8Zd3sIB6trwrqQDIwrSKQu iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm6vkfkp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 15:38:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1713510002A;
 Tue, 26 Apr 2022 15:38:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08B05229A79;
 Tue, 26 Apr 2022 15:38:08 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr 2022 15:38:07
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Apr 2022 15:38:05 +0200
Message-ID: <20220426153744.1.I17b1546e6ef83a91f772eca047d2593f2eca53e4@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_02,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Matteo Lisi <matteo.lisi@engicam.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with v5.18
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

Device tree alignment with Linux kernel v5.18-rc2:
- ARM: dts: stm32: Add support for the emtrion emSBC-Argon
  (only the pincontrol part)
- ARM: dts: stm32: Drop duplicate status okay from DHCOM gpioc node
- ARM: dts: stm32: add st,stm32-sdmmc2 compatible on stm32mp151
- ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15
- ARM: dts: stm32: use exti 19 as main interrupt to support RTC wakeup on
  stm32mp157
- ARM: dts: stm32: add DMA configuration to UART nodes on stm32mp151
- ARM: dts: stm32: keep uart4 behavior on *
- ARM: dts: stm32: Correct masks for GIC PPI interrupts on stm32mp15

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-pinctrl.dtsi           | 92 +++++++++++++++++++
 arch/arm/dts/stm32mp15-u-boot.dtsi            | 12 ---
 arch/arm/dts/stm32mp151.dtsi                  | 37 ++++++--
 arch/arm/dts/stm32mp153.dtsi                  |  7 ++
 .../stm32mp157a-icore-stm32mp1-ctouch2.dts    |  2 +
 .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  2 +
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  4 +
 ...32mp157a-microgea-stm32mp1-microdev2.0.dts |  4 +
 arch/arm/dts/stm32mp157c-ed1.dts              |  2 +
 arch/arm/dts/stm32mp157c-odyssey.dts          |  2 +
 arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi     |  4 +
 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi      |  4 +
 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi   |  4 +
 arch/arm/dts/stm32mp15xx-dhcom-som.dtsi       |  3 +-
 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi |  6 ++
 arch/arm/dts/stm32mp15xx-dkx.dtsi             |  4 +
 16 files changed, 168 insertions(+), 21 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index 6161f5906e..f0d66d8c6e 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -338,6 +338,47 @@
 		};
 	};
 
+	ethernet0_rmii_pins_b: rmii-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 5, AF0)>, /* ETH1_CLK */
+				<STM32_PINMUX('C', 1, AF11)>, /* ETH1_MDC */
+				<STM32_PINMUX('G', 13, AF11)>, /* ETH1_TXD0 */
+				<STM32_PINMUX('G', 14, AF11)>; /* ETH1_TXD1 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH1_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('A', 7, AF11)>, /* ETH1_CRS_DV */
+				<STM32_PINMUX('C', 4, AF11)>, /* ETH1_RXD0 */
+				<STM32_PINMUX('C', 5, AF11)>; /* ETH1_RXD1 */
+			bias-disable;
+		};
+		pins4 {
+			pinmux = <STM32_PINMUX('B', 11, AF11)>; /* ETH1_TX_EN */
+		};
+	};
+
+	ethernet0_rmii_sleep_pins_b: rmii-sleep-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 2, ANALOG)>, /* ETH1_MDIO */
+				<STM32_PINMUX('A', 7, ANALOG)>, /* ETH1_CRS_DV */
+				<STM32_PINMUX('B', 5, ANALOG)>, /* ETH1_CLK */
+				<STM32_PINMUX('B', 11, ANALOG)>, /* ETH1_TX_EN */
+				<STM32_PINMUX('C', 1, ANALOG)>, /* ETH1_MDC */
+				<STM32_PINMUX('C', 4, ANALOG)>, /* ETH1_RXD0 */
+				<STM32_PINMUX('C', 5, ANALOG)>, /* ETH1_RXD1 */
+				<STM32_PINMUX('G', 13, ANALOG)>, /* ETH1_TXD0 */
+				<STM32_PINMUX('G', 14, ANALOG)>; /* ETH1_TXD1 */
+		};
+	};
+
 	fmc_pins_a: fmc-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
@@ -927,6 +968,21 @@
 		};
 	};
 
+	pwm1_pins_b: pwm1-1 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 9, AF1)>; /* TIM1_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm1_sleep_pins_b: pwm1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 9, ANALOG)>; /* TIM1_CH1 */
+		};
+	};
+
 	pwm2_pins_a: pwm2-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 3, AF1)>; /* TIM2_CH4 */
@@ -2042,6 +2098,42 @@
 		};
 	};
 
+	usart3_pins_d: usart3-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 9, AF7)>, /* USART3_RX */
+				 <STM32_PINMUX('D', 11, AF7)>; /* USART3_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart3_idle_pins_d: usart3-idle-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* USART3_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 9, AF7)>; /* USART3_RX */
+			bias-disable;
+		};
+	};
+
+	usart3_sleep_pins_d: usart3-sleep-3 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('D', 11, ANALOG)>, /* USART3_CTS_NSS */
+				 <STM32_PINMUX('D', 9, ANALOG)>; /* USART3_RX */
+		};
+	};
+
 	usbotg_hs_pins_a: usbotg-hs-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index e23d6c7d7e..d9d04743ac 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -188,18 +188,6 @@
 	#size-cells = <0>;
 };
 
-&sdmmc1 {
-	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
-};
-
-&sdmmc2 {
-	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
-};
-
-&sdmmc3 {
-	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
-};
-
 &usart1 {
 	resets = <&rcc USART1_R>;
 };
diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index 5a2be00758..e74a5faf4a 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -63,10 +63,10 @@
 
 	timer {
 		compatible = "arm,armv7-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&intc>;
 	};
 
@@ -473,6 +473,9 @@
 			interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc USART2_K>;
 			wakeup-source;
+			dmas = <&dmamux1 43 0x400 0x15>,
+			       <&dmamux1 44 0x400 0x11>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -482,6 +485,9 @@
 			interrupts-extended = <&exti 28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc USART3_K>;
 			wakeup-source;
+			dmas = <&dmamux1 45 0x400 0x15>,
+			       <&dmamux1 46 0x400 0x11>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -491,6 +497,9 @@
 			interrupts-extended = <&exti 30 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc UART4_K>;
 			wakeup-source;
+			dmas = <&dmamux1 63 0x400 0x15>,
+			       <&dmamux1 64 0x400 0x11>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -500,6 +509,9 @@
 			interrupts-extended = <&exti 31 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc UART5_K>;
 			wakeup-source;
+			dmas = <&dmamux1 65 0x400 0x15>,
+			       <&dmamux1 66 0x400 0x11>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -606,6 +618,9 @@
 			interrupts-extended = <&exti 32 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc UART7_K>;
 			wakeup-source;
+			dmas = <&dmamux1 79 0x400 0x15>,
+			       <&dmamux1 80 0x400 0x11>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -615,6 +630,9 @@
 			interrupts-extended = <&exti 33 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc UART8_K>;
 			wakeup-source;
+			dmas = <&dmamux1 81 0x400 0x15>,
+			       <&dmamux1 82 0x400 0x11>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -696,6 +714,9 @@
 			interrupts-extended = <&exti 29 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc USART6_K>;
 			wakeup-source;
+			dmas = <&dmamux1 71 0x400 0x15>,
+			       <&dmamux1 72 0x400 0x11>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -1077,7 +1098,7 @@
 		};
 
 		sdmmc3: mmc@48004000 {
-			compatible = "arm,pl18x", "arm,primecell";
+			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x48004000 0x400>;
 			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
@@ -1411,7 +1432,7 @@
 		};
 
 		sdmmc1: mmc@58005000 {
-			compatible = "arm,pl18x", "arm,primecell";
+			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58005000 0x1000>;
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
@@ -1426,7 +1447,7 @@
 		};
 
 		sdmmc2: mmc@58007000 {
-			compatible = "arm,pl18x", "arm,primecell";
+			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58007000 0x1000>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
@@ -1590,7 +1611,7 @@
 			reg = <0x5c004000 0x400>;
 			clocks = <&rcc RTCAPB>, <&rcc RTC>;
 			clock-names = "pclk", "rtc_ck";
-			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts-extended = <&exti 19 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/dts/stm32mp153.dtsi b/arch/arm/dts/stm32mp153.dtsi
index 1c1889b194..486084e0b8 100644
--- a/arch/arm/dts/stm32mp153.dtsi
+++ b/arch/arm/dts/stm32mp153.dtsi
@@ -22,6 +22,13 @@
 		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
+	timer {
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
 	soc {
 		m_can1: can@4400e000 {
 			compatible = "bosch,m_can";
diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
index d3058a036c..1f75f1d451 100644
--- a/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
+++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
@@ -43,5 +43,7 @@
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
index ec9f1d1cd5..3a1295cfa9 100644
--- a/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
+++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -43,5 +43,7 @@
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
index 5670b23812..fae656edd8 100644
--- a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -143,6 +143,8 @@
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
@@ -150,5 +152,7 @@
 &uart8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart8_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
index 7a75868164..b9d0d3d6ad 100644
--- a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
@@ -44,6 +44,8 @@
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
@@ -51,5 +53,7 @@
 &uart8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart8_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index f62b46b8dd..fe5c8f25ce 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -392,6 +392,8 @@
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/stm32mp157c-odyssey.dts b/arch/arm/dts/stm32mp157c-odyssey.dts
index 0e725498dd..17bcf56f74 100644
--- a/arch/arm/dts/stm32mp157c-odyssey.dts
+++ b/arch/arm/dts/stm32mp157c-odyssey.dts
@@ -132,6 +132,8 @@
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi
index 4b10b013ff..35b1034aa3 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi
@@ -131,6 +131,8 @@
 &usart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usart3_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
@@ -144,6 +146,8 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart8_pins_a>;
 	rts-gpios = <&gpioe 6 GPIO_ACTIVE_HIGH>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi
index fbf3826933..5f586f0240 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -287,6 +287,8 @@
 &usart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usart3_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
@@ -294,6 +296,8 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart8_pins_a &uart8_rtscts_pins_a>;
 	uart-has-rtscts;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi
index ba816ef8b9..abc595350e 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi
@@ -105,12 +105,16 @@
 &usart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usart3_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
 &uart8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart8_pins_a &uart8_rtscts_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
index 8c41f819f7..83e2c87713 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
@@ -196,7 +196,6 @@
 			  "", "", "DHCOM-E", "",
 			  "", "", "", "",
 			  "", "", "", "";
-	status = "okay";
 };
 
 &gpiod {
@@ -521,5 +520,7 @@
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi
index 6885948f30..61e17f44ce 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -376,6 +376,8 @@
 	label = "LS-UART1";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_b>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
@@ -385,6 +387,8 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart7_pins_a>;
 	uart-has-rtscts;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
@@ -394,6 +398,8 @@
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_sleep_pins_a>;
 	st,hw-flow-ctrl;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 
 	bluetooth {
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
index f8130bf445..3d36cac9ed 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -658,6 +658,8 @@
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
@@ -666,6 +668,8 @@
 	pinctrl-0 = <&uart7_pins_c>;
 	pinctrl-1 = <&uart7_sleep_pins_c>;
 	pinctrl-2 = <&uart7_idle_pins_c>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "disabled";
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
