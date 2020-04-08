Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C711A1A29
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 04:58:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2410C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 02:58:37 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50F45C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2020 02:58:36 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 142so1432831ljj.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Apr 2020 19:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vqK7oY5MBzbBWe3otUvzM6GPQn3LueldwftxSgZjjHE=;
 b=cT7xCPusrnrSF4krMhRlrLP9AqsAreXrrsNglz8T5b6MDsatm4atL+XdRjtU0GOoqo
 ck3IUbwgHLV1g5cjFP7uJFDjg2NDh/iGoFhxU8w8S3QVEWamJ2Famr2Qvxy5bfFMy7fu
 wza+40SA9gMknov+gl6NhiGevl0j4ge673Dhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vqK7oY5MBzbBWe3otUvzM6GPQn3LueldwftxSgZjjHE=;
 b=Cb5crGIK/vhwBaonlK2WACAozHUOd7sbzpoFEtby1E+2xhObuBvXvVWFljp4USiPm7
 XV4pr5UH8kKj0eJhdCZO6wbISLdTHgALss56T7bArVQ8T7Y3n+hRCZTCzFlWxpVfpNzf
 vqsrmjhk7eiHGGvdhDqoOFTsaE3WvJpLIUO/tIrARBDl3Xag8BB3EtzusATWhxWm87sY
 Z6ue44udg1pRtPvN1rvED5NBjquDQO39Xy5bms9VInY6CCIzpTMyvxEjhojpENClc8P6
 dK18bYUCnFmkVJXUGtQGaKCe5CA/Wh2M/RvqJ/AD2Hv3EVU05mwPFjjOn9PPgG+3MCpp
 x8Gw==
X-Gm-Message-State: AGi0PuaN3nX9lKu4+D6bykD+o3FtN+orFGM2GYpRSA77xBQzRvi1m0F2
 j6c/sERRB8yQEuSsbA7ng4ayoXKn6pe/XfP5teimtA==
X-Google-Smtp-Source: APiQypKY3cka9Tcjk7k4ZrrwxCwV7GZR0eYUec6sY82RQQGhWB/EC9UORdd16JbkYk8zyTK77TujUIPQhXQ4k0RHEU8=
X-Received: by 2002:a2e:b24c:: with SMTP id n12mr3695933ljm.7.1586314715160;
 Tue, 07 Apr 2020 19:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200403113844.v2.1.If3d7baadb24504a63742fe82f963f481b030fafa@changeid>
In-Reply-To: <20200403113844.v2.1.If3d7baadb24504a63742fe82f963f481b030fafa@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 7 Apr 2020 20:57:32 -0600
Message-ID: <CAPnjgZ0s-=ONFEe5kOTpc2cGXDOWSw81qX-Cf2=Rd4fFdAAw7g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: core: remove the duplicated
	function dm_ofnode_pre_reloc
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

On Fri, 3 Apr 2020 at 03:39, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> The content dm_ofnode_pre_reloc() is identical with ofnode_pre_reloc()
> defined in drivers/core/ofnode.c and used only three times:
> - drivers/core/lists.c:lists_bind_fdt()
> - drivers/clk/at91/pmc.c::at91_clk_sub_device_bind
> - drivers/clk/altera/clk-arria10.c::socfpga_a10_clk_bind
>
> So this function dm_ofnode_pre_reloc can be removed and replaced
> by these function calls by ofnode_pre_reloc().
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> Hi Simon,
>
> It is a rebased patch for http://patchwork.ozlabs.org/patch/1035799/
> marked as superseded but never resent (and I forget it).
>
> Compilation is OK on travis:
> https://travis-ci.org/github/patrickdelaunay/u-boot/builds/670029232
>
> Patrick
>
>
> Changes in v2:
> - rebase on master
> - udpate dm_ofnode_pre_reloc call in at91_clk_sub_device_bind and
>   socfpga_a10_clk_bind
>
>  drivers/clk/altera/clk-arria10.c |  2 +-
>  drivers/clk/at91/pmc.c           |  2 +-
>  drivers/core/lists.c             |  2 +-
>  drivers/core/util.c              | 28 ----------------------------
>  include/dm/util.h                | 27 ---------------------------
>  5 files changed, 3 insertions(+), 58 deletions(-)
>

Acked-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
