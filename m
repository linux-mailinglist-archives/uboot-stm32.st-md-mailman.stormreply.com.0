Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8121F1B088
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 May 2019 09:00:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 682A7C06B6F
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 May 2019 07:00:04 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93CEEC057E8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 May 2019 19:45:24 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b203so88796wmb.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 May 2019 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nTBHdV1H+BPalsS5A1jZLWwDnR0/jyXFzGnEoQYJL6I=;
 b=qxNVeVS/eht67TD6QBg1CeTHkZWnkfiesk9Vo7nyBcMwGhxquL5mt4rkOPAL65GH3D
 YM+W0FuToITXoEO1OVeHkSnKVWSYN+xFwFzRfgtch56EM2Sewda93hBiGP1G4d3ZHedj
 34HgzLKx4flida8Y7s2cG0JmpLUqP+kZ9u3TasCNwbXbl3/Y4y4ApaBnWkPQvJMoXu1d
 IfvLFcgrLwi8S5PJwS2fAxuMYEeXS4SXTfNE2V1fXic1le9KoMYBoYl0Ct0or5vVGY9Q
 Beyo5hwPbSFJu5DCYdFTYGxVrAP1a0ENq66OjrsFmR3ZFYJvnKhL+Q4V9TYCfNMuWzbh
 ioAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nTBHdV1H+BPalsS5A1jZLWwDnR0/jyXFzGnEoQYJL6I=;
 b=ccRVXnNNyW9+XyjJk+SpFdX/VfCR3pAwLbVPLepeJoR+qD1tUVVKQfY7HYv9QPPVYR
 ptxgujM2rQpBYr+KAtgXEzDDKREkdjPLiZNFsVvFeYUFqn/zWdQNXaCGJsNRNOs6qCtj
 QqUCAGrJjdcN3hEE7ipC0rxM6pcfGbHiZ87aeS7x0l6rcR3IjLHcZFORwnXrwDbpV3PN
 CzqzhcWmuaY0TUMzeuIANmhL2CFHOIRkcib+KuxXhzn/rPNdVPHNqfflO9fQqHU7BSzM
 NzMGqkMAkjnwT8I7asxiBkuyuHVzNVIonekTNuLgEHnWm4aeIuyTPmVCe6YMxZ4g37AL
 PRsA==
X-Gm-Message-State: APjAAAWnxoyvBVp0pJjyQFd1LbVjIloW/aQ3g+gWy2deMkDZOjmsRzHO
 h3y6YxpeIFDOFYbkQgSzdRw=
X-Google-Smtp-Source: APXvYqyDdFsv9JK2ZHmrnnW4STbqLZ5ismkv/CwEWWWo+i6wAlA8cbaThc/j+TEwbzDrVO+dwmApmw==
X-Received: by 2002:a1c:700f:: with SMTP id l15mr3777wmc.150.1557344722965;
 Wed, 08 May 2019 12:45:22 -0700 (PDT)
Received: from ubuntu.home ([2a02:8071:6a3:700:2df8:99ba:e50f:756b])
 by smtp.gmail.com with ESMTPSA id w14sm10975981wrr.41.2019.05.08.12.45.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 12:45:21 -0700 (PDT)
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
To: Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de
Date: Wed,  8 May 2019 21:45:13 +0200
Message-Id: <20190508194513.20462-1-simon.k.r.goldschmidt@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 07:00:03 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Christophe Kerello <christophe.kerello@st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
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
 Ley Foon Tan <ley.foon.tan@intel.com>, Marek Behun <marek.behun@nic.cz>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>,
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
 Lukasz Majewski <lukma@denx.de>, Eugen Hristev <eugen.hristev@microchip.com>,
 "Marty E. Plummer" <hanetzer@startmail.com>, Simon Glass <sjg@chromium.org>,
 Lukas Auer <lukas.auer@aisec.fraunhofer.de>
Subject: [Uboot-stm32] [PATCH v2] spl: kconfig: separate sysreset and
	firmware drivers from misc
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

Since that is confusing, this patch adds CONFIG_SPL_SYSRESET for
drivers/sysreset and CONFIG_SPL_FIRMWARE for
drivers/firmware (and accordingly for the TPL options).

To keep the binaries unchanged, this patch enables the 2 new options
on all boards where DRIVERS_MISC_SUPPORT has been enabled before.

While at it, change CONFIG_SPL_DRIVERS_MISC_SUPPORT to
CONFIG_SPL_MISC so that it matches the non-SPL config option.

Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
---

