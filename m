Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 568ECABF670
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 15:43:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17226C78F97;
	Wed, 21 May 2025 13:43:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBBE5C78F6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 13:43:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LCJ6of006523;
 Wed, 21 May 2025 15:43:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dBTBQ1TyJ8eVaO2miE2mw6JB6T+uIA+i6iC/ZP2AIrQ=; b=wpniFCjTuhwoIqV7
 CEGWgcJ9Kh4u0idctqL0LA+SUZV6als5cCxv5y3wcee0CzlAvPDCNmSF6Dc4PvwT
 rPD2lHT/mrxxAR/5koC7vXAETu3prq17lb1S54PUGFss3VA5sJTqhVUs5BAyxLMI
 kg9cD5kksKW269sSna9GyeUC9W2O01HgFtN6ZaByUlrAGujEN4+Dx8nZ7A4JKUZE
 +ySoXIiDgzrBf4rHYoF10dmXk+eVR9KUnwrXc8eL0p1BEhLvLTC8cZ52jnNCVh0J
 1yfrpkq59uYpp1qADD6VO2E+YJh7x6wNVH711nYjRwlH9+aVBAerYqOWPhgShZYC
 rVDLnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfqm9ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 15:43:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7081A40051;
 Wed, 21 May 2025 15:42:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0C84B2CB79;
 Wed, 21 May 2025 15:41:34 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 15:41:34 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 May 2025 15:41:10 +0200
Message-ID: <20250521134117.2828335-7-patrice.chotard@foss.st.com>
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
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 06/13] sandbox: test: update for
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

Update the existing test dm_test_clk_ccf() with new CLK_ID macro.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Sean Anderson <seanga2@gmail.com>
---

 test/dm/clk_ccf.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/test/dm/clk_ccf.c b/test/dm/clk_ccf.c
index ac56f17b775..64c21b10c3e 100644
--- a/test/dm/clk_ccf.c
+++ b/test/dm/clk_ccf.c
@@ -32,13 +32,13 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	ut_assertok(uclass_get_device_by_name(UCLASS_MISC, "clk-test", &test_dev));
 
 	/* Test for clk_get_by_id() */
-	ret = clk_get_by_id(SANDBOX_CLK_ECSPI_ROOT, &clk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_ECSPI_ROOT), &clk);
 	ut_assertok(ret);
 	ut_asserteq_str("ecspi_root", clk->dev->name);
 	ut_asserteq(CLK_SET_RATE_PARENT, clk->flags);
 
 	/* Test for clk_get_parent_rate() */
-	ret = clk_get_by_id(SANDBOX_CLK_ECSPI1, &clk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_ECSPI1), &clk);
 	ut_assertok(ret);
 	ut_asserteq_str("ecspi1", clk->dev->name);
 	ut_asserteq(CLK_SET_RATE_PARENT, clk->flags);
@@ -47,7 +47,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	ut_asserteq(rate, 20000000);
 
 	/* test the gate of CCF */
-	ret = clk_get_by_id(SANDBOX_CLK_ECSPI0, &clk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_ECSPI0), &clk);
 	ut_assertok(ret);
 	ut_asserteq_str("ecspi0", clk->dev->name);
 	ut_asserteq(CLK_SET_RATE_PARENT, clk->flags);
@@ -56,7 +56,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	ut_asserteq(rate, 20000000);
 
 	/* Test the mux of CCF */
-	ret = clk_get_by_id(SANDBOX_CLK_USDHC1_SEL, &clk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_USDHC1_SEL), &clk);
 	ut_assertok(ret);
 	ut_asserteq_str("usdhc1_sel", clk->dev->name);
 	ut_asserteq(CLK_SET_RATE_NO_REPARENT, clk->flags);
@@ -70,7 +70,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	rate = clk_get_rate(clk);
 	ut_asserteq(rate, 60000000);
 
-	ret = clk_get_by_id(SANDBOX_CLK_PLL3_80M, &pclk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_PLL3_80M), &pclk);
 	ut_assertok(ret);
 
 	ret = clk_set_parent(clk, pclk);
