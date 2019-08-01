Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3997D89B
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Aug 2019 11:32:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3080C35E02
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Aug 2019 09:32:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03CCBC35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2019 09:32:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x719UXna005452; Thu, 1 Aug 2019 11:32:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=q/yVvWeMNCPQ6MGE2DKGV4jcqJnsrWhx1c+Di/2hnU4=;
 b=qdmuGw1tu8E19pV/d1sTa0r5i4OKr9nzBRIXygZ5nY4qSCBK2+QsZK7CUVnkWW1wlmGf
 Dd4YmMPfPQbHd8mxpSQ1Hd25/fOS9aH/VAXjMTTyQNHcEw7NMxwAlfNK5zgSVDlrW6d+
 ig7VlVchA0CycKFK8vOLxXEhu3O5/zt4N/yzu9SBkLQp+wZpXeRZfkmhhLzu34v4BqRt
 vXCBM3D4VL0OAz0eDuwf9A4xksbGiNi7hBRt7Tk7BVKK3sSC00k/VpOlTpKc/WU6a7RD
 X8KeeitXjvkMPcBUz2VylJ3twRTplQJDj3YzjzLDH3+I1Z6/FPeHfokmfqQRETAxOO+4 XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4mha4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 01 Aug 2019 11:32:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08F89102;
 Thu,  1 Aug 2019 09:29:16 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3793EA4C6;
 Thu,  1 Aug 2019 11:29:16 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019
 11:29:16 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019 11:29:16
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 1 Aug 2019 11:29:03 +0200
Message-ID: <1564651743-28430-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564651743-28430-1-git-send-email-patrick.delaunay@st.com>
References: <1564651743-28430-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_06:, , signatures=0
Cc: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 2/2] net: dwc_et_qos: update weak function
	board_interface_eth_init
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

Align the board and driver prototype for board_interface_eth_init
to avoid execution issue (the interface_type parameter is defined
as int or phy_interface_t).

To have a generic weak function (it should be reused by other driver)
I change the prototype to use directly udevice.

This prototype is added in netdev.h to allow compilation check
and avoid warning when compiling with W=1 on file
board/st/stm32mp1/stm32mp1.c

warning: no previous prototype for 'board_interface_eth_init'\
[-Wmissing-prototypes]
     int board_interface_eth_init(int interface_type, ....
         ^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 17 +++++++++++++----
 drivers/net/dwc_eth_qos.c    | 16 +++-------------
 include/netdev.h             |  3 +++
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index b99c6c0..2365dd1 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -16,6 +16,7 @@
 #include <misc.h>
 #include <mtd.h>
 #include <mtd_node.h>
+#include <netdev.h>
 #include <phy.h>
 #include <reset.h>
 #include <syscon.h>
@@ -560,13 +561,21 @@ void board_quiesce_devices(void)
 	setup_led(LEDST_OFF);
 }
 
-/* board interface eth init */
-/* this is a weak define that we are overriding */
-int board_interface_eth_init(phy_interface_t interface_type,
-			     bool eth_clk_sel_reg, bool eth_ref_clk_sel_reg)
+/* eth init function : weak called in eqos driver */
+int board_interface_eth_init(struct udevice *dev,
+			     phy_interface_t interface_type)
 {
 	u8 *syscfg;
 	u32 value;
+	bool eth_clk_sel_reg = false;
+	bool eth_ref_clk_sel_reg = false;
+
+	/* Gigabit Ethernet 125MHz clock selection. */
+	eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
+
+	/* Ethernet 50Mhz RMII clock selection */
+	eth_ref_clk_sel_reg =
+		dev_read_bool(dev, "st,eth_ref_clk_sel");
 
 	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
 
diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 6df9956..4557093 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -1591,8 +1591,8 @@ err_free_reset_eqos:
 }
 
 /* board-specific Ethernet Interface initializations. */
-__weak int board_interface_eth_init(int interface_type, bool eth_clk_sel_reg,
-				    bool eth_ref_clk_sel_reg)
+__weak int board_interface_eth_init(struct udevice *dev,
+				    phy_interface_t interface_type)
 {
 	return 0;
 }
@@ -1602,8 +1602,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	int ret;
 	phy_interface_t interface;
-	bool eth_clk_sel_reg = false;
-	bool eth_ref_clk_sel_reg = false;
 
 	debug("%s(dev=%p):\n", __func__, dev);
 
@@ -1614,15 +1612,7 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 		return -EINVAL;
 	}
 
-	/* Gigabit Ethernet 125MHz clock selection. */
-	eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
-
-	/* Ethernet 50Mhz RMII clock selection */
-	eth_ref_clk_sel_reg =
-		dev_read_bool(dev, "st,eth_ref_clk_sel");
-
-	ret = board_interface_eth_init(interface, eth_clk_sel_reg,
-				       eth_ref_clk_sel_reg);
+	ret = board_interface_eth_init(dev, interface);
 	if (ret)
 		return -EINVAL;
 
diff --git a/include/netdev.h b/include/netdev.h
index a40c4ad..68a3fce 100644
--- a/include/netdev.h
+++ b/include/netdev.h
@@ -10,6 +10,7 @@
 
 #ifndef _NETDEV_H_
 #define _NETDEV_H_
+#include <phy_interface.h>
 
 /*
  * Board and CPU-specific initialization functions
@@ -21,6 +22,8 @@
  */
 
 int board_eth_init(bd_t *bis);
+int board_interface_eth_init(struct udevice *dev,
+			     phy_interface_t interface_type);
 int cpu_eth_init(bd_t *bis);
 
 /* Driver initialization prototypes */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
