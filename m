Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6770245B7D3
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Nov 2021 10:52:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 241BAC5A4D4;
	Wed, 24 Nov 2021 09:52:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43CE8C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 09:52:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AO965g5002297;
 Wed, 24 Nov 2021 10:52:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=YM2zON7+ouVWDcbmA5qlM7ezOWoE553vvfdcoBmP8L8=;
 b=cO/UEMlW4lh4ZRs+RLfbiGFfz5tlp0EP9US4m1q1AT3ho46D0n13v4/BbMK+4f71iyE/
 C+1Xz2ovSUh/P6+HcXXKFgOzJzCIG2gIA+a07FHJWMzhi3TvND2DdeGS66doUeEW68ap
 w6hKW1x+1DBvZ/pZiGEGW0uiIuzCQK6lfWaKGQ7dqDoPSne0HGpKVz02BSE4XovOmFls
 gExpzeQjIk3XLrJJ+RcesB1PQovRyZX/p9PIoDsxe1T4iBtCTixkmjTSMhE284znzjXZ
 MZZmY10O6WOBLiz7gL4VXr+rVIpSBHd8e4bHmat5sRHJP3MmjgEElmN7+MHhjqLf96R8 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3chbneafxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 10:52:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BAB4100034;
 Wed, 24 Nov 2021 10:52:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FF6A21E661;
 Wed, 24 Nov 2021 10:52:24 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 24 Nov 2021 10:52:23
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Nov 2021 10:52:18 +0100
Message-ID: <20211124105216.1.I2f1cd5fa86d23797b452eecde73e8b52ac0f878f@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_03,2021-11-23_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] ram: stm32mp1: compute DDR size from
	DDRCTL registers
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

Compute the DDR size from DDR controller register (mstr and addrmap)
in U-Boot proper as the DDR information are useful only for SPL
but not for U-Boot proper, for example with TFABOOT.

This patch simplify U-Boot DT when several DDR size are supported
and support of next SOC in STM32MP family.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/ram/stm32mp1/stm32mp1_ddr_regs.h |   1 +
 drivers/ram/stm32mp1/stm32mp1_ram.c      | 192 ++++++++++++++++++++++-
 2 files changed, 190 insertions(+), 3 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
index 3c8885a965..d6b9a76a76 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
+++ b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
@@ -238,6 +238,7 @@ struct stm32mp1_ddrphy {
 #define DDRCTRL_MSTR_LPDDR2			BIT(2)
 #define DDRCTRL_MSTR_LPDDR3			BIT(3)
 #define DDRCTRL_MSTR_DATA_BUS_WIDTH_MASK	GENMASK(13, 12)
+#define DDRCTRL_MSTR_DATA_BUS_WIDTH_SHIFT	12
 #define DDRCTRL_MSTR_DATA_BUS_WIDTH_FULL	(0 << 12)
 #define DDRCTRL_MSTR_DATA_BUS_WIDTH_HALF	(1 << 12)
 #define DDRCTRL_MSTR_DATA_BUS_WIDTH_QUARTER	(2 << 12)
diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
index 98fa1f4f11..c9335e59df 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ram.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
@@ -16,6 +16,12 @@
 #include <asm/io.h>
 #include <dm/device_compat.h>
 #include "stm32mp1_ddr.h"
+#include "stm32mp1_ddr_regs.h"
+
+/* DDR subsystem configuration */
+struct stm32mp1_ddr_cfg {
+	u8 nb_bytes;	/* MEMC_DRAM_DATA_WIDTH */
+};
 
 static const char *const clkname[] = {
 	"ddrc1",
@@ -183,6 +189,182 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
 	return 0;
 }
 
+static u8 get_data_bus_width(struct stm32mp1_ddrctl *ctl)
+{
+	u32 reg = readl(&ctl->mstr) & DDRCTRL_MSTR_DATA_BUS_WIDTH_MASK;
+	u8 data_bus_width = reg >> DDRCTRL_MSTR_DATA_BUS_WIDTH_SHIFT;
+
+	return data_bus_width;
+}
+
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
+static u8 get_nb_col(struct stm32mp1_ddrctl *ctl, u8 data_bus_width)
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
+	/* column bits shift up:
+	 * 1 when half the data bus is used (data_bus_width = 1)
+	 * 2 when a quarter the data bus is used (data_bus_width = 2)
+	 * nothing to do for full data bus (data_bus_width = 0)
+	 */
+	bits += data_bus_width;
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
+/*
+ * stm32mp1_ddr_size
+ *
+ * Get the current DRAM size from the DDR CTL registers
+ *
+ * @return: DRAM size
+ */
+u32 stm32mp1_ddr_size(struct udevice *dev)
+{
+	u8 nb_bit;
+	u32 ddr_size;
+	u8 data_bus_width;
+	struct ddr_info *priv = dev_get_priv(dev);
+	struct stm32mp1_ddrctl *ctl = priv->ctl;
+	struct stm32mp1_ddr_cfg *cfg = (struct stm32mp1_ddr_cfg *)dev_get_driver_data(dev);
+	const u8 nb_bytes = cfg->nb_bytes;
+
+	data_bus_width = get_data_bus_width(ctl);
+	nb_bit = get_nb_bank(ctl) + get_nb_col(ctl, data_bus_width) +
+		 get_nb_row(ctl);
+	if (nb_bit > 32) {
+		nb_bit = 32;
+		debug("invalid DDR configuration: %d bits\n", nb_bit);
+	}
+
+	ddr_size = (nb_bytes >> data_bus_width) << nb_bit;
+	if (ddr_size > STM32_DDR_SIZE) {
+		ddr_size = STM32_DDR_SIZE;
+		debug("invalid DDR configuration: size = %x\n", ddr_size);
+	}
+
+	return ddr_size;
+}
+
 static int stm32mp1_ddr_probe(struct udevice *dev)
 {
 	struct ddr_info *priv = dev_get_priv(dev);
@@ -209,8 +391,8 @@ static int stm32mp1_ddr_probe(struct udevice *dev)
 		return log_ret(ret);
 	}
 
-	ofnode node = stm32mp1_ddr_get_ofnode(dev);
-	priv->info.size = ofnode_read_u32_default(node, "st,mem-size", 0);
+	priv->info.size = stm32mp1_ddr_size(dev);
+
 	return 0;
 }
 
@@ -227,8 +409,12 @@ static struct ram_ops stm32mp1_ddr_ops = {
 	.get_info = stm32mp1_ddr_get_info,
 };
 
+static const struct stm32mp1_ddr_cfg stm32mp15x_ddr_cfg = {
+	.nb_bytes = 4,
+};
+
 static const struct udevice_id stm32mp1_ddr_ids[] = {
-	{ .compatible = "st,stm32mp1-ddr" },
+	{ .compatible = "st,stm32mp1-ddr", .data = (ulong)&stm32mp15x_ddr_cfg},
 	{ }
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
