Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C99A523408D
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 09:54:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93066C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 07:54:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4354C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:54:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7lc84015854; Fri, 31 Jul 2020 09:54:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9mYBH23lhSGrhCEzCiWSZwObgaLdWuZLlZg2f6stbQs=;
 b=RJdCvuV/dBAo399eX/NFdUr1FgLJOaPKhmwZCiRZJjfO1HL9Zz+518IxnQZUkh0NEg/o
 +o0dUmbNq24aVhzm6slJMoYJGEdU0S0mbt2wq52bPlPSf/qUqIMHFlti9yaHo5AYU14m
 0ZRUY+HCLTdvXFtNFP3GJpFLqjlf8tY2ap8/3DRW6in35qZNAKxpAWc5K3dZlVlIoOpx
 8aF3jglwwuHdN2VQalIhonEzMQdzIqVZeo8DdbIcY8fr25i/Bv2CN9p0cv7u0NIEY1Wf
 AG3L6mVIkzDTYIOIG64IFYvUwAGIWIX3m7526gDecLD399FL7w4svfDQRYh1Y566XrgM VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9whdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:54:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AA5610002A;
 Fri, 31 Jul 2020 09:54:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D6DC22109C;
 Fri, 31 Jul 2020 09:54:50 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 09:54:49 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 09:53:35 +0200
Message-ID: <1596182024-18181-3-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 02/11] mtd: rawnand: stm32_fmc2: remove
	useless inline comments
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

Remove inline comments that are useless since function label are
self explanatory.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 2929acf..f43e3ec 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -179,7 +179,6 @@ static inline struct stm32_fmc2_nfc *to_stm32_nfc(struct nand_hw_control *base)
 	return container_of(base, struct stm32_fmc2_nfc, base);
 }
 
-/* Timings configuration */
 static void stm32_fmc2_timings_init(struct nand_chip *chip)
 {
 	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
@@ -211,7 +210,6 @@ static void stm32_fmc2_timings_init(struct nand_chip *chip)
 	writel(patt, fmc2->io_base + FMC2_PATT);
 }
 
-/* Controller configuration */
 static void stm32_fmc2_setup(struct nand_chip *chip)
 {
 	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
@@ -239,7 +237,6 @@ static void stm32_fmc2_setup(struct nand_chip *chip)
 	writel(pcr, fmc2->io_base + FMC2_PCR);
 }
 
-/* Select target */
 static void stm32_fmc2_select_chip(struct mtd_info *mtd, int chipnr)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
@@ -256,14 +253,10 @@ static void stm32_fmc2_select_chip(struct mtd_info *mtd, int chipnr)
 	chip->IO_ADDR_R = fmc2->data_base[fmc2->cs_sel];
 	chip->IO_ADDR_W = fmc2->data_base[fmc2->cs_sel];
 
-	/* FMC2 setup routine */
 	stm32_fmc2_setup(chip);
-
-	/* Apply timings */
 	stm32_fmc2_timings_init(chip);
 }
 
-/* Set bus width to 16-bit or 8-bit */
 static void stm32_fmc2_set_buswidth_16(struct stm32_fmc2_nfc *fmc2, bool set)
 {
 	u32 pcr = readl(fmc2->io_base + FMC2_PCR);
@@ -274,7 +267,6 @@ static void stm32_fmc2_set_buswidth_16(struct stm32_fmc2_nfc *fmc2, bool set)
 	writel(pcr, fmc2->io_base + FMC2_PCR);
 }
 
-/* Enable/disable ECC */
 static void stm32_fmc2_set_ecc(struct stm32_fmc2_nfc *fmc2, bool enable)
 {
 	u32 pcr = readl(fmc2->io_base + FMC2_PCR);
@@ -285,13 +277,11 @@ static void stm32_fmc2_set_ecc(struct stm32_fmc2_nfc *fmc2, bool enable)
 	writel(pcr, fmc2->io_base + FMC2_PCR);
 }
 
-/* Clear irq sources in case of bch is used */
 static inline void stm32_fmc2_clear_bch_irq(struct stm32_fmc2_nfc *fmc2)
 {
 	writel(FMC2_BCHICR_CLEAR_IRQ, fmc2->io_base + FMC2_BCHICR);
 }
 
