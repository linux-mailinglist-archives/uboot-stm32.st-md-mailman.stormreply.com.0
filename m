Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE057AF76
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0CE1C35E03
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38A37C35E03
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGSfw001308; Tue, 30 Jul 2019 19:17:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tC3BWbawFfddIys0UBaq5UUcvzptfGjR2oi99s2i+6U=;
 b=lDg7cUG6+6C05ObThZf/49nlEdQISCEvjwghgN7fIp6mTTnIXYTixUThkXNTEujYksC4
 KO3nUbowVDiV552BsDjzyLDAUuRfPqRcQoUP8p3LvHTXLzYnajXjsew4HetJIOn23psi
 t4vPwRCyDX7hW4xX+FJeNGN09aZ9Q2TOAfWbaOD6c5ftftJ5A6YQi8FFqyaCyt/tqdaw
 51S0Ci5bxIZ/ti1eQ3jpqd6yDuWtwli02p6XQMR+J05Zq4L84HDbLwsNE0il5MT0ZZRN
 O4proFJfi/QwUo+RSHQLPNH8XbDL8qdblcCXo5nhiyELXkiqCl+xtkBU0cc4NdDAqQOQ oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0ccwkf7n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E2C731;
 Tue, 30 Jul 2019 17:17:04 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5763929B3;
 Tue, 30 Jul 2019 17:17:04 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:04 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:02
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:12 +0200
Message-ID: <1564507016-16570-5-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 04/48] ARM: dts: stm32mp1: sync device tree
	with v5.3-rc2
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

Synchronize device tree with v5.3-rc2 label and
update the associated u-boot dtsi.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157-pinctrl.dtsi     | 234 ++++++++++++++++++++++++++-----
 arch/arm/dts/stm32mp157a-avenger96.dts   |  39 +++---
 arch/arm/dts/stm32mp157a-dk1.dts         |  68 ++++++++-
 arch/arm/dts/stm32mp157c-ed1.dts         |  18 ++-
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi |   5 -
 arch/arm/dts/stm32mp157c-ev1.dts         | 109 +++++++++++++-
 arch/arm/dts/stm32mp157c.dtsi            | 180 ++++++++++++++++++++++++
 arch/arm/dts/stm32mp157xaa-pinctrl.dtsi  |  90 ++++++++++++
 arch/arm/dts/stm32mp157xab-pinctrl.dtsi  |  62 ++++++++
 arch/arm/dts/stm32mp157xac-pinctrl.dtsi  |  78 +++++++++++
 arch/arm/dts/stm32mp157xad-pinctrl.dtsi  |  62 ++++++++
 11 files changed, 885 insertions(+), 60 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp157xaa-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp157xab-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp157xac-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp157xad-pinctrl.dtsi

diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
index 9bae850..4367e8d 100644
--- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
@@ -25,8 +25,7 @@
 				reg = <0x0 0x400>;
 				clocks = <&rcc GPIOA>;
 				st,bank-name = "GPIOA";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
