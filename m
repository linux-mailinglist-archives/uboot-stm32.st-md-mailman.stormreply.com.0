Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3026ED035
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Apr 2023 16:21:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 727D8C6905A;
	Mon, 24 Apr 2023 14:21:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 839FCC69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Apr 2023 14:21:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OCpF0r010484; Mon, 24 Apr 2023 16:21:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=2fK1KgfqcKHZuXEb3uz6/A1heyZgZErtXDheHeyrDQk=;
 b=qoTGXjeDbi3HcW3Cx87zi5eA0B4aoOr/k4WO7XQn1wzwBgUFSqGxyGXQEmoP5XVjgWd1
 Rljh+GbvnlOp1nSRZfNkcCswwct8HbfBexIlLzAgp7oL4TEdb4FwHHT0wTygfKSV38eq
 g3JfqLZoId0yHNcW9M1Jt0AGt31dojWzyoYDOPsYRw1yn/CrYfxyEKsj19XlNjjkqLby
 WgY69yE2j8xXhGiYQCjsF99RLPTVt5b19FzbfCtCxCoAZZ7QRff01kLxNTShaw4jtduB
 q+kom6TFg9XP5PQiG7kMlb5OC3+f4cCr8P/MnPcxQskwmDshNBREx6Ke20Q/t4qlfMOH Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q5t4v8hpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 16:21:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 841D310002A;
 Mon, 24 Apr 2023 16:21:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B47B233C64;
 Mon, 24 Apr 2023 16:21:18 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 24 Apr
 2023 16:21:17 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 24 Apr 2023 16:21:10 +0200
Message-ID: <20230424162102.v2.2.Id975ebfa1953ef54fc7558442f64a693fa74bc3a@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230424142110.788029-1-patrick.delaunay@foss.st.com>
References: <20230424142110.788029-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 2/2] ARM: dts: stm32mp: alignment with v6.3
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

Device tree alignment with Linux kernel v6.3:
- f5a058023239 - ARM: dts: stm32: add i2c nodes into stm32mp131.dtsi
- 8539ebb435a5 - ARM: dts: stm32: enable i2c1 and i2c5 on
  stm32mp135f-dk.dts
- 8539ebb435a5 - ARM: dts: stm32: add spi nodes into stm32mp131.dtsi
- 15f72e0da4da - ARM: dts: stm32: add pinctrl and disabled spi5 node in
  stm32mp135f-dk
- ea99a5a02ebc - ARM: dts: stm32: Create separate pinmux for qspi cs pin
  in stm32mp15-pinctrl.dtsi
- a306d8962a24 - ARM: dts: stm32: Rename mdio0 to mdio
- 0a5ebb1f3367 - ARM: dts: stm32: Replace SAI format with dai-format DT
  property
- ccdab19738a6 - ARM: dts: stm32: add adc support to stm32mp13
- 022932ab55fd - ARM: dts: stm32: add adc pins muxing on stm32mp135f-dk
- ab2806ddad9d - ARM: dts: stm32: add dummy vdd_adc regulator on
  stm32mp135f-dk
- e46a180c060f - ARM: dts: stm32: add adc support on stm32mp135f-dk
- 9ebf215fbae1 - ARM: dts: stm32: add PWR fixed regulators on stm32mp131
- 16f4ff60519a - ARM: dts: stm32: add USBPHYC and dual USB HS PHY support
  on stm32mp131
- 4a47f0f3e936 - ARM: dts: stm32: add UBSH EHCI and OHCI support on
  stm32mp131
- 2a46bb66c47f - ARM: dts: stm32: add USB OTG HS support on stm32mp131
- 9ebf215fbae1 - ARM: dts: stm32: add fixed regulators to support usb on
  stm32mp135f-dk
- 16f4ff60519a - ARM: dts: stm32: enable USB HS phys on stm32mp135f-dk
- c4e7254cf6dc - ARM: dts: stm32: enable USB Host EHCI on stm32mp135f-dk
- 44978e135916 - ARM: dts: stm32: add pins for stm32g0 typec controller on stm32mp13
- 4f532403b1e5 - ARM: dts: stm32: enable USB OTG in dual role mode on
  stm32mp135f-dk
- e1f15571c96c - ARM: dts: stm32: add mcp23017 pinctrl entry for stm32mp13
- 6cc71374002e - ARM: dts: stm32: add mcp23017 IO expander on I2C1 on
  stm32mp135f-dk
- 7ffd2266bd32 - ARM: dts: stm32: Fix qspi pinctrl phandle for
  stm32mp15xx-dhcor-som
- 21d83512bf2b - ARM: dts: stm32: Fix qspi pinctrl phandle for
  stm32mp15xx-dhcom-som
- 732dbcf52f74 - ARM: dts: stm32: Fix qspi pinctrl phandle for
  stm32mp151a-prtt1l
- 003b7c6b24f4 - ARM: dts: stm32: remove sai kernel clock on
  stm32mp15xx-dkx
