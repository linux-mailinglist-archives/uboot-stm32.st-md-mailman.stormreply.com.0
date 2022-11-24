Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AD637691
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Nov 2022 11:36:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB8D4C65E46;
	Thu, 24 Nov 2022 10:36:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1715CC65E43
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Nov 2022 10:36:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO81EYM017593; Thu, 24 Nov 2022 11:36:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=QgALMi00pxHLFCbipR8TJVKcNP55482KXEcVKMbrWh0=;
 b=I5Ubc1Nr1grkqJNGGhYjcVM7WV5YDBumq80fBExb6oFD63m6TxFsrJE0ICaTnosWu4hI
 OT2G+u49giFjW+/Qr8mRJaDlH/D87TM+paA/9jgkt1DLzz9Idtl5nAZ/CeJS14sswBVw
 kusSFpu/lNwwDlTJw0xvrKUYD7YczqZlNix9pnljjPObuGZxGYeTzxTVU07BxAV0sSlQ
 30dZpWRa/H+6SEQwbrhwTrocOJI+gQwxcu+kf1hU8VaZXiawhUsm4ci3+66XhlYHkoqz
 lUkQl5EszsYmQUCuixJi5CfRuwF/Km/Zvv2iI+K9eaq2KNUu5fSNTlUtDnpPulR5QLCr XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kxraby5s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 11:36:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D063100039;
 Thu, 24 Nov 2022 11:36:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 356312194E2;
 Thu, 24 Nov 2022 11:36:09 +0100 (CET)
Received: from localhost (10.252.12.221) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 24 Nov
 2022 11:36:08 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 24 Nov 2022 11:36:04 +0100
Message-ID: <20221124103605.298002-3-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124103605.298002-1-gabriel.fernandez@foss.st.com>
References: <20221124103605.298002-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.12.221]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_07,2022-11-24_01,2022-06-22_01
Cc: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH v4 2/3] clk: stm32mp13: introduce STM32MP13
	RCC driver
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
Content-Type: multipart/mixed; boundary="===============5650840347409401757=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============5650840347409401757==
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit

STM32MP13 RCC driver uses Common Clock Framework and also a
'clk-stm32-core' API. Then STM32MPx RCC driver will contain only data
configuration (gates, mux, dividers and the way to check security)
or some specific clocks.
This API will be used by all new other generations of ST Socs.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Sean Anderson <seanga2@gmail.com>
Tested-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

---

(no changes since v3)

Changes in v3:
- fix cosmetic
- add comments in commit message
- explanation of stm32 clock gating

Changes in v2:
- deference check_security() call back
- use of ccf_clk_(enable/disable/get_rate/set_rate) ops
- fix gate refcounting
- documented structures in clock-core API
- remove useless spinlocks
- cosmetic changes
- remove useless defines

 drivers/clk/stm32/Kconfig          |  15 +
 drivers/clk/stm32/Makefile         |   2 +
 drivers/clk/stm32/clk-stm32-core.c | 268 +++++++++
 drivers/clk/stm32/clk-stm32-core.h | 276 ++++++++++
 drivers/clk/stm32/clk-stm32mp13.c  | 841 +++++++++++++++++++++++++++++
 drivers/clk/stm32/stm32mp13_rcc.h  | 288 ++++++++++
 6 files changed, 1690 insertions(+)
 create mode 100644 drivers/clk/stm32/clk-stm32-core.c
 create mode 100644 drivers/clk/stm32/clk-stm32-core.h
 create mode 100644 drivers/clk/stm32/clk-stm32mp13.c
 create mode 100644 drivers/clk/stm32/stm32mp13_rcc.h

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index eac3fc1e9d..7a34ea23c3 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -14,6 +14,12 @@ config CLK_STM32H7
 	  This clock driver adds support for RCC clock management
 	  for STM32H7 SoCs.
 
+config CLK_STM32_CORE
+	bool "Enable RCC clock core driver for STM32MP"
+	depends on ARCH_STM32MP && CLK
+	select CLK_CCF
+	select CLK_COMPOSITE_CCF
+
 config CLK_STM32MP1
 	bool "Enable RCC clock driver for STM32MP15"
 	depends on ARCH_STM32MP && CLK
@@ -21,3 +27,12 @@ config CLK_STM32MP1
 	help
 	  Enable the STM32 clock (RCC) driver. Enable support for
 	  manipulating STM32MP15's on-SoC clocks.
+
+config CLK_STM32MP13
+	bool "Enable RCC clock driver for STM32MP13"
+	depends on ARCH_STM32MP && CLK
+	default y if STM32MP13x
+	select CLK_STM32_CORE
+	help
+	  Enable the STM32 clock (RCC) driver. Enable support for
+	  manipulating STM32MP13's on-SoC clocks.
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index f66f295403..20afbc3cfc 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -2,6 +2,8 @@
 #
 # Copyright (C) 2022, STMicroelectronics - All Rights Reserved
 
+obj-$(CONFIG_CLK_STM32_CORE) += clk-stm32-core.o
 obj-$(CONFIG_CLK_STM32F) += clk-stm32f.o
 obj-$(CONFIG_CLK_STM32H7) += clk-stm32h7.o
 obj-$(CONFIG_CLK_STM32MP1) += clk-stm32mp1.o
