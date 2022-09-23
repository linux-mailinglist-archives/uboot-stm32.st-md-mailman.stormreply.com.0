Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8295E794E
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Sep 2022 13:20:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BA5FC57B6C;
	Fri, 23 Sep 2022 11:20:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B069C03FD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 11:20:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N9bvYq022592;
 Fri, 23 Sep 2022 13:20:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=8zo/0tUeCikcyD4mmPisBucj7ZCH+HbzNm+OtrpiKLM=;
 b=P7xtVrXBOh8d5Au0w+SV2sWdSYvWsxTgh2Ido7M18RKZ3FIRN2KtEvAEBDkKvmcb65Aj
 uW4iDWVFQ68XvutTgDUvg5EC+DDolbTH3uqpwyqGQy7IQIg3MjsZj6SvCB4t9GKG+vh7
 6L5bGA8Y2EiBLxrCQM9VpPznbufGe3tMw/GbXQPX+xD3apoaAoveooLJtADbt7ZMYCb6
 XoZrDI/rjVRYVXZMYn8qZ1aW2hqajlPJZYNFdXvhE+Jg8dF+MZpM3lHEtDDeoPqZEh0o
 zVUNEad5DBe2lGyPfEJDeFu6H174vw5ONyXFDKrp9rqcI6Z7sal2OSnoL+umJNtHuUhZ Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6auempa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 13:20:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47A34100034;
 Fri, 23 Sep 2022 13:20:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E11A321B527;
 Fri, 23 Sep 2022 13:20:38 +0200 (CEST)
Received: from localhost (10.75.127.117) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 13:20:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 23 Sep 2022 13:20:33 +0200
Message-ID: <20220923112033.2458836-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_03,2022-09-22_02,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: DT sync with kernel v6.0-rc4
	for MCU's boards
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

Device tree alignment with kernel v6.0-rc4.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32429i-eval-u-boot.dtsi  |  2 +-
 arch/arm/dts/stm32746g-eval.dts          | 18 ++++-
 arch/arm/dts/stm32f4-pinctrl.dtsi        |  2 +-
 arch/arm/dts/stm32f429-disco-u-boot.dtsi |  4 +-
 arch/arm/dts/stm32f429-disco.dts         | 20 +++--
 arch/arm/dts/stm32f429-pinctrl.dtsi      | 94 +++++++++++------------
 arch/arm/dts/stm32f429.dtsi              | 69 +++--------------
 arch/arm/dts/stm32f469-disco-u-boot.dtsi |  4 +-
 arch/arm/dts/stm32f469-disco.dts         | 24 ++++--
 arch/arm/dts/stm32f469-pinctrl.dtsi      | 96 ++++++++++++------------
 arch/arm/dts/stm32f7-pinctrl.dtsi        |  2 +-
 arch/arm/dts/stm32f7-u-boot.dtsi         |  2 +-
 arch/arm/dts/stm32f746-disco.dts         | 12 +++
 arch/arm/dts/stm32f746.dtsi              | 67 +----------------
 arch/arm/dts/stm32f769-disco.dts         | 18 ++++-
 arch/arm/dts/stm32h743.dtsi              | 19 ++---
 arch/arm/dts/stm32h743i-disco.dts        |  8 +-
 arch/arm/dts/stm32h743i-eval.dts         |  8 +-
 arch/arm/dts/stm32h750i-art-pi.dts       |  8 +-
 19 files changed, 207 insertions(+), 270 deletions(-)

diff --git a/arch/arm/dts/stm32429i-eval-u-boot.dtsi b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
index fcab9ae977..030da47b7a 100644
--- a/arch/arm/dts/stm32429i-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
@@ -218,6 +218,6 @@
 	};
 };
 
