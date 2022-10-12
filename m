Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1385FC7CF
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Oct 2022 16:53:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40937C64108;
	Wed, 12 Oct 2022 14:53:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 200B8C640F3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 12:34:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CAd3Lj022192;
 Wed, 12 Oct 2022 14:33:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Ku836MhpJNCp11anHGyamh0akSULsf4wgDmVvXt294M=;
 b=zmf6SMygIicKhb76Om8GDIERou6IBkF44QARUNa5MIaP2wbCRj3pYEpKpLnlHNwAYCpm
 56cKKcu+P8zgDRcwRvrpG3s0FklvYFh+8rqkdLiYoqrri7vtlXmHqbrpwEuM/4WXCbId
 6UaaK2dyzIUM/cE3GzJ+tiIK1kY+vYU0zIQat+XMDRWA5TwRTgp/mMItMr+uah+49ToN
 fclWkSNhGGL42XPx07RsCxMuG+oX+SH2c0CRHFMzkJlSfOArld2zVkMdKvPotmK0JCcK
 Uv662N94U1bJtZVLt8jxCA4nQAwG/fniitIJTUmF5d7GLgJTNVSkWMU0Np4wHDyF0rMj 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k5tmahcq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 14:33:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B92AA100038;
 Wed, 12 Oct 2022 14:33:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B482B228A2C;
 Wed, 12 Oct 2022 14:33:54 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 14:33:54 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Oct 2022 14:33:16 +0200
Message-ID: <20221012123317.434898-3-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221012123317.434898-1-gabriel.fernandez@foss.st.com>
References: <20221012123317.434898-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_06,2022-10-12_01,2022-06-22_01
X-Mailman-Approved-At: Wed, 12 Oct 2022 14:53:55 +0000
Cc: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/3] clk: stm32mp13: introduce STM32MP13 RCC
	driver
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

