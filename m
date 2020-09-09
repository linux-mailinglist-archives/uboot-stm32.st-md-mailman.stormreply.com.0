Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E7263D71
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 08:31:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 375E7C424B8
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 06:31:37 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FE7DC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 21:54:11 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c10so3614664otm.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Sep 2020 14:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5vC9NwhFmA9GQTOvMPbvq9q91RP22NUprwSdGFv3NPc=;
 b=ZlUWapFYS8QvJtFQxiuDPBTT9f9a09SfrnTrzHFn8SBNxaZHaLZSAS9AuOb0ucQZkK
 i7JhWdHFuS4NC1keEeNawVFxoLuQLyV+2BjTjJED0ljUgAeWUOtllp0AcqqDVSO3LCs0
 3fQxZEtf/9bP4IS0/lWFyrxNhAY4nDMQq5NAX4/hSIno/ZJeUmx5G6CcXuXCYy2EFj2b
 hpy0mBRYuE5npUNs7/Co4O19a8GZ5L2LZe3yYt6ChcHkv/8DewB3EpjkP0yTG6C1qWw/
 pEtozjyyb0PPTWeh8AKyC713yeLwGJV0bwum7yBya1x72mjlEU3rsBcPMI2Ep2mjumUM
 aeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5vC9NwhFmA9GQTOvMPbvq9q91RP22NUprwSdGFv3NPc=;
 b=Lb7VfZta9CNdZZBc/TDYSw+qp4Rv5l0W8OE/SWk48Z80seWQIRHrclftgY/WlKmAf0
 AqnsXpNr0LhNx4bR5HQfylMyuy+dtx1TPEPxOdT3f7kkyEhOpgxltcjhgrDfMWPuerA6
 zuqoGVdt1Ym858b87SaAeCbxcD8aNLeEZo7nnbjlCd/WL3JdlTY5jOOKrwTBpyMlLhVd
 CB9yO4pbvKQs14vyCj66qGbHggGuUVwiNYV7qPCETsZJZ/o056VNTu8ty0hLmKDRxvkk
 EO11Qkm3zxJFwG28bhbH3SBY7In/XGXi80FAk5lCxTcGhJ/aLd3zFuYhgXx6yxj19Uzk
 bYxA==
X-Gm-Message-State: AOAM530juXSG6Upl6ADxUlUbYnb0kd0GZw1aTY0jNnj5N/QSAp2bEzy8
 yclh8UcKdbgxzV0nwiH8IM1Rm4eJXIyU+w==
X-Google-Smtp-Source: ABdhPJyQSwOMMK72ceFbZ3E59LQrvqtER/pBBMdl69TfL93xpwMHSCm/LRWcz5Fe4gNzrQ/BSWuFGQ==
X-Received: by 2002:a9d:6543:: with SMTP id q3mr2130340otl.196.1599688450399; 
 Wed, 09 Sep 2020 14:54:10 -0700 (PDT)
Received: from nuclearis2-1.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id z10sm578345ooz.14.2020.09.09.14.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 14:54:09 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: uboot-stm32@st-md-mailman.stormreply.com
Date: Wed,  9 Sep 2020 16:54:02 -0500
Message-Id: <20200909215402.366561-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Sep 2020 06:31:36 +0000
Cc: u-boot@lists.denx.de, Peng Fan <peng.fan@nxp.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to read
	host capabilities
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
 drivers/mmc/stm32_sdmmc2.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 6d50356217..77871d5afc 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -676,27 +676,13 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
 			     GPIOD_IS_IN);
 
 	cfg->f_min = 400000;
-	cfg->f_max = dev_read_u32_default(dev, "max-frequency", 52000000);
 	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 | MMC_VDD_165_195;
 	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
 	cfg->name = "STM32 SD/MMC";
 
 	cfg->host_caps = 0;
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
+	cfg->f_max = 52000000;
+	mmc_of_parse(dev, cfg);
 
 	upriv->mmc = &plat->mmc;
 
-- 
2.25.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
