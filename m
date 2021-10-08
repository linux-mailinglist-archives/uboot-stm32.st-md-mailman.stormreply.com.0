Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D5542719F
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBDA2C597B4;
	Fri,  8 Oct 2021 19:57:04 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A158C597B4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:02 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 g15-20020a9d128f000000b0054e3d55dd81so7864661otg.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W5IhnSNp0+hVrZIGM1UDRXtz7Qs/Ww8gL4tZIgzMYy0=;
 b=FAe+C+FTma8XQFYYztAUMqF5+PqK80rbD110XwUHQuQwEJu7GPMWSNP0ENFqBIctS9
 vGb17D3fdZREMntl4FZThxs8A32OBvkG4AB+za7A9vfoCNi6ZmHsxNHrjDlhvT9Xpdot
 lkhKVqF/3Mwjsqe54guOjLdfp8jS+BL/Ci4OkztRJbFZ8nauk9MHXOrOQiaGfrfCEhr/
 dn6NO0T06D4gB0AP+G0B9RUT31PdGen8cj+Rrt/uDQ0d8nNTcxO1TGMP3svBrmmcuaMZ
 WJw1gXT7vqjtM4XhKv7Qsl3zWDuEo3bIonXw554tl3HtRyLcCNAk4B61wBxzpdoGpJUC
 cMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W5IhnSNp0+hVrZIGM1UDRXtz7Qs/Ww8gL4tZIgzMYy0=;
 b=ziEncBedsVXWH6qILZrOJ90AFxKufNAWeGsVnTTVLYWW42YK/fjPh8+4BpAhicXnMX
 xbm96xhHWceq7rvlM14AUARKYlVtkFMGFlVZ73fP/KZAQJ+VzFEaRjo/NmRWtv8YnY51
 p76JQsuPK0Agv91CpBzUlxTN6sFyWnCIJ5c8STiVdKssD146YAEbaqsMYxfqO0sd9tbi
 F4gtb5e7mz6OfkKKQ9/nz80z+hT4DpY4agxyznodkYAxVz7wHj4qJhuwFUSY6acDgI1A
 76/h4WuSZOyh8R+tcTpbTskW4OpNzpATNOSEver673YAzPL0i/6y8mWj2pbbvchtJNmC
 gC/A==
X-Gm-Message-State: AOAM532L3EvlNvDJZalSslsKzpnDtOGE5c6Nz8WCrB36Pf5XB6GxTgpK
 IfUM0Pf3xROpJPxP2KUQhx8=
X-Google-Smtp-Source: ABdhPJzyNn9ohMslSAXGpAVHCxxHSYBszAymUA9qKV8F/3K+lKJGapbOyiQm46u8jM+v/Jo8IO+t1Q==
X-Received: by 2002:a9d:725e:: with SMTP id a30mr10097111otk.183.1633723021409; 
 Fri, 08 Oct 2021 12:57:01 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:00 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:44 -0500
Message-Id: <20211008195655.46046-3-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 02/13] spl: Move
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

