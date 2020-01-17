Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666E140EC5
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 17:17:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE2EAC36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 16:17:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85048C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 16:17:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HG8T8M027958; Fri, 17 Jan 2020 17:17:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=zhtjc3miCeDvcOATvbqyyXPibtIeP8UrtC0v8VAEhO4=;
 b=nksIECr1lyzSay1uYx5umBt4etlIg4NbKYlA/viuroEZ/9MNGIKhMIEOEsTTgtBmGlxR
 vkO1ZUFLJmifvkf0BuPmF2v2iPyy16c7Aar+OBIhMQfWPGQPI7e6HyGHbdStqRh3D7PM
 LUhh+rl1+SNiahxLxc96RL/BQP5v7IUk+R7mRtfEq/xtn4e6bxCrKVzQ47QnBtl3IpB5
 jzvJSv23wANx/K9Ynew74XUPs7GbDl5aRaiH23hTz3VDEslIEu2UBK0x9uiPz7wS3v+w
 +kCqZAxAzL1VfpLP4Wp/EgwWe8QqB4D26ejyzFRwcwU+COT1eXmFr5STVg1GYOItazIb Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0rkcdf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 17:17:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B1E110002A;
 Fri, 17 Jan 2020 17:16:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C21C2FF5CF;
 Fri, 17 Jan 2020 17:16:57 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jan
 2020 17:16:57 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Jan 2020 17:16:57 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm32 u-boot-stm32-20200117
Thread-Index: AdXNUMfXeBOfI0pySTGbQKoXTxB5Zg==
Date: Fri, 17 Jan 2020 16:16:56 +0000
Message-ID: <2ee6127028ec4e94b070befc6240354e@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_04:2020-01-16,
 2020-01-17 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	u-boot-stm32-20200117
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

Please pull the first STM32 related patches for v2020.04

Gitlab CI status:
     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/1900

With the following fixes:
- stm32mp1: split SOC and board and cleanup config

It is a preliminary step for DH Electronics DHCOM SoM and PDK2 board

Thanks,
Patrick

git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20200117
The following changes since commit d7bb6aceb2e99a832efbb96f9bf480bf95602192:

  Merge tag 'mmc-1-16-2020' of https://gitlab.denx.de/u-boot/custodians/u-boot-mmc (2020-01-16 13:20:51 -0500)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20200117

for you to fetch changes up to db48e11b1eccf23f3f9ba26e886a798e74df6a01:

  ARM: dts: stm32: Add missing ETHCK clock to ethernet node (2020-01-17 16:26:42 +0100)

----------------------------------------------------------------
- stm32mp1: split SOC and board and cleanup config

----------------------------------------------------------------
Marek Vasut (4):
      ARM: stm32: Allow overriding setup_mac_address()
      stm32mp1: configs: Make all boot devices in distro boot conditional
      ARM: stm32: Fill in missing loadaddr
      ARM: dts: stm32: Add missing ETHCK clock to ethernet node

Patrick Delaunay (3):
      stm32mp1: move stboard command in board/st/common directory
      board: stm32mp1: move CONFIG_ENV_XXX in defconfig
      stm32mp1: split board and SOC support for STM32MP15x family

Thomas Hebb (1):
      stm32mp: remove redundant SYS_TEXT_BASE prompt

 arch/arm/dts/Makefile                          |  2 +-
 arch/arm/dts/stm32mp157c.dtsi                  |  2 ++
 arch/arm/mach-stm32mp/Kconfig                  | 37 ++++++++++++++++++++++++-------------
 arch/arm/mach-stm32mp/cpu.c                    |  2 +-
 arch/arm/mach-stm32mp/include/mach/sys_proto.h |  2 ++
 board/st/common/Kconfig                        |  7 +++++++
 board/st/common/MAINTAINERS                    |  6 ++++++
 board/st/common/Makefile                       |  6 ++++++
 board/st/{stm32mp1 => common}/cmd_stboard.c    |  3 +++
 board/st/stm32mp1/Kconfig                      | 20 ++------------------
 board/st/stm32mp1/Makefile                     |  1 -
 board/st/stm32mp1/stm32mp1.c                   |  2 +-
 configs/stm32mp15_basic_defconfig              |  4 +++-
 configs/stm32mp15_optee_defconfig              |  4 +++-
 configs/stm32mp15_trusted_defconfig            |  4 +++-
 include/configs/stm32mp1.h                     | 39 +++++++++++++++++++++++++++++++--------
 16 files changed, 95 insertions(+), 46 deletions(-)
 create mode 100644 board/st/common/Kconfig
 create mode 100644 board/st/common/MAINTAINERS
 create mode 100644 board/st/common/Makefile
 rename board/st/{stm32mp1 => common}/cmd_stboard.c (98%)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
