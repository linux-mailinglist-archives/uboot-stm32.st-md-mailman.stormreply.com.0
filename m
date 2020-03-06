Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68317B9F8
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:14:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33836C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:14:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A800DC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:14:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026AER19020373; Fri, 6 Mar 2020 11:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=YBtqdHCVAYr45yHN7bc4YwCYV7/BFRolQgjmcH78jBI=;
 b=PrfNfj2bbFZht/DU5RIsN5efW3LNnQPM9z+iFKd62PY6Ai2aPKVYhxenLE5x+1k6bUez
 JFdKoEO5nTLYfm1InCKNRdlbYE3vq4tNtly6VsxrflLqJ6YInbb+ohk7FK6H3rKK7JMH
 sOggPheMxxzqzpREO9NL7LQzxTfLBq6bS7KiHybVck8O929cvDt267ar7DI5/J3fDqFO
 0+KpgJocgvrRW88MJ97kbSMigt4z5/maXV9yumixLS+5zAo+gHv0kPO4jixDjrRCyVhq
 d1+sEdT2pimzk8ZPIGqY3rlvk8X6Zk8kFoo3YyTCGrtcYegERUI5eRnKGbu4tfhhkiFh SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yffqqegs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:14:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02A0A10003A;
 Fri,  6 Mar 2020 11:14:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEAEE2A7189;
 Fri,  6 Mar 2020 11:14:34 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:14:34 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:14:08 +0100
Message-ID: <20200306111355.6.Id09f75f6aa43a345f0eccb009481c6423933358b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306101412.15376-1-patrick.delaunay@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 6/9] ram: stm32mp1: update BIST config for
	tuning
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

Update the BIST config to compute the real use mask for the real
bank, row and col of the used DDR. The values are get from addrmap
register value.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tuning.c | 151 +++++++++++++++++++++++--
 1 file changed, 142 insertions(+), 9 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
index 37d3ec8fef..07d57d496c 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
@@ -8,6 +8,7 @@
 #include <ram.h>
 #include <reset.h>
 #include <asm/io.h>
+#include <linux/bitops.h>
 #include <linux/iopoll.h>
 
 #include "stm32mp1_ddr_regs.h"
@@ -76,6 +77,133 @@ static u8 get_nb_bytes(struct stm32mp1_ddrctl *ctl)
 	return nb_bytes;
 }
 
