Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A11E0B95
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 12:20:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53AD8C36B2B
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 10:20:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D183C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 10:19:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAHqrR009285; Mon, 25 May 2020 12:19:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+lMbJ9Dhf/rH0vqrtgIYnhlMc5ORfu5IEoGUST4sqJY=;
 b=Yd+kWvcHbx/hlgxZX1yM/mCFkt1vOqE8ldX3XS7/WpkJ+PHT3+nazg+1x7HHuGc/WW47
 MYTvKjMz+NJIBzP5vGKsi6kaFQt3sfaF2EUQjzOo/59QUSWjKL0/kG9SutQMPShnCx2H
 9AwOe+hk9fj3buRiRchqBQIk4n5L25XKOwDer1jxAcYwaOc/TrPDBaT8Cqyt3g7l9m09
 A9uCCLHhmHyvtPRVg0iEr3VsHP43q73vp5YslWhHsyJhq/bJ2zAb04Uhp+i0bPLI78Sx
 772EWeptL8FsqbwgyRQMGF/fmD7ZJeD7Td5+Y+gE408urDbnoePwB5nJ8vr+zTTkWil9 OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316skw1r8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 12:19:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33B9A10002A;
 Mon, 25 May 2020 12:19:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CAEC20B847;
 Mon, 25 May 2020 12:19:54 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 May 2020 12:19:53 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 May 2020 12:19:40 +0200
Message-ID: <20200525101949.15944-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-25,
 2020-05-25 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 0/9] stm32mp1: use OPP information for PLL1
	settings in SPL
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


This serie allows to switch the CPU frequency to the max frequency
supported in OPP device tree nodes and supported by STM32MP SOC
(800MHz is supported by STM32MP15xD and STM32MP15xF).

Board also increases the VDDCore voltage to support this new
operation point.

This V2 version of [1] is rebased on top of custodian stm32 and solve
issue with dh_stm32mp1 (because spl.c was shared between stm32mp1 and
dh_stm32mp1).

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=171767&state=*


Changes in v2:
- add stpmic1_init function, called in board_early_init_f for
  dh_stm32mp1 board support (and no more use spl.c from stm32mp1)
- remove CONFIG_SPL_BOARD_INIT
- stmpic_buck1_set is a static function called in stpmic1_init
  (with new parameter for vddcore value)
- update also dh_stm32mp1 board
- update stm32mp15xx-dhcor and dhcom device tree
- NEW: merge spl.c and board.c to avoid a file with only one function

Patrick Delaunay (9):
  arm: stm32mp: spl: add bsec driver in SPL
  ARM: dts: stm32: add cpufreq support on stm32mp15x
  board: st: create common file stpmic1.c
  stm32mp1: clk: configure pll1 with OPP
  arm: stm32mp: add weak function to save vddcore
  board: st: stpmic1: add function stpmic1_init
  board: stm32mp1: update vddcore in SPL
  ARM: dts: stm32mp1: use OPP information for PLL1 settings in SPL
  board: stm32mp1: move the function board_debug_uart_init in spl.c

 arch/arm/dts/stm32mp15-u-boot.dtsi            |  12 +-
 arch/arm/dts/stm32mp151.dtsi                  |  21 ++
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |   9 -
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |   9 -
 arch/arm/dts/stm32mp157c-ed1.dts              |   8 +
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi    |   9 -
 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi    |   9 -
 arch/arm/dts/stm32mp15xx-dkx.dtsi             |   8 +
 arch/arm/mach-stm32mp/Kconfig                 |   1 -
 arch/arm/mach-stm32mp/Makefile                |   2 +-
 arch/arm/mach-stm32mp/bsec.c                  |  11 +-
 .../arm/mach-stm32mp/include/mach/sys_proto.h |   3 +
 board/dhelectronics/dh_stm32mp1/Makefile      |   6 +-
 board/dhelectronics/dh_stm32mp1/board.c       |  10 +
 board/st/common/Makefile                      |   1 +
 .../st/{stm32mp1/board.c => common/stpmic1.c} |  82 +++--
 board/st/common/stpmic1.h                     |   6 +
 board/st/stm32mp1/Makefile                    |   2 -
 board/st/stm32mp1/spl.c                       |  72 +++--
 board/st/stm32mp1/stm32mp1.c                  |   6 +
 configs/stm32mp15_basic_defconfig             |   1 +
 .../clock/st,stm32mp1.txt                     |   4 +
 drivers/clk/clk_stm32mp1.c                    | 295 ++++++++++++++++--
 23 files changed, 445 insertions(+), 142 deletions(-)
 rename board/st/{stm32mp1/board.c => common/stpmic1.c} (74%)
 create mode 100644 board/st/common/stpmic1.h

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
