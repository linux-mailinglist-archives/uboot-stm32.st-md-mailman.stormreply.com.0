Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B9491A1A7
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jun 2024 10:37:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18B49C71289;
	Thu, 27 Jun 2024 08:37:30 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40F90C71282
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 08:37:22 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-79c0bc8092dso228733785a.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719477441; x=1720082241;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+Drsax0+dXEStDCtvGER0XXppogmnc1mTb7HjV3GTpI=;
 b=b478eor8epAWSSptnXGMp/CreswUGe5ODbr6QfZP23PVsyAmS8ybNTGxaYbxefIK8c
 Wm83SyRIb708zCjNLtLSunrjKBLVYHvCEE0exQAJ1hUXI52i5hLZ0GSj452+k8FoAQeG
 qNMRHaEqvEQy+gJ3My130kHc9O/ODz3XrSoo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719477441; x=1720082241;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Drsax0+dXEStDCtvGER0XXppogmnc1mTb7HjV3GTpI=;
 b=dOGU6D2Wj1+tLdPUXxNP2R4vNmOdNCzQbXdI4qV9e5/DYuut7R7AW28QhFGRvM+6ek
 zkr4/5wP8qmnSoGJ6HekTYauAFsr0IJVFtoc58V6oCy+zbJTbkfidONeAWkpPCvzp2+q
 LdrL1vJhS3fYaa9lQXBw+S7bNZoMqi89lzYaGgP8YUNbdYjIEogjjeZ6XXRD+2sFzsUG
 Z3o/5qBoHv5kf7tRbArYlF3b42CkiwXNp+MQX7O1hWx5ShblATkQeslV+L9Rzb5fpmYF
 /6GwlQuW+JUiyuv7Kazvz4FLQ03tgT4JCTh15cvNBvMvLFncuiX90jMGR02L5D6eJAtu
 K6MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXupORDlZAZNoiKdgNemcDa1ShnlnKJZuWi7ypFeXY6gZaJZWd7OGgO0nGk3M4/LyyuekunQrS+pfRncxYPN8Ce4CHPG8nYjzPGsuCQULiB8+AqXONHf41I
X-Gm-Message-State: AOJu0YxREtcqqxSioUVXTHXCcqbKRngAeBLOApUIF5gx8tF7b+3uESh5
 Rcpuju1kL7Y1tg8J7afQ3YTlpp8gS4VFpPurB9R4hKuoLwCdG728ZmxwwbH3DOiNgqA8VNKCfWK
 L6LquWUmdngyuAfeKlPAKPzo7AqTj5srSXRoq
X-Google-Smtp-Source: AGHT+IGxdtL7Rroo0sFI11mpUZ72HuIEcxMYc5mTwDbHV/ylp+hOvCtvlxZ9tIns2pZk0WDsq2X5RlsVPhlwN1EehHk=
X-Received: by 2002:a0c:f94d:0:b0:6b2:b2a3:67ce with SMTP id
 6a1803df08f44-6b582745041mr35980076d6.51.1719477441110; Thu, 27 Jun 2024
 01:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
In-Reply-To: <20240626235717.272219-1-marex@denx.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 Jun 2024 09:37:10 +0100
Message-ID: <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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
> In case a regulator DT node contains regulator-always-on or regulator-boot-on
> property, make sure the regulator gets correctly configured by U-Boot on start
> up. Unconditionally probe such regulator drivers. This is a preparatory patch
> for introduction of .regulator_post_probe() which would trigger the regulator
> configuration.
>
> Parsing of regulator-always-on and regulator-boot-on DT property has been
> moved to regulator_post_bind() as the information is required early, the
> rest of the DT parsing has been kept in regulator_pre_probe() to avoid
> slowing down the boot process.
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
>  drivers/power/regulator/regulator-uclass.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> index 66fd531da04..ccc4ef33d83 100644
> --- a/drivers/power/regulator/regulator-uclass.c
> +++ b/drivers/power/regulator/regulator-uclass.c
> @@ -433,6 +433,8 @@ static int regulator_post_bind(struct udevice *dev)
>         const char *property = "regulator-name";
>
>         uc_pdata = dev_get_uclass_plat(dev);
> +       uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
> +       uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
>
>         /* Regulator's mandatory constraint */
>         uc_pdata->name = dev_read_string(dev, property);
> @@ -444,13 +446,21 @@ static int regulator_post_bind(struct udevice *dev)
>                         return -EINVAL;
>         }
>
> -       if (regulator_name_is_unique(dev, uc_pdata->name))
> -               return 0;
> +       if (!regulator_name_is_unique(dev, uc_pdata->name)) {
> +               debug("'%s' of dev: '%s', has nonunique value: '%s\n",
> +                     property, dev->name, uc_pdata->name);
> +               return -EINVAL;
> +       }
>
> -       debug("'%s' of dev: '%s', has nonunique value: '%s\n",
> -             property, dev->name, uc_pdata->name);
> +       /*
> +        * In case the regulator has regulator-always-on or
> +        * regulator-boot-on DT property, trigger probe() to
> +        * configure its default state during startup.
> +        */
> +       if (uc_pdata->always_on && uc_pdata->boot_on)
> +               dev_or_flags(dev, DM_FLAG_PROBE_AFTER_BIND);
>
> -       return -EINVAL;
> +       return 0;
>  }
>
>  static int regulator_pre_probe(struct udevice *dev)
> @@ -473,8 +483,6 @@ static int regulator_pre_probe(struct udevice *dev)
>                                                 -ENODATA);
>         uc_pdata->max_uA = dev_read_u32_default(dev, "regulator-max-microamp",
>                                                 -ENODATA);
> -       uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
> -       uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
>         uc_pdata->ramp_delay = dev_read_u32_default(dev, "regulator-ramp-delay",
>                                                     0);
>         uc_pdata->force_off = dev_read_bool(dev, "regulator-force-boot-off");
> --
> 2.43.0
>

This is reading a lot of DT stuff very early, which may be slow. It is
also reading from the DT in the bind() step which we sometimes have to
do, but try to avoid.

Also this seems to happen in SPL and again pre-reloc and again in
U-Boot post-reloc?

Should we have a step in the init sequence where we set up the
regulators, by calling regulators_enable_boot_on() ?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
