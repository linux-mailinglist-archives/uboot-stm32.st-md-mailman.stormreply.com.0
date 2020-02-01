Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263715022A
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 09:01:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B0C5C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 08:01:00 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16E5EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Feb 2020 19:38:46 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id a33so5490857pgm.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 01 Feb 2020 11:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MROzOhSGFIDgxztoFNQA0V0XneglxjRJg5nbjjjb3vs=;
 b=Y2fHCxI83okb5ZDn3w2fEl96yRH4odsDRm8QOt08sIxC04wvbHH2KUX3rOb28FbOVY
 moh1TznwI7MRfT+UK+G3a0wrAJah2xMlcIbhjm8bXFSjLKiRc3sxYcAKCdt25DTQBQQn
 NyaDTxoMTSR1IAvsA7oUgWriAwfV/ekhgDYvQ4e0v+DsuZpzK/aRGn5E/QXuZHQyI6Dz
 U82UVW18RiYR7Tp1qZFKes32l9BPKiQRKwaamdwK2M6rLsSC73vxX4JpNMe/Va1uHGVJ
 K2lpH3wNs++9cHkzfEvu2e55ge3PwC04CKgMxqRdQbkD2NvB9hryx82vJ0awibZWfrsv
 ZjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MROzOhSGFIDgxztoFNQA0V0XneglxjRJg5nbjjjb3vs=;
 b=dN+lOtOfLmoemxen8Zm54FfbuyT4kywR1xBG45+9RYGu1gRe8uOoghKR5clo4n7SLu
 hIbsld0388QzKDT7V8ocrxv+FVtq798p9YXjN+6Jt7RGJlBb5hfu+TjNdLPfYIN4nGuh
 yz0rgnAQEf664KBK8o4Fqt5+/chkPVpDSt1NMhKozDE3crvQEEO4V/RdHuwpbrLMqvaS
 sWFRgfKmr6PBbbuySyMAB3MEBSaJ+692gnJh2v6u/tdh2u4cn8eR0TpNtwruQIk+/kon
 YAVbl2oaYDEfKPcVNDPO5QM2dVe90fz0xwPnqdEyUGhMktDH3+Ar3jS7ohyrFo2xufjL
 3u+w==
X-Gm-Message-State: APjAAAV5VxDHiMkftVcV11GYbOK5oo6s6uutZZfu64Q3xlXMyFBDl9iQ
 zCgxCTmaYzUbhLNmwZGAWU8=
X-Google-Smtp-Source: APXvYqxYy/gGxddd2xZbW/95wp87i8KwCyrtVERZsx4Cu+QZ1SVpePr9JCcRHUCZV2FaNUQv0IPtBQ==
X-Received: by 2002:a65:640b:: with SMTP id a11mr16648324pgv.418.1580585923964; 
 Sat, 01 Feb 2020 11:38:43 -0800 (PST)
Received: from glados.lan ([2601:647:4c01:6541:fa16:54ff:fed1:1bd6])
 by smtp.gmail.com with ESMTPSA id a21sm14414337pgd.12.2020.02.01.11.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 11:38:43 -0800 (PST)
From: Thomas Hebb <tommyhebb@gmail.com>
To: u-boot@lists.denx.de
Date: Sat,  1 Feb 2020 11:38:16 -0800
Message-Id: <6412a441fa9548f23086bf8c0a1b9b490d92dd0b.1580585884.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <faa9691528835dce9733dcfd1c1a8f20d13fa0bb.1580585884.git.tommyhebb@gmail.com>
References: <faa9691528835dce9733dcfd1c1a8f20d13fa0bb.1580585884.git.tommyhebb@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:00:59 +0000
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Baruch Siach <baruch@tkos.co.il>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Lars Poeschel <poeschel@lemonage.de>, Peng Fan <peng.fan@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>, Vignesh R <vigneshr@ti.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Arkadiusz Karas <arkadiusz.karas@somlabs.com>,
 =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Marek Vasut <marex@denx.de>,
 Niel Fourie <lusus@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Thomas Hebb <tommyhebb@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Javier=20Mart=C3=ADnez=20Canillas?= <javier@dowhile0.org>,
 Heiko Schocher <hs@denx.de>, Ash Charles <ash@gumstix.com>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Otavio Salvador <otavio@ossystems.com.br>, Breno Lima <breno.lima@nxp.com>,
 Samuel Egli <samuel.egli@siemens.com>, Gilles Gameiro <gilles@gigadevices.com>,
 James Byrne <james.byrne@origamienergy.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Erik van Luijk <evanluijk@interact.nl>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Moses Christopher Bollavarapu <BollavarapuMoses.Christopher@in.bosch.com>,
 Silvio Fricke <open-source@softing.de>, Parthiban Nallathambi <pn@denx.de>,
 Yegor Yefremov <yegorslists@googlemail.com>, Stefano Babic <sbabic@denx.de>,
 Michal Simek <monstr@monstr.eu>, Anatolij Gustschin <agust@denx.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Martyn Welch <martyn.welch@collabora.com>, Simon Glass <sjg@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, "Andrew F. Davis" <afd@ti.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lothar Felten <lothar.felten@gmail.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Francesco Montefoschi <francesco.montefoschi@udoo.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Bin Meng <bmeng.cn@gmail.com>, Felix Brack <fb@ltec.ch>
Subject: [Uboot-stm32] [PATCH 2/2] spl: get rid of SPL_LIBDISK_SUPPORT
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

This option hasn't actually affected what's linked into the build since
commit 91ff6865629c ("blk: Rework guard around part_init call"), which
switched libdisk in SPL to depend on (CONFIG_SPL_FRAMEWORK &&
CONFIG_PARTITIONS). After removing one straggling reference that seems
to been authored before 91ff6865629c landed, there are absolutely no
references to this in the code. Let's remove it.

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>

