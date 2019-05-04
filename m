Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35B141F2
	for <lists+uboot-stm32@lfdr.de>; Sun,  5 May 2019 20:42:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1145C5F1E7
	for <lists+uboot-stm32@lfdr.de>; Sun,  5 May 2019 18:42:09 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F6DDC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 May 2019 20:04:05 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s15so12021443wra.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 May 2019 13:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wcm1Srw8vby5ua6jW9V3KrcTSHWZRh9AorCTpoDQ7w8=;
 b=hS2vtJy4aRH7QHB9B1O1DDqK/fmKN5iQXyUaQgSkqdlcEv0dUibtf0LQq4K+S/eO5N
 lu8QzjiRcVyXc590npwY5x5CPIAzC4tv6LoNaVf0xEx9p09ElimOrx8/kta1xayKpnmd
 RgKjTKBfR4NGCrzCuwCSSQcqsIu9FkYbwiEVE3lA6kuqF3NaXaqvyfbOe3Hsr2itmICG
 0ghJIPSPFprez8qB7DHIV5JX/Uz0OsnWPvh5lfdt/AUIwez6V63HRqa7vJKJ2ZXozX2L
 TRzXfauj5U3mvcNIrLbZQldRtqlTfCRqDJSvpY/iTCi631llE8127qiXs9Err2ZoBxnn
 iDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wcm1Srw8vby5ua6jW9V3KrcTSHWZRh9AorCTpoDQ7w8=;
 b=HC7RThG3PmP+izEB0yxNcWMM9CE78pdQUyfLXDdz8Vfmw88a6uUorn2jpBBUNy5yPV
 C+zzg0rsSuUpqESaMU17niPy8OFHhz4RDLmjNFADZfHKQz+hQ8Zdo+iBNnGJvf2Q7QMp
 AQWHpfhBpTiN5z4id9HzR5OQlLXMmT8aHPMxZCTKt2lT2QZgMG+Gk0GyadyhHYrQkALC
 LiTdhyrOk1xFEHzZ5KTJCQVLeNlFGgY6DTxde0sKzIMy9AeQA6SuOX7z/zTLKSqWZU2h
 gfX1olmAQAEATaupQWGglF8sgnJY0aVy9Gj3Dh1eD5Y8iSbf9wUOw6K+d9GiP/RSYEDd
 HLgA==
X-Gm-Message-State: APjAAAVq919Ro/S/9wPbKjx5l9rVo7OIAHCziftQxMNbiDwRsqaWa9gl
 uB+hnNQWfQg9fgDcBNhpi5Y=
X-Google-Smtp-Source: APXvYqxKSxHDe1xCfmrzuLFCPLZ4Va1iQsxDHoy1L9iMykTrQbkMf72b4p4Ip0VU0xGna3lzTodb1w==
X-Received: by 2002:adf:c986:: with SMTP id f6mr11855903wrh.93.1557000243959; 
 Sat, 04 May 2019 13:04:03 -0700 (PDT)
Received: from ubuntu.home ([2a02:8071:6a3:700:2df8:99ba:e50f:756b])
 by smtp.gmail.com with ESMTPSA id r12sm1145817wrx.32.2019.05.04.13.04.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 May 2019 13:04:02 -0700 (PDT)
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
To: Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de
Date: Sat,  4 May 2019 22:03:56 +0200
Message-Id: <20190504200356.22099-1-simon.k.r.goldschmidt@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 18:42:07 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Christophe Kerello <christophe.kerello@st.com>,
 Vignesh R <vigneshr@ti.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Kever Yang <kever.yang@rock-chips.com>,
 Alex Kiernan <alex.kiernan@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Ruchika Gupta <ruchika.gupta@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Marek Vasut <marex@denx.de>,
 Tien Fong Chee <tien.fong.chee@intel.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Abel Vesa <abel.vesa@nxp.com>, Sumit Garg <sumit.garg@nxp.com>,
 Jagan Teki <jagan@openedev.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Michal Simek <michal.simek@xilinx.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Lokesh Vutla <lokeshvutla@ti.com>, Stefano Babic <sbabic@denx.de>,
 Shengzhou Liu <Shengzhou.Liu@nxp.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 York Sun <york.sun@nxp.com>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Mian Yousaf Kaukab <ykaukab@suse.de>, Ashish Kumar <ashish.kumar@nxp.com>,
 Jeremy Gebben <jgebben@sweptlaser.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Bin Meng <bmeng.cn@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Po Liu <po.liu@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>, "Andrew F. Davis" <afd@ti.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Mario Six <mario.six@gdsys.cc>, Lukasz Majewski <lukma@denx.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 "Marty E. Plummer" <hanetzer@startmail.com>, Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] spl: kconfig: separate sysreset and firmware
	drivers from misc
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

This adds separate kconfig options for drivers/sysreset and
drivers/firmware.

Up to now, CONFIG_SPL_DRIVERS_MISC_SUPPORT added drivers/misc to SPL
build but also added drivers/firmware and drivers/sysreset at the same
time.

Since that is confusing, this patch adds CONFIG_SPL_SYSRESET_SUPPORT for
drivers/sysreset and CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT for
drivers/firmware (and accordingly for the TPL options).

