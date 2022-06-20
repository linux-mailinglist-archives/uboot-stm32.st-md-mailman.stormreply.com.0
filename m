Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 969C15514F3
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 11:55:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29851C03FDF;
	Mon, 20 Jun 2022 09:55:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CEFCC035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 09:55:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K8uDKc025756;
 Mon, 20 Jun 2022 11:55:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=bOxjJz8VlGnm8quF55whjcAfBlq7C6XPmbGuzXCSdro=;
 b=mJ0R4qVfg1HTLM/EGFSGQOx3w+P/3c4/8J8J/Uy+PfcclARGRoevIrUCEOq7doC0FdKS
 XZ+0+4la7A5ZA5viT7EAZ7djXjZMU1QeMgjc7U1UXKBJWRvxhozCmEa1knv3HXon3ahD
 SaX7fxYWAnMeNKmppbTk/eESEeK+27gHsM0VZ3fSnZuyR2oX+neCmwQsPHmciJv8a2AM
 PR+5bC2SJREVzJNWA4uckVkpVFJCtsOONsQLcPnId4mfgCKAuSFsqtXgmQ1W8YJVaWZg
 51Ttsdic4hilMHbwmUr/kE2TMyrVbtwFdlL+i8qhBA5JTeuA24K8JKJ7IspD7B0a28lj lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtntu0cbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 11:55:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2192F10002A;
 Mon, 20 Jun 2022 11:55:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16739228A53;
 Mon, 20 Jun 2022 11:55:10 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 11:55:09 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 11:55:07 +0200
Message-ID: <20220620115452.1.I18e4ad5947e3b321573efe2085dd4c593cabbabe@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@foss.st.com>
Subject: [Uboot-stm32] [PATCH] video: stm32: remove test on
	CONFIG_DM_REGULATOR
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

The tests on CONFIG_DM_REGULATOR, added to avoid compilation issues, can
now be removed, they are no more needed since the commit 16cc5ad0b439
("power: regulator: add dummy helper").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/video/stm32/stm32_dsi.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index 134abd93e19..5871ac7c4ff 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -433,19 +433,17 @@ static int stm32_dsi_probe(struct udevice *dev)
 		return -EINVAL;
 	}
 
-	if (IS_ENABLED(CONFIG_DM_REGULATOR)) {
-		ret =  device_get_supply_regulator(dev, "phy-dsi-supply",
-						   &priv->vdd_reg);
-		if (ret && ret != -ENOENT) {
-			dev_err(dev, "Warning: cannot get phy dsi supply\n");
-			return -ENODEV;
-		}
+	ret =  device_get_supply_regulator(dev, "phy-dsi-supply",
+					   &priv->vdd_reg);
+	if (ret && ret != -ENOENT) {
+		dev_err(dev, "Warning: cannot get phy dsi supply\n");
+		return -ENODEV;
+	}
 
-		if (ret != -ENOENT) {
-			ret = regulator_set_enable(priv->vdd_reg, true);
-			if (ret)
-				return ret;
-		}
+	if (ret != -ENOENT) {
+		ret = regulator_set_enable(priv->vdd_reg, true);
+		if (ret)
+			return ret;
 	}
 
 	ret = clk_get_by_name(device->dev, "pclk", &clk);
@@ -493,8 +491,7 @@ static int stm32_dsi_probe(struct udevice *dev)
 err_clk:
 	clk_disable(&clk);
 err_reg:
-	if (IS_ENABLED(CONFIG_DM_REGULATOR))
-		regulator_set_enable(priv->vdd_reg, false);
+	regulator_set_enable(priv->vdd_reg, false);
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
