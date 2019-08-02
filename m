Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC127F6EE
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 14:33:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97B7DC35E03
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 12:33:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96512C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 12:33:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72CQZFt031144; Fri, 2 Aug 2019 14:33:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=T8vcUmncndOV6X8CqhTdCOVkpxVcY5LWO7iz3xC7Jhw=;
 b=L83QexpNaX+u0OgYOcQ53yK0u/zEj+Jr5CUp3RTRx50bZ5tVPQnNrRrW0ZWcB2L8s+l3
 BElfA/grt7aS9ZOeymdl36zMsUdwD0I0EA2286T5JQhwjFj/59gUt9uPe/x5FokrUFSP
 cEVrOc8u9lrOmzygxDmtREaTDDSQDnDowTXiKnedYRPs/39/mon+0HeHnnMmyCrDbdS+
 bj2mmTMNLDMcmW5kknsuVdEwzynwT/pj1bYy6maKvziw2iYBQPsgifbiSKmE/uPNLRSM
 5IJ7IgSKBrAE8R4w2lGkjNCZOL5NDWwn3ExBVLGxMvFYMPGWjuw7ATlwfGMrOEpkaeJj +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u3vd0789d-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 14:33:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BD9834;
 Fri,  2 Aug 2019 12:33:50 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 710842C075F;
 Fri,  2 Aug 2019 14:33:50 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 14:33:50 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 14:33:49
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 14:33:41 +0200
Message-ID: <1564749223-29298-5-git-send-email-patrick.delaunay@st.com>
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
Subject: [Uboot-stm32] [PATCH 4/5] usb: host: dwc2: add usb33d supply
	support for stm32mp1
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

Enable the usb33d-supply on STM32MP1 SoCs (with "st,stm32mp1-hsotg"
compatible), it is the external VBUS and ID sensing comparators supply
needed to perform OTG operation.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/usb/host/dwc2.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index 836f706..1639bf2 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -1411,6 +1411,24 @@ static int dwc2_usb_probe(struct udevice *dev)
 	if (ret)
 		return ret;
 
+	if (CONFIG_IS_ENABLED(ARCH_STM32MP) &&
+	    device_is_compatible(dev, "st,stm32mp1-hsotg")) {
+		struct udevice *usb33d_supply;
+
+		ret = device_get_supply_regulator(dev, "usb33d-supply",
+						  &usb33d_supply);
+		if (ret) {
+			dev_err(dev,
+				"can't get voltage level detector supply\n");
+		} else {
+			ret = regulator_set_enable(usb33d_supply, true);
+			if (ret) {
+				dev_err(dev,
+					"can't enable voltage level detector supply\n");
+			}
+		}
+	}
+
 	return dwc2_init_common(dev, priv);
 }
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
