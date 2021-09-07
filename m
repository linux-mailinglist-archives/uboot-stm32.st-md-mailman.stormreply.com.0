Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A64C4031AA
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1F69C597AA;
	Tue,  7 Sep 2021 23:59:42 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA3BCC59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:38 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id gf5so221823qvb.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4rGKX2nDeZTpiEwfKpxrbzc0dQJped8fqJlg5foC4Y=;
 b=CFF3kghvDa+oW1U4u/qm8qZErjWouCt6NgRfWuy2MJKQiusH93DN6uLeE/L3CWduF+
 saAFT2phw6kQ3HckhCgWypOCev7wU9UDSopBNXdHrwM4O3DHqpKwEP1noy/LCGp4R5+E
 KkS0EGmtg2ekSFWMqczWcZ4QnLV5an3NBUsY9q4fnbxknCxe6n/TSO770ulTFcakp7tq
 OPu9fgRrZX3D/NCkMlVXv868sAxW/ZmlGvXAUaf6hUwL2Hc4esMXF9qvW1uVZ7pfJJW1
 v3nUyD9joCsDdbpwD/qK2eLtE7ZnCSRsXVzxqNRLU1U34mGTi89XKP51jpKFQUWFb/1V
 t8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s4rGKX2nDeZTpiEwfKpxrbzc0dQJped8fqJlg5foC4Y=;
 b=JLopwHbWfOFuhpPqTq/nl0PJArbfGjJ/IvV8OitXePQJIhC6t+wl1ORIPeXZd+PJER
 WUHaGCcnZI/LKmI9dOAkatV3IoawnQVmZmEYHbeCUTZTXg54+bVnVoI0DZsQlxXPf2UA
 PgwNPhJHU7GV120928ODLOLq0gPl3p6ruKPwxhYBDeWB5N0yTZBsayHIWqQKBWXuvEfK
 pQKAUVPVCy0Gs7lvdJ+cIHj+/JLJfpNubuMG7cjjQQ5fBj29ICXOqz/Zs5dUW73uEHgh
 j3+r63fMiyPYPDkcSEfy29ac/cxF0n0mWDJLH5RK5FZ6YBA8Zo1l+lQgr4k+9EQRR23m
 6gmw==
X-Gm-Message-State: AOAM531lXtOQqq+1UsiF8GYH212JRvqIzSfPWj0xN+AqFdRgkOXwRTFO
 3Osdlxr9NO9DiqsEF6mC/Wc=
X-Google-Smtp-Source: ABdhPJzbqnTE/b1eDWuuJs0w7nvXjGScxDeyT3Poyt2umqgNRgjNYWKgrIda1GUglwBffU5e1lEVjg==
X-Received: by 2002:a0c:d450:: with SMTP id r16mr881731qvh.30.1631059177706;
 Tue, 07 Sep 2021 16:59:37 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:37 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:23 -0500
Message-Id: <20210907235933.2798330-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 01/11] spl: Move
	SYS_MMCSD_RAW_MODE_KERNEL_SECTOR to Kconfig
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

Although Falcon mode is very useful in improving boot speed, its
implementation is quite antiquated. A question that Falcon mode asks
is "Where do I look for the kernel". With MMC boot media, the correct
answer is CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR.

