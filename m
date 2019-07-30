Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C11D7AAF5
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 16:28:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46AB1C35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 14:28:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77A9FC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UEQlQO010239
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Jul 2019 16:28:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NhBFJ3Z4DSa7bZiE7vad9lWxCWv7xEL80AxBq6JyOqI=;
 b=dGhtA78QYwUhW+DEZfjio/3CJbaP9A3ugOeufDBNIftsXEsZ0BZEr34p+H+sgjZuU8gu
 Z6khXENrolRqHaDC2XzHmfgqWCtWN8FGopp6/3eEjuy1umZnN85r9NhJQhN1D8p7jSlZ
 sOnLtPs6sOsqNdzlpifeHq2tZGCnPHl8Bba07rT6zw0QRF46XJAoJ//q3wYOT/Z1OmqK
 nWuqNRX3TlwbiF69K9nVSLQgeGx13TjfzGM+9J71mne/OCvIHESuZBC17kQ7p3YZz/fN
 f4MDxidOJihuvTaMyZYYq09WmfDw6dUFthxUI028OoJgkEs3u2sbgJkTwlGPm05hYLYd 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0br9xwxu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Jul 2019 16:28:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 576D938
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:54 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C80D51460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:45 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 16:28:45 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 16:28:45
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>
Date: Tue, 30 Jul 2019 16:28:39 +0200
Message-ID: <1564496921-15594-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564496921-15594-1-git-send-email-patrick.delaunay@st.com>
References: <1564496921-15594-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [U-BOOT internal][PATCH 1/3] usb: host: dwc2: add phy
	support
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/usb/host/dwc2.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index a62a2f8..a06efad 100644
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
@@ -1317,13 +1319,69 @@ static int dwc2_usb_ofdata_to_platdata(struct udevice *dev)
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
+			dev_err(dev, "failed to get usb phy\n");
+			return ret;
+		}
+		return 0;
+	}
+
+	ret = generic_phy_init(&priv->phy);
+	if (ret) {
+		dev_err(dev, "failed to init usb phy\n");
+		return ret;
+	}
+
+	ret = generic_phy_power_on(&priv->phy);
+	if (ret) {
+		dev_err(dev, "failed to power on usb phy\n");
+		return generic_phy_exit(&priv->phy);
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
+		dev_err(dev, "failed to power off usb phy\n");
+		return ret;
+	}
+
+	ret = generic_phy_exit(&priv->phy);
+	if (ret) {
+		dev_err(dev, "failed to power off usb phy\n");
+		return ret;
+	}
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
 
@@ -1336,6 +1394,8 @@ static int dwc2_usb_remove(struct udevice *dev)
 	if (ret)
 		return ret;
 
+	dwc2_shutdown_phy(dev);
+
 	dwc2_uninit_common(priv->regs);
 
 	reset_release_bulk(&priv->resets);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
