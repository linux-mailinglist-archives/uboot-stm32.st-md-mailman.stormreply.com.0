Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF58479B84
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 Dec 2021 16:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53981C5EC6B;
	Sat, 18 Dec 2021 15:08:15 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E073C5A4FE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Dec 2021 15:08:13 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id c3so7151280iob.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Dec 2021 07:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+UCAiSC6Cvf7fG4V8UYAuBn1TiHlTz3jtDQM9yDgyc=;
 b=gawLtoroj4sUQP6JBRNi0kfsGzOTdfqPKD4oam5VTUUw7OWNPr9xXuJIKZGb+dKrUU
 b90PQ0OIcKKHrwlYX/Ki5NT3nF0o3zlGptGuk1RXB2Vl8DCtDZoqQkVred8n4Gj5t0pX
 gwrS132GiPlWIxhhzaWHoc2GBWjQTSMMQLFms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+UCAiSC6Cvf7fG4V8UYAuBn1TiHlTz3jtDQM9yDgyc=;
 b=adVIfiTDLqdYMihawSQOX56g1mBE1giHXCI7lZmkVT1zD1aWnVHF/1/Akj4OHDF0hP
 iJGOm8q2XyKOOiPL9Mw76YHHLTG4Fq65qUXZTcZl7kedq4Ij5hTbQuamfWST5umeXfPv
 pjXcs1GqycNUICisL5HdEYuR4iNH0CGIxc6I/Zozjf3lmIJcjsPMzGlpgKruRkBy0oFJ
 IGoU8q9InzBxzmmuVx80Z/ee/exfMQfK+B9ZDSM8/M6aAkLPVu3l7D9fgGCDDo6Hk6GA
 A5UIf+aE5L+c+YTTlrcCx6pw1WSmwOL/Wp6fabIGvr0WzpoTrVn5fDFtw/W+lDSIG16d
 0HMg==
X-Gm-Message-State: AOAM533C6b65RjkX104ykW52X+WSaKuEWhj6a6m5W0UnxC7PweelwsEN
 1Jaa3l6x+/+tnzGChaME1/7E5Q==
X-Google-Smtp-Source: ABdhPJxzImhPVai8xf3uOiyGZj7R9QS10m7L0N8sdFQ/TQ0umFlzOxcvk2fsxl/VoAhLZX1MuIWgkg==
X-Received: by 2002:a5d:8b42:: with SMTP id c2mr4192696iot.102.1639840091668; 
 Sat, 18 Dec 2021 07:08:11 -0800 (PST)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id k9sm7011755ilv.61.2021.12.18.07.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 07:08:11 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat, 18 Dec 2021 08:08:04 -0700
