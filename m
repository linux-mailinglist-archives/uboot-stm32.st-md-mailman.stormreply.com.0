Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E011B23B5
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 12:27:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FD3FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 10:27:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1078DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 10:27:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LAIP47022812; Tue, 21 Apr 2020 12:27:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=V0Ec8IkcPyiHUBMkw3ztKMeD10PHLn17cIOXmAi3uRg=;
 b=CTBkvjJc/iqprO4tiHSNrehMCTiW6KbG8mq2Jr7h/zomOq+fxVmyixJ9jy5EWPf4ueDx
 ibp6HelXZ8Kmh1YpHGx230ZbJQ/l1A4S9Zo5ZiM6shjwKNCFt/psVP3/rL+wDYVCFoHC
 w4PtG4W04L4bj7WysDQa7EYvnkMSNI+z6x2KBseg6jjtzlEAdKh22KCpZbddzFuIHtv4
 RZtRSuOhofiI6nwiNMERlOf5T2hpdoFzfLUqO23k8Pt6b0R6YRBOa0rTMs+suhNm3Vk9
 ts3cIjHdsfn1k+baaGouq0f20+F6dGojsH58rAKDjgSypioNO1Ng1oMPDzJa1TU+YHTg aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregfbj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 12:27:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 645AE10002A;
 Tue, 21 Apr 2020 12:27:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 379412AD2A5;
 Tue, 21 Apr 2020 12:27:38 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 12:27:37 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 12:27:35 +0200
Message-ID: <20200421122708.1.I555d4e1bdbfc2f09370be821302de722a25a1d1c@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_03:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32mp1: remove file
	stm32mp157-pinctrl.dtsi
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

Remove the unnecessary file stm32mp157-pinctrl.dtsi and
solve all issues introduced by the commit 891483186052b2598 ("Merge branch
 'next'") after a conflict on the patch applied in the next branch in
commit 1a4f57c895cc ("ARM: dts: stm32mp1: DT alignment with Linux 5.6-rc1")

Need to reapplied on stm32mp15-pinctrl.dtsi the the 3 patches
applied previously on file "stm32mp157-pinctrl.dtsi" in v2020.04
- commit 4fdbe6487daa ("ARM: dts: stm32: Add alternate pinmux for SDMMC1
 direction pins")'
- commit 5fdcba64027f ("ARM: dts: stm32: Add alternate pinmux for SDMMC2
 pins 4-7")'
- commit 955de5111112 ("ARM: dts: stm32: Add alternate pinmux for ethernet
 RGMII")'

Cc: Marek Vasut <marex@denx.de>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15-pinctrl.dtsi    |   96 ++
 arch/arm/dts/stm32mp157-pinctrl.dtsi   | 1153 ------------------------
 arch/arm/dts/stm32mp157a-avenger96.dts |    1 -
 3 files changed, 96 insertions(+), 1154 deletions(-)
 delete mode 100644 arch/arm/dts/stm32mp157-pinctrl.dtsi

diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index 53df840f85..29acdc4afd 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -162,6 +162,57 @@
 		};
 	};
 
+	ethernet0_rgmii_pins_b: rgmii-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('B', 12, AF11)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('G', 11, AF11)>, /* ETH_RGMII_TX_CTL */
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
+	ethernet0_rgmii_pins_sleep_b: rgmii-sleep-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('B', 12, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
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
 	fmc_pins_a: fmc-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
@@ -815,6 +866,30 @@
 		};
 	};
 
+	sdmmc1_dir_pins_b: sdmmc1-dir-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
+				 <STM32_PINMUX('E', 14, AF8)>, /* SDMMC1_D123DIR */
+				 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2{
+			pinmux = <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
+			bias-pull-up;
+		};
+	};
+
+	sdmmc1_dir_sleep_pins_b: sdmmc1-dir-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* SDMMC1_D0DIR */
+			 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC1_D123DIR */
+			 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
+			 <STM32_PINMUX('E', 4, ANALOG)>; /* SDMMC1_CKIN */
+		};
+	};
+
 	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
@@ -933,6 +1008,27 @@
 		};
 	};
 
