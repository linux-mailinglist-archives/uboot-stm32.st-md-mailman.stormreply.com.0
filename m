Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A62AC6E4EA7
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Apr 2023 18:56:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3879DC65E70;
	Mon, 17 Apr 2023 16:56:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0A67C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 16:56:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33HEBPQk018552; Mon, 17 Apr 2023 18:56:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=3+zhEJFJL3NMdq0XaxStxpm+FiqE1C2YL5HSmQM+w9Y=;
 b=H5wbSt8knnJ7poXrVLuNun/PxVpHHQhnUXbPIaLxSTcPz1BqPscmANnjwwreXrUNpy+r
 X6O3mhioIjTAKu/Y/5+Xw8EfZgrDzpryWlWOrH+TVkIcxc7Ez63LwX+Mhz6mKnhQY80c
 yy6dqXBieRtMKp6l3nClm9ScOeUz7N7pok+8gdC0pdLCP/a44jEy6IUDA0yLVsEokAd+
 A41l25dZvS6df5iS0EZ5IP8RxnZPtkp+WKFaQjiCpZq6PkK+Yko+rfr/M2kGPk2H43aT
 RFUYPtYKEiEh2v4zrFfON9WvlRmGIHjnN84BnDqLIrrnTo16iK/1rBw1T2zU/2ILHo8D wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q10vduw1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 18:56:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D03410002A;
 Mon, 17 Apr 2023 18:56:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F3192309D8;
 Mon, 17 Apr 2023 18:56:09 +0200 (CEST)
Received: from localhost (10.201.21.26) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 17 Apr
 2023 18:56:09 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 17 Apr 2023 18:56:04 +0200
Message-ID: <20230417185558.1.If7ed2ccb5a1c1a84637d29d763cc1935d9b8815e@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_11,2023-04-17_01,2023-02-09_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [Uboot-stm32] [PATCH] usb: onboard-hub: Don't disable regulator in
	remove() callback
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

In case USB hub regulator is shared, unexpected behavior occurs.
On stm32mp135f-dk, stm32mp157c-ev1 and stm32mp157x-dkx, regulator
v3v3 is shared between several IP/devices (USB, panel, ethernet phy,
camera, ...).
Running command "usb stop", v3v3 regulator is switched off and
the splashscreen content disappear.

v3v3 shouldn't be disabled on usb_onboard_hub_remove() callback.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 common/usb_onboard_hub.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/common/usb_onboard_hub.c b/common/usb_onboard_hub.c
index 89e18a2ddad..8a83f7877ef 100644
--- a/common/usb_onboard_hub.c
+++ b/common/usb_onboard_hub.c
@@ -34,18 +34,6 @@ static int usb_onboard_hub_probe(struct udevice *dev)
 	return ret;
 }
 
-static int usb_onboard_hub_remove(struct udevice *dev)
-{
-	struct onboard_hub *hub = dev_get_priv(dev);
-	int ret;
-
-	ret = regulator_set_enable_if_allowed(hub->vdd, false);
-	if (ret)
-		dev_err(dev, "can't disable vdd-supply: %d\n", ret);
-
-	return ret;
-}
-
 static const struct udevice_id usb_onboard_hub_ids[] = {
 	/* Use generic usbVID,PID dt-bindings (usb-device.yaml) */
 	{ .compatible = "usb424,2514" }, /* USB2514B USB 2.0 */
@@ -56,7 +44,6 @@ U_BOOT_DRIVER(usb_onboard_hub) = {
 	.name	= "usb_onboard_hub",
 	.id	= UCLASS_USB_HUB,
 	.probe = usb_onboard_hub_probe,
-	.remove = usb_onboard_hub_remove,
 	.of_match = usb_onboard_hub_ids,
 	.priv_auto = sizeof(struct onboard_hub),
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