Message-Id: <20211218150805.1083645-3-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211218150805.1083645-1-sjg@chromium.org>
References: <20211218150805.1083645-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rick Chen <rick@andestech.com>,
 Chin-Liang See <clsee@altera.com>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Wolfgang Denk <wd@denx.de>,
 Ran Wang <ran.wang_1@nxp.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Tom Rini <trini@konsulko.com>, Vladimir Oltean <olteanv@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>, Marek Vasut <marek.vasut@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Wasim Khan <wasim.khan@nxp.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Purna Chandra Mandal <purna.mandal@microchip.com>,
 Vitaly Andrianov <vitalya@ti.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Sandeep Sheriker M <sandeep.sheriker@microchip.com>,
 Sean Anderson <seanga2@gmail.com>, Olaf Mandel <o.mandel@menlosystems.com>,
 Anatolij Gustschin <agust@denx.de>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Dave Gerlach <d-gerlach@ti.com>,
 Pavel Machek <pavel@denx.de>, Simon Glass <sjg@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, "Andrew F. Davis" <afd@ti.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alban Bedel <alban.bedel@aerq.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Dalon Westergreen <dwesterg@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH 3/4] Convert CONFIG_TIMESTAMP to Kconfig
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

 arch/Kconfig                                   |  1 +
 arch/arm/Kconfig                               |  1 +
 arch/arm/cpu/armv8/fsl-layerscape/Kconfig      |  1 +
 arch/powerpc/cpu/mpc85xx/Kconfig               |  2 ++
 boot/Kconfig                                   | 11 +++++++++++
 configs/am335x_boneblack_vboot_defconfig       |  1 +
 configs/am335x_evm_defconfig                   |  1 +
 configs/am335x_evm_spiboot_defconfig           |  1 +
 configs/am335x_guardian_defconfig              |  1 +
 configs/am335x_hs_evm_defconfig                |  1 +
 configs/am335x_hs_evm_uart_defconfig           |  1 +
 configs/am335x_shc_defconfig                   |  1 +
 configs/am335x_shc_ict_defconfig               |  1 +
 configs/am335x_shc_netboot_defconfig           |  1 +
 configs/am335x_shc_sdboot_defconfig            |  1 +
 configs/am335x_sl50_defconfig                  |  1 +
 configs/am64x_evm_a53_defconfig                |  9 +++------
 configs/am64x_evm_r5_defconfig                 |  8 ++------
 configs/chiliboard_defconfig                   |  1 +
 configs/cm_t335_defconfig                      |  1 +
 configs/colibri_pxa270_defconfig               |  1 +
 configs/elgin-rv1108_defconfig                 |  2 +-
 configs/evb-ast2600_defconfig                  |  4 +---
 configs/imgtec_xilfpga_defconfig               |  1 +
 configs/imx28_xea_defconfig                    |  1 +
 configs/k2e_evm_defconfig                      |  1 +
 configs/k2e_hs_evm_defconfig                   |  1 +
 configs/k2g_evm_defconfig                      |  1 +
 configs/k2g_hs_evm_defconfig                   |  1 +
 configs/k2hk_evm_defconfig                     |  1 +
 configs/k2hk_hs_evm_defconfig                  |  1 +
 configs/k2l_evm_defconfig                      |  1 +
 configs/k2l_hs_evm_defconfig                   |  1 +
 configs/ls1021atsn_qspi_defconfig              |  4 ++--
 configs/ls1021atsn_sdcard_defconfig            |  4 ++--
 configs/pic32mzdask_defconfig                  |  1 +
 configs/sam9x60ek_nandflash_defconfig          |  2 +-
 configs/sam9x60ek_qspiflash_defconfig          |  2 +-
 configs/sama5d27_som1_ek_mmc1_defconfig        |  2 +-
 configs/sama5d27_som1_ek_mmc_defconfig         |  2 +-
 configs/sama5d27_som1_ek_qspiflash_defconfig   |  2 +-
 configs/sama5d27_wlsom1_ek_mmc_defconfig       |  2 +-
 configs/sama5d27_wlsom1_ek_qspiflash_defconfig |  2 +-
 configs/sama5d2_icp_mmc_defconfig              |  2 +-
 configs/sama5d2_ptc_ek_mmc_defconfig           |  2 +-
 configs/sama5d2_ptc_ek_nandflash_defconfig     |  2 +-
 configs/sama5d2_xplained_emmc_defconfig        |  2 +-
 configs/sama5d2_xplained_mmc_defconfig         |  2 +-
 configs/sama5d2_xplained_qspiflash_defconfig   |  2 +-
 configs/sama5d2_xplained_spiflash_defconfig    |  2 +-
 configs/snow_defconfig                         |  1 -
 configs/socfpga_arria10_defconfig              |  1 +
 configs/socfpga_arria5_defconfig               |  1 +
 configs/socfpga_cyclone5_defconfig             |  1 +
 configs/socfpga_dbm_soc1_defconfig             |  1 +
 configs/socfpga_de0_nano_soc_defconfig         |  1 +
 configs/socfpga_de10_nano_defconfig            |  1 +
 configs/socfpga_de1_soc_defconfig              |  1 +
 configs/socfpga_is1_defconfig                  |  1 +
 configs/socfpga_mcvevk_defconfig               |  1 +
 configs/socfpga_sockit_defconfig               |  1 +
 configs/socfpga_sr1500_defconfig               |  1 +
 configs/socfpga_vining_fpga_defconfig          |  1 +
 configs/stm32mp15_defconfig                    |  1 -
 configs/stm32mp15_trusted_defconfig            |  1 -
 configs/stmark2_defconfig                      |  1 +
 configs/tools-only_defconfig                   |  1 +
 configs/uniphier_ld4_sld8_defconfig            |  1 +
 configs/uniphier_v7_defconfig                  |  1 +
 configs/uniphier_v8_defconfig                  |  1 +
 include/configs/am335x_evm.h                   |  4 ----
 include/configs/am335x_guardian.h              |  4 ----
 include/configs/am335x_shc.h                   |  4 ----
 include/configs/am335x_sl50.h                  |  4 ----
 include/configs/chiliboard.h                   |  4 ----
 include/configs/cm_t335.h                      |  1 -
 include/configs/colibri_pxa270.h               |  1 -
 include/configs/ids8313.h                      |  1 -
 include/configs/imgtec_xilfpga.h               |  1 -
 include/configs/m53menlo.h                     |  2 --
 include/configs/pic32mzdask.h                  |  1 -
 include/configs/sandbox.h                      |  1 -
 include/configs/socfpga_common.h               |  2 --
 include/configs/socrates.h                     |  2 --
 include/configs/stmark2.h                      |  2 --
 include/configs/ti_armv7_keystone2.h           |  1 -
 include/configs/uniphier.h                     |  2 --
 include/configs/xea.h                          |  2 --
 net/Kconfig                                    |  1 +
 scripts/config_whitelist.txt                   |  1 -
 90 files changed, 84 insertions(+), 77 deletions(-)

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
diff --git a/configs/am64x_evm_a53_defconfig b/configs/am64x_evm_a53_defconfig
index 698e80a331a..3ce2129e491 100644
--- a/configs/am64x_evm_a53_defconfig
+++ b/configs/am64x_evm_a53_defconfig
@@ -12,6 +12,7 @@ CONFIG_K3_ATF_LOAD_ADDR=0x701c0000
 CONFIG_TARGET_AM642_A53_EVM=y
 CONFIG_ENV_SIZE=0x20000
 CONFIG_ENV_OFFSET=0x680000
