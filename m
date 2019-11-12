Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F316F8C1B
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:42:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45333C36B09
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 09:42:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A4E2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 09:42:30 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC9b3CS019020; Tue, 12 Nov 2019 10:42:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=h67SNYArWkTMYuigziwWZqkD/Kn59hCFZWEX7Zk3RrY=;
 b=o8Aa02qAoZKlzJnfCloL6Vn4fXps5FrmK8kYI35K51vclQCGknxyJW0pvVmH8xKQs0mQ
 cD5qnrAcXFMsZAJtkwuDP8R1rqg+LbKGhwWxra+y+gqybDeP7cB6MFwlpRIw5W+XYwuW
 gFJcBu1X+hVqx42jNN4aP+RDH33afrTclhZ7F0HEo0fUtpYQAdeDXwRAnv8AN4T+UN/9
 bZVp2MgEFsgK15G5vH3JCwT2e4kQ5KaVTMKRklXDvAcaMKEkAvzMS+p8CsQg+sX2A/Uc
 VNEnV8iRrzecN4G758x6q/IJdycBEIGFD7bULSOWq4F5g8CtpUdu6EgSPPksYuvJRVk1 ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psb15xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 10:42:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 35E0C10003A;
 Tue, 12 Nov 2019 10:42:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 297392B187B;
 Tue, 12 Nov 2019 10:42:19 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 10:42:18 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 10:42:12 +0100
Message-ID: <20191112094214.12686-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112094214.12686-1-patrick.delaunay@st.com>
References: <20191112094214.12686-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Cc: Marek Vasut <marex@denx.de>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 ley.foon.tan@intel.com, Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [PATCH v3 3/5] usb: host: dwc2: add clk support
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

Add support for clock with driver model.

This patch don't added dependency because when CONFIG_CLK
is not activated the clk function are stubbed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2: None

 drivers/usb/host/dwc2.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index cb2b381eb6..9a00bea24f 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -5,13 +5,14 @@
  */
 
 #include <common.h>
+#include <clk.h>
 #include <dm.h>
 #include <errno.h>
 #include <generic-phy.h>
-#include <usb.h>
 #include <malloc.h>
 #include <memalign.h>
 #include <phys2bus.h>
+#include <usb.h>
 #include <usbroothubdes.h>
 #include <wait_bit.h>
 #include <asm/io.h>
@@ -37,6 +38,7 @@ struct dwc2_priv {
 	struct udevice *vbus_supply;
 #endif
 	struct phy phy;
+	struct clk_bulk clks;
 #else
 	uint8_t *aligned_buffer;
 	uint8_t *status_buffer;
@@ -1375,6 +1377,26 @@ static int dwc2_shutdown_phy(struct udevice *dev)
 	return 0;
 }
 
+static int dwc2_clk_init(struct udevice *dev)
+{
+	struct dwc2_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = clk_get_bulk(dev, &priv->clks);
+	if (ret == -ENOSYS || ret == -ENOENT)
+		return 0;
+	if (ret)
+		return ret;
+
+	ret = clk_enable_bulk(&priv->clks);
+	if (ret) {
+		clk_release_bulk(&priv->clks);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int dwc2_usb_probe(struct udevice *dev)
 {
 	struct dwc2_priv *priv = dev_get_priv(dev);
@@ -1383,6 +1405,10 @@ static int dwc2_usb_probe(struct udevice *dev)
 
 	bus_priv->desc_before_addr = true;
 
+	ret = dwc2_clk_init(dev);
+	if (ret)
+		return ret;
+
 	ret = dwc2_setup_phy(dev);
 	if (ret)
 		return ret;
@@ -1408,6 +1434,8 @@ static int dwc2_usb_remove(struct udevice *dev)
 	dwc2_uninit_common(priv->regs);
 
 	reset_release_bulk(&priv->resets);
+	clk_disable_bulk(&priv->clks);
+	clk_release_bulk(&priv->clks);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
