Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 377192AF3A3
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Nov 2020 15:32:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4367C36B36;
	Wed, 11 Nov 2020 14:32:49 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B013C36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 14:32:48 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g19so2265583otp.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bvKNKzlUT9+87VQJ/0jpuvLjXHN9TrzGZ/98SiOQc7U=;
 b=bURLxyHcUIZOg0D2AqwwORC/d9zlhgnz4MKsrQmaYFFWYVj9WNzyiX4Km/WpDFXi8X
 WHmh9c75pgwOtlqrwJpPNi9sU+SJADPKmrKl5AoXRds7+ElU+Z9FN5M+7qBeSzIXxIEU
 OJ0Nx9+HVJN1umiQCtbgQ01jxJvIKbv1UzJeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bvKNKzlUT9+87VQJ/0jpuvLjXHN9TrzGZ/98SiOQc7U=;
 b=d8uX9hjNh7tv7vkEDGjC2NcFqvtNfToyfYCgWzm0egow07zV3jvrgBcm14OIyhdfeI
 61hO1DUJEgR4gClZ9/nQtpzDQ4nhqxJ4H7fC25tV6y67sbk7NRXUrI9/7QD7YpoCt1pc
 TwBr5kDQr6577hBe5+vHnfs5ljPlAKWMsnxrFfAXQ8IuoW9ENHhAl5M/3dvGQHo21WYA
 ftiRCNbrFn4LwTBE5w+EQrIN8QnecabSrIO4px/LY6EPDZQgujlmF9nOCQA297CPZon/
 waN1Y9KGSU7u5tGQKa9Vcjm7ZQtCrksMq//pOmfci979DpDWX4esEXE+GZg1SJW9Yzvd
 OhNw==
X-Gm-Message-State: AOAM532FnXxHnyyz/bodJcs2S7QIJgQAOeyzZE3efy8Vvj7obL73di1i
 4+mtBSaYYn3Orc8bI95PZXNA229yZOnIztsX7oF0yw==
X-Google-Smtp-Source: ABdhPJyVXQoCB1zY2+6p9AlyJOEDaYxsjPQxyKWdBnYQhIszqI5CNH4Iq/XX1UxDyZLK7JetVHs2NqqhHVAyhZWtbT4=
X-Received: by 2002:a9d:39b7:: with SMTP id y52mr18884767otb.28.1605105166988; 
 Wed, 11 Nov 2020 06:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20201106175339.30683-1-patrick.delaunay@st.com>
 <20201106175339.30683-3-patrick.delaunay@st.com>
In-Reply-To: <20201106175339.30683-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Nov 2020 07:32:03 -0700
Message-ID: <CAPnjgZ1Ne3=cRHyQrdr=v+6u9fcVgxKrrWGnwhecci-+YDB6mw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 3/3] log: call vsnprintf only when it is
	needed to emit trace
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

On Fri, 6 Nov 2020 at 10:55, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Reduce the log overhead when the traces are filtered,
> by moving the vsnprintf call from _log() to log_dispatch().
>
> This patch avoids the printf treatment when LOG features is
> activated, but trace is filtered, for example when
> MAX_LOG_LEVEL=8 and LOG_DEFAULT_LEVEL=6.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>
> # Conflicts:
> #       common/log.c
> ---
>
>  common/log.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
