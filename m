Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 781DC2F1189
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Jan 2021 12:33:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40540C424C0;
	Mon, 11 Jan 2021 11:33:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB226C32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 11:33:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10BBWUaX024865; Mon, 11 Jan 2021 12:33:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=9hVEltIz163i/JfrDMc+hnc92LzkfhW0WKh75u9iLd8=;
 b=3k4I5ftw9t7GitAXQs5xt79FD0vSy/W70rIi1k1RsxbpkSRC3bSJwj6jaGJQL4yo4PI4
 t+7IrHFazbVnNjhHEsKrfXjIXyocHeOY0DVJkFrYt1ZNyOhg7e1XMUSA4DVz11WgWjyd
 o2OoPHNhrPUKEA09PN8A16ymUswbhSm+SBpU+JbqEnEtP5ml3F8KS0nQWYd5lPE8bjF+
 VXTq4VcVZhabodz7viOrOCRIJae3HP2LwK1ufi7CGtGUt3i1OzQh2Nn/dqhchKGeahXC
 uhEi42N4KNwJcX32/Tt7fPKI93y7KP/K3MX3zYTB5O4nI1EO2Eoy0++Tt0XLhvi5enSQ 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35yp3xeerw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 12:33:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4500610002A;
 Mon, 11 Jan 2021 12:33:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 69A8D250731;
 Mon, 11 Jan 2021 12:33:38 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Jan 2021 12:33:37
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Jan 2021 12:33:36 +0100
Message-ID: <20210111123329.1.I62e8df98aef0f695209fcc494c90777fb5beccb4@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_23:2021-01-11,
 2021-01-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with v5.11-rc2
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

Device tree alignment with Linux kernel v5.11-rc2
- fix DCMI DMA features on stm32mp15 family
- Add alternate pinmux for FMC EBI bus
- Harmonize EHCI/OHCI DT nodes name on stm32mp15
- update sdmmc IP version for STM32MP15
- Add LP timer irqs on stm32mp151
- Add LP timer wakeup-source on stm32mp151
- enable HASH by default on stm32mp15
- enable CRC1 by default on stm32mp15
- enable CRYP by default on stm32mp15
- set bus-type in DCMI endpoint for stm32mp157c-ev1 board
- reorder spi4 within stm32mp15-pinctrl
- add STUSB1600 Type-C using I2C4 on stm32mp15xx-dkx
- fix mdma1 clients channel priority level on stm32mp151
- fix dmamux reg property on stm32mp151
- adjust USB OTG gadget fifo sizes in stm32mp151
- update stm32mp151 for remote proc synchronization support
- support child mfd cells for the stm32mp1 TAMP syscon

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-pinctrl.dtsi        | 87 +++++++++++++++++++++-
 arch/arm/dts/stm32mp151.dtsi               | 48 +++++++++---
 arch/arm/dts/stm32mp153.dtsi               |  6 ++
 arch/arm/dts/stm32mp157c-dk2.dts           |  4 +
 arch/arm/dts/stm32mp157c-ed1.dts           | 27 +++++++
 arch/arm/dts/stm32mp157c-ev1.dts           |  1 +
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 55 --------------
 arch/arm/dts/stm32mp15xx-dkx.dtsi          | 47 ++++++++++--
 8 files changed, 200 insertions(+), 75 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index 154832983c..dd4bd1e554 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -349,6 +349,61 @@
 		};
 	};
 
