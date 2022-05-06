Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DD51D9F5
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 16:08:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B935C628AB;
	Fri,  6 May 2022 14:08:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5591BC628AA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:08:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246Ab3F9018244;
 Fri, 6 May 2022 16:08:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ua/g5Z529NaRtZhVKKJQlSBQLZUB27uwDftgfROCTZg=;
 b=GXBX+DUe2abde99N0lvcw1jfFVrFujTVk5twVCZABJv6EYx2qtsoirQAaiWec1ixGZA9
 IqU0Jrs5YFTuGj9RCtHvrUhaoP/37iAyQLUWBPTO532W/RlIfNRjaoP36TrSCJPI6VBD
 6Ctx95KlcBNrlnJ5ZAB3vc7UXcyUvhj3bAXMQqDTG+vpFL5vEJP/a1EVZQXS4e2MKYe9
 nBbVKLs1uM7REoiOuULtcftW+gO2heKaRPpXHOU3eBzjZwkMW0Sw2Unx1H4FmjPCTkBq
 ZFdF4hVOu+5+kTDXor9+VciCH9iAqZ2ywJmA2xs1qjh5EPREo4lPpqOfoA6Pt3dzzD0E WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthk9pf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:08:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2F2B10002A;
 Fri,  6 May 2022 16:08:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD2A32248DB;
 Fri,  6 May 2022 16:08:37 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May 2022 16:08:36
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 May 2022 16:06:20 +0200
Message-ID: <20220506160540.13.I39b69e8dc7b43b8e265e77388fb53f7c1fa2a007@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
Cc: Peng Fan <peng.fan@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 13/16] mmc: stm32_sdmmc2: make reset property
	optional
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

Although not recommended, the reset property could be made optional.
This way the driver will probe even if no reset property is provided
in an sdmmc node in DT. This reset is already optional in Linux.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/mmc/stm32_sdmmc2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 44bfc911af..81b07609a9 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -514,10 +514,12 @@ retry_cmd:
  */
 static void stm32_sdmmc2_reset(struct stm32_sdmmc2_priv *priv)
 {
-	/* Reset */
-	reset_assert(&priv->reset_ctl);
-	udelay(2);
-	reset_deassert(&priv->reset_ctl);
+	if (reset_valid(&priv->reset_ctl)) {
+		/* Reset */
+		reset_assert(&priv->reset_ctl);
+		udelay(2);
+		reset_deassert(&priv->reset_ctl);
+	}
 
 	/* init the needed SDMMC register after reset */
 	writel(priv->pwr_reg_msk, priv->base + SDMMC_POWER);
@@ -735,7 +737,7 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
 
 	ret = reset_get_by_index(dev, 0, &priv->reset_ctl);
 	if (ret)
-		goto clk_disable;
+		dev_dbg(dev, "No reset provided\n");
 
 	gpio_request_by_name(dev, "cd-gpios", 0, &priv->cd_gpio,
 			     GPIOD_IS_IN);
@@ -755,8 +757,6 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
 	stm32_sdmmc2_reset(priv);
 	return 0;
 
-clk_disable:
-	clk_disable(&priv->clk);
 clk_free:
 	clk_free(&priv->clk);
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