+CONFIG_DM_GPIO=y
 CONFIG_SPL_DM_SPI=y
 CONFIG_DEFAULT_DEVICE_TREE="k3-am642-evm"
 CONFIG_SPL_TEXT_BASE=0x80080000
@@ -35,7 +36,6 @@ CONFIG_SPL_SEPARATE_BSS=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x1400
 CONFIG_SPL_DMA=y
-CONFIG_SPL_DM_GPIO=y
 CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_DM_MAILBOX=y
@@ -77,9 +77,9 @@ CONFIG_SPL_SYSCON=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_CLK=y
 CONFIG_SPL_CLK=y
-CONFIG_CLK_TI_SCI=y
-CONFIG_CLK_CCF=y
 CONFIG_SPL_CLK_CCF=y
+CONFIG_CLK_CCF=y
+CONFIG_CLK_TI_SCI=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
 CONFIG_DFU_SF=y
@@ -90,7 +90,6 @@ CONFIG_TI_K3_NAVSS_UDMA=y
 CONFIG_TI_SCI_PROTOCOL=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_OMAP24XX=y
-CONFIG_DM_GPIO=y
 CONFIG_DM_MAILBOX=y
 CONFIG_K3_SEC_PROXY=y
 CONFIG_SUPPORT_EMMC_BOOT=y
@@ -112,9 +111,7 @@ CONFIG_TI_AM65_CPSW_NUSS=y
 CONFIG_PHY=y
 CONFIG_SPL_PHY=y
 CONFIG_PHY_CADENCE_TORRENT=y
-CONFIG_SPL_PHY_CADENCE_TORRENT=y
 CONFIG_PHY_J721E_WIZ=y
-CONFIG_SPL_PHY_J721E_WIZ=y
 CONFIG_PINCTRL=y
 CONFIG_SPL_PINCTRL=y
 CONFIG_PINCTRL_SINGLE=y
diff --git a/configs/am64x_evm_r5_defconfig b/configs/am64x_evm_r5_defconfig
index 342e552f749..2b609ad9acc 100644
--- a/configs/am64x_evm_r5_defconfig
+++ b/configs/am64x_evm_r5_defconfig
@@ -10,7 +10,6 @@ CONFIG_TARGET_AM642_R5_EVM=y
 CONFIG_ENV_SIZE=0x20000
 CONFIG_ENV_OFFSET=0x680000
 CONFIG_DM_GPIO=y
