Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A0CD5C67
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AFA1C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E43EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7QTlG006852; Mon, 14 Oct 2019 09:28:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Vs3/nErzqlsZjn6KKNW41cF+Zvh9I1YDWWT/RaVwvKY=;
 b=tOV3fqQkqJ1C8BZiLWCA5cYm2UozYtFIW6JLed0K49LEZv/a5+kj64OffnSGNbGv7xvL
 H0k63O3YYBLUGw7gb3WFj+75MjSTEwyWEFAvGK64lyP4p5suhw9LLeAc+GqxWG9jbYxt
 ygO9ehsFHHtAX1Uj6s3CGq+Hzz3CdwSUTjuZTowXVLPck4/J8hTGwa4/h1Qg7MM19FRg
 6xWvS51sZ391/l99xHwn27hWMk+I32lc2atbyPtLhDEG9yLPwcowXcw8iwBOdH+BmMIY
 SRR5l63C/kUGXBQSyb+j2o87AlLzP0NmJ88LKbRCyN8U2ESz3UtXz8MXcAQCJd5Uxrwf Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4a10ums-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BEBFB10002A;
 Mon, 14 Oct 2019 09:28:21 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5E142ADFD2;
 Mon, 14 Oct 2019 09:28:21 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:21 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:21
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:27:58 +0200
Message-ID: <20191014072812.21843-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014072812.21843-1-patrick.delaunay@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 01/15] dfu: cosmetic: cleanup sf to avoid
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
Acked-by: Lukasz Majewski <lukma@denx.de>
---

Changes in v3: None
Changes in v2: None

 drivers/dfu/dfu.c    | 7 ++++---
 drivers/dfu/dfu_sf.c | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index d2b67b18cf..e9db7f8d66 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -478,14 +478,15 @@ int dfu_config_entities(char *env, char *interface, char *devstr)
 
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
index 066e7670d1..b78fcfd3a1 100644
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
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
