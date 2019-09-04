Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BEEA9610
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Sep 2019 00:17:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E57AC36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Sep 2019 22:17:06 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D77AC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 22:17:04 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46Nyq349Ndz1rTYl;
 Thu,  5 Sep 2019 00:17:03 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46Nyq32R35z1qqkc;
 Thu,  5 Sep 2019 00:17:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 48xf-gZZ4_rt; Thu,  5 Sep 2019 00:16:59 +0200 (CEST)
X-Auth-Info: ebg+fsz2a2j2d4SWcpP+hCR8TOBVQ4H8HiLvtarr46A=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  5 Sep 2019 00:16:59 +0200 (CEST)
From: Lukasz Majewski <lukma@denx.de>
To: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>,
 Stefano Babic <sbabic@denx.de>, Fabio Estevam <festevam@gmail.com>
Date: Thu,  5 Sep 2019 00:16:39 +0200
Message-Id: <20190904221639.26469-4-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190904221639.26469-1-lukma@denx.de>
References: <20190904221639.26469-1-lukma@denx.de>
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Vignesh R <vigneshr@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Pankit Garg <pankit.garg@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Tien Fong Chee <tien.fong.chee@intel.com>, Sumit Garg <sumit.garg@nxp.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Yinbo Zhu <yinbo.zhu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Feng Li <feng.li_2@nxp.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 York Sun <york.sun@nxp.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 u-boot@lists.denx.de, "Andrew F. Davis" <afd@ti.com>,
 Eugen Hristev <eugen.hristev@microchip.com>
Subject: [Uboot-stm32] [PATCH v3 3/3] spi: Convert CONFIG_DM_SPI* to
	CONFIG_$(SPL_TPL_)DM_SPI*
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

This change allows more fine tuning of driver model based SPI support in
SPL and TPL. It is now possible to explicitly enable/disable the DM_SPI
support in SPL and TPL via Kconfig option.

Before this change it was necessary to use:
    /* SPI Flash Configs */
    #if defined(CONFIG_SPL_BUILD)
    #undef CONFIG_DM_SPI
    #undef CONFIG_DM_SPI_FLASH
    #undef CONFIG_SPI_FLASH_MTD
    #endif

in the ./include/configs/<board>.h, which is error prone and shall be
avoided when we strive to switch to Kconfig.

The goal of this patch:

Provide distinction for DM_SPI support in both U-Boot proper and SPL (TPL).
Valid use case is when U-Boot proper wants to use DM_SPI, but SPL must
still support non DM driver.

Another use case is the conversion of non DM/DTS SPI driver to support
DM/DTS. When such driver needs to work in both SPL and U-Boot proper, the
distinction is needed in Kconfig (also if SPL version of the driver
supports OF_PLATDATA).

In the end of the day one would have to support following use cases (in
single driver file - e.g. mxs_spi.c):

- U-Boot proper driver supporting DT/DTS
- U-Boot proper driver without DT/DTS support (deprecated)
- SPL driver without DT/DTS support
- SPL (and TPL) driver with DT/DTS (when the SoC has enough resources to
  run full blown DT/DTS)
- SPL driver with DT/DTS and SPL_OF_PLATDATA (when one have constrained
  environment with no fitImage and OF_LIBFDT support).

Some boards do require SPI support (with DM) in SPL (TPL) and some only
have DM_SPI{_FLASH} defined to allow compiling SPL.

This patch converts #ifdef CONFIG_DM_SPI* to #if CONFIG_IS_ENABLED(DM_SPI)
and provides corresponding defines in Kconfig.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Tested-by: Adam Ford <aford173@gmail.com> #da850-evm

---

Changes in v3:
- Fix da850evm_nand and da850evm by enabling SPL_DM_SPI support in
  Kconfig
- Drop patch from the series
  [U-Boot,v2,1/4] kconfig: doc: Update comment regarding CONFIG_IS_ENABLED(FOO) for TPL
  as not being related to this particular change

Changes in v2:
- Resend patches with some not yet in mainline code removed as
  suggested by Adam Ford


===================================
BIG FAT NOTE (REQUEST FOR TESTING):
===================================

The adjustments were done only to make the buildman / travis-CI build
clean.

Board maintainers are kindly asked to check if there are no failures on
boards booting (or unintentional increase of binary size).

Note:
=====

Some boards require adjustments in ./configs/<board>_defconfig (like Siemens).
Other boards require modification in arch/arm/Kconfig (like MVEBU)
Yet another ones - like ones from Samsung - doesn't use SPL at all.
There are also boards - like i.MX{25678} - which (till now) doesn't use
SPI drivers supporting DM in their SPL.


Applied on top of -master branch:
SHA1: 448f11f7503995746a7b71e5e3b3a831c4651be9

