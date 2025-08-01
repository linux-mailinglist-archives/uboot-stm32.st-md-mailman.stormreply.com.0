Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07018B18046
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Aug 2025 12:39:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A7DFC36B14;
	Fri,  1 Aug 2025 10:39:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77478C36B12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Aug 2025 10:39:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso1174604f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Aug 2025 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754044754; x=1754649554;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LYzp0X/Lxkw/uBsGb2sxIi00jcrFv/9fFhZrhBGB2qo=;
 b=pKm+vqnAoMYU7+86DJFPP/FgUn7ZcNDfBwlkPZMpKkZ4ywMRpU+dSDMor6v86tmgJs
 FSnh3+yZ6mLW5XBZVT6vlgGwuUpl4bXEWhloQa2ciruVG3bsJZPTr+dl8fcTtVXjfJep
 yzvHAOexAmtROk3M29BR4/OVEl3im9j0PgAZbZcKhJTOJFlLbvN4lytIlpqGM5oZg4Q7
 gjhXm6DLCyZFsaaZCwHmdegIPUr4eyWqlUANbdPK8OYMlxy1pnMyQ1FZ9J/elwgZ2kaC
 yoURRKKw4sRLLqN77fyY0v9MllS2jBeatupyJ0DOznEIpmwzN0skmAq4sBhEDweGm1N+
 qqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754044754; x=1754649554;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LYzp0X/Lxkw/uBsGb2sxIi00jcrFv/9fFhZrhBGB2qo=;
 b=LJH+FbDdTz/f2fULHoq52xczDHfJ67/iJanKLsEH7ZM9iau15SuNYB6bkQFTbT8N3M
 5bQN9fkGueUjiPIXUJpQe8GCqD/hHflL0nxJDatrvXhqmoGCLRNK44pp/z33XxTH3BU9
 eESOevcozecssllACWt1do5z6kgQ92gq0SMSyCSiPG6SFLPVRpSW9z5prEeSWmChlEeA
 AUQYJ4VgAG505mfJXUM9IZyfI4FXc93lThUuPLgYP5v0ABwVlwEOO+CIboRC984VU8rd
 huBd+TuHeYqpQbisEwisQibvKZRfHqv/nTLrN6BxvjGcNdt04kM2dSnA8dDvd1AruorU
 Wvyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw4x5aI0x8QiOs7gEz58B+ygT3hAHeoOBgdSq9awcBMN0Kq8zzwiYvlM34CaIHWOBlgPyAp0bUt3AJZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxG1RlU3vUF9OzrU9RWb2k2C5v7aDM3cigJM9DV1y4pgC5czAcj
 JJf0EBak7sljFyEwhYlTFwJMIrGz6ZerF/Q/oAKHmgS5r3u3zL5feRjhMGlH7fN/PAQ=
X-Gm-Gg: ASbGncvfnhV6OstJpreMAgi7RlpR0IPzdGRK0TdjIcnYQgG/cWsr1AqkVBLixk/I4sj
 AHmr+uKDDVL9fCKL+QFVuWlwkrZ7llGHc5wlPbOURrWJpGEGBxfODa4TBwAi3t4AYD4nk8cQl5E
 KtpR8cHUlO+3Ia6BMg279nbzF8rsNeVNPZ7rlZ4ImdO16pm0Js9vwTY4ZSJhdVBI23Bikk3xArC
 SCG6HkJQPVkI07qrPeZgh4kiNcs0hFjkQJj6z7kdDnFxdfyiXWpbITHtS1OoOsKKlrW6rK/oMXE
 A+FfTCSDt6ZDT0ua8zRRzZmFlyzBDtCGo+dbW0mzDdqd0wHbPyPjJTn5cZTYB+zYdUVXtfq9gWK
 DP4p5rGGTbA8jLIyzj1ub9f27ppn1A+kRHhCPBVM972mR5bIrgIlM3agNxSw70g==
X-Google-Smtp-Source: AGHT+IFGbbU2o/kRtNbc0Vchg4h5/buxYfBKam2WXuRe3BLdk5OX4ieXzudL9gsgUaiTpHCA1U1PAA==
X-Received: by 2002:a05:6000:2c09:b0:3b7:890f:64bf with SMTP id
 ffacd0b85a97d-3b794ffdacfmr8507149f8f.51.1754044753731; 
 Fri, 01 Aug 2025 03:39:13 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:cc6e:5422:ab75:92e8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edf5638sm59830275e9.4.2025.08.01.03.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 03:39:13 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Fri, 01 Aug 2025 11:39:12 +0100
Message-Id: <20250801-mtd_nand_raw2-v1-0-bdabdeb35b46@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFCZjGgC/x2NywrCQAwAf6Xk7MI+EFd/RaRku9Hm0ChJ0ULpv
 3frcRiGWcFImQxu3QpKXzZ+S4Nw6mAYUV7kuDaG6OPZZx/cNNdeUGqv+Ivukq7J55hTCRlaU9D
 IFUUZxqOa0GbSQ3yUnrz8R/fHtu0QuikMeAAAAA==
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Tom Rini <trini@konsulko.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.12.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: [Uboot-stm32] [PATCH 0/3] mtd: rawnand: Fix some Smatch reports
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

Smatch reported some errors with memory being leaked on error paths and
also error paths lacking an error code to be returned.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
Andrew Goodbody (3):
      mtd: nand: pxa3xx: Free memory on error
      mtd: rawnand: stm32_fmc2: Ensure to return error code
      mtd: nand: sunxi: Free allocated memory on errors

 drivers/mtd/nand/raw/pxa3xx_nand.c     |  1 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c |  6 +++---
 drivers/mtd/nand/raw/sunxi_nand.c      | 17 +++++++++++++++--
 3 files changed, 19 insertions(+), 5 deletions(-)
---
base-commit: f5e968a28e7cdc2c4365f5a382e02f074ee03fac
change-id: 20250801-mtd_nand_raw2-739308283b18

Best regards,
-- 
Andrew Goodbody <andrew.goodbody@linaro.org>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