Changes in v2:
- adapt config names to match the non-SPL config options:
- changed CONFIG_SPL_SYSRESET_SUPPORT to CONFIG_SPL_SYSRESET
- changed CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT to CONFIG_SPL_FIRMWARE
- changed CONFIG_SPL_DRIVERS_MISC_SUPPORT to CONFIG_SPL_MISC

 arch/Kconfig                                  |  4 +--
 arch/arm/mach-rockchip/Kconfig                |  8 +++--
 arch/arm/mach-rockchip/rk3288/Kconfig         | 12 +++++--
 arch/arm/mach-stm32/Kconfig                   |  4 ++-
 arch/arm/mach-stm32mp/Kconfig                 |  4 ++-
 common/spl/Kconfig                            | 32 +++++++++++++++++--
 configs/B4420QDS_NAND_defconfig               |  4 ++-
 configs/B4860QDS_NAND_defconfig               |  4 ++-
 configs/C29XPCIE_NAND_defconfig               |  4 ++-
 configs/P1010RDB-PA_36BIT_NAND_defconfig      |  8 +++--
 configs/P1010RDB-PA_36BIT_SDCARD_defconfig    |  4 ++-
 configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig  |  4 ++-
 configs/P1010RDB-PA_NAND_defconfig            |  8 +++--
 configs/P1010RDB-PA_SDCARD_defconfig          |  4 ++-
 configs/P1010RDB-PA_SPIFLASH_defconfig        |  4 ++-
 configs/P1010RDB-PB_36BIT_NAND_defconfig      |  8 +++--
 configs/P1010RDB-PB_36BIT_SDCARD_defconfig    |  4 ++-
 configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig  |  4 ++-
 configs/P1010RDB-PB_NAND_defconfig            |  8 +++--
 configs/P1010RDB-PB_SDCARD_defconfig          |  4 ++-
 configs/P1010RDB-PB_SPIFLASH_defconfig        |  4 ++-
 configs/T1023RDB_NAND_defconfig               |  4 ++-
 configs/T1023RDB_SDCARD_defconfig             |  4 ++-
 configs/T1023RDB_SPIFLASH_defconfig           |  4 ++-
 configs/T1024QDS_NAND_defconfig               |  4 ++-
 configs/T1024QDS_SDCARD_defconfig             |  4 ++-
 configs/T1024QDS_SPIFLASH_defconfig           |  4 ++-
 configs/T1024RDB_NAND_defconfig               |  4 ++-
 configs/T1024RDB_SDCARD_defconfig             |  4 ++-
 configs/T1024RDB_SPIFLASH_defconfig           |  4 ++-
 configs/T1040D4RDB_NAND_defconfig             |  4 ++-
 configs/T1040D4RDB_SDCARD_defconfig           |  4 ++-
 configs/T1040D4RDB_SPIFLASH_defconfig         |  4 ++-
 configs/T1040RDB_NAND_defconfig               |  4 ++-
 configs/T1040RDB_SDCARD_defconfig             |  4 ++-
 configs/T1040RDB_SPIFLASH_defconfig           |  4 ++-
 configs/T1042D4RDB_NAND_defconfig             |  4 ++-
 configs/T1042D4RDB_SDCARD_defconfig           |  4 ++-
 configs/T1042D4RDB_SPIFLASH_defconfig         |  4 ++-
 .../T1042RDB_PI_NAND_SECURE_BOOT_defconfig    |  4 ++-
 configs/T1042RDB_PI_NAND_defconfig            |  4 ++-
 configs/T1042RDB_PI_SDCARD_defconfig          |  4 ++-
 configs/T1042RDB_PI_SPIFLASH_defconfig        |  4 ++-
 configs/T2080QDS_NAND_defconfig               |  4 ++-
 configs/T2080QDS_SDCARD_defconfig             |  4 ++-
 configs/T2080QDS_SPIFLASH_defconfig           |  4 ++-
 configs/T2080RDB_NAND_defconfig               |  4 ++-
 configs/T2080RDB_SDCARD_defconfig             |  4 ++-
 configs/T2080RDB_SPIFLASH_defconfig           |  4 ++-
 configs/T2081QDS_NAND_defconfig               |  4 ++-
 configs/T2081QDS_SDCARD_defconfig             |  4 ++-
 configs/T2081QDS_SPIFLASH_defconfig           |  4 ++-
 configs/T4160QDS_NAND_defconfig               |  4 ++-
 configs/T4160QDS_SDCARD_defconfig             |  4 ++-
 configs/T4240QDS_NAND_defconfig               |  4 ++-
 configs/T4240QDS_SDCARD_defconfig             |  4 ++-
 configs/T4240RDB_SDCARD_defconfig             |  4 ++-
 configs/am335x_guardian_defconfig             |  4 ++-
 configs/am43xx_evm_defconfig                  |  4 ++-
 configs/am65x_evm_a53_defconfig               |  4 ++-
 configs/am65x_evm_r5_defconfig                |  4 ++-
 configs/am65x_hs_evm_a53_defconfig            |  4 ++-
 configs/am65x_hs_evm_r5_defconfig             |  4 ++-
 configs/chromebook_link64_defconfig           |  4 ++-
 configs/imx8qm_mek_defconfig                  |  4 ++-
 configs/imx8qxp_mek_defconfig                 |  4 ++-
 configs/lion-rk3368_defconfig                 |  8 +++--
 configs/ls1021aqds_nand_defconfig             |  4 ++-
 configs/ls1021aqds_sdcard_ifc_defconfig       |  4 ++-
 configs/ls1021aqds_sdcard_qspi_defconfig      |  4 ++-
 ...s1021atwr_sdcard_ifc_SECURE_BOOT_defconfig |  4 ++-
 configs/ls1043aqds_nand_defconfig             |  4 ++-
 configs/ls1043aqds_sdcard_ifc_defconfig       |  4 ++-
 configs/ls1043aqds_sdcard_qspi_defconfig      |  4 ++-
 configs/ls1043ardb_nand_SECURE_BOOT_defconfig |  4 ++-
 configs/ls1043ardb_nand_defconfig             |  4 ++-
 .../ls1043ardb_sdcard_SECURE_BOOT_defconfig   |  4 ++-
 configs/ls1043ardb_sdcard_defconfig           |  4 ++-
 configs/ls1046aqds_sdcard_ifc_defconfig       |  4 ++-
 configs/ls1046aqds_sdcard_qspi_defconfig      |  4 ++-
 configs/ls1046ardb_emmc_defconfig             |  4 ++-
 configs/ls1046ardb_qspi_spl_defconfig         |  4 ++-
 .../ls1046ardb_sdcard_SECURE_BOOT_defconfig   |  4 ++-
 configs/ls1046ardb_sdcard_defconfig           |  4 ++-
 configs/ls1088aqds_sdcard_ifc_defconfig       |  4 ++-
 configs/ls1088aqds_sdcard_qspi_defconfig      |  4 ++-
 ...1088ardb_sdcard_qspi_SECURE_BOOT_defconfig |  4 ++-
 configs/ls1088ardb_sdcard_qspi_defconfig      |  4 ++-
 configs/ls2080aqds_nand_defconfig             |  4 ++-
 configs/ls2080aqds_sdcard_defconfig           |  4 ++-
 configs/ls2080ardb_nand_defconfig             |  4 ++-
 configs/mt7629_rfb_defconfig                  |  4 ++-
 configs/qemu-x86_64_defconfig                 |  4 ++-
 configs/sama5d27_som1_ek_mmc1_defconfig       |  4 ++-
 configs/sama5d27_som1_ek_mmc_defconfig        |  4 ++-
 configs/sama5d2_icp_mmc_defconfig             |  4 ++-
 configs/sama5d2_xplained_emmc_defconfig       |  4 ++-
 configs/sama5d2_xplained_mmc_defconfig        |  4 ++-
 configs/sama5d2_xplained_spiflash_defconfig   |  4 ++-
 configs/sama5d3_xplained_mmc_defconfig        |  4 ++-
 configs/sama5d3_xplained_nandflash_defconfig  |  4 ++-
 configs/sama5d3xek_mmc_defconfig              |  4 ++-
 configs/sama5d3xek_nandflash_defconfig        |  4 ++-
 configs/sama5d3xek_spiflash_defconfig         |  4 ++-
 configs/sama5d4_xplained_mmc_defconfig        |  4 ++-
 configs/sama5d4_xplained_nandflash_defconfig  |  4 ++-
 configs/sama5d4_xplained_spiflash_defconfig   |  4 ++-
 configs/sama5d4ek_mmc_defconfig               |  4 ++-
 configs/sama5d4ek_nandflash_defconfig         |  4 ++-
 configs/sama5d4ek_spiflash_defconfig          |  4 ++-
 configs/sandbox_spl_defconfig                 |  4 ++-
 configs/sksimx6_defconfig                     |  4 ++-
 doc/README.SPL                                |  4 ++-
 drivers/Makefile                              |  4 ++-
 include/configs/C29XPCIE.h                    |  4 ++-
 include/configs/imx8mq_evk.h                  |  4 ++-
 include/configs/ls1046a_common.h              |  4 ++-
 include/configs/mx6_common.h                  |  4 ++-
 include/configs/mx7_common.h                  |  4 ++-
 include/configs/turris_omnia.h                |  4 ++-
 120 files changed, 411 insertions(+), 129 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 0ad3867cd1..6104a80fb7 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -170,7 +170,7 @@ config X86
 	# Thing to enable for when SPL/TPL are enabled: SPL
 	imply SPL_DM
 	imply SPL_OF_LIBFDT
-	imply SPL_DRIVERS_MISC_SUPPORT
+	imply SPL_MISC
 	imply SPL_GPIO_SUPPORT
 	imply SPL_LIBCOMMON_SUPPORT
 	imply SPL_LIBGENERIC_SUPPORT
@@ -184,7 +184,7 @@ config X86
 	# TPL
 	imply TPL_DM
 	imply TPL_OF_LIBFDT
-	imply TPL_DRIVERS_MISC_SUPPORT
+	imply TPL_MISC
 	imply TPL_GPIO_SUPPORT
 	imply TPL_LIBCOMMON_SUPPORT
 	imply TPL_LIBGENERIC_SUPPORT
diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
index 282d728b82..510ba56263 100644
--- a/arch/arm/mach-rockchip/Kconfig
+++ b/arch/arm/mach-rockchip/Kconfig
@@ -32,8 +32,10 @@ config ROCKCHIP_RK3188
 	select SPL_REGMAP
 	select SPL_SYSCON
 	select SPL_RAM
