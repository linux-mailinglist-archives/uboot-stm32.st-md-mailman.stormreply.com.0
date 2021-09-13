Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C1409CAF
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Sep 2021 21:10:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12C38C597BC;
	Mon, 13 Sep 2021 19:10:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 433B1C5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Sep 2021 19:10:52 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id e26so7415469wmk.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Sep 2021 12:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yuK/JG6heEY/YSJHdS1Dl/FFGVi7X4sOIn2nZGTMFq4=;
 b=ge+KjP2brb3Vg/GE7qQYtNyCcM7t0BRHh1VKvENy0JpSIeb2LNzQWGYwzaZ9ovrOga
 h1NXPqyNzJjbzMIHEJabeKWKRy1TJhD+8fxZiNG/pCOBqOVrYHKkGIw10TkWjOWzvayu
 G7zlB+IhQyr6Aq51mYEwxLogEubGgN2vepzH4iAM2kbMvfshtRmvVZhA7zW7pfi81fJj
 2ZMXbRqo68Ls7Ll8mqCS+VrTy2A0Bb6l/SVsrbWv5iY8fK7itXN9s/oWCeJL4o1PMNsh
 cAf8EOXigx5AKUpvCX0zkr5uH+MT6aAwjEjB+H2y9SvXf8hA2OGQEO1I0SVqZroeiiCp
 YU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuK/JG6heEY/YSJHdS1Dl/FFGVi7X4sOIn2nZGTMFq4=;
 b=h4sOOdCqdaxYZ62m9UiVMwlr3r6QU3NH3ykDFmS7izXKQlH4p5wVweVqu6H2rVjnnb
 wLg8t0uRbR9GG8q+y/teGWPqSWzF6sOoEUysJ/nao2BmR8a4ZJES/4WF0PPQLZs6Gy38
 Pdp5nme9rStt1Cbe0bzxrQWtcIFI57dsaAqNbnrFO0hNrO4b4zUCnEJCdGU2sjH4hxfI
 /KbcLf/FO6ahEthSembyQjbrJ4bpuoOWBElFkxKAymQPME7FbUNkbJ/kVtZxsNddnwoG
 tu+o/8+7iurEYvMPT8wn6N5eJzHDE3Yh97a0wGY3DOmI3U7oMLDk0husEYQUYbCa3Z/Q
 KLjQ==
X-Gm-Message-State: AOAM532UC38Lc+W4wMKVpSSvTIRlKHyxMKZTro40WJakzgeNnVx+1wi0
 kFdTmxhSJ2dNo9RCr486NhE0MCET39hdl3Cb695P9g==
X-Google-Smtp-Source: ABdhPJzqYqJWkW/usMgQ9ekn+gDxQu+PYXaHJL+tBTxr6PUEYTQuEXz6GniR7eRh2IqQAolbr+cGgPlJykjgzAj9S6I=
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr7228800wmf.177.1631560251748; 
 Mon, 13 Sep 2021 12:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
 <20210902115512.2.Ibfbc7792766c73de7904b13321d9fc5658d929a8@changeid>
In-Reply-To: <20210902115512.2.Ibfbc7792766c73de7904b13321d9fc5658d929a8@changeid>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 13 Sep 2021 21:10:41 +0200
Message-ID: <CAHUa44FYdE-wHeRQx3k9LWHGTFTtfuJdf8G-UD33he7en1hR+w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 "Alex G ." <mr.nuke.me@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] tee: add a stub for tee_find_device
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

On Thu, Sep 2, 2021 at 11:56 AM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add stub for tee_find_device function when CONFIG_TEE is not activated
> to simplify the caller code.
>
> This patch allows to remove the CONFIG_IS_ENABLED(OPTEE) tests
> for stm32 platform.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  arch/arm/mach-stm32mp/fdt.c        |  1 -
>  board/st/common/stm32mp_mtdparts.c |  3 +--
>  include/tee.h                      | 11 +++++++++++
>  3 files changed, 12 insertions(+), 3 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
