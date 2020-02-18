Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA5816227A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 09:38:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55491C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 08:38:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22597C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 08:38:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01I8bW9w019925; Tue, 18 Feb 2020 09:38:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=XBEf59JrBo447AjcfOXy7EH9EdpSrjF/ne0Fqin3L70=;
 b=EO7UTw5Ilx/0Cg7Q0G10DlN6/RY3AI/ucSjPDQ0cI8I5QIbvD0SUNoZ2zdnskyi695dx
 JB/9TLr/D1V/3w0Dd6gRfFYULVelNB7uPRZmnzmuyjqWjvOUnIxYOqbFBoXQgqDZ+Tod
 EzAtGCZKl5GtmsWETo7AqLuZiM4dm1HVNoSnKAo4i0DmJvu//b4N2Lv9lDEOR+Zej+/g
 7aaHSTySdsWpX0WlX+yOpDrHBnxagD1DIO8m+qMsLcs0A95EY4Z82NMmuGpZZZHDCKa4
 wvYumpSi7Hc23DEVIRx36ZPPoBGB+qPAlX28HAw/kzyNxZT5tQpAs3pCwwGfZZb3zU23 Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y6705rwjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 09:38:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BDD78100038;
 Tue, 18 Feb 2020 09:38:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF8B321F692;
 Tue, 18 Feb 2020 09:38:42 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 18 Feb 2020 09:38:42 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Feb 2020 09:38:29 +0100
Message-ID: <20200218083836.6369-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_01:2020-02-17,
 2020-02-18 signatures=0
Cc: Marek Vasut <marex@denx.de>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: [Uboot-stm32] [PATCH v2 1/8] phy: generic: add error trace to
	detect PHY issue in uclass
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

Add an error trace for PHY errors directly in generic phy
functions provided by PHY uclass.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

This patch is requested by Marek Vasut to avoid code duplication
in usb host serie for dwc2:

See http://patchwork.ozlabs.org/patch/1176048/#2297595
[U-Boot,RESEND,1/5] usb: host: dwc2: add phy support


Changes in v2:
- Rebase and add include dm/device_compat.h

 drivers/phy/phy-uclass.c | 41 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/phy-uclass.c b/drivers/phy/phy-uclass.c
index e201a90c8c..f4a602fbd0 100644
--- a/drivers/phy/phy-uclass.c
+++ b/drivers/phy/phy-uclass.c
@@ -7,6 +7,7 @@
 #include <common.h>
 #include <dm.h>
 #include <generic-phy.h>
+#include <dm/device_compat.h>
 
 static inline struct phy_ops *phy_dev_ops(struct udevice *dev)
 {
@@ -109,56 +110,86 @@ int generic_phy_get_by_name(struct udevice *dev, const char *phy_name,
 int generic_phy_init(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!phy)
 		return 0;
 	ops = phy_dev_ops(phy->dev);
 
-	return ops->init ? ops->init(phy) : 0;
+	ret = ops->init ? ops->init(phy) : 0;
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to init %s: %d.\n",
+			phy->dev->name, ret);
+
+	return ret;
 }
 
 int generic_phy_reset(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!phy)
 		return 0;
 	ops = phy_dev_ops(phy->dev);
 
-	return ops->reset ? ops->reset(phy) : 0;
+	ret = ops->reset ? ops->reset(phy) : 0;
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to reset %s: %d.\n",
+			phy->dev->name, ret);
+
+	return ret;
 }
 
 int generic_phy_exit(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!phy)
 		return 0;
 	ops = phy_dev_ops(phy->dev);
 
-	return ops->exit ? ops->exit(phy) : 0;
+	ret = ops->exit ? ops->exit(phy) : 0;
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to exit %s: %d.\n",
+			phy->dev->name, ret);
+
+	return ret;
 }
 
 int generic_phy_power_on(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!phy)
 		return 0;
 	ops = phy_dev_ops(phy->dev);
 
-	return ops->power_on ? ops->power_on(phy) : 0;
+	ret = ops->power_on ? ops->power_on(phy) : 0;
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to power on %s: %d.\n",
+			phy->dev->name, ret);
+
+	return ret;
 }
 
 int generic_phy_power_off(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!phy)
 		return 0;
 	ops = phy_dev_ops(phy->dev);
 
-	return ops->power_off ? ops->power_off(phy) : 0;
+	ret = ops->power_off ? ops->power_off(phy) : 0;
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to power off %s: %d.\n",
+			phy->dev->name, ret);
+
+	return ret;
 }
 
 UCLASS_DRIVER(phy) = {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
