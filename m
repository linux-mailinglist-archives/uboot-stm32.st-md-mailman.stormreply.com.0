Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11D7F7D5
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 15:07:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE3A2C35E03
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:07:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A17CC35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 13:07:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72D3QYc012599; Fri, 2 Aug 2019 15:07:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wpoWxyilc6BLvOtyIqhEYTnvjd6KEnYBz7lyB/9SF6A=;
 b=crjuaqevziEvMu0t/MjO2m24KJdn9k0tQ3Ho6xjs1jycz7WZZRlgoXjo8H2jvlEXHg1L
 CDUx0mb7BnTq3NWIEmU2aFQhTcMMg8zlkEiCmHR286BQmUslb95cjDLKzfoudh+KtThy
 szp/O7vyvN3o+pMfoRlaE6P4zEi3P3LXbdSpiFx/iPOp2raAf1SRKWMyNdK1ku6L6CBE
 KyUy2GWvQxJAx0nQ/kQbpS/Nm9VpB6dAgOUurg4069A7l7FmyS7uVWwY/hGlIzO523Yq
 4At5v5ZC20uoCoD2lYwhNkln2joczTZfFJtAXaw3lFcojRGKm99nDbiOkOCP4HPnxiAT IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0braga0g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 15:07:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F233C46;
 Fri,  2 Aug 2019 13:07:51 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC7E02C35C1;
 Fri,  2 Aug 2019 15:07:51 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 15:07:52 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 15:07:51
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 15:07:22 +0200
Message-ID: <1564751242-683-6-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
References: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 5/5] stm32mp1: update README for remoteproc
	support
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

Add information for remoteproc usage to load firmware in M4 coprocessor
on stm32mp157.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/README | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/board/st/stm32mp1/README b/board/st/stm32mp1/README
index 428357c..c807e08 100644
--- a/board/st/stm32mp1/README
+++ b/board/st/stm32mp1/README
@@ -139,7 +139,6 @@ the supported device trees for stm32mp157 are:
 
 	# make DEVICE_TREE=<name> all
 
-
   example:
   a) trusted boot on ev1
 	# export KBUILD_OUTPUT=stm32mp15_trusted
@@ -190,7 +189,7 @@ the supported device trees for stm32mp157 are:
 6. Switch Setting for Boot Mode
 ===============================
 
-You can select the boot mode, on the board ed1 with the switch SW1
+You can select the boot mode, on the board with one switch :
 
 - on the daugther board ed1 with the switch SW1 : BOOT0, BOOT1, BOOT2
 
@@ -358,3 +357,36 @@ on bank 0 to access to internal OTP:
     4 check env update
        STM32MP> print ethaddr
        ethaddr=12:34:56:78:9a:bc
+
+10. Coprocessor firmware
+========================
+
+U-Boot can boot the coprocessor before the kernel (coprocessor early boot).
+
+A/ Manuallly by using rproc commands (update the bootcmd)
+     Configurations
+	# env set name_copro "rproc-m4-fw.elf"
+	# env set dev_copro 0
+	# env set loadaddr_copro 0xC1000000
+
+     Load binary from bootfs partition (number 4) on SDCard (mmc 0)
+	# ext4load mmc 0:4 ${loadaddr_copro} ${name_copro}
+	=> ${filesize} updated with the size of the loaded file
+
+     Start M4 firmware with remote proc command
+	# rproc init
+	# rproc load ${dev_copro} ${loadaddr_copro} ${filesize}
+	# rproc start ${dev_copro}
+
+B/ Automatically by using FIT feature and generic DISTRO bootcmd
+
+   see examples in this directory :
+
+   Generate FIT including kernel + device tree + M4 firmware
+   with cfg with M4 boot
+        $> mkimage -f fit_copro_kernel_dtb.its fit_copro_kernel_dtb.itb
+
+    Then using DISTRO configuration file: see extlinux.conf to select
+    the correct configuration
+	=> stm32mp157c-ev1-m4
+	=> stm32mp157c-dk2-m4
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
