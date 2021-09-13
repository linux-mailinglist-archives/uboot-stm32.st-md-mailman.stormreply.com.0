Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6FF4093F5
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Sep 2021 16:26:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB636C597BC;
	Mon, 13 Sep 2021 14:26:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC0B6C597AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Sep 2021 14:26:07 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DDq4Ll030449; 
 Mon, 13 Sep 2021 16:26:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=oqcTVMoFXUTbn5jCrn4gjGyQ46V0ftgKVKlezO2zhkw=;
 b=Edn3ypaoHNND0Zzvw2O/jFwenq5ZMSF4w0xLy0KpFnaSYOKWLAwzzy0NTkZTolNM/StN
 CewY7XSsPLqnG2yh1n+5RXpDrIBZ2F6U6r4DkdRXbc6OvB366RyoNnrxCsxA5OmiclN7
 JdhQm5tgrAACtb3jVqicfVvAX1a4l1n1Xfde5NWiAutzBOKJijW+OQECOn21Vc5pUGXu
 Xi9B5Te3/URxMJBDzK7wmmvAC8ih2ZJ3r3Iezi6UQAoN2qee5I94FD6EDPhhvseRA2Ug
 yF1+E00VHslWQXr6DkEuKehFbht/1IsT7lGLqPy7RE4IxVpmwbJlIXn414/rnUoxcxha /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b27wg85dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 16:26:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57F1B10002A;
 Mon, 13 Sep 2021 16:25:59 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag2node5.st.com [10.75.127.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 442B02238B4;
 Mon, 13 Sep 2021 16:25:59 +0200 (CEST)
Received: from localhost (10.75.127.49) by GPXDAG2NODE5.st.com (10.75.127.69)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 13 Sep 2021 16:25:58 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Sep 2021 16:25:53 +0200
Message-ID: <20210913142553.24333-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To GPXDAG2NODE5.st.com
 (10.75.127.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_07,2021-09-09_01,2020-04-07_01
Cc: Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Farhan Ali <farhan.ali@broadcom.com>
Subject: [Uboot-stm32] [PATCH] mtd: nand: raw: convert nand_dt_init() to
	ofnode_xx() interface
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

nand_dt_init() is still using fdtdec_xx() interface.
If OF_LIVE flag is enabled, dt property can't be get anymore.
Updating all fdtdec_xx() interface to ofnode_xx() to solve this issue.

For doing this, node parameter type must be ofnode.

First idea was to convert "node" parameter to ofnode type inside
nand_dt_init() using offset_to_ofnode(node). But offset_to_ofnode()
is not bijective, in case OF_LIVE flag is enabled, it performs an assert().

So, this leads to update nand_chip struct flash_node field from int to
ofnode and to update all nand_dt_init() callers.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/mtd/nand/raw/denali.c          |  2 +-
 drivers/mtd/nand/raw/mxs_nand.c        |  2 +-
 drivers/mtd/nand/raw/nand_base.c       | 27 +++++++++++---------------
 drivers/mtd/nand/raw/stm32_fmc2_nand.c |  2 +-
 drivers/mtd/nand/raw/sunxi_nand.c      |  2 +-
 include/linux/mtd/rawnand.h            |  6 +++---
 6 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index ab91db8546..c827f80281 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1246,7 +1246,7 @@ int denali_init(struct denali_nand_info *denali)
 
 	denali->active_bank = DENALI_INVALID_BANK;
 
-	chip->flash_node = dev_of_offset(denali->dev);
+	chip->flash_node = dev_ofnode(denali->dev);
 	/* Fallback to the default name if DT did not give "label" property */
 	if (!mtd->name)
 		mtd->name = "denali-nand";
diff --git a/drivers/mtd/nand/raw/mxs_nand.c b/drivers/mtd/nand/raw/mxs_nand.c
index e6bbfac4d6..748056a43e 100644
--- a/drivers/mtd/nand/raw/mxs_nand.c
+++ b/drivers/mtd/nand/raw/mxs_nand.c
@@ -1379,7 +1379,7 @@ int mxs_nand_init_ctrl(struct mxs_nand_info *nand_info)
 	nand->options |= NAND_NO_SUBPAGE_WRITE;
 
 	if (nand_info->dev)
-		nand->flash_node = dev_of_offset(nand_info->dev);
+		nand->flash_node = dev_ofnode(nand_info->dev);
 
 	nand->cmd_ctrl		= mxs_nand_cmd_ctrl;
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3679ee727e..b1fd779884 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -29,9 +29,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #include <common.h>
-#if CONFIG_IS_ENABLED(OF_CONTROL)
-#include <fdtdec.h>
-#endif
 #include <log.h>
 #include <malloc.h>
 #include <watchdog.h>
@@ -4576,23 +4573,20 @@ ident_done:
 EXPORT_SYMBOL(nand_get_flash_type);
 
 #if CONFIG_IS_ENABLED(OF_CONTROL)
-#include <asm/global_data.h>
-DECLARE_GLOBAL_DATA_PTR;
 
-static int nand_dt_init(struct mtd_info *mtd, struct nand_chip *chip, int node)
+static int nand_dt_init(struct mtd_info *mtd, struct nand_chip *chip, ofnode node)
 {
 	int ret, ecc_mode = -1, ecc_strength, ecc_step;
-	const void *blob = gd->fdt_blob;
 	const char *str;
 
-	ret = fdtdec_get_int(blob, node, "nand-bus-width", -1);
+	ret = ofnode_read_s32_default(node, "nand-bus-width", -1);
 	if (ret == 16)
 		chip->options |= NAND_BUSWIDTH_16;
 
-	if (fdtdec_get_bool(blob, node, "nand-on-flash-bbt"))
+	if (ofnode_read_bool(node, "nand-on-flash-bbt"))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
-	str = fdt_getprop(blob, node, "nand-ecc-mode", NULL);
+	str = ofnode_read_string(node, "nand-ecc-mode");
 	if (str) {
 		if (!strcmp(str, "none"))
 			ecc_mode = NAND_ECC_NONE;
@@ -4608,9 +4602,10 @@ static int nand_dt_init(struct mtd_info *mtd, struct nand_chip *chip, int node)
 			ecc_mode = NAND_ECC_SOFT_BCH;
 	}
 
-
-	ecc_strength = fdtdec_get_int(blob, node, "nand-ecc-strength", -1);
-	ecc_step = fdtdec_get_int(blob, node, "nand-ecc-step-size", -1);
+	ecc_strength = ofnode_read_s32_default(node,
+					       "nand-ecc-strength", -1);
+	ecc_step = ofnode_read_s32_default(node,
+					   "nand-ecc-step-size", -1);
 
 	if ((ecc_step >= 0 && !(ecc_strength >= 0)) ||
 	    (!(ecc_step >= 0) && ecc_strength >= 0)) {
@@ -4627,13 +4622,13 @@ static int nand_dt_init(struct mtd_info *mtd, struct nand_chip *chip, int node)
 	if (ecc_step > 0)
 		chip->ecc.size = ecc_step;
 
-	if (fdt_getprop(blob, node, "nand-ecc-maximize", NULL))
+	if (ofnode_read_bool(node, "nand-ecc-maximize"))
 		chip->ecc.options |= NAND_ECC_MAXIMIZE;
 
 	return 0;
 }
 #else
-static int nand_dt_init(struct mtd_info *mtd, struct nand_chip *chip, int node)
+static int nand_dt_init(struct mtd_info *mtd, struct nand_chip *chip, ofnode node)
 {
 	return 0;
 }
@@ -4657,7 +4652,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	struct nand_flash_dev *type;
 	int ret;
 
-	if (chip->flash_node) {
+	if (ofnode_valid(chip->flash_node)) {
 		ret = nand_dt_init(mtd, chip, chip->flash_node);
 		if (ret)
 			return ret;
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index fd81a9500b..e17f1f8975 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -823,7 +823,7 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc, ofnode node)
 		nand->cs_used[i] = cs[i];
 	}
 
-	nand->chip.flash_node = ofnode_to_offset(node);
+	nand->chip.flash_node = node;
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7bc6ec7bee..c378f08f68 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1711,7 +1711,7 @@ static int sunxi_nand_chip_init(int node, struct sunxi_nfc *nfc, int devnum)
 	 * in the DT.
 	 */
 	nand->ecc.mode = NAND_ECC_HW;
-	nand->flash_node = node;
+	nand->flash_node = offset_to_ofnode(node);
 	nand->select_chip = sunxi_nfc_select_chip;
 	nand->cmd_ctrl = sunxi_nfc_cmd_ctrl;
 	nand->read_buf = sunxi_nfc_read_buf;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 66febc6b72..2fba9dc317 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -891,7 +891,7 @@ struct nand_chip {
 	void __iomem *IO_ADDR_R;
 	void __iomem *IO_ADDR_W;
 
-	int flash_node;
+	ofnode flash_node;
 
 	uint8_t (*read_byte)(struct mtd_info *mtd);
 	u16 (*read_word)(struct mtd_info *mtd);
@@ -973,12 +973,12 @@ struct nand_chip {
 static inline void nand_set_flash_node(struct nand_chip *chip,
 				       ofnode node)
 {
-	chip->flash_node = ofnode_to_offset(node);
+	chip->flash_node = node;
 }
 
 static inline ofnode nand_get_flash_node(struct nand_chip *chip)
 {
-	return offset_to_ofnode(chip->flash_node);
+	return chip->flash_node;
 }
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