+				status = "disabled";
 			};
 
 			gpiob: gpio@50003000 {
@@ -37,8 +36,7 @@
 				reg = <0x1000 0x400>;
 				clocks = <&rcc GPIOB>;
 				st,bank-name = "GPIOB";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
+				status = "disabled";
 			};
 
 			gpioc: gpio@50004000 {
@@ -49,8 +47,7 @@
 				reg = <0x2000 0x400>;
 				clocks = <&rcc GPIOC>;
 				st,bank-name = "GPIOC";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
+				status = "disabled";
 			};
 
 			gpiod: gpio@50005000 {
@@ -61,8 +58,7 @@
 				reg = <0x3000 0x400>;
 				clocks = <&rcc GPIOD>;
 				st,bank-name = "GPIOD";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
+				status = "disabled";
 			};
 
 			gpioe: gpio@50006000 {
@@ -73,8 +69,7 @@
 				reg = <0x4000 0x400>;
 				clocks = <&rcc GPIOE>;
 				st,bank-name = "GPIOE";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
+				status = "disabled";
 			};
 
 			gpiof: gpio@50007000 {
@@ -85,8 +80,7 @@
 				reg = <0x5000 0x400>;
 				clocks = <&rcc GPIOF>;
 				st,bank-name = "GPIOF";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 80 16>;
+				status = "disabled";
 			};
 
 			gpiog: gpio@50008000 {
@@ -97,8 +91,7 @@
 				reg = <0x6000 0x400>;
 				clocks = <&rcc GPIOG>;
 				st,bank-name = "GPIOG";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 96 16>;
+				status = "disabled";
 			};
 
 			gpioh: gpio@50009000 {
@@ -109,8 +102,7 @@
 				reg = <0x7000 0x400>;
 				clocks = <&rcc GPIOH>;
 				st,bank-name = "GPIOH";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 112 16>;
+				status = "disabled";
 			};
 
 			gpioi: gpio@5000a000 {
@@ -121,8 +113,7 @@
 				reg = <0x8000 0x400>;
 				clocks = <&rcc GPIOI>;
 				st,bank-name = "GPIOI";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 128 16>;
+				status = "disabled";
 			};
 
 			gpioj: gpio@5000b000 {
@@ -133,8 +124,7 @@
 				reg = <0x9000 0x400>;
 				clocks = <&rcc GPIOJ>;
 				st,bank-name = "GPIOJ";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 144 16>;
+				status = "disabled";
 			};
 
 			gpiok: gpio@5000c000 {
@@ -145,8 +135,7 @@
 				reg = <0xa000 0x400>;
 				clocks = <&rcc GPIOK>;
 				st,bank-name = "GPIOK";
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl 0 160 8>;
+				status = "disabled";
 			};
 
 			adc12_usb_pwr_pins_a: adc12-usb-pwr-pins-0 {
@@ -186,6 +175,47 @@
 				};
 			};
 
+			dcmi_pins_a: dcmi-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 8,  AF13)>,/* DCMI_HSYNC */
+						 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
+						 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
+						 <STM32_PINMUX('H', 9,  AF13)>,/* DCMI_D0 */
+						 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
+						 <STM32_PINMUX('H', 11, AF13)>,/* DCMI_D2 */
+						 <STM32_PINMUX('H', 12, AF13)>,/* DCMI_D3 */
+						 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
+						 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
+						 <STM32_PINMUX('B', 8,  AF13)>,/* DCMI_D6 */
+						 <STM32_PINMUX('E', 6,  AF13)>,/* DCMI_D7 */
+						 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
+						 <STM32_PINMUX('H', 7,  AF13)>,/* DCMI_D9 */
+						 <STM32_PINMUX('I', 3,  AF13)>,/* DCMI_D10 */
+						 <STM32_PINMUX('H', 15, AF13)>;/* DCMI_D11 */
+					bias-disable;
+				};
+			};
+
+			dcmi_sleep_pins_a: dcmi-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 8,  ANALOG)>,/* DCMI_HSYNC */
+						 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
+						 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
+						 <STM32_PINMUX('H', 9,  ANALOG)>,/* DCMI_D0 */
+						 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
+						 <STM32_PINMUX('H', 11, ANALOG)>,/* DCMI_D2 */
+						 <STM32_PINMUX('H', 12, ANALOG)>,/* DCMI_D3 */
+						 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
+						 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
+						 <STM32_PINMUX('B', 8,  ANALOG)>,/* DCMI_D6 */
+						 <STM32_PINMUX('E', 6,  ANALOG)>,/* DCMI_D7 */
+						 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
+						 <STM32_PINMUX('H', 7,  ANALOG)>,/* DCMI_D9 */
+						 <STM32_PINMUX('I', 3,  ANALOG)>,/* DCMI_D10 */
+						 <STM32_PINMUX('H', 15, ANALOG)>;/* DCMI_D11 */
+				};
+			};
+
 			ethernet0_rgmii_pins_a: rgmii-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
@@ -308,6 +338,13 @@
 				};
 			};
 
+			i2c1_pins_sleep_b: i2c1-3 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
+						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
+				};
+			};
+
 			i2c2_pins_a: i2c2-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
@@ -325,16 +362,21 @@
 				};
 			};
 
-			i2c2_pins_b: i2c2-2 {
+			i2c2_pins_b1: i2c2-2 {
 				pins {
-					pinmux = <STM32_PINMUX('Z', 0, AF3)>, /* I2C2_SCL */
-						 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
+					pinmux = <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
 					bias-disable;
 					drive-open-drain;
 					slew-rate = <0>;
 				};
 			};
 
+			i2c2_pins_sleep_b1: i2c2-3 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
+				};
+			};
+
 			i2c5_pins_a: i2c5-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
