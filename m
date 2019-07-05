Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1D76092A
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 17:20:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCFF2C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 15:20:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 779FCC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:20:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FGDb5002472; Fri, 5 Jul 2019 17:20:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MpkOhkOvCvwW1l1Ff1t6pmUYR3U2NDiRTMV9oo2i9XM=;
 b=hjeUNUJ1/Z98IqU3XT30xyBMHuJODd2+8tyJ0H2TUoEXTo80WkxWuLKoGet00InZoI+j
 zqadLs0HkcnXD7Gu1f/XufyIlz5VYpq3GjJEs/KmIjblmqiUSWPWgd2Wib+Ug1O1iIuA
 0Kbh13wX9oyYeeDk0MKafuc8U6QHTFs795vOknFyx0Nob1T01e+DhD8Pxe2/wyYjr0x1
 YnknaUlKATKP3XJap+vELMe+SuqIyVxJ/hjWxKFDYPK9eddgW7+yvVv1O8D8MLtcrF87
 F1oNezXH1DnP3TucJWdpUUld8voiQyR8eLY5QD1vChLiu6F19aquAm6cyQ9zXge8FoPh 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvjkgdu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 17:20:49 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA11338;
 Fri,  5 Jul 2019 15:20:48 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 912954FB8;
 Fri,  5 Jul 2019 15:20:48 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 17:20:48 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 17:20:48
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jul 2019 17:20:23 +0200
Message-ID: <1562340023-8516-17-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [Uboot-stm32] [PATCH v2 16/16] ARM: dts: stm32mp1: sync device tree
	with v5.2-rc4
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

Synchronize device tree with v5.2-rc4 label and
update the associated u-boot dtsi.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- missing alignment on ethernet@5800a000
- set ethernet0 phy-mode to "rgmii-id" for dk1
  (needed modification not yet upstreamed)

 arch/arm/dts/stm32mp15-ddr.dtsi          |   2 +-
 arch/arm/dts/stm32mp157-pinctrl.dtsi     | 270 ++++++++++++++++++++++++++++++-
 arch/arm/dts/stm32mp157-u-boot.dtsi      |  60 ++++---
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |   4 -
 arch/arm/dts/stm32mp157a-dk1.dts         |  32 ++--
 arch/arm/dts/stm32mp157c-dk2.dts         |   1 +
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  15 +-
 arch/arm/dts/stm32mp157c-ed1.dts         | 205 +++++------------------
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi |   3 -
 arch/arm/dts/stm32mp157c-ev1.dts         |  12 +-
 arch/arm/dts/stm32mp157c.dtsi            | 215 +++++++++++++++++-------
 11 files changed, 541 insertions(+), 278 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-ddr.dtsi b/arch/arm/dts/stm32mp15-ddr.dtsi
index 4172c02..0164e34 100644
--- a/arch/arm/dts/stm32mp15-ddr.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr.dtsi
@@ -5,7 +5,7 @@
 
 / {
 	soc {
-		ddr: ddr@0x5A003000{
+		ddr: ddr@5A003000{
 			u-boot,dm-pre-reloc;
 
 			compatible = "st,stm32mp1-ddr";
diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
index 4c424c4..9bae850 100644
--- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
@@ -14,6 +14,7 @@
 			ranges = <0 0x50002000 0xa400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			hwlocks = <&hwspinlock 0>;
 			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
@@ -164,6 +165,27 @@
 				};
 			};
 
+			cec_pins_sleep_a: cec-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* HDMI_CEC */
+				};
+			};
+
+			cec_pins_b: cec-1 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 6, AF5)>;
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			cec_pins_sleep_b: cec-sleep-1 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* HDMI_CEC */
+				};
+			};
+
 			ethernet0_rgmii_pins_a: rgmii-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
@@ -269,7 +291,14 @@
 				};
 			};
 
-			i2c1_pins_b: i2c1-1 {
+			i2c1_pins_sleep_a: i2c1-1 {
+				pins {
+					pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
+						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
+				};
+			};
+
+			i2c1_pins_b: i2c1-2 {
 				pins {
 					pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
 						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
@@ -289,7 +318,14 @@
 				};
 			};
 
-			i2c2_pins_b: i2c2-1 {
+			i2c2_pins_sleep_a: i2c2-1 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 4, ANALOG)>, /* I2C2_SCL */
+						 <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
+				};
+			};
+
+			i2c2_pins_b: i2c2-2 {
 				pins {
 					pinmux = <STM32_PINMUX('Z', 0, AF3)>, /* I2C2_SCL */
 						 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
@@ -309,6 +345,152 @@
 				};
 			};
 
