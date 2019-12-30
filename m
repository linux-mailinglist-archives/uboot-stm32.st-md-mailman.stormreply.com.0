Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2812CB94
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 02:21:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70EA7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 01:21:31 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90AE1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:21:30 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 59so44329103otp.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ow6zKeEMt1rgpwEbQQr3chIjkYF7AISTflu45cNCFwA=;
 b=L7Xz4kEcJba/QVyjcNJtiirgvY4w3xbFd2Fnd5dcHsazCL4AeLCgRgitLwcCuJgNDa
 Lhl5YFqu9/6lg9hB+jXgX7bn2aTlq9CKqgz3+lETM48AYAneJi3//O4SpBYlkn5w7i0R
 dDAhsLkXKPj9ufDLf7NkORh2r7CtIUNJrPFzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ow6zKeEMt1rgpwEbQQr3chIjkYF7AISTflu45cNCFwA=;
 b=LeQospsqtaZFnZ8Sy5eC9oGsSiKQ5o485OPo9PzkC88N7Ox2JzvpjCJrA8DTueivP2
 j8XUctbtJ9A7SpeFBJOzWptyZ5BP9aSvsVhXYgfID6RxK6EfchrJKPc8egCSGKW6x0pw
 tF9W9JeZ2GHsQ287c9zfSZ6/xlUMRas1BBcDy2u9y4dLPm2fo+oSZVD/vx4qjxF0qDX7
 v3tBzZcOKMhP5LUMBpjrm2yAko9jgbsvtkxeH3oZbMbKmIL5NdBU9E2VWkS7Buz8IObf
 Ul7q8A4hGkOlL7c0Z5FkeINUYkBAKhJtxNh/9zsKTMi2/wzH20XbIFS3kKAwirJaJcJJ
 OWBA==
X-Gm-Message-State: APjAAAV8cmmvh+s7BBuEiQa78fDeUOX2pmCeK25a3Yy0q/Fl6dT3xlmi
 ZsCDHNC84NnLFTl3DXoJMdVcjnjifYmu7IvIKaJwSxau
X-Google-Smtp-Source: APXvYqzxWgXFCFmjHAiIvFnFESMqxBYbrA9tyt9YkHEzGtW6b34Ukfc6jcHoYz6OZ+EGfXYPBXoL62fZrcU7u+WUDXA=
X-Received: by 2002:a9d:53c4:: with SMTP id i4mr60778751oth.48.1577668888900; 
 Sun, 29 Dec 2019 17:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-9-patrick.delaunay@st.com>
In-Reply-To: <20191126084911.19761-9-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 29 Dec 2019 18:21:15 -0700
Message-ID: <CAPnjgZ249GaKXp0A36EZk2dDAZ0yFX_ce0mp5RPjVXzygP2mvg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 08/14] gpio: add ops for configuration
	with dir flags
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

On Tue, 26 Nov 2019 at 01:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> This commit manages the dir flags that can be used in gpio specifiers
> to indicate if a pull-up resistor or pull-down resistor should be
> enabled for output gpio (GPIO_PULL_UP, GPIO_PULL_DOWN) and the
> Open Drain/Open Source configuration for input gpio
> (GPIO_OPEN_DRAIN, GPIO_OPEN_SOURCE).
>
> These flags are already supported in Linux kernel in gpiolib;
> this patch provides the same support in U-Boot.
>
> The dir flags are managed in gpio drivers with two optional ops in gpio
> uclass: set_dir_flags and get_dir_flags.
>
> - ops set_dir_flags() set the direction and configuration of each GPIO
>   with a only call to dm_gpio_set_dir_flags() / dm_gpio_set_dir()
>   and respecting the configuration provided by device tree
>   (saved in desc->flags).
>
> - ops get_dir_flags() return dynamically the current gpio configuration,
>   it is used by the new API dm_gpio_get_dir_flags().
>
> When these optional ops are absent, the gpio uclass use the mandatory ops
> (direction_output, direction_input, get_value) and desc->flags to manage
> only the main dir flags:
> - GPIOD_IS_IN
> - GPIOD_IS_OUT
> - GPIOD_IS_OUT_ACTIVE
> - GPIOD_ACTIVE_LOW
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - change the proposed ops for pin config to set_dir_flags/get_dir_flags
> - reused the existing API dm_gpio_set_dir_flags/dm_gpio_set_dir
> - add a new API dm_gpio_get_dir_flags
>
>  drivers/gpio/gpio-uclass.c | 157 +++++++++++++++++++++++++++++++------
>  include/asm-generic/gpio.h |  65 +++++++++++++--
>  2 files changed, 192 insertions(+), 30 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