To keep the binaries unchanged, this patch enables the 2 new options
on all boards where DRIVERS_MISC_SUPPORT has been enabled before.

Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
---

 arch/arm/mach-rockchip/Kconfig                |  4 +++
 arch/arm/mach-rockchip/rk3288/Kconfig         |  8 ++++++
 arch/arm/mach-stm32/Kconfig                   |  2 ++
 arch/arm/mach-stm32mp/Kconfig                 |  2 ++
 common/spl/Kconfig                            | 28 +++++++++++++++++++
 configs/B4420QDS_NAND_defconfig               |  2 ++
 configs/B4860QDS_NAND_defconfig               |  2 ++
 configs/C29XPCIE_NAND_defconfig               |  2 ++
 configs/P1010RDB-PA_36BIT_NAND_defconfig      |  4 +++
 configs/P1010RDB-PA_36BIT_SDCARD_defconfig    |  2 ++
 configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig  |  2 ++
 configs/P1010RDB-PA_NAND_defconfig            |  4 +++
 configs/P1010RDB-PA_SDCARD_defconfig          |  2 ++
 configs/P1010RDB-PA_SPIFLASH_defconfig        |  2 ++
 configs/P1010RDB-PB_36BIT_NAND_defconfig      |  4 +++
 configs/P1010RDB-PB_36BIT_SDCARD_defconfig    |  2 ++
 configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig  |  2 ++
 configs/P1010RDB-PB_NAND_defconfig            |  4 +++
 configs/P1010RDB-PB_SDCARD_defconfig          |  2 ++
 configs/P1010RDB-PB_SPIFLASH_defconfig        |  2 ++
 configs/T1023RDB_NAND_defconfig               |  2 ++
 configs/T1023RDB_SDCARD_defconfig             |  2 ++
 configs/T1023RDB_SPIFLASH_defconfig           |  2 ++
 configs/T1024QDS_NAND_defconfig               |  2 ++
 configs/T1024QDS_SDCARD_defconfig             |  2 ++
 configs/T1024QDS_SPIFLASH_defconfig           |  2 ++
 configs/T1024RDB_NAND_defconfig               |  2 ++
 configs/T1024RDB_SDCARD_defconfig             |  2 ++
 configs/T1024RDB_SPIFLASH_defconfig           |  2 ++
 configs/T1040D4RDB_NAND_defconfig             |  2 ++
 configs/T1040D4RDB_SDCARD_defconfig           |  2 ++
 configs/T1040D4RDB_SPIFLASH_defconfig         |  2 ++
 configs/T1040RDB_NAND_defconfig               |  2 ++
 configs/T1040RDB_SDCARD_defconfig             |  2 ++
 configs/T1040RDB_SPIFLASH_defconfig           |  2 ++
 configs/T1042D4RDB_NAND_defconfig             |  2 ++
 configs/T1042D4RDB_SDCARD_defconfig           |  2 ++
 configs/T1042D4RDB_SPIFLASH_defconfig         |  2 ++
 .../T1042RDB_PI_NAND_SECURE_BOOT_defconfig    |  2 ++
 configs/T1042RDB_PI_NAND_defconfig            |  2 ++
 configs/T1042RDB_PI_SDCARD_defconfig          |  2 ++
 configs/T1042RDB_PI_SPIFLASH_defconfig        |  2 ++
 configs/T2080QDS_NAND_defconfig               |  2 ++
 configs/T2080QDS_SDCARD_defconfig             |  2 ++
 configs/T2080QDS_SPIFLASH_defconfig           |  2 ++
 configs/T2080RDB_NAND_defconfig               |  2 ++
 configs/T2080RDB_SDCARD_defconfig             |  2 ++
 configs/T2080RDB_SPIFLASH_defconfig           |  2 ++
 configs/T2081QDS_NAND_defconfig               |  2 ++
 configs/T2081QDS_SDCARD_defconfig             |  2 ++
 configs/T2081QDS_SPIFLASH_defconfig           |  2 ++
 configs/T4160QDS_NAND_defconfig               |  2 ++
 configs/T4160QDS_SDCARD_defconfig             |  2 ++
 configs/T4240QDS_NAND_defconfig               |  2 ++
 configs/T4240QDS_SDCARD_defconfig             |  2 ++
 configs/T4240RDB_SDCARD_defconfig             |  2 ++
 configs/am335x_guardian_defconfig             |  2 ++
 configs/am43xx_evm_defconfig                  |  2 ++
 configs/am65x_evm_a53_defconfig               |  2 ++
 configs/am65x_evm_r5_defconfig                |  2 ++
 configs/am65x_hs_evm_a53_defconfig            |  2 ++
 configs/am65x_hs_evm_r5_defconfig             |  2 ++
 configs/chromebook_link64_defconfig           |  2 ++
 configs/imx8qm_mek_defconfig                  |  2 ++
 configs/imx8qxp_mek_defconfig                 |  2 ++
 configs/lion-rk3368_defconfig                 |  4 +++
 configs/ls1021aqds_nand_defconfig             |  2 ++
 configs/ls1021aqds_sdcard_ifc_defconfig       |  2 ++
 configs/ls1021aqds_sdcard_qspi_defconfig      |  2 ++
 ...s1021atwr_sdcard_ifc_SECURE_BOOT_defconfig |  2 ++
 configs/ls1043aqds_nand_defconfig             |  2 ++
 configs/ls1043aqds_sdcard_ifc_defconfig       |  2 ++
 configs/ls1043aqds_sdcard_qspi_defconfig      |  2 ++
 configs/ls1043ardb_nand_SECURE_BOOT_defconfig |  2 ++
 configs/ls1043ardb_nand_defconfig             |  2 ++
 .../ls1043ardb_sdcard_SECURE_BOOT_defconfig   |  2 ++
 configs/ls1043ardb_sdcard_defconfig           |  2 ++
 configs/ls1046aqds_sdcard_ifc_defconfig       |  2 ++
 configs/ls1046aqds_sdcard_qspi_defconfig      |  2 ++
 configs/ls1046ardb_emmc_defconfig             |  2 ++
 configs/ls1046ardb_qspi_spl_defconfig         |  2 ++
 .../ls1046ardb_sdcard_SECURE_BOOT_defconfig   |  2 ++
 configs/ls1046ardb_sdcard_defconfig           |  2 ++
 configs/ls1088aqds_sdcard_ifc_defconfig       |  2 ++
 configs/ls1088aqds_sdcard_qspi_defconfig      |  2 ++
 ...1088ardb_sdcard_qspi_SECURE_BOOT_defconfig |  2 ++
 configs/ls1088ardb_sdcard_qspi_defconfig      |  2 ++
 configs/ls2080aqds_nand_defconfig             |  2 ++
 configs/ls2080aqds_sdcard_defconfig           |  2 ++
 configs/ls2080ardb_nand_defconfig             |  2 ++
 configs/mt7629_rfb_defconfig                  |  2 ++
 configs/qemu-x86_64_defconfig                 |  2 ++
 configs/sama5d27_som1_ek_mmc1_defconfig       |  2 ++
 configs/sama5d27_som1_ek_mmc_defconfig        |  2 ++
 configs/sama5d2_icp_mmc_defconfig             |  2 ++
 configs/sama5d2_xplained_emmc_defconfig       |  2 ++
 configs/sama5d2_xplained_mmc_defconfig        |  2 ++
 configs/sama5d2_xplained_spiflash_defconfig   |  2 ++
 configs/sama5d3_xplained_mmc_defconfig        |  2 ++
 configs/sama5d3_xplained_nandflash_defconfig  |  2 ++
 configs/sama5d3xek_mmc_defconfig              |  2 ++
 configs/sama5d3xek_nandflash_defconfig        |  2 ++
 configs/sama5d3xek_spiflash_defconfig         |  2 ++
 configs/sama5d4_xplained_mmc_defconfig        |  2 ++
 configs/sama5d4_xplained_nandflash_defconfig  |  2 ++
 configs/sama5d4_xplained_spiflash_defconfig   |  2 ++
 configs/sama5d4ek_mmc_defconfig               |  2 ++
 configs/sama5d4ek_nandflash_defconfig         |  2 ++
 configs/sama5d4ek_spiflash_defconfig          |  2 ++
 configs/sandbox_spl_defconfig                 |  2 ++
 configs/sksimx6_defconfig                     |  2 ++
 doc/README.SPL                                |  2 ++
 drivers/Makefile                              |  4 ++-
 include/configs/C29XPCIE.h                    |  2 ++
 include/configs/imx8mq_evk.h                  |  2 ++
 include/configs/ls1046a_common.h              |  2 ++
 include/configs/mx6_common.h                  |  2 ++
 include/configs/mx7_common.h                  |  2 ++
 include/configs/turris_omnia.h                |  2 ++
 119 files changed, 283 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
index 282d728b82..1995630460 100644
--- a/arch/arm/mach-rockchip/Kconfig
+++ b/arch/arm/mach-rockchip/Kconfig
@@ -32,8 +32,10 @@ config ROCKCHIP_RK3188
 	select SPL_REGMAP
 	select SPL_SYSCON
 	select SPL_RAM
+	select SPL_DRIVERS_FIRMWARE_SUPPORT
 	select SPL_DRIVERS_MISC_SUPPORT
 	select SPL_ROCKCHIP_EARLYRETURN_TO_BROM