+			i2c5_pins_sleep_a: i2c5-1 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 11, ANALOG)>, /* I2C5_SCL */
+						 <STM32_PINMUX('A', 12, ANALOG)>; /* I2C5_SDA */
+
+				};
+			};
+
+			ltdc_pins_a: ltdc-a-0 {
+				pins {
+					pinmux = <STM32_PINMUX('G',  7, AF14)>, /* LCD_CLK */
+						 <STM32_PINMUX('I', 10, AF14)>, /* LCD_HSYNC */
+						 <STM32_PINMUX('I',  9, AF14)>, /* LCD_VSYNC */
+						 <STM32_PINMUX('F', 10, AF14)>, /* LCD_DE */
+						 <STM32_PINMUX('H',  2, AF14)>, /* LCD_R0 */
+						 <STM32_PINMUX('H',  3, AF14)>, /* LCD_R1 */
+						 <STM32_PINMUX('H',  8, AF14)>, /* LCD_R2 */
+						 <STM32_PINMUX('H',  9, AF14)>, /* LCD_R3 */
+						 <STM32_PINMUX('H', 10, AF14)>, /* LCD_R4 */
+						 <STM32_PINMUX('C',  0, AF14)>, /* LCD_R5 */
+						 <STM32_PINMUX('H', 12, AF14)>, /* LCD_R6 */
+						 <STM32_PINMUX('E', 15, AF14)>, /* LCD_R7 */
+						 <STM32_PINMUX('E',  5, AF14)>, /* LCD_G0 */
+						 <STM32_PINMUX('E',  6, AF14)>, /* LCD_G1 */
+						 <STM32_PINMUX('H', 13, AF14)>, /* LCD_G2 */
+						 <STM32_PINMUX('H', 14, AF14)>, /* LCD_G3 */
+						 <STM32_PINMUX('H', 15, AF14)>, /* LCD_G4 */
+						 <STM32_PINMUX('I',  0, AF14)>, /* LCD_G5 */
+						 <STM32_PINMUX('I',  1, AF14)>, /* LCD_G6 */
+						 <STM32_PINMUX('I',  2, AF14)>, /* LCD_G7 */
+						 <STM32_PINMUX('D',  9, AF14)>, /* LCD_B0 */
+						 <STM32_PINMUX('G', 12, AF14)>, /* LCD_B1 */
+						 <STM32_PINMUX('G', 10, AF14)>, /* LCD_B2 */
+						 <STM32_PINMUX('D', 10, AF14)>, /* LCD_B3 */
+						 <STM32_PINMUX('I',  4, AF14)>, /* LCD_B4 */
+						 <STM32_PINMUX('A',  3, AF14)>, /* LCD_B5 */
+						 <STM32_PINMUX('B',  8, AF14)>, /* LCD_B6 */
+						 <STM32_PINMUX('D',  8, AF14)>; /* LCD_B7 */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <1>;
+				};
+			};
+
+			ltdc_pins_sleep_a: ltdc-a-1 {
+				pins {
+					pinmux = <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_CLK */
+						 <STM32_PINMUX('I', 10, ANALOG)>, /* LCD_HSYNC */
+						 <STM32_PINMUX('I',  9, ANALOG)>, /* LCD_VSYNC */
+						 <STM32_PINMUX('F', 10, ANALOG)>, /* LCD_DE */
+						 <STM32_PINMUX('H',  2, ANALOG)>, /* LCD_R0 */
+						 <STM32_PINMUX('H',  3, ANALOG)>, /* LCD_R1 */
+						 <STM32_PINMUX('H',  8, ANALOG)>, /* LCD_R2 */
+						 <STM32_PINMUX('H',  9, ANALOG)>, /* LCD_R3 */
+						 <STM32_PINMUX('H', 10, ANALOG)>, /* LCD_R4 */
+						 <STM32_PINMUX('C',  0, ANALOG)>, /* LCD_R5 */
+						 <STM32_PINMUX('H', 12, ANALOG)>, /* LCD_R6 */
+						 <STM32_PINMUX('E', 15, ANALOG)>, /* LCD_R7 */
+						 <STM32_PINMUX('E',  5, ANALOG)>, /* LCD_G0 */
+						 <STM32_PINMUX('E',  6, ANALOG)>, /* LCD_G1 */
+						 <STM32_PINMUX('H', 13, ANALOG)>, /* LCD_G2 */
+						 <STM32_PINMUX('H', 14, ANALOG)>, /* LCD_G3 */
+						 <STM32_PINMUX('H', 15, ANALOG)>, /* LCD_G4 */
+						 <STM32_PINMUX('I',  0, ANALOG)>, /* LCD_G5 */
+						 <STM32_PINMUX('I',  1, ANALOG)>, /* LCD_G6 */
+						 <STM32_PINMUX('I',  2, ANALOG)>, /* LCD_G7 */
+						 <STM32_PINMUX('D',  9, ANALOG)>, /* LCD_B0 */
+						 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_B1 */
+						 <STM32_PINMUX('G', 10, ANALOG)>, /* LCD_B2 */
+						 <STM32_PINMUX('D', 10, ANALOG)>, /* LCD_B3 */
+						 <STM32_PINMUX('I',  4, ANALOG)>, /* LCD_B4 */
+						 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B5 */
+						 <STM32_PINMUX('B',  8, ANALOG)>, /* LCD_B6 */
+						 <STM32_PINMUX('D',  8, ANALOG)>; /* LCD_B7 */
+				};
+			};
+
+			ltdc_pins_b: ltdc-b-0 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 14, AF14)>, /* LCD_CLK */
+						 <STM32_PINMUX('I', 12, AF14)>, /* LCD_HSYNC */
+						 <STM32_PINMUX('I', 13, AF14)>, /* LCD_VSYNC */
+						 <STM32_PINMUX('K',  7, AF14)>, /* LCD_DE */
+						 <STM32_PINMUX('I', 15, AF14)>, /* LCD_R0 */
+						 <STM32_PINMUX('J',  0, AF14)>, /* LCD_R1 */
+						 <STM32_PINMUX('J',  1, AF14)>, /* LCD_R2 */
+						 <STM32_PINMUX('J',  2, AF14)>, /* LCD_R3 */
+						 <STM32_PINMUX('J',  3, AF14)>, /* LCD_R4 */
+						 <STM32_PINMUX('J',  4, AF14)>, /* LCD_R5 */
+						 <STM32_PINMUX('J',  5, AF14)>, /* LCD_R6 */
+						 <STM32_PINMUX('J',  6, AF14)>, /* LCD_R7 */
+						 <STM32_PINMUX('J',  7, AF14)>, /* LCD_G0 */
+						 <STM32_PINMUX('J',  8, AF14)>, /* LCD_G1 */
+						 <STM32_PINMUX('J',  9, AF14)>, /* LCD_G2 */
+						 <STM32_PINMUX('J', 10, AF14)>, /* LCD_G3 */
+						 <STM32_PINMUX('J', 11, AF14)>, /* LCD_G4 */
+						 <STM32_PINMUX('K',  0, AF14)>, /* LCD_G5 */
+						 <STM32_PINMUX('K',  1, AF14)>, /* LCD_G6 */
+						 <STM32_PINMUX('K',  2, AF14)>, /* LCD_G7 */
+						 <STM32_PINMUX('J', 12, AF14)>, /* LCD_B0 */
+						 <STM32_PINMUX('J', 13, AF14)>, /* LCD_B1 */
+						 <STM32_PINMUX('J', 14, AF14)>, /* LCD_B2 */
+						 <STM32_PINMUX('J', 15, AF14)>, /* LCD_B3 */
+						 <STM32_PINMUX('K',  3, AF14)>, /* LCD_B4 */
+						 <STM32_PINMUX('K',  4, AF14)>, /* LCD_B5 */
+						 <STM32_PINMUX('K',  5, AF14)>, /* LCD_B6 */
+						 <STM32_PINMUX('K',  6, AF14)>; /* LCD_B7 */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <1>;
+				};
+			};
+
+			ltdc_pins_sleep_b: ltdc-b-1 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 14, ANALOG)>, /* LCD_CLK */
+						 <STM32_PINMUX('I', 12, ANALOG)>, /* LCD_HSYNC */
+						 <STM32_PINMUX('I', 13, ANALOG)>, /* LCD_VSYNC */
+						 <STM32_PINMUX('K',  7, ANALOG)>, /* LCD_DE */
+						 <STM32_PINMUX('I', 15, ANALOG)>, /* LCD_R0 */
+						 <STM32_PINMUX('J',  0, ANALOG)>, /* LCD_R1 */
+						 <STM32_PINMUX('J',  1, ANALOG)>, /* LCD_R2 */
+						 <STM32_PINMUX('J',  2, ANALOG)>, /* LCD_R3 */
+						 <STM32_PINMUX('J',  3, ANALOG)>, /* LCD_R4 */
+						 <STM32_PINMUX('J',  4, ANALOG)>, /* LCD_R5 */
+						 <STM32_PINMUX('J',  5, ANALOG)>, /* LCD_R6 */
+						 <STM32_PINMUX('J',  6, ANALOG)>, /* LCD_R7 */
+						 <STM32_PINMUX('J',  7, ANALOG)>, /* LCD_G0 */
+						 <STM32_PINMUX('J',  8, ANALOG)>, /* LCD_G1 */
+						 <STM32_PINMUX('J',  9, ANALOG)>, /* LCD_G2 */
+						 <STM32_PINMUX('J', 10, ANALOG)>, /* LCD_G3 */
+						 <STM32_PINMUX('J', 11, ANALOG)>, /* LCD_G4 */
+						 <STM32_PINMUX('K',  0, ANALOG)>, /* LCD_G5 */
+						 <STM32_PINMUX('K',  1, ANALOG)>, /* LCD_G6 */
+						 <STM32_PINMUX('K',  2, ANALOG)>, /* LCD_G7 */
+						 <STM32_PINMUX('J', 12, ANALOG)>, /* LCD_B0 */
+						 <STM32_PINMUX('J', 13, ANALOG)>, /* LCD_B1 */
+						 <STM32_PINMUX('J', 14, ANALOG)>, /* LCD_B2 */
+						 <STM32_PINMUX('J', 15, ANALOG)>, /* LCD_B3 */
+						 <STM32_PINMUX('K',  3, ANALOG)>, /* LCD_B4 */
+						 <STM32_PINMUX('K',  4, ANALOG)>, /* LCD_B5 */
+						 <STM32_PINMUX('K',  5, ANALOG)>, /* LCD_B6 */
+						 <STM32_PINMUX('K',  6, ANALOG)>; /* LCD_B7 */
+				};
+			};
+
 			m_can1_pins_a: m-can1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
