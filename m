Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C9234090
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 09:54:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8B1CC36B35
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 07:54:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D13BC36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:54:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7lc87015854; Fri, 31 Jul 2020 09:54:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5ZKvlL7DpBOwm30P3HS314cYXdJUw6btBmd9QLcRZDk=;
 b=YyuIAuIzk9fyXEBMPtpQwogvOtzPlYUVj+BLKagHqn5thO93oc2DsjlHUMhz0/aJ4mIc
 rRioLw1BsNVyIFcHyotA3gdQZlWgT8aIFy759lbcS02ElPA3/xsTQVIpSuyUYKyqnpR1
 +Dzoe24WVqmO3JFnF4OT+k4LW3ZL3BnJjDlr8jr5YchSZTnq28OPFNwkDX5O1zZjTH72
 ZVqQ15RtZesEw19dTmmk+X/QCadKu/RdiVCdW2BCIhTqyQupc5SxpPG1j1PcfEb/e6b7
 aX7B+yHWD3SvO7UP9MQnLRoGxlj6uJPhSB6od1tPaODgbOoamAQMyr4PirOmr2U/wHev Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9wheb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:54:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E79210002A;
 Fri, 31 Jul 2020 09:54:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35C5A22109C;
 Fri, 31 Jul 2020 09:54:58 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 09:54:57 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 09:53:38 +0200
Message-ID: <1596182024-18181-6-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/11] mtd: rawnand: stm32_fmc2: use
	FIELD_PREP/FIELD_GET macros
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

This patch removes custom macros and uses FIELD_PREP and FIELD_GET macros.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 120 +++++++++++++++------------------
 1 file changed, 56 insertions(+), 64 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9718bae..eba1ded 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -10,6 +10,7 @@
 #include <log.h>
 #include <nand.h>
 #include <reset.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -60,20 +61,16 @@
 /* Register: FMC2_PCR */
 #define FMC2_PCR_PWAITEN		BIT(1)
 #define FMC2_PCR_PBKEN			BIT(2)
-#define FMC2_PCR_PWID_MASK		GENMASK(5, 4)
-#define FMC2_PCR_PWID(x)		(((x) & 0x3) << 4)
+#define FMC2_PCR_PWID			GENMASK(5, 4)
 #define FMC2_PCR_PWID_BUSWIDTH_8	0
 #define FMC2_PCR_PWID_BUSWIDTH_16	1
 #define FMC2_PCR_ECCEN			BIT(6)
 #define FMC2_PCR_ECCALG			BIT(8)
-#define FMC2_PCR_TCLR_MASK		GENMASK(12, 9)
-#define FMC2_PCR_TCLR(x)		(((x) & 0xf) << 9)
+#define FMC2_PCR_TCLR			GENMASK(12, 9)
 #define FMC2_PCR_TCLR_DEFAULT		0xf
-#define FMC2_PCR_TAR_MASK		GENMASK(16, 13)
-#define FMC2_PCR_TAR(x)			(((x) & 0xf) << 13)
+#define FMC2_PCR_TAR			GENMASK(16, 13)
 #define FMC2_PCR_TAR_DEFAULT		0xf
-#define FMC2_PCR_ECCSS_MASK		GENMASK(19, 17)
-#define FMC2_PCR_ECCSS(x)		(((x) & 0x7) << 17)
+#define FMC2_PCR_ECCSS			GENMASK(19, 17)
 #define FMC2_PCR_ECCSS_512		1
 #define FMC2_PCR_ECCSS_2048		3
 #define FMC2_PCR_BCHECC			BIT(24)
@@ -83,17 +80,17 @@
 #define FMC2_SR_NWRF			BIT(6)
 
 /* Register: FMC2_PMEM */
-#define FMC2_PMEM_MEMSET(x)		(((x) & 0xff) << 0)
-#define FMC2_PMEM_MEMWAIT(x)		(((x) & 0xff) << 8)
-#define FMC2_PMEM_MEMHOLD(x)		(((x) & 0xff) << 16)
-#define FMC2_PMEM_MEMHIZ(x)		(((x) & 0xff) << 24)
+#define FMC2_PMEM_MEMSET		GENMASK(7, 0)
+#define FMC2_PMEM_MEMWAIT		GENMASK(15, 8)
+#define FMC2_PMEM_MEMHOLD		GENMASK(23, 16)
+#define FMC2_PMEM_MEMHIZ		GENMASK(31, 24)
 #define FMC2_PMEM_DEFAULT		0x0a0a0a0a
 
 /* Register: FMC2_PATT */
