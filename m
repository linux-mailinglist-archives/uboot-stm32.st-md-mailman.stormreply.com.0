Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F11896E7
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F792C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D949C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8IJhB021562; Wed, 18 Mar 2020 09:25:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=nFLLhT3ezlph9NhJMQt+K63bBGnk6QKueKd0F86DkBk=;
 b=hvvHYKEHNC2wEy/BwRiOZd6Llgiy9mGiY5MoDMowYCQHGekWk8WYDYe+V2Fu2BEpTIdm
 AJXWsQTebH1Ow7E9O14/+Oo7wa98ZtXIZmcstUyMQ3hxSjBWxxNgEJ/LCL3pmxrscXDl
 e34lfvQ+6jBkCvLheq3Ubu49/LN5nLytjZ4JH5cerrvcmtXIM8tLkSFND2bAZejeFkjN
 u0/HoTHsKRAdjmVyQXwmISF7A0wiso64iklh0iMPPoGoFL13PgE3fdvn4PdPeosAomkX
 hqz5q3B3M9qIlE4OhpCrZl+Yo7fW9/12u4xuH9HmDYgu+Wf0mUpIi4LS43r7SgXFZtoV Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95uj391-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0338A100034;
 Wed, 18 Mar 2020 09:25:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA87421CA91;
 Wed, 18 Mar 2020 09:25:06 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:06 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:24:46 +0100
Message-ID: <20200318082503.8025-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 01/18] usb: gadget: g_dnl: add function
	g_dnl_set_product
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

Add a function g_dnl_set_product to change the Product string used in USB
enumeration in any command based on download gadget.

If the function is called with NULL pointer, the product string is set to
the default value (product[] = "USB download gadget").

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/usb/gadget/g_dnl.c | 8 ++++++++
 include/g_dnl.h            | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/g_dnl.c b/drivers/usb/gadget/g_dnl.c
index e9e1600a1a..7a51b53f24 100644
--- a/drivers/usb/gadget/g_dnl.c
+++ b/drivers/usb/gadget/g_dnl.c
@@ -89,6 +89,14 @@ static struct usb_gadget_strings *g_dnl_composite_strings[] = {
 	NULL,
 };
 
+void g_dnl_set_product(const char *s)
+{
+	if (s)
+		g_dnl_string_defs[1].s = s;
+	else
+		g_dnl_string_defs[1].s = product;
+}
+
 static int g_dnl_unbind(struct usb_composite_dev *cdev)
 {
 	struct usb_gadget *gadget = cdev->gadget;
diff --git a/include/g_dnl.h b/include/g_dnl.h
index 6d461c73d3..836ee602c8 100644
--- a/include/g_dnl.h
+++ b/include/g_dnl.h
@@ -38,6 +38,7 @@ int g_dnl_board_usb_cable_connected(void);
 int g_dnl_register(const char *s);
 void g_dnl_unregister(void);
 void g_dnl_set_serialnumber(char *);
+void g_dnl_set_product(const char *s);
 
 bool g_dnl_detach(void);
 void g_dnl_trigger_detach(void);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
