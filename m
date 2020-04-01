Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F53919ABED
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 14:43:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC1CEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 12:43:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53F20C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 12:43:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031ChL4I028417; Wed, 1 Apr 2020 14:43:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=Oet/UFZ6h2jhOPzD3ZHJ/Pk9N4X9SGcNqt6f+/6BtPU=;
 b=WVl5saJcnFYtCDsDuyeqE7jax8tDoNh0yl8T2/UODDaWGlwQIuVMfQ3QbdCt/Icwfo5j
 w7QYLD0kKkb6HfdPEVr9wPwQUTUB8WKj/CTp7/2DFcQelJw8hdJpJcdqOvXRytruL0Rz
 IexL3Cz82pBhFkPbjXcjUbK/VeSz6VvyQxJw8tSlfzlexy/aJrZlz+Nhr8av8ikSdCmE
 Ly2pM3IGAE5+UsAh08z+5pwSPE53KPkMX0ZA3+w2AYZFPNnq/L0afTTD1JN+qjsyqdIU
 BTBdpGwT7mUsL+4EHpRvw2/UfsVdEBdV4K4c3WCwegQeuXEtDSE6uk1ZJS0XToUNwVoB hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301vkdwk4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 14:43:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B06FD100039;
 Wed,  1 Apr 2020 14:43:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 98D022AD2A3;
 Wed,  1 Apr 2020 14:43:45 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Apr
 2020 14:43:45 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 14:43:44 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm/master =u-boot-stm32-20200401
Thread-Index: AdYIISf/k7RYXLUkRVyag6E0RcVUiQ==
Date: Wed, 1 Apr 2020 12:43:44 +0000
Message-ID: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm/master
	=u-boot-stm32-20200401
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

Please pull the latest STM32 master bugfix for v2020.04 = u-boot-stm32-20200401

With the following changes:
- Fix device tree of Avenger96 board from Arrow Electronics and add
  compatibility with stm32mp15_dhcom_basic_defconfig

CI status: Failed for vexpress_ca9x4 test.py
     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2592

But local compilation is OK with buildman on stm32 targets.
I think it is enough as the Marek's patches only update the dh board code and the AV96 device tree.

Thanks,
Patrick

The following changes since commit af827140e5965e5bb2bcad1c53ca8419b428ff6d:

  vexpress_ca9x4: Enable use of correct DTB file and restore EFI loader. (2020-03-23 16:11:46 -0400)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20200401

for you to fetch changes up to 2f3c4b8a0f303edbea9fc112a49e546cf03776b0:

  ARM: dts: stm32: Repair PMIC configuration on AV96 (2020-04-01 11:58:00 +0200)

----------------------------------------------------------------
- Fix device tree of Avenger96 board from Arrow Electronics and add
  compatibility with stm32mp15_dhcom_basic_defconfig

----------------------------------------------------------------
Marek Vasut (12):
      ARM: dts: stm32: Repair SD1 pre-reloc pinmux DT node on AV96
      ARM: dts: stm32: Add alternate pinmux for SDMMC1 direction pins
      ARM: dts: stm32: Repair SDMMC1 operation on AV96
      ARM: dts: stm32: Add alternate pinmux for SDMMC2 pins 4-7
      ARM: dts: stm32: Repair SDMMC2 operation
      ARM: dts: stm32: Add QSPI NOR on AV96
      ARM: dts: stm32: Use DT alias for the configuration EEPROM
      ARM: dts: stm32: Add configuration EEPROM on AV96
      ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
      ARM: dts: stm32: Repair ethernet operation on AV96
      ARM: dts: stm32: Add missing ethernet PHY reset on AV96
      ARM: dts: stm32: Repair PMIC configuration on AV96

 arch/arm/dts/stm32mp157-pinctrl.dtsi           | 96 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi |  9 ++--
 arch/arm/dts/stm32mp157a-avenger96.dts         | 79 ++++++++++++++++++++++++++++-----
 arch/arm/dts/stm32mp15xx-dhcom.dtsi            |  6 ++-
 board/dhelectronics/dh_stm32mp1/board.c        | 15 +++----
 5 files changed, 182 insertions(+), 23 deletions(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
