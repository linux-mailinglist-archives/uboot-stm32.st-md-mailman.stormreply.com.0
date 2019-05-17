Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0B218E1
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 15:09:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B2DCC0615B
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 13:09:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64FA7C05842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 13:08:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HD6Ypx009363; Fri, 17 May 2019 15:08:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Vb68d03mNlZV7KDOgfqLd3yCl6il7DfV40Dw7Np7kQ8=;
 b=FvIi5ta9TssTCRoGBbpgOhPG6NgNZ+Rok4vgZYU/Q0RxpPFPO/r2awcVEppHoiGZ6d4I
 40yHNoXTDUVLKnTMHd4xxQMs4BCAUCGvOZcCVFO4fEn7BDbYT7ic3NuaEXEmehAEA0Kl
 9P8KJG/AvcjWu/vURe8CMxL2m2ZOs805g1h1rT/Hxn6FJ/Ak68Ypt2EF7SCQr9YMAPou
 EMbe7h2cZymLmbvkRoBZQzZWwR71gDOfeLNzCUZqvLPuMZetP9VJ7mulT+/iL7gw85gi
 WMIRUklgmjQR0r9z6PrMJcjXUy1Vn2+sGfe4FzTs0qUn3HkPzDAUInvcRaX/PA0zn+kR QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sg0ankv9u-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 17 May 2019 15:08:58 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D78034;
 Fri, 17 May 2019 13:08:58 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E13812B1B;
 Fri, 17 May 2019 13:08:57 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May
 2019 15:08:57 +0200
Received: from localhost (10.201.22.222) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May 2019 15:08:57
 +0200
From: Christophe Roullier <christophe.roullier@st.com>
To: Christophe Roullier <christophe.roullier@st.com>, <u-boot@lists.denx.de>
Date: Fri, 17 May 2019 15:08:46 +0200
Message-ID: <20190517130847.13144-6-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517130847.13144-1-christophe.roullier@st.com>
References: <20190517130847.13144-1-christophe.roullier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_07:, , signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v2 5/6] stm32mp1: Add Ethernet support for
	stm32mp1 board
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

Add default SERVERIP address
Enable noncached memory region required by ethernet driver
Add PXE support

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---

Changes in v2: None

 include/configs/stm32mp1.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index fd6c97a0c61..cc14f6169b9 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -78,6 +78,14 @@
 /*MMC SD*/
 #define CONFIG_SYS_MMC_MAX_DEVICE	3
 
+/* Ethernet need */
+#ifdef CONFIG_DWC_ETH_QOS
+#define CONFIG_SYS_NONCACHED_MEMORY	(1 * SZ_1M)	/* 1M */
+#define CONFIG_SERVERIP                 192.168.1.1
+#define CONFIG_BOOTP_SERVERIP
+#define CONFIG_SYS_AUTOLOAD		"no"
+#endif
+
 /*****************************************************************************/
 #ifdef CONFIG_DISTRO_DEFAULTS
 /*****************************************************************************/
@@ -87,7 +95,9 @@
 #define BOOT_TARGET_DEVICES(func) \
 	func(MMC, mmc, 1) \
 	func(MMC, mmc, 0) \
-	func(MMC, mmc, 2)
+	func(MMC, mmc, 2) \
+	func(PXE, pxe, na)
+
 /*
  * bootcmd for stm32mp1:
  * for serial/usb: execute the stm32prog command
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
