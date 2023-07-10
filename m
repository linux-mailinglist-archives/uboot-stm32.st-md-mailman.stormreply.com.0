Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B61DA74D024
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Jul 2023 10:38:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AF2EC6B44C;
	Mon, 10 Jul 2023 08:38:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ED28C6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 08:38:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36A8BYgR027568; Mon, 10 Jul 2023 10:38:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=LCfAgff/78ct54YtWceLIpQkdTwEepmUpD5p6C4gCWw=;
 b=EhsXT6Pj1oj2qQONSFgB4NHF+/giUKPkI2X8KfVMUZDfm/6hiwtSJavithHBlgP4vixd
 uShqWBL80pzd9OzPpRJgl2lFtpl4tXvpMA7mxtYrw7Gu2VgUkKLhIRfS9jsct1RfxmIw
 7qgJZTa7FyqrL3IJ2/GUAUXD17UGSOE64PE+b+9eAjnTRHdA/+4EbQk8HpnuXqBuKfDk
 dXmyRfMDtAw2abMnO4M6EGKuS2blexDnUqJuPwHQonFyWG8R3BichvI5dl/eSkhweUFe
 mLiRH4Zzp1ClR0fbOBJgze0O58KTfGuGV6gryir0ivl8HZR/+akamuXu0FK/+kUovZxF Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rre8vr7fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jul 2023 10:38:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94A5110005D;
 Mon, 10 Jul 2023 10:38:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86C3721ED51;
 Mon, 10 Jul 2023 10:38:49 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 10 Jul
 2023 10:38:49 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 10 Jul 2023 10:38:45 +0200
Message-ID: <20230710103818.1.Ic334bec9a3dbb35b49f446f5fadb9938bdfb303d@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_05,2023-07-06_02,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32mp: alignment with v6.4
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

Device tree alignment with Linux kernel v6.4.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp13-pinctrl.dtsi | 129 ++++++++++++++++++++++++++++
 arch/arm/dts/stm32mp131.dtsi        |  99 ++++++++++++++++++++-
 arch/arm/dts/stm32mp135f-dk.dts     |  42 ++++++++-
 arch/arm/dts/stm32mp15-pinctrl.dtsi |  34 ++++----
 arch/arm/dts/stm32mp151.dtsi        |   4 +-
 arch/arm/dts/stm32mp157a-dk1.dts    |   3 -
 arch/arm/dts/stm32mp157c-dk2.dts    |   3 -
 arch/arm/dts/stm32mp157c-ed1.dts    |  17 +---
 arch/arm/dts/stm32mp157c-ev1.dts    |   9 +-
 arch/arm/dts/stm32mp15xx-dkx.dtsi   |  15 ++--
 10 files changed, 299 insertions(+), 56 deletions(-)

diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
index b2dce3a29f39..27e0c3826789 100644
--- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
@@ -258,4 +258,133 @@
 			bias-disable;
 		};
 	};
