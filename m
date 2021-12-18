Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE5479C07
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 Dec 2021 19:28:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F946C5EC6B;
	Sat, 18 Dec 2021 18:28:02 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA20DC5A4FE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Dec 2021 18:28:00 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id c3so7681790iob.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Dec 2021 10:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nsa0Wc7OpRuStOPH/0SCwsRTU91x+OrN284FT8VFezE=;
 b=OouXpzU6Jprbz1CfoiEdwrPEgBlanadagpUxzfxYSNeGa4P+/VVW5uZ6xrVqrDNiAZ
 ZQmU6+apr7UJ5UZJKxbhJUy3yRgqVnjFIXqQ009Y0QVDu426Bk3OSh5eP/CI5pnceBeF
 FoixAdKoP9eZtK/Vaq/IaDKyrVTSSFFLuX2ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nsa0Wc7OpRuStOPH/0SCwsRTU91x+OrN284FT8VFezE=;
 b=WOQJWvtQM4V23PcPQdJrgjD1s4fofHh9t5NYPT8B+7crlgg8rqEDDKPxELkkvxZT02
 YuwqRHBUUTGaCB9livK4c78nhrg5iGtYEJ2UWKFmifCtowesi7IWfjefUMJ+pp4qk2Au
 gL7ZeBu7hSjCvca++111LH7cp+1DAaOgOQ8kYaZqr6Sx6fseL4YWazzH244VjsbG+sFd
 9hVt+K8HQMxHn80Fi8vbU9kKNKl+OqgFWxe5+bw3pvr5ObEn3eqhvj+rVIENnFIw8DVt
 KiKkX1ODARR64xTie61saVenuaWKGXGEOWj/60vH1acVFfEbS/JW9QIV17AUnbU9eiW+
 RZPQ==
X-Gm-Message-State: AOAM533DZu/GgbmxzoGr2TDhkRtni11ZkQ3yh7IxrxVoGwVQe+ZyYBAQ
 iZbJdc7YjZZvRN5glEiUWPn1nA==
X-Google-Smtp-Source: ABdhPJydUbm1s3BUuqAQBf2xlW1urUHvjY+q4S8ufu6H4is0k780CinFyYn6A1sPJyI2bpitAhdcfg==
X-Received: by 2002:a05:6638:2215:: with SMTP id
 l21mr5546889jas.147.1639852079583; 
 Sat, 18 Dec 2021 10:27:59 -0800 (PST)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id k13sm8369628iow.45.2021.12.18.10.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 10:27:59 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat, 18 Dec 2021 11:27:50 -0700
Message-Id: <20211218182752.1121322-3-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211218182752.1121322-1-sjg@chromium.org>
References: <20211218182752.1121322-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rick Chen <rick@andestech.com>,
 Chin-Liang See <clsee@altera.com>, Michal Simek <michal.simek@xilinx.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Wolfgang Denk <wd@denx.de>,
 Ran Wang <ran.wang_1@nxp.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Tom Rini <trini@konsulko.com>, Angelo Dureghello <angelo@sysam.it>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Marek Vasut <marek.vasut@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Wasim Khan <wasim.khan@nxp.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Purna Chandra Mandal <purna.mandal@microchip.com>,
 Vitaly Andrianov <vitalya@ti.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Aswath Govindraju <a-govindraju@ti.com>, Sean Anderson <seanga2@gmail.com>,
 Olaf Mandel <o.mandel@menlosystems.com>, Anatolij Gustschin <agust@denx.de>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>, Pavel Machek <pavel@denx.de>,
 Simon Glass <sjg@chromium.org>, "Andrew F. Davis" <afd@ti.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alban Bedel <alban.bedel@aerq.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Dalon Westergreen <dwesterg@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 3/5] Convert CONFIG_TIMESTAMP to Kconfig
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

