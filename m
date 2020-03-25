Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9612192250
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Mar 2020 09:15:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 913E4C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Mar 2020 08:15:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40489C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2020 08:15:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02P88LDv000547; Wed, 25 Mar 2020 09:15:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=W90hbLc8kn3y5z1xQDOpTWzRSEIfgeQcdTDitQHkb9c=;
 b=OnjHFFgI323dPbn7Ue0nM50FQFy+XOIgZTwVhwYdjUsTPW8MXTMLGn8Gopo4h6guOS9D
 T3vyd/+Pvrz2J+pLstEOLKCIm9N8DZSO4czuPvGic9zt+yZCFsR0TSF+l+txV2rp8XGA
 wcepzYsWUTMteSgWarbluJVGPncaNZVZ4CHkd8VH9752wFK3H1Mjd5MHfvnRDPi7LOmD
 /U8+JbwvCQNKnvjHF7gLHOSGw3vw+DSyv/ExGp5RRZbjfraw4a3l/7HZHDet/Dcg1iRO
 KxckLC3dy0L65uOZIQgNHfXcV1n1TIEn+LJJuaPyb480TYZauZMdKJ5lxPjO+menhRFK 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw8xe4c84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 09:15:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0DFC100039;
 Wed, 25 Mar 2020 09:15:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3A5821C0AE;
 Wed, 25 Mar 2020 09:15:02 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 25 Mar
 2020 09:15:02 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 25 Mar 2020 09:15:02 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm/next =u-boot-stm32-20200324
Thread-Index: AdYCfPHzYY0MAYVWRWCyHo80NC4f6w==
Date: Wed, 25 Mar 2020 08:15:01 +0000
Message-ID: <10b180027227416a83b4e1a0461d0914@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_01:2020-03-23,
 2020-03-25 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm/next
	=u-boot-stm32-20200324
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

Please pull the STM32 next related fixes for v2020.07 = u-boot-stm32-20200324

With the following changes:
- stm32mp: fix command stboard
- stm32mp: update kernel device tree according the part number
- stm32mp: add 800 MHz profile support = stm32mp15xd and stm32mp15xf
- stm32mp: set cp15 frequency in psci cpu on
- stm32mp: DT alignment with Linux 5.6-rc1
- stm32mp: clk: add SPI5 support and correct CKSELR masks
- stm32mp: ram: fixes on LPDDR2/LPDDR3 support and on tuning
- stm32: i2c: allows for any bus frequency
- sti: timer: livetree and clk API conversion

CI status:
     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2510

Thanks,
Patrick

The following changes since commit 2738f0edea7d19960d692284d1f378b1a2b4c4a5:

  Merge tag 'ti-v2020.07-next' of https://gitlab.denx.de/u-boot/custodians/u-boot-ti into next (2020-03-17 11:59:58 -0400)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20200324

for you to fetch changes up to 5b5699cdc97122e08e7fd0886a9e4474ca3ccb35:

  timer: sti: use clk API to get timer clock rate (2020-03-24 14:23:35 +0100)

----------------------------------------------------------------
- stm32mp: fix command stboard
- stm32mp: update kernel device tree according the part number
- stm32mp: add 800 MHz profile support = stm32mp15xd and stm32mp15xf
- stm32mp: set cp15 frequency in psci cpu on
- stm32mp: DT alignment with Linux 5.6-rc1
- stm32mp: clk: add SPI5 support and correct CKSELR masks
- stm32mp: ram: fixes on LPDDR2/LPDDR3 support and on tuning
- stm32: i2c: allows for any bus frequency
- sti: timer: livetree and clk API conversion

----------------------------------------------------------------
Alain Volmat (1):
      i2c: stm32f7_i2c: allows for any bus frequency

Ludovic Barre (1):
      stm32mp: psci: set cntfrq register of cpu on

Nicolas Heemeryck (2):
      timer: sti: convert to livetree
      timer: sti: use clk API to get timer clock rate

