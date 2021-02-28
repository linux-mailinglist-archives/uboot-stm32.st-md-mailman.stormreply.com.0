Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18532733B
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Feb 2021 16:53:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 485A1C56630;
	Sun, 28 Feb 2021 15:53:02 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1AB9C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:52:59 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id e9so6658963pjs.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdNt/hqY6B+yTOIpJCUA85TnFuS9mLG8X5vO31iN89A=;
 b=h5gOhNr2fXgeWCu7SzgQp8z+1w+P3ZnLCOLTIYd4z50v4bubke63BKYmPYcMTWUEWd
 l9A2YKRosP8rB8UTRREcoPnPd/PzG6gEa3zQHlxlt6a5eaI5vuYhRCyBxz5PGu+wlGbk
 q7YjFAdkAsaVb9G4NfDmC83ITH/ir7BI7PFDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdNt/hqY6B+yTOIpJCUA85TnFuS9mLG8X5vO31iN89A=;
 b=acJcaenW/Kl4fD/4PRF7Ii4sl2vd7FcchEXlWHr5D1UCjmLhKtprd/qakGu1EVxuDB
 Sa1OfQcYtVJzI4kDC8SQ6bfC0ByaazPS7H27XCjm7ZcHsO7hGopM3hvhHM88OKS0Ns33
 iD2QCQUPrFSqMaZAbIeUQ5MWhwFnK9U+W8aaJL9gb9cN/gCEzeEij41MBB3ZxY1x0rUI
 i59kFNKX6u0eSJ9Zhpk7zFXNEjUFBR88bExgQnE5aADT90iIwx9irr+8xucnqY154pOc
 vBnOhkuhPrpuE2/n9penykRtlWws/jmsYJmQHYdu0nzNGVPMo11QFG+phUHj5Nc4CUv3
 Lz1A==
X-Gm-Message-State: AOAM532SlX3j/mi8OCGmsZtZlTZGFhtjv4lHbzePTDly7aVpeZkmiH5k
 uJFApZRsP9zmt8MeshNsNDb/vg==
X-Google-Smtp-Source: ABdhPJwXkIofIGY504FxKAlRfjyzML9zMfMhaECCvoy+ZSDEc3e+yLJLOJp2LrV5d+y84CHtglJN+w==
X-Received: by 2002:a17:902:aa98:b029:e4:9648:94a7 with SMTP id
 d24-20020a170902aa98b02900e4964894a7mr4754455plr.11.1614527578569; 
 Sun, 28 Feb 2021 07:52:58 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id o18sm14725779pjq.44.2021.02.28.07.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:52:58 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Date: Sun, 28 Feb 2021 21:22:22 +0530
Message-Id: <20210228155226.77904-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228155226.77904-1-jagan@amarulasolutions.com>
References: <20210228155226.77904-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 5/9] board: stm32: Add Engicam i.Core STM32MP1
	C.TOUCH 2.0
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

Engicam C.TOUCH 2.0 is an EDIMM compliant general purpose Carrier
board.

Genaral features:
- Ethernet 10/100
- Wifi/BT
- USB Type A/OTG
- Audio Out
- CAN
- LVDS panel connector

i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

i.Core STM32MP1 needs to mount on top of this Carrier board for
creating complete i.Core STM32MP1 C.TOUCH 2.0 board.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/dts/Makefile                         |  1 +
 ...2mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi | 51 ++++++++++++
 .../stm32mp157a-icore-stm32mp1-ctouch2.dts    | 47 +++++++++++
 arch/arm/mach-stm32mp/Kconfig                 |  5 ++
 board/engicam/stm32mp1/MAINTAINERS            |  6 ++
 ...stm32mp15-icore-stm32mp1-ctouch2_defconfig | 80 +++++++++++++++++++
 6 files changed, 190 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
 create mode 100644 configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index f4a48c65e8..7e0fae8cf0 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -979,6 +979,7 @@ dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 dtb-$(CONFIG_STM32MP15x) += \
 	stm32mp157a-dk1.dtb \
 	stm32mp157a-avenger96.dtb \
+	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
 	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
 	stm32mp157c-dk2.dtb \
 	stm32mp157c-ed1.dtb \
diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi
new file mode 100644
index 0000000000..96fe461235
--- /dev/null
+++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Amarula Solutions(India)
+ * Author: Jagan Teki <jagan@amarulasolutions.com>
+ */
+
+#include "stm32mp157a-icore-stm32mp1-u-boot.dtsi"
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
diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
new file mode 100644
index 0000000000..d3058a036c
--- /dev/null
+++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/dts-v1/;
+#include "stm32mp157.dtsi"
+#include "stm32mp157a-icore-stm32mp1.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Engicam i.Core STM32MP1 C.TOUCH 2.0";
+	compatible = "engicam,icore-stm32mp1-ctouch2",
+		     "engicam,icore-stm32mp1", "st,stm32mp157";
+
+	aliases {
+		serial0 = &uart4;
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
+	vmmc-supply = <&v3v3>;
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
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 5a2123063a..15c832b16b 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -96,6 +96,11 @@ config TARGET_ICORE_STM32MP1
 	  * i.Core STM32MP1 needs to mount on top of EDIMM2.2 for
 	    creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.
 
+	  i.Core STM32MP1 C.TOUCH 2.0
+	  * C.TOUCH 2.0 is a general purpose Carrier board.
+	  * i.Core STM32MP1 needs to mount on top of this Carrier board
+	    for creating complete i.Core STM32MP1 C.TOUCH 2.0 board.
+
 config TARGET_DH_STM32MP1_PDK2
 	bool "DH STM32MP1 PDK2"
 	select STM32MP15x
diff --git a/board/engicam/stm32mp1/MAINTAINERS b/board/engicam/stm32mp1/MAINTAINERS
index 3230a7a6e8..62c6925c8d 100644
--- a/board/engicam/stm32mp1/MAINTAINERS
+++ b/board/engicam/stm32mp1/MAINTAINERS
@@ -1,3 +1,9 @@
+i.Core-STM32MP1-CTOUCH2.0
+M:	Jagan Teki <jagan@amarulasolutions.com>
+M:	Matteo Lisi <matteo.lisi@engicam.com>
+S:	Maintained
+F:	configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
+
 i.Core-STM32MP1-EDIMM2.2
 M:	Jagan Teki <jagan@amarulasolutions.com>
 M:	Matteo Lisi <matteo.lisi@engicam.com>
diff --git a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
new file mode 100644
index 0000000000..cb0b7581b8
--- /dev/null
+++ b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
@@ -0,0 +1,80 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_SYS_MEMTEST_START=0xc0000000
+CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_ENV_OFFSET=0x280000
+CONFIG_SPL_TEXT_BASE=0x2FFC2500
+CONFIG_SPL_MMC_SUPPORT=y
+CONFIG_SPL=y
+CONFIG_TARGET_ICORE_STM32MP1=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
+# CONFIG_ARMV7_VIRT is not set
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp157a-icore-stm32mp1-ctouch2"
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_FIT=y
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_BOARD_EARLY_INIT_F=y
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
