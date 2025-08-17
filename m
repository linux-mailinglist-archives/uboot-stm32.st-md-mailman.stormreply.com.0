Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D04BDB293D1
	for <lists+uboot-stm32@lfdr.de>; Sun, 17 Aug 2025 17:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 382B2C3087B;
	Sun, 17 Aug 2025 15:24:58 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B798EC32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Aug 2025 15:24:56 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-30cce8ec298so2941088fac.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Aug 2025 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1755444295; x=1756049095;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+nJBniU4GtYYUezok1DyGiqPIhuzT4dcno5GCLiMfDI=;
 b=EJ+ByH8xmQM25zWzYkhyFAqa1sFtbsvBthcSYBjcP1tplAMX+3rjIk2DMKAshNKxRx
 C1aVsChyhZe7g7vKKge6AXDGEWTrKG+hduc8U29EeET+Ms7vItn79JBYgFlFoNdu8YYM
 ZONQCoRLMiY1m5U6HsOcaC/0q3U2mnv5zZWC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755444295; x=1756049095;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+nJBniU4GtYYUezok1DyGiqPIhuzT4dcno5GCLiMfDI=;
 b=B3ITIPKra7W3KOUUlHKlU3ny9JgSjmcFmBEzJdmo8PPKerp3mTd1cTSdk3liEvhdq3
 2fonQPAnzjgHS9EAR2l1FYZHx24aq4VW8FGwJiS2MCoYXhpXYFtWhwcmrRtog19ySHQs
 fQXDBkW49IGdJflCzfO7+/A8X0/Dmy0fzzis9T77FskEKE0qMO7TTMj79JGmFYhpIJMY
 PEL8GUuKmNh6dGPN5gANpKGv9yD128Y8a+ovhjtJ63OPCgD+wPrR2tdab7wd7BtsuMW9
 Mrr8MAaJJtT7Qqr/NVGG7b39vgTr3yNJfgSHpJH30LQ0CHUINfnbLskym94Tb/DWB7JR
 DnPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqJNhaMNVpvFF5am4ibOPGZEVGwBUp95TfaNDAcQrlvIZZ/rSX67mWqo4LF64jc6Gc5vVtcL2/GgwDtQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCoX+8ITd0z4sCD8a99hc7zUC32hO3jnlc8zW1s6PsZjzk5o7/
 HUr+ZO2PIC7WSqUqazfaqT19gjGUOUo8LkP7IibVlXEcPWg0vhKfnkqoWgN/bqgchsw=
X-Gm-Gg: ASbGncvuDo+lPMABhCPShYGXR4qjbUB8iLnaGGnh8J0k83U6fXtCVKXGnnXOsTKCFVR
 GY9zERdEOwTti3LTzXNyeruC5bhlqqXHAW8zle5ysEy82itUyIHMfugjNP4m+VhYW3B0H9jCIwG
 NzZ31rUo2BFQn7GIgRf3UR6liQ7a5rSsYgAHGcRQ1i2fOMXzfh1VCfyGn3Xol2Oeo6pJgWUQNYj
 vlBRx5MJOqD0htOn4FcqUptWamE0Z239bpiXKnFz3/bcDhfLe37kmgjoiFcYno3CtzyOB+wC+Ar
 qGAkz2jW64acYPgPYn3HmHM8oZjO7WvzwhVooo5LtRV3VxuH32WQm7nNpiQeuWonNoOCFJ4X257
 6QdAjDZvO06jUm2QS4CQQp2Ld1bvrVVA8L1Dgv4JhOonfHIAM0mv5AXw=
X-Google-Smtp-Source: AGHT+IGr1+gEfL2N4IOZ8TLOqzYGjXFVfBGVwyk7yk98QKhWwqu9/80v/80TCzLKNLu3en7qp6WYfA==
X-Received: by 2002:a05:6870:6b06:b0:30b:be2b:3e2a with SMTP id
 586e51a60fabf-310aad24e38mr5978120fac.10.1755444295397; 
 Sun, 17 Aug 2025 08:24:55 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-310ab878a4esm1998472fac.3.2025.08.17.08.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 08:24:54 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
References: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
Message-Id: <175544429402.372553.2859196032702735983.b4-ty@konsulko.com>
Date: Sun, 17 Aug 2025 09:24:54 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] (subset) [PATCH 0/4] pinctrl: Address some issues
 reported by Smatch
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

On Thu, 07 Aug 2025 11:04:01 +0100, Andrew Goodbody wrote:

> Smatch reported some issues with pinctrl drivers. This includes
> unreachable code, duplicated code and uninitialised variables.
> 
> 

Applied to u-boot/next, thanks!

[1/4] pinctrl: single: Remove unreachable code
      commit: 64204ab107b51c60e490292ed1eda40a9a64d7d9
[2/4] pinctrl: stmfx: Remove duplicated code
      commit: 4a2f360bd280b2b5af1c5daffbc189590c83c995
-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