>
> diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
> index 0870458e96..241293f4b4 100644
> --- a/drivers/gpio/gpio-uclass.c
> +++ b/drivers/gpio/gpio-uclass.c
> @@ -140,8 +140,27 @@ int gpio_xlate_offs_flags(struct udevice *dev, struct gpio_desc *desc,
>         if (args->args_count < 2)
>                 return 0;
>
> +       desc->flags = 0;
>         if (args->args[1] & GPIO_ACTIVE_LOW)
> -               desc->flags = GPIOD_ACTIVE_LOW;
> +               desc->flags |= GPIOD_ACTIVE_LOW;
> +
> +       /*
> +        * need to test 2 bits for gpio output binding:
> +        * OPEN_DRAIN (0x6) = SINGLE_ENDED (0x2) | LINE_OPEN_DRAIN (0x4)
> +        * OPEN_SOURCE (0x2) = SINGLE_ENDED (0x2) | LINE_OPEN_SOURCE (0x0)
> +        */
> +       if (args->args[1] & GPIO_SINGLE_ENDED) {
> +               if (args->args[1] & GPIO_LINE_OPEN_DRAIN)
> +                       desc->flags |= GPIOD_OPEN_DRAIN;
> +               else
> +                       desc->flags |= GPIOD_OPEN_SOURCE;
> +       }
> +
> +       if (args->args[1] & GPIO_PULL_UP)
> +               desc->flags |= GPIOD_PULL_UP;
> +
> +       if (args->args[1] & GPIO_PULL_DOWN)
> +               desc->flags |= GPIOD_PULL_DOWN;
>
>         return 0;
>  }
> @@ -476,18 +495,24 @@ int gpio_direction_output(unsigned gpio, int value)
>                                                         desc.offset, value);
>  }
>
> -int dm_gpio_get_value(const struct gpio_desc *desc)
> +static int _gpio_get_value(const struct gpio_desc *desc)
>  {
>         int value;
> +
> +       value = gpio_get_ops(desc->dev)->get_value(desc->dev, desc->offset);
> +
> +       return desc->flags & GPIOD_ACTIVE_LOW ? !value : value;
> +}
> +
> +int dm_gpio_get_value(const struct gpio_desc *desc)
> +{
>         int ret;
>
>         ret = check_reserved(desc, "get_value");
>         if (ret)
>                 return ret;
>
> -       value = gpio_get_ops(desc->dev)->get_value(desc->dev, desc->offset);
> -
> -       return desc->flags & GPIOD_ACTIVE_LOW ? !value : value;
> +       return _gpio_get_value(desc);
>  }
>
>  int dm_gpio_set_value(const struct gpio_desc *desc, int value)
> @@ -504,39 +529,119 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value)
>         return 0;
>  }
>
> -int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
> +/* check dir flags invalid configuration */
> +static int check_dir_flags(ulong flags)
> +{
> +       if ((flags & GPIOD_IS_OUT) && (flags & GPIOD_IS_IN))
> +               return -EINVAL;
> +
> +       if ((flags & GPIOD_PULL_UP) && (flags & GPIOD_PULL_DOWN))
> +               return -EINVAL;
> +
> +       if ((flags & GPIOD_OPEN_DRAIN) && (flags & GPIOD_OPEN_SOURCE))
> +               return -EINVAL;

Can we use different error numbers here, so that people can figure out
what is going on?

> +
> +       return 0;
> +}
> +
> +static int _dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
>  {
>         struct udevice *dev = desc->dev;
>         struct dm_gpio_ops *ops = gpio_get_ops(dev);
> +       struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
>         int ret;
>
> -       ret = check_reserved(desc, "set_dir");
> -       if (ret)
> -               return ret;
> +       ret = check_dir_flags(flags);
> +       if (ret) {
> +               dev_err(dev,
> +                       "%s error: set_dir_flags for gpio %s%d has invalid dir flags 0x%lx\n",
> +                       desc->dev->name,
> +                       uc_priv->bank_name ? uc_priv->bank_name : "",
> +                       desc->offset, flags);

log_debug()
Also should return error

>
> -       if (flags & GPIOD_IS_OUT) {
> -               int value = flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
> +               return ret;
> +       }
>
> -               if (flags & GPIOD_ACTIVE_LOW)
> -                       value = !value;
> -               ret = ops->direction_output(dev, desc->offset, value);
> -       } else  if (flags & GPIOD_IS_IN) {
> -               ret = ops->direction_input(dev, desc->offset);
> +       /* GPIOD_ are directly managed by driver in set_dir_flags*/
> +       if (ops->set_dir_flags) {
> +               ret = ops->set_dir_flags(dev, desc->offset, flags);
> +       } else {
> +               if (flags & GPIOD_IS_OUT) {
> +                       ret = ops->direction_output(dev, desc->offset,
> +                                                   GPIOD_FLAGS_OUTPUT(flags));
> +               } else if (flags & GPIOD_IS_IN) {
> +                       ret = ops->direction_input(dev, desc->offset);
> +               }
>         }
> +
> +       return ret;
> +}
> +
> +int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
> +{
> +       int ret;
> +
> +       ret = check_reserved(desc, "set_dir_flags");
>         if (ret)
>                 return ret;
> -       /*
> -        * Update desc->flags here, so that GPIO_ACTIVE_LOW is honoured in
> -        * futures
> -        */
> -       desc->flags = flags;
>
> -       return 0;
> +       /* combine the requested flags (for IN/OUT) and the descriptor flags */
> +       flags |= desc->flags;
> +       ret = _dm_gpio_set_dir_flags(desc, flags);
> +
> +       /* update the descriptor flags */
> +       if (ret)
> +               desc->flags = flags;
> +
> +       return ret;
>  }
>
>  int dm_gpio_set_dir(struct gpio_desc *desc)
>  {
> -       return dm_gpio_set_dir_flags(desc, desc->flags);
> +       int ret;
> +
> +       ret = check_reserved(desc, "set_dir");
> +       if (ret)
> +               return ret;
> +
> +       return _dm_gpio_set_dir_flags(desc, desc->flags);
> +}
> +
> +int dm_gpio_get_dir_flags(struct gpio_desc *desc, ulong *flags)
> +{
> +       struct udevice *dev = desc->dev;
> +       struct dm_gpio_ops *ops = gpio_get_ops(dev);
> +       int ret, value;
> +       ulong dir_flags;
> +
> +       ret = check_reserved(desc, "get_dir_flags");
> +       if (ret)
> +               return ret;
> +
> +       /* GPIOD_ are directly provided by driver except GPIOD_ACTIVE_LOW*/

Space before *

> +       if (ops->get_dir_flags) {
> +               ret = ops->get_dir_flags(dev, desc->offset, &dir_flags);
> +               if (ret)
> +                       return ret;
> +
> +               /* GPIOD_ACTIVE_LOW is saved in desc->flags */
> +               value = dir_flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
> +               if (desc->flags & GPIOD_ACTIVE_LOW)
> +                       value = !value;
> +               dir_flags &= ~(GPIOD_ACTIVE_LOW | GPIOD_IS_OUT_ACTIVE);
> +               dir_flags |= (desc->flags & GPIOD_ACTIVE_LOW);
> +               if (value)
> +                       dir_flags |= GPIOD_IS_OUT_ACTIVE;
> +       } else {
> +               dir_flags = desc->flags;
> +               /* only GPIOD_IS_OUT_ACTIVE is provided by uclass */
> +               dir_flags &= ~GPIOD_IS_OUT_ACTIVE;
> +               if ((desc->flags & GPIOD_IS_OUT) && _gpio_get_value(desc))
> +                       dir_flags |= GPIOD_IS_OUT_ACTIVE;
> +       }
> +       *flags = dir_flags;
> +
> +       return 0;
>  }
>
>  /**
> @@ -809,7 +914,7 @@ static int gpio_request_tail(int ret, const char *nodename,
>                 debug("%s: dm_gpio_requestf failed\n", __func__);
>                 goto err;
>         }
> -       ret = dm_gpio_set_dir_flags(desc, flags | desc->flags);
> +       ret = dm_gpio_set_dir_flags(desc, flags);
>         if (ret) {
>                 debug("%s: dm_gpio_set_dir failed\n", __func__);
>                 goto err;
> @@ -1036,6 +1141,10 @@ static int gpio_post_bind(struct udevice *dev)
>                         ops->get_function += gd->reloc_off;
>                 if (ops->xlate)
>                         ops->xlate += gd->reloc_off;
> +               if (ops->set_dir_flags)
> +                       ops->set_dir_flags += gd->reloc_off;
> +               if (ops->get_dir_flags)
> +                       ops->get_dir_flags += gd->reloc_off;
>
>                 reloc_done++;
>         }
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index 454578c8d2..c6991be1c9 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -117,10 +117,15 @@ struct udevice;
>  struct gpio_desc {
>         struct udevice *dev;    /* Device, NULL for invalid GPIO */
>         unsigned long flags;
> +
>  #define GPIOD_IS_OUT           BIT(1)  /* GPIO is an output */
>  #define GPIOD_IS_IN            BIT(2)  /* GPIO is an input */
>  #define GPIOD_ACTIVE_LOW       BIT(3)  /* value has active low */

s/has/is/ ?

>  #define GPIOD_IS_OUT_ACTIVE    BIT(4)  /* set output active */
> +#define GPIOD_OPEN_DRAIN       BIT(5)  /* GPIO is open drain type */
> +#define GPIOD_OPEN_SOURCE      BIT(6)  /* GPIO is open source type */
> +#define GPIOD_PULL_UP          BIT(7)  /* GPIO has pull up enabled */
> +#define GPIOD_PULL_DOWN                BIT(8)  /* GPIO has pull down enabled */

pull-down or pulldown

>
>         uint offset;            /* GPIO offset within the device */
>         /*
> @@ -129,6 +134,12 @@ struct gpio_desc {
>          */
>  };
>
> +/* helper to compute the value of the gpio output */
> +#define GPIOD_FLAGS_OUTPUT_MASK (GPIOD_ACTIVE_LOW | GPIOD_IS_OUT_ACTIVE)
> +#define GPIOD_FLAGS_OUTPUT(flags) \
> +       (((((flags) & GPIOD_FLAGS_OUTPUT_MASK) == GPIOD_IS_OUT_ACTIVE) || \
> +         (((flags) & GPIOD_FLAGS_OUTPUT_MASK) == GPIOD_ACTIVE_LOW)) ? 1 : 0)
> +

