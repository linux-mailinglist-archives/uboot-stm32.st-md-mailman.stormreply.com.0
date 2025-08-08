Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E9BB1E9EF
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Aug 2025 16:05:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94BC5C3F954;
	Fri,  8 Aug 2025 14:05:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A95D4C3F954
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 14:05:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578Dl6P1007707;
 Fri, 8 Aug 2025 16:05:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 fK2PfQAJYPgOtu7aXsZsvRGdOjEG409VEVTXAJrLi14=; b=8OVnbkCYjI4q4aZs
 n9C+dRzaR0W8rJeh9O7HtJsQX0lHennOv85ScPPFM1fBHEK/Qpc6YxNpp/USMqh1
 b1GJrHxZNlc2CeNtohPIQ+DkHRJkW2AcErdF00JNhtLzH4cD3zPHZ1i8BJKZT+e7
 FcSrKRoR8SA3R/vf1gnvNBmExdCSbGj7OjewYHr69zPx3ctQXUIUtoufUBAGHj2E
 63XbCCvePjR/4dzMlOi0FMPDkG8t2pa1jv5EcroU/M+4A6vHg+Bn8HPu/H5AGt8u
 H965YZhrnMmksDDEYJz3COP0IDLw1q66CSQHXl0pt0FzxX2aAltwuEgfm+tTp86z
 c6p56g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48cq00p8cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Aug 2025 16:05:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3A8BA40049;
 Fri,  8 Aug 2025 16:04:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABF1F7269F9;
 Fri,  8 Aug 2025 16:04:06 +0200 (CEST)
Received: from localhost (10.252.12.105) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 16:04:06 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Aug 2025 16:03:57 +0200
Message-ID: <20250808140358.53164-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808140358.53164-1-patrice.chotard@foss.st.com>
References: <20250808140358.53164-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.12.105]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/2] ARM: stm32mp: replace RIFSC check access
	APIs
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

From: Gatien Chevallier <gatien.chevallier@foss.st.com>

Replace RIFSC check access APIs by grant/release access ones that handle
the RIF semaphores.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/include/mach/rif.h |  48 +++++++--
 arch/arm/mach-stm32mp/stm32mp2/rifsc.c   | 127 +++++++++++++----------
 drivers/clk/stm32/clk-stm32mp25.c        |   2 +-
 3 files changed, 116 insertions(+), 61 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/rif.h b/arch/arm/mach-stm32mp/include/mach/rif.h
index 10b22108120..4f51313980d 100644
--- a/arch/arm/mach-stm32mp/include/mach/rif.h
+++ b/arch/arm/mach-stm32mp/include/mach/rif.h
@@ -8,19 +8,53 @@
 
 #include <linux/types.h>
 
+#if IS_ENABLED(CONFIG_STM32MP21X) || IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X)
 /**
- * stm32_rifsc_check_access - Check RIF accesses for given device node
+ * stm32_rifsc_grant_access_by_id - Grant RIFSC access for a given peripheral using its ID
  *
- * @device_node		Node of the device for which the accesses are checked
+ * @device_node Node of the peripheral
+ * @id ID of the peripheral of which access should be granted
  */
-int stm32_rifsc_check_access(ofnode device_node);
+int stm32_rifsc_grant_access_by_id(ofnode device_node, u32 id);
 
 /**
- * stm32_rifsc_check_access - Check RIF accesses for given id
+ * stm32_rifsc_grant_access_by_id - Grant RIFSC access for a given peripheral using its node
  *
- * @device_node		Node of the device to get a reference on RIFSC
- * @id			ID of the resource to check
+ * @id node of the peripheral of which access should be granted
  */
-int stm32_rifsc_check_access_by_id(ofnode device_node, u32 id);
+int stm32_rifsc_grant_access(ofnode device_node);
 
+/**
+ * stm32_rifsc_release_access_by_id - Release RIFSC access for a given peripheral using its ID
+ *
+ * @device_node Node of the peripheral
+ * @id ID of the peripheral of which access should be released
+ */
+void stm32_rifsc_release_access_by_id(ofnode device_node, u32 id);
+
+/**
+ * stm32_rifsc_release_access_by_id - Release RIFSC access for a given peripheral using its node
+ *
+ * @id node of the peripheral of which access should be released
+ */
+void stm32_rifsc_release_access(ofnode device_node);
+#else
+static inline int stm32_rifsc_grant_access_by_id(ofnode device_node, u32 id)
+{
+	return -EACCES;
+}
+
+static inline int stm32_rifsc_grant_access(ofnode device_node)
+{
+	return -EACCES;
+}
+
+static inline void stm32_rifsc_release_access_by_id(ofnode device_node, u32 id)
+{
+}
+
+static inline void stm32_rifsc_release_access(ofnode device_node)
+{
+}
+#endif
 #endif /* MACH_RIF_H*/
diff --git a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
index 136ed68bba1..f8f67af4449 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
@@ -61,43 +61,41 @@ struct stm32_rifsc_child_plat {
 	u32 domain_id;
 };
 