-&timer5 {
+&timers5 {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32746g-eval.dts b/arch/arm/dts/stm32746g-eval.dts
index 9940cf1873..0e6445a539 100644
--- a/arch/arm/dts/stm32746g-eval.dts
+++ b/arch/arm/dts/stm32746g-eval.dts
@@ -45,12 +45,10 @@
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@0 {
+		button-0 {
 			label = "Wake up";
 			linux,code = <KEY_WAKEUP>;
 			gpios = <&gpioc 13 0>;
@@ -160,6 +158,18 @@
 	bus-width = <4>;
 };
 
+&timers5 {
+	/* Override timer5 to act as clockevent */
+	compatible = "st,stm32-timer";
+	interrupts = <50>;
+	status = "okay";
+	/delete-property/#address-cells;
+	/delete-property/#size-cells;
+	/delete-property/clock-names;
+	/delete-node/pwm;
+	/delete-node/timer@4;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/dts/stm32f4-pinctrl.dtsi b/arch/arm/dts/stm32f4-pinctrl.dtsi
index adf502694b..46815c965d 100644
--- a/arch/arm/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/dts/stm32f4-pinctrl.dtsi
@@ -9,7 +9,7 @@
 
 / {
 	soc {
-		pinctrl: pin-controller {
+		pinctrl: pinctrl@40020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x40020000 0x3000>;
diff --git a/arch/arm/dts/stm32f429-disco-u-boot.dtsi b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
index c993f86be8..dcc68c4bcc 100644
--- a/arch/arm/dts/stm32f429-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
@@ -27,7 +27,7 @@
 
 	soc {
 		u-boot,dm-pre-reloc;
-		pin-controller {
+		pinctrl@40020000 {
 			u-boot,dm-pre-reloc;
 		};
 
@@ -193,6 +193,6 @@
 	u-boot,dm-pre-reloc;
 };
 
-&timer5 {
+&timers5 {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32f429-disco.dts b/arch/arm/dts/stm32f429-disco.dts
index 42477c8d3f..30daabd10a 100644
--- a/arch/arm/dts/stm32f429-disco.dts
+++ b/arch/arm/dts/stm32f429-disco.dts
@@ -39,12 +39,10 @@
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@0 {
+		button-0 {
 			label = "User";
 			linux,code = <KEY_HOME>;
 			gpios = <&gpioa 0 0>;
@@ -152,7 +150,7 @@
 
 	display: display@1{
 		/* Connect panel-ilitek-9341 to ltdc */
-		compatible = "st,sf-tc240t-9370-t";
+		compatible = "st,sf-tc240t-9370-t", "ilitek,ili9341";
 		reg = <1>;
 		spi-3wire;
 		spi-max-frequency = <10000000>;
@@ -165,6 +163,18 @@
 	};
 };
 
+&timers5 {
+	/* Override timer5 to act as clockevent */
+	compatible = "st,stm32-timer";
+	interrupts = <50>;
+	status = "okay";
+	/delete-property/#address-cells;
+	/delete-property/#size-cells;
+	/delete-property/clock-names;
+	/delete-node/pwm;
+	/delete-node/timer@4;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/dts/stm32f429-pinctrl.dtsi b/arch/arm/dts/stm32f429-pinctrl.dtsi
index 575c7eecab..5be171eea5 100644
--- a/arch/arm/dts/stm32f429-pinctrl.dtsi
+++ b/arch/arm/dts/stm32f429-pinctrl.dtsi
@@ -6,54 +6,50 @@
 
 #include "stm32f4-pinctrl.dtsi"
 
-/ {
-	soc {
-		pinctrl: pin-controller {
-			compatible = "st,stm32f429-pinctrl";
-
-			gpioa: gpio@40020000 {
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@40020400 {
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@40020800 {
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@40020c00 {
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@40021000 {
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@40021400 {
-				gpio-ranges = <&pinctrl 0 80 16>;
-			};
-
-			gpiog: gpio@40021800 {
-				gpio-ranges = <&pinctrl 0 96 16>;
-			};
-
-			gpioh: gpio@40021c00 {
-				gpio-ranges = <&pinctrl 0 112 16>;
-			};
-
-			gpioi: gpio@40022000 {
-				gpio-ranges = <&pinctrl 0 128 16>;
-			};
-
-			gpioj: gpio@40022400 {
-				gpio-ranges = <&pinctrl 0 144 16>;
-			};
-
-			gpiok: gpio@40022800 {
-				gpio-ranges = <&pinctrl 0 160 8>;
-			};
-		};
+&pinctrl {
+	compatible = "st,stm32f429-pinctrl";
+
+	gpioa: gpio@40020000 {
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@40020400 {
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@40020800 {
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@40020c00 {
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@40021000 {
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@40021400 {
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@40021800 {
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@40021c00 {
+		gpio-ranges = <&pinctrl 0 112 16>;
+	};
+
+	gpioi: gpio@40022000 {
+		gpio-ranges = <&pinctrl 0 128 16>;
+	};
+
+	gpioj: gpio@40022400 {
+		gpio-ranges = <&pinctrl 0 144 16>;
+	};
+
+	gpiok: gpio@40022800 {
+		gpio-ranges = <&pinctrl 0 160 8>;
 	};
 };
diff --git a/arch/arm/dts/stm32f429.dtsi b/arch/arm/dts/stm32f429.dtsi
index a81e916064..e5b13aca40 100644
--- a/arch/arm/dts/stm32f429.dtsi
+++ b/arch/arm/dts/stm32f429.dtsi
@@ -52,14 +52,6 @@
 			};
 		};
 
-		timer2: timer@40000000 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000000 0x400>;
-			interrupts = <28>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM2)>;
-			status = "disabled";
-		};
-
 		timers2: timers@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -82,14 +74,6 @@
 			};
 		};
 
-		timer3: timer@40000400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000400 0x400>;
-			interrupts = <29>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM3)>;
-			status = "disabled";
-		};
-
 		timers3: timers@40000400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -112,14 +96,6 @@
 			};
 		};
 
-		timer4: timer@40000800 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000800 0x400>;
-			interrupts = <30>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM4)>;
-			status = "disabled";
-		};
-
 		timers4: timers@40000800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -142,13 +118,6 @@
 			};
 		};
 
-		timer5: timer@40000c00 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000c00 0x400>;
-			interrupts = <50>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM5)>;
-		};
-
 		timers5: timers@40000c00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -171,14 +140,6 @@
 			};
 		};
 
-		timer6: timer@40001000 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001000 0x400>;
-			interrupts = <54>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM6)>;
-			status = "disabled";
-		};
-
 		timers6: timers@40001000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -195,14 +156,6 @@
 			};
 		};
 
-		timer7: timer@40001400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001400 0x400>;
-			interrupts = <55>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM7)>;
-			status = "disabled";
-		};
-
 		timers7: timers@40001400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -242,8 +195,6 @@
 		};
 
 		timers13: timers@40001c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40001C00 0x400>;
 			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM13)>;
