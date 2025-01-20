Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB6AA167E4
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jan 2025 09:05:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6E3BC78002;
	Mon, 20 Jan 2025 08:05:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBB76C6C83D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 08:05:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K8480O006802;
 Mon, 20 Jan 2025 09:05:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 e0w0PD5TDLK4HHKrWajvHt7vjXPCU8Wsps1CyrfYX50=; b=nb8CFN4sUsFKUR3K
 T8SlHbUiaux7FBRT/m2AS37xkH8vkwy480Zl6qEyJMT3q+UE5lj55Mdc9wdEG9GM
 PgJQEmK+0FRvV3lFGQZrX7XGAT8k2l7otsgFLWAMunR1sXH8KZGoYT0ZJF66a2uI
 SzeljdhgFUsaLXUkHKkaiiRgsR/D6nLecceC0OwgJ0G3Y6vxiECAGZXNyqnPSGIq
 972AppA8GQz67bIQ6ZbfgRdBbdDMoFyR5Wwlkb4oEvUoGXJog+tng6qHg3wfVFQc
 k2GGvwkCoHsNKugrE6z879w0fqJgL5KhbWEciTn1pgx9roe+xyRCmEcsw1VrtxrG
 YLZjNw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44983x1nuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 09:05:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E767E40070;
 Mon, 20 Jan 2025 09:04:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DAD8F270F10;
 Mon, 20 Jan 2025 09:01:28 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 20 Jan
 2025 09:01:28 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jan 2025 09:01:19 +0100
Message-ID: <20250120080120.51657-9-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120080120.51657-1-patrice.chotard@foss.st.com>
References: <20250120080120.51657-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 8/9] board: stih410-b2260: Remove
	board_usb_init/cleanup()
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

Since DM_USB_GADGET is enable for this board, board_usb_init()
and board_usb_cleanup() can be removed.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Changes in v3:
  - add RB Mattijs Korpershoek

---

(no changes since v1)

 board/st/stih410-b2260/board.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/board/st/stih410-b2260/board.c b/board/st/stih410-b2260/board.c
index 3a495eb5089..8ad593cccdd 100644
--- a/board/st/stih410-b2260/board.c
+++ b/board/st/stih410-b2260/board.c
@@ -7,10 +7,6 @@
 #include <cpu_func.h>
 #include <init.h>
 #include <asm/cache.h>
-#include <asm/global_data.h>
-#include <linux/usb/otg.h>
-#include <dwc3-uboot.h>
-#include <usb.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
@@ -42,31 +38,6 @@ int board_init(void)
 }
 
 #ifdef CONFIG_USB_DWC3
-static struct dwc3_device dwc3_device_data = {
-	.maximum_speed = USB_SPEED_HIGH,
-	.dr_mode = USB_DR_MODE_PERIPHERAL,
-	.index = 0,
-};
-
-int board_usb_init(int index, enum usb_init_type init)
-{
-	int node;
-	const void *blob = gd->fdt_blob;
-
-	/* find the snps,dwc3 node */
-	node = fdt_node_offset_by_compatible(blob, -1, "snps,dwc3");
-
-	dwc3_device_data.base = fdtdec_get_addr(blob, node, "reg");
-
-	return dwc3_uboot_init(&dwc3_device_data);
-}
-
-int board_usb_cleanup(int index, enum usb_init_type init)
-{
-	dwc3_uboot_exit(index);
-	return 0;
-}
-
 int g_dnl_board_usb_cable_connected(void)
 {
 	return 1;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