You can drop the ? 1 : 0 since boolean expressions do that anyway.

>  /**
>   * dm_gpio_is_valid() - Check if a GPIO is valid
>   *
> @@ -253,6 +264,7 @@ struct dm_gpio_ops {
>                                 int value);
>         int (*get_value)(struct udevice *dev, unsigned offset);
>         int (*set_value)(struct udevice *dev, unsigned offset, int value);
> +
>         /**
>          * get_function() Get the GPIO function
>          *
> @@ -287,6 +299,37 @@ struct dm_gpio_ops {
>          */
>         int (*xlate)(struct udevice *dev, struct gpio_desc *desc,
>                      struct ofnode_phandle_args *args);
> +
> +       /**
> +        * set_dir_flags() - Set GPIO dir flags
> +        *
> +        * This function should set up the GPIO configuration according to the
> +        * information provide by the direction flags bitfield.
> +        *
> +        * This method is optional.
> +        *
> +        * @dev:        GPIO device
> +        * @offset:     GPIO offset within that device
> +        * @flags:      GPIO configuration to use
> +        * @return 0 if OK, -ve on error
> +        */
> +       int (*set_dir_flags)(struct udevice *dev, unsigned int offset,
> +                            ulong flags);
> +
> +       /**
> +        * get_dir_flags() - Get GPIO dir flags
> +        *
> +        * This function return the GPIO direction flags used.
> +        *
> +        * This method is optional.
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
> @@ -586,8 +629,7 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value);
>  /**
>   * dm_gpio_set_dir() - Set the direction for a GPIO
>   *
> - * This sets up the direction according tot the provided flags. It will do
> - * nothing unless the direction is actually specified.
> + * This sets up the direction according to the GPIO flags: desc->flags.
>   *
>   * @desc:      GPIO description containing device, offset and flags,
>   *             previously returned by gpio_request_by_name()
> @@ -596,11 +638,10 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value);
>  int dm_gpio_set_dir(struct gpio_desc *desc);
>
>  /**
> - * dm_gpio_set_dir_flags() - Set direction using specific flags
> + * dm_gpio_set_dir_flags() - Set direction using add flags
>   *
> - * This is like dm_gpio_set_dir() except that the flags value is provided
> - * instead of being used from desc->flags. This is needed because in many
> - * cases the GPIO description does not include direction information.
> + * This sets up the direction according tot the provided flags and the GPIO
> + * description (desc->flags) which include direction information.
>   * Note that desc->flags is updated by this function.
>   *
>   * @desc:      GPIO description containing device, offset and flags,
> @@ -610,6 +651,18 @@ int dm_gpio_set_dir(struct gpio_desc *desc);
>   */
>  int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags);
>
> +/**
> + * dm_gpio_get_dir_flags() - Get direction flags
> + *
> + * read the current direction flags
> + *
> + * @desc:      GPIO description containing device, offset and flags,
> + *             previously returned by gpio_request_by_name()
> + * @flags:     place to put the used flags
> + * @return 0 if OK, -ve on error, in which case desc->flags is not updated
> + */
> +int dm_gpio_get_dir_flags(struct gpio_desc *desc, ulong *flags);
> +
>  /**
>   * gpio_get_number() - Get the global GPIO number of a GPIO
>   *
> --
> 2.17.1
>

There's a lot going on in this patch.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