There are a few things to be said about the wisdom of using a raw
sector as opposed to more elegant schemes. However, changing how
falcon mode works is beyond the scope of this change.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 README                                    |  4 ----
 common/spl/Kconfig                        | 11 +++++++++++
 configs/am335x_boneblack_vboot_defconfig  |  1 +
 configs/am335x_evm_defconfig              |  1 +
 configs/am335x_igep003x_defconfig         |  1 +
 configs/am335x_shc_defconfig              |  1 +
 configs/am335x_shc_ict_defconfig          |  1 +
 configs/am335x_shc_netboot_defconfig      |  1 +
 configs/am335x_shc_sdboot_defconfig       |  1 +
 configs/am335x_sl50_defconfig             |  1 +
 configs/am3517_evm_defconfig              |  1 +
 configs/am43xx_evm_defconfig              |  1 +
 configs/am43xx_evm_rtconly_defconfig      |  1 +
 configs/am43xx_evm_usbhost_boot_defconfig |  1 +
 configs/am57xx_evm_defconfig              |  1 +
 configs/devkit8000_defconfig              |  1 +
 configs/display5_defconfig                |  1 +
 configs/display5_factory_defconfig        |  1 +
 configs/dra7xx_evm_defconfig              |  1 +
 configs/gwventana_emmc_defconfig          |  1 +
 configs/gwventana_gw5904_defconfig        |  1 +
 configs/gwventana_nand_defconfig          |  1 +
 configs/igep00x0_defconfig                |  1 +
 configs/imx6dl_mamoj_defconfig            |  1 +
 configs/imx6q_logic_defconfig             |  1 +
 configs/imx6qdl_icore_mipi_defconfig      |  1 +
 configs/imx6qdl_icore_mmc_defconfig       |  1 +
 configs/imx6qdl_icore_rqs_defconfig       |  1 +
 configs/mccmon6_nor_defconfig             |  1 +
 configs/omap35_logic_defconfig            |  1 +
 configs/omap35_logic_somlv_defconfig      |  1 +
 configs/omap3_logic_defconfig             |  1 +
 configs/omap3_logic_somlv_defconfig       |  1 +
 configs/omap4_panda_defconfig             |  1 +
 configs/omap5_uevm_defconfig              |  1 +
 include/configs/brppt1.h                  |  1 -
 include/configs/devkit8000.h              |  2 --
 include/configs/display5.h                |  1 -
 include/configs/embestmx6boards.h         |  1 -
 include/configs/gw_ventana.h              |  1 -
 include/configs/imx6-engicam.h            |  1 -
 include/configs/imx6_logic.h              |  1 -
 include/configs/imx6dl-mamoj.h            |  1 -
 include/configs/ls1043ardb.h              |  1 -
 include/configs/mccmon6.h                 |  1 -
 include/configs/mx6sabreauto.h            |  1 -
 include/configs/mx6sabresd.h              |  1 -
 include/configs/pico-imx6.h               |  1 -
 include/configs/pico-imx6ul.h             |  1 -
 include/configs/pico-imx7d.h              |  1 -
 include/configs/sama5d3_xplained.h        |  1 -
 include/configs/tam3517-common.h          |  1 -
 include/configs/ti_armv7_common.h         |  1 -
 include/configs/vyasa-rk3288.h            |  1 -
 include/configs/xea.h                     |  1 -
 include/configs/xilinx_zynqmp.h           |  1 -
 include/configs/zynq-common.h             |  1 -
 scripts/config_whitelist.txt              |  1 -
 58 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/README b/README
index 1c1db98098..7df53a9861 100644
--- a/README
+++ b/README
@@ -2182,10 +2182,6 @@ The following options need to be configured:
 		Partition on the MMC to load U-Boot from when the MMC is being
 		used in raw mode
 
-		CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR
-		Sector to load kernel uImage from when MMC is being
-		used in raw mode (for Falcon mode)
-
 		CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR,
 		CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS
 		Sector and number of sectors to load kernel argument
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index c155a3b5fc..1c6b57af49 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -990,6 +990,17 @@ config SYS_OS_BASE
 
 endif # SPL_OS_BOOT
 
+config SYS_MMCSD_RAW_MODE_KERNEL_SECTOR
+	hex "Falcon mode: Sector to load kernel uImage from MMC"
+	default 0x0
+	depends on SPL_OS_BOOT
+	help
+	  When Falcon mode is used with an MMC or SD media, SPL needs to know
+	  where to look for the kernel uImage. The image is expected to begin
+	  at the raw MMC specified in this config.
+	  Note that the Falcon mode image can also be a FIT, if FIT support is
+	  enabled.
+
 config SPL_PAYLOAD
 	string "SPL payload"
 	default "tpl/u-boot-with-tpl.bin" if TPL
