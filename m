Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCDE14B197
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 10:11:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FCD9C36B10
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:11:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60852C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:11:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S97Vko026248; Tue, 28 Jan 2020 10:11:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ZMEWDMimTIM2Zutqy0Mt12Jph0dKye1msLggHaSUBHg=;
 b=pI9ECgYj4Qekg7HF6bAesGRi1sX41PrXqWzkNIS0vEFY6N1c7IOBq15DsZKr0TuI3OfB
 KX/KDDomBe3uiEraCwzNHbWk3OpOkYZY9UeTpl3FyRrD2lsbJTU8FbSX3naYpi+MrA0k
 UWFiDPnBU6ryVp5WHKRBn0FtRZKa5F4kDRyOoDy6P3JZZGdoFhN/eW3UcOOCmKYYfjea
 z062Kb2FMuke6iJ61su9BkltbzB0/GAl23QTbML9hucmJFYkG0990+nphOIfJkLd7wFq
 AtMwgc9se2EwL+eDCIeksTOxgKXA97F/atyoTmyr0w7F+rTF+eEUjpN0/MZzSF2qV/YQ SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpaw5hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:11:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 589A710002A;
 Tue, 28 Jan 2020 10:11:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 502CE212A3F;
 Tue, 28 Jan 2020 10:11:32 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:11:31 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 10:11:04 +0100
Message-ID: <20200128091106.28552-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128091106.28552-1-patrick.delaunay@st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 7/9] board: stm32mp1: update readme
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

Update readme:
- list the supported SOC and change family to STM32MP15x
- add warning on OTP write and prerequisite:
  check if MAC address is not yet provisioned.
- Use filesize for mmc write command (avoid to write all partition
  with ${partsize}). ${filesize} and ${partsize} are set by previous
  load command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/README | 52 ++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/board/st/stm32mp1/README b/board/st/stm32mp1/README
index f2069bcefa..5d7465a8c8 100644
--- a/board/st/stm32mp1/README
+++ b/board/st/stm32mp1/README
@@ -3,8 +3,8 @@ SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
 # Copyright (C) 2018 STMicroelectronics - All Rights Reserved
 #
 
-U-Boot on STMicroelectronics STM32MP1
-======================================
+U-Boot on STMicroelectronics STM32MP15x
+=======================================
 
 1. Summary
 ==========
@@ -12,12 +12,12 @@ This is a quick instruction for setup stm32mp1 boards.
 
 2. Supported devices
 ====================
-U-Boot supports one STMP32MP1 SoCs: STM32MP157
+U-Boot supports STMP32MP15x SoCs: STM32MP157, STM32MP153 and STM32MP151
 
-The STM32MP157 is a Cortex-A MPU aimed at various applications.
+The STM32MP15x is a Cortex-A MPU aimed at various applications.
 It features:
-- Dual core Cortex-A7 application core
-- 2D/3D image composition with GPU
+- Dual core Cortex-A7 application core (Single on STM32MP151)
+- 2D/3D image composition with GPU (only on STM32MP157)
 - Standard memories interface support
 - Standard connectivity, widely inherited from the STM32 MCU family
 - Comprehensive security support
@@ -37,11 +37,11 @@ And the necessary drivers
 4. Fuse
 
 Currently the following boards are supported:
-+ stm32mp157c-ev1
-+ stm32mp157c-ed1
-+ stm32mp157a-dk1
-+ stm32mp157c-dk2
-+ stm32mp157a-avenger96
++ stm32mp157a-avenger96.dts
++ stm32mp157a-dk1.dts
++ stm32mp157c-dk2.dts
++ stm32mp157c-ed1.dts
++ stm32mp157c-ev1.dts
 
 3. Boot Sequences
 =================
@@ -74,7 +74,7 @@ with FSBL = First Stage Bootloader
    U-Boot is running in secure mode and provide a secure monitor to the kernel
    with only PSCI support (Power State Coordination Interface defined by ARM).
 
-All the STM32MP1 boards supported by U-Boot use the same generic board
+All the STM32MP15x boards supported by U-Boot use the same generic board
 stm32mp1 which support all the bootable devices.
 
 Each board is configurated only with the associated device tree.
@@ -108,7 +108,7 @@ the supported device trees for stm32mp157 are:
    + install package needed in U-Boot makefile
      (libssl-dev, swig, libpython-dev...)
    + install ARMv7 toolchain for 32bit Cortex-A (from Linaro,
-     from SDK for STM32MP1, or any crosstoolchains from your distribution)
+     from SDK for STM32MP15x, or any crosstoolchains from your distribution)
 
 2. Set the cross compiler:
 
@@ -323,8 +323,7 @@ c) copy U-Boot in first GPT partition of eMMC
 	# ext4load mmc 0:4 0xC0000000 u-boot.img
 	# mmc dev 1
 	# part start mmc 1 1 partstart
-	# part size mmc 1 1 partsize
-	# mmc write ${fileaddr} ${partstart} ${partsize}
+	# mmc write ${fileaddr} ${partstart} ${filesize}
 
 To boot from eMMC, select BootPinMode = 0 1 0 and reset.
 
@@ -334,14 +333,27 @@ To boot from eMMC, select BootPinMode = 0 1 0 and reset.
 Please read doc/README.enetaddr for the implementation guidelines for mac id
 usage. Basically, environment has precedence over board specific storage.
 
-Mac id storage and retrieval in stm32mp otp :
+For STMicroelectonics board, it is retrieved in STM32MP15x otp :
 - OTP_57[31:0] = MAC_ADDR[31:0]
 - OTP_58[15:0] = MAC_ADDR[47:32]
 
 To program a MAC address on virgin OTP words above, you can use the fuse command
 on bank 0 to access to internal OTP:
 
-    example to set mac address "12:34:56:78:9a:bc"
+    Prerequisite: check if a MAC address isn't yet programmed in OTP
+
+    1- check OTP: their value must be equal to 0
+
+       STM32MP> fuse sense 0 57 2
+       Sensing bank 0:
+       Word 0x00000039: 00000000 00000000
+
+    2- check environment variable
+
+       STM32MP> env print ethaddr
+       ## Error: "ethaddr" not defined
+
+    Example to set mac address "12:34:56:78:9a:bc"
 
     1- Write OTP
        STM32MP> fuse prog -y 0 57 0x78563412 0x0000bc9a
@@ -355,9 +367,13 @@ on bank 0 to access to internal OTP:
        ### Setting environment from OTP MAC address = "12:34:56:78:9a:bc"
 
     4 check env update
-       STM32MP> print ethaddr
+       STM32MP> env print ethaddr
        ethaddr=12:34:56:78:9a:bc
 
+warning:: This MAC address provisioning can't be executed twice on the same
+          board as the OTP are protected. It is already done for the board
+          provided by STMicroelectronics.
+
 10. Coprocessor firmware
 ========================
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