- f2b17b39bfff - ARM: dts: stm32: rename sound card on stm32mp15xx-dkx
- dee3cb759d3d - ARM: dts: stm32: Remove the pins-are-numbered property
- ae8cf3b48727 - ARM: dts: stm32: add i2s nodes on stm32mp131
- 619746a27bd0 - ARM: dts: stm32: add sai nodes on stm32mp131
- c5e05d08ef90 - ARM: dts: stm32: add spdifrx node on stm32mp131
- 0a5afd3ee0d0 - ARM: dts: stm32: add dfsdm node on stm32mp131
- bf9d876bea2e - ARM: dts: stm32: add timers support on stm32mp131
- a3183748371d - ARM: dts: stm32: add timer pins muxing for stm32mp135f-dk
- a9060c1326bc - ARM: dts: stm32: add timers support on stm32mp135f-dk
- a12154058f75 - ARM: dts: stm32: Fix User button on stm32mp135f-dk
- 2f33df889e99 - ARM: dts: stm32: Use new media bus type macros
- 366384e49551 - ARM: dts: stm32: Update part number NVMEM description on
  stm32mp131

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- change commit message and title with v6.3;
  no new device-tree modification after v6.3-rc3
- add SHA1 for each kernel patch

 arch/arm/dts/stm32mp13-pinctrl.dtsi          | 138 +++
 arch/arm/dts/stm32mp131.dtsi                 | 993 ++++++++++++++++++-
 arch/arm/dts/stm32mp133.dtsi                 |  31 +
 arch/arm/dts/stm32mp135f-dk.dts              | 235 ++++-
 arch/arm/dts/stm32mp15-pinctrl.dtsi          |  50 +-
 arch/arm/dts/stm32mp151.dtsi                 |   2 -
 arch/arm/dts/stm32mp157c-ev1.dts             |  18 +-
 arch/arm/dts/stm32mp15xx-dhcom-som.dtsi      |   8 +-
 arch/arm/dts/stm32mp15xx-dhcor-som.dtsi      |   8 +-
 arch/arm/dts/stm32mp15xx-dkx.dtsi            |  10 +-
 include/dt-bindings/clock/stm32mp13-clks.h   |   2 +-
 include/dt-bindings/reset/stm32mp13-resets.h |   2 +-
 12 files changed, 1459 insertions(+), 38 deletions(-)

diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
index d2472cd8f1d0..b2dce3a29f39 100644
--- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
@@ -6,6 +6,114 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	adc1_usb_cc_pins_a: adc1-usb-cc-pins-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
+				 <STM32_PINMUX('A', 3, ANALOG)>; /* ADC1 in12 */
+		};
+	};
+
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
+				 <STM32_PINMUX('E', 8, AF5)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('E', 8, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
+	i2c5_pins_a: i2c5-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
+				 <STM32_PINMUX('H', 6, AF4)>; /* I2C5_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c5_sleep_pins_a: i2c5-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
+				 <STM32_PINMUX('H', 6, ANALOG)>; /* I2C5_SDA */
+		};
+	};
+
+	mcp23017_pins_a: mcp23017-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 12, GPIO)>;
+			bias-pull-up;
+		};
+	};
+
+	pwm3_pins_a: pwm3-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 1, AF2)>; /* TIM3_CH4 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm3_sleep_pins_a: pwm3-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 1, ANALOG)>; /* TIM3_CH4 */
+		};
+	};
+
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 13, AF2)>; /* TIM4_CH2 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 13, ANALOG)>; /* TIM4_CH2 */
+		};
+	};
+
+	pwm8_pins_a: pwm8-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 5, AF3)>; /* TIM8_CH3 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm8_sleep_pins_a: pwm8-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 5, ANALOG)>; /* TIM8_CH3 */
+		};
+	};
+
+	pwm14_pins_a: pwm14-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 9, AF9)>; /* TIM14_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm14_sleep_pins_a: pwm14-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 9, ANALOG)>; /* TIM14_CH1 */
+		};
+	};
+
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins {
 			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
@@ -108,6 +216,36 @@
 		};
 	};
 
+	spi5_pins_a: spi5-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 7, AF6)>, /* SPI5_SCK */
+				 <STM32_PINMUX('H', 3, AF5)>; /* SPI5_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 8, AF5)>; /* SPI5_MISO */
+			bias-disable;
+		};
+	};
+
+	spi5_sleep_pins_a: spi5-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 7, ANALOG)>, /* SPI5_SCK */
+				 <STM32_PINMUX('A', 8, ANALOG)>, /* SPI5_MISO */
+				 <STM32_PINMUX('H', 3, ANALOG)>; /* SPI5_MOSI */
+		};
+	};
+
+	stm32g0_intn_pins_a: stm32g0-intn-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 2, GPIO)>;
+			bias-pull-up;
+		};
+	};
+
 	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 6, AF8)>; /* UART4_TX */
diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index 6d82bf646d26..d94ba2547267 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -77,6 +77,28 @@
 		always-on;
 	};
 
+	/* PWR 1v1, 1v8 and 3v3 regulators defined as fixed, waiting for SCMI */
+	reg11: reg11 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg11";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+	};
+
+	reg18: reg18 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	usb33: usb33 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -97,6 +119,284 @@
 			};
 		};
 