This converts the following to Kconfig:
   CONFIG_TIMESTAMP

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 arch/Kconfig                              |  1 +
 arch/arm/Kconfig                          |  1 +
 arch/arm/cpu/armv8/fsl-layerscape/Kconfig |  1 +
 arch/powerpc/cpu/mpc85xx/Kconfig          |  2 ++
 boot/Kconfig                              | 11 +++++++++++
 configs/am335x_boneblack_vboot_defconfig  |  1 +
 configs/am335x_evm_defconfig              |  1 +
 configs/am335x_evm_spiboot_defconfig      |  1 +
 configs/am335x_guardian_defconfig         |  1 +
 configs/am335x_hs_evm_defconfig           |  1 +
 configs/am335x_hs_evm_uart_defconfig      |  1 +
 configs/am335x_shc_defconfig              |  1 +
 configs/am335x_shc_ict_defconfig          |  1 +
 configs/am335x_shc_netboot_defconfig      |  1 +
 configs/am335x_shc_sdboot_defconfig       |  1 +
 configs/am335x_sl50_defconfig             |  1 +
 configs/chiliboard_defconfig              |  1 +
 configs/cm_t335_defconfig                 |  1 +
 configs/colibri_pxa270_defconfig          |  1 +
 configs/imgtec_xilfpga_defconfig          |  1 +
 configs/imx28_xea_defconfig               |  1 +
 configs/k2e_evm_defconfig                 |  1 +
 configs/k2e_hs_evm_defconfig              |  1 +
 configs/k2g_evm_defconfig                 |  1 +
 configs/k2g_hs_evm_defconfig              |  1 +
 configs/k2hk_evm_defconfig                |  1 +
 configs/k2hk_hs_evm_defconfig             |  1 +
 configs/k2l_evm_defconfig                 |  1 +
 configs/k2l_hs_evm_defconfig              |  1 +
 configs/pic32mzdask_defconfig             |  1 +
 configs/socfpga_arria10_defconfig         |  1 +
 configs/socfpga_arria5_defconfig          |  1 +
 configs/socfpga_cyclone5_defconfig        |  1 +
 configs/socfpga_dbm_soc1_defconfig        |  1 +
 configs/socfpga_de0_nano_soc_defconfig    |  1 +
 configs/socfpga_de10_nano_defconfig       |  1 +
 configs/socfpga_de1_soc_defconfig         |  1 +
 configs/socfpga_is1_defconfig             |  1 +
 configs/socfpga_mcvevk_defconfig          |  1 +
 configs/socfpga_sockit_defconfig          |  1 +
 configs/socfpga_sr1500_defconfig          |  1 +
 configs/socfpga_vining_fpga_defconfig     |  1 +
 configs/stmark2_defconfig                 |  1 +
 configs/tools-only_defconfig              |  1 +
 configs/uniphier_ld4_sld8_defconfig       |  1 +
 configs/uniphier_v7_defconfig             |  1 +
 configs/uniphier_v8_defconfig             |  1 +
 include/configs/am335x_evm.h              |  4 ----
 include/configs/am335x_guardian.h         |  4 ----
 include/configs/am335x_shc.h              |  4 ----
 include/configs/am335x_sl50.h             |  4 ----
 include/configs/chiliboard.h              |  4 ----
 include/configs/cm_t335.h                 |  1 -
 include/configs/colibri_pxa270.h          |  1 -
 include/configs/ids8313.h                 |  1 -
 include/configs/imgtec_xilfpga.h          |  1 -
 include/configs/m53menlo.h                |  2 --
 include/configs/pic32mzdask.h             |  1 -
 include/configs/sandbox.h                 |  1 -
 include/configs/socfpga_common.h          |  2 --
 include/configs/socrates.h                |  2 --
 include/configs/stmark2.h                 |  2 --
 include/configs/ti_armv7_keystone2.h      |  1 -
 include/configs/uniphier.h                |  2 --
 include/configs/xea.h                     |  2 --
 net/Kconfig                               |  1 +
 scripts/config_whitelist.txt              |  1 -
 67 files changed, 59 insertions(+), 40 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 39156067b2c..3e8b745ea11 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -252,6 +252,7 @@ config X86
 	imply ACPIGEN if !QEMU
 	imply SYSINFO if GENERATE_SMBIOS_TABLE
 	imply SYSINFO_SMBIOS if GENERATE_SMBIOS_TABLE
+	imply TIMESTAMP
 
 	# Thing to enable for when SPL/TPL are enabled: SPL
 	imply SPL_DM
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index eed27af74e8..fee2b1614c8 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1856,6 +1856,7 @@ config ARCH_STM32MP
 	imply OF_LIBFDT_OVERLAY
 	imply ENV_VARS_UBOOT_RUNTIME_CONFIG
 	imply USE_PREBOOT
+	imply TIMESTAMP
 	help
 	  Support for STM32MP SoC family developed by STMicroelectronics,
 	  MPUs based on ARM cortex A core
diff --git a/arch/arm/cpu/armv8/fsl-layerscape/Kconfig b/arch/arm/cpu/armv8/fsl-layerscape/Kconfig
index a6ac897ab30..e4c071da173 100644
--- a/arch/arm/cpu/armv8/fsl-layerscape/Kconfig
+++ b/arch/arm/cpu/armv8/fsl-layerscape/Kconfig
@@ -21,6 +21,7 @@ config ARCH_LS1012A
 	select SYS_I2C_MXC_I2C1 if !DM_I2C
 	select SYS_I2C_MXC_I2C2 if !DM_I2C
 	imply PANIC_HANG
+	imply TIMESTAMP
 
 config ARCH_LS1028A
 	bool
diff --git a/arch/powerpc/cpu/mpc85xx/Kconfig b/arch/powerpc/cpu/mpc85xx/Kconfig
index 836aeddbe29..f189b988fb0 100644
--- a/arch/powerpc/cpu/mpc85xx/Kconfig
+++ b/arch/powerpc/cpu/mpc85xx/Kconfig
@@ -379,6 +379,7 @@ config ARCH_P1010
 	imply CMD_PCI
 	imply CMD_REGINFO
 	imply FSL_SATA
+	imply TIMESTAMP
 
 config ARCH_P1011
 	bool
@@ -510,6 +511,7 @@ config ARCH_P2020
 	imply CMD_EEPROM
 	imply CMD_NAND
 	imply CMD_REGINFO
+	imply TIMESTAMP
 
 config ARCH_P2041
 	bool
diff --git a/boot/Kconfig b/boot/Kconfig
index d3a12be2281..f1cff2837cb 100644
--- a/boot/Kconfig
+++ b/boot/Kconfig
@@ -25,6 +25,17 @@ config FIT
 	  multiple configurations, verification through hashing and also
 	  verified boot (secure boot using RSA).
 
+config TIMESTAMP
+	bool "Show image date and time when displaying image information"
+	default y if CMD_DATE
+	help
+	  When CONFIG_TIMESTAMP is selected, the timestamp (date and time) of
+	  an image is printed by image commands like bootm or iminfo. This
+	  is shown as 'Timestamp: xxx' and 'Created: xxx'. If this option is
+	  enabled, then U-Boot requires FITs to have a timestamp. If a FIT is
+	  loaded that does not, the message 'Wrong FIT format: no timestamp'
+	  is shown.
+
 if FIT
 
 config FIT_EXTERNAL_OFFSET
