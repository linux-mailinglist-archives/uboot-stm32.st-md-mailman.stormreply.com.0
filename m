Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2F2AF3A8
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Nov 2020 15:33:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0306AC36B36;
	Wed, 11 Nov 2020 14:33:09 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00413C36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 14:33:06 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id f16so2276772otl.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 06:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e/Q0G5mDSfII7ou1JyswUNL+WW2+6qYwXUBGqG8nvFY=;
 b=g/xXy7H3Hl+WixcwzicdLP+eFmeoCL5hKc/ZJZDhnWfSN0GNWNshL/JQ1dBwCsKgDl
 cvuA4cFIwI7V9z82NguT221A6YRR6Mc7g+7wrJt2PGDaoLX+NbDaSnU1da76WmCTYsXA
 F3S2Jw8PmguS7YwEt8JXplVqfZy2AUejrqfJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e/Q0G5mDSfII7ou1JyswUNL+WW2+6qYwXUBGqG8nvFY=;
 b=ABGmTy2wftnkZb+tNBv9K/5E2Jy3gB3B1MLfAaBEWjWIKJ/0vEAayHrlT4q16WC87b
 9W+uzBZqfHo3HSfFQPgowcK6rbDBoQ8LMEqxBC1q+bw8iFYqdd57AV32PEth1SkerGtG
 6bA+VKU8q5RlR0PLEzgmVi7I3HI5XbC7xbjPXf9kTDF59kcVy4CuSBPK81H2/6TinQle
 jnFVcD8suxk3Hgie3cImWUjIWnEHQNIvb+Pm2iGP/CLmNXSdgR4O79+J+ZNwOgVwwWDS
 KBjhs1RySRwimgLFRQoWJHGfDt3ULi3J1FkIWRwq1ETJdGdbY4gFa0ADau+jfBvbyxTm
 uVeQ==
X-Gm-Message-State: AOAM530RvkyQNbfYDYdoylrbgCwMyAh9KnCjQDc/j2ZeT7eUSyv6Aj2h
 Bpx8aBy7d9RZgflw90i78KrqAKE/K9yHtCZ4CYM5eQ==
X-Google-Smtp-Source: ABdhPJwKqYlZTVNvkThaj6cJ6HKKu7fRzQxxe9oWuEZdqoonpHpI6NJpZRzRtnoVAtB4+JM1gYUReTmkrsIr8ZGVi/w=
X-Received: by 2002:a9d:6c0f:: with SMTP id f15mr18903208otq.54.1605105185505; 
 Wed, 11 Nov 2020 06:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20201106175339.30683-1-patrick.delaunay@st.com>
 <20201106175339.30683-2-patrick.delaunay@st.com>
In-Reply-To: <20201106175339.30683-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Nov 2020 07:32:02 -0700
Message-ID: <CAPnjgZ1WOvuw5E04ncJVSqWSAoCbT4i-1FeW=Ob-3L9+VE2J6w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/3] log: use debug uart to output trace
	before LOG init
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

+Heinrich Schuchardt

On Fri, 6 Nov 2020 at 10:55, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Use the debug uart functions to output the traces before
> the log initialization (when CONFIG_LOG is not activated)
> as it is done in puts/putc function in console.c.
>
> This patch allows to display the first U-Boot traces
> (with macro debug) when CONFIG_DEBUG_UART is activated
> and not only drop them.
>
> For example for traces in board_f.c requested by the macro debug,
> when LOG_DEBUG is defined and CONFIG_LOG is activated.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  common/log.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

Again this needs a sandbox test

>
> diff --git a/common/log.c b/common/log.c
> index aadf533fb2..aa5505943f 100644
> --- a/common/log.c
> +++ b/common/log.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <common.h>
> +#include <debug_uart.h>
>  #include <log.h>
>  #include <malloc.h>
>  #include <dm/uclass.h>
> @@ -245,6 +246,16 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
>
>         if (!(gd->flags & GD_FLG_LOG_READY)) {
>                 gd->log_drop_count++;
> +
> +               /* manage droppped trace at default level with debug uart */

dropped


> +               if (IS_ENABLED(CONFIG_DEBUG_UART) &&
> +                   (rec.level <= CONFIG_LOG_DEFAULT_LEVEL || rec.force_debug)) {
> +                       va_start(args, fmt);
> +                       vsnprintf(buf, sizeof(buf), fmt, args);
> +                       printascii(buf);
> +                       va_end(args);
> +               }
> +
>                 return -ENOSYS;
>         }
>         va_start(args, fmt);
> --
> 2.17.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
