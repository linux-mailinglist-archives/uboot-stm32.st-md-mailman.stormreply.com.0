Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A86F2DF0B8
	for <lists+uboot-stm32@lfdr.de>; Sat, 19 Dec 2020 18:40:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9A59C5717E;
	Sat, 19 Dec 2020 17:40:31 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC1EEC3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Dec 2020 17:40:30 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id q1so5201962ilt.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Dec 2020 09:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=294cyEpzP4mXuF4fJ43ydwQSI0wo/65cVurUk9p+NU8=;
 b=VXN7aWFtXDjImtDx75Uh7CdvHiLh6FcnmAGx6oJL79GVj0VlquLDXtKmtv9zTD7jIK
 doT2/Pa43NLk6fJaxRWxNBw8ThHEEO/jgRSto7v0iMNthWar6Exc9UrSwzlRsfGKFmHJ
 otQ1GmiFgdA8m9yCs7jV+9j+FhfWQB8/yFtEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=294cyEpzP4mXuF4fJ43ydwQSI0wo/65cVurUk9p+NU8=;
 b=KHMRTW38JvZSqdiEGKdaYmajwjnTS3UMVOZXojzcGp7inhcidfAK3k5WlesgR/N5J/
 PwwRNa7690M5SXi5ILCLktsDB+ADsMbzQrCLiH6VDLPeHjt5cx/aJg4tewqGwfRCdiVt
 /vYVyvU5pzkaPMkyqqWT4n9ttvvV73tFnZ8VR9pfO0Zx0dTh9qDr31qJf+3p76WA99mr
 kIUSbc93y89fQSP4K4tdj/5OsD3feyrPNsr/n/cP/hKqH31J8v6zJpKnghWvAY4inMxE
 w0oOpnXBOD7i7NrsYA/tsXl1vOA73Ggmcm4yBHIDjJKGeMLAvOzvLYdR6G5O6PQVa8lA
 Qx+w==
X-Gm-Message-State: AOAM531EW3aluLIpTX50WOCyDHojtf1Wx8y1CfIh3hJy6le4JJSjH0ds
 9y6R9m9a0BrpLkZTPrmH8qM7MQ==
X-Google-Smtp-Source: ABdhPJz/Qo5epC3mKCtWOpwANHfFHU+CUzJAlmJ6woLsaQ0gG6zyWThs9l7ng+sbX6cPyUuT095GbA==
X-Received: by 2002:a92:444c:: with SMTP id a12mr10257878ilm.53.1608399629592; 
 Sat, 19 Dec 2020 09:40:29 -0800 (PST)
Received: from localhost.localdomain (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id n10sm9781962ila.69.2020.12.19.09.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 09:40:28 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat, 19 Dec 2020 10:39:52 -0700
Message-Id: <20201219174018.1114146-1-sjg@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
MIME-Version: 1.0
Cc: uboot-snps-arc@synopsys.com, Baruch Siach <baruch@tkos.co.il>,
 Vignesh R <vigneshr@ti.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@xilinx.com>,
 Stefan Bosch <stefan_b@posteo.net>, Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Michael Walle <michael@walle.cc>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marex@denx.de>,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Walter Lozano <walter.lozano@collabora.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Suneel Garapati <sgarapati@marvell.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Madalin Bucur <madalin.bucur@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot-amlogic@groups.io,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Heiko Schocher <hs@denx.de>,
 Jagannadha Sutradharudu Teki <jagannadh.teki@gmail.com>,
 Stefan Roese <sr@denx.de>, Ye Li <ye.li@nxp.com>,
 Bernhard Messerklinger <bernhard.messerklinger@br-automation.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Frank Wang <frank.wang@rock-chips.com>, Rick Chen <rick@andestech.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Eugeniy Paltsev <paltsev@synopsys.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 Anatolij Gustschin <agust@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 "hui.song" <hui.song_1@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Aaron Williams <awilliams@marvell.com>, Luka Kovacic <luka.kovacic@sartura.hr>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>, Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH 00/26] dm: Preparation for enhanced
	of-platdata (part C)
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

At present various driver model data structures are accessed outside the
core driver mode code. This makes it harder to adjust how certain values
are stored, which is needed for of-platdata.

This series updates several a few more fields so that they are only
accessed via functions.

This series also includes some changes to sandbox and x86 drivers to get
them ready for the new of-platdata.

It is available at u-boot-dm/prepc-working


