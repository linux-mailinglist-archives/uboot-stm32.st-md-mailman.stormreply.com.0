Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B49336C95
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Mar 2021 07:55:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 566F3C57B53;
	Thu, 11 Mar 2021 06:55:33 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04C09C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 06:44:16 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id s21so2917610pfm.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 22:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UUHgArBUp2Jpv03648vM2L7TZ6UOTp995co2f9X4lO0=;
 b=gvIWYwOOMzHRhvJsj7db7m2OGTitWBOCHEXLU+otG1U8NQSQ9+X801hAFIhL9DRc0a
 SZpwbW6huUbXdeqfwtjGdyQQ8ofDAqxIagwaBkUS4NEgCPsZ37tprXDE/6RP+V/YOB65
 plNuwOVIQ886vNnEFuYTMmZfxXNXSQF8gVPOdh5RDQZ33V5BTcQ/Q84+RqP1gFgYiB85
 BldcpfLFZxVYk4BLTsJtkrozkiTaRPyuwRDeYcb3zl8I5KNiGmKt23tkf/cKSFtflGwS
 VquYOUnHGE9RYwjGHavpLFOxm8rdqyDosOwAWU1FLwApvt3eRS763deUmFJWtMi3SJW6
 i6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UUHgArBUp2Jpv03648vM2L7TZ6UOTp995co2f9X4lO0=;
 b=YkRzOgpVk2oZkLTeX9qKGqGPbaiXPojYN3dWvlnEaMnUU6KnscHpkfBo5tuAH23plt
 W82CGagMiGo/Vw+3eKWWhBHlKdqzGIpmTHbrKi/mhW2R9bA4FcND7fCPfZYMs3qeah+/
 kRKBzm4xVC2l/HoiPerFR+ZuecLjxRVJiipyKPb/iXh3IyJicmDF2xR0oKoCBijurzk8
 YTXthuRZOCoJQZv/TqMdglZzv/wKgpymchQBvm/2YIZgTA5uOhyFalQFgrnunjPVUouz
 sD7nAxJ3z/bGv7/FL0lqcO3iCA7nq+Hwm0Iks7mWvJkPWQblsVH4x3GqM5X8fEXPMrBr
 P8JQ==
X-Gm-Message-State: AOAM53175gPzvltWjqcNWPSlftklGfOxhVpj5wTc2Fw/FQrww8hy1Hii
 +L8DmaNqWPazwAQxz8Mmd/Q=
X-Google-Smtp-Source: ABdhPJx94J8jeBWpL3IIyGh39Sk9Xy5DXC1xAb4dS7dzo7JBppF96oPiNq6P85o8fod8phlYWa8zUw==
X-Received: by 2002:aa7:9910:0:b029:1f1:b41b:f95c with SMTP id
 z16-20020aa799100000b02901f1b41bf95cmr6293506pff.5.1615445054481; 
 Wed, 10 Mar 2021 22:44:14 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i17sm1446652pfq.135.2021.03.10.22.44.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 22:44:14 -0800 (PST)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Thu, 11 Mar 2021 14:43:58 +0800
Message-Id: <1615445040-13757-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
References: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Thu, 11 Mar 2021 06:55:30 +0000
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/4] ARM: dts: stm32: Add RT-Thread art-pi
	board support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

All these files are add for support rt-thread art-pi board

the detail board information can be found at:
https://art-pi.gitee.io/website/

board resources:
- stm32h750xbh6 128k flash, 1024k sram
- 32MiB sdram
- 16MiB spi flash
- 8MiB qspi flash
- onboard wifi, bt, fm
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/dts/Makefile                      |   3 +-
 arch/arm/dts/stm32h743.dtsi                |   8 +
 arch/arm/dts/stm32h750-pinctrl.dtsi        | 319 +++++++++++++++++++++++++++++
 arch/arm/dts/stm32h750.dtsi                |   5 +
 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi |  81 ++++++++
 arch/arm/dts/stm32h750i-art-pi.dts         |  75 +++++++
 include/dt-bindings/memory/stm32-sdram.h   |   2 +
 7 files changed, 492 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/stm32h750-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32h750.dtsi
 create mode 100644 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32h750i-art-pi.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index c671082..0f54801 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -454,7 +454,8 @@ dtb-$(CONFIG_STM32F7) += stm32f746-disco.dtb \
 	stm32f769-disco.dtb \
 	stm32746g-eval.dtb
 dtb-$(CONFIG_STM32H7) += stm32h743i-disco.dtb \
