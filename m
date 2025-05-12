Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B99AB3EAF
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 19:09:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50DEFC7A82D;
	Mon, 12 May 2025 17:09:40 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF6C6C7A82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 17:09:39 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Zx5gl3mjfz9sW6;
 Mon, 12 May 2025 19:09:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747069779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5xV1v9qNvJlA6tmRLtHKQ1nVn4BomJ/2JbNei3Ox4kw=;
 b=mKGSUelVKb6taE7gYNnWzCoz7XJp+5cUn48IA6hxJo/V9ZGkWIJbCpulC32eAJbHNv2GZx
 A46srqeXJUnNaioT9tZI7q1jVilnr0oYANEbRaai5h3m4Pw5exbzJ1npnkfe+QIdDRiZwz
 ytEKruZ3A99GnIOktUxE6svIFKnwJRL4hQ99nE5anigWhIrvxuO9m6l+U+fPv85gqH2GHT
 Zrzpg4sHXmiDYFsQAhsdHGTgMBKrS7iLKbU+BOSrudopGegEKzMBy//cQeZqx0ePSQ4/kL
 kmVqv+x2FtnnM9S/6h/Dd3Pf4uGo/bXB2lwyOwYpvyZqyGSiYD3Kd4qAgdDQfQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747069777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5xV1v9qNvJlA6tmRLtHKQ1nVn4BomJ/2JbNei3Ox4kw=;
 b=bf3ByHwsHGklNwBtitMCBt081f8/SHAJi/Bdt26RC80XoVeCkx4RTe5eLbydMZx4T5DVlq
 GF1bG+mbYzn8gylDDEsTtAdZn4Hglzsj7kdQ6lElkV5S7zVOVGd7ddwwcuyLqA2p3x3RPu
 P0rdoPMAlx91PXRMB6DZj7tKS5LqmZ7jCRQAA0sm9O7nKFTZ1oSFGOKS2s6SjWZ3vyzKQp
 Zcxp+slPj16upvJVqxMGkLs1aEGLcTpqqMY2p6Ptb/Uet17jduLu9t37687AdhxeWzxZMR
 jj1x/EXWck1RbhzAUE75YGMmZv66/DWDt8DKPvtDZpSGDFgKZaMd54xqULi5Nw==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 19:09:05 +0200
Message-ID: <20250512170928.149211-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 021e199c328c737d00e
X-MBO-RS-META: bmkh3e69i3isz1641qkwwhat1wmonpm4
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ram: stm32mp1: Add STM32MP13xx support
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

Add support for configuring DRAM controller on STM32MP13xx SoC.
The DRAM controller is basically identical to the DWC controller
on STM32MP15xx SoC, except the bus width is reduced from 32bit to
16bit and a few registers and bits are therefore not present.

Handle the difference by factoring these parts out. Use IS_ENABLE()
as much as possible to assure code which is not enabled on builds
for a single SoC gets compiled out. Handle the different offset of
RCC_DDRITFCR register and missing DDRC2 clock the same way.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/ram/stm32mp1/stm32mp1_ddr.c | 95 +++++++++++++++++++++++------
 drivers/ram/stm32mp1/stm32mp1_ddr.h |  6 ++
 drivers/ram/stm32mp1/stm32mp1_ram.c |  5 ++
 3 files changed, 87 insertions(+), 19 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.c b/drivers/ram/stm32mp1/stm32mp1_ddr.c
index 0e37ea93fbc..b275407d4ac 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ddr.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ddr.c
@@ -12,6 +12,7 @@
 #include <timer.h>
 #include <asm/io.h>
 #include <asm/arch/ddr.h>
+#include <dm/device.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
@@ -19,7 +20,8 @@
 #include "stm32mp1_ddr.h"
 #include "stm32mp1_ddr_regs.h"
 
-#define RCC_DDRITFCR		0xD8
+#define RCC_DDRITFCR_STM32MP13xx	0x5c0
+#define RCC_DDRITFCR_STM32MP15xx	0xd8
 
 #define RCC_DDRITFCR_DDRCAPBRST		(BIT(14))
 #define RCC_DDRITFCR_DDRCAXIRST		(BIT(15))
