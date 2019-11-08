Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1FAF4EAB
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 15:47:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4478BC36B10
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 14:47:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AFD2C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 14:47:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8Eksnc003396; Fri, 8 Nov 2019 15:47:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9+eZjvEbqB553s8+bComz9cYyhBWJgdveoPLq2za5a8=;
 b=qwe6hrfFnoU/5/uVY714oqo/jkMYQcylcYEj0xjRfEBhYwDM6PR36QfShuMl5ziivHj+
 JhJHTdmWfNYqAYx/iPWilWZFcivpUYI+RwCm5OnEB/qi0FrZAed8Ib95XIIzOro3f9rN
 B0S5ye8aVBe0pmQIY4ubfR5zUFpjg8os4AaQrEfRETRHOm4rYPzOUJZQCBuVtOZxuw9b
 pLdMEsi1wtC6nw5GhxaQf8HecGc/vTQH82Loh3xftQtZDvY6eJ6Db/o9fhyloxKqfYBS
 Jo+781Q5xvv7eft8ThIxt0rc4iH6ac+v/aCDzTMbdYj0A9Y8ZgvKk3aUQTob3p9QC3mY 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w41vh45s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 15:47:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31CB4100034;
 Fri,  8 Nov 2019 15:47:24 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26A5F2BEC6E;
 Fri,  8 Nov 2019 15:47:24 +0100 (CET)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019
 15:47:23 +0100
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 15:47:23
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Nov 2019 15:47:16 +0100
Message-ID: <20191108154707.v2.4.I43934c501010bbca1ee5f7c7780e3999eefc425f@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108144716.23829-1-patrick.delaunay@st.com>
References: <20191108144716.23829-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_04:2019-11-08,2019-11-08 signatures=0
Cc: Marek Vasut <marex@denx.de>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [PATCH v2 4/4] usb: host: dwc2: add trace to have
	clean usb start
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

Solve issue for the display of "usb start" command on stm32mp1
because one carriage return is missing in DWC2 probe.

STM32MP> usb start
starting USB...
Bus usb-otg@49000000:    Bus usbh-ehci@5800d000:   USB EHCI 1.00

after the patch:

STM32MP> usb start
starting USB...
Bus usb-otg@49000000: USB DWC2
Bus usbh-ehci@5800d000: USB EHCI 1.00

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 drivers/usb/host/dwc2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index 870b06459e..2450dff9ac 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -1217,6 +1217,8 @@ static int dwc2_init_common(struct udevice *dev, struct dwc2_priv *priv)
 	if (readl(&regs->gintsts) & DWC2_GINTSTS_CURMODE_HOST)
 		mdelay(1000);
 
+	printf("USB DWC2\n");
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