@@ -322,6 +504,13 @@
 				};
 			};
 
+			m_can1_sleep_pins_a: m_can1-sleep@0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
+						 <STM32_PINMUX('I', 9, ANALOG)>; /* CAN1_RX */
+				};
+			};
+
 			pwm2_pins_a: pwm2-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 3, AF1)>; /* TIM2_CH4 */
@@ -393,7 +582,8 @@
 					slew-rate = <3>;
 				};
 			};
-			sdmmc1_b4_pins_a: sdmmc1-b4@0 {
+
+			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 				pins {
 					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
 						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
@@ -407,18 +597,61 @@
 				};
 			};
 
-			sdmmc1_dir_pins_a: sdmmc1-dir@0 {
+			sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+					slew-rate = <3>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins2{
+					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+					slew-rate = <3>;
+					drive-open-drain;
+					bias-disable;
+				};
+			};
+
+			sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
 				pins {
+					pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
+						 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
+						 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
+						 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
+						 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
+						 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
+				};
+			};
+
+			sdmmc1_dir_pins_a: sdmmc1-dir-0 {
+				pins1 {
 					pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
 						 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
-						 <STM32_PINMUX('B', 9, AF11)>, /* SDMMC1_CDIR */
-						 <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
+						 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
 					slew-rate = <3>;
 					drive-push-pull;
 					bias-pull-up;
 				};
+				pins2{
+					pinmux = <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
+					bias-pull-up;
+				};
 			};
