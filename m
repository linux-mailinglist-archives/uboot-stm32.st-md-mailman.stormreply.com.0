Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E8E94D2
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAB0CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:29 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE2C8C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:27 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id t8so716793otl.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/KCrWrzzwDm3nrVNmBH7lcVK/C0LxpGLGf8hJhYOnMY=;
 b=WrdR4egeWXO7u8otxEFF8GZbPHBi9YRWG4d4Z0eDwEdqhnlsadY7J8ejI93MZd4kzD
 KCXvEzXe9iS+2c+rHzb0ssdeIg/dl8ciW1EO1FktYjo3LnVD7rAqLTRofyHwpRQM/6uX
 qHhF+xb8HI83WFOoRDu7LKnXYAe12vLp5NAow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/KCrWrzzwDm3nrVNmBH7lcVK/C0LxpGLGf8hJhYOnMY=;
 b=Amnp4nSJXrL0qIc3wj5O0OioGaST/tqJHcoedjhWHHuf7QEDudv+BY1Bkcv7qkuGAq
 4ym1zUsPOEnpoZpOHL7393NKxUA0F0jSg1T4saL/Pg1fmiDHeJCDOHs9ahKpyeQwG27M
 UzDU7c3/Ivbrax9Ao9l+1SDw6GY9CiYFTg0A+nqoN2ZlorLLZHZDOWzbPN2lEltQD0s3
 A5mRCoRYZ04G02X+pPbUA2aUnmhrS2F2iS9zmrlyx5fqrChW7O//YBdKm+LtAnYT+b5e
 DHLbrYfGn5vv/wcmsPRs61fHUz8j4QvqgQqaEcBNEYyok+d/zdDIwb3apdKT+lCLwXEm
 sigg==
X-Gm-Message-State: APjAAAXOBXYS645hTUos8XeAg+evHlH4wAOvLtLlslEzZ3XUZhybsLLu
 Pp6rlVcVrvlr9C6Yh26orUfMZ7HP2TRUJx003jew6w==
X-Google-Smtp-Source: APXvYqxl9Ysu36u/wX/ZubzpbT3ov0n61FkAatFWxY1N629dp6y9sGzThJK/ErmHOAHHesxS7PVprGBhwrM2UiMHntc=
X-Received: by 2002:a9d:7ac5:: with SMTP id m5mr20569786otn.356.1572400106040; 
 Tue, 29 Oct 2019 18:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-10-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-10-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:13 -0600
Message-ID: <CAPnjgZ2HcF12fK+6VJeVZSQfeeNh=gHMRfjVJgiJ3MPpGnSajw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 09/13] test: dm: update test for pins
 configuration in pinctrl node
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

On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add test for "pins" configuration in gpio uclass with set_state() ops
> and test for generic parsing of pinconf_param array).
>
> set_state() is called by:
> - pinctrl_generic_set_state
>  |- pinctrl_generic_set_state_subnode
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/sandbox/dts/test.dts         | 25 +++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-sandbox.c | 14 +++++++++++++-
>  test/py/tests/test_pinmux.py      | 28 ++++++++++++++++++----------
>  3 files changed, 56 insertions(+), 11 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
