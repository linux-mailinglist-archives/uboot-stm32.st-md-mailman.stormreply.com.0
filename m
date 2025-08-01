Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F231EB18048
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Aug 2025 12:39:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B36C3F942;
	Fri,  1 Aug 2025 10:39:16 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC7DAC3F93F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Aug 2025 10:39:15 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so893336f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Aug 2025 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754044755; x=1754649555;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IPaPh1HFLHZTAToX7xAAy/lrHcqrQWr9wonZ3cDj6rU=;
 b=ANd7wCqaGL+MjfwDkSsVeITNycZnVf1hW8oCKY8Wz7nAxi9CSdyLe2RLTL0wz4KYzq
 291ksBMS0+HoP2JLJq5a8lyzZBmwEwf8lPnc8xBwSHCntsk7XP1Luv35IxCfcXwGYUrC
 VzjF1im5h64VWQNEFfNY6nN9kA4QeBHhX/+F8ZlXMDkWRwM3+fk7ENipW690ZlydHhwX
 T+ovG/MKAx4izgktxE6EKAFqxcp9HEBQM5/somdZSOUh4JOufdbevHeWLvCRBo8XDqPJ
 W0nlVLnh34QraVM5GkM5ExJ4MNdmSrcr5CzI47yZc3zYIyDOeByLeKJrWW8qx4suQCCg
 xZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754044755; x=1754649555;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPaPh1HFLHZTAToX7xAAy/lrHcqrQWr9wonZ3cDj6rU=;
 b=Y2EX+LQCpkGrV0q5LL17MYSqmwgh1/mdxaqPmyOJ18LM/qhfPccRnz6EeG6uq7ok/2
 uCRk2rRho2L91GJwi7GV08/Lp0CeDKaptNmnkNrVl1M5JohcfNzDHhK2Q9UFNKF/iBIo
 DZLICbU5zWX8jGPGsMOeSmBOeBKlNO0Jz7EgPHhTDjTXJPeSlYv2Kn/XuMW/2FSz0QXq
 a7k9Nk0VstIic87n5IT2aTi1SDlUMy85wFs2aNIks5l4Z1354FWJHzlUDWG1qrvEzHEv
 6dveKqBoB5rW3xVJSdnZAeAzgEr81H1CJOogt/uHJO8yDTFkAYFH6YDy+PHc6Wa2dEff
 MBUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxp4mtDguGJFbNVVOa+o6GcjTkvnkzv6cVucUzzc4qv+XGpELmv6NsysUCoRNHxjGStG7GqGAjXeQUaA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyRk0/KnQPr3AMilVkXUydXVCihU7A0wDsaEWG41zXrD8N8LLmW
 F8zGylraXueQQTlJDW1JveLif1yI9n43Jk86ztgFqQD/E60cUq3+MK+QJAvT4YMpzdk=
X-Gm-Gg: ASbGncuru8H+whpcLXNSKDGFVPx7KhTWw/p7Pl6oq2pi7BAz0unTNwMukQfkNTZ5y74
 8Cknbh8Kmz25NxxddrvD1oOqX1TNi6kgn/D4yFphU9HyBCcnNDyg/ERL4s5N+OLAqDX7VdJNt21
 Okpm3nzOEN4lYEJ9Y4b++/MvlLLYS56YuAW5X9c7WSYPwf1oP6vJv00jyxz4TC7QXuv5igp2L9j
 8G/nVonBiWiiXmNns9h9E/Bb+N5BVoE6psa0E0AkyuwK1SNN5dMaSFjfp1f+/GkWmXXUNFgBewp
 F6QkP/c9jP3SuA5S8LT8lRxukFvAG+2ArL+RDkt3GOw7THRk6X/mH87Jh6IALWUfeFp4spy2ppn
 E4DzYj1eZrycIzpX9jvBzCsshN7cxClJVb4HnLAhcin96KH5m/7A=
X-Google-Smtp-Source: AGHT+IE5Jcd7wN5QRudH9LV956/03dqi1T38fDe1ywuIP2/PiTEFSooddnfYklC9kLGsp0879LZ5aQ==
X-Received: by 2002:a05:6000:18a8:b0:3b6:c88:7b74 with SMTP id
 ffacd0b85a97d-3b7950127abmr9618707f8f.59.1754044755177; 
 Fri, 01 Aug 2025 03:39:15 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:cc6e:5422:ab75:92e8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edf5638sm59830275e9.4.2025.08.01.03.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 03:39:14 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Fri, 01 Aug 2025 11:39:14 +0100
MIME-Version: 1.0
Message-Id: <20250801-mtd_nand_raw2-v1-2-bdabdeb35b46@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 2/3] mtd: rawnand: stm32_fmc2: Ensure to
	return error code
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

In stm32_fmc2_nfc_probe there are 3 error returns that do not set the
error code before returning which could lead to the error being silently
ignored. Just return -EINVAL in each case.

This issue was found by Smatch.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 083ea4c5a74..d1c88643c98 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -942,21 +942,21 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 		addr = dev_read_addr_index(dev, mem_region);
 		if (addr == FDT_ADDR_T_NONE) {
 			dev_err(dev, "Resource data_base not found for cs%d", chip_cs);
-			return ret;
+			return -EINVAL;
 		}
 		nfc->data_base[chip_cs] = addr;
 
 		addr = dev_read_addr_index(dev, mem_region + 1);
 		if (addr == FDT_ADDR_T_NONE) {
 			dev_err(dev, "Resource cmd_base not found for cs%d", chip_cs);
-			return ret;
+			return -EINVAL;
 		}
 		nfc->cmd_base[chip_cs] = addr;
 
 		addr = dev_read_addr_index(dev, mem_region + 2);
 		if (addr == FDT_ADDR_T_NONE) {
 			dev_err(dev, "Resource addr_base not found for cs%d", chip_cs);
-			return ret;
+			return -EINVAL;
 		}
 		nfc->addr_base[chip_cs] = addr;
 	}

-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
