Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A81CA5B0351
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 13:42:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35A03C0D2BF;
	Wed,  7 Sep 2022 11:42:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE3C8C03FC0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 11:42:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2879DPmj018656;
 Wed, 7 Sep 2022 13:42:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Nq+dNErkQp5Dg8jfSOzpks5c4E8doAVlm1weAxNzK4s=;
 b=dqox+8TKIr34g5Wguj8okf7kUD2EnC/Mf59dABbYueqd7oAKI2dEEqAVg89hWJzG39z8
 kP/8grQtTvzggkyFQD+BlguMkpm3ZIBE/7ZTxYMjIR+JbqMn45wsnltQM0QwOkV63riN
 uSpyhqrYRebhhYgfj48PbLStbHM9lbzjz1pPdviqRpEF34I0UI9AJqVFZjmzgh2/EF0d
 ACNGfl19qHyubF2NPPLq5qxC+xjABw0OzNc3YbCnvmp9eyxHRdAYYzGeSZ4wT+WIPgDU
 hdfC33xqIeDQYa8dgtWw5vd07Huh82zOScZkcayEXd4NV8if/zsHpU3yFL+LEQ38Iu3S yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jerfv0y4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 13:42:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90F5E10002A;
 Wed,  7 Sep 2022 13:42:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 791F32248CA;
 Wed,  7 Sep 2022 13:42:25 +0200 (CEST)
Received: from localhost (10.75.127.123) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 7 Sep
 2022 13:42:25 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 7 Sep 2022 13:42:23 +0200
Message-ID: <20220907134201.1.I8c8568a1dada00ca09ce1f3d5abaf38e6fdf66d5@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_06,2022-09-07_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32mp: alignment with v6.0-rc3
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

Device tree alignment with Linux kernel v6.0-rc3:
- ARM: dts: stm32: add support for USB2514B onboard hub on stm32mp15xx-dkx
- ARM: dts: stm32: Add alternate pinmux for RCC pin
- ARM: dts: stm32: Add alternate pinmux for DCMI pins
- ARM: dts: stm32: Add alternate pinmux for SPI2 pins
- ARM: dts: stm32: Fix SPI2 pinmux pin comments on stm32mp15
- ARM: dts: stm32: add optee reserved memory on stm32mp135f-dk
- ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP13
- ARM: dts: stm32: remove the IPCC "wakeup" IRQ on stm32mp151

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp13-u-boot.dtsi  | 10 +++--
 arch/arm/dts/stm32mp131.dtsi        | 28 ++++++-------
 arch/arm/dts/stm32mp135f-dk.dts     |  4 +-
 arch/arm/dts/stm32mp15-pinctrl.dtsi | 64 ++++++++++++++++++++++++++---
 arch/arm/dts/stm32mp151.dtsi        |  7 ++--
 arch/arm/dts/stm32mp15xx-dkx.dtsi   |  8 ++++
 6 files changed, 91 insertions(+), 30 deletions(-)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index 01552adb7c4..47a43649bbb 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -17,6 +17,12 @@
 		pinctrl0 = &pinctrl;
 	};
 
+	firmware {
+		optee {
+			u-boot,dm-pre-reloc;
+		};
+	};
+
 	/* need PSCI for sysreset during board_f */
 	psci {
 		u-boot,dm-pre-proper;
@@ -82,10 +88,6 @@
 	u-boot,dm-pre-reloc;
 };
 
-&optee {
-	u-boot,dm-pre-reloc;
-};
-
 &pinctrl {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index 84e16bb2f2b..a1c6d0d00b5 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -27,21 +27,8 @@
 		interrupt-parent = <&intc>;
 	};
 