-	select SPL_DRIVERS_MISC_SUPPORT
+	select SPL_FIRMWARE
+	select SPL_MISC
 	select SPL_ROCKCHIP_EARLYRETURN_TO_BROM
+	select SPL_SYSRESET
 	select BOARD_LATE_INIT
 	select ROCKCHIP_BROM_HELPER
 	help
@@ -131,7 +133,9 @@ config ROCKCHIP_RK3399
 	select SPL
 	select SPL_SEPARATE_BSS
 	select SPL_SERIAL_SUPPORT
-	select SPL_DRIVERS_MISC_SUPPORT
+	select SPL_FIRMWARE
+	select SPL_MISC
+	select SPL_SYSRESET
 	select BOARD_LATE_INIT
 	select ROCKCHIP_BROM_HELPER
 	help
diff --git a/arch/arm/mach-rockchip/rk3288/Kconfig b/arch/arm/mach-rockchip/rk3288/Kconfig
index 50680ce606..6fb9ce29d3 100644
--- a/arch/arm/mach-rockchip/rk3288/Kconfig
+++ b/arch/arm/mach-rockchip/rk3288/Kconfig
@@ -104,7 +104,8 @@ config TARGET_VYASA_RK3288
 	select TPL_BOOTROM_SUPPORT
 	select TPL_CLK
 	select TPL_DM
-	select TPL_DRIVERS_MISC_SUPPORT
+	select TPL_FIRMWARE
+	select TPL_MISC
 	select TPL_LIBCOMMON_SUPPORT
 	select TPL_LIBGENERIC_SUPPORT
 	select TPL_NEEDS_SEPARATE_TEXT_BASE if SPL
@@ -114,6 +115,7 @@ config TARGET_VYASA_RK3288
 	select TPL_REGMAP
 	select TPL_SERIAL_SUPPORT
 	select TPL_SYSCON
+	select TPL_SYSRESET
 	help
 	  Vyasa is a RK3288-based development board with 2 USB ports,
 	  HDMI, VGA, micro-SD card, audio, WiFi  and Gigabit Ethernet, It
@@ -153,7 +155,10 @@ config SYS_SOC
 config SYS_MALLOC_F_LEN
 	default 0x0800
 
-config SPL_DRIVERS_MISC_SUPPORT
+config SPL_FIRMWARE
+	default y
+
+config SPL_MISC
 	default y
 
 config SPL_LIBCOMMON_SUPPORT
@@ -165,6 +170,9 @@ config SPL_LIBGENERIC_SUPPORT
 config SPL_SERIAL_SUPPORT
 	default y
 
+config SPL_SYSRESET
+	default y
+
 source "board/amarula/vyasa-rk3288/Kconfig"
 
 source "board/chipspark/popmetal_rk3288/Kconfig"
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index cea5ee2ce5..30ab021df0 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -31,7 +31,8 @@ config STM32F7
 	select SPL_DM
 	select SPL_DM_RESET
 	select SPL_DM_SEQ_ALIAS
-	select SPL_DRIVERS_MISC_SUPPORT
+	select SPL_FIRMWARE
+	select SPL_MISC
 	select SPL_GPIO_SUPPORT
 	select SPL_LIBCOMMON_SUPPORT
 	select SPL_LIBGENERIC_SUPPORT
@@ -43,6 +44,7 @@ config STM32F7
 	select SPL_RAM
 	select SPL_SERIAL_SUPPORT
 	select SPL_SYS_MALLOC_SIMPLE
+	select SPL_SYSRESET
 	select SPL_TIMER
 	select SPL_XIP_SUPPORT
 	select STM32_RCC
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 73aa382712..54c6b939c5 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -5,7 +5,8 @@ config SPL
 	select SPL_CLK
 	select SPL_DM
 	select SPL_DM_SEQ_ALIAS
-	select SPL_DRIVERS_MISC_SUPPORT
+	select SPL_FIRMWARE
+	select SPL_MISC
 	select SPL_FRAMEWORK
 	select SPL_GPIO_SUPPORT
 	select SPL_LIBCOMMON_SUPPORT
@@ -17,6 +18,7 @@ config SPL
 	select SPL_DM_RESET
 	select SPL_SERIAL_SUPPORT
 	select SPL_SYSCON
+	select SPL_SYSRESET
 	imply SPL_DISPLAY_PRINT
 	imply SPL_LIBDISK_SUPPORT
 
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index dd078fe79d..f1ce3df082 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -360,7 +360,7 @@ config SPL_DMA_SUPPORT
 	  the CPU moving the data. Enable this option to build the drivers
 	  in drivers/dma as part of an SPL build.
 
-config SPL_DRIVERS_MISC_SUPPORT
+config SPL_MISC
 	bool "Support misc drivers"
 	help
 	  Enable miscellaneous drivers in SPL. These drivers perform various
@@ -368,6 +368,20 @@ config SPL_DRIVERS_MISC_SUPPORT
 	  option to build the drivers in drivers/misc as part of an SPL
 	  build, for those that support building in SPL (not all drivers do).
 
+config SPL_FIRMWARE
+	bool "Support firmware drivers"
+	help
+	  Enable firmware drivers in SPL. Enable this option to build the
+	  drivers in drivers/firmware as part of an SPL build, for those that
+	  support building in SPL (not all drivers do).
+
+config SPL_SYSRESET
+	bool "Support sysreset drivers"
+	help
+	  Enable sysreset drivers in SPL. Enable this option to build the
+	  drivers in drivers/sysreset as part of an SPL build, for those that
+	  support building in SPL (not all drivers do).
+
 config SPL_ENV_SUPPORT
 	bool "Support an environment"
 	help
@@ -1015,7 +1029,7 @@ config TPL_BOOTROM_SUPPORT
 	  BOOT_DEVICE_BOOTROM (or fall-through to the next boot device in the
 	  boot device list, if not implemented for a given board)
 
-config TPL_DRIVERS_MISC_SUPPORT
+config TPL_MISC
 	bool "Support misc drivers in TPL"
 	help
 	  Enable miscellaneous drivers in TPL. These drivers perform various
@@ -1023,6 +1037,20 @@ config TPL_DRIVERS_MISC_SUPPORT
 	  option to build the drivers in drivers/misc as part of an TPL
 	  build, for those that support building in TPL (not all drivers do).
 
+config TPL_FIRMWARE
+	bool "Support firmware drivers"
+	help
+	  Enable firmware drivers in TPL. Enable this option to build the
+	  drivers in drivers/firmware as part of an TPL build, for those that
+	  support building in TPL (not all drivers do).
+
+config TPL_SYSRESET
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
index b3de724ce1..a3bf489a19 100644
--- a/configs/B4420QDS_NAND_defconfig
+++ b/configs/B4420QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4420QDS=y
diff --git a/configs/B4860QDS_NAND_defconfig b/configs/B4860QDS_NAND_defconfig
index bd427f3e19..b75711540c 100644
--- a/configs/B4860QDS_NAND_defconfig
+++ b/configs/B4860QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4860QDS=y
diff --git a/configs/C29XPCIE_NAND_defconfig b/configs/C29XPCIE_NAND_defconfig
index 44ab55ce4b..10ac959519 100644
--- a/configs/C29XPCIE_NAND_defconfig
+++ b/configs/C29XPCIE_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_C29XPCIE=y
diff --git a/configs/P1010RDB-PA_36BIT_NAND_defconfig b/configs/P1010RDB-PA_36BIT_NAND_defconfig
index 3fc0136461..8b6bd995fe 100644
--- a/configs/P1010RDB-PA_36BIT_NAND_defconfig
+++ b/configs/P1010RDB-PA_36BIT_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
@@ -20,7 +22,9 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_MISC=y
+CONFIG_TPL_FIRMWARE=y
+CONFIG_TPL_SYSRESET=y
 CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
