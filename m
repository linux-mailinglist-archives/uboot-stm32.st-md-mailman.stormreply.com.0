Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEC599310F
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2024 17:24:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFED3C6DD94;
	Mon,  7 Oct 2024 15:24:19 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68333C69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 15:24:12 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6cb3d2ce75eso48142496d6.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Oct 2024 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728314651; x=1728919451;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yAKla1S5BlCcyNB8Xg5CQvs/7VwYTyPQWuig19S66zQ=;
 b=e45e7Dz110MgsFx6GhYWOn3v0ZF45DLcmqgD6E/kKFdRqaZzSIHF7blgGmvdgggW1W
 ee8Qv28dAr2L8U2qkKQzHPfxXIB9vjwiSaUkOBGB27zL1wtPZ3wFnkA8jKfFVka3G7to
 hp8Ibk347Pvp0WMHAJusqQ72/9NCRp+QepAzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728314651; x=1728919451;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yAKla1S5BlCcyNB8Xg5CQvs/7VwYTyPQWuig19S66zQ=;
 b=f5sLNzex58DJnIdX3j5orra4Q0RQOmOks3cb/h0Wd9opEijv3ki7q9Al27rpJJ7zc6
 xwLAp95b32q3R/XVVAhSH5+FsOuGLCxBXIxIjcLAnItGmDg9x4G9pxdw9wbOsRqF5Sz6
 3C4LNxCx1s7o7yFd0G9UpDWxTFhKgUDCtnYePPPGN8afyRXWSMrkh1nDtaGfFSSh4Y4c
 Xq8LD9WCRDqQZ8qhLuObQ+ZdGC5SLl71m2KYz5FDxrZ3nKp9UdUbFL5NjrdbGHzwYwve
 sKVh1SDl3j8kNA8SlnNVkIeBRwqeqMyfN3Bg8xVlXyph0ZMcde2jj4eP+QwpC36MLko9
 Ammg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUjrz4RTsjaioLDxRi4I1vldt8v8ixxo0doB4UWtMe9pPw6s22inOvBVIbn6zAVV60Ihn2pqnc5+3Xsw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxU9QDT8g0eYEk3PLylJZUzejhGA4NlKgbG212ZKKB1UDN76cAt
 G5lBdKdx2R95dmxcgb4eEv3EPq+eWE+hfdfyAjI/PDEo9J/TiMvaMtTNEgbABQJXKapwiZBZrlf
 BAuG9C9umv8AJVpfnROFHxRG1FnlXM2I2ffix
X-Google-Smtp-Source: AGHT+IGlCI0esUn6WFDrnyz6f5TWIiNrv2S90Kk90Tw+RQ6VFsD5AlU+1KetJx8I8iU87c+RhhScMhthu/Fo6TdVqjI=
X-Received: by 2002:a05:6214:5f0d:b0:6cb:8239:b8b8 with SMTP id
 6a1803df08f44-6cb9ad34f7bmr245873896d6.1.1728314651287; Mon, 07 Oct 2024
 08:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241004230756.371153-1-marex@denx.de>
In-Reply-To: <20241004230756.371153-1-marex@denx.de>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 7 Oct 2024 09:24:00 -0600
Message-ID: <CAFLszTjfwF_WnzyScyAPw65ke=JUFj2rmnQfxqJVYF260+g+gg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Sumit Garg <sumit.garg@linaro.org>, u-boot@dh-electronics.com,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 AKASHI Takahiro <akashi.tkhro@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Peter Robinson <pbrobinson@gmail.com>, Tom Rini <trini@konsulko.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] Makefile: Drop SPL_FIT_SOURCE support
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

On Fri, 4 Oct 2024 at 17:08, Marek Vasut <marex@denx.de> wrote:
>
> The SPL_FIT_SOURCE is long superseded by SPL_FIT_GENERATOR which
> is long superseded by binman, drop SPL_FIT_SOURCE support as there
> are no more users.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>
> Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Peter Robinson <pbrobinson@gmail.com>
> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sumit Garg <sumit.garg@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> NOTE: Depends on https://lore.kernel.org/u-boot/20241004225916.361000-1-marex@denx.de/
> ---
>  Makefile                |  6 ------
>  boot/Kconfig            |  8 --------
>  doc/usage/fit/howto.rst | 11 +++--------
>  3 files changed, 3 insertions(+), 22 deletions(-)
>

yay

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
