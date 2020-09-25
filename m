Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBFA2781D4
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Sep 2020 09:41:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98108C3FADF;
	Fri, 25 Sep 2020 07:41:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8DD6C3FADE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 07:41:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08P7boxi018206; Fri, 25 Sep 2020 09:41:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=LIxrBJQBm4w3T13qkqG1ZVR7hNNUbZW5XTySx2iP/B4=;
 b=SqpKAJUyWM1TvVdhyt39wbvcbEMeXpSLkSNL9BpKr33qGn4X/sGupHze9cTa/gaMMr2c
 5taC040riqz+Q8Is8wYEZxZzpNtxotBUTwBCq2g9gy755THy6LWm++71uc8IQwCjc3HJ
 I0SCJFJh4hs+6Paj2a6ixTA0xxmvbD2Q+yKecsqErDQHPrdZQfpS8kvOqhTCiCG2szcK
 F2dGd3riiPzyHiZ+dB6HM5q63EhvPlrBTLA23wLRUUsld96AngjJ+Cp9pKanP04C7y4r
 HodXZPWCKU996qH+RLdNnjZ89+vaBXFX0lx+NlzgKPiufq00KOfn1lPp+ajbCmBuQr96 ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n748k6t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 09:41:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDD5810002A;
 Fri, 25 Sep 2020 09:41:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEB5021FE8A;
 Fri, 25 Sep 2020 09:41:27 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 25 Sep 2020 09:41:27 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Sep 2020 09:41:14 +0200
Message-ID: <20200925074116.16068-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-25_02:2020-09-24,
 2020-09-25 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 1/3] dm: add cells_count parameter in
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
It is linked to previous serie [1] but it is not a blocking point today
as no user use this API with cells_name = NULL
+ dev_count_phandle_with_args
+ ofnode_count_phandle_with_args

[1/3] was Previously sent in RFC [2] + missing impacts in:
  drivers/net/designware.c
  drivers/power/domain/power-domain-uclass.c
  drivers/usb/host/ohci-da8xx.c
  drivers/usb/host/ohci-generic.c

I also add test in [3/3] for modified API.

But I think it is the good time to modify these functions as they are not
hugely used.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=200899
    "dm: add cells_count parameter in live DT APIs of_parse_phandle_with_args"
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=200906&state=*


 board/st/stm32mp1/stm32mp1.c               | 2 +-
 drivers/clk/clk-uclass.c                   | 4 ++--
 drivers/core/of_access.c                   | 7 ++++---
 drivers/core/ofnode.c                      | 6 +++---
 drivers/core/read.c                        | 5 +++--
 drivers/net/designware.c                   | 3 ++-
 drivers/phy/phy-uclass.c                   | 2 +-
 drivers/power/domain/power-domain-uclass.c | 2 +-
 drivers/reset/reset-uclass.c               | 2 +-
 drivers/usb/host/ehci-generic.c            | 4 ++--
 drivers/usb/host/ohci-da8xx.c              | 3 ++-
 drivers/usb/host/ohci-generic.c            | 6 ++++--
 include/dm/of_access.h                     | 4 +++-
 include/dm/ofnode.h                        | 3 ++-
 include/dm/read.h                          | 8 +++++---
 15 files changed, 36 insertions(+), 25 deletions(-)

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
diff --git a/drivers/net/designware.c b/drivers/net/designware.c
index 1c0e829407..4c19abbaf0 100644
--- a/drivers/net/designware.c
+++ b/drivers/net/designware.c
@@ -688,7 +688,8 @@ int designware_eth_probe(struct udevice *dev)
 	int i, clock_nb;
 
 	priv->clock_count = 0;
-	clock_nb = dev_count_phandle_with_args(dev, "clocks", "#clock-cells");
+	clock_nb = dev_count_phandle_with_args(dev, "clocks", "#clock-cells",
+					       0);
 	if (clock_nb > 0) {
 		priv->clocks = devm_kcalloc(dev, clock_nb, sizeof(struct clk),
 					    GFP_KERNEL);
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
 
diff --git a/drivers/power/domain/power-domain-uclass.c b/drivers/power/domain/power-domain-uclass.c
index c2c7c3bd50..af829db9da 100644
--- a/drivers/power/domain/power-domain-uclass.c
+++ b/drivers/power/domain/power-domain-uclass.c
@@ -117,7 +117,7 @@ static int dev_power_domain_ctrl(struct udevice *dev, bool on)
 	int i, count, ret = 0;
 
 	count = dev_count_phandle_with_args(dev, "power-domains",
-					    "#power-domain-cells");
+					    "#power-domain-cells", 0);
 	for (i = 0; i < count; i++) {
 		ret = power_domain_get_by_index(dev, &pd, i);
 		if (ret)
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
diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index 22e7b565b5..aa1eba262a 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -95,7 +95,8 @@ static int ohci_da8xx_probe(struct udevice *dev)
 
 	err = 0;
 	priv->clock_count = 0;
-	clock_nb = dev_count_phandle_with_args(dev, "clocks", "#clock-cells");
+	clock_nb = dev_count_phandle_with_args(dev, "clocks", "#clock-cells",
+					       0);
 
 	if (clock_nb < 0)
 		return clock_nb;
diff --git a/drivers/usb/host/ohci-generic.c b/drivers/usb/host/ohci-generic.c
index b84bf8ac0f..7a286435c6 100644
--- a/drivers/usb/host/ohci-generic.c
+++ b/drivers/usb/host/ohci-generic.c
@@ -85,7 +85,8 @@ static int ohci_usb_probe(struct udevice *dev)
 
 	err = 0;
 	priv->clock_count = 0;
-	clock_nb = dev_count_phandle_with_args(dev, "clocks", "#clock-cells");
+	clock_nb = dev_count_phandle_with_args(dev, "clocks", "#clock-cells",
+					       0);
 	if (clock_nb > 0) {
 		priv->clocks = devm_kcalloc(dev, clock_nb, sizeof(struct clk),
 					    GFP_KERNEL);
@@ -111,7 +112,8 @@ static int ohci_usb_probe(struct udevice *dev)
 	}
 
 	priv->reset_count = 0;
-	reset_nb = dev_count_phandle_with_args(dev, "resets", "#reset-cells");
+	reset_nb = dev_count_phandle_with_args(dev, "resets", "#reset-cells",
+					       0);
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
