Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E34574A49C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 16:57:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17825CB36E5
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 14:57:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1C93CB36E4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 14:57:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IEtuxi027031; Tue, 18 Jun 2019 16:57:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=sTPidtxvVKw3NeTMejTr8N19SQ/YcQHymGv92Cs5ADQ=;
 b=l31jdMVlckR5wNYzhSx+YPzC/FEOcqACf8Hvl9WLlTXvYxhmSdJYMm2iSAHtip3O0lBC
 2ObD47s6M2SIzbCI4lxrQ54mgXXX88p2MO+zzKe/rh0CLKzCn7lii9sDIKu4LwwnI3Jp
 uOEkVP4WUPuUDqUb7HmbuWuIhYW9k0Wxvms+bLnRDpcpqeNJ2S5zJOq1JpE0UykMVAIe
 xrhqCBOsspq+8tzBhgC6BRK/rqFJWCoJdq0eMx3iD4np3xkBGESx5iuuZXsYrvEKQtnB
 UiRVkLI7huU7xa9AF5Q9cbgws/sUeU6/YCsUTlutraF1uMFFIil4TAvjtLK1ef0S8e7D Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t68n3qb8r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 16:57:23 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A1F5238;
 Tue, 18 Jun 2019 14:57:21 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0BA12B6E;
 Tue, 18 Jun 2019 14:57:21 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun
 2019 16:57:21 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun 2019 16:57:21
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Jun 2019 16:57:16 +0200
Message-ID: <1560869838-22025-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/3] usb: dwc2: correctly handle binding
	for g-tx-fifo-size
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

Manage g-tx-fifo-size as a array as specify in the binding.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- move dt update in a separate patch
- remove unecessary temporary variable

 drivers/usb/gadget/dwc2_udc_otg.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index 494ab53..023439c 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -1039,6 +1039,7 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
 	int node = dev_of_offset(dev);
 	ulong drvdata;
 	void (*set_params)(struct dwc2_plat_otg_data *data);
+	int ret;
 
 	if (usb_get_dr_mode(node) != USB_DR_MODE_PERIPHERAL) {
 		dev_dbg(dev, "Invalid mode\n");
@@ -1050,7 +1051,18 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
 	platdata->rx_fifo_sz = dev_read_u32_default(dev, "g-rx-fifo-size", 0);
 	platdata->np_tx_fifo_sz = dev_read_u32_default(dev,
 						       "g-np-tx-fifo-size", 0);
-	platdata->tx_fifo_sz = dev_read_u32_default(dev, "g-tx-fifo-size", 0);
+
+	platdata->tx_fifo_sz_nb =
+		dev_read_size(dev, "g-tx-fifo-size") / sizeof(u32);
+	if (platdata->tx_fifo_sz_nb > DWC2_MAX_HW_ENDPOINTS)
+		platdata->tx_fifo_sz_nb = DWC2_MAX_HW_ENDPOINTS;
+	if (platdata->tx_fifo_sz_nb) {
+		ret = dev_read_u32_array(dev, "g-tx-fifo-size",
+					 platdata->tx_fifo_sz_array,
+					 platdata->tx_fifo_sz_nb);
+		if (ret)
+			return ret;
+	}
 
 	platdata->force_b_session_valid =
 		dev_read_bool(dev, "u-boot,force-b-session-valid");
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
