Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A68993111
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2024 17:24:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C70BBC6DD9F;
	Mon,  7 Oct 2024 15:24:23 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A00D5C6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 15:24:21 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6cb82317809so35857666d6.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Oct 2024 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728314660; x=1728919460;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J3OJAtLtzmZ5rGDY3PnOo1eygelxfOnEod7KIbR9qQI=;
 b=IMaJNOGEui+43UEWiUc1jpTIcUnNOPsDahlwu8AD48iMC3ABsUMx0Dn0XGWXyMsGl9
 XvjKHbXbRzYV0Fmj9B7+wIB6asJ2aSw8XWoNxyiPOn3xJk3uKr/+KXugORpGmNi1xmVw
 Ru0x/L1Wt7Su/f3WwKqVrrS5IGd0qTe68w7VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728314660; x=1728919460;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J3OJAtLtzmZ5rGDY3PnOo1eygelxfOnEod7KIbR9qQI=;
 b=g+MrkGpEctfOhc7Az4q/zSyCOEiE2IGifcFJFNTDM28rhD+h1sP4W3GWP9RZglq2Q4
 xNoxh44COg3LyWzqwXMQBbQTjbWNrmNPJeJjMcK960V4boFfAO0iuvBB/JomuUDkchlf
 KNWVz7//ewuI/J0JrgLFjiKY7kpn1xlWDZMnrUM822+lxlIyz+BxnmCnS6Nqh/yRiAuE
 CRU88uNDbfNPUuWfeiDnC7Kt7LRg5N0w44aeX2QMchD7/rGyilGTIfbIf3VquuD50B6X
 +jWdqf+DBgJCCkv+I/C5+57RoOT+IxqiU7a/eavyh7LKQTuoKYHd++dOtj8nbm4q5h2O
 mqJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaHsHUHtXOL4KwXleR3qFTnhYqhubfXYKIPv990EqbFC8bNW9paMNnaFOJgzLzVA3YADqWDIiV+eIe6w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzj4+HvIewGHadDSQH3hNp0eYbO2d7UKr4993XCufc5hmD86SZ8
 ALAkzb2rbYTCYnuYS0yKvfpZajN7wA43gMxPCch5zGcp8lZWXCAdrhetogX4/ANiaxHzcC7iJUL
 3SQ/Rh47iUUoTJ7ve+d8DRfFJkYqvuwh6okal
X-Google-Smtp-Source: AGHT+IFfLvdcjqAW02MLleunyTHZHz6+OAfwS3RO5h5FamSwmdo+j9dbjinSFTXnk4AFioP7Y8cwYsyvfe9cYzGk/o4=
X-Received: by 2002:a05:6214:488d:b0:6cb:7104:f115 with SMTP id
 6a1803df08f44-6cb9a1f83fbmr186120376d6.11.1728314660608; Mon, 07 Oct 2024
 08:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241004230756.371153-1-marex@denx.de>
 <20241004230756.371153-2-marex@denx.de>
In-Reply-To: <20241004230756.371153-2-marex@denx.de>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 7 Oct 2024 09:24:10 -0600
Message-ID: <CAFLszTjiuQZc2S+uEppNLCboGVFPc=n-kRZH-Vxw85AUfawsgQ@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH 2/2] Makefile: Drop SPL_FIT_GENERATOR
	support
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
> The SPL_FIT_GENERATOR is long superseded by binman, drop SPL_FIT_GENERATOR
> support as there are no more users.
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
>  Makefile                | 18 ------------------
>  boot/Kconfig            | 15 ---------------
>  doc/usage/fit/howto.rst |  4 ----
>  3 files changed, 37 deletions(-)

Double yay. I didn't know that the last user was gone.

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
