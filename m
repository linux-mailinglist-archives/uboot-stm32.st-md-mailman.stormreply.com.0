Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C23F7264A18
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 18:44:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8013FC3FAFE
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 16:44:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79944C3FAE1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 16:44:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AGbmA4028518; Thu, 10 Sep 2020 18:44:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=/X0ipfVh87C8T921CBHb9f9Bl/2aAJ45kF2ZocmEf9g=;
 b=IzCKUGNQmfareGhUYxFsqMPTAKQg/nlOpVYlTxbxTR51QOyIxhNmRvy2sW7tI2srDfe2
 OCGjzlvFPl0BsZ/luPX/NsFZrd1N0yJGDG0KJVch4joKYGsNJTlRZSQlF9I0vgCVzqPW
 NjcTSkC4nIT92Mzh1IJknyxBaceuc8fcTyRl4/+FZYqaD0RVUPejfJmN71dXrYPLGf24
 8qd94VjSM1tH1uFsYhR1Yf0ekEBP4oPOVMDTGwOM9lAmyBTg75AhtcNPB0VyI+BzH3U1
 336FaNAsEaGAGRJXvQW0p9NzGfVSSQ605dJ5QE5Go3ECHpw946mvXFcWsNbura9bRVf+ iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33byt84x4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 18:44:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D09F100034;
 Thu, 10 Sep 2020 18:44:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D86582BE221;
 Thu, 10 Sep 2020 18:44:01 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 10 Sep 2020 18:43:43 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Sep 2020 18:43:41 +0200
Message-ID: <20200910164341.29613-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_05:2020-09-10,
 2020-09-10 signatures=0
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Simon Glass <sjg@chromium.org>,
 Weijie Gao <weijie.gao@mediatek.com>, Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Lukasz Majewski <lukma@denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [RFC PATCH] dm: add cells_count parameter in
	*_count_phandle_with_args
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

The cell_count argument is required when cells_name is NULL.

This patch adds this parameter in live tree API
- of_count_phandle_with_args
- ofnode_count_phandle_with_args
- dev_count_phandle_with_args

This parameter solves issue when these API is used to count
the number of element of a cell without cell name. This parameter
allow to force the size cell.

For example:
  count = dev_count_phandle_with_args(dev, "array", NULL, 3);

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
I push today this RFC.

It is linked to previous serie [1] but it is not a blocking point today
as no user use this API with cells_name = NULL
+ dev_count_phandle_with_args
+ ofnode_count_phandle_with_args

But I think it is the good time to modify these functions as they are not
hugely used: it is the proposition in this RFC.

It is just a RFC because I don't sure if I can modify the existing API
even if parameters are aligned with *_parse_phandle_with_args.

I can also to add new APIs to use when cells_name is NULL:
+ dev_count_phandle_with_cell_count(node, list_name, cell_count);
+ ofnode_count_phandle_with_cell_count(node, list_name, cell_count);

