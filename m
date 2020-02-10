Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F3158609
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2020 00:14:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 568EAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 23:14:06 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4484C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 23:14:03 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id j132so10952775oih.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 15:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ODX0vn/cyNNzcL6Pf0dANeAJ21ZYYR7mEjpeLz03svA=;
 b=mZ5lY/4jOfoxCSYfk6lVyHvGuofpQ3JPFNRr/59/5AxKktgNGrIbI0oY8fst54ls1X
 H/H2WvWNwmJebvotPkRvVf3EPdsPfNR1MEnQW+oPdYmTa+VyvdZ5A2SQKvfr0EAj/nli
 sSlDkvdVjxwZ/bcJBhdPoE8Qe4wz8tY0xHDFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ODX0vn/cyNNzcL6Pf0dANeAJ21ZYYR7mEjpeLz03svA=;
 b=FYj9qKZ+6XpSO2wxDDWrCnydVVSlXJpnOyYyTiMkGs0qwzvAsgl63iHEBpxdzWQC0s
 bIusPdEB+8L8NRDdw3rsSkImqrSBeVIJvn/R5kKnfHhfns+oZjWPjWQowW8lxMa5qnpt
 AizuTmTxAFu2R4ve3G0XOC5XXXkfOY37AcQn208PhMX+ZDUj/VeYn7xGzK6zig57sI9a
 d8RyqJBzPdCLG16WAxRpuhcaXVgQoqcd/2n680xxV7icEgiS2/NLfUNUwwMFNvpNQ5JF
 jeHKnBzSMXIbAXzLsVlxEDD4GNhgY3ZI8oXa6D05KqGAij3RxfHqGJFTAiZQCj7q1m4A
 qpvw==
X-Gm-Message-State: APjAAAXG9RhCrtLua2vAdnJUi84sUjLW7r6KcbeHRRoYFSmCgah8OaCi
 I+X6xzlH3xhEiLsfZROafENc2KVEDvAe4dRR2YGPhQ==
X-Google-Smtp-Source: APXvYqypbtvgtB2VRLki61hDDR2n/HegDqGSzXDQJGX7ZNmGLUCxd3RR/hQjQZTEVVMo7m4yP74VrO+LrIXQ50RYqs8=
X-Received: by 2002:aca:1a05:: with SMTP id a5mr1053501oia.97.1581376442321;
 Mon, 10 Feb 2020 15:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20200210170129.8405-1-patrick.delaunay@st.com>
 <20200210180110.v2.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid>
In-Reply-To: <20200210180110.v2.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 10 Feb 2020 16:13:50 -0700
Message-ID: <CAPnjgZ05GT2VcN21gQZ7bxCixOv7cOnyiFa1ANVHDakgpNqW3w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/7] cmd: env: check real location for
	env info command
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

On Mon, 10 Feb 2020 at 10:01, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Check the current ENV location, dynamically provided by the weak
> function env_get_location to be sure that the environment can be
> persistent.
>
> The compilation flag ENV_IS_IN_DEVICE is not enough when the board
> dynamically select the available storage location (according boot
> device for example).
>
> This patch solves issue for stm32mp1 platform, when the boot device
> is USB.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - update prototype in env_internal.h  as done in
>   "env: add prototypes for weak function"
> - remove comment change in env.c (implementation information)
> - move env_location declaration
>
>  cmd/nvedit.c           | 15 ++++++++++++---
>  include/env_internal.h | 11 +++++++++++
>  2 files changed, 23 insertions(+), 3 deletions(-)

Definitely we need some more tests in the area of the environment.

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
