Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E861D2C19
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 12:03:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D550C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 10:03:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 163CAC36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 10:03:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EA2MLw015969; Thu, 14 May 2020 12:03:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=SjPehXIRc7tJ7Lz8Rt52/A0EVxE+q1j92sN2clhHHWo=;
 b=y+eQkV+XVylNu9w5+OUel0xNslkh1tGwIBAl+cevzSfe1TW195Kapeyh/mm7K4MfUnpb
 Yq363Saga/sjz0x0LzzIxjxGBAluCEf+lklmeJ7ickHsJ2o0mi2OL1A4gUuTX72vdc/l
 mPfYxzsUsbMt2yKuNgihYt3SCmOWrlQhDUBmbw07AXeIARGfvS0qiEVOKpYxfchz9v8u
 waJ5ltnOLcHlgBekYZ9AiISh9WNzPhBJ38YY2JoCfawIgjrbANSoInJM0pbq7DKnWydc
 iULDFtgN2+KdsdIoLV/ENaubpxbp2u4Cq0H4OtRUecTvcJutILZVxQH7GA/Ee3uAtv7L 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vnaa0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 12:03:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2845910002A;
 Thu, 14 May 2020 12:03:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 123862B186D;
 Thu, 14 May 2020 12:03:34 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 May
 2020 12:03:33 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 12:03:33 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Tom Rini
 <trini@konsulko.com>
Thread-Topic: [PULL] Pull request: u-boot-stm/master =u-boot-stm32-20200514
Thread-Index: AdYp1jrejqqnqUbOSSCOc2Zfonxo3Q==
Date: Thu, 14 May 2020 10:03:33 +0000
Message-ID: <bbbace4ec92f4be7af31e46ee7c5bcbb@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm/master
	=u-boot-stm32-20200514
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

Hi Tom,

Please pull the STM32 related fixes for v2020.07-rc3 = u-boot-stm32-20200514
 
With the following changes:
- stm32mp1: migrate MTD and DFU configuration in Kconfig
- stm32mp1: add command stm32prog
- stm32mp1: several board and arch updates
- stm32mp1: activate data cache in SPL and before relocation
- Many improvement for AV96 board and DHCOR SoM
  (add new defconfig, DDR3 coding on DHCOR SoM, split between board and SOM 
   Synchronize DDR setttings on DH SoMs, setting for I2C EEPROM)
- clk: stm32mp1: fix CK_MPU calculation
- DT alignment of stm32mp1 device tree with Linux 5.7-rc2
 
CI status:
     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/3238> 

Thanks,
Patrick

The following changes since commit 10bca13ea6d9d4b85f80f02c8795227f63240f59:

  Merge https://gitlab.denx.de/u-boot/custodians/u-boot-usb (2020-05-12 16:20:10 -0400)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20200514

for you to fetch changes up to 1b28a5e2b00a9bf3523cc63694baa03f23604619:

  ARM: dts: stm32mp1: DT alignment with Linux 5.7-rc2 (2020-05-14 09:02:12 +0200)

----------------------------------------------------------------
- stm32mp1: migrate MTD and DFU configuration in Kconfig
- stm32mp1: add command stm32prog
- stm32mp1: several board and arch updates
- stm32mp1: activate data cache in SPL and before relocation
- Many improvment for AV96 board and DHCOR SoM
  (add new defconfig, DDR3 coding on DHCOR SoM, split between board and SOM
   Synchronize DDR setttings on DH SoMs, setting for I2C EEPROM)
- clk: stm32mp1: fix CK_MPU calculation
- DT alignment of stm32mp1 device tree with Linux 5.7-rc2

----------------------------------------------------------------
Christophe Roullier (1):
      configs: stm32mp1: activate Ethernet PHY Realtek

Lionel Debieve (1):
      clk: stm32mp1: fix CK_MPU calculation

Marek Vasut (10):
      ARM: stm32: Add default config for DHCOR
      ARM: stm32: Add board_early_init_f() to SPL
      ARM: stm32: Implement board coding on AV96
      ram: stm32mp1: Add support for multiple configs
      ARM: dts: stm32: Rework DDR DT inclusion
      ARM: stm32: Implement DDR3 coding on DHCOR SoM
      ARM: dts: stm32: Fix AV96 and DHCOR split
      ARM: dts: stm32: Synchronize DDR setttings on DH SoMs
      ARM: stm32: Define I2C EEPROM bus and address on DHCOM
      ARM: stm32: Hog GPIO PF7 high on DHCOM to unlock SPI NOR nWP