-CONFIG_SPL_DM_GPIO=y
 CONFIG_SPL_DM_SPI=y
 CONFIG_DEFAULT_DEVICE_TREE="k3-am642-r5-evm"
 CONFIG_SPL_TEXT_BASE=0x70000000
@@ -84,9 +83,9 @@ CONFIG_SPL_SYSCON=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_CLK=y
 CONFIG_SPL_CLK=y
-CONFIG_CLK_TI_SCI=y
-CONFIG_CLK_CCF=y
 CONFIG_SPL_CLK_CCF=y
+CONFIG_CLK_CCF=y
+CONFIG_CLK_TI_SCI=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
 CONFIG_DFU_SF=y
@@ -107,11 +106,8 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_PHY=y
 CONFIG_SPL_PHY=y
 CONFIG_PHY_CADENCE_SIERRA=y
-CONFIG_SPL_PHY_CADENCE_SIERRA=y
 CONFIG_PHY_CADENCE_TORRENT=y
-CONFIG_SPL_PHY_CADENCE_TORRENT=y
 CONFIG_PHY_J721E_WIZ=y
-CONFIG_SPL_PHY_J721E_WIZ=y
 CONFIG_PINCTRL=y
 # CONFIG_PINCTRL_GENERIC is not set
 CONFIG_SPL_PINCTRL=y
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
diff --git a/configs/elgin-rv1108_defconfig b/configs/elgin-rv1108_defconfig
index ed6557a6a35..e600978f570 100644
--- a/configs/elgin-rv1108_defconfig
+++ b/configs/elgin-rv1108_defconfig
@@ -6,9 +6,9 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_DEFAULT_DEVICE_TREE="rv1108-elgin-r1"
 CONFIG_ROCKCHIP_RV1108=y
-# CONFIG_DEBUG_UART_BOARD_INIT is not set
 CONFIG_ROCKCHIP_BOOT_MODE_REG=0
 CONFIG_TARGET_ELGIN_RV1108=y
+# CONFIG_DEBUG_UART_BOARD_INIT is not set
 CONFIG_DEBUG_UART_BASE=0x10210000
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_DEBUG_UART=y
diff --git a/configs/evb-ast2600_defconfig b/configs/evb-ast2600_defconfig
index 0f03a72e525..ebdc06b35af 100644
--- a/configs/evb-ast2600_defconfig
+++ b/configs/evb-ast2600_defconfig
@@ -2,9 +2,9 @@ CONFIG_ARM=y
 CONFIG_SYS_DCACHE_OFF=y
 CONFIG_SPL_SYS_THUMB_BUILD=y
 CONFIG_ARCH_ASPEED=y
+CONFIG_SYS_TEXT_BASE=0x80000000
 CONFIG_SYS_MALLOC_LEN=0x2000000
 CONFIG_SYS_MALLOC_F_LEN=0x800
-CONFIG_SYS_TEXT_BASE=0x80000000
 CONFIG_ASPEED_AST2600=y
 CONFIG_TARGET_EVB_AST2600=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
@@ -75,8 +75,6 @@ CONFIG_SYS_NS16550=y
 CONFIG_SYSRESET=y
 CONFIG_SPL_SYSRESET=y
 CONFIG_WDT=y
-CONFIG_SHA512_ALGO=y
-CONFIG_SHA512=y
 CONFIG_SHA384=y
 CONFIG_HEXDUMP=y
 # CONFIG_EFI_LOADER is not set
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
diff --git a/configs/ls1021atsn_qspi_defconfig b/configs/ls1021atsn_qspi_defconfig
index 4385df6248d..5c8cee3ea91 100644
--- a/configs/ls1021atsn_qspi_defconfig
+++ b/configs/ls1021atsn_qspi_defconfig
@@ -35,6 +35,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_ENV_OVERWRITE=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_DM_I2C=y
@@ -51,13 +52,12 @@ CONFIG_SPI_FLASH_DATAFLASH=y
 CONFIG_PHY_ATHEROS=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_FIXED=y
-CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_ETH=y
 CONFIG_DM_MDIO=y
 CONFIG_DM_DSA=y
