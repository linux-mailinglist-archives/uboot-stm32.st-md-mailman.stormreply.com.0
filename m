Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6025613F9
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 10:02:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA415C56630;
	Thu, 30 Jun 2022 08:02:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D551BC04001
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 08:02:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U2wsIB003744;
 Thu, 30 Jun 2022 10:02:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=mx0C4N4TKIfCfuDVX0JjUPkf1R9xOk8lCej7DeIouHk=;
 b=AbXgoeV8b7dCpudbw+BjnheITR+eOhJB5mIZU02e2iRflR/wN5aZ0JtXAyuFB54p29UJ
 h5sBe9qWCqh28rfc8JZQBF+neOT9qswtMDc1/M88OIziw2TfE9aNuLFBAV+Wfr7S5zbb
 L/cI4Fo9jgy9dzUjd+n+0GePYFr+DJGsujCiXiOA2DIt/merbAxs3cKT8T4ItD8OhaUE
 WWN71mbSH5IHARPPw4szXY7WDtoXBTbAM2uHhQP8n3+eXgzX/D1DUdQ0Gj3Lxeu3yH1v
 dCHfNYp/HE21NQVyim7l3qAMUnsjNlTEDBjfADHqCg4QMt6QMLFMPHo4BSoI1vSZloqf rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gydcujmup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 10:02:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C6B1100034;
 Thu, 30 Jun 2022 10:02:29 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08E162128DF;
 Thu, 30 Jun 2022 10:02:29 +0200 (CEST)
Received: from localhost (10.75.127.51) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 10:01:50 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jun 2022 10:01:47 +0200
Message-ID: <20220630100144.v2.3.Ie868aca1e057629eb212dcc3c8f463c00d01ccb7@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630100144.v2.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
References: <20220630100144.v2.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_04,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] mmc: stm32_sdmmc2: introduce
	of_to_plat ops
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

Add the uclass ops of_to_plat to parse the device tree properties
to respect the expected sequence by the driver model.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 drivers/mmc/stm32_sdmmc2.c | 95 ++++++++++++++++++++------------------
 1 file changed, 50 insertions(+), 45 deletions(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 41f375b9d32..bfce8a2e4a6 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -645,6 +645,47 @@ static const struct dm_mmc_ops stm32_sdmmc2_ops = {
 	.host_power_cycle = stm32_sdmmc2_host_power_cycle,
 };
 
+static int stm32_sdmmc2_of_to_plat(struct udevice *dev)
+{
+	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
+	struct mmc_config *cfg = &plat->cfg;
+	int ret;
+
+	plat->base = dev_read_addr(dev);
+	if (plat->base == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	if (dev_read_bool(dev, "st,neg-edge"))
+		plat->clk_reg_msk |= SDMMC_CLKCR_NEGEDGE;
+	if (dev_read_bool(dev, "st,sig-dir"))
+		plat->pwr_reg_msk |= SDMMC_POWER_DIRPOL;
+	if (dev_read_bool(dev, "st,use-ckin"))
+		plat->clk_reg_msk |= SDMMC_CLKCR_SELCLKRX_CKIN;
+
+	cfg->f_min = 400000;
+	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 | MMC_VDD_165_195;
+	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
+	cfg->name = "STM32 SD/MMC";
+	cfg->host_caps = 0;
+	cfg->f_max = 52000000;
+	ret = mmc_of_parse(dev, cfg);
+	if (ret)
+		return ret;
+
+	ret = clk_get_by_index(dev, 0, &plat->clk);
+	if (ret)
+		return ret;
+
+	ret = reset_get_by_index(dev, 0, &plat->reset_ctl);
+	if (ret)
+		dev_dbg(dev, "No reset provided\n");
+
+	gpio_request_by_name(dev, "cd-gpios", 0, &plat->cd_gpio,
+			     GPIOD_IS_IN);
+
+	return 0;
+}
+
 static int stm32_sdmmc2_probe_level_translator(struct udevice *dev)
 {
 	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
@@ -653,12 +694,6 @@ static int stm32_sdmmc2_probe_level_translator(struct udevice *dev)
 	struct gpio_desc ckin_gpio;
 	int clk_hi, clk_lo, ret;
 
-	/*
-	 * Assume the level translator is present if st,use-ckin is set.
-	 * This is to cater for DTs which do not implement this test.
-	 */
-	plat->clk_reg_msk |= SDMMC_CLKCR_SELCLKRX_CKIN;
-
 	ret = gpio_request_by_name(dev, "st,cmd-gpios", 0, &cmd_gpio,
 				   GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE);
 	if (ret)
@@ -709,54 +744,23 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
 {
 	struct mmc_uclass_priv *upriv = dev_get_uclass_priv(dev);
 	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
-	struct mmc_config *cfg = &plat->cfg;
 	int ret;
 
-	plat->base = dev_read_addr(dev);
-	if (plat->base == FDT_ADDR_T_NONE)
-		return -EINVAL;
-
-	if (dev_read_bool(dev, "st,neg-edge"))
-		plat->clk_reg_msk |= SDMMC_CLKCR_NEGEDGE;
-	if (dev_read_bool(dev, "st,sig-dir"))
-		plat->pwr_reg_msk |= SDMMC_POWER_DIRPOL;
-	if (dev_read_bool(dev, "st,use-ckin"))
-		stm32_sdmmc2_probe_level_translator(dev);
-
-	ret = clk_get_by_index(dev, 0, &plat->clk);
-	if (ret)
-		return ret;
-
 	ret = clk_enable(&plat->clk);
-	if (ret)
-		goto clk_free;
-
-	ret = reset_get_by_index(dev, 0, &plat->reset_ctl);
-	if (ret)
-		dev_dbg(dev, "No reset provided\n");
-
-	gpio_request_by_name(dev, "cd-gpios", 0, &plat->cd_gpio,
-			     GPIOD_IS_IN);
-
-	cfg->f_min = 400000;
-	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 | MMC_VDD_165_195;
-	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
-	cfg->name = "STM32 SD/MMC";
-
-	cfg->host_caps = 0;
-	cfg->f_max = 52000000;
-	mmc_of_parse(dev, cfg);
+	if (ret) {
+		clk_free(&plat->clk);
+		return ret;
+	}
 
 	upriv->mmc = &plat->mmc;
 
+	if (plat->clk_reg_msk & SDMMC_CLKCR_SELCLKRX_CKIN)
+		stm32_sdmmc2_probe_level_translator(dev);
+
 	/* SDMMC init */
 	stm32_sdmmc2_reset(plat);
-	return 0;
-
-clk_free:
-	clk_free(&plat->clk);
 
-	return ret;
+	return 0;
 }
 
 static int stm32_sdmmc2_bind(struct udevice *dev)
@@ -778,5 +782,6 @@ U_BOOT_DRIVER(stm32_sdmmc2) = {
 	.ops = &stm32_sdmmc2_ops,
 	.probe = stm32_sdmmc2_probe,
 	.bind = stm32_sdmmc2_bind,
+	.of_to_plat = stm32_sdmmc2_of_to_plat,
 	.plat_auto	= sizeof(struct stm32_sdmmc2_plat),
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
