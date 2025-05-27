Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A16AEAC4FC5
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 May 2025 15:29:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6840FC36B1E;
	Tue, 27 May 2025 13:29:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56734C36B19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:29:47 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RDG7HS011128;
 Tue, 27 May 2025 15:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 RWofWQVrN6u7N4V6vFrxB/GWKCG+k61l+mivQS5qwio=; b=IG0c6J60dtqBV70J
 j3+bhfBMQuXpmcD+gEyhUgJ+mJJLyezLWz3FToyf88CDlnZsfBQdcFyR7Ggjkuaj
 bsBbgTQ2jJCk2rE+7uEGC0hiySFXb4TprvuTOlO9jFspESzIc2aR/9iTSCsuvBvB
 192PaVHEMiFTrps9RzmlUM5UaiNtBseOpG83tK5X7LTXBQI7ZVKBkI9orBn8PvSI
 MpMLYczBT8KEPkH5tnuva6pQcYe9EUzL8l7xPPfMZak7OT6SfYc2RWS6hr1DBfOE
 7blhEGaueSHIIaNYXc0jDMhr+fN+A5jcpMVMTW9LKt3ptzMf6Z8JZu0oCA4CxgPZ
 +3Htjg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4j55y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 15:29:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A52F940050;
 Tue, 27 May 2025 15:28:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0255AAEC29A;
 Tue, 27 May 2025 15:28:03 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:28:02 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 27 May 2025 15:27:47 +0200
Message-ID: <20250527132755.2169508-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 05/13] clk: sandbox: update driver for
	CONFIG_CLK_AUTO_ID support
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

Update the sandbox driver to allow support of the
CONFIG_CLK_AUTO_ID by using the new API clk_get_id()
to get the internal SANDBOX identifier.

With CONFIG_CLK_AUTO_ID, clk->id have the also seq identifier.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Sean Anderson <seanga2@gmail.com>
---

(no changes since v1)

 drivers/clk/clk_sandbox.c     | 30 +++++++++++++---------
 drivers/clk/clk_sandbox_ccf.c | 48 +++++++++++++++++------------------
 2 files changed, 42 insertions(+), 36 deletions(-)

diff --git a/drivers/clk/clk_sandbox.c b/drivers/clk/clk_sandbox.c
index 8dd77f18d90..c8c5a88c52d 100644
--- a/drivers/clk/clk_sandbox.c
+++ b/drivers/clk/clk_sandbox.c
@@ -13,24 +13,26 @@
 static ulong sandbox_clk_get_rate(struct clk *clk)
 {
 	struct sandbox_clk_priv *priv = dev_get_priv(clk->dev);
+	ulong id = clk_get_id(clk);
 
 	if (!priv->probed)
 		return -ENODEV;
 
-	if (clk->id >= SANDBOX_CLK_ID_COUNT)
+	if (id >= SANDBOX_CLK_ID_COUNT)
 		return -EINVAL;
 
-	return priv->rate[clk->id];
+	return priv->rate[id];
 }
 
 static ulong sandbox_clk_round_rate(struct clk *clk, ulong rate)
 {
 	struct sandbox_clk_priv *priv = dev_get_priv(clk->dev);
+	ulong id = clk_get_id(clk);
 
 	if (!priv->probed)
 		return -ENODEV;
 
-	if (clk->id >= SANDBOX_CLK_ID_COUNT)
+	if (id >= SANDBOX_CLK_ID_COUNT)
 		return -EINVAL;
 
 	if (!rate)
@@ -43,18 +45,19 @@ static ulong sandbox_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct sandbox_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong old_rate;
+	ulong id = clk_get_id(clk);
 
 	if (!priv->probed)
 		return -ENODEV;
 
-	if (clk->id >= SANDBOX_CLK_ID_COUNT)
+	if (id >= SANDBOX_CLK_ID_COUNT)
 		return -EINVAL;
 
 	if (!rate)
 		return -EINVAL;
 
-	old_rate = priv->rate[clk->id];
-	priv->rate[clk->id] = rate;
+	old_rate = priv->rate[id];
+	priv->rate[id] = rate;
 
 	return old_rate;
 }
@@ -62,14 +65,15 @@ static ulong sandbox_clk_set_rate(struct clk *clk, ulong rate)
 static int sandbox_clk_enable(struct clk *clk)
 {
 	struct sandbox_clk_priv *priv = dev_get_priv(clk->dev);
+	ulong id = clk_get_id(clk);
 
 	if (!priv->probed)
 		return -ENODEV;
 
-	if (clk->id >= SANDBOX_CLK_ID_COUNT)
+	if (id >= SANDBOX_CLK_ID_COUNT)
 		return -EINVAL;
 
-	priv->enabled[clk->id] = true;
+	priv->enabled[id] = true;
 
 	return 0;
 }
@@ -77,14 +81,15 @@ static int sandbox_clk_enable(struct clk *clk)
 static int sandbox_clk_disable(struct clk *clk)
 {
 	struct sandbox_clk_priv *priv = dev_get_priv(clk->dev);
+	ulong id = clk_get_id(clk);
 
 	if (!priv->probed)
 		return -ENODEV;
 
-	if (clk->id >= SANDBOX_CLK_ID_COUNT)
+	if (id >= SANDBOX_CLK_ID_COUNT)
 		return -EINVAL;
 
-	priv->enabled[clk->id] = false;
+	priv->enabled[id] = false;
 
 	return 0;
 }
