Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF51BA4B9
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 15:30:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47C1DC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 13:30:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32631C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 13:30:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RDITVq004558; Mon, 27 Apr 2020 15:30:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=r1hPesnRqU7qOSyPxLVyAxqibYKi14GibX3HUri1kOI=;
 b=dIvB+hifTLkLQ1VCzXpifKfa1tDCRWuvun7+82SwOTnn4d+FijS9dHdieuApol1VaCSW
 dQlM4vO0Nerls2ndFnNoNBlf6CGwaQsxEo9xbLXGQejDvp16l/zb6IA2Aao6kPQ7RAiy
 ilftF8wmU+NwdXM0zLQnsfMg8ih6Q4LGHZ0OwuNjL5iY14xGnpgSqY0VOPU6VF+Ozpnw
 V6HB/7fNwDjoBXa8MNHI+EnOcphKvfAY5uNe6D8fP4COL7iO69IuzirPGujHGPFmttE0
 t0AOLRCEsUEXz2SZKLu0A7q2P9dDKkmk9RZtzBdvzwaSDXZa8WnhywS6apJFH32aalyk /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq5t37g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 15:30:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CAED100039;
 Mon, 27 Apr 2020 15:30:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1044B21BAB3;
 Mon, 27 Apr 2020 15:30:05 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 27 Apr 2020 15:30:04 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 27 Apr 2020 15:29:58 +0200
Message-ID: <20200427133001.5557-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427133001.5557-1-patrick.delaunay@st.com>
References: <20200427133001.5557-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_10:2020-04-24,
 2020-04-27 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 ley.foon.tan@intel.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [RESEND PATCH v6 2/5] usb: host: dwc2: add phy support
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

Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v6: None
Changes in v5:
- inverse logic for -ENOENT test on generic_phy_get_by_index result
- Add some comments

Changes in v4: None
Changes in v3: None
Changes in v2:
- update dev_err
- update commit message
- change dev_err to dev_dbg for PHY function call
- treat dwc2_shutdown_phy error

 drivers/usb/host/dwc2.c | 66 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index e4efaf1e59..a8e64825b5 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -8,6 +8,7 @@
 #include <cpu_func.h>
 #include <dm.h>
 #include <errno.h>
+#include <generic-phy.h>
 #include <usb.h>
 #include <malloc.h>
 #include <memalign.h>
@@ -37,6 +38,7 @@ struct dwc2_priv {
 #ifdef CONFIG_DM_REGULATOR
 	struct udevice *vbus_supply;
 #endif
+	struct phy phy;
 #else
 	uint8_t *aligned_buffer;
 	uint8_t *status_buffer;
@@ -1322,13 +1324,71 @@ static int dwc2_usb_ofdata_to_platdata(struct udevice *dev)
 	return 0;
 }
 
+static int dwc2_setup_phy(struct udevice *dev)
+{
+	struct dwc2_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = generic_phy_get_by_index(dev, 0, &priv->phy);
+	if (ret) {
+		if (ret == -ENOENT)
+			return 0; /* no PHY, nothing to do */
+		dev_err(dev, "Failed to get USB PHY: %d.\n", ret);
+		return ret;
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
+	/* PHY is not valid when generic_phy_get_by_index() = -ENOENT */
+	if (!generic_phy_valid(&priv->phy))
+		return 0; /* no PHY, nothing to do */
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
 
@@ -1341,6 +1401,12 @@ static int dwc2_usb_remove(struct udevice *dev)
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
