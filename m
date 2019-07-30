Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7948C7AF8E
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45511C35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFDAFC35E04
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGGjA012718; Tue, 30 Jul 2019 19:17:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+4G4iS4reRlRVtmK8vUMymclEGP+xT/CxEph7g3+dpM=;
 b=mu11w8q07B4Wef010QwLPYqZ85ESPvzi8LyhlD4Pfl8pOXyeEVzjI55yMt2ngP4bj1Uc
 dhd78uoo/I7Jp5b1CGEkYaTTjZO5892n9eJOCY6nBys2Mw5SqaGviXPH6eqvRnMvyEwN
 caa6B5WI3LvNt/AJnCf3mfOiIu4ca4mlBKCUYcvyM+QRlASCYiE/TJJbShqHAOd2TuhS
 vDxe9i9iaxWDdzALxBmZkZGcT+cciJqPKegg1Nwl/JeqTlbWOO2umxo5pzZ8kWlniFwi
 oyJbG1b1rDr3wKNvIYS3wQ0oGDUzduGmCebYszdSrU6AEMookufLQrew3ACFo0LxrgMr /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2ybj0x-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:00 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39CF531;
 Tue, 30 Jul 2019 17:16:59 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D858329B3;
 Tue, 30 Jul 2019 17:16:58 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:16:58 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:16:58
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:08 +0200
Message-ID: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Peng Fan <peng.fan@nxp.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liviu Dudau <Liviu.Dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>, Ryder Lee <ryder.lee@mediatek.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Patrice
 Chotard <patrice.chotard@st.com>, Mario Six <mario.six@gdsys.cc>,
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Stefan Roese <sr@denx.de>, Eugen Hristev <eugen.hristev@microchip.com>,
 Bin Meng <bmeng.cn@gmail.com>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [Uboot-stm32] [PATCH 00/48] stm32mp1 patches for v2019.10
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


Second serie of patches for stm32mp1 support in U-Boot
- sync device tree with kernel v5.3-rc2
- update configs
- update board stm32mp1
- few ram and clk driver update


Christophe Kerello (1):
  mmc: stm32_sdmmc2: reload watchdog

Patrice Chotard (2):
  pinctrl: pinctrl_stm32: cosmetic: Reorder include files
  stm32mp1: configs: Set bootdelay to 1

