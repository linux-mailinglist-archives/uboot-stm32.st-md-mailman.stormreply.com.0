Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F21605AA
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Feb 2020 20:03:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EDD6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Feb 2020 19:03:10 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44BDDC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 19:03:05 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id v19so14654683oic.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 11:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUMplnqdiJkKqbwNksuL2zezUvUGVO7x4qMW2ZLFFRk=;
 b=h97tnmgyTJolNRY3dXHDLwr1017+AV5iMCWym06XwFIznh9iL12pJCVaaRUYKEI0zY
 zVN+v7Vy+jgckEr3pgJ953jZmfvS6twX06TM4ZV0qP8s0jymp9VFHPNNzsCs78K/uF5P
 5KSmh5gqKyCbv65grSNNx3JLKQ/M0sN4e4R8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUMplnqdiJkKqbwNksuL2zezUvUGVO7x4qMW2ZLFFRk=;
 b=XMRCLftMeGrhJc/31G3802Guv2EijacUPiOf85ZgEIyFqWfBF/GIr+/hnouVDqCtfV
 GrlzVl5QfN29X7ziow5/KXEiP/xeW/jTnRblKW/BoU2QaQ3185DG5TY0BihsSnmLaMLS
 6pmagnQQycfcT74jRofbwJonJcESekZtB5nKvqjWM9YZ76kmV5rbXJDKTTPEf3MrQf+z
 nxEA6gEXMxNMHL3ntCGyEbRf2PZoXZbd6nZ4acdwOGbqcrlwF5gYN8gvPQ7nYe5gUSOr
 2WX9Es7QOrrNYvfFtyQrOI2jz+J9yCUwEFRTNSuSmwmCXRBBQzYUt3fpn/O+DtyEDzYT
 49Rw==
X-Gm-Message-State: APjAAAWmSfGwO/3MjuKCrnkbzsoqr7aysYOOEONcdfhHhc2YBnhsCnP5
 AwfWTm+5I3/21dSZ/xQnfPr6Z2OggFeJQ9fBkXiUjYui
X-Google-Smtp-Source: APXvYqxLpUBLsKbuvEbDi0SNZm40WGAdg2llFqQRUDclC3cQ+pv1p1R2df4eS25U4pJoqSkbCn6hDkxYHkHjcAAFvAQ=
X-Received: by 2002:aca:5588:: with SMTP id j130mr7673403oib.122.1581879783782; 
 Sun, 16 Feb 2020 11:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20200212184501.5911-1-patrick.delaunay@st.com>
 <20200212184501.5911-6-patrick.delaunay@st.com>
In-Reply-To: <20200212184501.5911-6-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 16 Feb 2020 12:02:46 -0700
Message-ID: <CAPnjgZ0ByqhFpQ+O6mVaJQB7=8ZKv0AOt4LqBTGegPd+4XQpcg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [RESEND PATCH 05/10] sandbox: support the change
	of env location
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

On Wed, 12 Feb 2020 at 11:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add support of environment location with a new sandbox command
> 'env_loc'.
>
> When the user change the environment location with the command
> 'env_loc <location>' the env is reinitialized and saved;
> the GD_FLG_ENV_DEFAULT flag is also updated.
>
> When the user set the same env location, the environment is
> re-loaded.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/sandbox/sandbox.c | 40 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/board/sandbox/sandbox.c b/board/sandbox/sandbox.c
> index 01f356be31..023a71d5f0 100644
> --- a/board/sandbox/sandbox.c
> +++ b/board/sandbox/sandbox.c
> @@ -21,6 +21,9 @@
>   */
>  gd_t *gd;
>
> +/* env location: current location used during test */
> +static enum env_location sandbox_env_location = ENVL_NOWHERE;
> +
>  /* Add a simple GPIO device */
>  U_BOOT_DEVICE(gpio_sandbox) = {
>         .name = "gpio_sandbox",
> @@ -53,9 +56,44 @@ enum env_location env_get_location(enum env_operation op, int prio)
>
>         gd->env_load_prio = 0;
>
> -       return ENVL_NOWHERE;
> +       return sandbox_env_location;
>  }
>
> +static int do_env_loc(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])

This should be a sub-command of 'env' I think.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
