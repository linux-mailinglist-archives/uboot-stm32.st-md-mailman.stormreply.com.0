Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EDA51D12F
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 08:22:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12A96C628A8;
	Fri,  6 May 2022 06:22:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E638DC5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 06:22:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24605NIu018215;
 Fri, 6 May 2022 08:22:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=KsXF+ZedWZg89oPJHiJT2MLygu40/XbXHlxN/oBFv2w=;
 b=0Oclr1A8LKt4bSLkVSXY4m431+hOHiRA5N+GCQqzNa5xF5+UGB6GCaGKBRiB00x9lkhC
 Z6S3yPXEFIRi5huF73OVhdv6TFmrImZtXZkNCs0BETn90Nwm+J+m3xNP2NGTzpdRZTES
 pUA8qKzEgAzJu0v+3QiwEVc5n1YxBVHIfPRo3dcek8Sl9Vt938Vi0L/+61iO3uhNqqWs
 9v/drXMEhXj2B2asEjmusTBUXLFBPRtMokIWsKkI8NGDxNFP2jQdg/PTngydqt3XZi6j
 kkxilBp+g8bD1rcNB35fuHQONnNfA3jIWGxe/J9NWjYRg6oXFOnmsO9khj6W2PU4jouA Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthk6ayn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:22:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFFC010002A;
 Fri,  6 May 2022 08:22:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9779C210F88;
 Fri,  6 May 2022 08:22:37 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 6 May
 2022 08:22:37 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 May 2022 08:22:34 +0200
Message-ID: <20220506082232.v2.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>
Subject: [Uboot-stm32] [PATCH v2 1/2] usb: host: ehci-generic: Make usage of
	clock/reset bulk() API
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

Make usage of clock and reset bulk API in order to simplify the code

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

Changes in v2:
  - add the error code in all dev_err() output.

 drivers/usb/host/ehci-generic.c | 103 ++++++++++----------------------
 1 file changed, 32 insertions(+), 71 deletions(-)

diff --git a/drivers/usb/host/ehci-generic.c b/drivers/usb/host/ehci-generic.c
index 4c28a69b98..8760169035 100644
--- a/drivers/usb/host/ehci-generic.c
+++ b/drivers/usb/host/ehci-generic.c
@@ -23,14 +23,12 @@
  */
 struct generic_ehci {
 	struct ehci_ctrl ctrl;
-	struct clk *clocks;
-	struct reset_ctl *resets;
+	struct clk_bulk clocks;
+	struct reset_ctl_bulk resets;
 	struct phy phy;
 #ifdef CONFIG_DM_REGULATOR
 	struct udevice *vbus_supply;
 #endif
-	int clock_count;
-	int reset_count;
 };
 
 #ifdef CONFIG_DM_REGULATOR
