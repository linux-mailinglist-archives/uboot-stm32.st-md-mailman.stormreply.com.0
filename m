Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A941406D6B
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Sep 2021 16:16:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C166CC5A4F5;
	Fri, 10 Sep 2021 14:16:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87285C5A4D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Sep 2021 14:16:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18A9jCcY029451;
 Fri, 10 Sep 2021 16:16:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Y2lJQlE69aK3fk7Cl/f4szpE71hgnXidOYBdRvu09+Q=;
 b=0o4xbepXX+wGrm9Kr9R8J+YQZST0NP3EMhAnYStxyK0MTvnrphGH7ifeEg2ZbIbtZxVz
 skQXmXmPBlcvoafcCSQz1MuBtWoBD+YR+RK+NuAUicnKVYjd8ZRVuZAdAet5Z6XLXjy2
 T/9Ve4J+9YX+aVaODVzkr3ErCdy+QN2Gt6RjrT0m7BrxMdUu5CbbITGEYqQnMB1JUDNB
 PHheUOAh5iZLVBmUdlr4nUBx0sRPteKWgDT8uHICwiNlow2Q6FAq5GZ7cdzm2x2w1YWd
 MojghESrmvFnFMS1znjnYKeUTYdM1aWfpP+WCHtZfJXhSSyyrpjr0nE30js+GImF8iMF LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b050s1cf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 16:16:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 97392100039;
 Fri, 10 Sep 2021 16:16:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node2.st.com [10.75.127.2])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4EE5F21F0A7;
 Fri, 10 Sep 2021 16:16:29 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG1NODE2.st.com (10.75.127.2)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 10 Sep 2021 16:16:29
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Sep 2021 16:16:22 +0200
Message-ID: <20210910141624.25133-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210910141624.25133-1-patrice.chotard@foss.st.com>
References: <20210910141624.25133-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG1NODE2.st.com
 (10.75.127.2)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_06,2021-09-09_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [RESEND][PATCH v2 3/5] usb: sandbox: Add gadget
	callbacks
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
Reviewed-by: Simon Glass <sjg@chromium.org>
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
