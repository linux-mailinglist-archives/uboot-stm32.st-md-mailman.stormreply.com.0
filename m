Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C902252C3
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Jul 2020 18:16:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66FC7C36B29
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Jul 2020 16:16:20 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A42BC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 16:16:18 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id l1so15156537ioh.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 09:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EhXtwI6IQxijnNBM0nYQzf7RzINqD34B7krFY1Cazx4=;
 b=YfoZdcPyW/PoClANsOZPdya+r88Cpf0Sa9dsLQA29Q7+p7OCUF7Q4hnZlgVd5smHBs
 t5pXycNhn2vhDj8tN738WAaDZhTBO3J1JVZvzO1+Ay9Ih+eOHh+FTD5aCPLVDYt2zr89
 eboFmfOlX4yagRYIXsF5LmcPbeeXCyTM/2+Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EhXtwI6IQxijnNBM0nYQzf7RzINqD34B7krFY1Cazx4=;
 b=cu4Qr7TRstkpeC4FP0+JKomkyfHicm8oiYZ0/ekSR3yYjgWm9IUKNNIxHt+zN5OwB2
 NtzH4CEGmGgQo6evt2m8Hu0QL7I+1oWHdJghH5ia9NyfumugS00BhvqRp6ci6QCfAMh5
 zqjmGO8g1uWzmZ8HWSIKeP1NwYtfdBv6LfkTtBhu+SETSDbxoy9dgXv1niFgN1J88V4L
 T49NrQcLp11C1rljBoOWjjtgSZ21puvEqleCWnaJNTk0OG1p6BcyYGbcni3omplbqngi
 AkUUHzCC6Xn1H083QcBuEynCXB9UouWhntMEzeRqTg1GPJb5GJ5qf5c3vm7AqOYlowHC
 cB0g==
X-Gm-Message-State: AOAM531dhQ/6GPz/LugntZYZjoe/nAi0jYnIpPK4goEOK756QhVhzrzx
 ReEsP81yLgaisWIHRDRdoPpoJw==
X-Google-Smtp-Source: ABdhPJzp1d83klblzy8THeLl5JVj/r4XSxFf6qtO4Jq/t6/crehwG1fOnxX85EoL+5MqHoOxS02apg==
X-Received: by 2002:a6b:640e:: with SMTP id t14mr18722055iog.39.1595175376855; 
 Sun, 19 Jul 2020 09:16:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-14-175-90.hsd1.co.comcast.net.
 [73.14.175.90])
 by smtp.gmail.com with ESMTPSA id c3sm7415632ilj.31.2020.07.19.09.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 09:16:16 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 19 Jul 2020 10:15:30 -0600
Message-Id: <20200719161601.495421-1-sjg@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
Cc: Joel Johnson <mrjoel@lixil.net>, Baruch Siach <baruch@tkos.co.il>,
 Christophe Kerello <christophe.kerello@st.com>, Vignesh R <vigneshr@ti.com>,
 Reuben Dowle <reubendowle0@gmail.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Walter Lozano <walter.lozano@collabora.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Pankaj Bansal <pankaj.bansal@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Mark Kettenis <kettenis@openbsd.org>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Wasim Khan <wasim.khan@nxp.com>,
 Stefan Roese <sr@denx.de>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Harald Seiler <hws@denx.de>,
 Jagannadha Sutradharudu Teki <jagannadh.teki@gmail.com>,
 Dario Binacchi <dariobin@libero.it>, Michal Suchanek <msuchanek@suse.de>,
 Lukasz Majewski <l.majewski@samsung.com>, Ye Li <ye.li@nxp.com>,
 Mike Frysinger <vapier@gentoo.org>, Stefano Babic <sbabic@denx.de>,
 James Byrne <james.byrne@origamienergy.com>, Alexander Graf <agraf@csgraf.de>,
 Dan Murphy <dmurphy@ti.com>, Sean Anderson <seanga2@gmail.com>,
 Adam Ford <aford173@gmail.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Anatolij Gustschin <agust@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Alex Marginean <alexandru.marginean@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Florinel Iordache <florinel.iordache@nxp.com>, Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [Uboot-stm32] [PATCH 00/31] dm: Avoid including dm.h in header files
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

At present a small number of header files include the dm.h header file.
The intent with driver model is for C files that use it to define dm.h
themselves. This helps indicate that driver model is supported and also
reduces the amount of code pointlessly included and relying on header
guards. Ultimately (combined with the reduction in size of common.h)
this should speed up U-Boot compilation.

This series removes all uses of dm.h in header files and adds a warning
to avert more such activity.


