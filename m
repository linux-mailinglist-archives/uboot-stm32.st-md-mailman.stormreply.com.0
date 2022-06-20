Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E65513FA
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 11:17:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4680C03FDF;
	Mon, 20 Jun 2022 09:17:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FB25C03FDF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 09:17:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K9Dkjw018521;
 Mon, 20 Jun 2022 11:17:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=OTKz0VVXBetdW4NtsK0EqrXrS8VtEBnReehNQ6yMUTY=;
 b=JKR5+5ZrYr5PH6wHEJf4iYwahDtdGtxXN727XoEt27otKMpqvBhfXzwOS7AFcW00rTKL
 M3cYe9XsgqFH+u04XA8jtCKCptwDC7yKatkJNU7YEo/nOGrSckDLnaenBlLg0pwVTs+W
 6WJadsF/aAfZptKm/1AHLZuA9ajSMTq6IKb6XW1CHs3a0Mlw02i8awu3rAP+t02WMB3m
 sHA91l6ZHt9ohZvt88LtFq5EoT8WcfXoZpuSSNxFqLUfRmXp66SfKm04SbF7hsGo64a/
 DJPKzGCt4GMjevS/PuAc0Ta8WqU2pKVLlAtEUooQcwqg08/oh5i0Pb9mN/eF+vCt2XAI vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtp31r0rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 11:17:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15A5E100034;
 Mon, 20 Jun 2022 11:17:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0465A2171F8;
 Mon, 20 Jun 2022 11:17:25 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 11:17:24 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 11:17:05 +0200
Message-ID: <20220620111707.2.Idaf694f05913720a34cb73c69b896b6ce34a3d9a@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH 02/10] rng: stm32mp1_rng: add conditional
	reset feature for STM32MP13x
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

From: Lionel Debieve <lionel.debieve@foss.st.com>

New IP adds a conditional reset that impact the clock
error management. It is now linked to a new compatible.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/rng/stm32mp1_rng.c | 61 +++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/rng/stm32mp1_rng.c b/drivers/rng/stm32mp1_rng.c
index 8ea00e3e890..89da78c6c8b 100644
--- a/drivers/rng/stm32mp1_rng.c
+++ b/drivers/rng/stm32mp1_rng.c
@@ -18,22 +18,28 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 
-#define RNG_CR 0x00
-#define RNG_CR_RNGEN BIT(2)
-#define RNG_CR_CED BIT(5)
+#define RNG_CR		0x00
+#define RNG_CR_RNGEN	BIT(2)
+#define RNG_CR_CED	BIT(5)
+#define RNG_CR_CONDRST	BIT(30)
 
-#define RNG_SR 0x04
-#define RNG_SR_SEIS BIT(6)
-#define RNG_SR_CEIS BIT(5)
-#define RNG_SR_SECS BIT(2)
-#define RNG_SR_DRDY BIT(0)
+#define RNG_SR		0x04
+#define RNG_SR_SEIS	BIT(6)
+#define RNG_SR_CEIS	BIT(5)
+#define RNG_SR_SECS	BIT(2)
+#define RNG_SR_DRDY	BIT(0)
 
-#define RNG_DR 0x08
+#define RNG_DR		0x08
+
+struct stm32_rng_data {
+	bool has_cond_reset;
+};
 
 struct stm32_rng_plat {
 	fdt_addr_t base;
 	struct clk clk;
 	struct reset_ctl rst;
+	const struct stm32_rng_data *data;
 };
 
 static int stm32_rng_read(struct udevice *dev, void *data, size_t len)
@@ -83,18 +89,36 @@ static int stm32_rng_read(struct udevice *dev, void *data, size_t len)
 static int stm32_rng_init(struct stm32_rng_plat *pdata)
 {
 	int err;
+	u32 cr, sr;
 
 	err = clk_enable(&pdata->clk);
 	if (err)
 		return err;
 
+	cr = readl(pdata->base + RNG_CR);
+
 	/* Disable CED */
-	writel(RNG_CR_RNGEN | RNG_CR_CED, pdata->base + RNG_CR);
+	cr |= RNG_CR_CED;
+	if (pdata->data->has_cond_reset) {
+		cr |= RNG_CR_CONDRST;
+		writel(cr, pdata->base + RNG_CR);
+		cr &= ~RNG_CR_CONDRST;
+		writel(cr, pdata->base + RNG_CR);
+		err = readl_poll_timeout(pdata->base + RNG_CR, cr,
+					 (!(cr & RNG_CR_CONDRST)), 10000);
+		if (err)
+			return err;
+	}
 
 	/* clear error indicators */
 	writel(0, pdata->base + RNG_SR);
 
-	return 0;
+	cr |= RNG_CR_RNGEN;
+	writel(cr, pdata->base + RNG_CR);
+
+	err = readl_poll_timeout(pdata->base + RNG_SR, sr,
+				 sr & RNG_SR_DRDY, 10000);
+	return err;
 }
 
 static int stm32_rng_cleanup(struct stm32_rng_plat *pdata)
@@ -108,6 +132,8 @@ static int stm32_rng_probe(struct udevice *dev)
 {
 	struct stm32_rng_plat *pdata = dev_get_plat(dev);
 
+	pdata->data = (struct stm32_rng_data *)dev_get_driver_data(dev);
+
 	reset_assert(&pdata->rst);
 	udelay(20);
 	reset_deassert(&pdata->rst);
@@ -146,10 +172,17 @@ static const struct dm_rng_ops stm32_rng_ops = {
 	.read = stm32_rng_read,
 };
 
+static const struct stm32_rng_data stm32mp13_rng_data = {
+	.has_cond_reset = true,
+};
+
+static const struct stm32_rng_data stm32_rng_data = {
+	.has_cond_reset = false,
+};
+
 static const struct udevice_id stm32_rng_match[] = {
-	{
-		.compatible = "st,stm32-rng",
-	},
+	{.compatible = "st,stm32mp13-rng", .data = (ulong)&stm32mp13_rng_data},
+	{.compatible = "st,stm32-rng", .data = (ulong)&stm32_rng_data},
 	{},
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
