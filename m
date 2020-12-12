Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970D2D8753
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Dec 2020 16:39:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5EFCC3FADB;
	Sat, 12 Dec 2020 15:39:26 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F8DFC3FADA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 15:39:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g185so11301768wmf.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 07:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWKZsWfm7lJVovAaPBDqIg/eqyPiRjhvUN6cf7pdc8c=;
 b=WaHwHP3hlcYom0yZwx1UwF00Ppi79y67KZmy8ktNqWxkCURPhc7gPGwHpmViQ5mEMc
 3eCYyRfY/eK88uteyxqu6ugXlKiFgkqxwEx4hWfnt7vip4vJVRs5/mSE8jSfNcl5dnM8
 uJxMWSgvl+Rt35V0djeteHZ/Waa6X7Uk3v9bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWKZsWfm7lJVovAaPBDqIg/eqyPiRjhvUN6cf7pdc8c=;
 b=dUXwDg2jw87Yg3rZOmzsUjgLpMR6jMsu+fRlydRUHJF5rpghZI0sGTpCUXPr2uCCIb
 pZDK6+WTTVfyLk6NXOOV6A8FBbA638ljla1C6ImOukxOZttzI6KtcClfsLU1r0T34rtT
 O4AsL1QDNALA1h9XcWuEpRSKz4XYwaHkQOKA6SmaJ0/LVjtq+9jgPXyCthBRziU0PGt7
 aBr5Vgw7oH4/KdgXnWqYXiP1+qryUteh8xyukqS+/AtO5wiIZ5Wi73/bIfMm4e7HF7Wz
 Clhs7eKtVIdu+hbyEdR/gMyhmw1hqeatsuJaDXTIH6VQcP9oYxpWn1/FUS5hd0CINJLP
 saPw==
X-Gm-Message-State: AOAM533nlBe6tkiC2f9JpE4EfdQQvPshf+4vPG8ILsMMtoceLyJt7PdS
 bOHwN4Y+qEuiYEjp12yay1OhTGfzAtnwFbeeNrVXiw==
X-Google-Smtp-Source: ABdhPJxRn5iSSK/WzydSGfK2ZMkWnpdXwh/YbTBbabKFjAn3LqkbgtvnuwgeQwFC6zHqhnl0aExNN/Rv4YiTCbym0nQ=
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr19371713wmg.168.1607787565547; 
 Sat, 12 Dec 2020 07:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20201203092032.8124-1-patrick.delaunay@st.com>
 <20201203102027.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
In-Reply-To: <20201203102027.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 12 Dec 2020 08:39:13 -0700
Message-ID: <CAPnjgZ3ZK8yEYe5+ijTNNX3miwfZ2uex3Ro1WX=XzoSoBWg_HA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] console: add console_tstc_check
	helper function for CONSOLE_MUX
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
> Add the helper function console_tstc_check() and replace the test
> #if CONFIG_IS_ENABLED(CONSOLE_MUX) to a simple if to respect the
> U-Boot coding rule.
>
> No functional change.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  common/console.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/common/console.c b/common/console.c
> index 0b864444bb..c570cd88cf 100644
> --- a/common/console.c
> +++ b/common/console.c
> @@ -248,6 +248,12 @@ static int console_getc(int file)
>         return ret;
>  }
>
> +/*  Upper layer may have already called tstc(): check the saved result */
> +static bool console_tstc_check(void)

This is checking if we actually have a device, right? I think
has_tstcdev() would be better.

Also could you add a comment in the testcdev variable declaration as
to what this variable actually is for?

> +{
> +       return !!tstcdev;
> +}
> +
>  static int console_tstc(int file)
>  {
>         int i, ret;
> @@ -340,6 +346,11 @@ static inline int console_getc(int file)
>         return stdio_devices[file]->getc(stdio_devices[file]);
>  }
>
> +static bool console_tstc_check(void)
> +{
> +       return false;
> +}
> +
>  static inline int console_tstc(int file)
>  {
>         return stdio_devices[file]->tstc(stdio_devices[file]);
> @@ -397,18 +408,19 @@ int fgetc(int file)
>                  */
>                 for (;;) {
>                         WATCHDOG_RESET();
> -#if CONFIG_IS_ENABLED(CONSOLE_MUX)
> -                       /*
> -                        * Upper layer may have already called tstc() so
> -                        * check for that first.
> -                        */
> -                       if (tstcdev != NULL)
> -                               return console_getc(file);
> -                       console_tstc(file);
> -#else
> -                       if (console_tstc(file))
> -                               return console_getc(file);
> -#endif
> +                       if (CONFIG_IS_ENABLED(CONSOLE_MUX)) {
> +                               /*
> +                                * Upper layer may have already called tstc() so
> +                                * check for that first.
> +                                */
> +                               if (console_tstc_check())
> +                                       return console_getc(file);
> +                               console_tstc(file);
> +                       } else {
> +                               if (console_tstc(file))
> +                                       return console_getc(file);
> +                       }
> +
>                         /*
>                          * If the watchdog must be rate-limited then it should
>                          * already be handled in board-specific code.
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
