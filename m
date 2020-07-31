Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C286D23408B
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 09:54:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 833C4C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 07:54:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9801C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:54:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7mULB016688; Fri, 31 Jul 2020 09:54:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=IA23zwEJ/slXRhy97/SGqOAjtJxiG5OSYWK3n0sXFJI=;
 b=SG9G7Sacquxi0618pAMODOyBfoBS+bWDQnnN+2mFeMh7HXOzHfvqpSuQX9MpGvZFkP9Z
 7Wu9KHwQp9jt9Djqc7J6f3g5vENrccdEZe1Z2xoSkpVSGj3HkiBPs/uSNsbX80lCN3Z6
 g325JNTZ+Tryb8ACyPLc6cw0f6Wu5q0t1QaqFf5J2lO70dp1ba1rFx/R73vMSLgtRvEl
 D7tmApjDWOSPWSQOtkpdeLYwgA1x8c28etO1OpzWTfd+x5fOWH7+ffC+osYqBqzxlKYB
 KWGT/dGk4Ph7j5J7qHxwuDAyuWHdZcvDmoTUU8Xb4XMg8Z/Y51JLtq0P/ZA5wn1tb5Vb 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgn6v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:54:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B652C10002A;
 Fri, 31 Jul 2020 09:54:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A34AC22109C;
 Fri, 31 Jul 2020 09:54:45 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 09:54:45 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 09:53:33 +0200
Message-ID: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 00/11] Add STM32 FMC2 EBI controller driver
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


The FMC2 functional block makes the interface with: synchronous and
asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
peripherals) and NAND flash memories.
Its main purposes are:
  - to translate AXI transactions into the appropriate external device
    protocol
  - to meet the access time requirements of the external devices
All external devices share the addresses, data and control signals with the
controller. Each external device is accessed by means of a unique Chip
Select. The FMC2 performs only one access at a time to an external device.


Christophe Kerello (11):
  mtd: rawnand: stm32_fmc2: fix a buffer overflow
  mtd: rawnand: stm32_fmc2: remove useless inline comments
  mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_5S for timeouts
  mtd: rawnand: stm32_fmc2: cosmetic change to use nfc instead of fmc2
    where relevant
  mtd: rawnand: stm32_fmc2: use FIELD_PREP/FIELD_GET macros
  mtd: rawnand: stm32_fmc2: use clrsetbits_le32
  memory: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
  mtd: rawnand: stm32_fmc2: get resources from parent node
  board: stm32mp1: update fdt fixup partitions table
  configs: stm32mp: add CONFIG_STM32_FMC2_EBI
  ARM: dts: stm32: add FMC2 EBI support for stm32mp157c

 arch/arm/dts/stm32mp151.dtsi           |   43 +-
 arch/arm/dts/stm32mp157c-ev1.dts       |   16 +-
 board/st/stm32mp1/stm32mp1.c           |    1 +
 configs/stm32mp15_basic_defconfig      |    1 +
 configs/stm32mp15_trusted_defconfig    |    1 +
 drivers/memory/Kconfig                 |    9 +
 drivers/memory/Makefile                |    1 +
 drivers/memory/stm32-fmc2-ebi.c        | 1056 ++++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/stm32_fmc2_nand.c |  499 ++++++++-------
 9 files changed, 1349 insertions(+), 278 deletions(-)
 create mode 100644 drivers/memory/stm32-fmc2-ebi.c

-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
