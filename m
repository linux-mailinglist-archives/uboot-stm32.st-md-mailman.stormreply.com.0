Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 642F12631EB
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 18:30:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8736C3FAE1
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 16:30:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBC28C36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 16:30:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089GLcvx031620; Wed, 9 Sep 2020 18:30:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=f7o3fctQCsaE3Azf190zraljEU1BqWASRXVLjkubKu4=;
 b=ZIgCGIYhYJOn7pvvW7HIgvLbRyYM7mUgymgP0uYJi4nWiYmmOyYzYVbjwNqAbFxEReJ9
 xB2FFdyDOTQrJw5cGOoZF4hKJ09uNjZ17mysdLu+6b/mfpqJUzcaEUYuqGLYkJTkg0rQ
 trWodJNh31/Uo1AqDgvQ9U1Y4Ny1Gaxh46XqCkTQAKzjq9kQnc4jwN+cyJtOz0RY5tK4
 KkfZ+YgVazyTlKprQhFCYTluZwrizJ05Wso2SWNm9GF6qZzPNmz6GJOttq3f5CytLg25
 XJ1UHmz7w7jJsDQD2F/ElQP4adsUU3feZxYvuPncJUXEw6SwmE6m4QrWuWI/JyTEovrP zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33byt7xskn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 18:30:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17D0110002A;
 Wed,  9 Sep 2020 18:30:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 093652C38A9;
 Wed,  9 Sep 2020 18:30:15 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 18:30:14 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 18:30:06 +0200
Message-ID: <20200909163006.32153-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_12:2020-09-09,
 2020-09-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] net: dwc_eth_qos: Convert to use APIs which
	support live DT
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

Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
driver can support live DT.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/net/dwc_eth_qos.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 810a2b95b1..db1102562f 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -26,6 +26,7 @@
  *    supports a single RGMII PHY. This configuration also has SW control over
  *    all clock and reset signals to the HW block.
  */
+
 #include <common.h>
 #include <clk.h>
 #include <cpu_func.h>
@@ -1893,8 +1894,7 @@ static phy_interface_t eqos_get_interface_stm32(struct udevice *dev)
 
 	debug("%s(dev=%p):\n", __func__, dev);
 
-	phy_mode = fdt_getprop(gd->fdt_blob, dev_of_offset(dev), "phy-mode",
-			       NULL);
+	phy_mode = dev_read_prop(dev, "phy-mode", NULL);
 	if (phy_mode)
 		interface = phy_get_interface_by_name(phy_mode);
 
@@ -1931,8 +1931,7 @@ static phy_interface_t eqos_get_interface_imx(struct udevice *dev)
 
 	debug("%s(dev=%p):\n", __func__, dev);
 
-	phy_mode = fdt_getprop(gd->fdt_blob, dev_of_offset(dev), "phy-mode",
-			       NULL);
+	phy_mode = dev_read_prop(dev, "phy-mode", NULL);
 	if (phy_mode)
 		interface = phy_get_interface_by_name(phy_mode);
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
