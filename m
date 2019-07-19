Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 486E66E5F8
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 15:00:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17383C0EB50
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 13:00:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C158CC10C82
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 13:00:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JD06bI021006; Fri, 19 Jul 2019 15:00:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5wSoR2CWeDL95x/WWhKjq6e/x/4yRpQoN7X391Vko14=;
 b=WvKxzKFCysnzDx6NiAuimiwv7JUD9PMadvyf44BnUFE9AJ/To38P2KlQuNV9hWkWs48b
 2+vCFmwg7xd7bCeLc6p1OOwRgibqIiZbscc4CeSoYrGPCGTW0JWk6rHwutSBgoS6BIoy
 5l/92eorx+a8Ushs/dMsbYqtsB3gvvwEtcMTM654bY5hlIigM73gXP93p4FNxc/Z8Ln9
 1TF+YwJliWOK5FPpzwHeI0IL3Js+6dQOuDQLDbQyX51yGd+f0B6QOM6enIwIFgii2BRU
 JWI0XruEPNEG1cFzTe8E/F2NsTesFRhR7S8jDDScTsOmt1Oc3JCBOeXm3deU3+v3zv8n tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepv660-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 15:00:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52E543A;
 Fri, 19 Jul 2019 12:57:31 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1259D2D51;
 Fri, 19 Jul 2019 12:57:31 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:30 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:30
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:13 +0200
Message-ID: <1563541046-6432-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RFC PATCH 01/14] dfu: cosmetic: cleanup sf to avoid
	checkpatch error
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/dfu/dfu.c    | 7 ++++---
 drivers/dfu/dfu_sf.c | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index 3189495..eb3a3c6 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -477,14 +477,15 @@ int dfu_config_entities(char *env, char *interface, char *devstr)
 
 const char *dfu_get_dev_type(enum dfu_device_type t)
 {
-	const char *dev_t[] = {NULL, "eMMC", "OneNAND", "NAND", "RAM", "SF" };
+	const char *const dev_t[] = {NULL, "eMMC", "OneNAND", "NAND", "RAM",
+				     "SF"};
 	return dev_t[t];
 }
 
 const char *dfu_get_layout(enum dfu_layout l)
 {
-	const char *dfu_layout[] = {NULL, "RAW_ADDR", "FAT", "EXT2",
-					   "EXT3", "EXT4", "RAM_ADDR" };
+	const char *const dfu_layout[] = {NULL, "RAW_ADDR", "FAT", "EXT2",
+					  "EXT3", "EXT4", "RAM_ADDR" };
 	return dfu_layout[l];
 }
 
diff --git a/drivers/dfu/dfu_sf.c b/drivers/dfu/dfu_sf.c
index 066e767..b78fcfd 100644
--- a/drivers/dfu/dfu_sf.c
+++ b/drivers/dfu/dfu_sf.c
@@ -19,7 +19,7 @@ static int dfu_get_medium_size_sf(struct dfu_entity *dfu, u64 *size)
 }
 
 static int dfu_read_medium_sf(struct dfu_entity *dfu, u64 offset, void *buf,
-		long *len)
+			      long *len)
 {
 	return spi_flash_read(dfu->data.sf.dev, dfu->data.sf.start + offset,
 		*len, buf);
@@ -32,7 +32,7 @@ static u64 find_sector(struct dfu_entity *dfu, u64 start, u64 offset)
 }
 
 static int dfu_write_medium_sf(struct dfu_entity *dfu,
-		u64 offset, void *buf, long *len)
+			       u64 offset, void *buf, long *len)
 {
 	int ret;
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