diff --git a/configs/am335x_boneblack_vboot_defconfig b/configs/am335x_boneblack_vboot_defconfig
index f0b197a0501..aec38b0e1b9 100644
--- a/configs/am335x_boneblack_vboot_defconfig
+++ b/configs/am335x_boneblack_vboot_defconfig
@@ -9,6 +9,7 @@ CONFIG_AM33XX=y
 CONFIG_SPL=y
 CONFIG_ENV_OFFSET_REDUND=0x280000
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SYS_EXTRA_OPTIONS="EMMC_BOOT"
diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
index 4dc5d0fe347..98dadf824ff 100644
--- a/configs/am335x_evm_defconfig
+++ b/configs/am335x_evm_defconfig
@@ -6,6 +6,7 @@ CONFIG_DEFAULT_DEVICE_TREE="am335x-evm"
 CONFIG_AM33XX=y
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_SPL_LOAD_FIT=y
 # CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/am335x_evm_spiboot_defconfig b/configs/am335x_evm_spiboot_defconfig
index a85645793ee..f8acb7e1a97 100644
--- a/configs/am335x_evm_spiboot_defconfig
+++ b/configs/am335x_evm_spiboot_defconfig
@@ -11,6 +11,7 @@ CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run init_console; run finduuid; run distro_bootcmd"
diff --git a/configs/am335x_guardian_defconfig b/configs/am335x_guardian_defconfig
index 9d9d6283e05..8b3bd48b6c1 100644
--- a/configs/am335x_guardian_defconfig
+++ b/configs/am335x_guardian_defconfig
@@ -18,6 +18,7 @@ CONFIG_BOOTSTAGE_STASH_ADDR=0x0
 CONFIG_ENV_OFFSET_REDUND=0x540000
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_BOOTDELAY=0
 CONFIG_AUTOBOOT_KEYED=y
 CONFIG_AUTOBOOT_PROMPT="Press SPACE to abort autoboot in %d seconds\n"
diff --git a/configs/am335x_hs_evm_defconfig b/configs/am335x_hs_evm_defconfig
index 21ef885aaf2..993fbbcd397 100644
--- a/configs/am335x_hs_evm_defconfig
+++ b/configs/am335x_hs_evm_defconfig
@@ -8,6 +8,7 @@ CONFIG_DEFAULT_DEVICE_TREE="am335x-evm"
 CONFIG_AM33XX=y
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_FIT_IMAGE_POST_PROCESS=y
diff --git a/configs/am335x_hs_evm_uart_defconfig b/configs/am335x_hs_evm_uart_defconfig
index bca18897d30..ecb0526c338 100644
--- a/configs/am335x_hs_evm_uart_defconfig
+++ b/configs/am335x_hs_evm_uart_defconfig
@@ -11,6 +11,7 @@ CONFIG_SPL=y
 # CONFIG_SPL_FS_FAT is not set
 # CONFIG_SPL_LIBDISK_SUPPORT is not set
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_FIT_IMAGE_POST_PROCESS=y
diff --git a/configs/am335x_shc_defconfig b/configs/am335x_shc_defconfig
index f2a61080a74..7be215107cf 100644
--- a/configs/am335x_shc_defconfig
+++ b/configs/am335x_shc_defconfig
@@ -17,6 +17,7 @@ CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SERIES=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_SHOW_BOOT_PROGRESS=y
 CONFIG_AUTOBOOT_KEYED=y
 CONFIG_AUTOBOOT_PROMPT="Enter 'shc' to enter prompt (times out) %d \nEnter 'noautoboot' to enter prompt without timeout\n"
diff --git a/configs/am335x_shc_ict_defconfig b/configs/am335x_shc_ict_defconfig
index 49e18d87398..106cf2694a3 100644
--- a/configs/am335x_shc_ict_defconfig
+++ b/configs/am335x_shc_ict_defconfig
@@ -18,6 +18,7 @@ CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SHC_ICT=y
 CONFIG_SERIES=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_SHOW_BOOT_PROGRESS=y
 CONFIG_AUTOBOOT_KEYED=y
 CONFIG_AUTOBOOT_PROMPT="Enter 'shc' to enter prompt (times out) %d \nEnter 'noautoboot' to enter prompt without timeout\n"
diff --git a/configs/am335x_shc_netboot_defconfig b/configs/am335x_shc_netboot_defconfig
index c63ffb72486..504c9323df1 100644
--- a/configs/am335x_shc_netboot_defconfig
+++ b/configs/am335x_shc_netboot_defconfig
@@ -18,6 +18,7 @@ CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SHC_NETBOOT=y
 CONFIG_SERIES=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_SHOW_BOOT_PROGRESS=y
 CONFIG_AUTOBOOT_KEYED=y
 CONFIG_AUTOBOOT_PROMPT="Enter 'shc' to enter prompt (times out) %d \nEnter 'noautoboot' to enter prompt without timeout\n"
diff --git a/configs/am335x_shc_sdboot_defconfig b/configs/am335x_shc_sdboot_defconfig
index 24409b8db45..64a5f48d4af 100644
--- a/configs/am335x_shc_sdboot_defconfig
+++ b/configs/am335x_shc_sdboot_defconfig
@@ -18,6 +18,7 @@ CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SHC_SDBOOT=y
 CONFIG_SERIES=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_SHOW_BOOT_PROGRESS=y
 CONFIG_AUTOBOOT_KEYED=y
 CONFIG_AUTOBOOT_PROMPT="Enter 'shc' to enter prompt (times out) %d \nEnter 'noautoboot' to enter prompt without timeout\n"