-			sdmmc2_b4_pins_a: sdmmc2-b4@0 {
+
+			sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* SDMMC1_D0DIR */
+						 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
+						 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
+						 <STM32_PINMUX('E', 4, ANALOG)>; /* SDMMC1_CKIN */
+				};
+			};
+
+			sdmmc2_b4_pins_a: sdmmc2-b4-0 {
 				pins {
 					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
 						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
@@ -432,7 +665,7 @@
 				};
 			};
 
-			sdmmc2_d47_pins_a: sdmmc2-d47@0 {
+			sdmmc2_d47_pins_a: sdmmc2-d47-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
 						 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
@@ -444,6 +677,19 @@
 				};
 			};
 
+			spdifrx_pins_a: spdifrx-0 {
+				pins {
+					pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
+					bias-disable;
+				};
+			};
+
+			spdifrx_sleep_pins_a: spdifrx-1 {
+				pins {
+					pinmux = <STM32_PINMUX('G', 12, ANALOG)>; /* SPDIF_IN1 */
+				};
+			};
+
 			spi2_pins_a: spi2-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
@@ -522,6 +768,7 @@
 			pins-are-numbered;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			hwlocks = <&hwspinlock 0>;
 
 			gpioz: gpio@54004000 {
 				gpio-controller;
@@ -546,6 +793,13 @@
 				};
 			};
 
+			i2c4_pins_sleep_a: i2c4-1 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C4_SCL */
+						 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
+				};
+			};
+
 			spi1_pins_a: spi1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('Z', 0, AF5)>, /* SPI1_SCK */
diff --git a/arch/arm/dts/stm32mp157-u-boot.dtsi b/arch/arm/dts/stm32mp157-u-boot.dtsi
index c9f534e..f7c7acc 100644
--- a/arch/arm/dts/stm32mp157-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157-u-boot.dtsi
@@ -21,11 +21,11 @@
 		pinctrl1 = &pinctrl_z;
 	};
 
