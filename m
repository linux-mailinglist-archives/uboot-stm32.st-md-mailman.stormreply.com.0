Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3275B838
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Jul 2023 21:43:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EFB7C6B442;
	Thu, 20 Jul 2023 19:43:07 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E700C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 19:43:06 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-51e29ede885so1511350a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689882186; x=1690486986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pT/67bWcMWBXgJZNTvGXnNFUNITrDbuN541E5h1r/gI=;
 b=Ts6XV5ZpxIZFcsstJ0GppMLEmJ3w8KkOiUv0VtvyQKGYEFXvrma2cXp6yIfNZ3qNvt
 7toRGyC87JBw+WrHrQ4s5lhtrbe3DTcW//zcgeDdkcJTkutQ4qbm/VoecmnOq9J+Vp54
 KuEsE84qjG1edVKTq2wYiHAYiov+i6QGne4pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689882186; x=1690486986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pT/67bWcMWBXgJZNTvGXnNFUNITrDbuN541E5h1r/gI=;
 b=PcGMQEmDzKDDGSQMibRwH1jDCx1lmgi0uz5g87MflTGGloI4MDf97TThowCX0vFqy0
 12a8H3ltPkEXdw8CoBymgYhd9QHx8VghcCQsRZAPj44zezsPWs4orOxhWYq2RJX4KtqA
 +C24Ev3JQFv3xzX2/tYUWvJDCg7ILmKGK++6z+ndVaXwE6dBTULVP/dwcqYcOeX7TKTH
 PGzw38cjpIP6Vr/1ZTUWGOFNBBdm4UkU7db8jTYVgwfpTW1nNSNgb+0QPkb/gyffDTVX
 p1/HYTyxc0A+cIgusTCD4gfwmk7/cH8vIKQ83EgWnQpUgc7RncBIuEqT82/O9QpX19ue
 2zEg==
X-Gm-Message-State: ABy/qLaqVHy4tuBy3fhnhgvVBh9+IQKbpK0R7G4GscW6nnuE5FyZegBX
 eMA8nHMDYwffVfmGXE5Q1qJroxdNkAekPO3nBX3eElgtAmhc5cXqv2E=
X-Google-Smtp-Source: APBJJlEom4fIl5NufqUy+M+/U3RF+CR8oxVnm9a0IRt5Kj6gMWpMW/HobP/M6jE7YixgLEVjAVgZ7g8obLD+NaR2GUg=
X-Received: by 2002:aa7:cd52:0:b0:521:aeba:c6c8 with SMTP id
 v18-20020aa7cd52000000b00521aebac6c8mr5371960edw.39.1689882185615; Thu, 20
 Jul 2023 12:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-2-clamor95@gmail.com>
In-Reply-To: <20230720123744.26854-2-clamor95@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Jul 2023 13:42:52 -0600
Message-ID: <CAPnjgZ3BnsiR-=w6Bp5m0eT9ZQ-_MQ-4HpmBierAfxGmTCeE=Q@mail.gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 u-boot@dh-electronics.com, Matteo Lisi <matteo.lisi@engicam.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/7] power: regulator: expand basic
 reference counter onto all uclass
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

Hi Svyatoslav,

