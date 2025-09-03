Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8FCB41EED
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Sep 2025 14:27:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F44FC3FACD;
	Wed,  3 Sep 2025 12:27:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 216A3C3FAC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:27:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Boi6i007376;
 Wed, 3 Sep 2025 14:27:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SZYRDlBWxrfzGZ0YLz2T/jj4O3+pLXc31a4HtAWi+Cs=; b=x4MMVerkeYuqb6uf
 q0rl3DCuJvls7dXzBZIKYdpQ9zsdBGRHolNFmLDfIJfPKcQlpj4MPHLBLyBM/fzb
 mUcvyNeFOIC5KKOn6d9prEJvOGCJEk4ekHV7R2h500PQ5huK90gJoIqyqZZ3L/Ql
 VOdklcMISrQPEr6TZWNILeLa6lGcWatyBOraTTV0Ii9xNKksw4+Z3IrKa4ENs2Y6
 CI5HfBkNckXnZ5YKLeBoksjikx2Jeb5Lg/I08BdpTFjPNKujdAuGZ63dQaDOwihl
 BxL/k5fqlvfPX665Gb4dYoVGBO826Alu9VNSdHQadhEmo0hOJuGxoonYkiTsQUtL
 Qz1nvQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxgyjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 14:27:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9FF7540049;
 Wed,  3 Sep 2025 14:26:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B88A39C6FA;
 Wed,  3 Sep 2025 14:25:42 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 14:25:41 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Wed, 3 Sep 2025 14:25:39 +0200
MIME-Version: 1.0
Message-ID: <20250903-master-v2-5-5cdf73bff42c@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
In-Reply-To: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
To: Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v2 5/7] video: stm32: ltdc: properly search
 the first available panel
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

Initially there was only one DSI bridge with one panel attached to this
device. This explained the call to uclass_first_device_err(UCLASS_PANEL,
...) which worked fine at the time.

Now that multiple bridges and panels, with different technologies, can
be plugged onto the board this way to get the panel device is outdated.

The lookup is done is two steps. First we circle through the
UCLASS_VIDEO_BRIDGE, and once we get one, we search through its
endpoints until we get a UCLASS_PANEL device available.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/video/stm32/stm32_ltdc.c | 136 +++++++++++++++++++++++++++++++++++----
 1 file changed, 125 insertions(+), 11 deletions(-)

diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index efe9a00996eca0301d2a2b82074ba9690a967a73..834bfb625d2d34a44bd8edff1c92af6dec344c20 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -17,6 +17,7 @@
 #include <video_bridge.h>
 #include <asm/io.h>
 #include <dm/device-internal.h>
+#include <dm/uclass-internal.h>
 #include <dm/device_compat.h>
 #include <linux/bitops.h>
 #include <linux/printk.h>
@@ -495,6 +496,101 @@ static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
 	setbits_le32(priv->regs + LTDC_L1CR, LXCR_LEN);
 }
 
