Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 130443D0147
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:10:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CADF4C5A4C2;
	Tue, 20 Jul 2021 18:10:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB4A6C597B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:10:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KI2udg031499; Tue, 20 Jul 2021 20:10:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=at/sVnLnrAS7w9QpqfX3F0Kpl+2ev4rvwm+uQKAUS9Y=;
 b=uArm7FKgc+oSGSxFJ9FsPL+OFKER6WY/fNDPmywMEFHDzwVnX0WE+5WlArNodfAvBvn9
 /D6xiNPyhY6RNR2ls8X2M1IJXkP30q23Jb7fAQoklco6N4yNPmqk4iDEQPUonywpaX1Q
 Z0JeyJ97iam8dDVlOEnC0KsmZ8xbUC8nUrfM07gQozrO2zyPWx/ZioHfHWPOBPs9BjsQ
 ZDhesrwWPWbJJ7oijT3sY2tXSQTuMbUaeNGWJOMWNRm0DieSh5Zy/1he4pJ2+4dnH1qR
 N1hqQGDiv5NWb/KxhBwki4OzSjDe7izYwbj8rtb6gl2YcmEgexkZncbHygoTVPBbaedI Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wu03u2nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:10:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A84F100034;
 Tue, 20 Jul 2021 20:10:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FD2A2C4217;
 Tue, 20 Jul 2021 20:10:44 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul 2021 20:10:43
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Jul 2021 20:09:54 +0200
Message-ID: <20210720200940.v3.4.I98726d4bbd3145e65b872950a884cd8424b10131@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 4/6] net: dwc_eth_qos: remove the field
	phyaddr of the struct eqos_priv
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

Since the commit commit 6a895d039ba7 ("net: Update eQos driver and FEC
driver to use eth phy interfaces") the field phyaddr of driver private data
struct eqos_priv is no more used in eqos_start() for the phy_connect()
parameter.

Now this variable is only initialized in eqos_probe_resources_stm32()
it can be removed.

Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v2)

Changes in v2:
- remove unused element in the struct eqos_priv (NEW)

 drivers/net/dwc_eth_qos.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index f048e9d585..a57c35785f 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -307,7 +307,6 @@ struct eqos_priv {
 	struct clk clk_slave_bus;
 	struct mii_dev *mii;
 	struct phy_device *phy;
-	int phyaddr;
 	u32 max_speed;
 	void *descs;
 	int tx_desc_idx, rx_desc_idx;
@@ -1813,7 +1812,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	if (ret)
 		pr_warn("No phy clock provided %d", ret);
 
-	eqos->phyaddr = -1;
 	ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
 					 &phandle_args);
 	if (!ret) {
@@ -1826,9 +1824,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 		if (ret)
 			pr_warn("gpio_request_by_name(phy reset) not provided %d",
 				ret);
-
-		eqos->phyaddr = ofnode_read_u32_default(phandle_args.node,
-							"reg", -1);
 	}
 
 	debug("%s: OK\n", __func__);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
