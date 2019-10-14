Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F64D5CF8
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 10:00:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 402BFC36B0E
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 08:00:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 176FCC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 08:00:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7uA9k005566; Mon, 14 Oct 2019 10:00:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tiSrQMwGd30z3nEP1GVsH6ZImITcX2EBpDFnxvMBpGg=;
 b=WGhpHUI9UEJopgOQnLoZiHwvEK/3PP8PHoSjx9DL23qs/aRIAyJsCW9V+xr+BHsAYnSk
 nerNedlKwxLp8xxwc9OuYuKCsM0AAUr1Vhc1HZKPatSV27FrYIoQULoRKoAE+ZPrEh19
 4vKn32Rcra5wp9cSsy4YvtIb+Dk/tevbDHhzrutZpA7wrEYuFWDOXyjqIaZw4X59eHXI
 93s/v7qVqLbrGZwnSYWpj0x8iwCeoHLw3KljBapj8aVged/aNsze4zT5sUb6SDRyIO/i
 9Nu7PMq6l0nwK3vuaVgftXfSKlm5IGhMjNqoZpgXWG+aF4H7Lbbggy4Zt8lpAkqITa6q cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk5qj0xhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 10:00:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34FC510003D;
 Mon, 14 Oct 2019 10:00:35 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28DA12B1867;
 Mon, 14 Oct 2019 10:00:35 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 10:00:35 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 10:00:32
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 10:00:21 +0200
Message-ID: <20191014080025.11245-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014080025.11245-1-patrick.delaunay@st.com>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 1/5] usb: host: dwc2: add phy support
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

 drivers/usb/host/dwc2.c | 61 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index 350d820a6e..eb1026effc 100644
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
@@ -1320,13 +1322,70 @@ static int dwc2_usb_ofdata_to_platdata(struct udevice *dev)
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
 
@@ -1339,6 +1398,8 @@ static int dwc2_usb_remove(struct udevice *dev)
 	if (ret)
 		return ret;
 
+	dwc2_shutdown_phy(dev);
+
 	dwc2_uninit_common(priv->regs);
 
 	reset_release_bulk(&priv->resets);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