@@ -353,6 +395,25 @@
 				};
 			};
 
+			i2s2_pins_a: i2s2-0 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 3, AF5)>, /* I2S2_SDO */
+						 <STM32_PINMUX('B', 9, AF5)>, /* I2S2_WS */
+						 <STM32_PINMUX('A', 9, AF5)>; /* I2S2_CK */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-disable;
+				};
+			};
+
+			i2s2_pins_sleep_a: i2s2-1 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 3, ANALOG)>, /* I2S2_SDO */
+						 <STM32_PINMUX('B', 9, ANALOG)>, /* I2S2_WS */
+						 <STM32_PINMUX('A', 9, ANALOG)>; /* I2S2_CK */
+				};
+			};
+
 			ltdc_pins_a: ltdc-a-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G',  7, AF14)>, /* LCD_CLK */
@@ -547,6 +608,12 @@
 				};
 			};
 
+			qspi_clk_sleep_pins_a: qspi-clk-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 10, ANALOG)>; /* QSPI_CLK */
+				};
+			};
+
 			qspi_bk1_pins_a: qspi-bk1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
@@ -565,6 +632,16 @@
 				};
 			};
 
+			qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
+						 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
+						 <STM32_PINMUX('F', 7, ANALOG)>, /* QSPI_BK1_IO2 */
+						 <STM32_PINMUX('F', 6, ANALOG)>, /* QSPI_BK1_IO3 */
+						 <STM32_PINMUX('B', 6, ANALOG)>; /* QSPI_BK1_NCS */
+				};
+			};
+
 			qspi_bk2_pins_a: qspi-bk2-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('H', 2, AF9)>, /* QSPI_BK2_IO0 */
@@ -583,6 +660,89 @@
 				};
 			};
 
+			qspi_bk2_sleep_pins_a: qspi-bk2-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* QSPI_BK2_IO0 */
+						 <STM32_PINMUX('H', 3, ANALOG)>, /* QSPI_BK2_IO1 */
+						 <STM32_PINMUX('G', 10, ANALOG)>, /* QSPI_BK2_IO2 */
+						 <STM32_PINMUX('G', 7, ANALOG)>, /* QSPI_BK2_IO3 */
+						 <STM32_PINMUX('C', 0, ANALOG)>; /* QSPI_BK2_NCS */
+				};
+			};
+
+			sai2a_pins_a: sai2a-0 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 5, AF10)>, /* SAI2_SCK_A */
+						 <STM32_PINMUX('I', 6, AF10)>, /* SAI2_SD_A */
+						 <STM32_PINMUX('I', 7, AF10)>, /* SAI2_FS_A */
+						 <STM32_PINMUX('E', 0, AF10)>; /* SAI2_MCLK_A */
+					slew-rate = <0>;
+					drive-push-pull;
+					bias-disable;
+				};
+			};
+
+			sai2a_sleep_pins_a: sai2a-1 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 5, ANALOG)>, /* SAI2_SCK_A */
+						 <STM32_PINMUX('I', 6, ANALOG)>, /* SAI2_SD_A */
+						 <STM32_PINMUX('I', 7, ANALOG)>, /* SAI2_FS_A */
+						 <STM32_PINMUX('E', 0, ANALOG)>; /* SAI2_MCLK_A */
+				};
+			};
+
+			sai2b_pins_a: sai2b-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('E', 12, AF10)>, /* SAI2_SCK_B */
+						 <STM32_PINMUX('E', 13, AF10)>, /* SAI2_FS_B */
+						 <STM32_PINMUX('E', 14, AF10)>; /* SAI2_MCLK_B */
+					slew-rate = <0>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
+					bias-disable;
+				};
+			};
+
+			sai2b_sleep_pins_a: sai2b-1 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* SAI2_SD_B */
+						 <STM32_PINMUX('E', 12, ANALOG)>, /* SAI2_SCK_B */
+						 <STM32_PINMUX('E', 13, ANALOG)>, /* SAI2_FS_B */
+						 <STM32_PINMUX('E', 14, ANALOG)>; /* SAI2_MCLK_B */
+				};
+			};
+
+			sai2b_pins_b: sai2b-2 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
+					bias-disable;
+				};
+			};
+
+			sai2b_sleep_pins_b: sai2b-3 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
+				};
+			};
+
+			sai4a_pins_a: sai4a-0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 5, AF10)>; /* SAI4_SD_A */
+					slew-rate = <0>;
+					drive-push-pull;
+					bias-disable;
+				};
+			};
+
+			sai4a_sleep_pins_a: sai4a-1 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* SAI4_SD_A */
+				};
+			};
+
 			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 				pins {
 					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
@@ -752,12 +912,6 @@
 					bias-disable;
 				};
 			};
