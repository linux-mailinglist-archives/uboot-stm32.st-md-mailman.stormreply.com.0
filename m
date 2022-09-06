Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 539AC5ADF98
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 08:15:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07C90C640FE;
	Tue,  6 Sep 2022 06:15:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E224C640F2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 06:15:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285LpNxU013831;
 Tue, 6 Sep 2022 08:15:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=SWA8G/5f+/AxlxOahUDUp6yLvEGKsA+pw5RJSLRyIco=;
 b=DPMck4Qq5roFqMbQo0mXSy6K4AP7xoyTfwN/VnKl24XfuXwMPjZblX5+cDDl9+uaGzbi
 VlNZ5oIskeo9wOya/61XuemsEzwHdlONjMaXTekBN7p6eixylGhryg+7JHI3wnJMnQtd
 mpI085MVL/Hd3hzuEECFl6+iN4S+PUyC+9cWJlGc5VjDlXvGYFGtiCaGe8oQJIEQqWox
 C2l1g4hQ59eSM8ncyx9SF7yZAZQtg+zhrjlwBlqFUPuZBljbAXTy1IVvdIcF9Is+0WML
 KSgNr78MAmfQtPsbvjLOC41mp8jOStm2PVFi4X5HN8EKLS7ks0R5ByGO5IH3aqCQjIm5 PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jdcauxfur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 08:15:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBF53100034;
 Tue,  6 Sep 2022 08:15:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C694E2132D2;
 Tue,  6 Sep 2022 08:15:33 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 6 Sep 2022
 08:15:33 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Sep 2022 08:15:27 +0200
Message-ID: <20220906061529.3788894-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
References: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_03,2022-09-05_03,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Marek Vasut <marex@denx.de>
Subject: [Uboot-stm32] [PATCH v1 2/4] usb: ohci: Make usage of
	generic_{setup, shutdown}_phy() helpers
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

Replace ohci_setup_phy() and ohci_shutdown_phy () by respectively
generic_setup_phy() and generic_shutdown_phy().

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Simon Glass <sjg@chromium.org>
---

 drivers/usb/host/ohci-generic.c | 56 ++-------------------------------
 1 file changed, 3 insertions(+), 53 deletions(-)

diff --git a/drivers/usb/host/ohci-generic.c b/drivers/usb/host/ohci-generic.c
index 5d23058aaf..2d8d38ce9a 100644
--- a/drivers/usb/host/ohci-generic.c
+++ b/drivers/usb/host/ohci-generic.c
@@ -23,56 +23,6 @@ struct generic_ohci {
 	int reset_count;	/* number of reset in reset list */
 };
 
-static int ohci_setup_phy(struct udevice *dev, int index)
-{
-	struct generic_ohci *priv = dev_get_priv(dev);
-	int ret;
-
-	ret = generic_phy_get_by_index(dev, index, &priv->phy);
-	if (ret) {
-		if (ret != -ENOENT) {
-			dev_err(dev, "failed to get usb phy\n");
-			return ret;
-		}
-	} else {
-		ret = generic_phy_init(&priv->phy);
-		if (ret) {
-			dev_dbg(dev, "failed to init usb phy\n");
-			return ret;
-		}
-
-		ret = generic_phy_power_on(&priv->phy);
-		if (ret) {
-			dev_dbg(dev, "failed to power on usb phy\n");
-			return generic_phy_exit(&priv->phy);
-		}
-	}
-
-	return 0;
-}
-
-static int ohci_shutdown_phy(struct udevice *dev)
-{
-	struct generic_ohci *priv = dev_get_priv(dev);
-	int ret = 0;
-
-	if (generic_phy_valid(&priv->phy)) {
-		ret = generic_phy_power_off(&priv->phy);
-		if (ret) {
-			dev_dbg(dev, "failed to power off usb phy\n");
-			return ret;
-		}
-
-		ret = generic_phy_exit(&priv->phy);
-		if (ret) {
-			dev_dbg(dev, "failed to power off usb phy\n");
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static int ohci_usb_probe(struct udevice *dev)
 {
 	struct ohci_regs *regs = dev_read_addr_ptr(dev);
@@ -135,7 +85,7 @@ static int ohci_usb_probe(struct udevice *dev)
 		goto clk_err;
 	}
 
-	err = ohci_setup_phy(dev, 0);
+	err = generic_setup_phy(dev, &priv->phy, 0);
 	if (err)
 		goto reset_err;
 
@@ -146,7 +96,7 @@ static int ohci_usb_probe(struct udevice *dev)
 	return 0;
 
 phy_err:
-	ret = ohci_shutdown_phy(dev);
+	ret = generic_shutdown_phy(&priv->phy);
 	if (ret)
 		dev_err(dev, "failed to shutdown usb phy\n");
 
@@ -171,7 +121,7 @@ static int ohci_usb_remove(struct udevice *dev)
 	if (ret)
 		return ret;
 
-	ret = ohci_shutdown_phy(dev);
+	ret = generic_shutdown_phy(&priv->phy);
 	if (ret)
 		return ret;
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
