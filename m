Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB55460924
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 17:20:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 760AEC36B3E
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 15:20:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5A6EC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:20:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FGRqi016826; Fri, 5 Jul 2019 17:20:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vfnHloiCL4OwJloOWNAteWbVY9e9h3YpNz7wYQ2fLC8=;
 b=q/psLibH14B8kFZ/nI7WreDwhjDrLasXhxIiikQDqlPxqJSkkQOj9VWCIZJl9oombwKh
 uG4A2zHE5mFhfkJ4CliaS2RsEGpDLJRa1j34mW+uzrjjsZ3CRqRpt+G576ZlDxS82OeC
 r+2QqAvPXCVtH//0ekDIERN4LXWgq64/hIsKUoTzbS6gM1oCRkHxhVSsGRvjXvEvQXS4
 ntBGeWWCZzBZvc8UxJJ7M/wOwcxemb9urB9SEB+XpaRYtIS7f2IEG+yBgxEcp7Y/xsfa
 mCac/HAb0EraXfib2dqIBLXHUUOaJWWSnxt4+Dz6W2YgUq855RMVZBY/OTEkIyCvlQxI tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwf1kggw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 17:20:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8307334;
 Fri,  5 Jul 2019 15:20:40 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6EF1A4FB8;
 Fri,  5 Jul 2019 15:20:40 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 17:20:40 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 17:20:40
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jul 2019 17:20:18 +0200
Message-ID: <1562340023-8516-12-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 11/16] stm32mp1: update README
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

Add latest information and correct some information.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 board/st/stm32mp1/README | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/board/st/stm32mp1/README b/board/st/stm32mp1/README
index b0c8325..dc36a21 100644
--- a/board/st/stm32mp1/README
+++ b/board/st/stm32mp1/README
@@ -25,6 +25,10 @@ It features:
 Everything is supported in Linux but U-Boot is limited to:
 1. UART
 2. SDCard/MMC controller (SDMMC)
+3. NAND controller (FMC)
+4. NOR controller (QSPI)
+5. USB controller (OTG DWC2)
+6. Ethernet controller
 
 And the necessary drivers
 1. I2C
@@ -54,13 +58,13 @@ with FSBL = First Stage Bootloader
    TF-A performs a full initialization of Secure peripherals and installs a
    secure monitor.
    U-Boot is running in normal world and uses TF-A monitor
-   to access to secure resources
+   to access to secure resources.
 
 2) The "Basic" boot chain (defconfig_file : stm32mp15_basic_defconfig)
    BootRom => FSBL = U-Boot SPL => SSBL = U-Boot
    SPL has limited security initialisation
    U-Boot is running in secure mode and provide a secure monitor to the kernel
-   with only PSCI support (Power State Coordination Interface defined by ARM)
+   with only PSCI support (Power State Coordination Interface defined by ARM).
 
 All the STM32MP1 boards supported by U-Boot use the same generic board
 stm32mp1 which support all the bootable devices.
@@ -111,6 +115,9 @@ the supported device trees for stm32mp157 are:
 	# export KBUILD_OUTPUT=stm32mp15_trusted
 	# export KBUILD_OUTPUT=stm32mp15_basic
 
+	you can build outside of code directory:
+	# export KBUILD_OUTPUT=../build/stm32mp15_trusted
+
 4. Configure U-Boot:
 
 	# make <defconfig_file>
@@ -170,6 +177,8 @@ the supported device trees for stm32mp157 are:
 
 You can select the boot mode, on the board ed1 with the switch SW1
 
+- on the daugther board ed1 with the switch SW1 : BOOT0, BOOT1, BOOT2
+
  -----------------------------------
   Boot Mode   BOOT2   BOOT1   BOOT0
  -----------------------------------
@@ -267,7 +276,7 @@ for example: with gpt table with 128 entries
 	# dd if=tf-a.stm32 of=/dev/mmcblk0p2
 	# dd if=u-boot.stm32 of=/dev/mmcblk0p3
 
-To boot from SDCard, select BootPinMode = 1 1 1 and reset.
+To boot from SDCard, select BootPinMode = 1 0 1 and reset.
 
 8. Prepare eMMC
 ===============
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
