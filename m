Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED291A1A8
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jun 2024 10:37:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D417C71282;
	Thu, 27 Jun 2024 08:37:30 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F2A4C71280
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 08:37:24 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6b553b1a159so18508006d6.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719477443; x=1720082243;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lMc4ljFg7l2S+adb42/qqkZ0lAiGcoiXen99I9SZOAg=;
 b=f2xQNfZkwmNuDTH1/rGIBYxtLwckvd0R/+QeJqE7RRdoYTTYuOOUQ9v2gdV1h7e7js
 wPxLr4VaKLrhm9UOiGY5kG4ffIqtkZcA9yGzVPoEpkEZLyGSuawGZAqu0pakI+6vVeKh
 zS82sh7BBf4IVUQMYdfaqnNx3clzNsevusKsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719477443; x=1720082243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lMc4ljFg7l2S+adb42/qqkZ0lAiGcoiXen99I9SZOAg=;
 b=XZxCEEpT+kEhm7UG7QPo0JXQxyAZ4Ta11F6Wy4QS/W3IxTrQFa1OlKK+22VPvK6TH1
 Nm1FPvDSwzn+Ks0NXcDmXS1nh/QyXvBagr7AYNlnHSMAUklWMrtUqyF0V6iIdk/BOoQ5
 tdr/UyDAs71NEanW9lfkpOJCOkTV4n3axEuCzS7BiAQmG2gTEvGbUIY4Zaa5YKtmewFd
 uvZQnr4agXxZL12CK1MUUQzgeVnmBj0xkQVOGUeqaN4faQcbVr8MWd6yy3+O2vR5pIJ6
 ELx6oz8pLJ0RU4NmowFzyo4gf7wmdl/E5x2vQaT6UrYqqhJLYdAUyap0kHta7u6rTx4l
 H8fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtTEq4tQ+CGy4gIFd2lDqlz1f1CSASYtIo5duxkFzhv4TUcNq9fr31c9DQmEzMEH10I94M7e8l+/yqXa2vqlFxQlaKkjNUKzege7DaVEhxQEu9Lk4Kk989
X-Gm-Message-State: AOJu0Yw8zt1B/1Ex1GnNHasdsMAjGYnIOjiEy5wprtemdZ9kAlGDgF26
 jqsEcCcxosB7XGLdZGgUvTNwrGSQ8QHqJDyntQwEAryu1htscs/Grgugn8mspJpploauxo7tNj5
 TEbt3BlpsuQWGu2BeEyxyJs2Q0IHHG7pAXZjT
X-Google-Smtp-Source: AGHT+IFhGtaZsYu+JsYbMdjHkL2dtU5fQIErE4zdPS5c616U3P2RmZjS4NhZe2IDSecjFCkeWrNkXlWWgx+G8U2nAF0=
X-Received: by 2002:a0c:cb87:0:b0:6b4:fc60:a835 with SMTP id
 6a1803df08f44-6b540cedfb6mr137771266d6.56.1719477442975; Thu, 27 Jun 2024
 01:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <20240626235717.272219-2-marex@denx.de>
In-Reply-To: <20240626235717.272219-2-marex@denx.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 Jun 2024 09:37:12 +0100
Message-ID: <CAFLszTjb7=x78V7-75Ch11wdJy2CBnuYE1_+11b+mivokCFm=Q@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Tom Rini <trini@konsulko.com>, u-boot-qcom@groups.io,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Kostya Porotchkin <kostap@marvell.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jonas Karlman <jonas@kwiboo.se>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, u-boot@dh-electronics.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 2/4] power: regulator: Convert
 regulators_enable_boot_on/off() to regulator_post_probe
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

Hi Marek,


