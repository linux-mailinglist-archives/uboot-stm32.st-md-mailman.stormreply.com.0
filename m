Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E17AB34A56F
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Mar 2021 11:24:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC260C57B79;
	Fri, 26 Mar 2021 10:24:49 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F315C57B60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 10:24:48 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q5so4561170pfh.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fLyv8V+Tlad3/fvNI/oa3D5+ZUi4OvxfFvPxakJucTE=;
 b=dC7sQ2EaC3BlFwM2mRQiCeZC/ID9epKBn4Zh0cz2VVmQINo9ZzSy6jU4RjzhNu6quV
 BgvVpJX47ED1/CoiSTqiICLMp6Lar4CFnYNMFX+bFeNGL6atR2yVzPMf+u3uMwqT2SUf
 CBVoKX9cdGuVfn0lQvgMMiwgWNecfHLhhBg15ddP/U5rKqrIsixLJAhKv5uqwe+CtvjS
 Hxj7HZgcOOvb47UMDOgAfTB2EYG9U2Ngns6fJQ4tSFRm3piQ5OqZKpJ4pC4ict4ctIk5
 oEsxuw4jit0P+aBlFkjnsOcmynNAqW4x/1WNfOpZWRn4CnfuVdXYUhbKLtSkBbpPkHb1
 NPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fLyv8V+Tlad3/fvNI/oa3D5+ZUi4OvxfFvPxakJucTE=;
 b=FsVh+dHeAkoO79zzaZ7ftZr5IOo3IK2gHAQ1dI12ScDj9eWwH3RzjWOZ2Fra5obtPD
 +tYRM1+WjoTt1ZRUk/6bw4GWOi2XUnTgyiLBAjmr5bgfcngZjFfQhF92hQi8QWOaIbAo
 6Htu/w4PTPzgLCG+CDIsz9vvmJI0xgH3bkdgTkj1ATg/VAPM9xck8LpP+l0PIS9V0qcm
 XU/hAZ8BhUxiJNXj42bzLLx/Cs5YpF103dM2dzNDi0L0kMBgR2Ol62p+FDGrktsbLU1o
 iKRAw04gnldaAmL0ky4ecdzSUDu3CwZLg9j57SMlJG8kyylwa6zoUv1dChPka5mrl5aS
 k6rQ==
X-Gm-Message-State: AOAM533tMLhpMpA2gAlCuxx/ABk+vsWF97ERqOa2RJ9o1Z5Uyg2oIfOx
 +UjmDXAuuojhWSnpU5DZ3Q4=
X-Google-Smtp-Source: ABdhPJyiZQ00HrYz+jcTR1RxRopCDqv0u0H4q5Di1mEXVjIAjJnHPn4xAynnUCfT4ZEO7w2p2fk6kw==
X-Received: by 2002:a62:dd8e:0:b029:20a:309:2fcd with SMTP id
 w136-20020a62dd8e0000b029020a03092fcdmr12218067pff.35.1616754286611; 
 Fri, 26 Mar 2021 03:24:46 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ds3sm8126595pjb.23.2021.03.26.03.24.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 03:24:46 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Fri, 26 Mar 2021 18:24:24 +0800
Message-Id: <1616754267-13845-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
References: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 3/6] board: Add rt-thread art-pi board
	support
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

This patch adds support for rt-thread art-pi board.

for more information about art-pi, please goto:
https://art-pi.gitee.io/website/

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

v2: fix wrong author name / date

 arch/arm/mach-stm32/stm32h7/Kconfig          |  4 ++
 board/st/stm32h750-art-pi/Kconfig            | 19 +++++++++
 board/st/stm32h750-art-pi/MAINTAINERS        |  7 ++++
 board/st/stm32h750-art-pi/Makefile           |  6 +++
 board/st/stm32h750-art-pi/stm32h750-art-pi.c | 58 ++++++++++++++++++++++++++++
 configs/stm32h750-art-pi_defconfig           | 51 ++++++++++++++++++++++++
 include/configs/stm32h750-art-pi.h           | 48 +++++++++++++++++++++++
 7 files changed, 193 insertions(+)
 create mode 100644 board/st/stm32h750-art-pi/Kconfig
 create mode 100644 board/st/stm32h750-art-pi/MAINTAINERS
 create mode 100644 board/st/stm32h750-art-pi/Makefile
 create mode 100644 board/st/stm32h750-art-pi/stm32h750-art-pi.c
 create mode 100644 configs/stm32h750-art-pi_defconfig
 create mode 100644 include/configs/stm32h750-art-pi.h

