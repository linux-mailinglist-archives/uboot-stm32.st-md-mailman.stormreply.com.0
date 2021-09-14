Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914440ADB9
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Sep 2021 14:31:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02A78C597BC;
	Tue, 14 Sep 2021 12:31:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2081C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Sep 2021 12:31:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E9q8eI028975; 
 Tue, 14 Sep 2021 14:31:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=1+yvVfgE3bCruy5O0yhjKh6P0tE0etZWBkeprvDICgs=;
 b=jkAFFiWQd305xvnlBW8z87Y+kBkWLYCGNChiRigJJc2II1pcupAR0fWAl6/fgGxsCscs
 gLSAyrzG0ybSqLNGRgcyiUXBVQTrxGPCEIyOPDACH/XNkPb7dcpbOMDxIk6O2RL4nYB/
 81y63LI1cij+U2m7SodvP4yFUYn1MPSHgmFKhU4pRRDAE9uBRj7wCluLnKsViU16rHgx
 lpcKVGalmS7c2FGK+VdJl9zFlSLhH4235Pcq/sF/fYrITMGv4IaTWvZcHwv1xhq69UKY
 MWEGV9GWiiIzSKX7menLQKq4gJRQTVeMrMpu77BftNwjyyE+a//YAYVWOWw+pvDWRIEz Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b2sg18tp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 14:31:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02D3110002A;
 Tue, 14 Sep 2021 14:31:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC1B921BF57;
 Tue, 14 Sep 2021 14:31:18 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 14 Sep 2021 14:31:18
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Sep 2021 14:31:16 +0200
Message-ID: <20210914143026.1.I48db0a17460592df70f33306da8d8196cd13e0e9@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_03,2021-09-14_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 1/2] phy: stm32-usbphyc: use connector for
	vbus-supply with phy-stm32-usbphyc
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

The vbus-supply is an optional property of sub-node connector node.
and no more in the usb phyc node (in first proposed binding).

This regulator for USB VBUS may be needed for host mode.

See the latest kernel binding for details in
Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml.

  usbphyc_port0: usb-phy@0 {
      reg = <0>;
      phy-supply = <&vdd_usb>;
      #phy-cells = <0>;
      connector {
          compatible = "usb-a-connector";
          vbus-supply = <&vbus_sw>;
      };
  };

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/phy/phy-stm32-usbphyc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
index 02d859a039..c206efd28d 100644
--- a/drivers/phy/phy-stm32-usbphyc.c
+++ b/drivers/phy/phy-stm32-usbphyc.c
@@ -339,7 +339,7 @@ static int stm32_usbphyc_probe(struct udevice *dev)
 {
 	struct stm32_usbphyc *usbphyc = dev_get_priv(dev);
 	struct reset_ctl reset;
-	ofnode node;
+	ofnode node, connector;
 	int i, ret;
 
 	usbphyc->base = dev_read_addr(dev);
@@ -395,10 +395,12 @@ static int stm32_usbphyc_probe(struct udevice *dev)
 			return ret;
 		}
 
-		ret = stm32_usbphyc_get_regulator(node, "vbus-supply",
-						  &usbphyc_phy->vbus);
-		if (ret)
-			usbphyc_phy->vbus = NULL;
+		usbphyc_phy->vbus = NULL;
+		connector = ofnode_find_subnode(node, "connector");
+		if (ofnode_valid(connector)) {
+			ret = stm32_usbphyc_get_regulator(connector, "vbus-supply",
+							  &usbphyc_phy->vbus);
+		}
 
 		node = dev_read_next_subnode(node);
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
