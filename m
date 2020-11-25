Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 892A42C427F
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 15:55:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A914C424AF;
	Wed, 25 Nov 2020 14:55:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F29F4C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 14:55:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APEpsOK009544; Wed, 25 Nov 2020 15:55:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=oP8LhZqn3SRgoamBZ0+xZK7DvMQ89cIQ93ZMe2dz47k=;
 b=p8AJTgrJBlquElZTgNEUvWE47EfrnI5WKw3ggLqcbQrcctUHcSKc/egwPR0JycumWosZ
 qwkThRfD2yURhX/tri1LoQJGXIzz5m/ossj3v3ltPxve01Ukc5lFZZfKcOVQ6DljFjaS
 kI+IHmgHItTPOpol+zaPbXDUvSyz+7eW9lkFP0kiTzxDawpBIKJuFARVAl0bos2WDuRe
 OdJKY1U7BcdrcDvXIoLLyoU0L3gkBQ1g2Fx2pfjlwEko7jt7tkQKZePHdol6ibV2rDY6
 Q+CU3K3lr1TGm2//l2IP+nbX1b0+CFIal+NLC3ckXmIqfkThHXq7FqSeM12BzuoPdIm+ 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hjh9vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 15:55:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40A9210002A;
 Wed, 25 Nov 2020 15:55:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27FFD264DB5;
 Wed, 25 Nov 2020 15:55:03 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 15:55:02 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 15:55:02 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request for u-boot master  = u-boot-stm32-20201125
Thread-Index: AdbDOkg+RqVjBusgSSi4WMJ+sftz4Q==
Date: Wed, 25 Nov 2020 14:55:02 +0000
Message-ID: <1606316102821.13856@st.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_09:2020-11-25,
 2020-11-25 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Richard Genoud <richard.genoud@posteo.net>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master =
	u-boot-stm32-20201125
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

Please pull the STM32 related patches for u-boot/master, v2021.01: u-boot-stm32-20201125

- STM32 MCU's DT update
- Add DHCOM based STM32MP15x PicoITX board
- Correct ALIGN macro usage for on syram for SPL dcache support
- Fixes on DHCOM: uSD card-detect GPIO and Drop QSPI CS2
- Fix compilation issue for spl_mmc_boot_partition
- Fix MTD partitions for serial boot
- Add support of MCU HOLD BOOT with reset for stm32 remoteproc
  (prepare alligneent with  kernel DT)
- Correct bias information and support in STM32 soc and STMFX
- Support optional vbus in usbphyc
- Update FIT examples to avoid kernel zImage relocation before decompression

CI status: 
https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/commits/u-boot-stm32-20201125

Thanks,
Patrick

git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20201125

The following changes since commit d361eafe82bfbf90ab0a592ae59daef99faee5ec:

  Merge https://gitlab.denx.de/u-boot/custodians/u-boot-usb (2020-11-22 11:00:11 -0500)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20201125

for you to fetch changes up to 60a2dd6aa20f6c0938856b764e7ebdee722d998e:

  board: st: stm32mp1: update load address for FIT examples (2020-11-25 14:27:19 +0100)

----------------------------------------------------------------
- STM32 MCU's DT update
- Add DHCOM based STM32MP15x PicoITX board
- Correct ALIGN macro usage for on syram for SPL dcache support
- Fixes on DHCOM: uSD card-detect GPIO and Drop QSPI CS2
- Fix compilation issue for spl_mmc_boot_partition
- Fix MTD partitions for serial boot
- Add support of MCU HOLD BOOT with reset for stm32 remoteproc
  (prepare alligneent with  kernel DT)
- Correct bias information and support in STM32 soc and STMFX
- Support optional vbus in usbphyc
- Update FIT examples to avoid kernel zImage relocation before decompression

----------------------------------------------------------------
Marek Vasut (3):
      ARM: dts: stm32: Add DHCOM based PicoITX board
      ARM: dts: stm32: Fix uSD card-detect GPIO on DHCOM
      ARM: dts: stm32: Drop QSPI CS2 on DHCOM

Patrice Chotard (4):
      ARM: dts: sync armv7-m.dtsi with kernel v5.10-rc1
      ARM: dts: stm32: DT sync with kernel v5.10-rc1 for MCU's boards
      ARM: dts: stm32: Fix timer initialization for stm32 MCU's board
      ARM: dts: stm32: Fix typo in stm32h7-u-boot.dtsi