+	sdmmc2_d47_pins_b: sdmmc2-d47-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 15, AF9)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('C', 6, AF10)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	sdmmc2_d47_sleep_pins_b: sdmmc2-d47-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 15, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('C', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	sdmmc3_b4_pins_a: sdmmc3-b4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
deleted file mode 100644
index 422dad1ddd..0000000000
--- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
+++ /dev/null
@@ -1,1153 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
- * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
- */
-#include <dt-bindings/pinctrl/stm32-pinfunc.h>
-
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "st,stm32mp157-pinctrl";
-			ranges = <0 0x50002000 0xa400>;
-			interrupt-parent = <&exti>;
-			st,syscfg = <&exti 0x60 0xff>;
-			hwlocks = <&hwspinlock 0>;
-			pins-are-numbered;
-
-			gpioa: gpio@50002000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x0 0x400>;
-				clocks = <&rcc GPIOA>;
-				st,bank-name = "GPIOA";
-				status = "disabled";
-			};
-
-			gpiob: gpio@50003000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1000 0x400>;
-				clocks = <&rcc GPIOB>;
-				st,bank-name = "GPIOB";
-				status = "disabled";
-			};
-
-			gpioc: gpio@50004000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x2000 0x400>;
-				clocks = <&rcc GPIOC>;
-				st,bank-name = "GPIOC";
-				status = "disabled";
-			};
-
-			gpiod: gpio@50005000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x3000 0x400>;
-				clocks = <&rcc GPIOD>;
-				st,bank-name = "GPIOD";
-				status = "disabled";
-			};
-
-			gpioe: gpio@50006000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x4000 0x400>;
-				clocks = <&rcc GPIOE>;
-				st,bank-name = "GPIOE";
-				status = "disabled";
-			};
-
-			gpiof: gpio@50007000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x5000 0x400>;
-				clocks = <&rcc GPIOF>;
-				st,bank-name = "GPIOF";
-				status = "disabled";
-			};
-
-			gpiog: gpio@50008000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x6000 0x400>;
-				clocks = <&rcc GPIOG>;
-				st,bank-name = "GPIOG";
-				status = "disabled";
-			};
-
-			gpioh: gpio@50009000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x7000 0x400>;
-				clocks = <&rcc GPIOH>;
-				st,bank-name = "GPIOH";
-				status = "disabled";
-			};
-
-			gpioi: gpio@5000a000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x8000 0x400>;
-				clocks = <&rcc GPIOI>;
-				st,bank-name = "GPIOI";
-				status = "disabled";
-			};
-
-			gpioj: gpio@5000b000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x9000 0x400>;
-				clocks = <&rcc GPIOJ>;
-				st,bank-name = "GPIOJ";
-				status = "disabled";
-			};
-
-			gpiok: gpio@5000c000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0xa000 0x400>;
-				clocks = <&rcc GPIOK>;
-				st,bank-name = "GPIOK";
-				status = "disabled";
-			};
-
-			adc12_ain_pins_a: adc12-ain-0 {
-				pins {
-					pinmux = <STM32_PINMUX('C', 3, ANALOG)>, /* ADC1 in13 */
-						 <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
-						 <STM32_PINMUX('F', 13, ANALOG)>, /* ADC2 in2 */
-						 <STM32_PINMUX('F', 14, ANALOG)>; /* ADC2 in6 */
-				};
-			};
-
-			adc12_usb_cc_pins_a: adc12-usb-cc-pins-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* ADC12 in18 */
-						 <STM32_PINMUX('A', 5, ANALOG)>; /* ADC12 in19 */
-				};
-			};
-
-			cec_pins_a: cec-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 15, AF4)>;
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			cec_pins_sleep_a: cec-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* HDMI_CEC */
-				};
-			};
-
-			cec_pins_b: cec-1 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 6, AF5)>;
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			cec_pins_sleep_b: cec-sleep-1 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* HDMI_CEC */
-				};
-			};
-
-			dac_ch1_pins_a: dac-ch1 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 4, ANALOG)>;
-				};
-			};
-
-			dac_ch2_pins_a: dac-ch2 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 5, ANALOG)>;
-				};
-			};
-
-			dcmi_pins_a: dcmi-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 8,  AF13)>,/* DCMI_HSYNC */
-						 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
-						 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
-						 <STM32_PINMUX('H', 9,  AF13)>,/* DCMI_D0 */
-						 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
-						 <STM32_PINMUX('H', 11, AF13)>,/* DCMI_D2 */
-						 <STM32_PINMUX('H', 12, AF13)>,/* DCMI_D3 */
-						 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
-						 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
-						 <STM32_PINMUX('B', 8,  AF13)>,/* DCMI_D6 */
-						 <STM32_PINMUX('E', 6,  AF13)>,/* DCMI_D7 */
-						 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
-						 <STM32_PINMUX('H', 7,  AF13)>,/* DCMI_D9 */
-						 <STM32_PINMUX('I', 3,  AF13)>,/* DCMI_D10 */
-						 <STM32_PINMUX('H', 15, AF13)>;/* DCMI_D11 */
-					bias-disable;
-				};
-			};
-
-			dcmi_sleep_pins_a: dcmi-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 8,  ANALOG)>,/* DCMI_HSYNC */
-						 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
-						 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
-						 <STM32_PINMUX('H', 9,  ANALOG)>,/* DCMI_D0 */
-						 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
-						 <STM32_PINMUX('H', 11, ANALOG)>,/* DCMI_D2 */
-						 <STM32_PINMUX('H', 12, ANALOG)>,/* DCMI_D3 */
-						 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
-						 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
-						 <STM32_PINMUX('B', 8,  ANALOG)>,/* DCMI_D6 */
-						 <STM32_PINMUX('E', 6,  ANALOG)>,/* DCMI_D7 */
-						 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
-						 <STM32_PINMUX('H', 7,  ANALOG)>,/* DCMI_D9 */
-						 <STM32_PINMUX('I', 3,  ANALOG)>,/* DCMI_D10 */
-						 <STM32_PINMUX('H', 15, ANALOG)>;/* DCMI_D11 */
-				};
-			};
-
-			ethernet0_rgmii_pins_a: rgmii-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
-						 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
-						 <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
-						 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
-						 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
-						 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
-						 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
-						 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins3 {
-					pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
-						 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
-						 <STM32_PINMUX('B', 0, AF11)>, /* ETH_RGMII_RXD2 */
-						 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
-						 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
-						 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
-					bias-disable;
-				};
-			};
-
-			ethernet0_rgmii_pins_sleep_a: rgmii-sleep-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
-						 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
-						 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
-						 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
-						 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
-						 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
-						 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
-						 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
-						 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_MDC */
-						 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
-						 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
-						 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH_RGMII_RXD2 */
-						 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH_RGMII_RXD3 */
-						 <STM32_PINMUX('A', 1, ANALOG)>, /* ETH_RGMII_RX_CLK */
-						 <STM32_PINMUX('A', 7, ANALOG)>; /* ETH_RGMII_RX_CTL */
-				};
-			};
-
-			ethernet0_rgmii_pins_b: rgmii-1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
-						 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
-						 <STM32_PINMUX('B', 12, AF11)>, /* ETH_RGMII_TXD0 */
-						 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
-						 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
-						 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
-						 <STM32_PINMUX('G', 11, AF11)>, /* ETH_RGMII_TX_CTL */
-						 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins3 {
-					pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
-						 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
-						 <STM32_PINMUX('H', 6, AF11)>, /* ETH_RGMII_RXD2 */
-						 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
-						 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
-						 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
-					bias-disable;
-				};
-			};
-
-			ethernet0_rgmii_pins_sleep_b: rgmii-sleep-1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
-						 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
-						 <STM32_PINMUX('B', 12, ANALOG)>, /* ETH_RGMII_TXD0 */
-						 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
-						 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
-						 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
-						 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
-						 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
-						 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_MDC */
-						 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
-						 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
-						 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
-						 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH_RGMII_RXD3 */
-						 <STM32_PINMUX('A', 1, ANALOG)>, /* ETH_RGMII_RX_CLK */
-						 <STM32_PINMUX('A', 7, ANALOG)>; /* ETH_RGMII_RX_CTL */
-				};
-			};
-
-			fmc_pins_a: fmc-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
-						 <STM32_PINMUX('D', 5, AF12)>, /* FMC_NWE */
-						 <STM32_PINMUX('D', 11, AF12)>, /* FMC_A16_FMC_CLE */
-						 <STM32_PINMUX('D', 12, AF12)>, /* FMC_A17_FMC_ALE */
-						 <STM32_PINMUX('D', 14, AF12)>, /* FMC_D0 */
-						 <STM32_PINMUX('D', 15, AF12)>, /* FMC_D1 */
-						 <STM32_PINMUX('D', 0, AF12)>, /* FMC_D2 */
-						 <STM32_PINMUX('D', 1, AF12)>, /* FMC_D3 */
-						 <STM32_PINMUX('E', 7, AF12)>, /* FMC_D4 */
-						 <STM32_PINMUX('E', 8, AF12)>, /* FMC_D5 */
-						 <STM32_PINMUX('E', 9, AF12)>, /* FMC_D6 */
-						 <STM32_PINMUX('E', 10, AF12)>, /* FMC_D7 */
-						 <STM32_PINMUX('G', 9, AF12)>; /* FMC_NE2_FMC_NCE */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('D', 6, AF12)>; /* FMC_NWAIT */
-					bias-pull-up;
-				};
-			};
-
-			fmc_sleep_pins_a: fmc-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* FMC_NOE */
-						 <STM32_PINMUX('D', 5, ANALOG)>, /* FMC_NWE */
-						 <STM32_PINMUX('D', 11, ANALOG)>, /* FMC_A16_FMC_CLE */
-						 <STM32_PINMUX('D', 12, ANALOG)>, /* FMC_A17_FMC_ALE */
-						 <STM32_PINMUX('D', 14, ANALOG)>, /* FMC_D0 */
-						 <STM32_PINMUX('D', 15, ANALOG)>, /* FMC_D1 */
-						 <STM32_PINMUX('D', 0, ANALOG)>, /* FMC_D2 */
-						 <STM32_PINMUX('D', 1, ANALOG)>, /* FMC_D3 */
-						 <STM32_PINMUX('E', 7, ANALOG)>, /* FMC_D4 */
-						 <STM32_PINMUX('E', 8, ANALOG)>, /* FMC_D5 */
-						 <STM32_PINMUX('E', 9, ANALOG)>, /* FMC_D6 */
-						 <STM32_PINMUX('E', 10, ANALOG)>, /* FMC_D7 */
-						 <STM32_PINMUX('D', 6, ANALOG)>, /* FMC_NWAIT */
-						 <STM32_PINMUX('G', 9, ANALOG)>; /* FMC_NE2_FMC_NCE */
-				};
-			};
-
-			i2c1_pins_a: i2c1-0 {
-				pins {
-					pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
-						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c1_pins_sleep_a: i2c1-1 {
-				pins {
-					pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
-						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
-				};
-			};
-
-			i2c1_pins_b: i2c1-2 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
-						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c1_pins_sleep_b: i2c1-3 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
-						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
-				};
-			};
-
-			i2c2_pins_a: i2c2-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
-						 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c2_pins_sleep_a: i2c2-1 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 4, ANALOG)>, /* I2C2_SCL */
-						 <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
-				};
-			};
-
-			i2c2_pins_b1: i2c2-2 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c2_pins_sleep_b1: i2c2-3 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
-				};
-			};
-
-			i2c5_pins_a: i2c5-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
-						 <STM32_PINMUX('A', 12, AF4)>; /* I2C5_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c5_pins_sleep_a: i2c5-1 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 11, ANALOG)>, /* I2C5_SCL */
-						 <STM32_PINMUX('A', 12, ANALOG)>; /* I2C5_SDA */
-
-				};
-			};
-
-			i2s2_pins_a: i2s2-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 3, AF5)>, /* I2S2_SDO */
-						 <STM32_PINMUX('B', 9, AF5)>, /* I2S2_WS */
-						 <STM32_PINMUX('A', 9, AF5)>; /* I2S2_CK */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-disable;
-				};
-			};
-
-			i2s2_pins_sleep_a: i2s2-1 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 3, ANALOG)>, /* I2S2_SDO */
-						 <STM32_PINMUX('B', 9, ANALOG)>, /* I2S2_WS */
-						 <STM32_PINMUX('A', 9, ANALOG)>; /* I2S2_CK */
-				};
-			};
-
-			ltdc_pins_a: ltdc-a-0 {
-				pins {
-					pinmux = <STM32_PINMUX('G',  7, AF14)>, /* LCD_CLK */
-						 <STM32_PINMUX('I', 10, AF14)>, /* LCD_HSYNC */
-						 <STM32_PINMUX('I',  9, AF14)>, /* LCD_VSYNC */
-						 <STM32_PINMUX('F', 10, AF14)>, /* LCD_DE */
-						 <STM32_PINMUX('H',  2, AF14)>, /* LCD_R0 */
-						 <STM32_PINMUX('H',  3, AF14)>, /* LCD_R1 */
-						 <STM32_PINMUX('H',  8, AF14)>, /* LCD_R2 */
-						 <STM32_PINMUX('H',  9, AF14)>, /* LCD_R3 */
-						 <STM32_PINMUX('H', 10, AF14)>, /* LCD_R4 */
-						 <STM32_PINMUX('C',  0, AF14)>, /* LCD_R5 */
-						 <STM32_PINMUX('H', 12, AF14)>, /* LCD_R6 */
-						 <STM32_PINMUX('E', 15, AF14)>, /* LCD_R7 */
-						 <STM32_PINMUX('E',  5, AF14)>, /* LCD_G0 */
-						 <STM32_PINMUX('E',  6, AF14)>, /* LCD_G1 */
-						 <STM32_PINMUX('H', 13, AF14)>, /* LCD_G2 */
-						 <STM32_PINMUX('H', 14, AF14)>, /* LCD_G3 */
-						 <STM32_PINMUX('H', 15, AF14)>, /* LCD_G4 */
-						 <STM32_PINMUX('I',  0, AF14)>, /* LCD_G5 */
-						 <STM32_PINMUX('I',  1, AF14)>, /* LCD_G6 */
-						 <STM32_PINMUX('I',  2, AF14)>, /* LCD_G7 */
-						 <STM32_PINMUX('D',  9, AF14)>, /* LCD_B0 */
-						 <STM32_PINMUX('G', 12, AF14)>, /* LCD_B1 */
-						 <STM32_PINMUX('G', 10, AF14)>, /* LCD_B2 */
-						 <STM32_PINMUX('D', 10, AF14)>, /* LCD_B3 */
-						 <STM32_PINMUX('I',  4, AF14)>, /* LCD_B4 */
-						 <STM32_PINMUX('A',  3, AF14)>, /* LCD_B5 */
-						 <STM32_PINMUX('B',  8, AF14)>, /* LCD_B6 */
-						 <STM32_PINMUX('D',  8, AF14)>; /* LCD_B7 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-			};
-
-			ltdc_pins_sleep_a: ltdc-a-1 {
-				pins {
-					pinmux = <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_CLK */
-						 <STM32_PINMUX('I', 10, ANALOG)>, /* LCD_HSYNC */
-						 <STM32_PINMUX('I',  9, ANALOG)>, /* LCD_VSYNC */
-						 <STM32_PINMUX('F', 10, ANALOG)>, /* LCD_DE */
-						 <STM32_PINMUX('H',  2, ANALOG)>, /* LCD_R0 */
-						 <STM32_PINMUX('H',  3, ANALOG)>, /* LCD_R1 */
-						 <STM32_PINMUX('H',  8, ANALOG)>, /* LCD_R2 */
-						 <STM32_PINMUX('H',  9, ANALOG)>, /* LCD_R3 */
-						 <STM32_PINMUX('H', 10, ANALOG)>, /* LCD_R4 */
-						 <STM32_PINMUX('C',  0, ANALOG)>, /* LCD_R5 */
-						 <STM32_PINMUX('H', 12, ANALOG)>, /* LCD_R6 */
-						 <STM32_PINMUX('E', 15, ANALOG)>, /* LCD_R7 */
-						 <STM32_PINMUX('E',  5, ANALOG)>, /* LCD_G0 */
-						 <STM32_PINMUX('E',  6, ANALOG)>, /* LCD_G1 */
-						 <STM32_PINMUX('H', 13, ANALOG)>, /* LCD_G2 */
-						 <STM32_PINMUX('H', 14, ANALOG)>, /* LCD_G3 */
-						 <STM32_PINMUX('H', 15, ANALOG)>, /* LCD_G4 */
-						 <STM32_PINMUX('I',  0, ANALOG)>, /* LCD_G5 */
-						 <STM32_PINMUX('I',  1, ANALOG)>, /* LCD_G6 */
-						 <STM32_PINMUX('I',  2, ANALOG)>, /* LCD_G7 */
-						 <STM32_PINMUX('D',  9, ANALOG)>, /* LCD_B0 */
-						 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_B1 */
-						 <STM32_PINMUX('G', 10, ANALOG)>, /* LCD_B2 */
-						 <STM32_PINMUX('D', 10, ANALOG)>, /* LCD_B3 */
-						 <STM32_PINMUX('I',  4, ANALOG)>, /* LCD_B4 */
-						 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B5 */
-						 <STM32_PINMUX('B',  8, ANALOG)>, /* LCD_B6 */
-						 <STM32_PINMUX('D',  8, ANALOG)>; /* LCD_B7 */
-				};
-			};
-
-			ltdc_pins_b: ltdc-b-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 14, AF14)>, /* LCD_CLK */
-						 <STM32_PINMUX('I', 12, AF14)>, /* LCD_HSYNC */
-						 <STM32_PINMUX('I', 13, AF14)>, /* LCD_VSYNC */
-						 <STM32_PINMUX('K',  7, AF14)>, /* LCD_DE */
-						 <STM32_PINMUX('I', 15, AF14)>, /* LCD_R0 */
-						 <STM32_PINMUX('J',  0, AF14)>, /* LCD_R1 */
-						 <STM32_PINMUX('J',  1, AF14)>, /* LCD_R2 */
-						 <STM32_PINMUX('J',  2, AF14)>, /* LCD_R3 */
-						 <STM32_PINMUX('J',  3, AF14)>, /* LCD_R4 */
-						 <STM32_PINMUX('J',  4, AF14)>, /* LCD_R5 */
-						 <STM32_PINMUX('J',  5, AF14)>, /* LCD_R6 */
-						 <STM32_PINMUX('J',  6, AF14)>, /* LCD_R7 */
-						 <STM32_PINMUX('J',  7, AF14)>, /* LCD_G0 */
-						 <STM32_PINMUX('J',  8, AF14)>, /* LCD_G1 */
-						 <STM32_PINMUX('J',  9, AF14)>, /* LCD_G2 */
-						 <STM32_PINMUX('J', 10, AF14)>, /* LCD_G3 */
-						 <STM32_PINMUX('J', 11, AF14)>, /* LCD_G4 */
-						 <STM32_PINMUX('K',  0, AF14)>, /* LCD_G5 */
-						 <STM32_PINMUX('K',  1, AF14)>, /* LCD_G6 */
-						 <STM32_PINMUX('K',  2, AF14)>, /* LCD_G7 */
-						 <STM32_PINMUX('J', 12, AF14)>, /* LCD_B0 */
-						 <STM32_PINMUX('J', 13, AF14)>, /* LCD_B1 */
-						 <STM32_PINMUX('J', 14, AF14)>, /* LCD_B2 */
-						 <STM32_PINMUX('J', 15, AF14)>, /* LCD_B3 */
-						 <STM32_PINMUX('K',  3, AF14)>, /* LCD_B4 */
-						 <STM32_PINMUX('K',  4, AF14)>, /* LCD_B5 */
-						 <STM32_PINMUX('K',  5, AF14)>, /* LCD_B6 */
-						 <STM32_PINMUX('K',  6, AF14)>; /* LCD_B7 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-			};
-
-			ltdc_pins_sleep_b: ltdc-b-1 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 14, ANALOG)>, /* LCD_CLK */
-						 <STM32_PINMUX('I', 12, ANALOG)>, /* LCD_HSYNC */
-						 <STM32_PINMUX('I', 13, ANALOG)>, /* LCD_VSYNC */
-						 <STM32_PINMUX('K',  7, ANALOG)>, /* LCD_DE */
-						 <STM32_PINMUX('I', 15, ANALOG)>, /* LCD_R0 */
-						 <STM32_PINMUX('J',  0, ANALOG)>, /* LCD_R1 */
-						 <STM32_PINMUX('J',  1, ANALOG)>, /* LCD_R2 */
-						 <STM32_PINMUX('J',  2, ANALOG)>, /* LCD_R3 */
-						 <STM32_PINMUX('J',  3, ANALOG)>, /* LCD_R4 */
-						 <STM32_PINMUX('J',  4, ANALOG)>, /* LCD_R5 */
-						 <STM32_PINMUX('J',  5, ANALOG)>, /* LCD_R6 */
-						 <STM32_PINMUX('J',  6, ANALOG)>, /* LCD_R7 */
-						 <STM32_PINMUX('J',  7, ANALOG)>, /* LCD_G0 */
-						 <STM32_PINMUX('J',  8, ANALOG)>, /* LCD_G1 */
-						 <STM32_PINMUX('J',  9, ANALOG)>, /* LCD_G2 */
-						 <STM32_PINMUX('J', 10, ANALOG)>, /* LCD_G3 */
-						 <STM32_PINMUX('J', 11, ANALOG)>, /* LCD_G4 */
-						 <STM32_PINMUX('K',  0, ANALOG)>, /* LCD_G5 */
-						 <STM32_PINMUX('K',  1, ANALOG)>, /* LCD_G6 */
-						 <STM32_PINMUX('K',  2, ANALOG)>, /* LCD_G7 */
-						 <STM32_PINMUX('J', 12, ANALOG)>, /* LCD_B0 */
-						 <STM32_PINMUX('J', 13, ANALOG)>, /* LCD_B1 */
-						 <STM32_PINMUX('J', 14, ANALOG)>, /* LCD_B2 */
-						 <STM32_PINMUX('J', 15, ANALOG)>, /* LCD_B3 */
-						 <STM32_PINMUX('K',  3, ANALOG)>, /* LCD_B4 */
-						 <STM32_PINMUX('K',  4, ANALOG)>, /* LCD_B5 */
-						 <STM32_PINMUX('K',  5, ANALOG)>, /* LCD_B6 */
-						 <STM32_PINMUX('K',  6, ANALOG)>; /* LCD_B7 */
-				};
-			};
-
-			m_can1_pins_a: m-can1-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-disable;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('I', 9, AF9)>; /* CAN1_RX */
-					bias-disable;
-				};
-			};
-
-			m_can1_sleep_pins_a: m_can1-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
-						 <STM32_PINMUX('I', 9, ANALOG)>; /* CAN1_RX */
-				};
-			};
-
-			pwm2_pins_a: pwm2-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 3, AF1)>; /* TIM2_CH4 */
-					bias-pull-down;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-			};
-
-			pwm8_pins_a: pwm8-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 2, AF3)>; /* TIM8_CH4 */
-					bias-pull-down;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-			};
-
-			pwm12_pins_a: pwm12-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 6, AF2)>; /* TIM12_CH1 */
-					bias-pull-down;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-			};
-
-			qspi_clk_pins_a: qspi-clk-0 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 10, AF9)>; /* QSPI_CLK */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <3>;
-				};
-			};
-
-			qspi_clk_sleep_pins_a: qspi-clk-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 10, ANALOG)>; /* QSPI_CLK */
-				};
-			};
-
-			qspi_bk1_pins_a: qspi-bk1-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
-						 <STM32_PINMUX('F', 9, AF10)>, /* QSPI_BK1_IO1 */
-						 <STM32_PINMUX('F', 7, AF9)>, /* QSPI_BK1_IO2 */
-						 <STM32_PINMUX('F', 6, AF9)>; /* QSPI_BK1_IO3 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 6, AF10)>; /* QSPI_BK1_NCS */
-					bias-pull-up;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-			};
-
-			qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
-						 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
-						 <STM32_PINMUX('F', 7, ANALOG)>, /* QSPI_BK1_IO2 */
-						 <STM32_PINMUX('F', 6, ANALOG)>, /* QSPI_BK1_IO3 */
-						 <STM32_PINMUX('B', 6, ANALOG)>; /* QSPI_BK1_NCS */
-				};
-			};
-
-			qspi_bk2_pins_a: qspi-bk2-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('H', 2, AF9)>, /* QSPI_BK2_IO0 */
-						 <STM32_PINMUX('H', 3, AF9)>, /* QSPI_BK2_IO1 */
-						 <STM32_PINMUX('G', 10, AF11)>, /* QSPI_BK2_IO2 */
-						 <STM32_PINMUX('G', 7, AF11)>; /* QSPI_BK2_IO3 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('C', 0, AF10)>; /* QSPI_BK2_NCS */
-					bias-pull-up;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-			};
-
-			qspi_bk2_sleep_pins_a: qspi-bk2-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* QSPI_BK2_IO0 */
-						 <STM32_PINMUX('H', 3, ANALOG)>, /* QSPI_BK2_IO1 */
-						 <STM32_PINMUX('G', 10, ANALOG)>, /* QSPI_BK2_IO2 */
-						 <STM32_PINMUX('G', 7, ANALOG)>, /* QSPI_BK2_IO3 */
-						 <STM32_PINMUX('C', 0, ANALOG)>; /* QSPI_BK2_NCS */
-				};
-			};
-
-			sai2a_pins_a: sai2a-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 5, AF10)>, /* SAI2_SCK_A */
-						 <STM32_PINMUX('I', 6, AF10)>, /* SAI2_SD_A */
-						 <STM32_PINMUX('I', 7, AF10)>, /* SAI2_FS_A */
-						 <STM32_PINMUX('E', 0, AF10)>; /* SAI2_MCLK_A */
-					slew-rate = <0>;
-					drive-push-pull;
-					bias-disable;
-				};
-			};
-
-			sai2a_sleep_pins_a: sai2a-1 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 5, ANALOG)>, /* SAI2_SCK_A */
-						 <STM32_PINMUX('I', 6, ANALOG)>, /* SAI2_SD_A */
-						 <STM32_PINMUX('I', 7, ANALOG)>, /* SAI2_FS_A */
-						 <STM32_PINMUX('E', 0, ANALOG)>; /* SAI2_MCLK_A */
-				};
-			};
-
-			sai2b_pins_a: sai2b-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('E', 12, AF10)>, /* SAI2_SCK_B */
-						 <STM32_PINMUX('E', 13, AF10)>, /* SAI2_FS_B */
-						 <STM32_PINMUX('E', 14, AF10)>; /* SAI2_MCLK_B */
-					slew-rate = <0>;
-					drive-push-pull;
-					bias-disable;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
-					bias-disable;
-				};
-			};
-
-			sai2b_sleep_pins_a: sai2b-1 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* SAI2_SD_B */
-						 <STM32_PINMUX('E', 12, ANALOG)>, /* SAI2_SCK_B */
-						 <STM32_PINMUX('E', 13, ANALOG)>, /* SAI2_FS_B */
-						 <STM32_PINMUX('E', 14, ANALOG)>; /* SAI2_MCLK_B */
-				};
-			};
-
-			sai2b_pins_b: sai2b-2 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
-					bias-disable;
-				};
-			};
-
-			sai2b_sleep_pins_b: sai2b-3 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
-				};
-			};
-
-			sai4a_pins_a: sai4a-0 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 5, AF10)>; /* SAI4_SD_A */
-					slew-rate = <0>;
-					drive-push-pull;
-					bias-disable;
-				};
-			};
-
-			sai4a_sleep_pins_a: sai4a-1 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* SAI4_SD_A */
-				};
-			};
-
-			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
-				pins {
-					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
-						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-						 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
-						 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-					slew-rate = <3>;
-					drive-push-pull;
-					bias-disable;
-				};
-			};
-
-			sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
-						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
-					slew-rate = <3>;
-					drive-push-pull;
-					bias-disable;
-				};
-				pins2{
-					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-					slew-rate = <3>;
-					drive-open-drain;
-					bias-disable;
-				};
-			};
-
-			sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
-						 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
-						 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
-						 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
-						 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
-						 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
-				};
-			};
-
-			sdmmc1_dir_pins_a: sdmmc1-dir-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
-						 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
-						 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
-					slew-rate = <3>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-				pins2{
-					pinmux = <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
-					bias-pull-up;
-				};
-			};
-
-			sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* SDMMC1_D0DIR */
-						 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
-						 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
-						 <STM32_PINMUX('E', 4, ANALOG)>; /* SDMMC1_CKIN */
-				};
-			};
-
-			sdmmc1_dir_pins_b: sdmmc1-dir-1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
-						 <STM32_PINMUX('E', 14, AF8)>, /* SDMMC1_D123DIR */
-						 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-				pins2{
-					pinmux = <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
-					bias-pull-up;
-				};
-			};
-
-			sdmmc1_dir_sleep_pins_b: sdmmc1-dir-sleep-1 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* SDMMC1_D0DIR */
-						 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC1_D123DIR */
-						 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
-						 <STM32_PINMUX('E', 4, ANALOG)>; /* SDMMC1_CKIN */
-				};
-			};
-
-			sdmmc2_b4_pins_a: sdmmc2-b4-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
-						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
-						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
-						 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
-						 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
-					slew-rate = <2>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-			};
-
-			sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
-						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
-						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
-						 <STM32_PINMUX('B', 4, AF9)>; /* SDMMC2_D3 */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
-					slew-rate = <2>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-				pins3 {
-					pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
-					slew-rate = <1>;
-					drive-open-drain;
-					bias-pull-up;
-				};
-			};
-
-			sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
-						 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
-						 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
-						 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
-						 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
-						 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
-				};
-			};
-
-			sdmmc2_d47_pins_a: sdmmc2-d47-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
-						 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
-						 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
-						 <STM32_PINMUX('D', 3, AF9)>; /* SDMMC2_D7 */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-			};
-
-			sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
-						 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
-						 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
-						 <STM32_PINMUX('D', 3, ANALOG)>; /* SDMMC2_D7 */
-				};
-			};
-
-			sdmmc2_d47_pins_b: sdmmc2-d47-1 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
-						 <STM32_PINMUX('A', 15, AF9)>, /* SDMMC2_D5 */
-						 <STM32_PINMUX('C', 6, AF10)>, /* SDMMC2_D6 */
-						 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-			};
-
-			sdmmc2_d47_sleep_pins_b: sdmmc2-d47-sleep-1 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
-						 <STM32_PINMUX('A', 15, ANALOG)>, /* SDMMC2_D5 */
-						 <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC2_D6 */
-						 <STM32_PINMUX('C', 7, ANALOG)>; /* SDMMC2_D7 */
-				};
-			};
-
-			spdifrx_pins_a: spdifrx-0 {
-				pins {
-					pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
-					bias-disable;
-				};
-			};
-
-			spdifrx_sleep_pins_a: spdifrx-1 {
-				pins {
-					pinmux = <STM32_PINMUX('G', 12, ANALOG)>; /* SPDIF_IN1 */
-				};
-			};
-
-			spi2_pins_a: spi2-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
-						 <STM32_PINMUX('I', 0, AF5)>, /* SPI2_NSS */
-						 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <3>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
-					bias-disable;
-				};
-			};
-
-			stusb1600_pins_a: stusb1600-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
-					bias-pull-up;
-				};
-			};
-
-			uart4_pins_a: uart4-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-					bias-disable;
-				};
-			};
-
-			uart4_pins_b: uart4-1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-					bias-disable;
-				};
-			};
-
-			uart7_pins_a: uart7-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
-						 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
-						 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
-					bias-disable;
-				};
-			};
-		};
-
-		pinctrl_z: pin-controller-z@54004000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "st,stm32mp157-z-pinctrl";
-			ranges = <0 0x54004000 0x400>;
-			pins-are-numbered;
-			interrupt-parent = <&exti>;
-			st,syscfg = <&exti 0x60 0xff>;
-			hwlocks = <&hwspinlock 0>;
-
-			gpioz: gpio@54004000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0 0x400>;
-				clocks = <&rcc GPIOZ>;
-				st,bank-name = "GPIOZ";
-				st,bank-ioport = <11>;
-				status = "disabled";
-			};
-
-			i2c2_pins_b2: i2c2-0 {
-				pins {
-					pinmux = <STM32_PINMUX('Z', 0, AF3)>; /* I2C2_SCL */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c2_pins_sleep_b2: i2c2-1 {
-				pins {
-					pinmux = <STM32_PINMUX('Z', 0, ANALOG)>; /* I2C2_SCL */
-				};
-			};
-
-			i2c4_pins_a: i2c4-0 {
-				pins {
-					pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
-						 <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c4_pins_sleep_a: i2c4-1 {
-				pins {
-					pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C4_SCL */
-						 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
-				};
-			};
-
-			spi1_pins_a: spi1-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('Z', 0, AF5)>, /* SPI1_SCK */
-						 <STM32_PINMUX('Z', 2, AF5)>; /* SPI1_MOSI */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-
-				pins2 {
-					pinmux = <STM32_PINMUX('Z', 1, AF5)>; /* SPI1_MISO */
-					bias-disable;
-				};
-			};
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32mp157a-avenger96.dts b/arch/arm/dts/stm32mp157a-avenger96.dts
index 11e7e6367d..f9b79fada0 100644
--- a/arch/arm/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/dts/stm32mp157a-avenger96.dts
@@ -8,7 +8,6 @@
 
 #include "stm32mp157.dtsi"
 #include "stm32mp15-pinctrl.dtsi"
-#include "stm32mp157-pinctrl.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
