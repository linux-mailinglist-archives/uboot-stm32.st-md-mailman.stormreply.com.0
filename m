Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A3B1489A
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BF1DC3F931;
	Tue, 29 Jul 2025 06:49:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5FB4C32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 11:37:39 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so5559815e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 04:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753357059; x=1753961859;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tavawb6UbZESjqhA8MVNvd4nDHqluf+xtxrYIIODa/U=;
 b=ZgjxLhKMQtJ3A6reCcPPZyNb2Bm4Qc5EgogtxxxWAYtLEl7N+oNyRKKLded3s0+Sdb
 eee+1tb2lRW+AbLih+TZDBsHRtC/g0K8ZOBqSdF9SOVjPudso89p4kV6iizWdwTCw+Es
 GmgjVN40HJEuP46RqoNJTqVZ7DBUS0zJHKN9jh1TqIZrHQZK0RlicveJXSJdS0HEHGmX
 3SFaVnyHoPc4r9HL0hiyECIpQVaetFVxDzFHlIMyoxtPA4egwGWhHS0uv34qRFglptbV
 fMpM+H37MgQkDKn0m4ictpTRj9fdItom0jbdenYmjgcZ0GxkbJGl6wg3estK+QDR0HBf
 BKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753357059; x=1753961859;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tavawb6UbZESjqhA8MVNvd4nDHqluf+xtxrYIIODa/U=;
 b=CkoJKwnzPDBRiwHZUxG5xAnpIL4nMw5uyHTpsY0pYGHtymqmpwKI79ZOuut4IDOkQd
 0UsSUF2ry7qLnCVqs/Dk9HtSpN8U3Z26Q3je9fJkF2s+OD9mjOvQFK2N4YERwm+2OB3t
 FJvFvs0cJRyqAHae5huheKGCpYif4j9XpQRBEo2QZWXNv0YZi0D3nqgf9wk4zQsMTqfF
 vrPPu4VxvbKp0a7p0CTdr9tswh99ICCduAiJcyV11Lt8ObGQ0h8Uwz7vvfvpCcAMG4kc
 3vsFDe2t75ixg+BwKdKhX56vTdCxPG/jRSnK9bD9dfs3E3HltKLjdVu6U7Mwo0+RIxAa
 jcxw==
X-Gm-Message-State: AOJu0YyLCk0EutGyQEZmz7WvW0B8QY2CLq3rVOzivzunXN08ybhFiAjY
 HZDdJjYSG2/lnbdkT2pc3dIb9fnWDnHT+FEQtj7epDNoU3/pGSq2si+i4PsnDrnCuTY=
X-Gm-Gg: ASbGncv7K3gaOLXQQ4fWcQm3Nofz1HxJ2VzJer/F9dcT1O8ep/HtxYa5AJ11n9qzTJJ
 4VAOUR8AFJKqwbBHLyBduHli1/z9o3hug+Ed6vSULb+0C8dEWcpQ5XieOG7LyO8+hUB5xFxsn7I
 p7Ywd0qwqCW09chqCdk0872VkWSJp/Q10MmspjbKWx/qtiCfoyY3YtWw6yOV4zZEPNlVCSfcAyY
 E6A46xhmK43tamYXhgAeSvU4LiAmBtcPVZZBjWDq9rJkn/ZwumN5FhBk2+yj1ROfoRrFOKLmG16
 0I4MsivVTdOGAWTCX1G7xPNGxIrcy+n0yhM+AYNd3csyYHIdvpkSifRWO21Mle8h2OoY2yvvyd8
 Qe32L5uj7JLYbqjGlCLj5vlT2F3JtFgeQ+1NF4MbXSUpEDHpR8Ho=
X-Google-Smtp-Source: AGHT+IEw4iHqJh6Ei5lkkIxQHxUu3cEuE8y5MLFC1QLb+YgKVC4L9LlVV20dGLX/KwC9GrUNVMfGyg==
X-Received: by 2002:a05:6000:2288:b0:3aa:c9a8:a387 with SMTP id
 ffacd0b85a97d-3b768c585a3mr5586666f8f.0.1753357058968; 
 Thu, 24 Jul 2025 04:37:38 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:e4d2:a911:6ad2:b1ce])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc60585sm1935490f8f.5.2025.07.24.04.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:37:38 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Thu, 24 Jul 2025 12:37:38 +0100
MIME-Version: 1.0
Message-Id: <20250724-clk_stm32-v1-1-c12dd33d28c2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAEbgmgC/x2NUQqDMBAFryL73UC6sYi9SimSxI0u1ii7Ugri3
 Y39HN48ZgclYVJ4VjsIfVl5yQXutwri6PNAhvvCgBYftsHaxM/U6TY7NMG2Te8wuUQtFD94JRP
 E5zhej9nrRnINq1Di3z/yeh/HCReqSQF0AAAA
To: Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.12.0
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:49:34 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: [Uboot-stm32] [PATCH] clk: stm32: Wrong macros used in register read
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

Smatch reported a warning about a shift macro being used as a mask. Make
the obvious changes to make this register read calculation work the same
as the previous ones.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
This fix is somewhat speculative as it is being made without
reference to any manual.
---
 drivers/clk/stm32/clk-stm32h7.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
index aa3be414a29..df82db69738 100644
--- a/drivers/clk/stm32/clk-stm32h7.c
+++ b/drivers/clk/stm32/clk-stm32h7.c
@@ -549,8 +549,8 @@ static u32 stm32_get_PLL1_rate(struct stm32_rcc_regs *regs,
 	divr1 = readl(&regs->pll1divr) & RCC_PLL1DIVR_DIVR1_MASK;
 	divr1 = (divr1 >> RCC_PLL1DIVR_DIVR1_SHIFT) + 1;
 
-	fracn1 = readl(&regs->pll1fracr) & RCC_PLL1DIVR_DIVR1_MASK;
-	fracn1 = fracn1 & RCC_PLL1DIVR_DIVR1_SHIFT;
+	fracn1 = readl(&regs->pll1fracr) & RCC_PLL1FRACR_FRACN1_MASK;
+	fracn1 = (fracn1 >> RCC_PLL1FRACR_FRACN1_SHIFT) + 1;
 
 	vco = (pllsrc / divm1) * divn1;
 	rate = (pllsrc * fracn1) / (divm1 * 8192);

---
base-commit: 3532f1f5edfc97c9dcea723cdeb732eda44bc669
change-id: 20250724-clk_stm32-b097d32f3fe9

Best regards,
-- 
Andrew Goodbody <andrew.goodbody@linaro.org>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
