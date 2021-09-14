Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA2440ADBA
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Sep 2021 14:31:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BBE7C5A4CC;
	Tue, 14 Sep 2021 12:31:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17403C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Sep 2021 12:31:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E9qPKv029572; 
 Tue, 14 Sep 2021 14:31:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=HehQ7I5h4xAKVzC8BXygIzTf0xV+bXFsUucpM3Jb9hY=;
 b=Tx2nlZ9Pbig8d3AiP8BAGLTD+vR0WnpIE7OC2khiNlFvLzzu/SBNYq7VFZ6B+vLylosW
 dorT1AxxP4LMpdCRybi+HDNYGxuZIScwRhcVNsf7yMaux7BYaty7Z4aV1xfa6D8kAvw5
 6UM7LaelyauoOP9NOgdn3Kh5s/AfjR6tqIOHNdeDHk1b0aHQg3mnTkWx3PYSrAfY1032
 x6lD3AD2S1Wg/uDghduPbUgbmBRQGmXe6ohbknUR12Oj7qsZceLNIm8Cus6RBQSENOrk
 vnrNtBh0Wn46LVvb6lO2fdekVzD4Hc6Ca2habbINmIW61+1HE+NUMGP1tAEZkozPLcmY zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b2sg18tp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 14:31:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C0CE10002A;
 Tue, 14 Sep 2021 14:31:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F2D1A21BF57;
 Tue, 14 Sep 2021 14:31:19 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 14 Sep 2021 14:31:19
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Sep 2021 14:31:17 +0200
Message-ID: <20210914143026.2.I38b706ca6f52e86cb791245a2aee6a81fbd1c030@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914143026.1.I48db0a17460592df70f33306da8d8196cd13e0e9@changeid>
References: <20210914143026.1.I48db0a17460592df70f33306da8d8196cd13e0e9@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_03,2021-09-14_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] phy: stm32-usbphyc: stm32: usbphyc: add
	protection on phy sub-node
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

Add protection on presence and order of the phy node sub node
by using the mandatory reg information.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/phy/phy-stm32-usbphyc.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
index c206efd28d..9c1dcfae52 100644
--- a/drivers/phy/phy-stm32-usbphyc.c
+++ b/drivers/phy/phy-stm32-usbphyc.c
@@ -340,7 +340,7 @@ static int stm32_usbphyc_probe(struct udevice *dev)
 	struct stm32_usbphyc *usbphyc = dev_get_priv(dev);
 	struct reset_ctl reset;
 	ofnode node, connector;
-	int i, ret;
+	int ret;
 
 	usbphyc->base = dev_read_addr(dev);
 	if (usbphyc->base == FDT_ADDR_T_NONE)
@@ -378,14 +378,18 @@ static int stm32_usbphyc_probe(struct udevice *dev)
 		return ret;
 	}
 
-	/*
-	 * parse all PHY subnodes in order to populate regulator associated
-	 * to each PHY port
-	 */
-	node = dev_read_first_subnode(dev);
-	for (i = 0; i < MAX_PHYS; i++) {
-		struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + i;
+	/* parse all PHY subnodes to populate regulator associated to each PHY port */
+	dev_for_each_subnode(node, dev) {
+		fdt_addr_t phy_id;
+		struct stm32_usbphyc_phy *usbphyc_phy;
 
+		phy_id = ofnode_read_u32_default(node, "reg", FDT_ADDR_T_NONE);
+		if (phy_id >= MAX_PHYS) {
+			dev_err(dev, "invalid reg value %lx for %s\n",
+				phy_id, ofnode_get_name(node));
+			return -ENOENT;
+		}
+		usbphyc_phy = usbphyc->phys + phy_id;
 		usbphyc_phy->init = false;
 		usbphyc_phy->powered = false;
 		ret = stm32_usbphyc_get_regulator(node, "phy-supply",
@@ -401,8 +405,6 @@ static int stm32_usbphyc_probe(struct udevice *dev)
 			ret = stm32_usbphyc_get_regulator(connector, "vbus-supply",
 							  &usbphyc_phy->vbus);
 		}
-
-		node = dev_read_next_subnode(node);
 	}
 
 	/* Check if second port has to be used for host controller */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