On Thu, 20 Jul 2023 at 06:38, Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> Commit is based on 4fcba5d ("regulator: implement basic reference
> counter") but expands the idea to all regulators instead of just
> fixed/gpio regulators.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/power/regulator/regulator-uclass.c | 41 ++++++++++++++++++++++
>  drivers/power/regulator/regulator_common.c | 22 ------------
>  drivers/power/regulator/regulator_common.h | 21 -----------
>  include/power/regulator.h                  |  2 ++
>  4 files changed, 43 insertions(+), 43 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

nit below

>
> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> index 3a6ba69f6d..fc7a4631b4 100644
> --- a/drivers/power/regulator/regulator-uclass.c
> +++ b/drivers/power/regulator/regulator-uclass.c
> @@ -159,6 +159,25 @@ int regulator_get_enable(struct udevice *dev)
>         return ops->get_enable(dev);
>  }
>
> +/*
> + * Enable or Disable a regulator
> + *
> + * This is a reentrant function and subsequent calls that enable will
> + * increase an internal counter, and disable calls will decrease the counter.
> + * The actual resource will be enabled when the counter gets to 1 coming from 0,
> + * and disabled when it reaches 0 coming from 1.
> + *
> + * @dev: regulator device
> + * @enable: bool indicating whether to enable or disable the regulator
> + * @return:
> + * 0 on Success
> + * -EBUSY if the regulator cannot be disabled because it's requested by
> + *        another device
> + * -EALREADY if the regulator has already been enabled or has already been
> + *        disabled
> + * -EACCES if there is no possibility to enable/disable the regulator
> + * -ve on different error situation
> + */
>  int regulator_set_enable(struct udevice *dev, bool enable)
>  {
>         const struct dm_regulator_ops *ops = dev_get_driver_ops(dev);
> @@ -172,6 +191,23 @@ int regulator_set_enable(struct udevice *dev, bool enable)
>         if (!enable && uc_pdata->always_on)
>                 return -EACCES;
>
> +       /* If previously enabled, increase count */
> +       if (enable && uc_pdata->enable_count > 0) {
> +               uc_pdata->enable_count++;
> +               return -EALREADY;
> +       }
> +
> +       if (!enable) {
> +               if (uc_pdata->enable_count > 1) {
> +                       /* If enabled multiple times, decrease count */
> +                       uc_pdata->enable_count--;
> +                       return -EBUSY;
> +               } else if (!uc_pdata->enable_count) {
> +                       /* If already disabled, do nothing */
> +                       return -EALREADY;
> +               }
> +       }
> +
>         if (uc_pdata->ramp_delay)
>                 old_enable = regulator_get_enable(dev);
>
> @@ -187,6 +223,11 @@ int regulator_set_enable(struct udevice *dev, bool enable)
>                 }
>         }
>
> +       if (enable)
> +               uc_pdata->enable_count++;
> +       else
> +               uc_pdata->enable_count--;
> +
>         return ret;
>  }
>
> diff --git a/drivers/power/regulator/regulator_common.c b/drivers/power/regulator/regulator_common.c
> index e26f5ebec3..d88bc6f6de 100644
> --- a/drivers/power/regulator/regulator_common.c
> +++ b/drivers/power/regulator/regulator_common.c
> @@ -72,23 +72,6 @@ int regulator_common_set_enable(const struct udevice *dev,
>                 return 0;
>         }
>
> -       /* If previously enabled, increase count */
> -       if (enable && plat->enable_count > 0) {
> -               plat->enable_count++;
> -               return -EALREADY;
> -       }
> -
> -       if (!enable) {
> -               if (plat->enable_count > 1) {
> -                       /* If enabled multiple times, decrease count */
> -                       plat->enable_count--;
> -                       return -EBUSY;
> -               } else if (!plat->enable_count) {
> -                       /* If already disabled, do nothing */
> -                       return -EALREADY;
> -               }
> -       }
> -
>         ret = dm_gpio_set_value(&plat->gpio, enable);
>         if (ret) {
>                 pr_err("Can't set regulator : %s gpio to: %d\n", dev->name,
> @@ -103,10 +86,5 @@ int regulator_common_set_enable(const struct udevice *dev,
>         if (!enable && plat->off_on_delay_us)
>                 udelay(plat->off_on_delay_us);
>
> -       if (enable)
> -               plat->enable_count++;
> -       else
> -               plat->enable_count--;
> -
>         return 0;
>  }
> diff --git a/drivers/power/regulator/regulator_common.h b/drivers/power/regulator/regulator_common.h
> index d4962899d8..15f1fa4c93 100644
> --- a/drivers/power/regulator/regulator_common.h
> +++ b/drivers/power/regulator/regulator_common.h
> @@ -13,7 +13,6 @@ struct regulator_common_plat {
>         struct gpio_desc gpio; /* GPIO for regulator enable control */
>         unsigned int startup_delay_us;
>         unsigned int off_on_delay_us;
> -       unsigned int enable_count;
>  };
>
>  int regulator_common_of_to_plat(struct udevice *dev,
> @@ -21,26 +20,6 @@ int regulator_common_of_to_plat(struct udevice *dev,
>                                 char *enable_gpio_name);
>  int regulator_common_get_enable(const struct udevice *dev,
>         struct regulator_common_plat *plat);
> -/*
> - * Enable or Disable a regulator
> - *
> - * This is a reentrant function and subsequent calls that enable will
> - * increase an internal counter, and disable calls will decrease the counter.
> - * The actual resource will be enabled when the counter gets to 1 coming from 0,
> - * and disabled when it reaches 0 coming from 1.
> - *
> - * @dev: regulator device
> - * @plat: Platform data
> - * @enable: bool indicating whether to enable or disable the regulator
> - * @return:
> - * 0 on Success
> - * -EBUSY if the regulator cannot be disabled because it's requested by
> - *        another device
> - * -EALREADY if the regulator has already been enabled or has already been
> - *        disabled
> - * -EACCES if there is no possibility to enable/disable the regulator
> - * -ve on different error situation
> - */
>  int regulator_common_set_enable(const struct udevice *dev,
>         struct regulator_common_plat *plat, bool enable);
>
> diff --git a/include/power/regulator.h b/include/power/regulator.h
> index ff1bfc2435..727776a8cf 100644
> --- a/include/power/regulator.h
> +++ b/include/power/regulator.h
> @@ -158,6 +158,7 @@ enum regulator_flag {
>   * @name**     - fdt regulator name - should be taken from the device tree
>   * ctrl_reg:   - Control register offset used to enable/disable regulator
>   * volt_reg:   - register offset for writing voltage vsel values
> + * enable_count - counter of enable calls for this regulator
>   *
>   * Note:
>   * *  - set automatically on device probe by the uclass's '.pre_probe' method.
> @@ -184,6 +185,7 @@ struct dm_regulator_uclass_plat {
>         u8 volt_reg;
>         bool suspend_on;
>         u32 suspend_uV;
> +       u32 enable_count;

Please add a comment for this

>  };
>
>  /* Regulator device operations */
> --
> 2.39.2
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
