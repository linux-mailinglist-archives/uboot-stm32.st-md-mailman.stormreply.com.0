Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B69C698F20F
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Oct 2024 17:03:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69551C78023;
	Thu,  3 Oct 2024 15:03:41 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8212DC6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2024 15:03:34 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6cb54eef205so9589906d6.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Oct 2024 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727967813; x=1728572613;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xck8TEVEakZw6XXAH4TtRZLZvmFsSi/9xxxJWDIcIoc=;
 b=dtzYs01EyR1XN7hcmQAqxTV1KVsQSaSLp3jEs1WTH8rZSDz2am+ZgPUbUA0HemcfG3
 PmwQIAusHx+W2dUhTduNUd2PvDqoShpnVrAXKdvc3s2XlwfFKozb/RoyFlZjgp1gYRAp
 uSAcH3IDh87E5LtubW6hvJubg2SWbS9h6RCpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727967813; x=1728572613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xck8TEVEakZw6XXAH4TtRZLZvmFsSi/9xxxJWDIcIoc=;
 b=opbmYw+lOQrh6gQTkx0RzlzVn3FBO5+4GocYnMhuSXyNlX0EoQbWZxOTyhGZ2lyt17
 roUoiFp5fzzgNa2WxkNQ2Wu9dcECmR29011OoN3sRcmKMIkXSdahATwqI+9EBNIav4Fw
 8GPx/ipXMPebANScPgzCacA3iLKH1q2B6MyNX16MIBxL04XkDcB858VfpMA28sX+XP3Q
 epxPIrU5SVxwVGYM3DlET3pCqTJ8GnZw46Gxo7QfRwvWVaGrEviG5e1/zOFabe8WOAxm
 CfZ4pW2N2wR+aTt2bO+mfrn0WuCMjewB8TN7yBCdXMDq72EjLI4zF/YkvKZWUyhNpvN4
 QwqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUylgbtra4FFbuvvefULyryhNbyyiFeY00zNMDa7FNwkAhW+MgyvH+vSme5Vw+08+j8dWn/Bgmq7v551w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxOu3mhiTjKxNHlWUep1MOjiaFJ3mbbAyMQQc41nnejwf/Tx85L
 t/Z/G3s6GZdAm4Vz5gE5KCpYK6d5gPYb9v2KUixCVkU4CRdmgMWqWnmuygMa/lL7UjJDlN5LwPG
 y7QQfJwnmAyV2ezF5TNj2QnkABVAA1QSIvIZq
X-Google-Smtp-Source: AGHT+IE+QRyARsoRaCYB6tQNlecqHjTlfcP+Kyk2IVOCMvrFm2dsTBn0aeztCGJwaKxtmnUs1c3RSifNTFmc7W2Smm4=
X-Received: by 2002:a05:6214:4890:b0:6b5:e2d9:cfb9 with SMTP id
 6a1803df08f44-6cb81b990bfmr103600146d6.39.1727967813377; Thu, 03 Oct 2024
 08:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240926231457.2933914-1-marex@denx.de>
 <20240926231457.2933914-2-marex@denx.de>
 <CAFLszThbZ5t+siC0Gz_7KaecTTwUA6J2uTdtHEaYoK+V6Rm_7A@mail.gmail.com>
 <20241003014042.GS4737@bill-the-cat>
In-Reply-To: <20241003014042.GS4737@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 3 Oct 2024 09:03:22 -0600
Message-ID: <CAFLszTiawdOfoMx-ZmMLW77dBS11WWVpWHNF-KfPi86xEJB+rQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Marek Vasut <marex@denx.de>, u-boot-qcom@groups.io,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
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
Subject: Re: [Uboot-stm32] [PATCH v3 2/4] power: regulator: Convert
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

Hi Tom,

