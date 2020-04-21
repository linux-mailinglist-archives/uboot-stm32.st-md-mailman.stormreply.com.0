Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 946431B2ABB
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:11:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F3B0C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:11:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1C65C36B10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:11:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF8Jcn002600; Tue, 21 Apr 2020 17:11:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=IfiMvsewggI4hvzEE4b+Cg76oqV8uf22A5l6hV7MYXs=;
 b=i/IjNWF3qImaPUYpubpGaTkkNsJ3o2WqHtR6Rd0T1vXdaNODsWWlhzj5HAE7rlz/PQ6Y
 KRDKQ5XiVOQZA4xhIc0/SKCySgdgyCuibZnF875JzAogq6YNEbkBcbVSe1LB0DYZfGp1
 ubBIbVNL+KeV6AUlEnE9BvUTc+4+JtWt3Bv5SsIwXnLXB2QOsEQl5pHYODWy7BNv7lWE
 R8pikstRZeZE+wKeuG9kLS+w9avu2rPp8TuDQFdg63D4UMBsV5C+HdAv6oDGKulJBlbZ
 QIMY2uGHiyYCbow9AubnJLzjuU5aJov0edY6AF7yV7SyuX43HBlykO+Iy7ILdZA3I2nS PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30freggtem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D24B10002A;
 Tue, 21 Apr 2020 17:11:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 818C42BE249;
 Tue, 21 Apr 2020 17:11:48 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:48 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:23 +0200
Message-ID: <20200421171123.4.I72bb1c0e9a21462999560f16e1885725a3270515@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151128.18072-1-patrick.delaunay@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 4/9] stm32mp1: clk: configure pll1 with OPP
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

The PLL1 node (st,pll1) is optional in device tree, the max supported
frequency define in OPP node is used when the node is absent.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../clock/st,stm32mp1.txt                     |   4 +
 drivers/clk/clk_stm32mp1.c                    | 290 ++++++++++++++++--
 2 files changed, 266 insertions(+), 28 deletions(-)

diff --git a/doc/device-tree-bindings/clock/st,stm32mp1.txt b/doc/device-tree-bindings/clock/st,stm32mp1.txt
index a3d427911d..4d4136d2fc 100644
--- a/doc/device-tree-bindings/clock/st,stm32mp1.txt
+++ b/doc/device-tree-bindings/clock/st,stm32mp1.txt
@@ -87,6 +87,10 @@ Optional Properties:
   are listed with associated reg 0 to 3.
   PLLx is off when the associated node is absent or deactivated.
 
+  For PLL1, when the node is absent, the frequency of the OPP node is used
+  to compute the PLL setting (see compatible "operating-points-v2" in
+  opp/opp.txt for details).
+
   Here are the available properties for each PLL node:
     - compatible: should be "st,stm32mp1-pll"
 
diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 50df8425bf..baacc1abb5 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -14,6 +14,7 @@
 #include <vsprintf.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <asm/arch/sys_proto.h>
 #include <dt-bindings/clock/stm32mp1-clks.h>
 #include <dt-bindings/clock/stm32mp1-clksrc.h>
 
@@ -641,8 +642,18 @@ static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
 };
 
 #ifdef STM32MP1_CLOCK_TREE_INIT
+
 /* define characteristic of PLL according type */
+#define DIVM_MIN	0
+#define DIVM_MAX	63
 #define DIVN_MIN	24
