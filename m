Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192333D925
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 17:22:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A3B6C57B78;
	Tue, 16 Mar 2021 16:22:50 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41E46C57B5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 16:22:47 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id ha17so10145335pjb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQea/7R9zi2qtkbLRrfWr7kXEtTgkFUTtae8yolR+Cg=;
 b=k0O4qfbElm4PUsrst2NiWJABdtXIw1mWG8lcTpNHcCbUTPZn+rDxHaFH7UeaZuLnAN
 ccrJlXEy3yqATr/W7gibx/hmw+Zj+4WgRGhzT38OLN8JvNh9MCB9NhfP2YDAhAB8IMm4
 lX24/+pHC/VSzFyUN/BHilKK4Ax6zXz1PogGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQea/7R9zi2qtkbLRrfWr7kXEtTgkFUTtae8yolR+Cg=;
 b=JZ1Nrn52n4Gt3CEmQVMZI7f5MwlXL3VpRNmNBIbwlzlwwqWxlb7KhDUWLK8V4z4bVs
 s4voeumWJjK1jacb65l1DRaK2b5A55IvfU9PeD2olTPFBZYS81xpn8pTfXyKBmQYLiYE
 DznD9MbP1Byehtg39X5iMmX0iAbwqQptfzTZOOHudmZkN+C7qAqfvBXcqBbhGWlCWJw9
 KgaSt/TAhKUaJt+kclOvsRhklY2X55PBuSJcAmc3aRj1awr6PJrqBgnBIaetYPwlbz4c
 r6hsKKWntVuO81MTcA12wuta7R9iFpimQFsb7iD6y21J7h5Hn8/hfbW4JXqbIeX9c5GO
 4S3w==
X-Gm-Message-State: AOAM533NpcFtmjsVllaIrUNDlPUdcgEtFMRUbXCWtGmi489Rkti/BaZO
 pF7U0EPdRSrbcgKtMXMVpmHg4WssPwDmQiF7
X-Google-Smtp-Source: ABdhPJzgKSbXw+a+Am/ivrYz6TZbcdtw/Y02hhiMewJOY0mbswZJhzs+xXgKxl1QtEUj9mPMMTRSrQ==
X-Received: by 2002:a17:90a:bd95:: with SMTP id
 z21mr448268pjr.214.1615911765841; 
 Tue, 16 Mar 2021 09:22:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:9de:273e:6ee1:9865])
 by smtp.gmail.com with ESMTPSA id
 k27sm17678240pfg.95.2021.03.16.09.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:22:45 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Tue, 16 Mar 2021 21:52:06 +0530
Message-Id: <20210316162207.35641-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316162207.35641-1-jagan@amarulasolutions.com>
References: <20210316162207.35641-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v3 7/8] board: stm32: Add Engicam MicroGEA
	STM32MP1 MicroDev 2.0 board
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

MicroDev 2.0 is a general purpose miniature carrier board with CAN,
LTE and LVDS panel interfaces.

Genaral features:
- Ethernet 10/100
- USB Type A
- Audio Out
- microSD
- LVDS panel connector
- Wifi/BT (option)
- UMTS LTE with sim connector (option)

MicroGEA STM32MP1 is a STM32MP157A based Micro SoM.

MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.

Linux dts commit details:

commit <f838dae7afd0> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
MicroDev 2.0 board")

Add support for it.

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- include stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
- include dts files in MAINTAINERS
- collect Patrice r-b
Changes for v2:
- collect Patrice r-b
- add linux dts commit
- drop CONFIG_BOARD_EARLY_INIT_F

 arch/arm/dts/Makefile                         |   1 +
 ...-microgea-stm32mp1-microdev2.0-u-boot.dtsi |  51 ++++++++
 ...32mp157a-microgea-stm32mp1-microdev2.0.dts |  55 ++++++++
 .../stm32mp157a-microgea-stm32mp1-u-boot.dtsi | 118 ++++++++++++++++++
 arch/arm/mach-stm32mp/Kconfig                 |  20 +++
 board/engicam/stm32mp1/Kconfig                |   2 +-
 board/engicam/stm32mp1/MAINTAINERS            |   7 ++
 ...mp15-microgea-stm32mp1-microdev2_defconfig |  79 ++++++++++++
 8 files changed, 332 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
 create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-u-boot.dtsi
 create mode 100644 configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index ce4521b891..64d73b96ef 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -992,6 +992,7 @@ dtb-$(CONFIG_STM32MP15x) += \
 	stm32mp157a-avenger96.dtb \
 	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
 	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
