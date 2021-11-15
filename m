Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2BE45088B
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 16:32:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 917D6C5E2CC;
	Mon, 15 Nov 2021 15:32:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41BDFC57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 15:32:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFDg9sI030759;
 Mon, 15 Nov 2021 16:32:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=qFkg1hphip7TqWgWOceQ0oqmUF7BFo5SkEtoMfRETLU=;
 b=SyXnD5cXa6ofMKIxkczBm0Zzd8iowWDgLwQu9lSP1hx+6zwlfESl6XF7Ke293Il2ZzHp
 9sMT6r+zIuYcjEDLCcs1C0AepkwgJ7Bi5HzYPt8daWFw8N93zbt21NvZgyAe2AvPQlN7
 o29nmnIJ3WGgeYn9U0i9MnaqSqFlHn/OG5riXJvXwL7UpEguhq8bS8tKJNOoqJG4oA0O
 /wNMC4UpTSy9qTagujnWlb0TV1S8DOiyhvrNIP+Ws21xE+0PHN8exPIAwIVItTlC6lOV
 Oh5sBopMAnn4rs2Py40YlZI5OWVjVen41XJLOh8skQxG9YKdG/7vCIIfDE/f1d64JzkZ 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cben9vp8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 16:32:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5541100038;
 Mon, 15 Nov 2021 16:32:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D6F02C38C2;
 Mon, 15 Nov 2021 16:32:38 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 16:32:38
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 16:32:19 +0100
Message-ID: <20211115163155.3.I4feae35bc7d3eda703b157680caff3979d01d048@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Matthias Brugger <mbrugger@suse.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/7] common: rename functions lcd_dt_simplefb
	to fdt_simplefb
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

Rename the function named lcd_dt_simplefb* to fdt_simplefb* to be aligned
with the associated file name fdt_simplefb.h/fdt_simplefb.c

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/raspberrypi/rpi/rpi.c |  2 +-
 common/fdt_simplefb.c       | 10 +++++-----
 include/fdt_simplefb.h      |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/raspberrypi/rpi/rpi.c b/board/raspberrypi/rpi/rpi.c
index 55afaa54d9..cd7d6df2a5 100644
--- a/board/raspberrypi/rpi/rpi.c
+++ b/board/raspberrypi/rpi/rpi.c
@@ -505,7 +505,7 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 
 	node = fdt_node_offset_by_compatible(blob, -1, "simple-framebuffer");
 	if (node < 0)
-		lcd_dt_simplefb_add_node(blob);
+		fdt_simplefb_add_node(blob);
 
 #ifdef CONFIG_EFI_LOADER
 	/* Reserve the spin table */
diff --git a/common/fdt_simplefb.c b/common/fdt_simplefb.c
index 1650615cdb..32173030ab 100644
--- a/common/fdt_simplefb.c
+++ b/common/fdt_simplefb.c
@@ -16,7 +16,7 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-static int lcd_dt_simplefb_configure_node(void *blob, int off)
+static int fdt_simplefb_configure_node(void *blob, int off)
 {
 	int xsize, ysize;
 	int bpix; /* log2 of bits per pixel */
@@ -58,7 +58,7 @@ static int lcd_dt_simplefb_configure_node(void *blob, int off)
 				       xsize * (1 << bpix) / 8, name);
 }
 
-int lcd_dt_simplefb_add_node(void *blob)
+int fdt_simplefb_add_node(void *blob)
 {
 	static const char compat[] = "simple-framebuffer";
 	static const char disabled[] = "disabled";
@@ -76,10 +76,10 @@ int lcd_dt_simplefb_add_node(void *blob)
 	if (ret < 0)
 		return -1;
 
-	return lcd_dt_simplefb_configure_node(blob, off);
+	return fdt_simplefb_configure_node(blob, off);
 }
 
-int lcd_dt_simplefb_enable_existing_node(void *blob)
+int fdt_simplefb_enable_existing_node(void *blob)
 {
 	int off;
 
@@ -87,5 +87,5 @@ int lcd_dt_simplefb_enable_existing_node(void *blob)
 	if (off < 0)
 		return -1;
 
-	return lcd_dt_simplefb_configure_node(blob, off);
+	return fdt_simplefb_configure_node(blob, off);
 }
diff --git a/include/fdt_simplefb.h b/include/fdt_simplefb.h
index 7cc305e1fd..7e54723591 100644
--- a/include/fdt_simplefb.h
+++ b/include/fdt_simplefb.h
@@ -8,6 +8,6 @@
 
 #ifndef _FDT_SIMPLEFB_H_
 #define _FDT_SIMPLEFB_H_
-int lcd_dt_simplefb_add_node(void *blob);
-int lcd_dt_simplefb_enable_existing_node(void *blob);
+int fdt_simplefb_add_node(void *blob);
+int fdt_simplefb_enable_existing_node(void *blob);
 #endif
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