Patrice Chotard (2):
      board: stm32mp1: Keep error led ON in case of low power detection
      stm32mp1: Fix warning display when 1.5A power supply is used

Patrick Delaunay (43):
      board: stm32mp1: move board_get_mtdparts in st common directory
      board: stm32mp1: move set_dfu_alt_info in st common directory
      stm32mp1: dynamically build DFU_ALT_INFO
      stm32mp1: move MTDPART configuration in Kconfig
      board: stm32mp1: reserve memory for OP-TEE in device tree
      stm32mp1: dynamically detect op-tee presence
      board: stm32mp1: use FDT address provided by TF-A at boot time
      configs: stm32mp1: remove optee defconfig
      board: stm32mp1: support boot from spi-nand
      board: stm32mp1: adapt MTD partition for BOOT from NOR or NAND
      doc: stm32mp1: update DFU support example
      usb: gadget: g_dnl: add function g_dnl_set_product
      dfu: add prototype for dfu_transaction_initiate/cleanup
      stm32mp: add function get_cpu_dev
      stm32mp: add the command stm32prog
      stm32mp: stm32prog: add flash layout parsing
      stm32mp: stm32prog: add MMC device
      stm32mp: stm32prog: add support of boot partition for eMMC device
      stm32mp: stm32prog: add upport of partial update
      stm32mp: stm32prog: add MTD devices support
      stm32mp: stm32prog: adapt the MTD partitions
      stm32mp: stm32prog: add support of ssbl copy
      stm32mp: stm32prog: add support for delete option in flashlayout
      stm32mp: stm32prog: add otp update support
      stm32mp: stm32prog: add pmic NVM update support
      stm32mp: stm32prog: add serial link support
      stm32mp: stm32prog: enable videoconsole
      stm32mp: stm32prog: support for script
      stm32mp: stm32prog: add support of RAM target
      arm: stm32mp: remove dependency for STM32KEY
      arm: stm32mp: spl: update error management in board_init_f
      board: stm32mp1: update management of boot-led
      board: stm32mp1: gt9147 IRQ before reset on EV1
      board: stm32mp1: set environment variable fdtfile
      board: stm32mp1: remove bootdelay configuration for usb or serial boot
      board: stm32mp1: add timeout for I/O compensation ready
      gpio: stm32: support gpio ops in SPL
      ARM: dts: stm32mp15: use DDR3 files generated by STM32CubeMX
      configs: stm32mp1: activate CONFIG_ERRNO_STR
      arm: stm32mp: activate data cache in SPL and before relocation
      arm: stm32mp: activate data cache on DDR in SPL
      mmc: stm32_sdmmc2: change the displayed config name
      ARM: dts: stm32mp1: DT alignment with Linux 5.7-rc2

 arch/arm/dts/stm32mp15-ddr.dtsi                                        |  358 ++++---
 arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi                       |   49 +-
 arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi                       |   49 +-
 arch/arm/dts/stm32mp15-ddr3-dhsom-2x1Gb-1066-binG.dtsi                 |  120 +++
 arch/arm/dts/stm32mp15-ddr3-dhsom-2x2Gb-1066-binG.dtsi                 |  120 +++
 arch/arm/dts/stm32mp15-ddr3-dhsom-2x4Gb-1066-binG.dtsi                 |  120 +++
 arch/arm/dts/stm32mp15-pinctrl.dtsi                                    |   92 ++
 arch/arm/dts/stm32mp15-u-boot.dtsi                                     |   25 +
 arch/arm/dts/stm32mp151.dtsi                                           |   13 +-
 arch/arm/dts/stm32mp153.dtsi                                           |    1 +
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi                               |    4 -
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi                               |    4 -
 arch/arm/dts/stm32mp157c-ed1.dts                                       |   17 +-
 arch/arm/dts/stm32mp157c-ev1.dts                                       |   13 +-
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi                             |   15 +-
 arch/arm/dts/stm32mp15xx-dhcom.dtsi                                    |    3 +-
 arch/arm/dts/stm32mp15xx-dhcor-avenger96-u-boot.dtsi                   |    1 +
 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts                           |    2 +-
 arch/arm/dts/stm32mp15xx-dhcor-io1v8.dtsi                              |   24 +
 arch/arm/dts/{stm32mp15xx-dhcor.dtsi => stm32mp15xx-dhcor-io3v3.dtsi}  |   21 +-
 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi                             |   12 +-
 arch/arm/dts/stm32mp15xx-dkx.dtsi                                      |   15 +-
 arch/arm/mach-stm32mp/Kconfig                                          |   29 +-
 arch/arm/mach-stm32mp/Makefile                                         |    2 +
 arch/arm/mach-stm32mp/boot_params.c                                    |   45 +
 arch/arm/mach-stm32mp/cmd_stm32prog/Makefile                           |    9 +
 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c                    |  192 ++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c                        | 1745 +++++++++++++++++++++++++++++++++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h                        |  185 ++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c                 |  993 ++++++++++++++++++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c                    |  230 +++++
 arch/arm/mach-stm32mp/cpu.c                                            |   58 +-
 arch/arm/mach-stm32mp/dram_init.c                                      |   18 +
 arch/arm/mach-stm32mp/fdt.c                                            |   25 +
 arch/arm/mach-stm32mp/include/mach/stm32.h                             |    3 +
 arch/arm/mach-stm32mp/include/mach/stm32prog.h                         |   16 +
 arch/arm/mach-stm32mp/include/mach/sys_proto.h                         |    5 +
 arch/arm/mach-stm32mp/spl.c                                            |   38 +-
 board/dhelectronics/dh_stm32mp1/Kconfig                                |    3 +-
 board/dhelectronics/dh_stm32mp1/MAINTAINERS                            |    1 +
 board/dhelectronics/dh_stm32mp1/Makefile                               |    3 +
 board/dhelectronics/dh_stm32mp1/board.c                                |  232 ++---
 board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its                       |   39 +
 board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its                       |   39 +
 board/st/common/Kconfig                                                |   64 ++
 board/st/common/Makefile                                               |    5 +
 board/st/common/stm32mp_dfu.c                                          |  245 +++++
 board/st/common/stm32mp_mtdparts.c                                     |  167 ++++
 board/st/stm32mp1/MAINTAINERS                                          |    1 -
 board/st/stm32mp1/stm32mp1.c                                           |  357 ++-----
 configs/stm32mp15_basic_defconfig                                      |    9 +-
 configs/stm32mp15_dhcom_basic_defconfig                                |    7 +
 configs/{stm32mp15_optee_defconfig => stm32mp15_dhcor_basic_defconfig} |   85 +-
 configs/stm32mp15_trusted_defconfig                                    |   12 +-
 doc/board/st/stm32mp1.rst                                              |  147 ++-
 drivers/clk/clk_stm32mp1.c                                             |    7 +-
 drivers/gpio/stm32_gpio.c                                              |    7 +-
 drivers/mmc/stm32_sdmmc2.c                                             |    2 +-
 drivers/ram/stm32mp1/stm32mp1_ram.c                                    |   33 +-
 drivers/usb/gadget/g_dnl.c                                             |    8 +
 include/configs/dh_stm32mp1.h                                          |   15 +
 include/configs/stm32mp1.h                                             |   64 +-
 include/dfu.h                                                          |    3 +
 include/g_dnl.h                                                        |    1 +
 64 files changed, 5334 insertions(+), 893 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp15-ddr3-dhsom-2x1Gb-1066-binG.dtsi
 create mode 100644 arch/arm/dts/stm32mp15-ddr3-dhsom-2x2Gb-1066-binG.dtsi
 create mode 100644 arch/arm/dts/stm32mp15-ddr3-dhsom-2x4Gb-1066-binG.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcor-io1v8.dtsi
 rename arch/arm/dts/{stm32mp15xx-dhcor.dtsi => stm32mp15xx-dhcor-io3v3.dtsi} (89%)
 create mode 100644 arch/arm/mach-stm32mp/boot_params.c
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
 create mode 100644 arch/arm/mach-stm32mp/include/mach/stm32prog.h
 create mode 100644 board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its
 create mode 100644 board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its
 create mode 100644 board/st/common/stm32mp_dfu.c
 create mode 100644 board/st/common/stm32mp_mtdparts.c
 rename configs/{stm32mp15_optee_defconfig => stm32mp15_dhcor_basic_defconfig} (58%)
 create mode 100644 include/configs/dh_stm32mp1.h
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
