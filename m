Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EECFAD0C40
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2D0EC36B20;
	Sat,  7 Jun 2025 09:37:46 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87F4FC36B20
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:45 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-606b6dbe316so623735a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289065; x=1749893865;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6nnZ0z5CVcOZdPOmtmHivfMo/xRCiH6ugcO0Mzzk4VI=;
 b=F1zCvtMHQAt8Nu6EH1sZlBYIMFa9glkJLmduHQW6Ln4YVPWjOpInDbgfw+CXr+tLe9
 oxQn/dlu7mU+m1uLXl8Kh7VwBudwjmYxcD5gskUSLVdjC8PrWGprNLjTATn1DxRrbMwc
 P8CQ8NgBEGrE2csW0KBJHqEMPzeiNKHRzXokA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289065; x=1749893865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6nnZ0z5CVcOZdPOmtmHivfMo/xRCiH6ugcO0Mzzk4VI=;
 b=Ge1o3fQv0zdlWGsDvJDpWQMmo11u8DW5iWeHLGTmEVFzC30pB/Qs/5OzmzRSaRxgOh
 ZICXV52AcZ+AVGsvQKKzGxbRne138c6UIJl9YEqiaGkeo8Bq8kgE8kpOgiP1ZY46Cggt
 SOr8v/Ns9Po69Bx82zCJP5Bxia1WtWCrBU5T8NhJnvzH0t6Eluv9ntzxcnB3AkjgskjG
 MjORKBYtAPjCHe852FK8jJ1SlXV5Gd1qasZC0i01x/rdGYLu3ULuoRq1Ye1Tf4z1WrxG
 13CPxvQyd2ZQt4av/S1Y3WZbP+Y8ejoLeeMSIemWQ1cdilL+dsEKyT4DfFOM43m5OMNw
 UgyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1LUOCrd7hObald/Ise/2CITzc4xB9dV00PzLIrcJNcSr9EgKYoov4CfXculJDUWIoHaSusuraWfCesg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywdy6ixK7zpwW6sMVWskbT+9Pn+U62eutWU1ZryfwtUKPHUtU2B
 cI0fNbZ9+K91MP5V+MjWgebaXi7oAFy87qAYkSEbIFIutJJ9zNcAG6+RKlFuA3kyizk=
X-Gm-Gg: ASbGncvbCsB0amiNMyKJLZZXjU6q28eZx7t8RM4I6Vuwdq6AuDry37ODHRwer+gKLEY
 DFCBlESzPynjLm66faF5CNZX3/3G322HySY80IqDfSmqngT18y9+vk3vMfLGHdoOiUF4CQTyCFK
 n7pPumzJt6t7XeQ2xSUXPP7rmsp7S5vCrXu7RNx5YiN0VniJz7bKRV8pep7Z+MXK26Fvu5QKxIo
 F+M+p0C17f6cCeUNmJlZqqnPPGass5B4WTU5hKL2nPaNZjg9W2/Kdwe++E5gXD/y0NlkggijudP
 Kz8gXSDH3BntLBP4FyfVNbOurN4TuxAyVxz3AAsFwp/KofpV0rOj9ANXZTpbw+j89PZ5iOBqJ/h
 4cmeB9W2FR7gBUgICRX0lPUiEJkBv3CKtyeHdJXIg4W7LsX3BSbat/IN/Z2s6lSayRyhfV3AICT
 2P2LyxqlpT9oyWafAShGO0s6s=
X-Google-Smtp-Source: AGHT+IHXy+RZjYbnMDEzeLMHSgRjVATxr1x21fMyUTcMFXjZwt/KQCdBMYdInCwy4OCo4XZP2fa0UA==
X-Received: by 2002:a17:906:1359:b0:ade:433c:6412 with SMTP id
 a640c23a62f3a-ade433c6574mr85288266b.3.1749289064912; 
 Sat, 07 Jun 2025 02:37:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:17 +0200
Message-ID: <20250607093730.2249536-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 9/9] board: stm32: add stm32h747-discovery
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

