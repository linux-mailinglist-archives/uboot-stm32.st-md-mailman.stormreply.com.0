Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D81FB18047
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Aug 2025 12:39:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A68B8C3F93E;
	Fri,  1 Aug 2025 10:39:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D5A9C36B12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Aug 2025 10:39:15 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-455b00283a5so7929815e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Aug 2025 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754044754; x=1754649554;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=By+ODiiNpe6tN3ca2GFeVKCuBlmwUvcWHt5jTcrrBrY=;
 b=XO7YRacTfrnmWJY5azKpSsL8L5F6kBO3UbO7skVfPkIrDB7+jc1ZCaWdrCofritT3+
 FOs6ODQ+iDUzQV0DokLKfoCHhs8s2i5W7KbIQ+3+JhUrJv25n72OLjMh5mVHvUZS0sLn
 9mK+Sl/QZIN5rTJdIGYgcRotE/fvfH1bjJsGci2CK2Gb8sHm52oEzodC2YGSZmCmnG+w
 m9iiTsYxmLXATB7kg1gUVW5Y9JKYRkO/8GHuTYR0TwIvc3CFMWqTV/OpX7z6cdQpHDDl
 9p4pBVIZnBl8rNs/l79QXfyuJENTNgQVOcLFr0kbFYu9O1hTwIOUCV9/odzAF3guViw4
 EwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754044754; x=1754649554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=By+ODiiNpe6tN3ca2GFeVKCuBlmwUvcWHt5jTcrrBrY=;
 b=dm1B82T1xouxKP0hXLC5gI1+8S7VI4uNw9vvzMvIrzZg4Sfdt9mSm3NGFGG9q3Z9iW
 7TNU+M3AH0wY0OIvxe8m0ds3YY71Hmj6uQnMCMJtUy2OB564HY34QdKmorgVI4L2RrRv
 04f/XLrjKi7iJhAgZsHVkU2vTW9MWPZdyPl4OLxcWDNVyKBxD6greGG3+dgdMA6xaxzY
 wGy7qyyyC5qZg1KRSnd1NKaJKom1/E54tDODCvLYMRQfHa34ZQnOmdTAKDT8nyS+sjbF
 cJSHto93vfbIEjw9R3E/JmcOTDIGftbmF9R+Sn+l0GFontzNJB9u3vRrLhwfbKQm+ylS
 vCVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU1f5/RCPFsyFAwKNN/533NvvWX+1wxAqr3DWFOBbSDXWw+aqaTCvGbEP4gK4pDDELDJsttc1gdFbqcA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyo6OQzbzHIl40Vhm+msAeHYTyJSFXMU+7Wb4/ONLrUZ22NkqR/
 TOgYsGgJQ20LS0n6dttiOrGQwoW+OoA1+HwwdnAm/zg/Yk0tiTmcz4iNIBlAcugDul8=
X-Gm-Gg: ASbGncsYUlZKxcLSAjhQd5Q7wehcdKJudn15US8volB0jkC0a5dnYsK7VV9PwK3EHTh
 Ag3/h84+bvVCNslCJmtNnbPnsVGbfW7160dU1FNokf8YgmtGVht29DvH+dfExrrwzoWYehfBFxs
 gpEZ8/Ht2eCwBUKA3smq2fE5IyYyWvfJ0uawvWjN3+oztOQhXb5Emvc228TQ617ft1ULSQJPHXb
 pb4ZPiePn0ozBj6jM69opGaxHy8YJRDOfaKNgfwuZ1Yx/7j5ue85XVAhH4OPKyGqNXZDGSDtbaH
 qrC1yYZecBuOxvMo05y3ktTFr3h0DeXs3dpFn26nr5TKGIz4bJiM3UfBBhMJ7dnVZTTyM3d0pVS
 85PIM+t0vRJKp5nmelVsmkRmyle9Vp/Ay6dG3F7wQHNwG6xaNJoo=
X-Google-Smtp-Source: AGHT+IG2P5wisCBBbReWhVlSOTmHd1djT9g8yJq5/GEKWuAXUJ6ixEaKG25EZKLAYsl/IRslxGMg1A==
X-Received: by 2002:a05:6000:42ca:b0:3b7:951c:aef3 with SMTP id
 ffacd0b85a97d-3b7951caf12mr5974758f8f.38.1754044754444; 
 Fri, 01 Aug 2025 03:39:14 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:cc6e:5422:ab75:92e8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edf5638sm59830275e9.4.2025.08.01.03.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 03:39:14 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Fri, 01 Aug 2025 11:39:13 +0100
MIME-Version: 1.0
Message-Id: <20250801-mtd_nand_raw2-v1-1-bdabdeb35b46@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 1/3] mtd: nand: pxa3xx: Free memory on error
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

In pxa3xx_nand_probe_dt if the function detects an error after
allocating memory that memory is not freed before exit. Add the
appropriate free.

This issue was found by Smatch.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
 drivers/mtd/nand/raw/pxa3xx_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/pxa3xx_nand.c b/drivers/mtd/nand/raw/pxa3xx_nand.c
index b78b4e60238..7bf54fa4654 100644
--- a/drivers/mtd/nand/raw/pxa3xx_nand.c
+++ b/drivers/mtd/nand/raw/pxa3xx_nand.c
@@ -1765,6 +1765,7 @@ static int pxa3xx_nand_probe_dt(struct udevice *dev, struct pxa3xx_nand_info *in
 	pdata->num_cs = dev_read_u32_default(dev, "num-cs", 1);
 	if (pdata->num_cs != 1) {
 		pr_err("pxa3xx driver supports single CS only\n");
+		kfree(pdata);
 		return -EINVAL;
 	}
 

-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
