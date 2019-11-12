Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D6F8C5B
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 11:01:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0ACCC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:01:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F244FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 10:01:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC9v7NE010612; Tue, 12 Nov 2019 11:01:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bnEe7pR8WtLd1C5Y5sMTJacAOHBNow9b2YddTMTvW8s=;
 b=OQBZFRoHOaFqgcYLIsRc2w+5u2dOrMsuoksmbcgdPFvvTfEpYRMekgjXCYXn2azpyHKa
 bsFvYNVP3P1SkyqnBh+k07uWBvcoVJu6zjbJrcf9Fn6CbEVLJHiu49FXo6vJDsuB53xR
 8FZKxKCPWVw0mHKBNO4wYrdN0LTaanNdGbPTZgwUT54NIDj4MqTkvrx7PCh/APiNqNcn
 GOg7tuIv4Mcq9cOr0NNS5Ce3hAVa95CkHPC9Qlj3F2zWh6ZxaT7t8uig+aCJ2ZFyRlD6
 QcZscBe5TdWUdyz+O76ba1M6Bmi670PnY43SzxPgBnJ+Nfc+ouvnZFjOpqC6M7qSvnLn eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w7psf18n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 11:01:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AB4F10003A;
 Tue, 12 Nov 2019 11:01:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60E812B1B27;
 Tue, 12 Nov 2019 11:01:51 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 11:01:50 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 11:01:43 +0100
Message-ID: <20191112100145.15940-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112100145.15940-1-patrick.delaunay@st.com>
References: <20191112100145.15940-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 5/7] usb: host: ehci-hcd: change trace level
	for phy errors managed by uclass
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

 drivers/usb/host/ehci-hcd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 85918e85be..0f5a8ada31 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1697,13 +1697,13 @@ int ehci_setup_phy(struct udevice *dev, struct phy *phy, int index)
 	} else {
 		ret = generic_phy_init(phy);
 		if (ret) {
-			dev_err(dev, "failed to init usb phy\n");
+			dev_dbg(dev, "failed to init usb phy\n");
 			return ret;
 		}
 
 		ret = generic_phy_power_on(phy);
 		if (ret) {
-			dev_err(dev, "failed to power on usb phy\n");
+			dev_dbg(dev, "failed to power on usb phy\n");
 			return generic_phy_exit(phy);
 		}
 	}
@@ -1721,13 +1721,13 @@ int ehci_shutdown_phy(struct udevice *dev, struct phy *phy)
 	if (generic_phy_valid(phy)) {
 		ret = generic_phy_power_off(phy);
 		if (ret) {
-			dev_err(dev, "failed to power off usb phy\n");
+			dev_dbg(dev, "failed to power off usb phy\n");
 			return ret;
 		}
 
 		ret = generic_phy_exit(phy);
 		if (ret) {
-			dev_err(dev, "failed to power off usb phy\n");
+			dev_dbg(dev, "failed to power off usb phy\n");
 			return ret;
 		}
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
