Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF0F211372
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Jul 2020 21:23:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B2E9C36B23
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Jul 2020 19:23:15 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23B17C36B22
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2020 19:23:14 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id by13so11227608edb.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Jul 2020 12:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1SacBBnHGeCZqaQm8YC7kCRK6Hphu6fjf/5wRc7OkQ=;
 b=J7e0ygAMfK+2faIe9h2Lwnf44acQruUV9WfDTmalTuxKkQ9NUC+ryAmVWYAfwFS/11
 GC1KNYafGvVk4BJQaFPnCRZQi+VfJ4acb6Q4eOm3O/kru+/qGUDYE4hmnPcbQA4MszRx
 FPwPCtloTgQd9MXiuzarxxQfFQMWzOT312bMxsU01RWfVCecT/q5TUSBbCzzBvR4XHIw
 aMOjDYGxXOS6bq6EcXrvHOllCL4vqmIoxKJFOzIQjkDNKZFaQfdxJtYalDRn6fPsp18O
 QTKAAeeprTiu1ot6mGshGSUkPPMz1RJoRTZk4NJZQ9hcz9VYkujwf8tcArqMYfuaqSqR
 GMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1SacBBnHGeCZqaQm8YC7kCRK6Hphu6fjf/5wRc7OkQ=;
 b=GAi1lgawC0VYzHB3MAbmB6H3rs7m+NpODRpXykJ5JjveB9CUwQ2GXEw99CX9Bgb5Nx
 B8vAAhmE0XwqDelQVEvv0PfoQl6McVdELnBwj+F1gfUg+5AkQOn9Ypqua1ttWbx7iHiT
 hPyqhbfMYXE0L/vt2667eZDDXIZr1oT/WueLTHEI6BFNVi45RO0E4uSvm74J6sWmEFM8
 KEU2fZ9ObXn5Kg8yVJ9AsAtminvT99XoMzpt7Rsinlku8ANYNBmWIl4Z2+TtvMMNbFWH
 kj8yLOqDnPZf1LdvD7RxzsZlpmKiyieVxaJiA1ATGBbLYwlLPlWeL1uv4dlSu94TKL0H
 msBw==
X-Gm-Message-State: AOAM5314YlyLtV4/fbrJBfmZFjJfgWOyBfuldUz+ewbmqyvdkCNHh5hL
 NFRyKRTT3ireBzXVxOsx2+k=
X-Google-Smtp-Source: ABdhPJwvu78pRyfJ8+xOyD5JKmVCXvGxGWWIKLRVZD8jwUQvvtpkBFIIZe/T+dfVCM38Lv6wV2lcLA==
X-Received: by 2002:a05:6402:1c86:: with SMTP id
 cy6mr17605166edb.30.1593631393458; 
 Wed, 01 Jul 2020 12:23:13 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id v19sm6751281edy.50.2020.07.01.12.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 12:23:12 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: u-boot@lists.denx.de
Date: Wed,  1 Jul 2020 21:23:04 +0200
Message-Id: <20200701192305.16193-1-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, Josip Kelecic <josip.kelecic@sartura.hr>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH v4] ARM: dts: stm32: add seeed studio
	odyssey-stm32mp157c board
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

This commit adds device tree files supporting
SBC from Seeed Studio based on STM32MP157C.

This works with generic stm32mp1 config.
Right now only booting from SD card is supported.

Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
---

Changes in v4:
- removed unnecessary pull up on uart4 rx

Changes in v3:
- changed name of dts files from odyssey-stm32mp157c...
  to stm32mp157c-odyssey...
- removed usbotg node config
- add new board in dts/Makefile in alphabetical order

Changes in v2:
- removed `st,adc_usb_pd` from config since that
  adc connection is non-existent which caused
  warning or hang during boot

 arch/arm/dts/Makefile                         |   1 +
 .../dts/stm32mp157c-odyssey-som-u-boot.dtsi   | 134 +++++++
 arch/arm/dts/stm32mp157c-odyssey-som.dtsi     | 364 ++++++++++++++++++
 arch/arm/dts/stm32mp157c-odyssey-u-boot.dtsi  |  58 +++
 arch/arm/dts/stm32mp157c-odyssey.dts          | 161 ++++++++
 5 files changed, 718 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157c-odyssey-som.dtsi
 create mode 100644 arch/arm/dts/stm32mp157c-odyssey-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157c-odyssey.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 9900b44274..af94ed5aef 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -917,6 +917,7 @@ dtb-$(CONFIG_STM32MP15x) += \
 	stm32mp157c-dk2.dtb \
 	stm32mp157c-ed1.dtb \
 	stm32mp157c-ev1.dtb \
