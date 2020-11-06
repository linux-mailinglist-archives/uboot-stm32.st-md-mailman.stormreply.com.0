Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EECD2A9B6E
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDD77C36B0B;
	Fri,  6 Nov 2020 18:02:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CC41C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HwWub014669; Fri, 6 Nov 2020 19:02:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=1i8ETSmsSlC3Gf81mbUhtpYoTIAtXmU1lCgfgPYCN9Y=;
 b=kbkSycCnUVFnn8UmvG2J/tfeqct1iNIiyQ/ptMDGhnomAo0r5ycU95XbkJGy6MM/Swf1
 g/eQSr3C5gqCjHCp0LqS6eEH4AUpDd+tNd5wDg1V5daeyB3ZrqmDQGd4xrmHbOf4/wIm
 Qo/XyC1XF/wksXfBb/PNPz97dR+K5lRjply7MZaaFNK9z3Jb8Diy6vEWZIYGtbzvXnPi
 b8hutynVxz1nIi8mhCR8MCFMpN1dyi5Z0Uon4/1Vmb2glx08ILyLlvHnNEyzwU5rdWr7
 oL39cwjVyJjxFFoKC7IzWHK6KXhT41XUy0IXZUttB6AxGZM28YKi6g0cw9505ZEwHzWa tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1xgb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 752F210002A;
 Fri,  6 Nov 2020 19:02:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F1B824C7A5;
 Fri,  6 Nov 2020 19:02:27 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:26
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:41 +0100
Message-ID: <20201106180201.31784-14-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 13/33] watchdog: stm32mp: migrate trace to
	dev macro
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

Change debug and pr_err to dev macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/watchdog/stm32mp_wdt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/stm32mp_wdt.c b/drivers/watchdog/stm32mp_wdt.c
index f673fce327..109adc8332 100644
--- a/drivers/watchdog/stm32mp_wdt.c
+++ b/drivers/watchdog/stm32mp_wdt.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_WDT
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
@@ -10,6 +12,7 @@
 #include <syscon.h>
 #include <wdt.h>
 #include <asm/io.h>
+#include <dm/device_compat.h>
 #include <linux/bitops.h>
 #include <linux/iopoll.h>
 
@@ -77,7 +80,7 @@ static int stm32mp_wdt_start(struct udevice *dev, u64 timeout_ms, ulong flags)
 				 val & (SR_PVU | SR_RVU), CONFIG_SYS_HZ);
 
 	if (ret < 0) {
-		pr_err("Updating IWDG registers timeout");
+		dev_err(dev, "Updating IWDG registers timeout");
 		return -ETIMEDOUT;
 	}
 
@@ -90,7 +93,7 @@ static int stm32mp_wdt_probe(struct udevice *dev)
 	struct clk clk;
 	int ret;
 
-	debug("IWDG init\n");
+	dev_dbg(dev, "IWDG init\n");
 
 	priv->base = dev_read_addr(dev);
 	if (priv->base == FDT_ADDR_T_NONE)
@@ -112,7 +115,7 @@ static int stm32mp_wdt_probe(struct udevice *dev)
 
 	priv->wdt_clk_rate = clk_get_rate(&clk);
 
-	debug("IWDG init done\n");
+	dev_dbg(dev, "IWDG init done\n");
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