diff --git a/configs/am335x_sl50_defconfig b/configs/am335x_sl50_defconfig
index aa1e196d408..b65f9608ce0 100644
--- a/configs/am335x_sl50_defconfig
+++ b/configs/am335x_sl50_defconfig
@@ -15,6 +15,7 @@ CONFIG_ENV_OFFSET_REDUND=0x20000
 CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_SYS_EXTRA_OPTIONS="EMMC_BOOT"
 CONFIG_AUTOBOOT_KEYED=y
 CONFIG_AUTOBOOT_PROMPT="Press SPACE to abort autoboot in %d seconds\n"
diff --git a/configs/chiliboard_defconfig b/configs/chiliboard_defconfig
index 023cd196103..a50e732aef3 100644
--- a/configs/chiliboard_defconfig
+++ b/configs/chiliboard_defconfig
@@ -16,6 +16,7 @@ CONFIG_ENV_OFFSET_REDUND=0x22000
 CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_BOOTDELAY=1
 CONFIG_BOOTCOMMAND="run mmcboot; run nandboot; run netboot"
 CONFIG_DEFAULT_FDT_FILE="am335x-chiliboard.dtb"
diff --git a/configs/cm_t335_defconfig b/configs/cm_t335_defconfig
index 0600bf555de..7a65683a418 100644
--- a/configs/cm_t335_defconfig
+++ b/configs/cm_t335_defconfig
@@ -14,6 +14,7 @@ CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_SPL_FS_EXT4=y
diff --git a/configs/colibri_pxa270_defconfig b/configs/colibri_pxa270_defconfig
index f13170c09e3..0116cfa6f85 100644
--- a/configs/colibri_pxa270_defconfig
+++ b/configs/colibri_pxa270_defconfig
@@ -10,6 +10,7 @@ CONFIG_ENV_SIZE=0x40000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_SYS_LOAD_ADDR=0xa0000000
+CONFIG_TIMESTAMP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=tty0 console=ttyS0,115200"
 CONFIG_USE_BOOTCOMMAND=y
diff --git a/configs/imgtec_xilfpga_defconfig b/configs/imgtec_xilfpga_defconfig
index 3ded3a07391..576d68cdaec 100644
--- a/configs/imgtec_xilfpga_defconfig
+++ b/configs/imgtec_xilfpga_defconfig
@@ -10,6 +10,7 @@ CONFIG_MIPS_CACHE_DISABLE=y
 # CONFIG_MIPS_BOOT_ENV_LEGACY is not set
 CONFIG_MIPS_BOOT_FDT=y
 CONFIG_SYS_LOAD_ADDR=0x80500000
+CONFIG_TIMESTAMP=y
 CONFIG_BOOTDELAY=5
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_HUSH_PARSER=y
diff --git a/configs/imx28_xea_defconfig b/configs/imx28_xea_defconfig
index 249bdd6d83e..eb5fc0b7c63 100644
--- a/configs/imx28_xea_defconfig
+++ b/configs/imx28_xea_defconfig
@@ -23,6 +23,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_PAYLOAD="u-boot.img"
 CONFIG_SYS_LOAD_ADDR=0x42000000
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyAMA0,115200n8"
diff --git a/configs/k2e_evm_defconfig b/configs/k2e_evm_defconfig
index 2c49187b01a..eb8b945fa48 100644
--- a/configs/k2e_evm_defconfig
+++ b/configs/k2e_evm_defconfig
@@ -21,6 +21,7 @@ CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run init_${boot}; run get_mon_${boot} run_mon; run get_kern_${boot}; run init_fw_rd_${boot}; run get_fdt_${boot}; run run_kern"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/k2e_hs_evm_defconfig b/configs/k2e_hs_evm_defconfig
index 7d739de6293..45b6644f698 100644
--- a/configs/k2e_hs_evm_defconfig
+++ b/configs/k2e_hs_evm_defconfig
@@ -14,6 +14,7 @@ CONFIG_ENV_SIZE=0x40000
 CONFIG_ENV_OFFSET=0x100000
 CONFIG_DEFAULT_DEVICE_TREE="keystone-k2e-evm"
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run run_mon_hs; run init_${boot}; run get_fit_${boot}; bootm ${addr_fit}#${name_fdt}"
diff --git a/configs/k2g_evm_defconfig b/configs/k2g_evm_defconfig
index f0a7d839f4e..81fbf1da2b8 100644
--- a/configs/k2g_evm_defconfig
+++ b/configs/k2g_evm_defconfig
@@ -20,6 +20,7 @@ CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run envboot; run init_${boot}; run get_mon_${boot} run_mon; run set_name_pmmc get_pmmc_${boot} run_pmmc; run get_kern_${boot}; run init_fw_rd_${boot}; run get_fdt_${boot}; run run_kern"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/k2g_hs_evm_defconfig b/configs/k2g_hs_evm_defconfig
index a5ebb426b6e..c91f5c27035 100644
--- a/configs/k2g_hs_evm_defconfig
+++ b/configs/k2g_hs_evm_defconfig
@@ -13,6 +13,7 @@ CONFIG_TARGET_K2G_EVM=y
 CONFIG_ENV_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="keystone-k2g-evm"
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run envboot; run run_mon_hs; run init_${boot}; run get_fit_${boot}; bootm ${addr_fit}#${name_fdt}"
diff --git a/configs/k2hk_evm_defconfig b/configs/k2hk_evm_defconfig
index a2d92015be8..dfe0291ab6a 100644
--- a/configs/k2hk_evm_defconfig
+++ b/configs/k2hk_evm_defconfig
@@ -21,6 +21,7 @@ CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run init_${boot}; run get_mon_${boot} run_mon; run get_kern_${boot}; run init_fw_rd_${boot}; run get_fdt_${boot}; run run_kern"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/k2hk_hs_evm_defconfig b/configs/k2hk_hs_evm_defconfig
index c3ef1a7e26b..e1b98a612e1 100644
--- a/configs/k2hk_hs_evm_defconfig
+++ b/configs/k2hk_hs_evm_defconfig
@@ -14,6 +14,7 @@ CONFIG_ENV_SIZE=0x40000
 CONFIG_ENV_OFFSET=0x100000
 CONFIG_DEFAULT_DEVICE_TREE="keystone-k2hk-evm"
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run run_mon_hs; run init_${boot}; run get_fit_${boot}; bootm ${addr_fit}#${name_fdt}"
diff --git a/configs/k2l_evm_defconfig b/configs/k2l_evm_defconfig
index 6ef1de7d829..d800ea15d8a 100644
--- a/configs/k2l_evm_defconfig
+++ b/configs/k2l_evm_defconfig
@@ -21,6 +21,7 @@ CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
 CONFIG_DISTRO_DEFAULTS=y
