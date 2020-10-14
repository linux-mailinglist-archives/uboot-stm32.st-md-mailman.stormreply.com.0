Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A333428DCA6
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B872C424C3;
	Wed, 14 Oct 2020 09:17:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADE9BC424B3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9CsHV010746; Wed, 14 Oct 2020 11:17:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JJVLDS4a7JKGWgLpD1lgqLNb5Ipa4CbziBAPqPOb2Gk=;
 b=rQyntUp+Zs8+FX4HvaUK9zAVjIdeqd2jM7+6qV3RvXSLb8uz02Rw1NXCk/CFV5MzAzmH
 SvPapTnlksQ9DJK80/i/eTKsmP5963rWEAwmt1GJkVxFolJ8sTBRzOWrCSrqG4vlSO7c
 l/uXxMxytFZ7XOeOk53IVQudtGb2t1LBICtBWl1YpmFDhXioPJWOMp1tWJn/lkqUGBeD
 Tzn6wVzC/R2DJ/rZGE8p/UrC3A4K5NE78NOY6BqZzAC4urmgNXPzLT9HmhFG+5S7ImHf
 d6o4l2OHVnEY7XJA5UN7lZdkiCO6FburZ8M6Db6yb/QJWLjv7B9VmrBnjLIMty5Zqoo+ Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3455c8gcc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:17:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A708C100034;
 Wed, 14 Oct 2020 11:17:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9953420B84D;
 Wed, 14 Oct 2020 11:17:19 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:17:19
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:43 +0200
Message-ID: <20201014091646.4233-31-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 30/33] video: stm32_dsi: migrate trace to dev
	and log macro
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

Change pr_* to dev_ or log_ macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/video/stm32/stm32_dsi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index 9d5abacc2b..dcec0edafc 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -8,6 +8,8 @@
  * drivers/gpu/drm/stm/dw_mipi_dsi-stm.c.
  */
 
+#define LOG_CATEGORY UCLASS_VIDEO_BRIDGE
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
@@ -133,7 +135,7 @@ static enum dsi_color dsi_color_from_mipi(u32 fmt)
 	case MIPI_DSI_FMT_RGB565:
 		return DSI_RGB565_CONF1;
 	default:
-		pr_err("MIPI color invalid, so we use rgb888\n");
+		log_err("MIPI color invalid, so we use rgb888\n");
 	}
 	return DSI_RGB888;
 }
@@ -213,14 +215,14 @@ static int dsi_phy_init(void *priv_data)
 	u32 val;
 	int ret;
 
-	debug("Initialize DSI physical layer\n");
+	dev_dbg(dev, "Initialize DSI physical layer\n");
 
 	/* Enable the regulator */
 	dsi_set(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
 	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
 				 TIMEOUT_US);
 	if (ret) {
-		debug("!TIMEOUT! waiting REGU\n");
+		dev_dbg(dev, "!TIMEOUT! waiting REGU\n");
 		return ret;
 	}
 
@@ -229,7 +231,7 @@ static int dsi_phy_init(void *priv_data)
 	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_PLLLS,
 				 TIMEOUT_US);
 	if (ret) {
-		debug("!TIMEOUT! waiting PLL\n");
+		dev_dbg(dev, "!TIMEOUT! waiting PLL\n");
 		return ret;
 	}
 
@@ -242,8 +244,8 @@ static void dsi_phy_post_set_mode(void *priv_data, unsigned long mode_flags)
 	struct udevice *dev = device->dev;
 	struct stm32_dsi_priv *dsi = dev_get_priv(dev);
 
-	debug("Set mode %p enable %ld\n", dsi,
-	      mode_flags & MIPI_DSI_MODE_VIDEO);
+	dev_dbg(dev, "Set mode %p enable %ld\n", dsi,
+		mode_flags & MIPI_DSI_MODE_VIDEO);
 
 	if (!dsi)
 		return;
@@ -325,8 +327,8 @@ static int dsi_get_lane_mbps(void *priv_data, struct display_timing *timings,
 
 	*lane_mbps = pll_out_khz / 1000;
 
-	debug("pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
-	      pll_in_khz, pll_out_khz, *lane_mbps);
+	dev_dbg(dev, "pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
+		pll_in_khz, pll_out_khz, *lane_mbps);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