-/* Send command and address cycles */
 static void stm32_fmc2_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				unsigned int ctrl)
 {
@@ -361,7 +351,6 @@ static int stm32_fmc2_ham_calculate(struct mtd_info *mtd, const u8 *data,
 	ecc[1] = heccr >> 8;
 	ecc[2] = heccr >> 16;
 
-	/* Disable ecc */
 	stm32_fmc2_set_ecc(fmc2, false);
 
 	return 0;
@@ -466,13 +455,11 @@ static int stm32_fmc2_bch_calculate(struct mtd_info *mtd, const u8 *data,
 		ecc[12] = bchpbr;
 	}
 
-	/* Disable ecc */
 	stm32_fmc2_set_ecc(fmc2, false);
 
 	return 0;
 }
 
-/* BCH algorithm correction */
 static int stm32_fmc2_bch_correct(struct mtd_info *mtd, u8 *dat,
 				  u8 *read_ecc, u8 *calc_ecc)
 {
@@ -497,7 +484,6 @@ static int stm32_fmc2_bch_correct(struct mtd_info *mtd, u8 *dat,
 	bchdsr3 = readl(fmc2->io_base + FMC2_BCHDSR3);
 	bchdsr4 = readl(fmc2->io_base + FMC2_BCHDSR4);
 
-	/* Disable ECC */
 	stm32_fmc2_set_ecc(fmc2, false);
 
 	/* No errors found */
@@ -579,7 +565,6 @@ static int stm32_fmc2_read_page(struct mtd_info *mtd,
 	return max_bitflips;
 }
 
-/* Controller initialization */
 static void stm32_fmc2_init(struct stm32_fmc2_nfc *fmc2)
 {
 	u32 pcr = readl(fmc2->io_base + FMC2_PCR);
@@ -622,7 +607,6 @@ static void stm32_fmc2_init(struct stm32_fmc2_nfc *fmc2)
 	writel(FMC2_PATT_DEFAULT, fmc2->io_base + FMC2_PATT);
 }
 
-/* Controller timings */
 static void stm32_fmc2_calc_timings(struct nand_chip *chip,
 				    const struct nand_sdr_timings *sdrt)
 {
@@ -768,13 +752,11 @@ static int stm32_fmc2_setup_interface(struct mtd_info *mtd, int chipnr,
 
 	stm32_fmc2_calc_timings(chip, sdrt);
 
-	/* Apply timings */
 	stm32_fmc2_timings_init(chip);
 
 	return 0;
 }
 
-/* NAND callbacks setup */
 static void stm32_fmc2_nand_callbacks_setup(struct nand_chip *chip)
 {
 	chip->ecc.hwctl = stm32_fmc2_hwctl;
@@ -803,7 +785,6 @@ static void stm32_fmc2_nand_callbacks_setup(struct nand_chip *chip)
 		chip->ecc.bytes = chip->options & NAND_BUSWIDTH_16 ? 8 : 7;
 }
 
-/* FMC2 caps */
 static int stm32_fmc2_calc_ecc_bytes(int step_size, int strength)
 {
 	/* Hamming */
@@ -822,7 +803,6 @@ NAND_ECC_CAPS_SINGLE(stm32_fmc2_ecc_caps, stm32_fmc2_calc_ecc_bytes,
 		     FMC2_ECC_STEP_SIZE,
 		     FMC2_ECC_HAM, FMC2_ECC_BCH4, FMC2_ECC_BCH8);
 
-/* FMC2 probe */
 static int stm32_fmc2_parse_child(struct stm32_fmc2_nfc *fmc2,
 				  ofnode node)
 {
@@ -969,7 +949,6 @@ static int stm32_fmc2_probe(struct udevice *dev)
 		reset_deassert(&reset);
 	}
 
-	/* FMC2 init routine */
 	stm32_fmc2_init(fmc2);
 
 	chip->controller = &fmc2->base;
@@ -985,7 +964,6 @@ static int stm32_fmc2_probe(struct udevice *dev)
 	chip->ecc.size = FMC2_ECC_STEP_SIZE;
 	chip->ecc.strength = FMC2_ECC_BCH8;
 
-	/* Scan to find existence of the device */
 	ret = nand_scan_ident(mtd, nand->ncs, NULL);
 	if (ret)
 		return ret;
@@ -1012,7 +990,6 @@ static int stm32_fmc2_probe(struct udevice *dev)
 	if (chip->bbt_options & NAND_BBT_USE_FLASH)
 		chip->bbt_options |= NAND_BBT_NO_OOB;
 
-	/* NAND callbacks setup */
 	stm32_fmc2_nand_callbacks_setup(chip);
 
 	/* Define ECC layout */
@@ -1026,11 +1003,9 @@ static int stm32_fmc2_probe(struct udevice *dev)
 	ecclayout->oobfree->length = mtd->oobsize - ecclayout->oobfree->offset;
 	chip->ecc.layout = ecclayout;
 
-	/* Configure bus width to 16-bit */
 	if (chip->options & NAND_BUSWIDTH_16)
 		stm32_fmc2_set_buswidth_16(fmc2, true);
 
-	/* Scan the device to fill MTD data-structures */
 	ret = nand_scan_tail(mtd);
 	if (ret)
 		return ret;
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
