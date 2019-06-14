Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F242145B22
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2019 13:08:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB695C5BAE7
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2019 11:08:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9197EC5BAE7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 11:08:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EB7nVM031210; Fri, 14 Jun 2019 13:08:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=dpUVnncQl04gaK+C7lUgAKUNZC2FJorqOeeGnF51AUc=;
 b=cMoHI4KkTqsxkxZHIZgNlpx7su0oeO9RzsBsdF1dKwXZl6+jlJ2WZQEiAddQqHMprjcv
 QsJI9r8RDfVn0OrKpDB/oTV3uk8gVg79bb5+Jkwpr7Rht2DZUwmgdpw0CosfWxGY8tDZ
 XQhev25DPpyeK+e07i4jGO/TXjBavnqAIj0Bui0G/8YdDWcC4sjhZ1HZbzSMCwcxiMzM
 J8XXgAMTvBSOaTHLOGYj9YpZK5uhR/LoRnJlNFqPeMU+9avXt/WpGEtHC5+mJOio6uZO
 FxzehTJcaQVzG5zOB/0ITBXvPChjM7YmMWkDxsHWM6eK1zzHZkbiGwfxR1R84Vt5GyNF ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t2f8ehr7n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 14 Jun 2019 13:08:36 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4771131;
 Fri, 14 Jun 2019 11:08:36 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33B5B282A;
 Fri, 14 Jun 2019 11:08:36 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Jun
 2019 13:08:36 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Jun 2019 13:08:35
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Jun 2019 13:08:32 +0200
Message-ID: <1560510512-15015-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560510512-15015-1-git-send-email-patrick.delaunay@st.com>
References: <1560510512-15015-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] usb: dwc2: allow peripheral mode for OTG
	configuration
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

 drivers/usb/gadget/dwc2_udc_otg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index 7e6b5fc..895f8c9 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -1042,7 +1042,8 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
 	u32 tx_fifo_sz_array[DWC2_MAX_HW_ENDPOINTS];
 	int ret, i;
 
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