---

 arch/arm/Kconfig                             |  1 -
 arch/arm/mach-imx/mx6/Kconfig                |  1 -
 arch/arm/mach-mvebu/Kconfig                  |  2 --
 arch/arm/mach-omap2/Kconfig                  |  3 ---
 arch/arm/mach-omap2/am33xx/Kconfig           |  2 --
 arch/arm/mach-stm32mp/Kconfig                |  1 -
 arch/arm/mach-zynq/Kconfig                   |  3 ---
 arch/arm/mach-zynqmp/Kconfig                 |  3 ---
 common/spl/Kconfig                           | 19 ++-----------------
 configs/am335x_baltos_defconfig              |  1 -
 configs/am335x_guardian_defconfig            |  1 -
 configs/am335x_hs_evm_uart_defconfig         |  1 -
 configs/am335x_igep003x_defconfig            |  1 -
 configs/am335x_pdu001_defconfig              |  1 -
 configs/am335x_shc_defconfig                 |  1 -
 configs/am335x_shc_ict_defconfig             |  1 -
 configs/am335x_shc_netboot_defconfig         |  1 -
 configs/am335x_shc_sdboot_defconfig          |  1 -
 configs/am335x_sl50_defconfig                |  1 -
 configs/am65x_evm_a53_defconfig              |  1 -
 configs/am65x_evm_r5_defconfig               |  1 -
 configs/am65x_hs_evm_a53_defconfig           |  1 -
 configs/am65x_hs_evm_r5_defconfig            |  1 -
 configs/birdland_bav335a_defconfig           |  1 -
 configs/birdland_bav335b_defconfig           |  1 -
 configs/cgtqmx6eval_defconfig                |  1 -
 configs/chiliboard_defconfig                 |  1 -
 configs/cm_t335_defconfig                    |  1 -
 configs/cm_t43_defconfig                     |  1 -
 configs/draco_defconfig                      |  1 -
 configs/etamin_defconfig                     |  1 -
 configs/imx6qdl_icore_mipi_defconfig         |  1 -
 configs/imx6qdl_icore_mmc_defconfig          |  1 -
 configs/imx6qdl_icore_rqs_defconfig          |  1 -
 configs/imx6ul_geam_mmc_defconfig            |  1 -
 configs/imx6ul_isiot_emmc_defconfig          |  1 -
 configs/j721e_evm_a72_defconfig              |  1 -
 configs/j721e_evm_r5_defconfig               |  1 -
 configs/j721e_hs_evm_a72_defconfig           |  1 -
 configs/j721e_hs_evm_r5_defconfig            |  1 -
 configs/mx6cuboxi_defconfig                  |  1 -
 configs/mx6sabreauto_defconfig               |  1 -
 configs/mx6sabresd_defconfig                 |  1 -
 configs/mx6slevk_spl_defconfig               |  1 -
 configs/mx6sxsabresd_spl_defconfig           |  1 -
 configs/mx6ul_14x14_evk_defconfig            |  1 -
 configs/mx6ul_9x9_evk_defconfig              |  1 -
 configs/novena_defconfig                     |  1 -
 configs/opos6uldev_defconfig                 |  1 -
 configs/pcm051_rev1_defconfig                |  1 -
 configs/pcm051_rev3_defconfig                |  1 -
 configs/pcm058_defconfig                     |  1 -
 configs/pengwyn_defconfig                    |  1 -
 configs/pepper_defconfig                     |  1 -
 configs/pfla02_defconfig                     |  1 -
 configs/phycore-am335x-r2-wega_defconfig     |  1 -
 configs/pico-dwarf-imx6ul_defconfig          |  1 -
 configs/pico-hobbit-imx6ul_defconfig         |  1 -
 configs/pico-imx6_defconfig                  |  1 -
 configs/pico-imx6ul_defconfig                |  1 -
 configs/pico-pi-imx6ul_defconfig             |  1 -
 configs/picosam9g45_defconfig                |  1 -
 configs/platinum_picon_defconfig             |  1 -
 configs/platinum_titanium_defconfig          |  1 -
 configs/pxm2_defconfig                       |  1 -
 configs/rastaban_defconfig                   |  1 -
 configs/riotboard_spl_defconfig              |  1 -
 configs/rut_defconfig                        |  1 -
 configs/sama5d27_som1_ek_mmc1_defconfig      |  1 -
 configs/sama5d27_som1_ek_mmc_defconfig       |  1 -
 configs/sama5d27_som1_ek_qspiflash_defconfig |  1 -
 configs/sama5d27_wlsom1_ek_mmc_defconfig     |  1 -
 configs/sama5d2_icp_mmc_defconfig            |  1 -
 configs/sama5d2_xplained_emmc_defconfig      |  1 -
 configs/sama5d2_xplained_mmc_defconfig       |  1 -
 configs/sama5d2_xplained_qspiflash_defconfig |  1 -
 configs/sama5d3_xplained_mmc_defconfig       |  1 -
 configs/sama5d3xek_mmc_defconfig             |  1 -
 configs/sama5d4_xplained_mmc_defconfig       |  1 -
 configs/sama5d4ek_mmc_defconfig              |  1 -
 configs/sksimx6_defconfig                    |  1 -
 configs/thuban_defconfig                     |  1 -
 configs/ti814x_evm_defconfig                 |  1 -
 configs/ti816x_evm_defconfig                 |  1 -
 configs/udoo_defconfig                       |  1 -
 configs/udoo_neo_defconfig                   |  1 -
 configs/vining_2000_defconfig                |  1 -
 configs/wandboard_defconfig                  |  1 -
 configs/woodburn_sd_defconfig                |  1 -
 configs/xpress_spl_defconfig                 |  1 -
 configs/zc5202_defconfig                     |  1 -
 configs/zc5601_defconfig                     |  1 -
 doc/README.SPL                               |  1 -
 93 files changed, 2 insertions(+), 117 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f04b6a6d36..c4b0fc0433 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -962,7 +962,6 @@ config ARCH_SOCFPGA
 	imply FAT_WRITE
 	imply SPL
 	imply SPL_DM
