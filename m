Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4848C14B193
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 10:11:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09E0DC36B09
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:11:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 869B9C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:11:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S988us024267; Tue, 28 Jan 2020 10:11:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=5WI67mac6r+llKV+GHSKzRIo5hJ/lcsVbnbyw6AMqD4=;
 b=Dl1Q0d4/999UxXSON854gePnihdg+LoilGCY0+J3XWhnRxIMjq+5rPlxDQRh9qb0QpgA
 1afB4NbazNWrjZw+0XSwWI8juPykbhcKnWo9dvr+/7ywROTCMHCEeKuzXYNFmBJ8H4Ua
 GFYeXjjCwQznFQvANib6MKzyIcYNHdSLK74E1NQkG/EQQpaE1HH7beNP/O7ALJX/efYQ
 0Jp1hYBqg3xxcTs9MV0r6J3kYdW/XnOzP8/UOyM/g5huN0LLLLo+XKAvLWF44wE5ing9
 YpZxs+XWQDtC7nEb9osCG9ti5TmaVONXd/QbFcwwtEAtZUC0MNqY9hj60YX2J/I1RtoT PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrc134y95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:11:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E57EE10002A;
 Tue, 28 Jan 2020 10:11:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD420212A3F;
 Tue, 28 Jan 2020 10:11:28 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:11:27 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 10:11:00 +0100
Message-ID: <20200128091106.28552-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128091106.28552-1-patrick.delaunay@st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/9] ARM: dts: stm32mp1: DT alignment with
	kernel v5.5-rc7
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
Content-Type: multipart/mixed; boundary="===============4023225689502762838=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============4023225689502762838==
Content-Type: text/plain; charset="n"
Content-Transfer-Encoding: 8bit

Device tree and binding alignment with kernel v5.5-rc7

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157-pinctrl.dtsi     | 23 ++++++++-
 arch/arm/dts/stm32mp157a-avenger96.dts   |  3 +-
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 17 -------
 arch/arm/dts/stm32mp157a-dk1.dts         | 65 +++++++++++++++++++++---
 arch/arm/dts/stm32mp157c-dk2.dts         | 13 +++++
 arch/arm/dts/stm32mp157c-ed1.dts         | 20 ++++++--
 arch/arm/dts/stm32mp157c-ev1.dts         |  3 --
 7 files changed, 112 insertions(+), 32 deletions(-)

diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
index 07cd0809ff..81a363d93d 100644
--- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
@@ -138,7 +138,16 @@
 				status = "disabled";
 			};
 
-			adc12_usb_pwr_pins_a: adc12-usb-pwr-pins-0 {
+			adc12_ain_pins_a: adc12-ain-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 3, ANALOG)>, /* ADC1 in13 */
+						 <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
+						 <STM32_PINMUX('F', 13, ANALOG)>, /* ADC2 in2 */
+						 <STM32_PINMUX('F', 14, ANALOG)>; /* ADC2 in6 */
+				};
+			};
+
+			adc12_usb_cc_pins_a: adc12-usb-cc-pins-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* ADC12 in18 */
 						 <STM32_PINMUX('A', 5, ANALOG)>; /* ADC12 in19 */
@@ -175,6 +184,18 @@
 				};
 			};
 
+			dac_ch1_pins_a: dac-ch1 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 4, ANALOG)>;
+				};
+			};
+
+			dac_ch2_pins_a: dac-ch2 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 5, ANALOG)>;
+				};
+			};
+
 			dcmi_pins_a: dcmi-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 8,  AF13)>,/* DCMI_HSYNC */
diff --git a/arch/arm/dts/stm32mp157a-avenger96.dts b/arch/arm/dts/stm32mp157a-avenger96.dts
index 232fe70905..3065593bf2 100644
--- a/arch/arm/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/dts/stm32mp157a-avenger96.dts
@@ -252,14 +252,13 @@
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
 				interrupt-parent = <&pmic>;
-				regulator-active-discharge;
 			};
 
 			vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
 				interrupt-parent = <&pmic>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			};
 		};
 
diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index dcaab3eef2..4045a6e731 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -35,24 +35,7 @@
 };
 
 &adc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&adc12_usb_pwr_pins_a>;
-	vdd-supply = <&vdd>;
-	vdda-supply = <&vdd>;
-	vref-supply = <&vrefbuf>;
 	status = "okay";
-	adc1: adc@0 {
-		/*
-		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in18 & in19.
-		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
-		 * 5 * (56 + 47kOhms) * 5pF => 2.5us.
-		 * Use arbitrary margin here (e.g. 5µs).
-		 */
-		st,min-sample-time-nsecs = <5000>;
-		/* ANA0, ANA1, USB Type-C CC1 & CC2 */
-		st,adc-channels = <0 1 18 19>;
-		status = "okay";
-	};
 };
 
 &clk_hse {
diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
index dc61bfc3d5..624bf6954b 100644
--- a/arch/arm/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/dts/stm32mp157a-dk1.dts
@@ -25,6 +25,7 @@
 	};
 
 	memory@c0000000 {
+		device_type = "memory";
 		reg = <0xc0000000 0x20000000>;
 	};
 
