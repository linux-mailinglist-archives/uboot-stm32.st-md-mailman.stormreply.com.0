Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6815D540
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 11:11:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 153B2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 10:11:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81D11C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 10:11:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EA8q1s019253; Fri, 14 Feb 2020 11:11:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=GOzbJB29JZzh45RC2FaVmwVW1yYnphp8+Lo9pJM18U0=;
 b=S2EDsAmrjaTWfiAgtLTECdVC4ic2ETckr6xLaJH+Fw6+9jIyg3skWlcHheJa75MZXGEU
 z5rcsIRijZdJPdNR3hjlFXqbpMuluUn65Huws4AEK45JF7iG1iIOCgFLVOhNk9W2Zlaz
 DhPLcNRSuS/KlXB23HnYyuVls/rgj1oSIh7x7KV/IkFIYoSrjh4DqjnpR9wHEOSAtgol
 yJEP0sv1l6nKcjwS2aZCHqAGYFLMzU1XVOIjOp19JvMW625dIhXr/G046h5cwo6VCb35
 GZDGQfco3piO+JWzLwmrgrNlzCiV+tJ2KWmBLQ2Sk2ka/r6hTcpNhIO1MBEjR/9Suxnx 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1udaaydm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 11:11:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4524D10002A;
 Fri, 14 Feb 2020 11:11:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FBF42ABF50;
 Fri, 14 Feb 2020 11:11:24 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 11:11:23 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 11:11:23 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm32 u-boot-stm32-20200214
Thread-Index: AdXjHj5LE6HRVP7ZR6eyYSCoKfUExg==
Date: Fri, 14 Feb 2020 10:11:23 +0000
Message-ID: <e65235d356924d0393938ab1c8b0c306@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_02:2020-02-12,
 2020-02-14 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	u-boot-stm32-20200214
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

Please pull the STM32 related patches for u-boot-stm32-20200214
for v2020.04-rc3

With the following changes:
- add DH Electronics DHCOM SoM and PDK2 board
- DT alignment with kernel v5.5-rc7 for stm32mp1 boards
- fix STM32 image format for big endian hosts in mkimage
- solve warnings in device tree and code for stm32mp1 boards
- remove fdt_high and initrd_high for stm32 and stih boards
- add support of STM32MP15x Rev.Z
- update stm32mp1 readme

CI status:
     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2194

Thanks,
Patrick

The following changes since commit 721d6b594be4dc2d13b61f6afee9e437278d3ddd:

  Prepare v2020.04-rc2 (2020-02-12 09:30:43 -0500)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20200214

for you to fetch changes up to 8ee5e3c81f47b8647ef05219058d260199c51d1b:

  board: stm32: remove fdt_high and fdt_highinitrd_high (2020-02-13 18:47:00 +0100)

----------------------------------------------------------------
- add DH Electronics DHCOM SoM and PDK2 board
- DT alignment with kernel v5.5-rc7 for stm32mp1 boards
- fix STM32 image format for big endian hosts in mkimage
- solve warnings in device tree and code for stm32mp1 boards
- remove fdt_high and initrd_high for stm32 and stih boards
- add support of STM32MP15x Rev.Z
- update stm32mp1 readme

----------------------------------------------------------------
Antonio Borneo (2):
      ARM: dts: stm32mp1: move FDCAN to PLL4_R
      tools: mkimage: fix STM32 image format for big endian hosts

Marek Vasut (1):
      ARM: dts: stm32: Add DH Electronics DHCOM SoM and PDK2 board

Patrice Chotard (3):
      board: stih410-b2260: remove fdt_high and initrd_high
      board: stm32: fix extra env setings addresses
      board: stm32: remove fdt_high and fdt_highinitrd_high