Patrick Delaunay (45):
  stm32mp1: cosmetic: remove comment
  pinctrl: stmfx: update pinconf settings
  ARM: dts: stm32mp1: sync device tree with v5.3-rc2
  ARM: dts: stm32mp1: DDR config v1.45
  ARM: dts: stm32mp1: Add iwdg2 support for SPL
  ARM: dts: stm32mp1: Add PSCI node access before relocation
  ARM: dts: stm32mp1: add ldtc pre-reloc proper in SOC file
  ARM: dts: stm32mp1: add key support on DK1/DK2
  ARM: dts: stm32mp1: add pull-up on serial rx of console connected to
    STLINK
  dt-bindings: clock: stm32mp1: support disabled fixed clock
  stpmic1: program pmic to keep only the debug unit on
  stm32mp1: configs: remove CONFIG_SYS_HZ
  stm32mp1: configs: activate CONFIG_SILENT_CONSOLE
  stm32mp1: configs: activate PRE_CONSOLE_BUFFER
  stm32mp1: configs: deactivate ARMV7_VIRT for basic boot
  stm32mp1: configs: select CONFIG_STM32_SERIAL
  stm32mp1: configs: Activate DISABLE_CONSOLE
  stm32mp1: configs: support MTDPARTS only if needed
  stm32mp1: configs: imply CONFIG_OF_LIBFDT_OVERLAY
  stm32mp1: configs: Deactivate SPI_FLASH_BAR
  stm32mp1: configs: add CONFIG_DM_VIDEO
  stm32mp1: configs: add BACKLIGHT_GPIO support
  stm32mp1: configs: add CONFIG_CMD_BMP
  stm32mp1: configs: add condition to activate WATCHDOG in SPL
  stm32mp1: configs: add altbootcmd
  stm32mp1: configs: add spi load support in spl
  stm32mp1: board: add environment variable for board id and board rev
  stm32mp1: board: enable v1v2_hdmi and v3v3_hdmi regulator on dk2 boot
  stm32mp1: board: support of error led on ed1/ev1 board
  stm32mp1: board: protect the led function calls
  stm32mp1: board: check the boot-source to disable bootdelay
  stm32mp1: board: Update the way vdd-supply is retrieved from DT
  stm32mp1: board: remove board_check_usb_power when ADC is not
    activated
  stm32mp1: board: cosmetic: cleanup file
  serial: stm32: add Framing error support
  serial: stm32: remove unused include
  stm32mp1: ram: cosmetic: remove unused prototype
  stm32mp1: ram: fix address issue in 2 tests
  stm32mp1: ram: update loop management in infinite test
  stm32mp1: ram: reload watchdog during ddr test
  stm32mp1: ram: add pattern parameter in infinite write test
  stm32mp1: Makefile cleanup
  stm32mp1: clk: remove debug traces
  stm32mp1: clk: use gd to store frequency information
  MAINTAINERS: update ARM STM STM32MP and STM32MP1 BOARD

 MAINTAINERS                                      |  19 +-
 arch/arm/Kconfig                                 |   1 +
 arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi |   4 +-
 arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi |   5 +-
 arch/arm/dts/stm32mp157-pinctrl.dtsi             | 234 +++++++++++++++++++----
 arch/arm/dts/stm32mp157-u-boot.dtsi              |  14 ++
 arch/arm/dts/stm32mp157a-avenger96.dts           |  44 +++--
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi         |   4 +
 arch/arm/dts/stm32mp157a-dk1.dts                 |  73 ++++++-
 arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi         |   6 +
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi         |  23 +--
 arch/arm/dts/stm32mp157c-ed1.dts                 |  23 ++-
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi         |   5 -
 arch/arm/dts/stm32mp157c-ev1.dts                 | 109 ++++++++++-
 arch/arm/dts/stm32mp157c.dtsi                    | 180 +++++++++++++++++
 arch/arm/dts/stm32mp157xaa-pinctrl.dtsi          |  90 +++++++++
 arch/arm/dts/stm32mp157xab-pinctrl.dtsi          |  62 ++++++
 arch/arm/dts/stm32mp157xac-pinctrl.dtsi          |  78 ++++++++
 arch/arm/dts/stm32mp157xad-pinctrl.dtsi          |  62 ++++++
 arch/arm/mach-stm32mp/Kconfig                    |  14 +-
 arch/arm/mach-stm32mp/Makefile                   |   3 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h       |   1 +
 board/st/stm32mp1/Kconfig                        |   4 +
 board/st/stm32mp1/MAINTAINERS                    |   5 +-
 board/st/stm32mp1/spl.c                          |  14 ++
 board/st/stm32mp1/stm32mp1.c                     | 162 ++++++++++++++--
 configs/stm32mp15_basic_defconfig                |   6 +-
 configs/stm32mp15_optee_defconfig                |   5 +-
 configs/stm32mp15_trusted_defconfig              |   5 +-
 doc/device-tree-bindings/clock/st,stm32mp1.txt   |   4 +-
 drivers/clk/clk_stm32mp1.c                       |  37 ++--
 drivers/mmc/stm32_sdmmc2.c                       |   3 +
 drivers/pinctrl/pinctrl-stmfx.c                  |  20 +-
 drivers/pinctrl/pinctrl_stm32.c                  |   4 +-
 drivers/ram/stm32mp1/stm32mp1_ddr.h              |   4 -
 drivers/ram/stm32mp1/stm32mp1_tests.c            |  97 ++++++----
 drivers/serial/serial_stm32.c                    |   5 +-
 drivers/serial/serial_stm32.h                    |   2 +
 include/configs/stm32mp1.h                       |  17 +-
 include/dm/platform_data/serial_stm32.h          |  15 --
 include/power/stpmic1.h                          |   5 +-
 41 files changed, 1250 insertions(+), 218 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp157xaa-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp157xab-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp157xac-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp157xad-pinctrl.dtsi
 delete mode 100644 include/dm/platform_data/serial_stm32.h

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
