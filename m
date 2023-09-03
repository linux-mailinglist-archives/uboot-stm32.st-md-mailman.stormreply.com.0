Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B17DD790DFB
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:49:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E6CFC6B45F;
	Sun,  3 Sep 2023 20:49:06 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FC95C6B459
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:49:05 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-9a64619d8fbso101741166b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774145; x=1694378945;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oU/q22HAug8UzsnmuC0vhco1L9LOpbnUW7H8vuRFmVk=;
 b=T8ujxCxv06DK0r22Pu86+kC0zx8OeSbz9EF/bJ8T2qiqPbwk5sKs++Nx+/SucfJaFE
 U3rZ8zXYVRCDyHxWY8HB9xxe6a53+NwmBB7rQwgvgVew7UsbsUK47qduZm+E+UqYETY0
 uMUWaJGJzY/5QdAj9T8iCejGV2HnyMiSaVu3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774145; x=1694378945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oU/q22HAug8UzsnmuC0vhco1L9LOpbnUW7H8vuRFmVk=;
 b=i3IMffddsRyS+y78AhFOWF/BukjAn1b6PmSL8AXHSjZJSY+Gij2rVxrFxNqHzLnE/4
 0ErdraczfFJUCHX4vdckCYuJswohYAxFyvvT2ka0m8GutTKVdZWVVK27p+im/rhjirSO
 amoK51THdB9I9bkWfiJGsiSC4Ex5HgO2gk6PpStj7GoU08dzbuCqeyeTmMi25gQylK9n
 2SXSL8TcKE0hiGolDEeQsEu1f3xb5qAuJXJ8gq3jyUtGGTTKlEGuNQUuyBBqGTO/sKz+
 NovoHeY58zyACIqbolY1tWLT9z/CaAroBfomZmRVTOmpk3sBtitu9JZALJ4o+SMoBcAW
 fOoQ==
X-Gm-Message-State: AOJu0YzVIO0fo7kVuajpWjdsnzlVNUcXibtI12nAG6sYJvv9Jpx3G/3F
 vOu8jUjWBTNlXPQOXRYJXN/vTQ==
X-Google-Smtp-Source: AGHT+IGlY+8nKiSRsyM1BgA1H4VgnlW6bGKVNGvAsqdRq4IfNuiv5Qb3NzW/kDlSMfdxvm1KuJCXNg==
X-Received: by 2002:a17:906:2210:b0:994:1eb4:6898 with SMTP id
 s16-20020a170906221000b009941eb46898mr6619562ejs.9.1693774144766; 
 Sun, 03 Sep 2023 13:49:04 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm5182466ejb.199.2023.09.03.13.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:49:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:48:49 +0200
Message-Id: <20230903204849.660722-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 10/10] ARM: dts: stm32: support display on
	stm32f746-disco board
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

The patch applies the changes from Linux commit 10a970bc3ebfa ("ARM: dts:
stm32: support display on stm32f746-disco board") and removes the same
settings from stm32f746-disco-u-boot.dtsi.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/dts/stm32f746-disco-u-boot.dtsi | 89 ++++++------------------
 arch/arm/dts/stm32f746-disco.dts         | 44 ++++++++++++
 2 files changed, 66 insertions(+), 67 deletions(-)

diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index 3c2b9fc59512..1b42d6cbbc19 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -23,12 +23,6 @@
 		spi0 = &qspi;
 	};
 
-	backlight: backlight {
-		compatible = "gpio-backlight";
-		gpios = <&gpiok 3 0>;
-		status = "okay";
-	};
-
 	button1 {
 		compatible = "st,button1";
 		button-gpio = <&gpioi 11 0>;
@@ -38,37 +32,10 @@
 		compatible = "st,led1";
 		led-gpio = <&gpioi 1 0>;
 	};
-
-	panel-rgb@0 {
-		compatible = "simple-panel";
-		backlight = <&backlight>;
-		enable-gpios = <&gpioi 12 0>;
-		status = "okay";
-
-		display-timings {
-			timing@0 {
-				clock-frequency = <9000000>;
-				hactive = <480>;
-				vactive = <272>;
-				hfront-porch = <2>;
-				hback-porch = <2>;
-				hsync-len = <41>;
-				vfront-porch = <2>;
-				vback-porch = <2>;
-				vsync-len = <10>;
-				hsync-active = <0>;
-				vsync-active = <0>;
-				de-active = <1>;
-				pixelclk-active = <1>;
-			};
-		};
-	};
 };
 
 &ltdc {
 	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
-	pinctrl-0 = <&ltdc_pins>;
-	status = "okay";
 	bootph-all;
 };
 
