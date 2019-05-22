Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456F25F0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 10:07:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E86FBC69F24
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 08:07:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CFBDC62B40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 08:07:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M87KAC002965; Wed, 22 May 2019 10:07:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=djOQ0ysaIaKQQMQCbGP79CVgFydPTICvUGIiQ65nf0c=;
 b=HlJ5yonUc0Hvn5eq1z9VUAaWpPyWP4J/BYvffluXm09MPbiGwwM6DgXD0EIcV0i3NaRb
 +jQ1/a+pFs6ISsBoNFugh7g4Ge3knnFchiEmbn7i3i1G/JFvO8J+c8rWLtYqt5rQuGYe
 mZCsLXZ/k84xzbRcN7pCdApwA5BZa2kbWY4v+s35OHIhyrOKpgXVsIDaw+MJ6ImA7gAE
 9JjpZ0V9f2ocC+IhAZa4Mq625laH/YorjLJI+ue0d63x+Y2SXcvMMFUHerWwT/F9sHcz
 mPcRhPyqqFyFHaF8ECaZGCF+3btnQLUO1oUR9dA58qSyh/qBgMpVMTOLk9SHspObMAaJ fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj8xgeu6f-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 10:07:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92B0634;
 Wed, 22 May 2019 08:07:07 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7478A18B2;
 Wed, 22 May 2019 08:07:07 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.44) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 10:07:07 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 10:07:06
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Wed, 22 May 2019 10:06:44 +0200
Message-ID: <1558512409-32376-3-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_03:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 2/7] dm: core: Introduce
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
These functions work the same way as xxx_translate_address(), with the
difference that the translation relies on the "dma-ranges" property
instead of the "ranges" property.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/core/of_addr.c |  4 ++++
 drivers/core/ofnode.c  |  8 ++++++++
 drivers/core/read.c    |  5 +++++
 include/dm/of_addr.h   | 18 ++++++++++++++++++
 include/dm/ofnode.h    | 16 +++++++++++++++-
 include/dm/read.h      | 20 +++++++++++++++++++-
 6 files changed, 69 insertions(+), 2 deletions(-)

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
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