+static int stm32_ltdc_get_remote_device(struct udevice *dev, ofnode ep_node,
+					enum uclass_id id, struct udevice **remote_dev)
+{
+	u32 remote_phandle;
+	ofnode remote;
+	int ret = 0;
+
+	ret = ofnode_read_u32(ep_node, "remote-endpoint", &remote_phandle);
+	if (ret) {
+		dev_err(dev, "%s(%s): Could not find remote-endpoint property\n",
+			__func__, dev_read_name(dev));
+		return ret;
+	}
+
+	remote = ofnode_get_by_phandle(remote_phandle);
+	if (!ofnode_valid(remote))
+		return -EINVAL;
+
+	while (ofnode_valid(remote)) {
+		remote = ofnode_get_parent(remote);
+		if (!ofnode_valid(remote)) {
+			dev_dbg(dev, "%s(%s): no uclass_id %d for remote-endpoint\n",
+				__func__, dev_read_name(dev), id);
+			continue;
+		}
+
+		ret = uclass_find_device_by_ofnode(id, remote, remote_dev);
+		if (*remote_dev && !ret) {
+			ret = uclass_get_device_by_ofnode(id, remote, remote_dev);
+			if (ret)
+				dev_dbg(dev, "%s(%s): failed to get remote device %s\n",
+					__func__, dev_read_name(dev), dev_read_name(*remote_dev));
+			break;
+		}
+	};
+
+	return ret;
+}
+
+static int stm32_ltdc_get_panel(struct udevice *dev, struct udevice **panel)
+{
+	ofnode ep_node, node, ports;
+	int ret = 0;
+
+	if (!dev)
+		return -EINVAL;
+
+	ports = ofnode_find_subnode(dev_ofnode(dev), "ports");
+	if (!ofnode_valid(ports)) {
+		dev_err(dev, "Remote bridge subnode\n");
+		return ret;
+	}
+
+	for (node = ofnode_first_subnode(ports);
+	     ofnode_valid(node);
+	     node = dev_read_next_subnode(node)) {
+		ep_node = ofnode_first_subnode(node);
+		if (!ofnode_valid(ep_node))
+			continue;
+
+		ret = stm32_ltdc_get_remote_device(dev, ep_node, UCLASS_PANEL, panel);
+	}
+
+	/* Sanity check, we can get out of the loop without having a clean ofnode */
+	if (!(*panel))
+		ret = -EINVAL;
+	else
+		if (!ofnode_valid(dev_ofnode(*panel)))
+			ret = -EINVAL;
+
+	return ret;
+}
+
+static int stm32_ltdc_display_init(struct udevice *dev, ofnode *ep_node,
+				   struct udevice **panel, struct udevice **bridge)
+{
+	int ret;
+
+	if (*panel)
+		return -EINVAL;
+
+	if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
+		ret = stm32_ltdc_get_remote_device(dev, *ep_node, UCLASS_VIDEO_BRIDGE, bridge);
+		if (ret)
+			return ret;
+
+		ret = stm32_ltdc_get_panel(*bridge, panel);
+	} else {
+		/* no bridge, search a panel from display controller node */
+		ret = stm32_ltdc_get_remote_device(dev, *ep_node, UCLASS_PANEL, panel);
+	}
+
+	return ret;
+}
+
 #if IS_ENABLED(CONFIG_TARGET_STM32F469_DISCOVERY)
 static int stm32_ltdc_alloc_fb(struct udevice *dev)
 {
@@ -532,6 +628,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	struct display_timing timings;
 	struct clk pclk, bclk;
 	struct reset_ctl rst;
+	ofnode node, port;
 	ulong rate;
 	int ret;
 
@@ -568,7 +665,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	}
 
 	priv->hw_version = readl(priv->regs + LTDC_IDR);
-	debug("%s: LTDC hardware 0x%x\n", __func__, priv->hw_version);
+	dev_dbg(dev, "%s: LTDC hardware 0x%x\n", __func__, priv->hw_version);
 
 	switch (priv->hw_version) {
 	case HWVER_10200:
@@ -589,13 +686,35 @@ static int stm32_ltdc_probe(struct udevice *dev)
 		return -ENODEV;
 	}
 
-	ret = uclass_first_device_err(UCLASS_PANEL, &panel);
-	if (ret) {
-		if (ret != -ENODEV)
-			dev_err(dev, "panel device error %d\n", ret);
-		return ret;
+	/*
+	 * Try all the ports until one working.
+	 *
+	 * This is done in two times. First is checks for the
+	 * UCLASS_VIDEO_BRIDGE available, and then for this bridge
+	 * it scans for a UCLASS_PANEL.
+	 */
+
+	port = dev_read_subnode(dev, "port");
+	if (!ofnode_valid(port)) {
+		dev_err(dev, "%s(%s): 'port' subnode not found\n",
+			__func__, dev_read_name(dev));
+		return -EINVAL;
 	}
 
+	for (node = ofnode_first_subnode(port);
+	     ofnode_valid(node);
+	     node = dev_read_next_subnode(node)) {
+		ret = stm32_ltdc_display_init(dev, &node, &panel, &bridge);
+		if (ret)
+			dev_dbg(dev, "Device failed ret=%d\n", ret);
+		else
+			break;
+	}
+
+	/* Sanity check */
+	if (ret)
+		return ret;
+
 	ret = panel_get_display_timing(panel, &timings);
 	if (ret) {
 		ret = ofnode_decode_display_timing(dev_ofnode(panel),
@@ -624,11 +743,6 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	reset_deassert(&rst);
 
 	if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
-		ret = uclass_get_device(UCLASS_VIDEO_BRIDGE, 0, &bridge);
-		if (ret)
-			dev_dbg(dev,
-				"No video bridge, or no backlight on bridge\n");
-
 		if (bridge) {
 			ret = video_bridge_attach(bridge);
 			if (ret) {

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
