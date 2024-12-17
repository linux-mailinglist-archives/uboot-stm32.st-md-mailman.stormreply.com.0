Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AF9F525C
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Dec 2024 18:18:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A578C78014;
	Tue, 17 Dec 2024 17:18:19 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C522C78012
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 17:18:18 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7b6ef047e9bso500921185a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 09:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1734455897; x=1735060697;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kiLvdqwob+S6dj4vWqyXhy4ni3RY/T9JUKGB+qSTJn4=;
 b=CVdab0LBHJPrFrCnRZ5jlB9Q9usljVEWWjdOIBIkWYHA6mPSxFblkR93ILSzlhFgi0
 Nk+nBzfOQuBrCpyGpbmyposMj2enbPduik3uCQ3aAmN8z3smUEggSAmsvFVtGZKUte7K
 QMFGXjw2ZRutcXrMqkpSOdkZKqxZM5gEyxdrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734455897; x=1735060697;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kiLvdqwob+S6dj4vWqyXhy4ni3RY/T9JUKGB+qSTJn4=;
 b=PLy0u6H0ath3xz8O+dHLH3ballYLn04shOpi7XNSjdbNFH6UxLQoAehf/B309XNbYr
 lrO32lrD840Zev8HfdlOKrnWlTvDCUWVSvxurL+diKBjqX4AqizNKr/xMAAyMt5rCaKO
 nZeC8aP6svohIUGqXxhk92JCTSSf4USpK0SMu6o4pg3pwiNEdkV/R0jWIbc7FJ3P+O33
 y4xIpVVpIGNYf9Ak5RmsF/kJP31nZiI/YHO5H8Ay1t3xUtgbv+dOPr6/9vptQfinUCNG
 kFLIWbmFAr+s980NsSYN4r4wItm0Jwcr0kkPIeS0ckc4yxgWrAAZCd6h483lRkhLSnmM
 muAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK3n1m53Zptn+9cNwcVyOJu0wrE6mBFAIfKGhJxvfTvCofU0kZ3JVFQJfOswT4Ah1keDJhVFOgkNQwJA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzzcdTfAVcX5XHWNWyRwGsOwfUq9f5wjE2BG6Tlt3oHIwOdEctj
 c289kamNBs98FxAKayNC66jnzwhJFCTAOMgPWe7MvKs8YF2zR+wUIi8Bt5EYE74=
X-Gm-Gg: ASbGncuXTURGTbK/CO/Gpu1s+zSZYVCJGkxENsst5MBZhusMHQLDxlPPmJa62sPQ28u
 qmAyfjNWy8h0+BF55tv4j6hvlhAqT6SRZDvfl7pfqJQVXsaSRr9/OmNFFx/3YUyU+2DI8L2yJT2
 NDuyQ59nZjxpIdzN/KbFfvW+SeZMvxeydAUm4i3NdlDTxZnwt3KBpOZnoU8oIJoS+zPJKL3gavY
 FPGH7Ca9Za/nR4HlBiG9CBYYWG7MDb95/px2k3QcXSY25Qa4Bcdg94=
X-Google-Smtp-Source: AGHT+IE2Y+GQKfE6l3htnNGaLrVSlxYhdxY3wEJPQvSRGyfDnQgTamwH/iEANF3RmnLdcIji0FlCQA==
X-Received: by 2002:a05:620a:2985:b0:7b7:12e:48eb with SMTP id
 af79cd13be357-7b8596028ccmr699656985a.17.1734455897451; 
 Tue, 17 Dec 2024 09:18:17 -0800 (PST)
Received: from [127.0.1.1] ([187.144.29.192]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b7048bbe9asm336450385a.94.2024.12.17.09.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:18:16 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20241213132655.670837-1-patrice.chotard@foss.st.com>
References: <20241213132655.670837-1-patrice.chotard@foss.st.com>
Message-Id: <173445589585.4187054.717117017229929078.b4-ty@konsulko.com>
Date: Tue, 17 Dec 2024 11:18:15 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32mp: Fix dram_bank_mmu_setup()
 for LMB located above ram_top
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

On Fri, 13 Dec 2024 14:26:55 +0100, Patrice Chotard wrote:

> Previously, all LMB marked with LMB_NOMAP (above and below ram_top)
> are considered as invalid entry in TLB.
> 
> Since commit 1a48b0be93d4 ("lmb: prohibit allocations above ram_top
>  even from same bank") all LMB located above ram_top are now marked
> LMB_NOOVERWRITE and no more LMB_MAP.
> 
> [...]

Applied to u-boot/master, thanks!

-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
