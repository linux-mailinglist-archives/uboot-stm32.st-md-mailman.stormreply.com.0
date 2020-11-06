Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C52A9011
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 08:12:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54D61C424B2;
	Fri,  6 Nov 2020 07:12:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10420C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 07:12:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A67CHsA019700; Fri, 6 Nov 2020 08:12:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9LKKCMBz/Mk7gUvShbD8EdUL3ge4xxq76cVG0SZFQdg=;
 b=iBsGNhqe9otiew1IDkXoKzuVM/2J5UYmk6+ctuwj+q3NB/nFmsKkX+mQAeA5BNuMyIZK
 NQxVwj69XI2az3LpEfRyaSPHBbrmM5lH+ymcj+SVJffVhl4Vb+vsaLQZK/Gx052Ker27
 ykyHIhFtHXs3fTO8WrZ/uf7rxXvemgMO6DCxPvJnpTZWN1MXyNFiZvB2o8p7yZIQWq5E
 7P20TX3pXbigqAYH8B/JeMXyJRQlZN1fXuEpvKVaysgQdILnrB85SX3c363GkwV+otM/
 ActKXAVi7Q4jc38r9Oj4s+UBhdFyXHcI1O8pO0lJeLt22A7ShBWF2wQb14jaSoBbsbn3 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00etgtp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 08:12:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AFDA10003B;
 Fri,  6 Nov 2020 08:12:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 332DE22461C;
 Fri,  6 Nov 2020 08:12:39 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 08:12:13
 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 08:11:58 +0100
Message-ID: <20201106071200.6933-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106071200.6933-1-patrice.chotard@st.com>
References: <20201106071200.6933-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_02:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v1 2/4] ARM: dts: stm32: DT sync with kernel
	v5.10-rc1 for MCU's boards
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

Device tree alignment with kernel v5.10-rc1.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/dts/stm32429i-eval-u-boot.dtsi  |   2 +-
 arch/arm/dts/stm32429i-eval.dts          |  21 +++--
 arch/arm/dts/stm32746g-eval-u-boot.dtsi  |   4 +-
 arch/arm/dts/stm32746g-eval.dts          |  13 ++-
 arch/arm/dts/stm32f4-pinctrl.dtsi        | 107 ++++++++++++++++++++---
 arch/arm/dts/stm32f429-disco-u-boot.dtsi |   2 +-
 arch/arm/dts/stm32f429-disco.dts         |  99 ++++++++++++++++++++-
 arch/arm/dts/stm32f429.dtsi              |  30 +++++--
 arch/arm/dts/stm32f469-disco-u-boot.dtsi |   6 +-
 arch/arm/dts/stm32f469-disco.dts         |  19 ++--
 arch/arm/dts/stm32f469.dtsi              |   1 -
 arch/arm/dts/stm32f7-pinctrl.dtsi        |  22 ++---
 arch/arm/dts/stm32f7-u-boot.dtsi         |   3 +-
 arch/arm/dts/stm32f746-disco-u-boot.dtsi |   4 +-
 arch/arm/dts/stm32f746-disco.dts         |   2 +-
 arch/arm/dts/stm32f746.dtsi              |  12 ++-
 arch/arm/dts/stm32f769-disco-u-boot.dtsi |   4 +-
 arch/arm/dts/stm32f769-disco.dts         |   6 +-
 arch/arm/dts/stm32h743-pinctrl.dtsi      |  10 +--
 arch/arm/dts/stm32h743.dtsi              |  37 +++++---
 arch/arm/dts/stm32h743i-disco.dts        |   2 +-
 arch/arm/dts/stm32h743i-eval.dts         |   2 +-
 22 files changed, 308 insertions(+), 100 deletions(-)

