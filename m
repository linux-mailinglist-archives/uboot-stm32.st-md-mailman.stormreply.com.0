Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F9A109C1
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jan 2025 15:47:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 581A8C78F74;
	Tue, 14 Jan 2025 14:47:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E840BC78F64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 14:47:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EAgTPh013425;
 Tue, 14 Jan 2025 15:47:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +mM6U6aY/dFJUcyA3de+JXUZXSVIez/BPSjesZr77z8=; b=0/bLaSjAuz2K1EyD
 tzu9JLx2cM7+prjK4bdI1Xms4zAtVMCzQjipEgtfIHzU6ASqqM4D+R/YQ3hkNzgZ
 6DXLlbZotHTuP3rPzM+l72VcbaDZwekguWveAwG2w/hMeF9hAYYTjGPdBvUripO/
 H5G2fz+H9zLqBuYqmUttOgIxgJv7YS0dSJ6zpu85Jj2U7zCNxxewi0s5/Jfiseqj
 P9uSCZ2/899NKj2g1r9gte7Kx0DVlzI3+AboAeiqxa+O1i/uZPzlkcPYYcaUd8TG
 lcXXr7LZQOlZ304YKq8M0t4O1cEQwO56H22q4LHSLZXupbbsQx8ZEt7FgyLfvCK6
 p85YOQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 445pdkrxy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 15:47:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B8C4D40047;
 Tue, 14 Jan 2025 15:46:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E42A12ABA75;
 Tue, 14 Jan 2025 15:45:33 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 14 Jan
 2025 15:45:33 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Jan 2025 15:45:21 +0100
Message-ID: <20250114144528.1612168-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 03/10] usb: dwc3-generic: Reorder include
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

Reorder include following rules available here :
https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
---

 drivers/usb/dwc3/dwc3-generic.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-generic.c b/drivers/usb/dwc3/dwc3-generic.c
index 2ab41cbae45..cb96e1f344f 100644
--- a/drivers/usb/dwc3/dwc3-generic.c
+++ b/drivers/usb/dwc3/dwc3-generic.c
@@ -7,29 +7,28 @@
  * Based on dwc3-omap.c.
  */
 
+#include <clk.h>
 #include <cpu_func.h>
-#include <log.h>
 #include <dm.h>
-#include <dm/device-internal.h>
-#include <dm/lists.h>
 #include <dwc3-uboot.h>
 #include <generic-phy.h>
+#include <log.h>
+#include <malloc.h>
+#include <reset.h>
+#include <usb.h>
+#include <asm/gpio.h>
+#include <dm/device-internal.h>
+#include <dm/lists.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/printk.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
-#include <malloc.h>
 #include <power/regulator.h>
-#include <usb.h>
-#include "core.h"
-#include "gadget.h"
-#include <reset.h>
-#include <clk.h>
 #include <usb/xhci.h>
-#include <asm/gpio.h>
-
+#include "core.h"
 #include "dwc3-generic.h"
+#include "gadget.h"
 
 struct dwc3_generic_plat {
 	fdt_addr_t base;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