+CONFIG_TIMESTAMP=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run init_${boot}; run get_mon_${boot} run_mon; run get_kern_${boot}; run init_fw_rd_${boot}; run get_fdt_${boot}; run run_kern"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/k2l_hs_evm_defconfig b/configs/k2l_hs_evm_defconfig
index 718ceff9943..1776217e942 100644
--- a/configs/k2l_hs_evm_defconfig
+++ b/configs/k2l_hs_evm_defconfig
@@ -13,6 +13,7 @@ CONFIG_TARGET_K2L_EVM=y
 CONFIG_ENV_SIZE=0x40000
 CONFIG_ENV_OFFSET=0x100000
 CONFIG_DEFAULT_DEVICE_TREE="keystone-k2l-evm"
+CONFIG_TIMESTAMP=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
diff --git a/configs/pic32mzdask_defconfig b/configs/pic32mzdask_defconfig
index ff6be7871d4..9d5aa3a4bb8 100644
--- a/configs/pic32mzdask_defconfig
+++ b/configs/pic32mzdask_defconfig
@@ -12,6 +12,7 @@ CONFIG_MACH_PIC32=y
 CONFIG_MIPS_BOOT_FDT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_LOAD_ADDR=0x88500000
+CONFIG_TIMESTAMP=y
 CONFIG_BOOTDELAY=5
 CONFIG_BOOTCOMMAND="run distro_bootcmd || run legacy_bootcmd"
 CONFIG_SYS_PROMPT="dask # "
diff --git a/configs/socfpga_arria10_defconfig b/configs/socfpga_arria10_defconfig
index d6b74447503..cd1c68a3b6a 100644
--- a/configs/socfpga_arria10_defconfig
+++ b/configs/socfpga_arria10_defconfig
@@ -12,6 +12,7 @@ CONFIG_IDENT_STRING="socfpga_arria10"
 CONFIG_SPL_FS_FAT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 CONFIG_SPL_FIT=y
 # CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/socfpga_arria5_defconfig b/configs/socfpga_arria5_defconfig
index 92bee765752..60f48db73a4 100644
--- a/configs/socfpga_arria5_defconfig
+++ b/configs/socfpga_arria5_defconfig
@@ -9,6 +9,7 @@ CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_TARGET_SOCFPGA_ARRIA5_SOCDK=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_DEFAULT_FDT_FILE="socfpga_arria5_socdk.dtb"
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/socfpga_cyclone5_defconfig b/configs/socfpga_cyclone5_defconfig
index c0a450f1a5e..90717b553af 100644
--- a/configs/socfpga_cyclone5_defconfig
+++ b/configs/socfpga_cyclone5_defconfig
@@ -9,6 +9,7 @@ CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_TARGET_SOCFPGA_CYCLONE5_SOCDK=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_DEFAULT_FDT_FILE="socfpga_cyclone5_socdk.dtb"
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/socfpga_dbm_soc1_defconfig b/configs/socfpga_dbm_soc1_defconfig
index baae2f2e480..15652a17ea5 100644
--- a/configs/socfpga_dbm_soc1_defconfig
+++ b/configs/socfpga_dbm_soc1_defconfig
@@ -8,6 +8,7 @@ CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_dbm_soc1"
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_TARGET_SOCFPGA_DEVBOARDS_DBM_SOC1=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200"
 CONFIG_USE_BOOTCOMMAND=y
