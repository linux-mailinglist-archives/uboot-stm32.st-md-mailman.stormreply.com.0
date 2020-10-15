Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F028B28F2AE
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 14:51:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B56BFC32EA7;
	Thu, 15 Oct 2020 12:51:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAB63C32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 12:51:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FCn7K9012094; Thu, 15 Oct 2020 14:51:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bo+hzgSOxDJlibvJe/Qs0DHt+QE6MUtLUY4cGV38Qvk=;
 b=IensN3Oxe3f/d9hpyAlu5AHYuv2AehKFRVEmobZGUvI/hm/OrIAV0uFvIWgBm7yOowaj
 Ry/t/67aGzXTw08LSJ1SmlFYZwi7L1pHQzbranl3cqaMVB+kb/ngwxE2I8kmsEDzZOfX
 5nsMVEZngDT2pb729EAwFO6oxmgLEn3Xhh4AraaCVAH8R4hqU0RtZ9oU2kMXKNkg+Ue2
 xsKqrSb/Xzg3pUbJ3OYwT1T7STmM0NuOfKWDL/TSAISKkmEx90ujhz10y4K9pht7QLs5
 Q5kOYd0y/QVKolWs6GWlwsDPi8EWsnc+lh3nevagmUf3gS00eBkx5Ir6pppw1K6DwKuG JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wp8f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 14:51:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6A72100038;
 Thu, 15 Oct 2020 14:51:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ADDBD221F9E;
 Thu, 15 Oct 2020 14:51:00 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct 2020 14:51:00
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Oct 2020 14:50:57 +0200
Message-ID: <20201015125057.8037-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_07:2020-10-14,
 2020-10-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] phy: stm32: usbphyc: manage optional vbus
	regulator on phy_power_on/off
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

This patch adds support for optional vbus regulator.
It is managed on phy_power_on/off calls and may be needed for host mode.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../phy/phy-stm32-usbphyc.txt                 |  2 ++
 drivers/phy/phy-stm32-usbphyc.c               | 33 +++++++++++++------
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/doc/device-tree-bindings/phy/phy-stm32-usbphyc.txt b/doc/device-tree-bindings/phy/phy-stm32-usbphyc.txt
index da98407403..edfe4b426c 100644
--- a/doc/device-tree-bindings/phy/phy-stm32-usbphyc.txt
+++ b/doc/device-tree-bindings/phy/phy-stm32-usbphyc.txt
@@ -45,6 +45,8 @@ Required properties:
 - #phy-cells: see phy-bindings.txt in the same directory, must be <0> for PHY
   port#1 and must be <1> for PHY port#2, to select USB controller
 
+Optional properties:
+- vbus-supply: phandle to the regulator providing 5V vbus to the USB connector
 
 Example:
 		usbphyc: usb-phy@5a006000 {
diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
index 9d4296d649..ab4a913c93 100644
--- a/drivers/phy/phy-stm32-usbphyc.c
+++ b/drivers/phy/phy-stm32-usbphyc.c
@@ -59,6 +59,7 @@ struct stm32_usbphyc {
 	struct udevice *vdda1v8;
 	struct stm32_usbphyc_phy {
 		struct udevice *vdd;
+		struct udevice *vbus;
 		bool init;
 		bool powered;
 	} phys[MAX_PHYS];
@@ -244,6 +245,11 @@ static int stm32_usbphyc_phy_power_on(struct phy *phy)
 		if (ret)
 			return ret;
 	}
+	if (usbphyc_phy->vbus) {
+		ret = regulator_set_enable(usbphyc_phy->vbus, true);
+		if (ret)
+			return ret;
+	}
 
 	usbphyc_phy->powered = true;
 
@@ -262,6 +268,11 @@ static int stm32_usbphyc_phy_power_off(struct phy *phy)
 	if (stm32_usbphyc_is_powered(usbphyc))
 		return 0;
 
+	if (usbphyc_phy->vbus) {
+		ret = regulator_set_enable(usbphyc_phy->vbus, false);
+		if (ret)
+			return ret;
+	}
 	if (usbphyc_phy->vdd) {
 		ret = regulator_set_enable_if_allowed(usbphyc_phy->vdd, false);
 		if (ret)
@@ -271,7 +282,7 @@ static int stm32_usbphyc_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int stm32_usbphyc_get_regulator(struct udevice *dev, ofnode node,
+static int stm32_usbphyc_get_regulator(ofnode node,
 				       char *supply_name,
 				       struct udevice **regulator)
 {
@@ -281,19 +292,14 @@ static int stm32_usbphyc_get_regulator(struct udevice *dev, ofnode node,
 	ret = ofnode_parse_phandle_with_args(node, supply_name,
 					     NULL, 0, 0,
 					     &regulator_phandle);
-	if (ret) {
-		dev_err(dev, "Can't find %s property (%d)\n", supply_name, ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = uclass_get_device_by_ofnode(UCLASS_REGULATOR,
 					  regulator_phandle.node,
 					  regulator);
-
-	if (ret) {
-		dev_err(dev, "Can't get %s regulator (%d)\n", supply_name, ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
@@ -380,10 +386,17 @@ static int stm32_usbphyc_probe(struct udevice *dev)
 
 		usbphyc_phy->init = false;
 		usbphyc_phy->powered = false;
-		ret = stm32_usbphyc_get_regulator(dev, node, "phy-supply",
+		ret = stm32_usbphyc_get_regulator(node, "phy-supply",
 						  &usbphyc_phy->vdd);
-		if (ret)
+		if (ret) {
+			dev_err(dev, "Can't get phy-supply regulator\n");
 			return ret;
+		}
+
+		ret = stm32_usbphyc_get_regulator(node, "vbus-supply",
+						  &usbphyc_phy->vbus);
+		if (ret)
+			usbphyc_phy->vbus = NULL;
 
 		node = dev_read_next_subnode(node);
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
