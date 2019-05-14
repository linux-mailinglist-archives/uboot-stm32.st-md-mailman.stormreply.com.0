Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A71CB3E
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 May 2019 16:59:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 364DFC35E03
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 May 2019 14:59:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87B77C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 14:59:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EEpg4a000811; Tue, 14 May 2019 16:59:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dHLYbW5RTExCApWz8Ng3zaHNk903d75xhD/jYPeBe2c=;
 b=KkWUmtLmTIG+yGXfDWcWSY/ogguFXcG0tClAmWlt19L9mSvn4SQWqK3F1jdBLggV7yGB
 hDmKyftHlz9rE3HB50mqDaK84G0uREI6sUcmcniT/bRudjITtBjOz9C34LESTbxwBDWk
 89L0srpBcRWrjPG7L6hwWlIb26+DDJiktn9j7yipNSEGDOTj6/7yb6PwA85gi57AkXrR
 83oZuA90ljllmSPtWUbFiRLe6BsOOKBYQ63o8Hknyf7i7z1nSKnhcRwOuZTPYA9PyULI
 8P5BcbXbAFXmLieMfAuUdUTFCvkQvlJrY9hUGnvTv2S14F8uoO8P2IW6M65hVIpZ9bN1 sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkuyt14a-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 May 2019 16:59:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7542F38;
 Tue, 14 May 2019 14:59:08 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56D122897;
 Tue, 14 May 2019 14:59:08 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 May
 2019 16:59:07 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Tue, 14 May 2019 16:59:07 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
Thread-Topic: =?utf-8?B?W1UtQm9vdF1bUFVMTF0gdS1ib290LXN0bTMyIGZvciB2MjAxOS4wN+KAiyAo?=
 =?utf-8?B?cm91bmQgMynigIs=?=
Thread-Index: AQHVCmWU5RjosIL6qEqHAn6SQT39vg==
Date: Tue, 14 May 2019 14:59:07 +0000
Message-ID: <13952811-6309-c39e-1251-8dcd2c15cdc6@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <A0677E103777DB42BB20C2933EFB2DBB@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] =?utf-8?q?=5BU-Boot=5D=5BPULL=5D_u-boot-stm32_for_v?=
 =?utf-8?b?MjAxOS4wN+KAiyAocm91bmQgMynigIs=?=
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

Please find the pull request for STM32 round 3

The following changes since commit a69120a0d7c8d4044cdaceea9eb03913ba4e49c7:

  Prepare v2019.07-rc1 (2019-04-29 21:54:04 -0400)

are available in the git repository at:

  https://github.com/pchotard/u-boot.git tags/u-boot-stm32-mcu-20190514

for you to fetch changes up to 1aaac8e60042b1e132f84184cfd9aa0f1a4afdde:

  configs: stm32f469-disco: Disable PINCTRL_FULL flag (2019-05-06
11:15:16 +0200)

----------------------------------------------------------------
STM32 MCUs update:
_ Add MPU region for SPI NOR memory mapped region
_ Add missing QSPI flash compatible for STM32 F7 boards
_ Update spi-tx-bus-width and spi-rx-bus-width properties
_ Add QSPI support for STM32F469 Discovery board

----------------------------------------------------------------
Patrice Chotard (12):
      mach-stm32: Add MPU region for spi-nor memory mapped region
      ARM: dts: stm32: Fix qspi memory map size for stm32f7 boards
      ARM: dts: stm32: add qspi flash compatible string for stm32f769-disco
      ARM: dts: stm32: add qspi flash compatible string for stm32f746-eval
      ARM: dts: stm32: Set spi-rx/tx-bus-width to 4 for stm32f746-eval
      ARM: dts: stm32: Set spi-rx/tx-bus-width to 4 for stm32f746-disco
      ARM: dts: stm32: Remove useless spi-nor compatible string
      ARM: dts: stm32: Set spi-rx/tx-bus-width to 4 for stm32f769-disco
      ARM: dts: stm32: Add qspi support for stm32f469-disco board
      spi: Kconfig: Add STM32F4 support for STM32_QSPI driver
      configs: stm32f469-disco: Enable QSPI relative flags
      configs: stm32f469-disco: Disable PINCTRL_FULL flag

 arch/arm/dts/stm32746g-eval-u-boot.dtsi  |  6 +++--
 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 39
++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32f746-disco-u-boot.dtsi |  8 +++----
 arch/arm/dts/stm32f769-disco-u-boot.dtsi |  3 +++
 arch/arm/mach-stm32/soc.c                |  3 +++
 configs/stm32f469-discovery_defconfig    |  9 ++++++++
 drivers/spi/Kconfig                      |  2 +-
 7 files changed, 63 insertions(+), 7 deletions(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
