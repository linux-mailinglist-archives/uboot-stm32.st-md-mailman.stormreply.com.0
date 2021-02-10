Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A43168EE
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Feb 2021 15:18:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE8DCC57B52;
	Wed, 10 Feb 2021 14:18:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8D4FC5718A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 14:18:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11AEHP02030791; Wed, 10 Feb 2021 15:18:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=zUiNoTswQ7WdgfXdSaPn1PPdCT1nsyHcoDn8YqvMNNc=;
 b=W3xmlDGJV1ljId+/LDgA0l3Wu/fX/rET+gV9P6Z7UQXj9Dc6ssF1ogmSHs58bWF9vLTl
 cmMe0j0LCDgRqWuO3ogAFYOArD4gGL3zozkEsDD0iUE4ZM2zYup0SVhkWuL4aIHdrrzx
 TcsebI9PH7OWQ34d6Joi/Y4KXFhCqdWdUG2WgQmUztr9s3Fh3qkvTfAMbqplqqlFbTzs
 FSgt/Byy6rcj5yoj6ZlVEr83NYYKIsOFJ95za5/+zRL9DvOW1yIUKeO9jrxdkJ/qB6Ys
 8ERF19aBMcyPntDRGIQCyMC4muO40F9LhDNVUIh4dZ+vMWzdsyP079rdsT6NAvzHHHOe ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf7g73q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 15:18:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9242610002A;
 Wed, 10 Feb 2021 15:18:10 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 301812394C7;
 Wed, 10 Feb 2021 15:18:10 +0100 (CET)
Received: from localhost (10.75.127.121) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 10 Feb 2021 15:18:09 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Feb 2021 15:17:58 +0100
Message-ID: <20210210141759.5641-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG1NODE5.st.com (10.75.127.66) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_05:2021-02-10,
 2021-02-10 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH] usb: gadget: dwc2_udc_otg: Fix
	dwc2_gadget_start()
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

Since commit 8745b9ebccae ("usb: gadget: add super speed support")
ums was no more functional on platform which use dwc2_udc_otg driver.

Remove the speed test in dwc2_gadget_start() to fix it.
Tested on stm32mp157c-ev1 board.

Fixes: c791c8431c34 ("usb: dwc2: convert driver to DM_USB_GADGET")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/usb/gadget/dwc2_udc_otg.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index e3871e381e..4f3d761eb1 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -248,10 +248,7 @@ int usb_gadget_register_driver(struct usb_gadget_driver *driver)
 
 	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
 
-	if (!driver
-	    || (driver->speed != USB_SPEED_FULL
-		&& driver->speed != USB_SPEED_HIGH)
-	    || !driver->bind || !driver->disconnect || !driver->setup)
+	if (!driver || !driver->bind || !driver->disconnect || !driver->setup)
 		return -EINVAL;
 	if (!dev)
 		return -ENODEV;
@@ -320,10 +317,7 @@ static int dwc2_gadget_start(struct usb_gadget *g,
 
 	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
 
-	if (!driver ||
-	    (driver->speed != USB_SPEED_FULL &&
-	     driver->speed != USB_SPEED_HIGH) ||
-	    !driver->bind || !driver->disconnect || !driver->setup)
+	if (!driver || !driver->bind || !driver->disconnect || !driver->setup)
 		return -EINVAL;
 
 	if (!dev)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
