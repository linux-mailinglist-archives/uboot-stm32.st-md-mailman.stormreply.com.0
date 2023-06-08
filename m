Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F09728375
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:16:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16DD5C6905A;
	Thu,  8 Jun 2023 15:16:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3174C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:16:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358DknaI007652; Thu, 8 Jun 2023 17:16:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=KJ0GX8aAS3OpXqiHs6peGLW7b1JGR0nDkos6ZKtj2Sw=;
 b=TOCBdEKaoEV0dr1XnKm01gPZCSVvHQZl3kj3cf2FbAhSWGzYZm3aSuUXzhljylFbPa5d
 KddgZGNIg+EZtKkQQuDfwtu/RwYscA5IjMq0UO16OsjXIaUqKuuE7IrJhXB62+hjU8Z4
 ESWTvBkT+nubaxAFnhv7b2czXlDzw9m6SMIO903Reog2B3T1bIgOosliTttWFVNqt03k
 JVgewEecJln3Kvp3rTbkfXsauE2c1Fpls1vjOQCI2cN257R5NaxC5ErxqQfih6jcAxvj
 GNrjzjC0vxOEkdejLDWQFXoS/GmhtjYP62AUFmptE6mPXfzNz5HLBmCIIwGsRAGutr32 Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3cax2ahw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:16:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16ED710003A;
 Thu,  8 Jun 2023 17:16:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10F4F21A231;
 Thu,  8 Jun 2023 17:16:55 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:16:54 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:38 +0200
Message-ID: <20230608171614.2.Idd521a274f1b0524963a501324a1702a5a8b52c1@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 02/12] fdt_support: add
	fdt_copy_fixed_partitions function
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

Add a new function fdt_copy_fixed_partitions to copy the fixed
partition nodes from U-Boot device tree to Linux kernel
device tree and to dynamically configure the MTD partitions.

This function fdt_copy_fixed_partitions is only based on device tree
with livetree compatible function and replace the function
fdt_fixup_mtdparts based on mtdparts variable.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 common/fdt_support.c  | 73 +++++++++++++++++++++++++++++++++++++++++++
 include/fdt_support.h |  8 +++++
 2 files changed, 81 insertions(+)

diff --git a/common/fdt_support.c b/common/fdt_support.c
index ffc59fd8b36a..5e49078f8c35 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -1051,6 +1051,79 @@ void fdt_fixup_mtdparts(void *blob, const struct node_info *node_info,
 }
 #endif
 
+int fdt_copy_fixed_partitions(void *blob)
+{
+	ofnode node, subnode;
+	int off, suboff, res;
+	char path[256];
+	int address_cells, size_cells;
+	u8 i, j, child_count;
+
+	node = ofnode_by_compatible(ofnode_null(), "fixed-partitions");
+	while (ofnode_valid(node)) {
+		/* copy the U-Boot fixed partition */
+		address_cells = ofnode_read_simple_addr_cells(node);
+		size_cells = ofnode_read_simple_size_cells(node);
+
+		res = ofnode_get_path(ofnode_get_parent(node), path, sizeof(path));
+		if (res)
+			return res;
+
+		off = fdt_path_offset(blob, path);
+		if (off < 0)
+			return -ENODEV;
+
+		off = fdt_find_or_add_subnode(blob, off, "partitions");
+		res = fdt_setprop_string(blob, off, "compatible", "fixed-partitions");
+		if (res)
+			return res;
+
+		res = fdt_setprop_u32(blob, off, "#address-cells", address_cells);
+		if (res)
+			return res;
+
+		res = fdt_setprop_u32(blob, off, "#size-cells", size_cells);
+		if (res)
+			return res;
+
+		/*
+		 * parse partition in reverse order as fdt_find_or_add_subnode() only
+		 * insert the new node after the parent's properties
+		 */
+		child_count = ofnode_get_child_count(node);
+		for (i = child_count; i > 0 ; i--) {
+			subnode = ofnode_first_subnode(node);
+			if (!ofnode_valid(subnode))
+				break;
+
+			for (j = 0; (j < i - 1); j++)
+				subnode = ofnode_next_subnode(subnode);
+
+			if (!ofnode_valid(subnode))
+				break;
+
+			const u32 *reg;
+			int len;
+
+			suboff = fdt_find_or_add_subnode(blob, off, ofnode_get_name(subnode));
+			res = fdt_setprop_string(blob, suboff, "label",
+						 ofnode_read_string(subnode, "label"));
+			if (res)
+				return res;
+
+			reg = ofnode_get_property(subnode, "reg", &len);
+			res = fdt_setprop(blob, suboff, "reg", reg, len);
+			if (res)
+				return res;
+		}
+
+		/* go to next fixed-partitions node */
+		node = ofnode_by_compatible(node, "fixed-partitions");
+	}
+
+	return 0;
+}
+
 void fdt_del_node_and_alias(void *blob, const char *alias)
 {
 	int off = fdt_path_offset(blob, alias);
diff --git a/include/fdt_support.h b/include/fdt_support.h
index eeb83e6251d3..2cd836689821 100644
--- a/include/fdt_support.h
+++ b/include/fdt_support.h
@@ -256,6 +256,14 @@ static inline void fdt_fixup_mtdparts(void *fdt,
 }
 #endif
 
+/**
+ * copy the fixed-partition nodes from U-Boot device tree to external blob
+ *
+ * @param blob		FDT blob to update
+ * Return: 0 if ok, or non-zero on error
+ */
+int fdt_copy_fixed_partitions(void *blob);
+
 void fdt_del_node_and_alias(void *blob, const char *alias);
 
 /**
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