+obj-$(CONFIG_CLK_STM32MP13) += clk-stm32mp13.o
diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
new file mode 100644
index 0000000000..37e996e78f
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#define LOG_CATEGORY UCLASS_CLK
+
+#include <common.h>
+#include <clk-uclass.h>
+#include <dm.h>
+#include <log.h>
+#include <asm/io.h>
+#include <dm/device_compat.h>
+#include <linux/clk-provider.h>
+#include "clk-stm32-core.h"
+
+int stm32_rcc_init(struct udevice *dev,
+		   const struct stm32_clock_match_data *data)
+{
+	int i;
+	u8 *cpt;
+	struct stm32mp_rcc_priv *priv = dev_get_priv(dev);
+	fdt_addr_t base = dev_read_addr(dev->parent);
+	const struct clk_stm32_clock_data *clock_data = data->clock_data;
+
+	if (base == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	priv->base = (void __iomem *)base;
+
+	/* allocate the counter of user for internal RCC gates, common for several user */
+	cpt = kzalloc(clock_data->num_gates, GFP_KERNEL);
+	if (!cpt)
+		return -ENOMEM;
+
+	priv->gate_cpt = cpt;
+
+	priv->data = clock_data;
+
+	for (i = 0; i < data->num_clocks; i++) {
+		const struct clock_config *cfg = &data->tab_clocks[i];
+		struct clk *clk = ERR_PTR(-ENOENT);
+
+		if (data->check_security && data->check_security(priv->base, cfg))
+			continue;
+
+		if (cfg->setup) {
+			clk = cfg->setup(dev, cfg);
+			clk->id = cfg->id;
+		} else {
+			dev_err(dev, "failed to register clock %s\n", cfg->name);
+			return -ENOENT;
+		}
+	}
+
+	return 0;
+}
+
+ulong clk_stm32_get_rate_by_name(const char *name)
+{
+	struct udevice *dev;
+
+	if (!uclass_get_device_by_name(UCLASS_CLK, name, &dev)) {
+		struct clk *clk = dev_get_clk_ptr(dev);
+
+		return clk_get_rate(clk);
+	}
+
+	return 0;
+}
+
+const struct clk_ops stm32_clk_ops = {
+	.enable = ccf_clk_enable,
+	.disable = ccf_clk_disable,
+	.get_rate = ccf_clk_get_rate,
+	.set_rate = ccf_clk_set_rate,
+};
+
+#define RCC_MP_ENCLRR_OFFSET	4
+
+static void clk_stm32_gate_set_state(void __iomem *base,
+				     const struct clk_stm32_clock_data *data,
+				     u8 *cpt, u16 gate_id, int enable)
+{
+	const struct stm32_gate_cfg *gate_cfg = &data->gates[gate_id];
+	void __iomem *addr = base + gate_cfg->reg_off;
+	u8 set_clr = gate_cfg->set_clr ? RCC_MP_ENCLRR_OFFSET : 0;
+
+	if (enable) {
+		if (cpt[gate_id]++ > 0)
+			return;
+
+		if (set_clr)
+			writel(BIT(gate_cfg->bit_idx), addr);
+		else
+			writel(readl(addr) | BIT(gate_cfg->bit_idx), addr);
+	} else {
+		if (--cpt[gate_id] > 0)
+			return;
+
+		if (set_clr)
+			writel(BIT(gate_cfg->bit_idx), addr + set_clr);
+		else
+			writel(readl(addr) & ~BIT(gate_cfg->bit_idx), addr);
+	}
+}
+
+static int clk_stm32_gate_enable(struct clk *clk)
+{
+	struct clk_stm32_gate *stm32_gate = to_clk_stm32_gate(clk);
+	struct stm32mp_rcc_priv *priv = stm32_gate->priv;
+
+	clk_stm32_gate_set_state(priv->base, priv->data, priv->gate_cpt,
+				 stm32_gate->gate_id, 1);
+
+	return 0;
+}
+
+static int clk_stm32_gate_disable(struct clk *clk)
+{
+	struct clk_stm32_gate *stm32_gate = to_clk_stm32_gate(clk);
+	struct stm32mp_rcc_priv *priv = stm32_gate->priv;
+
+	clk_stm32_gate_set_state(priv->base, priv->data, priv->gate_cpt,
+				 stm32_gate->gate_id, 0);
+
+	return 0;
+}
+
+static const struct clk_ops clk_stm32_gate_ops = {
+	.enable = clk_stm32_gate_enable,
+	.disable = clk_stm32_gate_disable,
+	.get_rate = clk_generic_get_rate,
+};
+
+#define UBOOT_DM_CLK_STM32_GATE "clk_stm32_gate"
+
+U_BOOT_DRIVER(clk_stm32_gate) = {
+	.name	= UBOOT_DM_CLK_STM32_GATE,
+	.id	= UCLASS_CLK,
+	.ops	= &clk_stm32_gate_ops,
+};
+
+struct clk *clk_stm32_gate_register(struct udevice *dev,
+				    const struct clock_config *cfg)
+{
+	struct stm32mp_rcc_priv *priv = dev_get_priv(dev);
+	struct stm32_clk_gate_cfg *clk_cfg = cfg->clock_cfg;
+	struct clk_stm32_gate *stm32_gate;
+	struct clk *clk;
+	int ret;
+
+	stm32_gate = kzalloc(sizeof(*stm32_gate), GFP_KERNEL);
+	if (!stm32_gate)
+		return ERR_PTR(-ENOMEM);
+
+	stm32_gate->priv = priv;
+	stm32_gate->gate_id = clk_cfg->gate_id;
+
+	clk = &stm32_gate->clk;
+	clk->flags = cfg->flags;
+
+	ret = clk_register(clk, UBOOT_DM_CLK_STM32_GATE,
+			   cfg->name, cfg->parent_name);
+	if (ret) {
+		kfree(stm32_gate);
+		return ERR_PTR(ret);
+	}
+
+	return clk;
+}
+
+struct clk *
+clk_stm32_register_composite(struct udevice *dev,
+			     const struct clock_config *cfg)
+{
+	struct stm32_clk_composite_cfg *composite = cfg->clock_cfg;
+	const char *const *parent_names;
+	int num_parents;
+	struct clk *clk = ERR_PTR(-ENOMEM);
+	struct clk_mux *mux = NULL;
+	struct clk_stm32_gate *gate = NULL;
+	struct clk_divider *div = NULL;
+	struct clk *mux_clk = NULL;
+	const struct clk_ops *mux_ops = NULL;
+	struct clk *gate_clk = NULL;
+	const struct clk_ops *gate_ops = NULL;
+	struct clk *div_clk = NULL;
+	const struct clk_ops *div_ops = NULL;
+	struct stm32mp_rcc_priv *priv = dev_get_priv(dev);
+	const struct clk_stm32_clock_data *data = priv->data;
+
+	if  (composite->mux_id != NO_STM32_MUX) {
+		const struct stm32_mux_cfg *mux_cfg;
+
+		mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+		if (!mux)
+			goto fail;
+
+		mux_cfg = &data->muxes[composite->mux_id];
+
+		mux->reg = priv->base + mux_cfg->reg_off;
+		mux->shift = mux_cfg->shift;
+		mux->mask = BIT(mux_cfg->width) - 1;
+		mux->num_parents = mux_cfg->num_parents;
+		mux->flags = 0;
+		mux->parent_names = mux_cfg->parent_names;
+
+		mux_clk = &mux->clk;
+		mux_ops = &clk_mux_ops;
+
+		parent_names = mux_cfg->parent_names;
+		num_parents = mux_cfg->num_parents;
+	} else {
+		parent_names = &cfg->parent_name;
+		num_parents = 1;
+	}
+
+	if  (composite->div_id != NO_STM32_DIV) {
+		const struct stm32_div_cfg *div_cfg;
+
+		div = kzalloc(sizeof(*div), GFP_KERNEL);
+		if (!div)
+			goto fail;
+
+		div_cfg = &data->dividers[composite->div_id];
+
+		div->reg = priv->base + div_cfg->reg_off;
+		div->shift = div_cfg->shift;
+		div->width = div_cfg->width;
+		div->width = div_cfg->width;
+		div->flags = div_cfg->div_flags;
+		div->table = div_cfg->table;
+
+		div_clk = &div->clk;
+		div_ops = &clk_divider_ops;
+	}
+
+	if  (composite->gate_id != NO_STM32_GATE) {
+		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+		if (!gate)
+			goto fail;
+
+		gate->priv = priv;
+		gate->gate_id = composite->gate_id;
+
+		gate_clk = &gate->clk;
+		gate_ops = &clk_stm32_gate_ops;
+	}
+
+	clk = clk_register_composite(NULL, cfg->name,
+				     parent_names, num_parents,
+				     mux_clk, mux_ops,
+				     div_clk, div_ops,
+				     gate_clk, gate_ops,
+				     cfg->flags);
+	if (IS_ERR(clk))
+		goto fail;
+
+	return clk;
+
+fail:
+	kfree(gate);
+	kfree(div);
+	kfree(mux);
+	return ERR_CAST(clk);
+}
diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
new file mode 100644
index 0000000000..53c2b467ab
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32-core.h
@@ -0,0 +1,276 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+struct stm32_clock_match_data;
+
+/**
+ * struct stm32_mux_cfg - multiplexer configuration
+ *
+ * @parent_names:	array of string names for all possible parents
+ * @num_parents:	number of possible parents
+ * @reg_off:		register controlling multiplexer
+ * @shift:		shift to multiplexer bit field
+ * @width:		width of the multiplexer bit field
+ * @mux_flags:		hardware-specific flags
+ * @table:		array of register values corresponding to the parent
+ *			index
+ */
+struct stm32_mux_cfg {
+	const char * const *parent_names;
+	u8 num_parents;
+	u32 reg_off;
+	u8 shift;
+	u8 width;
+	u8 mux_flags;
+	u32 *table;
+};
+
+/**
+ * struct stm32_gate_cfg - gating configuration
+ *
+ * @reg_off:	register controlling gate
+ * @bit_idx:	single bit controlling gate
+ * @gate_flags:	hardware-specific flags
+ * @set_clr:	0 : normal gate, 1 : has a register to clear the gate
+ */
+struct stm32_gate_cfg {
+	u32 reg_off;
+	u8 bit_idx;
+	u8 gate_flags;
+	u8 set_clr;
+};
+
+/**
+ * struct stm32_div_cfg - divider configuration
+ *
+ * @reg_off:	register containing the divider
+ * @shift:	shift to the divider bit field
+ * @width:	width of the divider bit field
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ */
+struct stm32_div_cfg {
+	u32 reg_off;
+	u8 shift;
+	u8 width;
+	u8 div_flags;
+	const struct clk_div_table *table;
+};
+
+#define NO_STM32_MUX	-1
+#define NO_STM32_DIV	-1
+#define NO_STM32_GATE	-1
+
+/**
+ * struct stm32_composite_cfg - composite configuration
+ *
+ * @mux:	index of a multiplexer
+ * @gate:	index of a gate
+ * @div:	index of a divider
+ */
+struct stm32_composite_cfg {
+	int mux;
+	int gate;
+	int div;
+};
+
+/**
+ * struct clock_config - clock configuration
+ *
+ * @id:			binding id of the clock
+ * @name:		clock name
+ * @parent_name:	name of the clock parent
+ * @flags:		framework-specific flags
+ * @sec_id:		secure id (use to known if the clock is secured or not)
+ * @clock_cfg:		specific clock data configuration
+ * @setup:		specific call back to reister the clock (will use
+ *			clock_cfg data as input)
+ */
+struct clock_config {
+	unsigned long id;
+	const char *name;
+	const char *parent_name;
+	unsigned long flags;
+	int sec_id;
+	void *clock_cfg;
+
+	struct clk *(*setup)(struct udevice *dev,
+			     const struct clock_config *cfg);
+};
+
+/**
+ * struct clk_stm32_clock_data - clock data
+ *
+ * @num_gates:		number of defined gates
+ * @gates:		array of gate configuration
+ * @muxes:		array of multiplexer configuration
+ * @dividers:		array of divider configuration
+ */
+struct clk_stm32_clock_data {
+	unsigned int num_gates;
+	const struct stm32_gate_cfg *gates;
+	const struct stm32_mux_cfg *muxes;
+	const struct stm32_div_cfg *dividers;
+};
+
+/**
+ * struct stm32_clock_match_data - clock match data
+ *
+ * @num_gates:		number of clocks
+ * @tab_clocks:		array of clock configuration
+ * @clock_data:		definition of all gates / dividers / multiplexers
+ * @check_security:	call back to check if clock is secured or not
+ */
+struct stm32_clock_match_data {
+	unsigned int num_clocks;
+	const struct clock_config *tab_clocks;
+	const struct clk_stm32_clock_data *clock_data;
+	int (*check_security)(void __iomem *base,
+			      const struct clock_config *cfg);
+};
+
+/**
+ * struct stm32mp_rcc_priv - private struct for stm32mp clocks
+ *
+ * @base:	base register of RCC driver
+ * @gate_cpt:	array of refcounting for gate with more than one
+ *		clocks as input. See explanation of Peripheral clock enabling
+ *              below.
+ * @data:	data for gate / divider / multiplexer configuration
+ */
+struct stm32mp_rcc_priv {
+	void __iomem *base;
+	u8 *gate_cpt;
+	const struct clk_stm32_clock_data *data;
+};
+
+int stm32_rcc_init(struct udevice *dev,
+		   const struct stm32_clock_match_data *data);
+
+/**
+ * STM32 Gate
+ *
+ *               PCE (Peripheral Clock Enabling)                  Peripheral
+ *
+ *                ------------------------------                   ----------
+ *               |                              |                 |          |
+ *               |                              |                 |   PERx   |
+ * bus_ck        |                   -----      |                 |          |
+ * ------------->|------------------|     |     |  ckg_bus_perx   |          |
+ *               |                  | AND |-----|---------------->|          |
+ *               |       -----------|     |     |                 |          |
+ *               |      |            -----      |                 |          |
+ *               |      |                       |                 |          |
+ *               |    -----                     |                 |          |
+ * Perx_EN |-----|---| GCL |  Gating            |                 |          |
+ *               |    -----   Control           |                 |          |
+ *               |      |     Logic             |                 |          |
+ *               |      |                       |                 |          |
+ *               |      |            -----      |                 |          |
+ *               |       -----------|     |     |  ckg_ker_perx   |          |
+ * perx_ker_ck   |                  | AND |-----|---------------->|          |
+ * ------------->|------------------|     |     |                 |          |
+ *               |                   -----      |                 |          |
+ *               |                              |                 |          |
+ *               |                              |                 |          |
+ *                ------------------------------                   ----------
+
+ * Each peripheral requires a bus interface clock, named ckg_bus_perx
+ * (for peripheral ‘x’).
+ * Some peripherals (SAI, UART...) need also a dedicated clock for their
+ * communication interface, this clock is generally asynchronous with respect to
+ * the bus interface clock, and is named kernel clock (ckg_ker_perx).
+
+ * Both clocks can be gated by one Perx_EN enable bit.
+ * Then we have to manage a refcounting on gate level to avoid gate if one
+ * the bus or the Kernel was enable.
+ *
+ * Example:
+ * 1) enable the bus clock
+ *	--> bus_clk ref_counting = 1, gate_ref_count = 1
+ * 2) enable the kernel clock
+ *	--> perx_ker_ck ref_counting = 1, gate_ref_count = 2
+ * 3) disable kernel clock
+ * 	---> perx_ker_ck ref_counting = 0, gate_ref_count = 1
+ * 	==> then i will not gate because gate_ref_count > 0
+ * 4) disable bus clock
+ *	--> bus_clk  ref_counting  = 0, gate_ref_count = 0
+ *	==> then i can gate (write in the register) because
+ *	    gate_ref_count = 0
+ */
+
+struct clk_stm32_gate {
+	struct clk clk;
+	struct stm32mp_rcc_priv *priv;
+	int gate_id;
+};
+
+#define to_clk_stm32_gate(_clk) container_of(_clk, struct clk_stm32_gate, clk)
+
+struct clk *
+clk_stm32_gate_register(struct udevice *dev,
+			const struct clock_config *cfg);
+
+struct clk *
+clk_stm32_register_composite(struct udevice *dev,
+			     const struct clock_config *cfg);
+
+struct stm32_clk_gate_cfg {
+	int gate_id;
+};
+
+#define STM32_GATE(_id, _name, _parent, _flags, _gate_id, _sec_id) \
+{ \
+	.id		= _id, \
+	.sec_id		= _sec_id, \
+	.name		= _name, \
+	.parent_name	= _parent, \
+	.flags		= _flags, \
+	.clock_cfg	= &(struct stm32_clk_gate_cfg) { \
+		.gate_id	= _gate_id, \
+	}, \
+	.setup		= clk_stm32_gate_register, \
+}
+
+struct stm32_clk_composite_cfg {
+	int	gate_id;
+	int	mux_id;
+	int	div_id;
+};
+
+#define STM32_COMPOSITE(_id, _name, _flags, _sec_id, \
+			_gate_id, _mux_id, _div_id) \
+{ \
+	.id		= _id, \
+	.name		= _name, \
+	.sec_id		= _sec_id, \
+	.flags		= _flags, \
+	.clock_cfg	= &(struct stm32_clk_composite_cfg) { \
+		.gate_id	= _gate_id, \
+		.mux_id		= _mux_id, \
+		.div_id		= _div_id, \
+	}, \
+	.setup		= clk_stm32_register_composite, \
+}
+
+#define STM32_COMPOSITE_NOMUX(_id, _name, _parent, _flags, _sec_id, \
+			      _gate_id, _div_id) \
+{ \
+	.id		= _id, \
+	.name		= _name, \
+	.parent_name	= _parent, \
+	.sec_id		= _sec_id, \
+	.flags		= _flags, \
+	.clock_cfg	= &(struct stm32_clk_composite_cfg) { \
+		.gate_id	= _gate_id, \
+		.mux_id		= NO_STM32_MUX, \
+		.div_id		= _div_id, \
+	}, \
+	.setup		= clk_stm32_register_composite, \
+}
+
+extern const struct clk_ops stm32_clk_ops;
+
+ulong clk_stm32_get_rate_by_name(const char *name);
diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
new file mode 100644
index 0000000000..5174ae53a1
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -0,0 +1,841 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#define LOG_CATEGORY UCLASS_CLK
+
+#include <clk-uclass.h>
+#include <common.h>
+#include <dm.h>
+#include <log.h>
+#include <asm/io.h>
+#include <dt-bindings/clock/stm32mp13-clks.h>
+#include <linux/clk-provider.h>
+
+#include "clk-stm32-core.h"
+#include "stm32mp13_rcc.h"
+
+DECLARE_GLOBAL_DATA_PTR;
+
+static const char * const adc12_src[] = {
+	"pll4_r", "ck_per", "pll3_q"
+};
+
+static const char * const dcmipp_src[] = {
+	"ck_axi", "pll2_q", "pll4_p", "ck_per",
+};
+
+static const char * const eth12_src[] = {
+	"pll4_p", "pll3_q"
+};
+
+static const char * const fdcan_src[] = {
+	"ck_hse", "pll3_q", "pll4_q", "pll4_r"
+};
+
+static const char * const fmc_src[] = {
+	"ck_axi", "pll3_r", "pll4_p", "ck_per"
+};
+
+static const char * const i2c12_src[] = {
+	"pclk1", "pll4_r", "ck_hsi", "ck_csi"
+};
+
+static const char * const i2c345_src[] = {
+	"pclk6", "pll4_r", "ck_hsi", "ck_csi"
+};
+
+static const char * const lptim1_src[] = {
+	"pclk1", "pll4_p", "pll3_q", "ck_lse", "ck_lsi", "ck_per"
+};
+
+static const char * const lptim23_src[] = {
+	"pclk3", "pll4_q", "ck_per", "ck_lse", "ck_lsi"
+};
+
+static const char * const lptim45_src[] = {
+	"pclk3", "pll4_p", "pll3_q", "ck_lse", "ck_lsi", "ck_per"
+};
+
+static const char * const mco1_src[] = {
+	"ck_hsi", "ck_hse", "ck_csi", "ck_lsi", "ck_lse"
+};
+
+static const char * const mco2_src[] = {
+	"ck_mpu", "ck_axi", "ck_mlahb", "pll4_p", "ck_hse", "ck_hsi"
+};
+
+static const char * const qspi_src[] = {
+	"ck_axi", "pll3_r", "pll4_p", "ck_per"
+};
+
+static const char * const rng1_src[] = {
+	"ck_csi", "pll4_r", "reserved", "ck_lsi"
+};
+
+static const char * const saes_src[] = {
+	"ck_axi", "ck_per", "pll4_r", "ck_lsi"
+};
+
+static const char * const sai1_src[] = {
+	"pll4_q", "pll3_q", "i2s_ckin", "ck_per", "pll3_r"
+};
+
+static const char * const sai2_src[] = {
+	"pll4_q", "pll3_q", "i2s_ckin", "ck_per", "spdif_ck_symb", "pll3_r"
+};
+
+static const char * const sdmmc12_src[] = {
+	"ck_axi", "pll3_r", "pll4_p", "ck_hsi"
+};
+
+static const char * const spdif_src[] = {
+	"pll4_p", "pll3_q", "ck_hsi"
+};
+
+static const char * const spi123_src[] = {
+	"pll4_p", "pll3_q", "i2s_ckin", "ck_per", "pll3_r"
+};
+
+static const char * const spi4_src[] = {
+	"pclk6", "pll4_q", "ck_hsi", "ck_csi", "ck_hse", "i2s_ckin"
+};
+
+static const char * const spi5_src[] = {
+	"pclk6", "pll4_q", "ck_hsi", "ck_csi", "ck_hse"
+};
+
+static const char * const stgen_src[] = {
+	"ck_hsi", "ck_hse"
+};
+
+static const char * const usart12_src[] = {
+	"pclk6", "pll3_q", "ck_hsi", "ck_csi", "pll4_q", "ck_hse"
+};
+
+static const char * const usart34578_src[] = {
+	"pclk1", "pll4_q", "ck_hsi", "ck_csi", "ck_hse"
+};
+
+static const char * const usart6_src[] = {
+	"pclk2", "pll4_q", "ck_hsi", "ck_csi", "ck_hse"
+};
+
+static const char * const usbo_src[] = {
+	"pll4_r", "ck_usbo_48m"
+};
+
+static const char * const usbphy_src[] = {
+	"ck_hse", "pll4_r", "clk-hse-div2"
+};
+
+enum enum_mux_cfg {
+	MUX_I2C12,
+	MUX_LPTIM45,
+	MUX_SPI23,
+	MUX_UART35,
+	MUX_UART78,
+	MUX_ADC1,
+	MUX_ADC2,
+	MUX_DCMIPP,
+	MUX_ETH1,
+	MUX_ETH2,
+	MUX_FDCAN,
+	MUX_FMC,
+	MUX_I2C3,
+	MUX_I2C4,
+	MUX_I2C5,
+	MUX_LPTIM1,
+	MUX_LPTIM2,
+	MUX_LPTIM3,
+	MUX_QSPI,
+	MUX_RNG1,
+	MUX_SAES,
+	MUX_SAI1,
+	MUX_SAI2,
+	MUX_SDMMC1,
+	MUX_SDMMC2,
+	MUX_SPDIF,
+	MUX_SPI1,
+	MUX_SPI4,
+	MUX_SPI5,
+	MUX_STGEN,
+	MUX_UART1,
+	MUX_UART2,
+	MUX_UART4,
+	MUX_UART6,
+	MUX_USBO,
+	MUX_USBPHY,
+	MUX_MCO1,
+	MUX_MCO2
+};
+
+#define MUX_CFG(id, src, _offset, _shift, _witdh) \
+	[id] = { \
+		.num_parents	= ARRAY_SIZE(src), \
+		.parent_names	= (src), \
+		.reg_off	= (_offset), \
+		.shift		= (_shift), \
+		.width		= (_witdh), \
+	}
+
+static const struct stm32_mux_cfg stm32mp13_muxes[] = {
+	MUX_CFG(MUX_I2C12,	i2c12_src,	RCC_I2C12CKSELR, 0, 3),
+	MUX_CFG(MUX_LPTIM45,	lptim45_src,	RCC_LPTIM45CKSELR, 0, 3),
+	MUX_CFG(MUX_SPI23,	spi123_src,	RCC_SPI2S23CKSELR, 0, 3),
+	MUX_CFG(MUX_UART35,	usart34578_src,	RCC_UART35CKSELR, 0, 3),
+	MUX_CFG(MUX_UART78,	usart34578_src,	RCC_UART78CKSELR, 0, 3),
+	MUX_CFG(MUX_ADC1,	adc12_src,	RCC_ADC12CKSELR, 0, 2),
+	MUX_CFG(MUX_ADC2,	adc12_src,	RCC_ADC12CKSELR, 2, 2),
+	MUX_CFG(MUX_DCMIPP,	dcmipp_src,	RCC_DCMIPPCKSELR, 0, 2),
+	MUX_CFG(MUX_ETH1,	eth12_src,	RCC_ETH12CKSELR, 0, 2),
+	MUX_CFG(MUX_ETH2,	eth12_src,	RCC_ETH12CKSELR, 8, 2),
+	MUX_CFG(MUX_FDCAN,	fdcan_src,	RCC_FDCANCKSELR, 0, 2),
+	MUX_CFG(MUX_FMC,	fmc_src,	RCC_FMCCKSELR, 0, 2),
+	MUX_CFG(MUX_I2C3,	i2c345_src,	RCC_I2C345CKSELR, 0, 3),
+	MUX_CFG(MUX_I2C4,	i2c345_src,	RCC_I2C345CKSELR, 3, 3),
+	MUX_CFG(MUX_I2C5,	i2c345_src,	RCC_I2C345CKSELR, 6, 3),
+	MUX_CFG(MUX_LPTIM1,	lptim1_src,	RCC_LPTIM1CKSELR, 0, 3),
+	MUX_CFG(MUX_LPTIM2,	lptim23_src,	RCC_LPTIM23CKSELR, 0, 3),
+	MUX_CFG(MUX_LPTIM3,	lptim23_src,	RCC_LPTIM23CKSELR, 3, 3),
+	MUX_CFG(MUX_MCO1,	mco1_src,	RCC_MCO1CFGR, 0, 3),
+	MUX_CFG(MUX_MCO2,	mco2_src,	RCC_MCO2CFGR, 0, 3),
+	MUX_CFG(MUX_QSPI,	qspi_src,	RCC_QSPICKSELR, 0, 2),
+	MUX_CFG(MUX_RNG1,	rng1_src,	RCC_RNG1CKSELR, 0, 2),
+	MUX_CFG(MUX_SAES,	saes_src,	RCC_SAESCKSELR, 0, 2),
+	MUX_CFG(MUX_SAI1,	sai1_src,	RCC_SAI1CKSELR, 0, 3),
+	MUX_CFG(MUX_SAI2,	sai2_src,	RCC_SAI2CKSELR, 0, 3),
+	MUX_CFG(MUX_SDMMC1,	sdmmc12_src,	RCC_SDMMC12CKSELR, 0, 3),
+	MUX_CFG(MUX_SDMMC2,	sdmmc12_src,	RCC_SDMMC12CKSELR, 3, 3),
+	MUX_CFG(MUX_SPDIF,	spdif_src,	RCC_SPDIFCKSELR, 0, 2),
+	MUX_CFG(MUX_SPI1,	spi123_src,	RCC_SPI2S1CKSELR, 0, 3),
+	MUX_CFG(MUX_SPI4,	spi4_src,	RCC_SPI45CKSELR, 0, 3),
+	MUX_CFG(MUX_SPI5,	spi5_src,	RCC_SPI45CKSELR, 3, 3),
+	MUX_CFG(MUX_STGEN,	stgen_src,	RCC_STGENCKSELR, 0, 2),
+	MUX_CFG(MUX_UART1,	usart12_src,	RCC_UART12CKSELR, 0, 3),
+	MUX_CFG(MUX_UART2,	usart12_src,	RCC_UART12CKSELR, 3, 3),
+	MUX_CFG(MUX_UART4,	usart34578_src,	RCC_UART4CKSELR, 0, 3),
+	MUX_CFG(MUX_UART6,	usart6_src,	RCC_UART6CKSELR, 0, 3),
+	MUX_CFG(MUX_USBO,	usbo_src,	RCC_USBCKSELR, 4, 1),
+	MUX_CFG(MUX_USBPHY,	usbphy_src,	RCC_USBCKSELR, 0, 2),
+};
+
+enum enum_gate_cfg {
+	GATE_ZERO, /* reserved for no gate */
+	GATE_MCO1,
+	GATE_MCO2,
+	GATE_DBGCK,
+	GATE_TRACECK,
+	GATE_DDRC1,
+	GATE_DDRC1LP,
+	GATE_DDRPHYC,
+	GATE_DDRPHYCLP,
+	GATE_DDRCAPB,
+	GATE_DDRCAPBLP,
+	GATE_AXIDCG,
+	GATE_DDRPHYCAPB,
+	GATE_DDRPHYCAPBLP,
+	GATE_TIM2,
+	GATE_TIM3,
+	GATE_TIM4,
+	GATE_TIM5,
+	GATE_TIM6,
+	GATE_TIM7,
+	GATE_LPTIM1,
+	GATE_SPI2,
+	GATE_SPI3,
+	GATE_USART3,
+	GATE_UART4,
+	GATE_UART5,
+	GATE_UART7,
+	GATE_UART8,
+	GATE_I2C1,
+	GATE_I2C2,
+	GATE_SPDIF,
+	GATE_TIM1,
+	GATE_TIM8,
+	GATE_SPI1,
+	GATE_USART6,
+	GATE_SAI1,
+	GATE_SAI2,
+	GATE_DFSDM,
+	GATE_ADFSDM,
+	GATE_FDCAN,
+	GATE_LPTIM2,
+	GATE_LPTIM3,
+	GATE_LPTIM4,
+	GATE_LPTIM5,
+	GATE_VREF,
+	GATE_DTS,
+	GATE_PMBCTRL,
+	GATE_HDP,
+	GATE_SYSCFG,
+	GATE_DCMIPP,
+	GATE_DDRPERFM,
+	GATE_IWDG2APB,
+	GATE_USBPHY,
+	GATE_STGENRO,
+	GATE_LTDC,
+	GATE_TZC,
+	GATE_ETZPC,
+	GATE_IWDG1APB,
+	GATE_BSEC,
+	GATE_STGENC,
+	GATE_USART1,
+	GATE_USART2,
+	GATE_SPI4,
+	GATE_SPI5,
+	GATE_I2C3,
+	GATE_I2C4,
+	GATE_I2C5,
+	GATE_TIM12,
+	GATE_TIM13,
+	GATE_TIM14,
+	GATE_TIM15,
+	GATE_TIM16,
+	GATE_TIM17,
+	GATE_DMA1,
+	GATE_DMA2,
+	GATE_DMAMUX1,
+	GATE_DMA3,
+	GATE_DMAMUX2,
+	GATE_ADC1,
+	GATE_ADC2,
+	GATE_USBO,
+	GATE_TSC,
+	GATE_GPIOA,
+	GATE_GPIOB,
+	GATE_GPIOC,
+	GATE_GPIOD,
+	GATE_GPIOE,
+	GATE_GPIOF,
+	GATE_GPIOG,
+	GATE_GPIOH,
+	GATE_GPIOI,
+	GATE_PKA,
+	GATE_SAES,
+	GATE_CRYP1,
+	GATE_HASH1,
+	GATE_RNG1,
+	GATE_BKPSRAM,
+	GATE_AXIMC,
+	GATE_MCE,
+	GATE_ETH1CK,
+	GATE_ETH1TX,
+	GATE_ETH1RX,
+	GATE_ETH1MAC,
+	GATE_FMC,
+	GATE_QSPI,
+	GATE_SDMMC1,
+	GATE_SDMMC2,
+	GATE_CRC1,
+	GATE_USBH,
+	GATE_ETH2CK,
+	GATE_ETH2TX,
+	GATE_ETH2RX,
+	GATE_ETH2MAC,
+	GATE_ETH1STP,
+	GATE_ETH2STP,
+	GATE_MDMA
+};
+
+#define GATE_CFG(id, _offset, _bit_idx, _offset_clr) \
+	[id] = { \
+		.reg_off	= (_offset), \
+		.bit_idx	= (_bit_idx), \
+		.set_clr	= (_offset_clr), \
+	}
+
+static const struct stm32_gate_cfg stm32mp13_gates[] = {
+	GATE_CFG(GATE_MCO1,		RCC_MCO1CFGR,	12,	0),
+	GATE_CFG(GATE_MCO2,		RCC_MCO2CFGR,	12,	0),
+	GATE_CFG(GATE_DBGCK,		RCC_DBGCFGR,	8,	0),
+	GATE_CFG(GATE_TRACECK,		RCC_DBGCFGR,	9,	0),
+	GATE_CFG(GATE_DDRC1,		RCC_DDRITFCR,	0,	0),
+	GATE_CFG(GATE_DDRC1LP,		RCC_DDRITFCR,	1,	0),
+	GATE_CFG(GATE_DDRPHYC,		RCC_DDRITFCR,	4,	0),
+	GATE_CFG(GATE_DDRPHYCLP,	RCC_DDRITFCR,	5,	0),
+	GATE_CFG(GATE_DDRCAPB,		RCC_DDRITFCR,	6,	0),
+	GATE_CFG(GATE_DDRCAPBLP,	RCC_DDRITFCR,	7,	0),
+	GATE_CFG(GATE_AXIDCG,		RCC_DDRITFCR,	8,	0),
+	GATE_CFG(GATE_DDRPHYCAPB,	RCC_DDRITFCR,	9,	0),
+	GATE_CFG(GATE_DDRPHYCAPBLP,	RCC_DDRITFCR,	10,	0),
+	GATE_CFG(GATE_TIM2,		RCC_MP_APB1ENSETR,	0,	1),
+	GATE_CFG(GATE_TIM3,		RCC_MP_APB1ENSETR,	1,	1),
+	GATE_CFG(GATE_TIM4,		RCC_MP_APB1ENSETR,	2,	1),
+	GATE_CFG(GATE_TIM5,		RCC_MP_APB1ENSETR,	3,	1),
+	GATE_CFG(GATE_TIM6,		RCC_MP_APB1ENSETR,	4,	1),
+	GATE_CFG(GATE_TIM7,		RCC_MP_APB1ENSETR,	5,	1),
+	GATE_CFG(GATE_LPTIM1,		RCC_MP_APB1ENSETR,	9,	1),
+	GATE_CFG(GATE_SPI2,		RCC_MP_APB1ENSETR,	11,	1),
+	GATE_CFG(GATE_SPI3,		RCC_MP_APB1ENSETR,	12,	1),
+	GATE_CFG(GATE_USART3,		RCC_MP_APB1ENSETR,	15,	1),
+	GATE_CFG(GATE_UART4,		RCC_MP_APB1ENSETR,	16,	1),
+	GATE_CFG(GATE_UART5,		RCC_MP_APB1ENSETR,	17,	1),
+	GATE_CFG(GATE_UART7,		RCC_MP_APB1ENSETR,	18,	1),
+	GATE_CFG(GATE_UART8,		RCC_MP_APB1ENSETR,	19,	1),
+	GATE_CFG(GATE_I2C1,		RCC_MP_APB1ENSETR,	21,	1),
+	GATE_CFG(GATE_I2C2,		RCC_MP_APB1ENSETR,	22,	1),
+	GATE_CFG(GATE_SPDIF,		RCC_MP_APB1ENSETR,	26,	1),
+	GATE_CFG(GATE_TIM1,		RCC_MP_APB2ENSETR,	0,	1),
+	GATE_CFG(GATE_TIM8,		RCC_MP_APB2ENSETR,	1,	1),
+	GATE_CFG(GATE_SPI1,		RCC_MP_APB2ENSETR,	8,	1),
+	GATE_CFG(GATE_USART6,		RCC_MP_APB2ENSETR,	13,	1),
+	GATE_CFG(GATE_SAI1,		RCC_MP_APB2ENSETR,	16,	1),
+	GATE_CFG(GATE_SAI2,		RCC_MP_APB2ENSETR,	17,	1),
+	GATE_CFG(GATE_DFSDM,		RCC_MP_APB2ENSETR,	20,	1),
+	GATE_CFG(GATE_ADFSDM,		RCC_MP_APB2ENSETR,	21,	1),
+	GATE_CFG(GATE_FDCAN,		RCC_MP_APB2ENSETR,	24,	1),
+	GATE_CFG(GATE_LPTIM2,		RCC_MP_APB3ENSETR,	0,	1),
+	GATE_CFG(GATE_LPTIM3,		RCC_MP_APB3ENSETR,	1,	1),
+	GATE_CFG(GATE_LPTIM4,		RCC_MP_APB3ENSETR,	2,	1),
+	GATE_CFG(GATE_LPTIM5,		RCC_MP_APB3ENSETR,	3,	1),
+	GATE_CFG(GATE_VREF,		RCC_MP_APB3ENSETR,	13,	1),
+	GATE_CFG(GATE_DTS,		RCC_MP_APB3ENSETR,	16,	1),
+	GATE_CFG(GATE_PMBCTRL,		RCC_MP_APB3ENSETR,	17,	1),
+	GATE_CFG(GATE_HDP,		RCC_MP_APB3ENSETR,	20,	1),
+	GATE_CFG(GATE_SYSCFG,		RCC_MP_NS_APB3ENSETR,	0,	1),
+	GATE_CFG(GATE_DCMIPP,		RCC_MP_APB4ENSETR,	1,	1),
+	GATE_CFG(GATE_DDRPERFM,		RCC_MP_APB4ENSETR,	8,	1),
+	GATE_CFG(GATE_IWDG2APB,		RCC_MP_APB4ENSETR,	15,	1),
+	GATE_CFG(GATE_USBPHY,		RCC_MP_APB4ENSETR,	16,	1),
+	GATE_CFG(GATE_STGENRO,		RCC_MP_APB4ENSETR,	20,	1),
+	GATE_CFG(GATE_LTDC,		RCC_MP_NS_APB4ENSETR,	0,	1),
+	GATE_CFG(GATE_TZC,		RCC_MP_APB5ENSETR,	11,	1),
+	GATE_CFG(GATE_ETZPC,		RCC_MP_APB5ENSETR,	13,	1),
+	GATE_CFG(GATE_IWDG1APB,		RCC_MP_APB5ENSETR,	15,	1),
+	GATE_CFG(GATE_BSEC,		RCC_MP_APB5ENSETR,	16,	1),
+	GATE_CFG(GATE_STGENC,		RCC_MP_APB5ENSETR,	20,	1),
+	GATE_CFG(GATE_USART1,		RCC_MP_APB6ENSETR,	0,	1),
+	GATE_CFG(GATE_USART2,		RCC_MP_APB6ENSETR,	1,	1),
+	GATE_CFG(GATE_SPI4,		RCC_MP_APB6ENSETR,	2,	1),
+	GATE_CFG(GATE_SPI5,		RCC_MP_APB6ENSETR,	3,	1),
+	GATE_CFG(GATE_I2C3,		RCC_MP_APB6ENSETR,	4,	1),
+	GATE_CFG(GATE_I2C4,		RCC_MP_APB6ENSETR,	5,	1),
+	GATE_CFG(GATE_I2C5,		RCC_MP_APB6ENSETR,	6,	1),
+	GATE_CFG(GATE_TIM12,		RCC_MP_APB6ENSETR,	7,	1),
+	GATE_CFG(GATE_TIM13,		RCC_MP_APB6ENSETR,	8,	1),
+	GATE_CFG(GATE_TIM14,		RCC_MP_APB6ENSETR,	9,	1),
+	GATE_CFG(GATE_TIM15,		RCC_MP_APB6ENSETR,	10,	1),
+	GATE_CFG(GATE_TIM16,		RCC_MP_APB6ENSETR,	11,	1),
+	GATE_CFG(GATE_TIM17,		RCC_MP_APB6ENSETR,	12,	1),
+	GATE_CFG(GATE_DMA1,		RCC_MP_AHB2ENSETR,	0,	1),
+	GATE_CFG(GATE_DMA2,		RCC_MP_AHB2ENSETR,	1,	1),
+	GATE_CFG(GATE_DMAMUX1,		RCC_MP_AHB2ENSETR,	2,	1),
+	GATE_CFG(GATE_DMA3,		RCC_MP_AHB2ENSETR,	3,	1),
+	GATE_CFG(GATE_DMAMUX2,		RCC_MP_AHB2ENSETR,	4,	1),
+	GATE_CFG(GATE_ADC1,		RCC_MP_AHB2ENSETR,	5,	1),
+	GATE_CFG(GATE_ADC2,		RCC_MP_AHB2ENSETR,	6,	1),
+	GATE_CFG(GATE_USBO,		RCC_MP_AHB2ENSETR,	8,	1),
+	GATE_CFG(GATE_TSC,		RCC_MP_AHB4ENSETR,	15,	1),
+	GATE_CFG(GATE_GPIOA,		RCC_MP_NS_AHB4ENSETR,	0,	1),
+	GATE_CFG(GATE_GPIOB,		RCC_MP_NS_AHB4ENSETR,	1,	1),
+	GATE_CFG(GATE_GPIOC,		RCC_MP_NS_AHB4ENSETR,	2,	1),
+	GATE_CFG(GATE_GPIOD,		RCC_MP_NS_AHB4ENSETR,	3,	1),
+	GATE_CFG(GATE_GPIOE,		RCC_MP_NS_AHB4ENSETR,	4,	1),
+	GATE_CFG(GATE_GPIOF,		RCC_MP_NS_AHB4ENSETR,	5,	1),
+	GATE_CFG(GATE_GPIOG,		RCC_MP_NS_AHB4ENSETR,	6,	1),
+	GATE_CFG(GATE_GPIOH,		RCC_MP_NS_AHB4ENSETR,	7,	1),
+	GATE_CFG(GATE_GPIOI,		RCC_MP_NS_AHB4ENSETR,	8,	1),
+	GATE_CFG(GATE_PKA,		RCC_MP_AHB5ENSETR,	2,	1),
+	GATE_CFG(GATE_SAES,		RCC_MP_AHB5ENSETR,	3,	1),
+	GATE_CFG(GATE_CRYP1,		RCC_MP_AHB5ENSETR,	4,	1),
+	GATE_CFG(GATE_HASH1,		RCC_MP_AHB5ENSETR,	5,	1),
+	GATE_CFG(GATE_RNG1,		RCC_MP_AHB5ENSETR,	6,	1),
+	GATE_CFG(GATE_BKPSRAM,		RCC_MP_AHB5ENSETR,	8,	1),
+	GATE_CFG(GATE_AXIMC,		RCC_MP_AHB5ENSETR,	16,	1),
+	GATE_CFG(GATE_MCE,		RCC_MP_AHB6ENSETR,	1,	1),
+	GATE_CFG(GATE_ETH1CK,		RCC_MP_AHB6ENSETR,	7,	1),
+	GATE_CFG(GATE_ETH1TX,		RCC_MP_AHB6ENSETR,	8,	1),
+	GATE_CFG(GATE_ETH1RX,		RCC_MP_AHB6ENSETR,	9,	1),
+	GATE_CFG(GATE_ETH1MAC,		RCC_MP_AHB6ENSETR,	10,	1),
+	GATE_CFG(GATE_FMC,		RCC_MP_AHB6ENSETR,	12,	1),
+	GATE_CFG(GATE_QSPI,		RCC_MP_AHB6ENSETR,	14,	1),
+	GATE_CFG(GATE_SDMMC1,		RCC_MP_AHB6ENSETR,	16,	1),
+	GATE_CFG(GATE_SDMMC2,		RCC_MP_AHB6ENSETR,	17,	1),
+	GATE_CFG(GATE_CRC1,		RCC_MP_AHB6ENSETR,	20,	1),
+	GATE_CFG(GATE_USBH,		RCC_MP_AHB6ENSETR,	24,	1),
+	GATE_CFG(GATE_ETH2CK,		RCC_MP_AHB6ENSETR,	27,	1),
+	GATE_CFG(GATE_ETH2TX,		RCC_MP_AHB6ENSETR,	28,	1),
+	GATE_CFG(GATE_ETH2RX,		RCC_MP_AHB6ENSETR,	29,	1),
+	GATE_CFG(GATE_ETH2MAC,		RCC_MP_AHB6ENSETR,	30,	1),
+	GATE_CFG(GATE_ETH1STP,		RCC_MP_AHB6LPENSETR,	11,	1),
+	GATE_CFG(GATE_ETH2STP,		RCC_MP_AHB6LPENSETR,	31,	1),
+	GATE_CFG(GATE_MDMA,		RCC_MP_NS_AHB6ENSETR,	0,	1),
+};
+
+static const struct clk_div_table ck_trace_div_table[] = {
+	{ 0, 1 }, { 1, 2 }, { 2, 4 }, { 3, 8 },
+	{ 4, 16 }, { 5, 16 }, { 6, 16 }, { 7, 16 },
+	{ 0 },
+};
+
+enum enum_div_cfg {
+	DIV_MCO1,
+	DIV_MCO2,
+	DIV_TRACE,
+	DIV_ETH1PTP,
+	DIV_ETH2PTP,
+	LAST_DIV
+};
+
+#define DIV_CFG(id, _offset, _shift, _width, _flags, _table) \
+	[id] = { \
+		.reg_off	= _offset, \
+		.shift	= _shift, \
+		.width	= _width, \
+		.div_flags	= _flags, \
+		.table	= _table, \
+	}
+
+static const struct stm32_div_cfg stm32mp13_dividers[LAST_DIV] = {
+	DIV_CFG(DIV_MCO1, RCC_MCO1CFGR, 4, 4, 0, NULL),
+	DIV_CFG(DIV_MCO2, RCC_MCO2CFGR, 4, 4, 0, NULL),
+	DIV_CFG(DIV_TRACE, RCC_DBGCFGR, 0, 3, 0, ck_trace_div_table),
+	DIV_CFG(DIV_ETH1PTP, RCC_ETH12CKSELR, 4, 4, 0, NULL),
+	DIV_CFG(DIV_ETH2PTP, RCC_ETH12CKSELR, 12, 4, 0, NULL),
+};
+
+struct clk_stm32_securiy {
+	u16	offset;
+	u8	bit_idx;
+};
+
+enum securit_clk {
+	SECF_NONE,
+	SECF_LPTIM2,
+	SECF_LPTIM3,
+	SECF_VREF,
+	SECF_DCMIPP,
+	SECF_USBPHY,
+	SECF_RTC,
+	SECF_TZC,
+	SECF_ETZPC,
+	SECF_IWDG1,
+	SECF_BSEC,
+	SECF_STGENC,
+	SECF_STGENRO,
+	SECF_USART1,
+	SECF_USART2,
+	SECF_SPI4,
+	SECF_SPI5,
+	SECF_I2C3,
+	SECF_I2C4,
+	SECF_I2C5,
+	SECF_TIM12,
+	SECF_TIM13,
+	SECF_TIM14,
+	SECF_TIM15,
+	SECF_TIM16,
+	SECF_TIM17,
+	SECF_DMA3,
+	SECF_DMAMUX2,
+	SECF_ADC1,
+	SECF_ADC2,
+	SECF_USBO,
+	SECF_TSC,
+	SECF_PKA,
+	SECF_SAES,
+	SECF_CRYP1,
+	SECF_HASH1,
+	SECF_RNG1,
+	SECF_BKPSRAM,
+	SECF_MCE,
+	SECF_FMC,
+	SECF_QSPI,
+	SECF_SDMMC1,
+	SECF_SDMMC2,
+	SECF_ETH1CK,
+	SECF_ETH1TX,
+	SECF_ETH1RX,
+	SECF_ETH1MAC,
+	SECF_ETH1STP,
+	SECF_ETH2CK,
+	SECF_ETH2TX,
+	SECF_ETH2RX,
+	SECF_ETH2MAC,
+	SECF_ETH2STP,
+	SECF_MCO1,
+	SECF_MCO2
+};
+
+#define SECF(_sec_id, _offset, _bit_idx) \
+	[_sec_id] = { \
+		.offset	= _offset, \
+		.bit_idx	= _bit_idx, \
+	}
+
+static const struct clk_stm32_securiy stm32mp13_security[] = {
+	SECF(SECF_LPTIM2, RCC_APB3SECSR, RCC_APB3SECSR_LPTIM2SECF),
+	SECF(SECF_LPTIM3, RCC_APB3SECSR, RCC_APB3SECSR_LPTIM3SECF),
+	SECF(SECF_VREF, RCC_APB3SECSR, RCC_APB3SECSR_VREFSECF),
+	SECF(SECF_DCMIPP, RCC_APB4SECSR, RCC_APB4SECSR_DCMIPPSECF),
+	SECF(SECF_USBPHY, RCC_APB4SECSR, RCC_APB4SECSR_USBPHYSECF),
+	SECF(SECF_RTC, RCC_APB5SECSR, RCC_APB5SECSR_RTCSECF),
+	SECF(SECF_TZC, RCC_APB5SECSR, RCC_APB5SECSR_TZCSECF),
+	SECF(SECF_ETZPC, RCC_APB5SECSR, RCC_APB5SECSR_ETZPCSECF),
+	SECF(SECF_IWDG1, RCC_APB5SECSR, RCC_APB5SECSR_IWDG1SECF),
+	SECF(SECF_BSEC, RCC_APB5SECSR, RCC_APB5SECSR_BSECSECF),
+	SECF(SECF_STGENC, RCC_APB5SECSR, RCC_APB5SECSR_STGENCSECF),
+	SECF(SECF_STGENRO, RCC_APB5SECSR, RCC_APB5SECSR_STGENROSECF),
+	SECF(SECF_USART1, RCC_APB6SECSR, RCC_APB6SECSR_USART1SECF),
+	SECF(SECF_USART2, RCC_APB6SECSR, RCC_APB6SECSR_USART2SECF),
+	SECF(SECF_SPI4, RCC_APB6SECSR, RCC_APB6SECSR_SPI4SECF),
+	SECF(SECF_SPI5, RCC_APB6SECSR, RCC_APB6SECSR_SPI5SECF),
+	SECF(SECF_I2C3, RCC_APB6SECSR, RCC_APB6SECSR_I2C3SECF),
+	SECF(SECF_I2C4, RCC_APB6SECSR, RCC_APB6SECSR_I2C4SECF),
+	SECF(SECF_I2C5, RCC_APB6SECSR, RCC_APB6SECSR_I2C5SECF),
+	SECF(SECF_TIM12, RCC_APB6SECSR, RCC_APB6SECSR_TIM12SECF),
+	SECF(SECF_TIM13, RCC_APB6SECSR, RCC_APB6SECSR_TIM13SECF),
+	SECF(SECF_TIM14, RCC_APB6SECSR, RCC_APB6SECSR_TIM14SECF),
+	SECF(SECF_TIM15, RCC_APB6SECSR, RCC_APB6SECSR_TIM15SECF),
+	SECF(SECF_TIM16, RCC_APB6SECSR, RCC_APB6SECSR_TIM16SECF),
+	SECF(SECF_TIM17, RCC_APB6SECSR, RCC_APB6SECSR_TIM17SECF),
+	SECF(SECF_DMA3, RCC_AHB2SECSR, RCC_AHB2SECSR_DMA3SECF),
+	SECF(SECF_DMAMUX2, RCC_AHB2SECSR, RCC_AHB2SECSR_DMAMUX2SECF),
+	SECF(SECF_ADC1, RCC_AHB2SECSR, RCC_AHB2SECSR_ADC1SECF),
+	SECF(SECF_ADC2, RCC_AHB2SECSR, RCC_AHB2SECSR_ADC2SECF),
+	SECF(SECF_USBO, RCC_AHB2SECSR, RCC_AHB2SECSR_USBOSECF),
+	SECF(SECF_TSC, RCC_AHB4SECSR, RCC_AHB4SECSR_TSCSECF),
+	SECF(SECF_PKA, RCC_AHB5SECSR, RCC_AHB5SECSR_PKASECF),
+	SECF(SECF_SAES, RCC_AHB5SECSR, RCC_AHB5SECSR_SAESSECF),
+	SECF(SECF_CRYP1, RCC_AHB5SECSR, RCC_AHB5SECSR_CRYP1SECF),
+	SECF(SECF_HASH1, RCC_AHB5SECSR, RCC_AHB5SECSR_HASH1SECF),
+	SECF(SECF_RNG1, RCC_AHB5SECSR, RCC_AHB5SECSR_RNG1SECF),
+	SECF(SECF_BKPSRAM, RCC_AHB5SECSR, RCC_AHB5SECSR_BKPSRAMSECF),
+	SECF(SECF_MCE, RCC_AHB6SECSR, RCC_AHB6SECSR_MCESECF),
+	SECF(SECF_FMC, RCC_AHB6SECSR, RCC_AHB6SECSR_FMCSECF),
+	SECF(SECF_QSPI, RCC_AHB6SECSR, RCC_AHB6SECSR_QSPISECF),
+	SECF(SECF_SDMMC1, RCC_AHB6SECSR, RCC_AHB6SECSR_SDMMC1SECF),
+	SECF(SECF_SDMMC2, RCC_AHB6SECSR, RCC_AHB6SECSR_SDMMC2SECF),
+	SECF(SECF_ETH1CK, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH1CKSECF),
+	SECF(SECF_ETH1TX, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH1TXSECF),
+	SECF(SECF_ETH1RX, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH1RXSECF),
+	SECF(SECF_ETH1MAC, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH1MACSECF),
+	SECF(SECF_ETH1STP, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH1STPSECF),
+	SECF(SECF_ETH2CK, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH2CKSECF),
+	SECF(SECF_ETH2TX, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH2TXSECF),
+	SECF(SECF_ETH2RX, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH2RXSECF),
+	SECF(SECF_ETH2MAC, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH2MACSECF),
+	SECF(SECF_ETH2STP, RCC_AHB6SECSR, RCC_AHB6SECSR_ETH2STPSECF),
+	SECF(SECF_MCO1, RCC_SECCFGR, RCC_SECCFGR_MCO1SECF),
+	SECF(SECF_MCO2, RCC_SECCFGR, RCC_SECCFGR_MCO2SECF),
+};
+
+#define PCLK(_id, _name, _parent, _flags, _gate_id, _sec_id) \
+	STM32_GATE(_id, _name, _parent, _flags, _gate_id, _sec_id)
+
+#define TIMER(_id, _name, _parent, _flags, _gate_id, _sec_id) \
+	STM32_GATE(_id, _name, _parent, ((_flags) | CLK_SET_RATE_PARENT), \
+		   _gate_id, _sec_id)
+
+#define KCLK(_id, _name, _flags, _gate_id, _mux_id, _sec_id) \
+	STM32_COMPOSITE(_id, _name, _flags, _sec_id, \
+			_gate_id, _mux_id, NO_STM32_DIV)
+
+static const struct clock_config stm32mp13_clock_cfg[] = {
+	TIMER(TIM2_K, "tim2_k", "timg1_ck", 0, GATE_TIM2, SECF_NONE),
+	TIMER(TIM3_K, "tim3_k", "timg1_ck", 0, GATE_TIM3, SECF_NONE),
+	TIMER(TIM4_K, "tim4_k", "timg1_ck", 0, GATE_TIM4, SECF_NONE),
+	TIMER(TIM5_K, "tim5_k", "timg1_ck", 0, GATE_TIM5, SECF_NONE),
+	TIMER(TIM6_K, "tim6_k", "timg1_ck", 0, GATE_TIM6, SECF_NONE),
+	TIMER(TIM7_K, "tim7_k", "timg1_ck", 0, GATE_TIM7, SECF_NONE),
+	TIMER(TIM1_K, "tim1_k", "timg2_ck", 0, GATE_TIM1, SECF_NONE),
+	TIMER(TIM8_K, "tim8_k", "timg2_ck", 0, GATE_TIM8, SECF_NONE),
+	TIMER(TIM12_K, "tim12_k", "timg3_ck", 0, GATE_TIM12, SECF_TIM12),
+	TIMER(TIM13_K, "tim13_k", "timg3_ck", 0, GATE_TIM13, SECF_TIM13),
+	TIMER(TIM14_K, "tim14_k", "timg3_ck", 0, GATE_TIM14, SECF_TIM14),
+	TIMER(TIM15_K, "tim15_k", "timg3_ck", 0, GATE_TIM15, SECF_TIM15),
+	TIMER(TIM16_K, "tim16_k", "timg3_ck", 0, GATE_TIM16, SECF_TIM16),
+	TIMER(TIM17_K, "tim17_k", "timg3_ck", 0, GATE_TIM17, SECF_TIM17),
+
+	/* Peripheral clocks */
+	PCLK(SYSCFG, "syscfg", "pclk3", 0, GATE_SYSCFG, SECF_NONE),
+	PCLK(VREF, "vref", "pclk3", 0, GATE_VREF, SECF_VREF),
+	PCLK(PMBCTRL, "pmbctrl", "pclk3", 0, GATE_PMBCTRL, SECF_NONE),
+	PCLK(HDP, "hdp", "pclk3", 0, GATE_HDP, SECF_NONE),
+	PCLK(IWDG2, "iwdg2", "pclk4", 0, GATE_IWDG2APB, SECF_NONE),
+	PCLK(STGENRO, "stgenro", "pclk4", 0, GATE_STGENRO, SECF_STGENRO),
+	PCLK(TZPC, "tzpc", "pclk5", 0, GATE_TZC, SECF_TZC),
+	PCLK(IWDG1, "iwdg1", "pclk5", 0, GATE_IWDG1APB, SECF_IWDG1),
+	PCLK(BSEC, "bsec", "pclk5", 0, GATE_BSEC, SECF_BSEC),
+	PCLK(DMA1, "dma1", "ck_mlahb", 0, GATE_DMA1, SECF_NONE),
+	PCLK(DMA2, "dma2", "ck_mlahb",  0, GATE_DMA2, SECF_NONE),
+	PCLK(DMAMUX1, "dmamux1", "ck_mlahb", 0, GATE_DMAMUX1, SECF_NONE),
+	PCLK(DMAMUX2, "dmamux2", "ck_mlahb", 0, GATE_DMAMUX2, SECF_DMAMUX2),
+	PCLK(ADC1, "adc1", "ck_mlahb", 0, GATE_ADC1, SECF_ADC1),
+	PCLK(ADC2, "adc2", "ck_mlahb", 0, GATE_ADC2, SECF_ADC2),
+	PCLK(GPIOA, "gpioa", "pclk4", 0, GATE_GPIOA, SECF_NONE),
+	PCLK(GPIOB, "gpiob", "pclk4", 0, GATE_GPIOB, SECF_NONE),
+	PCLK(GPIOC, "gpioc", "pclk4", 0, GATE_GPIOC, SECF_NONE),
+	PCLK(GPIOD, "gpiod", "pclk4", 0, GATE_GPIOD, SECF_NONE),
+	PCLK(GPIOE, "gpioe", "pclk4", 0, GATE_GPIOE, SECF_NONE),
+	PCLK(GPIOF, "gpiof", "pclk4", 0, GATE_GPIOF, SECF_NONE),
+	PCLK(GPIOG, "gpiog", "pclk4", 0, GATE_GPIOG, SECF_NONE),
+	PCLK(GPIOH, "gpioh", "pclk4", 0, GATE_GPIOH, SECF_NONE),
+	PCLK(GPIOI, "gpioi", "pclk4", 0, GATE_GPIOI, SECF_NONE),
+	PCLK(TSC, "tsc", "pclk4", 0, GATE_TSC, SECF_TZC),
+	PCLK(PKA, "pka", "ck_axi", 0, GATE_PKA, SECF_PKA),
+	PCLK(CRYP1, "cryp1", "ck_axi", 0, GATE_CRYP1, SECF_CRYP1),
+	PCLK(HASH1, "hash1", "ck_axi", 0, GATE_HASH1, SECF_HASH1),
+	PCLK(BKPSRAM, "bkpsram", "ck_axi", 0, GATE_BKPSRAM, SECF_BKPSRAM),
+	PCLK(MDMA, "mdma", "ck_axi", 0, GATE_MDMA, SECF_NONE),
+	PCLK(ETH1TX, "eth1tx", "ck_axi", 0, GATE_ETH1TX, SECF_ETH1TX),
+	PCLK(ETH1RX, "eth1rx", "ck_axi", 0, GATE_ETH1RX, SECF_ETH1RX),
+	PCLK(ETH1MAC, "eth1mac", "ck_axi", 0, GATE_ETH1MAC, SECF_ETH1MAC),
+	PCLK(ETH2TX, "eth2tx", "ck_axi", 0, GATE_ETH2TX, SECF_ETH2TX),
+	PCLK(ETH2RX, "eth2rx", "ck_axi", 0, GATE_ETH2RX, SECF_ETH2RX),
+	PCLK(ETH2MAC, "eth2mac", "ck_axi", 0, GATE_ETH2MAC, SECF_ETH2MAC),
+	PCLK(CRC1, "crc1", "ck_axi", 0, GATE_CRC1, SECF_NONE),
+	PCLK(USBH, "usbh", "ck_axi", 0, GATE_USBH, SECF_NONE),
+	PCLK(DDRPERFM, "ddrperfm", "pclk4", 0, GATE_DDRPERFM, SECF_NONE),
+	PCLK(ETH1STP, "eth1stp", "ck_axi", 0, GATE_ETH1STP, SECF_ETH1STP),
+	PCLK(ETH2STP, "eth2stp", "ck_axi", 0, GATE_ETH2STP, SECF_ETH2STP),
+
+	/* Kernel clocks */
+	KCLK(SDMMC1_K, "sdmmc1_k", 0, GATE_SDMMC1, MUX_SDMMC1, SECF_SDMMC1),
+	KCLK(SDMMC2_K, "sdmmc2_k", 0, GATE_SDMMC2, MUX_SDMMC2, SECF_SDMMC2),
+	KCLK(FMC_K, "fmc_k", 0, GATE_FMC, MUX_FMC, SECF_FMC),
+	KCLK(QSPI_K, "qspi_k", 0, GATE_QSPI, MUX_QSPI, SECF_QSPI),
+	KCLK(SPI2_K, "spi2_k", 0, GATE_SPI2, MUX_SPI23, SECF_NONE),
+	KCLK(SPI3_K, "spi3_k", 0, GATE_SPI3, MUX_SPI23, SECF_NONE),
+	KCLK(I2C1_K, "i2c1_k", 0, GATE_I2C1, MUX_I2C12, SECF_NONE),
+	KCLK(I2C2_K, "i2c2_k", 0, GATE_I2C2, MUX_I2C12, SECF_NONE),
+	KCLK(LPTIM4_K, "lptim4_k", 0, GATE_LPTIM4, MUX_LPTIM45, SECF_NONE),
+	KCLK(LPTIM5_K, "lptim5_k", 0, GATE_LPTIM5, MUX_LPTIM45, SECF_NONE),
+	KCLK(USART3_K, "usart3_k", 0, GATE_USART3, MUX_UART35, SECF_NONE),
+	KCLK(UART5_K, "uart5_k", 0, GATE_UART5, MUX_UART35, SECF_NONE),
+	KCLK(UART7_K, "uart7_k", 0, GATE_UART7, MUX_UART78, SECF_NONE),
+	KCLK(UART8_K, "uart8_k", 0, GATE_UART8, MUX_UART78, SECF_NONE),
+	KCLK(RNG1_K, "rng1_k", 0, GATE_RNG1, MUX_RNG1, SECF_RNG1),
+	KCLK(USBPHY_K, "usbphy_k", 0, GATE_USBPHY, MUX_USBPHY, SECF_USBPHY),
+	KCLK(STGEN_K, "stgen_k", 0, GATE_STGENC, MUX_STGEN, SECF_STGENC),
+	KCLK(SPDIF_K, "spdif_k", 0, GATE_SPDIF, MUX_SPDIF, SECF_NONE),
+	KCLK(SPI1_K, "spi1_k", 0, GATE_SPI1, MUX_SPI1, SECF_NONE),
+	KCLK(SPI4_K, "spi4_k", 0, GATE_SPI4, MUX_SPI4, SECF_SPI4),
+	KCLK(SPI5_K, "spi5_k", 0, GATE_SPI5, MUX_SPI5, SECF_SPI5),
+	KCLK(I2C3_K, "i2c3_k", 0, GATE_I2C3, MUX_I2C3, SECF_I2C3),
+	KCLK(I2C4_K, "i2c4_k", 0, GATE_I2C4, MUX_I2C4, SECF_I2C4),
+	KCLK(I2C5_K, "i2c5_k", 0, GATE_I2C5, MUX_I2C5, SECF_I2C5),
+	KCLK(LPTIM1_K, "lptim1_k", 0, GATE_LPTIM1, MUX_LPTIM1, SECF_NONE),
+	KCLK(LPTIM2_K, "lptim2_k", 0, GATE_LPTIM2, MUX_LPTIM2, SECF_LPTIM2),
+	KCLK(LPTIM3_K, "lptim3_k", 0, GATE_LPTIM3, MUX_LPTIM3, SECF_LPTIM3),
+	KCLK(USART1_K, "usart1_k", 0, GATE_USART1, MUX_UART1, SECF_USART1),
+	KCLK(USART2_K, "usart2_k", 0, GATE_USART2, MUX_UART2, SECF_USART2),
+	KCLK(UART4_K, "uart4_k", 0, GATE_UART4, MUX_UART4, SECF_NONE),
+	KCLK(USART6_K, "uart6_k", 0, GATE_USART6, MUX_UART6, SECF_NONE),
+	KCLK(FDCAN_K, "fdcan_k", 0, GATE_FDCAN, MUX_FDCAN, SECF_NONE),
+	KCLK(SAI1_K, "sai1_k", 0, GATE_SAI1, MUX_SAI1, SECF_NONE),
+	KCLK(SAI2_K, "sai2_k", 0, GATE_SAI2, MUX_SAI2, SECF_NONE),
+	KCLK(ADC1_K, "adc1_k", 0, GATE_ADC1, MUX_ADC1, SECF_ADC1),
+	KCLK(ADC2_K, "adc2_k", 0, GATE_ADC2, MUX_ADC2, SECF_ADC2),
+	KCLK(DCMIPP_K, "dcmipp_k", 0, GATE_DCMIPP, MUX_DCMIPP, SECF_DCMIPP),
+	KCLK(ADFSDM_K, "adfsdm_k", 0, GATE_ADFSDM, MUX_SAI1, SECF_NONE),
+	KCLK(USBO_K, "usbo_k", 0, GATE_USBO, MUX_USBO, SECF_USBO),
+	KCLK(ETH1CK_K, "eth1ck_k", 0, GATE_ETH1CK, MUX_ETH1, SECF_ETH1CK),
+	KCLK(ETH2CK_K, "eth2ck_k", 0, GATE_ETH2CK, MUX_ETH2, SECF_ETH2CK),
+	KCLK(SAES_K, "saes_k", 0, GATE_SAES, MUX_SAES, SECF_SAES),
+
+	STM32_GATE(DFSDM_K, "dfsdm_k", "ck_mlahb", 0, GATE_DFSDM, SECF_NONE),
+	STM32_GATE(LTDC_PX, "ltdc_px", "pll4_q", CLK_SET_RATE_PARENT,
+		   GATE_LTDC, SECF_NONE),
+
+	STM32_GATE(DTS_K, "dts_k", "ck_lse", 0, GATE_DTS, SECF_NONE),
+
+	STM32_COMPOSITE(ETH1PTP_K, "eth1ptp_k", CLK_OPS_PARENT_ENABLE |
+		  CLK_SET_RATE_NO_REPARENT, SECF_ETH1CK,
+		  NO_STM32_GATE, MUX_ETH1, DIV_ETH1PTP),
+
+	STM32_COMPOSITE(ETH2PTP_K, "eth2ptp_k", CLK_OPS_PARENT_ENABLE |
+		  CLK_SET_RATE_NO_REPARENT, SECF_ETH2CK,
+		  NO_STM32_GATE, MUX_ETH2, DIV_ETH2PTP),
+
+	/* MCO clocks */
+	STM32_COMPOSITE(CK_MCO1, "ck_mco1", CLK_OPS_PARENT_ENABLE |
+			CLK_SET_RATE_NO_REPARENT, SECF_MCO1,
+			GATE_MCO1, MUX_MCO1, DIV_MCO1),
+
+	STM32_COMPOSITE(CK_MCO2, "ck_mco2", CLK_OPS_PARENT_ENABLE |
+			CLK_SET_RATE_NO_REPARENT, SECF_MCO2,
+			GATE_MCO2, MUX_MCO2, DIV_MCO2),
+
+	/* Debug clocks */
+	STM32_GATE(CK_DBG, "ck_sys_dbg", "ck_axi", CLK_IGNORE_UNUSED,
+		   GATE_DBGCK, SECF_NONE),
+
+	STM32_COMPOSITE_NOMUX(CK_TRACE, "ck_trace", "ck_axi",
+			      CLK_OPS_PARENT_ENABLE, SECF_NONE,
+			      GATE_TRACECK, DIV_TRACE),
+};
+
+static int stm32mp13_check_security(void __iomem *base,
+				    const struct clock_config *cfg)
+{
+	int sec_id = cfg->sec_id;
+	int secured = 0;
+
+	if (sec_id != SECF_NONE) {
+		const struct clk_stm32_securiy *secf;
+
+		secf = &stm32mp13_security[sec_id];
+		secured = !!(readl(base + secf->offset) & BIT(secf->bit_idx));
+	}
+
+	return secured;
+}
+
+static const struct stm32_clock_match_data stm32mp13_data = {
+	.tab_clocks	= stm32mp13_clock_cfg,
+	.num_clocks	= ARRAY_SIZE(stm32mp13_clock_cfg),
+	.clock_data = &(const struct clk_stm32_clock_data) {
+		.num_gates	= ARRAY_SIZE(stm32mp13_gates),
+		.gates		= stm32mp13_gates,
+		.muxes		= stm32mp13_muxes,
+		.dividers	= stm32mp13_dividers,
+	},
+	.check_security = stm32mp13_check_security,
+};
+
+static int stm32mp1_clk_probe(struct udevice *dev)
+{
+	struct udevice *scmi;
+	int err;
+
+	/* force SCMI probe to register all SCMI clocks */
+	uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(scmi_clock), &scmi);
+
+	err = stm32_rcc_init(dev, &stm32mp13_data);
+	if (err)
+		return err;
+
+	gd->cpu_clk = clk_stm32_get_rate_by_name("ck_mpu");
+	gd->bus_clk = clk_stm32_get_rate_by_name("ck_axi");
+
+	/* DDRPHYC father */
+	gd->mem_clk = clk_stm32_get_rate_by_name("pll2_r");
+
+	if (IS_ENABLED(CONFIG_DISPLAY_CPUINFO)) {
+		if (gd->flags & GD_FLG_RELOC) {
+			char buf[32];
+
+			log_info("Clocks:\n");
+			log_info("- MPU : %s MHz\n", strmhz(buf, gd->cpu_clk));
+			log_info("- AXI : %s MHz\n", strmhz(buf, gd->bus_clk));
+			log_info("- PER : %s MHz\n",
+				 strmhz(buf, clk_stm32_get_rate_by_name("ck_per")));
+			log_info("- DDR : %s MHz\n", strmhz(buf, gd->mem_clk));
+		}
+	}
+
+	return 0;
+}
+
+U_BOOT_DRIVER(stm32mp1_clock) = {
+	.name = "stm32mp13_clk",
+	.id = UCLASS_CLK,
+	.ops = &stm32_clk_ops,
+	.priv_auto = sizeof(struct stm32mp_rcc_priv),
+	.probe = stm32mp1_clk_probe,
+};
diff --git a/drivers/clk/stm32/stm32mp13_rcc.h b/drivers/clk/stm32/stm32mp13_rcc.h
new file mode 100644
index 0000000000..e7191b428a
--- /dev/null
+++ b/drivers/clk/stm32/stm32mp13_rcc.h
@@ -0,0 +1,288 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ *
+ * Configuration settings for the STM32MP13x CPU
+ */
+
+#ifndef STM32MP13_RCC_H
+#define STM32MP13_RCC_H
+
+/* RCC registers */
+#define RCC_SECCFGR			0x0
+#define RCC_MP_SREQSETR			0x100
+#define RCC_MP_SREQCLRR			0x104
+#define RCC_MP_APRSTCR			0x108
+#define RCC_MP_APRSTSR			0x10c
+#define RCC_PWRLPDLYCR			0x110
+#define RCC_MP_GRSTCSETR		0x114
+#define RCC_BR_RSTSCLRR			0x118
+#define RCC_MP_RSTSSETR			0x11c
+#define RCC_MP_RSTSCLRR			0x120
+#define RCC_MP_IWDGFZSETR		0x124
+#define RCC_MP_IWDGFZCLRR		0x128
+#define RCC_MP_CIER			0x200
+#define RCC_MP_CIFR			0x204
+#define RCC_BDCR			0x400
+#define RCC_RDLSICR			0x404
+#define RCC_OCENSETR			0x420
+#define RCC_OCENCLRR			0x424
+#define RCC_OCRDYR			0x428
+#define RCC_HSICFGR			0x440
+#define RCC_CSICFGR			0x444
+#define RCC_MCO1CFGR			0x460
+#define RCC_MCO2CFGR			0x464
+#define RCC_DBGCFGR			0x468
+#define RCC_RCK12SELR			0x480
+#define RCC_RCK3SELR			0x484
+#define RCC_RCK4SELR			0x488
+#define RCC_PLL1CR			0x4a0
+#define RCC_PLL1CFGR1			0x4a4
+#define RCC_PLL1CFGR2			0x4a8
+#define RCC_PLL1FRACR			0x4ac
+#define RCC_PLL1CSGR			0x4b0
+#define RCC_PLL2CR			0x4d0
+#define RCC_PLL2CFGR1			0x4d4
+#define RCC_PLL2CFGR2			0x4d8
+#define RCC_PLL2FRACR			0x4dc
+#define RCC_PLL2CSGR			0x4e0
+#define RCC_PLL3CR			0x500
+#define RCC_PLL3CFGR1			0x504
+#define RCC_PLL3CFGR2			0x508
+#define RCC_PLL3FRACR			0x50c
+#define RCC_PLL3CSGR			0x510
+#define RCC_PLL4CR			0x520
+#define RCC_PLL4CFGR1			0x524
+#define RCC_PLL4CFGR2			0x528
+#define RCC_PLL4FRACR			0x52c
+#define RCC_PLL4CSGR			0x530
+#define RCC_MPCKSELR			0x540
+#define RCC_ASSCKSELR			0x544
+#define RCC_MSSCKSELR			0x548
+#define RCC_CPERCKSELR			0x54c
+#define RCC_RTCDIVR			0x560
+#define RCC_MPCKDIVR			0x564
+#define RCC_AXIDIVR			0x568
+#define RCC_MLAHBDIVR			0x56c
+#define RCC_APB1DIVR			0x570
+#define RCC_APB2DIVR			0x574
+#define RCC_APB3DIVR			0x578
+#define RCC_APB4DIVR			0x57c
+#define RCC_APB5DIVR			0x580
+#define RCC_APB6DIVR			0x584
+#define RCC_TIMG1PRER			0x5a0
+#define RCC_TIMG2PRER			0x5a4
+#define RCC_TIMG3PRER			0x5a8
+#define RCC_DDRITFCR			0x5c0
+#define RCC_I2C12CKSELR			0x600
+#define RCC_I2C345CKSELR		0x604
+#define RCC_SPI2S1CKSELR		0x608
+#define RCC_SPI2S23CKSELR		0x60c
+#define RCC_SPI45CKSELR			0x610
+#define RCC_UART12CKSELR		0x614
+#define RCC_UART35CKSELR		0x618
+#define RCC_UART4CKSELR			0x61c
+#define RCC_UART6CKSELR			0x620
+#define RCC_UART78CKSELR		0x624
+#define RCC_LPTIM1CKSELR		0x628
+#define RCC_LPTIM23CKSELR		0x62c
+#define RCC_LPTIM45CKSELR		0x630
+#define RCC_SAI1CKSELR			0x634
+#define RCC_SAI2CKSELR			0x638
+#define RCC_FDCANCKSELR			0x63c
+#define RCC_SPDIFCKSELR			0x640
+#define RCC_ADC12CKSELR			0x644
+#define RCC_SDMMC12CKSELR		0x648
+#define RCC_ETH12CKSELR			0x64c
+#define RCC_USBCKSELR			0x650
+#define RCC_QSPICKSELR			0x654
+#define RCC_FMCCKSELR			0x658
+#define RCC_RNG1CKSELR			0x65c
+#define RCC_STGENCKSELR			0x660
+#define RCC_DCMIPPCKSELR		0x664
+#define RCC_SAESCKSELR			0x668
+#define RCC_APB1RSTSETR			0x6a0
+#define RCC_APB1RSTCLRR			0x6a4
+#define RCC_APB2RSTSETR			0x6a8
+#define RCC_APB2RSTCLRR			0x6ac
+#define RCC_APB3RSTSETR			0x6b0
+#define RCC_APB3RSTCLRR			0x6b4
+#define RCC_APB4RSTSETR			0x6b8
+#define RCC_APB4RSTCLRR			0x6bc
+#define RCC_APB5RSTSETR			0x6c0
+#define RCC_APB5RSTCLRR			0x6c4
+#define RCC_APB6RSTSETR			0x6c8
+#define RCC_APB6RSTCLRR			0x6cc
+#define RCC_AHB2RSTSETR			0x6d0
+#define RCC_AHB2RSTCLRR			0x6d4
+#define RCC_AHB4RSTSETR			0x6e0
+#define RCC_AHB4RSTCLRR			0x6e4
+#define RCC_AHB5RSTSETR			0x6e8
+#define RCC_AHB5RSTCLRR			0x6ec
+#define RCC_AHB6RSTSETR			0x6f0
+#define RCC_AHB6RSTCLRR			0x6f4
+#define RCC_MP_APB1ENSETR		0x700
+#define RCC_MP_APB1ENCLRR		0x704
+#define RCC_MP_APB2ENSETR		0x708
+#define RCC_MP_APB2ENCLRR		0x70c
+#define RCC_MP_APB3ENSETR		0x710
+#define RCC_MP_APB3ENCLRR		0x714
+#define RCC_MP_S_APB3ENSETR		0x718
+#define RCC_MP_S_APB3ENCLRR		0x71c
+#define RCC_MP_NS_APB3ENSETR		0x720
+#define RCC_MP_NS_APB3ENCLRR		0x724
+#define RCC_MP_APB4ENSETR		0x728
+#define RCC_MP_APB4ENCLRR		0x72c
+#define RCC_MP_S_APB4ENSETR		0x730
+#define RCC_MP_S_APB4ENCLRR		0x734
+#define RCC_MP_NS_APB4ENSETR		0x738
+#define RCC_MP_NS_APB4ENCLRR		0x73c
+#define RCC_MP_APB5ENSETR		0x740
+#define RCC_MP_APB5ENCLRR		0x744
+#define RCC_MP_APB6ENSETR		0x748
+#define RCC_MP_APB6ENCLRR		0x74c
+#define RCC_MP_AHB2ENSETR		0x750
+#define RCC_MP_AHB2ENCLRR		0x754
+#define RCC_MP_AHB4ENSETR		0x760
+#define RCC_MP_AHB4ENCLRR		0x764
+#define RCC_MP_S_AHB4ENSETR		0x768
+#define RCC_MP_S_AHB4ENCLRR		0x76c
+#define RCC_MP_NS_AHB4ENSETR		0x770
+#define RCC_MP_NS_AHB4ENCLRR		0x774
+#define RCC_MP_AHB5ENSETR		0x778
+#define RCC_MP_AHB5ENCLRR		0x77c
+#define RCC_MP_AHB6ENSETR		0x780
+#define RCC_MP_AHB6ENCLRR		0x784
+#define RCC_MP_S_AHB6ENSETR		0x788
+#define RCC_MP_S_AHB6ENCLRR		0x78c
+#define RCC_MP_NS_AHB6ENSETR		0x790
+#define RCC_MP_NS_AHB6ENCLRR		0x794
+#define RCC_MP_APB1LPENSETR		0x800
+#define RCC_MP_APB1LPENCLRR		0x804
+#define RCC_MP_APB2LPENSETR		0x808
+#define RCC_MP_APB2LPENCLRR		0x80c
+#define RCC_MP_APB3LPENSETR		0x810
+#define RCC_MP_APB3LPENCLRR		0x814
+#define RCC_MP_S_APB3LPENSETR		0x818
+#define RCC_MP_S_APB3LPENCLRR		0x81c
+#define RCC_MP_NS_APB3LPENSETR		0x820
+#define RCC_MP_NS_APB3LPENCLRR		0x824
+#define RCC_MP_APB4LPENSETR		0x828
+#define RCC_MP_APB4LPENCLRR		0x82c
+#define RCC_MP_S_APB4LPENSETR		0x830
+#define RCC_MP_S_APB4LPENCLRR		0x834
+#define RCC_MP_NS_APB4LPENSETR		0x838
+#define RCC_MP_NS_APB4LPENCLRR		0x83c
+#define RCC_MP_APB5LPENSETR		0x840
+#define RCC_MP_APB5LPENCLRR		0x844
+#define RCC_MP_APB6LPENSETR		0x848
+#define RCC_MP_APB6LPENCLRR		0x84c
+#define RCC_MP_AHB2LPENSETR		0x850
+#define RCC_MP_AHB2LPENCLRR		0x854
+#define RCC_MP_AHB4LPENSETR		0x858
+#define RCC_MP_AHB4LPENCLRR		0x85c
+#define RCC_MP_S_AHB4LPENSETR		0x868
+#define RCC_MP_S_AHB4LPENCLRR		0x86c
+#define RCC_MP_NS_AHB4LPENSETR		0x870
+#define RCC_MP_NS_AHB4LPENCLRR		0x874
+#define RCC_MP_AHB5LPENSETR		0x878
+#define RCC_MP_AHB5LPENCLRR		0x87c
+#define RCC_MP_AHB6LPENSETR		0x880
+#define RCC_MP_AHB6LPENCLRR		0x884
+#define RCC_MP_S_AHB6LPENSETR		0x888
+#define RCC_MP_S_AHB6LPENCLRR		0x88c
+#define RCC_MP_NS_AHB6LPENSETR		0x890
+#define RCC_MP_NS_AHB6LPENCLRR		0x894
+#define RCC_MP_S_AXIMLPENSETR		0x898
+#define RCC_MP_S_AXIMLPENCLRR		0x89c
+#define RCC_MP_NS_AXIMLPENSETR		0x8a0
+#define RCC_MP_NS_AXIMLPENCLRR		0x8a4
+#define RCC_MP_MLAHBLPENSETR		0x8a8
+#define RCC_MP_MLAHBLPENCLRR		0x8ac
+#define RCC_APB3SECSR			0x8c0
+#define RCC_APB4SECSR			0x8c4
+#define RCC_APB5SECSR			0x8c8
+#define RCC_APB6SECSR			0x8cc
+#define RCC_AHB2SECSR			0x8d0
+#define RCC_AHB4SECSR			0x8d4
+#define RCC_AHB5SECSR			0x8d8
+#define RCC_AHB6SECSR			0x8dc
+#define RCC_VERR			0xff4
+#define RCC_IDR				0xff8
+#define RCC_SIDR			0xffc
+
+/* RCC_SECCFGR register fields */
+#define RCC_SECCFGR_MCO1SECF		22
+#define RCC_SECCFGR_MCO2SECF		23
+
+/* RCC_APB3SECSR register fields */
+#define RCC_APB3SECSR_LPTIM2SECF	0
+#define RCC_APB3SECSR_LPTIM3SECF	1
+#define RCC_APB3SECSR_VREFSECF		13
+
+/* RCC_APB4SECSR register fields */
+#define RCC_APB4SECSR_DCMIPPSECF	1
+#define RCC_APB4SECSR_USBPHYSECF	16
+
+/* RCC_APB5SECSR register fields */
+#define RCC_APB5SECSR_RTCSECF		8
+#define RCC_APB5SECSR_TZCSECF		11
+#define RCC_APB5SECSR_ETZPCSECF		13
+#define RCC_APB5SECSR_IWDG1SECF		15
+#define RCC_APB5SECSR_BSECSECF		16
+#define RCC_APB5SECSR_STGENCSECF	20
+#define RCC_APB5SECSR_STGENROSECF	21
+
+/* RCC_APB6SECSR register fields */
+#define RCC_APB6SECSR_USART1SECF        0
+#define RCC_APB6SECSR_USART2SECF	1
+#define RCC_APB6SECSR_SPI4SECF		2
+#define RCC_APB6SECSR_SPI5SECF		3
+#define RCC_APB6SECSR_I2C3SECF		4
+#define RCC_APB6SECSR_I2C4SECF		5
+#define RCC_APB6SECSR_I2C5SECF		6
+#define RCC_APB6SECSR_TIM12SECF		7
+#define RCC_APB6SECSR_TIM13SECF		8
+#define RCC_APB6SECSR_TIM14SECF		9
+#define RCC_APB6SECSR_TIM15SECF		10
+#define RCC_APB6SECSR_TIM16SECF		11
+#define RCC_APB6SECSR_TIM17SECF		12
+
+/* RCC_AHB2SECSR register fields */
+#define RCC_AHB2SECSR_DMA3SECF		3
+#define RCC_AHB2SECSR_DMAMUX2SECF	4
+#define RCC_AHB2SECSR_ADC1SECF		5
+#define RCC_AHB2SECSR_ADC2SECF		6
+#define RCC_AHB2SECSR_USBOSECF		8
+
+/* RCC_AHB4SECSR register fields */
+#define RCC_AHB4SECSR_TSCSECF		15
+
+/* RCC_AHB5SECSR register fields */
+#define RCC_AHB5SECSR_PKASECF		2
+#define RCC_AHB5SECSR_SAESSECF		3
+#define RCC_AHB5SECSR_CRYP1SECF		4
+#define RCC_AHB5SECSR_HASH1SECF		5
+#define RCC_AHB5SECSR_RNG1SECF		6
+#define RCC_AHB5SECSR_BKPSRAMSECF	8
+
+/* RCC_AHB6SECSR register fields */
+#define RCC_AHB6SECSR_MCESECF		1
+#define RCC_AHB6SECSR_FMCSECF		12
+#define RCC_AHB6SECSR_QSPISECF		14
+#define RCC_AHB6SECSR_SDMMC1SECF	16
+#define RCC_AHB6SECSR_SDMMC2SECF	17
+
+#define RCC_AHB6SECSR_ETH1CKSECF	7
+#define RCC_AHB6SECSR_ETH1TXSECF	8
+#define RCC_AHB6SECSR_ETH1RXSECF	9
+#define RCC_AHB6SECSR_ETH1MACSECF	10
+#define RCC_AHB6SECSR_ETH1STPSECF	11
+
+#define RCC_AHB6SECSR_ETH2CKSECF	27
+#define RCC_AHB6SECSR_ETH2TXSECF	28
+#define RCC_AHB6SECSR_ETH2RXSECF	29
+#define RCC_AHB6SECSR_ETH2MACSECF	30
+#define RCC_AHB6SECSR_ETH2STPSECF	31
+
+#endif /* STM32MP13_RCC_H */
-- 
2.25.1


--===============5650840347409401757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5650840347409401757==--
