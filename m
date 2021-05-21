Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7448338C496
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 May 2021 12:25:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C6EDC57B60;
	Fri, 21 May 2021 10:25:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86884C57B5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 May 2021 10:25:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LANGON010040; Fri, 21 May 2021 12:25:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=XYGaIFoA5NmqpCK2NPN9MAiJHTIvU1aECfXtcA7qVd4=;
 b=bP9ge8rBUjX50hRmuRHWzrHa+Z/ce+lLX5TmqGPoyWZ4aV1AhrHmzgKGGohL48YVemuX
 KJiRwbZQx9bMMVtlQHMdSrZv93+kmNvSBvF58Ifye3b3lcvkfzFq1eUc09s7vhhGY/HK
 dwFYhVKDWCJoRnvyi9puAMK6m8//eOp8D/DiWUUXDaqaZVWjreeQ1032D1OOgJk1bhCm
 IwldDGBvQkz53nvEwjKYhfxMJSSgv8stOjcKK1zDKhnODolZL7BKcOKT89b+nuQ44aIW
 0HB0iCApF+rM46uitFCD5r14Tun0TASXo/lqaarGI5ZM7hCDSvVS38cBxspo62aAOrEp Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38p2tc2hem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 12:25:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 919FB100034;
 Fri, 21 May 2021 12:25:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8254C21B534;
 Fri, 21 May 2021 12:25:07 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May 2021 12:25:07
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 May 2021 12:24:59 +0200
Message-ID: <20210521122438.v2.1.I98c378739e65e7fed36a680a86d1c307e71c9460@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521102500.12981-1-patrick.delaunay@foss.st.com>
References: <20210521102500.12981-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: [Uboot-stm32] [PATCH v2 1/2] net: luton: remove address translation
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
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
Reported-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- Add reviewed-by

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
