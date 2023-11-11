Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0057E8A60
	for <lists+uboot-stm32@lfdr.de>; Sat, 11 Nov 2023 11:46:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5FB0C62EFE;
	Sat, 11 Nov 2023 10:46:30 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 831E3C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Nov 2023 10:46:29 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-53dd3f169d8so4418634a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Nov 2023 02:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699589; x=1700304389;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CgxVGGOB+3BbwmPrseQAJvzDHTtlNa1mCDW6GYXtv+8=;
 b=UFK1d/cU9J0uMNrNw+ZkyA5y3m5kwG6CglbljQfpBq1nH+Yh3gCegdpn5gVcCR2p+q
 vJA9re6ppTY0jPzkSaYpYH9ZjljvfPCkZMzKmuBt/Fvdr2+q4r3CuDN7cjjGOE3hjM23
 YaSZ8JmwVn9bBfr9ATucypeR3QsL+L7I1YMoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699589; x=1700304389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CgxVGGOB+3BbwmPrseQAJvzDHTtlNa1mCDW6GYXtv+8=;
 b=Nk5xGy5K55pjANIoOtU98mwboGHyWJ5XsL6C5b2Yp/Q6YlfYgaoVxDOfUKAnlyiN5K
 SyqjHwyzcxXUTgBXU+9kT1rPUpJx6xF50PKTfQmeRk+2N6ck5dnzyr2zQ9mqXCvkmUaY
 EApRrsPdAD4SfvqFDO845KfNpa5EecV+K/shBkySJifAcAv0HctqbdoM5l6pwDgi9PDC
 XK63Te4LvvLSLeI5BefEdIKlfLbgUo7QuwcH94oNiRsEgknsM5kxl5sAkHTzhOZofiSn
 AF2SnN6IuQP7yF8mUOyxU/w7G2TfMtcjlt1s9xAruNu8leUCTtkQrGlTwu8sypZulDfB
 1GNg==
X-Gm-Message-State: AOJu0Yylj5qHiuZTJlwH2yRHEf9kxyRoxORVyC9/vhT/YcQCmO1nDMHL
 mSxIM0VsdlRWpdDjnXjE6oV2lovu7UA6L3yDhDACLw==
X-Google-Smtp-Source: AGHT+IHV2/8b8l8P66/boov3E28zWcbdSOx4hZNUE0MyXZAYsdfS+HukPMcjGTP0CVRHFvv0zvUgWA==
X-Received: by 2002:aa7:de83:0:b0:52e:1d58:a6ff with SMTP id
 j3-20020aa7de83000000b0052e1d58a6ffmr1027385edv.35.1699699589024; 
 Sat, 11 Nov 2023 02:46:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a50f613000000b00542d3e470f9sm827534edn.10.2023.11.11.02.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:46:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 11 Nov 2023 11:46:18 +0100
Message-ID: <20231111104625.137511-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 1/2] clk: stm32f: fix setting of division
	factor for LCD_CLK
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

The value to be written to the register must be appropriately shifted,
as is correctly done in other parts of the code.

Fixes: 5e993508cb25 ("clk: clk_stm32f: Add set_rate for LTDC clock")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/stm32/clk-stm32f.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32f.c b/drivers/clk/stm32/clk-stm32f.c
index ed7660196ef0..4c1864193357 100644
--- a/drivers/clk/stm32/clk-stm32f.c
+++ b/drivers/clk/stm32/clk-stm32f.c
@@ -530,7 +530,8 @@ static ulong stm32_set_rate(struct clk *clk, ulong rate)
 			/* set pll_saidivr with found value */
 			clrsetbits_le32(&regs->dckcfgr,
 					RCC_DCKCFGR_PLLSAIDIVR_MASK,
-					pllsaidivr_table[i]);
+					pllsaidivr_table[i] <<
+					RCC_DCKCFGR_PLLSAIDIVR_SHIFT);
 			return rate;
 		}
 
-- 
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
