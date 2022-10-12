Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C95FC7D0
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Oct 2022 16:53:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE35C64112;
	Wed, 12 Oct 2022 14:53:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C80FC640FE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 12:34:01 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CAd0jQ004884;
 Wed, 12 Oct 2022 14:34:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=QdjK2IwiHUo4fma0nP9MyUS5lVY2wWenSGLjw8oFJZ8=;
 b=rgJJ3cFjzJBm1/GI2Rnh8JZcn8Per56dy9D4ntWcOrMbKL56zOz90g1HBonSNfN3nbmT
 iJtIvMXxmdwu+STE2EbwvelBsp2Z+ILkuZMaAFw6EAKQW/AryRWP+bVQA9oUA1dryhNZ
 JQfy1GBehhFZXF4GxKKAdcliFQEXIUphNuswO5g75pm09Wt48XS4gz91ueYyVBjU8IyY
 ryJaEEXN7AS65F3nnSx8s5Jpfo6D1JLE0kRHMdn5IvImWvQ9AJycxKr7ym9mLLjlfKGm
 W44spYnTupsp6feaq8K9PgPkcYIdiaSZmKPgdTR0NLyS50zf343mw/qZBoe+797okJ47 UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31exsyfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 14:34:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D655810003A;
 Wed, 12 Oct 2022 14:33:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1A78228A2B;
 Wed, 12 Oct 2022 14:33:55 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 14:33:55 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Oct 2022 14:33:17 +0200
Message-ID: <20221012123317.434898-4-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221012123317.434898-1-gabriel.fernandez@foss.st.com>
References: <20221012123317.434898-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_06,2022-10-12_01,2022-06-22_01
X-Mailman-Approved-At: Wed, 12 Oct 2022 14:53:55 +0000
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 3/3] arm: dts: stm32mp13: add support of RCC
	driver
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

Adds support of Clock and Reset drivers for STM32MP13 platform.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

---

 arch/arm/dts/stm32mp13-u-boot.dtsi |   4 +
 arch/arm/dts/stm32mp131.dtsi       | 119 +++++++++++------------------
 arch/arm/dts/stm32mp133.dtsi       |   4 +-
 arch/arm/dts/stm32mp13xf.dtsi      |   3 +-
 4 files changed, 52 insertions(+), 78 deletions(-)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index 47a43649bb..3730f474b2 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -92,6 +92,10 @@
 	u-boot,dm-pre-reloc;
 };
 
+&rcc {
+	u-boot,dm-pre-reloc;
+};
+
 &scmi {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index a1c6d0d00b..d893bc24b4 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -4,6 +4,8 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/stm32mp13-clks.h>
+#include <dt-bindings/reset/stm32mp13-resets.h>
 
 / {
 	#address-cells = <1>;
@@ -52,62 +54,6 @@
 		};
 	};
 
-	clocks {
-		clk_axi: clk-axi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <266500000>;
-		};
-
-		clk_hse: clk-hse {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <24000000>;
-		};
-
-		clk_hsi: clk-hsi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <64000000>;
-		};
-
-		clk_lsi: clk-lsi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <32000>;
-		};
-
-		clk_pclk3: clk-pclk3 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <104438965>;
-		};
-
-		clk_pclk4: clk-pclk4 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <133250000>;
-		};
-
-		clk_pll4_p: clk-pll4_p {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <50000000>;
-		};
-
-		clk_pll4_r: clk-pll4_r {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <99000000>;
-		};
-
-		clk_rtc_k: clk-rtc-k {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <32768>;
-		};
-	};
-
 	intc: interrupt-controller@a0021000 {
 		compatible = "arm,cortex-a7-gic";
 		#interrupt-cells = <3>;
@@ -155,7 +101,8 @@
 			compatible = "st,stm32h7-uart";
 			reg = <0x40010000 0x400>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_hsi>;
+			clocks = <&rcc UART4_K>;
+			resets = <&rcc UART4_R>;
 			status = "disabled";
 		};
 
@@ -170,7 +117,8 @@
 				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_pclk4>;
+			clocks = <&rcc DMA1>;
+			resets = <&rcc DMA1_R>;
 			#dma-cells = <4>;
 			st,mem2mem;
 			dma-requests = <8>;
@@ -187,7 +135,8 @@
 				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_pclk4>;
+			clocks = <&rcc DMA2>;
+			resets = <&rcc DMA2_R>;
 			#dma-cells = <4>;
 			st,mem2mem;
 			dma-requests = <8>;
@@ -196,13 +145,29 @@
 		dmamux1: dma-router@48002000 {
 			compatible = "st,stm32h7-dmamux";
 			reg = <0x48002000 0x40>;
-			clocks = <&clk_pclk4>;
+			clocks = <&rcc DMAMUX1>;
+			resets = <&rcc DMAMUX1_R>;
 			#dma-cells = <3>;
 			dma-masters = <&dma1 &dma2>;
 			dma-requests = <128>;
 			dma-channels = <16>;
 		};
 
