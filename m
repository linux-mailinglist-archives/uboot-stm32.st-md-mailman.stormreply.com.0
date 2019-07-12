Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7733672F3
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 18:04:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E97F3C6DD97
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 16:04:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB22C6DD96
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 16:04:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CG1wLm005021; Fri, 12 Jul 2019 18:04:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=ABLXei8TTo50jHD1i43bVo2vezIDG7cG7ATMDLtNHe4=;
 b=C6KjiyGJLbz/+aT23+vhZ+clmsFl+r2s946lHutmMmfPrOmtZyzywcY4Pk5cJzrxkEKC
 x71TiKEoU/8HNVeoLbf21qk1EpJNfxoXSuNm1CCFnrB79+847X0jEHwLyOnGpNe1r0B5
 e/FHSB/2JKna4/19LwMdjL/sKvx1b91H82oUnuScV8Kj8ZFu0c5zzFLtpowq/1lQh7Z2
 rB95sRXshpkB1mKbu5fgMWFBuPwoX6tK+SVWlHdFHIkk0HaY4V9AyIUIYvzPQ0W8XGew
 40UJd3vfqWOEUjllqkOKxlI+M+2Y8EVG4bwsCa8V/F2tfQ1/+Jwu0Zku19wzkB2OYRRB JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjjhjb1wa-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 18:04:07 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DED538;
 Fri, 12 Jul 2019 16:04:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57F6A5130;
 Fri, 12 Jul 2019 16:04:06 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 18:04:05 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 18:04:06 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
Thread-Topic: [PULL] u-boot-stm32/master for v2019.10-rc1:
 u-boot-stm32-20190712
Thread-Index: AdU4yjkY9j3dp6dBTk2I/etsKEFclg==
Date: Fri, 12 Jul 2019 16:04:05 +0000
Message-ID: <431c6ea182f54552a77b89282cf6284b@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] u-boot-stm32/master for v2019.10-rc1:
	u-boot-stm32-20190712
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

Hi Tom

please pull the STM32 related patches for v2019.10-rc1 = u-boot-stm32-20190712

Travis CI status:
	https://travis-ci.org/patrickdelaunay/u-boot/builds/557765098
	the 4 issues are not related to the patchsets : test_ut[ut_dm_pci_ep_base]

Thanks,
Patrick


The following changes since commit 5acce685c9227b3d4b48f6fab6a33f6d74ca9c14:

  Merge branch '2019-07-11-master-imports' (2019-07-11 18:03:52 -0400)

are available in the git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20190712

for you to fetch changes up to 291f00bb3ea7e9f9acdddbe680991e76313732d6:

  board: st: add missing gpio_request() for stm32f429-discovery (2019-07-12 11:50:58 +0200)

----------------------------------------------------------------
- syscon: add support for power off
- stm32mp1: add op-tee config
- stm32mp1: add specific commands: stboard and stm32key
- add stm32 mailbox driver
- solve many stm32 warnings when building with W=1
- update stm32 gpio driver

----------------------------------------------------------------
Fabien Dessenne (4):
      mailbox: introduce stm32-ipcc driver
      MAINTAINERS: Add stm32 mailbox IPPC driver
      configs: stm32mp15: enable IPCC mailbox
      ARM: dts: stm32: Add ipcc mailbox support on stm32mp1

Patrice Chotard (6):
      MAINTAINERS: Add git custodians for ARM STM STM32MP entry
      gpio: stm32: Rename stm32f7_gpio to stm32_gpio
      pinctrl: stm32: update .bind callback
      ARM: dts: stm32: Remove useless "st, stm32-gpio" compatible string
      gpio: stm32: Remove .ofmatch callback
      board: st: add missing gpio_request() for stm32f429-discovery

