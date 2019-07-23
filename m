Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E6712AD
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jul 2019 09:20:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E574CEF054
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jul 2019 07:20:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03740CEF052
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 07:20:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6N7JxPa010724; Tue, 23 Jul 2019 09:20:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=BW9sNsJCSlnO8stQUHSBaARzbn+kaV6vw2Bs344JP1I=;
 b=nnhdi8coUQMbQ2rHomAn9iQPdFn+ajJSBNhXtIM1/et/gbfz05Rtklh7nEV4y5zpxwjd
 1zxjZ+ZcRbmFhW0aAsr0WBpPylEO3LPy4EO+pYAmOWRjT4SuN8iED4XZG3DyNSNbcPxw
 t6tjPOQOAwgHY3KsSHlLsKs+sCdpBzExF8JgF14rsnJAC6kkPSOTKFWb8TGDjM6qU0JT
 WLfNVOk59AuRTNHt25xmA5Mmo83LhNxmgWdNFN6EY72wpeNYVfanLeSCVTG/qYsk+dxB
 PXf2rn0IH6y3ujjJwq/KWty/V3Y2Z2O/fDIH71kHVRsjj4Rf4wL4wpUNbzEQCsJ0uiep fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tur39g5s2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 23 Jul 2019 09:20:51 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2AD63F;
 Tue, 23 Jul 2019 07:20:50 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88C35168E;
 Tue, 23 Jul 2019 07:20:50 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 23 Jul
 2019 09:20:50 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 23 Jul 2019 09:20:49 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
Thread-Topic: [PULL] u-boot-stm32/master for v2019.10-rc1:
 u-boot-stm32-20190723
Thread-Index: AdVBJQUz4vNsqVRGSZWSHfR3brrN0Q==
Date: Tue, 23 Jul 2019 07:20:49 +0000
Message-ID: <9e663e333ec0431793ca5d2a5d20c659@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] u-boot-stm32/master for v2019.10-rc1:
	u-boot-stm32-20190723
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

please pull the STM32 related patches for v2019.10-rc1 = u-boot-stm32-20190723

Travis CI status:
	https://travis-ci.org/patrickdelaunay/u-boot/builds/562084625
	the warnings are not related to the patchsets.

Thanks,
Patrick

The following changes since commit 0de815356474912ef5bef9a69f0327a5a93bb2c2:

  Merge branch '2019-07-17-master-imports' (2019-07-18 11:31:37 -0400)

are available in the git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20190723

for you to fetch changes up to 1f99eaff08f699472860c82480344e824a737d57:

  rtc: Add rtc driver for stm32mp1 (2019-07-22 11:04:52 +0200)

----------------------------------------------------------------
- add rtc driver for stm32mp1
- add remoteproc driver for stm32mp1
- use kernel qspi compatible string for stm32

----------------------------------------------------------------
Fabien Dessenne (6):
      dm: core: Introduce xxx_translate_dma_address()
      remoteproc: fix function headers
      remoteproc: add device_to_virt ops
      remoteproc: add elf file load support
      remoteproc: Introduce STM32 Cortex-M4 remoteproc driver
      MAINTAINERS: Add stm32 remoteproc driver

Patrice Chotard (4):
      ARM: dts: stm32: Use kernel qspi compatible string for stm32f7-uboot.dtsi
      ARM: dts: stm32: Use kernel qspi compatible string for stm32f469-disco-uboot.dtsi
      spi: stm32_qspi: Remove "st, stm32-qspi" compatible string
      doc: device-tree-bindings: alignment with v5.2-rc6 for spi-stm32-qspi.txt

Patrick Delaunay (3):
      configs: stm32mp15: enable stm32 remoteproc
      clk: stm32mp1: Add RTC clock entry
      rtc: Add rtc driver for stm32mp1

 MAINTAINERS                                     |   1 +
 arch/arm/dts/stm32f469-disco-u-boot.dtsi        |   2 +-
 arch/arm/dts/stm32f7-u-boot.dtsi                |   2 +-
 arch/sandbox/dts/test.dts                       |   4 +
 common/fdt_support.c                            |   6 ++
 configs/stm32mp15_basic_defconfig               |   3 +
 configs/stm32mp15_optee_defconfig               |   3 +
 configs/stm32mp15_trusted_defconfig             |   3 +
 doc/device-tree-bindings/spi/spi-stm32-qspi.txt |  71 +++++++++---------
 drivers/clk/clk_stm32mp1.c                      |   9 +++
 drivers/core/of_addr.c                          |   4 +
 drivers/core/ofnode.c                           |   8 ++
 drivers/core/read.c                             |   5 ++
 drivers/remoteproc/Kconfig                      |  10 +++
 drivers/remoteproc/Makefile                     |   3 +-
 drivers/remoteproc/rproc-elf-loader.c           | 106 ++++++++++++++++++++++++++
 drivers/remoteproc/sandbox_testproc.c           |  19 +++++
 drivers/remoteproc/stm32_copro.c                | 257 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/rtc/Kconfig                             |   6 ++
 drivers/rtc/Makefile                            |   1 +
 drivers/rtc/stm32_rtc.c                         | 323 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/spi/stm32_qspi.c                        |   1 -
 include/dm/of_addr.h                            |  18 +++++
 include/dm/ofnode.h                             |  16 +++-
 include/dm/read.h                               |  20 ++++-
 include/fdt_support.h                           |  24 ++++++
 include/remoteproc.h                            | 146 ++++++++++++++++++++++++++----------
 test/dm/remoteproc.c                            | 122 ++++++++++++++++++++++++++++++
 test/dm/test-fdt.c                              |  12 +++
 29 files changed, 1127 insertions(+), 78 deletions(-)
 create mode 100644 drivers/remoteproc/rproc-elf-loader.c
 create mode 100644 drivers/remoteproc/stm32_copro.c
 create mode 100644 drivers/rtc/stm32_rtc.c
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