@@ -258,8 +209,6 @@
 		};
 
 		timers14: timers@40002000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40002000 0x400>;
 			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM14)>;
@@ -525,7 +474,7 @@
 			};
 		};
 
-		sdio: sdio@40012c00 {
+		sdio: mmc@40012c00 {
 			compatible = "arm,pl180", "arm,primecell";
 			arm,primecell-periphid = <0x00880180>;
 			reg = <0x40012c00 0x400>;
@@ -592,8 +541,6 @@
 		};
 
 		timers10: timers@40014400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40014400 0x400>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(TIM10)>;
@@ -608,8 +555,6 @@
 		};
 
 		timers11: timers@40014800 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40014800 0x400>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(TIM11)>;
@@ -668,7 +613,7 @@
 			status = "disabled";
 		};
 
-		rcc: rcc@40023810 {
+		rcc: rcc@40023800 {
 			#reset-cells = <1>;
 			#clock-cells = <2>;
 			compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
@@ -726,6 +671,16 @@
 			status = "disabled";
 		};
 
+		dma2d: dma2d@4002b000 {
+			compatible = "st,stm32-dma2d";
+			reg = <0x4002b000 0xc00>;
+			interrupts = <90>;
+			resets = <&rcc STM32F4_AHB1_RESET(DMA2D)>;
+			clocks = <&rcc 0 STM32F4_AHB1_CLOCK(DMA2D)>;
+			clock-names = "dma2d";
+			status = "disabled";
+		};
+
 		usbotg_hs: usb@40040000 {
 			compatible = "snps,dwc2";
 			reg = <0x40040000 0x40000>;
diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index cd173623ef..7f012b49f0 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -28,7 +28,7 @@
 
 	soc {
 		u-boot,dm-pre-reloc;
-		pin-controller {
+		pinctrl@40020000 {
 			u-boot,dm-pre-reloc;
 		};
 
@@ -256,6 +256,6 @@
 	u-boot,dm-pre-reloc;
 };
 
-&timer5 {
+&timers5 {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32f469-disco.dts b/arch/arm/dts/stm32f469-disco.dts
index 23d87ee27a..6e0ffc1903 100644
--- a/arch/arm/dts/stm32f469-disco.dts
+++ b/arch/arm/dts/stm32f469-disco.dts
@@ -19,7 +19,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@00000000 {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x1000000>;
 	};
@@ -63,12 +63,10 @@
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@0 {
+		button-0 {
 			label = "User";
 			linux,code = <KEY_WAKEUP>;
 			gpios = <&gpioa 0 GPIO_ACTIVE_HIGH>;
@@ -93,6 +91,10 @@
 	clock-frequency = <8000000>;
 };
 
+&dma2d {
+	status = "okay";
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -185,6 +187,18 @@
 	bus-width = <4>;
 };
 
+&timers5 {
+	/* Override timer5 to act as clockevent */
+	compatible = "st,stm32-timer";
+	interrupts = <50>;
+	status = "okay";
+	/delete-property/#address-cells;
+	/delete-property/#size-cells;
+	/delete-property/clock-names;
+	/delete-node/pwm;
+	/delete-node/timer@4;
+};
+
 &usart3 {
 	pinctrl-0 = <&usart3_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/dts/stm32f469-pinctrl.dtsi b/arch/arm/dts/stm32f469-pinctrl.dtsi
index 1e2bb0191e..0610407c7b 100644
--- a/arch/arm/dts/stm32f469-pinctrl.dtsi
+++ b/arch/arm/dts/stm32f469-pinctrl.dtsi
@@ -5,55 +5,51 @@
 
 #include "stm32f4-pinctrl.dtsi"
 
-/ {
-	soc {
-		pinctrl: pin-controller {
-			compatible = "st,stm32f469-pinctrl";
-
-			gpioa: gpio@40020000 {
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@40020400 {
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@40020800 {
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@40020c00 {
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@40021000 {
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@40021400 {
-				gpio-ranges = <&pinctrl 0 80 16>;
-			};
-
-			gpiog: gpio@40021800 {
-				gpio-ranges = <&pinctrl 0 96 16>;
-			};
-
-			gpioh: gpio@40021c00 {
-				gpio-ranges = <&pinctrl 0 112 16>;
-			};
-
-			gpioi: gpio@40022000 {
-				gpio-ranges = <&pinctrl 0 128 16>;
-			};
-
-			gpioj: gpio@40022400 {
-				gpio-ranges = <&pinctrl 0 144 6>,
-					      <&pinctrl 12 156 4>;
-			};
-
-			gpiok: gpio@40022800 {
-				gpio-ranges = <&pinctrl 3 163 5>;
-			};
-		};
+&pinctrl {
+	compatible = "st,stm32f469-pinctrl";
+
+	gpioa: gpio@40020000 {
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@40020400 {
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@40020800 {
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@40020c00 {
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@40021000 {
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@40021400 {
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@40021800 {
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@40021c00 {
+		gpio-ranges = <&pinctrl 0 112 16>;
+	};
+
+	gpioi: gpio@40022000 {
+		gpio-ranges = <&pinctrl 0 128 16>;
+	};
+
+	gpioj: gpio@40022400 {
+		gpio-ranges = <&pinctrl 0 144 6>,
+			      <&pinctrl 12 156 4>;
+	};
+
+	gpiok: gpio@40022800 {
+		gpio-ranges = <&pinctrl 3 163 5>;
 	};
 };
diff --git a/arch/arm/dts/stm32f7-pinctrl.dtsi b/arch/arm/dts/stm32f7-pinctrl.dtsi
index fe4cfda72a..8f37aefa73 100644
--- a/arch/arm/dts/stm32f7-pinctrl.dtsi
+++ b/arch/arm/dts/stm32f7-pinctrl.dtsi
@@ -9,7 +9,7 @@
 
 / {
 	soc {
-		pinctrl: pin-controller {
+		pinctrl: pinctrl@40020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x40020000 0x3000>;
diff --git a/arch/arm/dts/stm32f7-u-boot.dtsi b/arch/arm/dts/stm32f7-u-boot.dtsi
index c1b2ac25c3..0ba8031c33 100644
--- a/arch/arm/dts/stm32f7-u-boot.dtsi
+++ b/arch/arm/dts/stm32f7-u-boot.dtsi
@@ -119,7 +119,7 @@
 	u-boot,dm-pre-reloc;
 };
 
-&timer5 {
+&timers5 {
 	u-boot,dm-pre-reloc;
 };
 
diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
index 9430dc08ec..1ed58f2361 100644
--- a/arch/arm/dts/stm32f746-disco.dts
+++ b/arch/arm/dts/stm32f746-disco.dts
@@ -73,6 +73,18 @@
 	bus-width = <4>;
 };
 
+&timers5 {
+	/* Override timer5 to act as clockevent */
+	compatible = "st,stm32-timer";
+	interrupts = <50>;
+	status = "okay";
+	/delete-property/#address-cells;
+	/delete-property/#size-cells;
+	/delete-property/clock-names;
+	/delete-node/pwm;
+	/delete-node/timer@4;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_b>;
 	pinctrl-names = "default";
diff --git a/arch/arm/dts/stm32f746.dtsi b/arch/arm/dts/stm32f746.dtsi
index 78facde2b5..c97b3d0d07 100644
--- a/arch/arm/dts/stm32f746.dtsi
+++ b/arch/arm/dts/stm32f746.dtsi
@@ -39,14 +39,6 @@
 	};
 
 	soc {
-		timer2: timer@40000000 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000000 0x400>;
-			interrupts = <28>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM2)>;
-			status = "disabled";
-		};
-
 		timers2: timers@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -69,14 +61,6 @@
 			};
 		};
 
-		timer3: timer@40000400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000400 0x400>;
-			interrupts = <29>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM3)>;
-			status = "disabled";
-		};
-
 		timers3: timers@40000400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -99,14 +83,6 @@
 			};
 		};
 
-		timer4: timer@40000800 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000800 0x400>;
-			interrupts = <30>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM4)>;
-			status = "disabled";
-		};
-
 		timers4: timers@40000800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -129,13 +105,6 @@
 			};
 		};
 
-		timer5: timer@40000c00 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000c00 0x400>;
-			interrupts = <50>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM5)>;
-		};
-
 		timers5: timers@40000c00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -158,14 +127,6 @@
 			};
 		};
 
-		timer6: timer@40001000 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001000 0x400>;
-			interrupts = <54>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM6)>;
-			status = "disabled";
-		};
-
 		timers6: timers@40001000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -182,14 +143,6 @@
 			};
 		};
 
-		timer7: timer@40001400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001400 0x400>;
-			interrupts = <55>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM7)>;
-			status = "disabled";
-		};
-
 		timers7: timers@40001400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -229,8 +182,6 @@
 		};
 
 		timers13: timers@40001c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40001C00 0x400>;
 			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM13)>;
