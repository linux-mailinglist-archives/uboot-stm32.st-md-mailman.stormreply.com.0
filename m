Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1D5AD0C3E
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF468C36B29;
	Sat,  7 Jun 2025 09:37:43 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 058ABC36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:43 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-adb5cb6d8f1so451456266b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289062; x=1749893862;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6rS7UWa700GAPh//bF3XK1aI5ctzfMLdfNA0NjnTUw=;
 b=CYOkn/xAM08HS9OVaVcV73094c8+1gGtFxYfI5QgV+xTcySfo+91xh9zal2qmNiGX3
 dJgcvKW3AUQ6bd8tCyoMHzIGxnRbE3MvFdS6EKO4Lt2gzh/pWNwYLb/FZ51Ks43CFjJY
 35u/Z2+XYw5r02Bw8nLBZ3xOVUY64Gp92Tj18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289062; x=1749893862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6rS7UWa700GAPh//bF3XK1aI5ctzfMLdfNA0NjnTUw=;
 b=hUfzn9PriFu/OO2KgZRmhlqf2DwxOKSBQtIsJ3jNNnCzWjPGXcl4Noo9bVHpuiv2SC
 7MN2WwsHceJmZfKs/np9izSEFyp5JQv1KwPsU1zmQoOsqzOfgrqJic6awkViOscKexBd
 qWidv1jDUNxizVxyuImYgX/bid9SMtrf3KYuvRm8eYarypfxQe8mokx+82Kyu65ODobi
 FVwoEbuBlvzMaQfVtZJr9zYvhWY8KMQX2LBWLVr9k51ubbPI/ibzOgTExfsGLbZu2yPb
 bhgQxoxHpM6Ac8UiQe96P2r/5Ua3fNzAR8mnBmS85EaUZ449lHJ4vn6L7oqUNF+7MdzU
 5U9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwelR5VbjSmLvOIcQGCqbPMElMS5Ph2AJAjAWH9p1RduK/twAGM3TOepwT5hxakFqmzwiE1oxDlF/UhQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwhGAMRkfcRtvxmwRZ09R3Bd5gosKxvcrwzfpLmBeT/V3uMtEtm
 gaLCT0M5ACMncTOHCEpb7HjQUrfE8IDj1RvrpLR7fvS8euE0ujxyyb5ZvTtYXhw/A5k=
X-Gm-Gg: ASbGncv82zcNKrM/4UmOFDwyBSwJrjzlibd8jSbOHwEHsdFHtqab/XRxoAKZ190MnD/
 1+hT/G8jZy6WwiD4lSdxIAEkOtM+AnOFOlyb8Vwy44vkyPGGzZ3X57dskP506f/wko9mo+/I0Jz
 vL7ccd7FhpdGRQsFU2irukyn1N2iTZhoH4Cu4ufH3Dd5jPl1dS+JBuFwt+Sw8915h0wVz1ds6H+
 T0IlTaJVOML23hobyFZ8nfDFHUYkwURGLTuaQtfah47QKHqrBOed7HsTxp4KSY2fXcd0k6uU4WY
 y8zG8hwo2Y7dtsnrNAqB4CEP/0L9g1d8qHjMuKNodh0IHG9Z7Xf7f8GJVVf7QACNzllvs4MnF/Z
 t2mxoVuOTg70Mf7n0fjqpX2X53u9XHiGPXvn1RVLGBy/CnPNBKc9rQ4Sfv6JqiyFsWYmPcluNp3
 51Tgu0acncan23tVPzMlLhncU=
X-Google-Smtp-Source: AGHT+IHKjcOEIFC2KqlB5t2Pr1+hi53vbbs6zAOup2OXPfqIHD5LBIetf9Zkm1pzcdTUZwodaQ6DIw==
X-Received: by 2002:a17:907:7249:b0:ad8:8621:924f with SMTP id
 a640c23a62f3a-ade1abc5d45mr495562666b.56.1749289062442; 
 Sat, 07 Jun 2025 02:37:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:15 +0200
Message-ID: <20250607093730.2249536-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sumit Garg <sumit.garg@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 7/9] ARM: dts: stm32: support STM32h747i-disco
	board
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

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/r/20250427074404.3278732-9-dario.binacchi@amarulasolutions.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

[ backport upstream commit: 49ba8fc6eab63165639ffbb9f976222d39739cab ]

---

 dts/upstream/src/arm/st/stm32h747i-disco.dts | 136 +++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 dts/upstream/src/arm/st/stm32h747i-disco.dts

diff --git a/dts/upstream/src/arm/st/stm32h747i-disco.dts b/dts/upstream/src/arm/st/stm32h747i-disco.dts
new file mode 100644
index 000000000000..99f0255dae8e
--- /dev/null
+++ b/dts/upstream/src/arm/st/stm32h747i-disco.dts
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+/dts-v1/;
+#include "stm32h743.dtsi"
+#include "stm32h7-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "STMicroelectronics STM32H747i-Discovery board";
+	compatible = "st,stm32h747i-disco", "st,stm32h747";
+
+	chosen {
+		bootargs = "root=/dev/ram";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@d0000000 {
+		device_type = "memory";
+		reg = <0xd0000000 0x2000000>;
+	};
+
+	aliases {
+		serial0 = &usart1;
+		serial1 = &uart8;
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-green {
+			gpios = <&gpioi 12 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+		led-orange {
+			gpios = <&gpioi 13 GPIO_ACTIVE_LOW>;
+		};
+		led-red {
+			gpios = <&gpioi 14 GPIO_ACTIVE_LOW>;
+		};
+		led-blue {
+			gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		button-0 {
+			label = "User";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
+		};
+		button-1 {
+			label = "JoySel";
+			linux,code = <KEY_ENTER>;
+			gpios = <&gpiok 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-2 {
+			label = "JoyDown";
+			linux,code = <KEY_DOWN>;
+			gpios = <&gpiok 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-3 {
+			label = "JoyUp";
+			linux,code = <KEY_UP>;
+			gpios = <&gpiok 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-4 {
+			label = "JoyLeft";
+			linux,code = <KEY_LEFT>;
+			gpios = <&gpiok 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-5 {
+			label = "JoyRight";
+			linux,code = <KEY_RIGHT>;
+			gpios = <&gpiok 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+	};
+};
+
+&clk_hse {
+	clock-frequency = <25000000>;
+};
+
+&mac {
+	status = "disabled";
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&gpioi 8 GPIO_ACTIVE_LOW>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&usart1 {
+	pinctrl-0 = <&usart1_pins_b>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart8 {
+	pinctrl-0 = <&uart8_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