-#define FMC2_PATT_ATTSET(x)		(((x) & 0xff) << 0)
-#define FMC2_PATT_ATTWAIT(x)		(((x) & 0xff) << 8)
-#define FMC2_PATT_ATTHOLD(x)		(((x) & 0xff) << 16)
-#define FMC2_PATT_ATTHIZ(x)		(((x) & 0xff) << 24)
+#define FMC2_PATT_ATTSET		GENMASK(7, 0)
+#define FMC2_PATT_ATTWAIT		GENMASK(15, 8)
+#define FMC2_PATT_ATTHOLD		GENMASK(23, 16)
+#define FMC2_PATT_ATTHIZ		GENMASK(31, 24)
 #define FMC2_PATT_DEFAULT		0x0a0a0a0a
 
 /* Register: FMC2_BCHISR */
@@ -106,28 +103,23 @@
 /* Register: FMC2_BCHDSR0 */
 #define FMC2_BCHDSR0_DUE		BIT(0)
 #define FMC2_BCHDSR0_DEF		BIT(1)
-#define FMC2_BCHDSR0_DEN_MASK		GENMASK(7, 4)
-#define FMC2_BCHDSR0_DEN_SHIFT		4
+#define FMC2_BCHDSR0_DEN		GENMASK(7, 4)
 
 /* Register: FMC2_BCHDSR1 */
-#define FMC2_BCHDSR1_EBP1_MASK		GENMASK(12, 0)
-#define FMC2_BCHDSR1_EBP2_MASK		GENMASK(28, 16)
-#define FMC2_BCHDSR1_EBP2_SHIFT		16
+#define FMC2_BCHDSR1_EBP1		GENMASK(12, 0)
+#define FMC2_BCHDSR1_EBP2		GENMASK(28, 16)
 
 /* Register: FMC2_BCHDSR2 */
-#define FMC2_BCHDSR2_EBP3_MASK		GENMASK(12, 0)
-#define FMC2_BCHDSR2_EBP4_MASK		GENMASK(28, 16)
-#define FMC2_BCHDSR2_EBP4_SHIFT		16
+#define FMC2_BCHDSR2_EBP3		GENMASK(12, 0)
+#define FMC2_BCHDSR2_EBP4		GENMASK(28, 16)
 
 /* Register: FMC2_BCHDSR3 */
-#define FMC2_BCHDSR3_EBP5_MASK		GENMASK(12, 0)
-#define FMC2_BCHDSR3_EBP6_MASK		GENMASK(28, 16)
-#define FMC2_BCHDSR3_EBP6_SHIFT		16
+#define FMC2_BCHDSR3_EBP5		GENMASK(12, 0)
+#define FMC2_BCHDSR3_EBP6		GENMASK(28, 16)
 
 /* Register: FMC2_BCHDSR4 */
-#define FMC2_BCHDSR4_EBP7_MASK		GENMASK(12, 0)
-#define FMC2_BCHDSR4_EBP8_MASK		GENMASK(28, 16)
-#define FMC2_BCHDSR4_EBP8_SHIFT		16
+#define FMC2_BCHDSR4_EBP7		GENMASK(12, 0)
+#define FMC2_BCHDSR4_EBP8		GENMASK(28, 16)
 
 #define FMC2_NSEC_PER_SEC		1000000000L
 
@@ -190,22 +182,22 @@ static void stm32_fmc2_nfc_timings_init(struct nand_chip *chip)
 	u32 pmem, patt;
 
 	/* Set tclr/tar timings */
