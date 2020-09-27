Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 650BF279D63
	for <lists+uboot-stm32@lfdr.de>; Sun, 27 Sep 2020 03:59:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19322C36B25;
	Sun, 27 Sep 2020 01:59:39 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D770DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Sep 2020 01:59:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e16so7954414wrm.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Sep 2020 18:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=zsJrlYhgkijVg1AaYTaRpYQK2dSYn0UegItJmFQUud0=;
 b=X7XVKZxrbf46wJdMoc6Otra9YcPCSljMyBQom8uDc17pn0veg+HSy/ZGSjQQT35jot
 drw+l1VRoQNOVHZKPmdU1KhAqwW0aecRgX/JMmHlqsDEBskt9JIVu0plDF0pNDfngnfE
 qktE43h+hNblpdXBEoodi09GBjLwPhBh2wn2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=zsJrlYhgkijVg1AaYTaRpYQK2dSYn0UegItJmFQUud0=;
 b=aXbvmqLtHzKfYYxkFtIIVEjCJ6mb6R2UdnWthH7fte5ytJa97WxBsdywWEdCyINsWc
 PjZxVCJ09KYPEQjDbuDke/ElCjIOK3aofapkp5mTbOOFCtZD6zbvjJXEbUajPXBoLmNu
 pcCOTzgiyTfpxJ7EipHM0OJHufvZOmqTuGIkHgPFruhR1dEfdlkGBJWMBTQoMb+bKjqq
 FkuuI5DU322swQ6ufbY4DFrSpwV/N74XDaAEvNGH2z7Yikp3eUErjAHk8IYtfJ/DKLjf
 KGcv59lC+unddlKekkL3pmo5JbNHeuvomzwnNTADCsyuCHhJj8Iqk8rF/DX7nE3EAo/9
 Xm8Q==
X-Gm-Message-State: AOAM531DZr4RBb7mTPDwcJc8Eog5FLpeO5Q4c2LYEJxablOKe9zfE65A
 f9hW2DIhIPRVhgFeDEeRyVotQfjt465ZZ7zM0VwFkw==
X-Google-Smtp-Source: ABdhPJzFS5y7hOdsGnbxMvJKsnvudVgEwYiYCc0BIfYc+Z8tiJSoc4oixP8aaK6lS1exZXXcnvk8MGP3C+H7619JGmI=
X-Received: by 2002:a5d:680b:: with SMTP id w11mr12519850wru.73.1601171977215; 
 Sat, 26 Sep 2020 18:59:37 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 26 Sep 2020 18:59:34 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ1rmWnQ4-7Z1cAiR+G51YDBacqapyAi=FcH5rOJJ4fSWw@mail.gmail.com>
References: <CAPnjgZ1rmWnQ4-7Z1cAiR+G51YDBacqapyAi=FcH5rOJJ4fSWw@mail.gmail.com>
 <20200910162617.28257-1-patrick.delaunay@st.com>
Date: Sat, 26 Sep 2020 18:59:34 -0700
X-Google-Sender-Auth: qjg_LtNw2KpLYmwrNZ4VXdlqRd4
Message-ID: <CAPnjgZ0aF2GYb8QTvgDUB0VwZL2X_c3H6XMiLvXjmwb7DgL9OQ@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] dm: add cells_count parameter in live DT
	APIs of_parse_phandle_with_args
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

On Thu, 10 Sep 2020 at 10:26, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> In the live tree API ofnode_parse_phandle_with_args, the cell_count
> argument must be used when cells_name is NULL.
>
> But this argument is not provided to the live DT function
> of_parse_phandle_with_args even it is provided to
> fdtdec_parse_phandle_with_args.
>
> This patch adds support of the cells_count parameter in dev_ and
> of_node API to allow migration and support of live DT:
> - of_parse_phandle_with_args
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/core/of_access.c | 7 ++++---
>  drivers/core/ofnode.c    | 3 ++-
>  include/dm/of_access.h   | 4 +++-
>  3 files changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