diff --git a/configs/socfpga_de0_nano_soc_defconfig b/configs/socfpga_de0_nano_soc_defconfig
index 826b14ebdd7..09b51e1baf5 100644
--- a/configs/socfpga_de0_nano_soc_defconfig
+++ b/configs/socfpga_de0_nano_soc_defconfig
@@ -9,6 +9,7 @@ CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_TARGET_SOCFPGA_TERASIC_DE0_NANO=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_DEFAULT_FDT_FILE="socfpga_cyclone5_de0_nano_soc.dtb"
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/socfpga_de10_nano_defconfig b/configs/socfpga_de10_nano_defconfig
index b374df50e75..28f7224f08d 100644
--- a/configs/socfpga_de10_nano_defconfig
+++ b/configs/socfpga_de10_nano_defconfig
@@ -9,6 +9,7 @@ CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_TARGET_SOCFPGA_TERASIC_DE10_NANO=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_DEFAULT_FDT_FILE="socfpga_cyclone5_de10_nano.dtb"
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/socfpga_de1_soc_defconfig b/configs/socfpga_de1_soc_defconfig
index 9ada0941666..36c411dd923 100644
--- a/configs/socfpga_de1_soc_defconfig
+++ b/configs/socfpga_de1_soc_defconfig
@@ -9,6 +9,7 @@ CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_TARGET_SOCFPGA_TERASIC_DE1_SOC=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_DEFAULT_FDT_FILE="socfpga_cyclone5_de1_soc.dtb"
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/socfpga_is1_defconfig b/configs/socfpga_is1_defconfig
index 7b27bcca76c..2124a08d21e 100644
--- a/configs/socfpga_is1_defconfig
+++ b/configs/socfpga_is1_defconfig
@@ -11,6 +11,7 @@ CONFIG_SYS_BOOTCOUNT_ADDR=0xfffffff8
 CONFIG_TARGET_SOCFPGA_IS1=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200"
 # CONFIG_USE_BOOTCOMMAND is not set
diff --git a/configs/socfpga_mcvevk_defconfig b/configs/socfpga_mcvevk_defconfig
index 2a2899d93ec..d31c3f5e77e 100644
--- a/configs/socfpga_mcvevk_defconfig
+++ b/configs/socfpga_mcvevk_defconfig
@@ -9,6 +9,7 @@ CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_TARGET_SOCFPGA_ARIES_MCVEVK=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200"
 CONFIG_BOOTCOMMAND="run mmc_mmc"
diff --git a/configs/socfpga_sockit_defconfig b/configs/socfpga_sockit_defconfig
index 649faa4852f..1a301ce76be 100644
--- a/configs/socfpga_sockit_defconfig
+++ b/configs/socfpga_sockit_defconfig
@@ -9,6 +9,7 @@ CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_TARGET_SOCFPGA_TERASIC_SOCKIT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_DEFAULT_FDT_FILE="socfpga_cyclone5_sockit.dtb"
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/socfpga_sr1500_defconfig b/configs/socfpga_sr1500_defconfig
index c400cbc66b7..a7a48a0ef25 100644
--- a/configs/socfpga_sr1500_defconfig
+++ b/configs/socfpga_sr1500_defconfig
@@ -14,6 +14,7 @@ CONFIG_TARGET_SOCFPGA_SR1500=y
 CONFIG_ENV_OFFSET_REDUND=0xF0000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_DEFAULT_FDT_FILE="socfpga_cyclone5_sr1500.dtb"
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/socfpga_vining_fpga_defconfig b/configs/socfpga_vining_fpga_defconfig
index 258aaf2171e..72a8dcf6008 100644
--- a/configs/socfpga_vining_fpga_defconfig
+++ b/configs/socfpga_vining_fpga_defconfig
@@ -11,6 +11,7 @@ CONFIG_TARGET_SOCFPGA_SOFTING_VINING_FPGA=y
 CONFIG_ENV_OFFSET_REDUND=0x110000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 CONFIG_BOOTDELAY=5
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200"
diff --git a/configs/stmark2_defconfig b/configs/stmark2_defconfig
index 39efda6145a..895178a0e8e 100644
--- a/configs/stmark2_defconfig
+++ b/configs/stmark2_defconfig
@@ -7,6 +7,7 @@ CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_DEFAULT_DEVICE_TREE="stmark2"
 CONFIG_TARGET_STMARK2=y
 CONFIG_SYS_LOAD_ADDR=0x40010000
+CONFIG_TIMESTAMP=y
 CONFIG_SYS_EXTRA_OPTIONS="CF_SBF,SYS_SERIAL_BOOT,SYS_INPUT_CLKSRC=30000000"
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 root=/dev/ram0 rw rootfstype=ramfs rdinit=/bin/init devtmpfs.mount=1"
diff --git a/configs/tools-only_defconfig b/configs/tools-only_defconfig
index 5ffc625b0dd..abb00241fe2 100644
--- a/configs/tools-only_defconfig
+++ b/configs/tools-only_defconfig
@@ -5,6 +5,7 @@ CONFIG_DEFAULT_DEVICE_TREE="sandbox"
 CONFIG_SYS_LOAD_ADDR=0x0
 CONFIG_ANDROID_BOOT_IMAGE=y
 CONFIG_FIT=y
+CONFIG_TIMESTAMP=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="run distro_bootcmd"
diff --git a/configs/uniphier_ld4_sld8_defconfig b/configs/uniphier_ld4_sld8_defconfig
index 97ee693334b..304d6a8e547 100644
--- a/configs/uniphier_ld4_sld8_defconfig
+++ b/configs/uniphier_ld4_sld8_defconfig
@@ -11,6 +11,7 @@ CONFIG_SPL_SERIAL=y
 CONFIG_SPL=y
 CONFIG_MICRO_SUPPORT_CARD=y
 CONFIG_SYS_LOAD_ADDR=0x85000000
+CONFIG_TIMESTAMP=y
 # CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
 CONFIG_BOOTCOMMAND="run ${bootdev}script; run ${bootdev}boot"
 CONFIG_USE_PREBOOT=y
diff --git a/configs/uniphier_v7_defconfig b/configs/uniphier_v7_defconfig
index 9089be0190c..87eb939fe2f 100644
--- a/configs/uniphier_v7_defconfig
+++ b/configs/uniphier_v7_defconfig
@@ -11,6 +11,7 @@ CONFIG_SPL_SERIAL=y
 CONFIG_SPL=y
 CONFIG_MICRO_SUPPORT_CARD=y
 CONFIG_SYS_LOAD_ADDR=0x85000000
