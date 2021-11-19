Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD40457062
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Nov 2021 15:12:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A366C5C82A;
	Fri, 19 Nov 2021 14:12:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1947BC57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 14:12:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJ97KaW009650;
 Fri, 19 Nov 2021 15:12:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=EJSopXXZ3AnQ8JdkmTy4KNUP7QKhq9O7I7dgzV/W0/I=;
 b=YlRj2pZbINWZh+W//OgSf9f2QM7IrfODxe19BtNshpAhZ6PoqRh80hTpKoW7HKCIiIJP
 9a8wuRQGocHWRj8F11pxb7V5L5WKq6UGQw5iS2imQj37sE6oRLiEJPSXTQV24T4g3im2
 DoNP1kAzIxCgL0DiCgwbnxXDPG7RZgr/53Y/Wd88z4rs2eghe1XJBnpHfWKN0wnxVSDM
 eCHXS97EikNDB0nFzw8S5K1PTL1i4HgzJq6mvYAiPPw6GkmWMgcRGGZKHClvU3DkZPEr
 CjNwvniFEDdEr9qMRSX3X/oMxOlBllBEgQWnPVhA5pTJP5rosgQLznIKVclCQ50/1Ert IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ce910sr7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 15:12:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 686F810002A;
 Fri, 19 Nov 2021 15:12:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56F2222845C;
 Fri, 19 Nov 2021 15:12:18 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 19 Nov 2021 15:12:17
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Nov 2021 15:12:06 +0100
Message-ID: <20211119151203.1.I011e780560149e15eea06471822a1fedfac58766@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH 1/2] clk: cosmetic: reorder include files
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

Reorder include files in the U-Boot expected order:

the common.h header should always be first,
followed by other headers in order,
then headers with directories,
then local files.

It is a preliminary step for next patch.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/clk-composite.c    | 6 +++---
 drivers/clk/clk-fixed-factor.c | 9 +++++----
 drivers/clk/clk-gate.c         | 9 +++++----
 drivers/clk/clk-mux.c          | 5 +++--
 drivers/clk/clk-uclass.c       | 2 +-
 drivers/clk/clk.c              | 2 +-
 6 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index bb5351ebc0..12288e10b3 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -5,13 +5,13 @@
  */
 
 #include <common.h>
-#include <asm/io.h>
-#include <malloc.h>
+#include <clk.h>
 #include <clk-uclass.h>
+#include <malloc.h>
+#include <asm/io.h>
 #include <dm/device.h>
 #include <dm/devres.h>
 #include <linux/clk-provider.h>
-#include <clk.h>
 #include <linux/err.h>
 
 #include "clk.h"
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 8d9823bdab..9fcf30fd2e 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -6,16 +6,17 @@
  * Copyright (C) 2011 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
  */
 #include <common.h>
-#include <malloc.h>
+#include <clk.h>
 #include <clk-uclass.h>
+#include <div64.h>
+#include <malloc.h>
 #include <dm/device.h>
 #include <dm/devres.h>
 #include <linux/clk-provider.h>
-#include <div64.h>
-#include <clk.h>
-#include "clk.h"
 #include <linux/err.h>
 
+#include "clk.h"
+
 #define UBOOT_DM_CLK_IMX_FIXED_FACTOR "ccf_clk_fixed_factor"
 
 static ulong clk_factor_recalc_rate(struct clk *clk)
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 006d3b6629..708499d95a 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -8,17 +8,18 @@
  */
 
 #include <common.h>
-#include <asm/io.h>
-#include <malloc.h>
+#include <clk.h>
 #include <clk-uclass.h>
+#include <malloc.h>
+#include <asm/io.h>
 #include <dm/device.h>
 #include <dm/devres.h>
 #include <linux/bitops.h>
 #include <linux/clk-provider.h>
-#include <clk.h>
-#include "clk.h"
 #include <linux/err.h>
 
+#include "clk.h"
+
 #define UBOOT_DM_CLK_GATE "clk_gate"
 
 /**
diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index f1becd20d8..fd746f2de3 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -24,14 +24,15 @@
 #include <common.h>
 #include <clk.h>
 #include <clk-uclass.h>
+#include <malloc.h>
+#include <asm/io.h>
 #include <dm/device.h>
 #include <dm/devres.h>
 #include <dm/uclass.h>
 #include <linux/bitops.h>
-#include <malloc.h>
-#include <asm/io.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
+
 #include "clk.h"
 
 #define UBOOT_DM_CLK_CCF_MUX "ccf_clk_mux"
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 493018b33e..f2d2642754 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -16,6 +16,7 @@
 #include <errno.h>
 #include <log.h>
 #include <malloc.h>
+#include <asm/global_data.h>
 #include <dm/device_compat.h>
 #include <dm/device-internal.h>
 #include <dm/devres.h>
@@ -23,7 +24,6 @@
 #include <linux/bug.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
-#include <asm/global_data.h>
 
 static inline const struct clk_ops *clk_dev_ops(struct udevice *dev)
 {
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1efb7fe9f3..d1a9787071 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5,13 +5,13 @@
  */
 
 #include <common.h>
+#include <clk.h>
 #include <clk-uclass.h>
 #include <log.h>
 #include <dm/device.h>
 #include <dm/uclass.h>
 #include <dm/lists.h>
 #include <dm/device-internal.h>
-#include <clk.h>
 
 int clk_register(struct clk *clk, const char *drv_name,
 		 const char *name, const char *parent_name)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
