Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DEA30E92
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 15:11:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A398C640F7
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 13:11:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99639C640F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2019 13:11:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4VD6L6d014898; Fri, 31 May 2019 15:11:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=GshI000tqj9xWRB10XqP9bCH/VtvdwJGmfnueg8IPAk=;
 b=owfedqqxys+cVe/8T6BItg8/63KOkdvTy/iFfDDDsMJcZsq+9y1uDDhtpNz88bgdQrsR
 30hfw1h94dtWRM7/sDCCDcnDtSj2lrUxAaCmSIbG0jFQtbEcNBWAOOLFDBNnxUGilvL4
 vp7IapzK5+fp6P2acbVhs1YFcQKMWwNn/AATqg1PBRR8Sq2rMowo8eQAJv5KylBHs+zv
 ipZ4LWFvhx2wSN/z3LeTqhouWVbhNBMOyekVwtoCslP0tNzkJJN+MMqvfhndDGGRtUYS
 9qUCEIvuARjxfQod1yQLuYzfcrva2CySmC10jED5ZTyzk7kmYQbkkm27dbN/VzYgwLo6 /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2su26j0tsq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 31 May 2019 15:11:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F34D63A;
 Fri, 31 May 2019 13:11:44 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D20CA29C5;
 Fri, 31 May 2019 13:11:44 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May
 2019 15:11:44 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May 2019 15:11:43
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Fri, 31 May 2019 15:11:30 +0200
Message-ID: <1559308296-17027-2-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-31_08:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v3 1/7] dm: core: Introduce
	xxx_translate_dma_address()
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

Add the following functions to translate DMA address to CPU address:
- dev_translate_dma_address()
- ofnode_translate_dma_address()
- of_translate_dma_address()
- fdt_translate_dma_address()
These functions work the same way as xxx_translate_address(), with the
difference that the translation relies on the "dma-ranges" property
instead of the "ranges" property.

Add related test. Test report:
=> ut dm fdt_translation
Test: dm_test_fdt_translation: test-fdt.c
Test: dm_test_fdt_translation: test-fdt.c (flat tree)
Failures: 0

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 arch/sandbox/dts/test.dts |  4 ++++
 common/fdt_support.c      |  6 ++++++
 drivers/core/of_addr.c    |  4 ++++
 drivers/core/ofnode.c     |  8 ++++++++
 drivers/core/read.c       |  5 +++++
 include/dm/of_addr.h      | 18 ++++++++++++++++++
 include/dm/ofnode.h       | 16 +++++++++++++++-
 include/dm/read.h         | 20 +++++++++++++++++++-
 include/fdt_support.h     | 24 ++++++++++++++++++++++++
 test/dm/test-fdt.c        | 12 ++++++++++++
 10 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 8b2d645..a37e10c 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -732,6 +732,10 @@
 			  3 0x300 0xB000 0x1000
 			 >;
 