diff --git a/configs/P1010RDB-PA_36BIT_SDCARD_defconfig b/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
index 27ee0475df..4a5fd19581 100644
--- a/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
+++ b/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
diff --git a/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig b/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
index 57e175f131..65a39971bc 100644
--- a/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/P1010RDB-PA_NAND_defconfig b/configs/P1010RDB-PA_NAND_defconfig
index 0efaa3b497..80175f982f 100644
--- a/configs/P1010RDB-PA_NAND_defconfig
+++ b/configs/P1010RDB-PA_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
@@ -19,7 +21,9 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_MISC=y
+CONFIG_TPL_FIRMWARE=y
+CONFIG_TPL_SYSRESET=y
 CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
diff --git a/configs/P1010RDB-PA_SDCARD_defconfig b/configs/P1010RDB-PA_SDCARD_defconfig
index f5769d7756..545d9b0f4a 100644
--- a/configs/P1010RDB-PA_SDCARD_defconfig
+++ b/configs/P1010RDB-PA_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
diff --git a/configs/P1010RDB-PA_SPIFLASH_defconfig b/configs/P1010RDB-PA_SPIFLASH_defconfig
index 09c1fcf60c..ea89082e2d 100644
--- a/configs/P1010RDB-PA_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PA_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/P1010RDB-PB_36BIT_NAND_defconfig b/configs/P1010RDB-PB_36BIT_NAND_defconfig
index aba47c3387..f2a9d5d98e 100644
--- a/configs/P1010RDB-PB_36BIT_NAND_defconfig
+++ b/configs/P1010RDB-PB_36BIT_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
@@ -20,7 +22,9 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_MISC=y
+CONFIG_TPL_FIRMWARE=y
+CONFIG_TPL_SYSRESET=y
 CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
diff --git a/configs/P1010RDB-PB_36BIT_SDCARD_defconfig b/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
index 7bd0ec0650..de9a2aedc1 100644
--- a/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
+++ b/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
diff --git a/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig b/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
index de63086c52..085c4499ec 100644
--- a/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/P1010RDB-PB_NAND_defconfig b/configs/P1010RDB-PB_NAND_defconfig
index fb088b2c28..619f70c599 100644
--- a/configs/P1010RDB-PB_NAND_defconfig
+++ b/configs/P1010RDB-PB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
@@ -19,7 +21,9 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_MISC=y
+CONFIG_TPL_FIRMWARE=y
+CONFIG_TPL_SYSRESET=y
 CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
