Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94345088D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 16:32:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A32A7C5EC59;
	Mon, 15 Nov 2021 15:32:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8993BC57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 15:32:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFCwS3x014045;
 Mon, 15 Nov 2021 16:32:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=3btde5mDdjtNdB4GX/y8Y+uCxMyydvk2c30FUxQxWoI=;
 b=NSNPBAs9tIGuYfHhko3oiESFpczge8PizQ35W0cWRazmvTC8uzA9qs4IUwAtpEaRHSfH
 NZkjOWeAbyVtWPogczNr3xlz3+nMrNhIrUK0iiuouvvpN++IngtYMjVY5FGz/FulN80l
 ZsPA7DZ8x+YSympM9mo8XgfI8Z/xoPNXXoD/l0l9rS6+AjergjeP6dAq2i5goSFWYSj4
 BruRnwPPsoHWM5ZT2XXl6pfeZTGRB5yM+tkq0auKEjLSb/71P0O6LXXKpeLs5Qu+f3W2
 5yb9HDNFeD73/r8OHxYHDA1DDuONl2rFijlYV51oG6VPRq8zT4dp8ygmnR8UzussVHC+ Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cben34p6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 16:32:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BDBB10002A;
 Mon, 15 Nov 2021 16:32:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6487F2C38AA;
 Mon, 15 Nov 2021 16:32:40 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 16:32:39
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 16:32:21 +0100
Message-ID: <20211115163155.5.I9d5be95eede5162b9b7b74778d8c7620e6762e56@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 5/7] common: add
	fdt_simplefb_enable_and_mem_rsv function
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

Add a new function to activate an existing simple frame buffer node
and add the associated reserved memory, with no-map properties.

This device tree update is only done when the video device is active
and the video buffer is used.

This patch uses '#if CONFIG_IS_ENABLED(DM_VIDEO)' because
gd->video_bottom and gd->video_top are only defined when CONFIG_DM_VIDEO
is activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 common/fdt_simplefb.c  | 27 +++++++++++++++++++++++++++
 include/fdt_simplefb.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/common/fdt_simplefb.c b/common/fdt_simplefb.c
index 32173030ab..c52846f4bc 100644
--- a/common/fdt_simplefb.c
+++ b/common/fdt_simplefb.c
@@ -89,3 +89,30 @@ int fdt_simplefb_enable_existing_node(void *blob)
 
 	return fdt_simplefb_configure_node(blob, off);
 }
+
+#if CONFIG_IS_ENABLED(DM_VIDEO)
+int fdt_simplefb_enable_and_mem_rsv(void *blob)
+{
+	struct fdt_memory mem;
+	int ret;
+
+	/* nothing to do when video is not active */
+	if (!video_is_active())
+		return 0;
+
+	ret = fdt_simplefb_enable_existing_node(blob);
+	if (ret)
+		return ret;
+
+	/* nothing to do when the frame buffer is not defined */
+	if (gd->video_bottom == gd->video_top)
+		return 0;
+
+	/* reserved with no-map tag the video buffer */
+	mem.start = gd->video_bottom;
+	mem.end = gd->video_top - 1;
+
+	return fdtdec_add_reserved_memory(blob, "framebuffer", &mem, NULL, 0, NULL,
+					  FDTDEC_RESERVED_MEMORY_NO_MAP);
+}
+#endif
diff --git a/include/fdt_simplefb.h b/include/fdt_simplefb.h
index 7e54723591..41cd740ac0 100644
--- a/include/fdt_simplefb.h
+++ b/include/fdt_simplefb.h
@@ -10,4 +10,5 @@
 #define _FDT_SIMPLEFB_H_
 int fdt_simplefb_add_node(void *blob);
 int fdt_simplefb_enable_existing_node(void *blob);
+int fdt_simplefb_enable_and_mem_rsv(void *blob);
 #endif
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