+	select SPL_SYSRESET_SUPPORT
 	select BOARD_LATE_INIT
 	select ROCKCHIP_BROM_HELPER
 	help
@@ -131,7 +133,9 @@ config ROCKCHIP_RK3399
 	select SPL
 	select SPL_SEPARATE_BSS
 	select SPL_SERIAL_SUPPORT
+	select SPL_DRIVERS_FIRMWARE_SUPPORT
 	select SPL_DRIVERS_MISC_SUPPORT
+	select SPL_SYSRESET_SUPPORT
 	select BOARD_LATE_INIT
 	select ROCKCHIP_BROM_HELPER
 	help
diff --git a/arch/arm/mach-rockchip/rk3288/Kconfig b/arch/arm/mach-rockchip/rk3288/Kconfig
index 50680ce606..1be26e9361 100644
--- a/arch/arm/mach-rockchip/rk3288/Kconfig
+++ b/arch/arm/mach-rockchip/rk3288/Kconfig
@@ -104,6 +104,7 @@ config TARGET_VYASA_RK3288
 	select TPL_BOOTROM_SUPPORT
 	select TPL_CLK
 	select TPL_DM
+	select TPL_DRIVERS_FIRMWARE_SUPPORT
 	select TPL_DRIVERS_MISC_SUPPORT
 	select TPL_LIBCOMMON_SUPPORT
 	select TPL_LIBGENERIC_SUPPORT
@@ -114,6 +115,7 @@ config TARGET_VYASA_RK3288
 	select TPL_REGMAP
 	select TPL_SERIAL_SUPPORT
 	select TPL_SYSCON
+	select TPL_SYSRESET_SUPPORT
 	help
 	  Vyasa is a RK3288-based development board with 2 USB ports,
 	  HDMI, VGA, micro-SD card, audio, WiFi  and Gigabit Ethernet, It
@@ -153,6 +155,9 @@ config SYS_SOC
 config SYS_MALLOC_F_LEN
 	default 0x0800
 
+config SPL_DRIVERS_FIRMWARE_SUPPORT
+	default y
+
 config SPL_DRIVERS_MISC_SUPPORT
 	default y
 
@@ -165,6 +170,9 @@ config SPL_LIBGENERIC_SUPPORT
 config SPL_SERIAL_SUPPORT
 	default y
 
+config SPL_SYSRESET_SUPPORT
+	default y
+
 source "board/amarula/vyasa-rk3288/Kconfig"
 
 source "board/chipspark/popmetal_rk3288/Kconfig"
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index cea5ee2ce5..377419042f 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -31,6 +31,7 @@ config STM32F7
 	select SPL_DM
 	select SPL_DM_RESET
 	select SPL_DM_SEQ_ALIAS
+	select SPL_DRIVERS_FIRMWARE_SUPPORT
 	select SPL_DRIVERS_MISC_SUPPORT
 	select SPL_GPIO_SUPPORT
 	select SPL_LIBCOMMON_SUPPORT
@@ -43,6 +44,7 @@ config STM32F7
 	select SPL_RAM
 	select SPL_SERIAL_SUPPORT
 	select SPL_SYS_MALLOC_SIMPLE
+	select SPL_SYSRESET_SUPPORT
 	select SPL_TIMER
 	select SPL_XIP_SUPPORT
 	select STM32_RCC
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 73aa382712..78707615d8 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -5,6 +5,7 @@ config SPL
 	select SPL_CLK
 	select SPL_DM
 	select SPL_DM_SEQ_ALIAS
+	select SPL_DRIVERS_FIRMWARE_SUPPORT
 	select SPL_DRIVERS_MISC_SUPPORT
 	select SPL_FRAMEWORK
 	select SPL_GPIO_SUPPORT
@@ -17,6 +18,7 @@ config SPL
 	select SPL_DM_RESET
 	select SPL_SERIAL_SUPPORT
 	select SPL_SYSCON
+	select SPL_SYSRESET_SUPPORT
 	imply SPL_DISPLAY_PRINT
 	imply SPL_LIBDISK_SUPPORT
 
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index dd078fe79d..06f73c2fdb 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -368,6 +368,20 @@ config SPL_DRIVERS_MISC_SUPPORT
 	  option to build the drivers in drivers/misc as part of an SPL
 	  build, for those that support building in SPL (not all drivers do).
 
+config SPL_DRIVERS_FIRMWARE_SUPPORT
+	bool "Support firmware drivers"
+	help
+	  Enable firmware drivers in SPL. Enable this option to build the
+	  drivers in drivers/firmware as part of an SPL build, for those that
+	  support building in SPL (not all drivers do).
+
+config SPL_SYSRESET_SUPPORT
+	bool "Support sysreset drivers"
+	help
+	  Enable sysreset drivers in SPL. Enable this option to build the
+	  drivers in drivers/sysreset as part of an SPL build, for those that
+	  support building in SPL (not all drivers do).
+
 config SPL_ENV_SUPPORT
 	bool "Support an environment"
 	help
@@ -1023,6 +1037,20 @@ config TPL_DRIVERS_MISC_SUPPORT
 	  option to build the drivers in drivers/misc as part of an TPL
 	  build, for those that support building in TPL (not all drivers do).
 
+config TPL_DRIVERS_FIRMWARE_SUPPORT
+	bool "Support firmware drivers"
+	help
+	  Enable firmware drivers in TPL. Enable this option to build the
+	  drivers in drivers/firmware as part of an TPL build, for those that
+	  support building in TPL (not all drivers do).
+
+config TPL_SYSRESET_SUPPORT
+	bool "Support sysreset drivers"
+	help
+	  Enable sysreset drivers in TPL. Enable this option to build the
+	  drivers in drivers/sysreset as part of an TPL build, for those that
+	  support building in TPL (not all drivers do).
+
 config TPL_ENV_SUPPORT
 	bool "Support an environment"
 	help
diff --git a/configs/B4420QDS_NAND_defconfig b/configs/B4420QDS_NAND_defconfig
index b3de724ce1..702086d9cc 100644
--- a/configs/B4420QDS_NAND_defconfig
+++ b/configs/B4420QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4420QDS=y
diff --git a/configs/B4860QDS_NAND_defconfig b/configs/B4860QDS_NAND_defconfig
index bd427f3e19..f6581ea357 100644
--- a/configs/B4860QDS_NAND_defconfig
+++ b/configs/B4860QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4860QDS=y
diff --git a/configs/C29XPCIE_NAND_defconfig b/configs/C29XPCIE_NAND_defconfig
index 44ab55ce4b..622369511c 100644
--- a/configs/C29XPCIE_NAND_defconfig
+++ b/configs/C29XPCIE_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_C29XPCIE=y
diff --git a/configs/P1010RDB-PA_36BIT_NAND_defconfig b/configs/P1010RDB-PA_36BIT_NAND_defconfig
index 3fc0136461..fd72fc76ff 100644
--- a/configs/P1010RDB-PA_36BIT_NAND_defconfig
+++ b/configs/P1010RDB-PA_36BIT_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
@@ -21,6 +23,8 @@ CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
 CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_DRIVERS_FIRMWARE_SUPPORT=y
+CONFIG_TPL_SYSRESET_SUPPORT=y
 CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
