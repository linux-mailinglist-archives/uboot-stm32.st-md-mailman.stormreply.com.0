Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D326816227E
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 09:38:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F416C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 08:38:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E1FCC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 08:38:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01I8bmI6005074; Tue, 18 Feb 2020 09:38:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VW5f5teZTkQ2fYkb0xcpxoR+n0FbadVfGLvepoVPfck=;
 b=Q/ejoubPiVOQTxiMzpi4xjcPcOCWzk7k9ia1LTXvbftuwRNMu2S+HOgNH7LTvXVorJff
 +HqyeZEwHrRY34y7+4QAJ9dX7tsLrHoBoZfWsgwAl2O+iLirLVSK2NSR8mkgeRr/tGFg
 vx/S7LySBeH745p17ayTpeu4EEFaHijO01slNPXMK+E1JKP9tYVRqxYXAWH14W8dE8uA
 4hqc4Z+XbUxpSCk/T9pZgzznhb4QCzb1OdDsTNwxFbdcW/+UhkYDP34Am8/pBUo3Xi/5
 hm7d4fHRs6SdNRwQkU10p1jl+SnvMlit6zt95istRs8Rl+Ped+X9QPL7bdwiNBk0qp0H xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y66ne068t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 09:38:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6322B100034;
 Tue, 18 Feb 2020 09:38:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 523D321F692;
 Tue, 18 Feb 2020 09:38:46 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 18 Feb 2020 09:38:45 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Feb 2020 09:38:34 +0100
Message-ID: <20200218083836.6369-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218083836.6369-1-patrick.delaunay@st.com>
References: <20200218083836.6369-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_01:2020-02-17,
 2020-02-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>
Subject: [Uboot-stm32] [PATCH v2 6/8] usb: dwc3: change trace level for phy
	errors managed by uclass
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

As the error message is now displayed by generic phy functions,
the pr_err can be change to pr_debug.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 drivers/usb/dwc3/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c5066529b7..6304036c00 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -867,8 +867,8 @@ int dwc3_setup_phy(struct udevice *dev, struct phy **array, int *num_phys)
 	for (i = 0; i < count; i++) {
 		ret = generic_phy_init(&usb_phys[i]);
 		if (ret) {
-			pr_err("Can't init USB PHY%d for %s\n",
-			       i, dev->name);
+			pr_debug("Can't init USB PHY%d for %s\n",
+				 i, dev->name);
 			goto phys_init_err;
 		}
 	}
@@ -876,8 +876,8 @@ int dwc3_setup_phy(struct udevice *dev, struct phy **array, int *num_phys)
 	for (i = 0; i < count; i++) {
 		ret = generic_phy_power_on(&usb_phys[i]);
 		if (ret) {
-			pr_err("Can't power USB PHY%d for %s\n",
-			       i, dev->name);
+			pr_debug("Can't power USB PHY%d for %s\n",
+				 i, dev->name);
 			goto phys_poweron_err;
 		}
 	}
@@ -913,8 +913,8 @@ int dwc3_shutdown_phy(struct udevice *dev, struct phy *usb_phys, int num_phys)
 		ret = generic_phy_power_off(&usb_phys[i]);
 		ret |= generic_phy_exit(&usb_phys[i]);
 		if (ret) {
-			pr_err("Can't shutdown USB PHY%d for %s\n",
-			       i, dev->name);
+			pr_debug("Can't shutdown USB PHY%d for %s\n",
+				 i, dev->name);
 		}
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
