Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5FFA960E
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Sep 2019 00:17:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15101C36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Sep 2019 22:17:00 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2355AC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 22:16:58 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46Nypv5C8yz1rTYl;
 Thu,  5 Sep 2019 00:16:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46Nypv1PkCz1qqkb;
 Thu,  5 Sep 2019 00:16:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id SAApE54JUk3c; Thu,  5 Sep 2019 00:16:51 +0200 (CEST)
X-Auth-Info: tIzTSwYRKoyteWvxSdRwOhprrsM6LYUXlRjTsKCVKFg=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  5 Sep 2019 00:16:51 +0200 (CEST)
From: Lukasz Majewski <lukma@denx.de>
To: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>,
 Stefano Babic <sbabic@denx.de>, Fabio Estevam <festevam@gmail.com>
Date: Thu,  5 Sep 2019 00:16:36 +0200
Message-Id: <20190904221639.26469-1-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Vignesh R <vigneshr@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Pankit Garg <pankit.garg@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Zhao Qiang <qiang.zhao@nxp.com>,
 Tien Fong Chee <tien.fong.chee@intel.com>, Sumit Garg <sumit.garg@nxp.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Yinbo Zhu <yinbo.zhu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Feng Li <feng.li_2@nxp.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Mian Yousaf Kaukab <ykaukab@suse.de>, Adam Ford <aford173@gmail.com>,
 York Sun <york.sun@nxp.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Wen He <wen.he_1@nxp.com>, u-boot@lists.denx.de,
 "Andrew F. Davis" <afd@ti.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Eugen Hristev <eugen.hristev@microchip.com>
Subject: [Uboot-stm32] [PATCH v3 0/3] spi: Split CONFIG_DM_SPI* to
	CONFIG_{SPL_TPL}DM_SPI*
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

This patch series introduces new SPL and TPL specific Kconfig entries for
DM_SPI* options. Such change allows using the spi driver in SPL/TPL or
U-Boot proper.

First two patches - related to ls10{42}* NXP soc fix some issues with
defining the DM_SPI* defines in <board>.h file instead of Kconfig.

This series doesn't introduce build breaks, but board maintainers are kindly
asked to check if their boards still boots.

Buildman setup for binary size regression checking:

./tools/buildman/buildman.py -b HEAD --count=4 ls1043 --output-dir=../BUILD/ --force-build -CveE
./tools/buildman/buildman.py -b HEAD --count=4 ls1043 --output-dir=../BUILD/ -Ssdel


Changes in v3:
- Provide better Kconfig flags conditionals to avoid not compiling
  relavant code (there is negative diff observed after applying those
  patches)
- Fix da850evm_nand and da850evm by enabling SPL_DM_SPI support in
  Kconfig
- Drop patch from the series
  [U-Boot,v2,1/4] kconfig: doc: Update comment regarding CONFIG_IS_ENABLED(FOO) for TPL
  as not being related to this particular change

Changes in v2:
- Resend patches with some not yet in mainline code removed as
  suggested by Adam Ford

Lukasz Majewski (3):
  spi: Move DM_SPI_FLASH to Kconfig (for NXP's ls1043a)
  spi: Move DM_SPI_FLASH and SPI_FLASH_DATAFLASH to Kconfig (for
    ls1021aXXX)
  spi: Convert CONFIG_DM_SPI* to CONFIG_$(SPL_TPL_)DM_SPI*

 arch/arm/Kconfig                            | 24 ++++++++++++++++++++++--
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
 include/configs/ls1021aiot.h                |  6 ------
 include/configs/ls1021aqds.h                |  8 --------
 include/configs/ls1021atwr.h                |  5 -----
 include/configs/ls1043a_common.h            |  2 --
 include/spi.h                               |  8 ++++----
 include/spi_flash.h                         |  2 +-
 test/dm/spi.c                               |  2 +-
 46 files changed, 134 insertions(+), 63 deletions(-)

-- 
2.11.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
