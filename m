Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01721234091
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 09:55:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1538C36B35
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 07:55:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81696C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:55:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7lc89015854; Fri, 31 Jul 2020 09:55:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Jc7Yl0vKYT73wsvZKd+bCt+Xy0jkrrW1+n/Pqg2NrpQ=;
 b=RvXSGy7+t0IvtEgWFI23+clCilxd46XvgC/3hIrDHZCTAxK8pRfG2zVW0REffCZi4Ri4
 XeQmxXCfxrwPkw5FfzdhENWJu0g26mvoR8MXsxZTErKtS5AE3863TTSLfweksRiuv3VF
 N8VXbH2C27oVloNpJgsFqA2TJdR3IkSOIHo/R1JeR7oHqfrYC1a0Jr8uQ/wAbudqg6Oq
 5gEoKnSaoB+a4VofWokfUZu39POYzzY1Z0fF2XRgwAOOUIqUMYqX65FS4vR6D0TnUT5P
 2Fkkl1umtdGSSW3W2VwZ0wmWvBqlqjXXrssdiCO6EbfO7fwCM/2YBYQPSyqee9JmN4dS zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9whej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:55:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 46B5E10002A;
 Fri, 31 Jul 2020 09:55:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D96922109D;
 Fri, 31 Jul 2020 09:55:01 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 09:55:00 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 09:53:39 +0200
Message-ID: <1596182024-18181-7-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 06/11] mtd: rawnand: stm32_fmc2: use
	clrsetbits_le32
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

This patch uses clrsetbits_le32 function instead of multiple instructions.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 56 +++++++++++++---------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index eba1ded..1e4d757 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -178,40 +178,37 @@ static void stm32_fmc2_nfc_timings_init(struct nand_chip *chip)
 	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
 	struct stm32_fmc2_nand *nand = to_fmc2_nand(chip);
 	struct stm32_fmc2_timings *timings = &nand->timings;
-	u32 pcr = readl(nfc->io_base + FMC2_PCR);
 	u32 pmem, patt;
 
 	/* Set tclr/tar timings */
-	pcr &= ~FMC2_PCR_TCLR;
-	pcr |= FIELD_PREP(FMC2_PCR_TCLR, timings->tclr);
-	pcr &= ~FMC2_PCR_TAR;
-	pcr |= FIELD_PREP(FMC2_PCR_TAR, timings->tar);
+	clrsetbits_le32(nfc->io_base + FMC2_PCR,
+			FMC2_PCR_TCLR | FMC2_PCR_TAR,
+			FIELD_PREP(FMC2_PCR_TCLR, timings->tclr) |
+			FIELD_PREP(FMC2_PCR_TAR, timings->tar));
 
 	/* Set tset/twait/thold/thiz timings in common bank */
 	pmem = FIELD_PREP(FMC2_PMEM_MEMSET, timings->tset_mem);
 	pmem |= FIELD_PREP(FMC2_PMEM_MEMWAIT, timings->twait);
 	pmem |= FIELD_PREP(FMC2_PMEM_MEMHOLD, timings->thold_mem);
 	pmem |= FIELD_PREP(FMC2_PMEM_MEMHIZ, timings->thiz);
+	writel(pmem, nfc->io_base + FMC2_PMEM);
 
 	/* Set tset/twait/thold/thiz timings in attribut bank */
 	patt = FIELD_PREP(FMC2_PATT_ATTSET, timings->tset_att);
 	patt |= FIELD_PREP(FMC2_PATT_ATTWAIT, timings->twait);
 	patt |= FIELD_PREP(FMC2_PATT_ATTHOLD, timings->thold_att);
 	patt |= FIELD_PREP(FMC2_PATT_ATTHIZ, timings->thiz);
-
-	writel(pcr, nfc->io_base + FMC2_PCR);
-	writel(pmem, nfc->io_base + FMC2_PMEM);
 	writel(patt, nfc->io_base + FMC2_PATT);
 }
 
 static void stm32_fmc2_nfc_setup(struct nand_chip *chip)
 {
 	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
-	u32 pcr = readl(nfc->io_base + FMC2_PCR);
+	u32 pcr = 0, pcr_mask;
 
 	/* Configure ECC algorithm (default configuration is Hamming) */
-	pcr &= ~FMC2_PCR_ECCALG;
-	pcr &= ~FMC2_PCR_BCHECC;
+	pcr_mask = FMC2_PCR_ECCALG;
+	pcr_mask |= FMC2_PCR_BCHECC;
 	if (chip->ecc.strength == FMC2_ECC_BCH8) {
 		pcr |= FMC2_PCR_ECCALG;
 		pcr |= FMC2_PCR_BCHECC;
@@ -220,15 +217,15 @@ static void stm32_fmc2_nfc_setup(struct nand_chip *chip)
 	}
 
 	/* Set buswidth */
-	pcr &= ~FMC2_PCR_PWID;
+	pcr_mask |= FMC2_PCR_PWID;
 	if (chip->options & NAND_BUSWIDTH_16)
 		pcr |= FIELD_PREP(FMC2_PCR_PWID, FMC2_PCR_PWID_BUSWIDTH_16);
 
 	/* Set ECC sector size */
-	pcr &= ~FMC2_PCR_ECCSS;
+	pcr_mask |= FMC2_PCR_ECCSS;
 	pcr |= FIELD_PREP(FMC2_PCR_ECCSS, FMC2_PCR_ECCSS_512);
 
-	writel(pcr, nfc->io_base + FMC2_PCR);
+	clrsetbits_le32(nfc->io_base + FMC2_PCR, pcr_mask, pcr);
 }
 
 static void stm32_fmc2_nfc_select_chip(struct mtd_info *mtd, int chipnr)