+CONFIG_TIMESTAMP=y
 # CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
 CONFIG_BOOTCOMMAND="run ${bootdev}script; run ${bootdev}boot"
 CONFIG_USE_PREBOOT=y
diff --git a/configs/uniphier_v8_defconfig b/configs/uniphier_v8_defconfig
index e684291a3f9..b9e2d9ba790 100644
--- a/configs/uniphier_v8_defconfig
+++ b/configs/uniphier_v8_defconfig
@@ -10,6 +10,7 @@ CONFIG_DEFAULT_DEVICE_TREE="uniphier-ld20-ref"
 CONFIG_ARCH_UNIPHIER_V8_MULTI=y
 CONFIG_MICRO_SUPPORT_CARD=y
 CONFIG_SYS_LOAD_ADDR=0x85000000
+CONFIG_TIMESTAMP=y
 # CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
 CONFIG_BOOTCOMMAND="run ${bootdev}script; run ${bootdev}boot"
 CONFIG_USE_PREBOOT=y
diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
index 7fb1b3a3e3f..cbdca976074 100644
--- a/include/configs/am335x_evm.h
+++ b/include/configs/am335x_evm.h
@@ -19,10 +19,6 @@
 #include <configs/ti_am335x_common.h>
 #include <linux/sizes.h>
 
-#ifndef CONFIG_SPL_BUILD
-# define CONFIG_TIMESTAMP
-#endif
-
 #define CONFIG_SYS_BOOTM_LEN		SZ_16M
 
 /* Clock Defines */
diff --git a/include/configs/am335x_guardian.h b/include/configs/am335x_guardian.h
index a1f24bb2d11..10a95a10a0e 100644
--- a/include/configs/am335x_guardian.h
+++ b/include/configs/am335x_guardian.h
@@ -12,10 +12,6 @@
 
 #include <configs/ti_am335x_common.h>
 
-#ifndef CONFIG_SPL_BUILD
-#define CONFIG_TIMESTAMP
-#endif
-
 #define CONFIG_SYS_BOOTM_LEN		(16 << 20)
 
 /* Clock Defines */
diff --git a/include/configs/am335x_shc.h b/include/configs/am335x_shc.h
index c7a7a18dc85..5ed4eb3b3c2 100644
--- a/include/configs/am335x_shc.h
+++ b/include/configs/am335x_shc.h
@@ -16,10 +16,6 @@
 
 /* settings we don;t want on this board */
 
-#ifndef CONFIG_SPL_BUILD
-# define CONFIG_TIMESTAMP
-#endif
-
 #define CONFIG_SYS_BOOTM_LEN		(16 << 20)
 
 /* Clock Defines */
diff --git a/include/configs/am335x_sl50.h b/include/configs/am335x_sl50.h
index 7fbf421149d..0da98975adf 100644
--- a/include/configs/am335x_sl50.h
+++ b/include/configs/am335x_sl50.h
@@ -10,10 +10,6 @@
 
 #include <configs/ti_am335x_common.h>
 
-#ifndef CONFIG_SPL_BUILD
-# define CONFIG_TIMESTAMP
-#endif
-
 #define CONFIG_SYS_BOOTM_LEN		(16 << 20)
 
 /* Clock Defines */
diff --git a/include/configs/chiliboard.h b/include/configs/chiliboard.h
index afddedd2eb7..fe496272630 100644
--- a/include/configs/chiliboard.h
+++ b/include/configs/chiliboard.h
@@ -8,10 +8,6 @@
 
 #include <configs/ti_am335x_common.h>
 
-#ifndef CONFIG_SPL_BUILD
-# define CONFIG_TIMESTAMP
-#endif
-
 /* Clock Defines */
 #define V_OSCK				24000000  /* Clock output from T2 */
 #define V_SCLK				(V_OSCK)
diff --git a/include/configs/cm_t335.h b/include/configs/cm_t335.h
index 7e187a4e869..ad2e8818907 100644
--- a/include/configs/cm_t335.h
+++ b/include/configs/cm_t335.h
@@ -57,7 +57,6 @@
 	NANDARGS
 #endif /* CONFIG_SPL_BUILD */
 
-#define CONFIG_TIMESTAMP
 #define CONFIG_SYS_AUTOLOAD		"no"
 
 /* Serial console configuration */
diff --git a/include/configs/colibri_pxa270.h b/include/configs/colibri_pxa270.h
index 22eab7779b0..e0c94b1abf1 100644
--- a/include/configs/colibri_pxa270.h
+++ b/include/configs/colibri_pxa270.h
@@ -19,7 +19,6 @@
 /*
  * Environment settings
  */
-#define	CONFIG_TIMESTAMP
 
 /*
  * Serial Console Configuration
diff --git a/include/configs/ids8313.h b/include/configs/ids8313.h
index 49f5d68892e..b5dd0ca4788 100644
--- a/include/configs/ids8313.h
+++ b/include/configs/ids8313.h
@@ -231,7 +231,6 @@
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
 
 #define CONFIG_LOADS_ECHO
-#define CONFIG_TIMESTAMP
 #undef	CONFIG_SYS_LOADS_BAUD_CHANGE
 
 #define CONFIG_JFFS2_NAND
diff --git a/include/configs/imgtec_xilfpga.h b/include/configs/imgtec_xilfpga.h
index fc27ca4fe6f..19d65f54e3b 100644
--- a/include/configs/imgtec_xilfpga.h
+++ b/include/configs/imgtec_xilfpga.h
@@ -46,6 +46,5 @@
 /* ---------------------------------------------------------------------
  * Board boot configuration
  */