-	config {
+	clocks {
 		u-boot,dm-pre-reloc;
 	};
 
-	clocks {
+	reboot {
 		u-boot,dm-pre-reloc;
 	};
 
@@ -35,42 +35,26 @@
 };
 
 &bsec {
-	u-boot,dm-pre-reloc;
-};
-
-&clk_hsi {
-	u-boot,dm-pre-reloc;
-};
-
-&clk_hse {
-	u-boot,dm-pre-reloc;
-};
-
-&clk_lse {
-	u-boot,dm-pre-reloc;
-};
-
-&clk_lsi {
-	u-boot,dm-pre-reloc;
+	u-boot,dm-pre-proper;
 };
 
 &clk_csi {
 	u-boot,dm-pre-reloc;
 };
 
-&rcc {
+&clk_hsi {
 	u-boot,dm-pre-reloc;
 };
 
-&rcc_reboot {
+&clk_hse {
 	u-boot,dm-pre-reloc;
 };
 
-&pinctrl {
+&clk_lsi {
 	u-boot,dm-pre-reloc;
 };
 
-&pinctrl_z {
+&clk_lse {
 	u-boot,dm-pre-reloc;
 };
 
@@ -134,6 +118,34 @@
 	u-boot,dm-pre-reloc;
 };
 
-&iwdg2 {
+&pinctrl {
+	u-boot,dm-pre-reloc;
+};
+
+&pinctrl_z {
+	u-boot,dm-pre-reloc;
+};
+
+&pwr {
 	u-boot,dm-pre-reloc;
 };
+
+&rcc {
+	u-boot,dm-pre-reloc;
+};
+
+&sdmmc1 {
+	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
+};
+
+&sdmmc2 {
+	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
+};
+
+&sdmmc3 {
+	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
+};
+
+&usbotg_hs {
+	compatible = "st,stm32mp1-hsotg", "snps,dwc2";
+};
diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 0f32a38..36c852d 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -194,7 +194,3 @@
 	u-boot,force-b-session-valid;
 	hnp-srp-disable;
 };
-
-&v3v3 {
-	regulator-always-on;
-};
diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
index e36773d..adb2464 100644
--- a/arch/arm/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/dts/stm32mp157a-dk1.dts
@@ -39,12 +39,19 @@
 	};
 };
 
+&cec {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&cec_pins_b>;
+	pinctrl-1 = <&cec_pins_sleep_b>;
+	status = "okay";
+};
+
 &ethernet0 {
 	status = "okay";
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
 	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
 	pinctrl-names = "default", "sleep";
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
@@ -58,12 +65,14 @@
 	};
 };
 
+
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
+	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
 
@@ -88,17 +97,13 @@
 	pmic: stpmic@33 {
 		compatible = "st,stpmic1";
 		reg = <0x33>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		status = "okay";
 
-		st,main-control-register = <0x04>;
-		st,vin-control-register = <0xc0>;
-		st,usb-control-register = <0x20>;
-
 		regulators {
 			compatible = "st,stpmic1-regulators";
-
 			ldo1-supply = <&v3v3>;
 			ldo3-supply = <&vdd_ddr>;
 			ldo6-supply = <&v3v3>;
@@ -107,7 +112,7 @@
 
 			vddcore: buck1 {
 				regulator-name = "vddcore";
-				regulator-min-microvolt = <1200000>;
+				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-initial-mode = <0>;
@@ -187,7 +192,6 @@
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 				interrupts = <IT_CURLIM_LDO6 0>;
-
 			};
 
 			vref_ddr: vref_ddr {
@@ -204,7 +208,6 @@
 			vbus_otg: pwr_sw1 {
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
-				regulator-active-discharge;
 			 };
 
 			 vbus_sw: pwr_sw2 {
@@ -216,8 +219,9 @@
 
 		onkey {
 			compatible = "st,stpmic1-onkey";
-			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
 			interrupt-names = "onkey-falling", "onkey-rising";
+			power-off-time-sec = <10>;
 			status = "okay";
 		};
 
@@ -228,6 +232,10 @@
 	};
 };
 
+&ipcc {
+	status = "okay";
+};
+
 &iwdg2 {
 	timeout-sec = <32>;
 	status = "okay";
@@ -246,8 +254,10 @@
 };
 
 &sdmmc1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	broken-cd;
 	st,neg-edge;
 	bus-width = <4>;
diff --git a/arch/arm/dts/stm32mp157c-dk2.dts b/arch/arm/dts/stm32mp157c-dk2.dts
index 9a81d2d..020ea0f 100644
--- a/arch/arm/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/dts/stm32mp157c-dk2.dts
@@ -42,6 +42,7 @@
 		compatible = "orisetech,otm8009a";
 		reg = <0>;
 		reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
+		power-supply = <&v3v3>;
 		status = "okay";
 
 		port {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 55f9903..200601e 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -156,6 +156,10 @@
 	};
 };
 
+&sdmmc1 {
+	u-boot,dm-spl;
+};
+
 &sdmmc1_b4_pins_a {
 	u-boot,dm-spl;
 	pins {
@@ -165,12 +169,15 @@
 
 &sdmmc1_dir_pins_a {
 	u-boot,dm-spl;
-	pins {
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
 		u-boot,dm-spl;
 	};
 };
 
-&sdmmc1 {
+&sdmmc2 {
 	u-boot,dm-spl;
 };
 
@@ -188,10 +195,6 @@
 	};
 };
 
-&sdmmc2 {
-	u-boot,dm-spl;
-};
-
 &uart4 {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index b10208f..11981d6 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -19,6 +19,7 @@
 	};
 
 	memory@c0000000 {
+		device_type = "memory";
 		reg = <0xC0000000 0x40000000>;
 	};
 
@@ -40,7 +41,7 @@
 	};
 };
 
-&hwspinlock {
+&dts {
 	status = "okay";
 };
 
@@ -50,23 +51,20 @@
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
 
-	pmic: stpmic1@33 {
+	pmic: stpmic@33 {
 		compatible = "st,stpmic1";
 		reg = <0x33>;
-		interrupts = <0 2>;
-		interrupt-parent = <&gpioa>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		status = "okay";
 
-		st,main_control_register = <0x04>;
-		st,vin_control_register = <0xc0>;
-		st,usb_control_register = <0x30>;
-
 		regulators {
 			compatible = "st,stpmic1-regulators";
-
 			ldo1-supply = <&v3v3>;
 			ldo2-supply = <&v3v3>;
 			ldo3-supply = <&vdd_ddr>;
@@ -80,20 +78,8 @@
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
-				regulator-initial-mode = <2>;
+				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
-
-				regulator-state-standby {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <1200000>;
-					regulator-mode = <8>;
-				};
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
 			};
 
 			vdd_ddr: buck2 {
@@ -101,22 +87,8 @@
 				regulator-min-microvolt = <1350000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
-				regulator-initial-mode = <2>;
+				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
-
-				regulator-state-standby {
-					regulator-suspend-microvolt = <1350000>;
-					regulator-on-in-suspend;
-					regulator-mode = <8>;
-				};
-				regulator-state-mem {
-					regulator-suspend-microvolt = <1350000>;
-					regulator-on-in-suspend;
-					regulator-mode = <8>;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
 			};
 
 			vdd: buck3 {
@@ -124,46 +96,18 @@
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
-				st,mask_reset;
-				regulator-initial-mode = <8>;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
-
-				regulator-state-standby {
-					regulator-suspend-microvolt = <3300000>;
-					regulator-on-in-suspend;
-					regulator-mode = <8>;
-				};
-				regulator-state-mem {
-					regulator-suspend-microvolt = <3300000>;
-					regulator-on-in-suspend;
-					regulator-mode = <8>;
-				};
-				regulator-state-disk {
-					regulator-suspend-microvolt = <3300000>;
-					regulator-on-in-suspend;
-					regulator-mode = <8>;
-				};
 			};
 
 			v3v3: buck4 {
 				regulator-name = "v3v3";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
-				regulator-boot-on;
+				regulator-always-on;
 				regulator-over-current-protection;
-				regulator-initial-mode = <8>;
-
-				regulator-state-standby {
-					regulator-suspend-microvolt = <3300000>;
-					regulator-unchanged-in-suspend;
-					regulator-mode = <8>;
-				};
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
+				regulator-initial-mode = <0>;
 			};
 
 			vdda: ldo1 {
@@ -171,18 +115,6 @@
 				regulator-min-microvolt = <2900000>;
 				regulator-max-microvolt = <2900000>;
 				interrupts = <IT_CURLIM_LDO1 0>;
-				interrupt-parent = <&pmic>;
-
-				regulator-state-standby {
-					regulator-suspend-microvolt = <2900000>;
-					regulator-unchanged-in-suspend;
-				};
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
 			};
 
 			v2v8: ldo2 {
@@ -190,36 +122,14 @@
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
 				interrupts = <IT_CURLIM_LDO2 0>;
-				interrupt-parent = <&pmic>;
-
-				regulator-state-standby {
-					regulator-suspend-microvolt = <2800000>;
-					regulator-unchanged-in-suspend;
-				};
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
 			};
 
 			vtt_ddr: ldo3 {
 				regulator-name = "vtt_ddr";
-				regulator-min-microvolt = <0000000>;
-				regulator-max-microvolt = <1000000>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
 				regulator-always-on;
 				regulator-over-current-protection;
-
-				regulator-state-standby {
-					regulator-off-in-suspend;
-				};
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
 			};
 
 			vdd_usb: ldo4 {
@@ -227,17 +137,6 @@
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				interrupts = <IT_CURLIM_LDO4 0>;
-				interrupt-parent = <&pmic>;
-
-				regulator-state-standby {
-					regulator-unchanged-in-suspend;
-				};
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
 			};
 
 			vdd_sd: ldo5 {
@@ -245,19 +144,7 @@
 				regulator-min-microvolt = <2900000>;
 				regulator-max-microvolt = <2900000>;
 				interrupts = <IT_CURLIM_LDO5 0>;
-				interrupt-parent = <&pmic>;
 				regulator-boot-on;
-
-				regulator-state-standby {
-					regulator-suspend-microvolt = <2900000>;
-					regulator-unchanged-in-suspend;
-				};
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
 			};
 
 			v1v8: ldo6 {
@@ -265,66 +152,53 @@
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				interrupts = <IT_CURLIM_LDO6 0>;
-				interrupt-parent = <&pmic>;
-
-				regulator-state-standby {
-					regulator-suspend-microvolt = <1800000>;
-					regulator-unchanged-in-suspend;
-				};
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
 			};
 
 			vref_ddr: vref_ddr {
 				regulator-name = "vref_ddr";
 				regulator-always-on;
 				regulator-over-current-protection;
-
-				regulator-state-standby {
-					regulator-on-in-suspend;
-				};
-				regulator-state-mem {
-					regulator-on-in-suspend;
-				};
-				regulator-state-disk {
-					regulator-off-in-suspend;
-				};
 			};
 
 			 bst_out: boost {
 				regulator-name = "bst_out";
 				interrupts = <IT_OCP_BOOST 0>;
-				interrupt-parent = <&pmic>;
 			 };
 
 			vbus_otg: pwr_sw1 {
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
-				interrupt-parent = <&pmic>;
-				regulator-active-discharge;
 			 };
 
 			 vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				interrupt-parent = <&pmic>;
 				regulator-active-discharge;
 			 };
 		};
+
+		onkey {
+			compatible = "st,stpmic1-onkey";
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
+			interrupt-names = "onkey-falling", "onkey-rising";
+			power-off-time-sec = <10>;
+			status = "okay";
+		};
+
+		watchdog {
+			compatible = "st,stpmic1-wdt";
+			status = "disabled";
+		};
 	};
 };
 
-&iwdg2 {
-	timeout-sec = <32>;
+&ipcc {
 	status = "okay";
 };
 
-&pinctrl {
-	hwlocks = <&hwspinlock 0>;
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
 };
 
 &pwr {
@@ -340,7 +214,10 @@
 };
 
 &sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
 	broken-cd;
 	st,sig-dir;
 	st,neg-edge;
@@ -348,11 +225,6 @@
 	bus-width = <4>;
 	vmmc-supply = <&vdd_sd>;
 	vqmmc-supply = <&sd_switch>;
-	sd-uhs-sdr12;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-ddr50;
-	sd-uhs-sdr104;
 	status = "okay";
 };
 
@@ -371,6 +243,9 @@
 
 &timers6 {
 	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	timer@5 {
 		status = "okay";
 	};
@@ -382,6 +257,10 @@
 	status = "okay";
 };
 
+&usbotg_hs {
+	vbus-supply = <&vbus_otg>;
+};
+
 &usbphyc_port0 {
 	phy-supply = <&vdd_usb>;
 };
diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
index 994092a..b656eb1 100644
--- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
@@ -56,6 +56,3 @@
 	};
 };
 