diff --git a/configs/P1010RDB-PB_SDCARD_defconfig b/configs/P1010RDB-PB_SDCARD_defconfig
index 8a46d877aa..9e1939dac0 100644
--- a/configs/P1010RDB-PB_SDCARD_defconfig
+++ b/configs/P1010RDB-PB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
diff --git a/configs/P1010RDB-PB_SPIFLASH_defconfig b/configs/P1010RDB-PB_SPIFLASH_defconfig
index ae403b107d..3bcaef3463 100644
--- a/configs/P1010RDB-PB_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1023RDB_NAND_defconfig b/configs/T1023RDB_NAND_defconfig
index 80213d19e9..e4aae52918 100644
--- a/configs/T1023RDB_NAND_defconfig
+++ b/configs/T1023RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1023RDB=y
diff --git a/configs/T1023RDB_SDCARD_defconfig b/configs/T1023RDB_SDCARD_defconfig
index 41176c21ce..7075b4986f 100644
--- a/configs/T1023RDB_SDCARD_defconfig
+++ b/configs/T1023RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1023RDB=y
diff --git a/configs/T1023RDB_SPIFLASH_defconfig b/configs/T1023RDB_SPIFLASH_defconfig
index f3db41098f..da8450da7d 100644
--- a/configs/T1023RDB_SPIFLASH_defconfig
+++ b/configs/T1023RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1024QDS_NAND_defconfig b/configs/T1024QDS_NAND_defconfig
index 3d4099fda0..bc47d9603c 100644
--- a/configs/T1024QDS_NAND_defconfig
+++ b/configs/T1024QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
diff --git a/configs/T1024QDS_SDCARD_defconfig b/configs/T1024QDS_SDCARD_defconfig
index 02226df657..a946de723e 100644
--- a/configs/T1024QDS_SDCARD_defconfig
+++ b/configs/T1024QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
diff --git a/configs/T1024QDS_SPIFLASH_defconfig b/configs/T1024QDS_SPIFLASH_defconfig
index 4077a2f728..5973c62255 100644
--- a/configs/T1024QDS_SPIFLASH_defconfig
+++ b/configs/T1024QDS_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1024RDB_NAND_defconfig b/configs/T1024RDB_NAND_defconfig
index ea00def211..55348a084f 100644
--- a/configs/T1024RDB_NAND_defconfig
+++ b/configs/T1024RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024RDB=y
diff --git a/configs/T1024RDB_SDCARD_defconfig b/configs/T1024RDB_SDCARD_defconfig
index 6b966b60d7..6508df2eaa 100644
--- a/configs/T1024RDB_SDCARD_defconfig
+++ b/configs/T1024RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024RDB=y
diff --git a/configs/T1024RDB_SPIFLASH_defconfig b/configs/T1024RDB_SPIFLASH_defconfig
index 59e1e77db4..6ebcf533d6 100644
--- a/configs/T1024RDB_SPIFLASH_defconfig
+++ b/configs/T1024RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1040D4RDB_NAND_defconfig b/configs/T1040D4RDB_NAND_defconfig
index 50757d939c..aca9ef615f 100644
--- a/configs/T1040D4RDB_NAND_defconfig
+++ b/configs/T1040D4RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040D4RDB=y
diff --git a/configs/T1040D4RDB_SDCARD_defconfig b/configs/T1040D4RDB_SDCARD_defconfig
index 5d70e014e1..b42889e807 100644
--- a/configs/T1040D4RDB_SDCARD_defconfig
+++ b/configs/T1040D4RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040D4RDB=y
diff --git a/configs/T1040D4RDB_SPIFLASH_defconfig b/configs/T1040D4RDB_SPIFLASH_defconfig
index 7b81373fe5..5dbf3bd519 100644
--- a/configs/T1040D4RDB_SPIFLASH_defconfig
+++ b/configs/T1040D4RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1040RDB_NAND_defconfig b/configs/T1040RDB_NAND_defconfig
index 991590e43f..5a7fd7691e 100644
--- a/configs/T1040RDB_NAND_defconfig
+++ b/configs/T1040RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040RDB=y
diff --git a/configs/T1040RDB_SDCARD_defconfig b/configs/T1040RDB_SDCARD_defconfig
index bd0590b508..a8cd315a82 100644
--- a/configs/T1040RDB_SDCARD_defconfig
+++ b/configs/T1040RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040RDB=y
diff --git a/configs/T1040RDB_SPIFLASH_defconfig b/configs/T1040RDB_SPIFLASH_defconfig
index 4ac5e8a484..e7d5ba9ea2 100644
--- a/configs/T1040RDB_SPIFLASH_defconfig
+++ b/configs/T1040RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1042D4RDB_NAND_defconfig b/configs/T1042D4RDB_NAND_defconfig
index 9d9e5602a4..86e5b38bf0 100644
--- a/configs/T1042D4RDB_NAND_defconfig
+++ b/configs/T1042D4RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042D4RDB=y
diff --git a/configs/T1042D4RDB_SDCARD_defconfig b/configs/T1042D4RDB_SDCARD_defconfig
index fc3e188b1f..1eb5afa92d 100644
--- a/configs/T1042D4RDB_SDCARD_defconfig
+++ b/configs/T1042D4RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042D4RDB=y
diff --git a/configs/T1042D4RDB_SPIFLASH_defconfig b/configs/T1042D4RDB_SPIFLASH_defconfig
index fdb894304c..8b4d4ac26a 100644
--- a/configs/T1042D4RDB_SPIFLASH_defconfig
+++ b/configs/T1042D4RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig b/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
index f5614ebcff..b4e4b28821 100644
--- a/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
+++ b/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SECURE_BOOT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
diff --git a/configs/T1042RDB_PI_NAND_defconfig b/configs/T1042RDB_PI_NAND_defconfig
index 8e32bb70ae..7ba7cafef4 100644
--- a/configs/T1042RDB_PI_NAND_defconfig
+++ b/configs/T1042RDB_PI_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
diff --git a/configs/T1042RDB_PI_SDCARD_defconfig b/configs/T1042RDB_PI_SDCARD_defconfig
index 5134f55d45..7dedab6732 100644
--- a/configs/T1042RDB_PI_SDCARD_defconfig
+++ b/configs/T1042RDB_PI_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
diff --git a/configs/T1042RDB_PI_SPIFLASH_defconfig b/configs/T1042RDB_PI_SPIFLASH_defconfig
index 2060085984..483b5e455b 100644
--- a/configs/T1042RDB_PI_SPIFLASH_defconfig
+++ b/configs/T1042RDB_PI_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x30001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T2080QDS_NAND_defconfig b/configs/T2080QDS_NAND_defconfig
index 4c39f66096..0b7d55bec2 100644
--- a/configs/T2080QDS_NAND_defconfig
+++ b/configs/T2080QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080QDS=y
diff --git a/configs/T2080QDS_SDCARD_defconfig b/configs/T2080QDS_SDCARD_defconfig
index 5fe12da409..b82d8deb12 100644
--- a/configs/T2080QDS_SDCARD_defconfig
+++ b/configs/T2080QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080QDS=y
diff --git a/configs/T2080QDS_SPIFLASH_defconfig b/configs/T2080QDS_SPIFLASH_defconfig
index 899f61c8a8..8bb9e6a04c 100644
--- a/configs/T2080QDS_SPIFLASH_defconfig
+++ b/configs/T2080QDS_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T2080RDB_NAND_defconfig b/configs/T2080RDB_NAND_defconfig
index 1bb90f390d..4e97046c02 100644
--- a/configs/T2080RDB_NAND_defconfig
+++ b/configs/T2080RDB_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080RDB=y
diff --git a/configs/T2080RDB_SDCARD_defconfig b/configs/T2080RDB_SDCARD_defconfig
index 1a7070c816..13e4a909a7 100644
--- a/configs/T2080RDB_SDCARD_defconfig
+++ b/configs/T2080RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080RDB=y
diff --git a/configs/T2080RDB_SPIFLASH_defconfig b/configs/T2080RDB_SPIFLASH_defconfig
index ceb0230f93..f1ff01c047 100644
--- a/configs/T2080RDB_SPIFLASH_defconfig
+++ b/configs/T2080RDB_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T2081QDS_NAND_defconfig b/configs/T2081QDS_NAND_defconfig
index 91a719f11b..1e599f3811 100644
--- a/configs/T2081QDS_NAND_defconfig
+++ b/configs/T2081QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2081QDS=y
diff --git a/configs/T2081QDS_SDCARD_defconfig b/configs/T2081QDS_SDCARD_defconfig
index c1bc0972dd..43502752ad 100644
--- a/configs/T2081QDS_SDCARD_defconfig
+++ b/configs/T2081QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2081QDS=y
diff --git a/configs/T2081QDS_SPIFLASH_defconfig b/configs/T2081QDS_SPIFLASH_defconfig
index f6a3f61938..5e2689f6ae 100644
--- a/configs/T2081QDS_SPIFLASH_defconfig
+++ b/configs/T2081QDS_SPIFLASH_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/T4160QDS_NAND_defconfig b/configs/T4160QDS_NAND_defconfig
index 3021884826..5056b10def 100644
--- a/configs/T4160QDS_NAND_defconfig
+++ b/configs/T4160QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4160QDS=y
diff --git a/configs/T4160QDS_SDCARD_defconfig b/configs/T4160QDS_SDCARD_defconfig
index b584638737..93c16e6420 100644
--- a/configs/T4160QDS_SDCARD_defconfig
+++ b/configs/T4160QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4160QDS=y
diff --git a/configs/T4240QDS_NAND_defconfig b/configs/T4240QDS_NAND_defconfig
index e66e5fd47f..5ffa539e83 100644
--- a/configs/T4240QDS_NAND_defconfig
+++ b/configs/T4240QDS_NAND_defconfig
@@ -3,7 +3,9 @@ CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240QDS=y
diff --git a/configs/T4240QDS_SDCARD_defconfig b/configs/T4240QDS_SDCARD_defconfig
index 715ec90304..9bb6538442 100644
--- a/configs/T4240QDS_SDCARD_defconfig
+++ b/configs/T4240QDS_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240QDS=y
diff --git a/configs/T4240RDB_SDCARD_defconfig b/configs/T4240RDB_SDCARD_defconfig
index eeab2ec720..07de65cb74 100644
--- a/configs/T4240RDB_SDCARD_defconfig
+++ b/configs/T4240RDB_SDCARD_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240RDB=y
diff --git a/configs/am335x_guardian_defconfig b/configs/am335x_guardian_defconfig
index 5753b10526..2bfb7d3593 100644
--- a/configs/am335x_guardian_defconfig
+++ b/configs/am335x_guardian_defconfig
@@ -7,7 +7,9 @@ CONFIG_AM33XX=y
 CONFIG_TARGET_AM335X_GUARDIAN=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/am43xx_evm_defconfig b/configs/am43xx_evm_defconfig
index 526dda2a93..430c48aa5f 100644
--- a/configs/am43xx_evm_defconfig
+++ b/configs/am43xx_evm_defconfig
@@ -3,7 +3,9 @@ CONFIG_ARCH_OMAP2PLUS=y
 CONFIG_TI_COMMON_CMD_OPTIONS=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_AM43XX=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SPL_LOAD_FIT=y
diff --git a/configs/am65x_evm_a53_defconfig b/configs/am65x_evm_a53_defconfig
index 101fae1456..171145fcbc 100644
--- a/configs/am65x_evm_a53_defconfig
+++ b/configs/am65x_evm_a53_defconfig
@@ -7,7 +7,9 @@ CONFIG_SOC_K3_AM6=y
 CONFIG_TARGET_AM654_A53_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/am65x_evm_r5_defconfig b/configs/am65x_evm_r5_defconfig
index 8dce577cf7..1d727cb8fb 100644
--- a/configs/am65x_evm_r5_defconfig
+++ b/configs/am65x_evm_r5_defconfig
@@ -8,7 +8,9 @@ CONFIG_SOC_K3_AM6=y
 CONFIG_TARGET_AM654_R5_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/am65x_hs_evm_a53_defconfig b/configs/am65x_hs_evm_a53_defconfig
