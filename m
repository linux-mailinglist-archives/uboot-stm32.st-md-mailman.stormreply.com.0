Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C87139382
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 15:18:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC116C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 14:18:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5627DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 14:18:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DECX8I022452; Mon, 13 Jan 2020 15:17:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=V4a0uBeqqxJF2FIVFUF8yNW7Mofyfb8AzKG73/LXPyk=;
 b=s69V/LZN7RocKY5i1r2yCPpgJkueSaL7/+CdDp2d5hRMfKaDB8TBo1rNmEo/aKlZcp8O
 wFIxBBhD3Sv6fUatR5c4KhuCpIiEysx0OLkIi7svGT9rPb1Yse1k7kmscvU8At5s7XF6
 bMAaNUb7nuA+pu70nXd1ZUD4UbLXTMPdp9SDxxbkvDrDb5ES/JlcE6YWJh+bOqPanUrp
 LEcXQ+BtT6+uXeJDrSKM/rU/9KwXRYJOTciV15b8L72KTjrpHzoFH/BTeesQ3csMng0z
 dYvHWSQpyd5Hz61BWp4Xke8BRUmnTIltLTdEFDaRrA8dXGK7BDOd2YnYE1pBBKF3Eyf3 Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78s0ffx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 15:17:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26657100045;
 Mon, 13 Jan 2020 15:17:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08DC12BE22F;
 Mon, 13 Jan 2020 15:17:46 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 15:17:45 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 15:17:39 +0100
Message-ID: <20200113141742.28182-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_04:2020-01-13,
 2020-01-13 signatures=0
Cc: Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/3] stm32mp1: split board and SOC support for
	STM32MP15x family
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


This serie prepare the introduction of boards with STM32MP15x SOC
not provided by STMicroelectronics.

I introduce two new CONFIG: one for SOC and one ST boards (EV1, DK1, DK2).
And also create a new directory board/st/common to manage part common
with all the board (today only command stboard).



Patrick Delaunay (3):
  stm32mp1: move stboard command in board/st/common directory
  board: stm32mp1: move CONFIG_ENV_XXX in defconfig
  stm32mp1: split board and SOC support for STM32MP15x family

 arch/arm/dts/Makefile                       |  2 +-
 arch/arm/mach-stm32mp/Kconfig               | 32 +++++++++++++++------
 board/st/common/Kconfig                     |  7 +++++
 board/st/common/MAINTAINERS                 |  6 ++++
 board/st/common/Makefile                    |  6 ++++
 board/st/{stm32mp1 => common}/cmd_stboard.c |  3 ++
 board/st/stm32mp1/Kconfig                   | 20 ++-----------
 board/st/stm32mp1/Makefile                  |  1 -
 board/st/stm32mp1/stm32mp1.c                |  2 +-
 configs/stm32mp15_basic_defconfig           |  4 ++-
 configs/stm32mp15_optee_defconfig           |  4 ++-
 configs/stm32mp15_trusted_defconfig         |  4 ++-
 12 files changed, 59 insertions(+), 32 deletions(-)
 create mode 100644 board/st/common/Kconfig
 create mode 100644 board/st/common/MAINTAINERS
 create mode 100644 board/st/common/Makefile
 rename board/st/{stm32mp1 => common}/cmd_stboard.c (98%)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
