Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9B5ADF99
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 08:15:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DE03C64103;
	Tue,  6 Sep 2022 06:15:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D46AC640FE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 06:15:48 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2865pVd0032350;
 Tue, 6 Sep 2022 08:15:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Ht5KMTwUQ2CxNQULo+n7KgnYZcAED8zh6CaGYaghN6U=;
 b=4e1TjYbut6mYjToedW8FRH18ZkrmEBeSZObXoRd/TPH7bdpQmNXNjBMrWnpBe1UXI7xS
 YX2kmj4wWoAtSk30wA+r1dS2N2LGhqpPXDUniAp8PKudckmbeoWQj1Xu1r6U10OOsi2G
 N88AaWH3cy+tTtHm1TcEhytpEoworVF7asnJXcZL/6YQiD+w0F5kY5UWI/a5xRwgVrcH
 gloSKV7UNgoktjlCHeH5GJZEihOM8olkFI4xeJMskjYBxwn/sGfDywuW/Nc3HSVM5YKz
 X7UevAGviRv8YfU+DMRYjH1j5Fuqt15wVs26XpJtdTzm0D0Y3F2FnTwQf2yF/0i9pEYh rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbvbn6c7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 08:15:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39D7C10002A;
 Tue,  6 Sep 2022 08:15:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31E122132D4;
 Tue,  6 Sep 2022 08:15:39 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 6 Sep 2022
 08:15:37 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Sep 2022 08:15:28 +0200
Message-ID: <20220906061529.3788894-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
References: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_03,2022-09-05_03,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@denx.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Ramon Fried <rfried.dev@gmail.com>, Andrew Scull <ascull@google.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Adam Ford <aford173@gmail.com>
Subject: [Uboot-stm32] [PATCH v1 3/4] usb: ehci: Make usage of
	generic_{setup, shutdown}_phy() helpers
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

Replace ehci_setup_phy() and ehci_shutdown_phy () by respectively
generic_setup_phy() and generic_shutdown_phy().

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Simon Glass <sjg@chromium.org>
---

 drivers/usb/host/ehci-generic.c | 6 +++---
 drivers/usb/host/ehci-msm.c     | 4 ++--
 drivers/usb/host/ehci-mx6.c     | 6 +++---
 drivers/usb/host/ehci-pci.c     | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/ehci-generic.c b/drivers/usb/host/ehci-generic.c
index 75c73bfe4e..a765a307a3 100644
--- a/drivers/usb/host/ehci-generic.c
+++ b/drivers/usb/host/ehci-generic.c
@@ -96,7 +96,7 @@ static int ehci_usb_probe(struct udevice *dev)
 	if (err)
 		goto reset_err;
 
-	err = ehci_setup_phy(dev, &priv->phy, 0);
+	err = generic_setup_phy(dev, &priv->phy, 0);
 	if (err)
 		goto regulator_err;
 
@@ -111,7 +111,7 @@ static int ehci_usb_probe(struct udevice *dev)
 	return 0;
 
 phy_err:
-	ret = ehci_shutdown_phy(dev, &priv->phy);
+	ret = generic_shutdown_phy(&priv->phy);
 	if (ret)
 		dev_err(dev, "failed to shutdown usb phy (ret=%d)\n", ret);
 
@@ -141,7 +141,7 @@ static int ehci_usb_remove(struct udevice *dev)
 	if (ret)
 		return ret;
 
-	ret = ehci_shutdown_phy(dev, &priv->phy);
+	ret = generic_shutdown_phy(&priv->phy);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/host/ehci-msm.c b/drivers/usb/host/ehci-msm.c
index d160cf019d..dd0d153500 100644
--- a/drivers/usb/host/ehci-msm.c
+++ b/drivers/usb/host/ehci-msm.c
@@ -56,7 +56,7 @@ static int ehci_usb_probe(struct udevice *dev)
 	hcor = (struct ehci_hcor *)((phys_addr_t)hccr +
 			HC_LENGTH(ehci_readl(&(hccr)->cr_capbase)));
 
-	ret = ehci_setup_phy(dev, &p->phy, 0);
+	ret = generic_setup_phy(dev, &p->phy, 0);
 	if (ret)
 		return ret;
 
@@ -81,7 +81,7 @@ static int ehci_usb_remove(struct udevice *dev)
 	/* Stop controller. */
 	clrbits_le32(&ehci->usbcmd, CMD_RUN);
 
-	ret = ehci_shutdown_phy(dev, &p->phy);
+	ret = generic_shutdown_phy(&p->phy);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/host/ehci-mx6.c b/drivers/usb/host/ehci-mx6.c
index e30449b55e..fa2ca2a1d9 100644
--- a/drivers/usb/host/ehci-mx6.c
+++ b/drivers/usb/host/ehci-mx6.c
@@ -726,7 +726,7 @@ static int ehci_usb_probe(struct udevice *dev)
 	mdelay(10);
 
 #if defined(CONFIG_PHY)
-	ret = ehci_setup_phy(dev, &priv->phy, 0);
+	ret = generic_setup_phy(dev, &priv->phy, 0);
 	if (ret)
 		goto err_regulator;
 #endif
@@ -743,7 +743,7 @@ static int ehci_usb_probe(struct udevice *dev)
 
 err_phy:
 #if defined(CONFIG_PHY)
-	ehci_shutdown_phy(dev, &priv->phy);
+	generic_shutdown_phy(&priv->phy);
 err_regulator:
 #endif
 #if CONFIG_IS_ENABLED(DM_REGULATOR)
@@ -767,7 +767,7 @@ int ehci_usb_remove(struct udevice *dev)
 	ehci_deregister(dev);
 
 #if defined(CONFIG_PHY)
-	ehci_shutdown_phy(dev, &priv->phy);
+	generic_shutdown_phy(&priv->phy);
 #endif
 
 #if CONFIG_IS_ENABLED(DM_REGULATOR)
diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index 1ab306147f..e98ab31261 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -31,7 +31,7 @@ static int ehci_pci_init(struct udevice *dev, struct ehci_hccr **ret_hccr,
 	int ret;
 	u32 cmd;
 
-	ret = ehci_setup_phy(dev, &priv->phy, 0);
+	ret = generic_setup_phy(dev, &priv->phy, 0);
 	if (ret)
 		return ret;
 
@@ -149,7 +149,7 @@ static int ehci_pci_remove(struct udevice *dev)
 	if (ret)
 		return ret;
 
-	return ehci_shutdown_phy(dev, &priv->phy);
+	return generic_shutdown_phy(&priv->phy);
 }
 
 static const struct udevice_id ehci_pci_ids[] = {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