-&v3v3 {
-	regulator-always-on;
-};
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index 663e52a..ca2a333 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "stm32mp157c-ed1.dts"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
@@ -157,8 +158,9 @@
 };
 
 &m_can1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
+	pinctrl-1 = <&m_can1_sleep_pins_a>;
 	status = "okay";
 };
 
@@ -194,6 +196,9 @@
 };
 
 &timers2 {
+	/* spare dmas for other usage (un-delete to enable pwm capture) */
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm2_pins_a>;
@@ -206,6 +211,8 @@
 };
 
 &timers8 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm8_pins_a>;
@@ -218,6 +225,8 @@
 };
 
 &timers12 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm12_pins_a>;
@@ -232,7 +241,6 @@
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	phy-names = "usb";
-	vbus-supply = <&vbus_sw>;
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
index 7321585..d15fba0 100644
--- a/arch/arm/dts/stm32mp157c.dtsi
+++ b/arch/arm/dts/stm32mp157c.dtsi
@@ -35,28 +35,6 @@
 		cpu_on = <0x84000003>;
 	};
 
-	aliases {
-		gpio0 = &gpioa;
-		gpio1 = &gpiob;
-		gpio2 = &gpioc;
-		gpio3 = &gpiod;
-		gpio4 = &gpioe;
-		gpio5 = &gpiof;
-		gpio6 = &gpiog;
-		gpio7 = &gpioh;
-		gpio8 = &gpioi;
-		gpio9 = &gpioj;
-		gpio10 = &gpiok;
-		serial0 = &usart1;
-		serial1 = &usart2;
-		serial2 = &usart3;
-		serial3 = &uart4;
-		serial4 = &uart5;
-		serial5 = &usart6;
-		serial6 = &uart7;
-		serial7 = &uart8;
-	};
-
 	intc: interrupt-controller@a0021000 {
 		compatible = "arm,cortex-a7-gic";
 		#interrupt-cells = <3>;
@@ -106,6 +84,38 @@
 		};
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&dts>;
+
+			trips {
+				cpu_alert1: cpu-alert1 {
+					temperature = <85000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				cpu-crit {
+					temperature = <120000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+			};
+		};
+	};
+
+	reboot {
+		compatible = "syscon-reboot";
+		regmap = <&rcc>;
+		offset = <0x404>;
+		mask = <0x1>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -120,6 +130,12 @@
 			reg = <0x40000000 0x400>;
 			clocks = <&rcc TIM2_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 18 0x400 0x1>,
+			       <&dmamux1 19 0x400 0x1>,
+			       <&dmamux1 20 0x400 0x1>,
+			       <&dmamux1 21 0x400 0x1>,
+			       <&dmamux1 22 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4", "up";
 			status = "disabled";
 
 			pwm {
@@ -141,6 +157,13 @@
 			reg = <0x40001000 0x400>;
 			clocks = <&rcc TIM3_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 23 0x400 0x1>,
+			       <&dmamux1 24 0x400 0x1>,
+			       <&dmamux1 25 0x400 0x1>,
+			       <&dmamux1 26 0x400 0x1>,
+			       <&dmamux1 27 0x400 0x1>,
+			       <&dmamux1 28 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
 			status = "disabled";
 
 			pwm {
@@ -162,6 +185,11 @@
 			reg = <0x40002000 0x400>;
 			clocks = <&rcc TIM4_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 29 0x400 0x1>,
+			       <&dmamux1 30 0x400 0x1>,
+			       <&dmamux1 31 0x400 0x1>,
+			       <&dmamux1 32 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4";
 			status = "disabled";
 
 			pwm {
@@ -183,6 +211,13 @@
 			reg = <0x40003000 0x400>;
 			clocks = <&rcc TIM5_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 55 0x400 0x1>,
+			       <&dmamux1 56 0x400 0x1>,
+			       <&dmamux1 57 0x400 0x1>,
+			       <&dmamux1 58 0x400 0x1>,
+			       <&dmamux1 59 0x400 0x1>,
+			       <&dmamux1 60 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
 			status = "disabled";
 
 			pwm {
@@ -204,6 +239,8 @@
 			reg = <0x40004000 0x400>;
 			clocks = <&rcc TIM6_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 69 0x400 0x1>;
+			dma-names = "up";
 			status = "disabled";
 
 			timer@5 {
@@ -220,6 +257,8 @@
 			reg = <0x40005000 0x400>;
 			clocks = <&rcc TIM7_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 70 0x400 0x1>;
+			dma-names = "up";
 			status = "disabled";
 
 			timer@6 {
@@ -347,6 +386,19 @@
 			status = "disabled";
 		};
 
+		spdifrx: audio-controller@4000d000 {
+			compatible = "st,stm32h7-spdifrx";
+			#sound-dai-cells = <0>;
+			reg = <0x4000d000 0x400>;
+			clocks = <&rcc SPDIF_K>;
+			clock-names = "kclk";
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 93 0x400 0x01>,
+			       <&dmamux1 94 0x400 0x01>;
+			dma-names = "rx", "rx-ctrl";
+			status = "disabled";
+		};
+
 		usart2: serial@4000e000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x4000e000 0x400>;
@@ -487,6 +539,15 @@
 			reg = <0x44000000 0x400>;
 			clocks = <&rcc TIM1_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 11 0x400 0x1>,
+			       <&dmamux1 12 0x400 0x1>,
+			       <&dmamux1 13 0x400 0x1>,
+			       <&dmamux1 14 0x400 0x1>,
+			       <&dmamux1 15 0x400 0x1>,
+			       <&dmamux1 16 0x400 0x1>,
+			       <&dmamux1 17 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4",
+				    "up", "trig", "com";
 			status = "disabled";
 
 			pwm {
@@ -508,6 +569,15 @@
 			reg = <0x44001000 0x400>;
 			clocks = <&rcc TIM8_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 47 0x400 0x1>,
+			       <&dmamux1 48 0x400 0x1>,
+			       <&dmamux1 49 0x400 0x1>,
+			       <&dmamux1 50 0x400 0x1>,
+			       <&dmamux1 51 0x400 0x1>,
+			       <&dmamux1 52 0x400 0x1>,
+			       <&dmamux1 53 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4",
+				    "up", "trig", "com";
 			status = "disabled";
 
 			pwm {
@@ -565,6 +635,11 @@
 			reg = <0x44006000 0x400>;
 			clocks = <&rcc TIM15_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 105 0x400 0x1>,
+			       <&dmamux1 106 0x400 0x1>,
+			       <&dmamux1 107 0x400 0x1>,
+			       <&dmamux1 108 0x400 0x1>;
+			dma-names = "ch1", "up", "trig", "com";
 			status = "disabled";
 
 			pwm {
@@ -586,6 +661,9 @@
 			reg = <0x44007000 0x400>;
 			clocks = <&rcc TIM16_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 109 0x400 0x1>,
+			       <&dmamux1 110 0x400 0x1>;
+			dma-names = "ch1", "up";
 			status = "disabled";
 
 			pwm {
@@ -606,6 +684,9 @@
 			reg = <0x44008000 0x400>;
 			clocks = <&rcc TIM17_K>;
 			clock-names = "int";
+			dmas = <&dmamux1 111 0x400 0x1>,
+			       <&dmamux1 112 0x400 0x1>;
+			dma-names = "ch1", "up";
 			status = "disabled";
 
 			pwm {
@@ -706,14 +787,14 @@
 
 		m_can1: can@4400e000 {
 			compatible = "bosch,m_can";
-			reg = <0x4400e000 0x400>, <0x44011000 0x2800>;
+			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
 			reg-names = "m_can", "message_ram";
 			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "int0", "int1";
 			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
 			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
 			status = "disabled";
 		};
 
@@ -811,13 +892,14 @@
 		};
 
 		sdmmc3: sdmmc@48004000 {
-			compatible = "st,stm32-sdmmc2";
-			reg = <0x48004000 0x400>, <0x48005000 0x400>;
-			reg-names = "sdmmc", "delay";
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x10153180>;
+			reg = <0x48004000 0x400>;
+			reg-names = "sdmmc";
 			interrupts = <GIC_SPI 137 IRQ_TYPE_NONE>;
 			clocks = <&rcc SDMMC3_K>;
+			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC3_R>;
-			st,idma = <1>;
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			max-frequency = <120000000>;
@@ -825,7 +907,7 @@
 		};
 
 		usbotg_hs: usb-otg@49000000 {
-			compatible = "st,stm32mp1-hsotg", "snps,dwc2";
+			compatible = "snps,dwc2";
 			reg = <0x49000000 0x10000>;
 			clocks = <&rcc USBO_K>;
 			clock-names = "otg";
@@ -846,6 +928,20 @@
 			reg = <0x4c000000 0x400>;
 			clocks = <&rcc HSEM>;
 			clock-names = "hwspinlock";
+		};
+
+		ipcc: mailbox@4c001000 {
+			compatible = "st,stm32mp1-ipcc";
+			#mbox-cells = <1>;
+			reg = <0x4c001000 0x400>;
+			st,proc-id = <0>;
+			interrupts-extended =
+				<&intc GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				<&exti 61 1>;
+			interrupt-names = "rx", "tx", "wakeup";
+			clocks = <&rcc IPCC>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -856,13 +952,6 @@
 			#reset-cells = <1>;
 		};
 
-		rcc_reboot: rcc-reboot@50000000 {
-			compatible = "syscon-reboot";
-			regmap = <&rcc>;
-			offset = <0x404>;
-			mask = <0x1>;
-		};
-
 		pwr: pwr@50001000 {
 			compatible = "st,stm32mp1-pwr", "st,stm32-pwr", "syscon", "simple-mfd";
 			reg = <0x50001000 0x400>;
@@ -872,7 +961,7 @@
 			clocks = <&rcc PLL2_R>;
 			clock-names = "phyclk";
 
-			pwr-regulators@c {
+			pwr-regulators {
 				compatible = "st,stm32mp1,pwr-reg";
 				st,tzcr = <&rcc 0x0 0x1>;
 
@@ -906,6 +995,7 @@
 		syscfg: syscon@50020000 {
 			compatible = "st,stm32mp157-syscfg", "syscon";
 			reg = <0x50020000 0x400>;
+			clocks = <&rcc SYSCFG>;
 		};
 
 		lptimer2: timer@50021000 {
@@ -994,6 +1084,16 @@
 			status = "disabled";
 		};
 
+		dts: thermal@50028000 {
+			compatible = "st,stm32-thermal";
+			reg = <0x50028000 0x100>;
+			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc TMPSENS>;
+			clock-names = "pclk";
+			#thermal-sensor-cells = <0>;
+			status = "disabled";
+		};
+
 		cryp1: cryp@54001000 {
 			compatible = "st,stm32mp1-cryp";
 			reg = <0x54001000 0x400>;
@@ -1059,26 +1159,27 @@
 		};
 
 		sdmmc1: sdmmc@58005000 {
-			compatible = "st,stm32-sdmmc2";
-			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
-			reg-names = "sdmmc", "delay";
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x10153180>;
+			reg = <0x58005000 0x1000>;
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names	= "cmd_irq";
 			clocks = <&rcc SDMMC1_K>;
+			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC1_R>;
-			st,idma = <1>;
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			max-frequency = <120000000>;
-			status = "disabled";
 		};
 
 		sdmmc2: sdmmc@58007000 {
-			compatible = "st,stm32-sdmmc2";
-			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
-			reg-names = "sdmmc", "delay";
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x10153180>;
+			reg = <0x58007000 0x1000>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_NONE>;
 			clocks = <&rcc SDMMC2_K>;
+			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC2_R>;
-			st,idma = <1>;
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			max-frequency = <120000000>;
@@ -1102,25 +1203,21 @@
 			compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
 			reg = <0x5800a000 0x2000>;
 			reg-names = "stmmaceth";
-			interrupts-extended =
-				<&intc GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
-				<&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
-				<&exti 70 1>;
-			interrupt-names = "macirq",
-					  "eth_wake_irq",
-					  "stm32_pwr_wakeup";
+			interrupts-extended = <&intc GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
 			clock-names = "stmmaceth",
 				      "mac-clk-tx",
 				      "mac-clk-rx",
-				      "ethstp";
+				      "ethstp",
+				      "syscfg-clk";
 			clocks = <&rcc ETHMAC>,
 				 <&rcc ETHTX>,
 				 <&rcc ETHRX>,
-				 <&rcc ETHSTP>;
+				 <&rcc ETHSTP>,
+				 <&rcc SYSCFG>;
 			st,syscon = <&syscfg 0x4>;
 			snps,mixed-burst;
 			snps,pbl = <2>;
-			snps,en-tx-lpi-clockgating;
 			snps,axi-config = <&stmmac_axi_config_0>;
 			snps,tso;
 			status = "disabled";
@@ -1245,6 +1342,12 @@
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			ts_cal1: calib@5c {
+				reg = <0x5c 0x2>;
+			};
+			ts_cal2: calib@5e {
+				reg = <0x5e 0x2>;
+			};
 		};
 
 		i2c6: i2c@5c009000 {
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