@@ -254,22 +251,18 @@ static void stm32_fmc2_nfc_select_chip(struct mtd_info *mtd, int chipnr)
 static void stm32_fmc2_nfc_set_buswidth_16(struct stm32_fmc2_nfc *nfc,
 					   bool set)
 {
-	u32 pcr = readl(nfc->io_base + FMC2_PCR);
+	u32 pcr;
 
-	pcr &= ~FMC2_PCR_PWID;
-	if (set)
-		pcr |= FIELD_PREP(FMC2_PCR_PWID, FMC2_PCR_PWID_BUSWIDTH_16);
-	writel(pcr, nfc->io_base + FMC2_PCR);
+	pcr = set ? FIELD_PREP(FMC2_PCR_PWID, FMC2_PCR_PWID_BUSWIDTH_16) :
+		    FIELD_PREP(FMC2_PCR_PWID, FMC2_PCR_PWID_BUSWIDTH_8);
+
+	clrsetbits_le32(nfc->io_base + FMC2_PCR, FMC2_PCR_PWID, pcr);
 }
 
 static void stm32_fmc2_nfc_set_ecc(struct stm32_fmc2_nfc *nfc, bool enable)
 {
-	u32 pcr = readl(nfc->io_base + FMC2_PCR);
-
-	pcr &= ~FMC2_PCR_ECCEN;
-	if (enable)
-		pcr |= FMC2_PCR_ECCEN;
-	writel(pcr, nfc->io_base + FMC2_PCR);
+	clrsetbits_le32(nfc->io_base + FMC2_PCR, FMC2_PCR_ECCEN,
+			enable ? FMC2_PCR_ECCEN : 0);
 }
 
 static void stm32_fmc2_nfc_clear_bch_irq(struct stm32_fmc2_nfc *nfc)
@@ -306,13 +299,8 @@ static void stm32_fmc2_nfc_hwctl(struct mtd_info *mtd, int mode)
 	stm32_fmc2_nfc_set_ecc(nfc, false);
 
 	if (chip->ecc.strength != FMC2_ECC_HAM) {
-		u32 pcr = readl(nfc->io_base + FMC2_PCR);
-
-		if (mode == NAND_ECC_WRITE)
-			pcr |= FMC2_PCR_WEN;
-		else
-			pcr &= ~FMC2_PCR_WEN;
-		writel(pcr, nfc->io_base + FMC2_PCR);
+		clrsetbits_le32(nfc->io_base + FMC2_PCR, FMC2_PCR_WEN,
+				mode == NAND_ECC_WRITE ? FMC2_PCR_WEN : 0);
 
 		stm32_fmc2_nfc_clear_bch_irq(nfc);
 	}
@@ -563,7 +551,6 @@ static int stm32_fmc2_nfc_read_page(struct mtd_info *mtd,
 static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
 {
 	u32 pcr = readl(nfc->io_base + FMC2_PCR);
-	u32 bcr1 = readl(nfc->io_base + FMC2_BCR1);
 
 	/* Set CS used to undefined */
 	nfc->cs_sel = -1;
@@ -594,9 +581,8 @@ static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
 	pcr |= FIELD_PREP(FMC2_PCR_TAR, FMC2_PCR_TAR_DEFAULT);
 
 	/* Enable FMC2 controller */
-	bcr1 |= FMC2_BCR1_FMC2EN;
+	setbits_le32(nfc->io_base + FMC2_BCR1, FMC2_BCR1_FMC2EN);
 
-	writel(bcr1, nfc->io_base + FMC2_BCR1);
 	writel(pcr, nfc->io_base + FMC2_PCR);
 	writel(FMC2_PMEM_DEFAULT, nfc->io_base + FMC2_PMEM);
 	writel(FMC2_PATT_DEFAULT, nfc->io_base + FMC2_PATT);
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