-CONFIG_SJA1105=y
 CONFIG_PHY_GIGE=y
 CONFIG_MII=y
+CONFIG_SJA1105=y
 CONFIG_TSEC_ENET=y
 CONFIG_NVME=y
 CONFIG_PCI=y
diff --git a/configs/ls1021atsn_sdcard_defconfig b/configs/ls1021atsn_sdcard_defconfig
index 506a33789cd..719452985a7 100644
--- a/configs/ls1021atsn_sdcard_defconfig
+++ b/configs/ls1021atsn_sdcard_defconfig
@@ -50,6 +50,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_ENV_OVERWRITE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_DM_I2C=y
@@ -66,13 +67,12 @@ CONFIG_SPI_FLASH_DATAFLASH=y
 CONFIG_PHY_ATHEROS=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_FIXED=y
-CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_ETH=y
 CONFIG_DM_MDIO=y
 CONFIG_DM_DSA=y
-CONFIG_SJA1105=y
 CONFIG_PHY_GIGE=y
 CONFIG_MII=y
+CONFIG_SJA1105=y
 CONFIG_TSEC_ENET=y
 CONFIG_NVME=y
 CONFIG_PCI=y
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
diff --git a/configs/sam9x60ek_nandflash_defconfig b/configs/sam9x60ek_nandflash_defconfig
index fe88daf4317..48b6a6a7746 100644
--- a/configs/sam9x60ek_nandflash_defconfig
+++ b/configs/sam9x60ek_nandflash_defconfig
@@ -29,8 +29,8 @@ CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_CLK=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 CONFIG_CMD_MMC=y
 CONFIG_CMD_NAND=y
diff --git a/configs/sam9x60ek_qspiflash_defconfig b/configs/sam9x60ek_qspiflash_defconfig
index 7a5d4d0600c..af0929476ac 100644
--- a/configs/sam9x60ek_qspiflash_defconfig
+++ b/configs/sam9x60ek_qspiflash_defconfig
@@ -30,8 +30,8 @@ CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_CLK=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 CONFIG_CMD_MMC=y
 CONFIG_CMD_NAND=y
diff --git a/configs/sama5d27_som1_ek_mmc1_defconfig b/configs/sama5d27_som1_ek_mmc1_defconfig
index 472890183fc..afcd41a9655 100644
--- a/configs/sama5d27_som1_ek_mmc1_defconfig
+++ b/configs/sama5d27_som1_ek_mmc1_defconfig
@@ -37,8 +37,8 @@ CONFIG_MISC_INIT_R=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d27_som1_ek_mmc_defconfig b/configs/sama5d27_som1_ek_mmc_defconfig
index 811e7f7a7c0..149e4802c9c 100644
--- a/configs/sama5d27_som1_ek_mmc_defconfig
+++ b/configs/sama5d27_som1_ek_mmc_defconfig
@@ -38,8 +38,8 @@ CONFIG_MISC_INIT_R=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d27_som1_ek_qspiflash_defconfig b/configs/sama5d27_som1_ek_qspiflash_defconfig
index 7bff5726fc7..53bd86ddb28 100644
--- a/configs/sama5d27_som1_ek_qspiflash_defconfig
+++ b/configs/sama5d27_som1_ek_qspiflash_defconfig
@@ -36,8 +36,8 @@ CONFIG_MISC_INIT_R=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d27_wlsom1_ek_mmc_defconfig b/configs/sama5d27_wlsom1_ek_mmc_defconfig
index b379c26d352..d1dee0226e0 100644
--- a/configs/sama5d27_wlsom1_ek_mmc_defconfig
+++ b/configs/sama5d27_wlsom1_ek_mmc_defconfig
@@ -40,8 +40,8 @@ CONFIG_SPL_AT91_MCK_BYPASS=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d27_wlsom1_ek_qspiflash_defconfig b/configs/sama5d27_wlsom1_ek_qspiflash_defconfig
index b68d6cde3d3..fa9be2abc63 100644
--- a/configs/sama5d27_wlsom1_ek_qspiflash_defconfig
+++ b/configs/sama5d27_wlsom1_ek_qspiflash_defconfig
@@ -43,8 +43,8 @@ CONFIG_SPL_AT91_MCK_BYPASS=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d2_icp_mmc_defconfig b/configs/sama5d2_icp_mmc_defconfig
index 3c7500ce7b6..7761a57e0cc 100644
--- a/configs/sama5d2_icp_mmc_defconfig
+++ b/configs/sama5d2_icp_mmc_defconfig
@@ -40,9 +40,9 @@ CONFIG_SPL_RAM_DEVICE=y
 CONFIG_SPL_AT91_MCK_BYPASS=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