and raise a error if cells_name == NULL in existing function
+ dev_count_phandle_with_args
+ ofnode_count_phandle_with_args

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=200899
    "dm: add cells_count parameter in live DT APIs of_parse_phandle_with_args"


 board/st/stm32mp1/stm32mp1.c    | 2 +-
 drivers/clk/clk-uclass.c        | 4 ++--
 drivers/core/of_access.c        | 7 ++++---
 drivers/core/ofnode.c           | 6 +++---
 drivers/core/read.c             | 5 +++--
 drivers/phy/phy-uclass.c        | 2 +-
 drivers/reset/reset-uclass.c    | 2 +-
 drivers/usb/host/ehci-generic.c | 4 ++--
 include/dm/of_access.h          | 4 +++-
 include/dm/ofnode.h             | 3 ++-
 include/dm/read.h               | 8 +++++---
 11 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 3b677d339b..03a19af930 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -314,7 +314,7 @@ static int board_check_usb_power(void)
 	 * for each of them
 	 */
 	adc_count = ofnode_count_phandle_with_args(node, "st,adc_usb_pd",
-						   "#io-channel-cells");
+						   "#io-channel-cells", 0);
 	if (adc_count < 0) {
 		if (adc_count == -ENOENT)
 			return 0;
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 934cd5787a..b1d8f1adaf 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -160,7 +160,7 @@ int clk_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
 	
 	bulk->count = 0;
 
-	count = dev_count_phandle_with_args(dev, "clocks", "#clock-cells");
+	count = dev_count_phandle_with_args(dev, "clocks", "#clock-cells", 0);
 	if (count < 1)
 		return count;
 
@@ -195,7 +195,7 @@ static int clk_set_default_parents(struct udevice *dev, int stage)
 	int ret;
 
 	num_parents = dev_count_phandle_with_args(dev, "assigned-clock-parents",
-						  "#clock-cells");
+						  "#clock-cells", 0);
 	if (num_parents < 0) {
 		debug("%s: could not read assigned-clock-parents for %p\n",
 		      __func__, dev);
diff --git a/drivers/core/of_access.c b/drivers/core/of_access.c
index bcf1644d05..0a12e9b26f 100644
--- a/drivers/core/of_access.c
+++ b/drivers/core/of_access.c
@@ -756,10 +756,11 @@ int of_parse_phandle_with_args(const struct device_node *np,
 }
 
 int of_count_phandle_with_args(const struct device_node *np,
-			       const char *list_name, const char *cells_name)
+			       const char *list_name, const char *cells_name,
+			       int cell_count)
 {
-	return __of_parse_phandle_with_args(np, list_name, cells_name, 0,
-					    -1, NULL);
+	return __of_parse_phandle_with_args(np, list_name, cells_name,
+					    cell_count, -1, NULL);
 }
 
 static void of_alias_add(struct alias_prop *ap, struct device_node *np,
diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
index 79fcdf5ce2..7d1b89514c 100644
--- a/drivers/core/ofnode.c
+++ b/drivers/core/ofnode.c
@@ -432,15 +432,15 @@ int ofnode_parse_phandle_with_args(ofnode node, const char *list_name,
 }
 
 int ofnode_count_phandle_with_args(ofnode node, const char *list_name,
-				   const char *cells_name)
+				   const char *cells_name, int cell_count)
 {
 	if (ofnode_is_np(node))
 		return of_count_phandle_with_args(ofnode_to_np(node),
-				list_name, cells_name);
+				list_name, cells_name, cell_count);
 	else
 		return fdtdec_parse_phandle_with_args(gd->fdt_blob,
 				ofnode_to_offset(node), list_name, cells_name,
-				0, -1, NULL);
+				cell_count, -1, NULL);
 }
 
 ofnode ofnode_path(const char *path)
diff --git a/drivers/core/read.c b/drivers/core/read.c
index 86f3f88170..076125824c 100644
--- a/drivers/core/read.c
+++ b/drivers/core/read.c
@@ -214,10 +214,11 @@ int dev_read_phandle_with_args(const struct udevice *dev, const char *list_name,
 }
 
 int dev_count_phandle_with_args(const struct udevice *dev,
-				const char *list_name, const char *cells_name)
+				const char *list_name, const char *cells_name,
+				int cell_count)
 {
 	return ofnode_count_phandle_with_args(dev_ofnode(dev), list_name,
-					      cells_name);
+					      cells_name, cell_count);
 }
 
 int dev_read_addr_cells(const struct udevice *dev)
diff --git a/drivers/phy/phy-uclass.c b/drivers/phy/phy-uclass.c
index db7f39cd0b..8713b8e7b7 100644
--- a/drivers/phy/phy-uclass.c
+++ b/drivers/phy/phy-uclass.c
@@ -179,7 +179,7 @@ int generic_phy_get_bulk(struct udevice *dev, struct phy_bulk *bulk)
 	if (!dev_read_prop(dev, "phys", NULL))
 		return 0;
 
-	count = dev_count_phandle_with_args(dev, "phys", "#phy-cells");
+	count = dev_count_phandle_with_args(dev, "phys", "#phy-cells", 0);
 	if (count < 1)
 		return count;
 
diff --git a/drivers/reset/reset-uclass.c b/drivers/reset/reset-uclass.c
index 5e38ce5c06..411ad649ca 100644
--- a/drivers/reset/reset-uclass.c
+++ b/drivers/reset/reset-uclass.c
@@ -106,7 +106,7 @@ int reset_get_bulk(struct udevice *dev, struct reset_ctl_bulk *bulk)
 	
 	bulk->count = 0;
 
-	count = dev_count_phandle_with_args(dev, "resets", "#reset-cells");
+	count = dev_count_phandle_with_args(dev, "resets", "#reset-cells", 0);
 	if (count < 1)
 		return count;
 
