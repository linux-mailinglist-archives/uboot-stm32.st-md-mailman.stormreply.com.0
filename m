Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 830207AAF6
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 16:28:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DE35C35E04
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 14:28:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7957FC35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UEQmmC010245
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Jul 2019 16:28:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=oNNeiqHsGd68b5hwxjhd82XhBhWZ4SrFvXGlLGg+vhQ=;
 b=Fqb3O/WWTvMv5uyIyvIn2a0Zsf5NfJjlUcx18HVnCHbabuMTktcc9A5Gq/6yY7GZODdE
 3aV8L4y/Cm5eXNoMwq9r0d74fCNQessUgQyKeC5y/omPWtXmmhXw/SjgzFve3QyvGo0C
 MfeG9L26tsncBSo53vIBEbYgZNSTowB20oEclJtvCTt40NbD5c2E31SnVS0u7Lc4zxmF
 WRnLnqf+8j6sbM1rEbiQhW5P7tgGd9jOJ+2ms5lM4L/XMUc/yuemBxtSZ+teOfDCB/Un
 5PpSVeGClu6jzO2CW+uhzjOou+o4t+kPjkYhgScEeV9yypOQ+W/hZGP8zTjMrGAWC2cO 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0br9xwxv-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Jul 2019 16:28:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8242E3A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:54 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 337111697
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:47 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 16:28:47 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 16:28:46
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>
Date: Tue, 30 Jul 2019 16:28:40 +0200
Message-ID: <1564496921-15594-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564496921-15594-1-git-send-email-patrick.delaunay@st.com>
References: <1564496921-15594-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [U-BOOT internal][PATCH 2/3] usb: host: dwc2: add
	support for reset and clk
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

Add support for clock and reset with driver model.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/usb/host/dwc2.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index a06efad..06db8da 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -5,13 +5,15 @@
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
+#include <reset.h>
+#include <usb.h>
 #include <usbroothubdes.h>
 #include <wait_bit.h>
 #include <asm/io.h>
@@ -1370,6 +1372,48 @@ static int dwc2_shutdown_phy(struct udevice *dev)
 	return 0;
 }
 
+static int dwc2_reset_init(struct udevice *dev)
+{
+	struct reset_ctl_bulk	resets;
+	int ret;
+
+	ret = reset_get_bulk(dev, &resets);
+	if (ret == -ENOTSUPP || ret == -ENOENT)
+		return 0;
+	else if (ret)
+		return ret;
+
+	reset_assert_bulk(&resets);
+	udelay(2);
+	ret = reset_deassert_bulk(&resets);
+	if (ret) {
+		reset_release_bulk(&resets);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dwc2_clk_init(struct udevice *dev)
+{
+	struct clk_bulk		clks;
+	int ret;
+
+	ret = clk_get_bulk(dev, &clks);
+	if (ret == -ENOSYS || ret == -ENOENT)
+		return 0;
+	if (ret)
+		return ret;
+
+	ret = clk_enable_bulk(&clks);
+	if (ret) {
+		clk_release_bulk(&clks);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int dwc2_usb_probe(struct udevice *dev)
 {
 	struct dwc2_priv *priv = dev_get_priv(dev);
@@ -1378,6 +1422,14 @@ static int dwc2_usb_probe(struct udevice *dev)
 
 	bus_priv->desc_before_addr = true;
 
+	ret = dwc2_reset_init(dev);
+	if (ret)
+		return ret;
+
+	ret = dwc2_clk_init(dev);
+	if (ret)
+		return ret;
+
 	ret = dwc2_setup_phy(dev);
 	if (ret)
 		return ret;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
