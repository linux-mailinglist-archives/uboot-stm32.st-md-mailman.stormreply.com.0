Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8E517B9C0
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:02:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D896EC36B16
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:02:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A5EDC36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:02:07 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0269sQ0m018606; Fri, 6 Mar 2020 11:01:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SZ1MU2ppAIyGd1nSgSIAyhzknvf7MHQRFP/Xj40Hzxo=;
 b=Vrw11yTht20Q76AJrq9RAjyj4ic/WmC/mLjfeDoCSNv1vU6jDIrQ9ilhf+n2g5PvSXXm
 yViKNYfHG6xSuUqhcc2FDlJqu4a9dDEGcDsh83it8s0QnmYoz+GHk+FLSx2UqDn2+9je
 Oq0C+Psj9+n1UGcbD/eFCFPNbAJoNyVeozpr+5gnlO8XDbQAl8pOoJqGFObJOwGX8Yo/
 L05KljaS5VU5XYdjpgSlxEq1FYJ+3/faboEKk5DH+lxeM8iQ/C2bllJvpSi9eMSBs3Hj
 GoXdfzGUxlig5fRTk+E73NdPbzE31SmeZUt/hV7/rFV3fEVtyy3go21f5XK8eg5JCRl6 Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfea7ecga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:01:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A04EB100038;
 Fri,  6 Mar 2020 11:01:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 907D62A59CF;
 Fri,  6 Mar 2020 11:01:48 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:01:48 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:01:36 +0100
Message-ID: <20200306100140.27582-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306100140.27582-1-patrick.delaunay@st.com>
References: <20200306100140.27582-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Simon Glass <sjg@chromium.org>,
 simon.k.r.goldschmidt@gmail.com, Sekhar Nori <nsekhar@ti.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 b.galvani@gmail.com, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 ley.foon.tan@intel.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v5 1/5] dm: clk: add stub when CONFIG_CLK is
	deactivated
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

Add stub for functions clk_...() when CONFIG_CLK is deactivated.

This patch avoids compilation issues for driver using these API
without protection (#if CONFIG_IS_ENABLED(CLK))

For example, before this patch we have undefined reference to
`clk_disable_bulk') for code:
  clk_disable_bulk(&priv->clks);
  clk_release_bulk(&priv->clks);

The bulk stub set and test bulk->count to avoid error for the sequence:

  clk_get_bulk(dev, &priv->bulk);
	....
  if (clk_enable(&priv>bulk))
	return -EIO;

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v5:
- use ERR_PTR in clk_get_parent()
- force bulk->count = 0 in clk_get_bulk to avoid issue
  for next call of clk_enable_bulk / clk_enable_bulk
- update commit message

Changes in v4:
- Add stub for all functions using 'struct clk' or 'struct clk_bulk'
  after remarks on v3

Changes in v3:
- Add stub for clk_disable_bulk

Changes in v2: None

 include/clk.h | 104 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 91 insertions(+), 13 deletions(-)

diff --git a/include/clk.h b/include/clk.h
index 3336301815..ca8f1cfec7 100644
--- a/include/clk.h
+++ b/include/clk.h
@@ -9,6 +9,7 @@
 #define _CLK_H_
 
 #include <dm/ofnode.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/types.h>
 
@@ -249,6 +250,8 @@ static inline int clk_get_by_index(struct udevice *dev, int index,
 
 static inline int clk_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
 {
+	if (bulk)
+		bulk->count = 0;
 	return -ENOSYS;
 }
 
@@ -312,6 +315,7 @@ static inline int clk_release_bulk(struct clk_bulk *bulk)
 	return clk_release_all(bulk->clks, bulk->count);
 }
 
+#if CONFIG_IS_ENABLED(CLK)
 /**
  * clk_request - Request a clock by provider-specific ID.
  *
@@ -433,19 +437,6 @@ int clk_disable_bulk(struct clk_bulk *bulk);
  */
 bool clk_is_match(const struct clk *p, const struct clk *q);
 
-int soc_clk_dump(void);
-
-/**
- * clk_valid() - check if clk is valid
- *
- * @clk:	the clock to check
- * @return true if valid, or false
- */
-static inline bool clk_valid(struct clk *clk)
-{
-	return clk && !!clk->dev;
-}
-
 /**
  * clk_get_by_id() - Get the clock by its ID
  *
@@ -465,6 +456,93 @@ int clk_get_by_id(ulong id, struct clk **clkp);
  * @return true on binded, or false on no
  */
 bool clk_dev_binded(struct clk *clk);
+
+#else /* CONFIG_IS_ENABLED(CLK) */
+
+static inline int clk_request(struct udevice *dev, struct clk *clk)
+{
+	return -ENOSYS;
+}
+
+static inline int clk_free(struct clk *clk)
+{
+	return -ENOSYS;
+}
+
+static inline ulong clk_get_rate(struct clk *clk)
+{
+	return -ENOSYS;
+}
+
+static inline struct clk *clk_get_parent(struct clk *clk)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline long long clk_get_parent_rate(struct clk *clk)
+{
+	return -ENOSYS;
+}
+
+static inline ulong clk_set_rate(struct clk *clk, ulong rate)
+{
+	return -ENOSYS;
+}
+
+static inline int clk_set_parent(struct clk *clk, struct clk *parent)
+{
+	return -ENOSYS;
+}
+
+static inline int clk_enable(struct clk *clk)
+{
+	return -ENOSYS;
+}
+
+static inline int clk_enable_bulk(struct clk_bulk *bulk)
+{
+	return bulk && bulk->count == 0 ? 0 : -ENOSYS;
+}
+
+static inline int clk_disable(struct clk *clk)
+{
+	return -ENOSYS;
+}
+
+static inline int clk_disable_bulk(struct clk_bulk *bulk)
+{
+	return bulk && bulk->count == 0 ? 0 : -ENOSYS;
+}
+
+static inline bool clk_is_match(const struct clk *p, const struct clk *q)
+{
+	return false;
+}
+
+static inline int clk_get_by_id(ulong id, struct clk **clkp)
+{
+	return -ENOSYS;
+}
+
+static inline bool clk_dev_binded(struct clk *clk)
+{
+	return false;
+}
+#endif /* CONFIG_IS_ENABLED(CLK) */
+
+/**
+ * clk_valid() - check if clk is valid
+ *
+ * @clk:	the clock to check
+ * @return true if valid, or false
+ */
+static inline bool clk_valid(struct clk *clk)
+{
+	return clk && !!clk->dev;
+}
+
+int soc_clk_dump(void);
+
 #endif
 
 #define clk_prepare_enable(clk) clk_enable(clk)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
