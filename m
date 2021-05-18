Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5D6387A2E
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:41:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1567BC58D7F;
	Tue, 18 May 2021 13:41:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A242DC58D5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:41:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDX56H023702; Tue, 18 May 2021 15:40:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Uz1yRqxuaPsuemmAGCTP+P+RnAHhd7/YAuDZMMiE3AE=;
 b=y0PJgyKCxQzO3MJK7DuH7FLUU9mZdpCMOT1eCTjM5GSpPVJzwBdHa+Rx6NuDGRvO8fRI
 TlAcOpUMstsRdr8TCa9COFFZYtVdR88oU1aqrq293frYBwkC25j1d4sl+R8cJYrKl2LY
 YC0HwGibtI9O2jRAZhjQKLnwhry56EGb1j/CRPsInMh+umXRDa5GO6RKHBwVi8+Lel4t
 TP8b3ePG6bpQlLLbs4mb5x4d1LukigEndlxkMPa5yolLu4b8vP8BIOBtfQnsVX1h7nKC
 z27/5P53RAYibpl8qHRbOUeZLaj8A83gxjt0iyD3MybKDWzoe3C3bZvXt5/RwOYBkBA7 MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunsgbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:40:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D582A10002A;
 Tue, 18 May 2021 15:40:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E237221D1BE;
 Tue, 18 May 2021 15:40:52 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:40:52
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:40:37 +0200
Message-ID: <20210518154026.1.I98c378739e65e7fed36a680a86d1c307e71c9460@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518134039.26865-1-patrick.delaunay@foss.st.com>
References: <20210518134039.26865-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: [Uboot-stm32] [PATCH 1/2] net: luton: remove address translation
	after ofnode_read_resource
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

Removed call of ofnode_translate_address() after ofnode_read_resource
in luton_switch.c:luton_probe(); it is unnecessary since
the commit feb7ac457c20 ("dm: core: Add address translation in
fdt_get_resource").

Fixes: feb7ac457c20 ("dm: core: Add address translation in fdt_get_resource")
Reported-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/net/mscc_eswitch/luton_switch.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/mscc_eswitch/luton_switch.c b/drivers/net/mscc_eswitch/luton_switch.c
index 54afa14c9d..73c950d118 100644
--- a/drivers/net/mscc_eswitch/luton_switch.c
+++ b/drivers/net/mscc_eswitch/luton_switch.c
@@ -588,7 +588,6 @@ static int luton_probe(struct udevice *dev)
 	struct luton_private *priv = dev_get_priv(dev);
 	int i, ret;
 	struct resource res;
-	fdt32_t faddr;
 	phys_addr_t addr_base;
 	unsigned long addr_size;
 	ofnode eth_node, node, mdio_node;
@@ -658,9 +657,7 @@ static int luton_probe(struct udevice *dev)
 
 		if (ofnode_read_resource(mdio_node, 0, &res))
 			return -ENOMEM;
-		faddr = cpu_to_fdt32(res.start);
-
-		addr_base = ofnode_translate_address(mdio_node, &faddr);
+		addr_base = res.start;
 		addr_size = res.end - res.start;
 
 		/* If the bus is new then create a new bus */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
