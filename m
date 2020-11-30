Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D202C8EBE
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Nov 2020 21:12:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4BE5C424BF;
	Mon, 30 Nov 2020 20:12:29 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 158ABC424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 20:12:28 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id c80so15603654oib.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 12:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=836C09/2kXqdzEtzPlMbSiR+PyZffMUANF8rEIS/Mkk=;
 b=TQhh1k10vmRksVFQuA718vdTxXFwybze2yKR0Fkf46PxW+6TibLfWeiTwjIyLiAGGZ
 i18bTAe1Hn9DziiaLxieIdtmwnHH6fMGuLhV6ie+zUMvGDu18+JxRZcQWYFvq+pr6ImH
 XCEQyWYJvJ4Ya0bYHwlPUSPGqpsELYGp4YW5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=836C09/2kXqdzEtzPlMbSiR+PyZffMUANF8rEIS/Mkk=;
 b=Y+/EitEyrROMoD9CxGabyrpV72MUZ8vJo7e+JDQ3HcS0ox29l/jcBC8WXSzarVJwxH
 /Aj05LCRTZlxHs2VG9sYXrVXYZtBb3xu8EYuxmjtpo424Gv4TVFN1RT05KAfgDQRD0O3
 DdR7fksC+LIgsxj9VR+WUbtC4NEurw0qxaJwRjqGPOPVV5EwCipFCgYzQ2ZVKVe5Mbu+
 N8IimA4eyY0RyENsq3P3HMHZ7WlpzojMWLrlmUSv8RczzK/b/4fqkf1Q9AKI+X9LN16R
 gGEwlkuvI7W0zxuyJFDXqIVAkYrTn9oFE1zHkV2HqOEnXDScAquw/p2d8Ds9ASTuZJS3
 Sesg==
X-Gm-Message-State: AOAM5335K7lWjokC+WnpIidBWWAt2ZZBEDTrPFJvSW85hKqKfn9OsWrn
 ymiQfp9UL0tZ/1RDgLF8fnKFX+xzYzftfEzbgdE7Kg==
X-Google-Smtp-Source: ABdhPJwkm9sXHmGgaoZdGeNqeS82u49t785Au3PAQk/zgJnLXF+KmiBw8G+myLbUi51GMAY7DLh3bzmSEoJl5tm2Xt0=
X-Received: by 2002:a05:6808:8ec:: with SMTP id
 d12mr490731oic.150.1606767146578; 
 Mon, 30 Nov 2020 12:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-6-patrick.delaunay@st.com>
In-Reply-To: <20201127102100.11721-6-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 30 Nov 2020 13:12:13 -0700
Message-ID: <CAPnjgZ3F08GCMY+K4F8xVS7iFoyDZWY-MQv+OgMzYNfHXqMcQg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 7/9] console: allow to record console
	output before ready
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

Hi Patrick,

On Fri, 27 Nov 2020 at 03:21, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Allow to record the console output before before U-Boot
> has a console ready.
>
> This patch allows to test the console output in sandbox test
> based on console record.
>
> It is possible because GD_FLG_RECORD and GD_FLG_SERIAL_READY
> are 2 independent flags.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - Record all messages in console, even when dropped (NEW)
>
>  common/console.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/common/console.c b/common/console.c
> index 70579af042..c3d552bb3e 100644
> --- a/common/console.c
> +++ b/common/console.c
> @@ -519,6 +519,10 @@ void putc(const char c)
>  {
>         if (!gd)
>                 return;
> +#ifdef CONFIG_CONSOLE_RECORD

Can we use CONFIG_IS_ENABLED() here and avoid the #ifdef? We might
need to add some inline functions for the case where console_out is
not available. See global_data.h for some examples.

> +       if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
> +               membuff_putbyte((struct membuff *)&gd->console_out, c);
> +#endif
>  #ifdef CONFIG_SANDBOX
>         /* sandbox can send characters to stdout before it has a console */
>         if (!(gd->flags & GD_FLG_SERIAL_READY)) {
> @@ -533,10 +537,6 @@ void putc(const char c)
>                 return;
>         }
>  #endif
> -#ifdef CONFIG_CONSOLE_RECORD
> -       if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
> -               membuff_putbyte((struct membuff *)&gd->console_out, c);
> -#endif
>  #ifdef CONFIG_SILENT_CONSOLE
>         if (gd->flags & GD_FLG_SILENT) {
>                 if (!(gd->flags & GD_FLG_DEVINIT))
> @@ -567,6 +567,10 @@ void puts(const char *s)
>  {
>         if (!gd)
>                 return;
> +#ifdef CONFIG_CONSOLE_RECORD
> +       if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
> +               membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
> +#endif
>  #ifdef CONFIG_SANDBOX
>         /* sandbox can send characters to stdout before it has a console */
>         if (!(gd->flags & GD_FLG_SERIAL_READY)) {
> @@ -584,10 +588,6 @@ void puts(const char *s)
>                 return;
>         }
>  #endif
> -#ifdef CONFIG_CONSOLE_RECORD
> -       if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
> -               membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
> -#endif
>  #ifdef CONFIG_SILENT_CONSOLE
>         if (gd->flags & GD_FLG_SILENT) {
>                 if (!(gd->flags & GD_FLG_DEVINIT))
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