+	stm32mp157c-odyssey.dtb \
 	stm32mp15xx-dhcom-pdk2.dtb \
 	stm32mp15xx-dhcor-avenger96.dtb
 
diff --git a/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi b/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
new file mode 100644
index 0000000000..cf08efae09
--- /dev/null
+++ b/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2020 Marcin Sloniewski <marcin.sloniewski@gmail.com>
+ */
+
+#include <dt-bindings/clock/stm32mp1-clksrc.h>
+#include "stm32mp15-u-boot.dtsi"
+#include "stm32mp15-ddr3-1x4Gb-1066-binG.dtsi"
+
+/ {
+	config {
+		u-boot,boot-led = "heartbeat";
+	};
+};
+
+&clk_hse {
+	st,digbypass;
+};
+
+&i2c2 {
+	u-boot,dm-pre-reloc;
+};
+
+&i2c2_pins_a {
+	u-boot,dm-pre-reloc;
+	pins {
+		u-boot,dm-pre-reloc;
+	};
+};
+
+&pmic {
+	u-boot,dm-pre-reloc;
+};
+
+&rcc {
+	st,clksrc = <
+		CLK_MPU_PLL1P
+		CLK_AXI_PLL2P
+		CLK_MCU_PLL3P
+		CLK_PLL12_HSE
+		CLK_PLL3_HSE
+		CLK_PLL4_HSE
+		CLK_RTC_LSE
+		CLK_MCO1_DISABLED
+		CLK_MCO2_DISABLED
+	>;
+
+	st,clkdiv = <
+		1 /*MPU*/
+		0 /*AXI*/
+		0 /*MCU*/
+		1 /*APB1*/
+		1 /*APB2*/
+		1 /*APB3*/
+		1 /*APB4*/
+		2 /*APB5*/
+		23 /*RTC*/
+		0 /*MCO1*/
+		0 /*MCO2*/
+	>;
+
+	st,pkcs = <
+		CLK_CKPER_HSE
+		CLK_FMC_ACLK
+		CLK_QSPI_ACLK
+		CLK_ETH_DISABLED
+		CLK_SDMMC12_PLL4P
+		CLK_DSI_DSIPLL
+		CLK_STGEN_HSE
+		CLK_USBPHY_HSE
+		CLK_SPI2S1_PLL3Q
+		CLK_SPI2S23_PLL3Q
+		CLK_SPI45_HSI
+		CLK_SPI6_HSI
+		CLK_I2C46_HSI
+		CLK_SDMMC3_PLL4P
+		CLK_USBO_USBPHY
+		CLK_ADC_CKPER
+		CLK_CEC_LSE
+		CLK_I2C12_HSI
+		CLK_I2C35_HSI
+		CLK_UART1_HSI
+		CLK_UART24_HSI
+		CLK_UART35_HSI
+		CLK_UART6_HSI
+		CLK_UART78_HSI
+		CLK_SPDIF_PLL4P
+		CLK_FDCAN_PLL4R
+		CLK_SAI1_PLL3Q
+		CLK_SAI2_PLL3Q
+		CLK_SAI3_PLL3Q
+		CLK_SAI4_PLL3Q
+		CLK_RNG1_LSI
+		CLK_RNG2_LSI
+		CLK_LPTIM1_PCLK1
+		CLK_LPTIM23_PCLK3
+		CLK_LPTIM45_LSE
+	>;
+
+	/* VCO = 1300.0 MHz => P = 650 (CPU) */
+	pll1: st,pll@0 {
+		compatible = "st,stm32mp1-pll";
+		reg = <0>;
+		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
+		frac = < 0x800 >;
+		u-boot,dm-pre-reloc;
+	};
+
+	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
+	pll2: st,pll@1 {
+		compatible = "st,stm32mp1-pll";
+		reg = <1>;
+		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
+		frac = < 0x1400 >;
+		u-boot,dm-pre-reloc;
+	};
+
+	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
+	pll3: st,pll@2 {
+		compatible = "st,stm32mp1-pll";
+		reg = <2>;
+		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
+		frac = < 0x1a04 >;
+		u-boot,dm-pre-reloc;
+	};
+
+	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
+	pll4: st,pll@3 {
+		compatible = "st,stm32mp1-pll";
+		reg = <3>;
+		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
+		u-boot,dm-pre-reloc;
+	};
+};
diff --git a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
new file mode 100644
index 0000000000..855de9523c
--- /dev/null
+++ b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2020 Marcin Sloniewski <marcin.sloniewski@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+
+/ {
+
+	model = "Seeed Studio Odyssey-STM32MP157C SOM";
+	compatible = "seeed,odyssey-stm32mp157c-som", "st,stm32mp157";
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mcuram2: mcuram2@10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+
+		gpu_reserved: gpu@d4000000 {
+			reg = <0xd4000000 0x4000000>;
+			no-map;
+		};
+
+		optee@de000000 {
+			reg = <0xde000000 0x02000000>;
+			no-map;
+		};
+	};
+
+	led {
+		compatible = "gpio-leds";
+		blue {
+			label = "heartbeat";
+			gpios = <&gpiog 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
+
+};
+
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_a>;
+	pinctrl-1 = <&i2c2_pins_sleep_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <400000>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	pmic: stpmic@33 {
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		status = "okay";
+
+		regulators {
+			compatible = "st,stpmic1-regulators";
+			ldo1-supply = <&v3v3>;
+			ldo3-supply = <&vdd_ddr>;
+			ldo6-supply = <&v3v3>;
+			pwr_sw1-supply = <&bst_out>;
+			pwr_sw2-supply = <&bst_out>;
+
+			vddcore: buck1 {
+				regulator-name = "vddcore";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd_ddr: buck2 {
+				regulator-name = "vdd_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd: buck3 {
+				regulator-name = "vdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			v3v3: buck4 {
+				regulator-name = "v3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				regulator-initial-mode = <0>;
+			};
+
+			v1v8_audio: ldo1 {
+				regulator-name = "v1v8_audio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO1 0>;
+			};
+
+			v3v3_hdmi: ldo2 {
+				regulator-name = "v3v3_hdmi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO2 0>;
+			};
+
+			vtt_ddr: ldo3 {
+				regulator-name = "vtt_ddr";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			vdd_usb: ldo4 {
+				regulator-name = "vdd_usb";
+				interrupts = <IT_CURLIM_LDO4 0>;
+			};
+
+			vdda: ldo5 {
+				regulator-name = "vdda";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				interrupts = <IT_CURLIM_LDO5 0>;
+				regulator-boot-on;
+			};
+
+			v1v2_hdmi: ldo6 {
+				regulator-name = "v1v2_hdmi";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO6 0>;
+			};
+
+			vref_ddr: vref_ddr {
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+			};
+
+			 bst_out: boost {
+				regulator-name = "bst_out";
+				interrupts = <IT_OCP_BOOST 0>;
+			 };
+
+			vbus_otg: pwr_sw1 {
+				regulator-name = "vbus_otg";
+				interrupts = <IT_OCP_OTG 0>;
+			 };
+
+			 vbus_sw: pwr_sw2 {
+				regulator-name = "vbus_sw";
+				interrupts = <IT_OCP_SWOUT 0>;
+				regulator-active-discharge = <1>;
+			 };
+		};
+
+		onkey {
+			compatible = "st,stpmic1-onkey";
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
+			interrupt-names = "onkey-falling", "onkey-rising";
+			power-off-time-sec = <10>;
+			status = "okay";
+		};
+
+		watchdog {
+			compatible = "st,stpmic1-wdt";
+			status = "disabled";
+		};
+	};
+};
+
+&ipcc {
+	status = "okay";
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&m4_rproc {
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	status = "okay";
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
+	broken-cd;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&timers1 {
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm1_pins_a>;
+		pinctrl-1 = <&pwm1_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@0 {
+		status = "okay";
+	};
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
+		pinctrl-0 = <&pwm4_pins_a &pwm4_pins_b>;
+		pinctrl-1 = <&pwm4_sleep_pins_a &pwm4_sleep_pins_b>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@3 {
+		status = "okay";
+	};
+};
+
+&timers5 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm5_pins_a>;
+		pinctrl-1 = <&pwm5_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@4 {
+		status = "okay";
+	};
+};
+
+&timers6 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	timer@5 {
+		status = "okay";
+	};
+};
+
+&timers12 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm12_pins_a>;
+		pinctrl-1 = <&pwm12_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@11 {
+		status = "okay";
+	};
+};
+
+&vrefbuf {
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	vdda-supply = <&vdd>;
+	status = "okay";
+};
diff --git a/arch/arm/dts/stm32mp157c-odyssey-u-boot.dtsi b/arch/arm/dts/stm32mp157c-odyssey-u-boot.dtsi
new file mode 100644
index 0000000000..abceba5cbd
--- /dev/null
+++ b/arch/arm/dts/stm32mp157c-odyssey-u-boot.dtsi
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2020 Marcin Sloniewski <marcin.sloniewski@gmail.com>
+ */
+
+ #include "stm32mp157c-odyssey-som-u-boot.dtsi"
+
+/ {
+	aliases {
+		mmc0 = &sdmmc1;
+		usb0 = &usbotg_hs;
+	};
+	config {
+		u-boot,boot-led = "heartbeat";
+		u-boot,error-led = "error";
+	};
+	led {
+		red {
+			label = "error";
+			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+			status = "okay";
+		};
+	};
+};
+
+&adc {
+	status = "okay";
+};
+
+&sdmmc1 {
+	u-boot,dm-spl;
+};
+
+&sdmmc1_b4_pins_a {
+	u-boot,dm-spl;
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
+		u-boot,dm-spl;
+	};
+};
+
+&uart4 {
+	u-boot,dm-pre-reloc;
+};
+
+&uart4_pins_a {
+	u-boot,dm-pre-reloc;
+	pins1 {
+		u-boot,dm-pre-reloc;
+	};
+	pins2 {
+		u-boot,dm-pre-reloc;
+	};
+};
+
diff --git a/arch/arm/dts/stm32mp157c-odyssey.dts b/arch/arm/dts/stm32mp157c-odyssey.dts
new file mode 100644
index 0000000000..1ea340d9a8
--- /dev/null
+++ b/arch/arm/dts/stm32mp157c-odyssey.dts
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2020 Marcin Sloniewski <marcin.sloniewski@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "stm32mp157c-odyssey-som.dtsi"
+
+/ {
+
+	model = "Seeed Studio Odyssey-STM32MP157C Board";
+	compatible = "seeed,odyssey-stm32mp157c", "st,stm32mp157";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		serial0 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	led {
+		compatible = "gpio-leds";
+		blue {
+			label = "heartbeat";
+			gpios = <&gpiog 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
+
+};
+
+&adc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&adc12_ain_pins_a>, <&adc12_usb_cc_pins_a>;
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdd>;
+	vref-supply = <&vrefbuf>;
+	status = "disabled";
+	adc1: adc@0 {
+		/*
+		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in18 & in19.
+		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
+		 * 5 * (56 + 47kOhms) * 5pF => 2.5us.
+		 * Use arbitrary margin here (e.g. 5us).
+		 */
+		st,min-sample-time-nsecs = <5000>;
+		/* AIN connector, USB Type-C CC1 & CC2 */
+		st,adc-channels = <0 1 6 13 18 19>;
+		status = "okay";
+	};
+	adc2: adc@100 {
+		/* AIN connector, USB Type-C CC1 & CC2 */
+		st,adc-channels = <0 1 2 6 18 19>;
+		st,min-sample-time-nsecs = <5000>;
+		status = "okay";
+	};
+};
+
+&cec {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&cec_pins_b>;
+	pinctrl-1 = <&cec_pins_sleep_b>;
+	status = "okay";
+};
+
+&ethernet0 {
+	status = "okay";
+	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
+	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
+	pinctrl-names = "default", "sleep";
+	phy-mode = "rgmii-id";
+	max-speed = <1000>;
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
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_pins_sleep_a>;
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <7>;
+	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&i2s2 {
+	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+	clock-names = "pclk", "i2sclk", "x8k", "x11k";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2s2_pins_a>;
+	pinctrl-1 = <&i2s2_pins_sleep_a>;
+	status = "okay";
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_a>;
+	status = "okay";
+};
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	status = "okay";
+};
+
+&usbotg_hs {
+	dr_mode = "peripheral";
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+};
+
-- 
2.26.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
