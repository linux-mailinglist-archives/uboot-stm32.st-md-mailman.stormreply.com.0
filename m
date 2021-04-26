Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5320036B61C
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Apr 2021 17:47:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07EEBC58D5A;
	Mon, 26 Apr 2021 15:47:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2B7CC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:47:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFSIQG022198; Mon, 26 Apr 2021 17:47:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=1pk9m1q/+QjUv4YKJIYBCSbzAHEr97f2uzSVQBJ5a/0=;
 b=bJnwCmWgHrj57qtOpMd2A/q82quthoDqoJACAhc0nFbiQ9lPLbOsSIC7OpLFlx1gZ+M8
 w555ptYbHdNlsjjXz35mAKl95EA+lhlZnwBW4d8T7afYCYQqoRzOf7UqZGS1yKzZEB0H
 LbL6AQPMLiJiJAnvpJv+u4u4+SfsBvRHFvA/EO0FFiEjObrcDf6ZR5RTxmKlfBkSW0Xo
 75feyk9GgJ9syL50ADbTthZWrSN1BQTte29ZtUeCpPUCvrzF6fWHm/+dCzncZrcfrXSz
 /eOSdntgAsbbpW9awnSw1cTaKhnYHVv+sjksPcd3u8Z9umiwI31zSf7k3p6EWmROadwB qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385b0xxjdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:47:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7556E100034;
 Mon, 26 Apr 2021 17:47:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6969423FE75;
 Mon, 26 Apr 2021 17:47:05 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 17:47:05
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Apr 2021 17:46:50 +0200
Message-ID: <20210426174647.v2.4.I98726d4bbd3145e65b872950a884cd8424b10131@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
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
Subject: [Uboot-stm32] [PATCH v2 4/6] net: dwc_eth_qos: remove the field
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- remove unused element in the struct eqos_priv (NEW)

 drivers/net/dwc_eth_qos.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index e8242ca4e1..e625aea8d1 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -311,7 +311,6 @@ struct eqos_priv {
 	struct clk clk_slave_bus;
 	struct mii_dev *mii;
 	struct phy_device *phy;
-	int phyaddr;
 	u32 max_speed;
 	void *descs;
 	int tx_desc_idx, rx_desc_idx;
@@ -1826,7 +1825,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	if (ret)
 		pr_warn("No phy clock provided %d", ret);
 
-	eqos->phyaddr = -1;
 	ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
 					 &phandle_args);
 	if (!ret) {
@@ -1839,9 +1837,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 		if (ret)
 			pr_warn("gpio_request_by_name(phy reset) not provided %d",
 				ret);
-
-		eqos->phyaddr = ofnode_read_u32_default(phandle_args.node,
-							"reg", -1);
 	}
 
 	debug("%s: OK\n", __func__);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