diff --git a/configs/am335x_boneblack_vboot_defconfig b/configs/am335x_boneblack_vboot_defconfig
index e720e1d553..5683010ef2 100644
--- a/configs/am335x_boneblack_vboot_defconfig
+++ b/configs/am335x_boneblack_vboot_defconfig
@@ -24,6 +24,7 @@ CONFIG_SPL_MUSB_NEW=y
 CONFIG_SPL_NET_SUPPORT=y
 CONFIG_SPL_NET_VCI_STRING="AM33xx U-Boot SPL"
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_USB_GADGET=y
 CONFIG_SPL_USB_ETHER=y
 CONFIG_CMD_SPL=y
diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
index ef8de5999e..951cc76189 100644
--- a/configs/am335x_evm_defconfig
+++ b/configs/am335x_evm_defconfig
@@ -24,6 +24,7 @@ CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_NET_SUPPORT=y
 CONFIG_SPL_NET_VCI_STRING="AM335x U-Boot SPL"
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_USB_GADGET=y
 CONFIG_SPL_USB_ETHER=y
 CONFIG_CMD_SPL=y
diff --git a/configs/am335x_igep003x_defconfig b/configs/am335x_igep003x_defconfig
index 0ec6851f32..8b82fdcbc7 100644
--- a/configs/am335x_igep003x_defconfig
+++ b/configs/am335x_igep003x_defconfig
@@ -38,6 +38,7 @@ CONFIG_SPL_UBI_LOAD_MONITOR_ID=0
 CONFIG_SPL_UBI_LOAD_KERNEL_ID=3
 CONFIG_SPL_UBI_LOAD_ARGS_ID=4
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_shc_defconfig b/configs/am335x_shc_defconfig
index 0c4186daa4..2e15bd656f 100644
--- a/configs/am335x_shc_defconfig
+++ b/configs/am335x_shc_defconfig
@@ -30,6 +30,7 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_shc_ict_defconfig b/configs/am335x_shc_ict_defconfig
index 354586b70b..08553bb399 100644
--- a/configs/am335x_shc_ict_defconfig
+++ b/configs/am335x_shc_ict_defconfig
@@ -31,6 +31,7 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_shc_netboot_defconfig b/configs/am335x_shc_netboot_defconfig
index 43fef20380..0516f8de4e 100644
--- a/configs/am335x_shc_netboot_defconfig
+++ b/configs/am335x_shc_netboot_defconfig
@@ -32,6 +32,7 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_shc_sdboot_defconfig b/configs/am335x_shc_sdboot_defconfig
index 4010d83fec..b7e49b4e43 100644
--- a/configs/am335x_shc_sdboot_defconfig
+++ b/configs/am335x_shc_sdboot_defconfig
@@ -31,6 +31,7 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_sl50_defconfig b/configs/am335x_sl50_defconfig
index 1f3b680bd6..a19571b292 100644
--- a/configs/am335x_sl50_defconfig
+++ b/configs/am335x_sl50_defconfig
@@ -32,6 +32,7 @@ CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_NET_SUPPORT=y
 CONFIG_SPL_NET_VCI_STRING="AM335x U-Boot SPL"
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am3517_evm_defconfig b/configs/am3517_evm_defconfig
index 1234aa2251..1ccf25cb61 100644
--- a/configs/am3517_evm_defconfig
+++ b/configs/am3517_evm_defconfig
@@ -27,6 +27,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 # CONFIG_SPL_POWER is not set
 CONFIG_SYS_PROMPT="AM3517_EVM # "
 # CONFIG_CMD_IMI is not set
diff --git a/configs/am43xx_evm_defconfig b/configs/am43xx_evm_defconfig
index 5d35176890..55e5456c4e 100644
--- a/configs/am43xx_evm_defconfig
+++ b/configs/am43xx_evm_defconfig
@@ -23,6 +23,7 @@ CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_NET_SUPPORT=y
 CONFIG_SPL_NET_VCI_STRING="AM43xx U-Boot SPL"
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_USB_HOST=y
 CONFIG_SPL_USB_GADGET=y
 CONFIG_SPL_USB_ETHER=y