---
 arch/arm/Kconfig                            | 14 ++++++++++++++
 board/l+g/vinco/vinco.c                     |  4 ++--
 cmd/sf.c                                    |  4 ++--
 cmd/spi.c                                   |  6 +++---
 common/spl/Kconfig                          | 28 ++++++++++++++++++++++++++++
 configs/am57xx_evm_defconfig                |  2 ++
 configs/am57xx_hs_evm_defconfig             |  2 ++
 configs/am57xx_hs_evm_usb_defconfig         |  2 ++
 configs/axm_defconfig                       |  2 ++
 configs/chromebook_link64_defconfig         |  2 ++
 configs/chromebook_samus_tpl_defconfig      |  4 ++++
 configs/dra7xx_evm_defconfig                |  2 ++
 configs/dra7xx_hs_evm_defconfig             |  2 ++
 configs/dra7xx_hs_evm_usb_defconfig         |  2 ++
 configs/j721e_evm_a72_defconfig             |  2 ++
 configs/j721e_evm_r5_defconfig              |  2 ++
 configs/ls1021aiot_qspi_defconfig           |  2 ++
 configs/ls1021aiot_sdcard_defconfig         |  2 ++
 configs/ls1021aqds_qspi_defconfig           |  1 +
 configs/ls1021aqds_sdcard_qspi_defconfig    |  1 +
 configs/ls1021atwr_qspi_defconfig           |  1 +
 configs/sama5d2_xplained_spiflash_defconfig |  2 ++
 configs/sama5d3xek_spiflash_defconfig       |  6 ++++--
 configs/sama5d4_xplained_spiflash_defconfig |  2 ++
 configs/sama5d4ek_spiflash_defconfig        |  2 ++
 configs/stm32mp15_basic_defconfig           |  2 ++
 configs/taurus_defconfig                    |  2 ++
 drivers/mtd/spi/Makefile                    |  4 ++--
 drivers/mtd/spi/sf_probe.c                  |  8 ++++----
 drivers/net/fm/fm.c                         |  4 ++--
 drivers/spi/Makefile                        |  2 +-
 drivers/spi/atmel_spi.c                     |  4 ++--
 drivers/spi/davinci_spi.c                   |  6 +++---
 drivers/spi/fsl_dspi.c                      |  5 +++--
 drivers/spi/kirkwood_spi.c                  |  2 +-
 drivers/spi/mxc_spi.c                       |  6 +++---
 drivers/spi/omap3_spi.c                     |  4 ++--
 drivers/spi/sh_qspi.c                       |  4 ++--
 env/sf.c                                    |  2 +-
 include/spi.h                               |  8 ++++----
 include/spi_flash.h                         |  2 +-
 test/dm/spi.c                               |  2 +-
 42 files changed, 126 insertions(+), 40 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 490f2abcf1..c55c4f25fe 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -493,6 +493,7 @@ config TARGET_GPLUGD
 config ARCH_DAVINCI
 	bool "TI DaVinci"
 	select CPU_ARM926EJS
+	select SPL_DM_SPI if SPL
 	imply CMD_SAVES
 	help
 	  Support for TI's DaVinci platform.
@@ -510,6 +511,8 @@ config ARCH_MVEBU
 	select DM_SERIAL
 	select DM_SPI
 	select DM_SPI_FLASH
+	select SPL_DM_SPI if SPL
+	select SPL_DM_SPI_FLASH if SPL
 	select OF_CONTROL
 	select OF_SEPARATE
 	select SPI
@@ -918,6 +921,8 @@ config ARCH_SOCFPGA
 	imply FAT_WRITE
 	imply SPL
 	imply SPL_DM
+	imply SPL_DM_SPI
+	imply SPL_DM_SPI_FLASH
 	imply SPL_LIBDISK_SUPPORT
 	imply SPL_MMC_SUPPORT
 	imply SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
@@ -1006,6 +1011,8 @@ config ARCH_ZYNQ
 	select SPL_BOARD_INIT if SPL
 	select SPL_CLK if SPL
 	select SPL_DM if SPL
+	select SPL_DM_SPI if SPL
+	select SPL_DM_SPI_FLASH if SPL
 	select SPL_OF_CONTROL if SPL
 	select SPL_SEPARATE_BSS if SPL
 	select SUPPORT_SPL
@@ -1042,6 +1049,8 @@ config ARCH_ZYNQMP
 	select OF_CONTROL
 	select SPL_BOARD_INIT if SPL
 	select SPL_CLK if SPL
+	select SPL_DM_SPI if SPI
+	select SPL_DM_SPI_FLASH if SPL_DM_SPI
 	select SPL_SEPARATE_BSS if SPL
 	select SUPPORT_SPL
 	imply BOARD_LATE_INIT
@@ -1441,6 +1450,7 @@ config TARGET_LS1046AQDS
 	select BOARD_EARLY_INIT_F
 	select BOARD_LATE_INIT
 	select DM_SPI_FLASH if DM_SPI
+	select SPL_DM_SPI
 	select SUPPORT_SPL
 	select FSL_DDR_BIST if !SPL
 	select FSL_DDR_INTERACTIVE  if !SPL
@@ -1461,6 +1471,7 @@ config TARGET_LS1046ARDB
 	select BOARD_EARLY_INIT_F
 	select BOARD_LATE_INIT
 	select DM_SPI_FLASH if DM_SPI
+	select SPL_DM_SPI
 	select POWER_MC34VR500
 	select SUPPORT_SPL
 	select FSL_DDR_BIST
@@ -1481,6 +1492,7 @@ config TARGET_LS1046AFRWY
 	select BOARD_EARLY_INIT_F
 	select BOARD_LATE_INIT
 	select DM_SPI_FLASH if DM_SPI
+	select SPL_DM_SPI
 	imply SCSI
 	help
 	  Support for Freescale LS1046AFRWY platform.
@@ -1593,6 +1605,8 @@ config ARCH_ROCKCHIP
 	select OF_CONTROL
 	select SPI
 	select SPL_DM if SPL
+	select SPL_DM_SPI if SPL
+	select SPL_DM_SPI_FLASH if SPL
 	select SPL_SYS_MALLOC_SIMPLE if SPL
 	select SYS_MALLOC_F
 	select SYS_THUMB_BUILD if !ARM64