Patrick Delaunay (11):
      arm: stm32mp: correct the ALIGN macro usage
      board: stm32mp1: no MTD partitions fixup for serial boot
      reset: stm32: Add support of MCU HOLD BOOT
      remoteproc: stm32: use reset for hold boot
      remoteproc: stm32: update error management in stm32_copro_start
      pinctrl: stm32: display bias information for all pins
      gpio: stm32: correct the bias management
      pinctrl: stmfx: update pincontrol and gpio device name
      pinctrl: stmfx: update pin name
      phy: stm32: usbphyc: manage optional vbus regulator on phy_power_on/off
      board: st: stm32mp1: update load address for FIT examples

Richard Genoud (1):
      SPL: stm32mp1: fix spl_mmc_boot_partition not defined

 arch/arm/dts/Makefile                              |   1 +
 arch/arm/dts/armv7-m.dtsi                          |   4 +--
 arch/arm/dts/stm32429i-eval-u-boot.dtsi            |   6 ++++-
 arch/arm/dts/stm32429i-eval.dts                    |  21 ++++++++++-----
 arch/arm/dts/stm32746g-eval-u-boot.dtsi            |   4 +--
 arch/arm/dts/stm32746g-eval.dts                    |  13 +++++-----
 arch/arm/dts/stm32f4-pinctrl.dtsi                  | 107 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 arch/arm/dts/stm32f429-disco-u-boot.dtsi           |   6 ++++-
 arch/arm/dts/stm32f429-disco.dts                   |  99 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 arch/arm/dts/stm32f429.dtsi                        |  30 +++++++++++++++-------
 arch/arm/dts/stm32f469-disco-u-boot.dtsi           |  26 +++++++++++--------
 arch/arm/dts/stm32f469-disco.dts                   |  19 +++++++++-----
 arch/arm/dts/stm32f469.dtsi                        |   1 -
 arch/arm/dts/stm32f7-pinctrl.dtsi                  |  22 ++++++++--------
 arch/arm/dts/stm32f7-u-boot.dtsi                   |   3 +--
 arch/arm/dts/stm32f746-disco-u-boot.dtsi           |   8 ++----
 arch/arm/dts/stm32f746-disco.dts                   |   2 +-
 arch/arm/dts/stm32f746.dtsi                        |  12 ++++-----
 arch/arm/dts/stm32f769-disco-u-boot.dtsi           |   4 +--
 arch/arm/dts/stm32f769-disco.dts                   |   6 ++---
 arch/arm/dts/stm32h7-u-boot.dtsi                   |   6 ++++-
 arch/arm/dts/stm32h743-pinctrl.dtsi                |  10 ++++----
 arch/arm/dts/stm32h743.dtsi                        |  37 +++++++++++++++++++--------
 arch/arm/dts/stm32h743i-disco.dts                  |   2 +-
 arch/arm/dts/stm32h743i-eval.dts                   |   2 +-
 arch/arm/dts/stm32mp15-u-boot.dtsi                 |   7 +++++
 arch/arm/dts/stm32mp15xx-dhcom-picoitx-u-boot.dtsi |  14 ++++++++++
 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts         |  93 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32mp15xx-dhcom.dtsi                |  15 +++--------
 arch/arm/mach-stm32mp/cpu.c                        |   4 +--
 arch/arm/mach-stm32mp/spl.c                        |   2 ++
 board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its   |  22 ++++++++++++++++
 board/st/stm32mp1/fit_copro_kernel_dtb.its         |  18 +++++++++++--
 board/st/stm32mp1/fit_kernel_dtb.its               |   6 ++---
 board/st/stm32mp1/stm32mp1.c                       |  11 +++++---
 configs/stm32mp15_dhcom_basic_defconfig            |   2 +-
 doc/device-tree-bindings/phy/phy-stm32-usbphyc.txt |   2 ++
 drivers/gpio/stm32_gpio.c                          |  28 ++++++++++----------
 drivers/phy/phy-stm32-usbphyc.c                    |  33 ++++++++++++++++--------
 drivers/pinctrl/pinctrl-stmfx.c                    |  13 ++++++----
 drivers/pinctrl/pinctrl_stm32.c                    |  24 ++++++++---------
 drivers/remoteproc/stm32_copro.c                   | 108 +++++++++++++++++++++++------------------------------------------------------
 drivers/reset/stm32-reset.c                        |  17 +++++++++---
 include/dt-bindings/reset/stm32mp1-resets.h        |   1 +
 44 files changed, 611 insertions(+), 260 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcom-picoitx-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