+	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
 	stm32mp157c-dk2.dtb \
 	stm32mp157c-ed1.dtb \
 	stm32mp157c-ev1.dtb \
diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-u-boot.dtsi b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-u-boot.dtsi
new file mode 100644
index 0000000000..e4bd215812
--- /dev/null
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-u-boot.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Amarula Solutions(India)
+ * Author: Jagan Teki <jagan@amarulasolutions.com>
+ */
+
+#include "stm32mp157a-microgea-stm32mp1-u-boot.dtsi"
+
+/{
+	aliases {
+		mmc0 = &sdmmc1;
+	};
+
+	chosen {
+		stdout-path = &uart4;
+	};
+};
+
+&sdmmc1 {
+	u-boot,dm-pre-reloc;
+};
+
+&sdmmc1_b4_pins_a {
+	u-boot,dm-pre-reloc;
+
+	pins1 {
+		u-boot,dm-pre-reloc;
+	};
+
+	pins2 {
+		u-boot,dm-pre-reloc;
+	};
+};
+
+&uart4 {
+	u-boot,dm-pre-reloc;
+};
+
+&uart4_pins_a {
+	u-boot,dm-pre-reloc;
+
+	pins1 {
+		u-boot,dm-pre-reloc;
+	};
+
+	pins2 {
+		u-boot,dm-pre-reloc;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
new file mode 100644
index 0000000000..7a75868164
--- /dev/null
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/dts-v1/;
+#include "stm32mp157.dtsi"
+#include "stm32mp157a-microgea-stm32mp1.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Engicam MicroGEA STM32MP1 MicroDev 2.0 Carrier Board";
+	compatible = "engicam,microgea-stm32mp1-microdev2.0",
+		     "engicam,microgea-stm32mp1", "st,stm32mp157";
+
+	aliases {
+		serial0 = &uart4;
+		serial1 = &uart8;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdmmc1 {
+	bus-width = <4>;
+	disable-wp;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	st,neg-edge;
+	vmmc-supply = <&vdd>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
+	status = "okay";
+};
+
+/* J31: RS323 */
+&uart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8_pins_a>;
+	status = "okay";
+};
diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-u-boot.dtsi
new file mode 100644
index 0000000000..836df6f746
--- /dev/null
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-u-boot.dtsi
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Amarula Solutions(India)
+ * Author: Jagan Teki <jagan@amarulasolutions.com>
+ */
+
+#include <dt-bindings/clock/stm32mp1-clksrc.h>
+#include "stm32mp15-u-boot.dtsi"
+#include "stm32mp15-ddr3-1x4Gb-1066-binG.dtsi"
+
+&vin {
+	u-boot,dm-pre-reloc;
+};
+
+&vddcore {
+	u-boot,dm-pre-reloc;
+};
+
+&vdd {
+	u-boot,dm-pre-reloc;
+};
+
+&vddq_ddr {
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
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index b809488ca3..abfe835158 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -77,6 +77,26 @@ config TARGET_ST_STM32MP15x
 		Evalulation board (EV1) or Discovery board (DK1 and DK2).
 		The difference between board are managed with devicetree
 
+config TARGET_MICROGEA_STM32MP1
+	bool "Engicam MicroGEA STM32MP1 SOM"
+	select STM32MP15x
+	imply BOOTCOUNT_LIMIT
+	imply BOOTSTAGE
+	imply CMD_BOOTCOUNT
+	imply CMD_BOOTSTAGE
+	imply CMD_CLS if CMD_BMP
+	imply DISABLE_CONSOLE
+	imply PRE_CONSOLE_BUFFER
+	imply SILENT_CONSOLE
+	help
+	  MicroGEA STM32MP1 is a STM32MP157A based Micro SOM.
+
+	  MicroGEA STM32MP1 MicroDev 2.0:
+	  * MicroDev 2.0 is a general purpose miniature carrier board with CAN,
+	    LTE and LVDS panel interfaces.
+	  * MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
+	    for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.
+
 config TARGET_ICORE_STM32MP1
 	bool "Engicam i.Core STM32MP1 SOM"
 	select STM32MP15x
diff --git a/board/engicam/stm32mp1/Kconfig b/board/engicam/stm32mp1/Kconfig
index e7bccc09fb..c800fd4e60 100644
--- a/board/engicam/stm32mp1/Kconfig
+++ b/board/engicam/stm32mp1/Kconfig
@@ -1,4 +1,4 @@
-if TARGET_ICORE_STM32MP1
+if TARGET_ICORE_STM32MP1 || TARGET_MICROGEA_STM32MP1
 
 config SYS_BOARD
 	default "stm32mp1"
diff --git a/board/engicam/stm32mp1/MAINTAINERS b/board/engicam/stm32mp1/MAINTAINERS
index 736a32e165..40220e7ce6 100644
--- a/board/engicam/stm32mp1/MAINTAINERS
+++ b/board/engicam/stm32mp1/MAINTAINERS
@@ -1,3 +1,10 @@
+MicroGEA-STM32MP1-MICRODEV2.0
+M:	Jagan Teki <jagan@amarulasolutions.com>
+M:	Matteo Lisi <matteo.lisi@engicam.com>
+S:	Maintained
+F:	arch/arm/dts/stm32mp15*microgea*
+F:	configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
+
 i.Core-STM32MP1-CTOUCH2.0
 M:	Jagan Teki <jagan@amarulasolutions.com>
 M:	Matteo Lisi <matteo.lisi@engicam.com>
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
new file mode 100644
index 0000000000..17aad82b88
--- /dev/null
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
@@ -0,0 +1,79 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_SYS_MEMTEST_START=0xc0000000
+CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_ENV_OFFSET=0x280000
+CONFIG_SPL_TEXT_BASE=0x2FFC2500
+CONFIG_SPL_MMC_SUPPORT=y
+CONFIG_SPL=y
+CONFIG_TARGET_MICROGEA_STM32MP1=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
+# CONFIG_ARMV7_VIRT is not set
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp157a-microgea-stm32mp1-microdev2.0"
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_FIT=y
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
+CONFIG_SPL_ENV_SUPPORT=y
+CONFIG_SPL_I2C_SUPPORT=y
+CONFIG_SPL_POWER_SUPPORT=y
+CONFIG_SYS_PROMPT="STM32MP> "
+CONFIG_CMD_ADTIMG=y
+CONFIG_CMD_ERASEENV=y
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_ADC=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_FUSE=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_REMOTEPROC=y
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_PMIC=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_EXT4_WRITE=y
+# CONFIG_SPL_DOS_PARTITION is not set
+CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+# CONFIG_SPL_ENV_IS_NOWHERE is not set
+CONFIG_DM_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_STM32F7=y
+CONFIG_LED=y
+CONFIG_LED_GPIO=y
+CONFIG_DM_MAILBOX=y
+CONFIG_STM32_IPCC=y
+CONFIG_STM32_FMC2_EBI=y
+CONFIG_DM_MMC=y
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_STM32_SDMMC2=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_ETH=y
+CONFIG_DWC_ETH_QOS=y
+CONFIG_PHY=y
+CONFIG_PINCONF=y
+# CONFIG_SPL_PINCTRL_FULL is not set
+CONFIG_PINCTRL_STMFX=y
+CONFIG_DM_PMIC=y
+# CONFIG_SPL_PMIC_CHILDREN is not set
+CONFIG_PMIC_STPMIC1=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_REMOTEPROC_STM32_COPRO=y
+CONFIG_DM_RTC=y
+CONFIG_RTC_STM32=y
+CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
+CONFIG_LZO=y
+CONFIG_ERRNO_STR=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