@@ -66,9 +68,19 @@ struct reg_desc {
 #define DDRCTL_REG_REG_SIZE	25	/* st,ctl-reg */
 #define DDRCTL_REG_TIMING_SIZE	12	/* st,ctl-timing */
 #define DDRCTL_REG_MAP_SIZE	9	/* st,ctl-map */
-#define DDRCTL_REG_PERF_SIZE	17	/* st,ctl-perf */
 
-#define DDRPHY_REG_REG_SIZE	11	/* st,phy-reg */
+#define DDRCTL_REG_PERF_SIZE_STM32MP13xx	11	/* st,ctl-perf */
+#define DDRCTL_REG_PERF_SIZE_STM32MP15xx	17	/* st,ctl-perf */
+#define DDRCTL_REG_PERF_SIZE		\
+	(IS_ENABLED(CONFIG_STM32MP15X) ? DDRCTL_REG_PERF_SIZE_STM32MP15xx : \
+					 DDRCTL_REG_PERF_SIZE_STM32MP13xx)
+
+#define DDRPHY_REG_REG_SIZE_STM32MP13xx		9	/* st,phy-reg */
+#define DDRPHY_REG_REG_SIZE_STM32MP15xx		11	/* st,phy-reg */
+#define DDRPHY_REG_REG_SIZE	\
+	(IS_ENABLED(CONFIG_STM32MP15X) ? DDRPHY_REG_REG_SIZE_STM32MP15xx : \
+					 DDRPHY_REG_REG_SIZE_STM32MP13xx)
+
 #define	DDRPHY_REG_TIMING_SIZE	10	/* st,phy-timing */
 
 #define DDRCTL_REG_REG(x)	DDRCTL_REG(x, stm32mp1_ddrctrl_reg)
@@ -142,12 +154,14 @@ static const struct reg_desc ddr_perf[DDRCTL_REG_PERF_SIZE] = {
 	DDRCTL_REG_PERF(pcfgqos1_0),
 	DDRCTL_REG_PERF(pcfgwqos0_0),
 	DDRCTL_REG_PERF(pcfgwqos1_0),
+#if IS_ENABLED(CONFIG_STM32MP15X)
 	DDRCTL_REG_PERF(pcfgr_1),
 	DDRCTL_REG_PERF(pcfgw_1),
 	DDRCTL_REG_PERF(pcfgqos0_1),
 	DDRCTL_REG_PERF(pcfgqos1_1),
 	DDRCTL_REG_PERF(pcfgwqos0_1),
 	DDRCTL_REG_PERF(pcfgwqos1_1),
+#endif
 };
 
 #define DDRPHY_REG_REG(x)	DDRPHY_REG(x, stm32mp1_ddrphy_reg)
@@ -161,8 +175,10 @@ static const struct reg_desc ddrphy_reg[DDRPHY_REG_REG_SIZE] = {
 	DDRPHY_REG_REG(zq0cr1),
 	DDRPHY_REG_REG(dx0gcr),
 	DDRPHY_REG_REG(dx1gcr),
+#if IS_ENABLED(CONFIG_STM32MP15X)
 	DDRPHY_REG_REG(dx2gcr),
 	DDRPHY_REG_REG(dx3gcr),
+#endif
 };
 
 #define DDRPHY_REG_TIMING(x)	DDRPHY_REG(x, stm32mp1_ddrphy_timing)
@@ -211,6 +227,7 @@ static const struct reg_desc ddrphy_dyn[] = {
 	DDRPHY_REG_DYN(dx1dllcr),
 	DDRPHY_REG_DYN(dx1dqtr),
 	DDRPHY_REG_DYN(dx1dqstr),
+#if IS_ENABLED(CONFIG_STM32MP15X)
 	DDRPHY_REG_DYN(dx2gsr0),
 	DDRPHY_REG_DYN(dx2gsr1),
 	DDRPHY_REG_DYN(dx2dllcr),
@@ -221,6 +238,7 @@ static const struct reg_desc ddrphy_dyn[] = {
 	DDRPHY_REG_DYN(dx3dllcr),
 	DDRPHY_REG_DYN(dx3dqtr),
 	DDRPHY_REG_DYN(dx3dqstr),
+#endif
 };
 
 #define DDRPHY_REG_DYN_SIZE	ARRAY_SIZE(ddrphy_dyn)
@@ -287,6 +305,24 @@ const char *base_name[] = {
 	[DDRPHY_BASE] = "phy",
 };
 
+bool is_stm32mp13_ddrc(const struct ddr_info *priv)
+{
+	if (IS_ENABLED(CONFIG_STM32MP13X) && !IS_ENABLED(CONFIG_STM32MP15X))
+		return true;		/* STM32MP13xx only build */
+	else if (!IS_ENABLED(CONFIG_STM32MP13X) && IS_ENABLED(CONFIG_STM32MP15X))
+		return false;	/* STM32MP15xx only build */
+
+	/* Combined STM32MP13xx and STM32MP15xx build */
+	return device_is_compatible(priv->dev, "st,stm32mp13-ddr");
+}
+
+static u32 get_rcc_ddritfcr(const struct ddr_info *priv)
+{
+	return priv->rcc + (is_stm32mp13_ddrc(priv) ?
+			    RCC_DDRITFCR_STM32MP13xx :
+			    RCC_DDRITFCR_STM32MP15xx);
+}
+
 static u32 get_base_addr(const struct ddr_info *priv, enum base_type base)
 {
 	if (base == DDRPHY_BASE)
@@ -295,6 +331,21 @@ static u32 get_base_addr(const struct ddr_info *priv, enum base_type base)
 		return (u32)priv->ctl;
 }
 
+static u32 get_type_size(const struct ddr_info *priv, enum reg_type type)
+{
+	bool is_mp13 = is_stm32mp13_ddrc(priv);
+
+	if (type == REG_PERF)
+		return is_mp13 ? DDRCTL_REG_PERF_SIZE_STM32MP13xx :
+				 DDRCTL_REG_PERF_SIZE_STM32MP15xx;
+	else if (type == REGPHY_REG)
+		return is_mp13 ? DDRPHY_REG_REG_SIZE_STM32MP13xx :
+				 DDRPHY_REG_REG_SIZE_STM32MP15xx;
+
+	/* Everything else is the default size */
+	return ddr_registers[type].size;
+}
+
 static void set_reg(const struct ddr_info *priv,
 		    enum reg_type type,
 		    const void *param)
@@ -304,9 +355,10 @@ static void set_reg(const struct ddr_info *priv,
 	enum base_type base = ddr_registers[type].base;
 	u32 base_addr = get_base_addr(priv, base);
 	const struct reg_desc *desc = ddr_registers[type].desc;
+	u32 size = get_type_size(priv, type);
 
 	log_debug("init %s\n", ddr_registers[type].name);
-	for (i = 0; i < ddr_registers[type].size; i++) {
+	for (i = 0; i < size; i++) {
 		ptr = (unsigned int *)(base_addr + desc[i].offset);
 		if (desc[i].par_offset == INVALID_OFFSET) {
 			log_err("invalid parameter offset for %s", desc[i].name);
@@ -656,12 +708,13 @@ static void stm32mp1_refresh_restore(struct stm32mp1_ddrctl *ctl,
 static void stm32mp1_asr_enable(struct ddr_info *priv, const u32 pwrctl)
 {
 	struct stm32mp1_ddrctl *ctl = priv->ctl;
+	u32 rcc_ddritfcr = get_rcc_ddritfcr(priv);
 
 	/* SSR is the best we can do. */
 	if (!(pwrctl & DDRCTRL_PWRCTL_EN_DFI_DRAM_CLK_DISABLE))
 		return;
 
-	clrsetbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DDRCKMOD_MASK,
+	clrsetbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DDRCKMOD_MASK,
 			RCC_DDRITFCR_DDRCKMOD_ASR);
 
 	start_sw_done(ctl);
@@ -691,6 +744,7 @@ __maybe_unused
 void stm32mp1_ddr_init(struct ddr_info *priv,
 		       const struct stm32mp1_ddr_config *config)
 {
+	u32 rcc_ddritfcr = get_rcc_ddritfcr(priv);
 	u32 pir;
 	int ret = -EINVAL;
 	char bus_width;
@@ -732,12 +786,12 @@ start:
  * 1.1 RESETS: presetn, core_ddrc_rstn, aresetn
  */
 	/* Assert All DDR part */
-	setbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DDRCAPBRST);
-	setbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DDRCAXIRST);
-	setbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DDRCORERST);
-	setbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DPHYAPBRST);
-	setbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DPHYRST);
-	setbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DPHYCTLRST);
+	setbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DDRCAPBRST);
+	setbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DDRCAXIRST);
+	setbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DDRCORERST);
+	setbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DPHYAPBRST);
+	setbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DPHYRST);
+	setbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DPHYCTLRST);
 
 /* 1.2. start CLOCK */
 	if (stm32mp1_ddr_clk_enable(priv, config->info.speed))
