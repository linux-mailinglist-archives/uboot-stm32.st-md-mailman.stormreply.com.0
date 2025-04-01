Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 766EDA77BDE
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:17:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37788C78F90;
	Tue,  1 Apr 2025 13:17:22 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F410C78F9A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:17:20 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531BxAHW018149;
 Tue, 1 Apr 2025 15:17:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 AUWg7BnDALvRSd66QP0AXacHAUaODUEmCYwa3l0967s=; b=6tQuOAh9tb7qEW+/
 /VoFVxmNvlSqPOwJbTmyZF70rCINZ5kSUTv7CtemQvW0rZ3aoOLN9Ob2x1RLwC/g
 89vmNpdvVXunTLM6oeq51eD1GgNgyCWjzwHoeVK71QTJYM9SJAOrvQofn4btxpaX
 4zZEzIM9Qr4sesPXPaBoj8mLhIFfZ7tvqAAtFg4w+4LpVBcAzeXA35igHalFSq9T
 ATnJvBqCv/4eK2lcee0fZ7G2IJg9UXds6T79ifYlBvmcyfT0bkM/u1lDHkwuqNCX
 2Omk9W9soU9R8Phs0DM3DYuOAcWugVHN41T4KbzpzKrXNVOtp9zUsdgUUh4OG9JB
 usFRUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45puwy2qb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:17:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9B1364004F;
 Tue,  1 Apr 2025 15:16:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B57A8A1B37;
 Tue,  1 Apr 2025 15:14:37 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:14:37 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:14:09 +0200
Message-ID: <20250401131413.387139-10-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401131413.387139-1-patrice.chotard@foss.st.com>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 09/13] ARM: stm32mp: add ETZPC system bus
	driver for STM32MP1
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

From: Lionel Debieve <lionel.debieve@foss.st.com>

This driver is checking the access rights of the different
peripherals connected to the ETZPC bus. If access is denied,
the associated device is not bound.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/include/mach/etzpc.h |  32 ++++
 arch/arm/mach-stm32mp/stm32mp1/Makefile    |   1 +
 arch/arm/mach-stm32mp/stm32mp1/etzpc.c     | 194 +++++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 arch/arm/mach-stm32mp/include/mach/etzpc.h
 create mode 100644 arch/arm/mach-stm32mp/stm32mp1/etzpc.c

diff --git a/arch/arm/mach-stm32mp/include/mach/etzpc.h b/arch/arm/mach-stm32mp/include/mach/etzpc.h
new file mode 100644
index 00000000000..fd697c3e2ac
--- /dev/null
+++ b/arch/arm/mach-stm32mp/include/mach/etzpc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef MACH_ETZPC_H
+#define MACH_ETZPC_H
+
+#include <linux/types.h>
+
+/**
+ * stm32_etzpc_check_access - Check ETZPC accesses for given device node
+ *
+ * @device_node		Node of the device for which the accesses are checked
+ *
+ * @returns 0 on success (if access is granted), -EINVAL if access is denied.
+ *          Else, returns an appropriate negative ERRNO value
+ */
+int stm32_etzpc_check_access(ofnode device_node);
+
+/**
+ * stm32_etzpc_check_access_by_id - Check ETZPC accesses for given id
+ *
+ * @device_node		Node of the device to get a reference on ETZPC
+ * @id			ID of the resource to check
+ *
+ * @returns 0 on success (if access is granted), -EINVAL if access is denied.
+ *          Else, returns an appropriate negative ERRNO value
+ */
+int stm32_etzpc_check_access_by_id(ofnode device_node, u32 id);
+
+#endif /* MACH_ETZPC_H*/
diff --git a/arch/arm/mach-stm32mp/stm32mp1/Makefile b/arch/arm/mach-stm32mp/stm32mp1/Makefile
index db160c24cbc..434c86bd8ec 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/Makefile
+++ b/arch/arm/mach-stm32mp/stm32mp1/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-y += cpu.o
+obj-y += etzpc.o
 
 obj-$(CONFIG_STM32MP13X) += stm32mp13x.o
 obj-$(CONFIG_STM32MP15X) += stm32mp15x.o
