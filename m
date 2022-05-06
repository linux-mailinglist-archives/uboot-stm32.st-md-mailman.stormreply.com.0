Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B34151D9F4
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 16:08:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62D4FC628B4;
	Fri,  6 May 2022 14:08:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CA77C628B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:08:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246Bd1Rf010864;
 Fri, 6 May 2022 16:08:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=AsdF1ARtMBiV3QUP1V0oVQRwx01shZO+DCvLavO6P6U=;
 b=VAf4oi5zTWf4sS+/Vs3PddWOpcvf7kehFU98cx+tKsWv2wLoo3/0ilINQkE2Cu29Wf20
 7oMenTXg0hVZ0drSqlAPL0wXk8acAwNGLulf5m7l+K3J/6fqRC4U3LCEMKuQFMEqpFvC
 iOJzX5E0JuguYmMmmMb1587sfbcC8U8O7cYV0CecOO2JaCkxrVVUGfoBqvk7n8N9Fams
 gTb1r8e07CKDOtZLWjemY0ecv6SQt8eoVya2l9S2amsjctgpE0P3dLcwx97OVIOi7aM2
 0CtphGhHYq1LIjSw7zRJvqexBjCpn1N8/3+7SwA/EDt26KBZi7UVw+cCRAzLkdgRtnlz xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fvygu2cyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:08:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA2D3100034;
 Fri,  6 May 2022 16:08:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D402D2248DB;
 Fri,  6 May 2022 16:08:36 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May 2022 16:08:35
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 May 2022 16:06:19 +0200
Message-ID: <20220506160540.12.I3c50158401b3eb022059c7394e48980af23b9582@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 12/16] ram: stm32mp1: add support of STM32MP13x
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

Add support for new compatible "st,stm32mp13-ddr" to manage the
DDR sub system (Controller and PHY) in STM32MP13x SOC:
- only one AXI port
- support of 16 port output (MEMC_DRAM_DATA_WIDTH = 2)

The STM32MP15x SOC have 2 AXI ports and 32 bits support.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../memory-controllers/st,stm32mp1-ddr.txt    | 49 +++++++++++++++----
 drivers/ram/stm32mp1/stm32mp1_ram.c           | 28 +++++++----
 2 files changed, 57 insertions(+), 20 deletions(-)

diff --git a/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt b/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
index 926e3e83b3..e6ea8d0ef5 100644
--- a/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
+++ b/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
@@ -3,7 +3,8 @@ ST,stm32mp1 DDR3/LPDDR2/LPDDR3 Controller (DDRCTRL and DDRPHYC)
 --------------------
 Required properties:
 --------------------
-- compatible	: Should be "st,stm32mp1-ddr"
+- compatible	: Should be "st,stm32mp1-ddr" for STM32MP15x
+		  Should be "st,stm32mp13-ddr" for STM32MP13x
 - reg		: controleur (DDRCTRL) and phy (DDRPHYC) base address
 - clocks	: controller clocks handle
 - clock-names	: associated controller clock names
@@ -13,6 +14,8 @@ Required properties:
 the next attributes are DDR parameters, they are generated by DDR tools
 included in STM32 Cube tool
 
+They are required only in SPL, when TFABOOT is not activated.
+
 info attributes:
 ----------------
 - st,mem-name	: name for DDR configuration, simple string for information
@@ -24,7 +27,7 @@ controlleur attributes:
 -----------------------
 - st,ctl-reg	: controleur values depending of the DDR type
 		  (DDR3/LPDDR2/LPDDR3)
-	for STM32MP15x: 25 values are requested in this order
+	for STM32MP15x and STM32MP13x: 25 values are requested in this order
 		MSTR
 		MRCTRL0
 		MRCTRL1
@@ -53,7 +56,7 @@ controlleur attributes:
 
 - st,ctl-timing	: controleur values depending of frequency and timing parameter
 		  of DDR
-	for STM32MP15x: 12 values are requested in this order
+	for STM32MP15x and STM32MP13x: 12 values are requested in this order
 		RFSHTMG
 		DRAMTMG0
 		DRAMTMG1
@@ -68,7 +71,7 @@ controlleur attributes:
 		ODTCFG
 
 - st,ctl-map	: controleur values depending of address mapping
-	for STM32MP15x: 9 values are requested in this order
+	for STM32MP15x and STM32MP13x: 9 values are requested in this order
 		ADDRMAP1
 		ADDRMAP2
 		ADDRMAP3
@@ -99,6 +102,19 @@ controlleur attributes:
 		PCFGWQOS0_1
 		PCFGWQOS1_1
 
+	for STM32MP13x: 11 values are requested in this order
+		SCHED
+		SCHED1
+		PERFHPR1
+		PERFLPR1
+		PERFWR1
+		PCFGR_0
+		PCFGW_0
+		PCFGQOS0_0
+		PCFGQOS1_0
+		PCFGWQOS0_0
+		PCFGWQOS1_0
+
 phyc attributes:
 ----------------
 - st,phy-reg	: phy values depending of the DDR type (DDR3/LPDDR2/LPDDR3)
