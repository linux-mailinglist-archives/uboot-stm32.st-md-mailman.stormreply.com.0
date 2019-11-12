Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FBBF8C5F
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 11:01:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C678C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:01:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F290C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 10:01:57 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC9vkxi025202; Tue, 12 Nov 2019 11:01:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SoomcnZExTZPiF+Yobucp0D4xCELIbREqZwkGKZrKMY=;
 b=TrjHCpzOKndWK1hnmOTRoq6Tf31fuCrq57i3LZX+IwrYrY3RbNFlIGUMH3X1LtwkWKgv
 LgpB7tZmLhaUNaEqKLDeBMWh1OdcSChdawcU2u04cMmB0lw6k+qjfpmCdlWRCzgahJp+
 KlPaYP/AIjOIQLzX7dczcEWJQE1tFLpCJwbP8f0/ZpWZINnC5auZlN8iqyWiBiDxwygi
 w3Yb3w07SR5oDk2dSkgQi7kQRBjHKSxo5C6oeS7gFw0sTTuHzIEZ1FF7xGM/1IoA15GT
 1OFSMLXsD2FDxfDa9ix4KfKQVygQ5/4N18sSsVKEM06EEgqXW9whtGFIv2hJJ8Q1knL8 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psjh90v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 11:01:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC873100039;
 Tue, 12 Nov 2019 11:01:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A059C2B1B31;
 Tue, 12 Nov 2019 11:01:50 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 11:01:50 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 11:01:42 +0100
Message-ID: <20191112100145.15940-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112100145.15940-1-patrick.delaunay@st.com>
References: <20191112100145.15940-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 4/7] usb: host: ohci: change trace level for
	phy errors managed by uclass
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
the dev_err can be change to dev_dbg.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/usb/host/ohci-generic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ohci-generic.c b/drivers/usb/host/ohci-generic.c
index 916ea0b955..e8cf26aa48 100644
--- a/drivers/usb/host/ohci-generic.c
+++ b/drivers/usb/host/ohci-generic.c
@@ -38,13 +38,13 @@ static int ohci_setup_phy(struct udevice *dev, int index)
 	} else {
 		ret = generic_phy_init(&priv->phy);
 		if (ret) {
-			dev_err(dev, "failed to init usb phy\n");
+			dev_dbg(dev, "failed to init usb phy\n");
 			return ret;
 		}
 
 		ret = generic_phy_power_on(&priv->phy);
 		if (ret) {
-			dev_err(dev, "failed to power on usb phy\n");
+			dev_dbg(dev, "failed to power on usb phy\n");
 			return generic_phy_exit(&priv->phy);
 		}
 	}
@@ -60,13 +60,13 @@ static int ohci_shutdown_phy(struct udevice *dev)
 	if (generic_phy_valid(&priv->phy)) {
 		ret = generic_phy_power_off(&priv->phy);
 		if (ret) {
-			dev_err(dev, "failed to power off usb phy\n");
+			dev_dbg(dev, "failed to power off usb phy\n");
 			return ret;
 		}
 
 		ret = generic_phy_exit(&priv->phy);
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
