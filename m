Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4007282EA9
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 03:42:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B276C424AF;
	Mon,  5 Oct 2020 01:42:19 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C6B1C32EA4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 01:42:16 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i12so1351663ota.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Oct 2020 18:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O0lEghSlTQjRsKFDjjcsyQIrPXeYLT4852NO5KnSeWw=;
 b=Kjr7UD2J0xHCB7N86EWkUtHL+NbBut7kHSUdY9QqgZIU7hTiUZwoQwDjxw18EO6weP
 EhehfLYA1G+8zz4tUCDC69EurnfjFuueDrZsQ1MJDblWa1Tz9echz+WTHLpdvBKcwI8e
 +xd8E5OZOmVSo6VkK+583xRsChwTgRSlfNopg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O0lEghSlTQjRsKFDjjcsyQIrPXeYLT4852NO5KnSeWw=;
 b=EW4hCgFnTw4hpFTo0vfDd9gSc3So+sTmwfCn+cF5HSpEGkj0cP0T/oeNvztu0e3Dvo
 9lBwOsDmtYcjt5AE/7QYMPXH7cAfklhL9oewazaLA4OBosb9qfteJgsEajaKH93gMA98
 rwB1WfZlnwaQJ8LSnuxicKb6kM8rYibw6Rf42qJW2OdqHM8YRWQ+934DYgSsp5EV9Zc7
 mGB2jBzexujGyhULNd7wyyv4UYrfQTyWbGNfXvR9vC58wXWKueR+45f2EThus9UAhkyH
 l9txoQxFbTBNTnVt/xgrA3lblinCJgvThLS0DIv36AchtFoY9lU89xmKJwXwrT4RUmVe
 5apQ==
X-Gm-Message-State: AOAM530vIwiascjmm7h0KapM8MxaJL2etrj69U4W3tFl2sXjfuYE+Vi8
 Z6aH4EQADsQh4iXrZhNMV8BdRgEV4kNnvwsoohv/NQ==
X-Google-Smtp-Source: ABdhPJxaPy6s9bWILB1xwhAMGsB3tN4xPnEJcAlgMGRCccbiCGf9BekYRGVa9mZ4xZ/+lgMCnUIYTuUHXzOtbyIre0I=
X-Received: by 2002:a9d:6d95:: with SMTP id x21mr10017192otp.339.1601862135208; 
 Sun, 04 Oct 2020 18:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200925074116.16068-1-patrick.delaunay@st.com>
 <20200925074116.16068-2-patrick.delaunay@st.com>
In-Reply-To: <20200925074116.16068-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Oct 2020 19:42:02 -0600
Message-ID: <CAPnjgZ1v7YKyc6itKaxQTi4V772iK0Ncsxm8vWWV5Xun5QGXxA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/3] fdtdec: correct test on return of
	fdt_node_offset_by_phandle
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

On Fri, 25 Sep 2020 at 01:41, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> The result of fdt_node_offset_by_phandle is negative for error,
> so this patch corrects the check of this result in
> fdtdec_parse_phandle_with_args.
>
> This patch allows to have the same behavior with or without OF_LIVE
> for the function dev_read_phandle_with_args with cell_name = NULL and
> with invalid phandle.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  lib/fdtdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