diff --git a/board/l+g/vinco/vinco.c b/board/l+g/vinco/vinco.c
index 029ab12391..d7cb1bda5e 100644
--- a/board/l+g/vinco/vinco.c
+++ b/board/l+g/vinco/vinco.c
@@ -33,7 +33,7 @@
 DECLARE_GLOBAL_DATA_PTR;
 
 /* FIXME gpio code here need to handle through DM_GPIO */
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 int spi_cs_is_valid(unsigned int bus, unsigned int cs)
 {
 	return bus == 0 && cs == 0;
@@ -166,7 +166,7 @@ int board_init(void)
 	/* adress of boot parameters */
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 	vinco_spi0_hw_init();
 #endif
 
diff --git a/cmd/sf.c b/cmd/sf.c
index 6ccf98ae51..5487a05c3f 100644
--- a/cmd/sf.c
+++ b/cmd/sf.c
@@ -85,7 +85,7 @@ static int do_spi_flash_probe(int argc, char * const argv[])
 	unsigned int speed = CONFIG_SF_DEFAULT_SPEED;
 	unsigned int mode = CONFIG_SF_DEFAULT_MODE;
 	char *endp;
-#ifdef CONFIG_DM_SPI_FLASH
+#if CONFIG_IS_ENABLED(DM_SPI_FLASH)
 	struct udevice *new, *bus_dev;
 	int ret;
 #else
@@ -118,7 +118,7 @@ static int do_spi_flash_probe(int argc, char * const argv[])
 			return -1;
 	}
 
-#ifdef CONFIG_DM_SPI_FLASH
+#if CONFIG_IS_ENABLED(DM_SPI_FLASH)
 	/* Remove the old device, otherwise probe will just be a nop */
 	ret = spi_find_bus_and_cs(bus, cs, &bus_dev, &new);
 	if (!ret) {
diff --git a/cmd/spi.c b/cmd/spi.c
index 75226fd368..f163cec23b 100644
--- a/cmd/spi.c
+++ b/cmd/spi.c
@@ -37,7 +37,7 @@ static int do_spi_xfer(int bus, int cs)
 	struct spi_slave *slave;
 	int ret = 0;
 
-#ifdef CONFIG_DM_SPI
+#if CONFIG_IS_ENABLED(DM_SPI)
 	char name[30], *str;
 	struct udevice *dev;
 
@@ -62,7 +62,7 @@ static int do_spi_xfer(int bus, int cs)
 		goto done;
 	ret = spi_xfer(slave, bitlen, dout, din,
 		       SPI_XFER_BEGIN | SPI_XFER_END);
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 	/* We don't get an error code in this case */
 	if (ret)
 		ret = -EIO;
@@ -78,7 +78,7 @@ static int do_spi_xfer(int bus, int cs)
 	}
 done:
 	spi_release_bus(slave);
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 	spi_free_slave(slave);
 #endif
 
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index f467eca2be..77c5a9f818 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -671,6 +671,19 @@ config SPL_UBI
 	  Enable support for loading payloads from UBI. See
 	  README.ubispl for more info.
 
+if SPL_DM
+config SPL_DM_SPI
+	bool "Support SPI DM drivers in SPL"
+	help
+	  Enable support for SPI DM drivers in SPL.
+
+config SPL_DM_SPI_FLASH
+	bool "Support SPI DM FLASH drivers in SPL"
+	help
+	  Enable support for SPI DM flash drivers in SPL.
+
+endif
+
 if SPL_UBI
 config SPL_UBI_LOAD_BY_VOLNAME
 	bool "Support loading volumes by name"
@@ -995,6 +1008,11 @@ config SPL_SPI_FLASH_SFDP_SUPPORT
 	 SPI NOR flashes using Serial Flash Discoverable Parameters (SFDP)
 	 tables as per JESD216 standard in SPL.
 
+config SPL_SPI_FLASH_MTD
+	bool "Support for SPI flash MTD drivers in SPL"
+	help
+	  Enable support for SPI flash MTD drivers in SPL.
+
 config SPL_SPI_LOAD
 	bool "Support loading from SPI flash"
 	help
@@ -1387,6 +1405,16 @@ config TPL_SPI_SUPPORT
 	  Enable support for using SPI in TPL. See SPL_SPI_SUPPORT for
 	  details.
 
+config TPL_DM_SPI
+	bool "Support SPI DM drivers in TPL"
+	help
+	  Enable support for SPI DM drivers in TPL.
+
+config TPL_DM_SPI_FLASH
+	bool "Support SPI DM FLASH drivers in TPL"
+	help
+	  Enable support for SPI DM flash drivers in TPL.
+
 config TPL_YMODEM_SUPPORT
 	bool "Support loading using Ymodem"
 	depends on TPL_SERIAL_SUPPORT
diff --git a/configs/am57xx_evm_defconfig b/configs/am57xx_evm_defconfig
index 248c302057..66d812e4fc 100644
--- a/configs/am57xx_evm_defconfig
+++ b/configs/am57xx_evm_defconfig
@@ -65,6 +65,7 @@ CONFIG_DM_MMC=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SF_DEFAULT_MODE=0
 CONFIG_SF_DEFAULT_SPEED=76800000
@@ -84,6 +85,7 @@ CONFIG_DM_SCSI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_TI_QSPI=y
 CONFIG_USB=y
 CONFIG_DM_USB=y
diff --git a/configs/am57xx_hs_evm_defconfig b/configs/am57xx_hs_evm_defconfig
index 7b56df8db7..74ed44d3f4 100644
--- a/configs/am57xx_hs_evm_defconfig
+++ b/configs/am57xx_hs_evm_defconfig
@@ -63,6 +63,7 @@ CONFIG_DM_MMC=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SF_DEFAULT_MODE=0
 CONFIG_SF_DEFAULT_SPEED=76800000
