Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CDC3132C9
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Feb 2021 13:54:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47A47C57188;
	Mon,  8 Feb 2021 12:54:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B134AC5717D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 12:54:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118Cr4xn027419; Mon, 8 Feb 2021 13:54:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=9CU38UkQgv309wNo41weoLx7Xy2VFu7qCtVG8lTx+YU=;
 b=T4DfKEuV4/+p+9+KI8bdAyrvhg+7zi0QIm35sJvNiMusOCh0jv+eHXTjnwcMH06PyvnV
 sx68+dThqqNpEqWjJ8FKkUTEazfpX3wSxI+8og3xXwsLonYESoDtgJQMpvivLH+0eo3t
 jWJOym/J+q5aMdvoaelAKuNBD0drIKj3lthYz4Wp2A2VTtuVYReBz1jvVpldvc1OQz3g
 /AhE7zMNxE5MhLRknodUnD3hO1FFSsIY8g5cP7J7ThOGWf+0oWsmSMyURhjETY4oMtP/
 biYjcYj2gQS7uMJ7YYg13z07MhPI1iG+4JhBHNehKqBGRDqVllCISFHzf94iber+0h9Q 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hr31a2wm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 13:54:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E6A2A10002A;
 Mon,  8 Feb 2021 13:54:37 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B28C724A168;
 Mon,  8 Feb 2021 13:54:37 +0100 (CET)
Received: from localhost (10.75.127.123) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 8 Feb 2021 13:54:37 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Feb 2021 13:54:31 +0100
Message-ID: <20210208135415.1.Ia7aa7196b93409a8618ac1ff79305061d08aa885@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG3NODE5.st.com (10.75.127.72) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_06:2021-02-08,
 2021-02-08 signatures=0
Cc: chenshuo <chenshuo@eswin.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Hongwei Zhang <hongweiz@ami.com>,
 Tero Kristo <t-kristo@ti.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH] lib: optee: migration optee_copy_fdt_nodes
	for OF_LIVE support
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

The optee_copy_fdt_nodes is only used to copy op-tee nodes
of U-Boot device tree (from gd->fdt_blob when OF_LIVE is not activated)
to external device tree but it is not compatible with OF_LIVE.

This patch migrates all used function fdt_ functions to read node on
old_blob to ofnode functions, compatible with OF_LIVE and remove this
parameter "old_blob".

The generated "device tree" is checked on stm32mp platform with OF_LIVE
activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 common/image-fdt.c  |  2 +-
 include/tee/optee.h |  4 ++--
 lib/optee/optee.c   | 45 ++++++++++++++++++---------------------------
 3 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/common/image-fdt.c b/common/image-fdt.c
index 707b44a69d..bf5fbbf6e9 100644
--- a/common/image-fdt.c
+++ b/common/image-fdt.c
@@ -561,7 +561,7 @@ int image_setup_libfdt(bootm_headers_t *images, void *blob,
 		goto err;
 	}
 