diff --git a/configs/am43xx_evm_rtconly_defconfig b/configs/am43xx_evm_rtconly_defconfig
index 955ea087ac..03c6ec4ee4 100644
--- a/configs/am43xx_evm_rtconly_defconfig
+++ b/configs/am43xx_evm_rtconly_defconfig
@@ -20,6 +20,7 @@ CONFIG_SPL_NAND_DRIVERS=y
 CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_CMD_SPL=y
 CONFIG_CMD_SPL_NAND_OFS=0x00100000
 CONFIG_CMD_SPL_WRITE_SIZE=0x40000
diff --git a/configs/am43xx_evm_usbhost_boot_defconfig b/configs/am43xx_evm_usbhost_boot_defconfig
index 98b07b9a19..848dd91f1c 100644
--- a/configs/am43xx_evm_usbhost_boot_defconfig
+++ b/configs/am43xx_evm_usbhost_boot_defconfig
@@ -19,6 +19,7 @@ CONFIG_SPL_NAND_DRIVERS=y
 CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_USB_HOST=y
 CONFIG_SPL_USB_STORAGE=y
 CONFIG_SPL_USB_GADGET=y
diff --git a/configs/am57xx_evm_defconfig b/configs/am57xx_evm_defconfig
index cc11323b9d..c8a131da6c 100644
--- a/configs/am57xx_evm_defconfig
+++ b/configs/am57xx_evm_defconfig
@@ -33,6 +33,7 @@ CONFIG_SPL_DMA=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x40000
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/devkit8000_defconfig b/configs/devkit8000_defconfig
index 2be548ea2c..02dba7896b 100644
--- a/configs/devkit8000_defconfig
+++ b/configs/devkit8000_defconfig
@@ -13,6 +13,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x500
 # CONFIG_CMD_IMI is not set
 CONFIG_CMD_SPL=y
 CONFIG_CMD_SPL_NAND_OFS=0x680000
diff --git a/configs/display5_defconfig b/configs/display5_defconfig
index d6541876f1..745ad6e1d6 100644
--- a/configs/display5_defconfig
+++ b/configs/display5_defconfig
@@ -41,6 +41,7 @@ CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_SAVEENV=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x100
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x20000
 CONFIG_SPL_WATCHDOG=y
diff --git a/configs/display5_factory_defconfig b/configs/display5_factory_defconfig
index 7dbed0473a..bcb62e6e88 100644
--- a/configs/display5_factory_defconfig
+++ b/configs/display5_factory_defconfig
@@ -38,6 +38,7 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x100
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x20000
 CONFIG_SPL_USB_HOST=y
diff --git a/configs/dra7xx_evm_defconfig b/configs/dra7xx_evm_defconfig
index 0c253da80c..a1f6d5668b 100644
--- a/configs/dra7xx_evm_defconfig
+++ b/configs/dra7xx_evm_defconfig
@@ -34,6 +34,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x40000
diff --git a/configs/gwventana_emmc_defconfig b/configs/gwventana_emmc_defconfig
index 9e764f40a2..2ecd48a49c 100644
--- a/configs/gwventana_emmc_defconfig
+++ b/configs/gwventana_emmc_defconfig
@@ -40,6 +40,7 @@ CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/gwventana_gw5904_defconfig b/configs/gwventana_gw5904_defconfig
index bab61e7daa..5602437d56 100644
--- a/configs/gwventana_gw5904_defconfig
+++ b/configs/gwventana_gw5904_defconfig
@@ -40,6 +40,7 @@ CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/gwventana_nand_defconfig b/configs/gwventana_nand_defconfig
index e59efebab7..cc31c394be 100644
--- a/configs/gwventana_nand_defconfig
+++ b/configs/gwventana_nand_defconfig
@@ -41,6 +41,7 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/igep00x0_defconfig b/configs/igep00x0_defconfig
index a3b97e512c..0194102daa 100644
--- a/configs/igep00x0_defconfig
+++ b/configs/igep00x0_defconfig
@@ -35,6 +35,7 @@ CONFIG_SPL_UBI_LOAD_KERNEL_ID=3
 CONFIG_SPL_UBI_LOAD_ARGS_ID=4
 CONFIG_SPL_ONENAND_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_CMD_SPL=y
 # CONFIG_CMD_FLASH is not set
 CONFIG_CMD_NAND=y
