Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3C5CE59
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Jul 2019 13:26:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F10D9C6A5F2
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Jul 2019 11:26:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02BF8C6A5F0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2019 11:26:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62BQJeq002284; Tue, 2 Jul 2019 13:26:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Mm06Aav8D4t7wRh7v+ORD7dV81owCehM90wWqFV67ww=;
 b=E8JtVcK7p/pCoqYYA0bIiy4vO+uiI1/w91v8iyvmdQnNd9AnYgZG5Fo/8hJgVscMX88a
 mmJHD/ClxtdQ4B0zPRxYSVY2mXuhrotHamNRFtOFucsUN6IGr4tzSqF6LD5SHSewYi/M
 2eaBlFHdGyioXm54OtFmn5S26v646keWZzcShf1gM1ZPxy0zle68QCs+2agz7C9bUpwX
 9/0Jrr0UvXkf1tk8dHCENug39dyZqj5V+0ZRIZ5eMQsVTH/MRSQGsV4iUqOfCBMXPXMZ
 G6BNK0xZCLyG5b1v/CJTSUDeG8rbIwRkiQoUlWN0AOQNm4aIOnXq/rTvnB3Mgupf99+U Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdw49uun2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 13:26:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2733738;
 Tue,  2 Jul 2019 11:26:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 153D427FF;
 Tue,  2 Jul 2019 11:26:14 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 13:26:14 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 13:26:13
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Jul 2019 13:26:05 +0200
Message-ID: <1562066767-8221-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
References: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/3] stm32mp1: reorder some CONFIG in
	stm32mp1.h
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

Change config not directly linked to CONFIG_DISTRO_DEFAULTS.
Allow to deactivate CONFIG_SYS_MTDPARTS_RUNTIME when
CONFIG_MTDPARTS_DEFAULT is defined in defconfig.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/configs/stm32mp1.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 1d385e0..6626be7 100644
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
@@ -85,15 +89,15 @@
 #define CONFIG_SYS_AUTOLOAD		"no"
 #endif
 
+/* Dynamic MTD partition support */
+#define CONFIG_SYS_MTDPARTS_RUNTIME
+
 /*****************************************************************************/
 #ifdef CONFIG_DISTRO_DEFAULTS
 /*****************************************************************************/
 
 #if !defined(CONFIG_SPL_BUILD)
 
-/* NAND support */
-#define CONFIG_SYS_NAND_ONFI_DETECTION
-#define CONFIG_SYS_MAX_NAND_DEVICE	1
 #define BOOT_TARGET_DEVICES(func) \
 	func(MMC, mmc, 1) \
 	func(MMC, mmc, 0) \
@@ -121,14 +125,15 @@
 
 #include <config_distro_bootcmd.h>
 
-#if defined(CONFIG_STM32_QSPI) || defined(CONFIG_NAND_STM32_FMC)
-#define CONFIG_SYS_MTDPARTS_RUNTIME
-#endif
-
 #define STM32MP_MTDPARTS \
 	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),-(nor_user)\0" \
 	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0"
 
+#ifndef CONFIG_SYS_MTDPARTS_RUNTIME
+#undef STM32MP_MTDPARTS
+#define STM32MP_MTDPARTS
+#endif
+
 /*
  * memory layout for 32M uncompressed/compressed kernel,
  * 1M fdt, 1M script, 1M pxe and 1M for splashimage
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