-
-			usbotg_hs_pins_a: usbotg_hs-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
-				};
-			};
 		};
 
 		pinctrl_z: pin-controller-z@54004000 {
@@ -779,8 +933,22 @@
 				clocks = <&rcc GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl_z 0 400 8>;
+				status = "disabled";
+			};
+
+			i2c2_pins_b2: i2c2-0 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 0, AF3)>; /* I2C2_SCL */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			i2c2_pins_sleep_b2: i2c2-1 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 0, ANALOG)>; /* I2C2_SCL */
+				};
 			};
 
 			i2c4_pins_a: i2c4-0 {
diff --git a/arch/arm/dts/stm32mp157a-avenger96.dts b/arch/arm/dts/stm32mp157a-avenger96.dts
index dd08597..ba86cf5 100644
--- a/arch/arm/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/dts/stm32mp157a-avenger96.dts
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 /*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
- *
  * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  */
@@ -10,17 +7,19 @@
 /dts-v1/;
 
 #include "stm32mp157c.dtsi"
-#include "stm32mp157-pinctrl.dtsi"
+#include "stm32mp157xac-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
 / {
 	model = "Arrow Electronics STM32MP157A Avenger96 board";
-	compatible = "st,stm32mp157a-avenger96", "st,stm32mp157";
+	compatible = "arrow,stm32mp157a-avenger96", "st,stm32mp157";
 
 	aliases {
 		ethernet0 = &ethernet0;
+		mmc0 = &sdmmc1;
 		serial0 = &uart4;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -28,6 +27,7 @@
 	};
 
 	memory@c0000000 {
+		device_type = "memory";
 		reg = <0xc0000000 0x40000000>;
 	};
 
@@ -109,7 +109,7 @@
 
 &i2c2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2_pins_b>;
+	pinctrl-0 = <&i2c2_pins_b1 &i2c2_pins_b2>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
@@ -151,10 +151,10 @@
 
 			vddcore: buck1 {
 				regulator-name = "vddcore";
-				regulator-min-microvolt = <800000>;
+				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
-				regulator-initial-mode = <2>;
+				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
 			};
 
@@ -163,17 +163,17 @@
 				regulator-min-microvolt = <1350000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
-				regulator-initial-mode = <2>;
+				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
 			};
 
 			vdd: buck3 {
 				regulator-name = "vdd";
-				regulator-min-microvolt = <2500000>;
-				regulator-max-microvolt = <2500000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 				st,mask_reset;
-				regulator-initial-mode = <8>;
+				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
 			};
 
@@ -183,7 +183,7 @@
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 				regulator-over-current-protection;
-				regulator-initial-mode = <8>;
+				regulator-initial-mode = <0>;
 			};
 
 			vdda: ldo1 {
@@ -204,8 +204,8 @@
 
 			vtt_ddr: ldo3 {
 				regulator-name = "vtt_ddr";
-				regulator-min-microvolt = <0000000>;
-				regulator-max-microvolt = <1000000>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
 				regulator-always-on;
 				regulator-over-current-protection;
 			};
@@ -233,6 +233,7 @@
 				regulator-max-microvolt = <1800000>;
 				interrupts = <IT_CURLIM_LDO6 0>;
 				interrupt-parent = <&pmic>;
+				regulator-enable-ramp-delay = <300000>;
 			};
 
 			vref_ddr: vref_ddr {
@@ -294,8 +295,10 @@
 };
 
 &sdmmc1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	broken-cd;
 	st,sig-dir;
 	st,neg-edge;
