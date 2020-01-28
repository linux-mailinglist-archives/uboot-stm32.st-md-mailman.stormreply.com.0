Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3BB14B190
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 10:11:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBA42C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:11:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7EAEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:11:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S98Abi024277; Tue, 28 Jan 2020 10:11:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=68bCFdv4oLq3TPrCXr+jqNajFBgUbvB45hm5aryUj4A=;
 b=tPxUdspCqyx3knbbtFuEedkq9U/443UWA4jXWYtP8rwCjOGAQPwZN9GNxiUX6/U0Rumo
 +9cW0lQ41JLkzhx5WI3GT86q72LFoU+tytvwnneIR1kkJTO2qg0oHWOGugtJ4R1aIzrO
 2aJpsZO5QIKSTm5ojYnseXDR8gCyea0ifiblA4sYRuMWEHvsDMth/7G+bsKzH+P7ZDyJ
 F0R92qf+RQjHfd67MTjQ1ff0YH3hRPynSQqexXPhLKalwRG8WPXIBIz1lIjXmCvnB8tL
 KACsfmnZu6CIJr8EOE0uIaxHKKKgzoWFouzBmSZVXwitC/iA6R7KAFu6abuB76Eh3NdQ vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrc134y87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:11:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03A2B100034;
 Tue, 28 Jan 2020 10:11:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFF07212A3F;
 Tue, 28 Jan 2020 10:11:22 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:11:22 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 10:10:57 +0100
Message-ID: <20200128091106.28552-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/9] stm32mp1 devicetre-tree and board update
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


This serie provides the device tree resync with Kernel 5.4-rc5,
solves some dtc compilation issue for U-Boot addon
and some minor update in stm32mp1 board (documentation and
support of revZ).



Antonio Borneo (1):
  ARM: dts: stm32mp1: move FDCAN to PLL4_R

Patrick Delaunay (8):
  ARM: dts: stm32mp1: DT alignment with kernel v5.4
  stm32mp1: pwr: use the last binding for pwr
  ARM: dts: stm32mp1: DT alignment with kernel v5.5-rc7
  ARM: dts: stm32mp1: correct ddr node
  ARM: dts: stm32m1: add reg for pll nodes
  board: stm32mp1: update readme
  doc: add board documentation for stm32mp1
  stm32mp1: support of STM32MP15x Rev.Z

 arch/arm/dts/stm32mp15-ddr.dtsi               |   2 +-
 arch/arm/dts/stm32mp157-pinctrl.dtsi          |  31 +-
 arch/arm/dts/stm32mp157-u-boot.dtsi           |   4 +-
 .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi |  10 +-
 arch/arm/dts/stm32mp157a-avenger96.dts        |  11 +-
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |  27 +-
 arch/arm/dts/stm32mp157a-dk1.dts              |  73 ++-
 arch/arm/dts/stm32mp157c-dk2.dts              |  13 +
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |  10 +-
 arch/arm/dts/stm32mp157c-ed1.dts              |  28 +-
 arch/arm/dts/stm32mp157c-ev1.dts              |   8 +-
 arch/arm/dts/stm32mp157c.dtsi                 |  48 +-
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi    |  10 +-
 arch/arm/dts/stm32mp15xx-dhcom.dtsi           |   8 +-
 arch/arm/mach-stm32mp/cpu.c                   |   3 +
 arch/arm/mach-stm32mp/include/mach/stm32.h    |   1 -
 .../arm/mach-stm32mp/include/mach/sys_proto.h |   1 +
 arch/arm/mach-stm32mp/pwr_regulator.c         |  23 +-
 arch/arm/mach-stm32mp/syscon.c                |   1 -
 board/st/stm32mp1/README                      | 504 +--------------
 doc/board/index.rst                           |   1 +
 doc/board/st/index.rst                        |   9 +
 doc/board/st/stm32mp1.rst                     | 598 ++++++++++++++++++
 .../clock/st,stm32mp1.txt                     |  32 +-
 .../mtd/stm32-fmc2-nand.txt                   |   6 +-
 25 files changed, 845 insertions(+), 617 deletions(-)
 create mode 100644 doc/board/st/index.rst
 create mode 100644 doc/board/st/stm32mp1.rst

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
