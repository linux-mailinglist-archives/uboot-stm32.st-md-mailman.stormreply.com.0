Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB737F6EF
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 14:33:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F2D7C35E07
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 12:33:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE220C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 12:33:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72CQjvq016276; Fri, 2 Aug 2019 14:33:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Lbdcv5rbEvevOJXeEMc/DFRf0ouOU1zPw00QsWK2mzo=;
 b=RbkzgfVgwSVBG3DAI3Ijbiqo4C+BOyl/tGEHBOhI7IglpzeHsp3KJ34EILSFG3wTz1+y
 YmVHs/hNxbgc1di4dqGpJjroNLeJr19RaPmeXy//ELX2r6GrBy1OGQ1iCDzvMguvMMJj
 dPwO5J43JqGJSV9DAdJP8ZGKEvSwVeLtOzi78HdYpXQ3uePlTppawbSwRxMT9sf+gW2r
 vgWp8hhMK29WLizyiN/usuoeefAwcDuCr4qRjo0d+ovwO3FS5OjzFGzVVUa6Mbpmeufw
 dUkG5oCEl2tZl56Qf9GimbPWx1842b/q/XgGqT0+A0arE/0WywrmvFC6VGpI9Zl6lws5 QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0brag561-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 14:33:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80B2231;
 Fri,  2 Aug 2019 12:33:52 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76A6B2C075F;
 Fri,  2 Aug 2019 14:33:52 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 14:33:52 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 14:33:51
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 14:33:42 +0200
Message-ID: <1564749223-29298-6-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564749223-29298-1-git-send-email-patrick.delaunay@st.com>
References: <1564749223-29298-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Sven Schwermer <sven@svenschwermer.de>
Subject: [Uboot-stm32] [PATCH 5/5] usb: host: dwc2: add trace to have clean
	usb start
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

 drivers/usb/host/dwc2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index 1639bf2..7c1af0a 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -1216,6 +1216,8 @@ static int dwc2_init_common(struct udevice *dev, struct dwc2_priv *priv)
 	if (readl(&regs->gintsts) & DWC2_GINTSTS_CURMODE_HOST)
 		mdelay(1000);
 
+	printf("USB DWC2\n");
+
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
