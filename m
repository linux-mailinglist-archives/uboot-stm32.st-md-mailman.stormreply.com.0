Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2A9D5CF9
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 10:00:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EB30C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 08:00:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D637C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 08:00:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7tkto023120; Mon, 14 Oct 2019 10:00:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=E0SUAKd7kDijgDsZj0s6Qmu0hNQF6dEuFeQhlDOdoh0=;
 b=inv8ceNi6NgruO9lSeRqjKLey6KDxCDs8iZ8bE/ZfcR5Y5poZnXs/V/itLgg5tc2732Z
 gUpYFsS0wJTQHjsTNdelnS5+7WcJQQYjHzN+Mqm5hvPnyVY3Ru8GHij6Oj8sc6f9NYjn
 o/WnPucL2zvonz51RFrcy+Qb1GYW6lNZvoS/kZRP0HrsZGIffISY4kI6eedNTpAUgWmQ
 s41t1I7p0SGi9r/MOLFyp3rwIh/0GTH664r/tH1cH1Bjten8IeJWe0ffmOCHQfj2YnhN
 ZkiHUOmwp9jiphT3gM44NCKGRNoWJc3VqF8VKOFJo2moqrQhGZShTxtfYRvVhbC2IO6c DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9hbab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 10:00:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0951410002A;
 Mon, 14 Oct 2019 10:00:43 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3DCD2B1867;
 Mon, 14 Oct 2019 10:00:42 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 10:00:42 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 10:00:42
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 10:00:24 +0200
Message-ID: <20191014080025.11245-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014080025.11245-1-patrick.delaunay@st.com>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 4/5] usb: host: dwc2: add usb33d supply
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
index 3086411fc4..5b499abded 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -1414,6 +1414,24 @@ static int dwc2_usb_probe(struct udevice *dev)
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
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