+#define DIVP_MIN	0
+#define DIVP_MAX	127
+#define FRAC_MAX	8192
+
+#define PLL1600_VCO_MIN	800000000
+#define PLL1600_VCO_MAX	1600000000
+
 static const struct stm32mp1_pll stm32mp1_pll[PLL_TYPE_NB] = {
 	[PLL_800] = {
 		.refclk_min = 4,
@@ -1186,6 +1197,208 @@ static ulong stm32mp1_clk_get_rate(struct clk *clk)
 }
 
 #ifdef STM32MP1_CLOCK_TREE_INIT
+
+bool stm32mp1_supports_opp(u32 opp_id, u32 cpu_type)
+{
+	unsigned int id;
+
+	switch (opp_id) {
+	case 1:
+	case 2:
+		id = opp_id;
+		break;
+	default:
+		id = 1; /* default value */
+		break;
+	}
+
+	switch (cpu_type) {
+	case CPU_STM32MP157Fxx:
+	case CPU_STM32MP157Dxx:
+	case CPU_STM32MP153Fxx:
+	case CPU_STM32MP153Dxx:
+	case CPU_STM32MP151Fxx:
+	case CPU_STM32MP151Dxx:
+		return true;
+	default:
+		return id == 1;
+	}
+}
+
+/*
+ * gets OPP parameters (frequency in KHz and voltage in mV) from
+ * an OPP table subnode. Platform HW support capabilities are also checked.
+ * Returns 0 on success and a negative FDT error code on failure.
+ */
+static int stm32mp1_get_opp(u32 cpu_type, ofnode subnode,
+			    u32 *freq_khz, u32 *voltage_mv)
+{
+	u32 opp_hw;
+	u64 read_freq_64;
+	u32 read_voltage_32;
+
+	*freq_khz = 0;
+	*voltage_mv = 0;
+
+	opp_hw = ofnode_read_u32_default(subnode, "opp-supported-hw", 0);
+	if (opp_hw)
+		if (!stm32mp1_supports_opp(opp_hw, cpu_type))
+			return -FDT_ERR_BADVALUE;
+
+	read_freq_64 = ofnode_read_u64_default(subnode, "opp-hz", 0) /
+		       1000ULL;
+	read_voltage_32 = ofnode_read_u32_default(subnode, "opp-microvolt", 0) /
+			  1000U;
+
+	if (!read_voltage_32 || !read_freq_64)
+		return -FDT_ERR_NOTFOUND;
+
+	/* Frequency value expressed in KHz must fit on 32 bits */
+	if (read_freq_64 > U32_MAX)
+		return -FDT_ERR_BADVALUE;
+
+	/* Millivolt value must fit on 16 bits */
+	if (read_voltage_32 > U16_MAX)
+		return -FDT_ERR_BADVALUE;
+
+	*freq_khz = (u32)read_freq_64;
+	*voltage_mv = read_voltage_32;
+
+	return 0;
+}
+
+/*
+ * parses OPP table in DT and finds the parameters for the
+ * highest frequency supported by the HW platform.
+ * Returns 0 on success and a negative FDT error code on failure.
+ */
+int stm32mp1_get_max_opp_freq(struct stm32mp1_clk_priv *priv, u64 *freq_hz)
+{
+	ofnode node, subnode;
+	int ret;
+	u32 freq = 0U, voltage = 0U;
+	u32 cpu_type = get_cpu_type();
+
+	node = ofnode_by_compatible(ofnode_null(), "operating-points-v2");
+	if (!ofnode_valid(node))
+		return -FDT_ERR_NOTFOUND;
+
+	ofnode_for_each_subnode(subnode, node) {
+		unsigned int read_freq;
+		unsigned int read_voltage;
+
+		ret = stm32mp1_get_opp(cpu_type, subnode,
+				       &read_freq, &read_voltage);
+		if (ret)
+			continue;
+
+		if (read_freq > freq) {
+			freq = read_freq;
+			voltage = read_voltage;
+		}
+	}
+
+	if (!freq || !voltage)
+		return -FDT_ERR_NOTFOUND;
+
+	*freq_hz = (u64)1000U * freq;
+
+	return 0;
+}
+
+static int stm32mp1_pll1_opp(struct stm32mp1_clk_priv *priv, int clksrc,
+			     u32 *pllcfg, u32 *fracv)
+{
+	u32 post_divm;
+	u32 input_freq;
+	u64 output_freq;
+	u64 freq;
+	u64 vco;
+	u32 divm, divn, divp, frac;
+	int i, ret;
+	u32 diff;
+	u32 best_diff = U32_MAX;
+
+	/* PLL1 is 1600 */
+	const u32 DIVN_MAX = stm32mp1_pll[PLL_1600].divn_max;
+	const u32 POST_DIVM_MIN = stm32mp1_pll[PLL_1600].refclk_min * 1000000U;
+	const u32 POST_DIVM_MAX = stm32mp1_pll[PLL_1600].refclk_max * 1000000U;
+
+	ret = stm32mp1_get_max_opp_freq(priv, &output_freq);
+	if (ret) {
+		debug("PLL1 OPP configuration not found (%d).\n", ret);
+		return ret;
+	}
+
+	switch (clksrc) {
+	case CLK_PLL12_HSI:
+		input_freq = stm32mp1_clk_get_fixed(priv, _HSI);
+		break;
+	case CLK_PLL12_HSE:
+		input_freq = stm32mp1_clk_get_fixed(priv, _HSE);
+		break;
+	default:
+		return -EINTR;
+	}
+
+	/* Following parameters have always the same value */
+	pllcfg[PLLCFG_Q] = 0;
+	pllcfg[PLLCFG_R] = 0;
+	pllcfg[PLLCFG_O] = PQR(1, 0, 0);
+
+	for (divm = DIVM_MAX; divm >= DIVM_MIN; divm--)	{
+		post_divm = (u32)(input_freq / (divm + 1));
+		if (post_divm < POST_DIVM_MIN || post_divm > POST_DIVM_MAX)
+			continue;
+
+		for (divp = DIVP_MIN; divp <= DIVP_MAX; divp++) {
+			freq = output_freq * (divm + 1) * (divp + 1);
+			divn = (u32)((freq / input_freq) - 1);
+			if (divn < DIVN_MIN || divn > DIVN_MAX)
+				continue;
+
+			frac = (u32)(((freq * FRAC_MAX) / input_freq) -
+				     ((divn + 1) * FRAC_MAX));
+			/* 2 loops to refine the fractional part */
+			for (i = 2; i != 0; i--) {
+				if (frac > FRAC_MAX)
+					break;
+
+				vco = (post_divm * (divn + 1)) +
+				      ((post_divm * (u64)frac) /
+				       FRAC_MAX);
+				if (vco < (PLL1600_VCO_MIN / 2) ||
+				    vco > (PLL1600_VCO_MAX / 2)) {
+					frac++;
+					continue;
+				}
+				freq = vco / (divp + 1);
+				if (output_freq < freq)
+					diff = (u32)(freq - output_freq);
+				else
+					diff = (u32)(output_freq - freq);
+				if (diff < best_diff)  {
+					pllcfg[PLLCFG_M] = divm;
+					pllcfg[PLLCFG_N] = divn;
+					pllcfg[PLLCFG_P] = divp;
+					*fracv = frac;
+
+					if (diff == 0)
+						return 0;
+
+					best_diff = diff;
+				}
+				frac++;
+			}
+		}
+	}
+
+	if (best_diff == U32_MAX)
+		return -1;
+
+	return 0;
+}
+
 static void stm32mp1_ls_osc_set(int enable, fdt_addr_t rcc, u32 offset,
 				u32 mask_on)
 {
@@ -1657,9 +1870,12 @@ static int stm32mp1_clktree(struct udevice *dev)
 	unsigned int clksrc[CLKSRC_NB];
 	unsigned int clkdiv[CLKDIV_NB];
 	unsigned int pllcfg[_PLL_NB][PLLCFG_NB];
-	ofnode plloff[_PLL_NB];
-	int ret, len;
-	uint i;
+	unsigned int pllfracv[_PLL_NB];
+	unsigned int pllcsg[_PLL_NB][PLLCSG_NB];
+	bool pllcfg_valid[_PLL_NB];
+	bool pllcsg_set[_PLL_NB];
+	int ret;
+	int i, len;
 	int lse_css = 0;
 	const u32 *pkcs_cell;
 
@@ -1679,16 +1895,43 @@ static int stm32mp1_clktree(struct udevice *dev)
 	/* check mandatory field in each pll */
 	for (i = 0; i < _PLL_NB; i++) {
 		char name[12];
+		ofnode node;
 
 		sprintf(name, "st,pll@%d", i);
-		plloff[i] = dev_read_subnode(dev, name);
-		if (!ofnode_valid(plloff[i]))
-			continue;
-		ret = ofnode_read_u32_array(plloff[i], "cfg",
-					    pllcfg[i], PLLCFG_NB);
-		if (ret < 0) {
-			debug("field cfg invalid: error %d\n", ret);
-			return -FDT_ERR_NOTFOUND;
+		node = dev_read_subnode(dev, name);
+		pllcfg_valid[i] = ofnode_valid(node);
+		pllcsg_set[i] = false;
+		if (pllcfg_valid[i]) {
+			debug("DT for PLL %d @ %s\n", i, name);
+			ret = ofnode_read_u32_array(node, "cfg",
+						    pllcfg[i], PLLCFG_NB);
+			if (ret < 0) {
+				debug("field cfg invalid: error %d\n", ret);
+				return -FDT_ERR_NOTFOUND;
+			}
+			pllfracv[i] = ofnode_read_u32_default(node, "frac", 0);
+
+			ret = ofnode_read_u32_array(node, "csg", pllcsg[i],
+						    PLLCSG_NB);
+			if (!ret) {
+				pllcsg_set[i] = true;
+			} else if (ret != -FDT_ERR_NOTFOUND) {
+				debug("invalid csg node for pll@%d res=%d\n",
+				      i, ret);
+				return ret;
+			}
+		} else if (i == _PLL1)	{
+			/* use OPP for PLL1 for A7 CPU */
+			debug("DT for PLL %d with OPP\n", i);
+			ret = stm32mp1_pll1_opp(priv,
+						clksrc[CLKSRC_PLL12],
+						pllcfg[i],
+						&pllfracv[i]);
+			if (ret) {
+				debug("PLL %d with OPP error = %d\n", i, ret);
+				return ret;
+			}
+			pllcfg_valid[i] = true;
 		}
 	}
 
@@ -1774,29 +2017,18 @@ static int stm32mp1_clktree(struct udevice *dev)
 	/* configure and start PLLs */
 	debug("configure PLLs\n");
 	for (i = 0; i < _PLL_NB; i++) {
-		u32 fracv;
-		u32 csg[PLLCSG_NB];
-
-		debug("configure PLL %d @ %d\n", i,
-		      ofnode_to_offset(plloff[i]));
-		if (!ofnode_valid(plloff[i]))
+		if (!pllcfg_valid[i])
 			continue;
-
-		fracv = ofnode_read_u32_default(plloff[i], "frac", 0);
-		pll_config(priv, i, pllcfg[i], fracv);
-		ret = ofnode_read_u32_array(plloff[i], "csg", csg, PLLCSG_NB);
-		if (!ret) {
-			pll_csg(priv, i, csg);
-		} else if (ret != -FDT_ERR_NOTFOUND) {
-			debug("invalid csg node for pll@%d res=%d\n", i, ret);
-			return ret;
-		}
+		debug("configure PLL %d\n", i);
+		pll_config(priv, i, pllcfg[i], pllfracv[i]);
+		if (pllcsg_set[i])
+			pll_csg(priv, i, pllcsg[i]);
 		pll_start(priv, i);
 	}
 
 	/* wait and start PLLs ouptut when ready */
 	for (i = 0; i < _PLL_NB; i++) {
-		if (!ofnode_valid(plloff[i]))
+		if (!pllcfg_valid[i])
 			continue;
 		debug("output PLL %d\n", i);
 		pll_output(priv, i, pllcfg[i][PLLCFG_O]);
@@ -2046,6 +2278,8 @@ static int stm32mp1_clk_probe(struct udevice *dev)
 	/* clock tree init is done only one time, before relocation */
 	if (!(gd->flags & GD_FLG_RELOC))
 		result = stm32mp1_clktree(dev);
+	if (result)
+		printf("clock tree initialization failed (%d)\n", result);
 #endif
 
 #ifndef CONFIG_SPL_BUILD
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
