Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 274BF363F1F
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Apr 2021 11:47:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD15AC57195;
	Mon, 19 Apr 2021 09:47:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5F33C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 09:47:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J9QNpN027735; Mon, 19 Apr 2021 11:46:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=CUJUe1Fmg63McyuH10MAp/mMrmAZqkBub+7gt+/VUTc=;
 b=PbNRR1qbvJMYcnwJ76QjSYdv3EYAQtk0Kb8JRvrkGcHJPCLVtsOWnRhgAhTzeyr6UtgK
 narfZx5UbbkDA6fwoUdsBWjXqMbupzxvjUSVTWlD0sJnY2PubXlD5y4fUp4wvQaWoI90
 IiTCf4fMwxyl83KGu+zAXgdlqop0kwJSET8wYXFdvhodcCK1qrvNxwqLG6QrRAVEPv8S
 ZvGRBoBh4DaqAWJFG0ABQ4aUjdf2CxIVnuw55JSgGpgHFVt1KtNS2WDL4Xyal6aBJNTW
 n18ibKbnCNCJdkhDSRKCcAU45L6+xZ2klbVvXfGtifomanCrmXJkwmzfYb5TICfBUBM4 tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380s533dxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 11:46:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8638100039;
 Mon, 19 Apr 2021 11:45:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9E38020A66D;
 Mon, 19 Apr 2021 11:45:47 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 11:45:47
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 Apr 2021 11:45:32 +0200
Message-ID: <20210419094534.9748-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419094534.9748-1-patrice.chotard@foss.st.com>
References: <20210419094534.9748-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_05:2021-04-16,
 2021-04-19 signatures=0
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 3/5] usb: sandbox: Add gadget callbacks
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

Add usb_gadget_handle_interrupts(), usb_gadget_register_driver()
and usb_gadget_unregister_driver() to be able to test
binding usb gadget.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Herbert Poetzl <herbert@13thfloor.at>
---

(no changes since v1)

 drivers/usb/host/usb-sandbox.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/host/usb-sandbox.c b/drivers/usb/host/usb-sandbox.c
index d7cc92aa54..d1103dcb2e 100644
--- a/drivers/usb/host/usb-sandbox.c
+++ b/drivers/usb/host/usb-sandbox.c
@@ -9,6 +9,13 @@
 #include <log.h>
 #include <usb.h>
 #include <dm/root.h>
+#include <linux/usb/gadget.h>
+
+struct sandbox_udc {
+	struct usb_gadget gadget;
+};
+
+struct sandbox_udc *this_controller;
 
 struct sandbox_usb_ctrl {
 	int rootdev;
@@ -117,6 +124,27 @@ static int sandbox_submit_int(struct udevice *bus, struct usb_device *udev,
 	return ret;
 }
 
+int usb_gadget_handle_interrupts(int index)
+{
+	return 0;
+}
+
+int usb_gadget_register_driver(struct usb_gadget_driver *driver)
+{
+	struct sandbox_udc *dev = this_controller;
+
+	return driver->bind(&dev->gadget);
+}
+
+int usb_gadget_unregister_driver(struct usb_gadget_driver *driver)
+{
+	struct sandbox_udc *dev = this_controller;
+
+	driver->unbind(&dev->gadget);
+
+	return 0;
+}
+
 static int sandbox_alloc_device(struct udevice *dev, struct usb_device *udev)
 {
 	struct sandbox_usb_ctrl *ctrl = dev_get_priv(dev);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
