Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE92816227F
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 09:39:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9BDDC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 08:39:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06A00C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 08:39:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01I8cXSf007897; Tue, 18 Feb 2020 09:38:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Za1B2jED2KDuXB44K96WSUefLgyvZoeR0hqUAUriG0k=;
 b=B2JrY27ynF6as+SkbyKdDEGOC04usZaY4voEYXgy2MQs45UxogWV4PxcO+bvZWf9W7Xf
 1H0wWxNr+fW1EuDJyflVo7uLKC8MoDPtb0POqWF4XaP+pcaLkVHOrkyGllTQQY1/Mhaj
 2EnQTqnuwGZXcK1yem57N1S6e3xzw/AWixMDynJLVIAXPsZCVwTU5oPSPa/Ar3/Ri7ww
 dTtErwY9HVpOYM757DzBoZUSX+eruPgjiKE8i6H7aCAQhK6Kr8lQLid60YOAUjN7qXbI
 6jQJvYxIBroZjcrqhzP4zjS9b/0wrSS6kN+o9tDOKWYS9E/A4TIIT+QBcPg8eA5wWerQ Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y68dp7un7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 09:38:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD736100040;
 Tue, 18 Feb 2020 09:38:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B315C21F692;
 Tue, 18 Feb 2020 09:38:47 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 18 Feb 2020 09:38:47 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Feb 2020 09:38:36 +0100
Message-ID: <20200218083836.6369-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218083836.6369-1-patrick.delaunay@st.com>
References: <20200218083836.6369-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_01:2020-02-17,
 2020-02-18 signatures=0
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [Uboot-stm32] [PATCH v2 8/8] usb: musb-new: sunxi: change trace
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

Changes in v2:
- Added patch after rebase: new generic_phy API usage

 drivers/usb/musb-new/sunxi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb-new/sunxi.c b/drivers/usb/musb-new/sunxi.c
index 98bf736978..8da61f818e 100644
--- a/drivers/usb/musb-new/sunxi.c
+++ b/drivers/usb/musb-new/sunxi.c
@@ -254,7 +254,7 @@ static int sunxi_musb_enable(struct musb *musb)
 
 		ret = generic_phy_power_on(&glue->phy);
 		if (ret) {
-			pr_err("failed to power on USB PHY\n");
+			pr_debug("failed to power on USB PHY\n");
 			return ret;
 		}
 	}
@@ -278,7 +278,7 @@ static void sunxi_musb_disable(struct musb *musb)
 	if (is_host_enabled(musb)) {
 		ret = generic_phy_power_off(&glue->phy);
 		if (ret) {
-			pr_err("failed to power off USB PHY\n");
+			pr_debug("failed to power off USB PHY\n");
 			return;
 		}
 	}
@@ -312,7 +312,7 @@ static int sunxi_musb_init(struct musb *musb)
 
 	ret = generic_phy_init(&glue->phy);
 	if (ret) {
-		dev_err(dev, "failed to init USB PHY\n");
+		dev_dbg(dev, "failed to init USB PHY\n");
 		goto err_rst;
 	}
 
@@ -349,7 +349,7 @@ static int sunxi_musb_exit(struct musb *musb)
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
