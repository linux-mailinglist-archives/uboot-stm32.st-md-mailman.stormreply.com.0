Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE569213CB6
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 17:37:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B82D2C36B26
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 15:37:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ECD2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 15:37:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063FZO2q016611; Fri, 3 Jul 2020 17:37:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4aJ8eWoI5yrQMwN5RGCfeTAwEaxZ+osrAW6EpiBwNO4=;
 b=RFNXM727nDGt5bddkcGqetX4fTZ8vsWH+V+nDFPb2xOVM0BqSdWjLfFYZbMAUyfXWRIB
 PnLm84kUi066EdWME2qa2irA7nLgkWCIhW58uaAhLBtTEd316GxQWvX2st3OcIZHN89F
 RGju3ijZlrqXDo3GoT2tBrDLGtEKVXll53nwp6KnmJ08Lh0t93sdynWydRQ2LKSbpMlx
 bgu7Oby3kETi492x9Ukb1wtxusSnfLVPXC3NuhmZo3Rez1TK+o5jgsEDq7V0U7nceszx
 REw+mOR48orDA1IqSLIs58F+k0S1GULq/iWkSyG/08a709EXxLpHH45MFbu/LdaSXkr/ dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu8a7yaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 17:37:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A783B10002A;
 Fri,  3 Jul 2020 17:36:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A3A12A9AEA;
 Fri,  3 Jul 2020 17:36:59 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Jul 2020 17:36:58 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Jul 2020 17:36:40 +0200
Message-ID: <20200703153646.28533-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703153646.28533-1-patrick.delaunay@st.com>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_10:2020-07-02,
 2020-07-03 signatures=0
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Simon Glass <sjg@chromium.org>,
 Weijie Gao <weijie.gao@mediatek.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [Uboot-stm32] [PATCH v3 1/7] phy: generic: add error trace to
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


Changes in v3:
- rebase on next branch
- removed added dm/device_compat.h include after rebase
- simplify test on ops presence after Marek review

Changes in v2:
- Rebase and add include dm/device_compat.h

 drivers/phy/phy-uclass.c | 45 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/phy-uclass.c b/drivers/phy/phy-uclass.c
index db7f39cd0b..8f456f33d2 100644
--- a/drivers/phy/phy-uclass.c
+++ b/drivers/phy/phy-uclass.c
@@ -117,56 +117,91 @@ int generic_phy_get_by_name(struct udevice *dev, const char *phy_name,
 int generic_phy_init(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!generic_phy_valid(phy))
 		return 0;
 	ops = phy_dev_ops(phy->dev);
+	if (!ops->init)
+		return 0;
+	ret = ops->init(phy);
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to init %s: %d.\n",
+			phy->dev->name, ret);
 
-	return ops->init ? ops->init(phy) : 0;
+	return ret;
 }
 
 int generic_phy_reset(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!generic_phy_valid(phy))
 		return 0;
 	ops = phy_dev_ops(phy->dev);
+	if (!ops->reset)
+		return 0;
+	ret = ops->reset(phy);
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to reset %s: %d.\n",
+			phy->dev->name, ret);
 
-	return ops->reset ? ops->reset(phy) : 0;
+	return ret;
 }
 
 int generic_phy_exit(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!generic_phy_valid(phy))
 		return 0;
 	ops = phy_dev_ops(phy->dev);
+	if (!ops->exit)
+		return 0;
+	ret = ops->exit(phy);
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to exit %s: %d.\n",
+			phy->dev->name, ret);
 
-	return ops->exit ? ops->exit(phy) : 0;
+	return ret;
 }
 
 int generic_phy_power_on(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!generic_phy_valid(phy))
 		return 0;
 	ops = phy_dev_ops(phy->dev);
+	if (!ops->power_on)
+		return 0;
+	ret = ops->power_on(phy);
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to power on %s: %d.\n",
+			phy->dev->name, ret);
 
-	return ops->power_on ? ops->power_on(phy) : 0;
+	return ret;
 }
 
 int generic_phy_power_off(struct phy *phy)
 {
 	struct phy_ops const *ops;
+	int ret;
 
 	if (!generic_phy_valid(phy))
 		return 0;
 	ops = phy_dev_ops(phy->dev);
+	if (!ops->power_off)
+		return 0;
+	ret = ops->power_off(phy);
+	if (ret)
+		dev_err(phy->dev, "PHY: Failed to power off %s: %d.\n",
+			phy->dev->name, ret);
 
-	return ops->power_off ? ops->power_off(phy) : 0;
+	return ret;
 }
 
 int generic_phy_get_bulk(struct udevice *dev, struct phy_bulk *bulk)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
