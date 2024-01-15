Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD982D902
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 13:47:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B33ABC6DD77;
	Mon, 15 Jan 2024 12:47:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AFE1C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 12:47:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40F8PL49022610; Mon, 15 Jan 2024 13:47:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=0774PdH14/7a07qVxYHYL18rw3XmBra7PAO3xQor2aE=; b=Sm
 JqmhatpU2o444gE/USeqnJ2UjPiANqKTyl/aYCHO+MMs9jhzHG/1N0MCSUynD9ES
 Tj8H3dVnP56cHPjY5M+ptJ5d8T7ddU0ELs5ncBY1W5XfB6oTO7ghc0uYMRJXh+M3
 swmOiZS10taMenwOXJuUZ9n7yYN8Bw8wzNLFzBV28fKj0Gh86hqvvehRx6DsnpEl
 nnilnF87Q6YjzEK0T7zPpnhXwMdW6fphdBLCBjh1MMimVBwIhGexQ+xXwvx663WX
 deHXro+A3HS+36zMLi/uBJttOIDsDgkNBNgSWAy3r/id+HQheZG8iyIxEns/vK33
 JUH68prSokxb24k0hjYw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmbh0fp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 13:47:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A0D2810002A;
 Mon, 15 Jan 2024 13:47:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 982122721CD;
 Mon, 15 Jan 2024 13:47:10 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 13:47:10 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 13:46:48 +0100
Message-ID: <20240115134642.3.I65ac10c33e81b2ade646f185883504c9ab106397@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
References: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 03/12] stm32mp: bsec: add driver data
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

Add driver data in  BSEC driver to test presence of OP-TEE TA,
mandatory for STM32MP13 family and prepare the support of new device
with more OTP than 95.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 38 ++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 28a8280b2804..705c994d9307 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -20,7 +20,6 @@
 #include <linux/iopoll.h>
 #include <linux/printk.h>
 
-#define BSEC_OTP_MAX_VALUE		95
 #define BSEC_OTP_UPPER_START		32
 #define BSEC_TIMEOUT_US			10000
 
@@ -400,6 +399,11 @@ struct stm32mp_bsec_priv {
 	struct udevice *tee;
 };
 
+struct stm32mp_bsec_drvdata {
+	int size;
+	bool ta;
+};
+
 static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
 {
 	struct stm32mp_bsec_plat *plat;
@@ -609,6 +613,7 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
 			     void *buf, int size)
 {
 	struct stm32mp_bsec_priv *priv = dev_get_priv(dev);
+	struct stm32mp_bsec_drvdata *data = (struct stm32mp_bsec_drvdata *)dev_get_driver_data(dev);
 	int ret;
 	int i;
 	bool shadow = true, lock = false;
@@ -642,7 +647,7 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
 
 	otp = offs / sizeof(u32);
 
-	for (i = otp; i < (otp + nb_otp) && i <= BSEC_OTP_MAX_VALUE; i++) {
+	for (i = otp; i < (otp + nb_otp) && i < data->size; i++) {
 		u32 *addr = &((u32 *)buf)[i - otp];
 
 		if (lock)
@@ -665,6 +670,7 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
 			      const void *buf, int size)
 {
 	struct stm32mp_bsec_priv *priv = dev_get_priv(dev);
+	struct stm32mp_bsec_drvdata *data = (struct stm32mp_bsec_drvdata *)dev_get_driver_data(dev);
 	int ret = 0;
 	int i;
 	bool shadow = true, lock = false;
@@ -698,7 +704,7 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
 
 	otp = offs / sizeof(u32);
 
-	for (i = otp; i < otp + nb_otp && i <= BSEC_OTP_MAX_VALUE; i++) {
+	for (i = otp; i < otp + nb_otp && i < data->size; i++) {
 		u32 *val = &((u32 *)buf)[i - otp];
 
 		if (lock)
@@ -732,6 +738,7 @@ static int stm32mp_bsec_of_to_plat(struct udevice *dev)
 
 static int stm32mp_bsec_probe(struct udevice *dev)
 {
+	struct stm32mp_bsec_drvdata *data = (struct stm32mp_bsec_drvdata *)dev_get_driver_data(dev);
 	int otp;
 	struct stm32mp_bsec_plat *plat;
 	struct clk_bulk clk_bulk;
@@ -745,16 +752,22 @@ static int stm32mp_bsec_probe(struct udevice *dev)
 	}
 
 	if (IS_ENABLED(CONFIG_OPTEE))
-		bsec_optee_open(dev);
+		ret = bsec_optee_open(dev);
+	else
+		ret = -ENOTSUPP;
+	/* failed if OP-TEE TA is required */
+	if (data->ta && !ret)
+		return ret;
 
 	/*
 	 * update unlocked shadow for OTP cleared by the rom code
 	 * only executed in SPL, it is done in TF-A for TFABOOT
 	 */
-	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
+	if (IS_ENABLED(CONFIG_SPL_BUILD) && !data->ta) {
 		plat = dev_get_plat(dev);
 
-		for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
+		/* here 57 is the value for STM32MP15x ROM code, only MPU with SPL support*/
+		for (otp = 57; otp < data->size; otp++)
 			if (!bsec_read_SR_lock(plat->base, otp))
 				bsec_shadow_register(dev, plat->base, otp);
 	}
@@ -762,9 +775,18 @@ static int stm32mp_bsec_probe(struct udevice *dev)
 	return 0;
 }
 
+static const struct stm32mp_bsec_drvdata stm32mp13_data = {
+	.size = 96,
+	.ta = true,
+};
+
+static const struct stm32mp_bsec_drvdata stm32mp15_data = {
+	.size = 96,
+	.ta = false,
+};
 static const struct udevice_id stm32mp_bsec_ids[] = {
-	{ .compatible = "st,stm32mp13-bsec" },
-	{ .compatible = "st,stm32mp15-bsec" },
+	{ .compatible = "st,stm32mp13-bsec", .data = (ulong)&stm32mp13_data},
+	{ .compatible = "st,stm32mp15-bsec", .data = (ulong)&stm32mp15_data},
 	{}
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