The predicate to enable mmc_load_image_raw_os() is changed from
SPL_OS_BOOT to SPL_FALCON_BOOT_MMCSD. It is possible for a system to
support Falcon mode from NOR but not MMC. In that case, it doesn't
make sense to have mmc_load_image_raw_os().

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 README                                    |  4 ----
 common/spl/Kconfig                        | 16 ++++++++++++++++
 common/spl/spl_mmc.c                      |  2 +-
 configs/am335x_boneblack_vboot_defconfig  |  2 ++
 configs/am335x_evm_defconfig              |  2 ++
 configs/am335x_igep003x_defconfig         |  2 ++
 configs/am335x_shc_defconfig              |  2 ++
 configs/am335x_shc_ict_defconfig          |  2 ++
 configs/am335x_shc_netboot_defconfig      |  2 ++
 configs/am335x_shc_sdboot_defconfig       |  2 ++
 configs/am335x_sl50_defconfig             |  2 ++
 configs/am3517_evm_defconfig              |  2 ++
 configs/am43xx_evm_defconfig              |  2 ++
 configs/am43xx_evm_rtconly_defconfig      |  2 ++
 configs/am43xx_evm_usbhost_boot_defconfig |  2 ++
 configs/am57xx_evm_defconfig              |  2 ++
 configs/devkit8000_defconfig              |  2 ++
 configs/display5_defconfig                |  2 ++
 configs/display5_factory_defconfig        |  2 ++
 configs/dra7xx_evm_defconfig              |  2 ++
 configs/gwventana_emmc_defconfig          |  2 ++
 configs/gwventana_gw5904_defconfig        |  2 ++
 configs/gwventana_nand_defconfig          |  2 ++
 configs/igep00x0_defconfig                |  2 ++
 configs/imx6dl_mamoj_defconfig            |  2 ++
 configs/imx6q_logic_defconfig             |  2 ++
 configs/omap35_logic_defconfig            |  2 ++
 configs/omap35_logic_somlv_defconfig      |  2 ++
 configs/omap3_logic_defconfig             |  2 ++
 configs/omap3_logic_somlv_defconfig       |  2 ++
 configs/omap4_panda_defconfig             |  2 ++
 configs/omap5_uevm_defconfig              |  2 ++
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
 55 files changed, 75 insertions(+), 29 deletions(-)

diff --git a/README b/README
index 840b192aae..7e33ad79ff 100644
--- a/README
+++ b/README
@@ -2020,10 +2020,6 @@ The following options need to be configured:
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
index 8a8a971a91..39745a216f 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -918,6 +918,22 @@ config SYS_OS_BASE
 
 endif # SPL_OS_BOOT
 
+config SPL_FALCON_BOOT_MMCSD
+	bool "Enable Falcon boot from MMC or SD media"
+	depends on SPL_OS_BOOT && SPL_MMC
+	help
+	  Select this if the Falcon mode OS image mode is on MMC or SD media.
+
+config SYS_MMCSD_RAW_MODE_KERNEL_SECTOR
+	hex "Falcon mode: Sector to load kernel uImage from MMC"
+	depends on SPL_FALCON_BOOT_MMCSD
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
diff --git a/common/spl/spl_mmc.c b/common/spl/spl_mmc.c
index a9a588b04f..000e4ecf0b 100644
--- a/common/spl/spl_mmc.c
+++ b/common/spl/spl_mmc.c
@@ -218,7 +218,7 @@ static int mmc_load_image_raw_partition(struct spl_image_info *spl_image,
 }
 #endif
 