Patrick Delaunay (43):
      stm32mp1: move CONFIG_ENV in Kconfig
      sysreset: syscon: add support for power off
      stm32mp1: deactivate WATCHDOG in defconfig
      stm32mp1: call regulators_enable_boot_on in board_init
      stm32mp1: syscon: remove etzpc support
      stm32mp1: syscon: remove stgen
      dt-bindings: pinctrl: stm32: add new entry for package information
      stm32mp1: export get_cpu_package function
      stm32mp1: update package information in device tree
      stm32mp1: update device tree with ETZPC status
      stm32mp1: add stboard command
      stm32mp1: key: add stm32key command
      stm32mp1: update README
      stm32mp1: cosmetic: remove unnecessary include
      stm32mp1: configs: Add CONFIG_OF_SPL_REMOVE_PROPS
      stm32mp1: add check for presence of environment in boot device
      stm32mp1: force boot_net_usb_start
      ARM: dts: stm32mp1: sync device tree with v5.2-rc4
      pmic: stpmic1: add support for SYSRESET_POWER_OFF
      stm32mp1: reorder some CONFIG in stm32mp1.h
      stm32mp1: add configuration op-tee
      stm32mp1: activate OF_BOARD_SETUP and FDT_FIXUP_PARTITIONS
      stm32mp1: Add UBIFS boot capability
      stm32mp1: add SPI flash support in SPL
      stm32mp1: Fix warnings when compiling with W=1
      board: stm32mp1: Fix warnings when compiling with W=1
      serial: stm32: Fix warnings when compiling with W=1
      mmc: stm32_sdmmc2: avoid warnings when building with W=1 option
      stm32mp1: bsec: Fix warnings when compiling with W=1
      adc: stm32-adc: Fix warnings when compiling with W=1
      adc: stm32: Fix warnings when compiling with W=1
      gpio: stm32_gpio: Fix warnings when compiling with W=1
      i2c: stm32f7_i2c: Fix warnings when compiling with W=1
      clk: clk_stm32mp1: Fix warnings when compiling with W=1
      power: regulator: stm32: Fix warnings when compiling with W=1
      misc: stm32_fuse: Fix warnings when compiling with W=1
      ram: stm32mp1_ram: Fix warnings when compiling with W=1
      pinctrl: pinctrl_stm32: Fix warnings when compiling with W=1
      power: stpmic1: Fix warnings when compiling with W=1
      mtd: rawnand: stm32_fmc2: avoid warnings when building with W=1 option
      spi: stm32_qspi: avoid warnings when building with W=1 option
      cmd: pinmux: Fix warnings when compiling with W=1
      spi: stm32: Fix warnings when compiling with W=1

 MAINTAINERS                                           |   2 +
 arch/arm/Kconfig                                      |   1 +
 arch/arm/dts/stm32429i-eval-u-boot.dtsi               |  11 ----
 arch/arm/dts/stm32f429-disco-u-boot.dtsi              |  11 ----
 arch/arm/dts/stm32f469-disco-u-boot.dtsi              |  11 ----
 arch/arm/dts/stm32f7-u-boot.dtsi                      |  17 -----
 arch/arm/dts/stm32mp15-ddr.dtsi                       |   2 +-
 arch/arm/dts/stm32mp157-pinctrl.dtsi                  | 270 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 arch/arm/dts/stm32mp157-u-boot.dtsi                   |  79 ++++++++++------------
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi              |   4 --
 arch/arm/dts/stm32mp157a-dk1.dts                      |  32 +++++----
 arch/arm/dts/stm32mp157c-dk2.dts                      |   1 +
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi              |  15 +++--
 arch/arm/dts/stm32mp157c-ed1.dts                      | 205 ++++++++++++---------------------------------------------
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi              |   3 -
 arch/arm/dts/stm32mp157c-ev1.dts                      |  12 +++-
 arch/arm/dts/stm32mp157c.dtsi                         | 215 +++++++++++++++++++++++++++++++++++++++++++----------------
 arch/arm/mach-stm32mp/Kconfig                         |  28 +++++++-
 arch/arm/mach-stm32mp/Makefile                        |   2 +
 arch/arm/mach-stm32mp/bsec.c                          |  14 ++--
 arch/arm/mach-stm32mp/cmd_stm32key.c                  | 101 ++++++++++++++++++++++++++++
 arch/arm/mach-stm32mp/cpu.c                           |   9 +--
 arch/arm/mach-stm32mp/fdt.c                           | 223 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-stm32mp/include/mach/stm32.h            |   3 +-
 arch/arm/mach-stm32mp/include/mach/sys_proto.h        |   9 +++
 arch/arm/mach-stm32mp/syscon.c                        |   2 -
 board/st/stm32f429-discovery/led.c                    |   2 +
 board/st/stm32mp1/Kconfig                             |  13 ++++
 board/st/stm32mp1/MAINTAINERS                         |   1 +
 board/st/stm32mp1/Makefile                            |   1 +
 board/st/stm32mp1/README                              |  46 +++++++++----
 board/st/stm32mp1/cmd_stboard.c                       | 145 ++++++++++++++++++++++++++++++++++++++++
 board/st/stm32mp1/spl.c                               |   1 -
 board/st/stm32mp1/stm32mp1.c                          |  27 +++++++-
 cmd/pinmux.c                                          |   1 +
 configs/stm32mp15_basic_defconfig                     |   9 ++-
 configs/stm32mp15_optee_defconfig                     | 107 ++++++++++++++++++++++++++++++
 configs/stm32mp15_trusted_defconfig                   |   5 +-
 doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt | 101 ++++++++++++++++++++++++----
 drivers/adc/stm32-adc-core.c                          |   3 +-
 drivers/adc/stm32-adc.c                               |  13 ++--
 drivers/clk/clk_stm32mp1.c                            |  10 +--
 drivers/gpio/Kconfig                                  |   4 +-
 drivers/gpio/Makefile                                 |   2 +-
 drivers/gpio/{stm32f7_gpio.c => stm32_gpio.c}         |   8 +--
 drivers/i2c/stm32f7_i2c.c                             |  12 ++--
 drivers/mailbox/Kconfig                               |   7 ++
 drivers/mailbox/Makefile                              |   1 +
 drivers/mailbox/stm32-ipcc.c                          | 167 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/misc/stm32mp_fuse.c                           |   1 +
 drivers/mmc/stm32_sdmmc2.c                            |   3 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c                |  93 +++++++++-----------------
 drivers/pinctrl/pinctrl_stm32.c                       |  36 +++++++++-
 drivers/power/pmic/stpmic1.c                          |  11 +++-
 drivers/power/regulator/stm32-vrefbuf.c               |   2 +-
 drivers/power/regulator/stpmic1.c                     |   1 +
 drivers/ram/stm32mp1/stm32mp1_ram.c                   |   5 +-
 drivers/serial/serial_stm32.c                         |   4 +-
 drivers/spi/stm32_qspi.c                              |  24 +++----
 drivers/spi/stm32_spi.c                               |  11 ++--
 drivers/sysreset/sysreset_syscon.c                    |   6 +-
 env/Kconfig                                           |   5 +-
 include/configs/stm32mp1.h                            |  43 ++++++++----
 include/dt-bindings/pinctrl/stm32-pinfunc.h           |   6 ++
 64 files changed, 1690 insertions(+), 529 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32key.c
 create mode 100644 arch/arm/mach-stm32mp/fdt.c
 create mode 100644 board/st/stm32mp1/cmd_stboard.c
 create mode 100644 configs/stm32mp15_optee_defconfig
 rename drivers/gpio/{stm32f7_gpio.c => stm32_gpio.c} (97%)
 create mode 100644 drivers/mailbox/stm32-ipcc.c
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