-	scmi_sram: sram@2ffff000 {
-		compatible = "mmio-sram";
-		reg = <0x2ffff000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x2ffff000 0x1000>;
-
-		scmi_shm: scmi_shm@0 {
-			compatible = "arm,scmi-shmem";
-			reg = <0 0x80>;
-		};
-	};
-
 	firmware {
-		optee: optee {
+		optee {
 			method = "smc";
 			compatible = "linaro,optee-tz";
 		};
@@ -151,6 +138,19 @@
 		interrupt-parent = <&intc>;
 		ranges;
 
+		scmi_sram: sram@2ffff000 {
+			compatible = "mmio-sram";
+			reg = <0x2ffff000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x2ffff000 0x1000>;
+
+			scmi_shm: scmi-sram@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0 0x80>;
+			};
+		};
+
 		uart4: serial@40010000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x40010000 0x400>;
diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
index f436ffab998..e6b8ffd332c 100644
--- a/arch/arm/dts/stm32mp135f-dk.dts
+++ b/arch/arm/dts/stm32mp135f-dk.dts
@@ -31,8 +31,8 @@
 		#size-cells = <1>;
 		ranges;
 
-		optee@de000000 {
-			reg = <0xde000000 0x2000000>;
+		optee@dd000000 {
+			reg = <0xdd000000 0x3000000>;
 			no-map;
 		};
 	};
diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index d3ed10335df..2cc9341d43d 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -151,6 +151,43 @@
 		};
 	};
 
+	dcmi_pins_c: dcmi-2 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4,  AF13)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('A', 9,  AF13)>,/* DCMI_D0 */
+				 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
+				 <STM32_PINMUX('E', 0, AF13)>,/* DCMI_D2 */
+				 <STM32_PINMUX('E', 1, AF13)>,/* DCMI_D3 */
+				 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
+				 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
+				 <STM32_PINMUX('I', 6,  AF13)>,/* DCMI_D6 */
+				 <STM32_PINMUX('E', 6,  AF13)>,/* DCMI_D7 */
+				 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
+				 <STM32_PINMUX('H', 7,  AF13)>;/* DCMI_D9 */
+			bias-pull-up;
+		};
+	};
+
+	dcmi_sleep_pins_c: dcmi-sleep-2 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4,  ANALOG)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('A', 9,  ANALOG)>,/* DCMI_D0 */
+				 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
+				 <STM32_PINMUX('E', 0, ANALOG)>,/* DCMI_D2 */
+				 <STM32_PINMUX('E', 1, ANALOG)>,/* DCMI_D3 */
+				 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
+				 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
+				 <STM32_PINMUX('I', 6,  ANALOG)>,/* DCMI_D6 */
+				 <STM32_PINMUX('E', 6,  ANALOG)>,/* DCMI_D7 */
+				 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
+				 <STM32_PINMUX('H', 7,  ANALOG)>;/* DCMI_D9 */
+		};
+	};
+
 	ethernet0_rgmii_pins_a: rgmii-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
@@ -923,6 +960,21 @@
 		};
 	};
 
+	mco1_pins_a: mco1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 13, AF2)>; /* MCO1 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	mco1_sleep_pins_a: mco1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 13, ANALOG)>; /* MCO1 */
+		};
+	};
+
 	mco2_pins_a: mco2-0 {
 		pins {
 			pinmux = <STM32_PINMUX('G', 2, AF1)>; /* MCO2 */
@@ -1814,30 +1866,30 @@
 
 	spi2_pins_a: spi2-0 {
 		pins1 {
-			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI1_SCK */
-				 <STM32_PINMUX('I', 3, AF5)>; /* SPI1_MOSI */
+			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
+				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <1>;
 		};
 
 		pins2 {
-			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI1_MISO */
+			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
 			bias-disable;
 		};
 	};
 
 	spi2_pins_b: spi2-1 {
 		pins1 {
-			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI1_SCK */
-				 <STM32_PINMUX('I', 3, AF5)>; /* SPI1_MOSI */
+			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
+				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <1>;
 		};
 
 		pins2 {
-			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI1_MISO */
+			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
 			bias-disable;
 		};
 	};
diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index 767a06ef684..f0fb022fc63 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -1143,10 +1143,9 @@
 			reg = <0x4c001000 0x400>;
 			st,proc-id = <0>;
 			interrupts-extended =
-				<&intc GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-				<&exti 61 1>;
-			interrupt-names = "rx", "tx", "wakeup";
+				<&exti 61 1>,
+				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "rx", "tx";
 			clocks = <&rcc IPCC>;
 			wakeup-source;
 			status = "disabled";
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
index 3d36cac9ed0..5a045d7156b 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -685,6 +685,14 @@
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	/* onboard HUB */
+	hub@1 {
+		compatible = "usb424,2514";
+		reg = <1>;
+		vdd-supply = <&v3v3>;
+	};
 };
 
 &usbotg_hs {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
