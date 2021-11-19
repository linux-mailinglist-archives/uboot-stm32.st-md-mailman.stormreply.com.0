Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CB457063
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Nov 2021 15:12:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90A95C5E2CC;
	Fri, 19 Nov 2021 14:12:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30BD9C5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 14:12:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJ9Q0E6002057;
 Fri, 19 Nov 2021 15:12:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=6uhzLLeTJblAZj4NwgypnNWBoCJrmHTePOHMF7wR4N8=;
 b=bJOEqTSH7nv5zbOJmfimVirApKw/q6PlFpTFIak3wqtLm9BVVVocnR/CtI8VhtWTmPSm
 PueDTBFkebFb1348dkPvi4RNyFwwMdSsZbjXN3y9lDi9AiMlQEYT069KN0AV0ffDkuzk
 rUZ2Mc/RRkhJo0eFF80kHuAwj+DeYV49W5CedVa0b31CqPhkT0MEyq/xlSAvDVZbZLqc
 cVdquQ8RQRHhWfnMgac8PP+DkyVY6Yl8wy+bsKRMYJlvqz0URbL9I+MfkgzgrybwPH9t
 PwaRjpKMc2Z5Y7ZpxFu0lRJudADbfc57qOX+Bijo1hmvYeZw3Co6K/IRRFXyPX/7I6cs yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ce1knc23p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 15:12:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 424F810002A;
 Fri, 19 Nov 2021 15:12:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3854022845C;
 Fri, 19 Nov 2021 15:12:21 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 19 Nov 2021 15:12:20
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Nov 2021 15:12:07 +0100
Message-ID: <20211119151203.2.Ieb1b1a0cf6385c2ce53b33a6d925c0abc3aebfa0@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119151203.1.I011e780560149e15eea06471822a1fedfac58766@changeid>
References: <20211119151203.1.I011e780560149e15eea06471822a1fedfac58766@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH 2/2] clk: define LOG_CATEGORY for generic and
	ccf clocks
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

Define LOG_CATEGORY to allow filtering with log command
for generic clock and CCF clocks.

This patch also change existing printf, debug and pr_ macro
to log_ or dev_ macro.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/clk-composite.c    |  3 +++
 drivers/clk/clk-divider.c      |  6 +++++-
 drivers/clk/clk-fixed-factor.c |  4 ++++
 drivers/clk/clk-gate.c         |  6 +++++-
 drivers/clk/clk-mux.c          |  8 ++++++--
 drivers/clk/clk.c              | 18 ++++++++++--------
 drivers/clk/clk_fixed_factor.c |  3 +++
 drivers/clk/clk_fixed_rate.c   |  3 +++
 8 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 12288e10b3..6eb2b8133a 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -4,9 +4,12 @@
  * Copyright 2019 NXP
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk.h>
 #include <clk-uclass.h>
+#include <log.h>
 #include <malloc.h>
 #include <asm/io.h>
 #include <dm/device.h>
diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 9df50a5e72..7e8e62feee 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -9,14 +9,18 @@
  *
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <asm/io.h>
 #include <malloc.h>
 #include <clk-uclass.h>
+#include <log.h>
 #include <dm/device.h>
 #include <dm/devres.h>
 #include <dm/uclass.h>
 #include <dm/lists.h>
+#include <dm/device_compat.h>
 #include <dm/device-internal.h>
 #include <linux/bug.h>
 #include <linux/clk-provider.h>
@@ -190,7 +194,7 @@ static struct clk *_register_divider(struct device *dev, const char *name,
 
 	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
 		if (width + shift > 16) {
-			pr_warn("divider value exceeds LOWORD field\n");
+			dev_warn(dev, "divider value exceeds LOWORD field\n");
 			return ERR_PTR(-EINVAL);
 		}
 	}
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 9fcf30fd2e..2a446788e1 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -5,10 +5,14 @@
  *
  * Copyright (C) 2011 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
  */
+
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk.h>
 #include <clk-uclass.h>
 #include <div64.h>
+#include <log.h>
 #include <malloc.h>
 #include <dm/device.h>
 #include <dm/devres.h>
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 708499d95a..aa40daf3d7 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -7,12 +7,16 @@
  * Gated clock implementation
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk.h>
+#include <log.h>
 #include <clk-uclass.h>
 #include <malloc.h>
 #include <asm/io.h>
 #include <dm/device.h>
