Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6655887332F
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Mar 2024 10:55:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A1DDC6DD6E;
	Wed,  6 Mar 2024 09:55:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F3FDC64102
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 09:55:57 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4269AiVo025774; Wed, 6 Mar 2024 10:55:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=CxuXETX
 frXHhbGov3kN5GKEgkNqK1tWxUhOBsGfoeco=; b=cL1bFIMm3XUAW7pwZpx9VdS
 8RQhuiccH4iHvMDET6UqToYoi7Y3k2AvJw7YGGvJnKmq51kZcB0hmoip1k7SPwuC
 O42c0mUURi5MXER1x5RwrgD+gJrDM+UIT8aGBa6jHbbLPvagTTYOFc0KTSrcAZAO
 KS4FA17y8do+dd5uUVtYd8xT1eoKCHTZ+mQZXJCr7nXtmR7Tou/mf69VD1PVvbKP
 ycUprIjZhsJlxplgjrpeKBqr6sAuL7sKdY/T65I6kjyVc87KIjlyCj4mGtnl8UQ+
 fvHBhzAM5d5xYz5tAV8000MQipSp407HEmQTHMjW33CG2vH6PH0l9z3S59aqrPg=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wmej577dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Mar 2024 10:55:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 455FB4002D;
 Wed,  6 Mar 2024 10:55:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A2C32535C5;
 Wed,  6 Mar 2024 10:54:55 +0100 (CET)
Received: from localhost (10.201.21.177) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Mar
 2024 10:54:55 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 6 Mar 2024 10:54:06 +0100
Message-ID: <20240306095406.314825-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_05,2024-03-05_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Eugen Hristev <eugen.hristev@collabora.com>,
 Stefan Bosch <stefan_b@posteo.net>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Prusov <ivprusov@salutedevices.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH] mtd: rawnand: stm32_fmc2: add MP25 support
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

FMC2 IP supports up to 4 chip select. On MP1 SoC, only 2 of them are
available when on MP25 SoC, the 4 chip select are available.

Let's use a platform data structure for parameters that will differ.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 47 ++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 3528824575b..d284b8cbb12 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -34,7 +34,7 @@
 #define FMC2_RB_DELAY_US		30
 
 /* Max chip enable */
-#define FMC2_MAX_CE			2
+#define FMC2_MAX_CE			4
 
 /* Timings */
 #define FMC2_THIZ			1
@@ -160,6 +160,11 @@ static inline struct stm32_fmc2_nand *to_fmc2_nand(struct nand_chip *chip)
 	return container_of(chip, struct stm32_fmc2_nand, chip);
 }
 
+struct stm32_fmc2_nfc_data {
+	int max_ncs;
+	struct udevice *(*get_cdev)(struct udevice *dev);
+};
+
 struct stm32_fmc2_nfc {
 	struct nand_hw_control base;
 	struct stm32_fmc2_nand nand;
@@ -169,6 +174,7 @@ struct stm32_fmc2_nfc {
 	fdt_addr_t cmd_base[FMC2_MAX_CE];
 	fdt_addr_t addr_base[FMC2_MAX_CE];
 	struct clk clk;
+	const struct stm32_fmc2_nfc_data *data;
 
 	u8 cs_assigned;
 	int cs_sel;
@@ -815,7 +821,7 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc, ofnode node)
 	}
 
 	for (i = 0; i < nand->ncs; i++) {
-		if (cs[i] >= FMC2_MAX_CE) {
+		if (cs[i] >= nfc->data->max_ncs) {
 			log_err("Invalid reg value: %d\n", nand->cs_used[i]);
 			return -EINVAL;
 		}
@@ -906,10 +912,18 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 	spin_lock_init(&nfc->controller.lock);
 	init_waitqueue_head(&nfc->controller.wq);
 
-	cdev = stm32_fmc2_nfc_get_cdev(dev);
-	if (!cdev)
+	nfc->data = (void *)dev_get_driver_data(dev);
+	if (!nfc->data)
 		return -EINVAL;
 
+	if (nfc->data->get_cdev) {
+		cdev = nfc->data->get_cdev(dev);
+		if (!cdev)
+			return -EINVAL;
+	} else {
+		cdev = dev->parent;
+	}
+
 	ret = stm32_fmc2_nfc_parse_dt(dev, nfc);
 	if (ret)
 		return ret;
@@ -921,7 +935,7 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 	if (dev == cdev)
 		start_region = 1;
 
-	for (chip_cs = 0, mem_region = start_region; chip_cs < FMC2_MAX_CE;
+	for (chip_cs = 0, mem_region = start_region; chip_cs < nfc->data->max_ncs;
 	     chip_cs++, mem_region += 3) {
 		if (!(nfc->cs_assigned & BIT(chip_cs)))
 			continue;
@@ -1033,9 +1047,28 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 	return nand_register(0, mtd);
 }
 
+static const struct stm32_fmc2_nfc_data stm32_fmc2_nfc_mp1_data = {
+	.max_ncs = 2,
+	.get_cdev = stm32_fmc2_nfc_get_cdev,
+};
+
+static const struct stm32_fmc2_nfc_data stm32_fmc2_nfc_mp25_data = {
+	.max_ncs = 4,
+};
+
 static const struct udevice_id stm32_fmc2_nfc_match[] = {
-	{ .compatible = "st,stm32mp15-fmc2" },
-	{ .compatible = "st,stm32mp1-fmc2-nfc" },
+	{
+		.compatible = "st,stm32mp15-fmc2",
+		.data = (ulong)&stm32_fmc2_nfc_mp1_data,
+	},
+	{
+		.compatible = "st,stm32mp1-fmc2-nfc",
+		.data = (ulong)&stm32_fmc2_nfc_mp1_data,
+	},
+	{
+		.compatible = "st,stm32mp25-fmc2-nfc",
+		.data = (ulong)&stm32_fmc2_nfc_mp25_data,
+	},
 	{ /* Sentinel */ }
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