---

 arch/arm/mach-stm32/stm32h7/Kconfig        |  4 +++
 board/st/stm32h747-disco/Kconfig           | 15 ++++++++
 board/st/stm32h747-disco/MAINTAINERS       |  7 ++++
 board/st/stm32h747-disco/Makefile          |  6 ++++
 board/st/stm32h747-disco/stm32h747-disco.c | 42 ++++++++++++++++++++++
 configs/stm32h747-disco_defconfig          | 35 ++++++++++++++++++
 drivers/clk/stm32/clk-stm32h7.c            |  5 +++
 include/configs/stm32h747-disco.h          | 32 +++++++++++++++++
 8 files changed, 146 insertions(+)
 create mode 100644 board/st/stm32h747-disco/Kconfig
 create mode 100644 board/st/stm32h747-disco/MAINTAINERS
 create mode 100644 board/st/stm32h747-disco/Makefile
 create mode 100644 board/st/stm32h747-disco/stm32h747-disco.c
 create mode 100644 configs/stm32h747-disco_defconfig
 create mode 100644 include/configs/stm32h747-disco.h

diff --git a/arch/arm/mach-stm32/stm32h7/Kconfig b/arch/arm/mach-stm32/stm32h7/Kconfig
index 70233a4b23cd..72f20c477d04 100644
--- a/arch/arm/mach-stm32/stm32h7/Kconfig
+++ b/arch/arm/mach-stm32/stm32h7/Kconfig
@@ -6,11 +6,15 @@ config TARGET_STM32H743_DISCO
 config TARGET_STM32H743_EVAL
 	bool "STM32H743 Evaluation board"
 
+config TARGET_STM32H747_DISCO
+	bool "STM32H747 Discovery board"
+
 config TARGET_STM32H750_ART_PI
 	bool "STM32H750 ART Pi board"
 
 source "board/st/stm32h743-eval/Kconfig"
 source "board/st/stm32h743-disco/Kconfig"
+source "board/st/stm32h747-disco/Kconfig"
 source "board/st/stm32h750-art-pi/Kconfig"
 
 endif
diff --git a/board/st/stm32h747-disco/Kconfig b/board/st/stm32h747-disco/Kconfig
new file mode 100644
index 000000000000..a7b2c09a327f
--- /dev/null
+++ b/board/st/stm32h747-disco/Kconfig
@@ -0,0 +1,15 @@
+if TARGET_STM32H747_DISCO
+
+config SYS_BOARD
+	default "stm32h747-disco"
+
+config SYS_VENDOR
+	default "st"
+
+config SYS_SOC
+	default "stm32h7"
+
+config SYS_CONFIG_NAME
+	default "stm32h747-disco"
+
+endif
diff --git a/board/st/stm32h747-disco/MAINTAINERS b/board/st/stm32h747-disco/MAINTAINERS
new file mode 100644
index 000000000000..d48649f773f3
--- /dev/null
+++ b/board/st/stm32h747-disco/MAINTAINERS
@@ -0,0 +1,7 @@
+STM32H747 DISCOVERY BOARD
+M:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
+S:	Maintained
+F:	board/st/stm32h747-disco
+F:	include/configs/stm32h747-disco.h
+F:	configs/stm32h747-disco_defconfig
+F:	arch/arm/dts/stm32h747*
diff --git a/board/st/stm32h747-disco/Makefile b/board/st/stm32h747-disco/Makefile
new file mode 100644
index 000000000000..e11f052cc88f
--- /dev/null
+++ b/board/st/stm32h747-disco/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (c) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+#
+
+obj-y	:= stm32h747-disco.o
diff --git a/board/st/stm32h747-disco/stm32h747-disco.c b/board/st/stm32h747-disco/stm32h747-disco.c
new file mode 100644
index 000000000000..be0884bdeb4d
--- /dev/null
+++ b/board/st/stm32h747-disco/stm32h747-disco.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * stm32h747i-disco support
+ *
+ * Copyright (C) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
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
+int board_init(void)
+{
+	return 0;
+}
diff --git a/configs/stm32h747-disco_defconfig b/configs/stm32h747-disco_defconfig
new file mode 100644
index 000000000000..8a0c72450d1e
--- /dev/null
+++ b/configs/stm32h747-disco_defconfig
@@ -0,0 +1,35 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32=y
+CONFIG_TEXT_BASE=0x08000000
+CONFIG_SYS_MALLOC_LEN=0x100000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
+CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x24040000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32h747i-disco"
+CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_SYS_LOAD_ADDR=0xd0400000
+CONFIG_STM32H7=y
+CONFIG_TARGET_STM32H747_DISCO=y
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_BOOTDELAY=3
+CONFIG_AUTOBOOT_KEYED=y
+CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
+CONFIG_AUTOBOOT_STOP_STR=" "
+CONFIG_DEFAULT_FDT_FILE="stm32h747i-disco"
+CONFIG_SYS_CBSIZE=256
+CONFIG_SYS_PBSIZE=282
+# CONFIG_DISPLAY_CPUINFO is not set
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
+CONFIG_NO_NET=y
+CONFIG_STM32_SDMMC2=y
+# CONFIG_PINCTRL_FULL is not set
diff --git a/drivers/clk/stm32/clk-stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
index 6acf2ff0a8fb..aa3be414a29f 100644
--- a/drivers/clk/stm32/clk-stm32h7.c
+++ b/drivers/clk/stm32/clk-stm32h7.c
@@ -114,6 +114,7 @@
 #define		QSPISRC_PER_CK		3
 
 #define PWR_CR3				0x0c