+		dma-ranges = <0 0x000 0x10000000 0x1000
+			      1 0x100 0x20000000 0x1000
+			     >;
+
 		dev@0,0 {
 			compatible = "denx,u-boot-fdt-dummy";
 			reg = <0 0x0 0x1000>;
diff --git a/common/fdt_support.c b/common/fdt_support.c
index 4e7cf6e..6ec0742 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -1279,6 +1279,12 @@ u64 fdt_translate_address(const void *blob, int node_offset,
 	return __of_translate_address(blob, node_offset, in_addr, "ranges");
 }
 
+u64 fdt_translate_dma_address(const void *blob, int node_offset,
+			      const fdt32_t *in_addr)
+{
+	return __of_translate_address(blob, node_offset, in_addr, "dma-ranges");
+}
+
 /**
  * fdt_node_offset_by_compat_reg: Find a node that matches compatiable and
  * who's reg property matches a physical cpu address
diff --git a/drivers/core/of_addr.c b/drivers/core/of_addr.c
index 1bfaaee..4e256d9 100644
--- a/drivers/core/of_addr.c
+++ b/drivers/core/of_addr.c
@@ -318,6 +318,10 @@ u64 of_translate_address(const struct device_node *dev, const __be32 *in_addr)
 	return __of_translate_address(dev, in_addr, "ranges");
 }
 
+u64 of_translate_dma_address(const struct device_node *dev, const __be32 *in_addr)
+{
+	return __of_translate_address(dev, in_addr, "dma-ranges");
+}
 
 static int __of_address_to_resource(const struct device_node *dev,
 		const __be32 *addrp, u64 size, unsigned int flags,
diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
index cc0c031..e68a735 100644
--- a/drivers/core/ofnode.c
+++ b/drivers/core/ofnode.c
@@ -763,6 +763,14 @@ u64 ofnode_translate_address(ofnode node, const fdt32_t *in_addr)
 		return fdt_translate_address(gd->fdt_blob, ofnode_to_offset(node), in_addr);
 }
 
+u64 ofnode_translate_dma_address(ofnode node, const fdt32_t *in_addr)
+{
+	if (ofnode_is_np(node))
+		return of_translate_dma_address(ofnode_to_np(node), in_addr);
+	else
+		return fdt_translate_dma_address(gd->fdt_blob, ofnode_to_offset(node), in_addr);
+}
+
 int ofnode_device_is_compatible(ofnode node, const char *compat)
 {
 	if (ofnode_is_np(node))
diff --git a/drivers/core/read.c b/drivers/core/read.c
index 6bda077..1a044b0 100644
--- a/drivers/core/read.c
+++ b/drivers/core/read.c
@@ -265,6 +265,11 @@ u64 dev_translate_address(struct udevice *dev, const fdt32_t *in_addr)
 	return ofnode_translate_address(dev_ofnode(dev), in_addr);
 }
 
+u64 dev_translate_dma_address(struct udevice *dev, const fdt32_t *in_addr)
+{
+	return ofnode_translate_dma_address(dev_ofnode(dev), in_addr);
+}
+
 int dev_read_alias_highest_id(const char *stem)
 {
 	if (of_live_active())
diff --git a/include/dm/of_addr.h b/include/dm/of_addr.h
index 12b1a99..3fa1ffc 100644
--- a/include/dm/of_addr.h
+++ b/include/dm/of_addr.h
@@ -27,6 +27,24 @@
 u64 of_translate_address(const struct device_node *no, const __be32 *in_addr);
 
 /**
+ * of_translate_dma_address() - translate a device-tree DMA address to a CPU
+ *				address
+ *
+ * Translate a DMA address from the device-tree into a CPU physical address,
+ * this walks up the tree and applies the various bus mappings on the way.
+ *
+ * Note: We consider that crossing any level with #size-cells == 0 to mean
+ * that translation is impossible (that is we are not dealing with a value
+ * that can be mapped to a cpu physical address). This is not really specified
+ * that way, but this is traditionally the way IBM at least do things
+ *
+ * @np: node to check
+ * @in_addr: pointer to input DMA address
+ * @return translated DMA address or OF_BAD_ADDR on error
+ */
+u64 of_translate_dma_address(const struct device_node *no, const __be32 *in_addr);
+
+/**
  * of_get_address() - obtain an address from a node
  *
  * Extract an address from a node, returns the region size and the address
diff --git a/include/dm/ofnode.h b/include/dm/ofnode.h
index d206ee2..07a3f93 100644
--- a/include/dm/ofnode.h
+++ b/include/dm/ofnode.h
@@ -751,7 +751,7 @@ ofnode ofnode_by_prop_value(ofnode from, const char *propname,
 	     node = ofnode_next_subnode(node))
 
 /**
- * ofnode_translate_address() - Tranlate a device-tree address
+ * ofnode_translate_address() - Translate a device-tree address
  *
  * Translate an address from the device-tree into a CPU physical address. This
  * function walks up the tree and applies the various bus mappings along the
@@ -765,6 +765,20 @@ ofnode ofnode_by_prop_value(ofnode from, const char *propname,
 u64 ofnode_translate_address(ofnode node, const fdt32_t *in_addr);
 
 /**
+ * ofnode_translate_dma_address() - Translate a device-tree DMA address
+ *
+ * Translate a DMA address from the device-tree into a CPU physical address.
+ * This function walks up the tree and applies the various bus mappings along
+ * the way.
+ *
+ * @ofnode: Device tree node giving the context in which to translate the
+ *          DMA address
+ * @in_addr: pointer to the DMA address to translate
+ * @return the translated DMA address; OF_BAD_ADDR on error
+ */
+u64 ofnode_translate_dma_address(ofnode node, const fdt32_t *in_addr);
+
+/**
  * ofnode_device_is_compatible() - check if the node is compatible with compat
  *
  * This allows to check whether the node is comaptible with the compat.
diff --git a/include/dm/read.h b/include/dm/read.h
index 60b727c..62d4be6 100644
--- a/include/dm/read.h
+++ b/include/dm/read.h
@@ -499,7 +499,7 @@ int dev_read_resource_byname(struct udevice *dev, const char *name,
 			     struct resource *res);
 
 /**
- * dev_translate_address() - Tranlate a device-tree address
+ * dev_translate_address() - Translate a device-tree address
  *
  * Translate an address from the device-tree into a CPU physical address.  This
  * function walks up the tree and applies the various bus mappings along the
@@ -512,6 +512,19 @@ int dev_read_resource_byname(struct udevice *dev, const char *name,
 u64 dev_translate_address(struct udevice *dev, const fdt32_t *in_addr);
 
 /**
+ * dev_translate_dma_address() - Translate a device-tree DMA address
+ *
+ * Translate a DMA address from the device-tree into a CPU physical address.
+ * This function walks up the tree and applies the various bus mappings along
+ * the way.
+ *
+ * @dev: device giving the context in which to translate the DMA address
+ * @in_addr: pointer to the DMA address to translate
+ * @return the translated DMA address; OF_BAD_ADDR on error
+ */
+u64 dev_translate_dma_address(struct udevice *dev, const fdt32_t *in_addr);
+
+/**
  * dev_read_alias_highest_id - Get highest alias id for the given stem
  * @stem:	Alias stem to be examined
  *
@@ -751,6 +764,11 @@ static inline u64 dev_translate_address(struct udevice *dev, const fdt32_t *in_a
 	return ofnode_translate_address(dev_ofnode(dev), in_addr);
 }
 
+static inline u64 dev_translate_dma_address(struct udevice *dev, const fdt32_t *in_addr)
+{
+	return ofnode_translate_dma_address(dev_ofnode(dev), in_addr);
+}
+
 static inline int dev_read_alias_highest_id(const char *stem)
 {
 	return fdtdec_get_alias_highest_id(gd->fdt_blob, stem);
diff --git a/include/fdt_support.h b/include/fdt_support.h
index 27fe564..cefb2b2 100644
--- a/include/fdt_support.h
+++ b/include/fdt_support.h
@@ -218,8 +218,32 @@ static inline void fdt_fixup_mtdparts(void *fdt,
 #endif
 
 void fdt_del_node_and_alias(void *blob, const char *alias);
+
+/**
+ * Translate an address from the DT into a CPU physical address
+ *
+ * The translation relies on the "ranges" property.
+ *
+ * @param blob		Pointer to device tree blob
+ * @param node_offset	Node DT offset
+ * @param in_addr	Pointer to the address to translate
+ * @return translated address or OF_BAD_ADDR on error
+ */
 u64 fdt_translate_address(const void *blob, int node_offset,
 			  const __be32 *in_addr);
+/**
+ * Translate a DMA address from the DT into a CPU physical address
+ *
+ * The translation relies on the "dma-ranges" property.
+ *
+ * @param blob		Pointer to device tree blob
+ * @param node_offset	Node DT offset
+ * @param in_addr	Pointer to the DMA address to translate
+ * @return translated DMA address or OF_BAD_ADDR on error
+ */
+u64 fdt_translate_dma_address(const void *blob, int node_offset,
+			      const __be32 *in_addr);
+
 int fdt_node_offset_by_compat_reg(void *blob, const char *compat,
 					phys_addr_t compat_off);
 int fdt_alloc_phandle(void *blob);
diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
index be16c99..ad85916 100644
--- a/test/dm/test-fdt.c
+++ b/test/dm/test-fdt.c
@@ -490,6 +490,7 @@ U_BOOT_DRIVER(fdt_dummy_drv) = {
 static int dm_test_fdt_translation(struct unit_test_state *uts)
 {
 	struct udevice *dev;
+	fdt32_t dma_addr[2];
 
 	/* Some simple translations */
 	ut_assertok(uclass_find_device_by_seq(UCLASS_TEST_DUMMY, 0, true, &dev));
@@ -509,6 +510,17 @@ static int dm_test_fdt_translation(struct unit_test_state *uts)
 	ut_asserteq_str("dev@42", dev->name);
 	ut_asserteq(0x42, dev_read_addr(dev));
 
+	/* dma address translation */
+	ut_assertok(uclass_find_device_by_seq(UCLASS_TEST_DUMMY, 0, true, &dev));
+	dma_addr[0] = cpu_to_be32(0);
+	dma_addr[1] = cpu_to_be32(0);
+	ut_asserteq(0x10000000, dev_translate_dma_address(dev, dma_addr));
+
+	ut_assertok(uclass_find_device_by_seq(UCLASS_TEST_DUMMY, 1, true, &dev));
+	dma_addr[0] = cpu_to_be32(1);
+	dma_addr[1] = cpu_to_be32(0x100);
+	ut_asserteq(0x20000000, dev_translate_dma_address(dev, dma_addr));
+
 	return 0;
 }
 DM_TEST(dm_test_fdt_translation, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
