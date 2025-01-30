Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD8A2322C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2025 17:45:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BC4FC78F67;
	Thu, 30 Jan 2025 16:45:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED434C6DD9A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 16:45:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UEUtm4015284;
 Thu, 30 Jan 2025 17:44:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 b/xt2kGbgJBa6s3VXcmCfq8Y5SF+zrWTckcBbDXzN7o=; b=5zeEks4KImEnZmbV
 D7hRYNcz9mObSRySBgGPArkvnQS8F7GyScFFtTKPgNGPHhSzdlxOn5uNguvsXjYd
 /0SgpFSVIJ+tsKvRs12WkN8ncXvjhJPgqkkPlepU7K38ojYR9W6zLA9BL+yFkBgq
 pINnUD+JMNNkNmiU5tbDkq8v8XpOg50IKBGyq2p8QLhPElbRT0of/rCd04xvHcJ0
 WeCoat5GGRpM8Xd1fRkPWTOcbQMAN+ykOPwfwFVHKTnhWjPBz8EaFBK3sKAvNmsI
 48LgNQ9lq+SA7TzS0GWzv6TFkaS4y7D2oJgaU/qK/YYw+maiBAZje2h8ivzjxiS7
 B9ktxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gawj0pde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2025 17:44:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5212340045;
 Thu, 30 Jan 2025 17:43:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64A223EC659;
 Thu, 30 Jan 2025 17:35:52 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 17:35:52 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jan 2025 17:35:42 +0100
Message-ID: <20250130163547.512990-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250130163547.512990-1-patrice.chotard@foss.st.com>
References: <20250130163547.512990-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v5 4/9] usb: dwc3-generic: Reorder include
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

Remove useless include files.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

---

(no changes since v3)

Changes in v3:
  - Update comment by adding "Remove useless include files"

Changes in v2:
  - remove useless include files

 drivers/usb/dwc3/dwc3-generic.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-generic.c b/drivers/usb/dwc3/dwc3-generic.c
index 2ab41cbae45..bc7d2d4234b 100644
--- a/drivers/usb/dwc3/dwc3-generic.c
+++ b/drivers/usb/dwc3/dwc3-generic.c
@@ -7,29 +7,17 @@
  * Based on dwc3-omap.c.
  */
 
-#include <cpu_func.h>
-#include <log.h>
 #include <dm.h>
-#include <dm/device-internal.h>
+#include <reset.h>
+#include <asm/gpio.h>
 #include <dm/lists.h>
-#include <dwc3-uboot.h>
-#include <generic-phy.h>
-#include <linux/bitops.h>
 #include <linux/delay.h>
-#include <linux/printk.h>
-#include <linux/usb/ch9.h>
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