@@ -746,12 +800,12 @@ start:
 
 /* 1.3. deassert reset */
 	/* de-assert PHY rstn and ctl_rstn via DPHYRST and DPHYCTLRST */
-	clrbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DPHYRST);
-	clrbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DPHYCTLRST);
+	clrbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DPHYRST);
+	clrbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DPHYCTLRST);
 	/* De-assert presetn once the clocks are active
 	 * and stable via DDRCAPBRST bit
 	 */
-	clrbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DDRCAPBRST);
+	clrbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DDRCAPBRST);
 
 /* 1.4. wait 128 cycles to permit initialization of end logic */
 	udelay(2);
@@ -781,9 +835,9 @@ start:
 		goto start;
 
 /*  2. deassert reset signal core_ddrc_rstn, aresetn and presetn */
-	clrbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DDRCORERST);
-	clrbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DDRCAXIRST);
-	clrbits_le32(priv->rcc + RCC_DDRITFCR, RCC_DDRITFCR_DPHYAPBRST);
+	clrbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DDRCORERST);
+	clrbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DDRCAXIRST);
+	clrbits_le32(rcc_ddritfcr, RCC_DDRITFCR_DPHYAPBRST);
 
 /*  3. start PHY init by accessing relevant PUBL registers
  *    (DXGCR, DCR, PTR*, MR*, DTPR*)
@@ -854,9 +908,12 @@ start:
 /* Enable auto-self-refresh, which saves a bit of power at runtime. */
 	stm32mp1_asr_enable(priv, config->c_reg.pwrctl);
 
