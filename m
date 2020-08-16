Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680F24558F
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Aug 2020 05:39:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00354C36B24
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Aug 2020 03:39:40 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6C28C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Aug 2020 03:39:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r2so11659359wrs.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Aug 2020 20:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gHwV/UElRFsrkspYo3Pb4bwOpyH+8DkvgdrBr9svshE=;
 b=R4AQEkFffnUh2u/Pbs03rKNpFk+zKdeX8obGZwb6yQ/uFPCqdZ3UlBs+g086gQp/J/
 2khvZ7B5sstyEoTuT1kGGeCfLOg672naEGBJaC2hRSiXgIhxhf0Te5iALnYj8hH1+juC
 aNBaKmAQXW1KlO32+cBG3Jr8Pr+jV32EF6XKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gHwV/UElRFsrkspYo3Pb4bwOpyH+8DkvgdrBr9svshE=;
 b=b+ktqpThkFlSxwt+AvX8ZP3z1QFf/4mX2v39/A8NvL7IuSLm3/+gflh9J+SLHCEP85
 S3ss3X0+0TtmHr9eVIyzcJXZzBF1pfcppFrYk2AwD7vfoHXP5bvWryq74iCGBKeciGy0
 SXrEjcZbfSz8a2EwXkoHLLLJnGRGAt0/axfugH1MWkNu0FBtbY94tn+mTdsYEv5HnFC3
 lkGrfZMf4fTwLbyA7Zv3X0+VNFfjrNHrepVccpltwIzxA/Qh7R+F+u4rq5xDS/48LI3u
 +p5RulizSV6okLpfJ1TNfhbPHJRcPCbilhKqwe3a5/l8tY65Acsn+f9Tdb47CGlvXWeU
 qgWg==
X-Gm-Message-State: AOAM533sncsMMBsF13jMyoQWKC+w5JAVYwa8uVzmVoIzcbyKXcgMlLvY
 bxt78oaZJtsAj44WIi/xVuLDgAVMURvXy5iTKYOsiA==
X-Google-Smtp-Source: ABdhPJzIg533e0MI8gg/hsUQf/BFL2sU3lH8S3967UvbVX6LgunJ4EFMunKQwTAiP5DMMImkVuWRt3ZeVrSHzK0exps=
X-Received: by 2002:adf:c789:: with SMTP id l9mr9601239wrg.41.1597549172412;
 Sat, 15 Aug 2020 20:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200730140347.1.I0977b8abc51b9854d9e8f7822a7b28f3f219b99e@changeid>
In-Reply-To: <20200730140347.1.I0977b8abc51b9854d9e8f7822a7b28f3f219b99e@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 15 Aug 2020 21:39:19 -0600
Message-ID: <CAPnjgZ0v0DB=dnp8Jo29Ndrgwaw9L7fYr5tnMiAsk-n434ZOig@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] cmd: clk: cosmetic: correct code
	alignment in show_clks
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

On Thu, 30 Jul 2020 at 06:04, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Correct code alignment in show_clks() function.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  cmd/clk.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