@@ -245,8 +196,6 @@
 		};
 
 		timers14: timers@40002000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40002000 0x400>;
 			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM14)>;
@@ -313,7 +262,6 @@
 			clocks = <&rcc 1 CLK_I2C1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -326,20 +274,18 @@
 			clocks = <&rcc 1 CLK_I2C2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			i2c-analog-filter;
 			status = "disabled";
 		};
 
-		i2c3: i2c@40005C00 {
+		i2c3: i2c@40005c00 {
 			compatible = "st,stm32f7-i2c";
-			reg = <0x40005C00 0x400>;
+			reg = <0x40005c00 0x400>;
 			interrupts = <72>,
 				     <73>;
 			resets = <&rcc STM32F7_APB1_RESET(I2C3)>;
 			clocks = <&rcc 1 CLK_I2C3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -352,7 +298,6 @@
 			clocks = <&rcc 1 CLK_I2C4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -441,7 +386,7 @@
 			status = "disabled";
 		};
 
-		sdio2: sdio2@40011c00 {
+		sdio2: mmc@40011c00 {
 			compatible = "arm,pl180", "arm,primecell";
 			arm,primecell-periphid = <0x00880180>;
 			reg = <0x40011c00 0x400>;
@@ -452,7 +397,7 @@
 			status = "disabled";
 		};
 
-		sdio1: sdio1@40012c00 {
+		sdio1: mmc@40012c00 {
 			compatible = "arm,pl180", "arm,primecell";
 			arm,primecell-periphid = <0x00880180>;
 			reg = <0x40012c00 0x400>;
@@ -499,8 +444,6 @@
 		};
 
 		timers10: timers@40014400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40014400 0x400>;
 			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM10)>;
@@ -515,8 +458,6 @@
 		};
 
 		timers11: timers@40014800 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40014800 0x400>;
 			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM11)>;
diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
index 03cfbd7cc2..6f93fc7bcf 100644
--- a/arch/arm/dts/stm32f769-disco.dts
+++ b/arch/arm/dts/stm32f769-disco.dts
@@ -39,12 +39,10 @@
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@0 {
+		button-0 {
 			label = "User";
 			linux,code = <KEY_HOME>;
 			gpios = <&gpioa 0 GPIO_ACTIVE_HIGH>;
@@ -103,6 +101,18 @@
 	bus-width = <4>;
 };
 
+&timers5 {
+	/* Override timer5 to act as clockevent */
+	compatible = "st,stm32-timer";
+	interrupts = <50>;
+	status = "okay";
+	/delete-property/#address-cells;
+	/delete-property/#size-cells;
+	/delete-property/clock-names;
+	/delete-node/pwm;
+	/delete-node/timer@4;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
index dbfebf07f2..ceb629c4fa 100644
--- a/arch/arm/dts/stm32h743.dtsi
+++ b/arch/arm/dts/stm32h743.dtsi
@@ -124,7 +124,6 @@
 				     <32>;
 			resets = <&rcc STM32H7_APB1L_RESET(I2C1)>;
 			clocks = <&rcc I2C1_CK>;
-			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -137,7 +136,6 @@
 				     <34>;
 			resets = <&rcc STM32H7_APB1L_RESET(I2C2)>;
 			clocks = <&rcc I2C2_CK>;
-			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -150,7 +148,6 @@
 				     <73>;
 			resets = <&rcc STM32H7_APB1L_RESET(I2C3)>;
 			clocks = <&rcc I2C3_CK>;
-			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -337,12 +334,12 @@
 			dma-requests = <32>;
 		};
 
-		sdmmc1: sdmmc@52007000 {
+		sdmmc1: mmc@52007000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x52007000 0x1000>;
 			interrupts = <49>;
-			interrupt-names	= "cmd_irq";
+			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC1_CK>;
 			clock-names = "apb_pclk";
 			resets = <&rcc STM32H7_AHB3_RESET(SDMMC1)>;
@@ -351,18 +348,19 @@
 			max-frequency = <120000000>;
 		};
 
-		sdmmc2: sdmmc@48022400 {
+		sdmmc2: mmc@48022400 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x48022400 0x400>;
 			interrupts = <124>;
-			interrupt-names	= "cmd_irq";
+			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC2_CK>;
 			clock-names = "apb_pclk";
 			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			max-frequency = <120000000>;
+			status = "disabled";
 		};
 
 		exti: interrupt-controller@58000000 {
@@ -398,7 +396,6 @@
 				     <96>;
 			resets = <&rcc STM32H7_APB4_RESET(I2C4)>;
 			clocks = <&rcc I2C4_CK>;
-			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -452,8 +449,6 @@
 		};
 
 		lptimer4: timer@58002c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x58002c00 0x400>;
 			clocks = <&rcc LPTIM4_CK>;
@@ -468,8 +463,6 @@
 		};
 
 		lptimer5: timer@58003000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x58003000 0x400>;
 			clocks = <&rcc LPTIM5_CK>;
