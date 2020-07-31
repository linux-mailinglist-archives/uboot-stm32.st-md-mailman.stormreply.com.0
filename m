Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 744C22347D1
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3773BC36B37
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE4B6C36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:31:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VEScrj016907; Fri, 31 Jul 2020 16:31:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=S+5V2+mrCgc1vORaJ3SOj1pz0qy2ey31ptZMZkzZopw=;
 b=eel1VAOh7xf7Jk9zRX5cmcDvUNYsImdtvUfGpXWrHvCOfO3KJ+vpUZT48nKD5ZqSLroV
 XyI4bgzI1dFraT10VldY2SPBVKTYdLL0CmC7FGHu2MxQJb5772PpZ1V0dJejAYFieQY1
 7sObbzRDpPXk1JeIuBpON+D4bUEfmqgwf4DkYirUsjSja/HJsju3UMXT7ySM+t2PqISm
 ylRH6e2q8LT+Yy9HaVRcPH1KPski055bxoBuuToA76P9XrG+oinnF72VVnpYKNPuaTc1
 s0lnt+yuagPC+rfXFIZM7oxUlUEcsOv0pqqZcOwldk5BvdPcl2sUnpdOM5IWs7taLTy0 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgpu99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:31:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BBDE100038;
 Fri, 31 Jul 2020 16:31:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 040F72B1899;
 Fri, 31 Jul 2020 16:31:58 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:31:57 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:43 +0200
Message-ID: <20200731143152.8812-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731143152.8812-1-patrick.delaunay@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 02/11] board: stm32mp1: use IS_ENABLED to
	prevent ifdef in g_dnl_board_usb_cable_connected
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

Use IS_ENABLED to prevent ifdef in g_dnl_board_usb_cable_connected
and in g_dnl_bind_fixup

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 1ad41796fb..5c84b09c3e 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -182,13 +182,14 @@ static void board_key_check(void)
 	}
 }
 
-#if defined(CONFIG_USB_GADGET) && defined(CONFIG_USB_GADGET_DWC2_OTG)
-#include <usb/dwc2_udc.h>
 int g_dnl_board_usb_cable_connected(void)
 {
 	struct udevice *dwc2_udc_otg;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_USB_GADGET_DWC2_OTG))
+		return -ENODEV;
+
 	/* if typec stusb160x is present, means DK1 or DK2 board */
 	ret = stusb160x_cable_connected();
 	if (ret >= 0)
@@ -203,14 +204,17 @@ int g_dnl_board_usb_cable_connected(void)
 	return dwc2_udc_B_session_valid(dwc2_udc_otg);
 }
 
+#ifdef CONFIG_USB_GADGET_DOWNLOAD
 #define STM32MP1_G_DNL_DFU_PRODUCT_NUM 0xdf11
 #define STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM 0x0afb
 
 int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
 {
-	if (!strcmp(name, "usb_dnl_dfu"))
+	if (IS_ENABLED(CONFIG_DFU_OVER_USB) &&
+	    !strcmp(name, "usb_dnl_dfu"))
 		put_unaligned(STM32MP1_G_DNL_DFU_PRODUCT_NUM, &dev->idProduct);
-	else if (!strcmp(name, "usb_dnl_fastboot"))
+	else if (IS_ENABLED(CONFIG_FASTBOOT) &&
+		 !strcmp(name, "usb_dnl_fastboot"))
 		put_unaligned(STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM,
 			      &dev->idProduct);
 	else
@@ -218,8 +222,7 @@ int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
 
 	return 0;
 }
-
-#endif /* CONFIG_USB_GADGET */
+#endif /* CONFIG_USB_GADGET_DOWNLOAD */
 
 static int get_led(struct udevice **dev, char *led_string)
 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
