Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C3406D6A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Sep 2021 16:16:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B025BC5A4D5;
	Fri, 10 Sep 2021 14:16:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F340AC5A4D5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Sep 2021 14:16:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18AAMrXO015127;
 Fri, 10 Sep 2021 16:16:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=J95lsvxaAgJE0mH1+NeTzzEmq/OyollpoajnUCE2Elw=;
 b=bL3kNuMuPrwHstTBFDTVHB7KwVc7l07mRj4xoHlqXC0bdo4L72lNRuslEx5bWFD+ZZT7
 rlycC4LcYJimI/TY3vfDYsJX0brNu3tiVQuSf4AU6YIqvNLHMpeAuuxzr9fTOkycMZp+
 8RreYZX4Avme/IrYkqbGqXvOFR5v+wxdSMbig67waM+pFewOxnxX7SdgNNwRWQmG9YCv
 jy/I3G8KWGVpqujiiiHRPOytq1N8JyEQKYnyWV4m8y1Gk7xP6tL1OG1uWe2D6Nr1FnT6
 By9Nbq/k640QGviyukABBNp7CYW73Va89EJLV0FYYSeIAaU0aIe7sy2HJKUjTvSxST+e Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b05jdh542-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 16:16:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F6CA100038;
 Fri, 10 Sep 2021 16:16:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node2.st.com [10.75.127.2])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73A4C21F0A9;
 Fri, 10 Sep 2021 16:16:28 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG1NODE2.st.com (10.75.127.2)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 10 Sep 2021 16:16:28
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Sep 2021 16:16:21 +0200
Message-ID: <20210910141624.25133-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210910141624.25133-1-patrice.chotard@foss.st.com>
References: <20210910141624.25133-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG1NODE2.st.com
 (10.75.127.2)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_06,2021-09-09_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [RESEND][PATCH v2 2/5] usb: gadget: Add bcdDevice for
	the DWC2 USB Gadget Controller
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

(no changes since v1)

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