diff --git a/configs/imx6dl_mamoj_defconfig b/configs/imx6dl_mamoj_defconfig
index 48f0c0356d..9a33f99fba 100644
--- a/configs/imx6dl_mamoj_defconfig
+++ b/configs/imx6dl_mamoj_defconfig
@@ -16,6 +16,7 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
 CONFIG_BOOTDELAY=3
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_CMD_SPL=y
 CONFIG_CRC32_VERIFY=y
 CONFIG_CMD_MEMTEST=y
diff --git a/configs/imx6q_logic_defconfig b/configs/imx6q_logic_defconfig
index ed8db745b6..bfb6dd3845 100644
--- a/configs/imx6q_logic_defconfig
+++ b/configs/imx6q_logic_defconfig
@@ -33,6 +33,7 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_USB_HOST=y
 CONFIG_SPL_USB_GADGET=y
 CONFIG_SPL_USB_SDP_SUPPORT=y
diff --git a/configs/imx6qdl_icore_mipi_defconfig b/configs/imx6qdl_icore_mipi_defconfig
index d3191a250a..35add6b87f 100644
--- a/configs/imx6qdl_icore_mipi_defconfig
+++ b/configs/imx6qdl_icore_mipi_defconfig
@@ -30,6 +30,7 @@ CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
 CONFIG_BOOTDELAY=3
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="icorem6qdl-mipi> "
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index 76375ae911..bf74b0c4bf 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -33,6 +33,7 @@ CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
 CONFIG_BOOTDELAY=3
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="icorem6qdl> "
diff --git a/configs/imx6qdl_icore_rqs_defconfig b/configs/imx6qdl_icore_rqs_defconfig
index 328e68d20a..b305014359 100644
--- a/configs/imx6qdl_icore_rqs_defconfig
+++ b/configs/imx6qdl_icore_rqs_defconfig
@@ -27,6 +27,7 @@ CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
 CONFIG_BOOTDELAY=3
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="icorem6qdl-rqs> "
diff --git a/configs/mccmon6_nor_defconfig b/configs/mccmon6_nor_defconfig
index 2c82e3ca45..ac216ceb15 100644
--- a/configs/mccmon6_nor_defconfig
+++ b/configs/mccmon6_nor_defconfig
@@ -28,6 +28,7 @@ CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_NOR_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
 CONFIG_SYS_OS_BASE=0x8180000
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_CMD_SPL=y
 CONFIG_CMD_SPL_NOR_OFS=0x09600000
 CONFIG_CMD_SPL_WRITE_SIZE=0x20000
diff --git a/configs/omap35_logic_defconfig b/configs/omap35_logic_defconfig
index 8b0c943024..71e3dd024d 100644
--- a/configs/omap35_logic_defconfig
+++ b/configs/omap35_logic_defconfig
@@ -30,6 +30,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SYS_PROMPT="OMAP Logic # "
 # CONFIG_CMD_IMI is not set
 CONFIG_CMD_SPL=y
diff --git a/configs/omap35_logic_somlv_defconfig b/configs/omap35_logic_somlv_defconfig
index 2ab92551e4..ad1f60834f 100644
--- a/configs/omap35_logic_somlv_defconfig
+++ b/configs/omap35_logic_somlv_defconfig
@@ -30,6 +30,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 # CONFIG_SPL_POWER is not set
 CONFIG_SYS_PROMPT="OMAP Logic # "
 # CONFIG_CMD_IMI is not set
diff --git a/configs/omap3_logic_defconfig b/configs/omap3_logic_defconfig
index ec7a8a6e37..b02067529d 100644
--- a/configs/omap3_logic_defconfig
+++ b/configs/omap3_logic_defconfig
@@ -30,6 +30,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SYS_PROMPT="OMAP Logic # "
 # CONFIG_CMD_IMI is not set
 CONFIG_CMD_SPL=y
