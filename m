Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA2B4E8D9
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:22:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D86F5CA0268
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:22:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13EB1CA0266
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:22:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDGNhq016197; Fri, 21 Jun 2019 15:22:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MnAa/uWFkHwXSAAOAtIwfuROfUuotqp1SwOyVMwXL4A=;
 b=F0cpQglyKkPgWpQ54jF9b31J8IyOfCQ0JA7cZ3YNd5664FwKIOZp2uPzLB6vRvgikDKM
 d4cx0suK2TDjjJc2bgpPIWxc2EQYT6E/K0sJKQt0eSuBMJdbq9dPJ14YvKCXgaxfPmuN
 8A1CXL1XroMCYKvik86iczyk6Ht1OT/D34B+QvLmVTwJizkecC24mZiz3JAB6cb4At4h
 jHM26ZOO3EXzwzyVa7EiqrS06ylnOU0xUBoNdP0ujBaSVWollym7VcS6Eooa42G2PYgH
 cFgO+UuE4fDw9qPjV4wvud++mDp8Dtlwqbprfj7fL9oCCUJdwxoNm4PJSpK9RW7tw1yi HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t78137svw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:22:20 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 990B131;
 Fri, 21 Jun 2019 13:22:19 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 844BF2A2E;
 Fri, 21 Jun 2019 13:22:19 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:22:19 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:22:18
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:21:49 +0200
Message-ID: <1561123314-709-12-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
References: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 11/16] stm32mp1: udpate README
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
