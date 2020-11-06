Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AA62A9B7B
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E936C3FAFE;
	Fri,  6 Nov 2020 18:02:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC853C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HvXo7007329; Fri, 6 Nov 2020 19:02:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TIpHOd4GoP/c5inqM4a/BDzgClpm9Vdz6eXB44aNY7g=;
 b=WpYSO22tVpqpUB0gzICF2IMPPLqmpSNUMu27I1lGA+pB2+3DHaZOMjx84is30T9gaoUm
 N84NSmcHd8XUgjSTYOSTI0GfLXh9RVguIf9aZofZUti1aoGngl8CTKHvAwOUgl2ETatt
 5ng5vQYZwTW3ldzGDZGwIUaz9n+Bg5L6/8UAKoL698zxSTVwKl+lBFd/VY22Umkt9kS7
 oFzxZLVtPvETdZT2Siy/w5UyMG8/DwOsSeDbGH+Ho4CCvB9F62EUiAz4rNaM7ljtn5T5
 l90988Pfp/Eyi9D5bYtXLRN2DsztdaCWjDwDllpOJC76eDPtzNkRr0ejWveQeCavRg5J jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h0328ry7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 271C710002A;
 Fri,  6 Nov 2020 19:02:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F73025079D;
 Fri,  6 Nov 2020 19:02:44 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:43
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:51 +0100
Message-ID: <20201106180201.31784-24-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 23/33] phy: stm32-usbphyc: migrate trace to
	dev and log macro
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

Change pr_debug to log_debug or dev_dbg macro and define LOG_CATEGORY.

Remove the "%s:" __func__  header as it is managed by dev macro
(dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/phy/phy-stm32-usbphyc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
index 9d4296d649..2b69514b3a 100644
--- a/drivers/phy/phy-stm32-usbphyc.c
+++ b/drivers/phy/phy-stm32-usbphyc.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_PHY
+
 #include <common.h>
 #include <clk.h>
 #include <div64.h>
@@ -97,8 +99,8 @@ static int stm32_usbphyc_pll_init(struct stm32_usbphyc *usbphyc)
 	u32 usbphyc_pll;
 
 	if ((clk_rate < PLL_INFF_MIN_RATE) || (clk_rate > PLL_INFF_MAX_RATE)) {
-		pr_debug("%s: input clk freq (%dHz) out of range\n",
-			 __func__, clk_rate);
+		log_debug("input clk freq (%dHz) out of range\n",
+			  clk_rate);
 		return -EINVAL;
 	}
 
@@ -115,8 +117,8 @@ static int stm32_usbphyc_pll_init(struct stm32_usbphyc *usbphyc)
 
 	writel(usbphyc_pll, usbphyc->base + STM32_USBPHYC_PLL);
 
-	pr_debug("%s: input clk freq=%dHz, ndiv=%d, frac=%d\n", __func__,
-		 clk_rate, pll_params.ndiv, pll_params.frac);
+	log_debug("input clk freq=%dHz, ndiv=%d, frac=%d\n",
+		  clk_rate, pll_params.ndiv, pll_params.frac);
 
 	return 0;
 }
@@ -153,7 +155,7 @@ static int stm32_usbphyc_phy_init(struct phy *phy)
 		     true : false;
 	int ret;
 
-	pr_debug("%s phy ID = %lu\n", __func__, phy->id);
+	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
 	/* Check if one phy port has already configured the pll */
 	if (pllen && stm32_usbphyc_is_init(usbphyc))
 		goto initialized;
@@ -199,7 +201,7 @@ static int stm32_usbphyc_phy_exit(struct phy *phy)
 	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
 	int ret;
 
-	pr_debug("%s phy ID = %lu\n", __func__, phy->id);
+	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
 	usbphyc_phy->init = false;
 
 	/* Check if other phy port requires pllen */
@@ -238,7 +240,7 @@ static int stm32_usbphyc_phy_power_on(struct phy *phy)
 	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
 	int ret;
 
-	pr_debug("%s phy ID = %lu\n", __func__, phy->id);
+	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
 	if (usbphyc_phy->vdd) {
 		ret = regulator_set_enable(usbphyc_phy->vdd, true);
 		if (ret)
@@ -256,7 +258,7 @@ static int stm32_usbphyc_phy_power_off(struct phy *phy)
 	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
 	int ret;
 
-	pr_debug("%s phy ID = %lu\n", __func__, phy->id);
+	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
 	usbphyc_phy->powered = false;
 
 	if (stm32_usbphyc_is_powered(usbphyc))
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