diff --git a/arch/arm/mach-stm32mp/stm32mp1/etzpc.c b/arch/arm/mach-stm32mp/stm32mp1/etzpc.c
new file mode 100644
index 00000000000..b7aefb84069
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp1/etzpc.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#define LOG_CATEGORY UCLASS_SIMPLE_BUS
+
+#include <dm.h>
+#include <asm/io.h>
+#include <dm/device.h>
+#include <dm/device_compat.h>
+#include <dm/lists.h>
+#include <linux/bitfield.h>
+#include <mach/etzpc.h>
+
+/* ETZPC peripheral as firewall bus */
+/* ETZPC registers */
+#define ETZPC_DECPROT			0x10
+#define ETZPC_HWCFGR			0x3F0
+
+/* ETZPC miscellaneous */
+#define ETZPC_PROT_MASK			GENMASK(1, 0)
+#define ETZPC_PROT_A7NS			0x3
+#define ETZPC_DECPROT_SHIFT		1
+
+#define IDS_PER_DECPROT_REGS		16
+
+#define ETZPC_HWCFGR_NUM_PER_SEC	GENMASK(15, 8)
+#define ETZPC_HWCFGR_NUM_AHB_SEC	GENMASK(23, 16)
+
+/*
+ * struct stm32_etzpc_plat: Information about ETZPC device
+ *
+ * @base: Base address of ETZPC
+ * @max_entries: Number of securable peripherals in ETZPC
+ */
+struct stm32_etzpc_plat {
+	void *base;
+	unsigned int max_entries;
+};
+
+static int etzpc_parse_feature_domain(ofnode node, struct ofnode_phandle_args *args)
+{
+	int ret;
+
+	ret = ofnode_parse_phandle_with_args(node, "access-controllers",
+					     "#access-controller-cells", 0,
+					     0, args);
+	if (ret) {
+		log_debug("failed to parse access-controller (%d)\n", ret);
+		return ret;
+	}
+
+	if (args->args_count != 1) {
+		log_debug("invalid domain args_count: %d\n", args->args_count);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int etzpc_check_access(void *base, u32 id)
+{
+	u32 reg_offset, offset, sec_val;
+
+	/* Check access configuration, 16 peripherals per register */
+	reg_offset = ETZPC_DECPROT + 0x4 * (id / IDS_PER_DECPROT_REGS);
+	offset = (id % IDS_PER_DECPROT_REGS) << ETZPC_DECPROT_SHIFT;
+
+	/* Verify peripheral is non-secure and attributed to cortex A7 */
+	sec_val = (readl(base + reg_offset) >> offset) & ETZPC_PROT_MASK;
+	if (sec_val != ETZPC_PROT_A7NS) {
+		log_debug("Invalid bus configuration: reg_offset %#x, value %d\n",
+			  reg_offset, sec_val);
+		return -EACCES;
+	}
+
+	return 0;
+}
+
+int stm32_etzpc_check_access_by_id(ofnode device_node, u32 id)
+{
+	struct stm32_etzpc_plat *plat;
+	struct ofnode_phandle_args args;
+	struct udevice *dev;
+	int err;
+
+	err = etzpc_parse_feature_domain(device_node, &args);
+	if (err)
+		return err;
+
+	if (id == -1U)
+		id = args.args[0];
+
+	err = uclass_get_device_by_ofnode(UCLASS_NOP, args.node, &dev);
+	if (err || dev->driver != DM_DRIVER_GET(stm32_etzpc)) {
+		log_err("No device found\n");
+		return -EINVAL;
+	}
+
+	plat = dev_get_plat(dev);
+
+	if (id >= plat->max_entries) {
+		dev_err(dev, "Invalid sys bus ID for %s\n", ofnode_get_name(device_node));
+		return -EINVAL;
+	}
+
+	return etzpc_check_access(plat->base, id);
+}
+
+int stm32_etzpc_check_access(ofnode device_node)
+{
+	return stm32_etzpc_check_access_by_id(device_node, -1U);
+}
+
+static int stm32_etzpc_bind(struct udevice *dev)
+{
+	struct stm32_etzpc_plat *plat = dev_get_plat(dev);
+	struct ofnode_phandle_args args;
+	u32 nb_per, nb_master;
+	int ret = 0, err = 0;
+	ofnode node, parent;
+
+	plat->base = dev_read_addr_ptr(dev);
+	if (!plat->base) {
+		dev_err(dev, "can't get registers base address\n");
+		return -ENOENT;
+	}
+
+	/* Get number of etzpc entries*/
+	nb_per = FIELD_GET(ETZPC_HWCFGR_NUM_PER_SEC,
+			   readl(plat->base + ETZPC_HWCFGR));
+	nb_master = FIELD_GET(ETZPC_HWCFGR_NUM_AHB_SEC,
+			      readl(plat->base + ETZPC_HWCFGR));
+	plat->max_entries = nb_per + nb_master;
+
+	parent = dev_ofnode(dev);
+	for (node = ofnode_first_subnode(parent);
+	     ofnode_valid(node);
+	     node = ofnode_next_subnode(node)) {
+		const char *node_name = ofnode_get_name(node);
+
+		if (!ofnode_is_enabled(node))
+			continue;
+
+		err = etzpc_parse_feature_domain(node, &args);
+		if (err) {
+			dev_err(dev, "%s failed to parse child on bus (%d)\n", node_name, err);
+			continue;
+		}
+
+		if (!ofnode_equal(args.node, parent)) {
+			dev_err(dev, "%s phandle to %s\n",
+				node_name, ofnode_get_name(args.node));
+			continue;
+		}
+
+		if (args.args[0] >= plat->max_entries) {
+			dev_err(dev, "Invalid sys bus ID for %s\n", node_name);
+			return -EINVAL;
+		}
+
+		err = etzpc_check_access(plat->base, args.args[0]);
+		if (err) {
+			dev_info(dev, "%s not allowed on bus (%d)\n", node_name, err);
+			continue;
+		}
+
+		err = lists_bind_fdt(dev, node, NULL, NULL,
+				     gd->flags & GD_FLG_RELOC ? false : true);
+		if (err) {
+			ret = err;
+			dev_err(dev, "%s failed to bind on bus (%d)\n", node_name, ret);
+		}
+	}
+
+	if (ret)
+		dev_err(dev, "Some child failed to bind (%d)\n", ret);
+
+	return ret;
+}
+
+static const struct udevice_id stm32_etzpc_ids[] = {
+	{ .compatible = "st,stm32-etzpc" },
+	{},
+};
+
+U_BOOT_DRIVER(stm32_etzpc) = {
+	.name = "stm32_etzpc",
+	.id = UCLASS_NOP,
+	.of_match = stm32_etzpc_ids,
+	.bind = stm32_etzpc_bind,
+	.plat_auto = sizeof(struct stm32_etzpc_plat),
+};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
