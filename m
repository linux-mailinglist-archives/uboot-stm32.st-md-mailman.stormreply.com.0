Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B6C2247
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 15:39:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25E26C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 13:39:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B21FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 13:39:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8UDb888018623; Mon, 30 Sep 2019 15:39:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=RWRZyKj0Hj6axO4YxSag6iNq2RkoqB3aHht89cwy1t4=;
 b=MmiKIOZTv21H75O97o4i1Q8XjqJ2gft4qn/vqGwAMVwMkFBZsx8QRFGC+RSvd8W5ik5r
 jcqppaKHr/NyuxBuUKty33VvQZFiZ9FSJP2HV54Uc145WE5UrblCkefk2a5ruktkLZx3
 AlF6APh4CwdSmeXhbLAPWQj2lSmyMWM6/fXU8XN3+rbHUr4UR8Zjd11cLdC/wD+BFeKg
 gV62cuZBG/6zGKnS4o/eL7TMcC5y4z1SbbXroaqVzEgP7S8t9+ZhAymdKCF9z7MnnLNW
 C0Q5pcYmWqb+spKYyFftUwMmuuFpoSNTah3mbCr97jWplCJ+rJsKXaU/thMnzs+Dc7xE ZQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w00uf4b-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 15:39:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 142DC22;
 Mon, 30 Sep 2019 13:38:59 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5DDA2FF5F8;
 Mon, 30 Sep 2019 15:38:58 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep
 2019 15:38:58 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep 2019 15:38:57
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 30 Sep 2019 15:38:32 +0200
Message-ID: <20190930133832.11992-17-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930133832.11992-1-patrick.delaunay@st.com>
References: <20190930133832.11992-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_09:2019-09-25,2019-09-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 16/16] board: stm32mp1: fixup the usb
	product id for USB download gadget
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

Select the correct USB product id used by the download gadget
for ST stm32mp1 boards.

The board stm32mp1 select the correct product id, as defined in
http://www.linux-usb.org/usb.ids for the STMicroelectronics
vendor id = 0x0483 (CONFIG_USB_GADGET_VENDOR_NUM):
- dfu = 0xdf11 : STM Device in DFU mode
  it is the value used by ROM code and reused for stm32prog
  command
- fasboot = 0x0afb : Android Fastboot device
- others = 0x5720 (CONFIG_USB_GADGET_PRODUCT_NUM)
  Mass Storage Device
  it is used for UMS command / usb_dnl_ums

This patch avoid conflict when the same USB VID/PID is used for
ums, fastboot or dfu command (two different protocols associated
to the same PID).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 board/st/stm32mp1/stm32mp1.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 6045850c05..4ed2d88849 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -234,6 +234,23 @@ int g_dnl_board_usb_cable_connected(void)
 
 	return dwc2_udc_B_session_valid(dwc2_udc_otg);
 }
+
+#define STM32MP1_G_DNL_DFU_PRODUCT_NUM 0xdf11
+#define STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM 0x0afb
+
+int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
+{
+	if (!strcmp(name, "usb_dnl_dfu"))
+		put_unaligned(STM32MP1_G_DNL_DFU_PRODUCT_NUM, &dev->idProduct);
+	else if (!strcmp(name, "usb_dnl_fastboot"))
+		put_unaligned(STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM,
+			      &dev->idProduct);
+	else
+		put_unaligned(CONFIG_USB_GADGET_PRODUCT_NUM, &dev->idProduct);
+
+	return 0;
+}
+
 #endif /* CONFIG_USB_GADGET */
 
 #ifdef CONFIG_LED
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
