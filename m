Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 143B3234093
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 09:55:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4A8AC36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 07:55:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39A1AC36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:55:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7lc8B015854; Fri, 31 Jul 2020 09:55:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=AmOYzxi6w8QvKnrOn9o6LL172JL+50NqarI+1S7uk/E=;
 b=nRsjRDlJIHKatVISRCMZ6QnpXzSeHEqGQ3dGNo7PJxW73rozt/Q8Pfg1pk4r5xJb79t4
 Sz2Y8OsF8WbXv+kiTAZBU5ywyc7ItJhnjvNRWRK4nzkboePxr2cWC7g4l41AelFsrZiW
 ApqHXVbMnlqGiCXsF5RPJNOb8a6k3wtwPhCQsC2ZMk96IZxL2VFDL7sg1mS3/HqVL3j/
 ibotcICRYvHUIasFKiud9/4AQdTBiDCRFcWumrIlLGbPpmtKiDKSomdn+SxjHHZmjosu
 FNkg1Oru+O8s68dAN4kccBHcAhkidlBMSrFLao/GQHxa+skW6kEKArXJh0ikkJ2Ga0X7 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9whey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:55:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE48310002A;
 Fri, 31 Jul 2020 09:55:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D497222109D;
 Fri, 31 Jul 2020 09:55:06 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 09:55:06 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 09:53:41 +0200
Message-ID: <1596182024-18181-9-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 08/11] mtd: rawnand: stm32_fmc2: get resources
	from parent node
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

