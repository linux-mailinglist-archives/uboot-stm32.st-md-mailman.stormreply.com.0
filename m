Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8643FCD4
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 17:26:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0B4CC35E0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 15:26:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DC00C35E08
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 15:26:36 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UFMN5i032357; Tue, 30 Apr 2019 17:26:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0Cr7p/FSBTMfCKricJgD1YL+NK1KQ98vvcK+XTw958I=;
 b=JHJi5zJ5TQYe3DJAmkAvoOB42tTJnaEAi9a3u4ak3LWi66SxbQj+aW5V1k294hFwCAzJ
 ZTavc8xrGG5NHVHdj0O4bF/o5N3L6/jK87dK7tp+bEOVsjrzh4poH5z9Lw5mKEmhsiH+
 LWQqQEietaIpgDabgSYeLPLKyUJ0DWlOsZNUBD/bBH1OMfLYkq55Qgs2Nw2S3fMi/B2L
 HuHVwpSdVaY9b/pit+V96px+3ejPhfNQ+F1ad73DFUT8fZHQo49li2u4BP12qL8iHR89
 xjrIaR5lEPByEb1Ajsf+6ld5cKzpsq60hFcrpHqsLZD0O/Poj5bwoOQqHmZhJyI/cy5u Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s6r9487db-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 17:26:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41B1334;
 Tue, 30 Apr 2019 15:26:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F40528BB;
 Tue, 30 Apr 2019 15:26:33 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 30 Apr 2019 17:26:32 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>, <michal.simek@xilinx.com>, <sr@denx.de>,
 <u-boot@lists.denx.de>
Date: Tue, 30 Apr 2019 17:26:23 +0200
Message-ID: <1556637983-5654-5-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
References: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 4/4] configs: stm32mp15: Enable WDT flags
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

This allows to enable WATCHDOG and WDT flags to
be able to reset the watchdog and to support watchdog driver
model.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2: None

 configs/stm32mp15_basic_defconfig   | 2 ++
 configs/stm32mp15_trusted_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index fd164fa..7252c14 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -77,3 +77,5 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index f82b770..52ee280 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -68,3 +68,5 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