@@ -325,12 +328,16 @@
 };
 
 &uart4 {
+	/* On Low speed expansion header */
+	label = "LS-UART1";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_b>;
 	status = "okay";
 };
 
 &uart7 {
+	/* On Low speed expansion header */
+	label = "LS-UART0";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart7_pins_a>;
 	status = "okay";
diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
index adb2464..1d5c1a6 100644
--- a/arch/arm/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/dts/stm32mp157a-dk1.dts
@@ -7,7 +7,7 @@
 /dts-v1/;
 
 #include "stm32mp157c.dtsi"
-#include "stm32mp157-pinctrl.dtsi"
+#include "stm32mp157xac-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
@@ -28,6 +28,17 @@
 		reg = <0xc0000000 0x20000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gpu_reserved: gpu@d4000000 {
+			reg = <0xd4000000 0x4000000>;
+			no-map;
+		};
+	};
+
 	led {
 		compatible = "gpio-leds";
 		blue {
@@ -65,6 +76,47 @@
 	};
 };
 
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_pins_sleep_a>;
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <7>;
+	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	hdmi-transmitter@39 {
+		compatible = "sil,sii9022";
+		reg = <0x39>;
+		iovcc-supply = <&v3v3_hdmi>;
+		cvcc12-supply = <&v1v2_hdmi>;
+		reset-gpios = <&gpioa 10 GPIO_ACTIVE_LOW>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpiog>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&ltdc_pins_a>;
+		pinctrl-1 = <&ltdc_pins_sleep_a>;
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sii9022_in: endpoint {
+					remote-endpoint = <&ltdc_ep0_out>;
+				};
+			};
+		};
+	};
+};
 
 &i2c4 {
 	pinctrl-names = "default";
@@ -241,6 +293,20 @@
 	status = "okay";
 };
 
+&ltdc {
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ltdc_ep0_out: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&sii9022_in>;
+		};
+	};
+};
+
 &pwr {
 	pwr-supply = <&vdd>;
 };
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index 11981d6..94ac025 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -6,7 +6,7 @@
 /dts-v1/;
 
 #include "stm32mp157c.dtsi"
-#include "stm32mp157-pinctrl.dtsi"
+#include "stm32mp157xaa-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
@@ -23,6 +23,17 @@
 		reg = <0xC0000000 0x40000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gpu_reserved: gpu@e8000000 {
+			reg = <0xe8000000 0x8000000>;
+			no-map;
+		};
+	};
+
 	aliases {
 		serial0 = &uart4;
 	};
@@ -45,6 +56,11 @@
 	status = "okay";
 };
 
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
index b656eb1..ec60486 100644
--- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
@@ -17,14 +17,9 @@
 };
 
 &flash0 {
-	compatible = "jedec,spi-nor";
 	u-boot,dm-spl;
 };
 
-&flash1 {
-	compatible = "jedec,spi-nor";
-};
-
 &qspi {
 	u-boot,dm-spl;
 };
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index ca2a333..23de232 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -7,6 +7,7 @@
 
 #include "stm32mp157c-ed1.dts"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
@@ -21,6 +22,51 @@
 		ethernet0 = &ethernet0;
 	};
 
