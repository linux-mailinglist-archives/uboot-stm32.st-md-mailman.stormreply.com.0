Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C2F7E8A61
	for <lists+uboot-stm32@lfdr.de>; Sat, 11 Nov 2023 11:46:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFC21C6C837;
	Sat, 11 Nov 2023 10:46:31 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FE1CC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Nov 2023 10:46:30 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so4505681a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Nov 2023 02:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699590; x=1700304390;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ScYicUFHb+qoluDbgLSAgAArMfhmqdSv2yQ/g84t7ys=;
 b=aXaTDFsD5lp+RdYd86K4nxOb1vTmcqaf98pHfF2keBxRCr75kGww3EZfaSgxnNtbZ3
 p+ffxKxRtAk/KD3iDI/vmHsytW4xrKm09dJkRG2f6AForzYvRKteXjpvuCr0cz+alBDQ
 jMVvLEMprFyvr2WXN6DYlLfQDs5cnr+fNn84Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699590; x=1700304390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ScYicUFHb+qoluDbgLSAgAArMfhmqdSv2yQ/g84t7ys=;
 b=n80afMObp01qrgdFNIfKuGvEE5JGmCZh8zjVoNwcPw9vsWTJJNUaU//4bgRFLYdao8
 Ji9stLFUBRnZ6jRVuGv2wCcaDsNYODiEbg478Qj+L0LFMDlril/K5YYNooUzwGO1vODl
 st8Tj1UHJeanzzX/kSUB/1WMLbSG+P+RuNbINSLlo9Go2LbY9k1eKaURpY1HkGzQ0C+U
 XPdR24oyUz5kXndZHholmprdV2AdUUu/PuvZboLunzFNRdViO+QD39H0nkfX+54OzQ0W
 9EWTWdPgz3iwwdfVsn0QvWsfuZpSvlzxHWrvCUgtXMplO1BiGH4t5afyfgxtoihiBMLx
 T8fw==
X-Gm-Message-State: AOJu0YxG9JHG0qxxNl6I91qrGCNRiXHn+35C80vkVs0mR5h7VHsbRG0I
 eumkpsS+7/xvhEYvLpPs5exxiw==
X-Google-Smtp-Source: AGHT+IEPaTNngDVafeuHj8t4A+vhM0VmSP+1FdOomfw9kd+6vOdUpo7HnD5tHqn+eXIvU/I70aeoBQ==
X-Received: by 2002:a05:6402:510:b0:543:7256:6370 with SMTP id
 m16-20020a056402051000b0054372566370mr1234240edv.23.1699699590143; 
 Sat, 11 Nov 2023 02:46:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a50f613000000b00542d3e470f9sm827534edn.10.2023.11.11.02.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:46:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 11 Nov 2023 11:46:19 +0100
Message-ID: <20231111104625.137511-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111104625.137511-1-dario.binacchi@amarulasolutions.com>
References: <20231111104625.137511-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 2/2] clk: stm32f: fix setting of LCD clock
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

Set pllsaidivr only if the PLLSAIR output frequency is an exact multiple
of the pixel clock rate. Otherwise, we search through all combinations
of pllsaidivr * pllsair and use the one which gives the rate closest to
requested one.

Fixes: 5e993508cb25 ("clk: clk_stm32f: Add set_rate for LTDC clock")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/stm32/clk-stm32f.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32f.c b/drivers/clk/stm32/clk-stm32f.c
index 4c1864193357..d68c75ed2013 100644
--- a/drivers/clk/stm32/clk-stm32f.c
+++ b/drivers/clk/stm32/clk-stm32f.c
@@ -522,18 +522,20 @@ static ulong stm32_set_rate(struct clk *clk, ulong rate)
 
 	/* get the current PLLSAIR output freq */
 	pllsair_rate = stm32_clk_get_pllsai_rate(priv, PLLSAIR);
-	best_div = pllsair_rate / rate;
-
-	/* look into pllsaidivr_table if this divider is available*/
-	for (i = 0 ; i < sizeof(pllsaidivr_table); i++)
-		if (best_div == pllsaidivr_table[i]) {
-			/* set pll_saidivr with found value */
-			clrsetbits_le32(&regs->dckcfgr,
-					RCC_DCKCFGR_PLLSAIDIVR_MASK,
-					pllsaidivr_table[i] <<
-					RCC_DCKCFGR_PLLSAIDIVR_SHIFT);
-			return rate;
-		}
+	if ((pllsair_rate % rate) == 0) {
+		best_div = pllsair_rate / rate;
+
+		/* look into pllsaidivr_table if this divider is available */
+		for (i = 0 ; i < sizeof(pllsaidivr_table); i++)
+			if (best_div == pllsaidivr_table[i]) {
+				/* set pll_saidivr with found value */
+				clrsetbits_le32(&regs->dckcfgr,
+						RCC_DCKCFGR_PLLSAIDIVR_MASK,
+						pllsaidivr_table[i] <<
+						RCC_DCKCFGR_PLLSAIDIVR_SHIFT);
+				return rate;
+			}
+	}
 
 	/*
 	 * As no pllsaidivr value is suitable to obtain requested freq,
-- 
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
