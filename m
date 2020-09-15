Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08E26AE1B
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Sep 2020 21:52:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F403C3FADF
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Sep 2020 19:52:02 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68C5AC3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 19:51:59 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id c13so5278782oiy.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 12:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JF/5NmdWwT6Sni9NhTJ0/fhI5cBiA6k1fLvCmuvKoKE=;
 b=R1ZSOYZPvFRBdUmFOoT+OU272X6EFkIgUB7xTNlHj4W1poeIW+Thfw9Kd/D4MhfDmu
 0FqU/orZf99IhXmswAEk0lt6m7fXFJhx4WmKwked/8ThM3ce83flrtp+fNEqIPhGOa1c
 gnayQDRqvf1eAlXYN8dauWKL0JcGX1Yq+ODGs/Hh6TVH0SI/nNQKDjbk1fhtXfPAot7f
 6RVQQIDZAfFmv8F0blBWstkH61xbS871YXALn8J4bmQ/0jO2bMkUTH4MsCQJuMiLojEy
 Wn67nB+Hi6eJWnSgfJ+pS/+v6x375DpXg2Dy2dpcx0C2QC+47J0nRHOC1lL/Ox3RR43j
 cWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JF/5NmdWwT6Sni9NhTJ0/fhI5cBiA6k1fLvCmuvKoKE=;
 b=BdtyKm8CnW299jTq53Y3MHMccf/3lm0Mm3iXdBzG5glCys+DALmCvvB8OQipJecVKF
 JRkwEogvpyzFd/PRQ3kjrfuBLj5/ov6kM1PxYkJiJkv9iFwBH1FZ7ldfX7jqTIvx76Bg
 4lFZTh5LcoPNhuextUNqgpp5nZGRpuekO0BK/jV2JzaawbRpM4EtwuYjaHS2bZw0yAD8
 r/zknJ+0PoqIyHXPPPz0OzY4TNkHrpC4AnnSIHn3PQh3LBnvOS9uCvpHWjqhLV97hmbg
 H1ChgbE7l+ZpHkHWoNoc12BL7bQIWntRhXlMFhqk2t8lqI2ylOhKdZl0fEgNVzQMGetL
 XGXA==
X-Gm-Message-State: AOAM531WBcnfmA+XCNatSeQVvzTdrM/6+dePymXc4pn8tZUrYAdrNCbg
 wq/QbcN1ICRfocIe26d5lGNvSn7bjPA=
X-Google-Smtp-Source: ABdhPJzChX98I24VUNMgqyh+q4ZlrL5MjOA/9gbQ+GWGTLDgTcfVBZrtovVYbgnmbuFqne7IhYXaXg==
X-Received: by 2002:aca:5297:: with SMTP id g145mr752283oib.139.1600199518011; 
 Tue, 15 Sep 2020 12:51:58 -0700 (PDT)
Received: from nuclearis2-1.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id t7sm7896874ooq.0.2020.09.15.12.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 12:51:57 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: uboot-stm32@st-md-mailman.stormreply.com,
	peng.fan@nxp.com
Date: Tue, 15 Sep 2020 14:51:47 -0500
Message-Id: <20200915195147.2659607-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200909215402.366561-1-mr.nuke.me@gmail.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: u-boot@lists.denx.de, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/2] mmc: stm32_sdmmc2: Use mmc_of_parse()
	to read host capabilities
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

mmc_of_parse() can populate the 'f_max' and 'host_caps' fields of
struct mmc_config from devicetree.
The same logic is duplicated in stm32_sdmmc2_probe(). Use
mmc_of_parse(), which is more generic.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes from v1:
 - Check the return value of mmc_of_parse().
 - The call to mmc_of_parse() is moved further up. This means we can just
   'return err' on error instead of exiting via goto.

 drivers/mmc/stm32_sdmmc2.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 6d50356217..a29657429c 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -653,6 +653,12 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
 	if (priv->base == FDT_ADDR_T_NONE)
 		return -EINVAL;
 
+	cfg->host_caps = 0;
+	cfg->f_max = 52000000;
+	ret = mmc_of_parse(dev, cfg);
+	if (ret < 0)
+		return ret;
+
 	if (dev_read_bool(dev, "st,neg-edge"))
 		priv->clk_reg_msk |= SDMMC_CLKCR_NEGEDGE;
 	if (dev_read_bool(dev, "st,sig-dir"))
@@ -676,28 +682,10 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
 			     GPIOD_IS_IN);
 
 	cfg->f_min = 400000;
-	cfg->f_max = dev_read_u32_default(dev, "max-frequency", 52000000);
 	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 | MMC_VDD_165_195;
 	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
 	cfg->name = "STM32 SD/MMC";
 
-	cfg->host_caps = 0;
-	if (cfg->f_max > 25000000)
-		cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
-
-	switch (dev_read_u32_default(dev, "bus-width", 1)) {
-	case 8:
-		cfg->host_caps |= MMC_MODE_8BIT;
-		/* fall through */
-	case 4:
-		cfg->host_caps |= MMC_MODE_4BIT;
-		break;
-	case 1:
-		break;
-	default:
-		pr_err("invalid \"bus-width\" property, force to 1\n");
-	}
-
 	upriv->mmc = &plat->mmc;
 
 	/* SDMMC init */
-- 
2.25.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