-	imply SPL_LIBDISK_SUPPORT
 	imply SPL_MMC_SUPPORT
 	imply SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
 	imply SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION_TYPE
diff --git a/arch/arm/mach-imx/mx6/Kconfig b/arch/arm/mach-imx/mx6/Kconfig
index 9d91f9ab44..84643e322a 100644
--- a/arch/arm/mach-imx/mx6/Kconfig
+++ b/arch/arm/mach-imx/mx6/Kconfig
@@ -322,7 +322,6 @@ config TARGET_MX6DL_MAMOJ
 	select SPL_DM if SPL
 	select SPL_GPIO_SUPPORT if SPL
 	select SPL_LIBCOMMON_SUPPORT if SPL
-	select SPL_LIBDISK_SUPPORT if SPL
 	select SPL_LIBGENERIC_SUPPORT if SPL
 	select SPL_MMC_SUPPORT if SPL
 	select SPL_OF_CONTROL if SPL
diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
index bc5eaa5a76..b34f379647 100644
--- a/arch/arm/mach-mvebu/Kconfig
+++ b/arch/arm/mach-mvebu/Kconfig
@@ -238,12 +238,10 @@ config MVEBU_SPL_BOOT_DEVICE_SPI
 
 config MVEBU_SPL_BOOT_DEVICE_MMC
 	bool "SDIO/MMC card"
-	select SPL_LIBDISK_SUPPORT
 
 config MVEBU_SPL_BOOT_DEVICE_SATA
 	bool "SATA"
 	select SPL_SATA_SUPPORT
-	select SPL_LIBDISK_SUPPORT
 
 config MVEBU_SPL_BOOT_DEVICE_UART
 	bool "UART"
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 4c87cbc00f..682a937ce9 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -18,7 +18,6 @@ config OMAP34XX
 	imply SPL_GPIO_SUPPORT
 	imply SPL_I2C_SUPPORT
 	imply SPL_LIBCOMMON_SUPPORT
-	imply SPL_LIBDISK_SUPPORT
 	imply SPL_LIBGENERIC_SUPPORT
 	imply SPL_MMC_SUPPORT
 	imply SPL_NAND_SUPPORT
@@ -40,7 +39,6 @@ config OMAP44XX
 	imply SPL_GPIO_SUPPORT
 	imply SPL_I2C_SUPPORT
 	imply SPL_LIBCOMMON_SUPPORT
-	imply SPL_LIBDISK_SUPPORT
 	imply SPL_LIBGENERIC_SUPPORT
 	imply SPL_MMC_SUPPORT
 	imply SPL_NAND_SIMPLE
@@ -64,7 +62,6 @@ config OMAP54XX
 	imply SPL_GPIO_SUPPORT
 	imply SPL_I2C_SUPPORT
 	imply SPL_LIBCOMMON_SUPPORT
-	imply SPL_LIBDISK_SUPPORT
 	imply SPL_LIBGENERIC_SUPPORT
 	imply SPL_MMC_SUPPORT
 	imply SPL_NAND_AM33XX_BCH
diff --git a/arch/arm/mach-omap2/am33xx/Kconfig b/arch/arm/mach-omap2/am33xx/Kconfig
index 39d9c2873b..13c8c4cada 100644
--- a/arch/arm/mach-omap2/am33xx/Kconfig
+++ b/arch/arm/mach-omap2/am33xx/Kconfig
@@ -43,7 +43,6 @@ config TARGET_AM335X_EVM
 	imply SPL_GPIO_SUPPORT
 	imply SPL_I2C_SUPPORT
 	imply SPL_LIBCOMMON_SUPPORT
-	imply SPL_LIBDISK_SUPPORT
 	imply SPL_LIBGENERIC_SUPPORT
 	imply SPL_MMC_SUPPORT
 	imply SPL_NAND_SUPPORT
@@ -255,7 +254,6 @@ config TARGET_AM43XX_EVM
 	imply SPL_GPIO_SUPPORT
 	imply SPL_I2C_SUPPORT
 	imply SPL_LIBCOMMON_SUPPORT
-	imply SPL_LIBDISK_SUPPORT
 	imply SPL_LIBGENERIC_SUPPORT
 	imply SPL_MMC_SUPPORT
 	imply SPL_NAND_SUPPORT
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 137178aa45..f68c4041e4 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -22,7 +22,6 @@ config SPL
 	imply BOOTSTAGE_STASH if SPL_BOOTSTAGE
 	imply SPL_BOOTSTAGE if BOOTSTAGE
 	imply SPL_DISPLAY_PRINT
-	imply SPL_LIBDISK_SUPPORT
 
 config SYS_SOC
 	default "stm32mp"
diff --git a/arch/arm/mach-zynq/Kconfig b/arch/arm/mach-zynq/Kconfig
index 79f831e6df..fd55d4a0c7 100644
--- a/arch/arm/mach-zynq/Kconfig
+++ b/arch/arm/mach-zynq/Kconfig
@@ -9,9 +9,6 @@ config SPL_FS_FAT
 config SPL_LIBCOMMON_SUPPORT
 	default y
 
-config SPL_LIBDISK_SUPPORT
-	default y
-
 config SPL_LIBGENERIC_SUPPORT
 	default y
 