index 7af0046ee3..c4e3592f1e 100644
--- a/configs/am65x_hs_evm_a53_defconfig
+++ b/configs/am65x_hs_evm_a53_defconfig
@@ -8,7 +8,9 @@ CONFIG_SOC_K3_AM6=y
 CONFIG_TARGET_AM654_A53_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/am65x_hs_evm_r5_defconfig b/configs/am65x_hs_evm_r5_defconfig
index 8d5d3590b2..936bfef7b2 100644
--- a/configs/am65x_hs_evm_r5_defconfig
+++ b/configs/am65x_hs_evm_r5_defconfig
@@ -9,7 +9,9 @@ CONFIG_SOC_K3_AM6=y
 CONFIG_TARGET_AM654_R5_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/chromebook_link64_defconfig b/configs/chromebook_link64_defconfig
index 0278353ef1..ca56223492 100644
--- a/configs/chromebook_link64_defconfig
+++ b/configs/chromebook_link64_defconfig
@@ -4,7 +4,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0x3f8
diff --git a/configs/imx8qm_mek_defconfig b/configs/imx8qm_mek_defconfig
index 238d44d1f5..a354b3b194 100644
--- a/configs/imx8qm_mek_defconfig
+++ b/configs/imx8qm_mek_defconfig
@@ -8,7 +8,9 @@ CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_IMX8QM_MEK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL_FIT_GENERATOR="arch/arm/mach-imx/mkimage_fit_atf.sh"
diff --git a/configs/imx8qxp_mek_defconfig b/configs/imx8qxp_mek_defconfig
index 59675e56b9..07d3556ae6 100644
--- a/configs/imx8qxp_mek_defconfig
+++ b/configs/imx8qxp_mek_defconfig
@@ -8,7 +8,9 @@ CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_IMX8QXP_MEK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_FIT=y
diff --git a/configs/lion-rk3368_defconfig b/configs/lion-rk3368_defconfig
index 75e85833a7..6201bf793d 100644
--- a/configs/lion-rk3368_defconfig
+++ b/configs/lion-rk3368_defconfig
@@ -8,7 +8,9 @@ CONFIG_ROCKCHIP_RK3368=y
 CONFIG_ROCKCHIP_SPL_RESERVE_IRAM=0x0
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL_STACK_R_ADDR=0x600000
 CONFIG_SPL=y
@@ -41,7 +43,9 @@ CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x200
 CONFIG_SPL_ATF=y
 CONFIG_TPL=y
 CONFIG_TPL_BOOTROM_SUPPORT=y
-CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_TPL_MISC=y
+CONFIG_TPL_FIRMWARE=y
+CONFIG_TPL_SYSRESET=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
 CONFIG_CMD_SF=y
diff --git a/configs/ls1021aqds_nand_defconfig b/configs/ls1021aqds_nand_defconfig
index 8dd6ca4e2e..3cc960fd9e 100644
--- a/configs/ls1021aqds_nand_defconfig
+++ b/configs/ls1021aqds_nand_defconfig
@@ -4,7 +4,9 @@ CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021aqds_sdcard_ifc_defconfig b/configs/ls1021aqds_sdcard_ifc_defconfig
index c85c831b13..1f816e4ba6 100644
--- a/configs/ls1021aqds_sdcard_ifc_defconfig
+++ b/configs/ls1021aqds_sdcard_ifc_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021aqds_sdcard_qspi_defconfig b/configs/ls1021aqds_sdcard_qspi_defconfig
index 7c574c72f4..40a7fcd1be 100644
--- a/configs/ls1021aqds_sdcard_qspi_defconfig
+++ b/configs/ls1021aqds_sdcard_qspi_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig b/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
index 28db5286cd..962ac5063f 100644
--- a/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
+++ b/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SECURE_BOOT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1043aqds_nand_defconfig b/configs/ls1043aqds_nand_defconfig
index 6ba95bcb53..7bcec61687 100644
--- a/configs/ls1043aqds_nand_defconfig
+++ b/configs/ls1043aqds_nand_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1043aqds_sdcard_ifc_defconfig b/configs/ls1043aqds_sdcard_ifc_defconfig
index dd711282b4..40d155123a 100644
--- a/configs/ls1043aqds_sdcard_ifc_defconfig
+++ b/configs/ls1043aqds_sdcard_ifc_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1043aqds_sdcard_qspi_defconfig b/configs/ls1043aqds_sdcard_qspi_defconfig
index cc86b1f8d1..8172ae609a 100644
--- a/configs/ls1043aqds_sdcard_qspi_defconfig
+++ b/configs/ls1043aqds_sdcard_qspi_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1043ardb_nand_SECURE_BOOT_defconfig b/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
index 9d96d22323..b4f8f57134 100644
--- a/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SECURE_BOOT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1043ardb_nand_defconfig b/configs/ls1043ardb_nand_defconfig
index a94c7b782c..414ebf237d 100644
--- a/configs/ls1043ardb_nand_defconfig
+++ b/configs/ls1043ardb_nand_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig b/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
index 90f3d251be..4be0779670 100644
--- a/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
@@ -7,7 +7,9 @@ CONFIG_SECURE_BOOT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1043ardb_sdcard_defconfig b/configs/ls1043ardb_sdcard_defconfig
index 418215ee9c..74d7948949 100644
--- a/configs/ls1043ardb_sdcard_defconfig
+++ b/configs/ls1043ardb_sdcard_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1046aqds_sdcard_ifc_defconfig b/configs/ls1046aqds_sdcard_ifc_defconfig
index 28ceabc31e..82a7aaca4e 100644
--- a/configs/ls1046aqds_sdcard_ifc_defconfig
+++ b/configs/ls1046aqds_sdcard_ifc_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046aqds_sdcard_qspi_defconfig b/configs/ls1046aqds_sdcard_qspi_defconfig
index 2b11a38c3c..d21088c8eb 100644
--- a/configs/ls1046aqds_sdcard_qspi_defconfig
+++ b/configs/ls1046aqds_sdcard_qspi_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046ardb_emmc_defconfig b/configs/ls1046ardb_emmc_defconfig
index 9b6e56dc0a..b6dc7027af 100644
--- a/configs/ls1046ardb_emmc_defconfig
+++ b/configs/ls1046ardb_emmc_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046ardb_qspi_spl_defconfig b/configs/ls1046ardb_qspi_spl_defconfig
index f78786ae72..75335689d7 100644
--- a/configs/ls1046ardb_qspi_spl_defconfig
+++ b/configs/ls1046ardb_qspi_spl_defconfig
@@ -7,7 +7,9 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig b/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
index 5afe6447c1..de6f3b2930 100644
--- a/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
+++ b/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
@@ -7,7 +7,9 @@ CONFIG_SECURE_BOOT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1046ardb_sdcard_defconfig b/configs/ls1046ardb_sdcard_defconfig
index bf5e1a062c..d90dd72b0f 100644
--- a/configs/ls1046ardb_sdcard_defconfig
+++ b/configs/ls1046ardb_sdcard_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1088aqds_sdcard_ifc_defconfig b/configs/ls1088aqds_sdcard_ifc_defconfig
index 58a6795b6d..7ed0e2d0ff 100644
--- a/configs/ls1088aqds_sdcard_ifc_defconfig
+++ b/configs/ls1088aqds_sdcard_ifc_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1088aqds_sdcard_qspi_defconfig b/configs/ls1088aqds_sdcard_qspi_defconfig
index 186e309b64..d45bcaec9d 100644
--- a/configs/ls1088aqds_sdcard_qspi_defconfig
+++ b/configs/ls1088aqds_sdcard_qspi_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig b/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
index 3a0c55566e..fcf4672c76 100644
--- a/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
@@ -7,7 +7,9 @@ CONFIG_SECURE_BOOT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1088ardb_sdcard_qspi_defconfig b/configs/ls1088ardb_sdcard_qspi_defconfig
index 15d690240d..4b85ec592d 100644
--- a/configs/ls1088ardb_sdcard_qspi_defconfig
+++ b/configs/ls1088ardb_sdcard_qspi_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls2080aqds_nand_defconfig b/configs/ls2080aqds_nand_defconfig
index 48dbf62a35..868b838f84 100644
--- a/configs/ls2080aqds_nand_defconfig
+++ b/configs/ls2080aqds_nand_defconfig
@@ -4,7 +4,9 @@ CONFIG_SYS_TEXT_BASE=0x80400000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls2080aqds_sdcard_defconfig b/configs/ls2080aqds_sdcard_defconfig
index 651e45b573..8f07c01af4 100644
--- a/configs/ls2080aqds_sdcard_defconfig
+++ b/configs/ls2080aqds_sdcard_defconfig
@@ -6,7 +6,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls2080ardb_nand_defconfig b/configs/ls2080ardb_nand_defconfig
index 56b78feab2..f724c566e5 100644
--- a/configs/ls2080ardb_nand_defconfig
+++ b/configs/ls2080ardb_nand_defconfig
@@ -4,7 +4,9 @@ CONFIG_SYS_TEXT_BASE=0x80400000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/mt7629_rfb_defconfig b/configs/mt7629_rfb_defconfig
index 01b952fc15..71ca332b1f 100644
--- a/configs/mt7629_rfb_defconfig
+++ b/configs/mt7629_rfb_defconfig
@@ -5,7 +5,9 @@ CONFIG_SYS_TEXT_BASE=0x41e00000
 CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_MT7629=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/qemu-x86_64_defconfig b/configs/qemu-x86_64_defconfig
