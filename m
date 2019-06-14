Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A85B45B23
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2019 13:08:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27CD7C5BAE9
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2019 11:08:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6B6AC5BAE7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 11:08:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EB7q1v031238; Fri, 14 Jun 2019 13:08:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=u6g7v0hdYFpGtZGaYt90aDhrQp4lms8JExepu1x52yg=;
 b=doiyu892M4vwKLuk9B+DeLPiIaQQQyH22sK35Gw8imTUU2j5CcaLy582AD/YjS2U9YMy
 A83FC+KTzgk+KxQljtPf9p6kXtUNVh7z3Th4NFi1NMOSJxOvpQxu0V+oHFdkv35kv526
 QzDMaJ/RHRyUBc62GADA/QQEWJkOIJtjBL28QdRK+C7w/EPDOkV4wY6zv7v2kXWAt/CZ
 aa6DNBwhaOp8HywsAdSp0zU6OM868DW1FPwrvs7xlo7LKIgJUBm5gYapT0INik3bU1zP
 f8Lg8aywRPzTnPDsNa332D20Wd0YIUvl+s0keLs8YQHIaEvxL+Q6xZjhkL3tJfoRDL5K ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t2f8ehr7m-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 14 Jun 2019 13:08:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E9B134;
 Fri, 14 Jun 2019 11:08:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D159282A;
 Fri, 14 Jun 2019 11:08:35 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Jun
 2019 13:08:35 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Jun 2019 13:08:34
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Jun 2019 13:08:31 +0200
Message-ID: <1560510512-15015-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [Uboot-stm32] [PATCH 1/2] usb: dwc2: correctly handle binding for
	g-tx-fifo-size
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

 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi |  4 ----
 drivers/usb/gadget/dwc2_udc_otg.c        | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
index 5b19e44..994092a 100644
--- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
@@ -56,10 +56,6 @@
 	};
 };
 
-&usbotg_hs {
-	g-tx-fifo-size = <576>;
-};
-
 &v3v3 {
 	regulator-always-on;
 };
diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index 494ab53..7e6b5fc 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -1039,6 +1039,8 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
 	int node = dev_of_offset(dev);
 	ulong drvdata;
 	void (*set_params)(struct dwc2_plat_otg_data *data);
+	u32 tx_fifo_sz_array[DWC2_MAX_HW_ENDPOINTS];
+	int ret, i;
 
 	if (usb_get_dr_mode(node) != USB_DR_MODE_PERIPHERAL) {
 		dev_dbg(dev, "Invalid mode\n");
@@ -1050,7 +1052,20 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
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
+					 tx_fifo_sz_array,
+					 platdata->tx_fifo_sz_nb);
+		if (ret)
+			return ret;
+		for (i = 0; i < platdata->tx_fifo_sz_nb; i++)
+			platdata->tx_fifo_sz_array[i] = tx_fifo_sz_array[i];
+	}
 
 	platdata->force_b_session_valid =
 		dev_read_bool(dev, "u-boot,force-b-session-valid");
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
