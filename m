Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB0C36B61B
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Apr 2021 17:47:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F14ADC57B75;
	Mon, 26 Apr 2021 15:47:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3400BC32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:47:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFSalE022303; Mon, 26 Apr 2021 17:47:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=NZWUE82YV/xHV/dCB7sks31jlAbyX0zmn6kSwUQFjHE=;
 b=jJeks6FEiajIv6qsY8t12b5KarIeSluz2OryEI9WXhFHJmW/W/mBkRYrsinDv7gmB2cH
 9ts7DWHII+t99V1p9VCGaquid3KMvu6H96cq8VXUjcXnRxTKFMq1zlkmybySAHyyBhr8
 Nnn4q18+gvvddYywj2wievoXYnmtF4oUmixsP9Y/KWEARZxe0t6WSi+9tmh4ErO6gxqz
 cWtBTjZcAA/soUREwiiQl6wB0qAXTCXVqWALpY+tZoM5FCiGEzpn88Ef+Axj2rfzRLy6
 AwJUST2TJsXeFgsxr9XLSyVzhhQ90+QF/ee7B1hVQ5Xsh9ovOZcjySUx9eLXUrUcq9Od gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385b0xxjdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:47:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A04D810002A;
 Mon, 26 Apr 2021 17:47:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 953E323BD64;
 Mon, 26 Apr 2021 17:47:04 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 17:47:04
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Apr 2021 17:46:49 +0200
Message-ID: <20210426174647.v2.3.Ia198585f58eba36cd65105e2043f61d54e63ceb3@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH v2 3/6] net: eth-phy: manage subnode mdio0
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- update eth-phy driver to support STM32 binding with a mdio0 subnode (NEW)

 drivers/net/eth-phy-uclass.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
index 962084a7c9..f04f1c8f09 100644
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
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
