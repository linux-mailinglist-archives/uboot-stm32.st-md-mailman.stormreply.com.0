Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 815BA5652B4
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Jul 2022 12:46:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CE96C640ED;
	Mon,  4 Jul 2022 10:46:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75EF0C640EB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 10:46:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2648xC1k000388;
 Mon, 4 Jul 2022 12:46:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=oaVi03SrQgIm9+2kIiy/rJqvsvXfuAoM8/8ymWEAwBY=;
 b=z36dVajLnLReWiQruGTaaPawzwNi9QlaQf7zl9bUItkcb0hDG/IvDmVFXeWmkkzN25JB
 /ScWlNNXQ732g0okbyCQE3uh0iHd9CYpEdp4bwySfNZhY7EKw8hUAGBJBLt4E5hrSHCp
 kQyEI+gtxh49XQ77DfVlRyR01QBlTqtxzx6jVLNkMAH28rZto8rUwFBIVVHn65PZIi6T
 Ia6f4cC7jrMccqrwy/qFFcyATUtnLgQt1hGOvDlDYUntJtkOfhAUOBO6I9OJlWiS9425
 DDJ+JqUf/Dzfy6dPoChnzsIBFQbWggCBrPNDlB9Qbq+gAP7G84uv0vli2cbZeGj+0Gvo UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2b5a9wyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 12:46:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90BE710002A;
 Mon,  4 Jul 2022 12:46:16 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7440C2187FE;
 Mon,  4 Jul 2022 12:46:16 +0200 (CEST)
Received: from localhost (10.75.127.49) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 4 Jul
 2022 12:45:47 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Jul 2022 12:45:42 +0200
Message-ID: <20220704124540.1.Ic02e6fb44225d1cfe15506c7c85f70a0893fb880@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_09,2022-06-28_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] usb: hub: introduce HUB_DEBOUNCE_TIMEOUT
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

Introduce define for connection timeout, named HUB_DEBOUNCE_TIMEOUT
as in linux kernel drivers/usb/core/hub.c

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 common/usb_hub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/common/usb_hub.c b/common/usb_hub.c
index ba11a188ca6..d73638950b9 100644
--- a/common/usb_hub.c
+++ b/common/usb_hub.c
@@ -47,6 +47,8 @@
 #define HUB_SHORT_RESET_TIME	20
 #define HUB_LONG_RESET_TIME	200
 
+#define HUB_DEBOUNCE_TIMEOUT	1000
+
 #define PORT_OVERCURRENT_MAX_SCAN_COUNT		3
 
 struct usb_device_scan {
@@ -208,10 +210,10 @@ static void usb_hub_power_on(struct usb_hub_device *hub)
 	 * will be done based on this value in the USB port loop in
 	 * usb_hub_configure() later.
 	 */
-	hub->connect_timeout = hub->query_delay + 1000;
+	hub->connect_timeout = hub->query_delay + HUB_DEBOUNCE_TIMEOUT;
 	debug("devnum=%d poweron: query_delay=%d connect_timeout=%d\n",
 	      dev->devnum, max(100, (int)pgood_delay),
-	      max(100, (int)pgood_delay) + 1000);
+	      max(100, (int)pgood_delay) + HUB_DEBOUNCE_TIMEOUT);
 }
 
 #if !CONFIG_IS_ENABLED(DM_USB)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