diff --git a/configs/omap3_logic_somlv_defconfig b/configs/omap3_logic_somlv_defconfig
index f2e9d20e8f..544ba8a6a7 100644
--- a/configs/omap3_logic_somlv_defconfig
+++ b/configs/omap3_logic_somlv_defconfig
@@ -30,6 +30,7 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 # CONFIG_SPL_POWER is not set
 CONFIG_SYS_PROMPT="OMAP Logic # "
 # CONFIG_CMD_IMI is not set
diff --git a/configs/omap4_panda_defconfig b/configs/omap4_panda_defconfig
index 3585566cc0..f79c0f22e6 100644
--- a/configs/omap4_panda_defconfig
+++ b/configs/omap4_panda_defconfig
@@ -15,6 +15,7 @@ CONFIG_SYS_CONSOLE_INFO_QUIET=y
 # CONFIG_SPL_I2C is not set
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_CMD_SPL=y
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GPIO=y
diff --git a/configs/omap5_uevm_defconfig b/configs/omap5_uevm_defconfig
index 16264ae457..59719fa2dc 100644
--- a/configs/omap5_uevm_defconfig
+++ b/configs/omap5_uevm_defconfig
@@ -16,6 +16,7 @@ CONFIG_DEFAULT_FDT_FILE="omap5-uevm.dtb"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_CMD_SPL=y
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_DFU=y
diff --git a/include/configs/brppt1.h b/include/configs/brppt1.h
index f9a0632e54..5de6cb296d 100644
--- a/include/configs/brppt1.h
+++ b/include/configs/brppt1.h
@@ -42,7 +42,6 @@
 #define CONFIG_SYS_SPL_ARGS_ADDR		0x80F80000
 
 /* RAW SD card / eMMC */
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x900	/* address 0x120000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x80	/* address 0x10000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0x80	/* 64KiB */
 
diff --git a/include/configs/devkit8000.h b/include/configs/devkit8000.h
index 87da4410f5..811fa76935 100644
--- a/include/configs/devkit8000.h
+++ b/include/configs/devkit8000.h
@@ -159,10 +159,8 @@
 /* SPL OS boot options */
 #define CONFIG_SYS_NAND_SPL_KERNEL_OFFS 0x280000
 
-#undef CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR
 #undef CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR
 #undef CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x500 /* address 0xa0000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x8   /* address 0x1000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	8     /* 4KB */
 