Simon Glass (31):
  spi: Allow separate control of SPI_FLASH_TINY for SPL/TPL
  mtd: spi-nor: Tidy up error handling / debug code
  wdt: Drop dm.h header file
  mtd: spi-mem: Drop dm.h header file
  mtd: spi: Drop SPI_XFER_MMAP*
  dm: core: Drop dm.h header file from dm-demo.h
  dm: core: Drop header files from dm/test.h
  fs: fs-loader: Drop dm.h header file
  net: Drop dm.h header file from phy.h
  sf: Drop dm.h header file from spi_flash.h
  thermal: Drop dm.h header file
  w1: Drop dm.h header file
  efi: Tidy up header includes
  power: Tidy up inclusion of regulator_common.h
  mmc: Drop duplicate dm.h inclusion
  spi: Drop duplicate dm.h inclusion
  ti: am654: Drop duplicate dm.h inclusion
  liebherr: Drop duplicate dm.h inclusion
  pci: Drop dm.h inclusion from header file
  mediatek: Drop dm.h header file
  mscc: Drop dm.h header file
  adc: Drop dm.h header file
  nand: Drop dm.h header file
  ufs: Drop dm.h header file
  usb: Drop dm.h header file
  clk: Drop dm.h header file in clk-provider.h
  net: Drop dm.h header file in eth_phy.h
  net: Drop duplicate include of dm.h in pcnet.c
  dm: core: Guard against including dm.h in header files
  patman: Fix up the test comments
  checkpatch: Don't allow common.h and dm.h in headers

 arch/arm/include/asm/arch-mediatek/reset.h    |  2 +-
 arch/arm/mach-imx/cpu.c                       |  1 +
 arch/arm/mach-k3/sysfw-loader.c               |  1 +
 .../cmd_stm32prog/stm32prog_serial.c          |  1 +
 arch/mips/mach-mscc/include/mach/jr2/jr2.h    |  3 --
 .../mips/mach-mscc/include/mach/luton/luton.h |  3 --
 .../mach-mscc/include/mach/ocelot/ocelot.h    |  3 --
 .../mach-mscc/include/mach/serval/serval.h    |  3 --
 .../mach-mscc/include/mach/servalt/servalt.h  |  3 --
 arch/x86/cpu/ivybridge/sdram.c                |  1 +
 board/atmel/common/board.c                    |  1 +
 board/liebherr/display5/display5.c            |  1 -
 board/mscc/servalt/servalt.c                  |  2 +
 board/st/common/stm32mp_dfu.c                 |  1 +
 cmd/demo.c                                    |  1 +
 cmd/mdio.c                                    |  1 +
 cmd/mii.c                                     |  1 +
 cmd/w1.c                                      |  1 +
 common/spl/Kconfig                            | 10 +++++
 drivers/adc/stm32-adc-core.c                  |  1 +
 drivers/adc/stm32-adc-core.h                  |  4 +-
 drivers/adc/stm32-adc.c                       |  1 +
 drivers/clk/clk-uclass.c                      |  5 +++
 drivers/clk/kendryte/bypass.c                 |  7 ++-
 drivers/clk/kendryte/pll.c                    | 10 +++--
 drivers/fpga/socfpga_arria10.c                |  1 +
 drivers/mmc/sdhci.c                           |  1 -
 .../mtd/nand/raw/brcmnand/brcmnand_compat.c   |  1 +
 .../mtd/nand/raw/brcmnand/brcmnand_compat.h   |  4 +-
 drivers/mtd/spi/Makefile                      |  2 +-
 drivers/mtd/spi/sf_probe.c                    |  2 +-
 drivers/mtd/spi/spi-nor-core.c                |  2 +-
 drivers/mtd/spi/spi-nor-tiny.c                |  4 +-
 drivers/net/pcnet.c                           |  1 -
 drivers/pci/pcie_layerscape.h                 |  1 -
 drivers/pci/pcie_layerscape_fixup.c           |  1 +
 drivers/pci/pcie_layerscape_gen4.h            |  1 -
 drivers/pci/pcie_layerscape_gen4_fixup.c      |  1 +
 drivers/power/regulator/fixed.c               |  3 +-
 drivers/power/regulator/gpio-regulator.c      |  3 +-
 drivers/power/regulator/regulator_common.c    |  4 +-
 drivers/power/regulator/regulator_common.h    |  2 -
 drivers/ram/k3-am654-ddrss.c                  |  1 -
 drivers/spi/mscc_bb_spi.c                     |  1 -
 drivers/spi/spi-mem.c                         |  7 ++-
 drivers/spi/spi-sifive.c                      |  1 +
 drivers/spi/stm32_qspi.c                      |  2 +
 drivers/ufs/cdns-platform.c                   |  1 +
 drivers/ufs/ufs.c                             |  3 +-
 drivers/ufs/ufs.h                             |  5 +--
 drivers/usb/musb-new/musb_uboot.c             | 37 +++++++++++++++
 drivers/usb/musb-new/pic32.c                  |  1 +
 drivers/usb/musb-new/usb-compat.h             | 45 ++++---------------
 include/dm-demo.h                             |  2 -
 include/dm.h                                  |  4 ++
 include/dm/read.h                             |  1 +
 include/dm/test.h                             |  3 --
 include/efi_driver.h                          |  2 -
 include/eth_phy.h                             |  3 +-
 include/fs_loader.h                           |  2 +-
 include/kendryte/bypass.h                     |  2 +-
 include/linux/clk-provider.h                  |  8 ++--
 include/phy.h                                 |  9 ++--
 include/phy_interface.h                       |  2 +
 include/spi-mem.h                             |  5 +--
 include/spi.h                                 |  2 -
 include/spi_flash.h                           |  3 +-
 include/test/ut.h                             |  1 +
 include/thermal.h                             |  2 +-
 include/w1.h                                  |  2 +-
 include/wdt.h                                 |  4 +-
 lib/efi_driver/efi_block_device.c             |  1 +
 lib/efi_driver/efi_uclass.c                   |  2 +
 net/eth_legacy.c                              |  1 +
 scripts/checkpatch.pl                         | 10 ++++-
 test/dm/adc.c                                 |  1 +
 test/dm/audio.c                               |  1 +
 test/dm/axi.c                                 |  3 +-
 test/dm/blk.c                                 |  1 +
 test/dm/board.c                               |  1 +
 test/dm/bootcount.c                           |  1 +
 test/dm/bus.c                                 |  1 +
 test/dm/clk.c                                 |  1 +
 test/dm/clk_ccf.c                             |  1 +
 test/dm/core.c                                |  1 +
 test/dm/cpu.c                                 |  1 +
 test/dm/dma.c                                 |  1 +
 test/dm/dsi_host.c                            |  1 +
 test/dm/eth.c                                 |  3 +-
 test/dm/firmware.c                            |  1 +
 test/dm/gpio.c                                |  3 +-
 test/dm/hwspinlock.c                          |  1 +
 test/dm/i2c.c                                 |  1 +
 test/dm/i2s.c                                 |  3 +-
 test/dm/led.c                                 |  1 +
 test/dm/mailbox.c                             |  1 +
 test/dm/mdio.c                                |  5 ++-
 test/dm/mdio_mux.c                            |  5 ++-
 test/dm/misc.c                                |  1 +
 test/dm/mmc.c                                 |  1 +
 test/dm/nop.c                                 |  1 +
 test/dm/ofnode.c                              |  1 +
 test/dm/osd.c                                 |  5 ++-
 test/dm/panel.c                               |  3 +-
 test/dm/pch.c                                 |  1 +
 test/dm/pci.c                                 |  1 +
 test/dm/pci_ep.c                              |  5 ++-
 test/dm/phy.c                                 |  1 +
 test/dm/pmic.c                                |  5 ++-
 test/dm/power-domain.c                        |  1 +
 test/dm/pwm.c                                 |  1 +
 test/dm/ram.c                                 |  1 +
 test/dm/regmap.c                              |  1 +
 test/dm/regulator.c                           |  1 +
 test/dm/remoteproc.c                          |  2 +
 test/dm/reset.c                               |  1 +
 test/dm/rtc.c                                 |  1 +
 test/dm/serial.c                              |  1 +
 test/dm/sf.c                                  |  1 +
 test/dm/smem.c                                |  1 +
 test/dm/sound.c                               |  1 +
 test/dm/spi.c                                 |  1 +
 test/dm/spmi.c                                |  1 +
 test/dm/syscon.c                              |  1 +
 test/dm/sysreset.c                            |  1 +
 test/dm/tee.c                                 |  1 +
 test/dm/test-driver.c                         |  3 +-
 test/dm/test-fdt.c                            |  1 +
 test/dm/test-main.c                           |  2 +
 test/dm/test-uclass.c                         |  1 +
 test/dm/timer.c                               |  1 +
 test/dm/usb.c                                 |  1 +
 test/dm/video.c                               |  1 +
 test/dm/virtio.c                              |  3 +-
 test/dm/wdt.c                                 |  1 +
 test/lib/lmb.c                                |  2 +
 tools/patman/test_checkpatch.py               | 17 ++++---
 137 files changed, 254 insertions(+), 138 deletions(-)

-- 
2.28.0.rc0.105.gf9edc3c819-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
