Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8CCB1EB3E
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Aug 2025 17:13:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2758C3F954;
	Fri,  8 Aug 2025 15:13:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC499C3F954
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 15:13:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578CIgDN001698;
 Fri, 8 Aug 2025 17:13:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VhQUY0uGFeF+wlwBgYgTLJfFuBF9cU+9ohGm/N6vp2E=; b=8GlecK5ReRqtFvnM
 Cui5r83kF8nOQeU6umtsaHYOKxTFlhL3bbJ+PKSLGyM0uH1aDIovINcZGVcuc4aj
 p/+HhLU/KPboJZi8/+pq4WduFEzwldCTOj87nAp1WgXLYa3oajo1aA2TrcrrlnIl
 ep+osXk4KblYOKHu0zxF6yWC049uVx/EnS8aRaGwPE5ME8EEHuaUfTC7HxFCCylT
 KKsG2HQ8RXRm73Bd2EmM3rOBk7PYVXeIGhe8P2ET1hNSqmWsNWf7hMqPINgtkTS0
 duUcmOxgB0ADIcbxWVnIsCTFU1NFifK0QlNX4uDo6vPIJGzoaL5BtrWYx8bMifaU
 wCgmKg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48c7pw14e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Aug 2025 17:13:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 941474004F;
 Fri,  8 Aug 2025 17:12:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8875712E7F;
 Fri,  8 Aug 2025 17:12:03 +0200 (CEST)
Received: from localhost (10.252.12.105) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 17:12:03 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Aug 2025 17:11:51 +0200
Message-ID: <20250808151154.472860-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808151154.472860-1-patrice.chotard@foss.st.com>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.12.105]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 2/5] memory: Add STM32 Octo Memory Manager
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

Octo Memory Manager driver (OMM) manages:
  - the muxing between 2 OSPI busses and 2 output ports.
    There are 4 possible muxing configurations:
      - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
        output is on port 2
      - OSPI1 and OSPI2 are multiplexed over the same output port 1
      - swapped mode (no multiplexing), OSPI1 output is on port 2,
        OSPI2 output is on port 1
      - OSPI1 and OSPI2 are multiplexed over the same output port 2
  - the split of the memory area shared between the 2 OSPI instances.
  - chip select selection override.
  - the time between 2 transactions in multiplexed mode.
  - check firewall access.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/memory/Kconfig     |  17 ++
 drivers/memory/Makefile    |   1 +
 drivers/memory/stm32_omm.c | 421 +++++++++++++++++++++++++++++++++++++
 3 files changed, 439 insertions(+)
 create mode 100644 drivers/memory/stm32_omm.c

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 7c40f176987..e31c4532279 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -37,6 +37,23 @@ config STM32_FMC2_EBI
 	  devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
 	  SOCs containing the FMC2 External Bus Interface.
 
+config STM32_OMM
+	tristate "STM32 Octo Memory Manager"
+	depends on ARCH_STM32MP
+	help
+	  This driver manages the muxing between the 2 OSPI busses and
+	  the 2 output ports. There are 4 possible muxing configurations:
+	  - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
+	       output is on port 2
+	  - OSPI1 and OSPI2 are multiplexed over the same output port 1
+	  - swapped mode (no multiplexing), OSPI1 output is on port 2,
+	       OSPI2 output is on port 1
+	  - OSPI1 and OSPI2 are multiplexed over the same output port 2
+	  It also manages :
+	    - the split of the memory area shared between the 2 OSPI instances.
+	    - chip select selection override.
+	    - the time between 2 transactions in multiplexed mode.
+
 config TI_AEMIF
 	tristate "Texas Instruments AEMIF driver"
 	depends on ARCH_KEYSTONE || ARCH_DAVINCI
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index fdc83e4e1c8..77294fac69d 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_MEMORY) += memory-uclass.o
 obj-$(CONFIG_SANDBOX_MEMORY) += memory-sandbox.o
 obj-$(CONFIG_STM32_FMC2_EBI) += stm32-fmc2-ebi.o
+obj-$(CONFIG_STM32_OMM) += stm32_omm.o
 obj-$(CONFIG_ATMEL_EBI) += atmel_ebi.o
 obj-$(CONFIG_TI_AEMIF) += ti-aemif.o ti-aemif-cs.o
 obj-$(CONFIG_TI_GPMC) += ti-gpmc.o
diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
new file mode 100644
index 00000000000..d5a4e1b0683
--- /dev/null
+++ b/drivers/memory/stm32_omm.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
+ */
+
+#define LOG_CATEGORY UCLASS_NOP
+
+#include <clk.h>
+#include <dm.h>
+#include <regmap.h>
+#include <reset.h>
+#include <syscon.h>
+#include <asm/io.h>
+#include <dm/device_compat.h>
+#include <dm/device-internal.h>
+#include <dm/lists.h>
+#include <dm/of_addr.h>
+#include <dm/of_access.h>
+#include <linux/bitfield.h>
+#include <linux/ioport.h>
+#include <mach/rif.h>
+
+/* OCTOSPI control register */
+#define OCTOSPIM_CR		0
+#define CR_MUXEN		BIT(0)
+#define CR_MUXENMODE_MASK	GENMASK(1, 0)
+#define CR_CSSEL_OVR_EN		BIT(4)
+#define CR_CSSEL_OVR_MASK	GENMASK(6, 5)
+#define CR_REQ2ACK_MASK		GENMASK(23, 16)
+
+#define OMM_CHILD_NB		2
+#define OMM_CLK_NB		3
+#define OMM_RESET_NB		3
+#define NSEC_PER_SEC		1000000000L
+
+struct stm32_omm_plat {
+	phys_addr_t regs_base;
+	struct regmap *syscfg_regmap;
+	struct clk clk[OMM_CLK_NB];
+	struct reset_ctl reset_ctl[OMM_RESET_NB];
+	resource_size_t mm_ospi2_size;
+	u32 mux;
+	u32 cssel_ovr;
+	u32 req2ack;
+	u32 amcr_base;
+	u32 amcr_mask;
+	unsigned long clk_rate_max;
+	u8 nb_child;
+};
+
+static int stm32_omm_set_amcr(struct udevice *dev, bool set)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	unsigned int amcr, read_amcr;
+
+	amcr = plat->mm_ospi2_size / SZ_64M;
+
+	if (set)
+		regmap_update_bits(plat->syscfg_regmap, plat->amcr_base,
+				   plat->amcr_mask, amcr);
+
+	/* read AMCR and check coherency with memory-map areas defined in DT */
+	regmap_read(plat->syscfg_regmap, plat->amcr_base, &read_amcr);
+	read_amcr = read_amcr >> (ffs(plat->amcr_mask) - 1);
+
+	if (amcr != read_amcr) {
+		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int stm32_omm_toggle_child_clock(struct udevice *dev, bool enable)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	int i, ret;
+
+	for (i = 0; i < plat->nb_child; i++) {
+		if (enable) {
+			ret = clk_enable(&plat->clk[i + 1]);
+			if (ret) {
+				dev_err(dev, "Can not enable clock\n");
+				goto clk_error;
+			}
+		} else {
+			clk_disable(&plat->clk[i + 1]);
+		}
+	}
+
+	return 0;
+
+clk_error:
+	while (i--)
+		clk_disable(&plat->clk[i + 1]);
+
+	return ret;
+}
+
+static int stm32_omm_disable_child(struct udevice *dev)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	int ret;
+	u8 i;
+
+	ret = stm32_omm_toggle_child_clock(dev, true);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < plat->nb_child; i++) {
+		/* reset OSPI to ensure CR_EN bit is set to 0 */
+		reset_assert(&plat->reset_ctl[i + 1]);
+		udelay(2);
+		reset_deassert(&plat->reset_ctl[i + 1]);
+	}
+
+	return stm32_omm_toggle_child_clock(dev, false);
+}
+
+static int stm32_omm_configure(struct udevice *dev)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	int ret;
+	u32 mux = 0;
+	u32 cssel_ovr = 0;
+	u32 req2ack = 0;
+
+	/* Ensure both OSPI instance are disabled before configuring OMM */
+	ret = stm32_omm_disable_child(dev);
+	if (ret)
+		return ret;
+
+	ret = clk_enable(&plat->clk[0]);
+	if (ret) {
+		dev_err(dev, "Failed to enable OMM clock (%d)\n", ret);
+		return ret;
+	}
+
+	reset_assert(&plat->reset_ctl[0]);
+	udelay(2);
+	reset_deassert(&plat->reset_ctl[0]);
+
+	if (plat->mux & CR_MUXEN) {
+		if (plat->req2ack) {
+			req2ack = DIV_ROUND_UP(plat->req2ack,
+					       NSEC_PER_SEC / plat->clk_rate_max) - 1;
+			if (req2ack > 256)
+				req2ack = 256;
+		}
+
+		req2ack = FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
+		clrsetbits_le32(plat->regs_base + OCTOSPIM_CR, CR_REQ2ACK_MASK,
+				req2ack);
+
+		/*
+		 * If the mux is enabled, the 2 OSPI clocks have to be
+		 * always enabled
+		 */
+		ret = stm32_omm_toggle_child_clock(dev, true);
+		if (ret)
+			return ret;
+	}
+
+	if (plat->cssel_ovr != 0xff) {
+		cssel_ovr = FIELD_PREP(CR_CSSEL_OVR_MASK, cssel_ovr);
+		cssel_ovr |= CR_CSSEL_OVR_EN;
+		clrsetbits_le32(plat->regs_base + OCTOSPIM_CR, CR_CSSEL_OVR_MASK,
+				cssel_ovr);
+	}
+
+	mux = FIELD_PREP(CR_MUXENMODE_MASK, plat->mux);
+	clrsetbits_le32(plat->regs_base + OCTOSPIM_CR, CR_MUXENMODE_MASK, mux);
+	clk_disable(&plat->clk[0]);
+
+	return stm32_omm_set_amcr(dev, true);
+}
+
+static void stm32_omm_release_childs(ofnode *child_list, u8 nb_child)
+{
+	u8 i;
+
+	for (i = 0; i < nb_child; i++)
+		stm32_rifsc_release_access(child_list[i]);
+}
+
+static int stm32_omm_probe(struct udevice *dev)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	ofnode child_list[OMM_CHILD_NB];
+	ofnode child;
+	int ret;
+	u8 child_access_granted = 0;
+	bool child_access[OMM_CHILD_NB];
+
+	/* check child's access */
+	for (child = ofnode_first_subnode(dev_ofnode(dev));
+	     ofnode_valid(child);
+	     child = ofnode_next_subnode(child)) {
+		if (plat->nb_child > OMM_CHILD_NB) {
+			dev_err(dev, "Bad DT, found too much children\n");
+			return -E2BIG;
+		}
+
+		if (!ofnode_device_is_compatible(child, "st,stm32mp25-ospi"))
+			return -EINVAL;
+
+		ret = stm32_rifsc_grant_access(child);
+		if (ret < 0 && ret != -EACCES)
+			return ret;
+
+		child_access[plat->nb_child] = false;
+		if (!ret) {
+			child_access_granted++;
+			child_access[plat->nb_child] = true;
+		}
+
+		child_list[plat->nb_child] = child;
+		plat->nb_child++;
+	}
+
+	if (plat->nb_child != OMM_CHILD_NB)
+		return -EINVAL;
+
+	/* check if OMM's resource access is granted */
+	ret = stm32_rifsc_grant_access(dev_ofnode(dev));
+	if (ret < 0 && ret != -EACCES)
+		goto end;
+
+	/* All child's access are granted ? */
+	if (!ret && child_access_granted == plat->nb_child) {
+		ret = stm32_omm_configure(dev);
+		if (ret)
+			goto end;
+	} else {
+		dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
+		/*
+		 * AMCR can't be set, so check if current value is coherent
+		 * with memory-map areas defined in DT
+		 */
+		ret = stm32_omm_set_amcr(dev, false);
+	}
+
+end:
+	stm32_omm_release_childs(child_list, plat->nb_child);
+	stm32_rifsc_release_access(dev_ofnode(dev));
+
+	return ret;
+}
+
+static int stm32_omm_of_to_plat(struct udevice *dev)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	static const char * const clocks_name[] = {"omm", "ospi1", "ospi2"};
+	static const char * const mm_name[] = { "ospi1", "ospi2" };
+	static const char * const resets_name[] = {"omm", "ospi1", "ospi2"};
+	struct resource res, res1, mm_res;
+	struct ofnode_phandle_args args;
+	struct udevice *child;
+	unsigned long clk_rate;
+	struct clk child_clk;
+	int ret, idx;
+	u8 i;
+
+	plat->regs_base = dev_read_addr(dev);
+	if (plat->regs_base == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	ret = dev_read_resource_byname(dev, "memory_map", &mm_res);
+	if (ret) {
+		dev_err(dev, "can't get omm_mm mmap resource(ret = %d)!\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < OMM_CLK_NB; i++) {
+		ret = clk_get_by_name(dev, clocks_name[i], &plat->clk[i]);
+		if (ret < 0) {
+			dev_err(dev, "Can't find I/O manager clock %s\n", clocks_name[i]);
+			return ret;
+		}
+
+		ret = reset_get_by_name(dev, resets_name[i], &plat->reset_ctl[i]);
+		if (ret < 0) {
+			dev_err(dev, "Can't find I/O manager reset %s\n", resets_name[i]);
+			return ret;
+		}
+	}
+
+	/* parse children's clock */
+	plat->clk_rate_max = 0;
+	device_foreach_child(child, dev) {
+		ret = clk_get_by_index(child, 0, &child_clk);
+		if (ret) {
+			dev_err(dev, "Failed to get clock for %s\n",
+				dev_read_name(child));
+			return ret;
+		}
+
+		clk_rate = clk_get_rate(&child_clk);
+		if (!clk_rate) {
+			dev_err(dev, "Invalid clock rate\n");
+			return -EINVAL;
+		}
+
+		if (clk_rate > plat->clk_rate_max)
+			plat->clk_rate_max = clk_rate;
+	}
+
+	plat->mux = dev_read_u32_default(dev, "st,omm-mux", 0);
+	plat->req2ack = dev_read_u32_default(dev, "st,omm-req2ack-ns", 0);
+	plat->cssel_ovr = dev_read_u32_default(dev, "st,omm-cssel-ovr", 0xff);
+	plat->mm_ospi2_size = 0;
+
+	for (i = 0; i < 2; i++) {
+		idx = dev_read_stringlist_search(dev, "memory-region-names",
+						 mm_name[i]);
+		if (idx < 0)
+			continue;
+
+		/* res1 only used on second loop iteration */
+		res1.start = res.start;
+		res1.end = res.end;
+
+		dev_read_phandle_with_args(dev, "memory-region", NULL, 0, idx,
+					   &args);
+		ret = ofnode_read_resource(args.node, 0, &res);
+		if (ret) {
+			dev_err(dev, "unable to resolve memory region\n");
+			return ret;
+		}
+
+		/* check that memory region fits inside OMM memory map area */
+		if (!resource_contains(&mm_res, &res)) {
+			dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
+				mm_name[i]);
+			dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
+				res.start, res.end,
+				mm_res.start, mm_res.end);
+
+			return -EFAULT;
+		}
+
+		if (i == 1) {
+			plat->mm_ospi2_size = resource_size(&res);
+
+			/* check that OMM memory region 1 doesn't overlap memory region 2 */
+			if (resource_overlaps(&res, &res1)) {
+				dev_err(dev, "OMM memory-region %s overlaps memory region %s\n",
+					mm_name[0], mm_name[1]);
+				dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
+					res1.start, res1.end, res.start, res.end);
+
+				return -EFAULT;
+			}
+		}
+	}
+
+	plat->syscfg_regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscfg-amcr");
+	if (IS_ERR(plat->syscfg_regmap)) {
+		dev_err(dev, "Failed to get st,syscfg-amcr property\n");
+		ret = PTR_ERR(plat->syscfg_regmap);
+		return ret;
+	}
+
+	ret = dev_read_u32_index(dev, "st,syscfg-amcr", 1, &plat->amcr_base);
+	if (ret) {
+		dev_err(dev, "Failed to get st,syscfg-amcr base\n");
+		return ret;
+	}
+
+	ret = dev_read_u32_index(dev, "st,syscfg-amcr", 2, &plat->amcr_mask);
+	if (ret) {
+		dev_err(dev, "Failed to get st,syscfg-amcr mask\n");
+		return ret;
+	}
+
+	return 0;
+};
+
+static int stm32_omm_bind(struct udevice *dev)
+{
+	int ret = 0, err = 0;
+	ofnode node;
+
+	for (node = ofnode_first_subnode(dev_ofnode(dev));
+	     ofnode_valid(node);
+	     node = ofnode_next_subnode(node)) {
+		const char *node_name = ofnode_get_name(node);
+
+		if (!ofnode_is_enabled(node) || stm32_rifsc_grant_access(node)) {
+			dev_dbg(dev, "%s failed to bind\n", node_name);
+			continue;
+		}
+
+		err = lists_bind_fdt(dev, node, NULL, NULL,
+				     gd->flags & GD_FLG_RELOC ? false : true);
+		if (err && !ret) {
+			ret = err;
+			dev_dbg(dev, "%s: ret=%d\n", node_name, ret);
+		}
+	}
+
+	if (ret)
+		dev_dbg(dev, "Some drivers failed to bind\n");
+
+	return ret;
+}
+
+static const struct udevice_id stm32_omm_ids[] = {
+	{ .compatible = "st,stm32mp25-omm", },
+	{},
+};
+
+U_BOOT_DRIVER(stm32_omm) = {
+	.name		= "stm32_omm",
+	.id		= UCLASS_NOP,
+	.probe		= stm32_omm_probe,
+	.of_match	= stm32_omm_ids,
+	.of_to_plat	= stm32_omm_of_to_plat,
+	.plat_auto	= sizeof(struct stm32_omm_plat),
+	.bind		= stm32_omm_bind,
+};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
