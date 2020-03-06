Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2617B9BC
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:02:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB648C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:02:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D0A6C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:02:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0269wA1j003877; Fri, 6 Mar 2020 11:01:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DBBc2MyJJiJ8+VWUcuMUbSTtyoSgWVfj9e511DO1Zsw=;
 b=BSMup/4h6f2AtgbRQBy502OI1I4Fz8I7DRHzGYag63MQYNr9NK1FmjErBHgqxR5zdDDY
 t7hSwNsGT1ShiNevHyyyQmtCCNLB5YafjzpDBHt8Oq3XjPTaYlYCt7XEXl7SYimr/BNr
 R06JcPX7DH3ibhzHoSsIPPUFj8iqJdNoLjV5hrWMqyVcihh8fNtZlMundWjYp9JWE3dZ
 rEijF7v0bMzbrKKmY3UO+4RjNSVLdjrKd0AyT8e0hQS8V2/0bLAOFv4b8TsRBHYnLf62
 myoKAMaPZRPl8IAd7Z3pfI3xkuOCEx8kDJS7sX3O3DaIGFN8PiZj9REv8HSZlUk2BsbS 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem1e9we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:01:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC4B910003D;
 Fri,  6 Mar 2020 11:01:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9A432A59CF;
 Fri,  6 Mar 2020 11:01:51 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:01:51 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:01:38 +0100
Message-ID: <20200306100140.27582-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306100140.27582-1-patrick.delaunay@st.com>
References: <20200306100140.27582-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 ley.foon.tan@intel.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [PATCH v5 3/5] usb: host: dwc2: add clk support
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

Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/usb/host/dwc2.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index a8e64825b5..b1b79d0a18 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -5,14 +5,15 @@
  */
 
 #include <common.h>
+#include <clk.h>
 #include <cpu_func.h>
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
@@ -39,6 +40,7 @@ struct dwc2_priv {
 	struct udevice *vbus_supply;
 #endif
 	struct phy phy;
+	struct clk_bulk clks;
 #else
 	uint8_t *aligned_buffer;
 	uint8_t *status_buffer;
@@ -1377,6 +1379,26 @@ static int dwc2_shutdown_phy(struct udevice *dev)
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
@@ -1385,6 +1407,10 @@ static int dwc2_usb_probe(struct udevice *dev)
 
 	bus_priv->desc_before_addr = true;
 
+	ret = dwc2_clk_init(dev);
+	if (ret)
+		return ret;
+
 	ret = dwc2_setup_phy(dev);
 	if (ret)
 		return ret;
@@ -1410,6 +1436,8 @@ static int dwc2_usb_remove(struct udevice *dev)
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
