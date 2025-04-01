Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E685DA77BE6
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:19:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABDC7C78F98;
	Tue,  1 Apr 2025 13:19:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5675C78F90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:19:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531Bd6Od018147;
 Tue, 1 Apr 2025 15:18:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Uko+XB2xQoWj/gHFF/ryMYihxBRLdKUlP0r8KF4pA50=; b=X94df/llNtl2l1Gf
 wRyyd930bUDREh4KkiDLWrWTToKb+vwCiPsQcTQJ9dWLrlsWeRqujFD6RmsY4+Qu
 ayDi6IL7Y8Qr4jvZ5QB4To+DK2lQQTtZTN12PT2tA2GIaQ2XzI3tQw+xnRYVjsXC
 4Xlax7dI82rxWsAL6MV5uZ+h3h5IrYeZ0NTgqukzeuNB0nfR3AVhNDbVctkoQVw2
 rKZkO89J12WvcTyQUGUyU3k6c3R7ATHQVfB8LSZpHxiEVyF6AMgXLqjjL2nwcANr
 A0ymrpBSB5WV3DoIFjVsMrB/g2V+VhIiKUiTXBRQgKYqlRr4ab8tJq48lieA+MiC
 6hvpVA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p6vd5brh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:18:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9733740045;
 Tue,  1 Apr 2025 15:16:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49A58892A38;
 Tue,  1 Apr 2025 15:14:30 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:14:29 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:14:02 +0200
Message-ID: <20250401131413.387139-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401131413.387139-1-patrice.chotard@foss.st.com>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Fabio Estevam <festevam@denx.de>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Adam Ford <aford173@gmail.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sumit Garg <sumit.garg@kernel.org>, Tom Rini <trini@konsulko.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Prasad Kummari <prasad.kummari@amd.com>, Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 02/13] ARM: dts: stm32: convert stm23h7 boards
	to OF_UPSTREAM
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

Enable OF_UPSTREAM flag for STM32H7 platforms.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/Makefile              |   3 -
 arch/arm/dts/stm32h7-pinctrl.dtsi  | 274 ------------
 arch/arm/dts/stm32h7-u-boot.dtsi   |   1 -
 arch/arm/dts/stm32h743.dtsi        | 695 -----------------------------
 arch/arm/dts/stm32h743i-disco.dts  |  75 ----
 arch/arm/dts/stm32h743i-eval.dts   | 160 -------
 arch/arm/dts/stm32h750.dtsi        |   5 -
 arch/arm/dts/stm32h750i-art-pi.dts | 188 --------
 arch/arm/mach-stm32/Kconfig        |   1 +
 configs/stm32h743-disco_defconfig  |   2 +-
 configs/stm32h743-eval_defconfig   |   2 +-
 configs/stm32h750-art-pi_defconfig |   2 +-
 12 files changed, 4 insertions(+), 1404 deletions(-)
 delete mode 100644 arch/arm/dts/stm32h7-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32h743.dtsi
 delete mode 100644 arch/arm/dts/stm32h743i-disco.dts
 delete mode 100644 arch/arm/dts/stm32h743i-eval.dts
 delete mode 100644 arch/arm/dts/stm32h750.dtsi
 delete mode 100644 arch/arm/dts/stm32h750i-art-pi.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index cc479a3f02c..6425e424334 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -526,9 +526,6 @@ dtb-$(CONFIG_STM32F4) += stm32f429-disco.dtb \
 dtb-$(CONFIG_STM32F7) += stm32f746-disco.dtb \
 	stm32f769-disco.dtb \
 	stm32746g-eval.dtb
-dtb-$(CONFIG_STM32H7) += stm32h743i-disco.dtb \
-	stm32h743i-eval.dtb \
-	stm32h750i-art-pi.dtb
 
 dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-inet-3f.dtb \
