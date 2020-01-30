Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DCB14D530
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D610DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:26 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9783BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:19:25 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id n18so1564018ljo.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eWHvubNQFZiViiVxDK5b5k7w/nP4Sg6/HvN9dS+lWQI=;
 b=IZRvmFyU2rXwP0w8Fjc34NLnCNjb4Bc7fyWYL0ylrb+nNxNjxeSE3B9unlEpiH0JS4
 DKEIZ9o4pCO6JAB10mpVCCxQLz6DaOupYRIaFo50/JLswB3TkCMNZRTD3aKE+5NArAGt
 EZPdj0qEFimbnbtqknSvkJpnuN95RA7ucDARg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eWHvubNQFZiViiVxDK5b5k7w/nP4Sg6/HvN9dS+lWQI=;
 b=BLaQAHXZfjxuW3BPTevQTVL87cFzJJD7aThav8jhH2qc1+4+ioZWcULitUEZTyAbmK
 RiAz/xfC1ACZ8lpZAYaD4MpnOayfiUqFNGQHchcHTCIdBznk2Nybpco7As8K8SWFXpc9
 6Bnl3nKY1hgoB0xQ7hvkQSif4W7Pe+5dRpaRtziXSd7Su0k3RRfToaGnQc328QnkWRML
 rsXIkLBz5LO9SXE6WlUfA7vT94tpQaf+FdQR3hdijpdEvTkeTQIgEipzHv3aDOyd9q/t
 kBryontU67P0tBNd0ObEeUTmfA4BR0hGroTqeXSmmxHcZnbZXDDJvXM2ywUO4ndnVD0+
 Hn4A==
X-Gm-Message-State: APjAAAVNVjVkPi67jHmrsLXs7kD52ykfTw076MxwfDpezlkzFdBO6FiT
 HUOSYthIfLd570Jg/0LOFUve+HFY35NtLIC5eTxuwQ==
X-Google-Smtp-Source: APXvYqzjnUG0K8IM28mdd76xoLTv2BH/cV/B/mMZ9IeFmBS0BBbqiNN7izfUGUXP0jcBljBgVTAYEW4egDUR0w8NzW0=
X-Received: by 2002:a2e:3202:: with SMTP id y2mr1357835ljy.132.1580350764585; 
 Wed, 29 Jan 2020 18:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-15-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-15-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:14 -0700
Message-ID: <CAPnjgZ38dhQxBJe-8beJDJYezYpiUMGkBdgE+HBHYCp1NmqGFA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 14/21] gpio: add ops to get dir flags
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

On Mon, 13 Jan 2020 at 03:35, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add the ops for GPIO driver get_dir_flags(), allows to get dynamically
> the current gpio configuration; it is used by the API function
> dm_gpio_get_dir_flags().
>
> When these optional ops are absent, the gpio uclass continues to use
> the mandatory ops (direction_output, direction_input, get_value) and
> value of desc->flags to manage only the main dir flags:
> - GPIOD_IS_IN
> - GPIOD_IS_OUT
> - GPIOD_IS_OUT_ACTIVE
> - GPIOD_ACTIVE_LOW
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> This patch was part of v2 08/14
> = gpio: add ops for configuration with dir flags
>
>
> Changes in v3:
> - Split the previous patch [PATCH v2 08/14] to help review
>
> Changes in v2:
> - change the proposed ops for pin config to set_dir_flags/get_dir_flags
> - reused the existing API dm_gpio_set_dir_flags/dm_gpio_set_dir
> - add a new API dm_gpio_get_dir_flags
>
>  drivers/gpio/gpio-uclass.c | 31 +++++++++++++++++++++++++------
>  include/asm-generic/gpio.h | 15 +++++++++++++++
>  2 files changed, 40 insertions(+), 6 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

But please see below

> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index 4f7b43f163..ac30c3ee4e 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -297,6 +297,21 @@ struct dm_gpio_ops {
>          */
>         int (*xlate)(struct udevice *dev, struct gpio_desc *desc,
>                      struct ofnode_phandle_args *args);
> +
> +       /**
> +        * get_dir_flags() - Get GPIO dir flags
> +        *
> +        * This function return the GPIO direction flags used.

returns

used by what? This is too vague.

> +        *
> +        * This method is optional.

Please expand this (perhaps in a follow-up patch) to explain what
happens when not implemented.


> +        *
> +        * @dev:        GPIO device
> +        * @offset:     GPIO offset within that device
> +        * @flags:      place to put the used direction flags by GPIO
> +        * @return 0 if OK, -ve on error
> +        */
> +       int (*get_dir_flags)(struct udevice *dev, unsigned int offset,
> +                            ulong *flags);
>  };
>
>  /**
> --
> 2.17.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