diff --git a/arch/arm/mach-zynqmp/Kconfig b/arch/arm/mach-zynqmp/Kconfig
index d82a737a69..c44d2bd57b 100644
--- a/arch/arm/mach-zynqmp/Kconfig
+++ b/arch/arm/mach-zynqmp/Kconfig
@@ -6,9 +6,6 @@ config SPL_FS_FAT
 config SPL_LIBCOMMON_SUPPORT
 	default y
 
-config SPL_LIBDISK_SUPPORT
-	default y
-
 config SPL_LIBGENERIC_SUPPORT
 	default y
 
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index b03a476b9f..169b2ee95a 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -626,20 +626,6 @@ config SPL_LIBCOMMON_SUPPORT
 	  boards. Enable this option to build the code in common/ as part of
 	  an SPL build.
 
-config SPL_LIBDISK_SUPPORT
-	bool "Support disk partitions"
-	select PARTITIONS
-	help
-	  Enable support for disk partitions within SPL. 'Disk' is something
-	  of a misnomer as it includes non-spinning media such as flash (as
-	  used in MMC and USB sticks). Partitions provide a way for a disk
-	  to be split up into separate regions, with a partition table placed
-	  at the start or end which describes the location and size of each
-	  'partition'. These partitions are typically uses as individual block
-	  devices, typically with an EXT2 or FAT filesystem in each. This
-	  option enables whatever partition support has been enabled in
-	  U-Boot to also be used in SPL. It brings in the code in disk/.
-
 config SPL_LIBGENERIC_SUPPORT
 	bool "Support generic libraries"
 	help
@@ -665,9 +651,8 @@ config SPL_MMC_SUPPORT
 	  Enable support for MMC (Multimedia Card) within SPL. This enables
 	  the MMC protocol implementation and allows any enabled drivers to
 	  be used within SPL. MMC can be used with or without disk partition
-	  support depending on the application (SPL_LIBDISK_SUPPORT). Enable
-	  this option to build the drivers in drivers/mmc as part of an SPL
-	  build.
+	  support depending on the application (PARTITIONS). Enable this
+	  option to build the drivers in drivers/mmc as part of an SPL build.
 
 config SPL_FORCE_MMC_BOOT
 	bool "Force SPL booting from MMC"
diff --git a/configs/am335x_baltos_defconfig b/configs/am335x_baltos_defconfig
index 63f0da9cb0..85f1a44576 100644
--- a/configs/am335x_baltos_defconfig
+++ b/configs/am335x_baltos_defconfig
@@ -9,7 +9,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/am335x_guardian_defconfig b/configs/am335x_guardian_defconfig
index 13974f7c0f..ef2de52a4a 100644
--- a/configs/am335x_guardian_defconfig
+++ b/configs/am335x_guardian_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_BOOTSTAGE_STASH_ADDR=0x0
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_CONSOLE_MUX=y
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/am335x_hs_evm_uart_defconfig b/configs/am335x_hs_evm_uart_defconfig
index a7d76c83bd..1d84ea5dd7 100644
--- a/configs/am335x_hs_evm_uart_defconfig
+++ b/configs/am335x_hs_evm_uart_defconfig
@@ -8,7 +8,6 @@ CONFIG_AM33XX=y
 # CONFIG_SPL_MMC_SUPPORT is not set
 CONFIG_SPL=y
 # CONFIG_SPL_FS_FAT is not set
-# CONFIG_SPL_LIBDISK_SUPPORT is not set
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
 CONFIG_SPL_LOAD_FIT=y
diff --git a/configs/am335x_igep003x_defconfig b/configs/am335x_igep003x_defconfig
index e0efd5bc95..9e73495bf5 100644
--- a/configs/am335x_igep003x_defconfig
+++ b/configs/am335x_igep003x_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_SYS_EXTRA_OPTIONS="MACH_TYPE=MACH_TYPE_IGEP0033"
diff --git a/configs/am335x_pdu001_defconfig b/configs/am335x_pdu001_defconfig
index 792d2165bc..acf3eab0c4 100644
--- a/configs/am335x_pdu001_defconfig
+++ b/configs/am335x_pdu001_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_LOCALVERSION="-EETS-1.0.0"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=1
diff --git a/configs/am335x_shc_defconfig b/configs/am335x_shc_defconfig
index 64f0d933a4..14dd248751 100644
--- a/configs/am335x_shc_defconfig
+++ b/configs/am335x_shc_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SERIES=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SHOW_BOOT_PROGRESS=y
diff --git a/configs/am335x_shc_ict_defconfig b/configs/am335x_shc_ict_defconfig
index 5d8cafc2ca..36fc308610 100644
--- a/configs/am335x_shc_ict_defconfig
+++ b/configs/am335x_shc_ict_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SHC_ICT=y
 CONFIG_SERIES=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/am335x_shc_netboot_defconfig b/configs/am335x_shc_netboot_defconfig
index 8fbdc892e3..f236450ec3 100644
--- a/configs/am335x_shc_netboot_defconfig
+++ b/configs/am335x_shc_netboot_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SHC_NETBOOT=y
 CONFIG_SERIES=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/am335x_shc_sdboot_defconfig b/configs/am335x_shc_sdboot_defconfig
index 4c8a4f6fcb..9e40beb1ce 100644
--- a/configs/am335x_shc_sdboot_defconfig
+++ b/configs/am335x_shc_sdboot_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SHC_SDBOOT=y
 CONFIG_SERIES=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/am335x_sl50_defconfig b/configs/am335x_sl50_defconfig
