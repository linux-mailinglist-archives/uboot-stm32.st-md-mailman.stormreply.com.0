Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4467B998D
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Oct 2023 03:24:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74F2BC6B45E;
	Thu,  5 Oct 2023 01:24:01 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D54C1C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 01:23:59 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so81329066b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Oct 2023 18:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696469039; x=1697073839;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lnnHXM7Awuy64i4+I1dYkI770aSe3ytZwGuQhG55xQ0=;
 b=AWe6YHPZtQAlV7bNLCfbJ45dbrkY+25LZJVH+JpGTabZjs5KegMPjheiAjDYvYIsld
 wZ28ckPD9OGxfyt/sXNczynoIqNjH6ZvCR9nUC6i3v2WoeBjxZXrfgPVG4dFjSwhbOEk
 rNA9kon3jQBCpX9Z+B59bXaYSfpUJujmXTjig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696469039; x=1697073839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lnnHXM7Awuy64i4+I1dYkI770aSe3ytZwGuQhG55xQ0=;
 b=YePTGOEMAEXSl1yx8Icyj/mOYZaViXyHxuc7vBw3v3jtH6nLPvPZbjfY9ZgJQVJJZF
 +QQfzWD3vHtB5tMntd9r3St2xc5bpJZJNQoc5M5IFXdJHyG/5KUsS4biHt6lWB001JgY
 gnWLg9I/7na+P5ODV/4hbX3+QmnIYDP5CUL7FzUSbFutXeWLf7+SEPDqQFhs9YW2G61k
 wH5EhPqGgVATtgTp/IJE1iBZSb4DAiX7CaF5tscZdnCg0QLjisPWhuF9OAb8FLopfQMb
 w7RsB/gUkalO+rdOnbEgCsP/uwk8tm+14ezQdq6kXHnn3+i01hVQKAgNf+HRq9qrDd/u
 sUtg==
X-Gm-Message-State: AOJu0YyHcZqVBbVD+f8mwErbQyoun5eLaqHE03j2F6fC6hxA0vgiQpLc
 dIfF4+fBM5ZjTmsw0mKoI+j1edHuwitucKA8fNsS2g==
X-Google-Smtp-Source: AGHT+IGoOwC1jRqFdk9WVE4WCg9TtHYIncidYVAYe1lAIP+OroFzZT9HAjl8/HjKVreDWxMENplQK+oR/Z4oBH34Jeo=
X-Received: by 2002:a17:906:2253:b0:9a1:debe:6b9b with SMTP id
 19-20020a170906225300b009a1debe6b9bmr3312300ejr.35.1696469039101; Wed, 04 Oct
 2023 18:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230924203953.1829820-1-sjg@chromium.org>
 <20230924203953.1829820-6-sjg@chromium.org>
 <20230924232658.GM305624@bill-the-cat>
In-Reply-To: <20230924232658.GM305624@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Oct 2023 19:23:47 -0600
Message-ID: <CAPnjgZ2-ORog-+Onh1McptpMDrzccVc+BfByCMjp93wLqAms6w@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Peng Fan <peng.fan@nxp.com>, Michal Suchanek <msuchanek@suse.de>,
 Leo <ycliang@andestech.com>, Stefan Roese <sr@denx.de>,
 Rick Chen <rick@andestech.com>, uboot-stm32@st-md-mailman.stormreply.com,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michael Walle <michael@walle.cc>,
 Stefano Babic <sbabic@denx.de>, "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 05/25] treewide: Correct use of long help
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

Hi Tom,

On Sun, 24 Sept 2023 at 17:27, Tom Rini <trini@konsulko.com> wrote:
>
> On Sun, Sep 24, 2023 at 02:39:23PM -0600, Simon Glass wrote:
> > Some commands assume that CONFIG_SYS_LONGHELP is always defined.
> > Declaration of long help should be bracketed by an #ifdef to avoid an
> > 'unused variable' warning.
> >
> > Fix this treewide.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> [snip]
> > diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/mach-imx/cmd_dek.c
> > index 6fa5b41fcd38..25ea7d3b37da 100644
> > --- a/arch/arm/mach-imx/cmd_dek.c
> > +++ b/arch/arm/mach-imx/cmd_dek.c
> > @@ -393,11 +393,12 @@ static int do_dek_blob(struct cmd_tbl *cmdtp, int flag, int argc,
> >       return blob_encap_dek(src_addr, dst_addr, len);
> >  }
> >
> > -/***************************************************/
> > +#if IS_ENABLED(CONFIG_SYS_LONGHELP)
> >  static char dek_blob_help_text[] =
> >       "src dst len            - Encapsulate and create blob of data\n"
> >       "                         $len bits long at address $src and\n"
> >       "                         store the result at address $dst.\n";
> > +#endif
> >
> >  U_BOOT_CMD(
> >       dek_blob, 4, 1, do_dek_blob,
>
> This really doesn't read nicely.  I would rather (globally and fix
> existing users) __maybe_unused this instead.  I think there's just one
> example today that isn't "foo_help_text".

Hmm, what do you think about adding a __longhelp symbol to cause the
linker to discard it when not needed?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