@@ -554,7 +547,7 @@
 			status = "disabled";
 		};
 
-		pinctrl: pin-controller@58020000 {
+		pinctrl: pinctrl@58020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "st,stm32h743-pinctrl";
diff --git a/arch/arm/dts/stm32h743i-disco.dts b/arch/arm/dts/stm32h743i-disco.dts
index 3a01ebd563..b31188f8b9 100644
--- a/arch/arm/dts/stm32h743i-disco.dts
+++ b/arch/arm/dts/stm32h743i-disco.dts
@@ -41,10 +41,10 @@
 
 &mac {
 	status = "disabled";
-	pinctrl-0	= <&ethernet_rmii>;
-	pinctrl-names	= "default";
-	phy-mode	= "rmii";
-	phy-handle	= <&phy0>;
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
 
 	mdio0 {
 		#address-cells = <1>;
diff --git a/arch/arm/dts/stm32h743i-eval.dts b/arch/arm/dts/stm32h743i-eval.dts
index 38cc7faf68..5c5d8059bd 100644
--- a/arch/arm/dts/stm32h743i-eval.dts
+++ b/arch/arm/dts/stm32h743i-eval.dts
@@ -115,10 +115,10 @@
 
 &mac {
 	status = "disabled";
-	pinctrl-0	= <&ethernet_rmii>;
-	pinctrl-names	= "default";
-	phy-mode	= "rmii";
-	phy-handle	= <&phy0>;
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
 
 	mdio0 {
 		#address-cells = <1>;
diff --git a/arch/arm/dts/stm32h750i-art-pi.dts b/arch/arm/dts/stm32h750i-art-pi.dts
index 2a4d1cb496..c7c7132f22 100644
--- a/arch/arm/dts/stm32h750i-art-pi.dts
+++ b/arch/arm/dts/stm32h750i-art-pi.dts
@@ -87,10 +87,10 @@
 
 &mac {
 	status = "disabled";
-	pinctrl-0	= <&ethernet_rmii>;
-	pinctrl-names	= "default";
-	phy-mode	= "rmii";
-	phy-handle	= <&phy0>;
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
 
 	mdio0 {
 		#address-cells = <1>;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
