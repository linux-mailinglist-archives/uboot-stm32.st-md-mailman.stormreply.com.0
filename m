Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E25481B2AB8
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:11:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E7C7C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:11:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31498C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:11:49 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF90U3030173; Tue, 21 Apr 2020 17:11:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Kg3cwMKFXMhUg4DooFzDMiwKBJCXASMOcTqsahll2T4=;
 b=T6CPMvd3G4o5C2LIqAKWMAMdyry4soBtaGNk/Ydm3kcc/avc1O/grQoy8tgEIF/rzD1g
 Lz5+XyKEWmuHX1MrrhPwUVHPmKi57kqhuj6nKSP8hb2Ql7QRQofJraScjA+eSY0XVdJ7
 0Wk5U3IRxtW5WcxAZOwfF6jRxgZFs1YjdbGMQNLIZOhm7B+SqfTFhTuSqb1BDC580Jgi
 zL3t0CNNx3gllDAAv2n5YjHuPv3uQbratAbyLU0p9wHbX7rWO7yHkG0F16l/2bTGUD2+
 40Mqo3h1/fd4ebv4HRY5/vYN+xD9dXP6Qlg61IiAiNXssbLVZ7TWtmLA7rvRWS/s7VbS YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqaw8ufc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F9FE10002A;
 Tue, 21 Apr 2020 17:11:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 136252B187B;
 Tue, 21 Apr 2020 17:11:45 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:44 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:19 +0200
Message-ID: <20200421151128.18072-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Wolfgang Denk <wd@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 0/9] stm32mp1: use OPP information for PLL1
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



Marek Vasut (1):
  ARM: stm32: Add board_early_init_f() to SPL

Patrick Delaunay (8):
  arm: stm32mp: spl: add bsec driver in SPL
  ARM: dts: stm32: add cpufreq support on stm32mp15x
  board: st: create common file stpmic1.c
  stm32mp1: clk: configure pll1 with OPP
  arm: stm32mp: add weak function to save vddcore
  board: st: stpmic1: add function stmpic_buck1_set
  board: stm32mp1: update vddcore in SPL
  ARM: dts: stm32mp1: use OPP information for PLL1 settings in SPL

 arch/arm/dts/stm32mp15-u-boot.dtsi            |  12 +-
 arch/arm/dts/stm32mp151.dtsi                  |  21 ++
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |   9 -
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |   9 -
 arch/arm/dts/stm32mp157c-ed1.dts              |   8 +
 arch/arm/dts/stm32mp15xx-dkx.dtsi             |   8 +
 arch/arm/mach-stm32mp/Makefile                |   2 +-
 arch/arm/mach-stm32mp/bsec.c                  |  11 +-
 .../arm/mach-stm32mp/include/mach/sys_proto.h |   3 +
 arch/arm/mach-stm32mp/spl.c                   |  11 +
 board/dhelectronics/dh_stm32mp1/Makefile      |   2 +-
 board/st/common/Makefile                      |   1 +
 board/st/common/stpmic1.c                     | 186 +++++++++++
 board/st/common/stpmic1.h                     |   6 +
 board/st/stm32mp1/board.c                     | 158 ----------
 board/st/stm32mp1/spl.c                       |  20 ++
 .../clock/st,stm32mp1.txt                     |   4 +
 drivers/clk/clk_stm32mp1.c                    | 295 ++++++++++++++++--
 18 files changed, 554 insertions(+), 212 deletions(-)
 create mode 100644 board/st/common/stpmic1.c
 create mode 100644 board/st/common/stpmic1.h

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