+		timers2: timer@40000000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40000000 0x400>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM2_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 18 0x400 0x1>,
+			       <&dmamux1 19 0x400 0x1>,
+			       <&dmamux1 20 0x400 0x1>,
+			       <&dmamux1 21 0x400 0x1>,
+			       <&dmamux1 22 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4", "up";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@1 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <1>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
+		};
+
+		timers3: timer@40001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40001000 0x400>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM3_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 23 0x400 0x1>,
+			       <&dmamux1 24 0x400 0x1>,
+			       <&dmamux1 25 0x400 0x1>,
+			       <&dmamux1 26 0x400 0x1>,
+			       <&dmamux1 27 0x400 0x1>,
+			       <&dmamux1 28 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@2 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <2>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
+		};
+
+		timers4: timer@40002000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40002000 0x400>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM4_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 29 0x400 0x1>,
+			       <&dmamux1 30 0x400 0x1>,
+			       <&dmamux1 31 0x400 0x1>,
+			       <&dmamux1 32 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "up";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@3 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <3>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
+		};
+
+		timers5: timer@40003000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40003000 0x400>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM5_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 55 0x400 0x1>,
+			       <&dmamux1 56 0x400 0x1>,
+			       <&dmamux1 57 0x400 0x1>,
+			       <&dmamux1 58 0x400 0x1>,
+			       <&dmamux1 59 0x400 0x1>,
+			       <&dmamux1 60 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@4 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <4>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
+		};
+
+		timers6: timer@40004000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40004000 0x400>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM6_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 69 0x400 0x1>;
+			dma-names = "up";
+			status = "disabled";
+
+			timer@5 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		timers7: timer@40005000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40005000 0x400>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM7_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 70 0x400 0x1>;
+			dma-names = "up";
+			status = "disabled";
+
+			timer@6 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <6>;
+				status = "disabled";
+			};
+		};
+
+		lptimer1: timer@40009000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-lptimer";
+			reg = <0x40009000 0x400>;
+			interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc LPTIM1_K>;
+			clock-names = "mux";
+			wakeup-source;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			trigger@0 {
+				compatible = "st,stm32-lptimer-trigger";
+				reg = <0>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-lptimer-counter";
+				status = "disabled";
+			};
+
+			timer {
+				compatible = "st,stm32-lptimer-timer";
+				status = "disabled";
+			};
+		};
+
+		i2s2: audio-controller@4000b000 {
+			compatible = "st,stm32h7-i2s";
+			reg = <0x4000b000 0x400>;
+			#sound-dai-cells = <0>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 39 0x400 0x01>,
+			       <&dmamux1 40 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi2: spi@4000b000 {
+			compatible = "st,stm32h7-spi";
+			reg = <0x4000b000 0x400>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI2_K>;
+			resets = <&rcc SPI2_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 39 0x400 0x01>,
+			       <&dmamux1 40 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s3: audio-controller@4000c000 {
+			compatible = "st,stm32h7-i2s";
+			reg = <0x4000c000 0x400>;
+			#sound-dai-cells = <0>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 61 0x400 0x01>,
+			       <&dmamux1 62 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi3: spi@4000c000 {
+			compatible = "st,stm32h7-spi";
+			reg = <0x4000c000 0x400>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI3_K>;
+			resets = <&rcc SPI3_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 61 0x400 0x01>,
+			       <&dmamux1 62 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spdifrx: audio-controller@4000d000 {
+			compatible = "st,stm32h7-spdifrx";
+			reg = <0x4000d000 0x400>;
+			#sound-dai-cells = <0>;
+			clocks = <&rcc SPDIF_K>;
+			clock-names = "kclk";
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 93 0x400 0x01>,
+			       <&dmamux1 94 0x400 0x01>;
+			dma-names = "rx", "rx-ctrl";
+			status = "disabled";
+		};
+
 		uart4: serial@40010000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x40010000 0x400>;
@@ -106,6 +406,241 @@
 			status = "disabled";
 		};
 
+		i2c1: i2c@40012000 {
+			compatible = "st,stm32mp13-i2c";
+			reg = <0x40012000 0x400>;
+			interrupt-names = "event", "error";
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc I2C1_K>;
+			resets = <&rcc I2C1_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 33 0x400 0x1>,
+			       <&dmamux1 34 0x400 0x1>;
+			dma-names = "rx", "tx";
+			st,syscfg-fmp = <&syscfg 0x4 0x1>;
+			i2c-analog-filter;
+			status = "disabled";
+		};
+
+		i2c2: i2c@40013000 {
+			compatible = "st,stm32mp13-i2c";
+			reg = <0x40013000 0x400>;
+			interrupt-names = "event", "error";
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc I2C2_K>;
+			resets = <&rcc I2C2_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 35 0x400 0x1>,
+			       <&dmamux1 36 0x400 0x1>;
+			dma-names = "rx", "tx";
+			st,syscfg-fmp = <&syscfg 0x4 0x2>;
+			i2c-analog-filter;
+			status = "disabled";
+		};
+
+		timers1: timer@44000000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x44000000 0x400>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "brk", "up", "trg-com", "cc";
+			clocks = <&rcc TIM1_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 11 0x400 0x1>,
+			       <&dmamux1 12 0x400 0x1>,
+			       <&dmamux1 13 0x400 0x1>,
+			       <&dmamux1 14 0x400 0x1>,
+			       <&dmamux1 15 0x400 0x1>,
+			       <&dmamux1 16 0x400 0x1>,
+			       <&dmamux1 17 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4",
+				    "up", "trig", "com";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@0 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <0>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
+		};
+
+		timers8: timer@44001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x44001000 0x400>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "brk", "up", "trg-com", "cc";
+			clocks = <&rcc TIM8_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 47 0x400 0x1>,
+			       <&dmamux1 48 0x400 0x1>,
+			       <&dmamux1 49 0x400 0x1>,
+			       <&dmamux1 50 0x400 0x1>,
+			       <&dmamux1 51 0x400 0x1>,
+			       <&dmamux1 52 0x400 0x1>,
+			       <&dmamux1 53 0x400 0x1>;
+			dma-names = "ch1", "ch2", "ch3", "ch4",
+				    "up", "trig", "com";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@7 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <7>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
+		};
+
+		i2s1: audio-controller@44004000 {
+			compatible = "st,stm32h7-i2s";
+			reg = <0x44004000 0x400>;
+			#sound-dai-cells = <0>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 37 0x400 0x01>,
+			       <&dmamux1 38 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi1: spi@44004000 {
+			compatible = "st,stm32h7-spi";
+			reg = <0x44004000 0x400>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI1_K>;
+			resets = <&rcc SPI1_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 37 0x400 0x01>,
+			       <&dmamux1 38 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		sai1: sai@4400a000 {
+			compatible = "st,stm32h7-sai";
+			reg = <0x4400a000 0x4>, <0x4400a3f0 0x10>;
+			ranges = <0 0x4400a000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI1_R>;
+			status = "disabled";
+
+			sai1a: audio-controller@4400a004 {
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x20>;
+				#sound-dai-cells = <0>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 87 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai1b: audio-controller@4400a024 {
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x20>;
+				#sound-dai-cells = <0>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 88 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		sai2: sai@4400b000 {
+			compatible = "st,stm32h7-sai";
+			reg = <0x4400b000 0x4>, <0x4400b3f0 0x10>;
+			ranges = <0 0x4400b000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI2_R>;
+			status = "disabled";
+
+			sai2a: audio-controller@4400b004 {
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x20>;
+				#sound-dai-cells = <0>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 89 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai2b: audio-controller@4400b024 {
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x20>;
+				#sound-dai-cells = <0>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 90 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		dfsdm: dfsdm@4400d000 {
+			compatible = "st,stm32mp1-dfsdm";
+			reg = <0x4400d000 0x800>;
+			clocks = <&rcc DFSDM_K>;
+			clock-names = "dfsdm";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			dfsdm0: filter@0 {
+				compatible = "st,stm32-dfsdm-adc";
+				reg = <0>;
+				#io-channel-cells = <1>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 101 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm1: filter@1 {
+				compatible = "st,stm32-dfsdm-adc";
+				reg = <1>;
+				#io-channel-cells = <1>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 102 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+		};
+
 		dma1: dma-controller@48000000 {
 			compatible = "st,stm32-dma";
 			reg = <0x48000000 0x400>;
@@ -153,6 +688,314 @@
 			dma-channels = <16>;
 		};
 
+		adc_2: adc@48004000 {
+			compatible = "st,stm32mp13-adc-core";
+			reg = <0x48004000 0x400>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc ADC2>, <&rcc ADC2_K>;
+			clock-names = "bus", "adc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			adc2: adc@0 {
+				compatible = "st,stm32mp13-adc";
+				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x0>;
+				interrupt-parent = <&adc_2>;
+				interrupts = <0>;
+				dmas = <&dmamux1 10 0x400 0x80000001>;
+				dma-names = "rx";
+				status = "disabled";
+
+				channel@13 {
+					reg = <13>;
+					label = "vrefint";
+				};
+				channel@14 {
+					reg = <14>;
+					label = "vddcore";
+				};
+				channel@16 {
+					reg = <16>;
+					label = "vddcpu";
+				};
+				channel@17 {
+					reg = <17>;
+					label = "vddq_ddr";
+				};
+			};
+		};
+
+		usbotg_hs: usb@49000000 {
+			compatible = "st,stm32mp15-hsotg", "snps,dwc2";
+			reg = <0x49000000 0x40000>;
+			clocks = <&rcc USBO_K>;
+			clock-names = "otg";
+			resets = <&rcc USBO_R>;
+			reset-names = "dwc2";
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			g-rx-fifo-size = <512>;
+			g-np-tx-fifo-size = <32>;
+			g-tx-fifo-size = <256 16 16 16 16 16 16 16>;
+			dr_mode = "otg";
+			otg-rev = <0x200>;
+			usb33d-supply = <&usb33>;
+			status = "disabled";
+		};
+
+		i2s4: audio-controller@4c002000 {
+			compatible = "st,stm32h7-i2s";
+			reg = <0x4c002000 0x400>;
+			#sound-dai-cells = <0>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 83 0x400 0x01>,
+			       <&dmamux1 84 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi4: spi@4c002000 {
+			compatible = "st,stm32h7-spi";
+			reg = <0x4c002000 0x400>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI4_K>;
+			resets = <&rcc SPI4_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 83 0x400 0x01>,
+			       <&dmamux1 84 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi5: spi@4c003000 {
+			compatible = "st,stm32h7-spi";
+			reg = <0x4c003000 0x400>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI5_K>;
+			resets = <&rcc SPI5_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 85 0x400 0x01>,
+			       <&dmamux1 86 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2c3: i2c@4c004000 {
+			compatible = "st,stm32mp13-i2c";
+			reg = <0x4c004000 0x400>;
+			interrupt-names = "event", "error";
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc I2C3_K>;
+			resets = <&rcc I2C3_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 73 0x400 0x1>,
+			       <&dmamux1 74 0x400 0x1>;
+			dma-names = "rx", "tx";
+			st,syscfg-fmp = <&syscfg 0x4 0x4>;
+			i2c-analog-filter;
+			status = "disabled";
+		};
+
+		i2c4: i2c@4c005000 {
+			compatible = "st,stm32mp13-i2c";
+			reg = <0x4c005000 0x400>;
+			interrupt-names = "event", "error";
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc I2C4_K>;
+			resets = <&rcc I2C4_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 75 0x400 0x1>,
+			       <&dmamux1 76 0x400 0x1>;
+			dma-names = "rx", "tx";
+			st,syscfg-fmp = <&syscfg 0x4 0x8>;
+			i2c-analog-filter;
+			status = "disabled";
+		};
+
+		i2c5: i2c@4c006000 {
+			compatible = "st,stm32mp13-i2c";
+			reg = <0x4c006000 0x400>;
+			interrupt-names = "event", "error";
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc I2C5_K>;
+			resets = <&rcc I2C5_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 115 0x400 0x1>,
+			       <&dmamux1 116 0x400 0x1>;
+			dma-names = "rx", "tx";
+			st,syscfg-fmp = <&syscfg 0x4 0x10>;
+			i2c-analog-filter;
+			status = "disabled";
+		};
+
+		timers12: timer@4c007000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x4c007000 0x400>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM12_K>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@11 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <11>;
+				status = "disabled";
+			};
+		};
+
+		timers13: timer@4c008000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x4c008000 0x400>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM13_K>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@12 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <12>;
+				status = "disabled";
+			};
+		};
+
+		timers14: timer@4c009000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x4c009000 0x400>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM14_K>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@13 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <13>;
+				status = "disabled";
+			};
+		};
+
+		timers15: timer@4c00a000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x4c00a000 0x400>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM15_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 105 0x400 0x1>,
+			       <&dmamux1 106 0x400 0x1>,
+			       <&dmamux1 107 0x400 0x1>,
+			       <&dmamux1 108 0x400 0x1>;
+			dma-names = "ch1", "up", "trig", "com";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@14 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <14>;
+				status = "disabled";
+			};
+		};
+
+		timers16: timer@4c00b000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x4c00b000 0x400>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM16_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 109 0x400 0x1>,
+			       <&dmamux1 110 0x400 0x1>;
+			dma-names = "ch1", "up";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@15 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <15>;
+				status = "disabled";
+			};
+		};
+
+		timers17: timer@4c00c000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x4c00c000 0x400>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global";
+			clocks = <&rcc TIM17_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 111 0x400 0x1>,
+			       <&dmamux1 112 0x400 0x1>;
+			dma-names = "ch1", "up";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@16 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <16>;
+				status = "disabled";
+			};
+		};
+
 		rcc: rcc@50000000 {
 			compatible = "st,stm32mp13-rcc", "syscon";
 			reg = <0x50000000 0x1000>;
@@ -181,6 +1024,111 @@
 			clocks = <&rcc SYSCFG>;
 		};
 
