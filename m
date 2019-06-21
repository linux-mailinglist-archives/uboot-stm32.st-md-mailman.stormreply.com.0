Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACDC4E910
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9243CA028E
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 529F5CA0288
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRMTB007017; Fri, 21 Jun 2019 15:27:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=kORBkHQEnO4RQfS71C/cCPf/IfEgq46xFz/bKIhGSFU=;
 b=yhSmfv7hmMjRIam71jM2iX/9Pvk5N9Hujl67PUUBP+ke9OSH3OlfTbN7QelDa6ZnOqg3
 lNMJXXDRErDdwuSv3ulvHYDu6PLFmgxjjlBV7o051ejQ32kcjANVRINVjkzaCF/F0jhT
 S4Eh5+hyJedgIXmN//1T6PHjPi/UEZS4wNIStCaLMM6P42SyCWVmdUVkEem9G6M5Isqo
 gM7DRN6zTpttd6utI/7ih1SwPasfhe+Np/J1+/yXtD+qb2iYfcntdOOpU8cjOygpVyo7
 Fiajt+faBSoXphwCfdchZF8iI5sD1Z9y/S1r9Xj5RK8du3RLzrt79+FUqJpUgYaYMx/N Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxss9kf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC5EA3F;
 Fri, 21 Jun 2019 13:27:20 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF3472A50;
 Fri, 21 Jun 2019 13:27:20 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:20 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:20
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:54 +0200
Message-ID: <1561123618-2029-16-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 16/20] mtd: rawnand: stm32_fmc2: avoid
	warnings when building with W=1 option
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

This patch solves warnings detected by setting W=1 when building.