@@ -82,6 +83,7 @@ CONFIG_DM_SCSI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_TI_QSPI=y
 CONFIG_USB=y
 CONFIG_DM_USB=y
diff --git a/configs/am57xx_hs_evm_usb_defconfig b/configs/am57xx_hs_evm_usb_defconfig
index c8078e9f4e..ec798ef90d 100644
--- a/configs/am57xx_hs_evm_usb_defconfig
+++ b/configs/am57xx_hs_evm_usb_defconfig
@@ -69,6 +69,7 @@ CONFIG_DM_MMC=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SF_DEFAULT_MODE=0
 CONFIG_SF_DEFAULT_SPEED=76800000
@@ -89,6 +90,7 @@ CONFIG_DM_REGULATOR_PALMAS=y
 CONFIG_DM_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_TI_QSPI=y
 CONFIG_USB=y
 CONFIG_DM_USB=y
diff --git a/configs/axm_defconfig b/configs/axm_defconfig
index a1d374aeb5..b49d681bd6 100644
--- a/configs/axm_defconfig
+++ b/configs/axm_defconfig
@@ -60,6 +60,8 @@ CONFIG_CLK_AT91=y
 CONFIG_NAND=y
 # CONFIG_SYS_NAND_USE_FLASH_BBT is not set
 CONFIG_NAND_ATMEL=y
+CONFIG_SPL_DM_SPI=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/configs/chromebook_link64_defconfig b/configs/chromebook_link64_defconfig
index 4bbd7a67dc..24042aef6a 100644
--- a/configs/chromebook_link64_defconfig
+++ b/configs/chromebook_link64_defconfig
@@ -27,6 +27,8 @@ CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_CPU_SUPPORT=y
 CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
+CONFIG_SPL_DM_SPI=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPL_NET_SUPPORT=y
 CONFIG_SPL_PCI=y
 CONFIG_SPL_PCH_SUPPORT=y
diff --git a/configs/chromebook_samus_tpl_defconfig b/configs/chromebook_samus_tpl_defconfig
index 973460082d..10ff4167c1 100644
--- a/configs/chromebook_samus_tpl_defconfig
+++ b/configs/chromebook_samus_tpl_defconfig
@@ -27,11 +27,15 @@ CONFIG_BLOBLIST_ADDR=0xff7c0000
 CONFIG_HANDOFF=y
 CONFIG_SPL_TEXT_BASE=0xffe70000
 CONFIG_SPL_SEPARATE_BSS=y
+CONFIG_SPL_DM_SPI=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPL_NET_SUPPORT=y
 CONFIG_SPL_PCI=y
 CONFIG_SPL_PCH_SUPPORT=y
 CONFIG_TPL_PCI=y
 CONFIG_TPL_PCH_SUPPORT=y
+CONFIG_TPL_DM_SPI=y
+CONFIG_TPL_DM_SPI_FLASH=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_CPU=y
 # CONFIG_CMD_FLASH is not set
diff --git a/configs/dra7xx_evm_defconfig b/configs/dra7xx_evm_defconfig
index ad8868e512..1bf8f97192 100644
--- a/configs/dra7xx_evm_defconfig
+++ b/configs/dra7xx_evm_defconfig
@@ -75,6 +75,7 @@ CONFIG_MMC_OMAP_HS=y
 CONFIG_NAND=y
 CONFIG_SYS_NAND_BUSWIDTH_16BIT=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SF_DEFAULT_MODE=0
 CONFIG_SF_DEFAULT_SPEED=76800000
@@ -96,6 +97,7 @@ CONFIG_DM_SCSI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_TI_QSPI=y
 CONFIG_TIMER=y
 CONFIG_OMAP_TIMER=y
diff --git a/configs/dra7xx_hs_evm_defconfig b/configs/dra7xx_hs_evm_defconfig
index 7a5c3e72d4..6d3d357411 100644
--- a/configs/dra7xx_hs_evm_defconfig
+++ b/configs/dra7xx_hs_evm_defconfig
@@ -78,6 +78,7 @@ CONFIG_MMC_OMAP_HS=y
 CONFIG_NAND=y
 CONFIG_SYS_NAND_BUSWIDTH_16BIT=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SF_DEFAULT_MODE=0
 CONFIG_SF_DEFAULT_SPEED=76800000
@@ -99,6 +100,7 @@ CONFIG_DM_SCSI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_TI_QSPI=y
 CONFIG_TIMER=y
 CONFIG_OMAP_TIMER=y
diff --git a/configs/dra7xx_hs_evm_usb_defconfig b/configs/dra7xx_hs_evm_usb_defconfig
index 040e6f7fdd..4b2dce6b15 100644
--- a/configs/dra7xx_hs_evm_usb_defconfig
+++ b/configs/dra7xx_hs_evm_usb_defconfig
@@ -78,6 +78,7 @@ CONFIG_MMC_HS200_SUPPORT=y
 CONFIG_SPL_MMC_HS200_SUPPORT=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SF_DEFAULT_MODE=0
 CONFIG_SF_DEFAULT_SPEED=76800000
@@ -100,6 +101,7 @@ CONFIG_DM_SCSI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_TI_QSPI=y
 CONFIG_TIMER=y
 CONFIG_OMAP_TIMER=y
