Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E0F4EA8
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 15:47:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F609C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 14:47:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 825EBC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 14:47:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8Eg7N3016263; Fri, 8 Nov 2019 15:47:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=foH4fa/BXj3kcCk8C4gthy1rEa6tP+EQ57TTD3b6x6k=;
 b=qx49Lbc/RYix9sVePmT/PKNJ/VbJOt2y1pH4C8smP0QM6fA9NP4oUMyqMdHg2dEVkP/J
 bfVa6ODaytJivsZH0GJWCnhudDd0xtzb0VjR0uG/ST8ZdVilhpJZcijQhpu+AhwlZLD3
 ToBR+gcOCJdZNcwnSOoGd6hfXL4va2Cd9E+3YtDTfRgDYiP8yCYqM0qH5HXUwYftD4/d
 dwRXvLK3T8zMlu2COh04MPfjxncAsvo1kQIqxkPLcQ+vtfODHUyv6J/6DItix1+upHbz
 DafgscGd8XGjCtTH5knhIZnW3Wil/r1KbIySJUmPDsppuQnA/Yo7qc4rBb1bMPndoIsC ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w41vmv6v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 15:47:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6941F10002A;
 Fri,  8 Nov 2019 15:47:20 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D1EF2BEC6D;
 Fri,  8 Nov 2019 15:47:20 +0100 (CET)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019
 15:47:20 +0100
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 15:47:19
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Nov 2019 15:47:13 +0100
Message-ID: <20191108144716.23829-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108144716.23829-1-patrick.delaunay@st.com>
References: <20191108144716.23829-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_04:2019-11-08,2019-11-08 signatures=0
Cc: Marek Vasut <marex@denx.de>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [PATCH v2 1/4] usb: host: dwc2: add phy support
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

Use generic phy to initialize the PHY associated to the
DWC2 device and available in the device tree.

This patch don't added dependency because when CONFIG_PHY
is not activated, the generic PHY function are stubbed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- update dev_err
- update commit message
- change dev_err to dev_dbg for PHY function call
- treat dwc2_shutdown_phy error

 drivers/usb/host/dwc2.c | 66 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index 350d820a6e..cb2b381eb6 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -7,6 +7,7 @@
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
+#include <generic-phy.h>
 #include <usb.h>
 #include <malloc.h>
 #include <memalign.h>
@@ -35,6 +36,7 @@ struct dwc2_priv {
 #ifdef CONFIG_DM_REGULATOR
 	struct udevice *vbus_supply;
 #endif
+	struct phy phy;
 #else
 	uint8_t *aligned_buffer;
 	uint8_t *status_buffer;
@@ -1320,13 +1322,71 @@ static int dwc2_usb_ofdata_to_platdata(struct udevice *dev)
 	return 0;
 }
 
+static int dwc2_setup_phy(struct udevice *dev)
+{
+	struct dwc2_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = generic_phy_get_by_index(dev, 0, &priv->phy);
+	if (ret) {
+		if (ret != -ENOENT) {
+			dev_err(dev, "Failed to get USB PHY: %d.\n", ret);
+			return ret;
+		}
+		return 0;
+	}
+
+	ret = generic_phy_init(&priv->phy);
+	if (ret) {
+		dev_dbg(dev, "Failed to init USB PHY: %d.\n", ret);
+		return ret;
+	}
+
+	ret = generic_phy_power_on(&priv->phy);
+	if (ret) {
+		dev_dbg(dev, "Failed to power on USB PHY: %d.\n", ret);
+		generic_phy_exit(&priv->phy);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dwc2_shutdown_phy(struct udevice *dev)
+{
+	struct dwc2_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	if (!generic_phy_valid(&priv->phy))
+		return 0;
+
+	ret = generic_phy_power_off(&priv->phy);
+	if (ret) {
+		dev_dbg(dev, "Failed to power off USB PHY: %d.\n", ret);
+		return ret;
+	}
+
+	ret = generic_phy_exit(&priv->phy);
+	if (ret) {
+		dev_dbg(dev, "Failed to power off USB PHY: %d.\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int dwc2_usb_probe(struct udevice *dev)
 {
 	struct dwc2_priv *priv = dev_get_priv(dev);
 	struct usb_bus_priv *bus_priv = dev_get_uclass_priv(dev);
+	int ret;
 
 	bus_priv->desc_before_addr = true;
 
+	ret = dwc2_setup_phy(dev);
+	if (ret)
+		return ret;
+
 	return dwc2_init_common(dev, priv);
 }
 
@@ -1339,6 +1399,12 @@ static int dwc2_usb_remove(struct udevice *dev)
 	if (ret)
 		return ret;
 
+	ret = dwc2_shutdown_phy(dev);
+	if (ret) {
+		dev_dbg(dev, "Failed to shutdown USB PHY: %d.\n", ret);
+		return ret;
+	}
+
 	dwc2_uninit_common(priv->regs);
 
 	reset_release_bulk(&priv->resets);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