-#define CONFIG_TIMESTAMP	/* Print image info with timestamp */
 
 #endif	/* __XILFPGA_CONFIG_H */
diff --git a/include/configs/m53menlo.h b/include/configs/m53menlo.h
index 2844553067c..c4abe340d5d 100644
--- a/include/configs/m53menlo.h
+++ b/include/configs/m53menlo.h
@@ -13,8 +13,6 @@
 
 #define CONFIG_SYS_FSL_CLK
 
-#define CONFIG_TIMESTAMP		/* Print image info with timestamp */
-
 /*
  * Memory configurations
  */
diff --git a/include/configs/pic32mzdask.h b/include/configs/pic32mzdask.h
index cc2e6a7ae89..b8659f9ee68 100644
--- a/include/configs/pic32mzdask.h
+++ b/include/configs/pic32mzdask.h
@@ -70,7 +70,6 @@
 /* ---------------------------------------------------------------------
  * Board boot configuration
  */
-#define CONFIG_TIMESTAMP	/* Print image info with timestamp */
 
 #define MEM_LAYOUT_ENV_SETTINGS					\
 	"kernel_addr_r="__stringify(CONFIG_SYS_LOAD_ADDR)"\0"	\
diff --git a/include/configs/sandbox.h b/include/configs/sandbox.h
index 2cb8a90f5ea..5c2f3d84c3b 100644
--- a/include/configs/sandbox.h
+++ b/include/configs/sandbox.h
@@ -25,7 +25,6 @@
 #define CONFIG_SYS_BAUDRATE_TABLE	{4800, 9600, 19200, 38400, 57600,\
 					115200}
 
-#define CONFIG_TIMESTAMP
 #define CONFIG_BOOTP_SERVERIP
 
 #ifndef SANDBOX_NO_SDL
diff --git a/include/configs/socfpga_common.h b/include/configs/socfpga_common.h
index 31f95f52f8c..8a77d192c90 100644
--- a/include/configs/socfpga_common.h
+++ b/include/configs/socfpga_common.h
@@ -12,8 +12,6 @@
  */
 #define CONFIG_CLOCKS
 
-#define CONFIG_TIMESTAMP		/* Print image info with timestamp */
-
 /*
  * Memory configurations
  */
diff --git a/include/configs/socrates.h b/include/configs/socrates.h
index b7296daa374..07364fa787f 100644
--- a/include/configs/socrates.h
+++ b/include/configs/socrates.h
@@ -174,8 +174,6 @@
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download	*/
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change	*/
 
-#define	CONFIG_TIMESTAMP		/* Print image info with ts	*/
-
 /*
  * BOOTP options
  */
diff --git a/include/configs/stmark2.h b/include/configs/stmark2.h
index 1a5cf6b7811..e502fe72bdf 100644
--- a/include/configs/stmark2.h
+++ b/include/configs/stmark2.h
@@ -15,8 +15,6 @@
 #define LDS_BOARD_TEXT						\
 	board/sysam/stmark2/sbf_dram_init.o (.text*)
 
-#define CONFIG_TIMESTAMP
-
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 	"kern_size=0x700000\0"					\
 	"loadaddr=0x40001000\0"					\
diff --git a/include/configs/ti_armv7_keystone2.h b/include/configs/ti_armv7_keystone2.h
index 4a329bf6eca..0243016fcde 100644
--- a/include/configs/ti_armv7_keystone2.h
+++ b/include/configs/ti_armv7_keystone2.h
@@ -108,7 +108,6 @@
 	DFU_ALT_INFO_MMC \
 
 /* U-Boot general configuration */
-#define CONFIG_TIMESTAMP
 
 /* EDMA3 */
 
diff --git a/include/configs/uniphier.h b/include/configs/uniphier.h
index b91b0db2c47..1960a8004d2 100644
--- a/include/configs/uniphier.h
+++ b/include/configs/uniphier.h
@@ -39,8 +39,6 @@
 #define BOOTENV
 #endif
 
-#define CONFIG_TIMESTAMP
-
 #define CONFIG_SYS_MONITOR_BASE		0
 #define CONFIG_SYS_MONITOR_LEN		0x00200000	/* 2MB */
 
diff --git a/include/configs/xea.h b/include/configs/xea.h
index 5b968f0820c..0b29d3b63d0 100644
--- a/include/configs/xea.h
+++ b/include/configs/xea.h
@@ -14,8 +14,6 @@
 
 #include <linux/sizes.h>
 
-#define CONFIG_TIMESTAMP		/* Print image info with timestamp */
-
 /* SPL */
 #define CONFIG_SPL_STACK		0x20000
 
diff --git a/net/Kconfig b/net/Kconfig
index 3d3329912da..1983506bb8e 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -109,6 +109,7 @@ config KEEP_SERVERADDR
 
 config UDP_CHECKSUM
 	bool "Check the UDP checksum"
+	default y if SANDBOX
 	help
 	  Enable this to verify the checksum on UDP packets. If the checksum
 	  is wrong then the packet is discussed and an error is shown, like
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index f0715614895..72ebcda1d4f 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -2918,7 +2918,6 @@ CONFIG_TFTP_FILE_NAME_MAX_LEN
 CONFIG_TFTP_PORT
 CONFIG_THOR_RESET_OFF
 CONFIG_THUNDERX
-CONFIG_TIMESTAMP
 CONFIG_TIZEN
 CONFIG_TMU_TIMER
 CONFIG_TPL_PAD_TO
-- 
2.34.1.173.g76aa8bc2d0-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