+static u8 get_nb_bank(struct stm32mp1_ddrctl *ctl)
+{
+	/* Count bank address bits */
+	u8 bits = 0;
+	u32 reg, val;
+
+	reg = readl(&ctl->addrmap1);
+	/* addrmap1.addrmap_bank_b1 */
+	val = (reg & GENMASK(5, 0)) >> 0;
+	if (val <= 31)
+		bits++;
+	/* addrmap1.addrmap_bank_b2 */
+	val = (reg & GENMASK(13, 8)) >> 8;
+	if (val <= 31)
+		bits++;
+	/* addrmap1.addrmap_bank_b3 */
+	val = (reg & GENMASK(21, 16)) >> 16;
+	if (val <= 31)
+		bits++;
+
+	return bits;
+}
+
+static u8 get_nb_col(struct stm32mp1_ddrctl *ctl)
+{
+	u8 bits;
+	u32 reg, val;
+
+	/* Count column address bits, start at 2 for b0 and b1 (fixed) */
+	bits = 2;
+
+	reg = readl(&ctl->addrmap2);
+	/* addrmap2.addrmap_col_b2 */
+	val = (reg & GENMASK(3, 0)) >> 0;
+	if (val <= 7)
+		bits++;
+	/* addrmap2.addrmap_col_b3 */
+	val = (reg & GENMASK(11, 8)) >> 8;
+	if (val <= 7)
+		bits++;
+	/* addrmap2.addrmap_col_b4 */
+	val = (reg & GENMASK(19, 16)) >> 16;
+	if (val <= 7)
+		bits++;
+	/* addrmap2.addrmap_col_b5 */
+	val = (reg & GENMASK(27, 24)) >> 24;
+	if (val <= 7)
+		bits++;
+
+	reg = readl(&ctl->addrmap3);
+	/* addrmap3.addrmap_col_b6 */
+	val = (reg & GENMASK(3, 0)) >> 0;
+	if (val <= 7)
+		bits++;
+	/* addrmap3.addrmap_col_b7 */
+	val = (reg & GENMASK(11, 8)) >> 8;
+	if (val <= 7)
+		bits++;
+	/* addrmap3.addrmap_col_b8 */
+	val = (reg & GENMASK(19, 16)) >> 16;
+	if (val <= 7)
+		bits++;
+	/* addrmap3.addrmap_col_b9 */
+	val = (reg & GENMASK(27, 24)) >> 24;
+	if (val <= 7)
+		bits++;
+
+	reg = readl(&ctl->addrmap4);
+	/* addrmap4.addrmap_col_b10 */
+	val = (reg & GENMASK(3, 0)) >> 0;
+	if (val <= 7)
+		bits++;
+	/* addrmap4.addrmap_col_b11 */
+	val = (reg & GENMASK(11, 8)) >> 8;
+	if (val <= 7)
+		bits++;
+
+	return bits;
+}
+
+static u8 get_nb_row(struct stm32mp1_ddrctl *ctl)
+{
+	/* Count row address bits */
+	u8 bits = 0;
+	u32 reg, val;
+
+	reg = readl(&ctl->addrmap5);
+	/* addrmap5.addrmap_row_b0 */
+	val = (reg & GENMASK(3, 0)) >> 0;
+	if (val <= 11)
+		bits++;
+	/* addrmap5.addrmap_row_b1 */
+	val = (reg & GENMASK(11, 8)) >> 8;
+	if (val <= 11)
+		bits++;
+	/* addrmap5.addrmap_row_b2_10 */
+	val = (reg & GENMASK(19, 16)) >> 16;
+	if (val <= 11)
+		bits += 9;
+	else
+		printf("warning: addrmap5.addrmap_row_b2_10 not supported\n");
+	/* addrmap5.addrmap_row_b11 */
+	val = (reg & GENMASK(27, 24)) >> 24;
+	if (val <= 11)
+		bits++;
+
+	reg = readl(&ctl->addrmap6);
+	/* addrmap6.addrmap_row_b12 */
+	val = (reg & GENMASK(3, 0)) >> 0;
+	if (val <= 7)
+		bits++;
+	/* addrmap6.addrmap_row_b13 */
+	val = (reg & GENMASK(11, 8)) >> 8;
+	if (val <= 7)
+		bits++;
+	/* addrmap6.addrmap_row_b14 */
+	val = (reg & GENMASK(19, 16)) >> 16;
+	if (val <= 7)
+		bits++;
+	/* addrmap6.addrmap_row_b15 */
+	val = (reg & GENMASK(27, 24)) >> 24;
+	if (val <= 7)
+		bits++;
+
+	return bits;
+}
+
 static void itm_soft_reset(struct stm32mp1_ddrphy *phy)
 {
 	stm32mp1_ddrphy_init(phy, DDRPHYC_PIR_ITMSRST);
@@ -170,8 +298,13 @@ static void set_r0dgps_delay(struct stm32mp1_ddrphy *phy,
 }
 
 /* Basic BIST configuration for data lane tests. */
-static void config_BIST(struct stm32mp1_ddrphy *phy)
+static void config_BIST(struct stm32mp1_ddrctl *ctl,
+			struct stm32mp1_ddrphy *phy)
 {
+	u8 nb_bank = get_nb_bank(ctl);
+	u8 nb_row = get_nb_row(ctl);
+	u8 nb_col = get_nb_col(ctl);
+
 	/* Selects the SDRAM bank address to be used during BIST. */
 	u32 bbank = 0;
 	/* Selects the SDRAM row address to be used during BIST. */
@@ -191,18 +324,20 @@ static void config_BIST(struct stm32mp1_ddrphy *phy)
 	 * must be 0 with single rank
 	 */
 	u32 brank = 0;
+
 	/* Specifies the maximum SDRAM bank address to be used during
 	 * BIST before the address & increments to the next rank.
 	 */
-	u32 bmbank = 1;
+	u32 bmbank = (1 << nb_bank) - 1;
 	/* Specifies the maximum SDRAM row address to be used during
 	 * BIST before the address & increments to the next bank.
 	 */
-	u32 bmrow = 0x7FFF; /* To check */
+	u32 bmrow = (1 << nb_row) - 1;
 	/* Specifies the maximum SDRAM column address to be used during
 	 * BIST before the address & increments to the next row.
 	 */
-	u32 bmcol = 0x3FF;  /* To check */
+	u32 bmcol = (1 << nb_col) - 1;
+
 	u32 bmode_conf = 0x00000001;  /* DRam mode */
 	u32 bdxen_conf = 0x00000001;  /* BIST on Data byte */
 	u32 bdpat_conf = 0x00000002;  /* Select LFSR pattern */
@@ -224,8 +359,6 @@ static void config_BIST(struct stm32mp1_ddrphy *phy)
 
 	writel(bcol | (brow << 12) | (bbank << 28), &phy->bistar0);
 	writel(brank | (bmrank << 2) | (bainc << 4), &phy->bistar1);
-
-	/* To check this line : */
 	writel(bmcol | (bmrow << 12) | (bmbank << 28), &phy->bistar2);
 }
 
@@ -399,7 +532,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 	clrbits_le32(&phy->dx3gcr, DDRPHYC_DXNGCR_DXEN);
 
 	/* Config the BIST block */
-	config_BIST(phy);
+	config_BIST(ctl, phy);
 	pr_debug("BIST Config done.\n");
 
 	/* Train each byte */
@@ -812,7 +945,7 @@ static enum test_result eye_training(struct stm32mp1_ddrctl *ctl,
 	clrbits_le32(&phy->dx3gcr, DDRPHYC_DXNGCR_DXEN);
 
 	/* Config the BIST block */
-	config_BIST(phy);
+	config_BIST(ctl, phy);
 
 	for (byte = 0; byte < nb_bytes; byte++) {
 		if (ctrlc()) {
@@ -1234,7 +1367,7 @@ static enum test_result read_dqs_gating(struct stm32mp1_ddrctl *ctl,
 	clrbits_le32(&phy->dx3gcr, DDRPHYC_DXNGCR_DXEN);
 
 	/* config the bist block */
-	config_BIST(phy);
+	config_BIST(ctl, phy);
 
 	for (byte = 0; byte < nb_bytes; byte++) {
 		if (ctrlc()) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