-	pcr &= ~FMC2_PCR_TCLR_MASK;
-	pcr |= FMC2_PCR_TCLR(timings->tclr);
-	pcr &= ~FMC2_PCR_TAR_MASK;
-	pcr |= FMC2_PCR_TAR(timings->tar);
+	pcr &= ~FMC2_PCR_TCLR;
+	pcr |= FIELD_PREP(FMC2_PCR_TCLR, timings->tclr);
+	pcr &= ~FMC2_PCR_TAR;
+	pcr |= FIELD_PREP(FMC2_PCR_TAR, timings->tar);
 
 	/* Set tset/twait/thold/thiz timings in common bank */
-	pmem = FMC2_PMEM_MEMSET(timings->tset_mem);
-	pmem |= FMC2_PMEM_MEMWAIT(timings->twait);
-	pmem |= FMC2_PMEM_MEMHOLD(timings->thold_mem);
-	pmem |= FMC2_PMEM_MEMHIZ(timings->thiz);
+	pmem = FIELD_PREP(FMC2_PMEM_MEMSET, timings->tset_mem);
+	pmem |= FIELD_PREP(FMC2_PMEM_MEMWAIT, timings->twait);
+	pmem |= FIELD_PREP(FMC2_PMEM_MEMHOLD, timings->thold_mem);
+	pmem |= FIELD_PREP(FMC2_PMEM_MEMHIZ, timings->thiz);
 
 	/* Set tset/twait/thold/thiz timings in attribut bank */
-	patt = FMC2_PATT_ATTSET(timings->tset_att);
-	patt |= FMC2_PATT_ATTWAIT(timings->twait);
-	patt |= FMC2_PATT_ATTHOLD(timings->thold_att);
-	patt |= FMC2_PATT_ATTHIZ(timings->thiz);
+	patt = FIELD_PREP(FMC2_PATT_ATTSET, timings->tset_att);
+	patt |= FIELD_PREP(FMC2_PATT_ATTWAIT, timings->twait);
+	patt |= FIELD_PREP(FMC2_PATT_ATTHOLD, timings->thold_att);
+	patt |= FIELD_PREP(FMC2_PATT_ATTHIZ, timings->thiz);
 
 	writel(pcr, nfc->io_base + FMC2_PCR);
 	writel(pmem, nfc->io_base + FMC2_PMEM);
@@ -228,13 +220,13 @@ static void stm32_fmc2_nfc_setup(struct nand_chip *chip)
 	}
 
 	/* Set buswidth */
-	pcr &= ~FMC2_PCR_PWID_MASK;
+	pcr &= ~FMC2_PCR_PWID;
 	if (chip->options & NAND_BUSWIDTH_16)
-		pcr |= FMC2_PCR_PWID(FMC2_PCR_PWID_BUSWIDTH_16);
+		pcr |= FIELD_PREP(FMC2_PCR_PWID, FMC2_PCR_PWID_BUSWIDTH_16);
 
 	/* Set ECC sector size */
-	pcr &= ~FMC2_PCR_ECCSS_MASK;
-	pcr |= FMC2_PCR_ECCSS(FMC2_PCR_ECCSS_512);
+	pcr &= ~FMC2_PCR_ECCSS;
+	pcr |= FIELD_PREP(FMC2_PCR_ECCSS, FMC2_PCR_ECCSS_512);
 
 	writel(pcr, nfc->io_base + FMC2_PCR);
 }