diff --git a/arch/arm/dts/stm32429i-eval-u-boot.dtsi b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
index fe437bbfe2..1e7429b2c6 100644
--- a/arch/arm/dts/stm32429i-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
@@ -136,7 +136,7 @@
 };
 
 &pinctrl {
-	usart1_pins_a: usart1@0	{
+	usart1_pins_a: usart1-0	{
 		u-boot,dm-pre-reloc;
 		pins1 {
 			u-boot,dm-pre-reloc;
diff --git a/arch/arm/dts/stm32429i-eval.dts b/arch/arm/dts/stm32429i-eval.dts
index c5afa0c162..592b182c1a 100644
--- a/arch/arm/dts/stm32429i-eval.dts
+++ b/arch/arm/dts/stm32429i-eval.dts
@@ -19,7 +19,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@00000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x2000000>;
 	};
@@ -54,19 +54,26 @@
 		regulator-max-microvolt = <3300000>;
 	};
 
+	vdd_panel: vdd-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_panel";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
-		green {
+		led-green {
 			gpios = <&gpiog 6 1>;
 			linux,default-trigger = "heartbeat";
 		};
-		orange {
+		led-orange {
 			gpios = <&gpiog 7 1>;
 		};
-		red {
+		led-red {
 			gpios = <&gpiog 10 1>;
 		};
-		blue {
+		led-blue {
 			gpios = <&gpiog 12 1>;
 		};
 	};
@@ -97,6 +104,7 @@
 
 	panel_rgb: panel-rgb {
 		compatible = "ampire,am-480272h3tmqw-t01h";
+		power-supply = <&vdd_panel>;
 		status = "okay";
 		port {
 			panel_in_rgb: endpoint {
@@ -191,9 +199,8 @@
 
 &ltdc {
 	status = "okay";
-	pinctrl-0 = <&ltdc_pins>;
+	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-names = "default";
-	dma-ranges;
 
 	port {
 		ltdc_out_rgb: endpoint {
diff --git a/arch/arm/dts/stm32746g-eval-u-boot.dtsi b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
index d5fb92795d..f2195a6c51 100644
--- a/arch/arm/dts/stm32746g-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
@@ -165,7 +165,7 @@
 		};
 	};
 
-	usart1_pins_a: usart1@0	{
+	usart1_pins_a: usart1-0	{
 		u-boot,dm-pre-reloc;
 		pins1 {
 			u-boot,dm-pre-reloc;
@@ -178,7 +178,7 @@
 
 &qspi {
 	reg = <0xA0001000 0x1000>, <0x90000000 0x4000000>;
-	qflash0: n25q512a {
+	qflash0: n25q512a@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm/dts/stm32746g-eval.dts b/arch/arm/dts/stm32746g-eval.dts
index d77eb53c6a..9940cf1873 100644
--- a/arch/arm/dts/stm32746g-eval.dts
+++ b/arch/arm/dts/stm32746g-eval.dts
@@ -19,7 +19,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xc0000000 0x2000000>;
 	};
@@ -30,17 +30,17 @@
 
 	leds {
 		compatible = "gpio-leds";
-		green {
+		led-green {
 			gpios = <&gpiof 10 1>;
 			linux,default-trigger = "heartbeat";
 		};
-		orange {
+		led-orange {
 			gpios = <&stmfx_pinctrl 17 1>;
 		};
-		red {
+		led-red {
 			gpios = <&gpiob 7 1>;
 		};
-		blue {
+		led-blue {
 			gpios = <&stmfx_pinctrl 19 1>;
 		};
 	};
@@ -59,7 +59,6 @@
 
 	joystick {
 		compatible = "gpio-keys";
-		#size-cells = <0>;
 		pinctrl-0 = <&joystick_pins>;
 		pinctrl-names = "default";
 		button-0 {
@@ -130,7 +129,7 @@
 		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
 		interrupt-parent = <&gpioi>;
 
-		stmfx_pinctrl: stmfx-pin-controller {
+		stmfx_pinctrl: pinctrl {
 			compatible = "st,stmfx-0300-pinctrl";
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/arch/arm/dts/stm32f4-pinctrl.dtsi b/arch/arm/dts/stm32f4-pinctrl.dtsi
index 7ed68286ba..adf502694b 100644
--- a/arch/arm/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/dts/stm32f4-pinctrl.dtsi
@@ -127,7 +127,7 @@
 				st,bank-name = "GPIOK";
 			};
 
-			usart1_pins_a: usart1@0 {
+			usart1_pins_a: usart1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
 					bias-disable;
@@ -140,7 +140,7 @@
 				};
 			};
 
-			usart3_pins_a: usart3@0 {
+			usart3_pins_a: usart3-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
 					bias-disable;
@@ -153,7 +153,7 @@
 				};
 			};
 
-			usbotg_fs_pins_a: usbotg_fs@0 {
+			usbotg_fs_pins_a: usbotg-fs-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 10, AF10)>, /* OTG_FS_ID */
 						 <STM32_PINMUX('A', 11, AF10)>, /* OTG_FS_DM */
@@ -164,7 +164,7 @@
 				};
 			};
 
-			usbotg_fs_pins_b: usbotg_fs@1 {
+			usbotg_fs_pins_b: usbotg-fs-1 {
 				pins {
 					pinmux = <STM32_PINMUX('B', 12, AF12)>, /* OTG_HS_ID */
 						 <STM32_PINMUX('B', 14, AF12)>, /* OTG_HS_DM */
@@ -175,7 +175,7 @@
 				};
 			};
 
-			usbotg_hs_pins_a: usbotg_hs@0 {
+			usbotg_hs_pins_a: usbotg-hs-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT*/
 						 <STM32_PINMUX('I', 11, AF10)>, /* OTG_HS_ULPI_DIR */
@@ -195,7 +195,7 @@
 				};
 			};
 
-			ethernet_mii: mii@0 {
+			ethernet_mii: mii-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH_MII_TXD0_ETH_RMII_TXD0 */
 						 <STM32_PINMUX('G', 14, AF11)>, /* ETH_MII_TXD1_ETH_RMII_TXD1 */
@@ -215,13 +215,13 @@
 				};
 			};
 
-			adc3_in8_pin: adc@200 {
+			adc3_in8_pin: adc-200 {
 				pins {
 					pinmux = <STM32_PINMUX('F', 10, ANALOG)>;
 				};
 			};
 
-			pwm1_pins: pwm@1 {
+			pwm1_pins: pwm1-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 8, AF1)>, /* TIM1_CH1 */
 						 <STM32_PINMUX('B', 13, AF1)>, /* TIM1_CH1N */
@@ -229,14 +229,14 @@
 				};
 			};
 
-			pwm3_pins: pwm@3 {
+			pwm3_pins: pwm3-0 {
 				pins {
 					pinmux = <STM32_PINMUX('B', 4, AF2)>, /* TIM3_CH1 */
 						 <STM32_PINMUX('B', 5, AF2)>; /* TIM3_CH2 */
 				};
 			};
 
-			i2c1_pins: i2c1@0 {
+			i2c1_pins: i2c1-0 {
 				pins {
 					pinmux = <STM32_PINMUX('B', 9, AF4)>, /* I2C1_SDA */
 						 <STM32_PINMUX('B', 6, AF4)>; /* I2C1_SCL */
@@ -246,7 +246,7 @@
 				};
 			};
 
-			ltdc_pins: ltdc@0 {
+			ltdc_pins_a: ltdc-0 {
 				pins {
 					pinmux = <STM32_PINMUX('I', 12, AF14)>, /* LCD_HSYNC */
 						 <STM32_PINMUX('I', 13, AF14)>, /* LCD_VSYNC */
@@ -280,7 +280,86 @@
 				};
 			};
 
-			dcmi_pins: dcmi@0 {
+			ltdc_pins_b: ltdc-1 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 6,  AF14)>,
+						/* LCD_HSYNC */
+						 <STM32_PINMUX('A', 4,  AF14)>,
+						 /* LCD_VSYNC */
+						 <STM32_PINMUX('G', 7,  AF14)>,
+						 /* LCD_CLK */
+						 <STM32_PINMUX('C', 10, AF14)>,
+						 /* LCD_R2 */
+						 <STM32_PINMUX('B', 0,  AF9)>,
+						 /* LCD_R3 */
+						 <STM32_PINMUX('A', 11, AF14)>,
+						 /* LCD_R4 */
+						 <STM32_PINMUX('A', 12, AF14)>,
+						 /* LCD_R5 */
+						 <STM32_PINMUX('B', 1,  AF9)>,
+						 /* LCD_R6*/
+						 <STM32_PINMUX('G', 6,  AF14)>,
+						 /* LCD_R7 */
+						 <STM32_PINMUX('A', 6,  AF14)>,
+						 /* LCD_G2 */
+						 <STM32_PINMUX('G', 10, AF9)>,
+						 /* LCD_G3 */
+						 <STM32_PINMUX('B', 10, AF14)>,
+						 /* LCD_G4 */
+						 <STM32_PINMUX('D', 6,  AF14)>,
+						 /* LCD_B2 */
+						 <STM32_PINMUX('G', 11, AF14)>,
+						 /* LCD_B3*/
+						 <STM32_PINMUX('B', 11, AF14)>,
+						 /* LCD_G5 */
+						 <STM32_PINMUX('C', 7,  AF14)>,
+						 /* LCD_G6 */
+						 <STM32_PINMUX('D', 3,  AF14)>,
+						 /* LCD_G7 */
+						 <STM32_PINMUX('G', 12, AF9)>,
+						 /* LCD_B4 */
+						 <STM32_PINMUX('A', 3,  AF14)>,
+						 /* LCD_B5 */
+						 <STM32_PINMUX('B', 8,  AF14)>,
+						 /* LCD_B6 */
+						 <STM32_PINMUX('B', 9,  AF14)>,
+						 /* LCD_B7 */
+						 <STM32_PINMUX('F', 10, AF14)>;
+						 /* LCD_DE */
+					slew-rate = <2>;
+				};
+			};
+
+			spi5_pins: spi5-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('F', 7, AF5)>,
+						/* SPI5_CLK */
+						 <STM32_PINMUX('F', 9, AF5)>;
+						/* SPI5_MOSI */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('F', 8, AF5)>;
+						/* SPI5_MISO */
+					bias-disable;
+				};
+			};
+
+			i2c3_pins: i2c3-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 9, AF4)>,
+						/* I2C3_SDA */
+						 <STM32_PINMUX('A', 8, AF4)>;
+						/* I2C3_SCL */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <3>;
+				};
+			};
+
+			dcmi_pins: dcmi-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
 						 <STM32_PINMUX('B', 7, AF13)>, /* DCMI_VSYNC */
@@ -303,7 +382,7 @@
 				};
 			};
 
-			sdio_pins: sdio_pins@0 {
+			sdio_pins: sdio-pins-0 {
 				pins {
 					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDIO_D0 */
 						 <STM32_PINMUX('C', 9, AF12)>, /* SDIO_D1 */
@@ -316,7 +395,7 @@
 				};
 			};
 
-			sdio_pins_od: sdio_pins_od@0 {
+			sdio_pins_od: sdio-pins-od-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDIO_D0 */
 						 <STM32_PINMUX('C', 9, AF12)>, /* SDIO_D1 */
diff --git a/arch/arm/dts/stm32f429-disco-u-boot.dtsi b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
index 52f80320bc..77d5ea07bb 100644
--- a/arch/arm/dts/stm32f429-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
@@ -123,7 +123,7 @@
 };
 
 &pinctrl {
-	usart1_pins_a: usart1@0	{
+	usart1_pins_a: usart1-0	{
 		u-boot,dm-pre-reloc;
 		pins1 {
 			u-boot,dm-pre-reloc;
diff --git a/arch/arm/dts/stm32f429-disco.dts b/arch/arm/dts/stm32f429-disco.dts
index 3a83ef5f60..42477c8d3f 100644
--- a/arch/arm/dts/stm32f429-disco.dts
+++ b/arch/arm/dts/stm32f429-disco.dts
@@ -7,6 +7,8 @@
 #include "stm32f429.dtsi"
 #include "stm32f429-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "STMicroelectronics STM32F429i-DISCO board";
@@ -17,7 +19,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@90000000 {
 		device_type = "memory";
 		reg = <0x90000000 0x800000>;
 	};
@@ -28,10 +30,10 @@
 
 	leds {
 		compatible = "gpio-leds";
-		red {
+		led-red {
 			gpios = <&gpiog 14 0>;
 		};
-		green {
+		led-green {
 			gpios = <&gpiog 13 0>;
 			linux,default-trigger = "heartbeat";
 		};
@@ -66,12 +68,103 @@
 	status = "okay";
 };
 
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	stmpe811@41 {
+		compatible = "st,stmpe811";
+		reg = <0x41>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpioa>;
+		/* 3.25 MHz ADC clock speed */
+		st,adc-freq = <1>;
+		/* 12-bit ADC */
+		st,mod-12b = <1>;
+		/* internal ADC reference */
+		st,ref-sel = <0>;
+		/* ADC converstion time: 80 clocks */
+		st,sample-time = <4>;
+
+		stmpe_touchscreen {
+			compatible = "st,stmpe-ts";
+			/* 8 sample average control */
+			st,ave-ctrl = <3>;
+			/* 7 length fractional part in z */
+			st,fraction-z = <7>;
+			/*
+			 * 50 mA typical 80 mA max touchscreen drivers
+			 * current limit value
+			 */
+			st,i-drive = <1>;
+			/* 1 ms panel driver settling time */
+			st,settling = <3>;
+			/* 5 ms touch detect interrupt delay */
+			st,touch-det-delay = <5>;
+		};
+
+		stmpe_adc {
+			compatible = "st,stmpe-adc";
+			/* forbid to use ADC channels 3-0 (touch) */
+			st,norequest-mask = <0x0F>;
+		};
+	};
+};
+
+&ltdc {
+	status = "okay";
+	pinctrl-0 = <&ltdc_pins_b>;
+	pinctrl-names = "default";
+
+	port {
+		ltdc_out_rgb: endpoint {
+			remote-endpoint = <&panel_in_rgb>;
+		};
+	};
+};
+
 &rtc {
 	assigned-clocks = <&rcc 1 CLK_RTC>;
 	assigned-clock-parents = <&rcc 1 CLK_LSI>;
 	status = "okay";
 };
 
+&spi5 {
+	status = "okay";
+	pinctrl-0 = <&spi5_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioc 1 GPIO_ACTIVE_LOW>, <&gpioc 2 GPIO_ACTIVE_LOW>;
+
+	l3gd20: l3gd20@0 {
+		compatible = "st,l3gd20-gyro";
+		spi-max-frequency = <10000000>;
+		st,drdy-int-pin = <2>;
+		interrupt-parent = <&gpioa>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>,
+				<2 IRQ_TYPE_EDGE_RISING>;
+		reg = <0>;
+		status = "okay";
+	};
+
+	display: display@1{
+		/* Connect panel-ilitek-9341 to ltdc */
+		compatible = "st,sf-tc240t-9370-t";
+		reg = <1>;
+		spi-3wire;
+		spi-max-frequency = <10000000>;
+		dc-gpios = <&gpiod 13 0>;
+		port {
+			panel_in_rgb: endpoint {
+			remote-endpoint = <&ltdc_out_rgb>;
+			};
+		};
+	};
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/dts/stm32f429.dtsi b/arch/arm/dts/stm32f429.dtsi
index db0b82e89e..a81e916064 100644
--- a/arch/arm/dts/stm32f429.dtsi
+++ b/arch/arm/dts/stm32f429.dtsi
@@ -39,7 +39,7 @@
 	};
 
 	soc {
-		romem: nvmem@1fff7800 {
+		romem: efuse@1fff7800 {
 			compatible = "st,stm32f4-otp";
 			reg = <0x1fff7800 0x400>;
 			#address-cells = <1>;
@@ -277,12 +277,10 @@
 			compatible = "st,stm32-rtc";
 			reg = <0x40002800 0x400>;
 			clocks = <&rcc 1 CLK_RTC>;
-			clock-names = "ck_rtc";
 			assigned-clocks = <&rcc 1 CLK_RTC>;
 			assigned-clock-parents = <&rcc 1 CLK_LSE>;
 			interrupt-parent = <&exti>;
 			interrupts = <17 1>;
-			interrupt-names = "alarm";
 			st,syscfg = <&pwrcfg 0x00 0x100>;
 			status = "disabled";
 		};
@@ -362,6 +360,18 @@
 			status = "disabled";
 		};
 
+		i2c3: i2c@40005c00 {
+			compatible = "st,stm32f4-i2c";
+			reg = <0x40005c00 0x400>;
+			interrupts = <72>,
+				     <73>;
+			resets = <&rcc STM32F4_APB1_RESET(I2C3)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(I2C3)>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dac: dac@40007400 {
 			compatible = "st,stm32f4-dac-core";
 			reg = <0x40007400 0x400>;
@@ -374,14 +384,14 @@
 
 			dac1: dac@1 {
 				compatible = "st,stm32-dac";
-				#io-channels-cells = <1>;
+				#io-channel-cells = <1>;
 				reg = <1>;
 				status = "disabled";
 			};
 
 			dac2: dac@2 {
 				compatible = "st,stm32-dac";
-				#io-channels-cells = <1>;
+				#io-channel-cells = <1>;
 				reg = <2>;
 				status = "disabled";
 			};
@@ -546,8 +556,8 @@
 			status = "disabled";
 		};
 
-		syscfg: system-config@40013800 {
-			compatible = "syscon";
+		syscfg: syscon@40013800 {
+			compatible = "st,stm32-syscfg", "syscon";
 			reg = <0x40013800 0x400>;
 		};
 
@@ -620,6 +630,9 @@
 			reg = <0x40015000 0x400>;
 			interrupts = <85>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SPI5)>;
+			dmas = <&dma2 3 2 0x400 0x0>,
+				<&dma2 4 2 0x400 0x0>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -634,7 +647,7 @@
 		};
 
 		pwrcfg: power-config@40007000 {
-			compatible = "syscon";
+			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
 		};
 
@@ -748,7 +761,6 @@
 		rng: rng@50060800 {
 			compatible = "st,stm32-rng";
 			reg = <0x50060800 0x400>;
-			interrupts = <80>;
 			clocks = <&rcc 0 STM32F4_AHB2_CLOCK(RNG)>;
 
 		};
diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index 5a89f13054..3cf3a6aa6f 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -66,7 +66,7 @@
 		       };
 		};
 
-		qspi: quadspi@A0001000 {
+		qspi: spi@A0001000 {
 			compatible = "st,stm32f469-qspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -220,7 +220,7 @@
 		};
 	};
 
-	usart3_pins_a: usart3@0	{
+	usart3_pins_a: usart3-0	{
 		u-boot,dm-pre-reloc;
 		pins1 {
 			u-boot,dm-pre-reloc;
@@ -245,7 +245,7 @@
 
 &qspi {
 	reg = <0xA0001000 0x1000>, <0x90000000 0x1000000>;
-	flash0: n25q128a {
+	flash0: n25q128a@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm/dts/stm32f469-disco.dts b/arch/arm/dts/stm32f469-disco.dts
index d50c38dc78..23d87ee27a 100644
--- a/arch/arm/dts/stm32f469-disco.dts
+++ b/arch/arm/dts/stm32f469-disco.dts
@@ -19,7 +19,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@00000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x1000000>;
 	};
@@ -35,23 +35,30 @@
 		regulator-max-microvolt = <3300000>;
 	};
 
+	vdd_dsi: vdd-dsi {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_dsi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	soc {
 		dma-ranges = <0xc0000000 0x0 0x10000000>;
 	};
 
 	leds {
 		compatible = "gpio-leds";
-		green {
+		led-green {
 			gpios = <&gpiog 6 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
-		orange {
+		led-orange {
 			gpios = <&gpiod 4 GPIO_ACTIVE_LOW>;
 		};
-		red {
+		led-red {
 			gpios = <&gpiod 5 GPIO_ACTIVE_LOW>;
 		};
-		blue {
+		led-blue {
 			gpios = <&gpiok 3 GPIO_ACTIVE_LOW>;
 		};
 	};
@@ -114,6 +121,7 @@
 		compatible = "orisetech,otm8009a";
 		reg = <0>; /* dsi virtual channel (0..3) */
 		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
+		power-supply = <&vdd_dsi>;
 		status = "okay";
 
 		port {
@@ -125,7 +133,6 @@
 };
 
 &ltdc {
-	dma-ranges;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/dts/stm32f469.dtsi b/arch/arm/dts/stm32f469.dtsi
index 69c862d973..5f6a7976bb 100644
--- a/arch/arm/dts/stm32f469.dtsi
+++ b/arch/arm/dts/stm32f469.dtsi
@@ -8,7 +8,6 @@
 		dsi: dsi@40016c00 {
 			compatible = "st,stm32-dsi";
 			reg = <0x40016c00 0x800>;
-			interrupts = <92>;
 			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
 			reset-names = "apb";
 			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
diff --git a/arch/arm/dts/stm32f7-pinctrl.dtsi b/arch/arm/dts/stm32f7-pinctrl.dtsi
index 9314128df1..fe4cfda72a 100644
--- a/arch/arm/dts/stm32f7-pinctrl.dtsi
+++ b/arch/arm/dts/stm32f7-pinctrl.dtsi
@@ -127,7 +127,7 @@
 				st,bank-name = "GPIOK";
 			};
 
-			cec_pins_a: cec@0 {
+			cec_pins_a: cec-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 15, AF4)>; /* HDMI CEC */
 					slew-rate = <0>;
@@ -136,7 +136,7 @@
 				};
 			};
 
-			usart1_pins_a: usart1@0 {
+			usart1_pins_a: usart1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
 					bias-disable;
@@ -149,7 +149,7 @@
 				};
 			};
 
-			usart1_pins_b: usart1@1 {
+			usart1_pins_b: usart1-1 {
 				pins1 {
 					pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
 					bias-disable;
@@ -162,7 +162,7 @@
 				};
 			};
 
-			i2c1_pins_b: i2c1@0 {
+			i2c1_pins_b: i2c1-0 {
 				pins {
 					pinmux = <STM32_PINMUX('B', 9, AF4)>, /* I2C1 SDA */
 						 <STM32_PINMUX('B', 8, AF4)>; /* I2C1 SCL */
@@ -172,7 +172,7 @@
 				};
 			};
 
-			usbotg_hs_pins_a: usbotg-hs@0 {
+			usbotg_hs_pins_a: usbotg-hs-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
 						 <STM32_PINMUX('I', 11, AF10)>, /* OTG_HS_ULPI_DIR */
@@ -192,7 +192,7 @@
 				};
 			};
 
-			usbotg_hs_pins_b: usbotg-hs@1 {
+			usbotg_hs_pins_b: usbotg-hs-1 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
 						 <STM32_PINMUX('C', 2, AF10)>, /* OTG_HS_ULPI_DIR */
@@ -212,7 +212,7 @@
 				};
 			};
 
-			usbotg_fs_pins_a: usbotg-fs@0 {
+			usbotg_fs_pins_a: usbotg-fs-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 10, AF10)>, /* OTG_FS_ID */
 						 <STM32_PINMUX('A', 11, AF10)>, /* OTG_FS_DM */
@@ -223,7 +223,7 @@
 				};
 			};
 
-			sdio_pins_a: sdio_pins_a@0 {
+			sdio_pins_a: sdio-pins-a-0 {
 				pins {
 					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1 D0 */
 						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1 D1 */
@@ -236,7 +236,7 @@
 				};
 			};
 
-			sdio_pins_od_a: sdio_pins_od_a@0 {
+			sdio_pins_od_a: sdio-pins-od-a-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1 D0 */
 						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1 D1 */
@@ -254,7 +254,7 @@
 				};
 			};
 
-			sdio_pins_b: sdio_pins_b@0 {
+			sdio_pins_b: sdio-pins-b-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G', 9, AF11)>, /* SDMMC2 D0 */
 						 <STM32_PINMUX('G', 10, AF11)>, /* SDMMC2 D1 */
@@ -267,7 +267,7 @@
 				};
 			};
 
-			sdio_pins_od_b: sdio_pins_od_b@0 {
+			sdio_pins_od_b: sdio-pins-od-b-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('G', 9, AF11)>, /* SDMMC2 D0 */
 						 <STM32_PINMUX('G', 10, AF11)>, /* SDMMC2 D1 */
diff --git a/arch/arm/dts/stm32f7-u-boot.dtsi b/arch/arm/dts/stm32f7-u-boot.dtsi
index 32613c9769..46bd1102df 100644
--- a/arch/arm/dts/stm32f7-u-boot.dtsi
+++ b/arch/arm/dts/stm32f7-u-boot.dtsi
@@ -26,7 +26,6 @@
 			interrupt-names = "macirq", "eth_wake_irq";
 			snps,pbl = <8>;
 			snps,mixed-burst;
-			dma-ranges;
 			pinctrl-0 = <&ethernet_mii>;
 			phy-mode = "rmii";
 			phy-handle = <&phy0>;
@@ -43,7 +42,7 @@
 			};
 		};
 
-		qspi: quadspi@A0001000 {
+		qspi: spi@A0001000 {
 			compatible = "st,stm32f469-qspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index d8f9d8dc5f..860dd77668 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -212,7 +212,7 @@
 		};
 	};
 
-	usart1_pins_b: usart1@1	{
+	usart1_pins_b: usart1-1	{
 		u-boot,dm-pre-reloc;
 		pins1 {
 			u-boot,dm-pre-reloc;
@@ -229,7 +229,7 @@
 
 &qspi {
 	reg = <0xA0001000 0x1000>, <0x90000000 0x1000000>;
-	qflash0: n25q128a {
+	qflash0: n25q128a@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
index 4fef0164cf..9430dc08ec 100644
--- a/arch/arm/dts/stm32f746-disco.dts
+++ b/arch/arm/dts/stm32f746-disco.dts
@@ -19,7 +19,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xC0000000 0x800000>;
 	};
diff --git a/arch/arm/dts/stm32f746.dtsi b/arch/arm/dts/stm32f746.dtsi
index 3f312ab3a7..ba9b3cd03c 100644
--- a/arch/arm/dts/stm32f746.dtsi
+++ b/arch/arm/dts/stm32f746.dtsi
@@ -264,12 +264,10 @@
 			compatible = "st,stm32-rtc";
 			reg = <0x40002800 0x400>;
 			clocks = <&rcc 1 CLK_RTC>;
-			clock-names = "ck_rtc";
 			assigned-clocks = <&rcc 1 CLK_RTC>;
 			assigned-clock-parents = <&rcc 1 CLK_LSE>;
 			interrupt-parent = <&exti>;
 			interrupts = <17 1>;
-			interrupt-names = "alarm";
 			st,syscfg = <&pwrcfg 0x00 0x100>;
 			status = "disabled";
 		};
@@ -461,8 +459,8 @@
 			status = "disabled";
 		};
 
-		syscfg: system-config@40013800 {
-			compatible = "syscon";
+		syscfg: syscon@40013800 {
+			compatible = "st,stm32-syscfg", "syscon";
 			reg = <0x40013800 0x400>;
 		};
 
@@ -529,7 +527,7 @@
 		};
 
 		pwrcfg: power-config@40007000 {
-			compatible = "syscon";
+			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
 		};
 
@@ -551,7 +549,7 @@
 			assigned-clock-rates = <1000000>;
 		};
 
-		dma1: dma@40026000 {
+		dma1: dma-controller@40026000 {
 			compatible = "st,stm32-dma";
 			reg = <0x40026000 0x400>;
 			interrupts = <11>,
@@ -567,7 +565,7 @@
 			status = "disabled";
 		};
 
-		dma2: dma@40026400 {
+		dma2: dma-controller@40026400 {
 			compatible = "st,stm32-dma";
 			reg = <0x40026400 0x400>;
 			interrupts = <56>,
diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index c1d7d6b8f5..7dfe430a40 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -215,7 +215,7 @@
 		};
 	};
 
-	usart1_pins_a: usart1@0	{
+	usart1_pins_a: usart1-0	{
 		u-boot,dm-pre-reloc;
 		pins1 {
 			u-boot,dm-pre-reloc;
@@ -228,7 +228,7 @@
 
 &qspi {
 	reg = <0xA0001000 0x1000>, <0x90000000 0x4000000>;
-	flash0: mx66l51235l {
+	flash0: mx66l51235l@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
index 8d51e5b0fb..03cfbd7cc2 100644
--- a/arch/arm/dts/stm32f769-disco.dts
+++ b/arch/arm/dts/stm32f769-disco.dts
@@ -19,7 +19,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xC0000000 0x1000000>;
 	};
@@ -30,11 +30,11 @@
 
 	leds {
 		compatible = "gpio-leds";
-		green {
+		led-green {
 			gpios = <&gpioj 5 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
-		red {
+		led-red {
 			gpios = <&gpioj 13 GPIO_ACTIVE_HIGH>;
 		};
 	};
diff --git a/arch/arm/dts/stm32h743-pinctrl.dtsi b/arch/arm/dts/stm32h743-pinctrl.dtsi
index e3a5c537f3..141083f8d1 100644
--- a/arch/arm/dts/stm32h743-pinctrl.dtsi
+++ b/arch/arm/dts/stm32h743-pinctrl.dtsi
@@ -163,7 +163,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			i2c1_pins_a: i2c1@0 {
+			i2c1_pins_a: i2c1-0 {
 				pins {
 					pinmux = <STM32_PINMUX('B', 6, AF4)>, /* I2C1_SCL */
 						 <STM32_PINMUX('B', 7, AF4)>; /* I2C1_SDA */
@@ -173,7 +173,7 @@
 				};
 			};
 
-			ethernet_rmii: rmii@0 {
+			ethernet_rmii: rmii-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G', 11, AF11)>,
 						 <STM32_PINMUX('G', 13, AF11)>,
@@ -256,7 +256,7 @@
 				};
 			};
 
-			usart1_pins: usart1@0 {
+			usart1_pins: usart1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
 					bias-disable;
@@ -269,7 +269,7 @@
 				};
 			};
 
-			usart2_pins: usart2@0 {
+			usart2_pins: usart2-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
 					bias-disable;
@@ -282,7 +282,7 @@
 				};
 			};
 
-			usbotg_hs_pins_a: usbotg-hs@0 {
+			usbotg_hs_pins_a: usbotg-hs-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF10)>,	/* ULPI_NXT */
 							 <STM32_PINMUX('I', 11, AF10)>, /* ULPI_DIR> */
diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
index 4b4e7a99f7..e4e472336b 100644
--- a/arch/arm/dts/stm32h743.dtsi
+++ b/arch/arm/dts/stm32h743.dtsi
@@ -74,6 +74,7 @@
 			compatible = "st,stm32h7-spi";
 			reg = <0x40003800 0x400>;
 			interrupts = <36>;
+			resets = <&rcc STM32H7_APB1L_RESET(SPI2)>;
 			clocks = <&rcc SPI2_CK>;
 			status = "disabled";
 
@@ -85,12 +86,13 @@
 			compatible = "st,stm32h7-spi";
 			reg = <0x40003c00 0x400>;
 			interrupts = <51>;
+			resets = <&rcc STM32H7_APB1L_RESET(SPI3)>;
 			clocks = <&rcc SPI3_CK>;
 			status = "disabled";
 		};
 
 		usart2: serial@40004400 {
-			compatible = "st,stm32f7-uart";
+			compatible = "st,stm32h7-uart";
 			reg = <0x40004400 0x400>;
 			interrupts = <38>;
 			status = "disabled";
@@ -144,21 +146,21 @@
 
 			dac1: dac@1 {
 				compatible = "st,stm32-dac";
-				#io-channels-cells = <1>;
+				#io-channel-cells = <1>;
 				reg = <1>;
 				status = "disabled";
 			};
 
 			dac2: dac@2 {
 				compatible = "st,stm32-dac";
-				#io-channels-cells = <1>;
+				#io-channel-cells = <1>;
 				reg = <2>;
 				status = "disabled";
 			};
 		};
 
 		usart1: serial@40011000 {
-			compatible = "st,stm32f7-uart";
+			compatible = "st,stm32h7-uart";
 			reg = <0x40011000 0x400>;
 			interrupts = <37>;
 			status = "disabled";
@@ -171,6 +173,7 @@
 			compatible = "st,stm32h7-spi";
 			reg = <0x40013000 0x400>;
 			interrupts = <35>;
+			resets = <&rcc STM32H7_APB2_RESET(SPI1)>;
 			clocks = <&rcc SPI1_CK>;
 			status = "disabled";
 		};
@@ -181,6 +184,7 @@
 			compatible = "st,stm32h7-spi";
 			reg = <0x40013400 0x400>;
 			interrupts = <84>;
+			resets = <&rcc STM32H7_APB2_RESET(SPI4)>;
 			clocks = <&rcc SPI4_CK>;
 			status = "disabled";
 		};
@@ -191,11 +195,12 @@
 			compatible = "st,stm32h7-spi";
 			reg = <0x40015000 0x400>;
 			interrupts = <85>;
+			resets = <&rcc STM32H7_APB2_RESET(SPI5)>;
 			clocks = <&rcc SPI5_CK>;
 			status = "disabled";
 		};
 
-		dma1: dma@40020000 {
+		dma1: dma-controller@40020000 {
 			compatible = "st,stm32-dma";
 			reg = <0x40020000 0x400>;
 			interrupts = <11>,
@@ -213,7 +218,7 @@
 			status = "disabled";
 		};
 
-		dma2: dma@40020400 {
+		dma2: dma-controller@40020400 {
 			compatible = "st,stm32-dma";
 			reg = <0x40020400 0x400>;
 			interrupts = <56>,
@@ -293,7 +298,17 @@
 			status = "disabled";
 		};
 
-		mdma1: dma@52000000 {
+		ltdc: display-controller@50001000 {
+			compatible = "st,stm32-ltdc";
+			reg = <0x50001000 0x200>;
+			interrupts = <88>, <89>;
+			resets = <&rcc STM32H7_APB3_RESET(LTDC)>;
+			clocks = <&rcc LTDC_CK>;
+			clock-names = "lcd";
+			status = "disabled";
+		};
+
+		mdma1: dma-controller@52000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x52000000 0x1000>;
 			interrupts = <122>;
@@ -325,8 +340,8 @@
 			interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <62>, <76>;
 		};
 
-		syscfg: system-config@58000400 {
-			compatible = "syscon";
+		syscfg: syscon@58000400 {
+			compatible = "st,stm32-syscfg", "syscon";
 			reg = <0x58000400 0x400>;
 		};
 
@@ -336,6 +351,7 @@
 			compatible = "st,stm32h7-spi";
 			reg = <0x58001400 0x400>;
 			interrupts = <86>;
+			resets = <&rcc STM32H7_APB4_RESET(SPI6)>;
 			clocks = <&rcc SPI6_CK>;
 			status = "disabled";
 		};
@@ -451,7 +467,6 @@
 			assigned-clock-parents = <&rcc LSE_CK>;
 			interrupt-parent = <&exti>;
 			interrupts = <17 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "alarm";
 			st,syscfg = <&pwrcfg 0x00 0x100>;
 			status = "disabled";
 		};
@@ -466,7 +481,7 @@
 		};
 
 		pwrcfg: power-config@58024800 {
-			compatible = "syscon";
+			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x58024800 0x400>;
 		};
 
diff --git a/arch/arm/dts/stm32h743i-disco.dts b/arch/arm/dts/stm32h743i-disco.dts
index 43c30bfcbe..81007161e7 100644
--- a/arch/arm/dts/stm32h743i-disco.dts
+++ b/arch/arm/dts/stm32h743i-disco.dts
@@ -17,7 +17,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@d0000000 {
 		device_type = "memory";
 		reg = <0xd0000000 0x2000000>;
 	};
diff --git a/arch/arm/dts/stm32h743i-eval.dts b/arch/arm/dts/stm32h743i-eval.dts
index e4d3c58f3d..8f398178f5 100644
--- a/arch/arm/dts/stm32h743i-eval.dts
+++ b/arch/arm/dts/stm32h743i-eval.dts
@@ -53,7 +53,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@d0000000 {
 		device_type = "memory";
 		reg = <0xd0000000 0x2000000>;
 	};
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
