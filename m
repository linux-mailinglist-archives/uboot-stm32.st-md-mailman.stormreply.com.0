Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C823B7A6818
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Sep 2023 17:30:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DE93C6C822;
	Tue, 19 Sep 2023 15:30:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0104EC6B477
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 15:30:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JCacp7012954; Tue, 19 Sep 2023 17:29:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=Xz1Ut3XBqlNj7J61CsftU3HiIZHrC9QCygGzE5t3yDU=; b=Ss
 QGWkm0dWnHoKrWmG3hAButQXKWnmd1WGGnLd6okR7Qt96xqU7M2dRsW+ZqEbFJFf
 feyEtp4i1kJJ8I20zH74NW1W+lZHlpwjEJBcadD4Ih/Wu7ilalfty2D8cZ6V9SDJ
 5VqFJjeApfFCoh1IHBaQRrP4aRaLGI6PrZa+ALrUL0JY1sLclin73/3mbiS1c7q/
 Nxd8bnJwu5zxZepElT/ddhuzRinz5GJ8Vs7k5oJt617pC4ZPlKNFSmZV7wi7MuMf
 FsRFL/lI2aSnp8th6iR/CfYOM5zArJjI3TL9t8HDvBOHUK2rcAMu3d1GRke1//h4
 UJR3Zd4a9iysMO7kSxFQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t51g44145-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 17:29:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BDE3100058;
 Tue, 19 Sep 2023 17:29:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53DA321BF67;
 Tue, 19 Sep 2023 17:29:58 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 17:29:58 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 19 Sep 2023 17:27:56 +0200
Message-ID: <20230919152759.327420-5-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919152759.327420-1-gatien.chevallier@foss.st.com>
References: <20230919152759.327420-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 4/7] rng: stm32: add RNG clock frequency
	restraint
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

In order to ensure a good RNG quality and compatibility with
certified RNG configuration, add RNG clock frequency restraint.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Changes in V2:
	- Added Patrick's tag

 drivers/rng/stm32_rng.c | 43 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/rng/stm32_rng.c b/drivers/rng/stm32_rng.c
index ada5d92214..f943acd7d2 100644
--- a/drivers/rng/stm32_rng.c
+++ b/drivers/rng/stm32_rng.c
@@ -18,10 +18,11 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 
-#define RNG_CR		0x00
-#define RNG_CR_RNGEN	BIT(2)
-#define RNG_CR_CED	BIT(5)
-#define RNG_CR_CONDRST	BIT(30)
+#define RNG_CR			0x00
+#define RNG_CR_RNGEN		BIT(2)
+#define RNG_CR_CED		BIT(5)
+#define RNG_CR_CLKDIV_SHIFT	16
+#define RNG_CR_CONDRST		BIT(30)
 
 #define RNG_SR		0x04
 #define RNG_SR_SEIS	BIT(6)
@@ -31,7 +32,15 @@
 
 #define RNG_DR		0x08
 
+/*
+ * struct stm32_rng_data - RNG compat data
+ *
+ * @max_clock_rate:	Max RNG clock frequency, in Hertz
+ * @has_cond_reset:	True if conditionnal reset is supported
+ *
+ */
 struct stm32_rng_data {
+	uint max_clock_rate;
 	bool has_cond_reset;
 };
 
@@ -87,6 +96,26 @@ static int stm32_rng_read(struct udevice *dev, void *data, size_t len)
 	return 0;
 }
 
+static uint stm32_rng_clock_freq_restrain(struct stm32_rng_plat *pdata)
+{
+	ulong clock_rate = 0;
+	uint clock_div = 0;
+
+	clock_rate = clk_get_rate(&pdata->clk);
+
+	/*
+	 * Get the exponent to apply on the CLKDIV field in RNG_CR register.
+	 * No need to handle the case when clock-div > 0xF as it is physically
+	 * impossible.
+	 */
+	while ((clock_rate >> clock_div) > pdata->data->max_clock_rate)
+		clock_div++;
+
+	log_debug("RNG clk rate : %lu\n", clk_get_rate(&pdata->clk) >> clock_div);
+
+	return clock_div;
+}
+
 static int stm32_rng_init(struct stm32_rng_plat *pdata)
 {
 	int err;
@@ -99,7 +128,9 @@ static int stm32_rng_init(struct stm32_rng_plat *pdata)
 	cr = readl(pdata->base + RNG_CR);
 
 	if (pdata->data->has_cond_reset) {
-		cr |= RNG_CR_CONDRST;
+		uint clock_div = stm32_rng_clock_freq_restrain(pdata);
+
+		cr |= RNG_CR_CONDRST | (clock_div << RNG_CR_CLKDIV_SHIFT);
 		if (pdata->ced)
 			cr &= ~RNG_CR_CED;
 		else
@@ -186,10 +217,12 @@ static const struct dm_rng_ops stm32_rng_ops = {
 
 static const struct stm32_rng_data stm32mp13_rng_data = {
 	.has_cond_reset = true,
+	.max_clock_rate = 48000000,
 };
 
 static const struct stm32_rng_data stm32_rng_data = {
 	.has_cond_reset = false,
+	.max_clock_rate = 3000000,
 };
 
 static const struct udevice_id stm32_rng_match[] = {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
