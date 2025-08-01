Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 068EEB18049
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Aug 2025 12:39:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEA33C3F943;
	Fri,  1 Aug 2025 10:39:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E7F7C3F93F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Aug 2025 10:39:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4561ed868b5so11202555e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Aug 2025 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754044756; x=1754649556;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=93PE7q57Gy+rBExAALoJu4umqN1hy37MNozddY4X/ZA=;
 b=uPwPARlTPuZiYbV3DHMYJ/eNbV22YkBZx+wnEipxN3BeCevSSjfD/0PaocGZiWOC3X
 uZqL2zsZ9Axv0d0H58eYOuI80+RkV7egodaiR6r8nG+jxfTK/CwO8YBpNd8EMOLtZAf/
 601UVLU6JoScxncKVVHvVXaHrv7r0isQKfF/3awTLMqcgJVAUj/F6V7zfd/2GhzULVLz
 MJb9YZmaeiTUBBtIZZCvQcx++5PJQLdaapunw9eRhir3fzysv8N0GjKf/cxy3S7UZ2fQ
 tj1OfdGUj9iwfFjSyUJnDwrOkDkPc2x5zXdYOXHQQlBnXe272/0fjNu5vFe5B/iivBI9
 lu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754044756; x=1754649556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93PE7q57Gy+rBExAALoJu4umqN1hy37MNozddY4X/ZA=;
 b=grWQLZh//tLBooN1FSRoIwV73U9hkdT2opbFPhMdrVerseMpxcLdybC9AskDyWlrjk
 5Ip/sHfkRZB6GR8YmnLRdiA8HwVJKWp6qB01RS/ohHTnRAMmqVMTuAeH3R+A1ugeN1b6
 hooVEw6ZIXNawCaaTYJ+155EkkNJLsbB6B3sKKPr+3r2FngadPJMXGjlL626KuD6pL2Q
 8T+7LtQnKmw1/rM/hyoccCVuz6MU1hpDY4eipRIiNtEjV1Kjw1QNcZCUSxj1SLv01Hm6
 sO28u3ikhYzfof4xs6kLbsCintrG7yGKVRHeOp4Mc/rXmZ5ZXr4I3bmVc2ncYWY+O3wO
 ineQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyscf4anhlJtyUTf7ZUIsVfJM67n9u3wE3PnvNLnr4CmbUVbMLAxQjPD0/2X8vwdT3+CPnKBidXz5gCw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz5Kx3ZHGbVwWl82+UIFZ1lAIo0aXENMV/nQqVLvy17ONoFVqCW
 ZDTPx5h9K1F8+S0NQwZB16SvV6EU25RXKybqfKFuxGrn1PRjNUo90Rz1CYzioV6i7V0=
X-Gm-Gg: ASbGnctV+IGh8jlJfDLCAXupAPtOhdmf1eGYdcXVuUSTybdv72qG/tOp9pkfXtjP7fn
 bgItDs1jkRF5UOuDfuIOJI/QU47A+y62p66iwUEZsp9mObz6yaND3NJNW5xKph0w6lIOZALa9S8
 0aAz/3mx47Qf119+qwEvbHTOH19mBIXRv/dqqGW3fKkPeUZKe3DvP2fuL3akD0js2JfomBFnwWY
 JiGlznfdG3gjoHuQHVmi4oak/GbHcaYrLX0nZcUTE978b0tLFozyOkKlaoksF0PAbgWHZhHhbQz
 Avm7qjXIwoFBrbfiOvmIh1pyyJNYlqMoIcdEgAVKLUMgz431EVhiUQl4Rv5PezSJ0pM746rOJIw
 Aw+W/RNKdbX1oe/wdQdVSDD6q519F9X2dOnBRs9VcTCCfuTkXUBQ=
