Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1E29593F
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Oct 2020 09:33:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3B29C3FAE0;
	Thu, 22 Oct 2020 07:33:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71B1AC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Oct 2020 07:33:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09M7WG3J016412; Thu, 22 Oct 2020 09:32:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=4RbGQYqyAOrQpfC92d27XWBQv8RZzOhc1z6A/ZCLRAY=;
 b=tpwnWJM/joBJyrVBsgCLtyVRhZz+qwrBLtXGY4P15fFpE3OVmlSZucKHGVPFUSb47FAA
 2+ye2pVJePGaOLWmJKDTd3enDDGOU52zaaUZ+lN4GehK+lh4yvp2oBYHGNzqQzoLfvyC
 WlWI8X1gFR2a3K+IiLrEH9rdXQqRcEYsNJjYIC1g853vkk1SZ3cz6oraEMP6LwbMw2+d
 U/owEwvMASTam3SM489SDwcNmuYnMirbJ+tYHDeofBiVWpB4USUEmMhjzFeKCURSoe1+
 4+B5/G9hBy2fDcL6mzDhkbeX92HcbG6fC48zUOSVX620sQN6T4lffdcAkcb/rUF60ooC Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34apedcg1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 09:32:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E202100034;
 Thu, 22 Oct 2020 09:32:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 677042B1739;
 Thu, 22 Oct 2020 09:32:53 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Oct
 2020 09:32:45 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Thu, 22 Oct 2020 09:32:45 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request for u-boot master  = u-boot-stm32-20201021
Thread-Index: AdaoRPgZsdyf9Rr+Rz+N/Cr4AnVSgA==
Date: Thu, 22 Oct 2020 07:32:44 +0000
Message-ID: <727b802f645e4e779ae5b6b3cd250e85@SFHDAG2NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_02:2020-10-20,
 2020-10-22 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master =
	u-boot-stm32-20201021
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

Please pull the STM32 related patches for u-boot/master, v2021.01: u-boot-stm32-20201021

- Activate CMD_EXPORTENV/CMD_IMPORTENV/CMD_ELF for STM32MP15 defconfig
- Fix stm32prog command: parsing of FlashLayout without partition
- Update MAINTAINERS for ARM STM STM32MP
- Manage eth1addr on dh board with KS8851
- Limit size of cacheable DDR in pre-reloc stage in stm32mp1
- Use mmc_of_parse() to read host capabilities in mmc:sdmmc2 driver

CI status:
    https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/5066

Thanks,
Patrick

git request-pull origin/mastert https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20201021

The following changes since commit 7ec87e4192215815b658c3f8b34e4be010103149:

  Merge tag 'u-boot-atmel-2021.01-b' of https://gitlab.denx.de/u-boot/custodians/u-boot-atmel (2020-10-19 09:29:05 -0400)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20201021

for you to fetch changes up to 53de79fecc53338b544b4d2c2d88daba9d82b007:

  stm32mp: stm32prog: accept device without partition (2020-10-21 18:12:20 +0200)

----------------------------------------------------------------
- Activate CMD_EXPORTENV/CMD_IMPORTENV/CMD_ELF for STM32MP15 defconfig
- Fix stm32prog command: parsing of FlashLayout without partition
- Update MAINTAINERS for ARM STM STM32MP
- Manage eth1addr on dh board with KS8851
- Limit size of cacheable DDR in pre-reloc stage in stm32mp1
- Use mmc_of_parse() to read host capabilities in mmc:sdmmc2 driver

----------------------------------------------------------------
Alexandru Gagniuc (2):
      mmc: mmc_of_parse: Enable 52 MHz support with "cap-mmc-highspeed"
      mmc: stm32_sdmmc2: Use mmc_of_parse() to read host capabilities

Marek Vasut (1):
      ARM: dts: stm32: Do not set eth1addr if KS8851 has EEPROM

Patrick Delaunay (8):
      stm32mp: limit size of cacheable DDR in pre-reloc stage
      arm: stm32: cleanup arch gpio.h
      MAINTAINERS: Add stm32 and stm regexp for ARM STM STM32MP platform
      MAINTAINERS: Add STM32MP1 RNG driver in stm32mp platform
      configs: stm32mp15: activate CMD_IMPORTENV
      configs: stm32mp15: activate CMD_EXPORTENV
      configs: stm32mp15: activate CMD_ELF
      stm32mp: stm32prog: accept device without partition

 MAINTAINERS                                     |  3 ++
 arch/arm/include/asm/arch-stm32/gpio.h          | 37 ++---------------------
 arch/arm/mach-stm32mp/Kconfig                   | 13 ++++++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c |  3 +-
 arch/arm/mach-stm32mp/cpu.c                     |  3 +-
 arch/arm/mach-stm32mp/include/mach/gpio.h       | 37 ++---------------------
 arch/arm/mach-stm32mp/spl.c                     |  3 +-
 board/dhelectronics/dh_stm32mp1/board.c         | 40 ++++++++++++++++++++++---
 configs/stm32mp15_basic_defconfig               |  3 --
 configs/stm32mp15_trusted_defconfig             |  3 --
 drivers/gpio/stm32_gpio.c                       |  2 ++
 drivers/mmc/mmc-uclass.c                        |  2 +-
 drivers/mmc/stm32_sdmmc2.c                      | 18 ++---------
 13 files changed, 66 insertions(+), 101 deletions(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
