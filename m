Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AFE7A681B
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Sep 2023 17:30:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AED34C6C828;
	Tue, 19 Sep 2023 15:30:03 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4403C6C824
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 15:30:02 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38JCaYIn002150; Tue, 19 Sep 2023 17:30:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=d4EUTCyAHuMJ6Wje3nVBEW2t8NQeUFX6MTzqGMpr81o=; b=Xb
 r5Rse1N5JfKLdkf9ZTiONOQbGe5UFkSzdffnB8DNRC7qERSEv2WfJqTEGBSKgbAu
 3jFtUyh/5X0TaWPPh0cFL9SLDDm2mtjCpgK2/REGpFCBY0HE9tmr1yqblJ816j2W
 b6GQIE2KXpfMbB+FgLW7GIorvNBYB0rkAlmMCUH/pnC37SGHFAB+0XtGvNPPv3Hc
 7UAGOr1tWDrFV6yb45BnZZKJg2aFcPYvvhYTNC7WHhTuAVy5JMMv9ou1+9h+5iDq
 bXgzmjaF5KROKe63WN4ObACLJkKwxyNyk53qGPm2+UYJnX/+pcSApwXFT/Eugg7g
 plisZ07sx5YE8KyLm4MA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t5qahsrwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 17:30:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D3F8100058;
 Tue, 19 Sep 2023 17:30:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C5DE21BF67;
 Tue, 19 Sep 2023 17:30:00 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 17:29:59 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 19 Sep 2023 17:27:58 +0200
Message-ID: <20230919152759.327420-7-gatien.chevallier@foss.st.com>
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
Subject: [Uboot-stm32] [PATCH v3 6/7] rng: stm32: Implement custom RNG
	configuration support
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

STM32 RNG configuration should best fit the requirements of the
platform. Therefore, put a platform-specific RNG configuration
field in the platform data. Default RNG configuration for STM32MP13
is the NIST certified configuration [1].

While there, fix and the RNG init sequence to support all RNG
versions.

[1] https://csrc.nist.gov/projects/cryptographic-module-validation-program/entropy-validations/certificate/53

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Changes in V2:
	- Added Patrick's tag

 drivers/rng/stm32_rng.c | 54 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/rng/stm32_rng.c b/drivers/rng/stm32_rng.c
index b1a790b217..c397b4d95c 100644
--- a/drivers/rng/stm32_rng.c
+++ b/drivers/rng/stm32_rng.c
@@ -21,8 +21,15 @@
 #define RNG_CR			0x00
 #define RNG_CR_RNGEN		BIT(2)
 #define RNG_CR_CED		BIT(5)
+#define RNG_CR_CONFIG1		GENMASK(11, 8)
+#define RNG_CR_NISTC		BIT(12)
+#define RNG_CR_CONFIG2		GENMASK(15, 13)
 #define RNG_CR_CLKDIV_SHIFT	16
+#define RNG_CR_CLKDIV		GENMASK(19, 16)
+#define RNG_CR_CONFIG3		GENMASK(25, 20)
 #define RNG_CR_CONDRST		BIT(30)
+#define RNG_CR_ENTROPY_SRC_MASK	(RNG_CR_CONFIG1 | RNG_CR_NISTC | RNG_CR_CONFIG2 | RNG_CR_CONFIG3)
+#define RNG_CR_CONFIG_MASK	(RNG_CR_ENTROPY_SRC_MASK | RNG_CR_CED | RNG_CR_CLKDIV)
 
 #define RNG_SR		0x04
 #define RNG_SR_SEIS	BIT(6)
@@ -32,17 +39,28 @@
 
 #define RNG_DR		0x08
 