diff --git a/arch/arm/dts/stm32h7-pinctrl.dtsi b/arch/arm/dts/stm32h7-pinctrl.dtsi
deleted file mode 100644
index aefa32468dc..00000000000
--- a/arch/arm/dts/stm32h7-pinctrl.dtsi
+++ /dev/null
@@ -1,274 +0,0 @@
-/*
- * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#include <dt-bindings/pinctrl/stm32-pinfunc.h>
-
-&pinctrl {
-
-	i2c1_pins_a: i2c1-0 {
-		pins {
-			pinmux = <STM32_PINMUX('B', 6, AF4)>, /* I2C1_SCL */
-				 <STM32_PINMUX('B', 7, AF4)>; /* I2C1_SDA */
-			bias-disable;
-			drive-open-drain;
-			slew-rate = <0>;
-		};
-	};
-
-	ethernet_rmii: rmii-0 {
-		pins {
-			pinmux = <STM32_PINMUX('G', 11, AF11)>,
-				 <STM32_PINMUX('G', 13, AF11)>,
-				 <STM32_PINMUX('G', 12, AF11)>,
-				 <STM32_PINMUX('C', 4, AF11)>,
-				 <STM32_PINMUX('C', 5, AF11)>,
-				 <STM32_PINMUX('A', 7, AF11)>,
-				 <STM32_PINMUX('C', 1, AF11)>,
-				 <STM32_PINMUX('A', 2, AF11)>,
-				 <STM32_PINMUX('A', 1, AF11)>;
-			slew-rate = <2>;
-		};
-	};
-
-	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
-		pins {
-			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-				 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
-				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-			slew-rate = <3>;
-			drive-push-pull;
-			bias-disable;
-		};
-	};
-
-	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-				 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
-			slew-rate = <3>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins2{
-			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-			slew-rate = <3>;
-			drive-open-drain;
-			bias-disable;
-		};
-	};
-
-	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
-		pins {
-			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
-				 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
-				 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
-				 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
-		};
-	};
-
-	sdmmc1_dir_pins_a: sdmmc1-dir-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('C', 6, AF8)>, /* SDMMC1_D0DIR */
-				 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
-				 <STM32_PINMUX('B', 9, AF7)>; /* SDMMC1_CDIR */
-			slew-rate = <3>;
-			drive-push-pull;
-			bias-pull-up;
-		};
-		pins2{
-			pinmux = <STM32_PINMUX('B', 8, AF7)>; /* SDMMC1_CKIN */
-			bias-pull-up;
-		};
-	};
-
-	sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
-		pins {
-			pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC1_D0DIR */
-				 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
-				 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
-				 <STM32_PINMUX('B', 8, ANALOG)>; /* SDMMC1_CKIN */
-		};
-	};
-
-	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
-		pins {
-			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC1_D0 */
-				 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC1_D3 */
-				 <STM32_PINMUX('D', 6, AF11)>, /* SDMMC1_CK */
-				 <STM32_PINMUX('D', 7, AF11)>; /* SDMMC1_CMD */
-			slew-rate = <3>;
-			drive-push-pull;
-			bias-disable;
-		};
-	};
-
-	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
-				 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC1_D3 */
-				 <STM32_PINMUX('D', 6, AF11)>; /* SDMMC1_CK */
-			slew-rate = <3>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins2{
-			pinmux = <STM32_PINMUX('D', 7, AF11)>; /* SDMMC1_CMD */
-			slew-rate = <3>;
-			drive-open-drain;
-			bias-disable;
-		};
-	};
-
-	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
-		pins {
-			pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC1_D0 */
-				 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC1_D1 */
-				 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC1_D2 */
-				 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC1_D3 */
-				 <STM32_PINMUX('D', 6, ANALOG)>, /* SDMMC1_CK */
-				 <STM32_PINMUX('D', 7, ANALOG)>; /* SDMMC1_CMD */
-		};
-	};
-
-	spi1_pins: spi1-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('A', 5, AF5)>,
-				/* SPI1_CLK */
-				 <STM32_PINMUX('B', 5, AF5)>;
-				/* SPI1_MOSI */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <2>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('G', 9, AF5)>;
-				/* SPI1_MISO */
-			bias-disable;
-		};
-	};
-
-	uart4_pins: uart4-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('A', 0, AF8)>; /* UART4_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('I', 9, AF8)>; /* UART4_RX */
-			bias-disable;
-		};
-	};
-
-	usart1_pins: usart1-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('B', 15, AF4)>; /* USART1_RX */
-			bias-disable;
-		};
-	};
-
-	usart2_pins: usart2-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
-			bias-disable;
-		};
-	};
-
-	usart3_pins: usart3-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
-				 <STM32_PINMUX('D', 12, AF7)>; /* USART3_RTS_DE */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('B', 11, AF7)>, /* USART3_RX */
-				 <STM32_PINMUX('D', 11, AF7)>; /* USART3_CTS_NSS */
-			bias-disable;
-		};
-	};
-
-	usbotg_hs_pins_a: usbotg-hs-0 {
-		pins {
-			pinmux = <STM32_PINMUX('H', 4, AF10)>,	/* ULPI_NXT */
-					 <STM32_PINMUX('I', 11, AF10)>, /* ULPI_DIR> */
-					 <STM32_PINMUX('C', 0, AF10)>,	/* ULPI_STP> */
-					 <STM32_PINMUX('A', 5, AF10)>,	/* ULPI_CK> */
-					 <STM32_PINMUX('A', 3, AF10)>,	/* ULPI_D0> */
-					 <STM32_PINMUX('B', 0, AF10)>,	/* ULPI_D1> */
-					 <STM32_PINMUX('B', 1, AF10)>,	/* ULPI_D2> */
-					 <STM32_PINMUX('B', 10, AF10)>, /* ULPI_D3> */
-					 <STM32_PINMUX('B', 11, AF10)>, /* ULPI_D4> */
-					 <STM32_PINMUX('B', 12, AF10)>, /* ULPI_D5> */
-					 <STM32_PINMUX('B', 13, AF10)>, /* ULPI_D6> */
-					 <STM32_PINMUX('B', 5, AF10)>;	/* ULPI_D7> */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <2>;
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32h7-u-boot.dtsi b/arch/arm/dts/stm32h7-u-boot.dtsi
index dea4db396c1..9148a1fcd4c 100644
--- a/arch/arm/dts/stm32h7-u-boot.dtsi
+++ b/arch/arm/dts/stm32h7-u-boot.dtsi
@@ -53,7 +53,6 @@
 	bootph-all;
 };
 
-
 &fmc {
 	bootph-all;
 };
diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
deleted file mode 100644
index c490d0a5713..00000000000
--- a/arch/arm/dts/stm32h743.dtsi
+++ /dev/null
@@ -1,695 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR X11
-/*
- * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
- *
- */
-
-#include "armv7-m.dtsi"
-#include <dt-bindings/clock/stm32h7-clks.h>
-#include <dt-bindings/mfd/stm32h7-rcc.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	clocks {
-		clk_hse: clk-hse {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <0>;
-		};
-
-		clk_lse: clk-lse {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <32768>;
-		};
-
-		clk_i2s: i2s_ckin {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <0>;
-		};
-	};
-
-	soc {
-		timer5: timer@40000c00 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000c00 0x400>;
-			interrupts = <50>;
-			clocks = <&rcc TIM5_CK>;
-		};
-
-		lptimer1: timer@40002400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-lptimer";
-			reg = <0x40002400 0x400>;
-			clocks = <&rcc LPTIM1_CK>;
-			clock-names = "mux";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			trigger@0 {
-				compatible = "st,stm32-lptimer-trigger";
-				reg = <0>;
-				status = "disabled";
-			};
-
-			counter {
-				compatible = "st,stm32-lptimer-counter";
-				status = "disabled";
-			};
-		};
-
-		spi2: spi@40003800 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x40003800 0x400>;
-			interrupts = <36>;
-			resets = <&rcc STM32H7_APB1L_RESET(SPI2)>;
-			clocks = <&rcc SPI2_CK>;
-			status = "disabled";
-
-		};
-
-		spi3: spi@40003c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x40003c00 0x400>;
-			interrupts = <51>;
-			resets = <&rcc STM32H7_APB1L_RESET(SPI3)>;
-			clocks = <&rcc SPI3_CK>;
-			status = "disabled";
-		};
-
-		usart2: serial@40004400 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x40004400 0x400>;
-			interrupts = <38>;
-			status = "disabled";
-			clocks = <&rcc USART2_CK>;
-		};
-
-		usart3: serial@40004800 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x40004800 0x400>;
-			interrupts = <39>;
-			status = "disabled";
-			clocks = <&rcc USART3_CK>;
-		};
-
-		uart4: serial@40004c00 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x40004c00 0x400>;
-			interrupts = <52>;
-			status = "disabled";
-			clocks = <&rcc UART4_CK>;
-		};
-
-		i2c1: i2c@40005400 {
-			compatible = "st,stm32f7-i2c";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x40005400 0x400>;
-			interrupts = <31>,
-				     <32>;
-			resets = <&rcc STM32H7_APB1L_RESET(I2C1)>;
-			clocks = <&rcc I2C1_CK>;
-			status = "disabled";
-		};
-
-		i2c2: i2c@40005800 {
-			compatible = "st,stm32f7-i2c";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x40005800 0x400>;
-			interrupts = <33>,
-				     <34>;
-			resets = <&rcc STM32H7_APB1L_RESET(I2C2)>;
-			clocks = <&rcc I2C2_CK>;
-			status = "disabled";
-		};
-
-		i2c3: i2c@40005c00 {
-			compatible = "st,stm32f7-i2c";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x40005C00 0x400>;
-			interrupts = <72>,
-				     <73>;
-			resets = <&rcc STM32H7_APB1L_RESET(I2C3)>;
-			clocks = <&rcc I2C3_CK>;
-			status = "disabled";
-		};
-
-		dac: dac@40007400 {
-			compatible = "st,stm32h7-dac-core";
-			reg = <0x40007400 0x400>;
-			clocks = <&rcc DAC12_CK>;
-			clock-names = "pclk";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-
-			dac1: dac@1 {
-				compatible = "st,stm32-dac";
-				#io-channel-cells = <1>;
-				reg = <1>;
-				status = "disabled";
-			};
-
-			dac2: dac@2 {
-				compatible = "st,stm32-dac";
-				#io-channel-cells = <1>;
-				reg = <2>;
-				status = "disabled";
-			};
-		};
-
-		usart1: serial@40011000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x40011000 0x400>;
-			interrupts = <37>;
-			status = "disabled";
-			clocks = <&rcc USART1_CK>;
-		};
-
-		spi1: spi@40013000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x40013000 0x400>;
-			interrupts = <35>;
-			resets = <&rcc STM32H7_APB2_RESET(SPI1)>;
-			clocks = <&rcc SPI1_CK>;
-			status = "disabled";
-		};
-
-		spi4: spi@40013400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x40013400 0x400>;
-			interrupts = <84>;
-			resets = <&rcc STM32H7_APB2_RESET(SPI4)>;
-			clocks = <&rcc SPI4_CK>;
-			status = "disabled";
-		};
-
-		spi5: spi@40015000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x40015000 0x400>;
-			interrupts = <85>;
-			resets = <&rcc STM32H7_APB2_RESET(SPI5)>;
-			clocks = <&rcc SPI5_CK>;
-			status = "disabled";
-		};
-
-		dma1: dma-controller@40020000 {
-			compatible = "st,stm32-dma";
-			reg = <0x40020000 0x400>;
-			interrupts = <11>,
-				     <12>,
-				     <13>,
-				     <14>,
-				     <15>,
-				     <16>,
-				     <17>,
-				     <47>;
-			clocks = <&rcc DMA1_CK>;
-			#dma-cells = <4>;
-			st,mem2mem;
-			dma-requests = <8>;
-			status = "disabled";
-		};
-
-		dma2: dma-controller@40020400 {
-			compatible = "st,stm32-dma";
-			reg = <0x40020400 0x400>;
-			interrupts = <56>,
-				     <57>,
-				     <58>,
-				     <59>,
-				     <60>,
-				     <68>,
-				     <69>,
-				     <70>;
-			clocks = <&rcc DMA2_CK>;
-			#dma-cells = <4>;
-			st,mem2mem;
-			dma-requests = <8>;
-			status = "disabled";
-		};
-
-		dmamux1: dma-router@40020800 {
-			compatible = "st,stm32h7-dmamux";
-			reg = <0x40020800 0x40>;
-			#dma-cells = <3>;
-			dma-channels = <16>;
-			dma-requests = <128>;
-			dma-masters = <&dma1 &dma2>;
-			clocks = <&rcc DMA1_CK>;
-		};
-
-		adc_12: adc@40022000 {
-			compatible = "st,stm32h7-adc-core";
-			reg = <0x40022000 0x400>;
-			interrupts = <18>;
-			clocks = <&rcc ADC12_CK>;
-			clock-names = "bus";
-			interrupt-controller;
-			#interrupt-cells = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-
-			adc1: adc@0 {
-				compatible = "st,stm32h7-adc";
-				#io-channel-cells = <1>;
-				reg = <0x0>;
-				interrupt-parent = <&adc_12>;
-				interrupts = <0>;
-				status = "disabled";
-			};
-
-			adc2: adc@100 {
-				compatible = "st,stm32h7-adc";
-				#io-channel-cells = <1>;
-				reg = <0x100>;
-				interrupt-parent = <&adc_12>;
-				interrupts = <1>;
-				status = "disabled";
-			};
-		};
-
-		usbotg_hs: usb@40040000 {
-			compatible = "st,stm32f7-hsotg";
-			reg = <0x40040000 0x40000>;
-			interrupts = <77>;
-			clocks = <&rcc USB1OTG_CK>;
-			clock-names = "otg";
-			g-rx-fifo-size = <256>;
-			g-np-tx-fifo-size = <32>;
-			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
-			status = "disabled";
-		};
-
-		usbotg_fs: usb@40080000 {
-			compatible = "st,stm32f4x9-fsotg";
-			reg = <0x40080000 0x40000>;
-			interrupts = <101>;
-			clocks = <&rcc USB2OTG_CK>;
-			clock-names = "otg";
-			status = "disabled";
-		};
-
-		ltdc: display-controller@50001000 {
-			compatible = "st,stm32-ltdc";
-			reg = <0x50001000 0x200>;
-			interrupts = <88>, <89>;
-			resets = <&rcc STM32H7_APB3_RESET(LTDC)>;
-			clocks = <&rcc LTDC_CK>;
-			clock-names = "lcd";
-			status = "disabled";
-		};
-
-		mdma1: dma-controller@52000000 {
-			compatible = "st,stm32h7-mdma";
-			reg = <0x52000000 0x1000>;
-			interrupts = <122>;
-			clocks = <&rcc MDMA_CK>;
-			#dma-cells = <5>;
-			dma-channels = <16>;
-			dma-requests = <32>;
-		};
-
-		sdmmc1: mmc@52007000 {
-			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x10153180>;
-			reg = <0x52007000 0x1000>;
-			interrupts = <49>;
-			clocks = <&rcc SDMMC1_CK>;
-			clock-names = "apb_pclk";
-			resets = <&rcc STM32H7_AHB3_RESET(SDMMC1)>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			max-frequency = <120000000>;
-		};
-
-		sdmmc2: mmc@48022400 {
-			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x10153180>;
-			reg = <0x48022400 0x400>;
-			interrupts = <124>;
-			clocks = <&rcc SDMMC2_CK>;
-			clock-names = "apb_pclk";
-			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			max-frequency = <120000000>;
-			status = "disabled";
-		};
-
-		exti: interrupt-controller@58000000 {
-			compatible = "st,stm32h7-exti";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			reg = <0x58000000 0x400>;
-			interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <62>, <76>;
-		};
-
-		syscfg: syscon@58000400 {
-			compatible = "st,stm32-syscfg", "syscon";
-			reg = <0x58000400 0x400>;
-		};
-
-		spi6: spi@58001400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x58001400 0x400>;
-			interrupts = <86>;
-			resets = <&rcc STM32H7_APB4_RESET(SPI6)>;
-			clocks = <&rcc SPI6_CK>;
-			status = "disabled";
-		};
-
-		i2c4: i2c@58001c00 {
-			compatible = "st,stm32f7-i2c";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x58001C00 0x400>;
-			interrupts = <95>,
-				     <96>;
-			resets = <&rcc STM32H7_APB4_RESET(I2C4)>;
-			clocks = <&rcc I2C4_CK>;
-			status = "disabled";
-		};
-
-		lptimer2: timer@58002400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-lptimer";
-			reg = <0x58002400 0x400>;
-			clocks = <&rcc LPTIM2_CK>;
-			clock-names = "mux";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			trigger@1 {
-				compatible = "st,stm32-lptimer-trigger";
-				reg = <1>;
-				status = "disabled";
-			};
-
-			counter {
-				compatible = "st,stm32-lptimer-counter";
-				status = "disabled";
-			};
-		};
-
-		lptimer3: timer@58002800 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-lptimer";
-			reg = <0x58002800 0x400>;
-			clocks = <&rcc LPTIM3_CK>;
-			clock-names = "mux";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			trigger@2 {
-				compatible = "st,stm32-lptimer-trigger";
-				reg = <2>;
-				status = "disabled";
-			};
-		};
-
-		lptimer4: timer@58002c00 {
-			compatible = "st,stm32-lptimer";
-			reg = <0x58002c00 0x400>;
-			clocks = <&rcc LPTIM4_CK>;
-			clock-names = "mux";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-		};
-
-		lptimer5: timer@58003000 {
-			compatible = "st,stm32-lptimer";
-			reg = <0x58003000 0x400>;
-			clocks = <&rcc LPTIM5_CK>;
-			clock-names = "mux";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-		};
-
-		vrefbuf: regulator@58003c00 {
-			compatible = "st,stm32-vrefbuf";
-			reg = <0x58003C00 0x8>;
-			clocks = <&rcc VREF_CK>;
-			regulator-min-microvolt = <1500000>;
-			regulator-max-microvolt = <2500000>;
-			status = "disabled";
-		};
-
-		rtc: rtc@58004000 {
-			compatible = "st,stm32h7-rtc";
-			reg = <0x58004000 0x400>;
-			clocks = <&rcc RTCAPB_CK>, <&rcc RTC_CK>;
-			clock-names = "pclk", "rtc_ck";
-			assigned-clocks = <&rcc RTC_CK>;
-			assigned-clock-parents = <&rcc LSE_CK>;
-			interrupt-parent = <&exti>;
-			interrupts = <17 IRQ_TYPE_EDGE_RISING>;
-			st,syscfg = <&pwrcfg 0x00 0x100>;
-			status = "disabled";
-		};
-
-		rcc: reset-clock-controller@58024400 {
-			compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-			reg = <0x58024400 0x400>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s>;
-			st,syscfg = <&pwrcfg>;
-		};
-
-		pwrcfg: power-config@58024800 {
-			compatible = "st,stm32-power-config", "syscon";
-			reg = <0x58024800 0x400>;
-		};
-
-		adc_3: adc@58026000 {
-			compatible = "st,stm32h7-adc-core";
-			reg = <0x58026000 0x400>;
-			interrupts = <127>;
-			clocks = <&rcc ADC3_CK>;
-			clock-names = "bus";
-			interrupt-controller;
-			#interrupt-cells = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-
-			adc3: adc@0 {
-				compatible = "st,stm32h7-adc";
-				#io-channel-cells = <1>;
-				reg = <0x0>;
-				interrupt-parent = <&adc_3>;
-				interrupts = <0>;
-				status = "disabled";
-			};
-		};
-
-		mac: ethernet@40028000 {
-			compatible = "st,stm32-dwmac", "snps,dwmac-4.10a";
-			reg = <0x40028000 0x8000>;
-			reg-names = "stmmaceth";
-			interrupts = <61>;
-			interrupt-names = "macirq";
-			clock-names = "stmmaceth", "mac-clk-tx", "mac-clk-rx";
-			clocks = <&rcc ETH1MAC_CK>, <&rcc ETH1TX_CK>, <&rcc ETH1RX_CK>;
-			st,syscon = <&syscfg 0x4>;
-			snps,pbl = <8>;
-			status = "disabled";
-		};
-
-		pinctrl: pinctrl@58020000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "st,stm32h743-pinctrl";
-			ranges = <0 0x58020000 0x3000>;
-			interrupt-parent = <&exti>;
-			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
-
-			gpioa: gpio@58020000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x0 0x400>;
-				clocks = <&rcc GPIOA_CK>;
-				st,bank-name = "GPIOA";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@58020400 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x400 0x400>;
-				clocks = <&rcc GPIOB_CK>;
-				st,bank-name = "GPIOB";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@58020800 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x800 0x400>;
-				clocks = <&rcc GPIOC_CK>;
-				st,bank-name = "GPIOC";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@58020c00 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0xc00 0x400>;
-				clocks = <&rcc GPIOD_CK>;
-				st,bank-name = "GPIOD";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@58021000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x1000 0x400>;
-				clocks = <&rcc GPIOE_CK>;
-				st,bank-name = "GPIOE";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@58021400 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x1400 0x400>;
-				clocks = <&rcc GPIOF_CK>;
-				st,bank-name = "GPIOF";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 80 16>;
-			};
-
-			gpiog: gpio@58021800 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x1800 0x400>;
-				clocks = <&rcc GPIOG_CK>;
-				st,bank-name = "GPIOG";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 96 16>;
-			};
-
-			gpioh: gpio@58021c00 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x1c00 0x400>;
-				clocks = <&rcc GPIOH_CK>;
-				st,bank-name = "GPIOH";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 112 16>;
-			};
-
-			gpioi: gpio@58022000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x2000 0x400>;
-				clocks = <&rcc GPIOI_CK>;
-				st,bank-name = "GPIOI";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 128 16>;
-			};
-
-			gpioj: gpio@58022400 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x2400 0x400>;
-				clocks = <&rcc GPIOJ_CK>;
-				st,bank-name = "GPIOJ";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 144 16>;
-			};
-
-			gpiok: gpio@58022800 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x2800 0x400>;
-				clocks = <&rcc GPIOK_CK>;
-				st,bank-name = "GPIOK";
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl 0 160 8>;
-			};
-		};
-	};
-};
-
-&systick {
-	clock-frequency = <250000000>;
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32h743i-disco.dts b/arch/arm/dts/stm32h743i-disco.dts
deleted file mode 100644
index b31188f8b9b..00000000000
--- a/arch/arm/dts/stm32h743i-disco.dts
+++ /dev/null
@@ -1,75 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR X11
-/*
- * Copyright 2017 - Patrice Chotard <patrice.chotard@foss.st.com>
- *
- */
-
-/dts-v1/;
-#include "stm32h743.dtsi"
-#include "stm32h7-pinctrl.dtsi"
-
-/ {
-	model = "STMicroelectronics STM32H743i-Discovery board";
-	compatible = "st,stm32h743i-disco", "st,stm32h743";
-
-	chosen {
-		bootargs = "root=/dev/ram";
-		stdout-path = "serial0:115200n8";
-	};
-
-	memory@d0000000 {
-		device_type = "memory";
-		reg = <0xd0000000 0x2000000>;
-	};
-
-	aliases {
-		serial0 = &usart2;
-	};
-
-	v3v3: regulator-v3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "v3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-};
-
-&clk_hse {
-	clock-frequency = <25000000>;
-};
-
-&mac {
-	status = "disabled";
-	pinctrl-0 = <&ethernet_rmii>;
-	pinctrl-names = "default";
-	phy-mode = "rmii";
-	phy-handle = <&phy0>;
-
-	mdio0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-		phy0: ethernet-phy@0 {
-			reg = <0>;
-		};
-	};
-};
-
-&sdmmc1 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
-	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
-	broken-cd;
-	st,neg-edge;
-	bus-width = <4>;
-	vmmc-supply = <&v3v3>;
-	status = "okay";
-};
-
-&usart2 {
-	pinctrl-0 = <&usart2_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32h743i-eval.dts b/arch/arm/dts/stm32h743i-eval.dts
deleted file mode 100644
index 5c5d8059bdc..00000000000
--- a/arch/arm/dts/stm32h743i-eval.dts
+++ /dev/null
@@ -1,160 +0,0 @@
-/*
- * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-/dts-v1/;
-#include "stm32h743.dtsi"
-#include "stm32h7-pinctrl.dtsi"
-
-/ {
-	model = "STMicroelectronics STM32H743i-EVAL board";
-	compatible = "st,stm32h743i-eval", "st,stm32h743";
-
-	chosen {
-		bootargs = "root=/dev/ram";
-		stdout-path = "serial0:115200n8";
-	};
-
-	memory@d0000000 {
-		device_type = "memory";
-		reg = <0xd0000000 0x2000000>;
-	};
-
-	aliases {
-		serial0 = &usart1;
-	};
-
-	vdda: regulator-vdda {
-		compatible = "regulator-fixed";
-		regulator-name = "vdda";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
-	v2v9_sd: regulator-v2v9_sd {
-		compatible = "regulator-fixed";
-		regulator-name = "v2v9_sd";
-		regulator-min-microvolt = <2900000>;
-		regulator-max-microvolt = <2900000>;
-		regulator-always-on;
-	};
-
-	usbotg_hs_phy: usb-phy {
-		#phy-cells = <0>;
-		compatible = "usb-nop-xceiv";
-		clocks = <&rcc USB1ULPI_CK>;
-		clock-names = "main_clk";
-	};
-};
-
-&adc_12 {
-	vdda-supply = <&vdda>;
-	vref-supply = <&vdda>;
-	status = "okay";
-	adc1: adc@0 {
-		/* potentiometer */
-		st,adc-channels = <0>;
-		status = "okay";
-	};
-};
-
-&clk_hse {
-	clock-frequency = <25000000>;
-};
-
-&i2c1 {
-	pinctrl-0 = <&i2c1_pins_a>;
-	pinctrl-names = "default";
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-};
-
-&rtc {
-	status = "okay";
-};
-
-&mac {
-	status = "disabled";
-	pinctrl-0 = <&ethernet_rmii>;
-	pinctrl-names = "default";
-	phy-mode = "rmii";
-	phy-handle = <&phy0>;
-
-	mdio0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-		phy0: ethernet-phy@0 {
-			reg = <0>;
-		};
-	};
-};
-
-&sdmmc1 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
-	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
-	broken-cd;
-	st,sig-dir;
-	st,neg-edge;
-	st,use-ckin;
-	bus-width = <4>;
-	vmmc-supply = <&v2v9_sd>;
-	status = "okay";
-};
-
-&usart1 {
-	pinctrl-0 = <&usart1_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&usbotg_hs {
-	pinctrl-0 = <&usbotg_hs_pins_a>;
-	pinctrl-names = "default";
-	phys = <&usbotg_hs_phy>;
-	phy-names = "usb2-phy";
-	dr_mode = "otg";
-	status = "okay";
-};
diff --git a/arch/arm/dts/stm32h750.dtsi b/arch/arm/dts/stm32h750.dtsi
deleted file mode 100644
index 99533f356b5..00000000000
--- a/arch/arm/dts/stm32h750.dtsi
+++ /dev/null
@@ -1,5 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/* Copyright (C) STMicroelectronics 2021 - All Rights Reserved */
-
-#include "stm32h743.dtsi"
-
diff --git a/arch/arm/dts/stm32h750i-art-pi.dts b/arch/arm/dts/stm32h750i-art-pi.dts
deleted file mode 100644
index c7c7132f227..00000000000
--- a/arch/arm/dts/stm32h750i-art-pi.dts
+++ /dev/null
@@ -1,188 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR X11
-/*
- * Copyright 2021 - Dillon Min <dillon.minfei@gmail.com>
- *
- */
-
-/dts-v1/;
-#include "stm32h750.dtsi"
-#include "stm32h7-pinctrl.dtsi"
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/gpio/gpio.h>
-
-/ {
-	model = "RT-Thread STM32H750i-ART-PI board";
-	compatible = "st,stm32h750i-art-pi", "st,stm32h750";
-
-	chosen {
-		bootargs = "root=/dev/ram";
-		stdout-path = "serial0:2000000n8";
-	};
-
-	memory@c0000000 {
-		device_type = "memory";
-		reg = <0xc0000000 0x2000000>;
-	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		linux,cma {
-			compatible = "shared-dma-pool";
-			no-map;
-			size = <0x100000>;
-			linux,dma-default;
-		};
-	};
-
-	aliases {
-		serial0 = &uart4;
-		serial1 = &usart3;
-	};
-
-	leds {
-		compatible = "gpio-leds";
-		led-red {
-			gpios = <&gpioi 8 0>;
-		};
-		led-green {
-			gpios = <&gpioc 15 0>;
-			linux,default-trigger = "heartbeat";
-		};
-	};
-
-	v3v3: regulator-v3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "v3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
-	wlan_pwr: regulator-wlan {
-		compatible = "regulator-fixed";
-
-		regulator-name = "wl-reg";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-};
-
-&clk_hse {
-	clock-frequency = <25000000>;
-};
-
-&dma1 {
-	status = "okay";
-};
-
-&dma2 {
-	status = "okay";
-};
-
-&mac {
-	status = "disabled";
-	pinctrl-0 = <&ethernet_rmii>;
-	pinctrl-names = "default";
-	phy-mode = "rmii";
-	phy-handle = <&phy0>;
-
-	mdio0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-		phy0: ethernet-phy@0 {
-			reg = <0>;
-		};
-	};
-};
-
-&sdmmc1 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
-	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
-	broken-cd;
-	st,neg-edge;
-	bus-width = <4>;
-	vmmc-supply = <&v3v3>;
-	status = "okay";
-};
-
-&sdmmc2 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc2_b4_pins_a>;
-	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
-	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
-	broken-cd;
-	non-removable;
-	st,neg-edge;
-	bus-width = <4>;
-	vmmc-supply = <&wlan_pwr>;
-	status = "okay";
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-	brcmf: bcrmf@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
-};
-
-&spi1 {
-	status = "okay";
-	pinctrl-0 = <&spi1_pins>;
-	pinctrl-names = "default";
-	cs-gpios = <&gpioa 4 GPIO_ACTIVE_LOW>;
-	dmas = <&dmamux1 37 0x400 0x05>,
-	       <&dmamux1 38 0x400 0x05>;
-	dma-names = "rx", "tx";
-
-	flash@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "winbond,w25q128", "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <80000000>;
-
-		partition@0 {
-			label = "root filesystem";
-			reg = <0 0x1000000>;
-		};
-	};
-};
-
-&usart2 {
-	pinctrl-0 = <&usart2_pins>;
-	pinctrl-names = "default";
-	status = "disabled";
-};
-
-&usart3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usart3_pins>;
-	dmas = <&dmamux1 45 0x400 0x05>,
-	       <&dmamux1 46 0x400 0x05>;
-	dma-names = "rx", "tx";
-	st,hw-flow-ctrl;
-	status = "okay";
-
-	bluetooth {
-		compatible = "brcm,bcm43438-bt";
-		host-wakeup-gpios = <&gpioc 0 GPIO_ACTIVE_HIGH>;
-		device-wakeup-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
-		shutdown-gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
-		max-speed = <115200>;
-	};
-};
-
-&uart4 {
-	pinctrl-0 = <&uart4_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index a44ebf25975..0824ee320d0 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -51,6 +51,7 @@ config STM32H7
 	select STM32_TIMER
 	select SYSCON
 	select TIMER
+	imply OF_UPSTREAM
 
 source "arch/arm/mach-stm32/stm32f4/Kconfig"
 source "arch/arm/mach-stm32/stm32f7/Kconfig"
diff --git a/configs/stm32h743-disco_defconfig b/configs/stm32h743-disco_defconfig
index 40fc9383aee..a674a202e23 100644
--- a/configs/stm32h743-disco_defconfig
+++ b/configs/stm32h743-disco_defconfig
@@ -6,7 +6,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x24040000
 CONFIG_ENV_SIZE=0x2000
-CONFIG_DEFAULT_DEVICE_TREE="stm32h743i-disco"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32h743i-disco"
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SYS_LOAD_ADDR=0xd0400000
 CONFIG_STM32H7=y
diff --git a/configs/stm32h743-eval_defconfig b/configs/stm32h743-eval_defconfig
index 953e67e75bb..d63e7219f33 100644
--- a/configs/stm32h743-eval_defconfig
+++ b/configs/stm32h743-eval_defconfig
@@ -6,7 +6,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x24040000
 CONFIG_ENV_SIZE=0x2000
-CONFIG_DEFAULT_DEVICE_TREE="stm32h743i-eval"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32h743i-eval"
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SYS_LOAD_ADDR=0xd0400000
 CONFIG_STM32H7=y
diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
index 4ca2d30e44c..a92a57d54ea 100644
--- a/configs/stm32h750-art-pi_defconfig
+++ b/configs/stm32h750-art-pi_defconfig
@@ -6,7 +6,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x24040000
 CONFIG_ENV_SIZE=0x2000
-CONFIG_DEFAULT_DEVICE_TREE="stm32h750i-art-pi"
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32h750i-art-pi"
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SYS_LOAD_ADDR=0xc1800000
 CONFIG_STM32H7=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