@@ -96,6 +63,28 @@
 	};
 };
 
+&panel_rgb {
+	compatible = "simple-panel";
+
+	display-timings {
+		timing@0 {
+			clock-frequency = <9000000>;
+			hactive = <480>;
+			vactive = <272>;
+			hfront-porch = <2>;
+			hback-porch = <2>;
+			hsync-len = <41>;
+			vfront-porch = <2>;
+			vback-porch = <2>;
+			vsync-len = <10>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+			pixelclk-active = <1>;
+		};
+	};
+};
+
 &pinctrl {
 	ethernet_mii: mii@0 {
 		pins {
@@ -160,40 +149,6 @@
 		};
 	};
 
-	ltdc_pins: ltdc@0 {
-		pins {
-			pinmux = <STM32_PINMUX('E', 4, AF14)>, /* B0 */
-				 <STM32_PINMUX('G',12, AF9)>,  /* B4 */
-				 <STM32_PINMUX('I', 9, AF14)>, /* VSYNC */
-				 <STM32_PINMUX('I',10, AF14)>, /* HSYNC */
-				 <STM32_PINMUX('I',14, AF14)>, /* CLK */
-				 <STM32_PINMUX('I',15, AF14)>, /* R0 */
-				 <STM32_PINMUX('J', 0, AF14)>, /* R1 */
-				 <STM32_PINMUX('J', 1, AF14)>, /* R2 */
-				 <STM32_PINMUX('J', 2, AF14)>, /* R3 */
-				 <STM32_PINMUX('J', 3, AF14)>, /* R4 */
-				 <STM32_PINMUX('J', 4, AF14)>, /* R5 */
-				 <STM32_PINMUX('J', 5, AF14)>, /* R6 */
-				 <STM32_PINMUX('J', 6, AF14)>, /* R7 */
-				 <STM32_PINMUX('J', 7, AF14)>, /* G0 */
-				 <STM32_PINMUX('J', 8, AF14)>, /* G1 */
-				 <STM32_PINMUX('J', 9, AF14)>, /* G2 */
-				 <STM32_PINMUX('J',10, AF14)>, /* G3 */
-				 <STM32_PINMUX('J',11, AF14)>, /* G4 */
-				 <STM32_PINMUX('J',13, AF14)>, /* B1 */
-				 <STM32_PINMUX('J',14, AF14)>, /* B2 */
-				 <STM32_PINMUX('J',15, AF14)>, /* B3 */
-				 <STM32_PINMUX('K', 0, AF14)>, /* G5 */
-				 <STM32_PINMUX('K', 1, AF14)>, /* G6 */
-				 <STM32_PINMUX('K', 2, AF14)>, /* G7 */
-				 <STM32_PINMUX('K', 4, AF14)>, /* B5 */
-				 <STM32_PINMUX('K', 5, AF14)>, /* B6 */
-				 <STM32_PINMUX('K', 6, AF14)>, /* B7 */
-				 <STM32_PINMUX('K', 7, AF14)>; /* DE */
-			slew-rate = <2>;
-		};
-	};
-
 	qspi_pins: qspi@0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 2, AF9)>, /* CLK */
diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
index e1564d69f9f6..431275134033 100644
--- a/arch/arm/dts/stm32f746-disco.dts
+++ b/arch/arm/dts/stm32f746-disco.dts
@@ -25,6 +25,19 @@
 		reg = <0xC0000000 0x800000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			no-map;
+			size = <0x80000>;
+			linux,dma-default;
+		};
+	};
+
 	aliases {
 		serial0 = &usart1;
 	};
@@ -50,6 +63,25 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpiok 3 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+
+	panel_rgb: panel-rgb {
+		compatible = "rocktech,rk043fn48h";
+		power-supply = <&vcc_3v3>;
+		backlight = <&backlight>;
+		enable-gpios = <&gpioi 12 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+		port {
+			panel_in_rgb: endpoint {
+				remote-endpoint = <&ltdc_out_rgb>;
+			};
+		};
+	};
 };
 
 &clk_hse {
@@ -80,6 +112,18 @@
 	};
 };
 
+&ltdc {
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	port {
+		ltdc_out_rgb: endpoint {
+			remote-endpoint = <&panel_in_rgb>;
+		};
+	};
+};
+
 &sdio1 {
 	status = "okay";
 	vmmc-supply = <&vcc_3v3>;
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