-static bool stm32_rif_is_semaphore_available(void *base, u32 id)
+static bool stm32_rif_is_semaphore_available(void *addr)
 {
-	void *addr = base + RIFSC_RISC_PER0_SEMCR(id);
-
 	return !(readl(addr) & SEMCR_MUTEX);
 }
 
-static int stm32_rif_acquire_semaphore(void *base, u32 id)
+static int stm32_rifsc_acquire_semaphore(void *base, u32 id)
 {
 	void *addr = base + RIFSC_RISC_PER0_SEMCR(id);
 
 	/* Check that the semaphore is available */
-	if (!stm32_rif_is_semaphore_available(base, id) &&
+	if (!stm32_rif_is_semaphore_available(addr) &&
 	    FIELD_GET(RIFSC_RISC_SCID_MASK, (readl(addr)) != RIF_CID1))
 		return -EACCES;
 
 	setbits_le32(addr, SEMCR_MUTEX);
 
 	/* Check that CID1 has the semaphore */
-	if (stm32_rif_is_semaphore_available(base, id) ||
+	if (stm32_rif_is_semaphore_available(addr) ||
 	    FIELD_GET(RIFSC_RISC_SCID_MASK, (readl(addr)) != RIF_CID1))
 		return -EACCES;
 
 	return 0;
 }
 
-static int stm32_rif_release_semaphore(void *base, u32 id)
+static int stm32_rifsc_release_semaphore(void *base, u32 id)
 {
 	void *addr = base + RIFSC_RISC_PER0_SEMCR(id);
 
-	if (stm32_rif_is_semaphore_available(base, id))
+	if (stm32_rif_is_semaphore_available(addr))
 		return 0;
 
 	clrbits_le32(addr, SEMCR_MUTEX);
 
 	/* Ok if another compartment takes the semaphore before the check */
-	if (!stm32_rif_is_semaphore_available(base, id) &&
+	if (!stm32_rif_is_semaphore_available(addr) &&
 	    FIELD_GET(RIFSC_RISC_SCID_MASK, (readl(addr)) == RIF_CID1))
 		return -EACCES;
 
@@ -106,11 +104,10 @@ static int stm32_rif_release_semaphore(void *base, u32 id)
 
 static int rifsc_parse_access_controller(ofnode node, struct ofnode_phandle_args *args)
 {
-	int ret;
+	int ret = ofnode_parse_phandle_with_args(node, "access-controllers",
+						 "#access-controller-cells", 0,
+						 0, args);
 
-	ret = ofnode_parse_phandle_with_args(node, "access-controllers",
-					     "#access-controller-cells", 0,
-					     0, args);
 	if (ret) {
 		log_debug("failed to parse access-controller (%d)\n", ret);
 		return ret;
@@ -171,7 +168,7 @@ static int rifsc_check_access(void *base, u32 id)
 			log_debug("Not in semaphore whitelist for peripheral %d\n", id);
 			return -EACCES;
 		}
-		if (!stm32_rif_is_semaphore_available(base, id) &&
+		if (!stm32_rif_is_semaphore_available(base + RIFSC_RISC_PER0_SEMCR(id)) &&
 		    !(FIELD_GET(RIFSC_RISC_SCID_MASK, sem_reg_value) & RIF_CID1)) {
 			log_debug("Semaphore unavailable for peripheral %d\n", id);
 			return -EACCES;
@@ -188,22 +185,44 @@ skip_cid_check:
 	return 0;
 }
 
-int stm32_rifsc_check_access_by_id(ofnode device_node, u32 id)
+int stm32_rifsc_grant_access_by_id(ofnode device_node, u32 id)
 {
 	struct ofnode_phandle_args args;
+	u32 cid_reg_value;
+	void *rifsc_base;
 	int err;
 
-	if (id >= STM32MP25_RIFSC_ENTRIES)
-		return -EINVAL;
-
 	err = rifsc_parse_access_controller(device_node, &args);
+	if (err)
+		panic("Failed to parse access-controllers property\n");
+
+	rifsc_base = (void *)ofnode_get_addr(args.node);
+
+	err = rifsc_check_access(rifsc_base, id);
 	if (err)
 		return err;
 
-	return rifsc_check_access((void *)ofnode_get_addr(args.node), id);
+	cid_reg_value = readl(rifsc_base + RIFSC_RISC_PER0_CIDCFGR(id));
+
+	/*
+	 * If the peripheral is in semaphore mode, take the semaphore so that
+	 * the CID1 has the ownership.
+	 */
+	if (cid_reg_value & CIDCFGR_SEMEN &&
+	    (FIELD_GET(RIFSC_RISC_SEMWL_MASK, cid_reg_value) & BIT(RIF_CID1))) {
+		err = stm32_rifsc_acquire_semaphore(rifsc_base, id);
+		if (err) {
+			pr_err("Couldn't acquire RIF semaphore for peripheral %d (%d)\n",
+			       id, err);
+			return err;
+		}
+		pr_debug("Acquiring RIF semaphore for peripheral %d\n", id);
+	}
+
+	return 0;
 }
 
-int stm32_rifsc_check_access(ofnode device_node)
+int stm32_rifsc_grant_access(ofnode device_node)
 {
 	struct ofnode_phandle_args args;
 	int err;
@@ -212,58 +231,60 @@ int stm32_rifsc_check_access(ofnode device_node)
 	if (err)
 		return err;
 
-	return rifsc_check_access((void *)ofnode_get_addr(args.node), args.args[0]);
+	return stm32_rifsc_grant_access_by_id(device_node, args.args[0]);
+
 }
 
-static int stm32_rifsc_child_pre_probe(struct udevice *dev)
+void stm32_rifsc_release_access_by_id(ofnode device_node, u32 id)
 {
-	struct stm32_rifsc_plat *plat = dev_get_plat(dev->parent);
-	struct stm32_rifsc_child_plat *child_plat = dev_get_parent_plat(dev);
+	struct ofnode_phandle_args args;
 	u32 cid_reg_value;
+	void *rifsc_base;
 	int err;
-	u32 id = child_plat->domain_id;
 
-	cid_reg_value = readl(plat->base + RIFSC_RISC_PER0_CIDCFGR(id));
+	err = rifsc_parse_access_controller(device_node, &args);
+	if (err)
+		panic("Failed to parse access-controllers property\n");
 
-	/*
-	 * If the peripheral is in semaphore mode, take the semaphore so that
-	 * the CID1 has the ownership.
-	 */
+	rifsc_base = (void *)ofnode_get_addr(args.node);
+
+	cid_reg_value = readl(rifsc_base + RIFSC_RISC_PER0_CIDCFGR(id));
+
+	/* If the peripheral is in semaphore mode, release it if we have the ownership */
 	if (cid_reg_value & CIDCFGR_SEMEN &&
 	    (FIELD_GET(RIFSC_RISC_SEMWL_MASK, cid_reg_value) & BIT(RIF_CID1))) {
-		err = stm32_rif_acquire_semaphore(plat->base, id);
+		err = stm32_rifsc_release_semaphore(rifsc_base, id);
 		if (err) {
-			dev_err(dev, "Couldn't acquire RIF semaphore for peripheral %d (%d)\n",
-				id, err);
-			return err;
+			panic("Couldn't release RIF semaphore for peripheral %d (%d)\n", id, err);
 		}
-		dev_dbg(dev, "Acquiring semaphore for peripheral %d\n", id);
+		pr_debug("Releasing RIF semaphore for peripheral %d\n", id);
 	}
+}
 
-	return 0;
+void stm32_rifsc_release_access(ofnode device_node)
+{
+	struct ofnode_phandle_args args;
+	int err;
+
+	err = rifsc_parse_access_controller(device_node, &args);
+	if (err)
+		panic("Failed to parse access-controllers property\n");
+
+	stm32_rifsc_release_access_by_id(device_node, args.args[0]);
 }
 
-static int stm32_rifsc_child_post_remove(struct udevice *dev)
+static int stm32_rifsc_child_pre_probe(struct udevice *dev)
 {
-	struct stm32_rifsc_plat *plat = dev_get_plat(dev->parent);
 	struct stm32_rifsc_child_plat *child_plat = dev_get_parent_plat(dev);
-	u32 cid_reg_value;
-	int err;
-	u32 id = child_plat->domain_id;
 
-	cid_reg_value = readl(plat->base + RIFSC_RISC_PER0_CIDCFGR(id));
+	return stm32_rifsc_grant_access_by_id(dev_ofnode(dev), child_plat->domain_id);
+}
 
-	/*
-	 * If the peripheral is in semaphore mode, release the semaphore so that
-	 * there's no ownership.
-	 */
-	if (cid_reg_value & CIDCFGR_SEMEN &&
-	    (FIELD_GET(RIFSC_RISC_SEMWL_MASK, cid_reg_value) & BIT(RIF_CID1))) {
-		err = stm32_rif_release_semaphore(plat->base, id);
-		if (err)
-			dev_err(dev, "Couldn't release rif semaphore for peripheral %d (%d)\n",
-				id, err);
-	}
+static int stm32_rifsc_child_post_remove(struct udevice *dev)
+{
+	struct stm32_rifsc_child_plat *child_plat = dev_get_parent_plat(dev);
+
+	stm32_rifsc_release_access_by_id(dev_ofnode(dev), child_plat->domain_id);
 
 	return 0;
 }
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 18c0b1cb867..b487f33b6c7 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -430,7 +430,7 @@ static int stm32mp25_check_security(struct udevice *dev, void __iomem *base,
 		u32 index = (u32)cfg->sec_id;
 
 		if (index & SEC_RIFSC_FLAG)
-			ret = stm32_rifsc_check_access_by_id(dev_ofnode(dev),
+			ret = stm32_rifsc_grant_access_by_id(dev_ofnode(dev),
 							     index & ~SEC_RIFSC_FLAG);
 		else
 			ret = stm32_rcc_get_access(dev, index);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