@@ -92,11 +97,12 @@ static int sandbox_clk_disable(struct clk *clk)
 static int sandbox_clk_request(struct clk *clk)
 {
 	struct sandbox_clk_priv *priv = dev_get_priv(clk->dev);
+	ulong id = clk_get_id(clk);
 
-	if (clk->id >= SANDBOX_CLK_ID_COUNT)
+	if (id >= SANDBOX_CLK_ID_COUNT)
 		return -EINVAL;
 
-	priv->requested[clk->id] = true;
+	priv->requested[id] = true;
 	return 0;
 }
 
diff --git a/drivers/clk/clk_sandbox_ccf.c b/drivers/clk/clk_sandbox_ccf.c
index f96a15c30b3..9b8036d41aa 100644
--- a/drivers/clk/clk_sandbox_ccf.c
+++ b/drivers/clk/clk_sandbox_ccf.c
@@ -235,47 +235,47 @@ static int sandbox_clk_ccf_probe(struct udevice *dev)
 	void *base = NULL;
 	u32 reg;
 
-	clk_dm(SANDBOX_CLK_PLL3,
-	       sandbox_clk_pllv3(SANDBOX_PLLV3_USB, "pll3_usb_otg", "osc",
-				 base + 0x10, 0x3));
+	dev_clk_dm(dev, SANDBOX_CLK_PLL3,
+		   sandbox_clk_pllv3(SANDBOX_PLLV3_USB, "pll3_usb_otg", "osc",
+				     base + 0x10, 0x3));
 
-	clk_dm(SANDBOX_CLK_PLL3_60M,
-	       sandbox_clk_fixed_factor("pll3_60m",  "pll3_usb_otg",   1, 8));
+	dev_clk_dm(dev, SANDBOX_CLK_PLL3_60M,
+		   sandbox_clk_fixed_factor("pll3_60m", "pll3_usb_otg",   1, 8));
 
-	clk_dm(SANDBOX_CLK_PLL3_80M,
-	       sandbox_clk_fixed_factor("pll3_80m",  "pll3_usb_otg",   1, 6));
+	dev_clk_dm(dev, SANDBOX_CLK_PLL3_80M,
+		   sandbox_clk_fixed_factor("pll3_80m", "pll3_usb_otg",   1, 6));
 
 	/* The HW adds +1 to the divider value (2+1) is the divider */
 	reg = (2 << 19);
-	clk_dm(SANDBOX_CLK_ECSPI_ROOT,
-	       sandbox_clk_divider("ecspi_root", "pll3_60m", &reg, 19, 6));
+	dev_clk_dm(dev, SANDBOX_CLK_ECSPI_ROOT,
+		   sandbox_clk_divider("ecspi_root", "pll3_60m", &reg, 19, 6));
 
 	reg = 0;
-	clk_dm(SANDBOX_CLK_ECSPI0,
-	       sandbox_clk_gate("ecspi0", "ecspi_root", &reg, 0, 0));
+	dev_clk_dm(dev, SANDBOX_CLK_ECSPI0,
+		   sandbox_clk_gate("ecspi0", "ecspi_root", &reg, 0, 0));
 
-	clk_dm(SANDBOX_CLK_ECSPI1,
-	       sandbox_clk_gate2("ecspi1", "ecspi_root", base + 0x6c, 0));
+	dev_clk_dm(dev, SANDBOX_CLK_ECSPI1,
+		   sandbox_clk_gate2("ecspi1", "ecspi_root", base + 0x6c, 0));
 
 	/* Select 'pll3_60m' */
 	reg = 0;
-	clk_dm(SANDBOX_CLK_USDHC1_SEL,
-	       sandbox_clk_mux("usdhc1_sel", &reg, 16, 1, usdhc_sels,
-			       ARRAY_SIZE(usdhc_sels)));
+	dev_clk_dm(dev, SANDBOX_CLK_USDHC1_SEL,
+		   sandbox_clk_mux("usdhc1_sel", &reg, 16, 1, usdhc_sels,
+				   ARRAY_SIZE(usdhc_sels)));
 
 	/* Select 'pll3_80m' */
 	reg = BIT(17);
-	clk_dm(SANDBOX_CLK_USDHC2_SEL,
-	       sandbox_clk_mux("usdhc2_sel", &reg, 17, 1, usdhc_sels,
-			       ARRAY_SIZE(usdhc_sels)));
+	dev_clk_dm(dev, SANDBOX_CLK_USDHC2_SEL,
+		   sandbox_clk_mux("usdhc2_sel", &reg, 17, 1, usdhc_sels,
+				   ARRAY_SIZE(usdhc_sels)));
 
 	reg = BIT(28) | BIT(24) | BIT(16);
-	clk_dm(SANDBOX_CLK_I2C,
-	       sandbox_clk_composite("i2c", i2c_sels, ARRAY_SIZE(i2c_sels),
-				     &reg, CLK_SET_RATE_UNGATE));
+	dev_clk_dm(dev, SANDBOX_CLK_I2C,
+		   sandbox_clk_composite("i2c", i2c_sels, ARRAY_SIZE(i2c_sels),
+					 &reg, CLK_SET_RATE_UNGATE));
 
-	clk_dm(SANDBOX_CLK_I2C_ROOT,
-	       sandbox_clk_gate2("i2c_root", "i2c", base + 0x7c, 0));
+	dev_clk_dm(dev, SANDBOX_CLK_I2C_ROOT,
+		   sandbox_clk_gate2("i2c_root", "i2c", base + 0x7c, 0));
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