Patrick Delaunay (23):
      board: stm32mp1: update command stboard on misc_write result
      board: stm32mp1: read OTP in command stboard
      arm: stm32mp: bsec: remove unneeded test
      arm: stm32mp: bsec: add permanent lock support in bsec driver
      board: stm32mp1: stboard: lock the OTP after programming
      arm: stm32mp: improve the error message for smc
      board: stm32mp1: add finished good in board identifier OTP
      board: stm32mp1: display reference only for STMicroelectronics board
      arm: stm32mp: add function get_soc_name
      arm: stm32mp: fdt: update kernel device tree according the part number
      stm32mp1: add 800 MHz profile support
      clk: stm32mp1: correct CKSELR masks
      clk: stm32mp1: add SPI5_K support
      ARM: dts: stm32mp1: DT alignment with Linux 5.6-rc1
      ram: stm32mp1: increase vdd2_ddr: buck2 for 32bits LPDDR
      ram: stm32mp1: display result for software read DQS gating
      ram: stm32mp1: don't display the prompt two times
      ram: stm32mp1: tuning: add timeout for polling BISTGSR.BDDONE
      ram: stm32mp1: tuning: deactivate derating during BIST test
      ram: stm32mp1: update BIST config for tuning
      ram: stm32mp1_ddr: fix self refresh disable during DQS training
      ram: stm32mp1: reduce delay after BIST reset for tuning
      ram: stm32mp1: the property st, phy-cal becomes optional

 arch/arm/dts/stm32mp15-ddr.dtsi                                 |    3 +
 arch/arm/dts/stm32mp15-pinctrl.dtsi                             | 1114 ++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/dts/{stm32mp157-u-boot.dtsi => stm32mp15-u-boot.dtsi}  |    0
 arch/arm/dts/{stm32mp157c.dtsi => stm32mp151.dtsi}              |  274 +++++++++---
 arch/arm/dts/stm32mp153.dtsi                                    |   45 ++
 arch/arm/dts/stm32mp157-pinctrl.dtsi                            | 1057 -------------------------------------------
 arch/arm/dts/stm32mp157.dtsi                                    |   31 ++
 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi                  |   11 +-
 arch/arm/dts/stm32mp157a-avenger96.dts                          |    5 +-
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi                        |    7 +-
 arch/arm/dts/stm32mp157a-dk1.dts                                |  541 +---------------------
 arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi                        |    6 -
 arch/arm/dts/stm32mp157c-dk2.dts                                |   15 +-
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi                        |    7 +-
 arch/arm/dts/stm32mp157c-ed1.dts                                |   22 +-
 arch/arm/dts/stm32mp157c-ev1.dts                                |   30 +-
 arch/arm/dts/stm32mp157xaa-pinctrl.dtsi                         |   90 ----
 arch/arm/dts/stm32mp157xab-pinctrl.dtsi                         |   62 ---
 arch/arm/dts/stm32mp157xac-pinctrl.dtsi                         |   78 ----
 arch/arm/dts/stm32mp157xad-pinctrl.dtsi                         |   62 ---
 arch/arm/dts/stm32mp15xc.dtsi                                   |   18 +
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi                      |    7 +-
 arch/arm/dts/stm32mp15xx-dhcom.dtsi                             |    6 +-
 arch/arm/dts/stm32mp15xx-dkx.dtsi                               |  639 ++++++++++++++++++++++++++
 arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi                         |   85 ++++
 arch/arm/dts/stm32mp15xxab-pinctrl.dtsi                         |   57 +++
 arch/arm/dts/stm32mp15xxac-pinctrl.dtsi                         |   73 +++
 arch/arm/dts/stm32mp15xxad-pinctrl.dtsi                         |   57 +++
 arch/arm/mach-stm32mp/bsec.c                                    |   92 ++--
 arch/arm/mach-stm32mp/cpu.c                                     |   38 +-
 arch/arm/mach-stm32mp/fdt.c                                     |  107 ++++-
 arch/arm/mach-stm32mp/include/mach/ddr.h                        |    6 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h                      |    9 +-
 arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h               |    5 +-
 arch/arm/mach-stm32mp/include/mach/sys_proto.h                  |   12 +-
 arch/arm/mach-stm32mp/psci.c                                    |   22 +
 board/st/common/cmd_stboard.c                                   |   85 +++-
 board/st/stm32mp1/board.c                                       |   23 +-
 board/st/stm32mp1/stm32mp1.c                                    |   28 +-
 doc/board/st/stm32mp1.rst                                       |   42 +-
 doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt |    2 +
 drivers/clk/clk_stm32mp1.c                                      |   13 +-
 drivers/i2c/stm32f7_i2c.c                                       |  105 +++--
 drivers/ram/stm32mp1/stm32mp1_ddr.c                             |   54 ++-
 drivers/ram/stm32mp1/stm32mp1_ddr.h                             |    1 +
 drivers/ram/stm32mp1/stm32mp1_ddr_regs.h                        |    1 +
 drivers/ram/stm32mp1/stm32mp1_interactive.c                     |   17 +-
 drivers/ram/stm32mp1/stm32mp1_ram.c                             |   34 +-
 drivers/ram/stm32mp1/stm32mp1_tuning.c                          |  223 ++++++++--
 drivers/timer/sti-timer.c                                       |   26 +-
 include/power/stpmic1.h                                         |    1 +
 51 files changed, 3143 insertions(+), 2205 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp15-pinctrl.dtsi
 rename arch/arm/dts/{stm32mp157-u-boot.dtsi => stm32mp15-u-boot.dtsi} (100%)
 rename arch/arm/dts/{stm32mp157c.dtsi => stm32mp151.dtsi} (89%)
 create mode 100644 arch/arm/dts/stm32mp153.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp157.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157xaa-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157xab-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157xac-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157xad-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xc.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xx-dkx.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xxab-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xxac-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xxad-pinctrl.dtsi
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