+	fmc_pins_b: fmc-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
+				 <STM32_PINMUX('D', 5, AF12)>, /* FMC_NWE */
+				 <STM32_PINMUX('B', 7, AF12)>, /* FMC_NL */
+				 <STM32_PINMUX('D', 14, AF12)>, /* FMC_D0 */
+				 <STM32_PINMUX('D', 15, AF12)>, /* FMC_D1 */
+				 <STM32_PINMUX('D', 0, AF12)>, /* FMC_D2 */
+				 <STM32_PINMUX('D', 1, AF12)>, /* FMC_D3 */
+				 <STM32_PINMUX('E', 7, AF12)>, /* FMC_D4 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* FMC_D5 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* FMC_D6 */
+				 <STM32_PINMUX('E', 10, AF12)>, /* FMC_D7 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* FMC_D8 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* FMC_D9 */
+				 <STM32_PINMUX('E', 13, AF12)>, /* FMC_D10 */
+				 <STM32_PINMUX('E', 14, AF12)>, /* FMC_D11 */
+				 <STM32_PINMUX('E', 15, AF12)>, /* FMC_D12 */
+				 <STM32_PINMUX('D', 8, AF12)>, /* FMC_D13 */
+				 <STM32_PINMUX('D', 9, AF12)>, /* FMC_D14 */
+				 <STM32_PINMUX('D', 10, AF12)>, /* FMC_D15 */
+				 <STM32_PINMUX('G', 9, AF12)>, /* FMC_NE2_FMC_NCE */
+				 <STM32_PINMUX('G', 12, AF12)>; /* FMC_NE4 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+	};
+
+	fmc_sleep_pins_b: fmc-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* FMC_NOE */
+				 <STM32_PINMUX('D', 5, ANALOG)>, /* FMC_NWE */
+				 <STM32_PINMUX('B', 7, ANALOG)>, /* FMC_NL */
+				 <STM32_PINMUX('D', 14, ANALOG)>, /* FMC_D0 */
+				 <STM32_PINMUX('D', 15, ANALOG)>, /* FMC_D1 */
+				 <STM32_PINMUX('D', 0, ANALOG)>, /* FMC_D2 */
+				 <STM32_PINMUX('D', 1, ANALOG)>, /* FMC_D3 */
+				 <STM32_PINMUX('E', 7, ANALOG)>, /* FMC_D4 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* FMC_D5 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* FMC_D6 */
+				 <STM32_PINMUX('E', 10, ANALOG)>, /* FMC_D7 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* FMC_D8 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* FMC_D9 */
+				 <STM32_PINMUX('E', 13, ANALOG)>, /* FMC_D10 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* FMC_D11 */
+				 <STM32_PINMUX('E', 15, ANALOG)>, /* FMC_D12 */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* FMC_D13 */
+				 <STM32_PINMUX('D', 9, ANALOG)>, /* FMC_D14 */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* FMC_D15 */
+				 <STM32_PINMUX('G', 9, ANALOG)>, /* FMC_NE2_FMC_NCE */
+				 <STM32_PINMUX('G', 12, ANALOG)>; /* FMC_NE4 */
+		};
+	};
+
 	i2c1_pins_a: i2c1-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
@@ -1437,6 +1492,24 @@
 		};
 	};
 
+	sdmmc2_d47_pins_d: sdmmc2-d47-3 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
+		};
+	};
+
+	sdmmc2_d47_sleep_pins_d: sdmmc2-d47-sleep-3 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('C', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	sdmmc3_b4_pins_a: sdmmc3-b4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
@@ -1588,9 +1661,9 @@
 	};
 
 	stusb1600_pins_a: stusb1600-0 {
-			pins {
-				pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
-				bias-pull-up;
+		pins {
+			pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
+			bias-pull-up;
 		};
 	};
 
@@ -1721,6 +1794,14 @@
 		};
 	};
 
+	uart8_rtscts_pins_a: uart8rtscts-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 7, AF8)>, /* UART8_RTS */
+				 <STM32_PINMUX('G', 10, AF8)>; /* UART8_CTS */
+			bias-disable;
+		};
+	};
+
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index 206d3d3c78..eedea6f4b8 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -41,6 +41,13 @@
 		};
 	};
 
+	arm-pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>;
+		interrupt-parent = <&intc>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -373,8 +380,10 @@
 			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x40009000 0x400>;
