Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138328DCA4
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E7AFC424BF;
	Wed, 14 Oct 2020 09:17:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D83E6C424B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9DJKe020413; Wed, 14 Oct 2020 11:17:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=W6af3NTm3qtVc8Laee0/guBhELhjgcXwli5ZsiEq65E=;
 b=AKA2kcxD2Nc/PgtspOenhDpjqRm8RXyPxiGWlo2sKZn93Cjjcv1DwZ5B8EH3GKu3Nh5Q
 /iXsh3sbeqE0Y++N0V9cbYdRfM1yVhBcsD9rNKDSOLkss0UNKdmpGbfPXKCreq4OZm7Y
 MRYnIa/ZTRH1Z9gfObxnteAw63fGvam0PJ7aF3NbiUfd7iMFaKuDbQ5n4RodPlCK8192
 WJ5ZAJSyfx3Wp3iaa7ZopgdopRfG9jBegr6KhMPGetmUDXQiLXedKQ7BUKl80LJ4Rp1a
 fzYf7cbIY/9QlLJ1nav99jG8D2QS1s5BafGqXwa8x+D5MkUVqYK8AjvoX0U5e7EYet+b 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3435874hww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:17:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0688010002A;
 Wed, 14 Oct 2020 11:17:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0B192ABA3E;
 Wed, 14 Oct 2020 11:17:15 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:17:15
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:39 +0200
Message-ID: <20201014091646.4233-27-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 26/33] mtd: stm32_fmc2: migrate trace to dev
	and log macro
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

Change pr_* to dev_ or log_ macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 40 ++++++++++++--------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 47fe61090d..9624583b8c 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -4,12 +4,15 @@
  * Author: Christophe Kerello <christophe.kerello@st.com>
  */
 
+#define LOG_CATEGORY UCLASS_MTD
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
 #include <log.h>
 #include <nand.h>
 #include <reset.h>
+#include <dm/device_compat.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
@@ -324,7 +327,7 @@ static int stm32_fmc2_nfc_ham_calculate(struct mtd_info *mtd, const u8 *data,
 	ret = readl_poll_timeout(nfc->io_base + FMC2_SR, sr,
 				 sr & FMC2_SR_NWRF, FMC2_TIMEOUT_5S);
 	if (ret < 0) {
-		pr_err("Ham timeout\n");
+		log_err("Ham timeout\n");
 		return ret;
 	}
 
@@ -409,7 +412,7 @@ static int stm32_fmc2_nfc_bch_calculate(struct mtd_info *mtd, const u8 *data,
 	ret = readl_poll_timeout(nfc->io_base + FMC2_BCHISR, bchisr,
 				 bchisr & FMC2_BCHISR_EPBRF, FMC2_TIMEOUT_5S);
 	if (ret < 0) {
-		pr_err("Bch timeout\n");
+		log_err("Bch timeout\n");
 		return ret;
 	}
 
@@ -457,7 +460,7 @@ static int stm32_fmc2_nfc_bch_correct(struct mtd_info *mtd, u8 *dat,
 	ret = readl_poll_timeout(nfc->io_base + FMC2_BCHISR, bchisr,
 				 bchisr & FMC2_BCHISR_DERF, FMC2_TIMEOUT_5S);
 	if (ret < 0) {
-		pr_err("Bch timeout\n");
+		log_err("Bch timeout\n");
 		return ret;
 	}
 
@@ -795,26 +798,24 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc, ofnode node)
 
 	nand->ncs /= sizeof(u32);
 	if (!nand->ncs) {
-		pr_err("Invalid reg property size\n");
+		log_err("Invalid reg property size\n");
 		return -EINVAL;
 	}
 
 	ret = ofnode_read_u32_array(node, "reg", cs, nand->ncs);
 	if (ret < 0) {
-		pr_err("Could not retrieve reg property\n");
+		log_err("Could not retrieve reg property\n");
 		return -EINVAL;
 	}
 
 	for (i = 0; i < nand->ncs; i++) {
 		if (cs[i] >= FMC2_MAX_CE) {
-			pr_err("Invalid reg value: %d\n",
-			       nand->cs_used[i]);
+			log_err("Invalid reg value: %d\n", nand->cs_used[i]);
 			return -EINVAL;
 		}
 
 		if (nfc->cs_assigned & BIT(cs[i])) {
-			pr_err("Cs already assigned: %d\n",
-			       nand->cs_used[i]);
+			log_err("Cs already assigned: %d\n", nand->cs_used[i]);
 			return -EINVAL;
 		}
 
@@ -837,12 +838,12 @@ static int stm32_fmc2_nfc_parse_dt(struct udevice *dev,
 		nchips++;
 
 	if (!nchips) {
-		pr_err("NAND chip not defined\n");
+		log_err("NAND chip not defined\n");
 		return -EINVAL;
 	}
 
 	if (nchips > 1) {
-		pr_err("Too many NAND chips defined\n");
+		log_err("Too many NAND chips defined\n");
 		return -EINVAL;
 	}
 
@@ -918,24 +919,21 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 
 		addr = dev_read_addr_index(dev, mem_region);
 		if (addr == FDT_ADDR_T_NONE) {
-			pr_err("Resource data_base not found for cs%d",
-			       chip_cs);
+			dev_err(dev, "Resource data_base not found for cs%d", chip_cs);
 			return ret;
 		}
 		nfc->data_base[chip_cs] = addr;
 
 		addr = dev_read_addr_index(dev, mem_region + 1);
 		if (addr == FDT_ADDR_T_NONE) {
-			pr_err("Resource cmd_base not found for cs%d",
-			       chip_cs);
+			dev_err(dev, "Resource cmd_base not found for cs%d", chip_cs);
 			return ret;
 		}
 		nfc->cmd_base[chip_cs] = addr;
 
 		addr = dev_read_addr_index(dev, mem_region + 2);
 		if (addr == FDT_ADDR_T_NONE) {
-			pr_err("Resource addr_base not found for cs%d",
-			       chip_cs);
+			dev_err(dev, "Resource addr_base not found for cs%d", chip_cs);
 			return ret;
 		}
 		nfc->addr_base[chip_cs] = addr;
@@ -985,14 +983,14 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 	 * ECC sector size = 512
 	 */
 	if (chip->ecc.mode != NAND_ECC_HW) {
-		pr_err("Nand_ecc_mode is not well defined in the DT\n");
+		dev_err(dev, "Nand_ecc_mode is not well defined in the DT\n");
 		return -EINVAL;
 	}
 
 	ret = nand_check_ecc_caps(chip, &stm32_fmc2_nfc_ecc_caps,
 				  mtd->oobsize - FMC2_BBM_LEN);
 	if (ret) {
-		pr_err("No valid ECC settings set\n");
+		dev_err(dev, "No valid ECC settings set\n");
 		return ret;
 	}
 
@@ -1045,6 +1043,6 @@ void board_nand_init(void)
 					  DM_GET_DRIVER(stm32_fmc2_nfc),
 					  &dev);
 	if (ret && ret != -ENODEV)
-		pr_err("Failed to initialize STM32 FMC2 NFC controller. (error %d)\n",
-		       ret);
+		log_err("Failed to initialize STM32 FMC2 NFC controller. (error %d)\n",
+			ret);
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