-#ifdef CONFIG_SPL_OS_BOOT
+#ifdef CONFIG_SPL_FALCON_BOOT_MMCSD
 static int mmc_load_image_raw_os(struct spl_image_info *spl_image,
 				 struct mmc *mmc)
 {
diff --git a/configs/am335x_boneblack_vboot_defconfig b/configs/am335x_boneblack_vboot_defconfig
index f0b197a050..5a6dd046bd 100644
--- a/configs/am335x_boneblack_vboot_defconfig
+++ b/configs/am335x_boneblack_vboot_defconfig
@@ -24,6 +24,8 @@ CONFIG_SPL_MUSB_NEW=y
 CONFIG_SPL_NET=y
 CONFIG_SPL_NET_VCI_STRING="AM33xx U-Boot SPL"
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_USB_GADGET=y
 CONFIG_SPL_USB_ETHER=y
 CONFIG_CMD_SPL=y
diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
index 0f938e7de3..39cc7b3f33 100644
--- a/configs/am335x_evm_defconfig
+++ b/configs/am335x_evm_defconfig
@@ -24,6 +24,8 @@ CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_NET=y
 CONFIG_SPL_NET_VCI_STRING="AM335x U-Boot SPL"
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_USB_GADGET=y
 CONFIG_SPL_USB_ETHER=y
 CONFIG_CMD_SPL=y
diff --git a/configs/am335x_igep003x_defconfig b/configs/am335x_igep003x_defconfig
index 9a6f71dc6c..ad16fab378 100644
--- a/configs/am335x_igep003x_defconfig
+++ b/configs/am335x_igep003x_defconfig
@@ -37,6 +37,8 @@ CONFIG_SPL_UBI_LOAD_MONITOR_ID=0
 CONFIG_SPL_UBI_LOAD_KERNEL_ID=3
 CONFIG_SPL_UBI_LOAD_ARGS_ID=4
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_shc_defconfig b/configs/am335x_shc_defconfig
index 4169d13d2a..03c47f5bcb 100644
--- a/configs/am335x_shc_defconfig
+++ b/configs/am335x_shc_defconfig
@@ -30,6 +30,8 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_shc_ict_defconfig b/configs/am335x_shc_ict_defconfig
index 1d25adf7cd..9e4463b10d 100644
--- a/configs/am335x_shc_ict_defconfig
+++ b/configs/am335x_shc_ict_defconfig
@@ -31,6 +31,8 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_shc_netboot_defconfig b/configs/am335x_shc_netboot_defconfig
index 0ab3acb77e..9cd5993326 100644
--- a/configs/am335x_shc_netboot_defconfig
+++ b/configs/am335x_shc_netboot_defconfig
@@ -32,6 +32,8 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_shc_sdboot_defconfig b/configs/am335x_shc_sdboot_defconfig
index 914f21cb7c..7e0b6dfb46 100644
--- a/configs/am335x_shc_sdboot_defconfig
+++ b/configs/am335x_shc_sdboot_defconfig
@@ -31,6 +31,8 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am335x_sl50_defconfig b/configs/am335x_sl50_defconfig
index aa1e196d40..6cfcbc6e6d 100644
--- a/configs/am335x_sl50_defconfig
+++ b/configs/am335x_sl50_defconfig
@@ -32,6 +32,8 @@ CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_NET=y
 CONFIG_SPL_NET_VCI_STRING="AM335x U-Boot SPL"
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/am3517_evm_defconfig b/configs/am3517_evm_defconfig
index 1bdebf5b7f..e4e39a3f4b 100644
--- a/configs/am3517_evm_defconfig
+++ b/configs/am3517_evm_defconfig
@@ -27,6 +27,8 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 # CONFIG_SPL_POWER is not set
 CONFIG_SYS_PROMPT="AM3517_EVM # "
 # CONFIG_CMD_IMI is not set
diff --git a/configs/am43xx_evm_defconfig b/configs/am43xx_evm_defconfig
index 108db834c4..fe68dc295b 100644
--- a/configs/am43xx_evm_defconfig
+++ b/configs/am43xx_evm_defconfig
@@ -24,6 +24,8 @@ CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_NET=y
 CONFIG_SPL_NET_VCI_STRING="AM43xx U-Boot SPL"
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_USB_HOST=y
 CONFIG_SPL_USB_GADGET=y
 CONFIG_SPL_USB_ETHER=y
diff --git a/configs/am43xx_evm_rtconly_defconfig b/configs/am43xx_evm_rtconly_defconfig
index f558fd503a..b97fd1f1fc 100644
--- a/configs/am43xx_evm_rtconly_defconfig
+++ b/configs/am43xx_evm_rtconly_defconfig
@@ -21,6 +21,8 @@ CONFIG_SPL_NAND_DRIVERS=y
 CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_CMD_SPL=y
 CONFIG_CMD_SPL_NAND_OFS=0x00100000
 CONFIG_CMD_SPL_WRITE_SIZE=0x40000
diff --git a/configs/am43xx_evm_usbhost_boot_defconfig b/configs/am43xx_evm_usbhost_boot_defconfig
index 0b91f3a5f0..fd0bd25b67 100644
--- a/configs/am43xx_evm_usbhost_boot_defconfig
+++ b/configs/am43xx_evm_usbhost_boot_defconfig
@@ -20,6 +20,8 @@ CONFIG_SPL_NAND_DRIVERS=y
 CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_USB_HOST=y
 CONFIG_SPL_USB_STORAGE=y
 CONFIG_SPL_USB_GADGET=y
diff --git a/configs/am57xx_evm_defconfig b/configs/am57xx_evm_defconfig
index 9a038a6bc6..69f950c89a 100644
--- a/configs/am57xx_evm_defconfig
+++ b/configs/am57xx_evm_defconfig
@@ -33,6 +33,8 @@ CONFIG_SPL_DMA=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x40000
 CONFIG_SPL_YMODEM_SUPPORT=y
diff --git a/configs/devkit8000_defconfig b/configs/devkit8000_defconfig
index ccdd4f606f..1ed936862f 100644
--- a/configs/devkit8000_defconfig
+++ b/configs/devkit8000_defconfig
@@ -14,6 +14,8 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x500
 # CONFIG_CMD_IMI is not set
 CONFIG_CMD_SPL=y
 CONFIG_CMD_SPL_NAND_OFS=0x680000
diff --git a/configs/display5_defconfig b/configs/display5_defconfig
index a49bf33179..4d69407936 100644
--- a/configs/display5_defconfig
+++ b/configs/display5_defconfig
@@ -41,6 +41,8 @@ CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_SAVEENV=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x100
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x20000
 CONFIG_SPL_WATCHDOG=y
diff --git a/configs/display5_factory_defconfig b/configs/display5_factory_defconfig
index 5a2e478c48..9cb3130c80 100644
--- a/configs/display5_factory_defconfig
+++ b/configs/display5_factory_defconfig
@@ -38,6 +38,8 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x100
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x20000
 CONFIG_SPL_USB_HOST=y
diff --git a/configs/dra7xx_evm_defconfig b/configs/dra7xx_evm_defconfig
index 19f5563e15..9e4c6337c8 100644
--- a/configs/dra7xx_evm_defconfig
+++ b/configs/dra7xx_evm_defconfig
@@ -34,6 +34,8 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x40000
diff --git a/configs/gwventana_emmc_defconfig b/configs/gwventana_emmc_defconfig
index 000bdb5949..c2de658bc6 100644
--- a/configs/gwventana_emmc_defconfig
+++ b/configs/gwventana_emmc_defconfig
@@ -43,6 +43,8 @@ CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/gwventana_gw5904_defconfig b/configs/gwventana_gw5904_defconfig
index 87851f3524..e2da3677e2 100644
--- a/configs/gwventana_gw5904_defconfig
+++ b/configs/gwventana_gw5904_defconfig
@@ -43,6 +43,8 @@ CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/gwventana_nand_defconfig b/configs/gwventana_nand_defconfig
index 8ff8ab472e..45539ad56d 100644
--- a/configs/gwventana_nand_defconfig
+++ b/configs/gwventana_nand_defconfig
@@ -44,6 +44,8 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_POWER=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/igep00x0_defconfig b/configs/igep00x0_defconfig
index 8f6e13e2a8..3a73e5df47 100644
--- a/configs/igep00x0_defconfig
+++ b/configs/igep00x0_defconfig
@@ -35,6 +35,8 @@ CONFIG_SPL_UBI_LOAD_KERNEL_ID=3
 CONFIG_SPL_UBI_LOAD_ARGS_ID=4
 CONFIG_SPL_ONENAND_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_CMD_SPL=y
 # CONFIG_CMD_FLASH is not set
 CONFIG_CMD_NAND=y
diff --git a/configs/imx6dl_mamoj_defconfig b/configs/imx6dl_mamoj_defconfig
index 70268d0ab5..74dc262d22 100644
--- a/configs/imx6dl_mamoj_defconfig
+++ b/configs/imx6dl_mamoj_defconfig
@@ -16,6 +16,8 @@ CONFIG_IMX_HAB=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=3
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_CMD_SPL=y
 CONFIG_CRC32_VERIFY=y
 CONFIG_CMD_MEMTEST=y
diff --git a/configs/imx6q_logic_defconfig b/configs/imx6q_logic_defconfig
index f9d472eacd..bfc95a2cdf 100644
--- a/configs/imx6q_logic_defconfig
+++ b/configs/imx6q_logic_defconfig
@@ -33,6 +33,8 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1000
 CONFIG_SPL_USB_HOST=y
 CONFIG_SPL_USB_GADGET=y
 CONFIG_SPL_USB_SDP_SUPPORT=y
diff --git a/configs/omap35_logic_defconfig b/configs/omap35_logic_defconfig
index 9d8ac94d2a..5e6b0fe120 100644
--- a/configs/omap35_logic_defconfig
+++ b/configs/omap35_logic_defconfig
@@ -30,6 +30,8 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SYS_PROMPT="OMAP Logic # "
 # CONFIG_CMD_IMI is not set
 CONFIG_CMD_SPL=y
diff --git a/configs/omap35_logic_somlv_defconfig b/configs/omap35_logic_somlv_defconfig
index ee0c58ad2b..1803d6dd8b 100644
--- a/configs/omap35_logic_somlv_defconfig
+++ b/configs/omap35_logic_somlv_defconfig
@@ -30,6 +30,8 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 # CONFIG_SPL_POWER is not set
 CONFIG_SYS_PROMPT="OMAP Logic # "
 # CONFIG_CMD_IMI is not set
diff --git a/configs/omap3_logic_defconfig b/configs/omap3_logic_defconfig
index becf862dcb..8437451390 100644
--- a/configs/omap3_logic_defconfig
+++ b/configs/omap3_logic_defconfig
@@ -30,6 +30,8 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_SYS_PROMPT="OMAP Logic # "
 # CONFIG_CMD_IMI is not set
 CONFIG_CMD_SPL=y
diff --git a/configs/omap3_logic_somlv_defconfig b/configs/omap3_logic_somlv_defconfig
index ece92fef61..61e40366d4 100644
--- a/configs/omap3_logic_somlv_defconfig
+++ b/configs/omap3_logic_somlv_defconfig
@@ -30,6 +30,8 @@ CONFIG_SPL_NAND_ECC=y
 CONFIG_SPL_NAND_SIMPLE=y
 CONFIG_SPL_NAND_BASE=y
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 # CONFIG_SPL_POWER is not set
 CONFIG_SYS_PROMPT="OMAP Logic # "
 # CONFIG_CMD_IMI is not set
diff --git a/configs/omap4_panda_defconfig b/configs/omap4_panda_defconfig
index 8c6baaf4fd..13df606cc4 100644
--- a/configs/omap4_panda_defconfig
+++ b/configs/omap4_panda_defconfig
@@ -15,6 +15,8 @@ CONFIG_SYS_CONSOLE_INFO_QUIET=y
 # CONFIG_SPL_I2C is not set
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_CMD_SPL=y
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GPIO=y
diff --git a/configs/omap5_uevm_defconfig b/configs/omap5_uevm_defconfig
index 0280b4ac8d..f5937783ef 100644
--- a/configs/omap5_uevm_defconfig
+++ b/configs/omap5_uevm_defconfig
@@ -16,6 +16,8 @@ CONFIG_DEFAULT_FDT_FILE="omap5-uevm.dtb"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 # CONFIG_SPL_NAND_SUPPORT is not set
 CONFIG_SPL_OS_BOOT=y
+CONFIG_SPL_FALCON_BOOT_MMCSD=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1700
 CONFIG_CMD_SPL=y
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_DFU=y
diff --git a/include/configs/brppt1.h b/include/configs/brppt1.h
index 4c56a8a59b..d5458edbdb 100644
--- a/include/configs/brppt1.h
+++ b/include/configs/brppt1.h
@@ -34,7 +34,6 @@
 #define CONFIG_SYS_SPL_ARGS_ADDR		0x80F80000
 
 /* RAW SD card / eMMC */
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x900	/* address 0x120000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x80	/* address 0x10000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0x80	/* 64KiB */
 
diff --git a/include/configs/devkit8000.h b/include/configs/devkit8000.h
index 591a33fca6..06e7fe9132 100644
--- a/include/configs/devkit8000.h
+++ b/include/configs/devkit8000.h
@@ -144,10 +144,8 @@
 /* SPL OS boot options */
 #define CONFIG_SYS_NAND_SPL_KERNEL_OFFS 0x280000
 
-#undef CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR
 #undef CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR
 #undef CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x500 /* address 0xa0000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x8   /* address 0x1000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	8     /* 4KB */
 
diff --git a/include/configs/display5.h b/include/configs/display5.h
index 27854dfdf1..35eb013f7d 100644
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
index 9769155bca..a1d3c2ce8f 100644
--- a/include/configs/embestmx6boards.h
+++ b/include/configs/embestmx6boards.h
@@ -66,7 +66,6 @@
 #define CONFIG_SPL_FS_LOAD_KERNEL_NAME "uImage"
 #define CONFIG_SPL_FS_LOAD_ARGS_NAME "imx6dl-riotboard.dtb"
 
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0 /* offset 69KB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0 /* offset 69KB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS 0 /* offset 69KB */
 
diff --git a/include/configs/gw_ventana.h b/include/configs/gw_ventana.h
index 3f6afc1646..9cbe5b2df9 100644
--- a/include/configs/gw_ventana.h
+++ b/include/configs/gw_ventana.h
@@ -18,7 +18,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x800	/* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	(CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x1000	/* 2MB */
 
 #include "imx6_spl.h"                  /* common IMX6 SPL configuration */
 #include "mx6_common.h"
diff --git a/include/configs/imx6-engicam.h b/include/configs/imx6-engicam.h
index 9af0a04040..1b31cef982 100644
--- a/include/configs/imx6-engicam.h
+++ b/include/configs/imx6-engicam.h
@@ -151,7 +151,6 @@
 /* MMC support: args@1MB kernel@2MB */
 # define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR		0x800   /* 1MB */
 # define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS		(CONFIG_CMD_SPL_WRITE_SIZE / 512)
-# define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x1000  /* 2MB */
 #endif
 
 /* Framebuffer */
diff --git a/include/configs/imx6_logic.h b/include/configs/imx6_logic.h
index f1b78c6751..a190fc4f24 100644
--- a/include/configs/imx6_logic.h
+++ b/include/configs/imx6_logic.h
@@ -155,6 +155,5 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 
 #endif                         /* __IMX6LOGIC_CONFIG_H */
diff --git a/include/configs/imx6dl-mamoj.h b/include/configs/imx6dl-mamoj.h
index 367f78d125..a0b5dff4c1 100644
--- a/include/configs/imx6dl-mamoj.h
+++ b/include/configs/imx6dl-mamoj.h
@@ -58,7 +58,6 @@
 /* MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR		0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS		(CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR		0x1000  /* 2MB */
 
 /* Miscellaneous configurable options */
 
diff --git a/include/configs/ls1043ardb.h b/include/configs/ls1043ardb.h
index 0d071c4ab7..6cc2ecac93 100644
--- a/include/configs/ls1043ardb.h
+++ b/include/configs/ls1043ardb.h
@@ -25,7 +25,6 @@
 
 #ifdef CONFIG_SD_BOOT
 #define CONFIG_SYS_SPL_ARGS_ADDR	0x90000000
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x10000
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x500
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	30
 #endif
diff --git a/include/configs/mccmon6.h b/include/configs/mccmon6.h
index a0803227c8..345658d9df 100644
--- a/include/configs/mccmon6.h
+++ b/include/configs/mccmon6.h
@@ -22,7 +22,6 @@
  */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR (0x800)
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (0x80)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR (0x1000)
 #define CONFIG_SPL_FS_LOAD_KERNEL_NAME "fitImage"
 
 #define CONFIG_MXC_UART_BASE		UART1_BASE
diff --git a/include/configs/mx6sabreauto.h b/include/configs/mx6sabreauto.h
index 5e8446088b..11de96fec2 100644
--- a/include/configs/mx6sabreauto.h
+++ b/include/configs/mx6sabreauto.h
@@ -35,7 +35,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 #endif
 
 #ifdef CONFIG_MTD_NOR_FLASH
diff --git a/include/configs/mx6sabresd.h b/include/configs/mx6sabresd.h
index 9a9f5884aa..5a854b9d19 100644
--- a/include/configs/mx6sabresd.h
+++ b/include/configs/mx6sabresd.h
@@ -25,7 +25,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 
 #define CONFIG_SYS_FSL_USDHC_NUM	3
 
diff --git a/include/configs/pico-imx6.h b/include/configs/pico-imx6.h
index 4e72caa45d..90cc9bda01 100644
--- a/include/configs/pico-imx6.h
+++ b/include/configs/pico-imx6.h
@@ -21,7 +21,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 #endif
 
 #define CONFIG_MXC_UART_BASE		UART1_BASE
diff --git a/include/configs/pico-imx6ul.h b/include/configs/pico-imx6ul.h
index 7e36ceed3f..edd371e080 100644
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
index 36c57923de..f98a85fe8e 100644
--- a/include/configs/pico-imx7d.h
+++ b/include/configs/pico-imx7d.h
@@ -21,7 +21,6 @@
 /* Falcon Mode - MMC support: args@1MB kernel@2MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR  0x800   /* 1MB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS (CONFIG_CMD_SPL_WRITE_SIZE / 512)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR        0x1000  /* 2MB */
 #endif
 
 #define CONFIG_MXC_UART_BASE		UART5_IPS_BASE_ADDR
diff --git a/include/configs/sama5d3_xplained.h b/include/configs/sama5d3_xplained.h
index 119b4a652c..68bbe8f29c 100644
--- a/include/configs/sama5d3_xplained.h
+++ b/include/configs/sama5d3_xplained.h
@@ -73,7 +73,6 @@
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x100  /* 128 KiB */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	(CONFIG_CMD_SPL_WRITE_SIZE / 512)
 /* U-Boot proper stored by default at 0x200 (256 KiB) */
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x1000 /* 2MB */
 #define CONFIG_SYS_SPL_ARGS_ADDR		0x22000000
 
 /* Falcon boot support on FAT on MMC */
diff --git a/include/configs/tam3517-common.h b/include/configs/tam3517-common.h
index a47e2c5b28..23ab1667a9 100644
--- a/include/configs/tam3517-common.h
+++ b/include/configs/tam3517-common.h
@@ -121,7 +121,6 @@
 #define CONFIG_SPL_FS_LOAD_ARGS_NAME		"args"
 
 /* RAW SD card / eMMC */
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0x900	/* address 0x120000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x80	/* address 0x10000 */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0x80	/* 64KiB */
 
diff --git a/include/configs/ti_armv7_common.h b/include/configs/ti_armv7_common.h
index fa48cd2818..d457df0c33 100644
--- a/include/configs/ti_armv7_common.h
+++ b/include/configs/ti_armv7_common.h
@@ -153,7 +153,6 @@
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
index 5081cc8691..48bb198e3e 100644
--- a/include/configs/xea.h
+++ b/include/configs/xea.h
@@ -27,7 +27,6 @@
 
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	(SZ_512K / 0x200)
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	(SZ_32K / 0x200)
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	(SZ_1M / 0x200)
 
 #ifndef CONFIG_SPL_BUILD
 #define CONFIG_SPI_FLASH_MTD
diff --git a/include/configs/xilinx_zynqmp.h b/include/configs/xilinx_zynqmp.h
index f8607b7617..95acf78a18 100644
--- a/include/configs/xilinx_zynqmp.h
+++ b/include/configs/xilinx_zynqmp.h
@@ -242,7 +242,6 @@
 #ifdef CONFIG_MMC_SDHCI_ZYNQ
 # define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0 /* unused */
 # define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0 /* unused */
-# define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0 /* unused */
 # if defined(CONFIG_SPL_LOAD_FIT)
 #  define CONFIG_SPL_FS_LOAD_PAYLOAD_NAME	"u-boot.itb"
 # else
diff --git a/include/configs/zynq-common.h b/include/configs/zynq-common.h
index 0c87f19ac3..0b7782ca4d 100644
--- a/include/configs/zynq-common.h
+++ b/include/configs/zynq-common.h
@@ -236,7 +236,6 @@
 /* Not using MMC raw mode - just for compilation purpose */
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0
 #define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0
-#define CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR	0
 
 /* qspi mode is working fine */
 #ifdef CONFIG_ZYNQ_QSPI
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 02d86d79cf..08df4b9baf 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -2255,7 +2255,6 @@ CONFIG_SYS_MII_MODE
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