diff --git a/include/configs/display5.h b/include/configs/display5.h
index 40bb3b53a5..eb1be9e27b 100644
--- a/include/configs/display5.h
+++ b/include/configs/display5.h
@@ -16,7 +16,6 @@
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x3F00
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	\
 	(CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x100	/* 128KiB */
 
 /*
  * display5 SPI-NOR memory layout
diff --git a/include/configs/embestmx6boards.h b/include/configs/embestmx6boards.h
index 401b50d51b..3fc0b43760 100644
--- a/include/configs/embestmx6boards.h
+++ b/include/configs/embestmx6boards.h
@@ -77,7 +77,6 @@
 #define CONFIG_SPL_FS_LOAD_KERNEL_NAME "uImage"
 #define CONFIG_SPL_FS_LOAD_ARGS_NAME "imx6dl-riotboard.dtb"
 
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0 /* offset 69KB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0 /* offset 69KB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS 0 /* offset 69KB */
 
diff --git a/include/configs/gw_ventana.h b/include/configs/gw_ventana.h
index 4f27273634..7b8a0ff524 100644
--- a/include/configs/gw_ventana.h
+++ b/include/configs/gw_ventana.h
@@ -19,7 +19,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x800	/* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	(CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x1000	/* 2MB */
 
 #include "imx6_spl.h"                  /* common IMX6 SPL configuration */
 #include "mx6_common.h"
diff --git a/include/configs/imx6-engicam.h b/include/configs/imx6-engicam.h
index bfe83b8cba..5af856948a 100644
--- a/include/configs/imx6-engicam.h
+++ b/include/configs/imx6-engicam.h
@@ -158,7 +158,6 @@
 /* MMC support: args@1MB kernel@2MB */
 # define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR		0x800   /* 1MB */
 # define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS		(CONFIG_CMD_SPL_WRITE_SIZE / 512)
-# define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x1000  /* 2MB */
 #endif
 
 /* Framebuffer */
diff --git a/include/configs/imx6_logic.h b/include/configs/imx6_logic.h
index 6b992f9ab8..a1e220b407 100644
--- a/include/configs/imx6_logic.h
+++ b/include/configs/imx6_logic.h
@@ -161,6 +161,5 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 
 #endif                         /* __IMX6LOGIC_CONFIG_H */
diff --git a/include/configs/imx6dl-mamoj.h b/include/configs/imx6dl-mamoj.h
index 4027f329d3..8d5c844d11 100644
--- a/include/configs/imx6dl-mamoj.h
+++ b/include/configs/imx6dl-mamoj.h
@@ -61,7 +61,6 @@
 /* MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR		0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS		(CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR		0x1000  /* 2MB */
 
 /* Miscellaneous configurable options */
 
diff --git a/include/configs/ls1043ardb.h b/include/configs/ls1043ardb.h
index 84b83e6259..eb1b5390fb 100644
--- a/include/configs/ls1043ardb.h
+++ b/include/configs/ls1043ardb.h
@@ -36,7 +36,6 @@
 #ifdef CONFIG_SD_BOOT
 #define CONFIG_SYS_FSL_PBL_RCW board/freescale/ls1043ardb/ls1043ardb_rcw_sd.cfg
 #define CONFIG_SYS_SPL_ARGS_ADDR	0x90000000
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x10000
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x500
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	30
 #endif
diff --git a/include/configs/mccmon6.h b/include/configs/mccmon6.h
index 0c383e94cc..398b472474 100644
--- a/include/configs/mccmon6.h
+++ b/include/configs/mccmon6.h
@@ -22,7 +22,6 @@
  */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR (0x800)
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (0x80)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR (0x1000)
 #define CONFIG_SPL_FS_LOAD_KERNEL_NAME "fitImage"
 
 /* Size of malloc() pool */
diff --git a/include/configs/mx6sabreauto.h b/include/configs/mx6sabreauto.h
index 626dbd55d7..a9ea4e20e8 100644
--- a/include/configs/mx6sabreauto.h
+++ b/include/configs/mx6sabreauto.h
@@ -36,7 +36,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 #endif
 
 #ifdef CONFIG_MTD_NOR_FLASH
diff --git a/include/configs/mx6sabresd.h b/include/configs/mx6sabresd.h
index 9546887182..022aeddc0f 100644
--- a/include/configs/mx6sabresd.h
+++ b/include/configs/mx6sabresd.h
@@ -26,7 +26,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 
 #define CONFIG_SYS_FSL_USDHC_NUM	3
 
diff --git a/include/configs/pico-imx6.h b/include/configs/pico-imx6.h
index 6199f0d72e..4bf1d6d865 100644
--- a/include/configs/pico-imx6.h
+++ b/include/configs/pico-imx6.h
@@ -21,7 +21,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 #endif
 
 /* Size of malloc() pool */
diff --git a/include/configs/pico-imx6ul.h b/include/configs/pico-imx6ul.h
index 04a2531f74..9fb202c640 100644
--- a/include/configs/pico-imx6ul.h
+++ b/include/configs/pico-imx6ul.h
@@ -23,7 +23,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 #endif
 
 /* Network support */
diff --git a/include/configs/pico-imx7d.h b/include/configs/pico-imx7d.h
index f5d2c23400..edc7f96583 100644
--- a/include/configs/pico-imx7d.h
+++ b/include/configs/pico-imx7d.h
@@ -21,7 +21,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 #endif
 
 /* Size of malloc() pool */
diff --git a/include/configs/sama5d3_xplained.h b/include/configs/sama5d3_xplained.h
index 4c25964b43..9827ebda11 100644
--- a/include/configs/sama5d3_xplained.h
+++ b/include/configs/sama5d3_xplained.h
@@ -83,7 +83,6 @@
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x100  /* 128 KiB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	(CONFIG_CMD_SPL_WRITE_SIZE / 512)
 /* U-Boot proper stored by default at 0x200 (256 KiB) */
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x1000 /* 2MB */
 #define CONFIG_SYS_SPL_ARGS_ADDR		0x22000000
 
 /* Falcon boot support on FAT on MMC */
diff --git a/include/configs/tam3517-common.h b/include/configs/tam3517-common.h
index 41efb64752..5641d9ccd2 100644
--- a/include/configs/tam3517-common.h
+++ b/include/configs/tam3517-common.h
@@ -140,7 +140,6 @@
 #define CONFIG_SPL_FS_LOAD_ARGS_NAME		"args"
 
 /* RAW SD card / eMMC */
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x900	/* address 0x120000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x80	/* address 0x10000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0x80	/* 64KiB */
 
diff --git a/include/configs/ti_armv7_common.h b/include/configs/ti_armv7_common.h
index 4fcf741c0a..31bf53fc26 100644
--- a/include/configs/ti_armv7_common.h
+++ b/include/configs/ti_armv7_common.h
@@ -170,7 +170,6 @@
 #define CONFIG_SPL_FS_LOAD_ARGS_NAME		"args"
 
 /* RAW SD card / eMMC */
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x1700  /* address 0x2E0000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x1500  /* address 0x2A0000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0x200   /* 256KiB */
 #endif
diff --git a/include/configs/vyasa-rk3288.h b/include/configs/vyasa-rk3288.h
index 3dc10b29c3..8176719561 100644
--- a/include/configs/vyasa-rk3288.h
+++ b/include/configs/vyasa-rk3288.h
@@ -32,7 +32,6 @@
 /* Falcon Mode - MMC support: args@16MB kernel@17MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR		0x8000	/* 16MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS		(CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR		0x8800	/* 17MB */
 #endif
 
 #endif
diff --git a/include/configs/xea.h b/include/configs/xea.h
index 1207f75017..2a735a424e 100644
--- a/include/configs/xea.h
+++ b/include/configs/xea.h
@@ -27,7 +27,6 @@
 
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	(SZ_512K / 0x200)
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	(SZ_32K / 0x200)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	(SZ_1M / 0x200)
 
 #ifndef CONFIG_SPL_BUILD
 #define CONFIG_SPI_FLASH_MTD
diff --git a/include/configs/xilinx_zynqmp.h b/include/configs/xilinx_zynqmp.h
index 262154cdff..d9e90c0825 100644
--- a/include/configs/xilinx_zynqmp.h
+++ b/include/configs/xilinx_zynqmp.h
@@ -248,7 +248,6 @@
 #ifdef CONFIG_MMC_SDHCI_ZYNQ
 # define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0 /* unused */
 # define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0 /* unused */
-# define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0 /* unused */
 # if defined(CONFIG_SPL_LOAD_FIT)
 #  define CONFIG_SPL_FS_LOAD_PAYLOAD_NAME	"u-boot.itb"
 # else
diff --git a/include/configs/zynq-common.h b/include/configs/zynq-common.h
index 7859b77603..3b5d4655da 100644
--- a/include/configs/zynq-common.h
+++ b/include/configs/zynq-common.h
@@ -238,7 +238,6 @@
 /* Not using MMC raw mode - just for compilation purpose */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0
 
 /* qspi mode is working fine */
 #ifdef CONFIG_ZYNQ_QSPI
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index d86f35856f..48a74f0ec4 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -2567,7 +2567,6 @@ CONFIG_SYS_MII_MODE
 CONFIG_SYS_MIPS_TIMER_FREQ
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR
 CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS
-CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR
 CONFIG_SYS_MMC_CD_PIN
 CONFIG_SYS_MMC_CLK_OD
 CONFIG_SYS_MMC_MAX_BLK_COUNT
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