diff --git a/configs/j721e_evm_a72_defconfig b/configs/j721e_evm_a72_defconfig
index 6e355f5247..380bd0b814 100644
--- a/configs/j721e_evm_a72_defconfig
+++ b/configs/j721e_evm_a72_defconfig
@@ -63,6 +63,7 @@ CONFIG_DM_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_AM654=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_PINCTRL=y
@@ -77,6 +78,7 @@ CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_SYSRESET=y
 CONFIG_SPL_SYSRESET=y
diff --git a/configs/j721e_evm_r5_defconfig b/configs/j721e_evm_r5_defconfig
index b516f9d0e5..cdf10503e6 100644
--- a/configs/j721e_evm_r5_defconfig
+++ b/configs/j721e_evm_r5_defconfig
@@ -67,6 +67,7 @@ CONFIG_DM_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_AM654=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_PINCTRL=y
@@ -83,6 +84,7 @@ CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_SYSRESET=y
 CONFIG_SPL_SYSRESET=y
diff --git a/configs/ls1021aiot_qspi_defconfig b/configs/ls1021aiot_qspi_defconfig
index 5dcec24005..00a5f13dba 100644
--- a/configs/ls1021aiot_qspi_defconfig
+++ b/configs/ls1021aiot_qspi_defconfig
@@ -12,6 +12,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
+CONFIG_CMD_SF=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ls1021a-iot-duart"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
@@ -35,6 +36,7 @@ CONFIG_DM_SCSI=y
 CONFIG_SYS_NS16550=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_FSL_DSPI=y
 CONFIG_FSL_QSPI=y
 CONFIG_USB=y
diff --git a/configs/ls1021aiot_sdcard_defconfig b/configs/ls1021aiot_sdcard_defconfig
index 93eb83471c..3dc879fe70 100644
--- a/configs/ls1021aiot_sdcard_defconfig
+++ b/configs/ls1021aiot_sdcard_defconfig
@@ -17,6 +17,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
+CONFIG_CMD_SF=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ls1021a-iot-duart"
@@ -41,6 +42,7 @@ CONFIG_DM_SCSI=y
 CONFIG_SYS_NS16550=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_FSL_DSPI=y
 CONFIG_FSL_QSPI=y
 CONFIG_USB=y
diff --git a/configs/ls1021aqds_qspi_defconfig b/configs/ls1021aqds_qspi_defconfig
index db74cc5712..bb1d1afcb4 100644
--- a/configs/ls1021aqds_qspi_defconfig
+++ b/configs/ls1021aqds_qspi_defconfig
@@ -54,6 +54,7 @@ CONFIG_DM_SCSI=y
 CONFIG_SYS_NS16550=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_FSL_DSPI=y
 CONFIG_FSL_QSPI=y
 CONFIG_USB=y
diff --git a/configs/ls1021aqds_sdcard_qspi_defconfig b/configs/ls1021aqds_sdcard_qspi_defconfig
index cc71c28259..285a7bcaa6 100644
--- a/configs/ls1021aqds_sdcard_qspi_defconfig
+++ b/configs/ls1021aqds_sdcard_qspi_defconfig
@@ -66,6 +66,7 @@ CONFIG_DM_SCSI=y
 CONFIG_SYS_NS16550=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPIy=y
 CONFIG_FSL_DSPI=y
 CONFIG_FSL_QSPI=y
 CONFIG_USB=y
diff --git a/configs/ls1021atwr_qspi_defconfig b/configs/ls1021atwr_qspi_defconfig
index 0e2525fd71..27ce459ffb 100644
--- a/configs/ls1021atwr_qspi_defconfig
+++ b/configs/ls1021atwr_qspi_defconfig
@@ -53,6 +53,7 @@ CONFIG_DM_SCSI=y
 CONFIG_SYS_NS16550=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPI_DM_SPI=y
 CONFIG_FSL_DSPI=y
 CONFIG_FSL_QSPI=y
 CONFIG_USB=y
diff --git a/configs/sama5d2_xplained_spiflash_defconfig b/configs/sama5d2_xplained_spiflash_defconfig
index 6958621cdf..0a448b57d4 100644
--- a/configs/sama5d2_xplained_spiflash_defconfig
+++ b/configs/sama5d2_xplained_spiflash_defconfig
@@ -65,6 +65,8 @@ CONFIG_I2C_EEPROM=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_ATMEL=y
+CONFIG_SPL_DM_SPI=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=30000000
diff --git a/configs/sama5d3xek_spiflash_defconfig b/configs/sama5d3xek_spiflash_defconfig
index b27a288b4a..bcbc4312dc 100644
--- a/configs/sama5d3xek_spiflash_defconfig
+++ b/configs/sama5d3xek_spiflash_defconfig
@@ -7,10 +7,11 @@ CONFIG_SPL_GPIO_SUPPORT=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
-CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_ENV_OFFSET=0x6000
+CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BOARD_INIT=y
@@ -28,6 +29,7 @@ CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk mtdparts=atmel_nand:256k(bootstrap)ro,768k(uboot)ro,256K(env_redundant),256k(env),512k(dtb),6M(kernel)ro,-(rootfs) rootfstype=ubifs ubi.mtd=6 root=ubi0:rootfs"
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_SPL_TEXT_BASE=0x300000
+CONFIG_SPL_DM_SPI=y
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x10000
 CONFIG_HUSH_PARSER=y
diff --git a/configs/sama5d4_xplained_spiflash_defconfig b/configs/sama5d4_xplained_spiflash_defconfig
index a2e9595088..3a8b291721 100644
--- a/configs/sama5d4_xplained_spiflash_defconfig
+++ b/configs/sama5d4_xplained_spiflash_defconfig
@@ -66,6 +66,7 @@ CONFIG_NAND=y
 # CONFIG_SYS_NAND_USE_FLASH_BBT is not set
 CONFIG_NAND_ATMEL=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=30000000
 CONFIG_SPI_FLASH_ATMEL=y
