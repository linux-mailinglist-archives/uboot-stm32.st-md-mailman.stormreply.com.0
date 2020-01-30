Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0535614D52F
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C34ACC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:18 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E9A8C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:19:17 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id h23so1568492ljc.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SqTo8ZKYE49y9k6X1TplOpanGslvmQPXb3z5cFyoMWw=;
 b=TlPlJkqaOzOHhdZKB7teF3EnDrOdNYHv7tpmx8qepD/uXK6KXXGUoeRQZ3Pv8PdiFR
 TH/oVHxlj+wlTrKCPEk8GyPuhbM96xgnD5VXyZl5PMq8ZhYXkgIQDon7A92lp34W2NpT
 WCxhNOw6EvWrTc/2HTwPG+ZcnWsteGsCLtU5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqTo8ZKYE49y9k6X1TplOpanGslvmQPXb3z5cFyoMWw=;
 b=cYWwFqteRVPv9ejzbvGFx3U3h3QRcQznQBXi9CcUyHAkjklqH8gFIz3sSoVQBa0+fJ
 2iUWYBy98WDx/F0EOu0oVxXyng8iFxGOouFEASjhn22TgraQdRWlASSZXYQAZVoN6B05
 OkQOnnLItdh2P8NHzDczGaf5QuMprnLVPvuh8GSE4GjALiYB9O0Whg1yezhllDLa2Qno
 RIh+QLc+yCOHdEpqseQyHftMx0CbhBGlhfAt9wmdOF0pQtSe73TO1axZdJ7cPoiiVgXc
 yZ8Td1joT9VVt/5iPsUIuO775nEMbJrW6niYBxx9mJp/7s90/UeOuc+VFfpt6PcNRbci
 ztBQ==
X-Gm-Message-State: APjAAAX5M3PH/x3kukMGkna0WJIadORN28sjiNVQ/I3HLnGMqHpoS3PI
 dIn3goaZxYI/YtsxCLGnqBJ6b/6bc4A7vf2ilT7LcA==
X-Google-Smtp-Source: APXvYqxdkRnDC5zrC6C0Y47+o/rf+c4Y1UbO4ua38ZH3TZQse54leviCQyhHthvH+HGQiD2nBi8RnLRBV+eifsWcB9E=
X-Received: by 2002:a05:651c:20f:: with SMTP id
 y15mr1325584ljn.7.1580350756536; 
 Wed, 29 Jan 2020 18:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-12-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-12-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:09 -0700
Message-ID: <CAPnjgZ245OaozWag4modEpzwMjFz-kDW-q4b9O9LCMytdvrsyw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 11/21] gpio: add helper
	GPIOD_FLAGS_OUTPUT
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
> Add a macro to provide the GPIO output value according
> the dir flags content.
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
> Changes in v2: None
>
>  drivers/gpio/gpio-uclass.c | 9 +++------
>  include/asm-generic/gpio.h | 6 ++++++
>  2 files changed, 9 insertions(+), 6 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

> diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
> index 62462dffa5..1d16d4acf9 100644
> --- a/drivers/gpio/gpio-uclass.c
> +++ b/drivers/gpio/gpio-uclass.c
> @@ -541,12 +541,9 @@ static int _dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
>         }
>
>         if (flags & GPIOD_IS_OUT) {
> -               int value = flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
> -
> -               if (flags & GPIOD_ACTIVE_LOW)
> -                       value = !value;
> -               ret = ops->direction_output(dev, desc->offset, value);
> -       } else  if (flags & GPIOD_IS_IN) {
> +               ret = ops->direction_output(dev, desc->offset,
> +                                           GPIOD_FLAGS_OUTPUT(flags));
> +       } else if (flags & GPIOD_IS_IN) {
>                 ret = ops->direction_input(dev, desc->offset);
>         }
>
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index 454578c8d2..111319f41f 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -129,6 +129,12 @@ struct gpio_desc {
>          */
>  };
>
> +/* helper to compute the value of the gpio output */
> +#define GPIOD_FLAGS_OUTPUT_MASK (GPIOD_ACTIVE_LOW | GPIOD_IS_OUT_ACTIVE)
> +#define GPIOD_FLAGS_OUTPUT(flags) \
> +       (((((flags) & GPIOD_FLAGS_OUTPUT_MASK) == GPIOD_IS_OUT_ACTIVE) || \
> +         (((flags) & GPIOD_FLAGS_OUTPUT_MASK) == GPIOD_ACTIVE_LOW)))

nit: you don't need brackets around the == operands, I think.


> +
>  /**
>   * dm_gpio_is_valid() - Check if a GPIO is valid
>   *
> --
> 2.17.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
