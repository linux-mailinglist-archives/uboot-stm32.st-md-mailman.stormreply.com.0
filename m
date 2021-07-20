Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B6C3D0145
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:10:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA052C597BF;
	Tue, 20 Jul 2021 18:10:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 742E0C597BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:10:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KI2whX013097; Tue, 20 Jul 2021 20:10:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=dXoDI5rBp7XfB90qyZVpwPmlWd4Jq+j7eRW5T9Eud/0=;
 b=CcEnq3T+uLDrCMt/G2kLMPiingKQsFW6eRWV0a5x2G/WFSGdwYdwg6M6MpJvUzQmjc3n
 jtpqMr2EPJpjCpgE5hZ55R/wuWEPKS7X10omyE1aa4l2UHI8rI24S32BOsuZpWOUMw6D
 bvYLV9d+uPRzzfSq07niXGIREI51UPkHx2clzfDes3DucS2/myK95j5fF8iueWIMG0f+
 nwbwl+sN8njMPvrjrW13iXR+EzqAGLpUDCgEqGG9f0m7GOLUL5kM74g7srdyugKe6Dk/
 f/Sjs30H9Ai9iXbeXariJoCiG5u85lURPSr4c91fQDH/leb+FtLwabSgvQyqbx2ao0Eb Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wtu2k581-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:10:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60FC1100034;
 Tue, 20 Jul 2021 20:10:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5506F2C4217;
 Tue, 20 Jul 2021 20:10:42 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul 2021 20:10:41
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Jul 2021 20:09:52 +0200
Message-ID: <20210720200940.v3.2.I523f439458f0ff2d770a2b8e8a7c8e0969e783dd@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 2/6] net: eth-phy: use dev_dbg and
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

Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v2)

Changes in v2:
- use log macro in eth-phy driver (NEW)

 drivers/net/eth-phy-uclass.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
index 7abed14392..aa5b05abc8 100644
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
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