@@ -47,7 +45,7 @@ static int ehci_enable_vbus_supply(struct udevice *dev)
 	if (priv->vbus_supply) {
 		ret = regulator_set_enable(priv->vbus_supply, true);
 		if (ret) {
-			dev_err(dev, "Error enabling VBUS supply\n");
+			dev_err(dev, "Error enabling VBUS supply (ret=%d)\n", ret);
 			return ret;
 		}
 	} else {
@@ -81,68 +79,31 @@ static int ehci_usb_probe(struct udevice *dev)
 	struct generic_ehci *priv = dev_get_priv(dev);
 	struct ehci_hccr *hccr;
 	struct ehci_hcor *hcor;
-	int i, err, ret, clock_nb, reset_nb;
+	int err, ret;
 
 	err = 0;
-	priv->clock_count = 0;
-	clock_nb = ofnode_count_phandle_with_args(dev_ofnode(dev), "clocks",
-						  "#clock-cells", 0);
-	if (clock_nb > 0) {
-		priv->clocks = devm_kcalloc(dev, clock_nb, sizeof(struct clk),
-					    GFP_KERNEL);
-		if (!priv->clocks)
-			return -ENOMEM;
-
-		for (i = 0; i < clock_nb; i++) {
-			err = clk_get_by_index(dev, i, &priv->clocks[i]);
-
-			if (err < 0)
-				break;
-			err = clk_enable(&priv->clocks[i]);
-			if (err && err != -ENOSYS) {
-				dev_err(dev, "failed to enable clock %d\n", i);
-				clk_free(&priv->clocks[i]);
-				goto clk_err;
-			}
-			priv->clock_count++;
-		}
-	} else {
-		if (clock_nb != -ENOENT) {
-			dev_err(dev, "failed to get clock phandle(%d)\n",
-				clock_nb);
-			return clock_nb;
-		}
+	ret = clk_get_bulk(dev, &priv->clocks);
+	if (ret) {
+		dev_err(dev, "Failed to get clocks (ret=%d)\n", ret);
+		return ret;
 	}
 
-	priv->reset_count = 0;
-	reset_nb = ofnode_count_phandle_with_args(dev_ofnode(dev), "resets",
-						  "#reset-cells", 0);
-	if (reset_nb > 0) {
-		priv->resets = devm_kcalloc(dev, reset_nb,
-					    sizeof(struct reset_ctl),
-					    GFP_KERNEL);
-		if (!priv->resets)
-			return -ENOMEM;
-
-		for (i = 0; i < reset_nb; i++) {
-			err = reset_get_by_index(dev, i, &priv->resets[i]);
-			if (err < 0)
-				break;
-
-			if (reset_deassert(&priv->resets[i])) {
-				dev_err(dev, "failed to deassert reset %d\n",
-					i);
-				reset_free(&priv->resets[i]);
-				goto reset_err;
-			}
-			priv->reset_count++;
-		}
-	} else {
-		if (reset_nb != -ENOENT) {
-			dev_err(dev, "failed to get reset phandle(%d)\n",
-				reset_nb);
-			goto clk_err;
-		}
+	err = clk_enable_bulk(&priv->clocks);
+	if (err) {
+		dev_err(dev, "Failed to enable clocks (err=%d)\n", err);
+		goto clk_err;
+	}
+
+	err = reset_get_bulk(dev, &priv->resets);
+	if (err) {
+		dev_err(dev, "Failed to get resets (err=%d)\n", err);
+		goto clk_err;
+	}
+
+	err = reset_deassert_bulk(&priv->resets);
+	if (err) {
+		dev_err(dev, "Failed to get deassert resets (err=%d)\n", err);
+		goto reset_err;
 	}
 
 	err = ehci_enable_vbus_supply(dev);
@@ -166,21 +127,21 @@ static int ehci_usb_probe(struct udevice *dev)
 phy_err:
 	ret = ehci_shutdown_phy(dev, &priv->phy);
 	if (ret)
-		dev_err(dev, "failed to shutdown usb phy\n");
+		dev_err(dev, "failed to shutdown usb phy (ret=%d)\n", ret);
 
 regulator_err:
 	ret = ehci_disable_vbus_supply(priv);
 	if (ret)
-		dev_err(dev, "failed to disable VBUS supply\n");
+		dev_err(dev, "failed to disable VBUS supply (ret=%d)\n", ret);
 
 reset_err:
-	ret = reset_release_all(priv->resets, priv->reset_count);
+	ret = reset_release_bulk(&priv->resets);
 	if (ret)
-		dev_err(dev, "failed to assert all resets\n");
+		dev_err(dev, "failed to release resets (ret=%d)\n", ret);
 clk_err:
-	ret = clk_release_all(priv->clocks, priv->clock_count);
+	ret = clk_release_bulk(&priv->clocks);
 	if (ret)
-		dev_err(dev, "failed to disable all clocks\n");
+		dev_err(dev, "failed to release clocks (ret=%d)\n", ret);
 
 	return err;
 }
@@ -202,11 +163,11 @@ static int ehci_usb_remove(struct udevice *dev)
 	if (ret)
 		return ret;
 
-	ret =  reset_release_all(priv->resets, priv->reset_count);
+	ret = reset_release_bulk(&priv->resets);
 	if (ret)
 		return ret;
 
-	return clk_release_all(priv->clocks, priv->clock_count);
+	return clk_release_bulk(&priv->clocks);
 }
 
 static const struct udevice_id ehci_usb_ids[] = {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