index 1f562eabec..f12fb19e09 100644
--- a/configs/am335x_sl50_defconfig
+++ b/configs/am335x_sl50_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="EMMC_BOOT"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/am65x_evm_a53_defconfig b/configs/am65x_evm_a53_defconfig
index 079cd912ba..cd00a29e8d 100644
--- a/configs/am65x_evm_a53_defconfig
+++ b/configs/am65x_evm_a53_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_PSCI_RESET is not set
 CONFIG_SPL_TEXT_BASE=0x80080000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/am65x_evm_r5_defconfig b/configs/am65x_evm_r5_defconfig
index 69055d5536..d0029e3241 100644
--- a/configs/am65x_evm_r5_defconfig
+++ b/configs/am65x_evm_r5_defconfig
@@ -15,7 +15,6 @@ CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x41c00000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
diff --git a/configs/am65x_hs_evm_a53_defconfig b/configs/am65x_hs_evm_a53_defconfig
index 6097a02247..ff6aa72478 100644
--- a/configs/am65x_hs_evm_a53_defconfig
+++ b/configs/am65x_hs_evm_a53_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x80080000
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/am65x_hs_evm_r5_defconfig b/configs/am65x_hs_evm_r5_defconfig
index 0cdfc735b6..5ec30acdd7 100644
--- a/configs/am65x_hs_evm_r5_defconfig
+++ b/configs/am65x_hs_evm_r5_defconfig
@@ -15,7 +15,6 @@ CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x41c00000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
diff --git a/configs/birdland_bav335a_defconfig b/configs/birdland_bav335a_defconfig
index b4fcccf27d..1b4030a3b1 100644
--- a/configs/birdland_bav335a_defconfig
+++ b/configs/birdland_bav335a_defconfig
@@ -10,7 +10,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_BAV_VERSION=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="CONS_INDEX=1"
diff --git a/configs/birdland_bav335b_defconfig b/configs/birdland_bav335b_defconfig
index b9f8bcab4b..f446585868 100644
--- a/configs/birdland_bav335b_defconfig
+++ b/configs/birdland_bav335b_defconfig
@@ -10,7 +10,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_BAV_VERSION=2
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="CONS_INDEX=1"
diff --git a/configs/cgtqmx6eval_defconfig b/configs/cgtqmx6eval_defconfig
index 48d3498d30..0a17368446 100644
--- a/configs/cgtqmx6eval_defconfig
+++ b/configs/cgtqmx6eval_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/chiliboard_defconfig b/configs/chiliboard_defconfig
index 1534fbe6d1..77481982ca 100644
--- a/configs/chiliboard_defconfig
+++ b/configs/chiliboard_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=1
 # CONFIG_USE_BOOTCOMMAND is not set
diff --git a/configs/cm_t335_defconfig b/configs/cm_t335_defconfig
index 6c72712060..ba9899f655 100644
--- a/configs/cm_t335_defconfig
+++ b/configs/cm_t335_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/cm_t43_defconfig b/configs/cm_t43_defconfig
index 1e245c6aa7..cfdcaa6528 100644
--- a/configs/cm_t43_defconfig
+++ b/configs/cm_t43_defconfig
@@ -13,7 +13,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x40300350
diff --git a/configs/draco_defconfig b/configs/draco_defconfig
index 70b4378db8..a0b32c461a 100644
--- a/configs/draco_defconfig
+++ b/configs/draco_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/etamin_defconfig b/configs/etamin_defconfig
index 3d543f7adc..c2ee46ca14 100644
--- a/configs/etamin_defconfig
+++ b/configs/etamin_defconfig
@@ -15,7 +15,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/imx6qdl_icore_mipi_defconfig b/configs/imx6qdl_icore_mipi_defconfig
index dbad2f3f60..ddec300327 100644
--- a/configs/imx6qdl_icore_mipi_defconfig
+++ b/configs/imx6qdl_icore_mipi_defconfig
@@ -12,7 +12,6 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0x021f0000
 CONFIG_DEBUG_UART_CLOCK=24000000
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index a924815059..217aecd5e0 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -14,7 +14,6 @@ CONFIG_SYS_BOOTCOUNT_SINGLEWORD=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0x020D8024
 CONFIG_DEBUG_UART_BASE=0x021f0000
 CONFIG_DEBUG_UART_CLOCK=24000000
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/imx6qdl_icore_rqs_defconfig b/configs/imx6qdl_icore_rqs_defconfig
index be9a0271a1..032e4ea9ac 100644
--- a/configs/imx6qdl_icore_rqs_defconfig
+++ b/configs/imx6qdl_icore_rqs_defconfig
@@ -10,7 +10,6 @@ CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_FIT=y
diff --git a/configs/imx6ul_geam_mmc_defconfig b/configs/imx6ul_geam_mmc_defconfig
index d8076f8b9d..e2143897c6 100644
--- a/configs/imx6ul_geam_mmc_defconfig
+++ b/configs/imx6ul_geam_mmc_defconfig
@@ -10,7 +10,6 @@ CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_FIT=y
diff --git a/configs/imx6ul_isiot_emmc_defconfig b/configs/imx6ul_isiot_emmc_defconfig
index 534774987e..071872a675 100644
--- a/configs/imx6ul_isiot_emmc_defconfig
+++ b/configs/imx6ul_isiot_emmc_defconfig
@@ -10,7 +10,6 @@ CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_FIT=y
diff --git a/configs/j721e_evm_a72_defconfig b/configs/j721e_evm_a72_defconfig
index d5e54a228d..1ef31d1de5 100644
--- a/configs/j721e_evm_a72_defconfig
+++ b/configs/j721e_evm_a72_defconfig
@@ -13,7 +13,6 @@ CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 # CONFIG_PSCI_RESET is not set
diff --git a/configs/j721e_evm_r5_defconfig b/configs/j721e_evm_r5_defconfig
index a90ab62195..53c7fcbf6b 100644
--- a/configs/j721e_evm_r5_defconfig
+++ b/configs/j721e_evm_r5_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x41c00000
diff --git a/configs/j721e_hs_evm_a72_defconfig b/configs/j721e_hs_evm_a72_defconfig
index dd552c5d1a..dc70f3ce0e 100644
--- a/configs/j721e_hs_evm_a72_defconfig
+++ b/configs/j721e_hs_evm_a72_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 # CONFIG_PSCI_RESET is not set
diff --git a/configs/j721e_hs_evm_r5_defconfig b/configs/j721e_hs_evm_r5_defconfig
index 9348be3320..c5a70ce603 100644
--- a/configs/j721e_hs_evm_r5_defconfig
+++ b/configs/j721e_hs_evm_r5_defconfig
@@ -15,7 +15,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x41c00000
diff --git a/configs/mx6cuboxi_defconfig b/configs/mx6cuboxi_defconfig
index bee7d280f0..c4c0defd21 100644
--- a/configs/mx6cuboxi_defconfig
+++ b/configs/mx6cuboxi_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
diff --git a/configs/mx6sabreauto_defconfig b/configs/mx6sabreauto_defconfig
index 3846bf39b2..940cbdaf0a 100644
--- a/configs/mx6sabreauto_defconfig
+++ b/configs/mx6sabreauto_defconfig
@@ -13,7 +13,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_NXP_BOARD_REVISION=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_FIT=y
diff --git a/configs/mx6sabresd_defconfig b/configs/mx6sabresd_defconfig
index a5a34ec32e..2d61b8a063 100644
--- a/configs/mx6sabresd_defconfig
+++ b/configs/mx6sabresd_defconfig
@@ -13,7 +13,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_FIT=y
 CONFIG_SPL_FIT_PRINT=y