+
+	uart4_idle_pins_a: uart4-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 6, ANALOG)>; /* UART4_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 8, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	uart4_sleep_pins_a: uart4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 6, ANALOG)>, /* UART4_TX */
+				 <STM32_PINMUX('D', 8, ANALOG)>; /* UART4_RX */
+		};
+	};
+
+	uart8_pins_a: uart8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 9, AF8)>; /* UART8_RX */
+			bias-pull-up;
+		};
+	};
+
+	uart8_idle_pins_a: uart8-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 1, ANALOG)>; /* UART8_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 9, AF8)>; /* UART8_RX */
+			bias-pull-up;
+		};
+	};
+
+	uart8_sleep_pins_a: uart8-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 1, ANALOG)>, /* UART8_TX */
+				 <STM32_PINMUX('F', 9, ANALOG)>; /* UART8_RX */
+		};
+	};
+
+	usart1_pins_a: usart1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 0, AF7)>, /* USART1_TX */
+				 <STM32_PINMUX('C', 2, AF7)>; /* USART1_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 0, AF4)>, /* USART1_RX */
+				 <STM32_PINMUX('A', 7, AF7)>; /* USART1_CTS_NSS */
+			bias-pull-up;
+		};
+	};
+
+	usart1_idle_pins_a: usart1-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 0, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('A', 7, ANALOG)>; /* USART1_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 2, AF7)>; /* USART1_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('B', 0, AF4)>; /* USART1_RX */
+			bias-pull-up;
+		};
+	};
+
+	usart1_sleep_pins_a: usart1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 0, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* USART1_RTS */
+				 <STM32_PINMUX('A', 7, ANALOG)>, /* USART1_CTS_NSS */
+				 <STM32_PINMUX('B', 0, ANALOG)>; /* USART1_RX */
+		};
+	};
+
+	usart2_pins_a: usart2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 12, AF1)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, AF3)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 15, AF1)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 11, AF2)>; /* USART2_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart2_idle_pins_a: usart2-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 12, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('E', 11, ANALOG)>; /* USART2_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 4, AF3)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('D', 15, AF1)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_a: usart2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 12, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 15, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 11, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
 };
diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index d94ba2547267..d163c267e34c 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -397,12 +397,42 @@
 			status = "disabled";
 		};
 
+		usart3: serial@4000f000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x4000f000 0x400>;
+			interrupts-extended = <&exti 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc USART3_K>;
+			resets = <&rcc USART3_R>;
+			wakeup-source;
+			dmas = <&dmamux1 45 0x400 0x5>,
+			       <&dmamux1 46 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		uart4: serial@40010000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x40010000 0x400>;
-			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts-extended = <&exti 30 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc UART4_K>;
 			resets = <&rcc UART4_R>;
+			wakeup-source;
+			dmas = <&dmamux1 63 0x400 0x5>,
+			       <&dmamux1 64 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		uart5: serial@40011000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40011000 0x400>;
+			interrupts-extended = <&exti 31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc UART5_K>;
+			resets = <&rcc UART5_R>;
+			wakeup-source;
+			dmas = <&dmamux1 65 0x400 0x5>,
+			       <&dmamux1 66 0x400 0x1>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -442,6 +472,32 @@
 			status = "disabled";
 		};
 
+		uart7: serial@40018000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40018000 0x400>;
+			interrupts-extended = <&exti 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc UART7_K>;
+			resets = <&rcc UART7_R>;
+			wakeup-source;
+			dmas = <&dmamux1 79 0x400 0x5>,
+			       <&dmamux1 80 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		uart8: serial@40019000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40019000 0x400>;
+			interrupts-extended = <&exti 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc UART8_K>;
+			resets = <&rcc UART8_R>;
+			wakeup-source;
+			dmas = <&dmamux1 81 0x400 0x5>,
+			       <&dmamux1 82 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		timers1: timer@44000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -524,6 +580,19 @@
 			};
 		};
 
+		usart6: serial@44003000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x44003000 0x400>;
+			interrupts-extended = <&exti 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc USART6_K>;
+			resets = <&rcc USART6_R>;
+			wakeup-source;
+			dmas = <&dmamux1 71 0x400 0x5>,
+			       <&dmamux1 72 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		i2s1: audio-controller@44004000 {
 			compatible = "st,stm32h7-i2s";
 			reg = <0x44004000 0x400>;
@@ -748,6 +817,32 @@
 			status = "disabled";
 		};
 
+		usart1: serial@4c000000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x4c000000 0x400>;
+			interrupts-extended = <&exti 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc USART1_K>;
+			resets = <&rcc USART1_R>;
+			wakeup-source;
+			dmas = <&dmamux1 41 0x400 0x5>,
+			       <&dmamux1 42 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		usart2: serial@4c001000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x4c001000 0x400>;
+			interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc USART2_K>;
+			resets = <&rcc USART2_R>;
+			wakeup-source;
+			dmas = <&dmamux1 43 0x400 0x5>,
+			       <&dmamux1 44 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		i2s4: audio-controller@4c002000 {
 			compatible = "st,stm32h7-i2s";
 			reg = <0x4c002000 0x400>;
@@ -1001,8 +1096,6 @@
 			reg = <0x50000000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-
 			clock-names = "hse", "hsi", "csi", "lse", "lsi";
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				 <&scmi_clk CK_SCMI_HSI>,
diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
index c40686cb2b9a..f0900ca672b5 100644
--- a/arch/arm/dts/stm32mp135f-dk.dts
+++ b/arch/arm/dts/stm32mp135f-dk.dts
@@ -19,6 +19,13 @@
 
 	aliases {
 		serial0 = &uart4;
+		serial1 = &usart1;
+		serial2 = &uart8;
+		serial3 = &usart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@c0000000 {
@@ -267,8 +274,41 @@
 };
 
 &uart4 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+&uart8 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart8_pins_a>;
+	pinctrl-1 = <&uart8_sleep_pins_a>;
+	pinctrl-2 = <&uart8_idle_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+};
+
+&usart1 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart1_pins_a>;
+	pinctrl-1 = <&usart1_sleep_pins_a>;
+	pinctrl-2 = <&usart1_idle_pins_a>;
+	uart-has-rtscts;
+	status = "disabled";
+};
+
+/* Bluetooth */
+&usart2 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart2_pins_a>;
+	pinctrl-1 = <&usart2_sleep_pins_a>;
+	pinctrl-2 = <&usart2_idle_pins_a>;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index a9d2bec99014..e86d989dd351 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -1880,6 +1880,21 @@
 		};
 	};
 
