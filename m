Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B83605437
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Oct 2022 01:52:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4DAAC64101;
	Wed, 19 Oct 2022 23:52:00 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3E71C55596
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 23:51:58 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id t25so11833734qkm.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 16:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s27CZWbp3CMsEUJIF/UZ8bHML5+uemRr5cEYp6EmiH8=;
 b=QIKu+3+9gtQIZCHUNnjHX3z3QFhCVfZzTB7P3DEeJJAm+xik9ihcKtu8ufhaY7XtR2
 llNT5jsAMPGZDdZmkI+VAroCpANEZYLWKnekRxPGIossRrhzoPdhFab0FhQGEZ7jeMBH
 CSIfJZGpMYuayCYkIx58w8Rhz0dBwoHLsb6aJPCYx513XaeuY4T3EQYZjyhQ6lsj2X9H
 yLkrXeHflCG087lVSCJcChwQyhxdN/AOOFkwykx7qihRdswSocFHvsS02dOF1PZppq51
 JlIt6r6fUh0NidfChVwvRXqao+pURIVDNKMSNI52yzhro7ee/ze/y7jt4lhcu/mzEI5d
 2L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s27CZWbp3CMsEUJIF/UZ8bHML5+uemRr5cEYp6EmiH8=;
 b=3Jj5FV68p5GFlNsvn63lIfkO1bU5DzzKQd9U4BMc0ERGYqTdpXiuu7ExrBR3Dx5A8g
 DVYS1M4R7RhzYOTLy4rAU5k8wjbgBzXk9EoSonyGaT1hSsXgZ4X4Nf//KWq32rZldNHV
 q27a6QVPDAlGt6sM9VBkpnSl0sitQjBWOUdq7si1kZel697CteyTRyZ4Z7g00r/9Iw2Z
 rHF4FO0csZ6/Y5ZxUzZdDc/IN2v+RAf20iJJt6SyhwGMTa1WrHCh4Fy/L90CFKSZYuOR
 Lf7a/UcvTXfU9kE+duPkFB/JwW6sdmrMLMA34RwE3K2oRBjYPYeADx8Zf2oR4X1B9UKs
 JQig==
X-Gm-Message-State: ACrzQf3aujhYnNUO84cfh5ogWfCefDCIFrSbQvT20oalEynrJUnGiP1v
 KAJz0QO1vZn2yHByuggVc8Y=
X-Google-Smtp-Source: AMsMyM5ffJYbKx3LNdk1iaST6daNC4+GizNi7ata3s/s2EtRIZES8/appaCPfe/SWaJ3dvPTfh0tDQ==
X-Received: by 2002:a05:620a:1a04:b0:6ee:93fc:b44f with SMTP id
 bk4-20020a05620a1a0400b006ee93fcb44fmr7497032qkb.756.1666223517678; 
 Wed, 19 Oct 2022 16:51:57 -0700 (PDT)
Received: from localhost (pool-173-73-95-180.washdc.fios.verizon.net.
 [173.73.95.180]) by smtp.gmail.com with UTF8SMTPSA id
 bn39-20020a05620a2ae700b006cddf59a600sm5857371qkb.34.2022.10.19.16.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 16:51:57 -0700 (PDT)
From: Sean Anderson <seanga2@gmail.com>
To: u-boot@lists.denx.de,
	patrick.delaunay@foss.st.com
Date: Wed, 19 Oct 2022 19:51:52 -0400
Message-Id: <166622340324.1195700.9447852317648931534.b4-ty@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220620153717.v2.1.Ifa06360115ffa3f3307372e6cdd98ec16759d6ba@changeid>
References: <20220620153717.v2.1.Ifa06360115ffa3f3307372e6cdd98ec16759d6ba@changeid>
MIME-Version: 1.0
Cc: kristo@kernel.org, sean.anderson@seco.com, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, t-kristo@ti.com,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2] clk: update clk_clean_rate_cache to
	use private clk struct
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

On Mon, 20 Jun 2022 15:37:25 +0200, Patrick Delaunay wrote:
> In clk_clean_rate_cache, clk->rate should update the private clock
> struct, in particular when CCF is activated, to save the cached
> rate value.
> 
> When clk_get_parent_rate is called, the cached information
> is read from pclk->rate, with pclk = clk_get_parent(clk).
> 
> [...]

Applied, thanks!

[1/1] clk: update clk_clean_rate_cache to use private clk struct
      commit: 1d2e59101887e9af7ba41bc4b94d4e4e431e2593

Best regards,
-- 
Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