@@ -80,6 +81,7 @@ CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_ATMEL_USART=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_TIMER=y
 CONFIG_SPL_TIMER=y
 CONFIG_ATMEL_PIT_TIMER=y
diff --git a/configs/sama5d4ek_spiflash_defconfig b/configs/sama5d4ek_spiflash_defconfig
index aa1a492997..dfc1100466 100644
--- a/configs/sama5d4ek_spiflash_defconfig
+++ b/configs/sama5d4ek_spiflash_defconfig
@@ -63,6 +63,7 @@ CONFIG_NAND=y
 # CONFIG_SYS_NAND_USE_FLASH_BBT is not set
 CONFIG_NAND_ATMEL=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=30000000
 CONFIG_SPI_FLASH_ATMEL=y
@@ -77,6 +78,7 @@ CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_ATMEL_USART=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_TIMER=y
 CONFIG_SPL_TIMER=y
 CONFIG_ATMEL_PIT_TIMER=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 09785b5dc1..61758f4c55 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -83,6 +83,7 @@ CONFIG_MTD=y
 CONFIG_NAND=y
 CONFIG_NAND_STM32_FMC2=y
 CONFIG_DM_SPI_FLASH=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_SPI_FLASH_SPANSION=y
@@ -110,6 +111,7 @@ CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_SPL_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_STM32_SPI=y
 CONFIG_USB=y
diff --git a/configs/taurus_defconfig b/configs/taurus_defconfig
index 3676ecd419..a53f04f1c8 100644
--- a/configs/taurus_defconfig
+++ b/configs/taurus_defconfig
@@ -68,6 +68,8 @@ CONFIG_DFU_NAND=y
 CONFIG_NAND=y
 # CONFIG_SYS_NAND_USE_FLASH_BBT is not set
 CONFIG_NAND_ATMEL=y
+CONFIG_SPL_DM_SPI=y
+CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/drivers/mtd/spi/Makefile b/drivers/mtd/spi/Makefile
index f99f6cb16e..b9566dcbb8 100644
--- a/drivers/mtd/spi/Makefile
+++ b/drivers/mtd/spi/Makefile
@@ -3,7 +3,7 @@
 # (C) Copyright 2006
 # Wolfgang Denk, DENX Software Engineering, wd@denx.de.
 
-obj-$(CONFIG_DM_SPI_FLASH) += sf-uclass.o
+obj-$(CONFIG_$(SPL_TPL_)DM_SPI_FLASH) += sf-uclass.o
 spi-nor-y := sf_probe.o spi-nor-ids.o
 
 ifdef CONFIG_SPL_BUILD
@@ -19,5 +19,5 @@ endif
 
 obj-$(CONFIG_SPI_FLASH) += spi-nor.o
 obj-$(CONFIG_SPI_FLASH_DATAFLASH) += sf_dataflash.o sf.o
-obj-$(CONFIG_SPI_FLASH_MTD) += sf_mtd.o
+obj-$(CONFIG_$(SPL_TPL_)SPI_FLASH_MTD) += sf_mtd.o
 obj-$(CONFIG_SPI_FLASH_SANDBOX) += sandbox.o
diff --git a/drivers/mtd/spi/sf_probe.c b/drivers/mtd/spi/sf_probe.c
index 73297e1a0a..5bc0c1d7f2 100644
--- a/drivers/mtd/spi/sf_probe.c
+++ b/drivers/mtd/spi/sf_probe.c
@@ -44,7 +44,7 @@ static int spi_flash_probe_slave(struct spi_flash *flash)
 	if (ret)
 		goto err_read_id;
 
-#ifdef CONFIG_SPI_FLASH_MTD
+#if CONFIG_IS_ENABLED(SPI_FLASH_MTD)
 	ret = spi_flash_mtd_register(flash);
 #endif
 
@@ -53,7 +53,7 @@ err_read_id:
 	return ret;
 }
 