-	fdt_ret = optee_copy_fdt_nodes(gd->fdt_blob, blob);
+	fdt_ret = optee_copy_fdt_nodes(blob);
 	if (fdt_ret) {
 		printf("ERROR: transfer of optee nodes to new fdt failed: %s\n",
 		       fdt_strerror(fdt_ret));
diff --git a/include/tee/optee.h b/include/tee/optee.h
index affa937da0..ebdfe5e98d 100644
--- a/include/tee/optee.h
+++ b/include/tee/optee.h
@@ -71,9 +71,9 @@ static inline int optee_verify_bootm_image(unsigned long image_addr,
 #endif
 
 #if defined(CONFIG_OPTEE) && defined(CONFIG_OF_LIBFDT)
-int optee_copy_fdt_nodes(const void *old_blob, void *new_blob);
+int optee_copy_fdt_nodes(void *new_blob);
 #else
-static inline int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
+static inline int optee_copy_fdt_nodes(void *new_blob)
 {
 	return 0;
 }
diff --git a/lib/optee/optee.c b/lib/optee/optee.c
index 9e6606568f..a097fec28b 100644
--- a/lib/optee/optee.c
+++ b/lib/optee/optee.c
@@ -8,6 +8,8 @@
 #include <image.h>
 #include <log.h>
 #include <malloc.h>
+#include <dm/ofnode.h>
+#include <linux/ioport.h>
 #include <linux/libfdt.h>
 #include <tee/optee.h>
 
@@ -69,17 +71,11 @@ error:
 }
 
 #if defined(CONFIG_OF_LIBFDT)
-static int optee_copy_firmware_node(const void *old_blob, void *fdt_blob)
+static int optee_copy_firmware_node(ofnode node, void *fdt_blob)
 {
-	int old_offs, offs, ret, len;
+	int offs, ret, len;
 	const void *prop;
 
-	old_offs = fdt_path_offset(old_blob, "/firmware/optee");
-	if (old_offs < 0) {
-		debug("Original OP-TEE Device Tree node not found");
-		return old_offs;
-	}
-
 	offs = fdt_path_offset(fdt_blob, "/firmware");
 	if (offs < 0) {
 		offs = fdt_path_offset(fdt_blob, "/");
@@ -96,7 +92,7 @@ static int optee_copy_firmware_node(const void *old_blob, void *fdt_blob)
 		return offs;
 
 	/* copy the compatible property */
-	prop = fdt_getprop(old_blob, old_offs, "compatible", &len);
+	prop = ofnode_get_property(node, "compatible", &len);
 	if (!prop) {
 		debug("missing OP-TEE compatible property");
 		return -EINVAL;
@@ -107,7 +103,7 @@ static int optee_copy_firmware_node(const void *old_blob, void *fdt_blob)
 		return ret;
 
 	/* copy the method property */
-	prop = fdt_getprop(old_blob, old_offs, "method", &len);
+	prop = ofnode_get_property(node, "method", &len);
 	if (!prop) {
 		debug("missing OP-TEE method property");
 		return -EINVAL;
@@ -120,19 +116,18 @@ static int optee_copy_firmware_node(const void *old_blob, void *fdt_blob)
 	return 0;
 }
 
-int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
+int optee_copy_fdt_nodes(void *new_blob)
 {
-	int nodeoffset, subnode, ret;
-	struct fdt_resource res;
-
-	if (fdt_check_header(old_blob))
-		return -EINVAL;
+	ofnode node, subnode;
+	int ret;
+	struct resource res;
 
 	if (fdt_check_header(new_blob))
 		return -EINVAL;
 
 	/* only proceed if there is an /firmware/optee node */
-	if (fdt_path_offset(old_blob, "/firmware/optee") < 0) {
+	node = ofnode_path("/firmware/optee");
+	if (!ofnode_valid(node)) {
 		debug("No OP-TEE firmware node in old fdt, nothing to do");
 		return 0;
 	}
@@ -147,20 +142,17 @@ int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
 		return 0;
 	}
 
-	ret = optee_copy_firmware_node(old_blob, new_blob);
+	ret = optee_copy_firmware_node(node, new_blob);
 	if (ret < 0) {
 		printf("Failed to add OP-TEE firmware node\n");
 		return ret;
 	}
 
 	/* optee inserts its memory regions as reserved-memory nodes */
-	nodeoffset = fdt_subnode_offset(old_blob, 0, "reserved-memory");
-	if (nodeoffset >= 0) {
-		for (subnode = fdt_first_subnode(old_blob, nodeoffset);
-		     subnode >= 0;
-		     subnode = fdt_next_subnode(old_blob, subnode)) {
-			const char *name = fdt_get_name(old_blob,
-							subnode, NULL);
+	node = ofnode_path("/reserved-memory");
+	if (ofnode_valid(node)) {
+		ofnode_for_each_subnode(subnode, node) {
+			const char *name = ofnode_get_name(subnode);
 			if (!name)
 				return -EINVAL;
 
@@ -169,8 +161,7 @@ int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
 				continue;
 
 			/* check if this subnode has a reg property */
-			ret = fdt_get_resource(old_blob, subnode, "reg", 0,
-					       &res);
+			ret = ofnode_read_resource(subnode, 0, &res);
 			if (!ret) {
 				struct fdt_memory carveout = {
 					.start = res.start,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