+		lptimer2: timer@50021000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-lptimer";
+			reg = <0x50021000 0x400>;
+			interrupts-extended = <&exti 48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc LPTIM2_K>;
+			clock-names = "mux";
+			wakeup-source;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			trigger@1 {
+				compatible = "st,stm32-lptimer-trigger";
+				reg = <1>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-lptimer-counter";
+				status = "disabled";
+			};
+
+			timer {
+				compatible = "st,stm32-lptimer-timer";
+				status = "disabled";
+			};
+		};
+
+		lptimer3: timer@50022000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-lptimer";
+			reg = <0x50022000 0x400>;
+			interrupts-extended = <&exti 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc LPTIM3_K>;
+			clock-names = "mux";
+			wakeup-source;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			trigger@2 {
+				compatible = "st,stm32-lptimer-trigger";
+				reg = <2>;
+				status = "disabled";
+			};
+
+			timer {
+				compatible = "st,stm32-lptimer-timer";
+				status = "disabled";
+			};
+		};
+
+		lptimer4: timer@50023000 {
+			compatible = "st,stm32-lptimer";
+			reg = <0x50023000 0x400>;
+			interrupts-extended = <&exti 52 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc LPTIM4_K>;
+			clock-names = "mux";
+			wakeup-source;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer {
+				compatible = "st,stm32-lptimer-timer";
+				status = "disabled";
+			};
+		};
+
+		lptimer5: timer@50024000 {
+			compatible = "st,stm32-lptimer";
+			reg = <0x50024000 0x400>;
+			interrupts-extended = <&exti 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc LPTIM5_K>;
+			clock-names = "mux";
+			wakeup-source;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer {
+				compatible = "st,stm32-lptimer-timer";
+				status = "disabled";
+			};
+		};
+
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
@@ -261,13 +1209,31 @@
 			clocks = <&rcc SDMMC2_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC2_R>;