+# CONFIG_CMD_IMI is not set
 CONFIG_CMD_DM=y
 CONFIG_CMD_GPIO=y
-# CONFIG_CMD_IMI is not set
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d2_ptc_ek_mmc_defconfig b/configs/sama5d2_ptc_ek_mmc_defconfig
index 77053bce6ff..9f458e100b2 100644
--- a/configs/sama5d2_ptc_ek_mmc_defconfig
+++ b/configs/sama5d2_ptc_ek_mmc_defconfig
@@ -29,8 +29,8 @@ CONFIG_MISC_INIT_R=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d2_ptc_ek_nandflash_defconfig b/configs/sama5d2_ptc_ek_nandflash_defconfig
index 07ed9d178e3..6460ff3dad5 100644
--- a/configs/sama5d2_ptc_ek_nandflash_defconfig
+++ b/configs/sama5d2_ptc_ek_nandflash_defconfig
@@ -29,8 +29,8 @@ CONFIG_MISC_INIT_R=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d2_xplained_emmc_defconfig b/configs/sama5d2_xplained_emmc_defconfig
index 0c72f33f2f5..844a9cde647 100644
--- a/configs/sama5d2_xplained_emmc_defconfig
+++ b/configs/sama5d2_xplained_emmc_defconfig
@@ -36,8 +36,8 @@ CONFIG_BOOTCOMMAND="fatload mmc 0:1 0x22000000 at91-sama5d2_xplained.dtb; fatloa
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d2_xplained_mmc_defconfig b/configs/sama5d2_xplained_mmc_defconfig
index 8919f612d36..0de06365878 100644
--- a/configs/sama5d2_xplained_mmc_defconfig
+++ b/configs/sama5d2_xplained_mmc_defconfig
@@ -38,8 +38,8 @@ CONFIG_MISC_INIT_R=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d2_xplained_qspiflash_defconfig b/configs/sama5d2_xplained_qspiflash_defconfig
index 58919ab3ebb..a6e002e59ef 100644
--- a/configs/sama5d2_xplained_qspiflash_defconfig
+++ b/configs/sama5d2_xplained_qspiflash_defconfig
@@ -38,8 +38,8 @@ CONFIG_MISC_INIT_R=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/sama5d2_xplained_spiflash_defconfig b/configs/sama5d2_xplained_spiflash_defconfig
index ae192c00573..676385fe558 100644
--- a/configs/sama5d2_xplained_spiflash_defconfig
+++ b/configs/sama5d2_xplained_spiflash_defconfig
@@ -42,8 +42,8 @@ CONFIG_SYS_SPI_U_BOOT_OFFS=0x10000
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_DM=y
-CONFIG_CMD_GPIO=y
 # CONFIG_CMD_FLASH is not set
+CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
diff --git a/configs/snow_defconfig b/configs/snow_defconfig
index 00181124eca..e5bac37808e 100644
--- a/configs/snow_defconfig
+++ b/configs/snow_defconfig
@@ -18,7 +18,6 @@ CONFIG_SPL_TEXT_BASE=0x02023400
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0x12c30000
 CONFIG_DEBUG_UART_CLOCK=100000000
-CONFIG_DEBUG_UART_S5P=y
 CONFIG_IDENT_STRING=" for snow"
 CONFIG_DEBUG_UART=y
 CONFIG_DISTRO_DEFAULTS=y
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
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 9c638abeee5..db1947f7a46 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -78,7 +78,6 @@ CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
 CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
-# CONFIG_SCMI_AGENT_MAILBOX is not set
 CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 7401c4f9beb..b6a5b6197bc 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -79,7 +79,6 @@ CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
 CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
-# CONFIG_SCMI_AGENT_MAILBOX is not set
 CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
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