index 3ffcb4ae6f..d6bd79dd10 100644
--- a/configs/qemu-x86_64_defconfig
+++ b/configs/qemu-x86_64_defconfig
@@ -5,7 +5,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x1000
 CONFIG_MAX_CPUS=2
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
diff --git a/configs/sama5d27_som1_ek_mmc1_defconfig b/configs/sama5d27_som1_ek_mmc1_defconfig
index 205a439941..76c76d25a2 100644
--- a/configs/sama5d27_som1_ek_mmc1_defconfig
+++ b/configs/sama5d27_som1_ek_mmc1_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
diff --git a/configs/sama5d27_som1_ek_mmc_defconfig b/configs/sama5d27_som1_ek_mmc_defconfig
index 0a0780066c..76929c20ae 100644
--- a/configs/sama5d27_som1_ek_mmc_defconfig
+++ b/configs/sama5d27_som1_ek_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d2_icp_mmc_defconfig b/configs/sama5d2_icp_mmc_defconfig
index 1fafb767af..ad51d0c35c 100644
--- a/configs/sama5d2_icp_mmc_defconfig
+++ b/configs/sama5d2_icp_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf801c000
diff --git a/configs/sama5d2_xplained_emmc_defconfig b/configs/sama5d2_xplained_emmc_defconfig
index f643b5a62f..61f11f6e25 100644
--- a/configs/sama5d2_xplained_emmc_defconfig
+++ b/configs/sama5d2_xplained_emmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
diff --git a/configs/sama5d2_xplained_mmc_defconfig b/configs/sama5d2_xplained_mmc_defconfig
index c25d67bfeb..1043ecb00c 100644
--- a/configs/sama5d2_xplained_mmc_defconfig
+++ b/configs/sama5d2_xplained_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d2_xplained_spiflash_defconfig b/configs/sama5d2_xplained_spiflash_defconfig
index ac5ae5133c..5f21e9133c 100644
--- a/configs/sama5d2_xplained_spiflash_defconfig
+++ b/configs/sama5d2_xplained_spiflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3_xplained_mmc_defconfig b/configs/sama5d3_xplained_mmc_defconfig
index d5021eb76a..1bad1064e6 100644
--- a/configs/sama5d3_xplained_mmc_defconfig
+++ b/configs/sama5d3_xplained_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3_xplained_nandflash_defconfig b/configs/sama5d3_xplained_nandflash_defconfig
index eaeb000d18..a34934a6ca 100644
--- a/configs/sama5d3_xplained_nandflash_defconfig
+++ b/configs/sama5d3_xplained_nandflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3xek_mmc_defconfig b/configs/sama5d3xek_mmc_defconfig
index b770ac4668..34ed5ae383 100644
--- a/configs/sama5d3xek_mmc_defconfig
+++ b/configs/sama5d3xek_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3xek_nandflash_defconfig b/configs/sama5d3xek_nandflash_defconfig
index dc8aaeb72f..969f5ce14f 100644
--- a/configs/sama5d3xek_nandflash_defconfig
+++ b/configs/sama5d3xek_nandflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d3xek_spiflash_defconfig b/configs/sama5d3xek_spiflash_defconfig
index 84bbf9c8c8..2d9f5d2135 100644
--- a/configs/sama5d3xek_spiflash_defconfig
+++ b/configs/sama5d3xek_spiflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4_xplained_mmc_defconfig b/configs/sama5d4_xplained_mmc_defconfig
index f673832dff..05340c73d4 100644
--- a/configs/sama5d4_xplained_mmc_defconfig
+++ b/configs/sama5d4_xplained_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4_xplained_nandflash_defconfig b/configs/sama5d4_xplained_nandflash_defconfig
index 1a481217c7..0b3a695523 100644
--- a/configs/sama5d4_xplained_nandflash_defconfig
+++ b/configs/sama5d4_xplained_nandflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4_xplained_spiflash_defconfig b/configs/sama5d4_xplained_spiflash_defconfig
index f10868900f..6c3e0bb853 100644
--- a/configs/sama5d4_xplained_spiflash_defconfig
+++ b/configs/sama5d4_xplained_spiflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4ek_mmc_defconfig b/configs/sama5d4ek_mmc_defconfig
index d7e1701a57..b43e0d681e 100644
--- a/configs/sama5d4ek_mmc_defconfig
+++ b/configs/sama5d4ek_mmc_defconfig
@@ -8,7 +8,9 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4ek_nandflash_defconfig b/configs/sama5d4ek_nandflash_defconfig
index e3b3f86eb5..94a13a7443 100644
--- a/configs/sama5d4ek_nandflash_defconfig
+++ b/configs/sama5d4ek_nandflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sama5d4ek_spiflash_defconfig b/configs/sama5d4ek_spiflash_defconfig
index 8db517d7b6..2a9ce3661c 100644
--- a/configs/sama5d4ek_spiflash_defconfig
+++ b/configs/sama5d4ek_spiflash_defconfig
@@ -7,7 +7,9 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index a46edee634..4abc3681f0 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -2,7 +2,9 @@ CONFIG_SYS_TEXT_BASE=0
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SANDBOX_SPL=y
diff --git a/configs/sksimx6_defconfig b/configs/sksimx6_defconfig
index 164614decd..8ab4acdfdd 100644
--- a/configs/sksimx6_defconfig
+++ b/configs/sksimx6_defconfig
@@ -8,7 +8,9 @@ CONFIG_MX6_DDRCAL=y
 CONFIG_TARGET_SKSIMX6=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_SPL_FIRMWARE=y
