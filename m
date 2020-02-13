Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C70F415CAB0
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 19:48:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74380C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 18:48:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14EBCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 18:48:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01DIgnUD003041; Thu, 13 Feb 2020 19:48:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Yov5GduKefnyz9maCo3Dgb8NUhAgAn28UhWDxNBScJc=;
 b=hB7a1yIe9pU4eJGpTxL/U9d6HONFX/O1dJJt1+KhSkptNkUlUT+E1UY2vFFqm0ILNTC8
 jQ+mcpLYFgVC5nxhWeYhW5MUyUJTjLJDFe9AFbFG4xRTINcnSTmDBWeVWS4PiUAP97D6
 hYjDHq/BC16BvRyh0su5zMmxHMnxaiVz1vWAN02es+7J5vaXnJlSGw1iLiIdDxtNkBKs
 +4LL0W0Itw+dRBHsmzP6s7oCzW7by5tPuAs/Pz9bpFpjFlsjGGY+sILflvs4+lIM/RYd
 l2GE8+sVoG1OgkjeYLiaZZ4wma6PMPPYNYJNGseDQqPXjz3MoEO20aZ7j6JLVJtl7w4b tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda6ukd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 19:48:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D8C110002A;
 Thu, 13 Feb 2020 19:48:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00F362109E5;
 Thu, 13 Feb 2020 19:48:05 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 13 Feb 2020 19:48:04 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 13 Feb 2020 19:48:00 +0100
Message-ID: <20200213184800.13968-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_07:2020-02-12,
 2020-02-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Rajan Vaja <rajan.vaja@xilinx.com>
Subject: [Uboot-stm32] [PATCH v2] dm: core: Move "/chosen" and "/firmware"
	node scan
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

Use the new function dm_scan_fdt_ofnode_path() to scan all the nodes
which aren't devices themselves but may contain some:
- "/chosen"
- "/clocks"
- "/firmware"

The patch removes the strcmp call in recursive function dm_scan_fdt_live()
and also corrects a conflict with the 2 applied patches in
the commit 1712ca21924b ("dm: core: Scan /firmware node by default")
and in the commit 747558d01457 ("dm: fdt: scan for devices under
/firmware too"): the subnodes of "/firmware" (optee for example)
are bound 2 times.

For example the dm tree command result on STM32MP1 is:

STM32MP> dm tree
 Class     Index  Probed  Driver                Name
 -----------------------------------------------------------
 root          0  [ + ]   root_driver           root_driver
 firmware      0  [   ]   psci                  |-- psci
 sysreset      0  [   ]   psci-sysreset         |   `-- psci-sysreset
 simple_bus    0  [ + ]   generic_simple_bus    |-- soc
...
 tee           0  [ + ]   optee                 |-- optee
...
 tee           1  [   ]   optee                 `-- optee

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- update commit message (Serie-cc => Series-cc)

 drivers/core/root.c | 52 +++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/core/root.c b/drivers/core/root.c
index e85643819e..14df16c280 100644
--- a/drivers/core/root.c
+++ b/drivers/core/root.c
@@ -203,15 +203,6 @@ static int dm_scan_fdt_live(struct udevice *parent,
 	int ret = 0, err;
 
 	for (np = node_parent->child; np; np = np->sibling) {
-		/* "chosen" node isn't a device itself but may contain some: */
-		if (!strcmp(np->name, "chosen")) {
-			pr_debug("parsing subnodes of \"chosen\"\n");
-
-			err = dm_scan_fdt_live(parent, np, pre_reloc_only);
-			if (err && !ret)
-				ret = err;
-			continue;
-		}
 
 		if (!of_device_is_available(np)) {
 			pr_debug("   - ignoring disabled device\n");
@@ -256,21 +247,6 @@ static int dm_scan_fdt_node(struct udevice *parent, const void *blob,
 	     offset = fdt_next_subnode(blob, offset)) {
 		const char *node_name = fdt_get_name(blob, offset, NULL);
 
-		/*
-		 * The "chosen" and "firmware" nodes aren't devices
-		 * themselves but may contain some:
-		 */
-		if (!strcmp(node_name, "chosen") ||
-		    !strcmp(node_name, "firmware")) {
-			pr_debug("parsing subnodes of \"%s\"\n", node_name);
-
-			err = dm_scan_fdt_node(parent, blob, offset,
-					       pre_reloc_only);
-			if (err && !ret)
-				ret = err;
-			continue;
-		}
-
 		if (!fdtdec_get_is_enabled(blob, offset)) {
 			pr_debug("   - ignoring disabled device\n");
 			continue;
@@ -315,7 +291,8 @@ int dm_scan_fdt(const void *blob, bool pre_reloc_only)
 	return dm_scan_fdt_node(gd->dm_root, blob, 0, pre_reloc_only);
 }
 
-static int dm_scan_fdt_ofnode_path(const char *path, bool pre_reloc_only)
+static int dm_scan_fdt_ofnode_path(const void *blob, const char *path,
+				   bool pre_reloc_only)
 {
 	ofnode node;
 
@@ -327,13 +304,18 @@ static int dm_scan_fdt_ofnode_path(const char *path, bool pre_reloc_only)
 	if (of_live_active())
 		return dm_scan_fdt_live(gd->dm_root, node.np, pre_reloc_only);
 #endif
-	return dm_scan_fdt_node(gd->dm_root, gd->fdt_blob, node.of_offset,
+	return dm_scan_fdt_node(gd->dm_root, blob, node.of_offset,
 				pre_reloc_only);
 }
 
 int dm_extended_scan_fdt(const void *blob, bool pre_reloc_only)
 {
-	int ret;
+	int ret, i;
+	const char * const nodes[] = {
+		"/chosen",
+		"/clocks",
+		"/firmware"
+	};
 
 	ret = dm_scan_fdt(blob, pre_reloc_only);
 	if (ret) {
@@ -341,16 +323,16 @@ int dm_extended_scan_fdt(const void *blob, bool pre_reloc_only)
 		return ret;
 	}
 
-	ret = dm_scan_fdt_ofnode_path("/clocks", pre_reloc_only);
-	if (ret) {
-		debug("scan for /clocks failed: %d\n", ret);
-		return ret;
+	/* Some nodes aren't devices themselves but may contain some */
+	for (i = 0; i < ARRAY_SIZE(nodes); i++) {
+		ret = dm_scan_fdt_ofnode_path(blob, nodes[i], pre_reloc_only);
+		if (ret) {
+			debug("dm_scan_fdt() scan for %s failed: %d\n",
+			      nodes[i], ret);
+			return ret;
+		}
 	}
 
-	ret = dm_scan_fdt_ofnode_path("/firmware", pre_reloc_only);
-	if (ret)
-		debug("scan for /firmware failed: %d\n", ret);
-
 	return ret;
 }
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