@@ -79,7 +79,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	rate = clk_get_rate(clk);
 	ut_asserteq(rate, 80000000);
 
-	ret = clk_get_by_id(SANDBOX_CLK_USDHC2_SEL, &clk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_USDHC2_SEL), &clk);
 	ut_assertok(ret);
 	ut_asserteq_str("usdhc2_sel", clk->dev->name);
 	ut_asserteq(CLK_SET_RATE_NO_REPARENT, clk->flags);
@@ -97,7 +97,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	rate = clk_get_rate(clk);
 	ut_asserteq(rate, 80000000);
 
-	ret = clk_get_by_id(SANDBOX_CLK_PLL3_60M, &pclk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_PLL3_60M), &pclk);
 	ut_assertok(ret);
 
 	ret = clk_set_parent(clk, pclk);
@@ -107,7 +107,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	ut_asserteq(rate, 60000000);
 
 	/* Test the composite of CCF */
-	ret = clk_get_by_id(SANDBOX_CLK_I2C, &clk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_I2C), &clk);
 	ut_assertok(ret);
 	ut_asserteq_str("i2c", clk->dev->name);
 	ut_asserteq(CLK_SET_RATE_UNGATE, clk->flags);
@@ -124,12 +124,12 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	ret = clk_get_by_index(test_dev, SANDBOX_CLK_TEST_ID_I2C_ROOT, &clk_ccf);
 	ut_assertok(ret);
 	ut_asserteq_str("clk-ccf", clk_ccf.dev->name);
-	ut_asserteq(clk_ccf.id, SANDBOX_CLK_I2C_ROOT);
+	ut_asserteq(clk_ccf.id, CLK_ID(clk_ccf.dev, SANDBOX_CLK_I2C_ROOT));
 
-	ret = clk_get_by_id(SANDBOX_CLK_I2C_ROOT, &clk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_I2C_ROOT), &clk);
 	ut_assertok(ret);
 	ut_asserteq_str("i2c_root", clk->dev->name);
-	ut_asserteq(clk->id, SANDBOX_CLK_I2C_ROOT);
+	ut_asserteq(clk_get_id(clk), SANDBOX_CLK_I2C_ROOT);
 
 	ret = clk_enable(&clk_ccf);
 	ut_assertok(ret);
@@ -137,7 +137,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	ret = sandbox_clk_enable_count(clk);
 	ut_asserteq(ret, 1);
 
-	ret = clk_get_by_id(SANDBOX_CLK_I2C, &pclk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_I2C), &pclk);
 	ut_assertok(ret);
 
 	ret = sandbox_clk_enable_count(pclk);
@@ -153,7 +153,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	ut_asserteq(ret, 0);
 
 	/* Test clock re-parenting. */
-	ret = clk_get_by_id(SANDBOX_CLK_USDHC1_SEL, &clk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_USDHC1_SEL), &clk);
 	ut_assertok(ret);
 	ut_asserteq_str("usdhc1_sel", clk->dev->name);
 
@@ -167,7 +167,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 		clkid = SANDBOX_CLK_PLL3_60M;
 	}
 
-	ret = clk_get_by_id(clkid, &pclk);
+	ret = clk_get_by_id(CLK_ID(dev, clkid), &pclk);
 	ut_assertok(ret);
 	ret = clk_set_parent(clk, pclk);
 	ut_assertok(ret);
@@ -176,7 +176,7 @@ static int dm_test_clk_ccf(struct unit_test_state *uts)
 	ut_asserteq_str(clkname, pclk->dev->name);
 
 	/* Test disabling critical clock. */
-	ret = clk_get_by_id(SANDBOX_CLK_I2C_ROOT, &clk);
+	ret = clk_get_by_id(CLK_ID(dev, SANDBOX_CLK_I2C_ROOT), &clk);
 	ut_assertok(ret);
 	ut_asserteq_str("i2c_root", clk->dev->name);
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