+	clocks {
+		clk_ext_camera: clk-ext-camera {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+	};
+
+	joystick {
+		compatible = "gpio-keys";
+		#size-cells = <0>;
+		pinctrl-0 = <&joystick_pins>;
+		pinctrl-names = "default";
+		button-0 {
+			label = "JoySel";
+			linux,code = <KEY_ENTER>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <0 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-1 {
+			label = "JoyDown";
+			linux,code = <KEY_DOWN>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-2 {
+			label = "JoyLeft";
+			linux,code = <KEY_LEFT>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <2 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-3 {
+			label = "JoyRight";
+			linux,code = <KEY_RIGHT>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-4 {
+			label = "JoyUp";
+			linux,code = <KEY_UP>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+		};
+	};
+
 	panel_backlight: panel-backlight {
 		compatible = "gpio-backlight";
 		gpios = <&gpiod 13 GPIO_ACTIVE_LOW>;
@@ -35,6 +81,23 @@
 	status = "okay";
 };
 
+&dcmi {
+	status = "okay";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dcmi_pins_a>;
+	pinctrl-1 = <&dcmi_sleep_pins_a>;
+
+	port {
+		dcmi_0: endpoint {
+			remote-endpoint = <&ov5640_0>;
+			bus-width = <8>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pclk-sample = <1>;
+		};
+	};
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -64,6 +127,7 @@
 		reg = <0>;
 		reset-gpios = <&gpiof 15 GPIO_ACTIVE_LOW>;
 		backlight = <&panel_backlight>;
+		power-supply = <&v3v3>;
 		status = "okay";
 
 		port {
@@ -116,6 +180,31 @@
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
 
+	ov5640: camera@3c {
+		compatible = "ovti,ov5640";
+		pinctrl-names = "default";
+		pinctrl-0 = <&ov5640_pins>;
+		reg = <0x3c>;
+		clocks = <&clk_ext_camera>;
+		clock-names = "xclk";
+		DOVDD-supply = <&v2v8>;
+		powerdown-gpios = <&stmfx_pinctrl 18 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&stmfx_pinctrl 19 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
+		status = "okay";
+
+		port {
+			ov5640_0: endpoint {
+				remote-endpoint = <&dcmi_0>;
+				bus-width = <8>;
+				data-shift = <2>; /* lines 9:2 are used */
+				hsync-active = <0>;
+				vsync-active = <0>;
+				pclk-sample = <1>;
+			};
+		};
+	};
+
 	stmfx: stmfx@42 {
 		compatible = "st,stmfx-0300";
 		reg = <0x42>;
@@ -130,7 +219,18 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
-			status = "disabled";
+
+			joystick_pins: joystick {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
+				drive-push-pull;
+				bias-pull-down;
+			};
+
+			ov5640_pins: camera {
+				pins = "agpio2", "agpio3"; /* stmfx pins 18 & 19 */
+				drive-push-pull;
+				output-low;
+			};
 		};
 	};
 };
@@ -165,14 +265,16 @@
 };
 
 &qspi {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a &qspi_bk2_sleep_pins_a>;
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
 
 	flash0: mx66l51235l@0 {
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <108000000>;
@@ -181,6 +283,7 @@
 	};
 
 	flash1: mx66l51235l@1 {
+		compatible = "jedec,spi-nor";
 		reg = <1>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <108000000>;
@@ -245,8 +348,6 @@
 };
 
 &usbotg_hs {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usbotg_hs_pins_a>;
 	dr_mode = "peripheral";
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
index d15fba0..bcd8c1a 100644
--- a/arch/arm/dts/stm32mp157c.dtsi
+++ b/arch/arm/dts/stm32mp157c.dtsi
@@ -372,6 +372,17 @@
 			status = "disabled";
 		};
 
+		i2s2: audio-controller@4000b000 {
+			compatible = "st,stm32h7-i2s";
+			#sound-dai-cells = <0>;
+			reg = <0x4000b000 0x400>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 39 0x400 0x01>,
+			       <&dmamux1 40 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		spi3: spi@4000c000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -386,6 +397,17 @@
 			status = "disabled";
 		};
 
+		i2s3: audio-controller@4000c000 {
+			compatible = "st,stm32h7-i2s";
+			#sound-dai-cells = <0>;
+			reg = <0x4000c000 0x400>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 61 0x400 0x01>,
+			       <&dmamux1 62 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		spdifrx: audio-controller@4000d000 {
 			compatible = "st,stm32h7-spdifrx";
 			#sound-dai-cells = <0>;
@@ -614,6 +636,17 @@
 			status = "disabled";
 		};
 
+		i2s1: audio-controller@44004000 {
+			compatible = "st,stm32h7-i2s";
+			#sound-dai-cells = <0>;
+			reg = <0x44004000 0x400>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 37 0x400 0x01>,
+			       <&dmamux1 38 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		spi4: spi@44005000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -715,6 +748,100 @@
 			status = "disabled";
 		};
 
+		sai1: sai@4400a000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x4400a000 0x400>;
+			reg = <0x4400a000 0x4>, <0x4400a3f0 0x10>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI1_R>;
+			status = "disabled";
+
+			sai1a: audio-controller@4400a004 {
+				#sound-dai-cells = <0>;
+
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x1c>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 87 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai1b: audio-controller@4400a024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 88 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		sai2: sai@4400b000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x4400b000 0x400>;
+			reg = <0x4400b000 0x4>, <0x4400b3f0 0x10>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI2_R>;
+			status = "disabled";
+
+			sai2a: audio-controller@4400b004 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x1c>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 89 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai2b: audio-controller@4400b024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 90 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		sai3: sai@4400c000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x4400c000 0x400>;
+			reg = <0x4400c000 0x4>, <0x4400c3f0 0x10>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI3_R>;
+			status = "disabled";
+
+			sai3a: audio-controller@4400c004 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x04 0x1c>;
+				clocks = <&rcc SAI3_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 113 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai3b: audio-controller@4400c024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI3_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 114 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
 		dfsdm: dfsdm@4400d000 {
 			compatible = "st,stm32mp1-dfsdm";
 			reg = <0x4400d000 0x800>;
@@ -945,6 +1072,18 @@
 			status = "disabled";
 		};
 
+		dcmi: dcmi@4c006000 {
+			compatible = "st,stm32-dcmi";
+			reg = <0x4c006000 0x400>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc CAMITF_R>;
+			clocks = <&rcc DCMI>;
+			clock-names = "mclk";
+			dmas = <&dmamux1 75 0x400 0x0d>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		rcc: rcc@50000000 {
 			compatible = "st,stm32mp1-rcc", "syscon";
 			reg = <0x50000000 0x1000>;
@@ -1084,6 +1223,37 @@
 			status = "disabled";
 		};
 
+		sai4: sai@50027000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x50027000 0x400>;
+			reg = <0x50027000 0x4>, <0x500273f0 0x10>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI4_R>;
+			status = "disabled";
+
+			sai4a: audio-controller@50027004 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x04 0x1c>;
+				clocks = <&rcc SAI4_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 99 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai4b: audio-controller@50027024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI4_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 100 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
 		dts: thermal@50028000 {
 			compatible = "st,stm32-thermal";
 			reg = <0x50028000 0x100>;
@@ -1242,6 +1412,16 @@
 			status = "disabled";
 		};
 
+		gpu: gpu@59000000 {
+			compatible = "vivante,gc";
+			reg = <0x59000000 0x800>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc GPU>, <&rcc GPU_K>;
+			clock-names = "bus" ,"core";
+			resets = <&rcc GPU_R>;
+			status = "disabled";
+		};
+
 		dsi: dsi@5a000000 {
 			compatible = "st,stm32-dsi";
 			reg = <0x5a000000 0x800>;
diff --git a/arch/arm/dts/stm32mp157xaa-pinctrl.dtsi b/arch/arm/dts/stm32mp157xaa-pinctrl.dtsi
new file mode 100644
index 0000000..875adf5
--- /dev/null
+++ b/arch/arm/dts/stm32mp157xaa-pinctrl.dtsi
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com>
+ */
+
+#include "stm32mp157-pinctrl.dtsi"
+/ {
+	soc {
+		pinctrl: pin-controller@50002000 {
+			st,package = <STM32MP_PKG_AA>;
+
+			gpioa: gpio@50002000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 0 16>;
+			};
+
+			gpiob: gpio@50003000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 16 16>;
+			};
+
+			gpioc: gpio@50004000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 32 16>;
+			};
+
+			gpiod: gpio@50005000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 48 16>;
+			};
+
+			gpioe: gpio@50006000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 64 16>;
+			};
+
+			gpiof: gpio@50007000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 80 16>;
+			};
+
+			gpiog: gpio@50008000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 96 16>;
+			};
+
+			gpioh: gpio@50009000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 112 16>;
+			};
+
+			gpioi: gpio@5000a000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 128 16>;
+			};
+
+			gpioj: gpio@5000b000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 144 16>;
+			};
+
+			gpiok: gpio@5000c000 {
+				status = "okay";
+				ngpios = <8>;
+				gpio-ranges = <&pinctrl 0 160 8>;
+			};
+		};
+
+		pinctrl_z: pin-controller-z@54004000 {
+			st,package = <STM32MP_PKG_AA>;
+
+			gpioz: gpio@54004000 {
+				status = "okay";
+				ngpios = <8>;
+				gpio-ranges = <&pinctrl_z 0 400 8>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32mp157xab-pinctrl.dtsi b/arch/arm/dts/stm32mp157xab-pinctrl.dtsi
new file mode 100644
index 0000000..961fa12
--- /dev/null
+++ b/arch/arm/dts/stm32mp157xab-pinctrl.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com>
+ */
+
+#include "stm32mp157-pinctrl.dtsi"
+/ {
+	soc {
+		pinctrl: pin-controller@50002000 {
+			st,package = <STM32MP_PKG_AB>;
+
+			gpioa: gpio@50002000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 0 16>;
+			};
+
+			gpiob: gpio@50003000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 16 16>;
+			};
+
+			gpioc: gpio@50004000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 32 16>;
+			};
+
+			gpiod: gpio@50005000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 48 16>;
+			};
+
+			gpioe: gpio@50006000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 64 16>;
+			};
+
+			gpiof: gpio@50007000 {
+				status = "okay";
+				ngpios = <6>;
+				gpio-ranges = <&pinctrl 6 86 6>;
+			};
+
+			gpiog: gpio@50008000 {
+				status = "okay";
+				ngpios = <10>;
+				gpio-ranges = <&pinctrl 6 102 10>;
+			};
+
+			gpioh: gpio@50009000 {
+				status = "okay";
+				ngpios = <2>;
+				gpio-ranges = <&pinctrl 0 112 2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32mp157xac-pinctrl.dtsi b/arch/arm/dts/stm32mp157xac-pinctrl.dtsi
new file mode 100644
index 0000000..26600f1
--- /dev/null
+++ b/arch/arm/dts/stm32mp157xac-pinctrl.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com>
+ */
+
+#include "stm32mp157-pinctrl.dtsi"
+/ {
+	soc {
+		pinctrl: pin-controller@50002000 {
+			st,package = <STM32MP_PKG_AC>;
+
+			gpioa: gpio@50002000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 0 16>;
+			};
+
+			gpiob: gpio@50003000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 16 16>;
+			};
+
+			gpioc: gpio@50004000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 32 16>;
+			};
+
+			gpiod: gpio@50005000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 48 16>;
+			};
+
+			gpioe: gpio@50006000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 64 16>;
+			};
+
+			gpiof: gpio@50007000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 80 16>;
+			};
+
+			gpiog: gpio@50008000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 96 16>;
+			};
+
+			gpioh: gpio@50009000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 112 16>;
+			};
+
+			gpioi: gpio@5000a000 {
+				status = "okay";
+				ngpios = <12>;
+				gpio-ranges = <&pinctrl 0 128 12>;
+			};
+		};
+
+		pinctrl_z: pin-controller-z@54004000 {
+			st,package = <STM32MP_PKG_AC>;
+
+			gpioz: gpio@54004000 {
+				status = "okay";
+				ngpios = <8>;
+				gpio-ranges = <&pinctrl_z 0 400 8>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32mp157xad-pinctrl.dtsi b/arch/arm/dts/stm32mp157xad-pinctrl.dtsi
new file mode 100644
index 0000000..910113f
--- /dev/null
+++ b/arch/arm/dts/stm32mp157xad-pinctrl.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com>
+ */
+
+#include "stm32mp157-pinctrl.dtsi"
+/ {
+	soc {
+		pinctrl: pin-controller@50002000 {
+			st,package = <STM32MP_PKG_AD>;
+
+			gpioa: gpio@50002000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 0 16>;
+			};
+
+			gpiob: gpio@50003000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 16 16>;
+			};
+
+			gpioc: gpio@50004000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 32 16>;
+			};
+
+			gpiod: gpio@50005000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 48 16>;
+			};
+
+			gpioe: gpio@50006000 {
+				status = "okay";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 64 16>;
+			};
+
+			gpiof: gpio@50007000 {
+				status = "okay";
+				ngpios = <6>;
+				gpio-ranges = <&pinctrl 6 86 6>;
+			};
+
+			gpiog: gpio@50008000 {
+				status = "okay";
+				ngpios = <10>;
+				gpio-ranges = <&pinctrl 6 102 10>;
+			};
+
+			gpioh: gpio@50009000 {
+				status = "okay";
+				ngpios = <2>;
+				gpio-ranges = <&pinctrl 0 112 2>;
+			};
+		};
+	};
+};
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
