Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA23CF8C5D
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 11:01:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84034C36B11
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:01:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE332C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 10:01:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC9v7NH010612; Tue, 12 Nov 2019 11:01:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=elpaBda/OUxD+HJChUvHboHBuqbk518VfBfFJnJYSIE=;
 b=mSts3quF9xaMpfedtfJ3BhHbN7ykeaMIj62spK82VkPDHYRv6xxB85JPN8Pg59psyUIG
 x+1j24FK0dn5ZzvtNktYLggBcAFxjzmtHZI986cRY9DWzrvpMv1mkh5O4NUJzGk76Rma
 65HOgtF754ELgaa07neJBBlkyDbpRhny3tNVUe4ZfcB0D/JHmVBAzl0UpAyG40tj07qh
 lVfk8muhlZv/tYmndzGVBci7MyGqySTd9TtauMFLDdLa1wRnmPNohD6dTgXLry0oyeW1
 nGjKBAEBLJX9C2PLVtqBsUo7w0CzY90/Eyfh3tEvhcB6qIpjT0NLMdnnccfHBO7DIUYr UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w7psf18n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 11:01:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AB54100040;
 Tue, 12 Nov 2019 11:01:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C76C2B1B27;
 Tue, 12 Nov 2019 11:01:52 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 11:01:51 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 11:01:44 +0100
Message-ID: <20191112100145.15940-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112100145.15940-1-patrick.delaunay@st.com>
References: <20191112100145.15940-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Cc: Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>, Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>
Subject: [Uboot-stm32] [PATCH 6/7] usb: dwc3: change trace level for phy
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

 drivers/usb/dwc3/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 23af60c98d..9342321320 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -832,8 +832,8 @@ int dwc3_setup_phy(struct udevice *dev, struct phy **array, int *num_phys)
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
@@ -841,8 +841,8 @@ int dwc3_setup_phy(struct udevice *dev, struct phy **array, int *num_phys)
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
@@ -878,8 +878,8 @@ int dwc3_shutdown_phy(struct udevice *dev, struct phy *usb_phys, int num_phys)
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
