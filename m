Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C73C4E98F
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:40:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 098ACCA75BF
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:40:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C087ACA75BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:40:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDeD9M000567; Fri, 21 Jun 2019 15:40:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=LptjE3tTGpRPseHG2HdUDuQMIBGcy6ohufhSJte8FmE=;
 b=FRmIP4e5IIFK830M7n8mwpcsHAte+G2iCklzyqpKCcu//zaVQminoXG5V7A36Uw5+RDw
 Rnv57gFF0IJueVeYk7r/79kXOJxpyF6KZWOhlrY6tvDTX2qMBnSbgqimHznPVVnRArCh
 3YbCWSh1GjOWw/Y4CgjE9pD6i3+hq0kdjG4ip/D+FBP7xjjw6ggqWO2ox0ckASxItrzN
 3DH9xviyMKB/EcKzDqy4YM40CTdIyvV09ro3+wztJDw5jBdzQuYw4fg/yKQykd2DzJzd
 rzflH/Xr9AMfnvBJ1gOz8w8gVO5ivbPQra7/9QRb8Ro9zRcw3Zqi4d7Eh+2MuOMcyKq8 Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t78137vtj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:40:27 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 19F8B51;
 Fri, 21 Jun 2019 13:40:02 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09D942A6B;
 Fri, 21 Jun 2019 13:40:02 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:40:01 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:40:01
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:39:55 +0200
Message-ID: <1561124396-2581-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_10:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] stm32mp1: Add UBIFS boot capability
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

Add support for boot from NAND in generic ditribution command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/configs/stm32mp1.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 1d385e0..8388f2b 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -77,6 +77,10 @@
 /*MMC SD*/
 #define CONFIG_SYS_MMC_MAX_DEVICE	3
 
+/* NAND support */
+#define CONFIG_SYS_NAND_ONFI_DETECTION
+#define CONFIG_SYS_MAX_NAND_DEVICE	1
+
 /* Ethernet need */
 #ifdef CONFIG_DWC_ETH_QOS
 #define CONFIG_SYS_NONCACHED_MEMORY	(1 * SZ_1M)	/* 1M */
@@ -91,11 +95,9 @@
 
 #if !defined(CONFIG_SPL_BUILD)
 
-/* NAND support */
-#define CONFIG_SYS_NAND_ONFI_DETECTION
-#define CONFIG_SYS_MAX_NAND_DEVICE	1
 #define BOOT_TARGET_DEVICES(func) \
 	func(MMC, mmc, 1) \
+	func(UBIFS, ubifs, 0) \
 	func(MMC, mmc, 0) \
 	func(MMC, mmc, 2) \
 	func(PXE, pxe, na)
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