diff --git a/drivers/usb/host/ehci-generic.c b/drivers/usb/host/ehci-generic.c
index 304a3437d5..c93a7051a7 100644
--- a/drivers/usb/host/ehci-generic.c
+++ b/drivers/usb/host/ehci-generic.c
@@ -86,7 +86,7 @@ static int ehci_usb_probe(struct udevice *dev)
 	err = 0;
 	priv->clock_count = 0;
 	clock_nb = ofnode_count_phandle_with_args(dev_ofnode(dev), "clocks",
-						  "#clock-cells");
+						  "#clock-cells", 0);
 	if (clock_nb > 0) {
 		priv->clocks = devm_kcalloc(dev, clock_nb, sizeof(struct clk),
 					    GFP_KERNEL);
@@ -116,7 +116,7 @@ static int ehci_usb_probe(struct udevice *dev)
 
 	priv->reset_count = 0;
 	reset_nb = ofnode_count_phandle_with_args(dev_ofnode(dev), "resets",
-						  "#reset-cells");
+						  "#reset-cells", 0);
 	if (reset_nb > 0) {
 		priv->resets = devm_kcalloc(dev, reset_nb,
 					    sizeof(struct reset_ctl),
diff --git a/include/dm/of_access.h b/include/dm/of_access.h
index 2fa65c9332..cc382b1671 100644
--- a/include/dm/of_access.h
+++ b/include/dm/of_access.h
@@ -450,6 +450,7 @@ int of_parse_phandle_with_args(const struct device_node *np,
  * @np:		pointer to a device tree node containing a list
  * @list_name:	property name that contains a list
  * @cells_name:	property name that specifies phandles' arguments count
+ * @cells_count: Cell count to use if @cells_name is NULL
  * @return number of phandle found, -ENOENT if
  *	@list_name does not exist, -EINVAL if a phandle was not found,
  *	@cells_name could not be found, the arguments were truncated or there
@@ -460,7 +461,8 @@ int of_parse_phandle_with_args(const struct device_node *np,
  *
  */
 int of_count_phandle_with_args(const struct device_node *np,
-			       const char *list_name, const char *cells_name);
+			       const char *list_name, const char *cells_name,
+			       int cells_count);
 
 /**
  * of_alias_scan() - Scan all properties of the 'aliases' node
diff --git a/include/dm/ofnode.h b/include/dm/ofnode.h
index 8df2facf99..1726b6b2f9 100644
--- a/include/dm/ofnode.h
+++ b/include/dm/ofnode.h
@@ -555,12 +555,13 @@ int ofnode_parse_phandle_with_args(ofnode node, const char *list_name,
  * @node:	device tree node containing a list
  * @list_name:	property name that contains a list
  * @cells_name:	property name that specifies phandles' arguments count
+ * @cells_count: Cell count to use if @cells_name is NULL
  * @return number of phandle on success, -ENOENT if @list_name does not
  *      exist, -EINVAL if a phandle was not found, @cells_name could not
  *      be found.
  */
 int ofnode_count_phandle_with_args(ofnode node, const char *list_name,
-				   const char *cells_name);
+				   const char *cells_name, int cell_count);
 
 /**
  * ofnode_path() - find a node by full path
diff --git a/include/dm/read.h b/include/dm/read.h
index 67db94adfc..0585eb1228 100644
--- a/include/dm/read.h
+++ b/include/dm/read.h
@@ -429,12 +429,14 @@ int dev_read_phandle_with_args(const struct udevice *dev, const char *list_name,
  * @dev:	device whose node containing a list
  * @list_name:	property name that contains a list
  * @cells_name:	property name that specifies phandles' arguments count
+ * @cells_count: Cell count to use if @cells_name is NULL
  * @Returns number of phandle found on success, on error returns appropriate
  * errno value.
  */
 
 int dev_count_phandle_with_args(const struct udevice *dev,
-				const char *list_name, const char *cells_name);
+				const char *list_name, const char *cells_name,
+				int cell_count);
 
 /**
  * dev_read_addr_cells() - Get the number of address cells for a device's node
@@ -880,10 +882,10 @@ static inline int dev_read_phandle_with_args(const struct udevice *dev,
 }
 
 static inline int dev_count_phandle_with_args(const struct udevice *dev,
-		const char *list_name, const char *cells_name)
+		const char *list_name, const char *cells_name, int cell_count)
 {
 	return ofnode_count_phandle_with_args(dev_ofnode(dev), list_name,
-					      cells_name);
+					      cells_name, cell_count);
 }
 
 static inline int dev_read_addr_cells(const struct udevice *dev)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
