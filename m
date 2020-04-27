Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF4B1BA4BC
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 15:30:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57825C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 13:30:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D115C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 13:30:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RDIGwU029637; Mon, 27 Apr 2020 15:30:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=r11ApTju4V0Q/qStvr8iHkQCzPY9ayWtRkJ3IXxU57U=;
 b=K4fQdoOc5OQT7UzerIMpTqgiS2X6FA3H+NcwLV8Or5fDE6nJZvAjw/XSSTfcAPVuc52N
 WLjnoYD4Rc7g+nhaxfkThtZmNklAx6VlXX1dY2mjTiNP5YLPRBWVz+WN4AuodKtPW3v0
 7m2wXEp3GuuObXvxvBFSG1sjwBWUQTxQy1G4blQhgfPIpRPQ53WGIjT0OQW2upUq7AcS
 Ert0zWl4CjhEZAIylgNgwhOoGmHkBuzsa8QitVdbIzZb0hfFiJ+XCfBM2oNMdOSn8IOu
 Jfz6PvsQ2j/dRRpBojgmufFOIWzvG1cddKjw0Rejhc9k5ZQeiKtUcB0RdYCVZaJ5UlX5 rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjwj49d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 15:30:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 541F110002A;
 Mon, 27 Apr 2020 15:30:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4853F21BAB3;
 Mon, 27 Apr 2020 15:30:07 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 27 Apr 2020 15:30:06 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 27 Apr 2020 15:30:01 +0200
Message-ID: <20200427152956.RESEND.v6.5.I43934c501010bbca1ee5f7c7780e3999eefc425f@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427133001.5557-1-patrick.delaunay@st.com>
References: <20200427133001.5557-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_10:2020-04-24,
 2020-04-27 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 ley.foon.tan@intel.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [RESEND PATCH v6 5/5] usb: host: dwc2: add trace to
	have clean usb start
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

Before the patch:

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

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/usb/host/dwc2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index 640ae3e730..f25ed2dab0 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -1219,6 +1219,8 @@ static int dwc2_init_common(struct udevice *dev, struct dwc2_priv *priv)
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
