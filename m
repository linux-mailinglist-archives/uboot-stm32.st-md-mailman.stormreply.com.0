Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FBCF8C5A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 11:01:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BC9BC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:01:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4767AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 10:01:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC9v8sQ024934; Tue, 12 Nov 2019 11:01:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7sMMo1E1Wmic1NL7vYXk1XrdLrnGI+aTyabPRgP5tfg=;
 b=PRA4/PUgPdWuGUcWgTzo5RvUeDk8whuyob80FJQs++ejvwR24FRIvPm/gnh+X5wT8H5z
 ji/08BAP8DWm67vkDjh84CSbbYquKYxf3lQS8KcbCSjV/OWjEi49vezQUI93tG6oxv1m
 w1dzYkIRy4z3RL48Vi+PT5BwyKOS/epXm1igTb0f5xN6dnaERH66kQ7oY7WfLePzferV
 zT760b5h0VF6aSuxcQzO5vvioQyBkLvUso/S5PXTS9z4VX0j7KNaVup/WUoPDHhC52V3
 VOFlLbm7kIdk718iEGsxC7pc5ei26eCjoQyyPOC4qAd1tvCM7z9feQHoIQ/1VjbTkxZl tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w7psts74e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 11:01:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3467310003A;
 Tue, 12 Nov 2019 11:01:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BDD32B1B27;
 Tue, 12 Nov 2019 11:01:49 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 11:01:48 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 11:01:40 +0100
Message-ID: <20191112100145.15940-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112100145.15940-1-patrick.delaunay@st.com>
References: <20191112100145.15940-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/7] usb: gadget: dwc2: change trace level for
	phy errors managed by uclass
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

As the error message is now displayed by generic phy functions,
the dev_err can be change to dev_dbg.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/usb/gadget/dwc2_udc_otg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index 35f4147840..35495e41fc 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -980,7 +980,7 @@ int dwc2_phy_setup(struct udevice *dev, struct phy **array, int *num_phys)
 	for (i = 0; i < count; i++) {
 		ret = generic_phy_init(&usb_phys[i]);
 		if (ret) {
-			dev_err(dev, "Can't init USB PHY%d for %s\n",
+			dev_dbg(dev, "Can't init USB PHY%d for %s\n",
 				i, dev->name);
 			goto phys_init_err;
 		}
@@ -989,7 +989,7 @@ int dwc2_phy_setup(struct udevice *dev, struct phy **array, int *num_phys)
 	for (i = 0; i < count; i++) {
 		ret = generic_phy_power_on(&usb_phys[i]);
 		if (ret) {
-			dev_err(dev, "Can't power USB PHY%d for %s\n",
+			dev_dbg(dev, "Can't power USB PHY%d for %s\n",
 				i, dev->name);
 			goto phys_poweron_err;
 		}
@@ -1027,7 +1027,7 @@ void dwc2_phy_shutdown(struct udevice *dev, struct phy *usb_phys, int num_phys)
 		ret = generic_phy_power_off(&usb_phys[i]);
 		ret |= generic_phy_exit(&usb_phys[i]);
 		if (ret) {
-			dev_err(dev, "Can't shutdown USB PHY%d for %s\n",
+			dev_dbg(dev, "Can't shutdown USB PHY%d for %s\n",
 				i, dev->name);
 		}
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
