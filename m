Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AB63D0148
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:10:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4725C5A4C4;
	Tue, 20 Jul 2021 18:10:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F02E0C597BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:10:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KI2udf031499; Tue, 20 Jul 2021 20:10:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=We0pBLZ4V2u50bYIdLdCczMO4kIBtLB0y4k1v0XIjYw=;
 b=iaxKUase/L6nP2QeHQDQzZ9ZIYEnmrGXuky17RCXtNeTLYa2NHg5bVMuuS60VSQoYzSy
 LNgW6VFMZuNjBWVDJ2XMy5A/DMwTLHeGfRIta2/KYBcbmBgM/SmIspKWbl/4IEKM1jT4
 SDnqGu+VLpV6zx2wQ1PY8yiuNngdUW+a1wppkf8lQh5CR412ghjdUmd0T9oGV8VvQf8j
 R+Ptg1TxEE89qm65wnUFY85SkU95ja/LJ9IBkIsYRIwt95zuNxwhDdtuD81JdZZBiXJ0
 IUVyML9rKgB13+RTqtzr9LDhVdwbkHuXpnJfmkKiJSTAXSVNNnXXvYhIWjAyO2m29iZc pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wu03u2nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:10:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BEAB10002A;
 Tue, 20 Jul 2021 20:10:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30DF52C4217;
 Tue, 20 Jul 2021 20:10:43 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul 2021 20:10:42
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Jul 2021 20:09:53 +0200
Message-ID: <20210720200940.v3.3.Ia198585f58eba36cd65105e2043f61d54e63ceb3@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 3/6] net: eth-phy: manage subnode mdio0
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

Bind any subnode with name beginning by mdio, mdio0 for example,
and not only the "mdio" as namei of subnode.

Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v2)

Changes in v2:
- update eth-phy driver to support STM32 binding with a mdio0 subnode (NEW)

 drivers/net/eth-phy-uclass.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
index aa5b05abc8..293579dc34 100644
--- a/drivers/net/eth-phy-uclass.c
+++ b/drivers/net/eth-phy-uclass.c
@@ -27,12 +27,18 @@ int eth_phy_binds_nodes(struct udevice *eth_dev)
 	const char *node_name;
 	int ret;
 
-	mdio_node = dev_read_subnode(eth_dev, "mdio");
+	/* search a subnode named "mdio.*" */
+	dev_for_each_subnode(mdio_node, eth_dev) {
+		node_name = ofnode_get_name(mdio_node);
+		if (!strncmp(node_name, "mdio", 4))
+			break;
+	}
 	if (!ofnode_valid(mdio_node)) {
-		dev_dbg(eth_dev, "%s: %s mdio subnode not found!", __func__,
+		dev_dbg(eth_dev, "%s: %s mdio subnode not found!\n", __func__,
 			eth_dev->name);
 		return -ENXIO;
 	}
+	dev_dbg(eth_dev, "%s: %s subnode found!\n", __func__, node_name);
 
 	ofnode_for_each_subnode(phy_node, mdio_node) {
 		node_name = ofnode_get_name(phy_node);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