diff --git a/configs/P1010RDB-PA_36BIT_SDCARD_defconfig b/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
index 27ee0475df..cff8970a3a 100644
--- a/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
+++ b/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
diff --git a/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig b/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
index 57e175f131..535cb6a93a 100644
--- a/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/P1010RDB-PA_NAND_defconfig b/configs/P1010RDB-PA_NAND_defconfig
index 0efaa3b497..f77021c96f 100644
--- a/configs/P1010RDB-PA_NAND_defconfig
+++ b/configs/P1010RDB-PA_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
@@ -20,6 +22,8 @@ CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
 CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_DRIVERS_FIRMWARE_SUPPORT=y
+CONFIG_TPL_SYSRESET_SUPPORT=y
 CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
diff --git a/configs/P1010RDB-PA_SDCARD_defconfig b/configs/P1010RDB-PA_SDCARD_defconfig
index f5769d7756..7417b4dafc 100644
--- a/configs/P1010RDB-PA_SDCARD_defconfig
+++ b/configs/P1010RDB-PA_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
diff --git a/configs/P1010RDB-PA_SPIFLASH_defconfig b/configs/P1010RDB-PA_SPIFLASH_defconfig
index 09c1fcf60c..60d8e9ab89 100644
--- a/configs/P1010RDB-PA_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PA_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/P1010RDB-PB_36BIT_NAND_defconfig b/configs/P1010RDB-PB_36BIT_NAND_defconfig
index aba47c3387..c8de65b87a 100644
--- a/configs/P1010RDB-PB_36BIT_NAND_defconfig
+++ b/configs/P1010RDB-PB_36BIT_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
@@ -21,6 +23,8 @@ CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
 CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_DRIVERS_FIRMWARE_SUPPORT=y
+CONFIG_TPL_SYSRESET_SUPPORT=y
 CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
diff --git a/configs/P1010RDB-PB_36BIT_SDCARD_defconfig b/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
index 7bd0ec0650..2ca0497974 100644
--- a/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
+++ b/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
diff --git a/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig b/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
index de63086c52..35ff1a1d46 100644
--- a/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/P1010RDB-PB_NAND_defconfig b/configs/P1010RDB-PB_NAND_defconfig
index fb088b2c28..54fa0e6cf7 100644
--- a/configs/P1010RDB-PB_NAND_defconfig
+++ b/configs/P1010RDB-PB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
@@ -20,6 +22,8 @@ CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
 CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_DRIVERS_FIRMWARE_SUPPORT=y
+CONFIG_TPL_SYSRESET_SUPPORT=y
 CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
