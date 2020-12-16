Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F09392DC309
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Dec 2020 16:25:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83D0DC36B36;
	Wed, 16 Dec 2020 15:25:20 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9743C36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Dec 2020 15:25:18 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id t8so24303987iov.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Dec 2020 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q5TUpY4vfcqCTZna8cq//tKPU6LakOf/+KTqi6n4XLQ=;
 b=XBzc2komtDYXzUyTPUmGej4cGCwh+tXRBdXj3eli1Sw7myhEqlICJj2SItKkYIffAt
 5M+QTLEnHv3dhs5KROjd7MvIXiMrBxsNMicQDiqgaXoAAzmOpkxxgevL9d4T0KupLYY0
 zg5mBikia9I90rczvppLOosafrkyU3GAG1Ksk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q5TUpY4vfcqCTZna8cq//tKPU6LakOf/+KTqi6n4XLQ=;
 b=o3OhKpBK8tRrvEVRnTZn1pDIjU5EjnyFv2mVZLv8YT1bwAx8FFlda0Ywnos+OazA9s
 IQAh0rSPMulOjcZmHARHuDtmyuMvZ4gSMU9ZbYVwZsH0BUAy5dXpRWbe6PXAUc3vtwRT
 QbBgQa6lNYvld1pFqhes5LwnLiWOt7p0bYx8TfzGfrQnzchSCXUL/5MdLS2MkbD8fMQG
 H4UrvpA93svl+HbDYvwetPKSeZ92RBzCLZUhyyYRiHcCi0fMnY1KvVFW016Oj+1hY4Du
 N64UBw+wQJcQTtu/3vPrf9sKV3JVkyjxpcfZf+WhClK+JT5rkMUNdPf9kdwjmXbWvetl
 VJgw==
X-Gm-Message-State: AOAM530RAWV0gg3q39nCcBstJzgeub0bBD5CyzboWmDgj2TOFclpGhL/
 KGZnTpdRXcYSdIFztomigw/cog==
X-Google-Smtp-Source: ABdhPJwLXi2hFYnrcLOBoxMhkfyEnvLG7kjaISsYTaY43LiLPHziriqweT8XaGPG/gT8ztoptjPRJw==
X-Received: by 2002:a05:6602:2d0c:: with SMTP id
 c12mr7823834iow.58.1608132317296; 
 Wed, 16 Dec 2020 07:25:17 -0800 (PST)