+	spi1_pins_b: spi1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 5, AF5)>, /* SPI1_SCK */
+				 <STM32_PINMUX('B', 5, AF5)>; /* SPI1_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 6, AF5)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
 	spi2_pins_a: spi2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
@@ -2163,7 +2178,7 @@
 				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
 			bias-disable;
 			drive-push-pull;
-			slew-rate = <3>;
+			slew-rate = <0>;
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
@@ -2181,7 +2196,7 @@
 			pinmux = <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
 			bias-disable;
 			drive-push-pull;
-			slew-rate = <3>;
+			slew-rate = <0>;
 		};
 		pins3 {
 			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
@@ -2448,19 +2463,4 @@
 			bias-disable;
 		};
 	};
-
-	spi1_pins_b: spi1-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('A', 5, AF5)>, /* SPI1_SCK */
-				 <STM32_PINMUX('B', 5, AF5)>; /* SPI1_MOSI */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <1>;
-		};
-
-		pins2 {
-			pinmux = <STM32_PINMUX('A', 6, AF5)>; /* SPI1_MISO */
-			bias-disable;
-		};
-	};
 };
diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index b3baacbb2694..21d11be328c0 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -1148,8 +1148,8 @@
 		usbotg_hs: usb-otg@49000000 {
 			compatible = "st,stm32mp15-hsotg", "snps,dwc2";
 			reg = <0x49000000 0x10000>;
-			clocks = <&rcc USBO_K>;
-			clock-names = "otg";
+			clocks = <&rcc USBO_K>, <&usbphyc>;
+			clock-names = "otg", "utmi";
 			resets = <&rcc USBO_R>;
 			reset-names = "dwc2";
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
index 4c8be9c8eb20..0da3667ab1e0 100644
--- a/arch/arm/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/dts/stm32mp157a-dk1.dts
@@ -17,9 +17,6 @@
 
 	aliases {
 		ethernet0 = &ethernet0;
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart7;
 	};
 
 	chosen {
diff --git a/arch/arm/dts/stm32mp157c-dk2.dts b/arch/arm/dts/stm32mp157c-dk2.dts
index 2bc92ef3aeb9..ab13e340f4ef 100644
--- a/arch/arm/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/dts/stm32mp157c-dk2.dts
@@ -18,9 +18,6 @@
 
 	aliases {
 		ethernet0 = &ethernet0;
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart7;
 		serial3 = &usart2;
 	};
 
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index fe5c8f25cecd..3541a17dceb9 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -16,6 +16,10 @@
 	model = "STMicroelectronics STM32MP157C eval daughter";
 	compatible = "st,stm32mp157c-ed1", "st,stm32mp157";
 
+	aliases {
+		serial0 = &uart4;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -65,15 +69,6 @@
 			reg = <0x38000000 0x10000>;
 			no-map;
 		};
-
-		gpu_reserved: gpu@e8000000 {
-			reg = <0xe8000000 0x8000000>;
-			no-map;
-		};
-	};
-
-	aliases {
-		serial0 = &uart4;
 	};
 
 	sd_switch: regulator-sd_switch {
@@ -148,10 +143,6 @@
 	status = "okay";
 };
 
-&gpu {
-	contiguous-area = <&gpu_reserved>;
-};
-
 &hash1 {
 	status = "okay";
 };
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index 542226cfcfdf..ba8e9d9a42fa 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -14,16 +14,15 @@
 	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
 	compatible = "st,stm32mp157c-ev1", "st,stm32mp157c-ed1", "st,stm32mp157";
 
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	aliases {
-		serial0 = &uart4;
 		serial1 = &usart3;
 		ethernet0 = &ethernet0;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	clocks {
 		clk_ext_camera: clk-ext-camera {
 			#clock-cells = <0>;
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
index 49b3e768c898..f4de6c0b7587 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -8,6 +8,12 @@
 #include <dt-bindings/mfd/st,stpmic1.h>
 
 / {
+	aliases {
+		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &uart7;
+	};
+
 	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xc0000000 0x20000000>;
@@ -53,11 +59,6 @@
 			reg = <0x38000000 0x10000>;
 			no-map;
 		};
-
-		gpu_reserved: gpu@d4000000 {
-			reg = <0xd4000000 0x4000000>;
-			no-map;
-		};
 	};
 
 	led {
@@ -159,10 +160,6 @@
 	};
 };
 
-&gpu {
-	contiguous-area = <&gpu_reserved>;
-};
-
 &hash1 {
 	status = "okay";
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