diff --git a/configs/P1010RDB-PB_SDCARD_defconfig b/configs/P1010RDB-PB_SDCARD_defconfig
index 8a46d877aa..8c4a3f3e53 100644
--- a/configs/P1010RDB-PB_SDCARD_defconfig
+++ b/configs/P1010RDB-PB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
diff --git a/configs/P1010RDB-PB_SPIFLASH_defconfig b/configs/P1010RDB-PB_SPIFLASH_defconfig
index ae403b107d..8983e65ac8 100644
--- a/configs/P1010RDB-PB_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1023RDB_NAND_defconfig b/configs/T1023RDB_NAND_defconfig
index 80213d19e9..53e9ecf92f 100644
--- a/configs/T1023RDB_NAND_defconfig
+++ b/configs/T1023RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1023RDB=y
diff --git a/configs/T1023RDB_SDCARD_defconfig b/configs/T1023RDB_SDCARD_defconfig
index 41176c21ce..1b3aefdd26 100644
--- a/configs/T1023RDB_SDCARD_defconfig
+++ b/configs/T1023RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1023RDB=y
diff --git a/configs/T1023RDB_SPIFLASH_defconfig b/configs/T1023RDB_SPIFLASH_defconfig
index f3db41098f..b2cb234d7d 100644
--- a/configs/T1023RDB_SPIFLASH_defconfig
+++ b/configs/T1023RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1024QDS_NAND_defconfig b/configs/T1024QDS_NAND_defconfig
index 3d4099fda0..8f79c1ffdb 100644
--- a/configs/T1024QDS_NAND_defconfig
+++ b/configs/T1024QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
diff --git a/configs/T1024QDS_SDCARD_defconfig b/configs/T1024QDS_SDCARD_defconfig
index 02226df657..b2b6edf53d 100644
--- a/configs/T1024QDS_SDCARD_defconfig
+++ b/configs/T1024QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
diff --git a/configs/T1024QDS_SPIFLASH_defconfig b/configs/T1024QDS_SPIFLASH_defconfig
index 4077a2f728..6bd5474a8e 100644
--- a/configs/T1024QDS_SPIFLASH_defconfig
+++ b/configs/T1024QDS_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1024RDB_NAND_defconfig b/configs/T1024RDB_NAND_defconfig
index ea00def211..71ab9ab65a 100644
--- a/configs/T1024RDB_NAND_defconfig
+++ b/configs/T1024RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024RDB=y
diff --git a/configs/T1024RDB_SDCARD_defconfig b/configs/T1024RDB_SDCARD_defconfig
index 6b966b60d7..37f6119a17 100644
--- a/configs/T1024RDB_SDCARD_defconfig
+++ b/configs/T1024RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024RDB=y
diff --git a/configs/T1024RDB_SPIFLASH_defconfig b/configs/T1024RDB_SPIFLASH_defconfig
index 59e1e77db4..4b9545f3ca 100644
--- a/configs/T1024RDB_SPIFLASH_defconfig
+++ b/configs/T1024RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1040D4RDB_NAND_defconfig b/configs/T1040D4RDB_NAND_defconfig
index 50757d939c..b12b5ade08 100644
--- a/configs/T1040D4RDB_NAND_defconfig
+++ b/configs/T1040D4RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040D4RDB=y
diff --git a/configs/T1040D4RDB_SDCARD_defconfig b/configs/T1040D4RDB_SDCARD_defconfig
index 5d70e014e1..a544001412 100644
--- a/configs/T1040D4RDB_SDCARD_defconfig
+++ b/configs/T1040D4RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040D4RDB=y
diff --git a/configs/T1040D4RDB_SPIFLASH_defconfig b/configs/T1040D4RDB_SPIFLASH_defconfig
index 7b81373fe5..81c2bb57c3 100644
--- a/configs/T1040D4RDB_SPIFLASH_defconfig
+++ b/configs/T1040D4RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1040RDB_NAND_defconfig b/configs/T1040RDB_NAND_defconfig
index 991590e43f..bc67b6eb48 100644
--- a/configs/T1040RDB_NAND_defconfig
+++ b/configs/T1040RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040RDB=y
diff --git a/configs/T1040RDB_SDCARD_defconfig b/configs/T1040RDB_SDCARD_defconfig
index bd0590b508..de1ddc8560 100644
--- a/configs/T1040RDB_SDCARD_defconfig
+++ b/configs/T1040RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040RDB=y
diff --git a/configs/T1040RDB_SPIFLASH_defconfig b/configs/T1040RDB_SPIFLASH_defconfig
index 4ac5e8a484..79363d3b89 100644
--- a/configs/T1040RDB_SPIFLASH_defconfig
+++ b/configs/T1040RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1042D4RDB_NAND_defconfig b/configs/T1042D4RDB_NAND_defconfig
index 9d9e5602a4..18d90ba5e4 100644
--- a/configs/T1042D4RDB_NAND_defconfig
+++ b/configs/T1042D4RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042D4RDB=y
diff --git a/configs/T1042D4RDB_SDCARD_defconfig b/configs/T1042D4RDB_SDCARD_defconfig
index fc3e188b1f..2da4fa21c0 100644
--- a/configs/T1042D4RDB_SDCARD_defconfig
+++ b/configs/T1042D4RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042D4RDB=y
diff --git a/configs/T1042D4RDB_SPIFLASH_defconfig b/configs/T1042D4RDB_SPIFLASH_defconfig
index fdb894304c..7db0a63246 100644
--- a/configs/T1042D4RDB_SPIFLASH_defconfig
+++ b/configs/T1042D4RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig b/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
index f5614ebcff..d0a6bbe80a 100644
--- a/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
+++ b/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SECURE_BOOT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
diff --git a/configs/T1042RDB_PI_NAND_defconfig b/configs/T1042RDB_PI_NAND_defconfig
index 8e32bb70ae..40603cc574 100644
--- a/configs/T1042RDB_PI_NAND_defconfig
+++ b/configs/T1042RDB_PI_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
diff --git a/configs/T1042RDB_PI_SDCARD_defconfig b/configs/T1042RDB_PI_SDCARD_defconfig
index 5134f55d45..e3a98e2249 100644
--- a/configs/T1042RDB_PI_SDCARD_defconfig
+++ b/configs/T1042RDB_PI_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
diff --git a/configs/T1042RDB_PI_SPIFLASH_defconfig b/configs/T1042RDB_PI_SPIFLASH_defconfig
index 2060085984..3518e92ee3 100644
--- a/configs/T1042RDB_PI_SPIFLASH_defconfig
+++ b/configs/T1042RDB_PI_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T2080QDS_NAND_defconfig b/configs/T2080QDS_NAND_defconfig
index 4c39f66096..5188da3368 100644
--- a/configs/T2080QDS_NAND_defconfig
+++ b/configs/T2080QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080QDS=y
diff --git a/configs/T2080QDS_SDCARD_defconfig b/configs/T2080QDS_SDCARD_defconfig
index 5fe12da409..5fda4d4665 100644
--- a/configs/T2080QDS_SDCARD_defconfig
+++ b/configs/T2080QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080QDS=y
diff --git a/configs/T2080QDS_SPIFLASH_defconfig b/configs/T2080QDS_SPIFLASH_defconfig
index 899f61c8a8..915d129f08 100644
--- a/configs/T2080QDS_SPIFLASH_defconfig
+++ b/configs/T2080QDS_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T2080RDB_NAND_defconfig b/configs/T2080RDB_NAND_defconfig
index 1bb90f390d..b21c549e54 100644
--- a/configs/T2080RDB_NAND_defconfig
+++ b/configs/T2080RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080RDB=y
diff --git a/configs/T2080RDB_SDCARD_defconfig b/configs/T2080RDB_SDCARD_defconfig
index 1a7070c816..288e4130c7 100644
--- a/configs/T2080RDB_SDCARD_defconfig
+++ b/configs/T2080RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080RDB=y
diff --git a/configs/T2080RDB_SPIFLASH_defconfig b/configs/T2080RDB_SPIFLASH_defconfig
index ceb0230f93..afaa64e2b2 100644
--- a/configs/T2080RDB_SPIFLASH_defconfig
+++ b/configs/T2080RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T2081QDS_NAND_defconfig b/configs/T2081QDS_NAND_defconfig
index 91a719f11b..e0f0f2f16f 100644
--- a/configs/T2081QDS_NAND_defconfig
+++ b/configs/T2081QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2081QDS=y
diff --git a/configs/T2081QDS_SDCARD_defconfig b/configs/T2081QDS_SDCARD_defconfig
index c1bc0972dd..a016d066c8 100644
--- a/configs/T2081QDS_SDCARD_defconfig
+++ b/configs/T2081QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2081QDS=y
diff --git a/configs/T2081QDS_SPIFLASH_defconfig b/configs/T2081QDS_SPIFLASH_defconfig
index f6a3f61938..ea4ff482df 100644
--- a/configs/T2081QDS_SPIFLASH_defconfig
+++ b/configs/T2081QDS_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T4160QDS_NAND_defconfig b/configs/T4160QDS_NAND_defconfig
index 3021884826..4d525c0d70 100644
--- a/configs/T4160QDS_NAND_defconfig
+++ b/configs/T4160QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4160QDS=y
diff --git a/configs/T4160QDS_SDCARD_defconfig b/configs/T4160QDS_SDCARD_defconfig
index b584638737..18cddf0637 100644
--- a/configs/T4160QDS_SDCARD_defconfig
+++ b/configs/T4160QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4160QDS=y
diff --git a/configs/T4240QDS_NAND_defconfig b/configs/T4240QDS_NAND_defconfig
index e66e5fd47f..2754a604f7 100644
--- a/configs/T4240QDS_NAND_defconfig
+++ b/configs/T4240QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240QDS=y
diff --git a/configs/T4240QDS_SDCARD_defconfig b/configs/T4240QDS_SDCARD_defconfig
index 715ec90304..76ec42eebc 100644
--- a/configs/T4240QDS_SDCARD_defconfig
+++ b/configs/T4240QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240QDS=y
diff --git a/configs/T4240RDB_SDCARD_defconfig b/configs/T4240RDB_SDCARD_defconfig
index eeab2ec720..7c4f129ae0 100644
--- a/configs/T4240RDB_SDCARD_defconfig
+++ b/configs/T4240RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240RDB=y
diff --git a/configs/am335x_guardian_defconfig b/configs/am335x_guardian_defconfig
index 5753b10526..7f63baa881 100644
--- a/configs/am335x_guardian_defconfig
+++ b/configs/am335x_guardian_defconfig
@@ -7,7 +7,9 @@ CONFIG_AM33XX=y
 CONFIG_TARGET_AM335X_GUARDIAN=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/am43xx_evm_defconfig b/configs/am43xx_evm_defconfig
index 526dda2a93..fcbe8497e2 100644
--- a/configs/am43xx_evm_defconfig
+++ b/configs/am43xx_evm_defconfig
@@ -3,7 +3,9 @@ CONFIG_ARCH_OMAP2PLUS=y
 CONFIG_TI_COMMON_CMD_OPTIONS=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_AM43XX=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SPL_LOAD_FIT=y
diff --git a/configs/am65x_evm_a53_defconfig b/configs/am65x_evm_a53_defconfig
index 101fae1456..0514a4d86f 100644
--- a/configs/am65x_evm_a53_defconfig
+++ b/configs/am65x_evm_a53_defconfig
@@ -7,7 +7,9 @@ CONFIG_SOC_K3_AM6=y
 CONFIG_TARGET_AM654_A53_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/am65x_evm_r5_defconfig b/configs/am65x_evm_r5_defconfig
index 8dce577cf7..0a2e58e9bd 100644
--- a/configs/am65x_evm_r5_defconfig
+++ b/configs/am65x_evm_r5_defconfig
@@ -8,7 +8,9 @@ CONFIG_SOC_K3_AM6=y
 CONFIG_TARGET_AM654_R5_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/am65x_hs_evm_a53_defconfig b/configs/am65x_hs_evm_a53_defconfig