Patrick Delaunay (12):
      ARM: dts: stm32mp1: DT alignment with kernel v5.4
      stm32mp1: pwr: use the last binding for pwr
      ARM: dts: stm32mp1: DT alignment with kernel v5.5-rc7
      ARM: dts: stm32mp1: correct ddr node
      ARM: dts: stm32m1: add reg for pll nodes
      board: stm32mp1: update readme
      stm32mp1: support of STM32MP15x Rev.Z
      board: stm32mp1: board: add include for dfu
      board: stm32mp1: change dfu function to static
      pinctrl: stmfx: update the result type of dm_i2c_reg_read
      clk: stm32mp1: solve type issue in stm32mp1_lse_enable and stm32mp1_clktree
      stm32mp1: remove fdt_high and initrd_high in environment

 arch/arm/dts/Makefile                            |   3 +-
 arch/arm/dts/stm32mp15-ddr.dtsi                  |   2 +-
 arch/arm/dts/stm32mp157-pinctrl.dtsi             |  31 ++-
 arch/arm/dts/stm32mp157-u-boot.dtsi              |   4 +-
 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi   |  10 +-
 arch/arm/dts/stm32mp157a-avenger96.dts           |  11 +-
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi         |  27 +--
 arch/arm/dts/stm32mp157a-dk1.dts                 |  73 +++++-
 arch/arm/dts/stm32mp157c-dk2.dts                 |  13 ++
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi         |  10 +-
 arch/arm/dts/stm32mp157c-ed1.dts                 |  28 ++-
 arch/arm/dts/stm32mp157c-ev1.dts                 |   8 +-
 arch/arm/dts/stm32mp157c.dtsi                    |  48 ++--
 arch/arm/dts/stm32mp15xx-dhcom-pdk2-u-boot.dtsi  |   6 +
 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts          |  88 ++++++++
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi       | 246 ++++++++++++++++++++
 arch/arm/dts/stm32mp15xx-dhcom.dtsi              | 377 +++++++++++++++++++++++++++++++
 arch/arm/mach-stm32mp/Kconfig                    |   9 +
 arch/arm/mach-stm32mp/cpu.c                      |   3 +
 arch/arm/mach-stm32mp/include/mach/stm32.h       |   1 -
 arch/arm/mach-stm32mp/include/mach/sys_proto.h   |   1 +
 arch/arm/mach-stm32mp/pwr_regulator.c            |  23 +-
 arch/arm/mach-stm32mp/syscon.c                   |   1 -
 board/dhelectronics/dh_stm32mp1/Kconfig          |  21 ++
 board/dhelectronics/dh_stm32mp1/MAINTAINERS      |   7 +
 board/dhelectronics/dh_stm32mp1/Makefile         |  10 +
 board/dhelectronics/dh_stm32mp1/board.c          | 689 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 board/st/stm32mp1/README                         |  52 +++--
 board/st/stm32mp1/stm32mp1.c                     |   5 +-
 configs/stm32mp15_dhcom_basic_defconfig          | 138 ++++++++++++
 doc/device-tree-bindings/clock/st,stm32mp1.txt   |  32 ++-
 doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt |   6 +-
 drivers/clk/clk_stm32mp1.c                       |   9 +-
 drivers/pinctrl/pinctrl-stmfx.c                  |   7 +-
 include/configs/stih410-b2260.h                  |   8 +-
 include/configs/stm32f429-evaluation.h           |  15 +-
 include/configs/stm32f469-discovery.h            |  15 +-
 include/configs/stm32f746-disco.h                |  15 +-
 include/configs/stm32h743-disco.h                |  14 +-
 include/configs/stm32h743-eval.h                 |  14 +-
 include/configs/stm32mp1.h                       |  10 +-
 tools/stm32image.c                               |   5 +-
 42 files changed, 1922 insertions(+), 173 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcom-pdk2-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcom.dtsi
 create mode 100644 board/dhelectronics/dh_stm32mp1/Kconfig
 create mode 100644 board/dhelectronics/dh_stm32mp1/MAINTAINERS
 create mode 100644 board/dhelectronics/dh_stm32mp1/Makefile
 create mode 100644 board/dhelectronics/dh_stm32mp1/board.c
 create mode 100644 configs/stm32mp15_dhcom_basic_defconfig
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
