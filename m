Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E1CA77BD9
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:17:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F1E4C78F90;
	Tue,  1 Apr 2025 13:17:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82A60C78F8C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:17:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531Bc0EH007945;
 Tue, 1 Apr 2025 15:16:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 m3T/R13Mu2zcLjcOzI3+kIPidfoe/UttJrk9LWfv+Mw=; b=f6cy/zbT76S3jrZL
 I3hRNtdPWKVRe/sCOax4RJmUdXw6o4QKkQnTimV/nMGVCGxJBxVrTL4SVdhBtpaj
 2VsvC+SYYjN4vn8kSRIMUWYxH18CAGCfpXJThSheL04xa/YumreEn6SD5xqMV4Zs
 X9ZgEgtcj3aL2uKsQzjGlEVrY3wiGVVIA3H3GrbZ4IWynhEUuLgvj7F8djsBNin9
 wNWzmPmYKDkDHtrO8b2DU4MyQCmmvnbaam5npzvOFbLAaSKYPVAUPiVmRI37vP88
 +uq+mgA9EHeNXzI21a49zzwbjZu6VUk4ZB6XhhU9IW1SQh+tzm496kIQxObd1r34
 HIIN5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p935whme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:16:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 81AF140046;
 Tue,  1 Apr 2025 15:15:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B6428A3C6A;
 Tue,  1 Apr 2025 15:14:41 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:14:41 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:14:13 +0200
Message-ID: <20250401131413.387139-14-patrice.chotard@foss.st.com>
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
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 13/13] ARM: stm32mp: add RIFSC system bus
	driver for STM32MP25
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

This driver is checking the access rights of the different
peripherals connected to the RIFSC bus. If access is denied,
the associated device is not binded.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 arch/arm/mach-stm32mp/include/mach/rif.h |  26 ++
 arch/arm/mach-stm32mp/stm32mp2/Makefile  |   1 +
 arch/arm/mach-stm32mp/stm32mp2/rifsc.c   | 364 +++++++++++++++++++++++
 3 files changed, 391 insertions(+)
 create mode 100644 arch/arm/mach-stm32mp/include/mach/rif.h
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/rifsc.c

diff --git a/arch/arm/mach-stm32mp/include/mach/rif.h b/arch/arm/mach-stm32mp/include/mach/rif.h
new file mode 100644
index 00000000000..10b22108120
--- /dev/null
+++ b/arch/arm/mach-stm32mp/include/mach/rif.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef MACH_RIF_H
+#define MACH_RIF_H
+
+#include <linux/types.h>
+
+/**
+ * stm32_rifsc_check_access - Check RIF accesses for given device node
+ *
+ * @device_node		Node of the device for which the accesses are checked
+ */
+int stm32_rifsc_check_access(ofnode device_node);
+
+/**
+ * stm32_rifsc_check_access - Check RIF accesses for given id
+ *
+ * @device_node		Node of the device to get a reference on RIFSC
+ * @id			ID of the resource to check
+ */
+int stm32_rifsc_check_access_by_id(ofnode device_node, u32 id);
+
+#endif /* MACH_RIF_H*/
diff --git a/arch/arm/mach-stm32mp/stm32mp2/Makefile b/arch/arm/mach-stm32mp/stm32mp2/Makefile
index b579ce5a800..5dbf75daa76 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/Makefile
+++ b/arch/arm/mach-stm32mp/stm32mp2/Makefile
@@ -5,5 +5,6 @@
 
 obj-y += cpu.o
 obj-y += arm64-mmu.o
+obj-y += rifsc.o
 obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
 obj-$(CONFIG_STM32MP25X) += stm32mp25x.o
