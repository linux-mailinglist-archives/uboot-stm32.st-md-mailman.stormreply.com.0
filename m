Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D09561485
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 10:17:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BED95C5F1D5;
	Thu, 30 Jun 2022 08:17:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF29CC04004
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 08:17:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U2ctUJ022248;
 Thu, 30 Jun 2022 10:17:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=TCyDUvi+uPi16odgoJW/LhAG30UqOem2mXDc50YYIVw=;
 b=YhLcLAgahLTJ6smOWNDJtLj9E2FXzntwFIGEq5EeE788kTN1Y1poOEhcgAnLW5Lnp60h
 SxbRMcLBd5f5m+SApekATBAAC1sYb4BVMPUO69aXOyCiJiI+qPXcJUUq2mwZVfjgEnIR
 vTosn1r0F1V8t8aP7sxKdaXviLcwqUPjqP7fLJDlgut6wrMs+7Jm/HS27l5wDJWG0gIM
 eCmyV3kFaSP2e5/cv11dIDt2VAJUGk+g3LcCtHgD0rYgIAS99toQHlZgHLIx3ma3b95o
 6MY/K1RbUb/OMBx8n/KWLsAvAPRx3s3fMRVWiJZKHIFJWrKDgzSM0EGUalBOxQ4DyD/i zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwsq1meea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 10:17:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1932010003A;
 Thu, 30 Jun 2022 10:17:11 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07D982132C5;
 Thu, 30 Jun 2022 10:17:11 +0200 (CEST)
Received: from localhost (10.75.127.44) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 10:16:38 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jun 2022 10:16:26 +0200
Message-ID: <20220630101610.2.Idaf694f05913720a34cb73c69b896b6ce34a3d9a@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630101610.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220630101610.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_04,2022-06-28_01,2022-06-22_01
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

(no changes since v1)

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