-
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			max-frequency = <130000000>;
 			status = "disabled";
 		};
 
+		usbh_ohci: usb@5800c000 {
+			compatible = "generic-ohci";
+			reg = <0x5800c000 0x1000>;
+			clocks = <&usbphyc>, <&rcc USBH>;
+			resets = <&rcc USBH_R>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		usbh_ehci: usb@5800d000 {
+			compatible = "generic-ehci";
+			reg = <0x5800d000 0x1000>;
+			clocks = <&usbphyc>, <&rcc USBH>;
+			resets = <&rcc USBH_R>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			companion = <&usbh_ohci>;
+			status = "disabled";
+		};
+
 		iwdg2: watchdog@5a002000 {
 			compatible = "st,stm32mp1-iwdg";
 			reg = <0x5a002000 0x400>;
@@ -276,6 +1242,29 @@
 			status = "disabled";
 		};
 
+		usbphyc: usbphyc@5a006000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <0>;
+			compatible = "st,stm32mp1-usbphyc";
+			reg = <0x5a006000 0x1000>;
+			clocks = <&rcc USBPHY_K>;
+			resets = <&rcc USBPHY_R>;
+			vdda1v1-supply = <&reg11>;
+			vdda1v8-supply = <&reg18>;
+			status = "disabled";
+
+			usbphyc_port0: usb-phy@0 {
+				#phy-cells = <0>;
+				reg = <0>;
+			};
+
+			usbphyc_port1: usb-phy@1 {
+				#phy-cells = <1>;
+				reg = <1>;
+			};
+		};
+
 		rtc: rtc@5c004000 {
 			compatible = "st,stm32mp1-rtc";
 			reg = <0x5c004000 0x400>;
@@ -294,6 +1283,7 @@
 
 			part_number_otp: part_number_otp@4 {
 				reg = <0x4 0x2>;
+				bits = <0 12>;
 			};
 			ts_cal1: calib@5c {
 				reg = <0x5c 0x2>;
@@ -314,7 +1304,6 @@
 			ranges = <0 0x50002000 0x8400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
-			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
diff --git a/arch/arm/dts/stm32mp133.dtsi b/arch/arm/dts/stm32mp133.dtsi
index 531c263c9f46..df451c3c2a26 100644
--- a/arch/arm/dts/stm32mp133.dtsi
+++ b/arch/arm/dts/stm32mp133.dtsi
@@ -33,5 +33,36 @@
 			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
 			status = "disabled";
 		};
+
+		adc_1: adc@48003000 {
+			compatible = "st,stm32mp13-adc-core";
+			reg = <0x48003000 0x400>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc ADC1>, <&rcc ADC1_K>;
+			clock-names = "bus", "adc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			adc1: adc@0 {
+				compatible = "st,stm32mp13-adc";
+				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x0>;
+				interrupt-parent = <&adc_1>;
+				interrupts = <0>;
+				dmas = <&dmamux1 9 0x400 0x80000001>;
+				dma-names = "rx";
+				status = "disabled";
+
+				channel@18 {
+					reg = <18>;
+					label = "vrefint";
+				};
+			};
+		};
 	};
 };
diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
index 52f86596ce12..c40686cb2b9a 100644
--- a/arch/arm/dts/stm32mp135f-dk.dts
+++ b/arch/arm/dts/stm32mp135f-dk.dts
@@ -40,7 +40,7 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		user-pa13 {
+		button-user {
 			label = "User-PA13";
 			linux,code = <BTN_1>;
 			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
@@ -59,6 +59,22 @@
 		};
 	};
 
+	v3v3_sw: v3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3_sw";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vdd_adc: vdd-adc {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_adc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	vdd_sd: vdd-sd {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_sd";
@@ -66,6 +82,101 @@
 		regulator-max-microvolt = <2900000>;
 		regulator-always-on;
 	};
+
+	vdd_usb: vdd-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_usb";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&adc_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&adc1_usb_cc_pins_a>;
+	vdda-supply = <&vdd_adc>;
+	vref-supply = <&vdd_adc>;
+	status = "okay";
+	adc1: adc@0 {
+		status = "okay";
+		/*
+		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in6 & in12.
+		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
+		 * 5 * (5.1 + 47kOhms) * 5pF => 1.3us.
+		 * Use arbitrary margin here (e.g. 5us).
+		 */
+		channel@6 {
+			reg = <6>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@12 {
+			reg = <12>;
+			st,min-sample-time-ns = <5000>;
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <96>;
+	i2c-scl-falling-time-ns = <3>;
+	clock-frequency = <1000000>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	mcp23017: pinctrl@21 {
+		compatible = "microchip,mcp23017";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpiog>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&mcp23017_pins_a>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		microchip,irq-mirror;
+	};
+
+	typec@53 {
+		compatible = "st,stm32g0-typec";
+		reg = <0x53>;
+		/* Alert pin on PI2 */
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpioi>;
+		/* Internal pull-up on PI2 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&stm32g0_intn_pins_a>;
+		firmware-name = "stm32g0-ucsi.mp135f-dk.fw";
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+
+			port {
+				con_usb_c_g0_ep: endpoint {
+					remote-endpoint = <&usbotg_hs_ep>;
+				};
+			};
+		};
+	};
+};
+
+&i2c5 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c5_pins_a>;
+	pinctrl-1 = <&i2c5_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <170>;
+	i2c-scl-falling-time-ns = <5>;
+	clock-frequency = <400000>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
 };
 
 &iwdg2 {
@@ -90,8 +201,130 @@
 	status = "okay";
 };
 
+&spi5 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi5_pins_a>;
+	pinctrl-1 = <&spi5_sleep_pins_a>;
+	status = "disabled";
+};
+
+&timers3 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm3_pins_a>;
+		pinctrl-1 = <&pwm3_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@2 {
+		status = "okay";
+	};
+};
+
+&timers4 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm4_pins_a>;
+		pinctrl-1 = <&pwm4_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@3 {
+		status = "okay";
+	};
+};
+
+&timers8 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm8_pins_a>;
+		pinctrl-1 = <&pwm8_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@7 {
+		status = "okay";
+	};
+};
+
+&timers14 {
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm14_pins_a>;
+		pinctrl-1 = <&pwm14_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@13 {
+		status = "okay";
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
 	status = "okay";
 };
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	/* onboard HUB */
+	hub@1 {
+		compatible = "usb424,2514";
+		reg = <1>;
+		vdd-supply = <&v3v3_sw>;
+	};
+};
+
+&usbotg_hs {
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+	usb-role-switch;
+	status = "okay";
+	port {
+		usbotg_hs_ep: endpoint {
+			remote-endpoint = <&con_usb_c_g0_ep>;
+		};
+	};
+};
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+	st,current-boost-microamp = <1000>;
+	st,decrease-hs-slew-rate;
+	st,tune-hs-dc-level = <2>;
+	st,enable-hs-rftime-reduction;
+	st,trim-hs-current = <11>;
+	st,trim-hs-impedance = <2>;
+	st,tune-squelch-level = <1>;
+	st,enable-hs-rx-gain-eq;
+	st,no-hs-ftime-ctrl;
+	st,no-lsfs-sc;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+	st,current-boost-microamp = <1000>;
+	st,decrease-hs-slew-rate;
+	st,tune-hs-dc-level = <2>;
+	st,enable-hs-rftime-reduction;
+	st,trim-hs-current = <11>;
+	st,trim-hs-impedance = <2>;
+	st,tune-squelch-level = <1>;
+	st,enable-hs-rx-gain-eq;
+	st,no-hs-ftime-ctrl;
+	st,no-lsfs-sc;
+};
diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index 2cc9341d43d2..a9d2bec99014 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -1261,7 +1261,7 @@
 	};
 
 	qspi_bk1_pins_a: qspi-bk1-0 {
-		pins1 {
+		pins {
 			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
 				 <STM32_PINMUX('F', 9, AF10)>, /* QSPI_BK1_IO1 */
 				 <STM32_PINMUX('F', 7, AF9)>, /* QSPI_BK1_IO2 */
@@ -1270,12 +1270,6 @@
 			drive-push-pull;
 			slew-rate = <1>;
 		};
-		pins2 {
-			pinmux = <STM32_PINMUX('B', 6, AF10)>; /* QSPI_BK1_NCS */
-			bias-pull-up;
-			drive-push-pull;
-			slew-rate = <1>;
-		};
 	};
 
 	qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
@@ -1283,13 +1277,12 @@
 			pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
 				 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
 				 <STM32_PINMUX('F', 7, ANALOG)>, /* QSPI_BK1_IO2 */
-				 <STM32_PINMUX('F', 6, ANALOG)>, /* QSPI_BK1_IO3 */
-				 <STM32_PINMUX('B', 6, ANALOG)>; /* QSPI_BK1_NCS */
+				 <STM32_PINMUX('F', 6, ANALOG)>; /* QSPI_BK1_IO3 */
 		};
 	};
 
 	qspi_bk2_pins_a: qspi-bk2-0 {
-		pins1 {
+		pins {
 			pinmux = <STM32_PINMUX('H', 2, AF9)>, /* QSPI_BK2_IO0 */
 				 <STM32_PINMUX('H', 3, AF9)>, /* QSPI_BK2_IO1 */
 				 <STM32_PINMUX('G', 10, AF11)>, /* QSPI_BK2_IO2 */
@@ -1298,7 +1291,34 @@
 			drive-push-pull;
 			slew-rate = <1>;
 		};
-		pins2 {
+	};
+
+	qspi_bk2_sleep_pins_a: qspi-bk2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* QSPI_BK2_IO0 */
+				 <STM32_PINMUX('H', 3, ANALOG)>, /* QSPI_BK2_IO1 */
+				 <STM32_PINMUX('G', 10, ANALOG)>, /* QSPI_BK2_IO2 */
+				 <STM32_PINMUX('G', 7, ANALOG)>; /* QSPI_BK2_IO3 */
+		};
+	};
+
+	qspi_cs1_pins_a: qspi-cs1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 6, AF10)>; /* QSPI_BK1_NCS */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	qspi_cs1_sleep_pins_a: qspi-cs1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* QSPI_BK1_NCS */
+		};
+	};
+
+	qspi_cs2_pins_a: qspi-cs2-0 {
+		pins {
 			pinmux = <STM32_PINMUX('C', 0, AF10)>; /* QSPI_BK2_NCS */
 			bias-pull-up;
 			drive-push-pull;
@@ -1306,13 +1326,9 @@
 		};
 	};
 