Received: from localhost.localdomain (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id l6sm1479077ili.78.2020.12.16.07.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:25:15 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 16 Dec 2020 08:24:48 -0700
Message-Id: <20201216152506.119900-1-sjg@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
MIME-Version: 1.0
Cc: Joel Johnson <mrjoel@lixil.net>, Baruch Siach <baruch@tkos.co.il>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Pavel Herrmann <morpheus.ibis@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@xilinx.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Peng Fan <peng.fan@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Marek Vasut <marex@denx.de>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Reuben Dowle <reubendowle0@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Suneel Garapati <sgarapati@marvell.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Aiden Park <aiden.park@intel.com>,
 Shengzhou Liu <Shengzhou.Liu@nxp.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>,
 Stefan Roese <sr@denx.de>, Dario Binacchi <dariobin@libero.it>,
 Icenowy Zheng <icenowy@aosc.io>, Biwen Li <biwen.li@nxp.com>,
 Ye Li <ye.li@nxp.com>, Martin Fuzzey <martin.fuzzey@flowbird.group>,
 Otavio Salvador <otavio@ossystems.com.br>, u-boot-amlogic@groups.io,
 Madalin Bucur <madalin.bucur@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>, Anji J <anji.jagarlmudi@nxp.com>,
 Rick Chen <rick@andestech.com>, Alexander Graf <agraf@csgraf.de>,
 Heiko Schocher <hs@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Oleksandr Zhadan and Michael Durrant <arcsupport@arcturusnetworks.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Adam Ford <aford173@gmail.com>,
 Angelo Durgehello <angelo.dureghello@timesys.com>,
 Walter Lozano <walter.lozano@collabora.com>,
 Robert Beckett <bob.beckett@collabora.com>, Michal Simek <monstr@monstr.eu>,
 Harald Seiler <hws@denx.de>, Philippe Reynes <philippe.reynes@softathome.com>,
 Walter Schweizer <swwa@users.sourceforge.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
 Patrice Chotard <patrice.chotard@st.com>, Pratyush Yadav <p.yadav@ti.com>,
 Thor Thayer <thor.thayer@linux.intel.com>, Michael Walle <michael@walle.cc>,
 Faiz Abbas <faiz_abbas@ti.com>, Mario Six <mario.six@gdsys.cc>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Pragnesh Patel <Pragnesh.patel@sifive.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: [Uboot-stm32] [PATCH 00/18] dm: Preparation for enhanced of-platdata
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

This series includes various patches in service of some upcoming
of-platdata enhancements. The new features will support declaring devices
and uclasses at build time (automatically, using dtoc) so as to further
reduce the code-size overhead of driver model.

The main changes in this series are:
- Support for separate SPL and TPL devicetree files, so dtoc can produce
   of-platdata for each individually
- Rename of NS16550 to ns16550 so it follows the identifier rules
- Report TPL code/data sizes in buildman, to support measuring size
- Update U-Boot to access device/uclass-private data via functions (to
     allow the storage mechanism to change later)
- Drop bd_info from the image to save space


Simon Glass (18):
  Makefile: Build a separate .dtb for TPL
  Makefile: Build SPL dtbs in the spl/ directory
  Makefile: Tidy up SPL dtb production
  Makefile: Use common args for dtoc
  buildman: Report sizes for TPL also
  serial: Update NS16550_t and struct NS16550
  serial: Rename ns16550 functions to lower case
  sandbox: Drop unnecessary test node
  spl: Drop bd_info in the data section
  dm: core: Support dm_dump_all() in SPL
  dm: core: Use 'uclass_driver' for the uclass linker_list
  dm: core: Only include simple-bus devicetree id when needed
  x86: apl: Drop support for !OF_PLATDATA_PARENT
  dm: core: Add function to access uclass priv
  dm: core: Add functions to set priv/plat
  dm: Use access methods for dev/uclass private data
  dm: core: Use access methods for dev/uclass private data
  dm: core: Rename the priv/plat members

 arch/arm/cpu/armv7/ls102xa/fdt.c           |   4 +
 arch/arm/cpu/armv8/fsl-layerscape/spl.c    |   5 +-
 arch/arm/mach-davinci/da850_lowlevel.c     |   4 +-
 arch/arm/mach-davinci/spl.c                |   4 +-
 arch/arm/mach-keystone/init.c              |   2 +-
 arch/arm/mach-stm32mp/pwr_regulator.c      |   3 +-
 arch/sandbox/dts/sandbox.dtsi              |   5 -
 arch/x86/cpu/apollolake/Kconfig            |   1 +
 arch/x86/cpu/apollolake/spl.c              |  28 ------
 arch/x86/cpu/apollolake/uart.c             |   5 +-
 arch/x86/cpu/slimbootloader/serial.c       |   4 +-
 board/Arcturus/ucp1020/spl.c               |   2 +-
 board/Arcturus/ucp1020/spl_minimal.c       |   6 +-
 board/Synology/ds109/ds109.c               |   9 +-
 board/freescale/mpc8313erdb/mpc8313erdb.c  |   6 +-
 board/freescale/mpc8315erdb/mpc8315erdb.c  |   6 +-
 board/freescale/p1010rdb/spl.c             |   2 +-
 board/freescale/p1010rdb/spl_minimal.c     |   8 +-
 board/freescale/p1_p2_rdb_pc/spl.c         |   2 +-
 board/freescale/p1_p2_rdb_pc/spl_minimal.c |   8 +-
 board/freescale/t102xrdb/spl.c             |   2 +-
 board/freescale/t104xrdb/spl.c             |   2 +-
 board/freescale/t208xqds/spl.c             |   2 +-
 board/freescale/t208xrdb/spl.c             |   2 +-
 board/freescale/t4rdb/spl.c                |   2 +-
 common/spl/Kconfig                         |   9 ++
 common/spl/spl.c                           |  20 ++--
 drivers/clk/clk.c                          |   2 +-
 drivers/clk/clk_fixed_rate.c               |   4 +-
 drivers/clk/rockchip/clk_px30.c            |   3 +-
 drivers/clk/rockchip/clk_rk3036.c          |   3 +-
 drivers/clk/rockchip/clk_rk3128.c          |   3 +-
 drivers/clk/rockchip/clk_rk3188.c          |   2 +-
 drivers/clk/rockchip/clk_rk322x.c          |   3 +-
 drivers/clk/rockchip/clk_rk3288.c          |   2 +-
 drivers/clk/rockchip/clk_rk3308.c          |   3 +-
 drivers/clk/rockchip/clk_rk3328.c          |   3 +-
 drivers/clk/rockchip/clk_rk3368.c          |   3 +-
 drivers/clk/rockchip/clk_rk3399.c          |   3 +-
 drivers/clk/rockchip/clk_rv1108.c          |   3 +-
 drivers/core/device-remove.c               |  24 ++---
 drivers/core/device.c                      | 103 ++++++++++++++-------
 drivers/core/dump.c                        |   6 +-
 drivers/core/lists.c                       |   4 +-
 drivers/core/root.c                        |   4 +-
 drivers/core/simple-bus.c                  |   4 +-
 drivers/core/uclass.c                      |  23 ++++-
 drivers/ddr/altera/sdram_agilex.c          |   2 +-
 drivers/ddr/altera/sdram_gen5.c            |   4 +-
 drivers/ddr/altera/sdram_s10.c             |   2 +-
 drivers/ddr/altera/sdram_soc64.c           |   2 +-
 drivers/gpio/dwapb_gpio.c                  |   2 +-
 drivers/gpio/gpio-uclass.c                 |   2 +-
 drivers/gpio/hi6220_gpio.c                 |   2 +-
 drivers/gpio/imx_rgpio2p.c                 |   5 +-
 drivers/gpio/lpc32xx_gpio.c                |   2 +-
 drivers/gpio/mt7621_gpio.c                 |   2 +-
 drivers/gpio/mxs_gpio.c                    |   2 +-
 drivers/gpio/omap_gpio.c                   |   3 +-
 drivers/gpio/s5p_gpio.c                    |   6 +-
 drivers/gpio/sandbox.c                     |   6 +-
 drivers/gpio/sunxi_gpio.c                  |   2 +-
 drivers/gpio/tegra186_gpio.c               |   6 +-
 drivers/gpio/tegra_gpio.c                  |   6 +-
 drivers/i2c/i2c-uclass.c                   |   4 +-
 drivers/misc/altera_sysid.c                |   2 +-
 drivers/misc/cros_ec_sandbox.c             |   4 +-
 drivers/misc/fs_loader.c                   |   6 +-
 drivers/misc/p2sb-uclass.c                 |  15 ---
 drivers/misc/vexpress_config.c             |   2 +-
 drivers/mmc/arm_pl180_mmci.c               |   6 +-
 drivers/mmc/mxsmmc.c                       |   2 +-
 drivers/mmc/octeontx_hsmmc.c               |  17 +++-
 drivers/mux/mmio.c                         |   3 +-
 drivers/net/eth-phy-uclass.c               |   4 +-
 drivers/net/fm/eth.c                       |  22 ++++-
 drivers/net/fsl_mcdmafec.c                 |  10 +-
 drivers/net/mcffec.c                       |  12 +--
 drivers/net/mcfmii.c                       |   8 ++
 drivers/net/pfe_eth/pfe_eth.c              |   2 +-
 drivers/net/sunxi_emac.c                   |   2 +-
 drivers/net/tsec.c                         |  46 ++++++---
 drivers/net/xilinx_emaclite.c              |   2 +-
 drivers/pci/pci-emul-uclass.c              |   4 +-
 drivers/pci/pci-uclass.c                   |   8 +-
 drivers/pinctrl/pinctrl-qe-io.c            |   4 +-
 drivers/pinctrl/pinctrl-single.c           |   6 +-
 drivers/power/regulator/da9063.c           |  24 ++---
 drivers/power/regulator/pbias_regulator.c  |   3 +-
 drivers/remoteproc/rproc-uclass.c          |   4 +-
 drivers/reset/reset-mediatek.c             |   3 +-
 drivers/reset/reset-rockchip.c             |   3 +-
 drivers/reset/reset-sifive.c               |   3 +-
 drivers/reset/reset-sunxi.c                |   3 +-
 drivers/serial/altera_jtag_uart.c          |   8 +-
 drivers/serial/altera_uart.c               |   8 +-
 drivers/serial/atmel_usart.c               |   2 +-
 drivers/serial/ns16550.c                   |  62 ++++++-------
 drivers/serial/sandbox.c                   |   6 +-
 drivers/serial/serial_arc.c                |   8 +-
 drivers/serial/serial_coreboot.c           |   2 +-
 drivers/serial/serial_intel_mid.c          |   2 +-
 drivers/serial/serial_linflexuart.c        |   2 +-
 drivers/serial/serial_lpuart.c             |  10 +-
 drivers/serial/serial_mcf.c                |  10 +-
 drivers/serial/serial_meson.c              |  12 +--
 drivers/serial/serial_mxc.c                |  12 +--
 drivers/serial/serial_ns16550.c            |  26 +++---
 drivers/serial/serial_omap.c               |   8 +-
 drivers/serial/serial_pxa.c                |  10 +-
 drivers/serial/serial_rockchip.c           |   7 +-
 drivers/serial/serial_s5p.c                |  12 +--
 drivers/spi/cadence_qspi.c                 |  12 +--
 drivers/spi/cf_spi.c                       |   2 +-
 drivers/spi/davinci_spi.c                  |   4 +-
 drivers/spi/designware_spi.c               |   4 +-
 drivers/spi/exynos_spi.c                   |   4 +-
 drivers/spi/fsl_dspi.c                     |   4 +-
 drivers/spi/fsl_espi.c                     |   2 +-
 drivers/spi/fsl_qspi.c                     |   2 +-
 drivers/spi/mxs_spi.c                      |   2 +-
 drivers/spi/pl022_spi.c                    |   2 +-
 drivers/spi/rk_spi.c                       |   6 +-
 drivers/spi/soft_spi.c                     |   4 +-
 drivers/spi/tegra114_spi.c                 |   4 +-
 drivers/spi/tegra20_sflash.c               |   4 +-
 drivers/spi/tegra20_slink.c                |   4 +-
 drivers/spi/tegra210_qspi.c                |   4 +-
 drivers/spi/uniphier_spi.c                 |   8 +-
 drivers/spi/zynq_qspi.c                    |   4 +-
 drivers/spi/zynq_spi.c                     |   8 +-
 drivers/spi/zynqmp_gqspi.c                 |   6 +-
 drivers/timer/ag101p_timer.c               |   4 +-
 drivers/timer/altera_timer.c               |   4 +-
 drivers/timer/andes_plmt_timer.c           |   7 +-
 drivers/timer/mpc83xx_timer.c              |   2 +-
 drivers/timer/sifive_clint_timer.c         |   7 +-
 drivers/timer/timer-uclass.c               |   2 +-
 drivers/usb/gadget/ether.c                 |  16 +++-
 drivers/usb/host/usb-uclass.c              |   6 +-
 drivers/video/video-uclass.c               |   2 +-
 dts/Makefile                               |  14 ++-
 include/dm/device-internal.h               |  84 +++++++++++++++++
 include/dm/device.h                        |  29 +++---
 include/dm/uclass-internal.h               |  14 +++
 include/dm/uclass.h                        |  14 ++-
 include/ns16550.h                          |  21 +++--
 include/spl.h                              |  10 +-
 lib/efi/efi_stub.c                         |   2 +-
 lib/efi_loader/efi_device_path.c           |   2 +-
 net/eth-uclass.c                           |  22 ++---
 scripts/Makefile.spl                       |  18 ++--
 test/dm/core.c                             |  24 ++---
 test/dm/test-driver.c                      |   7 +-
 test/dm/test-fdt.c                         |   4 +-
 test/dm/test-uclass.c                      |   4 +-
 test/py/tests/test_ofplatdata.py           |   1 -
 tools/buildman/builderthread.py            |   2 +-
 tools/dtoc/dtoc_test_simple.dts            |   5 -
 tools/dtoc/test_dtoc.py                    |  12 ---
 160 files changed, 757 insertions(+), 527 deletions(-)

-- 
2.29.2.684.gfbc64c5ab5-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
