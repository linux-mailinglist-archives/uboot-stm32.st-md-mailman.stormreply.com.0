Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7F22D8756
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Dec 2020 16:40:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 374A3C3FADA;
	Sat, 12 Dec 2020 15:40:20 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FE57C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 15:40:18 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id q25so11212734otn.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IOZ1lcKJMve90ufXr/HFAEXaSpRqHRgsniNn6piCzt0=;
 b=jX/DB7GPTVomb73tBOwgx4zbvUCk3ioFl+z4KJCGek06wV4et8G/Q4OizsLkfdlyAh
 yBZk/WVsithrEagYu6R7/DqCIeh9O7ukhbVw+53s1rQw4vkhamFY9yOOK5emepUrwTju
 8DXTehyXmiFabF2kIP6Gh0CKd+91NkCGe+2Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IOZ1lcKJMve90ufXr/HFAEXaSpRqHRgsniNn6piCzt0=;
 b=H5ULMfndsLFeUnaZ+8xwCeDjm8CVtFB21mHxtg7QgaQjPjyFBQ4OkjZ3JahLvZL0+o
 1/Vh5oGG92hzahq7vY4DBdALS1nfuC/g8KnMbf3UKriqHJ2IPryqIhV89WpiRYUjVDSC
 GBx9gVpwteo54GHX2pMEzMGSqVEFrp17UDlfO3R3DWSMd/6HLW5gxUe0Ek8+4a14DVP7
 LWeEofi8PhSqoMJd/sRR1xQ3ozG1lpaXHQbdsU5vlBdNexD6yv/ykPyEfxHVZTXKxAhJ
 WQa4OILz+2hM9TO91B4cmZLQxvySX0B/L2U1Q7ELGYOthSw8KteF+xBHtEcVRReYFq+S
 yFBg==
X-Gm-Message-State: AOAM5329dz0dEX9ewDJpqNz+b6SOhhITxMN2ng+jIV7pZUxDKZaT8kPv
 WPlibIuk70Gi8gFmV+50DLxMQrH89rTC6MlceCj+0g==
X-Google-Smtp-Source: ABdhPJy+ITfyHd/M81LSgKYIekMbyDs51cCgwcj2MsUp/2c6q+/8dl3/wG1BLfsrV/eGjXHvNM2VThnv4ieooGtFDBc=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr13732898ota.54.1607787617175; 
 Sat, 12 Dec 2020 07:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20201203092032.8124-1-patrick.delaunay@st.com>
 <20201203102027.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
In-Reply-To: <20201203102027.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 12 Dec 2020 08:39:11 -0700
Message-ID: <CAPnjgZ33Ahzy_LV8SniyU_=HVGLYggPBRmULMF_h2sLV3jbJwA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] console: remove #ifdef
	CONFIG_CONSOLE_RECORD
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

On Thu, 3 Dec 2020 at 02:20, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add helper functions to access to gd->console_out and gd->console_in
> with membuff API and replace the #ifdef CONFIG_CONSOLE_RECORD test
> by if (IS_ENABLED(CONFIG_CONSOLE_RECORD)) to respect the U-Boot
> coding rule.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> # Conflicts:
> #       common/console.c
> ---
>
>  common/console.c | 86 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 66 insertions(+), 20 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

But see below

>
> diff --git a/common/console.c b/common/console.c
> index 9a63eaa664..0b864444bb 100644
> --- a/common/console.c
> +++ b/common/console.c
> @@ -88,6 +88,56 @@ static int on_silent(const char *name, const char *value, enum env_op op,
>  U_BOOT_ENV_CALLBACK(silent, on_silent);
>  #endif
>
> +#ifdef CONFIG_CONSOLE_RECORD
> +/* helper function: access to gd->console_out and gd->console_in */
> +static void console_record_putc(const char c)
> +{
> +       if  (gd->console_out.start)
> +               membuff_putbyte((struct membuff *)&gd->console_out, c);
> +}
> +
> +static void console_record_puts(const char *s)
> +{
> +       if  (gd->console_out.start)
> +               membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
> +}
> +
> +static int console_record_getc(void)
> +{
> +       if (!gd->console_in.start)
> +               return -1;
> +
> +       return membuff_getbyte((struct membuff *)&gd->console_in);
> +}
> +
> +static int console_record_tstc(void)
> +{
> +       if (gd->console_in.start) {
> +               if (membuff_peekbyte((struct membuff *)&gd->console_in) != -1)
> +                       return 1;
> +       }
> +       return 0;
> +}
> +#else
> +static void console_record_putc(char c)
> +{
> +}
> +
> +static void console_record_puts(const char *s)
> +{
> +}
> +
> +static int console_record_getc(void)
> +{
> +       return -1;
> +}
> +
> +static int console_record_tstc(void)
> +{
> +       return 0;
> +}
> +#endif
> +
>  #if CONFIG_IS_ENABLED(SYS_CONSOLE_IS_IN_ENV)
>  /*
>   * if overwrite_console returns 1, the stdin, stderr and stdout
> @@ -420,15 +470,13 @@ int getchar(void)
>         if (!gd->have_console)
>                 return 0;
>
> -#ifdef CONFIG_CONSOLE_RECORD
> -       if (gd->console_in.start) {
> -               int ch;
> +       if (IS_ENABLED(CONFIG_CONSOLE_RECORD)) {
> +               int ch = console_record_getc();
>
> -               ch = membuff_getbyte((struct membuff *)&gd->console_in);
>                 if (ch != -1)
> -                       return 1;
> +                       return ch;
>         }
> -#endif
> +
>         if (gd->flags & GD_FLG_DEVINIT) {
>                 /* Get from the standard input */
>                 return fgetc(stdin);
> @@ -445,12 +493,10 @@ int tstc(void)
>
>         if (!gd->have_console)
>                 return 0;
> -#ifdef CONFIG_CONSOLE_RECORD
> -       if (gd->console_in.start) {
> -               if (membuff_peekbyte((struct membuff *)&gd->console_in) != -1)
> -                       return 1;
> -       }
> -#endif
> +
> +       if (IS_ENABLED(CONFIG_CONSOLE_RECORD) && console_record_tstc())
> +               return 1;
> +
>         if (gd->flags & GD_FLG_DEVINIT) {
>                 /* Test the standard input */
>                 return ftstc(stdin);
> @@ -521,10 +567,10 @@ void putc(const char c)
>  {
>         if (!gd)
>                 return;
> -#ifdef CONFIG_CONSOLE_RECORD
> -       if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
> -               membuff_putbyte((struct membuff *)&gd->console_out, c);
> -#endif
> +
> +       if (IS_ENABLED(CONFIG_CONSOLE_RECORD) && (gd->flags & GD_FLG_RECORD))
> +               console_record_putc(c);

Given your functions above I wonder why you need the IS_ENABLED()
here? Maybe even move the gd-.flags check into those functions?

> +
>  #ifdef CONFIG_SANDBOX
>         /* sandbox can send characters to stdout before it has a console */
>         if (!(gd->flags & GD_FLG_SERIAL_READY)) {
> @@ -564,10 +610,10 @@ void puts(const char *s)
>  {
>         if (!gd)
>                 return;
> -#ifdef CONFIG_CONSOLE_RECORD
> -       if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
> -               membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
> -#endif
> +
> +       if (IS_ENABLED(CONFIG_CONSOLE_RECORD) && (gd->flags & GD_FLG_RECORD))
> +               console_record_puts(s);
> +
>  #ifdef CONFIG_SANDBOX
>         /* sandbox can send characters to stdout before it has a console */
>         if (!(gd->flags & GD_FLG_SERIAL_READY)) {
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
