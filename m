Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4BD5BE4A0
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Sep 2022 13:40:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A573EC640F2;
	Tue, 20 Sep 2022 11:40:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75C5FC640F0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 11:40:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K8rQwO004835;
 Tue, 20 Sep 2022 13:39:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=dmaDYwJ7MqWk7jYJOJaHlvWUsUVdSA+hZMSdT2l5VuU=;
 b=hQOI0PbFzoip8zWqlmvFppmsnqXPWKYWYvS2r6IJB0i5eXxHAu6YkHF9NHaE9WF9et0s
 hxmi0280+CD3ELG+9GKPcMVBdwjZqo25FBMtAlFMmCijZ2uYdTsNZfILnaDVSGZRgFuu
 ByW+TSIDQ+4yIIXYTLvTIMtPHScqJprYb/qJorOV7ufo1IqbfRgEe9SaIIq+3OO7W3br
 7WuGfvBiP4W3BCZ+j1SiT4HM+frSE1YZOMbnyucKvrYxjzKfYh6P6P/7gaWJEfSHtIR1
 bSjR10oGyHf5xM3A5wuPhWnFLm6z6El5JytWrY6gvPrpBU9Hxms7QwjTsoWZYfE1xkUN aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6ckjgrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 13:39:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05A3C10002A;
 Tue, 20 Sep 2022 13:39:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECCE7229A8F;
 Tue, 20 Sep 2022 13:39:57 +0200 (CEST)
Received: from localhost (10.75.127.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 20 Sep
 2022 13:39:57 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Sep 2022 13:39:56 +0200
Message-ID: <20220920133954.1.Iff08cf94aa6c6d3678acb28a8dd012d466184b42@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_04,2022-09-16_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] phy: usbphyc: use
	regulator_set_enable_if_allowed for disabling vbus supply
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

Use regulator_set_enable_if_allowed() api instead of regulator_set_enable()
while disabling vbus supply. This way the driver doesn't see an error
when it disable an always-on regulator for VBUS.

This patch is needed for STM32MP157C-DK2 board when the regulator
v3v3: buck4 used as the phy vbus supply in kernel device tree
is always on with the next hack for low power use-case:

&usbphyc_port0 {
        ...
	/*
	 * Hack to keep hub active until all connected devices are suspended
	 * otherwise the hub will be powered off as soon as the v3v3 is disabled
	 * and it can disturb connected devices.
	 */
	connector {
		compatible = "usb-a-connector";
		vbus-supply = <&v3v3>;
	};
};

Without this patch and the previous update in DT the command
"usb stop" failed and the next command "usb start" cause a crash.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/phy/phy-stm32-usbphyc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
index 9f0b7d71187..dcf2194e9a7 100644
--- a/drivers/phy/phy-stm32-usbphyc.c
+++ b/drivers/phy/phy-stm32-usbphyc.c
@@ -375,7 +375,7 @@ static int stm32_usbphyc_phy_power_off(struct phy *phy)
 		return 0;
 
 	if (usbphyc_phy->vbus) {
-		ret = regulator_set_enable(usbphyc_phy->vbus, false);
+		ret = regulator_set_enable_if_allowed(usbphyc_phy->vbus, false);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
