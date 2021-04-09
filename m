Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0C359677
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 09:36:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9086BC56639;
	Fri,  9 Apr 2021 07:36:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 464B3C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 07:36:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1397ZdbD029104; Fri, 9 Apr 2021 09:36:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=J6N0LjnQqQtBFrEnxlh04fAYgLA5QtbxtpheUinC6eI=;
 b=pOkcvmpuu0Se+WWvZgdcCYy9XrHJ+SaE5HVjuSFD2pb1Q+ojS9GEt1vmNRADJ9z7hHGe
 z2WEPdmBDSWwFvmJecgIil2phVRdgqa3jOKjZX9aVB4Q4mpHshp4if4Jw568UM4MxiDG
 RKs7KjK1Ebr9oV1Sgby6+x4Wo9iG+mS7MKMY1YW+IIIqr+WQzzGvued7eEPMB8MbHyzW
 OSHL/IPmXT783t1KLrD0nkIxwkBUcB1/v05dgH4bda1SPAhBc5aRKlioaxOiVAulbond
 NpvBDJbbje0sgqS5KBSJu2YuOhy2yqsbDHpfJz2zGSG1G/mntZi9MhdaOrkw6NZBrh35 pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37sw5yxuvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 09:36:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8FDF100039;
 Fri,  9 Apr 2021 09:36:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6705521B2F3;
 Fri,  9 Apr 2021 09:36:21 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr 2021 09:36:21
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 9 Apr 2021 09:36:17 +0200
Message-ID: <20210409073617.16045-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409073617.16045-1-patrice.chotard@foss.st.com>
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_04:2021-04-08,
 2021-04-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 2/2] usb: gadget: Add bcdDevice for the
	DWC2 USB Gadget Controller
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

Add an entry in usb_gadget_controller_number() for the DWC2
gadget controller. It is used to bind the USB Ethernet driver.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reported-by: Herbert Poetzl <herbert@13thfloor.at>
Cc: Marek Vasut <marex@denx.de>
Cc: Herbert Poetzl <herbert@13thfloor.at>

---

 drivers/usb/gadget/gadget_chips.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/gadget_chips.h b/drivers/usb/gadget/gadget_chips.h
index 0cdf47c2dd..06e6a48949 100644
--- a/drivers/usb/gadget/gadget_chips.h
+++ b/drivers/usb/gadget/gadget_chips.h
@@ -167,6 +167,12 @@
 #define gadget_is_mtu3(g)        0
 #endif
 
+#ifdef CONFIG_USB_GADGET_DWC2_OTG
+#define gadget_is_dwc2(g)        (!strcmp("dwc2-udc", (g)->name))
+#else
+#define gadget_is_dwc2(g)        0
+#endif
+
 /**
  * usb_gadget_controller_number - support bcdDevice id convention
  * @gadget: the controller being driven
@@ -232,5 +238,7 @@ static inline int usb_gadget_controller_number(struct usb_gadget *gadget)
 		return 0x25;
 	else if (gadget_is_mtu3(gadget))
 		return 0x26;
+	else if (gadget_is_dwc2(gadget))
+		return 0x27;
 	return -ENOENT;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