diff --git a/arch/arm/mach-stm32/stm32h7/Kconfig b/arch/arm/mach-stm32/stm32h7/Kconfig
index 55e6217..70233a4 100644
--- a/arch/arm/mach-stm32/stm32h7/Kconfig
+++ b/arch/arm/mach-stm32/stm32h7/Kconfig
@@ -6,7 +6,11 @@ config TARGET_STM32H743_DISCO
 config TARGET_STM32H743_EVAL
 	bool "STM32H743 Evaluation board"
 
+config TARGET_STM32H750_ART_PI
+	bool "STM32H750 ART Pi board"
+
 source "board/st/stm32h743-eval/Kconfig"
 source "board/st/stm32h743-disco/Kconfig"
+source "board/st/stm32h750-art-pi/Kconfig"
 
 endif
diff --git a/board/st/stm32h750-art-pi/Kconfig b/board/st/stm32h750-art-pi/Kconfig
new file mode 100644
index 0000000..c31b984
--- /dev/null
+++ b/board/st/stm32h750-art-pi/Kconfig
@@ -0,0 +1,19 @@
+if TARGET_STM32H750_ART_PI
+
+config SYS_BOARD
+	string
+	default "stm32h750-art-pi"
+
+config SYS_VENDOR
+	string
+	default "st"
+
+config SYS_SOC
+	string
+	default "stm32h7"
+
+config SYS_CONFIG_NAME
+	string
+	default "stm32h750-art-pi"
+
+endif
diff --git a/board/st/stm32h750-art-pi/MAINTAINERS b/board/st/stm32h750-art-pi/MAINTAINERS
new file mode 100644
index 0000000..9578833
--- /dev/null
+++ b/board/st/stm32h750-art-pi/MAINTAINERS
@@ -0,0 +1,7 @@
+STM32H750 ART PI BOARD
+M:	Dillon Min <dillon.minfei@gmail.com>
+S:	Maintained
+F:	board/st/stm32h750-art-pi
+F:	include/configs/stm32h750-art-pi.h
+F:	configs/stm32h750-art-pi_defconfig
+F:	arch/arm/dts/stm32h7*
diff --git a/board/st/stm32h750-art-pi/Makefile b/board/st/stm32h750-art-pi/Makefile
new file mode 100644
index 0000000..a06de87
--- /dev/null
+++ b/board/st/stm32h750-art-pi/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2021, RT-Thread - All Rights Reserved
+# Author(s): Dillon Min, <dillon.minfei@gmail.com> for RT-Thread.
+
+obj-y	:= stm32h750-art-pi.o
diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
new file mode 100644
index 0000000..c374dd3
--- /dev/null
+++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2021, STMicroelectronics - All Rights Reserved
+ * Author(s): Dillon Min <dillon.minfei@gmail.com> for STMicroelectronics.
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <init.h>
+#include <log.h>
+#include <asm/global_data.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+int dram_init(void)
+{
+	struct udevice *dev;
+	int ret;
+
+	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
+	if (ret) {
+		debug("DRAM init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (fdtdec_setup_mem_size_base() != 0)
+		ret = -EINVAL;
+
+	return ret;
+}
+
+int dram_init_banksize(void)
+{
+	fdtdec_setup_memory_banksize();
+
+	return 0;
+}
+
+int board_early_init_f(void)
+{
+	return 0;
+}
+
+u32 get_board_rev(void)
+{
+	return 0;
+}
+
+int board_late_init(void)
+{
+	return 0;
+}
+
+int board_init(void)
+{
+	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
+	return 0;
+}
diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
new file mode 100644
index 0000000..a5c4cd7
--- /dev/null
+++ b/configs/stm32h750-art-pi_defconfig
@@ -0,0 +1,51 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32=y
+CONFIG_SYS_TEXT_BASE=0x90000000
+CONFIG_SYS_MALLOC_F_LEN=0xF00
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_STM32H7=y
+CONFIG_TARGET_STM32H750_ART_PI=y
+CONFIG_DEFAULT_DEVICE_TREE="stm32h750i-art-pi"
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_BOOTDELAY=3
+CONFIG_AUTOBOOT_KEYED=y
+CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
+CONFIG_AUTOBOOT_STOP_STR=" "
+# CONFIG_USE_BOOTCOMMAND is not set
+CONFIG_DEFAULT_FDT_FILE="stm32h750i-art-pi"
+# CONFIG_DISPLAY_CPUINFO is not set
+CONFIG_BOARD_EARLY_INIT_F=y
+CONFIG_BOARD_LATE_INIT=y
+CONFIG_SYS_PROMPT="U-Boot > "
+CONFIG_CMD_GPT=y
+CONFIG_CMD_MMC=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_EXT4_WRITE=y
+# CONFIG_ISO_PARTITION is not set
+CONFIG_OF_CONTROL=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+# CONFIG_NET is not set
+CONFIG_DM_MMC=y
+CONFIG_STM32_SDMMC2=y
+# CONFIG_PINCTRL_FULL is not set
+CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_BAUDRATE=2000000
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttySTM0,2000000 root=/dev/ram rdinit=/linuxrc loglevel=8"
+CONFIG_BOOTCOMMAND="bootm 90080000"
+CONFIG_REQUIRE_SERIAL_CONSOLE=y
+CONFIG_SERIAL_PRESENT=y
+CONFIG_DM_SERIAL=y
+CONFIG_STM32_SERIAL=y
+CONFIG_FIT=y
+CONFIG_FIT_EXTERNAL_OFFSET=0x0
+CONFIG_FIT_ENABLE_SHA256_SUPPORT=y
+CONFIG_FIT_FULL_CHECK=y
+CONFIG_FIT_PRINT=y
+CONFIG_LEGACY_IMAGE_FORMAT=y
+CONFIG_SUPPORT_RAW_INITRD=y
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_DM_DMA=y
diff --git a/include/configs/stm32h750-art-pi.h b/include/configs/stm32h750-art-pi.h
new file mode 100644
index 0000000..43dc79a
--- /dev/null
+++ b/include/configs/stm32h750-art-pi.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2021, STMicroelectronics - All Rights Reserved
+ * Author(s): Dillon Min <dillon.minfei@gmail.com> for STMicroelectronics.
+ */
+
+#ifndef __CONFIG_H
+#define __CONFIG_H
+
+#include <config.h>
+#include <linux/sizes.h>
+
+/* For booting Linux, use the first 16MB of memory */
+#define CONFIG_SYS_BOOTMAPSZ		(SZ_16M + SZ_8M)
+
+#define CONFIG_SYS_FLASH_BASE		0x90000000
+#define CONFIG_SYS_INIT_SP_ADDR		0x24040000
+
+/*
+ * Configuration of the external SDRAM memory
+ */
+#define CONFIG_SYS_LOAD_ADDR		0xC1800000
+#define CONFIG_LOADADDR			0xC1800000
+
+#define CONFIG_SYS_HZ_CLOCK		1000000
+
+#define CONFIG_CMDLINE_TAG
+#define CONFIG_SETUP_MEMORY_TAGS
+#define CONFIG_INITRD_TAG
+#define CONFIG_REVISION_TAG
+
+#define CONFIG_SYS_MAXARGS		16
+#define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
+
+#define BOOT_TARGET_DEVICES(func) \
+	func(MMC, mmc, 0)
+
+#include <config_distro_bootcmd.h>
+#define CONFIG_EXTRA_ENV_SETTINGS				\
+			"kernel_addr_r=0xC0008000\0"		\
+			"fdtfile=stm32h750i-art-pi.dtb\0"	\
+			"fdt_addr_r=0xC0408000\0"		\
+			"scriptaddr=0xC0418000\0"		\
+			"pxefile_addr_r=0xC0428000\0" \
+			"ramdisk_addr_r=0xC0438000\0"		\
+			BOOTENV
+
+#endif /* __CONFIG_H */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