-	stm32h743i-eval.dtb
+	stm32h743i-eval.dtb \
+	stm32h750i-art-pi.dtb
 
 dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-a1000.dtb \
diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
index e4e4723..bb3e2bf 100644
--- a/arch/arm/dts/stm32h743.dtsi
+++ b/arch/arm/dts/stm32h743.dtsi
@@ -99,6 +99,14 @@
 			clocks = <&rcc USART2_CK>;
 		};
 
+		uart4: serial@40004c00 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40004c00 0x400>;
+			interrupts = <52>;
+			status = "disabled";
+			clocks = <&rcc UART4_CK>;
+		};
+
 		i2c1: i2c@40005400 {
 			compatible = "st,stm32f7-i2c";
 			#address-cells = <1>;
diff --git a/arch/arm/dts/stm32h750-pinctrl.dtsi b/arch/arm/dts/stm32h750-pinctrl.dtsi
new file mode 100644
index 0000000..dd88ace
--- /dev/null
+++ b/arch/arm/dts/stm32h750-pinctrl.dtsi
@@ -0,0 +1,319 @@
+/*
+ * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
+/ {
+	soc {
+		pinctrl: pin-controller {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "st,stm32h743-pinctrl";
+			ranges = <0 0x58020000 0x3000>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&syscfg 0x8>;
+			pins-are-numbered;
+
+			gpioa: gpio@58020000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x0 0x400>;
+				clocks = <&rcc GPIOA_CK>;
+				st,bank-name = "GPIOA";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiob: gpio@58020400 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x400 0x400>;
+				clocks = <&rcc GPIOB_CK>;
+				st,bank-name = "GPIOB";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioc: gpio@58020800 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x800 0x400>;
+				clocks = <&rcc GPIOC_CK>;
+				st,bank-name = "GPIOC";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiod: gpio@58020c00 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0xc00 0x400>;
+				clocks = <&rcc GPIOD_CK>;
+				st,bank-name = "GPIOD";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioe: gpio@58021000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x1000 0x400>;
+				clocks = <&rcc GPIOE_CK>;
+				st,bank-name = "GPIOE";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiof: gpio@58021400 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x1400 0x400>;
+				clocks = <&rcc GPIOF_CK>;
+				st,bank-name = "GPIOF";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiog: gpio@58021800 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x1800 0x400>;
+				clocks = <&rcc GPIOG_CK>;
+				st,bank-name = "GPIOG";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioh: gpio@58021c00 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x1c00 0x400>;
+				clocks = <&rcc GPIOH_CK>;
+				st,bank-name = "GPIOH";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioi: gpio@58022000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x2000 0x400>;
+				clocks = <&rcc GPIOI_CK>;
+				st,bank-name = "GPIOI";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioj: gpio@58022400 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x2400 0x400>;
+				clocks = <&rcc GPIOJ_CK>;
+				st,bank-name = "GPIOJ";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiok: gpio@58022800 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x2800 0x400>;
+				clocks = <&rcc GPIOK_CK>;
+				st,bank-name = "GPIOK";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			i2c1_pins_a: i2c1-0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 6, AF4)>, /* I2C1_SCL */
+						 <STM32_PINMUX('B', 7, AF4)>; /* I2C1_SDA */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			ethernet_rmii: rmii-0 {
+				pins {
+					pinmux = <STM32_PINMUX('G', 11, AF11)>,
+						 <STM32_PINMUX('G', 13, AF11)>,
+						 <STM32_PINMUX('G', 12, AF11)>,
+						 <STM32_PINMUX('C', 4, AF11)>,
+						 <STM32_PINMUX('C', 5, AF11)>,
+						 <STM32_PINMUX('A', 7, AF11)>,
+						 <STM32_PINMUX('C', 1, AF11)>,
+						 <STM32_PINMUX('A', 2, AF11)>,
+						 <STM32_PINMUX('A', 1, AF11)>;
+					slew-rate = <2>;
+				};
+			};
+
+			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+						 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
+						 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+					slew-rate = <3>;
+					drive-push-pull;
+					bias-disable;
+				};
+			};
+
+			sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+					slew-rate = <3>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins2{
+					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+					slew-rate = <3>;
+					drive-open-drain;
+					bias-disable;
+				};
+			};
+
+			sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
+						 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
+						 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
+						 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
+						 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
+						 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
+				};
+			};
+
+			sdmmc1_dir_pins_a: sdmmc1-dir-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('C', 6, AF8)>, /* SDMMC1_D0DIR */
+						 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
+						 <STM32_PINMUX('B', 9, AF7)>; /* SDMMC1_CDIR */
+					slew-rate = <3>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins2{
+					pinmux = <STM32_PINMUX('B', 8, AF7)>; /* SDMMC1_CKIN */
+					bias-pull-up;
+				};
+			};
+
+			sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC1_D0DIR */
+						 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
+						 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
+						 <STM32_PINMUX('B', 8, ANALOG)>; /* SDMMC1_CKIN */
+				};
+			};
+
+			usart1_pins: usart1-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 15, AF4)>; /* USART1_RX */
+					bias-disable;
+				};
+			};
+
+			usart2_pins: usart2-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
+					bias-disable;
+				};
+			};
+
+			uart4_pins: uart4-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('A', 0, AF8)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('I', 9, AF8)>; /* UART4_RX */
+					bias-disable;
+				};
+			};
+
+			usbotg_hs_pins_a: usbotg-hs-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 4, AF10)>,	/* ULPI_NXT */
+							 <STM32_PINMUX('I', 11, AF10)>, /* ULPI_DIR> */
+							 <STM32_PINMUX('C', 0, AF10)>,	/* ULPI_STP> */
+							 <STM32_PINMUX('A', 5, AF10)>,	/* ULPI_CK> */
+							 <STM32_PINMUX('A', 3, AF10)>,	/* ULPI_D0> */
+							 <STM32_PINMUX('B', 0, AF10)>,	/* ULPI_D1> */
+							 <STM32_PINMUX('B', 1, AF10)>,	/* ULPI_D2> */
+							 <STM32_PINMUX('B', 10, AF10)>, /* ULPI_D3> */
+							 <STM32_PINMUX('B', 11, AF10)>, /* ULPI_D4> */
+							 <STM32_PINMUX('B', 12, AF10)>, /* ULPI_D5> */
+							 <STM32_PINMUX('B', 13, AF10)>, /* ULPI_D6> */
+							 <STM32_PINMUX('B', 5, AF10)>;	/* ULPI_D7> */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32h750.dtsi b/arch/arm/dts/stm32h750.dtsi
new file mode 100644
index 0000000..99533f3
--- /dev/null
+++ b/arch/arm/dts/stm32h750.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/* Copyright (C) STMicroelectronics 2021 - All Rights Reserved */
+
+#include "stm32h743.dtsi"
+
diff --git a/arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi b/arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
new file mode 100644
index 0000000..326a553
--- /dev/null
+++ b/arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <stm32h7-u-boot.dtsi>
+
+&fmc {
+	/*
+	 * Memory configuration from sdram datasheet W9825G6KH
+	 * first bank is bank@0
+	 * second bank is bank@1
+	 */
+	bank1: bank@0 {
+		st,sdram-control = /bits/ 8 <NO_COL_9
+					     NO_ROW_13
+					     MWIDTH_16
+					     BANKS_4
+					     CAS_2
+					     SDCLK_3
+					     RD_BURST_EN
+					     RD_PIPE_DL_0>;
+		st,sdram-timing = /bits/ 8 <TMRD_2
+					    TXSR_6
+					    TRAS_6
+					    TRC_6
+					    TRP_2
+					    TWR_2
+					    TRCD_2>;
+		st,sdram-refcount = <677>;
+	};
+};
+
+&pinctrl {
+	fmc_pins: fmc@0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 0, AF12)>,
+				 <STM32_PINMUX('D', 1, AF12)>,
+				 <STM32_PINMUX('D', 8, AF12)>,
+				 <STM32_PINMUX('D', 9, AF12)>,
+				 <STM32_PINMUX('D',10, AF12)>,
+				 <STM32_PINMUX('D',14, AF12)>,
+				 <STM32_PINMUX('D',15, AF12)>,
+
+				 <STM32_PINMUX('E', 0, AF12)>,
+				 <STM32_PINMUX('E', 1, AF12)>,
+				 <STM32_PINMUX('E', 7, AF12)>,
+				 <STM32_PINMUX('E', 8, AF12)>,
+				 <STM32_PINMUX('E', 9, AF12)>,
+				 <STM32_PINMUX('E',10, AF12)>,
+				 <STM32_PINMUX('E',11, AF12)>,
+				 <STM32_PINMUX('E',12, AF12)>,
+				 <STM32_PINMUX('E',13, AF12)>,
+				 <STM32_PINMUX('E',14, AF12)>,
+				 <STM32_PINMUX('E',15, AF12)>,
+
+				 <STM32_PINMUX('F', 0, AF12)>,
+				 <STM32_PINMUX('F', 1, AF12)>,
+				 <STM32_PINMUX('F', 2, AF12)>,
+				 <STM32_PINMUX('F', 3, AF12)>,
+				 <STM32_PINMUX('F', 4, AF12)>,
+				 <STM32_PINMUX('F', 5, AF12)>,
+				 <STM32_PINMUX('F',11, AF12)>,
+				 <STM32_PINMUX('F',12, AF12)>,
+				 <STM32_PINMUX('F',13, AF12)>,
+				 <STM32_PINMUX('F',14, AF12)>,
+				 <STM32_PINMUX('F',15, AF12)>,
+
+				 <STM32_PINMUX('G', 0, AF12)>,
+				 <STM32_PINMUX('G', 1, AF12)>,
+				 <STM32_PINMUX('G', 2, AF12)>,
+				 <STM32_PINMUX('G', 4, AF12)>,
+				 <STM32_PINMUX('G', 5, AF12)>,
+				 <STM32_PINMUX('G', 8, AF12)>,
+				 <STM32_PINMUX('G',15, AF12)>,
+
+				 <STM32_PINMUX('H', 5, AF12)>,
+				 <STM32_PINMUX('C', 2, AF12)>,
+				 <STM32_PINMUX('C', 3, AF12)>;
+
+			slew-rate = <3>;
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32h750i-art-pi.dts b/arch/arm/dts/stm32h750i-art-pi.dts
new file mode 100644
index 0000000..79e8ba5
--- /dev/null
+++ b/arch/arm/dts/stm32h750i-art-pi.dts
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+ OR X11
+/*
+ * Copyright 2021 - Dillon Min <dillon.minfei@gmail.com>
+ *
+ */
+
+/dts-v1/;
+#include "stm32h750.dtsi"
+#include "stm32h750-pinctrl.dtsi"
+
+/ {
+	model = "RT-Thread STM32H750i-Art-Pi board";
+	compatible = "st,stm32h750i-art-pi", "st,stm32h750";
+
+	chosen {
+		bootargs = "root=/dev/ram";
+		stdout-path = "serial0:2000000n8";
+	};
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x2000000>;
+	};
+
+	aliases {
+		serial0 = &uart4;
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&clk_hse {
+	clock-frequency = <25000000>;
+};
+
+&mac {
+	status = "disabled";
+	pinctrl-0	= <&ethernet_rmii>;
+	pinctrl-names	= "default";
+	phy-mode	= "rmii";
+	phy-handle	= <&phy0>;
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
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
diff --git a/include/dt-bindings/memory/stm32-sdram.h b/include/dt-bindings/memory/stm32-sdram.h
index ab91d2b..90ef2e1 100644
--- a/include/dt-bindings/memory/stm32-sdram.h
+++ b/include/dt-bindings/memory/stm32-sdram.h
@@ -34,8 +34,10 @@
 #define TXSR_1		(1 - 1)
 #define TXSR_6		(6 - 1)
 #define TXSR_7		(7 - 1)
+#define TXSR_8		(8 - 1)
 #define TRAS_1		(1 - 1)
 #define TRAS_4		(4 - 1)
+#define TRAS_6		(6 - 1)
 #define TRC_6		(6 - 1)
 #define TWR_1		(1 - 1)
 #define TWR_2		(2 - 1)
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