+#define PWR_CR3_LDOEN			BIT(1)
 #define PWR_CR3_SCUEN			BIT(2)
 #define PWR_D3CR			0x18
 #define PWR_D3CR_VOS_MASK		GENMASK(15, 14)
@@ -375,7 +376,11 @@ int configure_clocks(struct udevice *dev)
 	clrsetbits_le32(pwr_base + PWR_D3CR, PWR_D3CR_VOS_MASK,
 			VOS_SCALE_1 << PWR_D3CR_VOS_SHIFT);
 	/* Lock supply configuration update */
+#if IS_ENABLED(CONFIG_TARGET_STM32H747_DISCO)
+	clrbits_le32(pwr_base + PWR_CR3, PWR_CR3_LDOEN);
+#else
 	clrbits_le32(pwr_base + PWR_CR3, PWR_CR3_SCUEN);
+#endif
 	while (!(readl(pwr_base + PWR_D3CR) & PWR_D3CR_VOSREADY))
 		;
 
diff --git a/include/configs/stm32h747-disco.h b/include/configs/stm32h747-disco.h
new file mode 100644
index 000000000000..393445a8ae1f
--- /dev/null
+++ b/include/configs/stm32h747-disco.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#ifndef __CONFIG_H
+#define __CONFIG_H
+
+#include <config.h>
+#include <linux/sizes.h>
+
+/* For booting Linux, use the first 16MB of memory */
+#define CFG_SYS_BOOTMAPSZ		SZ_16M
+
+#define CFG_SYS_FLASH_BASE		0x08000000
+
+#define CFG_SYS_HZ_CLOCK		1000000
+
+#define BOOT_TARGET_DEVICES(func) \
+	func(MMC, mmc, 0)
+
+#include <config_distro_bootcmd.h>
+#define CFG_EXTRA_ENV_SETTINGS				\
+			"kernel_addr_r=0xD0008000\0"		\
+			"fdtfile=stm32h747i-disco.dtb\0"	\
+			"fdt_addr_r=0xD0408000\0"		\
+			"scriptaddr=0xD0418000\0"		\
+			"pxefile_addr_r=0xD0428000\0" \
+			"ramdisk_addr_r=0xD0438000\0"		\
+			BOOTENV
+
+#endif /* __CONFIG_H */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
