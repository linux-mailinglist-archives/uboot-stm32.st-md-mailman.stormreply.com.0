Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD810B079
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 14:42:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 048EAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 13:42:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1B0CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 13:42:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARDaYla013975; Wed, 27 Nov 2019 14:42:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=yEXkt25fnz0pKBBw/gVNOwmaabnHps3dMLgh7+KC/H0=;
 b=D8e9EWeaD4NTKRU8ffomgG8SpO3932p0dNqHBIK3K4SIDpTgpNlOP9M/m4ImlyNAwfUN
 KpuS/evs7AI9XaMn1nLy4IlPLlIb2/LSTb9/ShtX+2WLYo3iJanOOQDRPC2nu3uDhoc2
 R0xl0p7V3/2wTrsS6hHVtwjhvpBdHFDlXfn3j390Ty3cCI8ajeEMmAS7Rg+jHo5iC0lq
 aw3NJsA5UECaZsISl7GQo4r4b09jTwbUO+RU8hOhTcXw6C/oIYs+n0fmTfAMVjq7rx36
 xDzoYMWjgsNZoEegRvG24ni490HVvV8kB7b7jRE4AGPu5VdZsiRk1gmwym1zgA9DBtKZ Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2whcxyby90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 14:42:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFE38100034;
 Wed, 27 Nov 2019 14:42:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5E3F2B9917;
 Wed, 27 Nov 2019 14:42:24 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov
 2019 14:42:24 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 27 Nov 2019 14:42:24 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm32 u-boot-stm32-20191126
Thread-Index: AdWlI3tEaMiz1V8mRtO7QBViIE5RXg==
Date: Wed, 27 Nov 2019 13:42:24 +0000
Message-ID: <efb401d88d4140e2a2fa7f434bf86447@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_03:2019-11-27,2019-11-27 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	u-boot-stm32-20191126
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

Please pull the STM32 related patches for u-boot-stm32-20191126

With the following changes:
- Solve warning for stih410-b2260
- Device tree alignment on v5.4-rc4 for all stm32 boards
- Correct the eMMC pin configuration on stm32mp157c-ev1
- Add DFU and SPI-NAND support for stm32mp1 board

Travis CI status:
     https://travis-ci.org/patrickdelaunay/u-boot/builds/617166580

Thanks,
Patrick

The following changes since commit 4b19b89ca4a866b7baa642533e6dbd67cd832d27:

  Merge tag 'rpi-next-2020.01' of https://github.com/mbgg/u-boot (2019-11-25 12:56:27 -0500)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20191126

for you to fetch changes up to b4fee1610864036c8363e552f8547e99b1100f0b:

  stm32mp1: add support for virtual partition read (2019-11-26 10:14:35 +0100)

----------------------------------------------------------------
- Solve warning for stih410-b2260
- Device tree alignment on v5.4-rc4 for all stm32 boards
- Correct the eMMC pin configuration on stm32mp157c-ev1
- Add DFU and SPI-NAND support for stm32mp1 board

----------------------------------------------------------------
Patrice Chotard (1):
      configs: stih410-b2260: Enable DM_ETH flag

Patrick Delaunay (8):
      ARM: dts: stm32: DT alignment with kernel v5.3
      ARM: dts: stm32: DT alignment with kernel v5.4-rc4
      ARM: dts: stm32: update eMMC configuration for stm32mp157c-ev1
      stm32mp1: activate DFU support and command MTD
      stm32mp1: activate SET_DFU_ALT_INFO
      stm32mp1: configs: activate CONFIG_MTD_SPI_NAND
      stm32mp1: board: add spi nand support
      stm32mp1: add support for virtual partition read

 arch/arm/dts/st-pincfg.h                       |   1 +
 arch/arm/dts/stm32429i-eval.dts                |  29 ++++++++++++----------
 arch/arm/dts/stm32746g-eval.dts                | 105 +++++++++++++++++++++++++++++++++++++++++++++++++----------------------------
 arch/arm/dts/stm32f4-pinctrl.dtsi              |  38 +---------------------------
 arch/arm/dts/stm32f429-disco.dts               |  40 ++----------------------------
 arch/arm/dts/stm32f429-pinctrl.dtsi            |  38 +---------------------------
 arch/arm/dts/stm32f429.dtsi                    | 127 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------
 arch/arm/dts/stm32f469-disco.dts               |  39 ++---------------------------
 arch/arm/dts/stm32f469-pinctrl.dtsi            |  39 +----------------------------
 arch/arm/dts/stm32f469.dtsi                    |   2 +-
 arch/arm/dts/stm32f746-disco.dts               |  39 ++---------------------------
 arch/arm/dts/stm32f746.dtsi                    |  54 ++++++++++++----------------------------
 arch/arm/dts/stm32f769-disco.dts               |  43 +++++---------------------------
 arch/arm/dts/stm32h7-u-boot.dtsi               |  41 +++----------------------------
 arch/arm/dts/stm32h743-pinctrl.dtsi            |  83 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32h743.dtsi                    |  69 +++++++++++++++++++++++----------------------------
 arch/arm/dts/stm32h743i-disco-u-boot.dtsi      |   8 ------
 arch/arm/dts/stm32h743i-disco.dts              |  76 ++++++++++++++++++++++++++++----------------------------
 arch/arm/dts/stm32h743i-eval-u-boot.dtsi       |   9 -------
 arch/arm/dts/stm32h743i-eval.dts               |  42 ++++++++++++++++++++++++++++++-
 arch/arm/dts/stm32mp157-pinctrl.dtsi           |  59 ++++++++++++++++++++++++++++++++++++++++----
 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi |   5 +++-
 arch/arm/dts/stm32mp157a-dk1.dts               | 129 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi       |   5 +++-
 arch/arm/dts/stm32mp157c-ed1.dts               |  51 +++++++++++++++++++++++++++++++++++---
 arch/arm/dts/stm32mp157c-ev1.dts               |   3 ++-
 arch/arm/dts/stm32mp157c.dtsi                  |  26 ++++++++++++++++++++
 board/st/stm32mp1/README                       | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 board/st/stm32mp1/stm32mp1.c                   | 164 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 configs/stih410-b2260_defconfig                |   1 +
 configs/stm32mp15_basic_defconfig              |   6 +++++
 configs/stm32mp15_optee_defconfig              |   6 +++++
 configs/stm32mp15_trusted_defconfig            |   6 +++++
 include/configs/stm32mp1.h                     |  42 +++++++++++++++++++++++++++++--
 include/dt-bindings/clock/stm32fx-clock.h      |   9 ++++---
 include/dt-bindings/mfd/st,stpmic1.h           |   4 +++
 include/dt-bindings/mfd/stm32f7-rcc.h          |   1 +
 include/dt-bindings/mfd/stm32h7-rcc.h          |   2 +-
 38 files changed, 1014 insertions(+), 538 deletions(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
