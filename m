Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F736B61A
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Apr 2021 17:47:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58FFEC57B51;
	Mon, 26 Apr 2021 15:47:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07F30C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:47:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFQOPa032366; Mon, 26 Apr 2021 17:47:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5Z6pqkK7Xm2ud+sSvv//QrPVLJVNPbPMBTKR+XhzQmc=;
 b=O7lHvpC+ttezuEkFxlUi6dun/DpvPdJDSaoEWEyNQPaKaTCNfazR6+t2LGSNtSijZOrF
 r50W/BfzxMH6L7nyd+wPeoLImb2FHZXi5JWXqHUtxZUIBZgMNqFFh/LAJDz45dvFHsPW
 4SrKMitc+0gfkskM4vjO+K2Px9zt0umCUAAZOSmM1A6fF/EObs1ZrafkAVehc863v2ip
 eCB5KJEWGP1byNTq1VNclaTKDbj0YHLamDG2/G6geibFFE3zgPiXRDZa1AaYkrx8T6BC
 y4MtvElcyJIjh9Jv4yS4/FUWugqn9qxhxTzUJm8zQlWKQlSNaRk36P6DM3J2XG2yHliz eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385gb2dj64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:47:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C54D710002A;
 Mon, 26 Apr 2021 17:47:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8AA523BD64;
 Mon, 26 Apr 2021 17:47:03 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 17:47:03
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Apr 2021 17:46:48 +0200
Message-ID: <20210426174647.v2.2.I523f439458f0ff2d770a2b8e8a7c8e0969e783dd@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/6] net: eth-phy: use dev_dbg and
	log_notice
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

Replace debug trace and printf to log macros:
- debug() replaced by dev_dbg() when device is available, this macro
indicate the device name since commit ceb70bb870ac ("dm: Print device
name in dev_xxx like Linux")
- printf() replaced by log_notice() to allow  dispatch to log backends.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- use log macro in eth-phy driver (NEW)

 drivers/net/eth-phy-uclass.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
index 153f6909eb..962084a7c9 100644
--- a/drivers/net/eth-phy-uclass.c
+++ b/drivers/net/eth-phy-uclass.c
@@ -5,8 +5,10 @@
 
 #include <common.h>
 #include <dm.h>
+#include <log.h>
 #include <net.h>
 #include <asm-generic/gpio.h>
+#include <dm/device_compat.h>
 #include <dm/device-internal.h>
 #include <dm/uclass-internal.h>
 #include <dm/lists.h>
@@ -27,25 +29,25 @@ int eth_phy_binds_nodes(struct udevice *eth_dev)
 
 	mdio_node = dev_read_subnode(eth_dev, "mdio");
 	if (!ofnode_valid(mdio_node)) {
-		debug("%s: %s mdio subnode not found!", __func__,
-		      eth_dev->name);
+		dev_dbg(eth_dev, "%s: %s mdio subnode not found!", __func__,
+			eth_dev->name);
 		return -ENXIO;
 	}
 
 	ofnode_for_each_subnode(phy_node, mdio_node) {
 		node_name = ofnode_get_name(phy_node);
 
-		debug("* Found child node: '%s'\n", node_name);
+		dev_dbg(eth_dev, "* Found child node: '%s'\n", node_name);
 
 		ret = device_bind_driver_to_node(eth_dev,
 						 "eth_phy_generic_drv",
 						 node_name, phy_node, NULL);
 		if (ret) {
-			debug("  - Eth phy binding error: %d\n", ret);
+			dev_dbg(eth_dev, "  - Eth phy binding error: %d\n", ret);
 			continue;
 		}
 
-		debug("  - bound phy device: '%s'\n", node_name);
+		dev_dbg(eth_dev, "  - bound phy device: '%s'\n", node_name);
 	}
 
 	return 0;
@@ -86,14 +88,14 @@ struct mii_dev *eth_phy_get_mdio_bus(struct udevice *eth_dev)
 			 */
 			uc_priv = (struct eth_phy_device_priv *)(dev_get_uclass_priv(phy_dev));
 			if (uc_priv->mdio_bus)
-				printf("Get shared mii bus on %s\n", eth_dev->name);
+				log_notice("Get shared mii bus on %s\n", eth_dev->name);
 			else
-				printf("Can't get shared mii bus on %s\n", eth_dev->name);
+				log_notice("Can't get shared mii bus on %s\n", eth_dev->name);
 
 			return uc_priv->mdio_bus;
 		}
 	} else {
-		printf("FEC: can't find phy-handle\n");
+		log_notice("FEC: can't find phy-handle\n");
 	}
 
 	return NULL;
@@ -106,7 +108,7 @@ int eth_phy_get_addr(struct udevice *dev)
 
 	if (dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
 				       &phandle_args)) {
-		debug("Failed to find phy-handle");
+		dev_dbg(dev, "Failed to find phy-handle");
 		return -ENODEV;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