@@ -115,8 +131,19 @@ phyc attributes:
 		DX2GCR
 		DX3GCR
 
+	for STM32MP13x: 9 values are requested in this order
+		PGCR
+		ACIOCR
+		DXCCR
+		DSGCR
+		DCR
+		ODTCR
+		ZQ0CR1
+		DX0GCR
+		DX1GCR
+
 - st,phy-timing	: phy values depending of frequency and timing parameter of DDR
-	for STM32MP15x: 10 values are requested in this order
+	for STM32MP15x and STM32MP13x: 10 values are requested in this order
 		PTR0
 		PTR1
 		PTR2
@@ -128,16 +155,18 @@ phyc attributes:
 		MR2
 		MR3
 
+	for STM32MP13x: 6 values are requested in this order
+		DX0DLLCR
+		DX0DQTR
+		DX0DQSTR
+		DX1DLLCR
+		DX1DQTR
+		DX1DQSTR
 Example:
 
 / {
 	soc {
-		u-boot,dm-spl;
-
 		ddr: ddr@0x5A003000{
-			u-boot,dm-spl;
-			u-boot,dm-pre-reloc;
-
 			compatible = "st,stm32mp1-ddr";
 
 			reg = <0x5A003000 0x550
diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
index 49b1262461..a6c19af972 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ram.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
@@ -230,29 +230,29 @@ static u8 get_nb_col(struct stm32mp1_ddrctl *ctl, u8 data_bus_width)
 
 	reg = readl(&ctl->addrmap3);
 	/* addrmap3.addrmap_col_b6 */
-	val = (reg & GENMASK(3, 0)) >> 0;
+	val = (reg & GENMASK(4, 0)) >> 0;
 	if (val <= 7)
 		bits++;
 	/* addrmap3.addrmap_col_b7 */
-	val = (reg & GENMASK(11, 8)) >> 8;
+	val = (reg & GENMASK(12, 8)) >> 8;
 	if (val <= 7)
 		bits++;
 	/* addrmap3.addrmap_col_b8 */
-	val = (reg & GENMASK(19, 16)) >> 16;
+	val = (reg & GENMASK(20, 16)) >> 16;
 	if (val <= 7)
 		bits++;
 	/* addrmap3.addrmap_col_b9 */
-	val = (reg & GENMASK(27, 24)) >> 24;
+	val = (reg & GENMASK(28, 24)) >> 24;
 	if (val <= 7)
 		bits++;
 
 	reg = readl(&ctl->addrmap4);
 	/* addrmap4.addrmap_col_b10 */
-	val = (reg & GENMASK(3, 0)) >> 0;
+	val = (reg & GENMASK(4, 0)) >> 0;
 	if (val <= 7)
 		bits++;
 	/* addrmap4.addrmap_col_b11 */
-	val = (reg & GENMASK(11, 8)) >> 8;
+	val = (reg & GENMASK(12, 8)) >> 8;
 	if (val <= 7)
 		bits++;
 
@@ -296,21 +296,24 @@ static u8 get_nb_row(struct stm32mp1_ddrctl *ctl)
 	reg = readl(&ctl->addrmap6);
 	/* addrmap6.addrmap_row_b12 */
 	val = (reg & GENMASK(3, 0)) >> 0;
-	if (val <= 7)
+	if (val <= 11)
 		bits++;
 	/* addrmap6.addrmap_row_b13 */
 	val = (reg & GENMASK(11, 8)) >> 8;
-	if (val <= 7)
+	if (val <= 11)
 		bits++;
 	/* addrmap6.addrmap_row_b14 */
 	val = (reg & GENMASK(19, 16)) >> 16;
-	if (val <= 7)
+	if (val <= 11)
 		bits++;
 	/* addrmap6.addrmap_row_b15 */
 	val = (reg & GENMASK(27, 24)) >> 24;
-	if (val <= 7)
+	if (val <= 11)
 		bits++;
 
+	if (reg & BIT(31))
+		printf("warning: LPDDR3_6GB_12GB is not supported\n");
+
 	return bits;
 }
 
@@ -392,12 +395,17 @@ static struct ram_ops stm32mp1_ddr_ops = {
 	.get_info = stm32mp1_ddr_get_info,
 };
 
+static const struct stm32mp1_ddr_cfg stm32mp13x_ddr_cfg = {
+	.nb_bytes = 2,
+};
+
 static const struct stm32mp1_ddr_cfg stm32mp15x_ddr_cfg = {
 	.nb_bytes = 4,
 };
 
 static const struct udevice_id stm32mp1_ddr_ids[] = {
 	{ .compatible = "st,stm32mp1-ddr", .data = (ulong)&stm32mp15x_ddr_cfg},
+	{ .compatible = "st,stm32mp13-ddr", .data = (ulong)&stm32mp13x_ddr_cfg},
 	{ }
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