-	/* enable uMCTL2 AXI port 0 and 1 */
+	/* enable uMCTL2 AXI port 0 */
 	setbits_le32(&priv->ctl->pctrl_0, DDRCTRL_PCTRL_N_PORT_EN);
-	setbits_le32(&priv->ctl->pctrl_1, DDRCTRL_PCTRL_N_PORT_EN);
+
+	/* enable uMCTL2 AXI port 1 only on STM32MP15xx with 32bit DRAM bus */
+	if (!is_stm32mp13_ddrc(priv))
+		setbits_le32(&priv->ctl->pctrl_1, DDRCTRL_PCTRL_N_PORT_EN);
 
 	if (INTERACTIVE(STEP_DDR_READY))
 		goto start;
diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.h b/drivers/ram/stm32mp1/stm32mp1_ddr.h
index 861efff92be..3621e6c9a1b 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ddr.h
+++ b/drivers/ram/stm32mp1/stm32mp1_ddr.h
@@ -105,12 +105,14 @@ struct stm32mp1_ddrctrl_perf {
 	u32 pcfgqos1_0;
 	u32 pcfgwqos0_0;
 	u32 pcfgwqos1_0;
+#if IS_ENABLED(CONFIG_STM32MP15X)
 	u32 pcfgr_1;
 	u32 pcfgw_1;
 	u32 pcfgqos0_1;
 	u32 pcfgqos1_1;
 	u32 pcfgwqos0_1;
 	u32 pcfgwqos1_1;
+#endif
 };
 
 struct stm32mp1_ddrphy_reg {
@@ -123,8 +125,10 @@ struct stm32mp1_ddrphy_reg {
 	u32 zq0cr1;
 	u32 dx0gcr;
 	u32 dx1gcr;
+#if IS_ENABLED(CONFIG_STM32MP15X)
 	u32 dx2gcr;
 	u32 dx3gcr;
+#endif
 };
 
 struct stm32mp1_ddrphy_timing {
@@ -181,4 +185,6 @@ bool stm32mp1_ddr_interactive(
 	enum stm32mp1_ddr_interact_step step,
 	const struct stm32mp1_ddr_config *config);
 
+bool is_stm32mp13_ddrc(const struct ddr_info *priv);
+
 #endif
diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
index e9cd6229ec4..5f9b91d50e4 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ram.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
@@ -33,6 +33,7 @@ static const char *const clkname[] = {
 
 int stm32mp1_ddr_clk_enable(struct ddr_info *priv, uint32_t mem_speed)
 {
+	bool is_mp13 = is_stm32mp13_ddrc(priv);
 	unsigned long ddrphy_clk;
 	unsigned long ddr_clk;
 	struct clk clk;
@@ -40,6 +41,10 @@ int stm32mp1_ddr_clk_enable(struct ddr_info *priv, uint32_t mem_speed)
 	unsigned int idx;
 
 	for (idx = 0; idx < ARRAY_SIZE(clkname); idx++) {
+		/* DDRC2 clock are available only on STM32MP15xx */
+		if (is_mp13 && !strcmp(clkname[idx], "ddrc2"))
+			continue;
+
 		ret = clk_get_by_name(priv->dev, clkname[idx], &clk);
 
 		if (!ret)
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
