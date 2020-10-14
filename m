Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B2328DC8E
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD849C424B8;
	Wed, 14 Oct 2020 09:17:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82554C424B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9CpjJ010617; Wed, 14 Oct 2020 11:17:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+qeFhnpX4FPS1oaxy1dOn3GOVPtKK7Kh2uKs7wugi4o=;
 b=tQ5BSy0Et/rvzk+yYuXYwwZCQeVTOUl/HKN0KvVQ3mI5lAtxgAPzO7BRFj0HQGcyvuNV
 wuzvc0fdNdIqzu+FaePfIm7ACxz4WnBGwI9ibr31WL7NhOqb5TRYG2DDKENv66VrChmY
 LrTlITUYdquFNqtWxydayXnPsD39dDoYtG1d0w4EfrEuvP8w/19FeNNtwl7FWzFnV1VD
 mt4Smshlm/tHFQ9lFkcIQD1dgFWD33lmlrity5L/e4dk5aBR6d37M1qnBApQ6tk/neDX
 SHse6flgxzbP5mNB02mTWV7d4M8DKO4KkbYwCiTr7tWPRpu8ykwjRmDq+Curyzt1IFtx sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3455c8gc7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:17:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E05F100038;
 Wed, 14 Oct 2020 11:17:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 553262ABA3E;
 Wed, 14 Oct 2020 11:17:01 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:17:00
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:26 +0200
Message-ID: <20201014091646.4233-14-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 13/33] watchdog: stm32mp: migrate trace to dev
	macro
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
---

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
