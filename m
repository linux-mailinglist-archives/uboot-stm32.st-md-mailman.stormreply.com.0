Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74413BFCDC
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 03:49:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 439ADC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 01:49:09 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3FC8C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 01:49:07 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w17so3851646oiw.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2019 18:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KtEmpUYAFtxwO8q9B5b4oJ9Ph9+32LhimpWWcQu8NLU=;
 b=KXbhok86Xlx+SR+ckGAs6w4Zy3qJMS3ZB01vUSpyUpK/fxnSQRkyWL7s1gHdlAzUe7
 T1y1Ql5Qrp7kwfJ+lLlwUNV/cNTfYxUwIAulz4ZD0CcQsrq+uRHKmIeDKIfBMS4wG9zS
 ww2sJbYEs+k7etCx2Nprh1Sj9SExkFlc+giRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KtEmpUYAFtxwO8q9B5b4oJ9Ph9+32LhimpWWcQu8NLU=;
 b=XkPCuo1+mgai0xTImRDAJ6XQbLeTbQq0lcjQV+5AGOpZDvfwBSizs76l20VCBnihWF
 izjnIGPltPXwj/y7VipGPasemqyuLvUQ5P37jzrI6mt1b/xIVwBf0y4qMPv42fb9GcR9
 pOwCFDpCC0E2x5GewEI0SQvNisOdOn0xP1HV932ADp47YDwvXw1ZrIwt5MeF/c7IueBx
 yl7N7jz9YlUCtEjNVv6Py54E4+U+wrn/+qwqcgDQqMqJfWIFvuM7USAILXLChfKAvVQf
 vXsKMfa3NlhawXlVglbAAtdD8fRzzNG+cP8FgqbEygqUw4+xPFwZs7qx3ab7tGYSym5F
 yTUw==
X-Gm-Message-State: APjAAAXpx70TkwaFk5Lbu5YtFZcSOwLLwt6sQ62Oei5RAF5jiOSIbei5
 dfA2K8c4ROJTejEubUdiQc5PkMTRYreBIdoEqMgBWQ==
X-Google-Smtp-Source: APXvYqxJKZ2Ndabkb8uQpgeFnlL9LMeOYax42sULBqBTUe0AzzG+kLTi5g9IEpjwSOQgVG9rxDsElnEeU1wq87h3u3A=
X-Received: by 2002:aca:fd58:: with SMTP id b85mr4889821oii.94.1569548946217; 
 Thu, 26 Sep 2019 18:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190906070611.15122-1-patrick.delaunay@st.com>
In-Reply-To: <20190906070611.15122-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 26 Sep 2019 18:48:52 -0700
Message-ID: <CAPnjgZ2_UjyCqrVWDP=kGH0vpo6vdzGHsVeGsY1cYMf+S3dAjw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 Lukasz Majewski <lukma@denx.de>, Michal Simek <michal.simek@xilinx.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Adam Ford <aford173@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH v2] env: Add CONFIG_ENV_SUPPORT
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

On Fri, 6 Sep 2019 at 01:06, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add a new flag CONFIG_ENV_SUPPORT to compile all
> the environment features in U-Boot (attributes, callbacks
> and flags); it is the supplement of the 2 existing flags
> for SPL/TPL.
> To have ENV support, enable the flag:
> - CONFIG_ENV_SUPPORT for U-Boot proper
> - CONFIG_SPL_ENV_SUPPORT for SPL
> - CONFIG_TPL_ENV_SUPPORT for TPL
>
> This new configuration allows to use the macro
> CONFIG_IS_ENABLED(ENV_SUPPORT) in the code without
> issue and solves the regression introduced by
> commit 7d4776545b0f ("env: solve compilation error
> in SPL"); change_ok was always NULL in U-Boot.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - Update commit message after Lukasz Majewki review
>
>  cmd/Kconfig            |  2 ++
>  env/Kconfig            |  7 +++++++
>  env/Makefile           | 11 ++++-------
>  include/env_callback.h |  4 ++++
>  include/env_flags.h    |  4 ++++
>  5 files changed, 21 insertions(+), 7 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