Warnings type detected:
 - [-Wsign-compare]
 - [-Wtype-limits]

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 93 ++++++++++++----------------------
 1 file changed, 31 insertions(+), 62 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 2bb749d..f3179cc 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -627,21 +627,16 @@ static void stm32_fmc2_calc_timings(struct nand_chip *chip,
 	struct stm32_fmc2_timings *tims = &nand->timings;
 	unsigned long hclk = clk_get_rate(&fmc2->clk);
 	unsigned long hclkp = FMC2_NSEC_PER_SEC / (hclk / 1000);
-	int tar, tclr, thiz, twait, tset_mem, tset_att, thold_mem, thold_att;
-
-	tar = hclkp;
-	if (tar < sdrt->tAR_min)
-		tar = sdrt->tAR_min;
-	tims->tar = DIV_ROUND_UP(tar, hclkp) - 1;
-	if (tims->tar > FMC2_PCR_TIMING_MASK)
-		tims->tar = FMC2_PCR_TIMING_MASK;
-
-	tclr = hclkp;
-	if (tclr < sdrt->tCLR_min)
-		tclr = sdrt->tCLR_min;
-	tims->tclr = DIV_ROUND_UP(tclr, hclkp) - 1;
-	if (tims->tclr > FMC2_PCR_TIMING_MASK)
-		tims->tclr = FMC2_PCR_TIMING_MASK;
+	unsigned long timing, tar, tclr, thiz, twait;
+	unsigned long tset_mem, tset_att, thold_mem, thold_att;
+
+	tar = max_t(unsigned long, hclkp, sdrt->tAR_min);
+	timing = DIV_ROUND_UP(tar, hclkp) - 1;
+	tims->tar = min_t(unsigned long, timing, FMC2_PCR_TIMING_MASK);
+
+	tclr = max_t(unsigned long, hclkp, sdrt->tCLR_min);
+	timing = DIV_ROUND_UP(tclr, hclkp) - 1;
+	tims->tclr = min_t(unsigned long, timing, FMC2_PCR_TIMING_MASK);
 
 	tims->thiz = FMC2_THIZ;
 	thiz = (tims->thiz + 1) * hclkp;
@@ -651,18 +646,11 @@ static void stm32_fmc2_calc_timings(struct nand_chip *chip,
 	 * tWAIT > tWP
 	 * tWAIT > tREA + tIO
 	 */
-	twait = hclkp;
-	if (twait < sdrt->tRP_min)
-		twait = sdrt->tRP_min;
-	if (twait < sdrt->tWP_min)
-		twait = sdrt->tWP_min;
-	if (twait < sdrt->tREA_max + FMC2_TIO)
-		twait = sdrt->tREA_max + FMC2_TIO;
-	tims->twait = DIV_ROUND_UP(twait, hclkp);
-	if (tims->twait == 0)
-		tims->twait = 1;
-	else if (tims->twait > FMC2_PMEM_PATT_TIMING_MASK)
-		tims->twait = FMC2_PMEM_PATT_TIMING_MASK;
+	twait = max_t(unsigned long, hclkp, sdrt->tRP_min);
+	twait = max_t(unsigned long, twait, sdrt->tWP_min);
+	twait = max_t(unsigned long, twait, sdrt->tREA_max + FMC2_TIO);
+	timing = DIV_ROUND_UP(twait, hclkp);
+	tims->twait = clamp_val(timing, 1, FMC2_PMEM_PATT_TIMING_MASK);
 
 	/*
 	 * tSETUP_MEM > tCS - tWAIT
@@ -677,20 +665,15 @@ static void stm32_fmc2_calc_timings(struct nand_chip *chip,
 	if (twait > thiz && (sdrt->tDS_min > twait - thiz) &&
 	    (tset_mem < sdrt->tDS_min - (twait - thiz)))
 		tset_mem = sdrt->tDS_min - (twait - thiz);
-	tims->tset_mem = DIV_ROUND_UP(tset_mem, hclkp);
-	if (tims->tset_mem == 0)
-		tims->tset_mem = 1;
-	else if (tims->tset_mem > FMC2_PMEM_PATT_TIMING_MASK)
-		tims->tset_mem = FMC2_PMEM_PATT_TIMING_MASK;
+	timing = DIV_ROUND_UP(tset_mem, hclkp);
+	tims->tset_mem = clamp_val(timing, 1, FMC2_PMEM_PATT_TIMING_MASK);
 
 	/*
 	 * tHOLD_MEM > tCH
 	 * tHOLD_MEM > tREH - tSETUP_MEM
 	 * tHOLD_MEM > max(tRC, tWC) - (tSETUP_MEM + tWAIT)
 	 */
-	thold_mem = hclkp;
-	if (thold_mem < sdrt->tCH_min)
-		thold_mem = sdrt->tCH_min;
+	thold_mem = max_t(unsigned long, hclkp, sdrt->tCH_min);
 	if (sdrt->tREH_min > tset_mem &&
 	    (thold_mem < sdrt->tREH_min - tset_mem))
 		thold_mem = sdrt->tREH_min - tset_mem;
@@ -700,11 +683,8 @@ static void stm32_fmc2_calc_timings(struct nand_chip *chip,
 	if ((sdrt->tWC_min > tset_mem + twait) &&
 	    (thold_mem < sdrt->tWC_min - (tset_mem + twait)))
 		thold_mem = sdrt->tWC_min - (tset_mem + twait);
-	tims->thold_mem = DIV_ROUND_UP(thold_mem, hclkp);
-	if (tims->thold_mem == 0)
-		tims->thold_mem = 1;
-	else if (tims->thold_mem > FMC2_PMEM_PATT_TIMING_MASK)
-		tims->thold_mem = FMC2_PMEM_PATT_TIMING_MASK;
+	timing = DIV_ROUND_UP(thold_mem, hclkp);
+	tims->thold_mem = clamp_val(timing, 1, FMC2_PMEM_PATT_TIMING_MASK);
 
 	/*
 	 * tSETUP_ATT > tCS - tWAIT
@@ -726,11 +706,8 @@ static void stm32_fmc2_calc_timings(struct nand_chip *chip,
 	if (twait > thiz && (sdrt->tDS_min > twait - thiz) &&
 	    (tset_att < sdrt->tDS_min - (twait - thiz)))
 		tset_att = sdrt->tDS_min - (twait - thiz);
-	tims->tset_att = DIV_ROUND_UP(tset_att, hclkp);
-	if (tims->tset_att == 0)
-		tims->tset_att = 1;
-	else if (tims->tset_att > FMC2_PMEM_PATT_TIMING_MASK)
-		tims->tset_att = FMC2_PMEM_PATT_TIMING_MASK;
+	timing = DIV_ROUND_UP(tset_att, hclkp);
+	tims->tset_att = clamp_val(timing, 1, FMC2_PMEM_PATT_TIMING_MASK);
 
 	/*
 	 * tHOLD_ATT > tALH
@@ -745,17 +722,11 @@ static void stm32_fmc2_calc_timings(struct nand_chip *chip,
 	 * tHOLD_ATT > tRC - (tSETUP_ATT + tWAIT)
 	 * tHOLD_ATT > tWC - (tSETUP_ATT + tWAIT)
 	 */
-	thold_att = hclkp;
-	if (thold_att < sdrt->tALH_min)
-		thold_att = sdrt->tALH_min;
-	if (thold_att < sdrt->tCH_min)
-		thold_att = sdrt->tCH_min;
-	if (thold_att < sdrt->tCLH_min)
-		thold_att = sdrt->tCLH_min;
-	if (thold_att < sdrt->tCOH_min)
-		thold_att = sdrt->tCOH_min;
-	if (thold_att < sdrt->tDH_min)
-		thold_att = sdrt->tDH_min;
+	thold_att = max_t(unsigned long, hclkp, sdrt->tALH_min);
+	thold_att = max_t(unsigned long, thold_att, sdrt->tCH_min);
+	thold_att = max_t(unsigned long, thold_att, sdrt->tCLH_min);
+	thold_att = max_t(unsigned long, thold_att, sdrt->tCOH_min);
+	thold_att = max_t(unsigned long, thold_att, sdrt->tDH_min);
 	if ((sdrt->tWB_max + FMC2_TIO + FMC2_TSYNC > tset_mem) &&
 	    (thold_att < sdrt->tWB_max + FMC2_TIO + FMC2_TSYNC - tset_mem))
 		thold_att = sdrt->tWB_max + FMC2_TIO + FMC2_TSYNC - tset_mem;
@@ -774,11 +745,8 @@ static void stm32_fmc2_calc_timings(struct nand_chip *chip,
 	if ((sdrt->tWC_min > tset_att + twait) &&
 	    (thold_att < sdrt->tWC_min - (tset_att + twait)))
 		thold_att = sdrt->tWC_min - (tset_att + twait);
-	tims->thold_att = DIV_ROUND_UP(thold_att, hclkp);
-	if (tims->thold_att == 0)
-		tims->thold_att = 1;
-	else if (tims->thold_att > FMC2_PMEM_PATT_TIMING_MASK)
-		tims->thold_att = FMC2_PMEM_PATT_TIMING_MASK;
+	timing = DIV_ROUND_UP(thold_att, hclkp);
+	tims->thold_att = clamp_val(timing, 1, FMC2_PMEM_PATT_TIMING_MASK);
 }
 
 static int stm32_fmc2_setup_interface(struct mtd_info *mtd, int chipnr,
@@ -932,7 +900,8 @@ static int stm32_fmc2_probe(struct udevice *dev)
 	struct nand_ecclayout *ecclayout;
 	struct resource resource;
 	struct reset_ctl reset;
-	int oob_index, chip_cs, mem_region, ret, i;
+	int oob_index, chip_cs, mem_region, ret;
+	unsigned int i;
 
 	spin_lock_init(&fmc2->controller.lock);
 	init_waitqueue_head(&fmc2->controller.wq);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