-	qspi_bk2_sleep_pins_a: qspi-bk2-sleep-0 {
+	qspi_cs2_sleep_pins_a: qspi-cs2-sleep-0 {
 		pins {
-			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* QSPI_BK2_IO0 */
-				 <STM32_PINMUX('H', 3, ANALOG)>, /* QSPI_BK2_IO1 */
-				 <STM32_PINMUX('G', 10, ANALOG)>, /* QSPI_BK2_IO2 */
-				 <STM32_PINMUX('G', 7, ANALOG)>, /* QSPI_BK2_IO3 */
-				 <STM32_PINMUX('C', 0, ANALOG)>; /* QSPI_BK2_NCS */
+			pinmux = <STM32_PINMUX('C', 0, ANALOG)>; /* QSPI_BK2_NCS */
 		};
 	};
 
diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index 5d178b5d3c83..b3baacbb2694 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -1693,7 +1693,6 @@
 			ranges = <0 0x50002000 0xa400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
-			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1822,7 +1821,6 @@
 			#size-cells = <1>;
 			compatible = "st,stm32mp157-z-pinctrl";
 			ranges = <0 0x54004000 0x400>;
-			pins-are-numbered;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
 
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index 2d5db41ed67b..542226cfcfdf 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -8,6 +8,7 @@
 #include "stm32mp157c-ed1.dts"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 / {
 	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
@@ -90,7 +91,7 @@
 	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov5640_0>;
-			bus-type = <5>;
+			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 			bus-width = <8>;
 			hsync-active = <0>;
 			vsync-active = <0>;
@@ -144,7 +145,7 @@
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
@@ -255,8 +256,16 @@
 
 &qspi {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a &qspi_bk2_sleep_pins_a>;
+	pinctrl-0 = <&qspi_clk_pins_a
+		     &qspi_bk1_pins_a
+		     &qspi_cs1_pins_a
+		     &qspi_bk2_pins_a
+		     &qspi_cs2_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a
+		     &qspi_bk1_sleep_pins_a
+		     &qspi_cs1_sleep_pins_a
+		     &qspi_bk2_sleep_pins_a
+		     &qspi_cs2_sleep_pins_a>;
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -393,6 +402,7 @@
 	st,tune-squelch-level = <3>;
 	st,tune-hs-rx-offset = <2>;
 	st,no-lsfs-sc;
+
 	connector {
 		compatible = "usb-a-connector";
 		vbus-supply = <&vbus_sw>;
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
index 83e2c87713f8..de761743b249 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
@@ -429,8 +429,12 @@
 
 &qspi {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
+	pinctrl-0 = <&qspi_clk_pins_a
+		     &qspi_bk1_pins_a
+		     &qspi_cs1_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a
+		     &qspi_bk1_sleep_pins_a
+		     &qspi_cs1_sleep_pins_a>;
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-som.dtsi
index 98033b514792..f36eec1b4ac9 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcor-som.dtsi
@@ -191,8 +191,12 @@
 
 &qspi {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
+	pinctrl-0 = <&qspi_clk_pins_a
+		     &qspi_bk1_pins_a
+		     &qspi_cs1_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a
+		     &qspi_bk1_sleep_pins_a
+		     &qspi_cs1_sleep_pins_a>;
 	reg = <0x58003000 0x1000>, <0x70000000 0x200000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
index 34af90195d12..49b3e768c898 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -72,7 +72,7 @@
 
 	sound {
 		compatible = "audio-graph-card";
-		label = "STM32MP1-DK";
+		label = "STM32MP15-DK";
 		routing =
 			"Playback" , "MCLK",
 			"Capture" , "MCLK",
@@ -149,7 +149,7 @@
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
@@ -509,14 +509,12 @@
 	sai2a: audio-controller@4400b004 {
 		#clock-cells = <0>;
 		dma-names = "tx";
-		clocks = <&rcc SAI2_K>;
-		clock-names = "sai_ck";
 		status = "okay";
 
 		sai2a_port: port {
 			sai2a_endpoint: endpoint {
 				remote-endpoint = <&cs42l51_tx_endpoint>;
-				format = "i2s";
+				dai-format = "i2s";
 				mclk-fs = <256>;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <32>;
@@ -534,7 +532,7 @@
 		sai2b_port: port {
 			sai2b_endpoint: endpoint {
 				remote-endpoint = <&cs42l51_rx_endpoint>;
-				format = "i2s";
+				dai-format = "i2s";
 				mclk-fs = <256>;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <32>;
diff --git a/include/dt-bindings/clock/stm32mp13-clks.h b/include/dt-bindings/clock/stm32mp13-clks.h
index 799dee5b802b..da4cb7567430 100644
--- a/include/dt-bindings/clock/stm32mp13-clks.h
+++ b/include/dt-bindings/clock/stm32mp13-clks.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
 /*
- * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
diff --git a/include/dt-bindings/reset/stm32mp13-resets.h b/include/dt-bindings/reset/stm32mp13-resets.h
index 18ccb05db6c2..1b83a01de8f0 100644
--- a/include/dt-bindings/reset/stm32mp13-resets.h
+++ b/include/dt-bindings/reset/stm32mp13-resets.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
 /*
- * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