+			interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM1_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
@@ -1010,7 +1019,7 @@
 
 		dmamux1: dma-router@48002000 {
 			compatible = "st,stm32h7-dmamux";
-			reg = <0x48002000 0x1c>;
+			reg = <0x48002000 0x40>;
 			#dma-cells = <3>;
 			dma-requests = <128>;
 			dma-masters = <&dma1 &dma2>;
@@ -1058,7 +1067,7 @@
 
 		sdmmc3: sdmmc@48004000 {
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x10153180>;
+			arm,primecell-periphid = <0x00253180>;
 			reg = <0x48004000 0x400>;
 			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "cmd_irq";
@@ -1079,9 +1088,9 @@
 			resets = <&rcc USBO_R>;
 			reset-names = "dwc2";
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			g-rx-fifo-size = <256>;
+			g-rx-fifo-size = <512>;
 			g-np-tx-fifo-size = <32>;
-			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
+			g-tx-fifo-size = <256 16 16 16 16 16 16 16>;
 			dr_mode = "otg";
 			usb33d-supply = <&usb33>;
 			status = "disabled";
@@ -1117,7 +1126,7 @@
 			resets = <&rcc CAMITF_R>;
 			clocks = <&rcc DCMI>;
 			clock-names = "mclk";
-			dmas = <&dmamux1 75 0x400 0x0d>;
+			dmas = <&dmamux1 75 0x400 0x01>;
 			dma-names = "tx";
 			status = "disabled";
 		};
@@ -1175,8 +1184,10 @@
 			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x50021000 0x400>;
+			interrupts-extended = <&exti 48 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM2_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
@@ -1202,8 +1213,10 @@
 			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x50022000 0x400>;
+			interrupts-extended = <&exti 50 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM3_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
@@ -1222,8 +1235,10 @@
 		lptimer4: timer@50023000 {
 			compatible = "st,stm32-lptimer";
 			reg = <0x50023000 0x400>;
+			interrupts-extended = <&exti 52 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM4_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
@@ -1236,8 +1251,10 @@
 		lptimer5: timer@50024000 {
 			compatible = "st,stm32-lptimer";
 			reg = <0x50024000 0x400>;
+			interrupts-extended = <&exti 53 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc LPTIM5_K>;
 			clock-names = "mux";
+			wakeup-source;
 			status = "disabled";
 
 			pwm {
@@ -1303,7 +1320,7 @@
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc HASH1>;
 			resets = <&rcc HASH1_R>;
-			dmas = <&mdma1 31 0x10 0x1000A02 0x0 0x0>;
+			dmas = <&mdma1 31 0x2 0x1000A02 0x0 0x0>;
 			dma-names = "in";
 			dma-maxburst = <2>;
 			status = "disabled";
@@ -1367,8 +1384,8 @@
 			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
 			reg-names = "qspi", "qspi_mm";
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&mdma1 22 0x10 0x100002 0x0 0x0>,
-			       <&mdma1 22 0x10 0x100008 0x0 0x0>;
+			dmas = <&mdma1 22 0x2 0x100002 0x0 0x0>,
+			       <&mdma1 22 0x2 0x100008 0x0 0x0>;
 			dma-names = "tx", "rx";
 			clocks = <&rcc QSPI_K>;
 			resets = <&rcc QSPI_R>;
@@ -1379,7 +1396,7 @@
 
 		sdmmc1: sdmmc@58005000 {
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x10153180>;
+			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58005000 0x1000>;
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "cmd_irq";
@@ -1394,7 +1411,7 @@
 
 		sdmmc2: sdmmc@58007000 {
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x10153180>;
+			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58007000 0x1000>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "cmd_irq";
@@ -1445,7 +1462,7 @@
 			status = "disabled";
 		};
 
-		usbh_ohci: usbh-ohci@5800c000 {
+		usbh_ohci: usb@5800c000 {
 			compatible = "generic-ohci";
 			reg = <0x5800c000 0x1000>;
 			clocks = <&rcc USBH>;
@@ -1454,7 +1471,7 @@
 			status = "disabled";
 		};
 
-		usbh_ehci: usbh-ehci@5800d000 {
+		usbh_ehci: usb@5800d000 {
 			compatible = "generic-ehci";
 			reg = <0x5800d000 0x1000>;
 			clocks = <&rcc USBH>;
@@ -1587,6 +1604,11 @@
 			status = "disabled";
 		};
 
+		tamp: tamp@5c00a000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			reg = <0x5c00a000 0x400>;
+		};
+
 		/*
 		 * Break node order to solve dependency probe issue between
 		 * pinctrl and exti.
@@ -1765,6 +1787,8 @@
 			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
 			st,syscfg-tz = <&rcc 0x000 0x1>;
 			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
+			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
+			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/dts/stm32mp153.dtsi b/arch/arm/dts/stm32mp153.dtsi
index 6d9ab08667..1c1889b194 100644
--- a/arch/arm/dts/stm32mp153.dtsi
+++ b/arch/arm/dts/stm32mp153.dtsi
@@ -16,6 +16,12 @@
 		};
 	};
 
+	arm-pmu {
+		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+
 	soc {
 		m_can1: can@4400e000 {
 			compatible = "bosch,m_can";
diff --git a/arch/arm/dts/stm32mp157c-dk2.dts b/arch/arm/dts/stm32mp157c-dk2.dts
index 045636555d..2bc92ef3ae 100644
--- a/arch/arm/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/dts/stm32mp157c-dk2.dts
@@ -29,6 +29,10 @@
 	};
 };
 
+&cryp1 {
+	status = "okay";
+};
+
 &dsi {
 	status = "okay";
 	phy-dsi-supply = <&reg18>;
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index dd911c9932..6e89f88a17 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -89,6 +89,14 @@
 		states = <1800000 0x1>,
 			 <2900000 0x0>;
 	};
+
+	vin: vin {
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 };
 
 &adc {
@@ -115,6 +123,14 @@
 	cpu-supply = <&vddcore>;
 };
 
+&crc1 {
+	status = "okay";
+};
+
+&cryp1 {
+	status = "okay";
+};
+
 &dac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
@@ -136,6 +152,10 @@
 	contiguous-area = <&gpu_reserved>;
 };
 
+&hash1 {
+	status = "okay";
+};
+
 &i2c4 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c4_pins_a>;
@@ -158,11 +178,18 @@
 
 		regulators {
 			compatible = "st,stpmic1-regulators";
+			buck1-supply = <&vin>;
+			buck2-supply = <&vin>;
+			buck3-supply = <&vin>;
+			buck4-supply = <&vin>;
 			ldo1-supply = <&v3v3>;
 			ldo2-supply = <&v3v3>;
 			ldo3-supply = <&vdd_ddr>;
+			ldo4-supply = <&vin>;
 			ldo5-supply = <&v3v3>;
 			ldo6-supply = <&v3v3>;
+			vref_ddr-supply = <&vin>;
+			boost-supply = <&vin>;
 			pwr_sw1-supply = <&bst_out>;
 			pwr_sw2-supply = <&bst_out>;
 
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index a55e80ce26..5c5b1ddf7b 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -90,6 +90,7 @@
 	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov5640_0>;
+			bus-type = <5>;
 			bus-width = <8>;
 			hsync-active = <0>;
 			vsync-active = <0>;
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index 6868769c6e..11bc247065 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -76,61 +76,6 @@
 	pinctrl-1 = <&fmc_sleep_pins_b &mco2_sleep_pins_a>;
 	pinctrl-names = "default", "sleep";
 
-	fmc_pins_b: fmc-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
-				 <STM32_PINMUX('D', 5, AF12)>, /* FMC_NWE */
-				 <STM32_PINMUX('B', 7, AF12)>, /* FMC_NL */
-				 <STM32_PINMUX('D', 14, AF12)>, /* FMC_D0 */
-				 <STM32_PINMUX('D', 15, AF12)>, /* FMC_D1 */
-				 <STM32_PINMUX('D', 0, AF12)>, /* FMC_D2 */
-				 <STM32_PINMUX('D', 1, AF12)>, /* FMC_D3 */
-				 <STM32_PINMUX('E', 7, AF12)>, /* FMC_D4 */
-				 <STM32_PINMUX('E', 8, AF12)>, /* FMC_D5 */
-				 <STM32_PINMUX('E', 9, AF12)>, /* FMC_D6 */
-				 <STM32_PINMUX('E', 10, AF12)>, /* FMC_D7 */
-				 <STM32_PINMUX('E', 11, AF12)>, /* FMC_D8 */
-				 <STM32_PINMUX('E', 12, AF12)>, /* FMC_D9 */
-				 <STM32_PINMUX('E', 13, AF12)>, /* FMC_D10 */
-				 <STM32_PINMUX('E', 14, AF12)>, /* FMC_D11 */
-				 <STM32_PINMUX('E', 15, AF12)>, /* FMC_D12 */
-				 <STM32_PINMUX('D', 8, AF12)>, /* FMC_D13 */
-				 <STM32_PINMUX('D', 9, AF12)>, /* FMC_D14 */
-				 <STM32_PINMUX('D', 10, AF12)>, /* FMC_D15 */
-				 <STM32_PINMUX('G', 9, AF12)>, /* FMC_NE2_FMC_NCE */
-				 <STM32_PINMUX('G', 12, AF12)>; /* FMC_NE4 */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <3>;
-		};
-	};
-
-	fmc_sleep_pins_b: fmc-sleep-0 {
-		pins {
-			pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* FMC_NOE */
-				 <STM32_PINMUX('D', 5, ANALOG)>, /* FMC_NWE */
-				 <STM32_PINMUX('B', 7, ANALOG)>, /* FMC_NL */
-				 <STM32_PINMUX('D', 14, ANALOG)>, /* FMC_D0 */
-				 <STM32_PINMUX('D', 15, ANALOG)>, /* FMC_D1 */
-				 <STM32_PINMUX('D', 0, ANALOG)>, /* FMC_D2 */
-				 <STM32_PINMUX('D', 1, ANALOG)>, /* FMC_D3 */
-				 <STM32_PINMUX('E', 7, ANALOG)>, /* FMC_D4 */
-				 <STM32_PINMUX('E', 8, ANALOG)>, /* FMC_D5 */
-				 <STM32_PINMUX('E', 9, ANALOG)>, /* FMC_D6 */
-				 <STM32_PINMUX('E', 10, ANALOG)>, /* FMC_D7 */
-				 <STM32_PINMUX('E', 11, ANALOG)>, /* FMC_D8 */
-				 <STM32_PINMUX('E', 12, ANALOG)>, /* FMC_D9 */
-				 <STM32_PINMUX('E', 13, ANALOG)>, /* FMC_D10 */
-				 <STM32_PINMUX('E', 14, ANALOG)>, /* FMC_D11 */
-				 <STM32_PINMUX('E', 15, ANALOG)>, /* FMC_D12 */
-				 <STM32_PINMUX('D', 8, ANALOG)>, /* FMC_D13 */
-				 <STM32_PINMUX('D', 9, ANALOG)>, /* FMC_D14 */
-				 <STM32_PINMUX('D', 10, ANALOG)>, /* FMC_D15 */
-				 <STM32_PINMUX('G', 9, ANALOG)>, /* FMC_NE2_FMC_NCE */
-				 <STM32_PINMUX('G', 12, ANALOG)>; /* FMC_NE4 */
-		};
-	};
-
 	mco2_pins_a: mco2-0 {
 		pins {
 			pinmux = <STM32_PINMUX('G', 2, AF1)>; /* MCO2 */
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
index aa4aa83e05..68987f64c5 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -80,6 +80,14 @@
 		dais = <&sai2a_port &sai2b_port &i2s2_port>;
 		status = "okay";
 	};
+
+	vin: vin {
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 };
 
 &adc {
@@ -116,6 +124,10 @@
 	status = "okay";
 };
 
+&crc1 {
+	status = "okay";
+};
+
 &dts {
 	status = "okay";
 };
@@ -151,6 +163,10 @@
 	contiguous-area = <&gpu_reserved>;
 };
 
+&hash1 {
+	status = "okay";
+};
+
 &i2c1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c1_pins_a>;
@@ -238,21 +254,27 @@
 	/delete-property/dmas;
 	/delete-property/dma-names;
 
-	typec: stusb1600@28 {
+	stusb1600@28 {
 		compatible = "st,stusb1600";
 		reg = <0x28>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-parent = <&gpioi>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&stusb1600_pins_a>;
-
 		status = "okay";
+		vdd-supply = <&vin>;
 
-		typec_con: connector {
+		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "sink";
-			power-opmode = "default";
+			power-role = "dual";
+			typec-power-opmode = "default";
+
+			port {
+				con_usbotg_hs_ep: endpoint {
+					remote-endpoint = <&usbotg_hs_ep>;
+				};
+			};
 		};
 	};
 
@@ -266,9 +288,18 @@
 
 		regulators {
 			compatible = "st,stpmic1-regulators";
+			buck1-supply = <&vin>;
+			buck2-supply = <&vin>;
+			buck3-supply = <&vin>;
+			buck4-supply = <&vin>;
 			ldo1-supply = <&v3v3>;
+			ldo2-supply = <&vin>;
 			ldo3-supply = <&vdd_ddr>;
+			ldo4-supply = <&vin>;
+			ldo5-supply = <&vin>;
 			ldo6-supply = <&v3v3>;
+			vref_ddr-supply = <&vin>;
+			boost-supply = <&vin>;
 			pwr_sw1-supply = <&bst_out>;
 			pwr_sw2-supply = <&bst_out>;
 
@@ -657,6 +688,12 @@
 	phy-names = "usb2-phy";
 	usb-role-switch;
 	status = "okay";
+
+	port {
+		usbotg_hs_ep: endpoint {
+			remote-endpoint = <&con_usbotg_hs_ep>;
+		};
+	};
 };
 
 &usbphyc {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