diff --git a/configs/mx6slevk_spl_defconfig b/configs/mx6slevk_spl_defconfig
index c5be9573f4..cd46955af0 100644
--- a/configs/mx6slevk_spl_defconfig
+++ b/configs/mx6slevk_spl_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
diff --git a/configs/mx6sxsabresd_spl_defconfig b/configs/mx6sxsabresd_spl_defconfig
index 65a8581044..84834e5cc0 100644
--- a/configs/mx6sxsabresd_spl_defconfig
+++ b/configs/mx6sxsabresd_spl_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_NXP_BOARD_REVISION=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/mx6ul_14x14_evk_defconfig b/configs/mx6ul_14x14_evk_defconfig
index 4fd311d2fb..633cd9825b 100644
--- a/configs/mx6ul_14x14_evk_defconfig
+++ b/configs/mx6ul_14x14_evk_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
 # CONFIG_CONSOLE_MUX is not set
diff --git a/configs/mx6ul_9x9_evk_defconfig b/configs/mx6ul_9x9_evk_defconfig
index 5f3658ffbd..19bd662a66 100644
--- a/configs/mx6ul_9x9_evk_defconfig
+++ b/configs/mx6ul_9x9_evk_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
 # CONFIG_CONSOLE_MUX is not set
diff --git a/configs/novena_defconfig b/configs/novena_defconfig
index f14f82b9a6..da8de2f804 100644
--- a/configs/novena_defconfig
+++ b/configs/novena_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/opos6uldev_defconfig b/configs/opos6uldev_defconfig
index bb674de66b..f822bbab0d 100644
--- a/configs/opos6uldev_defconfig
+++ b/configs/opos6uldev_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x400
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_BOOTDELAY=5
diff --git a/configs/pcm051_rev1_defconfig b/configs/pcm051_rev1_defconfig
index cbe6594837..8a96976077 100644
--- a/configs/pcm051_rev1_defconfig
+++ b/configs/pcm051_rev1_defconfig
@@ -10,7 +10,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="REV1"
 # CONFIG_USE_BOOTCOMMAND is not set
diff --git a/configs/pcm051_rev3_defconfig b/configs/pcm051_rev3_defconfig
index 744c5827d1..3f31768bb3 100644
--- a/configs/pcm051_rev3_defconfig
+++ b/configs/pcm051_rev3_defconfig
@@ -10,7 +10,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="REV3"
 # CONFIG_USE_BOOTCOMMAND is not set
diff --git a/configs/pcm058_defconfig b/configs/pcm058_defconfig
index cd698a3225..874e250447 100644
--- a/configs/pcm058_defconfig
+++ b/configs/pcm058_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_CMD_HDMIDETECT=y
diff --git a/configs/pengwyn_defconfig b/configs/pengwyn_defconfig
index eadab3e860..143805e97f 100644
--- a/configs/pengwyn_defconfig
+++ b/configs/pengwyn_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/pepper_defconfig b/configs/pepper_defconfig
index 6585ac05fd..8c93c2b82a 100644
--- a/configs/pepper_defconfig
+++ b/configs/pepper_defconfig
@@ -10,7 +10,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/pfla02_defconfig b/configs/pfla02_defconfig
index e4a0f6dbcc..aa41086a44 100644
--- a/configs/pfla02_defconfig
+++ b/configs/pfla02_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_CMD_HDMIDETECT=y
diff --git a/configs/phycore-am335x-r2-wega_defconfig b/configs/phycore-am335x-r2-wega_defconfig
index ef19bb64aa..0a8dc44104 100644
--- a/configs/phycore-am335x-r2-wega_defconfig
+++ b/configs/phycore-am335x-r2-wega_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_FIT is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/pico-dwarf-imx6ul_defconfig b/configs/pico-dwarf-imx6ul_defconfig
index f914418c05..a6e3b15665 100644
--- a/configs/pico-dwarf-imx6ul_defconfig
+++ b/configs/pico-dwarf-imx6ul_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
 CONFIG_BOOTDELAY=3
