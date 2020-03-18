Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEDB18987C
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:50:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB305C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:50:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D75BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:50:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9mJoI002398; Wed, 18 Mar 2020 10:50:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DEqUfEdeZGwPz6IdXCa1DkEJBGGJeAtUedvM6RYVbMs=;
 b=t4A78QVDJE/uUSoL4gqy+0JOg5OeKw+IB7reKPquT3Jcqc/yfTgXlvmGfXUHLCrkzfpw
 RhWd76ZyteGs+pIPo/o0SsHNyox1u1MhA8BBP/dw18lwG5bxOfwLFy18bXP1xZQZaUfO
 IEhzyu3JL7Rl6kFSQMd8OEi/dLMwe7hbwbPtVp0ROr4rkgwtYPeuAaMDP7cS4lni3Mff
 OhFPKULw1MCJ5uvopl7f8FNorVCj6lfV0i+AHOhsQBI9EtzpUBaNXXMcWbLD9IbJIVIj
 /uuGLKk1fV1DYIxZVmnX2qthO9sqDyds/Qg5jYVf15nfyr8dCZ5J23jydC0A1V8emFp/ RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95ujkuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:50:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8DB99100038;
 Wed, 18 Mar 2020 10:50:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 835F421FEB7;
 Wed, 18 Mar 2020 10:50:22 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 10:50:21 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 10:50:16 +0100
Message-ID: <20200318095016.19942-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318095016.19942-1-patrick.delaunay@st.com>
References: <20200318095016.19942-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] net: dwc_eth_qos: implement phy reg and
	max-speed for stm32
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

Add management of property "reg" to configure @ of phy and
also "max-speed" property to specify maximum speed in Mbit/s
supported by the device

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/net/dwc_eth_qos.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 4796659216..63f2086dec 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -306,6 +306,8 @@ struct eqos_priv {
 	struct clk clk_slave_bus;
 	struct mii_dev *mii;
 	struct phy_device *phy;
+	int phyaddr;
+	u32 max_speed;
 	void *descs;
 	struct eqos_desc *tx_descs;
 	struct eqos_desc *rx_descs;
@@ -1081,12 +1083,21 @@ static int eqos_start(struct udevice *dev)
 	 * don't need to reconnect/reconfigure again
 	 */
 	if (!eqos->phy) {
-		eqos->phy = phy_connect(eqos->mii, -1, dev,
+		eqos->phy = phy_connect(eqos->mii, eqos->phyaddr, dev,
 					eqos->config->interface(dev));
 		if (!eqos->phy) {
 			pr_err("phy_connect() failed");
 			goto err_stop_resets;
 		}
+
+		if (eqos->max_speed) {
+			ret = phy_set_supported(eqos->phy, eqos->max_speed);
+			if (ret) {
+				pr_err("phy_set_supported() failed: %d", ret);
+				goto err_shutdown_phy;
+			}
+		}
+
 		ret = phy_config(eqos->phy);
 		if (ret < 0) {
 			pr_err("phy_config() failed: %d", ret);
@@ -1654,6 +1665,8 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	if (ret)
 		return -EINVAL;
 
+	eqos->max_speed = dev_read_u32_default(dev, "max-speed", 0);
+
 	ret = clk_get_by_name(dev, "stmmaceth", &eqos->clk_master_bus);
 	if (ret) {
 		pr_err("clk_get_by_name(master_bus) failed: %d", ret);
@@ -1677,6 +1690,7 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	if (ret)
 		pr_warn("No phy clock provided %d", ret);
 
+	eqos->phyaddr = -1;
 	ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
 					 &phandle_args);
 	if (!ret) {
@@ -1689,6 +1703,9 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 		if (ret)
 			pr_warn("gpio_request_by_name(phy reset) not provided %d",
 				ret);
+
+		eqos->phyaddr = ofnode_read_u32_default(phandle_args.node,
+							"reg", -1);
 	}
 
 	debug("%s: OK\n", __func__);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