+		rcc: rcc@50000000 {
+			compatible = "st,stm32mp13-rcc", "syscon";
+			reg = <0x50000000 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+			clock-names = "hse", "hsi", "csi", "lse", "lsi";
+			clocks = <&scmi_clk CK_SCMI_HSE>,
+				 <&scmi_clk CK_SCMI_HSI>,
+				 <&scmi_clk CK_SCMI_CSI>,
+				 <&scmi_clk CK_SCMI_LSE>,
+				 <&scmi_clk CK_SCMI_LSI>;
+		};
+
 		exti: interrupt-controller@5000d000 {
 			compatible = "st,stm32mp13-exti", "syscon";
 			interrupt-controller;
@@ -213,14 +178,14 @@
 		syscfg: syscon@50020000 {
 			compatible = "st,stm32mp157-syscfg", "syscon";
 			reg = <0x50020000 0x400>;
-			clocks = <&clk_pclk3>;
+			clocks = <&rcc SYSCFG>;
 		};
 
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_pclk4>;
+			clocks = <&rcc MDMA>;
 			#dma-cells = <5>;
 			dma-channels = <32>;
 			dma-requests = <48>;
@@ -232,8 +197,9 @@
 			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "cmd_irq";
-			clocks = <&clk_pll4_p>;
+			clocks = <&rcc SDMMC1_K>;
 			clock-names = "apb_pclk";
+			resets = <&rcc SDMMC1_R>;
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			max-frequency = <130000000>;
@@ -246,8 +212,10 @@
 			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "cmd_irq";
-			clocks = <&clk_pll4_p>;
+			clocks = <&rcc SDMMC2_K>;
 			clock-names = "apb_pclk";
+			resets = <&rcc SDMMC2_R>;
+
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			max-frequency = <130000000>;
@@ -257,7 +225,7 @@
 		iwdg2: watchdog@5a002000 {
 			compatible = "st,stm32mp1-iwdg";
 			reg = <0x5a002000 0x400>;
-			clocks = <&clk_pclk4>, <&clk_lsi>;
+			clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 			clock-names = "pclk", "lsi";
 			status = "disabled";
 		};
@@ -266,7 +234,8 @@
 			compatible = "st,stm32mp1-rtc";
 			reg = <0x5c004000 0x400>;
 			interrupts-extended = <&exti 19 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_pclk4>, <&clk_rtc_k>;
+			clocks = <&scmi_clk CK_SCMI_RTCAPB>,
+				 <&scmi_clk CK_SCMI_RTC>;
 			clock-names = "pclk", "rtc_ck";
 			status = "disabled";
 		};
@@ -307,7 +276,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x0 0x400>;
-				clocks = <&clk_pclk4>;
+				clocks = <&rcc GPIOA>;
 				st,bank-name = "GPIOA";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 0 16>;
@@ -319,7 +288,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x1000 0x400>;
-				clocks = <&clk_pclk4>;
+				clocks = <&rcc GPIOB>;
 				st,bank-name = "GPIOB";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 16 16>;
@@ -331,7 +300,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x2000 0x400>;
-				clocks = <&clk_pclk4>;
+				clocks = <&rcc GPIOC>;
 				st,bank-name = "GPIOC";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 32 16>;
@@ -343,7 +312,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x3000 0x400>;
-				clocks = <&clk_pclk4>;
+				clocks = <&rcc GPIOD>;
 				st,bank-name = "GPIOD";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 48 16>;
@@ -355,7 +324,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x4000 0x400>;
-				clocks = <&clk_pclk4>;
+				clocks = <&rcc GPIOE>;
 				st,bank-name = "GPIOE";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 64 16>;
@@ -367,7 +336,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x5000 0x400>;
-				clocks = <&clk_pclk4>;
+				clocks = <&rcc GPIOF>;
 				st,bank-name = "GPIOF";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 80 16>;
@@ -379,7 +348,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x6000 0x400>;
-				clocks = <&clk_pclk4>;
+				clocks = <&rcc GPIOG>;
 				st,bank-name = "GPIOG";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 96 16>;
@@ -391,7 +360,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x7000 0x400>;
-				clocks = <&clk_pclk4>;
+				clocks = <&rcc GPIOH>;
 				st,bank-name = "GPIOH";
 				ngpios = <15>;
 				gpio-ranges = <&pinctrl 0 112 15>;
@@ -403,7 +372,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x8000 0x400>;
-				clocks = <&clk_pclk4>;
+				clocks = <&rcc GPIOI>;
 				st,bank-name = "GPIOI";
 				ngpios = <8>;
 				gpio-ranges = <&pinctrl 0 128 8>;
diff --git a/arch/arm/dts/stm32mp133.dtsi b/arch/arm/dts/stm32mp133.dtsi
index 0fb1386257..531c263c9f 100644
--- a/arch/arm/dts/stm32mp133.dtsi
+++ b/arch/arm/dts/stm32mp133.dtsi
@@ -15,7 +15,7 @@
 			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "int0", "int1";
-			clocks = <&clk_hse>, <&clk_pll4_r>;
+			clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
 			status = "disabled";
@@ -28,7 +28,7 @@
 			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "int0", "int1";
-			clocks = <&clk_hse>, <&clk_pll4_r>;
+			clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
 			status = "disabled";
diff --git a/arch/arm/dts/stm32mp13xf.dtsi b/arch/arm/dts/stm32mp13xf.dtsi
index fa6889e305..4d00e75928 100644
--- a/arch/arm/dts/stm32mp13xf.dtsi
+++ b/arch/arm/dts/stm32mp13xf.dtsi
@@ -10,7 +10,8 @@
 			compatible = "st,stm32mp1-cryp";
 			reg = <0x54002000 0x400>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_axi>;
+			clocks = <&rcc CRYP1>;
+			resets = <&rcc CRYP1_R>;
 			status = "disabled";
 		};
 	};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
