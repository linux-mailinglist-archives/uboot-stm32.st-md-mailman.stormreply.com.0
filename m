Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 823314E8D0
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:22:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CCCCC9FE98
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:22:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2AE2C9FE92
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:22:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDH1nx004162; Fri, 21 Jun 2019 15:22:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3UlX/PBWDTOrzx4W34gEuV36SKvX45EP6uZcLl+iIcU=;
 b=R/NWzVs0c3VFF8nygKX/uVOZ081j3yE22sT3Cm7/bFOvWEVQrlKXKu/fuhwrJKDTNV7G
 8xrLv5YKaO6Ce7IF5qeU5vfoQ27i77wNP0c2zt8Nsp6MSZlbJ32X1muWB4H6h6g4CVbX
 w69Gobf8dd10ZUxJ2LSZ56yGlTFzIwzHfidQQiGB7UuYdHERMJvmpy2iIk4bVXOuNji0
 49EdJNbYS1PgFIj8oYkKJ8rtqImGfqWRGoKs3npI5NyCNH3gb/JYLJOnovxY++sNVJ1L
 x7NOJqwjpSnGnSloC5PUrMyYk2PLBowAKeRwlQ1xiHvRgXdnKs/Rj7T6wThjhB9QqFRw cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781v7nqc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:22:07 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7BBA31;
 Fri, 21 Jun 2019 13:22:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B660C2A2E;
 Fri, 21 Jun 2019 13:22:05 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:22:05 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:22:05
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:21:38 +0200
Message-ID: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 00/16] stm32m1 patches for v2017.10
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


Some remaining patches for stm32mp1
- some cleanup in files
- add 2 specific commands for stm32mp1 board
- use OF_SYSTEM_SETUP to update kernel device tree
- synchronization with latest device tree



Patrick Delaunay (16):
  stm32mp1: deactivate WATCHDOG in defconfig
  stm32mp1: call regulators_enable_boot_on in board_init
  stm32mp1: syscon: remove etzpc support
  stm32mp1: syscon: remove stgen
  dt-bindings: pinctrl: stm32: add new entry for package information
  stm32mp1: export get_cpu_package function
  stm32mp1: update package information in device tree
  stm32mp1: update device tree with ETZPC status
  stm32mp1: add stboard command
  stm32mp1: key: add stm32key command
  stm32mp1: udpate README
  stm32mp1: cosmetic: remove unnecessary include
  stm32mp1: configs: Add CONFIG_OF_SPL_REMOVE_PROPS
  stm32mp1: add check for presence of environment in boot device
  stm32mp1: force boot_net_usb_start
  ARM: dts: stm32mp1: sync device tree with v5.2-rc4

 arch/arm/Kconfig                                   |   1 +
 arch/arm/dts/stm32mp15-ddr.dtsi                    |   2 +-
 arch/arm/dts/stm32mp157-pinctrl.dtsi               | 270 ++++++++++++++++++++-
 arch/arm/dts/stm32mp157-u-boot.dtsi                |  67 ++---
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi           |   4 -
 arch/arm/dts/stm32mp157a-dk1.dts                   |  30 ++-
 arch/arm/dts/stm32mp157c-dk2.dts                   |   1 +
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi           |  15 +-
 arch/arm/dts/stm32mp157c-ed1.dts                   | 205 ++++------------
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi           |   4 -
 arch/arm/dts/stm32mp157c-ev1.dts                   |  12 +-
 arch/arm/dts/stm32mp157c.dtsi                      | 199 +++++++++++----
 arch/arm/mach-stm32mp/Kconfig                      |  15 ++
 arch/arm/mach-stm32mp/Makefile                     |   2 +
 arch/arm/mach-stm32mp/cmd_stm32key.c               | 101 ++++++++
 arch/arm/mach-stm32mp/cpu.c                        |   7 +-
 arch/arm/mach-stm32mp/fdt.c                        | 223 +++++++++++++++++
 arch/arm/mach-stm32mp/include/mach/stm32.h         |   3 +-
 arch/arm/mach-stm32mp/include/mach/sys_proto.h     |   9 +
 arch/arm/mach-stm32mp/syscon.c                     |   2 -
 board/st/stm32mp1/Kconfig                          |   7 +
 board/st/stm32mp1/Makefile                         |   1 +
 board/st/stm32mp1/README                           |  15 +-
 board/st/stm32mp1/cmd_stboard.c                    | 145 +++++++++++
 board/st/stm32mp1/spl.c                            |   1 -
 board/st/stm32mp1/stm32mp1.c                       |   4 +
 configs/stm32mp15_basic_defconfig                  |   3 +-
 configs/stm32mp15_trusted_defconfig                |   2 -
 .../pinctrl/st,stm32-pinctrl.txt                   | 101 +++++++-
 drivers/clk/clk_stm32mp1.c                         |   3 +-
 include/configs/stm32mp1.h                         |   7 +-
 include/dt-bindings/pinctrl/stm32-pinfunc.h        |   6 +
 32 files changed, 1158 insertions(+), 309 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32key.c
 create mode 100644 arch/arm/mach-stm32mp/fdt.c
 create mode 100644 board/st/stm32mp1/cmd_stboard.c

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
