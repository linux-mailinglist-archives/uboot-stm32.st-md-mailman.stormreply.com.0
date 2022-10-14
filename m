Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 457CD5FF1D4
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Oct 2022 17:56:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA61AC6411F;
	Fri, 14 Oct 2022 15:56:36 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70791C6411E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 15:56:35 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1370acb6588so6309675fac.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 08:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tb2gnw9i7uateJ6NBv5Q61ldQWF3J/SKkwBCRSaXcic=;
 b=m2LEWtN8BjnVOvXiVEDitE1pHv3ieCvZqGbqCcae/C23ohZ8NKgth5rR4lwXvEIS6F
 N9AHAdbLww1JR++7PJnwVzIx1lAQxtz5hT5TFNT0xR3C4/BIjY+TSNkIQ6A3ChbM6n2L
 UT+v1Ig85POGisz257GsHULiRAgW56ZcOfgLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tb2gnw9i7uateJ6NBv5Q61ldQWF3J/SKkwBCRSaXcic=;
 b=fwo/om2i9ng8HygJH78UuZmVyStGifJfCgPRg6FZw2tC+8eS+gWEF4vVjI3f33vwd5
 1Xi+S6RbR4Dy7dzgh7L8Q7FkcUmeLlZCaDhtPE+6DTjSh+/4KCkx7J+kh5rxZjPWEiL/
 bAxpm7KWWnflE6Q+pj9asWmfgUhllUeH92EuBTkr8UE4EhoSlpl/Xug7Dh0Yt3Ey8xea
 AuJ1AmyntdCfeENhGoyNNiqVBZBUtcNdIwdUJBiDS35ReCK5g9Ajt+eo/xICXHNAFkh7
 NkWH5yUo9t3d/D4iBPgt5FMZYjDnoVWO1IlJXQxbLN6G7q+J2loqSiKODwm1hA7bbTcw
 mWqQ==
X-Gm-Message-State: ACrzQf2h4uhMqtXi2Qa78fdMB0UWhdF1Oc48WerAbOh4uoj2ftP1ktCl
 n9uqxKZXndnY7XpgXnpF7xWcU4wHF5DX5JQUTZ9oRw==
X-Google-Smtp-Source: AMsMyM5LcYzyaWz0XevarE8LS5aaKUm2X2AzXO7nVgJW6RcSq7gnTtHUrgAr2FZaOghMg/bwUlpt9KkNjSCWR4XI/94=
X-Received: by 2002:a05:6870:4250:b0:132:b47f:c92c with SMTP id
 v16-20020a056870425000b00132b47fc92cmr3238277oac.64.1665762994016; Fri, 14
 Oct 2022 08:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221014113342.1.I1a9c695a185950bbbc9436856aeac65ea5e7b1fc@changeid>
In-Reply-To: <20221014113342.1.I1a9c695a185950bbbc9436856aeac65ea5e7b1fc@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 14 Oct 2022 09:56:20 -0600
Message-ID: <CAPnjgZ1JDz33huP-xnFqKAfszhvqZWUTsTxbK11Dv_MF6HAkGg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tero Kristo <t-kristo@ti.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] cmd: clk: probe the clock before dump them
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

On Fri, 14 Oct 2022 at 03:34, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> The clock UCLASS need to be probed to allow availability of the
> private data (struct clk *), get in show_clks() with dev_get_clk_ptr()
> before use them.
>
> Without this patch the clock dump can cause crash because all the
> private data are not available before calling the API clk_get_rate().
>
> It is the case for the SCMI clocks, priv->channel is needed for
> scmi_clk_get_rate() and it is initialized only in scmi_clk_probe().
> This issue causes a crash for "clk dump" command on STM32MP135F-DK board
> for SCMI clock not yet probed.
>
> Fixes: 1a725e229096 ("clk: fix clock tree dump to properly dump out every registered clock")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  cmd/clk.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/cmd/clk.c b/cmd/clk.c
> index a483fd898122..9c58247935a3 100644
> --- a/cmd/clk.c
> +++ b/cmd/clk.c
> @@ -21,8 +21,11 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
>         struct clk *clkp, *parent;
>         u32 rate;
>
> -       clkp = dev_get_clk_ptr(dev);
> -       if (device_get_uclass_id(dev) == UCLASS_CLK && clkp) {
> +       clkp = NULL;
> +       if (device_get_uclass_id(dev) == UCLASS_CLK && !device_probe(dev)) {
> +               clkp = dev_get_clk_ptr(dev);

You should just use device_foreach_child_probe() and get rid of all of
this device_probe(), manually traversing internal DM lists, etc. So
this patch needs fixing too:

aeeb2e6d9c6 clk: support clk tree dump

Do clock devices have children which are not also clocks? That doesn't
seem right.

> +       }
> +       if (clkp) {
>                 parent = clk_get_parent(clkp);
>                 if (!IS_ERR(parent) && depth == -1)
>                         return;
> --
> 2.25.1
>

Regards,
SImon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
