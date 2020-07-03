Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF9B213CB3
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 17:37:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 878C9C36B24
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 15:37:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6D71C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 15:37:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063FXBrB029381; Fri, 3 Jul 2020 17:37:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ja7rE3RoapWRAFgpzv+0C7zh4Jl07JZI33LdzfXy/8Y=;
 b=cUYlWUUsAHC1Bz/7I3zJHrJfbf1Qj7Jb/yaxUF0g7qUjdIvSRVMpEnUZNQnbDz2vFz5p
 M5K+H6OF3tQKNY27xRoQlRIkPrzISSRAiJU8Frp+mpQn2BT4mDQ7pS20fx8Kap7RCz0O
 9HU7drXmKq58cAlZ4Gavq/dZ6m7s/7mVVuvND2i4Zq/o4frIgpN5M/bp3Wcdt1faOMbJ
 wURw+UmIxsu4EPK8Wq8pbHNcrnfVaHDHVPvMgxBMPrZIHRCIJNctQ4OsUTOQZZ3QS/PI
 wxvrj5rKpBXxmY5D07ypxbGlj4D5bmYNjMrsGrNi0EBZAAp51bD6Fn93d9A9enxzrEZe MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gqjb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 17:37:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBD9A10002A;
 Fri,  3 Jul 2020 17:37:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B259C2AA26A;
 Fri,  3 Jul 2020 17:37:03 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Jul 2020 17:37:03 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Jul 2020 17:36:45 +0200
Message-ID: <20200703153646.28533-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703153646.28533-1-patrick.delaunay@st.com>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_10:2020-07-02,
 2020-07-03 signatures=0
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [Uboot-stm32] [PATCH v3 6/7] usb: musb-new: sunxi: change trace
	level for phy errors managed by uclass
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
the dev_err/pr_err can be change to dev_dbg/pr_debug.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v2)

Changes in v2:
- Added patch after rebase: new generic_phy API usage

 drivers/usb/musb-new/sunxi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb-new/sunxi.c b/drivers/usb/musb-new/sunxi.c
index 53c336fc3f..06a55bf6ee 100644
--- a/drivers/usb/musb-new/sunxi.c
+++ b/drivers/usb/musb-new/sunxi.c
@@ -257,7 +257,7 @@ static int sunxi_musb_enable(struct musb *musb)
 
 		ret = generic_phy_power_on(&glue->phy);
 		if (ret) {
-			pr_err("failed to power on USB PHY\n");
+			pr_debug("failed to power on USB PHY\n");
 			return ret;
 		}
 	}
@@ -281,7 +281,7 @@ static void sunxi_musb_disable(struct musb *musb)
 	if (is_host_enabled(musb)) {
 		ret = generic_phy_power_off(&glue->phy);
 		if (ret) {
-			pr_err("failed to power off USB PHY\n");
+			pr_debug("failed to power off USB PHY\n");
 			return;
 		}
 	}
@@ -315,7 +315,7 @@ static int sunxi_musb_init(struct musb *musb)
 
 	ret = generic_phy_init(&glue->phy);
 	if (ret) {
-		dev_err(dev, "failed to init USB PHY\n");
+		dev_dbg(dev, "failed to init USB PHY\n");
 		goto err_rst;
 	}
 
@@ -352,7 +352,7 @@ static int sunxi_musb_exit(struct musb *musb)
 	if (generic_phy_valid(&glue->phy)) {
 		ret = generic_phy_exit(&glue->phy);
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
