Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3CAB1D566
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Aug 2025 12:04:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83E55C3F958;
	Thu,  7 Aug 2025 10:04:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CA02C3F957
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 10:04:09 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so6546895e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754561049; x=1755165849;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NWmcgE1aBA51xD637InwQt/TNC6PnCEa7tdsryQhb90=;
 b=FoYOc9kiNBcyXt/LwzqGW3z4acl+sKW7QpNJG/UOtHnwHnEBSTdHmE7iKuRuv++/y/
 /0xniBux8ZQy3zw2ghK1/QlS4YQZcqKP1fshZPoZslokyOeUvvmTr03LQDh6o1CkxU9T
 eik3UakEqFAWoybq2xdZAU4cgu8Z0bV90rpiPs41G+25ZRIVXumyPVKeloCUcdwE43kh
 6KT3/zFoiNc4F5bDggv+50kW8i9DE9bOrk6d0oLqDtKNl6Ouqg78HhIe0ggX1bCWq0cL
 AwmqhWfXwt7jTbtacBqDbGPF1deKq7ntYh3RPj260v1rZYpcEGImeIcs2SZNEaPMIdNN
 2uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754561049; x=1755165849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NWmcgE1aBA51xD637InwQt/TNC6PnCEa7tdsryQhb90=;
 b=Yyhhx3/+Z9mTlBM4alMGudiRQCGcyLeDSq5cY4AsrcBi6oA09bgKSTKqm0B1wSkxaq
 LlXnZuMYk1apSEimY3xMgOmqEKHbrsSyRUjTFCPGMIj+5PMgYs/NICODfxrCCje+PH2y
 OjbGKZd1BBC9/pPvmzp+n7lCI0AF06dA41aJuJ6CLWeGsH36zxTth2Kd7w/IYV27kjAI
 qOLXvJJ+/vjBX6c4mY36okZ/u2pJDxftm1syfUKgBp4pX98B+qrWTXtb46KhMJDy0+88
 KFHgz5eYvBONcjJfB8m+2RXVQew9ib/++KPLfanoD8hrmVabvXNBxWKEVTxg1cu2f7Rr
 lycQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo94MNLdKvctEYu8ZwYDlVS2Uhnqf0xVHvnmVa0paP44/wOWC/ADBjw57w5kO7KSyvQ6EuezhwSTeFAA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxH9sxMnx9plVbKY5AokdeLG57LhDzIhSIoZMDxy4PkHUR2JuqR
 JjC5ElqGaYcbJ/eSB/ek2iczqG4cW95cV1MsasmWyuDrxOYW6DLj9qJRfBG4PsgpqQmfUpOyY3d
 g3qy5goI=
X-Gm-Gg: ASbGnctqDs7mqKdz2mG4oMgUnbxaF0c0J0p8eumueYLXjn/09/VPSrr0z7jAlt4g2hX
 60tHgBjxPeyVix0U924rUuchVTUqwR/pfl0InBRWOhd+NrY0O2y7FmTtvnduvCwpFvKjx2L7UgT
 bcf4aaHfqdBSv9ptwxlQCtRGCgTjDza+vrjC8IOkicYlhoNVu/4Y0l4v8eieAaLYdPx/pHyAzHU
 yV3UjSFtYr5ui0L7b4wnucWuEUrysCOWXgq3r/uX5yZx0nbm1GZg0D4mx6iwyG35/NNHIyVesJ1
 h4GFwSX1Y7D16Dac1u92z1qzYDbiRgfRCaNZeQGUrV4auLYd0sr1QdbZ2o252Ml8PuQm8TZ960z
 TchTY03vL5pQasnCaLuSdrenOULU7zKwcz6zX1Jpuhk0ogHqjZ8I=
X-Google-Smtp-Source: AGHT+IHI614TRbGBYy+TwQEwQrP0yM0OIFYIfT1xbyW3DGNjHAnLriRO+ufs5t3DK8/eQLnM1jn/CQ==
X-Received: by 2002:a5d:5d85:0:b0:3b7:76e8:b9f7 with SMTP id
 ffacd0b85a97d-3b8f48de5demr4783729f8f.10.1754561048694; 
 Thu, 07 Aug 2025 03:04:08 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:377e:cf4f:d0ff:80bf])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953eaeeesm358481575e9.25.2025.08.07.03.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 03:04:08 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Thu, 07 Aug 2025 11:04:04 +0100
MIME-Version: 1.0
Message-Id: <20250807-pinctrl_misc-v1-3-eeb564a1b032@linaro.org>
References: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
In-Reply-To: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
To: Tom Rini <trini@konsulko.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.12.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: [Uboot-stm32] [PATCH 3/4] pinctrl: zynqmp: Ensure ret is initialised
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

In zynqmp_pinctrl_prepare_func_groups if called with func->ngroups == 0
then ret will not be assigned to before its value is returned on exit.
Initialise ret to ensure it is always valid.

This issue was found by Smatch.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
 drivers/pinctrl/pinctrl-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index 6fa203a3b86..27dadbff8ca 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -204,7 +204,7 @@ static int zynqmp_pinctrl_prepare_func_groups(u32 fid,
 	const char **fgroups;
 	char name[MAX_GROUP_NAME_LEN];
 	u16 resp[NUM_GROUPS_PER_RESP] = {0};
-	int ret, index, i;
+	int ret = 0, index, i;
 
 	fgroups = kcalloc(func->ngroups, sizeof(*fgroups), GFP_KERNEL);
 	if (!fgroups)

-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