+#include <dm/device_compat.h>
 #include <dm/devres.h>
 #include <linux/bitops.h>
 #include <linux/clk-provider.h>
@@ -124,7 +128,7 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 
 	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
 		if (bit_idx > 15) {
-			pr_err("gate bit exceeds LOWORD field\n");
+			dev_err(dev, "gate bit exceeds LOWORD field\n");
 			return ERR_PTR(-EINVAL);
 		}
 	}
diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index fd746f2de3..b49946fbcd 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -21,12 +21,16 @@
  * clock.
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk.h>
 #include <clk-uclass.h>
+#include <log.h>
 #include <malloc.h>
 #include <asm/io.h>
 #include <dm/device.h>
+#include <dm/device_compat.h>
 #include <dm/devres.h>
 #include <dm/uclass.h>
 #include <linux/bitops.h>
@@ -124,7 +128,7 @@ static int clk_mux_set_parent(struct clk *clk, struct clk *parent)
 
 	index = clk_fetch_parent_index(clk, parent);
 	if (index < 0) {
-		printf("Could not fetch index\n");
+		log_err("Could not fetch index\n");
 		return index;
 	}
 
@@ -170,7 +174,7 @@ struct clk *clk_hw_register_mux_table(struct device *dev, const char *name,
 	if (clk_mux_flags & CLK_MUX_HIWORD_MASK) {
 		width = fls(mask) - ffs(mask) + 1;
 		if (width + shift > 16) {
-			pr_err("mux value exceeds LOWORD field\n");
+			dev_err(dev, "mux value exceeds LOWORD field\n");
 			return ERR_PTR(-EINVAL);
 		}
 	}
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d1a9787071..eff0fa134f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4,6 +4,8 @@
  * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk.h>
 #include <clk-uclass.h>
@@ -22,24 +24,24 @@ int clk_register(struct clk *clk, const char *drv_name,
 
 	ret = uclass_get_device_by_name(UCLASS_CLK, parent_name, &parent);
 	if (ret) {
-		printf("%s: failed to get %s device (parent of %s)\n",
-		       __func__, parent_name, name);
+		log_err("%s: failed to get %s device (parent of %s)\n",
+			__func__, parent_name, name);
 	} else {
-		debug("%s: name: %s parent: %s [0x%p]\n", __func__, name,
-		      parent->name, parent);
+		log_debug("%s: name: %s parent: %s [0x%p]\n", __func__, name,
+			  parent->name, parent);
 	}
 
 	drv = lists_driver_lookup_name(drv_name);
 	if (!drv) {
-		printf("%s: %s is not a valid driver name\n",
-		       __func__, drv_name);
+		log_err("%s: %s is not a valid driver name\n",
+			__func__, drv_name);
 		return -ENOENT;
 	}
 
 	ret = device_bind(parent, drv, name, NULL, ofnode_null(), &clk->dev);
 	if (ret) {
-		printf("%s: CLK: %s driver bind error [%d]!\n", __func__, name,
-		       ret);
+		log_err("%s: CLK: %s driver bind error [%d]!\n", __func__, name,
+			ret);
 		return ret;
 	}
 
diff --git a/drivers/clk/clk_fixed_factor.c b/drivers/clk/clk_fixed_factor.c
index 41b0d9c060..6c1139e5c5 100644
--- a/drivers/clk/clk_fixed_factor.c
+++ b/drivers/clk/clk_fixed_factor.c
@@ -5,10 +5,13 @@
  * Author: Anup Patel <anup.patel@wdc.com>
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk-uclass.h>
 #include <div64.h>
 #include <dm.h>
+#include <log.h>
 #include <linux/err.h>
 
 struct clk_fixed_factor {
diff --git a/drivers/clk/clk_fixed_rate.c b/drivers/clk/clk_fixed_rate.c
index c5a2a42c92..b5e78c7055 100644
--- a/drivers/clk/clk_fixed_rate.c
+++ b/drivers/clk/clk_fixed_rate.c
@@ -3,9 +3,12 @@
  * Copyright (C) 2016 Masahiro Yamada <yamada.masahiro@socionext.com>
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk-uclass.h>
 #include <dm.h>
+#include <log.h>
 #include <dm/device-internal.h>
 #include <linux/clk-provider.h>
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