@@ -92,7 +93,34 @@
 			"Playback" , "MCLK",
 			"Capture" , "MCLK",
 			"MICL" , "Mic Bias";
-		dais = <&sai2a_port &sai2b_port>;
+		dais = <&sai2a_port &sai2b_port &i2s2_port>;
+		status = "okay";
+	};
+};
+
+&adc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&adc12_ain_pins_a>, <&adc12_usb_cc_pins_a>;
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdd>;
+	vref-supply = <&vrefbuf>;
+	status = "disabled";
+	adc1: adc@0 {
+		/*
+		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in18 & in19.
+		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
+		 * 5 * (56 + 47kOhms) * 5pF => 2.5us.
+		 * Use arbitrary margin here (e.g. 5us).
+		 */
+		st,min-sample-time-nsecs = <5000>;
+		/* AIN connector, USB Type-C CC1 & CC2 */
+		st,adc-channels = <0 1 6 13 18 19>;
+		status = "okay";
+	};
+	adc2: adc@100 {
+		/* AIN connector, USB Type-C CC1 & CC2 */
+		st,adc-channels = <0 1 2 6 18 19>;
+		st,min-sample-time-nsecs = <5000>;
 		status = "okay";
 	};
 };
@@ -146,9 +174,7 @@
 		reset-gpios = <&gpioa 10 GPIO_ACTIVE_LOW>;
 		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-parent = <&gpiog>;
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&ltdc_pins_a>;
-		pinctrl-1 = <&ltdc_pins_sleep_a>;
+		#sound-dai-cells = <0>;
 		status = "okay";
 
 		ports {
@@ -161,6 +187,13 @@
 					remote-endpoint = <&ltdc_ep0_out>;
 				};
 			};
+
+			port@3 {
+				reg = <3>;
+				sii9022_tx_endpoint: endpoint {
+					remote-endpoint = <&i2s2_endpoint>;
+				};
+			};
 		};
 	};
 
@@ -244,7 +277,7 @@
 
 			vddcore: buck1 {
 				regulator-name = "vddcore";
-				regulator-min-microvolt = <800000>;
+				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-initial-mode = <0>;
@@ -345,7 +378,7 @@
 			 vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			 };
 		};
 
@@ -364,6 +397,23 @@
 	};
 };
 
+&i2s2 {
+	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+	clock-names = "pclk", "i2sclk", "x8k", "x11k";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2s2_pins_a>;
+	pinctrl-1 = <&i2s2_pins_sleep_a>;
+	status = "okay";
+
+	i2s2_port: port {
+		i2s2_endpoint: endpoint {
+			remote-endpoint = <&sii9022_tx_endpoint>;
+			format = "i2s";
+			mclk-fs = <256>;
+		};
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
@@ -374,6 +424,9 @@
 };
 
 &ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-1 = <&ltdc_pins_sleep_a>;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/dts/stm32mp157c-dk2.dts b/arch/arm/dts/stm32mp157c-dk2.dts
index 020ea0f0e2..d26adcbeba 100644
--- a/arch/arm/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/dts/stm32mp157c-dk2.dts
@@ -53,6 +53,19 @@
 	};
 };
 
+&i2c1 {
+	touchscreen@38 {
+		compatible = "focaltech,ft6236";
+		reg = <0x38>;
+		interrupts = <2 2>;
+		interrupt-parent = <&gpiof>;
+		interrupt-controller;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <800>;
+		status = "okay";
+	};
+};
+
 &ltdc {
 	status = "okay";
 
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index acb59f24cc..ae4da39ce8 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -84,7 +84,21 @@
 
 		gpios = <&gpiof 14 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0>;
-		states = <1800000 0x1 2900000 0x0>;
+		states = <1800000 0x1>,
+			 <2900000 0x0>;
+	};
+};
+
+&dac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
+	vref-supply = <&vdda>;
+	status = "disabled";
+	dac1: dac@1 {
+		status = "okay";
+	};
+	dac2: dac@2 {
+		status = "okay";
 	};
 };
 
@@ -127,7 +141,7 @@
 
 			vddcore: buck1 {
 				regulator-name = "vddcore";
-				regulator-min-microvolt = <800000>;
+				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-initial-mode = <0>;
@@ -225,7 +239,7 @@
 			 vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			 };
 		};
 
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index aa5892b156..bd8ffc185f 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -32,7 +32,6 @@
 
 	joystick {
 		compatible = "gpio-keys";
-		#size-cells = <0>;
 		pinctrl-0 = <&joystick_pins>;
 		pinctrl-names = "default";
 		button-0 {
@@ -343,14 +342,12 @@
 
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
-	phy-names = "usb";
 	status = "okay";
 };
 
 &usbotg_hs {
 	dr_mode = "peripheral";
 	phys = <&usbphyc_port1 0>;
-	phy-names = "usb2-phy";
 	status = "okay";
 };
 
-- 
2.17.1


--===============4023225689502762838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4023225689502762838==--