@@ -264,9 +256,9 @@ static void stm32_fmc2_nfc_set_buswidth_16(struct stm32_fmc2_nfc *nfc,
 {
 	u32 pcr = readl(nfc->io_base + FMC2_PCR);
 
-	pcr &= ~FMC2_PCR_PWID_MASK;
+	pcr &= ~FMC2_PCR_PWID;
 	if (set)
-		pcr |= FMC2_PCR_PWID(FMC2_PCR_PWID_BUSWIDTH_16);
+		pcr |= FIELD_PREP(FMC2_PCR_PWID, FMC2_PCR_PWID_BUSWIDTH_16);
 	writel(pcr, nfc->io_base + FMC2_PCR);
 }
 
@@ -497,16 +489,16 @@ static int stm32_fmc2_nfc_bch_correct(struct mtd_info *mtd, u8 *dat,
 	if (unlikely(bchdsr0 & FMC2_BCHDSR0_DUE))
 		return -EBADMSG;
 
-	pos[0] = bchdsr1 & FMC2_BCHDSR1_EBP1_MASK;
-	pos[1] = (bchdsr1 & FMC2_BCHDSR1_EBP2_MASK) >> FMC2_BCHDSR1_EBP2_SHIFT;
-	pos[2] = bchdsr2 & FMC2_BCHDSR2_EBP3_MASK;
-	pos[3] = (bchdsr2 & FMC2_BCHDSR2_EBP4_MASK) >> FMC2_BCHDSR2_EBP4_SHIFT;
-	pos[4] = bchdsr3 & FMC2_BCHDSR3_EBP5_MASK;
-	pos[5] = (bchdsr3 & FMC2_BCHDSR3_EBP6_MASK) >> FMC2_BCHDSR3_EBP6_SHIFT;
-	pos[6] = bchdsr4 & FMC2_BCHDSR4_EBP7_MASK;
-	pos[7] = (bchdsr4 & FMC2_BCHDSR4_EBP8_MASK) >> FMC2_BCHDSR4_EBP8_SHIFT;
+	pos[0] = FIELD_GET(FMC2_BCHDSR1_EBP1, bchdsr1);
+	pos[1] = FIELD_GET(FMC2_BCHDSR1_EBP2, bchdsr1);
+	pos[2] = FIELD_GET(FMC2_BCHDSR2_EBP3, bchdsr2);
+	pos[3] = FIELD_GET(FMC2_BCHDSR2_EBP4, bchdsr2);
+	pos[4] = FIELD_GET(FMC2_BCHDSR3_EBP5, bchdsr3);
+	pos[5] = FIELD_GET(FMC2_BCHDSR3_EBP6, bchdsr3);
+	pos[6] = FIELD_GET(FMC2_BCHDSR4_EBP7, bchdsr4);
+	pos[7] = FIELD_GET(FMC2_BCHDSR4_EBP8, bchdsr4);
 
-	den = (bchdsr0 & FMC2_BCHDSR0_DEN_MASK) >> FMC2_BCHDSR0_DEN_SHIFT;
+	den = FIELD_GET(FMC2_BCHDSR0_DEN, bchdsr0);
 	for (i = 0; i < den; i++) {
 		if (pos[i] < eccsize * 8) {
 			__change_bit(pos[i], (unsigned long *)dat);
@@ -581,7 +573,7 @@ static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
 	pcr |= FMC2_PCR_PBKEN;
 
 	/* Set buswidth to 8 bits mode for identification */
-	pcr &= ~FMC2_PCR_PWID_MASK;
+	pcr &= ~FMC2_PCR_PWID;
 
 	/* ECC logic is disabled */
 	pcr &= ~FMC2_PCR_ECCEN;
@@ -592,14 +584,14 @@ static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
 	pcr &= ~FMC2_PCR_WEN;
 
 	/* Set default ECC sector size */
-	pcr &= ~FMC2_PCR_ECCSS_MASK;
-	pcr |= FMC2_PCR_ECCSS(FMC2_PCR_ECCSS_2048);
+	pcr &= ~FMC2_PCR_ECCSS;
+	pcr |= FIELD_PREP(FMC2_PCR_ECCSS, FMC2_PCR_ECCSS_2048);
 
 	/* Set default tclr/tar timings */
-	pcr &= ~FMC2_PCR_TCLR_MASK;
-	pcr |= FMC2_PCR_TCLR(FMC2_PCR_TCLR_DEFAULT);
-	pcr &= ~FMC2_PCR_TAR_MASK;
-	pcr |= FMC2_PCR_TAR(FMC2_PCR_TAR_DEFAULT);
+	pcr &= ~FMC2_PCR_TCLR;
+	pcr |= FIELD_PREP(FMC2_PCR_TCLR, FMC2_PCR_TCLR_DEFAULT);
+	pcr &= ~FMC2_PCR_TAR;
+	pcr |= FIELD_PREP(FMC2_PCR_TAR, FMC2_PCR_TAR_DEFAULT);
 
 	/* Enable FMC2 controller */
 	bcr1 |= FMC2_BCR1_FMC2EN;
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