On Wed, 2 Oct 2024 at 19:40, Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Oct 02, 2024 at 04:55:39PM -0600, Simon Glass wrote:
> > Hi,
> >
> > On Thu, 26 Sept 2024 at 17:15, Marek Vasut <marex@denx.de> wrote:
> > >
> > > Turn regulators_enable_boot_on() and regulators_enable_boot_off() into
> > > empty functions. Implement matching functionality in regulator_post_probe()
> > > instead. The regulator_post_probe() is called for all regulators after they
> > > probe, and regulators that have regulator-always-on or regulator-boot-on DT
> > > properties now always probe due to DM_FLAG_PROBE_AFTER_BIND being set on
> > > such regulators in regulator_post_bind().
> > >
> > > Finally, fold regulator_unset() functionality into regulator_autoset().
> > >
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Ben Wolsieffer <benwolsieffer@gmail.com>
> > > Cc: Caleb Connolly <caleb.connolly@linaro.org>
> > > Cc: Chris Morgan <macromorgan@hotmail.com>
> > > Cc: Dragan Simic <dsimic@manjaro.org>
> > > Cc: Eugen Hristev <eugen.hristev@collabora.com>
> > > Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > > Cc: Jaehoon Chung <jh80.chung@samsung.com>
> > > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Kever Yang <kever.yang@rock-chips.com>
> > > Cc: Matteo Lisi <matteo.lisi@engicam.com>
> > > Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> > > Cc: Max Krummenacher <max.krummenacher@toradex.com>
> > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> > > Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > > Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > > Cc: Quentin Schulz <quentin.schulz@cherry.de>
> > > Cc: Sam Day <me@samcday.com>
> > > Cc: Simon Glass <sjg@chromium.org>
> > > Cc: Sumit Garg <sumit.garg@linaro.org>
> > > Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Cc: Thierry Reding <treding@nvidia.com>
> > > Cc: Tom Rini <trini@konsulko.com>
> > > Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > > Cc: u-boot-amlogic@groups.io
> > > Cc: u-boot-qcom@groups.io
> > > Cc: u-boot@dh-electronics.com
> > > Cc: u-boot@lists.denx.de
> > > Cc: uboot-stm32@st-md-mailman.stormreply.com
> > > ---
> > > V2: Rebase on current u-boot/next
> > > V3: No change
> > > ---
> > >  drivers/power/regulator/regulator-uclass.c | 60 +++++++---------------
> > >  1 file changed, 19 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> > > index 1a970004540..9fcc4bd85b9 100644
> > > --- a/drivers/power/regulator/regulator-uclass.c
> > > +++ b/drivers/power/regulator/regulator-uclass.c
> > > @@ -314,6 +314,11 @@ int regulator_autoset(struct udevice *dev)
> > >                         return ret;
> > >         }
> > >
> > > +       if (uc_pdata->force_off) {
> > > +               ret = regulator_set_enable(dev, false);
> > > +               goto out;
> > > +       }
> > > +
> > >         if (!uc_pdata->always_on && !uc_pdata->boot_on) {
> > >                 ret = -EMEDIUMTYPE;
> > >                 goto out;
> > > @@ -518,56 +523,28 @@ static int regulator_pre_probe(struct udevice *dev)
> > >         return 0;
> > >  }
> > >
> > > -int regulators_enable_boot_on(bool verbose)
> > > +static int regulator_post_probe(struct udevice *dev)
> > >  {
> > > -       struct udevice *dev;
> > > -       struct uclass *uc;
> > >         int ret;
> > >
> > > -       ret = uclass_get(UCLASS_REGULATOR, &uc);
> > > -       if (ret)
> > > +       ret = regulator_autoset(dev);
> > > +       if (ret && ret != -EMEDIUMTYPE && ret != -EALREADY && ret != ENOSYS)
> > >                 return ret;
> > > -       for (uclass_first_device(UCLASS_REGULATOR, &dev);
> > > -            dev;
> > > -            uclass_next_device(&dev)) {
> > > -               ret = regulator_autoset(dev);
> > > -               if (ret == -EMEDIUMTYPE || ret == -EALREADY) {
> > > -                       ret = 0;
> > > -                       continue;
> > > -               }
> > > -               if (verbose)
> > > -                       regulator_show(dev, ret);
> > > -               if (ret == -ENOSYS)
> > > -                       ret = 0;
> > > -       }
> > >
> > > -       return ret;
> > > +       if (_DEBUG)
> > > +               regulator_show(dev, ret);
> > > +
> > > +       return 0;
> > >  }
> > >
> > > -int regulators_enable_boot_off(bool verbose)
> > > +int regulators_enable_boot_on(bool verbose)
> > >  {
> > > -       struct udevice *dev;
> > > -       struct uclass *uc;
> > > -       int ret;
> > > -
> > > -       ret = uclass_get(UCLASS_REGULATOR, &uc);
> > > -       if (ret)
> > > -               return ret;
> > > -       for (uclass_first_device(UCLASS_REGULATOR, &dev);
> > > -            dev;
> > > -            uclass_next_device(&dev)) {
> > > -               ret = regulator_unset(dev);
> > > -               if (ret == -EMEDIUMTYPE) {
> > > -                       ret = 0;
> > > -                       continue;
> > > -               }
> > > -               if (verbose)
> > > -                       regulator_show(dev, ret);
> > > -               if (ret == -ENOSYS)
> > > -                       ret = 0;
> > > -       }
> > > +       return 0;
> > > +}
> > >
> > > -       return ret;
> > > +int regulators_enable_boot_off(bool verbose)
> > > +{
> > > +       return 0;
> > >  }
> > >
> > >  UCLASS_DRIVER(regulator) = {
> > > @@ -575,5 +552,6 @@ UCLASS_DRIVER(regulator) = {
> > >         .name           = "regulator",
> > >         .post_bind      = regulator_post_bind,
> > >         .pre_probe      = regulator_pre_probe,
> > > +       .post_probe     = regulator_post_probe,
> > >         .per_device_plat_auto   = sizeof(struct dm_regulator_uclass_plat),
> > >  };
> > > --
> > > 2.45.2
> > >
> >
> > I thought I objected to this patch, but it seems to be in -next? Does
> > anyone know what has happened here?
>
> Yes, you missed me noting that this fixes real problems and has been
> needing to be fixed for a while. I said you should provide your
> alternative approach and we'll get this sorted out in -next and I took
> the work-around for master so the release wouldn't be broken.

OK ta. So long as we can revert/change that is fine.

>
> > I am seeing these errors now when running sandbox 'u-boot -D':
> >
> >        i2c_emul_find() No emulators for device 'sandbox_pmic'
> >   sandbox_pmic_write() write error to device: 0000000018c49db0 register: 0x0!
> >        out_set_value() PMIC write failed: -5
> >        i2c_emul_find() No emulators for device 'sandbox_pmic'
> >   sandbox_pmic_write() write error to device: 0000000018c49db0 register: 0x0!
> >        out_set_value() PMIC write failed: -5
>
> I suppose the good news is that perhaps this is also related to the
> problem that Svyatoslav was reporting.

OK, I actually never fully understood the problem, but yes, sandbox is
supposed to work similarly.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
