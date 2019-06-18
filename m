Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E78304A49D
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 16:57:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24BB9CB36E9
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 14:57:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83A3ACB36E4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 14:57:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IEtwjW027249; Tue, 18 Jun 2019 16:57:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JjTOdGIelS2ulJqE0pQ9RAARDMFHAiIsDb0iTKio8iw=;
 b=TeBrezGYSjr+R7grwh5krPbK4C2u/OcGQz7xFNL/9cx2IJfGBRqW1B/XWUPOy2kHcbxW
 l2C3siSxXmUZIFJ5Ldd6E5F1fZhnTWfYvg43A4d2Fatoyd7Nv7jm3JfjbzUOVH1kPYHJ
 VPq9qMgfhcBUdTCRiHgvIqqS25Iw00o9Bw86jeCmjho0jB4+hUrP1wzc7u+01j1flML8
 7MXiQyIc2yg4FCmTLWoE4OOM2QuaHOduMG0tbGPsQIwBwSNo0p09UyDbiGWhHz/APvdo
 qxq3lIhnD2YvnNPhdYymx8A2ktsOhJcJboxEt5gysmTAMs6AB3B2KGdUokY+6r1PwFXD lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t68n3qb8u-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 16:57:24 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 158D334;
 Tue, 18 Jun 2019 14:57:24 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFFB62B6E;
 Tue, 18 Jun 2019 14:57:23 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun
 2019 16:57:24 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun 2019 16:57:23
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Jun 2019 16:57:18 +0200
Message-ID: <1560869838-22025-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560869838-22025-1-git-send-email-patrick.delaunay@st.com>
References: <1560869838-22025-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] usb: dwc2: allow peripheral mode for
	OTG configuration
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

Allow device mode in DWC2 driver when device tree select the dr_mode
"peripheral" or "otg".

The device mode is not allowed when dr_mode = "host" in device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 drivers/usb/gadget/dwc2_udc_otg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index 023439c..35f4147 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -1041,7 +1041,8 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
 	void (*set_params)(struct dwc2_plat_otg_data *data);
 	int ret;
 
-	if (usb_get_dr_mode(node) != USB_DR_MODE_PERIPHERAL) {
+	if (usb_get_dr_mode(node) != USB_DR_MODE_PERIPHERAL &&
+	    usb_get_dr_mode(node) != USB_DR_MODE_OTG) {
 		dev_dbg(dev, "Invalid mode\n");
 		return -ENODEV;
 	}
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