diff --git a/configs/pico-hobbit-imx6ul_defconfig b/configs/pico-hobbit-imx6ul_defconfig
index d18341f6a7..e34eb81250 100644
--- a/configs/pico-hobbit-imx6ul_defconfig
+++ b/configs/pico-hobbit-imx6ul_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
diff --git a/configs/pico-imx6_defconfig b/configs/pico-imx6_defconfig
index fe73ac585e..e28537f37f 100644
--- a/configs/pico-imx6_defconfig
+++ b/configs/pico-imx6_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
diff --git a/configs/pico-imx6ul_defconfig b/configs/pico-imx6ul_defconfig
index 3fd1012d4b..137ead6bf3 100644
--- a/configs/pico-imx6ul_defconfig
+++ b/configs/pico-imx6ul_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
diff --git a/configs/pico-pi-imx6ul_defconfig b/configs/pico-pi-imx6ul_defconfig
index 951d9d3304..2445592d8d 100644
--- a/configs/pico-pi-imx6ul_defconfig
+++ b/configs/pico-pi-imx6ul_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
diff --git a/configs/picosam9g45_defconfig b/configs/picosam9g45_defconfig
index 0157f5172e..bd10353bdc 100644
--- a/configs/picosam9g45_defconfig
+++ b/configs/picosam9g45_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x300000
 CONFIG_SYS_EXTRA_OPTIONS="AT91SAM9M10G45,SYS_USE_MMC"
 CONFIG_BOOTDELAY=3
diff --git a/configs/platinum_picon_defconfig b/configs/platinum_picon_defconfig
index 68459ba119..87c46e8bde 100644
--- a/configs/platinum_picon_defconfig
+++ b/configs/platinum_picon_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg,MX6DL"
 CONFIG_BOOTDELAY=3
diff --git a/configs/platinum_titanium_defconfig b/configs/platinum_titanium_defconfig
index 08b8fc5c34..ba4676c148 100644
--- a/configs/platinum_titanium_defconfig
+++ b/configs/platinum_titanium_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg,MX6Q"
 CONFIG_BOOTDELAY=3
diff --git a/configs/pxm2_defconfig b/configs/pxm2_defconfig
index 6d120a7e29..9c9aa81541 100644
--- a/configs/pxm2_defconfig
+++ b/configs/pxm2_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/rastaban_defconfig b/configs/rastaban_defconfig
index 665f8b3c1a..0213b1f2c5 100644
--- a/configs/rastaban_defconfig
+++ b/configs/rastaban_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/riotboard_spl_defconfig b/configs/riotboard_spl_defconfig
index 61fe41d6fc..f207f9d3a2 100644
--- a/configs/riotboard_spl_defconfig
+++ b/configs/riotboard_spl_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/boundary/nitrogen6x/nitrogen6s1g.cfg,SPL,MX6S,DDR_MB=1024"
diff --git a/configs/rut_defconfig b/configs/rut_defconfig
index 514e91b6ef..767c0bce9b 100644
--- a/configs/rut_defconfig
+++ b/configs/rut_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d27_som1_ek_mmc1_defconfig b/configs/sama5d27_som1_ek_mmc1_defconfig
index 1f8d29176e..0deb724a27 100644
--- a/configs/sama5d27_som1_ek_mmc1_defconfig
+++ b/configs/sama5d27_som1_ek_mmc1_defconfig
@@ -17,7 +17,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
 CONFIG_DEBUG_UART_CLOCK=82000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x200000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d27_som1_ek_mmc_defconfig b/configs/sama5d27_som1_ek_mmc_defconfig
index 20b25cd338..5ecff19f0e 100644
--- a/configs/sama5d27_som1_ek_mmc_defconfig
+++ b/configs/sama5d27_som1_ek_mmc_defconfig
@@ -18,7 +18,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
 CONFIG_DEBUG_UART_CLOCK=82000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x200000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d27_som1_ek_qspiflash_defconfig b/configs/sama5d27_som1_ek_qspiflash_defconfig
index 2fcb10b4db..a6a44d3597 100644
--- a/configs/sama5d27_som1_ek_qspiflash_defconfig
+++ b/configs/sama5d27_som1_ek_qspiflash_defconfig
@@ -18,7 +18,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
 CONFIG_DEBUG_UART_CLOCK=82000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x200000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d27_wlsom1_ek_mmc_defconfig b/configs/sama5d27_wlsom1_ek_mmc_defconfig
index 7337c184c5..431ecc1439 100644
--- a/configs/sama5d27_wlsom1_ek_mmc_defconfig
+++ b/configs/sama5d27_wlsom1_ek_mmc_defconfig
@@ -16,7 +16,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf801c000
 CONFIG_DEBUG_UART_CLOCK=82000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x200000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d2_icp_mmc_defconfig b/configs/sama5d2_icp_mmc_defconfig
index dd15441798..c5b8339752 100644
--- a/configs/sama5d2_icp_mmc_defconfig
+++ b/configs/sama5d2_icp_mmc_defconfig
@@ -17,7 +17,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf801c000
 CONFIG_DEBUG_UART_CLOCK=83000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_FIT=y
diff --git a/configs/sama5d2_xplained_emmc_defconfig b/configs/sama5d2_xplained_emmc_defconfig
index e7f789ae3a..1ea6a6825a 100644
--- a/configs/sama5d2_xplained_emmc_defconfig
+++ b/configs/sama5d2_xplained_emmc_defconfig
@@ -17,7 +17,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
 CONFIG_DEBUG_UART_CLOCK=83000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x200000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d2_xplained_mmc_defconfig b/configs/sama5d2_xplained_mmc_defconfig