index 7af0046ee3..4d3d383695 100644
--- a/configs/am65x_hs_evm_a53_defconfig
+++ b/configs/am65x_hs_evm_a53_defconfig
@@ -8,7 +8,9 @@ CONFIG_SOC_K3_AM6=y
 CONFIG_TARGET_AM654_A53_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/am65x_hs_evm_r5_defconfig b/configs/am65x_hs_evm_r5_defconfig
index 8d5d3590b2..77e86bf5d1 100644
--- a/configs/am65x_hs_evm_r5_defconfig
+++ b/configs/am65x_hs_evm_r5_defconfig
@@ -9,7 +9,9 @@ CONFIG_SOC_K3_AM6=y
 CONFIG_TARGET_AM654_R5_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/chromebook_link64_defconfig b/configs/chromebook_link64_defconfig
index 0278353ef1..6474dc805d 100644
--- a/configs/chromebook_link64_defconfig
+++ b/configs/chromebook_link64_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0x3f8
diff --git a/configs/imx8qm_mek_defconfig b/configs/imx8qm_mek_defconfig
index 238d44d1f5..5406ebac6c 100644
--- a/configs/imx8qm_mek_defconfig
+++ b/configs/imx8qm_mek_defconfig
@@ -8,7 +8,9 @@ CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_IMX8QM_MEK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL_FIT_GENERATOR="arch/arm/mach-imx/mkimage_fit_atf.sh"
diff --git a/configs/imx8qxp_mek_defconfig b/configs/imx8qxp_mek_defconfig
index 2fb2fdf7ff..6180c9667c 100644
--- a/configs/imx8qxp_mek_defconfig
+++ b/configs/imx8qxp_mek_defconfig
@@ -8,7 +8,9 @@ CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_IMX8QXP_MEK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_FIT=y
diff --git a/configs/lion-rk3368_defconfig b/configs/lion-rk3368_defconfig
index 75e85833a7..5a7ad17258 100644
--- a/configs/lion-rk3368_defconfig
+++ b/configs/lion-rk3368_defconfig
@@ -8,7 +8,9 @@ CONFIG_ROCKCHIP_RK3368=y
 CONFIG_ROCKCHIP_SPL_RESERVE_IRAM=0x0
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL_STACK_R_ADDR=0x600000
 CONFIG_SPL=y
@@ -42,6 +44,8 @@ CONFIG_SPL_ATF=y
 CONFIG_TPL=y
 CONFIG_TPL_BOOTROM_SUPPORT=y
 CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_DRIVERS_FIRMWARE_SUPPORT=y
+CONFIG_TPL_SYSRESET_SUPPORT=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
 CONFIG_CMD_SF=y
diff --git a/configs/ls1021aqds_nand_defconfig b/configs/ls1021aqds_nand_defconfig
index 8dd6ca4e2e..13dc23160e 100644
--- a/configs/ls1021aqds_nand_defconfig
+++ b/configs/ls1021aqds_nand_defconfig
@@ -4,7 +4,9 @@ CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021aqds_sdcard_ifc_defconfig b/configs/ls1021aqds_sdcard_ifc_defconfig
index c85c831b13..f5a3b30e29 100644
--- a/configs/ls1021aqds_sdcard_ifc_defconfig
+++ b/configs/ls1021aqds_sdcard_ifc_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021aqds_sdcard_qspi_defconfig b/configs/ls1021aqds_sdcard_qspi_defconfig
index 7c574c72f4..b836739d03 100644
--- a/configs/ls1021aqds_sdcard_qspi_defconfig
+++ b/configs/ls1021aqds_sdcard_qspi_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig b/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
index 28db5286cd..02686bf70f 100644
--- a/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
+++ b/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SECURE_BOOT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1043aqds_nand_defconfig b/configs/ls1043aqds_nand_defconfig
index 6ba95bcb53..778c1ff5dc 100644
--- a/configs/ls1043aqds_nand_defconfig
+++ b/configs/ls1043aqds_nand_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1043aqds_sdcard_ifc_defconfig b/configs/ls1043aqds_sdcard_ifc_defconfig
index dd711282b4..dd2f66ce6e 100644
--- a/configs/ls1043aqds_sdcard_ifc_defconfig
+++ b/configs/ls1043aqds_sdcard_ifc_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1043aqds_sdcard_qspi_defconfig b/configs/ls1043aqds_sdcard_qspi_defconfig
index cc86b1f8d1..6ab8df536f 100644
--- a/configs/ls1043aqds_sdcard_qspi_defconfig
+++ b/configs/ls1043aqds_sdcard_qspi_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1043ardb_nand_SECURE_BOOT_defconfig b/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
index 9d96d22323..8b70b696e1 100644
--- a/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SECURE_BOOT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1043ardb_nand_defconfig b/configs/ls1043ardb_nand_defconfig
index a94c7b782c..0967bc4782 100644
--- a/configs/ls1043ardb_nand_defconfig
+++ b/configs/ls1043ardb_nand_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig b/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
index 90f3d251be..8791fbc19f 100644
--- a/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
@@ -7,7 +7,9 @@ CONFIG_SECURE_BOOT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1043ardb_sdcard_defconfig b/configs/ls1043ardb_sdcard_defconfig
index 418215ee9c..7c36555064 100644
--- a/configs/ls1043ardb_sdcard_defconfig
+++ b/configs/ls1043ardb_sdcard_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1046aqds_sdcard_ifc_defconfig b/configs/ls1046aqds_sdcard_ifc_defconfig
index 28ceabc31e..4d871d67e4 100644
--- a/configs/ls1046aqds_sdcard_ifc_defconfig
+++ b/configs/ls1046aqds_sdcard_ifc_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046aqds_sdcard_qspi_defconfig b/configs/ls1046aqds_sdcard_qspi_defconfig
index 2b11a38c3c..7c44e0029b 100644
--- a/configs/ls1046aqds_sdcard_qspi_defconfig
+++ b/configs/ls1046aqds_sdcard_qspi_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046ardb_emmc_defconfig b/configs/ls1046ardb_emmc_defconfig
index 9b6e56dc0a..bbf0ee660c 100644
--- a/configs/ls1046ardb_emmc_defconfig
+++ b/configs/ls1046ardb_emmc_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046ardb_qspi_spl_defconfig b/configs/ls1046ardb_qspi_spl_defconfig
index f78786ae72..123db40b7c 100644
--- a/configs/ls1046ardb_qspi_spl_defconfig
+++ b/configs/ls1046ardb_qspi_spl_defconfig
@@ -7,7 +7,9 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig b/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
index 5afe6447c1..bd288dab48 100644
--- a/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
+++ b/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
@@ -7,7 +7,9 @@ CONFIG_SECURE_BOOT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1046ardb_sdcard_defconfig b/configs/ls1046ardb_sdcard_defconfig
index bf5e1a062c..ea1f347430 100644
--- a/configs/ls1046ardb_sdcard_defconfig
+++ b/configs/ls1046ardb_sdcard_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1088aqds_sdcard_ifc_defconfig b/configs/ls1088aqds_sdcard_ifc_defconfig
index 58a6795b6d..101e1b4fa9 100644
--- a/configs/ls1088aqds_sdcard_ifc_defconfig
+++ b/configs/ls1088aqds_sdcard_ifc_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1088aqds_sdcard_qspi_defconfig b/configs/ls1088aqds_sdcard_qspi_defconfig
index 186e309b64..6b4d06715b 100644
--- a/configs/ls1088aqds_sdcard_qspi_defconfig
+++ b/configs/ls1088aqds_sdcard_qspi_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig b/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
index 3a0c55566e..a069704bd1 100644
--- a/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
@@ -7,7 +7,9 @@ CONFIG_SECURE_BOOT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1088ardb_sdcard_qspi_defconfig b/configs/ls1088ardb_sdcard_qspi_defconfig
index 15d690240d..826f0faa05 100644
--- a/configs/ls1088ardb_sdcard_qspi_defconfig
+++ b/configs/ls1088ardb_sdcard_qspi_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls2080aqds_nand_defconfig b/configs/ls2080aqds_nand_defconfig
index 48dbf62a35..39546cb089 100644
--- a/configs/ls2080aqds_nand_defconfig
+++ b/configs/ls2080aqds_nand_defconfig
@@ -4,7 +4,9 @@ CONFIG_SYS_TEXT_BASE=0x80400000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls2080aqds_sdcard_defconfig b/configs/ls2080aqds_sdcard_defconfig
index 651e45b573..420803ba0a 100644
--- a/configs/ls2080aqds_sdcard_defconfig
+++ b/configs/ls2080aqds_sdcard_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls2080ardb_nand_defconfig b/configs/ls2080ardb_nand_defconfig
index 56b78feab2..05d5fb60b1 100644
--- a/configs/ls2080ardb_nand_defconfig
+++ b/configs/ls2080ardb_nand_defconfig
@@ -4,7 +4,9 @@ CONFIG_SYS_TEXT_BASE=0x80400000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/mt7629_rfb_defconfig b/configs/mt7629_rfb_defconfig
index 01b952fc15..22626eb7b2 100644
--- a/configs/mt7629_rfb_defconfig
+++ b/configs/mt7629_rfb_defconfig
@@ -5,7 +5,9 @@ CONFIG_SYS_TEXT_BASE=0x41e00000
 CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_MT7629=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/qemu-x86_64_defconfig b/configs/qemu-x86_64_defconfig