Simon Glass (26):
  sandbox: serial: Move priv into a header file
  sandbox: i2c: Move priv into a header file
  sandbox: Add a compatible string for spltest
  sandbox: Update dts files to reduce SPL size
  x86: apl: Move priv/plat structs to headers
  x86: Move priv/plat structs for intel_common to headers
  x86: spl: Move priv/plat structs to headers
  spi: Tidy up get/set of device node
  spi: Tweak a few strange SPI NOR features for of-platdata
  x86: apl: Use struct spi_nor instead of struct spi_flash
  dm: core: Move priv/plat structs for simple_bus to headers
  x86: sysreset: Move priv/plat structs to headers
  x86: apl: Adjust how the UART gets its platform data
  x86: coral: Remove unwanted nodes from SPL/TPL
  x86: Drop rtc from SPL
  dm: core: Split out alloc code into a new function
  dm: core: Rename sqq to seq_
  dm: core: Access device flags through functions
  dm: core: Rename device flags to indicate it is private
  dm: core: Rename dev_has_of_node() to dev_has_ofnode()
  dm: core: Use dev_has_ofnode() instead of dev_of_valid()
  dm: core: Access device ofnode through functions
  dm: core: Rename device node to indicate it is private
  dm: core: Split out scanning code to dm_scan()
  dm: core: Allow the uclass list to move
  dm: core: Add logging when lists_bind_fdt() fails

 arch/arm/mach-stm32mp/pwr_regulator.c         |   2 +-
 arch/sandbox/dts/sandbox.dts                  |   4 +-
 arch/sandbox/dts/sandbox.dtsi                 |  11 +-
 arch/sandbox/include/asm/i2c.h                |  14 ++
 arch/sandbox/include/asm/serial.h             |  30 ++++
 arch/x86/cpu/apollolake/hostbridge.c          |  20 +--
 arch/x86/cpu/apollolake/pmc.c                 |   8 +-
 arch/x86/cpu/apollolake/spl.c                 |   2 +-
 arch/x86/cpu/apollolake/uart.c                |  43 +++---
 arch/x86/cpu/intel_common/itss.c              |  19 ---
 arch/x86/cpu/intel_common/p2sb.c              |   9 +-
 arch/x86/dts/chromebook_coral.dts             |  17 ++-
 arch/x86/dts/rtc.dtsi                         |   2 +-
 arch/x86/include/asm/arch-apollolake/gpio.h   |  18 +++
 .../include/asm/arch-apollolake/hostbridge.h  |  28 ++++
 arch/x86/include/asm/arch-apollolake/pmc.h    |  16 +++
 arch/x86/include/asm/arch-apollolake/uart.h   |  19 ++-
 arch/x86/include/asm/itss.h                   |  21 +++
 arch/x86/include/asm/p2sb.h                   |  18 +++
 arch/x86/include/asm/sysreset.h               |  18 +++
 board/synopsys/hsdk/clk-lib.c                 |   2 +-
 cmd/remoteproc.c                              |   2 +-
 drivers/ata/mtk_ahci.c                        |   3 +-
 drivers/clk/clk-uclass.c                      |   2 +-
 drivers/clk/clk.c                             |   2 +-
 drivers/clk/meson/axg.c                       |   2 +-
 drivers/clk/meson/g12a.c                      |   2 +-
 drivers/clk/meson/gxbb.c                      |   2 +-
 drivers/core/device-remove.c                  |  18 +--
 drivers/core/device.c                         | 135 ++++++++++--------
 drivers/core/devres.c                         |   4 +-
 drivers/core/dump.c                           |   6 +-
 drivers/core/lists.c                          |   2 +-
 drivers/core/root.c                           |  58 +++++---
 drivers/core/simple-bus.c                     |   7 +-
 drivers/core/uclass.c                         |  12 +-
 drivers/gpio/mpc8xxx_gpio.c                   |   4 +-
 drivers/gpio/octeon_gpio.c                    |   2 +-
 drivers/gpio/sandbox.c                        |   2 +-
 drivers/i2c/designware_i2c_pci.c              |   4 +-
 drivers/i2c/i2c-uclass.c                      |   2 +-
 drivers/i2c/sandbox_i2c.c                     |   5 +-
 drivers/misc/spltest_sandbox.c                |   6 +
 drivers/misc/swap_case.c                      |   2 +-
 drivers/mmc/octeontx_hsmmc.c                  |  25 ++--
 drivers/mmc/pci_mmc.c                         |   2 +-
 drivers/mtd/nand/raw/octeontx_nand.c          |   4 +-
 drivers/mtd/nand/spi/core.c                   |   2 +-
 drivers/mtd/spi/sf-uclass.c                   |   2 +-
 drivers/mtd/spi/sf_probe.c                    |   2 +-
 drivers/net/fm/eth.c                          |   4 +-
 drivers/net/fsl_enetc.c                       |   8 +-
 drivers/net/fsl_enetc_mdio.c                  |   2 +-
 drivers/net/mdio-ipq4019.c                    |   4 +-
 drivers/net/mdio_mux_i2creg.c                 |   2 +-
 drivers/net/mvmdio.c                          |   4 +-
 drivers/net/octeontx/smi.c                    |   2 +-
 drivers/net/tsec.c                            |   3 +-
 drivers/pci/pci-uclass.c                      |   8 +-
 drivers/phy/phy-ti-am654.c                    |   2 +-
 drivers/pinctrl/intel/pinctrl_apl.c           |  12 --
 drivers/pinctrl/pinctrl-uclass.c              |   4 +-
 drivers/power/domain/meson-ee-pwrc.c          |   4 +-
 drivers/power/domain/meson-gx-pwrc-vpu.c      |   4 +-
 drivers/power/regulator/pbias_regulator.c     |   3 +-
 drivers/pwm/pwm-meson.c                       |   9 +-
 drivers/remoteproc/rproc-uclass.c             |   2 +-
 drivers/reset/reset-socfpga.c                 |   2 +-
 drivers/serial/sandbox.c                      |  16 +--
 drivers/serial/serial-uclass.c                |   2 +-
 drivers/spi/fsl_dspi.c                        |   6 +-
 drivers/spi/ich.c                             |  11 --
 drivers/spi/ich.h                             |  11 ++
 drivers/spi/spi-uclass.c                      |   2 +-
 drivers/sysreset/sysreset_sandbox.c           |   2 +-
 drivers/sysreset/sysreset_x86.c               |   5 +-
 drivers/tee/optee/core.c                      |   2 +-
 drivers/timer/timer-uclass.c                  |   2 +-
 drivers/usb/cdns3/core.c                      |   4 +-
 drivers/usb/dwc3/core.c                       |   2 +-
 drivers/usb/dwc3/dwc3-generic.c               |   6 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c            |   2 +-
 drivers/usb/dwc3/dwc3-meson-gxl.c             |   2 +-
 drivers/usb/gadget/dwc2_udc_otg.c             |   4 +-
 drivers/usb/host/dwc3-octeon-glue.c           |   2 +-
 drivers/usb/host/dwc3-sti-glue.c              |   5 +-
 drivers/usb/host/ehci-mx6.c                   |   2 +-
 drivers/usb/host/usb-uclass.c                 |   4 +-
 drivers/usb/host/xhci-dwc3.c                  |   2 +-
 drivers/usb/mtu3/mtu3_core.c                  |   2 +-
 drivers/usb/mtu3/mtu3_plat.c                  |   4 +-
 drivers/usb/musb-new/ti-musb.c                |   2 +-
 drivers/video/nexell_display.c                |   2 +-
 drivers/video/rockchip/rk_mipi.c              |   2 +-
 include/asm-generic/global_data.h             |   8 +-
 include/dm/device-internal.h                  |   1 +
 include/dm/device.h                           |  74 ++++++++--
 include/dm/read.h                             |  18 +--
 include/dm/simple_bus.h                       |  15 ++
 include/linux/mtd/mtd.h                       |   9 +-
 include/linux/mtd/nand.h                      |  14 ++
 include/linux/mtd/spi-nor.h                   |   6 +-
 include/linux/mtd/spinand.h                   |  15 ++
 include/virtio.h                              |   2 +-
 net/mdio-mux-uclass.c                         |   2 +-
 net/mdio-uclass.c                             |   8 +-
 test/dm/bus.c                                 |  10 +-
 test/dm/core.c                                |  26 ++--
 test/dm/cpu.c                                 |   2 +-
 test/dm/pci.c                                 |   6 +-
 test/dm/test-fdt.c                            |  20 +--
 test/dm/virtio.c                              |   2 +-
 112 files changed, 655 insertions(+), 410 deletions(-)
 create mode 100644 arch/sandbox/include/asm/i2c.h
 create mode 100644 arch/sandbox/include/asm/serial.h
 create mode 100644 arch/x86/include/asm/arch-apollolake/hostbridge.h
 create mode 100644 arch/x86/include/asm/arch-apollolake/pmc.h
 create mode 100644 arch/x86/include/asm/p2sb.h
 create mode 100644 arch/x86/include/asm/sysreset.h
 create mode 100644 include/dm/simple_bus.h

-- 
2.29.2.684.gfbc64c5ab5-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
