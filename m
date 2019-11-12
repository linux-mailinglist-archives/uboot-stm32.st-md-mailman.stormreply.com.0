Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E937DF8C19
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:42:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9C0BC36B0E
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 09:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A16FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 09:42:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC9gDvq004422; Tue, 12 Nov 2019 10:42:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lCUQf6lAK0tHNj6YDItm6C87BM6qBneeiA5eBxmDFaI=;
 b=keCND0DXPSssVZtQ5iCckDtW+8Y1MSVTCER5D51cMjXADos5TMSQStJ2R9hUdLSIxSs4
 J8H2sJDGs0fY355cbnIZruMEE7aHCUmQzBP5JzvVDQFvRQOnZrYjyw4ZaCiLkiEc/6A6
 dVd3CHoLjE87OUvjt1Gd2693A8abBdo2AifaBkR89vTEt+5YBKrS3EYXwyMkP0oV/Bss
 Y3USt8aKRO08mZW1Dzy0/xcTvqrmraY2Ba095lObxFSqrnbik3TSBi+ORK8mRu40AO/V
 SLhKMo5hWeAF7Yw+krYZmoywRVTcfHQzj6i/ZAKv/8v8nDGzGyCT69i/tU9NLEJV3W0m Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psjh5rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 10:42:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FAD0100038;
 Tue, 12 Nov 2019 10:42:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F1572B187A;
 Tue, 12 Nov 2019 10:42:18 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 10:42:18 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 10:42:11 +0100
Message-ID: <20191112094214.12686-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112094214.12686-1-patrick.delaunay@st.com>
References: <20191112094214.12686-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Cc: Marek Vasut <marex@denx.de>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 ley.foon.tan@intel.com, Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [PATCH v3 2/5] usb: host: dwc2: add phy support
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

Changes in v3: None
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