index 3ffcb4ae6f..b71a97471a 100644
--- a/configs/qemu-x86_64_defconfig
+++ b/configs/qemu-x86_64_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x1000
 CONFIG_MAX_CPUS=2
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
diff --git a/configs/sama5d27_som1_ek_mmc1_defconfig b/configs/sama5d27_som1_ek_mmc1_defconfig
index 205a439941..e25b650184 100644
--- a/configs/sama5d27_som1_ek_mmc1_defconfig
+++ b/configs/sama5d27_som1_ek_mmc1_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
diff --git a/configs/sama5d27_som1_ek_mmc_defconfig b/configs/sama5d27_som1_ek_mmc_defconfig
index 0a0780066c..3a29ac6011 100644
--- a/configs/sama5d27_som1_ek_mmc_defconfig
+++ b/configs/sama5d27_som1_ek_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d2_icp_mmc_defconfig b/configs/sama5d2_icp_mmc_defconfig
index 1fafb767af..00714d097b 100644
--- a/configs/sama5d2_icp_mmc_defconfig
+++ b/configs/sama5d2_icp_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf801c000
diff --git a/configs/sama5d2_xplained_emmc_defconfig b/configs/sama5d2_xplained_emmc_defconfig
index f643b5a62f..a2cfbdc559 100644
--- a/configs/sama5d2_xplained_emmc_defconfig
+++ b/configs/sama5d2_xplained_emmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
diff --git a/configs/sama5d2_xplained_mmc_defconfig b/configs/sama5d2_xplained_mmc_defconfig
index c25d67bfeb..750ef13569 100644
--- a/configs/sama5d2_xplained_mmc_defconfig
+++ b/configs/sama5d2_xplained_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d2_xplained_spiflash_defconfig b/configs/sama5d2_xplained_spiflash_defconfig
index ac5ae5133c..14ead6c462 100644
--- a/configs/sama5d2_xplained_spiflash_defconfig
+++ b/configs/sama5d2_xplained_spiflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3_xplained_mmc_defconfig b/configs/sama5d3_xplained_mmc_defconfig
index d5021eb76a..e0dac24993 100644
--- a/configs/sama5d3_xplained_mmc_defconfig
+++ b/configs/sama5d3_xplained_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3_xplained_nandflash_defconfig b/configs/sama5d3_xplained_nandflash_defconfig
index eaeb000d18..cebccb1f6c 100644
--- a/configs/sama5d3_xplained_nandflash_defconfig
+++ b/configs/sama5d3_xplained_nandflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3xek_mmc_defconfig b/configs/sama5d3xek_mmc_defconfig
index b770ac4668..6c71d89998 100644
--- a/configs/sama5d3xek_mmc_defconfig
+++ b/configs/sama5d3xek_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3xek_nandflash_defconfig b/configs/sama5d3xek_nandflash_defconfig
index dc8aaeb72f..23ef137fdd 100644
--- a/configs/sama5d3xek_nandflash_defconfig
+++ b/configs/sama5d3xek_nandflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3xek_spiflash_defconfig b/configs/sama5d3xek_spiflash_defconfig
index 84bbf9c8c8..4eeda45923 100644
--- a/configs/sama5d3xek_spiflash_defconfig
+++ b/configs/sama5d3xek_spiflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4_xplained_mmc_defconfig b/configs/sama5d4_xplained_mmc_defconfig
index f673832dff..c9e9eb870f 100644
--- a/configs/sama5d4_xplained_mmc_defconfig
+++ b/configs/sama5d4_xplained_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4_xplained_nandflash_defconfig b/configs/sama5d4_xplained_nandflash_defconfig
index 1a481217c7..a42374d090 100644
--- a/configs/sama5d4_xplained_nandflash_defconfig
+++ b/configs/sama5d4_xplained_nandflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4_xplained_spiflash_defconfig b/configs/sama5d4_xplained_spiflash_defconfig
index f10868900f..ccd7940ecb 100644
--- a/configs/sama5d4_xplained_spiflash_defconfig
+++ b/configs/sama5d4_xplained_spiflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4ek_mmc_defconfig b/configs/sama5d4ek_mmc_defconfig
index d7e1701a57..599df1bfac 100644
--- a/configs/sama5d4ek_mmc_defconfig
+++ b/configs/sama5d4ek_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4ek_nandflash_defconfig b/configs/sama5d4ek_nandflash_defconfig
index e3b3f86eb5..b7f53a3845 100644
--- a/configs/sama5d4ek_nandflash_defconfig
+++ b/configs/sama5d4ek_nandflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4ek_spiflash_defconfig b/configs/sama5d4ek_spiflash_defconfig
index 8db517d7b6..21c76ac851 100644
--- a/configs/sama5d4ek_spiflash_defconfig
+++ b/configs/sama5d4ek_spiflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index a46edee634..e088fbdc5d 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -2,7 +2,9 @@ CONFIG_SYS_TEXT_BASE=0
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SANDBOX_SPL=y
diff --git a/configs/sksimx6_defconfig b/configs/sksimx6_defconfig
index 164614decd..3ef83ad7ae 100644
--- a/configs/sksimx6_defconfig
+++ b/configs/sksimx6_defconfig
@@ -8,7 +8,9 @@ CONFIG_MX6_DDRCAL=y
 CONFIG_TARGET_SKSIMX6=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_SYSRESET_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/doc/README.SPL b/doc/README.SPL