On Thu, 27 Jun 2024 at 00:57, Marek Vasut <marex@denx.de> wrote:
>
> Turn regulators_enable_boot_on() and regulators_enable_boot_off() into
> empty functions. Implement matching functionality in regulator_post_probe()
> instead. The regulator_post_probe() is called for all regulators after they
> probe, and regulators that have regulator-always-on or regulator-boot-on DT
> properties now always probe due to DM_FLAG_PROBE_AFTER_BIND being set on
> such regulators in regulator_post_bind().
>
> Finally, fold regulator_unset() functionality into regulator_autoset().
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Ben Wolsieffer <benwolsieffer@gmail.com>
> Cc: Caleb Connolly <caleb.connolly@linaro.org>
> Cc: Chris Morgan <macromorgan@hotmail.com>
> Cc: Dragan Simic <dsimic@manjaro.org>
> Cc: Eugen Hristev <eugen.hristev@collabora.com>
> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Kever Yang <kever.yang@rock-chips.com>
> Cc: Kostya Porotchkin <kostap@marvell.com>
> Cc: Matteo Lisi <matteo.lisi@engicam.com>
> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> Cc: Sam Day <me@samcday.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sumit Garg <sumit.garg@linaro.org>
> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Cc: u-boot-amlogic@groups.io
> Cc: u-boot-qcom@groups.io
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/power/regulator/regulator-uclass.c | 60 +++++++---------------
>  1 file changed, 19 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> index ccc4ef33d83..d52f273042f 100644
> --- a/drivers/power/regulator/regulator-uclass.c
> +++ b/drivers/power/regulator/regulator-uclass.c
> @@ -308,6 +308,11 @@ int regulator_autoset(struct udevice *dev)
>                         return ret;
>         }
>
> +       if (uc_pdata->force_off) {
> +               ret = regulator_set_enable(dev, false);
> +               goto out;
> +       }
> +
>         if (!uc_pdata->always_on && !uc_pdata->boot_on) {
>                 ret = -EMEDIUMTYPE;
>                 goto out;
> @@ -512,56 +517,28 @@ static int regulator_pre_probe(struct udevice *dev)
>         return 0;
>  }
>
> -int regulators_enable_boot_on(bool verbose)
> +static int regulator_post_probe(struct udevice *dev)
>  {
> -       struct udevice *dev;
> -       struct uclass *uc;
>         int ret;
>
> -       ret = uclass_get(UCLASS_REGULATOR, &uc);
> -       if (ret)
> +       ret = regulator_autoset(dev);
> +       if (ret && ret != -EMEDIUMTYPE && ret != ENOSYS)
>                 return ret;
> -       for (uclass_first_device(UCLASS_REGULATOR, &dev);
> -            dev;
> -            uclass_next_device(&dev)) {
> -               ret = regulator_autoset(dev);
> -               if (ret == -EMEDIUMTYPE) {
> -                       ret = 0;
> -                       continue;
> -               }
> -               if (verbose)
> -                       regulator_show(dev, ret);
> -               if (ret == -ENOSYS)
> -                       ret = 0;
> -       }
>
> -       return ret;
> +       if (_DEBUG)
> +               regulator_show(dev, ret);
> +
> +       return 0;
>  }
>
> -int regulators_enable_boot_off(bool verbose)
> +int regulators_enable_boot_on(bool verbose)
>  {
> -       struct udevice *dev;
> -       struct uclass *uc;
> -       int ret;
> -
> -       ret = uclass_get(UCLASS_REGULATOR, &uc);
> -       if (ret)
> -               return ret;
> -       for (uclass_first_device(UCLASS_REGULATOR, &dev);
> -            dev;
> -            uclass_next_device(&dev)) {
> -               ret = regulator_unset(dev);
> -               if (ret == -EMEDIUMTYPE) {
> -                       ret = 0;
> -                       continue;
> -               }
> -               if (verbose)
> -                       regulator_show(dev, ret);
> -               if (ret == -ENOSYS)
> -                       ret = 0;
> -       }
> +       return 0;
> +}
>
> -       return ret;
> +int regulators_enable_boot_off(bool verbose)
> +{
> +       return 0;
>  }
>
>  UCLASS_DRIVER(regulator) = {
> @@ -569,5 +546,6 @@ UCLASS_DRIVER(regulator) = {
>         .name           = "regulator",
>         .post_bind      = regulator_post_bind,
>         .pre_probe      = regulator_pre_probe,
> +       .post_probe     = regulator_post_probe,
>         .per_device_plat_auto   = sizeof(struct dm_regulator_uclass_plat),
>  };
> --
> 2.43.0
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
