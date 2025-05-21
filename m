Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B30EABF678
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 15:44:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A0CDC7A826;
	Wed, 21 May 2025 13:44:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3A00C7A825
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 13:44:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LALCqG011296;
 Wed, 21 May 2025 15:44:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 IWyexiCNRQlpD8T0DbuyXMnLgVgMW6aPrMDsIMtlRyI=; b=AOq80lRpyO7NU5mj
 27H8kmiZw+EatXkfTE4JHB5/nBhfbWlFjy4eW8uESD7R/he17V2EiKqA01eu+9md
 IN2fVdiSVvB7Ko/derT9RfssBDSIVqxSTj6cPdfcfyJlQy131bLQ5Ijy6rqoTRMw
 1TWXhPmYjivW8xa9cRZEEMEbaYOa7sCC3l/Q0di7GnlIV4zpVcTWp1pHR85oYg98
 3qUanq1aBrddeW1Sj8UAyD8Zqn2nld/+pue6iO53SKoMt+CBazVMTjROB7WHsREY
 fdV9+husX9+TJ/oAzIhjwPrDK7jEx7yR3oRNqC7ykWvN2y7DPBogVSDSbFepy/3o
 I4SCOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfc4a8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 15:44:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C949E40047;
 Wed, 21 May 2025 15:42:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C382B2CB68;
 Wed, 21 May 2025 15:41:33 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 15:41:32 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 May 2025 15:41:08 +0200
Message-ID: <20250521134117.2828335-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
References: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Kongyang Liu <seashell11234455@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, Alexander Dahl <ada@thorsis.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: [Uboot-stm32] [PATCH v1 04/13] clk: add CONFIG_CLK_AUTO_ID
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Add a new config CONFIG_CLK_AUTO_ID to support a unique clk id
for all the clock providers, managed by clk uclass, when the clock
reference arg[0] is the same.

When the CONFIG is activated, the clock id is limited to the lower
CLK_ID_SZ = 24 bits in default clock xlate function
and the sequence number + 1 of the clk provider device is
added for the 8 higher bits.

We use sequence number + 1 to avoid the "dummy" clock id = 0,
used for invalid clock when CCF is activated.

When this config is activated, the new function clk_get_id()
should be used to get back the internal reference to clock
for the each clock provider.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Sean Anderson <seanga2@gmail.com>
---

 drivers/clk/Kconfig                | 10 ++++++++++
 drivers/clk/clk-uclass.c           |  9 +++++++--
 drivers/clk/stm32/clk-stm32-core.c |  3 ++-
 include/clk.h                      | 24 ++++++++++++++++++++++++
 include/linux/clk-provider.h       |  9 ++++++++-
 5 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 18bd640a68b..b2e53fe325e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -10,6 +10,16 @@ config CLK
 	  feed into other clocks in a tree structure, with multiplexers to
 	  choose the source for each clock.
 
+config CLK_AUTO_ID
+	bool "Enable support of an unique clock id with several provider"
+	depends on CLK
+	help
+	  Add the uclass sequence number of clock provider in the 8 higher bits
+	  of the clk id to guaranty an unique clock identifier in clk uclass
+	  when several clock providers are present on the device and when
+	  default xlate are used.
+	  This feature limit each identifier for each clock providers (24 bits).
+
 config SPL_CLK
 	bool "Enable clock support in SPL"
 	depends on CLK && SPL && SPL_DM
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 2167cd5ad0f..7262e89b512 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -34,6 +34,11 @@ struct clk *dev_get_clk_ptr(struct udevice *dev)
 	return (struct clk *)dev_get_uclass_priv(dev);
 }
 
+ulong clk_get_id(const struct clk *clk)
+{
+	return (ulong)(clk->id & CLK_ID_MSK);
+}
+
 #if CONFIG_IS_ENABLED(OF_PLATDATA)
 int clk_get_by_phandle(struct udevice *dev, const struct phandle_1_arg *cells,
 		       struct clk *clk)
@@ -43,7 +48,7 @@ int clk_get_by_phandle(struct udevice *dev, const struct phandle_1_arg *cells,
 	ret = device_get_by_ofplat_idx(cells->idx, &clk->dev);
 	if (ret)
 		return ret;
-	clk->id = cells->arg[0];
+	clk->id = CLK_ID(dev, cells->arg[0]);
 
 	return 0;
 }
@@ -61,7 +66,7 @@ static int clk_of_xlate_default(struct clk *clk,
 	}
 
 	if (args->args_count)
-		clk->id = args->args[0];
+		clk->id = CLK_ID(clk->dev, args->args[0]);
 	else
 		clk->id = 0;
 
diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 358ee56682a..df3b35b1003 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -46,7 +46,8 @@ int stm32_rcc_init(struct udevice *dev,
 
 		if (cfg->setup) {
 			clk = cfg->setup(dev, cfg);
-			clk->id = cfg->id;
+			/* set identifier of clock provider*/
+			dev_clk_dm(dev, cfg->id, clk);
 		} else {
 			dev_err(dev, "failed to register clock %s\n", cfg->name);
 			return -ENOENT;
diff --git a/include/clk.h b/include/clk.h
index a6ef4e02692..f94135ff778 100644
--- a/include/clk.h
+++ b/include/clk.h
@@ -13,6 +13,15 @@
 #include <linux/errno.h>
 #include <linux/types.h>
 
+#ifdef CONFIG_CLK_AUTO_ID
+#define CLK_ID_SZ	24
+#define CLK_ID_MSK	GENMASK(23, 0)
+#define CLK_ID(dev, id)	(((dev_seq(dev) + 1) << CLK_ID_SZ) | ((id) & CLK_ID_MSK))
+#else
+#define CLK_ID_MSK	(~0UL)
+#define CLK_ID(dev, id)	id
+#endif
+
 /**
  * DOC: Overview
  *
@@ -570,6 +579,16 @@ int clk_get_by_id(ulong id, struct clk **clkp);
  */
 bool clk_dev_binded(struct clk *clk);
 
+/**
+ * clk_get_id - get clk id
+ *
+ * @clk:	A clock struct
+ *
+ * Return: the clock identifier as it is defined by the clock provider in
+ * device tree or in platdata
+ */
+ulong clk_get_id(const struct clk *clk);
+
 #else /* CONFIG_IS_ENABLED(CLK) */
 
 static inline int clk_request(struct udevice *dev, struct clk *clk)
@@ -641,6 +660,11 @@ static inline bool clk_dev_binded(struct clk *clk)
 {
 	return false;
 }
+
+static inline ulong clk_get_id(const struct clk *clk)
+{
+	return 0;
+}
 #endif /* CONFIG_IS_ENABLED(CLK) */
 
 /**
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 267757939e0..2d754fa4287 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -15,10 +15,17 @@
 
 struct udevice;
 
+/* update clock ID for the dev = clock provider, compatible with CLK_AUTO_ID */
+static inline void dev_clk_dm(const struct udevice *dev, ulong id, struct clk *clk)
+{
+	if (!IS_ERR(clk))
+		clk->id = CLK_ID(dev, id);
+}
+
 static inline void clk_dm(ulong id, struct clk *clk)
 {
 	if (!IS_ERR(clk))
-		clk->id = id;
+		clk->id = CLK_ID(clk->dev, id);
 }
 
 /*
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