+#define RNG_NSCR		0x0C
+#define RNG_NSCR_MASK		GENMASK(17, 0)
+
+#define RNG_HTCR	0x10
+
 #define RNG_NB_RECOVER_TRIES	3
 
 /*
  * struct stm32_rng_data - RNG compat data
  *
  * @max_clock_rate:	Max RNG clock frequency, in Hertz
+ * @cr:			Entropy source configuration
+ * @nscr:		Noice sources control configuration
+ * @htcr:		Health tests configuration
  * @has_cond_reset:	True if conditionnal reset is supported
  *
  */
 struct stm32_rng_data {
 	uint max_clock_rate;
+	u32 cr;
+	u32 nscr;
+	u32 htcr;
 	bool has_cond_reset;
 };
 
@@ -244,28 +262,48 @@ static int stm32_rng_init(struct stm32_rng_plat *pdata)
 
 	cr = readl(pdata->base + RNG_CR);
 
-	if (pdata->data->has_cond_reset) {
+	/*
+	 * Keep default RNG configuration if none was specified, that is when conf.cr is set to 0.
+	 */
+	if (pdata->data->has_cond_reset && pdata->data->cr) {
 		uint clock_div = stm32_rng_clock_freq_restrain(pdata);
 
-		cr |= RNG_CR_CONDRST | (clock_div << RNG_CR_CLKDIV_SHIFT);
+		cr &= ~RNG_CR_CONFIG_MASK;
+		cr |= RNG_CR_CONDRST | (pdata->data->cr & RNG_CR_ENTROPY_SRC_MASK) |
+		      (clock_div << RNG_CR_CLKDIV_SHIFT);
 		if (pdata->ced)
 			cr &= ~RNG_CR_CED;
 		else
 			cr |= RNG_CR_CED;
 		writel(cr, pdata->base + RNG_CR);
+
+		/* Health tests and noise control registers */
+		writel_relaxed(pdata->data->htcr, pdata->base + RNG_HTCR);
+		writel_relaxed(pdata->data->nscr & RNG_NSCR_MASK, pdata->base + RNG_NSCR);
+
 		cr &= ~RNG_CR_CONDRST;
 		cr |= RNG_CR_RNGEN;
 		writel(cr, pdata->base + RNG_CR);
 		err = readl_poll_timeout(pdata->base + RNG_CR, cr,
 					 (!(cr & RNG_CR_CONDRST)), 10000);
-		if (err)
+		if (err) {
+			log_err("%s: Timeout!",  __func__);
 			return err;
+		}
 	} else {
+		if (pdata->data->has_cond_reset)
+			cr |= RNG_CR_CONDRST;
+
 		if (pdata->ced)
 			cr &= ~RNG_CR_CED;
 		else
 			cr |= RNG_CR_CED;
 
+		writel(cr, pdata->base + RNG_CR);
+
+		if (pdata->data->has_cond_reset)
+			cr &= ~RNG_CR_CONDRST;
+
 		cr |= RNG_CR_RNGEN;
 
 		writel(cr, pdata->base + RNG_CR);
@@ -276,6 +314,9 @@ static int stm32_rng_init(struct stm32_rng_plat *pdata)
 
 	err = readl_poll_timeout(pdata->base + RNG_SR, sr,
 				 sr & RNG_SR_DRDY, 10000);
+	if (err)
+		log_err("%s: Timeout!",  __func__);
+
 	return err;
 }
 
@@ -335,11 +376,18 @@ static const struct dm_rng_ops stm32_rng_ops = {
 static const struct stm32_rng_data stm32mp13_rng_data = {
 	.has_cond_reset = true,
 	.max_clock_rate = 48000000,
+	.htcr = 0x969D,
+	.nscr = 0x2B5BB,
+	.cr = 0xF00D00,
 };
 
 static const struct stm32_rng_data stm32_rng_data = {
 	.has_cond_reset = false,
 	.max_clock_rate = 3000000,
+	/* Not supported */
+	.htcr = 0,
+	.nscr = 0,
+	.cr = 0,
 };
 
 static const struct udevice_id stm32_rng_match[] = {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