+CONFIG_SPL_MISC=y
+CONFIG_SPL_SYSRESET=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/doc/README.SPL b/doc/README.SPL
index 7a30fefa96..1b2a30214a 100644
--- a/doc/README.SPL
+++ b/doc/README.SPL
@@ -58,7 +58,9 @@ CONFIG_SPL_FS_EXT4
 CONFIG_SPL_LIBGENERIC_SUPPORT (lib/libgeneric.o)
 CONFIG_SPL_POWER_SUPPORT (drivers/power/libpower.o)
 CONFIG_SPL_NAND_SUPPORT (drivers/mtd/nand/raw/libnand.o)
-CONFIG_SPL_DRIVERS_MISC_SUPPORT (drivers/misc)
+CONFIG_SPL_MISC (drivers/misc)
+CONFIG_SPL_FIRMWARE (drivers/firmware)
+CONFIG_SPL_SYSRESET (drivers/sysreset)
 CONFIG_SPL_DMA_SUPPORT (drivers/dma/libdma.o)
 CONFIG_SPL_POST_MEM_SUPPORT (post/drivers/memory.o)
 CONFIG_SPL_NAND_LOAD (drivers/mtd/nand/raw/nand_spl_load.o)
diff --git a/drivers/Makefile b/drivers/Makefile
index 6635dabd2c..da301e608b 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -4,10 +4,11 @@ obj-$(CONFIG_$(SPL_TPL_)CLK) += clk/
 obj-$(CONFIG_$(SPL_TPL_)DM) += core/
 obj-$(CONFIG_$(SPL_TPL_)DFU) += dfu/
 obj-$(CONFIG_$(SPL_TPL_)GPIO_SUPPORT) += gpio/
-obj-$(CONFIG_$(SPL_TPL_)DRIVERS_MISC_SUPPORT) += misc/ sysreset/ firmware/
+obj-$(CONFIG_$(SPL_TPL_)FIRMWARE) += firmware/
 obj-$(CONFIG_$(SPL_TPL_)I2C_SUPPORT) += i2c/
 obj-$(CONFIG_$(SPL_TPL_)INPUT) += input/
 obj-$(CONFIG_$(SPL_TPL_)LED) += led/
+obj-$(CONFIG_$(SPL_TPL_)MISC) += misc/
 obj-$(CONFIG_$(SPL_TPL_)MMC_SUPPORT) += mmc/
 obj-$(CONFIG_$(SPL_TPL_)NAND_SUPPORT) += mtd/nand/raw/
 obj-$(CONFIG_$(SPL_TPL_)PCH_SUPPORT) += pch/
@@ -19,6 +20,7 @@ obj-$(CONFIG_$(SPL_TPL_)RTC_SUPPORT) += rtc/
 obj-$(CONFIG_$(SPL_TPL_)SERIAL_SUPPORT) += serial/
 obj-$(CONFIG_$(SPL_TPL_)SPI_FLASH_SUPPORT) += mtd/spi/
 obj-$(CONFIG_$(SPL_TPL_)SPI_SUPPORT) += spi/
+obj-$(CONFIG_$(SPL_TPL_)SYSRESET) += sysreset/
 obj-$(CONFIG_$(SPL_TPL_)TIMER) += timer/
 obj-$(CONFIG_$(SPL_TPL_)VIRTIO) += virtio/
 obj-$(CONFIG_$(SPL_)DM_MAILBOX) += mailbox/
diff --git a/include/configs/C29XPCIE.h b/include/configs/C29XPCIE.h
index b4a51a9528..0fcc145299 100644
--- a/include/configs/C29XPCIE.h
+++ b/include/configs/C29XPCIE.h
@@ -20,7 +20,9 @@
 #define CONFIG_SPL_NAND_BOOT
 #define CONFIG_SPL_FLUSH_IMAGE
 #define CONFIG_SPL_NAND_INIT
-#define CONFIG_TPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_TPL_MISC
+#define CONFIG_TPL_FIRMWARE
+#define CONFIG_TPL_SYSRESET
 #define CONFIG_SPL_COMMON_INIT_DDR
 #define CONFIG_SPL_MAX_SIZE		(128 << 10)
 #define CONFIG_TPL_TEXT_BASE		0xf8f81000
diff --git a/include/configs/imx8mq_evk.h b/include/configs/imx8mq_evk.h
index 7759bbf264..995da52f59 100644
--- a/include/configs/imx8mq_evk.h
+++ b/include/configs/imx8mq_evk.h
@@ -22,7 +22,9 @@
 #ifdef CONFIG_SPL_BUILD
 /*#define CONFIG_ENABLE_DDR_TRAINING_DEBUG*/
 #define CONFIG_SPL_WATCHDOG_SUPPORT
-#define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_MISC
+#define CONFIG_SPL_FIRMWARE
+#define CONFIG_SPL_SYSRESET
 #define CONFIG_SPL_POWER_SUPPORT
 #define CONFIG_SPL_I2C_SUPPORT
 #define CONFIG_SPL_LDSCRIPT		"arch/arm/cpu/armv8/u-boot-spl.lds"
diff --git a/include/configs/ls1046a_common.h b/include/configs/ls1046a_common.h
index ea6209ad2e..4dce2f7e1c 100644
--- a/include/configs/ls1046a_common.h
+++ b/include/configs/ls1046a_common.h
@@ -111,7 +111,9 @@
 #define CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT
 
 #define CONFIG_SPL_NAND_SUPPORT
-#define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_MISC
+#define CONFIG_SPL_FIRMWARE
+#define CONFIG_SPL_SYSRESET
 #define CONFIG_SPL_MAX_SIZE		0x17000		/* 90 KiB */
 #define CONFIG_SPL_STACK		0x1001f000
 #define CONFIG_SYS_NAND_U_BOOT_DST	CONFIG_SYS_TEXT_BASE
diff --git a/include/configs/mx6_common.h b/include/configs/mx6_common.h
index 6b20c6db58..2407bc66a4 100644
--- a/include/configs/mx6_common.h
+++ b/include/configs/mx6_common.h
@@ -61,7 +61,9 @@
 #ifdef CONFIG_SECURE_BOOT
 #define CONFIG_CSF_SIZE			0x2000
 #ifdef CONFIG_SPL_BUILD
-#define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_MISC
+#define CONFIG_SPL_FIRMWARE
+#define CONFIG_SPL_SYSRESET
 #endif
 #endif
 
diff --git a/include/configs/mx7_common.h b/include/configs/mx7_common.h
index cc7e87269e..f363e02165 100644
--- a/include/configs/mx7_common.h
+++ b/include/configs/mx7_common.h
@@ -50,7 +50,9 @@
 #ifdef CONFIG_SECURE_BOOT
 #define CONFIG_CSF_SIZE			0x2000
 #ifdef CONFIG_SPL_BUILD
-#define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_MISC
+#define CONFIG_SPL_FIRMWARE
+#define CONFIG_SPL_SYSRESET
 #endif
 #endif
 
diff --git a/include/configs/turris_omnia.h b/include/configs/turris_omnia.h
index 018f54428b..665d60f3f8 100644
--- a/include/configs/turris_omnia.h
+++ b/include/configs/turris_omnia.h
@@ -51,7 +51,9 @@
 
 #define CONFIG_SPL_STACK		(0x40000000 + ((192 - 16) << 10))
 #define CONFIG_SPL_BOOTROM_SAVE		(CONFIG_SPL_STACK + 4)
-#define CONFIG_SPL_DRIVERS_MISC_SUPPORT
+#define CONFIG_SPL_MISC
+#define CONFIG_SPL_FIRMWARE
+#define CONFIG_SPL_SYSRESET
 
 #ifdef CONFIG_MVEBU_SPL_BOOT_DEVICE_SPI
 /* SPL related SPI defines */
-- 
2.20.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
