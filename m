Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E9162278
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 09:38:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47E8FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 08:38:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1034FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 08:38:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01I8bYUr024584; Tue, 18 Feb 2020 09:38:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=S9noeE7XavIbhoZQewA/s3/fS4z7CAKvt1FF9+6N2VE=;
 b=PmwQxBmwjO8an9ieJk8brezyeS7GelGA/9CsNyH7Z54MKtUPX3MOgn3jZX1zjs1cFTNq
 bhA8/KSawdH62GG+T5otc0YMWsydcRjl/dJQc2tMUqqMJTeP0LXCOAqHr56egj5fwHsS
 cArgawhkdUiGTlV4YO+NsQNSvrmlUoEuvTdKsaVEcFMzi5UswXCeQg6ECRIbUCaZzpDo
 noAJ0OCaqypgTBYiaDaC3KWrqFjXrn7CerNTi+2vJy5odjhtLNK/ey8Ygr1CVmL8FRFQ
 IPYL1SaErWDmvrR3ZEAjrPl1NpWbz6Ra7a1VhrNGQmSfJ34y7kOt6cmnzoDt9psJQAXD 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y67a1rtv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 09:38:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 624B1100039;
 Tue, 18 Feb 2020 09:38:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5706821F692;
 Tue, 18 Feb 2020 09:38:43 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 18 Feb 2020 09:38:42 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Feb 2020 09:38:30 +0100
Message-ID: <20200218083836.6369-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218083836.6369-1-patrick.delaunay@st.com>
References: <20200218083836.6369-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_01:2020-02-17,
 2020-02-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/8] usb: gadget: dwc2: change trace level
	for phy errors managed by uclass
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

Changes in v2: None

 drivers/usb/gadget/dwc2_udc_otg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index 496abf38e7..cfe564432f 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -983,7 +983,7 @@ int dwc2_phy_setup(struct udevice *dev, struct phy **array, int *num_phys)
 	for (i = 0; i < count; i++) {
 		ret = generic_phy_init(&usb_phys[i]);
 		if (ret) {
-			dev_err(dev, "Can't init USB PHY%d for %s\n",
+			dev_dbg(dev, "Can't init USB PHY%d for %s\n",
 				i, dev->name);
 			goto phys_init_err;
 		}
@@ -992,7 +992,7 @@ int dwc2_phy_setup(struct udevice *dev, struct phy **array, int *num_phys)
 	for (i = 0; i < count; i++) {
 		ret = generic_phy_power_on(&usb_phys[i]);
 		if (ret) {
-			dev_err(dev, "Can't power USB PHY%d for %s\n",
+			dev_dbg(dev, "Can't power USB PHY%d for %s\n",
 				i, dev->name);
 			goto phys_poweron_err;
 		}
@@ -1030,7 +1030,7 @@ void dwc2_phy_shutdown(struct udevice *dev, struct phy *usb_phys, int num_phys)
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
