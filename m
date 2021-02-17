Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE28031D6E2
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Feb 2021 10:17:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2FF7C5718A;
	Wed, 17 Feb 2021 09:17:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2B27C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 09:17:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11H9C9WC002542; Wed, 17 Feb 2021 10:17:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=M3I4vN4402Uv1eezxlsMnQ07M3joXXa+HpeIzG4IKUc=;
 b=RQAal67/qPOnrdelDL8YR0vyNK05hEyZvQ4nXQS3uj80BBeFHd7FCuxz8A3jV1Iz2Gkn
 7fe0pLP22/fYgSWKu9t5AL45/Jm1SIDv2ATxmD8+I9Z7wJhsd2xDZV3KnaSddgt9OhrO
 AgtEo1DXY8Da30d1KfDTsDy4YLflbirV4UIpwcfNl4GnUsogs7MLcyRkg8Qa5a9eM6v7
 L64F2r5OLZZhRIfZ84msa3ye/jPjP5crceGm6FRGooEZTQwaDsXbPwaZoupO08Uh5CWo
 VpCKsff7p3XSnn5/B4JnsqS99Nz3uba3buujmMkUz8D563hlWaD+tXy2Fqelltbf1jus qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p706mbwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 10:17:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BDCB610002A;
 Wed, 17 Feb 2021 10:17:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0E8C2236A9;
 Wed, 17 Feb 2021 10:17:30 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 10:17:30
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 17 Feb 2021 10:17:27 +0100
Message-ID: <20210217091727.23923-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_09:2021-02-16,
 2021-02-17 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH v2] usb: gadget: dwc2_udc_otg: Fix
	dwc2_gadget_start() and usb_gadget_register_driver()
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

This was due to a too restrictive test which checked that the gadget
driver speed was either FS or HS.

So all gadget driver with max speed set to speed higher than
HS (SS in case of composite gadget driver in our case) are not
allowed, which is wrong.

Update the speed test in usb_gadget_register_driver() and in
dwc2_gadget_start() to allow all gadget driver speed equal or higher
than FS.

Tested on stm32mp157c-ev1 board.

Fixes: c791c8431c34 ("usb: dwc2: convert driver to DM_USB_GADGET")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
 - update gadget driver speed test in usb_gadget_register_driver()
   and in dwc2_gadget_start() instead of removing it completely.

 drivers/usb/gadget/dwc2_udc_otg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index ecac80fc11..2f31814442 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -248,9 +248,7 @@ int usb_gadget_register_driver(struct usb_gadget_driver *driver)
 
 	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
 
-	if (!driver
-	    || (driver->speed != USB_SPEED_FULL
-		&& driver->speed != USB_SPEED_HIGH)
+	if (!driver || driver->speed < USB_SPEED_FULL
 	    || !driver->bind || !driver->disconnect || !driver->setup)
 		return -EINVAL;
 	if (!dev)
@@ -320,9 +318,7 @@ static int dwc2_gadget_start(struct usb_gadget *g,
 
 	debug_cond(DEBUG_SETUP != 0, "%s: %s\n", __func__, "no name");
 
-	if (!driver ||
-	    (driver->speed != USB_SPEED_FULL &&
-	     driver->speed != USB_SPEED_HIGH) ||
+	if (!driver || driver->speed < USB_SPEED_FULL ||
 	    !driver->bind || !driver->disconnect || !driver->setup)
 		return -EINVAL;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