index 5033945118..02e9b83090 100644
--- a/configs/sama5d2_xplained_mmc_defconfig
+++ b/configs/sama5d2_xplained_mmc_defconfig
@@ -18,7 +18,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
 CONFIG_DEBUG_UART_CLOCK=83000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x200000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d2_xplained_qspiflash_defconfig b/configs/sama5d2_xplained_qspiflash_defconfig
index 66b3b2d455..4325e75e13 100644
--- a/configs/sama5d2_xplained_qspiflash_defconfig
+++ b/configs/sama5d2_xplained_qspiflash_defconfig
@@ -18,7 +18,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xf8020000
 CONFIG_DEBUG_UART_CLOCK=83000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x200000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d3_xplained_mmc_defconfig b/configs/sama5d3_xplained_mmc_defconfig
index fa85fabb01..a9e7cee4cf 100644
--- a/configs/sama5d3_xplained_mmc_defconfig
+++ b/configs/sama5d3_xplained_mmc_defconfig
@@ -18,7 +18,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xffffee00
 CONFIG_DEBUG_UART_CLOCK=132000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x300000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d3xek_mmc_defconfig b/configs/sama5d3xek_mmc_defconfig
index 2d8a6a2c65..8fa03a65f5 100644
--- a/configs/sama5d3xek_mmc_defconfig
+++ b/configs/sama5d3xek_mmc_defconfig
@@ -18,7 +18,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xffffee00
 CONFIG_DEBUG_UART_CLOCK=132000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x300000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d4_xplained_mmc_defconfig b/configs/sama5d4_xplained_mmc_defconfig
index e4f25c9130..0a620bd97d 100644
--- a/configs/sama5d4_xplained_mmc_defconfig
+++ b/configs/sama5d4_xplained_mmc_defconfig
@@ -18,7 +18,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xfc00c000
 CONFIG_DEBUG_UART_CLOCK=100000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x200000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sama5d4ek_mmc_defconfig b/configs/sama5d4ek_mmc_defconfig
index 11adfe2093..22b091bb99 100644
--- a/configs/sama5d4ek_mmc_defconfig
+++ b/configs/sama5d4ek_mmc_defconfig
@@ -18,7 +18,6 @@ CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xfc00c000
 CONFIG_DEBUG_UART_CLOCK=88000000
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x200000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/sksimx6_defconfig b/configs/sksimx6_defconfig
index 8026c59aa8..adb7fcae3e 100644
--- a/configs/sksimx6_defconfig
+++ b/configs/sksimx6_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
diff --git a/configs/thuban_defconfig b/configs/thuban_defconfig
index c606cdff9c..13cf7d9c90 100644
--- a/configs/thuban_defconfig
+++ b/configs/thuban_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/ti814x_evm_defconfig b/configs/ti814x_evm_defconfig
index b7050198ab..7dc2f6a3a9 100644
--- a/configs/ti814x_evm_defconfig
+++ b/configs/ti814x_evm_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x40300000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_BOOTDELAY=1
diff --git a/configs/ti816x_evm_defconfig b/configs/ti816x_evm_defconfig
index 6bbb83782f..8afd5af70d 100644
--- a/configs/ti816x_evm_defconfig
+++ b/configs/ti816x_evm_defconfig
@@ -12,7 +12,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x40400000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/udoo_defconfig b/configs/udoo_defconfig
index 9f87c72b57..d4262e54e8 100644
--- a/configs/udoo_defconfig
+++ b/configs/udoo_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
diff --git a/configs/udoo_neo_defconfig b/configs/udoo_neo_defconfig
index a2355af9b9..0ef46d2079 100644
--- a/configs/udoo_neo_defconfig
+++ b/configs/udoo_neo_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/vining_2000_defconfig b/configs/vining_2000_defconfig
index 1a58d4c201..4cd598685b 100644
--- a/configs/vining_2000_defconfig
+++ b/configs/vining_2000_defconfig
@@ -14,7 +14,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_FIT=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 0843fccf1d..93a4157b6c 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -15,7 +15,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/woodburn_sd_defconfig b/configs/woodburn_sd_defconfig
index 99675054f0..f16f1d4a84 100644
--- a/configs/woodburn_sd_defconfig
+++ b/configs/woodburn_sd_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x10002300
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/woodburn/imximage.cfg"
 CONFIG_BOOTDELAY=3
diff --git a/configs/xpress_spl_defconfig b/configs/xpress_spl_defconfig
index 3df0021df2..cff4e5cca1 100644
--- a/configs/xpress_spl_defconfig
+++ b/configs/xpress_spl_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/mach-imx/spl_sd.cfg"
 CONFIG_BOOTDELAY=3
diff --git a/configs/zc5202_defconfig b/configs/zc5202_defconfig
index 4c6a765c91..19a7f88fb7 100644
--- a/configs/zc5202_defconfig
+++ b/configs/zc5202_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/zc5601_defconfig b/configs/zc5601_defconfig
index faa4c5eb2b..932311089d 100644
--- a/configs/zc5601_defconfig
+++ b/configs/zc5601_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
-CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/doc/README.SPL b/doc/README.SPL
index 929b9672b0..29196d2192 100644
--- a/doc/README.SPL
+++ b/doc/README.SPL
@@ -46,7 +46,6 @@ optionally define CONFIG_SPL_XXX_SUPPORT. Currently following options
 are supported:
 
 CONFIG_SPL_LIBCOMMON_SUPPORT (common/libcommon.o)
-CONFIG_SPL_LIBDISK_SUPPORT (disk/libdisk.o)
 CONFIG_SPL_I2C_SUPPORT (drivers/i2c/libi2c.o)
 CONFIG_SPL_GPIO_SUPPORT (drivers/gpio/libgpio.o)
 CONFIG_SPL_MMC_SUPPORT (drivers/mmc/libmmc.o)
-- 
2.24.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