X-Google-Smtp-Source: AGHT+IG4Ah4gy5wKMitK5iW2SSTbHpagruvAIT4wRNfwLga1PrLwjvwKFz5ieSlqrwRJdy30umq1GA==
X-Received: by 2002:a05:600c:1f82:b0:456:207e:fd83 with SMTP id
 5b1f17b1804b1-458aa31840emr17059865e9.4.1754044755941; 
 Fri, 01 Aug 2025 03:39:15 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:cc6e:5422:ab75:92e8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edf5638sm59830275e9.4.2025.08.01.03.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 03:39:15 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Fri, 01 Aug 2025 11:39:15 +0100
MIME-Version: 1.0
Message-Id: <20250801-mtd_nand_raw2-v1-3-bdabdeb35b46@linaro.org>
References: <20250801-mtd_nand_raw2-v1-0-bdabdeb35b46@linaro.org>
In-Reply-To: <20250801-mtd_nand_raw2-v1-0-bdabdeb35b46@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Tom Rini <trini@konsulko.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.12.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: [Uboot-stm32] [PATCH 3/3] mtd: nand: sunxi: Free allocated memory
	on errors
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

Add kfree calls on error paths for memory that was allocated. This will
prevent memory leaks.

This issue found by Smatch.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 34197bb09a1..1ce09b56b80 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1403,8 +1403,10 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
 	if (!data)
 		return -ENOMEM;
 
-	if (ecc->size != 512 && ecc->size != 1024)
+	if (ecc->size != 512 && ecc->size != 1024) {
+		kfree(data);
 		return -EINVAL;
+	}
 
 	/* Prefer 1k ECC chunk over 512 ones */
 	if (ecc->size == 512 && mtd->writesize > 512) {
@@ -1641,17 +1643,20 @@ static int sunxi_nand_chip_init(struct udevice *dev, struct sunxi_nfc *nfc,
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
+			kfree(chip);
 			return ret;
 		}
 
 		if (tmp > NFC_MAX_CS) {
 			dev_err(dev,
 				"invalid reg value: %u (max CS = 7)\n", tmp);
+			kfree(chip);
 			return -EINVAL;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
+			kfree(chip);
 			return -EINVAL;
 		}
 
@@ -1678,12 +1683,14 @@ static int sunxi_nand_chip_init(struct udevice *dev, struct sunxi_nfc *nfc,
 		dev_err(dev,
 			"could not retrieve timings for ONFI mode 0: %d\n",
 			ret);
+		kfree(chip);
 		return ret;
 	}
 
 	ret = sunxi_nand_chip_set_timings(nfc, chip, timings);
 	if (ret) {
 		dev_err(dev, "could not configure chip timings: %d\n", ret);
+		kfree(chip);
 		return ret;
 	}
 
@@ -1705,8 +1712,10 @@ static int sunxi_nand_chip_init(struct udevice *dev, struct sunxi_nfc *nfc,
 
 	mtd = nand_to_mtd(nand);
 	ret = nand_scan_ident(mtd, nsels, NULL);
-	if (ret)
+	if (ret) {
+		kfree(chip);
 		return ret;
+	}
 
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
 		nand->bbt_options |= NAND_BBT_NO_OOB;
@@ -1719,24 +1728,28 @@ static int sunxi_nand_chip_init(struct udevice *dev, struct sunxi_nfc *nfc,
 	ret = sunxi_nand_chip_init_timings(nfc, chip);
 	if (ret) {
 		dev_err(dev, "could not configure chip timings: %d\n", ret);
+		kfree(chip);
 		return ret;
 	}
 
 	ret = sunxi_nand_ecc_init(mtd, &nand->ecc);
 	if (ret) {
 		dev_err(dev, "ECC init failed: %d\n", ret);
+		kfree(chip);
 		return ret;
 	}
 
 	ret = nand_scan_tail(mtd);
 	if (ret) {
 		dev_err(dev, "nand_scan_tail failed: %d\n", ret);
+		kfree(chip);
 		return ret;
 	}
 
 	ret = nand_register(devnum, mtd);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
+		kfree(chip);
 		return ret;
 	}
 

-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