-#ifndef CONFIG_DM_SPI_FLASH
+#if !CONFIG_IS_ENABLED(DM_SPI_FLASH)
 struct spi_flash *spi_flash_probe(unsigned int busnum, unsigned int cs,
 				  unsigned int max_hz, unsigned int spi_mode)
 {
@@ -83,7 +83,7 @@ struct spi_flash *spi_flash_probe(unsigned int busnum, unsigned int cs,
 
 void spi_flash_free(struct spi_flash *flash)
 {
-#ifdef CONFIG_SPI_FLASH_MTD
+#if CONFIG_IS_ENABLED(SPI_FLASH_MTD)
 	spi_flash_mtd_unregister();
 #endif
 	spi_free_slave(flash->spi);
@@ -152,7 +152,7 @@ static int spi_flash_std_probe(struct udevice *dev)
 
 static int spi_flash_std_remove(struct udevice *dev)
 {
-#ifdef CONFIG_SPI_FLASH_MTD
+#if CONFIG_IS_ENABLED(SPI_FLASH_MTD)
 	spi_flash_mtd_unregister();
 #endif
 	return 0;
diff --git a/drivers/net/fm/fm.c b/drivers/net/fm/fm.c
index 4c9dce8dc5..1d0eb20cb9 100644
--- a/drivers/net/fm/fm.c
+++ b/drivers/net/fm/fm.c
@@ -377,7 +377,7 @@ int fm_init_common(int index, struct ccsr_fman *reg)
 		addr = malloc(CONFIG_SYS_QE_FMAN_FW_LENGTH);
 		int ret = 0;
 
-#ifdef CONFIG_DM_SPI_FLASH
+#if CONFIG_IS_ENABLED(DM_SPI_FLASH)
 		struct udevice *new;
 
 		/* speed and mode will be read from DT */
@@ -464,7 +464,7 @@ int fm_init_common(int index, struct ccsr_fman *reg)
 	void *addr = malloc(CONFIG_SYS_QE_FMAN_FW_LENGTH);
 	int ret = 0;
 
-#ifdef CONFIG_DM_SPI_FLASH
+#if CONFIG_IS_ENABLED(DM_SPI_FLASH)
 	struct udevice *new;
 
 	/* speed and mode will be read from DT */
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index ae4f2958f8..93d20672eb 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -4,7 +4,7 @@
 # Wolfgang Denk, DENX Software Engineering, wd@denx.de.
 
 # There are many options which enable SPI, so make this library available
-ifdef CONFIG_DM_SPI
+ifdef CONFIG_$(SPL_TPL_)DM_SPI
 obj-y += spi-uclass.o
 obj-$(CONFIG_SANDBOX) += spi-emul-uclass.o
 obj-$(CONFIG_SOFT_SPI) += soft_spi.o
diff --git a/drivers/spi/atmel_spi.c b/drivers/spi/atmel_spi.c
index cf4de9ee1a..80002e5167 100644
--- a/drivers/spi/atmel_spi.c
+++ b/drivers/spi/atmel_spi.c
@@ -14,7 +14,7 @@
 
 #include <asm/arch/clk.h>
 #include <asm/arch/hardware.h>
-#ifdef CONFIG_DM_SPI
+#if CONFIG_IS_ENABLED(DM_SPI)
 #include <asm/arch/at91_spi.h>
 #endif
 #ifdef CONFIG_DM_GPIO
@@ -23,7 +23,7 @@
 
 #include "atmel_spi.h"
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 
 static int spi_has_wdrbt(struct atmel_spi_slave *slave)
 {
diff --git a/drivers/spi/davinci_spi.c b/drivers/spi/davinci_spi.c
index 4d2c106440..fe15126e74 100644
--- a/drivers/spi/davinci_spi.c
+++ b/drivers/spi/davinci_spi.c
@@ -52,7 +52,7 @@
 /* SPIDEF */
 #define SPIDEF_CSDEF0_MASK	BIT(0)
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 #define SPI0_BUS		0
 #define SPI0_BASE		CONFIG_SYS_SPI_BASE
 /*
@@ -119,7 +119,7 @@ struct davinci_spi_regs {
 
 /* davinci spi slave */
 struct davinci_spi_slave {
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 	struct spi_slave slave;
 #endif
 	struct davinci_spi_regs *regs;
@@ -343,7 +343,7 @@ out:
 	return 0;
 }
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 
 static inline struct davinci_spi_slave *to_davinci_spi(struct spi_slave *slave)
 {
diff --git a/drivers/spi/fsl_dspi.c b/drivers/spi/fsl_dspi.c
index a68a51945e..09a60bd05b 100644
--- a/drivers/spi/fsl_dspi.c
+++ b/drivers/spi/fsl_dspi.c
@@ -97,7 +97,7 @@ struct fsl_dspi_priv {
 	struct dspi *regs;
 };
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 struct fsl_dspi {
 	struct spi_slave slave;
 	struct fsl_dspi_priv priv;
@@ -411,7 +411,8 @@ static int fsl_dspi_cfg_speed(struct fsl_dspi_priv *priv, uint speed)
 
 	return 0;
 }
-#ifndef CONFIG_DM_SPI
+
+#if !CONFIG_IS_ENABLED(DM_SPI)
 int spi_cs_is_valid(unsigned int bus, unsigned int cs)
 {
 	if (((cs >= 0) && (cs < 8)) && ((bus >= 0) && (bus < 8)))
diff --git a/drivers/spi/kirkwood_spi.c b/drivers/spi/kirkwood_spi.c
index c725625146..afb25e6ee9 100644
--- a/drivers/spi/kirkwood_spi.c
+++ b/drivers/spi/kirkwood_spi.c
@@ -93,7 +93,7 @@ static int _spi_xfer(struct kwspi_registers *reg, unsigned int bitlen,
 	return 0;
 }
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 
 static struct kwspi_registers *spireg =
 	(struct kwspi_registers *)MVEBU_SPI_BASE;
diff --git a/drivers/spi/mxc_spi.c b/drivers/spi/mxc_spi.c
index d94aaf9fdb..efcb214fae 100644
--- a/drivers/spi/mxc_spi.c
+++ b/drivers/spi/mxc_spi.c
@@ -63,7 +63,7 @@ static inline struct mxc_spi_slave *to_mxc_spi_slave(struct spi_slave *slave)
 
 static void mxc_spi_cs_activate(struct mxc_spi_slave *mxcs)
 {
-#if defined(CONFIG_DM_SPI)
+#if CONFIG_IS_ENABLED(DM_SPI)
 	struct udevice *dev = mxcs->dev;
 	struct dm_spi_slave_platdata *slave_plat = dev_get_parent_platdata(dev);
 
@@ -81,7 +81,7 @@ static void mxc_spi_cs_activate(struct mxc_spi_slave *mxcs)
 
 static void mxc_spi_cs_deactivate(struct mxc_spi_slave *mxcs)
 {
-#if defined(CONFIG_DM_SPI)
+#if CONFIG_IS_ENABLED(DM_SPI)
 	struct udevice *dev = mxcs->dev;
 	struct dm_spi_slave_platdata *slave_plat = dev_get_parent_platdata(dev);
 
@@ -411,7 +411,7 @@ static int mxc_spi_claim_bus_internal(struct mxc_spi_slave *mxcs, int cs)
 	return 0;
 }
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 int spi_xfer(struct spi_slave *slave, unsigned int bitlen, const void *dout,
 		void *din, unsigned long flags)
 {
diff --git a/drivers/spi/omap3_spi.c b/drivers/spi/omap3_spi.c
index ff4c700645..9508947c61 100644
--- a/drivers/spi/omap3_spi.c
+++ b/drivers/spi/omap3_spi.c
@@ -108,7 +108,7 @@ struct mcspi {
 };
 
 struct omap3_spi_priv {
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 	struct spi_slave slave;
 #endif
 	struct mcspi *regs;
@@ -454,7 +454,7 @@ static void _omap3_spi_claim_bus(struct omap3_spi_priv *priv)
 	writel(conf, &priv->regs->modulctrl);
 }
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 
 static inline struct omap3_spi_priv *to_omap3_spi(struct spi_slave *slave)
 {
diff --git a/drivers/spi/sh_qspi.c b/drivers/spi/sh_qspi.c
index 5ae203d8d4..37f83b0bab 100644
--- a/drivers/spi/sh_qspi.c
+++ b/drivers/spi/sh_qspi.c
@@ -67,7 +67,7 @@ struct sh_qspi_regs {
 };
 
 struct sh_qspi_slave {
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 	struct spi_slave	slave;
 #endif
 	struct sh_qspi_regs	*regs;
@@ -222,7 +222,7 @@ static int sh_qspi_xfer_common(struct sh_qspi_slave *ss, unsigned int bitlen,
 	return ret;
 }
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 static inline struct sh_qspi_slave *to_sh_qspi(struct spi_slave *slave)
 {
 	return container_of(slave, struct sh_qspi_slave, slave);
diff --git a/env/sf.c b/env/sf.c
index 590d0cedd8..59d8af2ec6 100644
--- a/env/sf.c
+++ b/env/sf.c
@@ -38,7 +38,7 @@ static struct spi_flash *env_flash;
 
 static int setup_flash_device(void)
 {
-#ifdef CONFIG_DM_SPI_FLASH
+#if CONFIG_IS_ENABLED(DM_SPI_FLASH)
 	struct udevice *new;
 	int	ret;
 
diff --git a/include/spi.h b/include/spi.h
index 378594163b..81e07b2da6 100644
--- a/include/spi.h
+++ b/include/spi.h
@@ -36,7 +36,7 @@
 
 #define SPI_DEFAULT_WORDLEN	8
 
-#ifdef CONFIG_DM_SPI
+#if CONFIG_IS_ENABLED(DM_SPI)
 /* TODO(sjg@chromium.org): Remove this and use max_hz from struct spi_slave */
 struct dm_spi_bus {
 	uint max_hz;
@@ -95,7 +95,7 @@ struct dm_spi_slave_platdata {
  * @flags:		Indication of SPI flags.
  */
 struct spi_slave {
-#ifdef CONFIG_DM_SPI
+#if CONFIG_IS_ENABLED(DM_SPI)
 	struct udevice *dev;	/* struct spi_slave is dev->parentdata */
 	uint max_hz;
 	uint speed;
@@ -261,7 +261,7 @@ void spi_flash_copy_mmap(void *data, void *offset, size_t len);
  */
 int spi_cs_is_valid(unsigned int bus, unsigned int cs);
 
-#ifndef CONFIG_DM_SPI
+#if !CONFIG_IS_ENABLED(DM_SPI)
 /**
  * Activate a SPI chipselect.
  * This function is provided by the board code when using a driver
@@ -311,7 +311,7 @@ static inline int spi_w8r8(struct spi_slave *slave, unsigned char byte)
 	return ret < 0 ? ret : din[1];
 }
 
-#ifdef CONFIG_DM_SPI
+#if CONFIG_IS_ENABLED(DM_SPI)
 
 /**
  * struct spi_cs_info - Information about a bus chip select
diff --git a/include/spi_flash.h b/include/spi_flash.h
index 55b4721813..d63465758f 100644
--- a/include/spi_flash.h
+++ b/include/spi_flash.h
@@ -52,7 +52,7 @@ struct dm_spi_flash_ops {
 /* Access the serial operations for a device */
 #define sf_get_ops(dev) ((struct dm_spi_flash_ops *)(dev)->driver->ops)
 
-#ifdef CONFIG_DM_SPI_FLASH
+#if CONFIG_IS_ENABLED(DM_SPI_FLASH)
 /**
  * spi_flash_read_dm() - Read data from SPI flash
  *
diff --git a/test/dm/spi.c b/test/dm/spi.c
index ffd789cd7f..e101a078fd 100644
--- a/test/dm/spi.c
+++ b/test/dm/spi.c
@@ -117,7 +117,7 @@ static int dm_test_spi_xfer(struct unit_test_state *uts)
 	 * Since we are about to destroy all devices, we must tell sandbox
 	 * to forget the emulation device
 	 */
-#ifdef CONFIG_DM_SPI_FLASH
+#if CONFIG_IS_ENABLED(DM_SPI_FLASH)
 	sandbox_sf_unbind_emul(state_get_current(), busnum, cs);
 #endif
 
-- 
2.11.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