diff --git a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
new file mode 100644
index 00000000000..48f65365376
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
@@ -0,0 +1,364 @@
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
+#include <mach/rif.h>
+
+/* RIFSC offset register */
+#define RIFSC_RISC_SECCFGR0(id)		(0x10 + 0x4 * (id))
+#define RIFSC_RISC_PER0_CIDCFGR(id)	(0x100 + 0x8 * (id))
+#define RIFSC_RISC_PER0_SEMCR(id)	(0x104 + 0x8 * (id))
+
+/*
+ * SEMCR register
+ */
+#define SEMCR_MUTEX			BIT(0)
+
+/* RIFSC miscellaneous */
+#define RIFSC_RISC_SCID_MASK		GENMASK(6, 4)
+#define RIFSC_RISC_SEMWL_MASK		GENMASK(23, 16)
+
+#define IDS_PER_RISC_SEC_PRIV_REGS	32
+
+/*
+ * CIDCFGR register fields
+ */
+#define CIDCFGR_CFEN			BIT(0)
+#define CIDCFGR_SEMEN			BIT(1)
+
+#define SEMWL_SHIFT			16
+
+#define STM32MP25_RIFSC_ENTRIES		178
+
+/* Compartiment IDs */
+#define RIF_CID0			0x0
+#define RIF_CID1			0x1
+
+/*
+ * struct stm32_rifsc_plat: Information about RIFSC device
+ *
+ * @base: Base address of RIFSC
+ */
+struct stm32_rifsc_plat {
+	void *base;
+};
+
+/*
+ * struct stm32_rifsc_child_plat: Information about each child
+ *
+ * @domain_id: Domain id
+ */
+struct stm32_rifsc_child_plat {
+	u32 domain_id;
+};
+
+static bool stm32_rif_is_semaphore_available(void *base, u32 id)
+{
+	void *addr = base + RIFSC_RISC_PER0_SEMCR(id);
+
+	return !(readl(addr) & SEMCR_MUTEX);
+}
+
+static int stm32_rif_acquire_semaphore(void *base, u32 id)
+{
+	void *addr = base + RIFSC_RISC_PER0_SEMCR(id);
+
+	/* Check that the semaphore is available */
+	if (!stm32_rif_is_semaphore_available(base, id))
+		return -EACCES;
+
+	setbits_le32(addr, SEMCR_MUTEX);
+
+	/* Check that CID1 has the semaphore */
+	if (stm32_rif_is_semaphore_available(base, id) ||
+	    FIELD_GET(RIFSC_RISC_SCID_MASK, (readl(addr)) != RIF_CID1))
+		return -EACCES;
+
+	return 0;
+}
+
+static int stm32_rif_release_semaphore(void *base, u32 id)
+{
+	void *addr = base + RIFSC_RISC_PER0_SEMCR(id);
+
+	if (stm32_rif_is_semaphore_available(base, id))
+		return 0;
+
+	clrbits_le32(addr, SEMCR_MUTEX);
+
+	/* Ok if another compartment takes the semaphore before the check */
+	if (!stm32_rif_is_semaphore_available(base, id) &&
+	    FIELD_GET(RIFSC_RISC_SCID_MASK, (readl(addr)) == RIF_CID1))
+		return -EACCES;
+
+	return 0;
+}
+
+static int rifsc_parse_access_controller(ofnode node, struct ofnode_phandle_args *args)
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
+	if (args->args[0] >= STM32MP25_RIFSC_ENTRIES) {
+		log_err("Invalid sys bus ID for %s\n", ofnode_get_name(node));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rifsc_check_access(void *base, u32 id)
+{
+	u32 reg_offset, reg_id, sec_reg_value, cid_reg_value, sem_reg_value;
+
+	/*
+	 * RIFSC_RISC_PRIVCFGRx and RIFSC_RISC_SECCFGRx both handle configuration access for
+	 * 32 peripherals. On the other hand, there is one _RIFSC_RISC_PERx_CIDCFGR register
+	 * per peripheral
+	 */
+	reg_id = id / IDS_PER_RISC_SEC_PRIV_REGS;
+	reg_offset = id % IDS_PER_RISC_SEC_PRIV_REGS;
+	sec_reg_value = readl(base + RIFSC_RISC_SECCFGR0(reg_id));
+	cid_reg_value = readl(base + RIFSC_RISC_PER0_CIDCFGR(id));
+	sem_reg_value = readl(base + RIFSC_RISC_PER0_SEMCR(id));
+
+	/*
+	 * First check conditions for semaphore mode, which doesn't take into
+	 * account static CID.
+	 */
+	if (cid_reg_value & CIDCFGR_SEMEN)
+		goto skip_cid_check;
+
+	/*
+	 * Skip cid check if CID filtering isn't enabled or filtering is enabled on CID0, which
+	 * corresponds to whatever CID.
+	 */
+	if (!(cid_reg_value & CIDCFGR_CFEN) ||
+	    FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) == RIF_CID0)
+		goto skip_cid_check;
+
+	/* Coherency check with the CID configuration */
+	if (FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) != RIF_CID1) {
+		log_debug("Invalid CID configuration for peripheral %d\n", id);
+		return -EACCES;
+	}
+
+	/* Check semaphore accesses */
+	if (cid_reg_value & CIDCFGR_SEMEN) {
+		if (!(FIELD_GET(RIFSC_RISC_SEMWL_MASK, cid_reg_value) & BIT(RIF_CID1))) {
+			log_debug("Not in semaphore whitelist for peripheral %d\n", id);
+			return -EACCES;
+		}
+		if (!stm32_rif_is_semaphore_available(base, id) &&
+		    !(FIELD_GET(RIFSC_RISC_SCID_MASK, sem_reg_value) & BIT(RIF_CID1))) {
+			log_debug("Semaphore unavailable for peripheral %d\n", id);
+			return -EACCES;
+		}
+	}
+
+skip_cid_check:
+	/* Check security configuration */
+	if (sec_reg_value & BIT(reg_offset)) {
+		log_debug("Invalid security configuration for peripheral %d\n", id);
+		return -EACCES;
+	}
+
+	return 0;
+}
+
+int stm32_rifsc_check_access_by_id(ofnode device_node, u32 id)
+{
+	struct ofnode_phandle_args args;
+	int err;
+
+	if (id >= STM32MP25_RIFSC_ENTRIES)
+		return -EINVAL;
+
+	err = rifsc_parse_access_controller(device_node, &args);
+	if (err)
+		return err;
+
+	return rifsc_check_access((void *)ofnode_get_addr(args.node), id);
+}
+
+int stm32_rifsc_check_access(ofnode device_node)
+{
+	struct ofnode_phandle_args args;
+	int err;
+
+	err = rifsc_parse_access_controller(device_node, &args);
+	if (err)
+		return err;
+
+	return rifsc_check_access((void *)ofnode_get_addr(args.node), args.args[0]);
+}
+
+static int stm32_rifsc_child_pre_probe(struct udevice *dev)
+{
+	struct stm32_rifsc_plat *plat = dev_get_plat(dev->parent);
+	struct stm32_rifsc_child_plat *child_plat = dev_get_parent_plat(dev);
+	u32 cid_reg_value;
+	int err;
+	u32 id = child_plat->domain_id;
+
+	cid_reg_value = readl(plat->base + RIFSC_RISC_PER0_CIDCFGR(id));
+
+	/*
+	 * If the peripheral is in semaphore mode, take the semaphore so that
+	 * the CID1 has the ownership.
+	 */
+	if (cid_reg_value & CIDCFGR_SEMEN &&
+	    (FIELD_GET(RIFSC_RISC_SEMWL_MASK, cid_reg_value) & BIT(RIF_CID1))) {
+		err = stm32_rif_acquire_semaphore(plat->base, id);
+		if (err) {
+			dev_err(dev, "Couldn't acquire RIF semaphore for peripheral %d (%d)\n",
+				id, err);
+			return err;
+		}
+		dev_dbg(dev, "Acquiring semaphore for peripheral %d\n", id);
+	}
+
+	return 0;
+}
+
+static int stm32_rifsc_child_post_remove(struct udevice *dev)
+{
+	struct stm32_rifsc_plat *plat = dev_get_plat(dev->parent);
+	struct stm32_rifsc_child_plat *child_plat = dev_get_parent_plat(dev);
+	u32 cid_reg_value;
+	int err;
+	u32 id = child_plat->domain_id;
+
+	cid_reg_value = readl(plat->base + RIFSC_RISC_PER0_CIDCFGR(id));
+
+	/*
+	 * If the peripheral is in semaphore mode, release the semaphore so that
+	 * there's no ownership.
+	 */
+	if (cid_reg_value & CIDCFGR_SEMEN &&
+	    (FIELD_GET(RIFSC_RISC_SEMWL_MASK, cid_reg_value) & BIT(RIF_CID1))) {
+		err = stm32_rif_release_semaphore(plat->base, id);
+		if (err)
+			dev_err(dev, "Couldn't release rif semaphore for peripheral %d (%d)\n",
+				id, err);
+	}
+
+	return 0;
+}
+
+static int stm32_rifsc_child_post_bind(struct udevice *dev)
+{
+	struct stm32_rifsc_child_plat *child_plat = dev_get_parent_plat(dev);
+	struct ofnode_phandle_args args;
+	int ret;
+
+	if (!dev_has_ofnode(dev))
+		return -EPERM;
+
+	ret = rifsc_parse_access_controller(dev_ofnode(dev), &args);
+	if (ret)
+		return ret;
+
+	child_plat->domain_id = args.args[0];
+
+	return 0;
+}
+
+static int stm32_rifsc_bind(struct udevice *dev)
+{
+	struct stm32_rifsc_plat *plat = dev_get_plat(dev);
+	struct ofnode_phandle_args args;
+	int ret = 0, err = 0;
+	ofnode node;
+
+	plat->base = dev_read_addr_ptr(dev);
+	if (!plat->base) {
+		dev_err(dev, "can't get registers base address\n");
+		return -ENOENT;
+	}
+
+	for (node = ofnode_first_subnode(dev_ofnode(dev));
+	     ofnode_valid(node);
+	     node = ofnode_next_subnode(node)) {
+		const char *node_name = ofnode_get_name(node);
+
+		if (!ofnode_is_enabled(node))
+			continue;
+
+		err = rifsc_parse_access_controller(node, &args);
+		if (err) {
+			dev_dbg(dev, "%s failed to parse child on bus (%d)\n", node_name, err);
+			continue;
+		}
+
+		err = rifsc_check_access(plat->base, args.args[0]);
+		if (err) {
+			dev_info(dev, "%s not allowed on bus (%d)\n", node_name, err);
+			continue;
+		}
+
+		err = lists_bind_fdt(dev, node, NULL, NULL,
+				     gd->flags & GD_FLG_RELOC ? false : true);
+		if (err && !ret) {
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
+static int stm32_rifsc_remove(struct udevice *bus)
+{
+	struct udevice *dev;
+
+	/* Deactivate all child devices not yet removed */
+	for (device_find_first_child(bus, &dev); dev; device_find_next_child(&dev))
+		if (device_active(dev))
+			stm32_rifsc_child_post_remove(dev);
+
+	return 0;
+}
+
+static const struct udevice_id stm32_rifsc_ids[] = {
+	{ .compatible = "st,stm32mp25-rifsc" },
+	{},
+};
+
+U_BOOT_DRIVER(stm32_rifsc) = {
+	.name = "stm32_rifsc",
+	.id = UCLASS_NOP,
+	.of_match = stm32_rifsc_ids,
+	.bind = stm32_rifsc_bind,
+	.remove = stm32_rifsc_remove,
+	.child_post_bind = stm32_rifsc_child_post_bind,
+	.child_pre_probe = stm32_rifsc_child_pre_probe,
+	.child_post_remove = stm32_rifsc_child_post_remove,
+	.plat_auto = sizeof(struct stm32_rifsc_plat),
+	.per_child_plat_auto = sizeof(struct stm32_rifsc_child_plat),
+	.flags = DM_FLAG_OS_PREPARE,
+};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