Introduce STM32MP13 RCC driver using Common Clock Framework.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---

 drivers/clk/stm32/Kconfig          |   15 +
 drivers/clk/stm32/Makefile         |    2 +
 drivers/clk/stm32/clk-stm32-core.c |  349 ++++++
 drivers/clk/stm32/clk-stm32-core.h |  154 +++
 drivers/clk/stm32/clk-stm32mp13.c  |  839 +++++++++++++
 drivers/clk/stm32/stm32mp13_rcc.h  | 1751 ++++++++++++++++++++++++++++
 6 files changed, 3110 insertions(+)
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
index 0000000000..5e02807c1e
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -0,0 +1,349 @@
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
+#include <linux/clk-provider.h>
+#include "clk-stm32-core.h"
+
+int stm32_rcc_init(struct device *dev,
+		   const struct stm32_clock_match_data *data,
+		   void __iomem *base)
+{
+	int i;
+
+	for (i = 0; i < data->num_clocks; i++) {
+		const struct clock_config *cfg = &data->tab_clocks[i];
+		struct clk *clk = ERR_PTR(-ENOENT);
+
+		if (data->check_security) {
+			if ((*data->check_security)(base, cfg))
+				continue;
+		}
+
+		if (cfg->func)
+			clk = (*cfg->func)(NULL, data, base, NULL, cfg);
+
+		if (IS_ERR(clk)) {
+			log_err("%s: failed to register clock %s\n", __func__,
+				cfg->name);
+
+			return  PTR_ERR(clk);
+		}
+
+		clk->id = cfg->id;
+	}
+
+	return 0;
+}
+
+static const struct clk_ops *clk_dev_ops(struct udevice *dev)
+{
+	return (const struct clk_ops *)dev->driver->ops;
+}
+
+static int stm32_clk_enable(struct clk *clk)
+{
+	const struct clk_ops *ops;
+	struct clk *clkp = NULL;
+
+	if (!clk->id || clk_get_by_id(clk->id, &clkp))
+		return -ENOENT;
+
+	ops = clk_dev_ops(clkp->dev);
+	if (!ops->enable)
+		return 0;
+
+	return ops->enable(clkp);
+}
+
+static int stm32_clk_disable(struct clk *clk)
+{
+	const struct clk_ops *ops;
+	struct clk *clkp = NULL;
+
+	if (!clk->id || clk_get_by_id(clk->id, &clkp))
+		return -ENOENT;
+
+	ops = clk_dev_ops(clkp->dev);
+	if (!ops->disable)
+		return 0;
+
+	return ops->disable(clkp);
+}
+
+static ulong stm32_clk_get_rate(struct clk *clk)
+{
+	const struct clk_ops *ops;
+	struct clk *clkp = NULL;
+
+	if (!clk->id || clk_get_by_id(clk->id, &clkp))
+		return -ENOENT;
+
+	ops = clk_dev_ops(clkp->dev);
+	if (!ops->get_rate)
+		return -ENOSYS;
+
+	return ops->get_rate(clkp);
+}
+
+static ulong stm32_clk_set_rate(struct clk *clk, unsigned long clk_rate)
+{
+	const struct clk_ops *ops;
+	struct clk *clkp = NULL;
+
+	if (!clk->id || clk_get_by_id(clk->id, &clkp))
+		return -ENOENT;
+
+	ops = clk_dev_ops(clkp->dev);
+	if (!ops->set_rate)
+		return -ENOSYS;
+
+	return ops->set_rate(clkp, clk_rate);
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
+	.enable = stm32_clk_enable,
+	.disable = stm32_clk_disable,
+	.get_rate = stm32_clk_get_rate,
+	.set_rate = stm32_clk_set_rate,
+};
+
+#define RCC_MP_ENCLRR_OFFSET	4
+
+static void clk_stm32_gate_set_state(const struct stm32_gate_cfg *gate_cfg,
+				     void __iomem *base, u8 *cpt, int enable)
+{
+	void __iomem *addr = base + gate_cfg->reg_off;
+	u8 set_clr = gate_cfg->set_clr ? RCC_MP_ENCLRR_OFFSET : 0;
+
+	if (enable) {
+		if (*cpt++ > 0)
+			return;
+
+		if (set_clr)
+			writel(BIT(gate_cfg->bit_idx), addr);
+		else
+			writel(readl(addr) | BIT(gate_cfg->bit_idx), addr);
+	} else {
+		if (--*cpt > 0)
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
+
+	clk_stm32_gate_set_state(stm32_gate->gate, stm32_gate->base,
+				 &stm32_gate->cpt, 1);
+	return 0;
+}
+
+static int clk_stm32_gate_disable(struct clk *clk)
+{
+	struct clk_stm32_gate *stm32_gate = to_clk_stm32_gate(clk);
+
+	clk_stm32_gate_set_state(stm32_gate->gate, stm32_gate->base,
+				 &stm32_gate->cpt, 0);
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
+struct clk *clk_stm32_gate_register(struct device *dev,
+				    const char *name,
+				    const char *parent_name,
+				    unsigned long flags,
+				    void __iomem *base,
+				    const struct stm32_gate_cfg *gate_cfg,
+				    spinlock_t *lock)
+{
+	struct clk_stm32_gate *stm32_gate;
+	struct clk *clk;
+	int ret;
+
+	stm32_gate = kzalloc(sizeof(*stm32_gate), GFP_KERNEL);
+	if (!stm32_gate)
+		return ERR_PTR(-ENOMEM);
+
+	stm32_gate->base = base;
+	stm32_gate->gate = gate_cfg;
+
+	clk = &stm32_gate->clk;
+	clk->flags = flags;
+
+	ret = clk_register(clk, UBOOT_DM_CLK_STM32_GATE, name, parent_name);
+	if (ret) {
+		kfree(stm32_gate);
+		return ERR_PTR(ret);
+	}
+
+	return clk;
+}
+
+struct clk *clk_stm32_register_composite(const char *name,
+					 const char * const *parent_names,
+					 int num_parents,
+					 unsigned long flags,
+					 void __iomem *base,
+					 const struct stm32_mux_cfg *mcfg,
+					 const struct stm32_div_cfg *dcfg,
+					 const struct stm32_gate_cfg *gcfg)
+{
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
+
+	if (mcfg) {
+		mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+		if (!mux)
+			goto fail;
+
+		mux->reg = base + mcfg->reg_off;
+		mux->shift = mcfg->shift;
+		mux->mask = BIT(mcfg->width) - 1;
+		mux->num_parents = mcfg->num_parents;
+		mux->flags = 0;
+		mux->parent_names = mcfg->parent_names;
+
+		mux_clk = &mux->clk;
+		mux_ops = &clk_mux_ops;
+	}
+
+	if (dcfg) {
+		div = kzalloc(sizeof(*div), GFP_KERNEL);
+		if (!div)
+			goto fail;
+
+		div->reg = base + dcfg->reg_off;
+		div->shift = dcfg->shift;
+		div->width = dcfg->width;
+		div->width = dcfg->width;
+		div->flags = dcfg->div_flags;
+		div->table = dcfg->table;
+
+		div_clk = &div->clk;
+		div_ops = &clk_divider_ops;
+	}
+
+	if (gcfg) {
+		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+		if (!gate)
+			goto fail;
+
+		gate->base = base;
+		gate->gate = gcfg;
+
+		gate_clk = &gate->clk;
+		gate_ops = &clk_stm32_gate_ops;
+	}
+
+	clk = clk_register_composite(NULL, name,
+				     parent_names, num_parents,
+				     mux_clk, mux_ops,
+				     div_clk, div_ops,
+				     gate_clk, gate_ops,
+				     flags);
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
+
+struct clk *_clk_stm32_gate_register(struct device *dev,
+				     const struct stm32_clock_match_data *data,
+				     void __iomem *base,
+				     spinlock_t *lock,
+				     const struct clock_config *cfg)
+{
+	struct stm32_clk_gate_cfg *clk_cfg = cfg->clock_cfg;
+	const struct stm32_gate_cfg *gate_cfg = &data->gates[clk_cfg->gate_id];
+
+	return clk_stm32_gate_register(dev, cfg->name, cfg->parent_name,
+				       cfg->flags, base, gate_cfg, lock);
+}
+
+struct clk *
+_clk_stm32_register_composite(struct device *dev,
+			      const struct stm32_clock_match_data *data,
+			      void __iomem *base, spinlock_t *lock,
+			      const struct clock_config *cfg)
+{
+	struct stm32_clk_composite_cfg *composite = cfg->clock_cfg;
+	const struct stm32_mux_cfg *mux_cfg = NULL;
+	const struct stm32_gate_cfg *gate_cfg = NULL;
+	const struct stm32_div_cfg *div_cfg = NULL;
+	const char *const *parent_names;
+	int num_parents;
+
+	if  (composite->mux_id != NO_STM32_MUX) {
+		mux_cfg = &data->muxes[composite->mux_id];
+		parent_names = mux_cfg->parent_names;
+		num_parents = mux_cfg->num_parents;
+	} else {
+		parent_names = &cfg->parent_name;
+		num_parents = 1;
+	}
+
+	if  (composite->gate_id != NO_STM32_GATE)
+		gate_cfg = &data->gates[composite->gate_id];
+
+	if  (composite->div_id != NO_STM32_DIV)
+		div_cfg = &data->dividers[composite->div_id];
+
+	return clk_stm32_register_composite(cfg->name, parent_names,
+					    num_parents, cfg->flags, base,
+					    mux_cfg, div_cfg, gate_cfg);
+}
diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
new file mode 100644
index 0000000000..c74e5911a4
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32-core.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+struct stm32_clock_match_data;
+
+struct stm32_mux_cfg {
+	const char * const *parent_names;
+	u8	num_parents;
+	u32	reg_off;
+	u8	shift;
+	u8	width;
+	u8	mux_flags;
+	u32	*table;
+};
+
+struct stm32_gate_cfg {
+	u32	reg_off;
+	u8	bit_idx;
+	u8	gate_flags;
+	u8	set_clr;
+};
+
+struct stm32_div_cfg {
+	u32	reg_off;
+	u8	shift;
+	u8	width;
+	u8	div_flags;
+	const struct clk_div_table *table;
+};
+
+struct stm32_composite_cfg {
+	int mux;
+	int gate;
+	int div;
+};
+
+struct clock_config {
+	unsigned long id;
+	const char *name;
+	const char *parent_name;
+	unsigned long flags;
+	int sec_id;
+	void *clock_cfg;
+
+	struct clk *(*func)(struct device *dev,
+			    const struct stm32_clock_match_data *data,
+			    void __iomem *base,
+			    spinlock_t *lock,
+			    const struct clock_config *cfg);
+};
+
+struct stm32_clock_match_data {
+	unsigned int			num_clocks;
+	const struct clock_config	*tab_clocks;
+	unsigned int			maxbinding;
+	const struct stm32_gate_cfg	*gates;
+	const struct stm32_mux_cfg	*muxes;
+	const struct stm32_div_cfg	*dividers;
+
+	int (*check_security)(void __iomem *base,
+			      const struct clock_config *cfg);
+};
+
+int stm32_rcc_init(struct device *dev,
+		   const struct stm32_clock_match_data *data,
+		   void __iomem *base);
+
+#define NO_ID 0xFFFF0000
+
+#define NO_STM32_MUX	-1
+#define NO_STM32_DIV	-1
+#define NO_STM32_GATE	-1
+
+struct clk_stm32_gate {
+	struct clk clk;
+	void __iomem *base;
+	const struct stm32_gate_cfg *gate;
+	u8 cpt;
+};
+
+#define to_clk_stm32_gate(_clk) container_of(_clk, struct clk_stm32_gate, clk)
+
+struct clk *
+_clk_stm32_gate_register(struct device *dev,
+			 const struct stm32_clock_match_data *data,
+			 void __iomem *base, spinlock_t *lock,
+			 const struct clock_config *cfg);
+
+struct clk *
+_clk_stm32_register_composite(struct device *dev,
+			      const struct stm32_clock_match_data *data,
+			      void __iomem *base, spinlock_t *lock,
+			      const struct clock_config *cfg);
+
+struct stm32_clk_gate_cfg {
+	int gate_id;
+};
+
+#define STM32_GATE(_id, _name, _parent, _flags, _gate_id, _sec_id)\
+{\
+	.id		= _id,\
+	.sec_id		= _sec_id,\
+	.name		= _name,\
+	.parent_name	= _parent,\
+	.flags		= _flags,\
+	.clock_cfg	= &(struct stm32_clk_gate_cfg) {\
+		.gate_id	= _gate_id,\
+	},\
+	.func		= _clk_stm32_gate_register,\
+}
+
+struct stm32_clk_composite_cfg {
+	int	gate_id;
+	int	mux_id;
+	int	div_id;
+};
+
+#define STM32_COMPOSITE(_id, _name, _flags, _sec_id,\
+			_gate_id, _mux_id, _div_id)\
+{\
+	.id		= _id,\
+	.name		= _name,\
+	.sec_id		= _sec_id,\
+	.flags		= _flags,\
+	.clock_cfg	= &(struct stm32_clk_composite_cfg) {\
+		.gate_id	= _gate_id,\
+		.mux_id		= _mux_id,\
+		.div_id		= _div_id,\
+	},\
+	.func		= _clk_stm32_register_composite,\
+}
+
+#define STM32_COMPOSITE_NOMUX(_id, _name, _parent, _flags, _sec_id,\
+			      _gate_id, _div_id)\
+{\
+	.id		= _id,\
+	.name		= _name,\
+	.parent_name	= _parent,\
+	.sec_id		= _sec_id,\
+	.flags		= _flags,\
+	.clock_cfg	= &(struct stm32_clk_composite_cfg) {\
+		.gate_id	= _gate_id,\
+		.mux_id		= NO_STM32_MUX,\
+		.div_id		= _div_id,\
+	},\
+	.func		= _clk_stm32_register_composite,\
+}
+
+extern const struct clk_ops stm32_clk_ops;
+
+ulong clk_stm32_get_rate_by_name(const char *name);
diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
new file mode 100644
index 0000000000..2d0096ec68
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -0,0 +1,839 @@
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
+struct stm32mp1_clk_priv {
+	fdt_addr_t base;
+};
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
+#define MUX_CFG(id, src, _offset, _shift, _witdh)[id] = {\
+		.num_parents	= ARRAY_SIZE(src),\
+		.parent_names	= (src),\
+		.reg_off	= (_offset),\
+		.shift		= (_shift),\
+		.width		= (_witdh),\
+}
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
+#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)[id] = {\
+	.reg_off	= (_offset),\
+	.bit_idx	= (_bit_idx),\
+	.set_clr	= (_offset_clr),\
+}
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
+#define DIV_CFG(id, _offset, _shift, _width, _flags, _table)[id] = {\
+		.reg_off	= _offset,\
+		.shift	= _shift,\
+		.width	= _width,\
+		.div_flags	= _flags,\
+		.table	= _table,\
+}
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
+#define SECF(_sec_id, _offset, _bit_idx)[_sec_id] = {\
+	.offset	= _offset,\
+	.bit_idx	= _bit_idx,\
+}
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
+#define PCLK(_id, _name, _parent, _flags, _gate_id, _sec_id)\
+	STM32_GATE(_id, _name, _parent, _flags, _gate_id, _sec_id)
+
+#define TIMER(_id, _name, _parent, _flags, _gate_id, _sec_id)\
+	STM32_GATE(_id, _name, _parent, ((_flags) | CLK_SET_RATE_PARENT),\
+		   _gate_id, _sec_id)
+
+#define KCLK(_id, _name, _flags, _gate_id, _mux_id, _sec_id)\
+	STM32_COMPOSITE(_id, _name, _flags, _sec_id,\
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
+	.gates		= stm32mp13_gates,
+	.muxes		= stm32mp13_muxes,
+	.dividers	= stm32mp13_dividers,
+	.check_security = &stm32mp13_check_security
+};
+
+static int stm32mp1_clk_probe(struct udevice *dev)
+{
+	fdt_addr_t base = dev_read_addr(dev->parent);
+	struct udevice *scmi;
+
+	if (base == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	/* force SCMI probe to register all SCMI clocks */
+	uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(scmi_clock), &scmi);
+
+	stm32_rcc_init(NULL, &stm32mp13_data, (void __iomem *)base);
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
+	.priv_auto = sizeof(struct stm32mp1_clk_priv),
+	.probe = stm32mp1_clk_probe,
+};
diff --git a/drivers/clk/stm32/stm32mp13_rcc.h b/drivers/clk/stm32/stm32mp13_rcc.h
new file mode 100644
index 0000000000..a7535d6368
--- /dev/null
+++ b/drivers/clk/stm32/stm32mp13_rcc.h
@@ -0,0 +1,1751 @@
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
+#define RCC_SECCFGR_HSISEC		BIT(0)
+#define RCC_SECCFGR_CSISEC		BIT(1)
+#define RCC_SECCFGR_HSESEC		BIT(2)
+#define RCC_SECCFGR_LSISEC		BIT(3)
+#define RCC_SECCFGR_LSESEC		BIT(4)
+#define RCC_SECCFGR_PLL12SEC		BIT(8)
+#define RCC_SECCFGR_PLL3SEC		BIT(9)
+#define RCC_SECCFGR_PLL4SEC		BIT(10)
+#define RCC_SECCFGR_MPUSEC		BIT(11)
+#define RCC_SECCFGR_AXISEC		BIT(12)
+#define RCC_SECCFGR_MLAHBSEC		BIT(13)
+#define RCC_SECCFGR_APB3DIVSEC		BIT(16)
+#define RCC_SECCFGR_APB4DIVSEC		BIT(17)
+#define RCC_SECCFGR_APB5DIVSEC		BIT(18)
+#define RCC_SECCFGR_APB6DIVSEC		BIT(19)
+#define RCC_SECCFGR_TIMG3SEC		BIT(20)
+#define RCC_SECCFGR_CPERSEC		BIT(21)
+#define RCC_SECCFGR_MCO1SEC		BIT(22)
+#define RCC_SECCFGR_MCO2SEC		BIT(23)
+#define RCC_SECCFGR_STPSEC		BIT(24)
+#define RCC_SECCFGR_RSTSEC		BIT(25)
+#define RCC_SECCFGR_PWRSEC		BIT(31)
+
+#define RCC_SECCFGR_MCO1SECF		22
+#define RCC_SECCFGR_MCO2SECF		23
+
+/* RCC_MP_SREQSETR register fields */
+#define RCC_MP_SREQSETR_STPREQ_P0	BIT(0)
+
+/* RCC_MP_SREQCLRR register fields */
+#define RCC_MP_SREQCLRR_STPREQ_P0	BIT(0)
+
+/* RCC_MP_APRSTCR register fields */
+#define RCC_MP_APRSTCR_RDCTLEN		BIT(0)
+#define RCC_MP_APRSTCR_RSTTO_MASK	GENMASK(14, 8)
+#define RCC_MP_APRSTCR_RSTTO_SHIFT	8
+
+/* RCC_MP_APRSTSR register fields */
+#define RCC_MP_APRSTSR_RSTTOV_MASK	GENMASK(14, 8)
+#define RCC_MP_APRSTSR_RSTTOV_SHIFT	8
+
+/* RCC_PWRLPDLYCR register fields */
+#define RCC_PWRLPDLYCR_PWRLP_DLY_MASK	GENMASK(21, 0)
+#define RCC_PWRLPDLYCR_PWRLP_DLY_SHIFT	0
+
+/* RCC_MP_GRSTCSETR register fields */
+#define RCC_MP_GRSTCSETR_MPSYSRST	BIT(0)
+#define RCC_MP_GRSTCSETR_MPUP0RST	BIT(4)
+
+/* RCC_BR_RSTSCLRR register fields */
+#define RCC_BR_RSTSCLRR_PORRSTF		BIT(0)
+#define RCC_BR_RSTSCLRR_BORRSTF		BIT(1)
+#define RCC_BR_RSTSCLRR_PADRSTF		BIT(2)
+#define RCC_BR_RSTSCLRR_HCSSRSTF	BIT(3)
+#define RCC_BR_RSTSCLRR_VCORERSTF	BIT(4)
+#define RCC_BR_RSTSCLRR_VCPURSTF	BIT(5)
+#define RCC_BR_RSTSCLRR_MPSYSRSTF	BIT(6)
+#define RCC_BR_RSTSCLRR_IWDG1RSTF	BIT(8)
+#define RCC_BR_RSTSCLRR_IWDG2RSTF	BIT(9)
+#define RCC_BR_RSTSCLRR_MPUP0RSTF	BIT(13)
+
+/* RCC_MP_RSTSSETR register fields */
+#define RCC_MP_RSTSSETR_PORRSTF		BIT(0)
+#define RCC_MP_RSTSSETR_BORRSTF		BIT(1)
+#define RCC_MP_RSTSSETR_PADRSTF		BIT(2)
+#define RCC_MP_RSTSSETR_HCSSRSTF	BIT(3)
+#define RCC_MP_RSTSSETR_VCORERSTF	BIT(4)
+#define RCC_MP_RSTSSETR_VCPURSTF	BIT(5)
+#define RCC_MP_RSTSSETR_MPSYSRSTF	BIT(6)
+#define RCC_MP_RSTSSETR_IWDG1RSTF	BIT(8)
+#define RCC_MP_RSTSSETR_IWDG2RSTF	BIT(9)
+#define RCC_MP_RSTSSETR_STP2RSTF	BIT(10)
+#define RCC_MP_RSTSSETR_STDBYRSTF	BIT(11)
+#define RCC_MP_RSTSSETR_CSTDBYRSTF	BIT(12)
+#define RCC_MP_RSTSSETR_MPUP0RSTF	BIT(13)
+#define RCC_MP_RSTSSETR_SPARE		BIT(15)
+
+/* RCC_MP_RSTSCLRR register fields */
+#define RCC_MP_RSTSCLRR_PORRSTF		BIT(0)
+#define RCC_MP_RSTSCLRR_BORRSTF		BIT(1)
+#define RCC_MP_RSTSCLRR_PADRSTF		BIT(2)
+#define RCC_MP_RSTSCLRR_HCSSRSTF	BIT(3)
+#define RCC_MP_RSTSCLRR_VCORERSTF	BIT(4)
+#define RCC_MP_RSTSCLRR_VCPURSTF	BIT(5)
+#define RCC_MP_RSTSCLRR_MPSYSRSTF	BIT(6)
+#define RCC_MP_RSTSCLRR_IWDG1RSTF	BIT(8)
+#define RCC_MP_RSTSCLRR_IWDG2RSTF	BIT(9)
+#define RCC_MP_RSTSCLRR_STP2RSTF	BIT(10)
+#define RCC_MP_RSTSCLRR_STDBYRSTF	BIT(11)
+#define RCC_MP_RSTSCLRR_CSTDBYRSTF	BIT(12)
+#define RCC_MP_RSTSCLRR_MPUP0RSTF	BIT(13)
+#define RCC_MP_RSTSCLRR_SPARE		BIT(15)
+
+/* RCC_MP_IWDGFZSETR register fields */
+#define RCC_MP_IWDGFZSETR_FZ_IWDG1	BIT(0)
+#define RCC_MP_IWDGFZSETR_FZ_IWDG2	BIT(1)
+
+/* RCC_MP_IWDGFZCLRR register fields */
+#define RCC_MP_IWDGFZCLRR_FZ_IWDG1	BIT(0)
+#define RCC_MP_IWDGFZCLRR_FZ_IWDG2	BIT(1)
+
+/* RCC_MP_CIER register fields */
+#define RCC_MP_CIER_LSIRDYIE		BIT(0)
+#define RCC_MP_CIER_LSERDYIE		BIT(1)
+#define RCC_MP_CIER_HSIRDYIE		BIT(2)
+#define RCC_MP_CIER_HSERDYIE		BIT(3)
+#define RCC_MP_CIER_CSIRDYIE		BIT(4)
+#define RCC_MP_CIER_PLL1DYIE		BIT(8)
+#define RCC_MP_CIER_PLL2DYIE		BIT(9)
+#define RCC_MP_CIER_PLL3DYIE		BIT(10)
+#define RCC_MP_CIER_PLL4DYIE		BIT(11)
+#define RCC_MP_CIER_LSECSSIE		BIT(16)
+#define RCC_MP_CIER_WKUPIE		BIT(20)
+
+/* RCC_MP_CIFR register fields */
+#define RCC_MP_CIFR_LSIRDYF		BIT(0)
+#define RCC_MP_CIFR_LSERDYF		BIT(1)
+#define RCC_MP_CIFR_HSIRDYF		BIT(2)
+#define RCC_MP_CIFR_HSERDYF		BIT(3)
+#define RCC_MP_CIFR_CSIRDYF		BIT(4)
+#define RCC_MP_CIFR_PLL1DYF		BIT(8)
+#define RCC_MP_CIFR_PLL2DYF		BIT(9)
+#define RCC_MP_CIFR_PLL3DYF		BIT(10)
+#define RCC_MP_CIFR_PLL4DYF		BIT(11)
+#define RCC_MP_CIFR_LSECSSF		BIT(16)
+#define RCC_MP_CIFR_WKUPF		BIT(20)
+
+/* RCC_BDCR register fields */
+#define RCC_BDCR_LSEON			BIT(0)
+#define RCC_BDCR_LSEBYP			BIT(1)
+#define RCC_BDCR_LSERDY			BIT(2)
+#define RCC_BDCR_DIGBYP			BIT(3)
+#define RCC_BDCR_LSEDRV_MASK		GENMASK(5, 4)
+#define RCC_BDCR_LSECSSON		BIT(8)
+#define RCC_BDCR_LSECSSD		BIT(9)
+#define RCC_BDCR_RTCSRC_MASK		GENMASK(17, 16)
+#define RCC_BDCR_RTCCKEN		BIT(20)
+#define RCC_BDCR_VSWRST			BIT(31)
+#define RCC_BDCR_LSEDRV_SHIFT		4
+#define RCC_BDCR_RTCSRC_SHIFT		16
+
+/* RCC_RDLSICR register fields */
+#define RCC_RDLSICR_LSION		BIT(0)
+#define RCC_RDLSICR_LSIRDY		BIT(1)
+#define RCC_RDLSICR_MRD_MASK		GENMASK(20, 16)
+#define RCC_RDLSICR_EADLY_MASK		GENMASK(26, 24)
+#define RCC_RDLSICR_SPARE_MASK		GENMASK(31, 27)
+#define RCC_RDLSICR_MRD_SHIFT		16
+#define RCC_RDLSICR_EADLY_SHIFT		24
+#define RCC_RDLSICR_SPARE_SHIFT		27
+
+/* RCC_OCENSETR register fields */
+#define RCC_OCENSETR_HSION		BIT(0)
+#define RCC_OCENSETR_HSIKERON		BIT(1)
+#define RCC_OCENSETR_CSION		BIT(4)
+#define RCC_OCENSETR_CSIKERON		BIT(5)
+#define RCC_OCENSETR_DIGBYP		BIT(7)
+#define RCC_OCENSETR_HSEON		BIT(8)
+#define RCC_OCENSETR_HSEKERON		BIT(9)
+#define RCC_OCENSETR_HSEBYP		BIT(10)
+#define RCC_OCENSETR_HSECSSON		BIT(11)
+
+/* RCC_OCENCLRR register fields */
+#define RCC_OCENCLRR_HSION		BIT(0)
+#define RCC_OCENCLRR_HSIKERON		BIT(1)
+#define RCC_OCENCLRR_CSION		BIT(4)
+#define RCC_OCENCLRR_CSIKERON		BIT(5)
+#define RCC_OCENCLRR_DIGBYP		BIT(7)
+#define RCC_OCENCLRR_HSEON		BIT(8)
+#define RCC_OCENCLRR_HSEKERON		BIT(9)
+#define RCC_OCENCLRR_HSEBYP		BIT(10)
+
+/* RCC_OCRDYR register fields */
+#define RCC_OCRDYR_HSIRDY		BIT(0)
+#define RCC_OCRDYR_HSIDIVRDY		BIT(2)
+#define RCC_OCRDYR_CSIRDY		BIT(4)
+#define RCC_OCRDYR_HSERDY		BIT(8)
+#define RCC_OCRDYR_MPUCKRDY		BIT(23)
+#define RCC_OCRDYR_AXICKRDY		BIT(24)
+
+/* RCC_HSICFGR register fields */
+#define RCC_HSICFGR_HSIDIV_MASK		GENMASK(1, 0)
+#define RCC_HSICFGR_HSITRIM_MASK	GENMASK(14, 8)
+#define RCC_HSICFGR_HSICAL_MASK		GENMASK(27, 16)
+#define RCC_HSICFGR_HSIDIV_SHIFT	0
+#define RCC_HSICFGR_HSITRIM_SHIFT	8
+#define RCC_HSICFGR_HSICAL_SHIFT	16
+
+/* RCC_CSICFGR register fields */
+#define RCC_CSICFGR_CSITRIM_MASK	GENMASK(12, 8)
+#define RCC_CSICFGR_CSICAL_MASK		GENMASK(23, 16)
+#define RCC_CSICFGR_CSITRIM_SHIFT	8
+#define RCC_CSICFGR_CSICAL_SHIFT	16
+
+/* RCC_MCO1CFGR register fields */
+#define RCC_MCO1CFGR_MCO1SEL_MASK	GENMASK(2, 0)
+#define RCC_MCO1CFGR_MCO1DIV_MASK	GENMASK(7, 4)
+#define RCC_MCO1CFGR_MCO1ON		BIT(12)
+#define RCC_MCO1CFGR_MCO1SEL_SHIFT	0
+#define RCC_MCO1CFGR_MCO1DIV_SHIFT	4
+
+/* RCC_MCO2CFGR register fields */
+#define RCC_MCO2CFGR_MCO2SEL_MASK	GENMASK(2, 0)
+#define RCC_MCO2CFGR_MCO2DIV_MASK	GENMASK(7, 4)
+#define RCC_MCO2CFGR_MCO2ON		BIT(12)
+#define RCC_MCO2CFGR_MCO2SEL_SHIFT	0
+#define RCC_MCO2CFGR_MCO2DIV_SHIFT	4
+
+/* RCC_DBGCFGR register fields */
+#define RCC_DBGCFGR_TRACEDIV_MASK	GENMASK(2, 0)
+#define RCC_DBGCFGR_DBGCKEN		BIT(8)
+#define RCC_DBGCFGR_TRACECKEN		BIT(9)
+#define RCC_DBGCFGR_DBGRST		BIT(12)
+#define RCC_DBGCFGR_TRACEDIV_SHIFT	0
+
+/* RCC_RCK12SELR register fields */
+#define RCC_RCK12SELR_PLL12SRC_MASK	GENMASK(1, 0)
+#define RCC_RCK12SELR_PLL12SRCRDY	BIT(31)
+#define RCC_RCK12SELR_PLL12SRC_SHIFT	0
+
+/* RCC_RCK3SELR register fields */
+#define RCC_RCK3SELR_PLL3SRC_MASK	GENMASK(1, 0)
+#define RCC_RCK3SELR_PLL3SRCRDY		BIT(31)
+#define RCC_RCK3SELR_PLL3SRC_SHIFT	0
+
+/* RCC_RCK4SELR register fields */
+#define RCC_RCK4SELR_PLL4SRC_MASK	GENMASK(1, 0)
+#define RCC_RCK4SELR_PLL4SRCRDY		BIT(31)
+#define RCC_RCK4SELR_PLL4SRC_SHIFT	0
+
+/* RCC_PLL1CR register fields */
+#define RCC_PLL1CR_PLLON		BIT(0)
+#define RCC_PLL1CR_PLL1RDY		BIT(1)
+#define RCC_PLL1CR_SSCG_CTRL		BIT(2)
+#define RCC_PLL1CR_DIVPEN		BIT(4)
+#define RCC_PLL1CR_DIVQEN		BIT(5)
+#define RCC_PLL1CR_DIVREN		BIT(6)
+
+/* RCC_PLL1CFGR1 register fields */
+#define RCC_PLL1CFGR1_DIVN_MASK		GENMASK(8, 0)
+#define RCC_PLL1CFGR1_DIVM1_MASK	GENMASK(21, 16)
+#define RCC_PLL1CFGR1_DIVN_SHIFT	0
+#define RCC_PLL1CFGR1_DIVM1_SHIFT	16
+
+/* RCC_PLL1CFGR2 register fields */
+#define RCC_PLL1CFGR2_DIVP_MASK		GENMASK(6, 0)
+#define RCC_PLL1CFGR2_DIVQ_MASK		GENMASK(14, 8)
+#define RCC_PLL1CFGR2_DIVR_MASK		GENMASK(22, 16)
+#define RCC_PLL1CFGR2_DIVP_SHIFT	0
+#define RCC_PLL1CFGR2_DIVQ_SHIFT	8
+#define RCC_PLL1CFGR2_DIVR_SHIFT	16
+
+/* RCC_PLL1FRACR register fields */
+#define RCC_PLL1FRACR_FRACV_MASK	GENMASK(15, 3)
+#define RCC_PLL1FRACR_FRACLE		BIT(16)
+#define RCC_PLL1FRACR_FRACV_SHIFT	3
+
+/* RCC_PLL1CSGR register fields */
+#define RCC_PLL1CSGR_MOD_PER_MASK	GENMASK(12, 0)
+#define RCC_PLL1CSGR_TPDFN_DIS		BIT(13)
+#define RCC_PLL1CSGR_RPDFN_DIS		BIT(14)
+#define RCC_PLL1CSGR_SSCG_MODE		BIT(15)
+#define RCC_PLL1CSGR_INC_STEP_MASK	GENMASK(30, 16)
+#define RCC_PLL1CSGR_MOD_PER_SHIFT	0
+#define RCC_PLL1CSGR_INC_STEP_SHIFT	16
+
+/* RCC_PLL2CR register fields */
+#define RCC_PLL2CR_PLLON		BIT(0)
+#define RCC_PLL2CR_PLL2RDY		BIT(1)
+#define RCC_PLL2CR_SSCG_CTRL		BIT(2)
+#define RCC_PLL2CR_DIVPEN		BIT(4)
+#define RCC_PLL2CR_DIVQEN		BIT(5)
+#define RCC_PLL2CR_DIVREN		BIT(6)
+
+/* RCC_PLL2CFGR1 register fields */
+#define RCC_PLL2CFGR1_DIVN_MASK		GENMASK(8, 0)
+#define RCC_PLL2CFGR1_DIVM2_MASK	GENMASK(21, 16)
+#define RCC_PLL2CFGR1_DIVN_SHIFT	0
+#define RCC_PLL2CFGR1_DIVM2_SHIFT	16
+
+/* RCC_PLL2CFGR2 register fields */
+#define RCC_PLL2CFGR2_DIVP_MASK		GENMASK(6, 0)
+#define RCC_PLL2CFGR2_DIVQ_MASK		GENMASK(14, 8)
+#define RCC_PLL2CFGR2_DIVR_MASK		GENMASK(22, 16)
+#define RCC_PLL2CFGR2_DIVP_SHIFT	0
+#define RCC_PLL2CFGR2_DIVQ_SHIFT	8
+#define RCC_PLL2CFGR2_DIVR_SHIFT	16
+
+/* RCC_PLL2FRACR register fields */
+#define RCC_PLL2FRACR_FRACV_MASK	GENMASK(15, 3)
+#define RCC_PLL2FRACR_FRACLE		BIT(16)
+#define RCC_PLL2FRACR_FRACV_SHIFT	3
+
+/* RCC_PLL2CSGR register fields */
+#define RCC_PLL2CSGR_MOD_PER_MASK	GENMASK(12, 0)
+#define RCC_PLL2CSGR_TPDFN_DIS		BIT(13)
+#define RCC_PLL2CSGR_RPDFN_DIS		BIT(14)
+#define RCC_PLL2CSGR_SSCG_MODE		BIT(15)
+#define RCC_PLL2CSGR_INC_STEP_MASK	GENMASK(30, 16)
+#define RCC_PLL2CSGR_MOD_PER_SHIFT	0
+#define RCC_PLL2CSGR_INC_STEP_SHIFT	16
+
+/* RCC_PLL3CR register fields */
+#define RCC_PLL3CR_PLLON		BIT(0)
+#define RCC_PLL3CR_PLL3RDY		BIT(1)
+#define RCC_PLL3CR_SSCG_CTRL		BIT(2)
+#define RCC_PLL3CR_DIVPEN		BIT(4)
+#define RCC_PLL3CR_DIVQEN		BIT(5)
+#define RCC_PLL3CR_DIVREN		BIT(6)
+
+/* RCC_PLL3CFGR1 register fields */
+#define RCC_PLL3CFGR1_DIVN_MASK		GENMASK(8, 0)
+#define RCC_PLL3CFGR1_DIVM3_MASK	GENMASK(21, 16)
+#define RCC_PLL3CFGR1_IFRGE_MASK	GENMASK(25, 24)
+#define RCC_PLL3CFGR1_DIVN_SHIFT	0
+#define RCC_PLL3CFGR1_DIVM3_SHIFT	16
+#define RCC_PLL3CFGR1_IFRGE_SHIFT	24
+
+/* RCC_PLL3CFGR2 register fields */
+#define RCC_PLL3CFGR2_DIVP_MASK		GENMASK(6, 0)
+#define RCC_PLL3CFGR2_DIVQ_MASK		GENMASK(14, 8)
+#define RCC_PLL3CFGR2_DIVR_MASK		GENMASK(22, 16)
+#define RCC_PLL3CFGR2_DIVP_SHIFT	0
+#define RCC_PLL3CFGR2_DIVQ_SHIFT	8
+#define RCC_PLL3CFGR2_DIVR_SHIFT	16
+
+/* RCC_PLL3FRACR register fields */
+#define RCC_PLL3FRACR_FRACV_MASK	GENMASK(15, 3)
+#define RCC_PLL3FRACR_FRACLE		BIT(16)
+#define RCC_PLL3FRACR_FRACV_SHIFT	3
+
+/* RCC_PLL3CSGR register fields */
+#define RCC_PLL3CSGR_MOD_PER_MASK	GENMASK(12, 0)
+#define RCC_PLL3CSGR_TPDFN_DIS		BIT(13)
+#define RCC_PLL3CSGR_RPDFN_DIS		BIT(14)
+#define RCC_PLL3CSGR_SSCG_MODE		BIT(15)
+#define RCC_PLL3CSGR_INC_STEP_MASK	GENMASK(30, 16)
+#define RCC_PLL3CSGR_MOD_PER_SHIFT	0
+#define RCC_PLL3CSGR_INC_STEP_SHIFT	16
+
+/* RCC_PLL4CR register fields */
+#define RCC_PLL4CR_PLLON		BIT(0)
+#define RCC_PLL4CR_PLL4RDY		BIT(1)
+#define RCC_PLL4CR_SSCG_CTRL		BIT(2)
+#define RCC_PLL4CR_DIVPEN		BIT(4)
+#define RCC_PLL4CR_DIVQEN		BIT(5)
+#define RCC_PLL4CR_DIVREN		BIT(6)
+
+/* RCC_PLL4CFGR1 register fields */
+#define RCC_PLL4CFGR1_DIVN_MASK		GENMASK(8, 0)
+#define RCC_PLL4CFGR1_DIVM4_MASK	GENMASK(21, 16)
+#define RCC_PLL4CFGR1_IFRGE_MASK	GENMASK(25, 24)
+#define RCC_PLL4CFGR1_DIVN_SHIFT	0
+#define RCC_PLL4CFGR1_DIVM4_SHIFT	16
+#define RCC_PLL4CFGR1_IFRGE_SHIFT	24
+
+/* RCC_PLL4CFGR2 register fields */
+#define RCC_PLL4CFGR2_DIVP_MASK		GENMASK(6, 0)
+#define RCC_PLL4CFGR2_DIVQ_MASK		GENMASK(14, 8)
+#define RCC_PLL4CFGR2_DIVR_MASK		GENMASK(22, 16)
+#define RCC_PLL4CFGR2_DIVP_SHIFT	0
+#define RCC_PLL4CFGR2_DIVQ_SHIFT	8
+#define RCC_PLL4CFGR2_DIVR_SHIFT	16
+
+/* RCC_PLL4FRACR register fields */
+#define RCC_PLL4FRACR_FRACV_MASK	GENMASK(15, 3)
+#define RCC_PLL4FRACR_FRACLE		BIT(16)
+#define RCC_PLL4FRACR_FRACV_SHIFT	3
+
+/* RCC_PLL4CSGR register fields */
+#define RCC_PLL4CSGR_MOD_PER_MASK	GENMASK(12, 0)
+#define RCC_PLL4CSGR_TPDFN_DIS		BIT(13)
+#define RCC_PLL4CSGR_RPDFN_DIS		BIT(14)
+#define RCC_PLL4CSGR_SSCG_MODE		BIT(15)
+#define RCC_PLL4CSGR_INC_STEP_MASK	GENMASK(30, 16)
+#define RCC_PLL4CSGR_MOD_PER_SHIFT	0
+#define RCC_PLL4CSGR_INC_STEP_SHIFT	16
+
+/* RCC_MPCKSELR register fields */
+#define RCC_MPCKSELR_MPUSRC_MASK	GENMASK(1, 0)
+#define RCC_MPCKSELR_MPUSRCRDY		BIT(31)
+#define RCC_MPCKSELR_MPUSRC_SHIFT	0
+
+/* RCC_ASSCKSELR register fields */
+#define RCC_ASSCKSELR_AXISSRC_MASK	GENMASK(2, 0)
+#define RCC_ASSCKSELR_AXISSRCRDY	BIT(31)
+#define RCC_ASSCKSELR_AXISSRC_SHIFT	0
+
+/* RCC_MSSCKSELR register fields */
+#define RCC_MSSCKSELR_MLAHBSSRC_MASK	GENMASK(1, 0)
+#define RCC_MSSCKSELR_MLAHBSSRCRDY	BIT(31)
+#define RCC_MSSCKSELR_MLAHBSSRC_SHIFT	0
+
+/* RCC_CPERCKSELR register fields */
+#define RCC_CPERCKSELR_CKPERSRC_MASK	GENMASK(1, 0)
+#define RCC_CPERCKSELR_CKPERSRC_SHIFT	0
+
+/* RCC_RTCDIVR register fields */
+#define RCC_RTCDIVR_RTCDIV_MASK		GENMASK(5, 0)
+#define RCC_RTCDIVR_RTCDIV_SHIFT	0
+
+/* RCC_MPCKDIVR register fields */
+#define RCC_MPCKDIVR_MPUDIV_MASK	GENMASK(3, 0)
+#define RCC_MPCKDIVR_MPUDIVRDY		BIT(31)
+#define RCC_MPCKDIVR_MPUDIV_SHIFT	0
+
+/* RCC_AXIDIVR register fields */
+#define RCC_AXIDIVR_AXIDIV_MASK		GENMASK(2, 0)
+#define RCC_AXIDIVR_AXIDIVRDY		BIT(31)
+#define RCC_AXIDIVR_AXIDIV_SHIFT	0
+
+/* RCC_MLAHBDIVR register fields */
+#define RCC_MLAHBDIVR_MLAHBDIV_MASK	GENMASK(3, 0)
+#define RCC_MLAHBDIVR_MLAHBDIVRDY	BIT(31)
+#define RCC_MLAHBDIVR_MLAHBDIV_SHIFT	0
+
+/* RCC_APB1DIVR register fields */
+#define RCC_APB1DIVR_APB1DIV_MASK	GENMASK(2, 0)
+#define RCC_APB1DIVR_APB1DIVRDY		BIT(31)
+#define RCC_APB1DIVR_APB1DIV_SHIFT	0
+
+/* RCC_APB2DIVR register fields */
+#define RCC_APB2DIVR_APB2DIV_MASK	GENMASK(2, 0)
+#define RCC_APB2DIVR_APB2DIVRDY		BIT(31)
+#define RCC_APB2DIVR_APB2DIV_SHIFT	0
+
+/* RCC_APB3DIVR register fields */
+#define RCC_APB3DIVR_APB3DIV_MASK	GENMASK(2, 0)
+#define RCC_APB3DIVR_APB3DIVRDY		BIT(31)
+#define RCC_APB3DIVR_APB3DIV_SHIFT	0
+
+/* RCC_APB4DIVR register fields */
+#define RCC_APB4DIVR_APB4DIV_MASK	GENMASK(2, 0)
+#define RCC_APB4DIVR_APB4DIVRDY		BIT(31)
+#define RCC_APB4DIVR_APB4DIV_SHIFT	0
+
+/* RCC_APB5DIVR register fields */
+#define RCC_APB5DIVR_APB5DIV_MASK	GENMASK(2, 0)
+#define RCC_APB5DIVR_APB5DIVRDY		BIT(31)
+#define RCC_APB5DIVR_APB5DIV_SHIFT	0
+
+/* RCC_APB6DIVR register fields */
+#define RCC_APB6DIVR_APB6DIV_MASK	GENMASK(2, 0)
+#define RCC_APB6DIVR_APB6DIVRDY		BIT(31)
+#define RCC_APB6DIVR_APB6DIV_SHIFT	0
+
+/* RCC_TIMG1PRER register fields */
+#define RCC_TIMG1PRER_TIMG1PRE		BIT(0)
+#define RCC_TIMG1PRER_TIMG1PRERDY	BIT(31)
+
+/* RCC_TIMG2PRER register fields */
+#define RCC_TIMG2PRER_TIMG2PRE		BIT(0)
+#define RCC_TIMG2PRER_TIMG2PRERDY	BIT(31)
+
+/* RCC_TIMG3PRER register fields */
+#define RCC_TIMG3PRER_TIMG3PRE		BIT(0)
+#define RCC_TIMG3PRER_TIMG3PRERDY	BIT(31)
+
+/* RCC_DDRITFCR register fields */
+#define RCC_DDRITFCR_DDRC1EN		BIT(0)
+#define RCC_DDRITFCR_DDRC1LPEN		BIT(1)
+#define RCC_DDRITFCR_DDRPHYCEN		BIT(4)
+#define RCC_DDRITFCR_DDRPHYCLPEN	BIT(5)
+#define RCC_DDRITFCR_DDRCAPBEN		BIT(6)
+#define RCC_DDRITFCR_DDRCAPBLPEN	BIT(7)
+#define RCC_DDRITFCR_AXIDCGEN		BIT(8)
+#define RCC_DDRITFCR_DDRPHYCAPBEN	BIT(9)
+#define RCC_DDRITFCR_DDRPHYCAPBLPEN	BIT(10)
+#define RCC_DDRITFCR_KERDCG_DLY_MASK	GENMASK(13, 11)
+#define RCC_DDRITFCR_DDRCAPBRST		BIT(14)
+#define RCC_DDRITFCR_DDRCAXIRST		BIT(15)
+#define RCC_DDRITFCR_DDRCORERST		BIT(16)
+#define RCC_DDRITFCR_DPHYAPBRST		BIT(17)
+#define RCC_DDRITFCR_DPHYRST		BIT(18)
+#define RCC_DDRITFCR_DPHYCTLRST		BIT(19)
+#define RCC_DDRITFCR_DDRCKMOD_MASK	GENMASK(22, 20)
+#define RCC_DDRITFCR_GSKPMOD		BIT(23)
+#define RCC_DDRITFCR_GSKPCTRL		BIT(24)
+#define RCC_DDRITFCR_DFILP_WIDTH_MASK	GENMASK(27, 25)
+#define RCC_DDRITFCR_GSKP_DUR_MASK	GENMASK(31, 28)
+#define RCC_DDRITFCR_KERDCG_DLY_SHIFT	11
+#define RCC_DDRITFCR_DDRCKMOD_SHIFT	20
+#define RCC_DDRITFCR_DFILP_WIDTH_SHIFT	25
+#define RCC_DDRITFCR_GSKP_DUR_SHIFT	28
+
+/* RCC_I2C12CKSELR register fields */
+#define RCC_I2C12CKSELR_I2C12SRC_MASK	GENMASK(2, 0)
+#define RCC_I2C12CKSELR_I2C12SRC_SHIFT	0
+
+/* RCC_I2C345CKSELR register fields */
+#define RCC_I2C345CKSELR_I2C3SRC_MASK	GENMASK(2, 0)
+#define RCC_I2C345CKSELR_I2C4SRC_MASK	GENMASK(5, 3)
+#define RCC_I2C345CKSELR_I2C5SRC_MASK	GENMASK(8, 6)
+#define RCC_I2C345CKSELR_I2C3SRC_SHIFT	0
+#define RCC_I2C345CKSELR_I2C4SRC_SHIFT	3
+#define RCC_I2C345CKSELR_I2C5SRC_SHIFT	6
+
+/* RCC_SPI2S1CKSELR register fields */
+#define RCC_SPI2S1CKSELR_SPI1SRC_MASK	GENMASK(2, 0)
+#define RCC_SPI2S1CKSELR_SPI1SRC_SHIFT	0
+
+/* RCC_SPI2S23CKSELR register fields */
+#define RCC_SPI2S23CKSELR_SPI23SRC_MASK	GENMASK(2, 0)
+#define RCC_SPI2S23CKSELR_SPI23SRC_SHIFT	0
+
+/* RCC_SPI45CKSELR register fields */
+#define RCC_SPI45CKSELR_SPI4SRC_MASK	GENMASK(2, 0)
+#define RCC_SPI45CKSELR_SPI5SRC_MASK	GENMASK(5, 3)
+#define RCC_SPI45CKSELR_SPI4SRC_SHIFT	0
+#define RCC_SPI45CKSELR_SPI5SRC_SHIFT	3
+
+/* RCC_UART12CKSELR register fields */
+#define RCC_UART12CKSELR_UART1SRC_MASK	GENMASK(2, 0)
+#define RCC_UART12CKSELR_UART2SRC_MASK	GENMASK(5, 3)
+#define RCC_UART12CKSELR_UART1SRC_SHIFT	0
+#define RCC_UART12CKSELR_UART2SRC_SHIFT	3
+
+/* RCC_UART35CKSELR register fields */
+#define RCC_UART35CKSELR_UART35SRC_MASK	GENMASK(2, 0)
+#define RCC_UART35CKSELR_UART35SRC_SHIFT	0
+
+/* RCC_UART4CKSELR register fields */
+#define RCC_UART4CKSELR_UART4SRC_MASK	GENMASK(2, 0)
+#define RCC_UART4CKSELR_UART4SRC_SHIFT	0
+
+/* RCC_UART6CKSELR register fields */
+#define RCC_UART6CKSELR_UART6SRC_MASK	GENMASK(2, 0)
+#define RCC_UART6CKSELR_UART6SRC_SHIFT	0
+
+/* RCC_UART78CKSELR register fields */
+#define RCC_UART78CKSELR_UART78SRC_MASK	GENMASK(2, 0)
+#define RCC_UART78CKSELR_UART78SRC_SHIFT	0
+
+/* RCC_LPTIM1CKSELR register fields */
+#define RCC_LPTIM1CKSELR_LPTIM1SRC_MASK	GENMASK(2, 0)
+#define RCC_LPTIM1CKSELR_LPTIM1SRC_SHIFT	0
+
+/* RCC_LPTIM23CKSELR register fields */
+#define RCC_LPTIM23CKSELR_LPTIM2SRC_MASK	GENMASK(2, 0)
+#define RCC_LPTIM23CKSELR_LPTIM3SRC_MASK	GENMASK(5, 3)
+#define RCC_LPTIM23CKSELR_LPTIM2SRC_SHIFT	0
+#define RCC_LPTIM23CKSELR_LPTIM3SRC_SHIFT	3
+
+/* RCC_LPTIM45CKSELR register fields */
+#define RCC_LPTIM45CKSELR_LPTIM45SRC_MASK	GENMASK(2, 0)
+#define RCC_LPTIM45CKSELR_LPTIM45SRC_SHIFT	0
+
+/* RCC_SAI1CKSELR register fields */
+#define RCC_SAI1CKSELR_SAI1SRC_MASK	GENMASK(2, 0)
+#define RCC_SAI1CKSELR_SAI1SRC_SHIFT	0
+
+/* RCC_SAI2CKSELR register fields */
+#define RCC_SAI2CKSELR_SAI2SRC_MASK	GENMASK(2, 0)
+#define RCC_SAI2CKSELR_SAI2SRC_SHIFT	0
+
+/* RCC_FDCANCKSELR register fields */
+#define RCC_FDCANCKSELR_FDCANSRC_MASK	GENMASK(1, 0)
+#define RCC_FDCANCKSELR_FDCANSRC_SHIFT	0
+
+/* RCC_SPDIFCKSELR register fields */
+#define RCC_SPDIFCKSELR_SPDIFSRC_MASK	GENMASK(1, 0)
+#define RCC_SPDIFCKSELR_SPDIFSRC_SHIFT	0
+
+/* RCC_ADC12CKSELR register fields */
+#define RCC_ADC12CKSELR_ADC1SRC_MASK	GENMASK(1, 0)
+#define RCC_ADC12CKSELR_ADC2SRC_MASK	GENMASK(3, 2)
+#define RCC_ADC12CKSELR_ADC1SRC_SHIFT	0
+#define RCC_ADC12CKSELR_ADC2SRC_SHIFT	2
+
+/* RCC_SDMMC12CKSELR register fields */
+#define RCC_SDMMC12CKSELR_SDMMC1SRC_MASK	GENMASK(2, 0)
+#define RCC_SDMMC12CKSELR_SDMMC2SRC_MASK	GENMASK(5, 3)
+#define RCC_SDMMC12CKSELR_SDMMC1SRC_SHIFT	0
+#define RCC_SDMMC12CKSELR_SDMMC2SRC_SHIFT	3
+
+/* RCC_ETH12CKSELR register fields */
+#define RCC_ETH12CKSELR_ETH1SRC_MASK	GENMASK(1, 0)
+#define RCC_ETH12CKSELR_ETH1PTPDIV_MASK	GENMASK(7, 4)
+#define RCC_ETH12CKSELR_ETH2SRC_MASK	GENMASK(9, 8)
+#define RCC_ETH12CKSELR_ETH2PTPDIV_MASK	GENMASK(15, 12)
+#define RCC_ETH12CKSELR_ETH1SRC_SHIFT	0
+#define RCC_ETH12CKSELR_ETH1PTPDIV_SHIFT	4
+#define RCC_ETH12CKSELR_ETH2SRC_SHIFT	8
+#define RCC_ETH12CKSELR_ETH2PTPDIV_SHIFT	12
+
+/* RCC_USBCKSELR register fields */
+#define RCC_USBCKSELR_USBPHYSRC_MASK	GENMASK(1, 0)
+#define RCC_USBCKSELR_USBOSRC		BIT(4)
+#define RCC_USBCKSELR_USBPHYSRC_SHIFT	0
+
+/* RCC_QSPICKSELR register fields */
+#define RCC_QSPICKSELR_QSPISRC_MASK	GENMASK(1, 0)
+#define RCC_QSPICKSELR_QSPISRC_SHIFT	0
+
+/* RCC_FMCCKSELR register fields */
+#define RCC_FMCCKSELR_FMCSRC_MASK	GENMASK(1, 0)
+#define RCC_FMCCKSELR_FMCSRC_SHIFT	0
+
+/* RCC_RNG1CKSELR register fields */
+#define RCC_RNG1CKSELR_RNG1SRC_MASK	GENMASK(1, 0)
+#define RCC_RNG1CKSELR_RNG1SRC_SHIFT	0
+
+/* RCC_STGENCKSELR register fields */
+#define RCC_STGENCKSELR_STGENSRC_MASK	GENMASK(1, 0)
+#define RCC_STGENCKSELR_STGENSRC_SHIFT	0
+
+/* RCC_DCMIPPCKSELR register fields */
+#define RCC_DCMIPPCKSELR_DCMIPPSRC_MASK	GENMASK(1, 0)
+#define RCC_DCMIPPCKSELR_DCMIPPSRC_SHIFT	0
+
+/* RCC_SAESCKSELR register fields */
+#define RCC_SAESCKSELR_SAESSRC_MASK	GENMASK(1, 0)
+#define RCC_SAESCKSELR_SAESSRC_SHIFT	0
+
+/* RCC_APB1RSTSETR register fields */
+#define RCC_APB1RSTSETR_TIM2RST		BIT(0)
+#define RCC_APB1RSTSETR_TIM3RST		BIT(1)
+#define RCC_APB1RSTSETR_TIM4RST		BIT(2)
+#define RCC_APB1RSTSETR_TIM5RST		BIT(3)
+#define RCC_APB1RSTSETR_TIM6RST		BIT(4)
+#define RCC_APB1RSTSETR_TIM7RST		BIT(5)
+#define RCC_APB1RSTSETR_LPTIM1RST	BIT(9)
+#define RCC_APB1RSTSETR_SPI2RST		BIT(11)
+#define RCC_APB1RSTSETR_SPI3RST		BIT(12)
+#define RCC_APB1RSTSETR_USART3RST	BIT(15)
+#define RCC_APB1RSTSETR_UART4RST	BIT(16)
+#define RCC_APB1RSTSETR_UART5RST	BIT(17)
+#define RCC_APB1RSTSETR_UART7RST	BIT(18)
+#define RCC_APB1RSTSETR_UART8RST	BIT(19)
+#define RCC_APB1RSTSETR_I2C1RST		BIT(21)
+#define RCC_APB1RSTSETR_I2C2RST		BIT(22)
+#define RCC_APB1RSTSETR_SPDIFRST	BIT(26)
+
+/* RCC_APB1RSTCLRR register fields */
+#define RCC_APB1RSTCLRR_TIM2RST		BIT(0)
+#define RCC_APB1RSTCLRR_TIM3RST		BIT(1)
+#define RCC_APB1RSTCLRR_TIM4RST		BIT(2)
+#define RCC_APB1RSTCLRR_TIM5RST		BIT(3)
+#define RCC_APB1RSTCLRR_TIM6RST		BIT(4)
+#define RCC_APB1RSTCLRR_TIM7RST		BIT(5)
+#define RCC_APB1RSTCLRR_LPTIM1RST	BIT(9)
+#define RCC_APB1RSTCLRR_SPI2RST		BIT(11)
+#define RCC_APB1RSTCLRR_SPI3RST		BIT(12)
+#define RCC_APB1RSTCLRR_USART3RST	BIT(15)
+#define RCC_APB1RSTCLRR_UART4RST	BIT(16)
+#define RCC_APB1RSTCLRR_UART5RST	BIT(17)
+#define RCC_APB1RSTCLRR_UART7RST	BIT(18)
+#define RCC_APB1RSTCLRR_UART8RST	BIT(19)
+#define RCC_APB1RSTCLRR_I2C1RST		BIT(21)
+#define RCC_APB1RSTCLRR_I2C2RST		BIT(22)
+#define RCC_APB1RSTCLRR_SPDIFRST	BIT(26)
+
+/* RCC_APB2RSTSETR register fields */
+#define RCC_APB2RSTSETR_TIM1RST		BIT(0)
+#define RCC_APB2RSTSETR_TIM8RST		BIT(1)
+#define RCC_APB2RSTSETR_SPI1RST		BIT(8)
+#define RCC_APB2RSTSETR_USART6RST	BIT(13)
+#define RCC_APB2RSTSETR_SAI1RST		BIT(16)
+#define RCC_APB2RSTSETR_SAI2RST		BIT(17)
+#define RCC_APB2RSTSETR_DFSDMRST	BIT(20)
+#define RCC_APB2RSTSETR_FDCANRST	BIT(24)
+
+/* RCC_APB2RSTCLRR register fields */
+#define RCC_APB2RSTCLRR_TIM1RST		BIT(0)
+#define RCC_APB2RSTCLRR_TIM8RST		BIT(1)
+#define RCC_APB2RSTCLRR_SPI1RST		BIT(8)
+#define RCC_APB2RSTCLRR_USART6RST	BIT(13)
+#define RCC_APB2RSTCLRR_SAI1RST		BIT(16)
+#define RCC_APB2RSTCLRR_SAI2RST		BIT(17)
+#define RCC_APB2RSTCLRR_DFSDMRST	BIT(20)
+#define RCC_APB2RSTCLRR_FDCANRST	BIT(24)
+
+/* RCC_APB3RSTSETR register fields */
+#define RCC_APB3RSTSETR_LPTIM2RST	BIT(0)
+#define RCC_APB3RSTSETR_LPTIM3RST	BIT(1)
+#define RCC_APB3RSTSETR_LPTIM4RST	BIT(2)
+#define RCC_APB3RSTSETR_LPTIM5RST	BIT(3)
+#define RCC_APB3RSTSETR_SYSCFGRST	BIT(11)
+#define RCC_APB3RSTSETR_VREFRST		BIT(13)
+#define RCC_APB3RSTSETR_DTSRST		BIT(16)
+#define RCC_APB3RSTSETR_PMBCTRLRST	BIT(17)
+
+/* RCC_APB3RSTCLRR register fields */
+#define RCC_APB3RSTCLRR_LPTIM2RST	BIT(0)
+#define RCC_APB3RSTCLRR_LPTIM3RST	BIT(1)
+#define RCC_APB3RSTCLRR_LPTIM4RST	BIT(2)
+#define RCC_APB3RSTCLRR_LPTIM5RST	BIT(3)
+#define RCC_APB3RSTCLRR_SYSCFGRST	BIT(11)
+#define RCC_APB3RSTCLRR_VREFRST		BIT(13)
+#define RCC_APB3RSTCLRR_DTSRST		BIT(16)
+#define RCC_APB3RSTCLRR_PMBCTRLRST	BIT(17)
+
+/* RCC_APB4RSTSETR register fields */
+#define RCC_APB4RSTSETR_LTDCRST		BIT(0)
+#define RCC_APB4RSTSETR_DCMIPPRST	BIT(1)
+#define RCC_APB4RSTSETR_DDRPERFMRST	BIT(8)
+#define RCC_APB4RSTSETR_USBPHYRST	BIT(16)
+
+/* RCC_APB4RSTCLRR register fields */
+#define RCC_APB4RSTCLRR_LTDCRST		BIT(0)
+#define RCC_APB4RSTCLRR_DCMIPPRST	BIT(1)
+#define RCC_APB4RSTCLRR_DDRPERFMRST	BIT(8)
+#define RCC_APB4RSTCLRR_USBPHYRST	BIT(16)
+
+/* RCC_APB5RSTSETR register fields */
+#define RCC_APB5RSTSETR_STGENRST	BIT(20)
+
+/* RCC_APB5RSTCLRR register fields */
+#define RCC_APB5RSTCLRR_STGENRST	BIT(20)
+
+/* RCC_APB6RSTSETR register fields */
+#define RCC_APB6RSTSETR_USART1RST	BIT(0)
+#define RCC_APB6RSTSETR_USART2RST	BIT(1)
+#define RCC_APB6RSTSETR_SPI4RST		BIT(2)
+#define RCC_APB6RSTSETR_SPI5RST		BIT(3)
+#define RCC_APB6RSTSETR_I2C3RST		BIT(4)
+#define RCC_APB6RSTSETR_I2C4RST		BIT(5)
+#define RCC_APB6RSTSETR_I2C5RST		BIT(6)
+#define RCC_APB6RSTSETR_TIM12RST	BIT(7)
+#define RCC_APB6RSTSETR_TIM13RST	BIT(8)
+#define RCC_APB6RSTSETR_TIM14RST	BIT(9)
+#define RCC_APB6RSTSETR_TIM15RST	BIT(10)
+#define RCC_APB6RSTSETR_TIM16RST	BIT(11)
+#define RCC_APB6RSTSETR_TIM17RST	BIT(12)
+
+/* RCC_APB6RSTCLRR register fields */
+#define RCC_APB6RSTCLRR_USART1RST	BIT(0)
+#define RCC_APB6RSTCLRR_USART2RST	BIT(1)
+#define RCC_APB6RSTCLRR_SPI4RST		BIT(2)
+#define RCC_APB6RSTCLRR_SPI5RST		BIT(3)
+#define RCC_APB6RSTCLRR_I2C3RST		BIT(4)
+#define RCC_APB6RSTCLRR_I2C4RST		BIT(5)
+#define RCC_APB6RSTCLRR_I2C5RST		BIT(6)
+#define RCC_APB6RSTCLRR_TIM12RST	BIT(7)
+#define RCC_APB6RSTCLRR_TIM13RST	BIT(8)
+#define RCC_APB6RSTCLRR_TIM14RST	BIT(9)
+#define RCC_APB6RSTCLRR_TIM15RST	BIT(10)
+#define RCC_APB6RSTCLRR_TIM16RST	BIT(11)
+#define RCC_APB6RSTCLRR_TIM17RST	BIT(12)
+
+/* RCC_AHB2RSTSETR register fields */
+#define RCC_AHB2RSTSETR_DMA1RST		BIT(0)
+#define RCC_AHB2RSTSETR_DMA2RST		BIT(1)
+#define RCC_AHB2RSTSETR_DMAMUX1RST	BIT(2)
+#define RCC_AHB2RSTSETR_DMA3RST		BIT(3)
+#define RCC_AHB2RSTSETR_DMAMUX2RST	BIT(4)
+#define RCC_AHB2RSTSETR_ADC1RST		BIT(5)
+#define RCC_AHB2RSTSETR_ADC2RST		BIT(6)
+#define RCC_AHB2RSTSETR_USBORST		BIT(8)
+
+/* RCC_AHB2RSTCLRR register fields */
+#define RCC_AHB2RSTCLRR_DMA1RST		BIT(0)
+#define RCC_AHB2RSTCLRR_DMA2RST		BIT(1)
+#define RCC_AHB2RSTCLRR_DMAMUX1RST	BIT(2)
+#define RCC_AHB2RSTCLRR_DMA3RST		BIT(3)
+#define RCC_AHB2RSTCLRR_DMAMUX2RST	BIT(4)
+#define RCC_AHB2RSTCLRR_ADC1RST		BIT(5)
+#define RCC_AHB2RSTCLRR_ADC2RST		BIT(6)
+#define RCC_AHB2RSTCLRR_USBORST		BIT(8)
+
+/* RCC_AHB4RSTSETR register fields */
+#define RCC_AHB4RSTSETR_GPIOARST	BIT(0)
+#define RCC_AHB4RSTSETR_GPIOBRST	BIT(1)
+#define RCC_AHB4RSTSETR_GPIOCRST	BIT(2)
+#define RCC_AHB4RSTSETR_GPIODRST	BIT(3)
+#define RCC_AHB4RSTSETR_GPIOERST	BIT(4)
+#define RCC_AHB4RSTSETR_GPIOFRST	BIT(5)
+#define RCC_AHB4RSTSETR_GPIOGRST	BIT(6)
+#define RCC_AHB4RSTSETR_GPIOHRST	BIT(7)
+#define RCC_AHB4RSTSETR_GPIOIRST	BIT(8)
+#define RCC_AHB4RSTSETR_TSCRST		BIT(15)
+
+/* RCC_AHB4RSTCLRR register fields */
+#define RCC_AHB4RSTCLRR_GPIOARST	BIT(0)
+#define RCC_AHB4RSTCLRR_GPIOBRST	BIT(1)
+#define RCC_AHB4RSTCLRR_GPIOCRST	BIT(2)
+#define RCC_AHB4RSTCLRR_GPIODRST	BIT(3)
+#define RCC_AHB4RSTCLRR_GPIOERST	BIT(4)
+#define RCC_AHB4RSTCLRR_GPIOFRST	BIT(5)
+#define RCC_AHB4RSTCLRR_GPIOGRST	BIT(6)
+#define RCC_AHB4RSTCLRR_GPIOHRST	BIT(7)
+#define RCC_AHB4RSTCLRR_GPIOIRST	BIT(8)
+#define RCC_AHB4RSTCLRR_TSCRST		BIT(15)
+
+/* RCC_AHB5RSTSETR register fields */
+#define RCC_AHB5RSTSETR_PKARST		BIT(2)
+#define RCC_AHB5RSTSETR_SAESRST		BIT(3)
+#define RCC_AHB5RSTSETR_CRYP1RST	BIT(4)
+#define RCC_AHB5RSTSETR_HASH1RST	BIT(5)
+#define RCC_AHB5RSTSETR_RNG1RST		BIT(6)
+#define RCC_AHB5RSTSETR_AXIMCRST	BIT(16)
+
+/* RCC_AHB5RSTCLRR register fields */
+#define RCC_AHB5RSTCLRR_PKARST		BIT(2)
+#define RCC_AHB5RSTCLRR_SAESRST		BIT(3)
+#define RCC_AHB5RSTCLRR_CRYP1RST	BIT(4)
+#define RCC_AHB5RSTCLRR_HASH1RST	BIT(5)
+#define RCC_AHB5RSTCLRR_RNG1RST		BIT(6)
+#define RCC_AHB5RSTCLRR_AXIMCRST	BIT(16)
+
+/* RCC_AHB6RSTSETR register fields */
+#define RCC_AHB6RSTSETR_MDMARST		BIT(0)
+#define RCC_AHB6RSTSETR_MCERST		BIT(1)
+#define RCC_AHB6RSTSETR_ETH1MACRST	BIT(10)
+#define RCC_AHB6RSTSETR_FMCRST		BIT(12)
+#define RCC_AHB6RSTSETR_QSPIRST		BIT(14)
+#define RCC_AHB6RSTSETR_SDMMC1RST	BIT(16)
+#define RCC_AHB6RSTSETR_SDMMC2RST	BIT(17)
+#define RCC_AHB6RSTSETR_CRC1RST		BIT(20)
+#define RCC_AHB6RSTSETR_USBHRST		BIT(24)
+#define RCC_AHB6RSTSETR_ETH2MACRST	BIT(30)
+
+/* RCC_AHB6RSTCLRR register fields */
+#define RCC_AHB6RSTCLRR_MDMARST		BIT(0)
+#define RCC_AHB6RSTCLRR_MCERST		BIT(1)
+#define RCC_AHB6RSTCLRR_ETH1MACRST	BIT(10)
+#define RCC_AHB6RSTCLRR_FMCRST		BIT(12)
+#define RCC_AHB6RSTCLRR_QSPIRST		BIT(14)
+#define RCC_AHB6RSTCLRR_SDMMC1RST	BIT(16)
+#define RCC_AHB6RSTCLRR_SDMMC2RST	BIT(17)
+#define RCC_AHB6RSTCLRR_CRC1RST		BIT(20)
+#define RCC_AHB6RSTCLRR_USBHRST		BIT(24)
+#define RCC_AHB6RSTCLRR_ETH2MACRST	BIT(30)
+
+/* RCC_MP_APB1ENSETR register fields */
+#define RCC_MP_APB1ENSETR_TIM2EN	BIT(0)
+#define RCC_MP_APB1ENSETR_TIM3EN	BIT(1)
+#define RCC_MP_APB1ENSETR_TIM4EN	BIT(2)
+#define RCC_MP_APB1ENSETR_TIM5EN	BIT(3)
+#define RCC_MP_APB1ENSETR_TIM6EN	BIT(4)
+#define RCC_MP_APB1ENSETR_TIM7EN	BIT(5)
+#define RCC_MP_APB1ENSETR_LPTIM1EN	BIT(9)
+#define RCC_MP_APB1ENSETR_SPI2EN	BIT(11)
+#define RCC_MP_APB1ENSETR_SPI3EN	BIT(12)
+#define RCC_MP_APB1ENSETR_USART3EN	BIT(15)
+#define RCC_MP_APB1ENSETR_UART4EN	BIT(16)
+#define RCC_MP_APB1ENSETR_UART5EN	BIT(17)
+#define RCC_MP_APB1ENSETR_UART7EN	BIT(18)
+#define RCC_MP_APB1ENSETR_UART8EN	BIT(19)
+#define RCC_MP_APB1ENSETR_I2C1EN	BIT(21)
+#define RCC_MP_APB1ENSETR_I2C2EN	BIT(22)
+#define RCC_MP_APB1ENSETR_SPDIFEN	BIT(26)
+
+/* RCC_MP_APB1ENCLRR register fields */
+#define RCC_MP_APB1ENCLRR_TIM2EN	BIT(0)
+#define RCC_MP_APB1ENCLRR_TIM3EN	BIT(1)
+#define RCC_MP_APB1ENCLRR_TIM4EN	BIT(2)
+#define RCC_MP_APB1ENCLRR_TIM5EN	BIT(3)
+#define RCC_MP_APB1ENCLRR_TIM6EN	BIT(4)
+#define RCC_MP_APB1ENCLRR_TIM7EN	BIT(5)
+#define RCC_MP_APB1ENCLRR_LPTIM1EN	BIT(9)
+#define RCC_MP_APB1ENCLRR_SPI2EN	BIT(11)
+#define RCC_MP_APB1ENCLRR_SPI3EN	BIT(12)
+#define RCC_MP_APB1ENCLRR_USART3EN	BIT(15)
+#define RCC_MP_APB1ENCLRR_UART4EN	BIT(16)
+#define RCC_MP_APB1ENCLRR_UART5EN	BIT(17)
+#define RCC_MP_APB1ENCLRR_UART7EN	BIT(18)
+#define RCC_MP_APB1ENCLRR_UART8EN	BIT(19)
+#define RCC_MP_APB1ENCLRR_I2C1EN	BIT(21)
+#define RCC_MP_APB1ENCLRR_I2C2EN	BIT(22)
+#define RCC_MP_APB1ENCLRR_SPDIFEN	BIT(26)
+
+/* RCC_MP_APB2ENSETR register fields */
+#define RCC_MP_APB2ENSETR_TIM1EN	BIT(0)
+#define RCC_MP_APB2ENSETR_TIM8EN	BIT(1)
+#define RCC_MP_APB2ENSETR_SPI1EN	BIT(8)
+#define RCC_MP_APB2ENSETR_USART6EN	BIT(13)
+#define RCC_MP_APB2ENSETR_SAI1EN	BIT(16)
+#define RCC_MP_APB2ENSETR_SAI2EN	BIT(17)
+#define RCC_MP_APB2ENSETR_DFSDMEN	BIT(20)
+#define RCC_MP_APB2ENSETR_ADFSDMEN	BIT(21)
+#define RCC_MP_APB2ENSETR_FDCANEN	BIT(24)
+
+/* RCC_MP_APB2ENCLRR register fields */
+#define RCC_MP_APB2ENCLRR_TIM1EN	BIT(0)
+#define RCC_MP_APB2ENCLRR_TIM8EN	BIT(1)
+#define RCC_MP_APB2ENCLRR_SPI1EN	BIT(8)
+#define RCC_MP_APB2ENCLRR_USART6EN	BIT(13)
+#define RCC_MP_APB2ENCLRR_SAI1EN	BIT(16)
+#define RCC_MP_APB2ENCLRR_SAI2EN	BIT(17)
+#define RCC_MP_APB2ENCLRR_DFSDMEN	BIT(20)
+#define RCC_MP_APB2ENCLRR_ADFSDMEN	BIT(21)
+#define RCC_MP_APB2ENCLRR_FDCANEN	BIT(24)
+
+/* RCC_MP_APB3ENSETR register fields */
+#define RCC_MP_APB3ENSETR_LPTIM2EN	BIT(0)
+#define RCC_MP_APB3ENSETR_LPTIM3EN	BIT(1)
+#define RCC_MP_APB3ENSETR_LPTIM4EN	BIT(2)
+#define RCC_MP_APB3ENSETR_LPTIM5EN	BIT(3)
+#define RCC_MP_APB3ENSETR_VREFEN	BIT(13)
+#define RCC_MP_APB3ENSETR_DTSEN		BIT(16)
+#define RCC_MP_APB3ENSETR_PMBCTRLEN	BIT(17)
+#define RCC_MP_APB3ENSETR_HDPEN		BIT(20)
+
+/* RCC_MP_APB3ENCLRR register fields */
+#define RCC_MP_APB3ENCLRR_LPTIM2EN	BIT(0)
+#define RCC_MP_APB3ENCLRR_LPTIM3EN	BIT(1)
+#define RCC_MP_APB3ENCLRR_LPTIM4EN	BIT(2)
+#define RCC_MP_APB3ENCLRR_LPTIM5EN	BIT(3)
+#define RCC_MP_APB3ENCLRR_VREFEN	BIT(13)
+#define RCC_MP_APB3ENCLRR_DTSEN		BIT(16)
+#define RCC_MP_APB3ENCLRR_PMBCTRLEN	BIT(17)
+#define RCC_MP_APB3ENCLRR_HDPEN		BIT(20)
+
+/* RCC_MP_S_APB3ENSETR register fields */
+#define RCC_MP_S_APB3ENSETR_SYSCFGEN	BIT(0)
+
+/* RCC_MP_S_APB3ENCLRR register fields */
+#define RCC_MP_S_APB3ENCLRR_SYSCFGEN	BIT(0)
+
+/* RCC_MP_NS_APB3ENSETR register fields */
+#define RCC_MP_NS_APB3ENSETR_SYSCFGEN	BIT(0)
+
+/* RCC_MP_NS_APB3ENCLRR register fields */
+#define RCC_MP_NS_APB3ENCLRR_SYSCFGEN	BIT(0)
+
+/* RCC_MP_APB4ENSETR register fields */
+#define RCC_MP_APB4ENSETR_DCMIPPEN	BIT(1)
+#define RCC_MP_APB4ENSETR_DDRPERFMEN	BIT(8)
+#define RCC_MP_APB4ENSETR_IWDG2APBEN	BIT(15)
+#define RCC_MP_APB4ENSETR_USBPHYEN	BIT(16)
+#define RCC_MP_APB4ENSETR_STGENROEN	BIT(20)
+
+/* RCC_MP_APB4ENCLRR register fields */
+#define RCC_MP_APB4ENCLRR_DCMIPPEN	BIT(1)
+#define RCC_MP_APB4ENCLRR_DDRPERFMEN	BIT(8)
+#define RCC_MP_APB4ENCLRR_IWDG2APBEN	BIT(15)
+#define RCC_MP_APB4ENCLRR_USBPHYEN	BIT(16)
+#define RCC_MP_APB4ENCLRR_STGENROEN	BIT(20)
+
+/* RCC_MP_S_APB4ENSETR register fields */
+#define RCC_MP_S_APB4ENSETR_LTDCEN	BIT(0)
+
+/* RCC_MP_S_APB4ENCLRR register fields */
+#define RCC_MP_S_APB4ENCLRR_LTDCEN	BIT(0)
+
+/* RCC_MP_NS_APB4ENSETR register fields */
+#define RCC_MP_NS_APB4ENSETR_LTDCEN	BIT(0)
+
+/* RCC_MP_NS_APB4ENCLRR register fields */
+#define RCC_MP_NS_APB4ENCLRR_LTDCEN	BIT(0)
+
+/* RCC_MP_APB5ENSETR register fields */
+#define RCC_MP_APB5ENSETR_RTCAPBEN	BIT(8)
+#define RCC_MP_APB5ENSETR_TZCEN		BIT(11)
+#define RCC_MP_APB5ENSETR_ETZPCEN	BIT(13)
+#define RCC_MP_APB5ENSETR_IWDG1APBEN	BIT(15)
+#define RCC_MP_APB5ENSETR_BSECEN	BIT(16)
+#define RCC_MP_APB5ENSETR_STGENCEN	BIT(20)
+
+/* RCC_MP_APB5ENCLRR register fields */
+#define RCC_MP_APB5ENCLRR_RTCAPBEN	BIT(8)
+#define RCC_MP_APB5ENCLRR_TZCEN		BIT(11)
+#define RCC_MP_APB5ENCLRR_ETZPCEN	BIT(13)
+#define RCC_MP_APB5ENCLRR_IWDG1APBEN	BIT(15)
+#define RCC_MP_APB5ENCLRR_BSECEN	BIT(16)
+#define RCC_MP_APB5ENCLRR_STGENCEN	BIT(20)
+
+/* RCC_MP_APB6ENSETR register fields */
+#define RCC_MP_APB6ENSETR_USART1EN	BIT(0)
+#define RCC_MP_APB6ENSETR_USART2EN	BIT(1)
+#define RCC_MP_APB6ENSETR_SPI4EN	BIT(2)
+#define RCC_MP_APB6ENSETR_SPI5EN	BIT(3)
+#define RCC_MP_APB6ENSETR_I2C3EN	BIT(4)
+#define RCC_MP_APB6ENSETR_I2C4EN	BIT(5)
+#define RCC_MP_APB6ENSETR_I2C5EN	BIT(6)
+#define RCC_MP_APB6ENSETR_TIM12EN	BIT(7)
+#define RCC_MP_APB6ENSETR_TIM13EN	BIT(8)
+#define RCC_MP_APB6ENSETR_TIM14EN	BIT(9)
+#define RCC_MP_APB6ENSETR_TIM15EN	BIT(10)
+#define RCC_MP_APB6ENSETR_TIM16EN	BIT(11)
+#define RCC_MP_APB6ENSETR_TIM17EN	BIT(12)
+
+/* RCC_MP_APB6ENCLRR register fields */
+#define RCC_MP_APB6ENCLRR_USART1EN	BIT(0)
+#define RCC_MP_APB6ENCLRR_USART2EN	BIT(1)
+#define RCC_MP_APB6ENCLRR_SPI4EN	BIT(2)
+#define RCC_MP_APB6ENCLRR_SPI5EN	BIT(3)
+#define RCC_MP_APB6ENCLRR_I2C3EN	BIT(4)
+#define RCC_MP_APB6ENCLRR_I2C4EN	BIT(5)
+#define RCC_MP_APB6ENCLRR_I2C5EN	BIT(6)
+#define RCC_MP_APB6ENCLRR_TIM12EN	BIT(7)
+#define RCC_MP_APB6ENCLRR_TIM13EN	BIT(8)
+#define RCC_MP_APB6ENCLRR_TIM14EN	BIT(9)
+#define RCC_MP_APB6ENCLRR_TIM15EN	BIT(10)
+#define RCC_MP_APB6ENCLRR_TIM16EN	BIT(11)
+#define RCC_MP_APB6ENCLRR_TIM17EN	BIT(12)
+
+/* RCC_MP_AHB2ENSETR register fields */
+#define RCC_MP_AHB2ENSETR_DMA1EN	BIT(0)
+#define RCC_MP_AHB2ENSETR_DMA2EN	BIT(1)
+#define RCC_MP_AHB2ENSETR_DMAMUX1EN	BIT(2)
+#define RCC_MP_AHB2ENSETR_DMA3EN	BIT(3)
+#define RCC_MP_AHB2ENSETR_DMAMUX2EN	BIT(4)
+#define RCC_MP_AHB2ENSETR_ADC1EN	BIT(5)
+#define RCC_MP_AHB2ENSETR_ADC2EN	BIT(6)
+#define RCC_MP_AHB2ENSETR_USBOEN	BIT(8)
+
+/* RCC_MP_AHB2ENCLRR register fields */
+#define RCC_MP_AHB2ENCLRR_DMA1EN	BIT(0)
+#define RCC_MP_AHB2ENCLRR_DMA2EN	BIT(1)
+#define RCC_MP_AHB2ENCLRR_DMAMUX1EN	BIT(2)
+#define RCC_MP_AHB2ENCLRR_DMA3EN	BIT(3)
+#define RCC_MP_AHB2ENCLRR_DMAMUX2EN	BIT(4)
+#define RCC_MP_AHB2ENCLRR_ADC1EN	BIT(5)
+#define RCC_MP_AHB2ENCLRR_ADC2EN	BIT(6)
+#define RCC_MP_AHB2ENCLRR_USBOEN	BIT(8)
+
+/* RCC_MP_AHB4ENSETR register fields */
+#define RCC_MP_AHB4ENSETR_TSCEN		BIT(15)
+
+/* RCC_MP_AHB4ENCLRR register fields */
+#define RCC_MP_AHB4ENCLRR_TSCEN		BIT(15)
+
+/* RCC_MP_S_AHB4ENSETR register fields */
+#define RCC_MP_S_AHB4ENSETR_GPIOAEN	BIT(0)
+#define RCC_MP_S_AHB4ENSETR_GPIOBEN	BIT(1)
+#define RCC_MP_S_AHB4ENSETR_GPIOCEN	BIT(2)
+#define RCC_MP_S_AHB4ENSETR_GPIODEN	BIT(3)
+#define RCC_MP_S_AHB4ENSETR_GPIOEEN	BIT(4)
+#define RCC_MP_S_AHB4ENSETR_GPIOFEN	BIT(5)
+#define RCC_MP_S_AHB4ENSETR_GPIOGEN	BIT(6)
+#define RCC_MP_S_AHB4ENSETR_GPIOHEN	BIT(7)
+#define RCC_MP_S_AHB4ENSETR_GPIOIEN	BIT(8)
+
+/* RCC_MP_S_AHB4ENCLRR register fields */
+#define RCC_MP_S_AHB4ENCLRR_GPIOAEN	BIT(0)
+#define RCC_MP_S_AHB4ENCLRR_GPIOBEN	BIT(1)
+#define RCC_MP_S_AHB4ENCLRR_GPIOCEN	BIT(2)
+#define RCC_MP_S_AHB4ENCLRR_GPIODEN	BIT(3)
+#define RCC_MP_S_AHB4ENCLRR_GPIOEEN	BIT(4)
+#define RCC_MP_S_AHB4ENCLRR_GPIOFEN	BIT(5)
+#define RCC_MP_S_AHB4ENCLRR_GPIOGEN	BIT(6)
+#define RCC_MP_S_AHB4ENCLRR_GPIOHEN	BIT(7)
+#define RCC_MP_S_AHB4ENCLRR_GPIOIEN	BIT(8)
+
+/* RCC_MP_NS_AHB4ENSETR register fields */
+#define RCC_MP_NS_AHB4ENSETR_GPIOAEN	BIT(0)
+#define RCC_MP_NS_AHB4ENSETR_GPIOBEN	BIT(1)
+#define RCC_MP_NS_AHB4ENSETR_GPIOCEN	BIT(2)
+#define RCC_MP_NS_AHB4ENSETR_GPIODEN	BIT(3)
+#define RCC_MP_NS_AHB4ENSETR_GPIOEEN	BIT(4)
+#define RCC_MP_NS_AHB4ENSETR_GPIOFEN	BIT(5)
+#define RCC_MP_NS_AHB4ENSETR_GPIOGEN	BIT(6)
+#define RCC_MP_NS_AHB4ENSETR_GPIOHEN	BIT(7)
+#define RCC_MP_NS_AHB4ENSETR_GPIOIEN	BIT(8)
+
+/* RCC_MP_NS_AHB4ENCLRR register fields */
+#define RCC_MP_NS_AHB4ENCLRR_GPIOAEN	BIT(0)
+#define RCC_MP_NS_AHB4ENCLRR_GPIOBEN	BIT(1)
+#define RCC_MP_NS_AHB4ENCLRR_GPIOCEN	BIT(2)
+#define RCC_MP_NS_AHB4ENCLRR_GPIODEN	BIT(3)
+#define RCC_MP_NS_AHB4ENCLRR_GPIOEEN	BIT(4)
+#define RCC_MP_NS_AHB4ENCLRR_GPIOFEN	BIT(5)
+#define RCC_MP_NS_AHB4ENCLRR_GPIOGEN	BIT(6)
+#define RCC_MP_NS_AHB4ENCLRR_GPIOHEN	BIT(7)
+#define RCC_MP_NS_AHB4ENCLRR_GPIOIEN	BIT(8)
+
+/* RCC_MP_AHB5ENSETR register fields */
+#define RCC_MP_AHB5ENSETR_PKAEN		BIT(2)
+#define RCC_MP_AHB5ENSETR_SAESEN	BIT(3)
+#define RCC_MP_AHB5ENSETR_CRYP1EN	BIT(4)
+#define RCC_MP_AHB5ENSETR_HASH1EN	BIT(5)
+#define RCC_MP_AHB5ENSETR_RNG1EN	BIT(6)
+#define RCC_MP_AHB5ENSETR_BKPSRAMEN	BIT(8)
+#define RCC_MP_AHB5ENSETR_AXIMCEN	BIT(16)
+
+/* RCC_MP_AHB5ENCLRR register fields */
+#define RCC_MP_AHB5ENCLRR_PKAEN		BIT(2)
+#define RCC_MP_AHB5ENCLRR_SAESEN	BIT(3)
+#define RCC_MP_AHB5ENCLRR_CRYP1EN	BIT(4)
+#define RCC_MP_AHB5ENCLRR_HASH1EN	BIT(5)
+#define RCC_MP_AHB5ENCLRR_RNG1EN	BIT(6)
+#define RCC_MP_AHB5ENCLRR_BKPSRAMEN	BIT(8)
+#define RCC_MP_AHB5ENCLRR_AXIMCEN	BIT(16)
+
+/* RCC_MP_AHB6ENSETR register fields */
+#define RCC_MP_AHB6ENSETR_MCEEN		BIT(1)
+#define RCC_MP_AHB6ENSETR_ETH1CKEN	BIT(7)
+#define RCC_MP_AHB6ENSETR_ETH1TXEN	BIT(8)
+#define RCC_MP_AHB6ENSETR_ETH1RXEN	BIT(9)
+#define RCC_MP_AHB6ENSETR_ETH1MACEN	BIT(10)
+#define RCC_MP_AHB6ENSETR_FMCEN		BIT(12)
+#define RCC_MP_AHB6ENSETR_QSPIEN	BIT(14)
+#define RCC_MP_AHB6ENSETR_SDMMC1EN	BIT(16)
+#define RCC_MP_AHB6ENSETR_SDMMC2EN	BIT(17)
+#define RCC_MP_AHB6ENSETR_CRC1EN	BIT(20)
+#define RCC_MP_AHB6ENSETR_USBHEN	BIT(24)
+#define RCC_MP_AHB6ENSETR_ETH2CKEN	BIT(27)
+#define RCC_MP_AHB6ENSETR_ETH2TXEN	BIT(28)
+#define RCC_MP_AHB6ENSETR_ETH2RXEN	BIT(29)
+#define RCC_MP_AHB6ENSETR_ETH2MACEN	BIT(30)
+
+/* RCC_MP_AHB6ENCLRR register fields */
+#define RCC_MP_AHB6ENCLRR_MCEEN		BIT(1)
+#define RCC_MP_AHB6ENCLRR_ETH1CKEN	BIT(7)
+#define RCC_MP_AHB6ENCLRR_ETH1TXEN	BIT(8)
+#define RCC_MP_AHB6ENCLRR_ETH1RXEN	BIT(9)
+#define RCC_MP_AHB6ENCLRR_ETH1MACEN	BIT(10)
+#define RCC_MP_AHB6ENCLRR_FMCEN		BIT(12)
+#define RCC_MP_AHB6ENCLRR_QSPIEN	BIT(14)
+#define RCC_MP_AHB6ENCLRR_SDMMC1EN	BIT(16)
+#define RCC_MP_AHB6ENCLRR_SDMMC2EN	BIT(17)
+#define RCC_MP_AHB6ENCLRR_CRC1EN	BIT(20)
+#define RCC_MP_AHB6ENCLRR_USBHEN	BIT(24)
+#define RCC_MP_AHB6ENCLRR_ETH2CKEN	BIT(27)
+#define RCC_MP_AHB6ENCLRR_ETH2TXEN	BIT(28)
+#define RCC_MP_AHB6ENCLRR_ETH2RXEN	BIT(29)
+#define RCC_MP_AHB6ENCLRR_ETH2MACEN	BIT(30)
+
+/* RCC_MP_S_AHB6ENSETR register fields */
+#define RCC_MP_S_AHB6ENSETR_MDMAEN	BIT(0)
+
+/* RCC_MP_S_AHB6ENCLRR register fields */
+#define RCC_MP_S_AHB6ENCLRR_MDMAEN	BIT(0)
+
+/* RCC_MP_NS_AHB6ENSETR register fields */
+#define RCC_MP_NS_AHB6ENSETR_MDMAEN	BIT(0)
+
+/* RCC_MP_NS_AHB6ENCLRR register fields */
+#define RCC_MP_NS_AHB6ENCLRR_MDMAEN	BIT(0)
+
+/* RCC_MP_APB1LPENSETR register fields */
+#define RCC_MP_APB1LPENSETR_TIM2LPEN	BIT(0)
+#define RCC_MP_APB1LPENSETR_TIM3LPEN	BIT(1)
+#define RCC_MP_APB1LPENSETR_TIM4LPEN	BIT(2)
+#define RCC_MP_APB1LPENSETR_TIM5LPEN	BIT(3)
+#define RCC_MP_APB1LPENSETR_TIM6LPEN	BIT(4)
+#define RCC_MP_APB1LPENSETR_TIM7LPEN	BIT(5)
+#define RCC_MP_APB1LPENSETR_LPTIM1LPEN	BIT(9)
+#define RCC_MP_APB1LPENSETR_SPI2LPEN	BIT(11)
+#define RCC_MP_APB1LPENSETR_SPI3LPEN	BIT(12)
+#define RCC_MP_APB1LPENSETR_USART3LPEN	BIT(15)
+#define RCC_MP_APB1LPENSETR_UART4LPEN	BIT(16)
+#define RCC_MP_APB1LPENSETR_UART5LPEN	BIT(17)
+#define RCC_MP_APB1LPENSETR_UART7LPEN	BIT(18)
+#define RCC_MP_APB1LPENSETR_UART8LPEN	BIT(19)
+#define RCC_MP_APB1LPENSETR_I2C1LPEN	BIT(21)
+#define RCC_MP_APB1LPENSETR_I2C2LPEN	BIT(22)
+#define RCC_MP_APB1LPENSETR_SPDIFLPEN	BIT(26)
+
+/* RCC_MP_APB1LPENCLRR register fields */
+#define RCC_MP_APB1LPENCLRR_TIM2LPEN	BIT(0)
+#define RCC_MP_APB1LPENCLRR_TIM3LPEN	BIT(1)
+#define RCC_MP_APB1LPENCLRR_TIM4LPEN	BIT(2)
+#define RCC_MP_APB1LPENCLRR_TIM5LPEN	BIT(3)
+#define RCC_MP_APB1LPENCLRR_TIM6LPEN	BIT(4)
+#define RCC_MP_APB1LPENCLRR_TIM7LPEN	BIT(5)
+#define RCC_MP_APB1LPENCLRR_LPTIM1LPEN	BIT(9)
+#define RCC_MP_APB1LPENCLRR_SPI2LPEN	BIT(11)
+#define RCC_MP_APB1LPENCLRR_SPI3LPEN	BIT(12)
+#define RCC_MP_APB1LPENCLRR_USART3LPEN	BIT(15)
+#define RCC_MP_APB1LPENCLRR_UART4LPEN	BIT(16)
+#define RCC_MP_APB1LPENCLRR_UART5LPEN	BIT(17)
+#define RCC_MP_APB1LPENCLRR_UART7LPEN	BIT(18)
+#define RCC_MP_APB1LPENCLRR_UART8LPEN	BIT(19)
+#define RCC_MP_APB1LPENCLRR_I2C1LPEN	BIT(21)
+#define RCC_MP_APB1LPENCLRR_I2C2LPEN	BIT(22)
+#define RCC_MP_APB1LPENCLRR_SPDIFLPEN	BIT(26)
+
+/* RCC_MP_APB2LPENSETR register fields */
+#define RCC_MP_APB2LPENSETR_TIM1LPEN	BIT(0)
+#define RCC_MP_APB2LPENSETR_TIM8LPEN	BIT(1)
+#define RCC_MP_APB2LPENSETR_SPI1LPEN	BIT(8)
+#define RCC_MP_APB2LPENSETR_USART6LPEN	BIT(13)
+#define RCC_MP_APB2LPENSETR_SAI1LPEN	BIT(16)
+#define RCC_MP_APB2LPENSETR_SAI2LPEN	BIT(17)
+#define RCC_MP_APB2LPENSETR_DFSDMLPEN	BIT(20)
+#define RCC_MP_APB2LPENSETR_ADFSDMLPEN	BIT(21)
+#define RCC_MP_APB2LPENSETR_FDCANLPEN	BIT(24)
+
+/* RCC_MP_APB2LPENCLRR register fields */
+#define RCC_MP_APB2LPENCLRR_TIM1LPEN	BIT(0)
+#define RCC_MP_APB2LPENCLRR_TIM8LPEN	BIT(1)
+#define RCC_MP_APB2LPENCLRR_SPI1LPEN	BIT(8)
+#define RCC_MP_APB2LPENCLRR_USART6LPEN	BIT(13)
+#define RCC_MP_APB2LPENCLRR_SAI1LPEN	BIT(16)
+#define RCC_MP_APB2LPENCLRR_SAI2LPEN	BIT(17)
+#define RCC_MP_APB2LPENCLRR_DFSDMLPEN	BIT(20)
+#define RCC_MP_APB2LPENCLRR_ADFSDMLPEN	BIT(21)
+#define RCC_MP_APB2LPENCLRR_FDCANLPEN	BIT(24)
+
+/* RCC_MP_APB3LPENSETR register fields */
+#define RCC_MP_APB3LPENSETR_LPTIM2LPEN	BIT(0)
+#define RCC_MP_APB3LPENSETR_LPTIM3LPEN	BIT(1)
+#define RCC_MP_APB3LPENSETR_LPTIM4LPEN	BIT(2)
+#define RCC_MP_APB3LPENSETR_LPTIM5LPEN	BIT(3)
+#define RCC_MP_APB3LPENSETR_VREFLPEN	BIT(13)
+#define RCC_MP_APB3LPENSETR_DTSLPEN	BIT(16)
+#define RCC_MP_APB3LPENSETR_PMBCTRLLPEN	BIT(17)
+
+/* RCC_MP_APB3LPENCLRR register fields */
+#define RCC_MP_APB3LPENCLRR_LPTIM2LPEN	BIT(0)
+#define RCC_MP_APB3LPENCLRR_LPTIM3LPEN	BIT(1)
+#define RCC_MP_APB3LPENCLRR_LPTIM4LPEN	BIT(2)
+#define RCC_MP_APB3LPENCLRR_LPTIM5LPEN	BIT(3)
+#define RCC_MP_APB3LPENCLRR_VREFLPEN	BIT(13)
+#define RCC_MP_APB3LPENCLRR_DTSLPEN	BIT(16)
+#define RCC_MP_APB3LPENCLRR_PMBCTRLLPEN	BIT(17)
+
+/* RCC_MP_S_APB3LPENSETR register fields */
+#define RCC_MP_S_APB3LPENSETR_SYSCFGLPEN	BIT(0)
+
+/* RCC_MP_S_APB3LPENCLRR register fields */
+#define RCC_MP_S_APB3LPENCLRR_SYSCFGLPEN	BIT(0)
+
+/* RCC_MP_NS_APB3LPENSETR register fields */
+#define RCC_MP_NS_APB3LPENSETR_SYSCFGLPEN	BIT(0)
+
+/* RCC_MP_NS_APB3LPENCLRR register fields */
+#define RCC_MP_NS_APB3LPENCLRR_SYSCFGLPEN	BIT(0)
+
+/* RCC_MP_APB4LPENSETR register fields */
+#define RCC_MP_APB4LPENSETR_DCMIPPLPEN		BIT(1)
+#define RCC_MP_APB4LPENSETR_DDRPERFMLPEN	BIT(8)
+#define RCC_MP_APB4LPENSETR_IWDG2APBLPEN	BIT(15)
+#define RCC_MP_APB4LPENSETR_USBPHYLPEN		BIT(16)
+#define RCC_MP_APB4LPENSETR_STGENROLPEN		BIT(20)
+#define RCC_MP_APB4LPENSETR_STGENROSTPEN	BIT(21)
+
+/* RCC_MP_APB4LPENCLRR register fields */
+#define RCC_MP_APB4LPENCLRR_DCMIPPLPEN		BIT(1)
+#define RCC_MP_APB4LPENCLRR_DDRPERFMLPEN	BIT(8)
+#define RCC_MP_APB4LPENCLRR_IWDG2APBLPEN	BIT(15)
+#define RCC_MP_APB4LPENCLRR_USBPHYLPEN		BIT(16)
+#define RCC_MP_APB4LPENCLRR_STGENROLPEN		BIT(20)
+#define RCC_MP_APB4LPENCLRR_STGENROSTPEN	BIT(21)
+
+/* RCC_MP_S_APB4LPENSETR register fields */
+#define RCC_MP_S_APB4LPENSETR_LTDCLPEN	BIT(0)
+
+/* RCC_MP_S_APB4LPENCLRR register fields */
+#define RCC_MP_S_APB4LPENCLRR_LTDCLPEN	BIT(0)
+
+/* RCC_MP_NS_APB4LPENSETR register fields */
+#define RCC_MP_NS_APB4LPENSETR_LTDCLPEN	BIT(0)
+
+/* RCC_MP_NS_APB4LPENCLRR register fields */
+#define RCC_MP_NS_APB4LPENCLRR_LTDCLPEN	BIT(0)
+
+/* RCC_MP_APB5LPENSETR register fields */
+#define RCC_MP_APB5LPENSETR_RTCAPBLPEN		BIT(8)
+#define RCC_MP_APB5LPENSETR_TZCLPEN		BIT(11)
+#define RCC_MP_APB5LPENSETR_ETZPCLPEN		BIT(13)
+#define RCC_MP_APB5LPENSETR_IWDG1APBLPEN	BIT(15)
+#define RCC_MP_APB5LPENSETR_BSECLPEN		BIT(16)
+#define RCC_MP_APB5LPENSETR_STGENCLPEN		BIT(20)
+#define RCC_MP_APB5LPENSETR_STGENCSTPEN		BIT(21)
+
+/* RCC_MP_APB5LPENCLRR register fields */
+#define RCC_MP_APB5LPENCLRR_RTCAPBLPEN		BIT(8)
+#define RCC_MP_APB5LPENCLRR_TZCLPEN		BIT(11)
+#define RCC_MP_APB5LPENCLRR_ETZPCLPEN		BIT(13)
+#define RCC_MP_APB5LPENCLRR_IWDG1APBLPEN	BIT(15)
+#define RCC_MP_APB5LPENCLRR_BSECLPEN		BIT(16)
+#define RCC_MP_APB5LPENCLRR_STGENCLPEN		BIT(20)
+#define RCC_MP_APB5LPENCLRR_STGENCSTPEN		BIT(21)
+
+/* RCC_MP_APB6LPENSETR register fields */
+#define RCC_MP_APB6LPENSETR_USART1LPEN	BIT(0)
+#define RCC_MP_APB6LPENSETR_USART2LPEN	BIT(1)
+#define RCC_MP_APB6LPENSETR_SPI4LPEN	BIT(2)
+#define RCC_MP_APB6LPENSETR_SPI5LPEN	BIT(3)
+#define RCC_MP_APB6LPENSETR_I2C3LPEN	BIT(4)
+#define RCC_MP_APB6LPENSETR_I2C4LPEN	BIT(5)
+#define RCC_MP_APB6LPENSETR_I2C5LPEN	BIT(6)
+#define RCC_MP_APB6LPENSETR_TIM12LPEN	BIT(7)
+#define RCC_MP_APB6LPENSETR_TIM13LPEN	BIT(8)
+#define RCC_MP_APB6LPENSETR_TIM14LPEN	BIT(9)
+#define RCC_MP_APB6LPENSETR_TIM15LPEN	BIT(10)
+#define RCC_MP_APB6LPENSETR_TIM16LPEN	BIT(11)
+#define RCC_MP_APB6LPENSETR_TIM17LPEN	BIT(12)
+
+/* RCC_MP_APB6LPENCLRR register fields */
+#define RCC_MP_APB6LPENCLRR_USART1LPEN	BIT(0)
+#define RCC_MP_APB6LPENCLRR_USART2LPEN	BIT(1)
+#define RCC_MP_APB6LPENCLRR_SPI4LPEN	BIT(2)
+#define RCC_MP_APB6LPENCLRR_SPI5LPEN	BIT(3)
+#define RCC_MP_APB6LPENCLRR_I2C3LPEN	BIT(4)
+#define RCC_MP_APB6LPENCLRR_I2C4LPEN	BIT(5)
+#define RCC_MP_APB6LPENCLRR_I2C5LPEN	BIT(6)
+#define RCC_MP_APB6LPENCLRR_TIM12LPEN	BIT(7)
+#define RCC_MP_APB6LPENCLRR_TIM13LPEN	BIT(8)
+#define RCC_MP_APB6LPENCLRR_TIM14LPEN	BIT(9)
+#define RCC_MP_APB6LPENCLRR_TIM15LPEN	BIT(10)
+#define RCC_MP_APB6LPENCLRR_TIM16LPEN	BIT(11)
+#define RCC_MP_APB6LPENCLRR_TIM17LPEN	BIT(12)
+
+/* RCC_MP_AHB2LPENSETR register fields */
+#define RCC_MP_AHB2LPENSETR_DMA1LPEN	BIT(0)
+#define RCC_MP_AHB2LPENSETR_DMA2LPEN	BIT(1)
+#define RCC_MP_AHB2LPENSETR_DMAMUX1LPEN	BIT(2)
+#define RCC_MP_AHB2LPENSETR_DMA3LPEN	BIT(3)
+#define RCC_MP_AHB2LPENSETR_DMAMUX2LPEN	BIT(4)
+#define RCC_MP_AHB2LPENSETR_ADC1LPEN	BIT(5)
+#define RCC_MP_AHB2LPENSETR_ADC2LPEN	BIT(6)
+#define RCC_MP_AHB2LPENSETR_USBOLPEN	BIT(8)
+
+/* RCC_MP_AHB2LPENCLRR register fields */
+#define RCC_MP_AHB2LPENCLRR_DMA1LPEN	BIT(0)
+#define RCC_MP_AHB2LPENCLRR_DMA2LPEN	BIT(1)
+#define RCC_MP_AHB2LPENCLRR_DMAMUX1LPEN	BIT(2)
+#define RCC_MP_AHB2LPENCLRR_DMA3LPEN	BIT(3)
+#define RCC_MP_AHB2LPENCLRR_DMAMUX2LPEN	BIT(4)
+#define RCC_MP_AHB2LPENCLRR_ADC1LPEN	BIT(5)
+#define RCC_MP_AHB2LPENCLRR_ADC2LPEN	BIT(6)
+#define RCC_MP_AHB2LPENCLRR_USBOLPEN	BIT(8)
+
+/* RCC_MP_AHB4LPENSETR register fields */
+#define RCC_MP_AHB4LPENSETR_TSCLPEN	BIT(15)
+
+/* RCC_MP_AHB4LPENCLRR register fields */
+#define RCC_MP_AHB4LPENCLRR_TSCLPEN	BIT(15)
+
+/* RCC_MP_S_AHB4LPENSETR register fields */
+#define RCC_MP_S_AHB4LPENSETR_GPIOALPEN	BIT(0)
+#define RCC_MP_S_AHB4LPENSETR_GPIOBLPEN	BIT(1)
+#define RCC_MP_S_AHB4LPENSETR_GPIOCLPEN	BIT(2)
+#define RCC_MP_S_AHB4LPENSETR_GPIODLPEN	BIT(3)
+#define RCC_MP_S_AHB4LPENSETR_GPIOELPEN	BIT(4)
+#define RCC_MP_S_AHB4LPENSETR_GPIOFLPEN	BIT(5)
+#define RCC_MP_S_AHB4LPENSETR_GPIOGLPEN	BIT(6)
+#define RCC_MP_S_AHB4LPENSETR_GPIOHLPEN	BIT(7)
+#define RCC_MP_S_AHB4LPENSETR_GPIOILPEN	BIT(8)
+
+/* RCC_MP_S_AHB4LPENCLRR register fields */
+#define RCC_MP_S_AHB4LPENCLRR_GPIOALPEN	BIT(0)
+#define RCC_MP_S_AHB4LPENCLRR_GPIOBLPEN	BIT(1)
+#define RCC_MP_S_AHB4LPENCLRR_GPIOCLPEN	BIT(2)
+#define RCC_MP_S_AHB4LPENCLRR_GPIODLPEN	BIT(3)
+#define RCC_MP_S_AHB4LPENCLRR_GPIOELPEN	BIT(4)
+#define RCC_MP_S_AHB4LPENCLRR_GPIOFLPEN	BIT(5)
+#define RCC_MP_S_AHB4LPENCLRR_GPIOGLPEN	BIT(6)
+#define RCC_MP_S_AHB4LPENCLRR_GPIOHLPEN	BIT(7)
+#define RCC_MP_S_AHB4LPENCLRR_GPIOILPEN	BIT(8)
+
+/* RCC_MP_NS_AHB4LPENSETR register fields */
+#define RCC_MP_NS_AHB4LPENSETR_GPIOALPEN BIT(0)
+#define RCC_MP_NS_AHB4LPENSETR_GPIOBLPEN BIT(1)
+#define RCC_MP_NS_AHB4LPENSETR_GPIOCLPEN BIT(2)
+#define RCC_MP_NS_AHB4LPENSETR_GPIODLPEN BIT(3)
+#define RCC_MP_NS_AHB4LPENSETR_GPIOELPEN BIT(4)
+#define RCC_MP_NS_AHB4LPENSETR_GPIOFLPEN BIT(5)
+#define RCC_MP_NS_AHB4LPENSETR_GPIOGLPEN BIT(6)
+#define RCC_MP_NS_AHB4LPENSETR_GPIOHLPEN BIT(7)
+#define RCC_MP_NS_AHB4LPENSETR_GPIOILPEN BIT(8)
+
+/* RCC_MP_NS_AHB4LPENCLRR register fields */
+#define RCC_MP_NS_AHB4LPENCLRR_GPIOALPEN BIT(0)
+#define RCC_MP_NS_AHB4LPENCLRR_GPIOBLPEN BIT(1)
+#define RCC_MP_NS_AHB4LPENCLRR_GPIOCLPEN BIT(2)
+#define RCC_MP_NS_AHB4LPENCLRR_GPIODLPEN BIT(3)
+#define RCC_MP_NS_AHB4LPENCLRR_GPIOELPEN BIT(4)
+#define RCC_MP_NS_AHB4LPENCLRR_GPIOFLPEN BIT(5)
+#define RCC_MP_NS_AHB4LPENCLRR_GPIOGLPEN BIT(6)
+#define RCC_MP_NS_AHB4LPENCLRR_GPIOHLPEN BIT(7)
+#define RCC_MP_NS_AHB4LPENCLRR_GPIOILPEN BIT(8)
+
+/* RCC_MP_AHB5LPENSETR register fields */
+#define RCC_MP_AHB5LPENSETR_PKALPEN	BIT(2)
+#define RCC_MP_AHB5LPENSETR_SAESLPEN	BIT(3)
+#define RCC_MP_AHB5LPENSETR_CRYP1LPEN	BIT(4)
+#define RCC_MP_AHB5LPENSETR_HASH1LPEN	BIT(5)
+#define RCC_MP_AHB5LPENSETR_RNG1LPEN	BIT(6)
+#define RCC_MP_AHB5LPENSETR_BKPSRAMLPEN	BIT(8)
+
+/* RCC_MP_AHB5LPENCLRR register fields */
+#define RCC_MP_AHB5LPENCLRR_PKALPEN	BIT(2)
+#define RCC_MP_AHB5LPENCLRR_SAESLPEN	BIT(3)
+#define RCC_MP_AHB5LPENCLRR_CRYP1LPEN	BIT(4)
+#define RCC_MP_AHB5LPENCLRR_HASH1LPEN	BIT(5)
+#define RCC_MP_AHB5LPENCLRR_RNG1LPEN	BIT(6)
+#define RCC_MP_AHB5LPENCLRR_BKPSRAMLPEN	BIT(8)
+
+/* RCC_MP_AHB6LPENSETR register fields */
+#define RCC_MP_AHB6LPENSETR_MCELPEN	BIT(1)
+#define RCC_MP_AHB6LPENSETR_ETH1CKLPEN	BIT(7)
+#define RCC_MP_AHB6LPENSETR_ETH1TXLPEN	BIT(8)
+#define RCC_MP_AHB6LPENSETR_ETH1RXLPEN	BIT(9)
+#define RCC_MP_AHB6LPENSETR_ETH1MACLPEN	BIT(10)
+#define RCC_MP_AHB6LPENSETR_ETH1STPEN	BIT(11)
+#define RCC_MP_AHB6LPENSETR_FMCLPEN	BIT(12)
+#define RCC_MP_AHB6LPENSETR_QSPILPEN	BIT(14)
+#define RCC_MP_AHB6LPENSETR_SDMMC1LPEN	BIT(16)
+#define RCC_MP_AHB6LPENSETR_SDMMC2LPEN	BIT(17)
+#define RCC_MP_AHB6LPENSETR_CRC1LPEN	BIT(20)
+#define RCC_MP_AHB6LPENSETR_USBHLPEN	BIT(24)
+#define RCC_MP_AHB6LPENSETR_ETH2CKLPEN	BIT(27)
+#define RCC_MP_AHB6LPENSETR_ETH2TXLPEN	BIT(28)
+#define RCC_MP_AHB6LPENSETR_ETH2RXLPEN	BIT(29)
+#define RCC_MP_AHB6LPENSETR_ETH2MACLPEN	BIT(30)
+#define RCC_MP_AHB6LPENSETR_ETH2STPEN	BIT(31)
+
+/* RCC_MP_AHB6LPENCLRR register fields */
+#define RCC_MP_AHB6LPENCLRR_MCELPEN	BIT(1)
+#define RCC_MP_AHB6LPENCLRR_ETH1CKLPEN	BIT(7)
+#define RCC_MP_AHB6LPENCLRR_ETH1TXLPEN	BIT(8)
+#define RCC_MP_AHB6LPENCLRR_ETH1RXLPEN	BIT(9)
+#define RCC_MP_AHB6LPENCLRR_ETH1MACLPEN	BIT(10)
+#define RCC_MP_AHB6LPENCLRR_ETH1STPEN	BIT(11)
+#define RCC_MP_AHB6LPENCLRR_FMCLPEN	BIT(12)
+#define RCC_MP_AHB6LPENCLRR_QSPILPEN	BIT(14)
+#define RCC_MP_AHB6LPENCLRR_SDMMC1LPEN	BIT(16)
+#define RCC_MP_AHB6LPENCLRR_SDMMC2LPEN	BIT(17)
+#define RCC_MP_AHB6LPENCLRR_CRC1LPEN	BIT(20)
+#define RCC_MP_AHB6LPENCLRR_USBHLPEN	BIT(24)
+#define RCC_MP_AHB6LPENCLRR_ETH2CKLPEN	BIT(27)
+#define RCC_MP_AHB6LPENCLRR_ETH2TXLPEN	BIT(28)
+#define RCC_MP_AHB6LPENCLRR_ETH2RXLPEN	BIT(29)
+#define RCC_MP_AHB6LPENCLRR_ETH2MACLPEN	BIT(30)
+#define RCC_MP_AHB6LPENCLRR_ETH2STPEN	BIT(31)
+
+/* RCC_MP_S_AHB6LPENSETR register fields */
+#define RCC_MP_S_AHB6LPENSETR_MDMALPEN	BIT(0)
+
+/* RCC_MP_S_AHB6LPENCLRR register fields */
+#define RCC_MP_S_AHB6LPENCLRR_MDMALPEN	BIT(0)
+
+/* RCC_MP_NS_AHB6LPENSETR register fields */
+#define RCC_MP_NS_AHB6LPENSETR_MDMALPEN	BIT(0)
+
+/* RCC_MP_NS_AHB6LPENCLRR register fields */
+#define RCC_MP_NS_AHB6LPENCLRR_MDMALPEN	BIT(0)
+
+/* RCC_MP_S_AXIMLPENSETR register fields */
+#define RCC_MP_S_AXIMLPENSETR_SYSRAMLPEN BIT(0)
+
+/* RCC_MP_S_AXIMLPENCLRR register fields */
+#define RCC_MP_S_AXIMLPENCLRR_SYSRAMLPEN BIT(0)
+
+/* RCC_MP_NS_AXIMLPENSETR register fields */
+#define RCC_MP_NS_AXIMLPENSETR_SYSRAMLPEN BIT(0)
+
+/* RCC_MP_NS_AXIMLPENCLRR register fields */
+#define RCC_MP_NS_AXIMLPENCLRR_SYSRAMLPEN BIT(0)
+
+/* RCC_MP_MLAHBLPENSETR register fields */
+#define RCC_MP_MLAHBLPENSETR_SRAM1LPEN	BIT(0)
+#define RCC_MP_MLAHBLPENSETR_SRAM2LPEN	BIT(1)
+#define RCC_MP_MLAHBLPENSETR_SRAM3LPEN	BIT(2)
+
+/* RCC_MP_MLAHBLPENCLRR register fields */
+#define RCC_MP_MLAHBLPENCLRR_SRAM1LPEN	BIT(0)
+#define RCC_MP_MLAHBLPENCLRR_SRAM2LPEN	BIT(1)
+#define RCC_MP_MLAHBLPENCLRR_SRAM3LPEN	BIT(2)
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
+#define RCC_APB5SECSR_STGENCSECF_MASK	GENMASK(21, 20)
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
+#define RCC_AHB6SECSR_ETH1SECF_MASK	GENMASK(11, 7)
+#define RCC_AHB6SECSR_ETH2SECF_MASK	GENMASK(31, 27)
+#define RCC_AHB6SECSR_ETH1SECF_SHIFT	7
+#define RCC_AHB6SECSR_ETH2SECF_SHIFT	27
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
+/* RCC_VERR register fields */
+#define RCC_VERR_MINREV_MASK		GENMASK(3, 0)
+#define RCC_VERR_MAJREV_MASK		GENMASK(7, 4)
+#define RCC_VERR_MINREV_SHIFT		0
+#define RCC_VERR_MAJREV_SHIFT		4
+
+/* RCC_IDR register fields */
+#define RCC_IDR_ID_MASK			GENMASK(31, 0)
+#define RCC_IDR_ID_SHIFT		0
+
+/* RCC_SIDR register fields */
+#define RCC_SIDR_SID_MASK		GENMASK(31, 0)
+#define RCC_SIDR_SID_SHIFT		0
+
+#endif /* STM32MP13_RCC_H */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