index 7a30fefa96..44660f344e 100644
--- a/doc/README.SPL
+++ b/doc/README.SPL
@@ -59,6 +59,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT (lib/libgeneric.o)
 CONFIG_SPL_POWER_SUPPORT (drivers/power/libpower.o)
 CONFIG_SPL_NAND_SUPPORT (drivers/mtd/nand/raw/libnand.o)
 CONFIG_SPL_DRIVERS_MISC_SUPPORT (drivers/misc)
+CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT (drivers/firmware)
+CONFIG_SPL_SYSRESET_SUPPORT (drivers/sysreset)
 CONFIG_SPL_DMA_SUPPORT (drivers/dma/libdma.o)
 CONFIG_SPL_POST_MEM_SUPPORT (post/drivers/memory.o)
 CONFIG_SPL_NAND_LOAD (drivers/mtd/nand/raw/nand_spl_load.o)
diff --git a/drivers/Makefile b/drivers/Makefile
index a7bba3ed56..cbb47a0206 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -4,10 +4,11 @@ obj-$(CONFIG_$(SPL_TPL_)CLK) += clk/
 obj-$(CONFIG_$(SPL_TPL_)DM) += core/
 obj-$(CONFIG_$(SPL_TPL_)DFU) += dfu/
 obj-$(CONFIG_$(SPL_TPL_)GPIO_SUPPORT) += gpio/
-obj-$(CONFIG_$(SPL_TPL_)DRIVERS_MISC_SUPPORT) += misc/ sysreset/ firmware/
+obj-$(CONFIG_$(SPL_TPL_)DRIVERS_FIRMWARE_SUPPORT) += firmware/
 obj-$(CONFIG_$(SPL_TPL_)I2C_SUPPORT) += i2c/
 obj-$(CONFIG_$(SPL_TPL_)INPUT) += input/
 obj-$(CONFIG_$(SPL_TPL_)LED) += led/
+obj-$(CONFIG_$(SPL_TPL_)DRIVERS_MISC_SUPPORT) += misc/
 obj-$(CONFIG_$(SPL_TPL_)MMC_SUPPORT) += mmc/
 obj-$(CONFIG_$(SPL_TPL_)NAND_SUPPORT) += mtd/nand/raw/
 obj-$(CONFIG_$(SPL_TPL_)PCH_SUPPORT) += pch/
@@ -19,6 +20,7 @@ obj-$(CONFIG_$(SPL_TPL_)RTC_SUPPORT) += rtc/
 obj-$(CONFIG_$(SPL_TPL_)SERIAL_SUPPORT) += serial/
 obj-$(CONFIG_$(SPL_TPL_)SPI_FLASH_SUPPORT) += mtd/spi/
 obj-$(CONFIG_$(SPL_TPL_)SPI_SUPPORT) += spi/
+obj-$(CONFIG_$(SPL_TPL_)SYSRESET_SUPPORT) += sysreset/
 obj-$(CONFIG_$(SPL_TPL_)TIMER) += timer/
 obj-$(CONFIG_$(SPL_TPL_)VIRTIO) += virtio/
 obj-$(CONFIG_$(SPL_)DM_MAILBOX) += mailbox/
diff --git a/include/configs/C29XPCIE.h b/include/configs/C29XPCIE.h
index b4a51a9528..d249bc8381 100644
--- a/include/configs/C29XPCIE.h
+++ b/include/configs/C29XPCIE.h
@@ -21,6 +21,8 @@
 #define CONFIG_SPL_FLUSH_IMAGE
 #define CONFIG_SPL_NAND_INIT
 #define CONFIG_TPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_TPL_DRIVERS_FIRMWARE_SUPPORT
+#define CONFIG_TPL_SYSRESET_SUPPORT
 #define CONFIG_SPL_COMMON_INIT_DDR
 #define CONFIG_SPL_MAX_SIZE		(128 << 10)
 #define CONFIG_TPL_TEXT_BASE		0xf8f81000
diff --git a/include/configs/imx8mq_evk.h b/include/configs/imx8mq_evk.h
index aaecf6f053..bfb9e443c2 100644
--- a/include/configs/imx8mq_evk.h
+++ b/include/configs/imx8mq_evk.h
@@ -23,6 +23,8 @@
 /*#define CONFIG_ENABLE_DDR_TRAINING_DEBUG*/
 #define CONFIG_SPL_WATCHDOG_SUPPORT
 #define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT
+#define CONFIG_SPL_SYSRESET_SUPPORT
 #define CONFIG_SPL_POWER_SUPPORT
 #define CONFIG_SPL_I2C_SUPPORT
 #define CONFIG_SPL_LDSCRIPT		"arch/arm/cpu/armv8/u-boot-spl.lds"
diff --git a/include/configs/ls1046a_common.h b/include/configs/ls1046a_common.h
index ea6209ad2e..78585f9e1c 100644
--- a/include/configs/ls1046a_common.h
+++ b/include/configs/ls1046a_common.h
@@ -112,6 +112,8 @@
 
 #define CONFIG_SPL_NAND_SUPPORT
 #define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT
+#define CONFIG_SPL_SYSRESET_SUPPORT
 #define CONFIG_SPL_MAX_SIZE		0x17000		/* 90 KiB */
 #define CONFIG_SPL_STACK		0x1001f000
 #define CONFIG_SYS_NAND_U_BOOT_DST	CONFIG_SYS_TEXT_BASE
diff --git a/include/configs/mx6_common.h b/include/configs/mx6_common.h
index 6b20c6db58..010dbc98bf 100644
--- a/include/configs/mx6_common.h
+++ b/include/configs/mx6_common.h
@@ -62,6 +62,8 @@
 #define CONFIG_CSF_SIZE			0x2000
 #ifdef CONFIG_SPL_BUILD
 #define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT
+#define CONFIG_SPL_SYSRESET_SUPPORT
 #endif
 #endif
 
diff --git a/include/configs/mx7_common.h b/include/configs/mx7_common.h
index cc7e87269e..4c7d19b82e 100644
--- a/include/configs/mx7_common.h
+++ b/include/configs/mx7_common.h
@@ -51,6 +51,8 @@
 #define CONFIG_CSF_SIZE			0x2000
 #ifdef CONFIG_SPL_BUILD
 #define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT
+#define CONFIG_SPL_SYSRESET_SUPPORT
 #endif
 #endif
 
diff --git a/include/configs/turris_omnia.h b/include/configs/turris_omnia.h
index 018f54428b..7cffdc3d51 100644
--- a/include/configs/turris_omnia.h
+++ b/include/configs/turris_omnia.h
@@ -52,6 +52,8 @@
 #define CONFIG_SPL_STACK		(0x40000000 + ((192 - 16) << 10))
 #define CONFIG_SPL_BOOTROM_SAVE		(CONFIG_SPL_STACK + 4)
 #define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT
+#define CONFIG_SPL_SYSRESET_SUPPORT
 
 #ifdef CONFIG_MVEBU_SPL_BOOT_DEVICE_SPI
 /* SPL related SPI defines */
-- 
2.20.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