FMC2 EBI support has been added. Common resources (registers base
address and clock) can now be shared between the 2 drivers using
"st,stm32mp1-fmc2-nfc" compatible string. It means that the
common resources should now be found in the parent device when EBI
node is available.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 87 +++++++++++++++++++++++-----------
 1 file changed, 59 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 1e4d757..47fe610 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -158,10 +158,10 @@ struct stm32_fmc2_nfc {
 	struct nand_hw_control base;
 	struct stm32_fmc2_nand nand;
 	struct nand_ecclayout ecclayout;
-	void __iomem *io_base;
-	void __iomem *data_base[FMC2_MAX_CE];
-	void __iomem *cmd_base[FMC2_MAX_CE];
-	void __iomem *addr_base[FMC2_MAX_CE];
+	fdt_addr_t io_base;
+	fdt_addr_t data_base[FMC2_MAX_CE];
+	fdt_addr_t cmd_base[FMC2_MAX_CE];
+	fdt_addr_t addr_base[FMC2_MAX_CE];
 	struct clk clk;
 
 	u8 cs_assigned;
@@ -241,8 +241,8 @@ static void stm32_fmc2_nfc_select_chip(struct mtd_info *mtd, int chipnr)
 		return;
 
 	nfc->cs_sel = nand->cs_used[chipnr];
-	chip->IO_ADDR_R = nfc->data_base[nfc->cs_sel];
-	chip->IO_ADDR_W = nfc->data_base[nfc->cs_sel];
+	chip->IO_ADDR_R = (void __iomem *)nfc->data_base[nfc->cs_sel];
+	chip->IO_ADDR_W = (void __iomem *)nfc->data_base[nfc->cs_sel];
 
 	stm32_fmc2_nfc_setup(chip);
 	stm32_fmc2_nfc_timings_init(chip);
@@ -548,7 +548,7 @@ static int stm32_fmc2_nfc_read_page(struct mtd_info *mtd,
 	return max_bitflips;
 }
 
-static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
+static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc, bool has_parent)
 {
 	u32 pcr = readl(nfc->io_base + FMC2_PCR);
 
@@ -581,7 +581,8 @@ static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
 	pcr |= FIELD_PREP(FMC2_PCR_TAR, FMC2_PCR_TAR_DEFAULT);
 
 	/* Enable FMC2 controller */
-	setbits_le32(nfc->io_base + FMC2_BCR1, FMC2_BCR1_FMC2EN);
+	if (!has_parent)
+		setbits_le32(nfc->io_base + FMC2_BCR1, FMC2_BCR1_FMC2EN);
 
 	writel(pcr, nfc->io_base + FMC2_PCR);
 	writel(FMC2_PMEM_DEFAULT, nfc->io_base + FMC2_PMEM);
@@ -854,6 +855,30 @@ static int stm32_fmc2_nfc_parse_dt(struct udevice *dev,
 	return 0;
 }
 
+static struct udevice *stm32_fmc2_nfc_get_cdev(struct udevice *dev)
+{
+	struct udevice *pdev = dev_get_parent(dev);
+	struct udevice *cdev = NULL;
+	bool ebi_found = false;
+
+	if (pdev && ofnode_device_is_compatible(dev_ofnode(pdev),
+						"st,stm32mp1-fmc2-ebi"))
+		ebi_found = true;
+
+	if (ofnode_device_is_compatible(dev_ofnode(dev),
+					"st,stm32mp1-fmc2-nfc")) {
+		if (ebi_found)
+			cdev = pdev;
+
+		return cdev;
+	}
+
+	if (!ebi_found)
+		cdev = dev;
+
+	return cdev;
+}
+
 static int stm32_fmc2_nfc_probe(struct udevice *dev)
 {
 	struct stm32_fmc2_nfc *nfc = dev_get_priv(dev);
@@ -861,58 +886,63 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 	struct nand_chip *chip = &nand->chip;
 	struct mtd_info *mtd = &chip->mtd;
 	struct nand_ecclayout *ecclayout;
-	struct resource resource;
+	struct udevice *cdev;
 	struct reset_ctl reset;
 	int oob_index, chip_cs, mem_region, ret;
 	unsigned int i;
+	int start_region = 0;
+	fdt_addr_t addr;
 
 	spin_lock_init(&nfc->controller.lock);
 	init_waitqueue_head(&nfc->controller.wq);
 
+	cdev = stm32_fmc2_nfc_get_cdev(dev);
+	if (!cdev)
+		return -EINVAL;
+
 	ret = stm32_fmc2_nfc_parse_dt(dev, nfc);
 	if (ret)
 		return ret;
 
-	/* Get resources */
-	ret = dev_read_resource(dev, 0, &resource);
-	if (ret) {
-		pr_err("Resource io_base not found");
-		return ret;
-	}
-	nfc->io_base = (void __iomem *)resource.start;
+	nfc->io_base = dev_read_addr(cdev);
+	if (nfc->io_base == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	if (dev == cdev)
+		start_region = 1;
 
-	for (chip_cs = 0, mem_region = 1; chip_cs < FMC2_MAX_CE;
+	for (chip_cs = 0, mem_region = start_region; chip_cs < FMC2_MAX_CE;
 	     chip_cs++, mem_region += 3) {
 		if (!(nfc->cs_assigned & BIT(chip_cs)))
 			continue;
 
-		ret = dev_read_resource(dev, mem_region, &resource);
-		if (ret) {
+		addr = dev_read_addr_index(dev, mem_region);
+		if (addr == FDT_ADDR_T_NONE) {
 			pr_err("Resource data_base not found for cs%d",
 			       chip_cs);
 			return ret;
 		}
-		nfc->data_base[chip_cs] = (void __iomem *)resource.start;
+		nfc->data_base[chip_cs] = addr;
 
-		ret = dev_read_resource(dev, mem_region + 1, &resource);
-		if (ret) {
+		addr = dev_read_addr_index(dev, mem_region + 1);
+		if (addr == FDT_ADDR_T_NONE) {
 			pr_err("Resource cmd_base not found for cs%d",
 			       chip_cs);
 			return ret;
 		}
-		nfc->cmd_base[chip_cs] = (void __iomem *)resource.start;
+		nfc->cmd_base[chip_cs] = addr;
 
-		ret = dev_read_resource(dev, mem_region + 2, &resource);
-		if (ret) {
+		addr = dev_read_addr_index(dev, mem_region + 2);
+		if (addr == FDT_ADDR_T_NONE) {
 			pr_err("Resource addr_base not found for cs%d",
 			       chip_cs);
 			return ret;
 		}
-		nfc->addr_base[chip_cs] = (void __iomem *)resource.start;
+		nfc->addr_base[chip_cs] = addr;
 	}
 
 	/* Enable the clock */
-	ret = clk_get_by_index(dev, 0, &nfc->clk);
+	ret = clk_get_by_index(cdev, 0, &nfc->clk);
 	if (ret)
 		return ret;
 
@@ -928,7 +958,7 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 		reset_deassert(&reset);
 	}
 
-	stm32_fmc2_nfc_init(nfc);
+	stm32_fmc2_nfc_init(nfc, dev != cdev);
 
 	chip->controller = &nfc->base;
 	chip->select_chip = stm32_fmc2_nfc_select_chip;
@@ -994,6 +1024,7 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 
 static const struct udevice_id stm32_fmc2_nfc_match[] = {
 	{ .compatible = "st,stm32mp15-fmc2" },
+	{ .compatible = "st,stm32mp1-fmc2-nfc" },
 	{ /* Sentinel */ }
 };
 
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
