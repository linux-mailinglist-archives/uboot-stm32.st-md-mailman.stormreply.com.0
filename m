Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D37F6EB
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 14:33:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74AF4C35E05
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 12:33:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 070E7C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 12:33:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72CQjvn016276; Fri, 2 Aug 2019 14:33:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=aVgwYor7/IukhwRC+4P6NgOsIjCdWmXFI6Tg2RMgD+w=;
 b=ggdbCfQ5sZPpsp+by2smkO7Sin2aItVnJsuSIAFTGpxeU4HXmbCwKVAaLH81/mwLm/z+
 Q+dvanhTxqBNbV5rD6J8yJpYVibTITBY/CvWIm7o0+oA+4D22Z802MtwdAFnxItW44Ff
 Pse4oHQ+5Mq6laPVhMhm/lnJ64YkShiqeHobBc8lLrnaCXOOGOUOj/A1PECbFDvSNq5v
 TA0M+HgvrH/50f5wUaazZNPK08bTimIErOp+uS/YRFUBqeUhbVHNCw8+tDqlVzlNMzQa
 Q6I6sWjAHbXPpnaOEvCefFy3lIpUonWB0+KDxmk6rqHJtIgi6lruCtjcBihzqZxkJ3zH 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0brag55r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 14:33:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4660431;
 Fri,  2 Aug 2019 12:33:48 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B09B2C075D;
 Fri,  2 Aug 2019 14:33:48 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 14:33:48 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 14:33:47
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 14:33:39 +0200
Message-ID: <1564749223-29298-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564749223-29298-1-git-send-email-patrick.delaunay@st.com>
References: <1564749223-29298-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Sven Schwermer <sven@svenschwermer.de>
Subject: [Uboot-stm32] [PATCH 2/5] usb: host: dwc2: add support for clk
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/usb/host/dwc2.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index 6c46979..5c4c21b 100644
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
@@ -1371,6 +1373,26 @@ static int dwc2_shutdown_phy(struct udevice *dev)
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
@@ -1379,6 +1401,10 @@ static int dwc2_usb_probe(struct udevice *dev)
 
 	bus_priv->desc_before_addr = true;
 
+	ret = dwc2_clk_init(dev);
+	if (ret)
+		return ret;
+
 	ret = dwc2_setup_phy(dev);
 	if (ret)
 		return ret;
@@ -1400,6 +1426,7 @@ static int dwc2_usb_remove(struct udevice *dev)
 	dwc2_uninit_common(priv->regs);
 
 	reset_release_bulk(&priv->resets);
+	clk_release_bulk(&priv->clks);
 
 	return 0;
 }
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
