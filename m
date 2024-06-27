Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147391A2A1
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jun 2024 11:26:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46B77C71289;
	Thu, 27 Jun 2024 09:26:41 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E54F7C71287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 09:26:39 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-79c04e6e1b9so244409885a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719480399; x=1720085199;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9HCQkxbz7QGTuVs+o2YIyzQ/LTHw4GzWIaZg3+8jgw0=;
 b=EQB2PjvMorM59CnT7Swz2cWMD7TlElsEfCm+fEUvpVHjyFFuxzslPKNS0bTzX9vXXk
 UkeO1DlYC4He5ynWcXoesC5ykO2TV4HoPuHwPJB2BP+cuVQp8gtiaq45HwqceMQffltS
 GQ8rP5kdQN4weL+t2+wKbmQ0Uh82QiN/D4kXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719480399; x=1720085199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9HCQkxbz7QGTuVs+o2YIyzQ/LTHw4GzWIaZg3+8jgw0=;
 b=Lr45ei9I6yGZxh8hC1KMGQVnPfHZu7OvLnhE9+3KU9V6kcf0aaG06QyVn3yxAsLlTo
 bBqFVGkRnMbwnl7Dny/OCvQzqNIsycW2fWizqQDJv+VPSW0JBb4ZX9GYnOjH7FKrQ4bT
 fYKhPL2qNlazsApphLeEf4dGb7KHZHruQ4ybM3rUC2lJwvaA9qkhTNVa0a0M3+6STJvN
 FPsktfWOFBoZVM8EAaMhQFiBe1VjAXXmIyRIpFL1r7gePZx/j9fYHF/gjFkiLcUCv4n3
 APqQ4zWCMCh462DQhl01WqS34fNCtMe9eMAr0PH3PxlElJumWxyKriEXv8ZFIptOcdw1
 XZRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG82S024uzOtLPmq03Or0VKMqJoJcyPbBb+lHfnIjQo9WtrJDawKsBMFVqn/kT6dRqNRPDCxS/ggtxwhihbSeb4/zyvgOsjNNFqFEC4cf58/xSvBg4jNVA
X-Gm-Message-State: AOJu0YzasFcR85zUqN0mrXbXTclUPtVRG3ElUtgR0XfnO77BvagQBx/3
 tjq05PB6+cwXN4WMh8avVlYPl9AkM7Qz+AYrIhx/Td8i9V2Mezr5z1k2wl9SjmFsSzN5Ri9VBfy
 7d1iifnfg4yU+O3/hFkCN886mRZo6Z1xPOyhl
X-Google-Smtp-Source: AGHT+IHjx8SlRRp5BuJIRV9LstlKWiXSSP60Vh8E7gab5ZtYSS89FtvFekbEHCF0KzVqKnCyoEl60+T6MbaZsk28Bfw=
X-Received: by 2002:a05:6214:5ed4:b0:6b2:d51c:f5b3 with SMTP id
 6a1803df08f44-6b58d36d1eamr23880166d6.18.1719480398847; Thu, 27 Jun 2024
 02:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <b84e8b10-8698-41f2-9648-0b3f5c399b02@linaro.org>
In-Reply-To: <b84e8b10-8698-41f2-9648-0b3f5c399b02@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 Jun 2024 10:26:28 +0100
Message-ID: <CAFLszTijRhB1dRraPBQSTU3ypJ_wJU7yghJ9c9Rk-XcbcfvkFg@mail.gmail.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot-qcom@groups.io, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Kostya Porotchkin <kostap@marvell.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jonas Karlman <jonas@kwiboo.se>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, u-boot@dh-electronics.com,
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

Hi Caleb,

On Thu, 27 Jun 2024 at 09:48, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
>
>
> On 27/06/2024 10:37, Simon Glass wrote:
> > Hi Marek,
> >
> > On Thu, 27 Jun 2024 at 00:57, Marek Vasut <marex@denx.de> wrote:
> >>
> >> In case a regulator DT node contains regulator-always-on or regulator-boot-on
> >> property, make sure the regulator gets correctly configured by U-Boot on start
> >> up. Unconditionally probe such regulator drivers. This is a preparatory patch
> >> for introduction of .regulator_post_probe() which would trigger the regulator
> >> configuration.
> >>
> >> Parsing of regulator-always-on and regulator-boot-on DT property has been
> >> moved to regulator_post_bind() as the information is required early, the
> >> rest of the DT parsing has been kept in regulator_pre_probe() to avoid
> >> slowing down the boot process.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> ---
> >> Cc: Ben Wolsieffer <benwolsieffer@gmail.com>
> >> Cc: Caleb Connolly <caleb.connolly@linaro.org>
> >> Cc: Chris Morgan <macromorgan@hotmail.com>
> >> Cc: Dragan Simic <dsimic@manjaro.org>
> >> Cc: Eugen Hristev <eugen.hristev@collabora.com>
> >> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> >> Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> >> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >> Cc: Jonas Karlman <jonas@kwiboo.se>
> >> Cc: Kever Yang <kever.yang@rock-chips.com>
> >> Cc: Kostya Porotchkin <kostap@marvell.com>
> >> Cc: Matteo Lisi <matteo.lisi@engicam.com>
> >> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> >> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> >> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> >> Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> >> Cc: Sam Day <me@samcday.com>
> >> Cc: Simon Glass <sjg@chromium.org>
> >> Cc: Sumit Garg <sumit.garg@linaro.org>
> >> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> >> Cc: Thierry Reding <treding@nvidia.com>
> >> Cc: Tom Rini <trini@konsulko.com>
> >> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> >> Cc: u-boot-amlogic@groups.io
> >> Cc: u-boot-qcom@groups.io
> >> Cc: u-boot@dh-electronics.com
> >> Cc: u-boot@lists.denx.de
> >> Cc: uboot-stm32@st-md-mailman.stormreply.com
> >> ---
> >>   drivers/power/regulator/regulator-uclass.c | 22 +++++++++++++++-------
> >>   1 file changed, 15 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> >> index 66fd531da04..ccc4ef33d83 100644
> >> --- a/drivers/power/regulator/regulator-uclass.c
> >> +++ b/drivers/power/regulator/regulator-uclass.c
> >> @@ -433,6 +433,8 @@ static int regulator_post_bind(struct udevice *dev)
> >>          const char *property = "regulator-name";
> >>
> >>          uc_pdata = dev_get_uclass_plat(dev);
> >> +       uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
> >> +       uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
> >>
> >>          /* Regulator's mandatory constraint */
> >>          uc_pdata->name = dev_read_string(dev, property);
> >> @@ -444,13 +446,21 @@ static int regulator_post_bind(struct udevice *dev)
> >>                          return -EINVAL;
> >>          }
> >>
> >> -       if (regulator_name_is_unique(dev, uc_pdata->name))
> >> -               return 0;
> >> +       if (!regulator_name_is_unique(dev, uc_pdata->name)) {
> >> +               debug("'%s' of dev: '%s', has nonunique value: '%s\n",
> >> +                     property, dev->name, uc_pdata->name);
> >> +               return -EINVAL;
> >> +       }
> >>
> >> -       debug("'%s' of dev: '%s', has nonunique value: '%s\n",
> >> -             property, dev->name, uc_pdata->name);
> >> +       /*
> >> +        * In case the regulator has regulator-always-on or
> >> +        * regulator-boot-on DT property, trigger probe() to
> >> +        * configure its default state during startup.
> >> +        */
> >> +       if (uc_pdata->always_on && uc_pdata->boot_on)
> >> +               dev_or_flags(dev, DM_FLAG_PROBE_AFTER_BIND);
> >>
> >> -       return -EINVAL;
> >> +       return 0;
> >>   }
> >>
> >>   static int regulator_pre_probe(struct udevice *dev)
> >> @@ -473,8 +483,6 @@ static int regulator_pre_probe(struct udevice *dev)
> >>                                                  -ENODATA);
> >>          uc_pdata->max_uA = dev_read_u32_default(dev, "regulator-max-microamp",
> >>                                                  -ENODATA);
> >> -       uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
> >> -       uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
> >>          uc_pdata->ramp_delay = dev_read_u32_default(dev, "regulator-ramp-delay",
> >>                                                      0);
> >>          uc_pdata->force_off = dev_read_bool(dev, "regulator-force-boot-off");
> >> --
> >> 2.43.0
> >>
> >
> > This is reading a lot of DT stuff very early, which may be slow. It is
> > also reading from the DT in the bind() step which we sometimes have to
> > do, but try to avoid.
>
> Could we set up the livetree pre-bind? What about MMU? On armv8 at least
> this would have a huge impact on performance. I've done some
> measurements and there is at least 1 order of magnitude difference
> between parsing FDT with no caches vs parsing livetree with, it's huge.

That seems like a great idea to me, in general. The fact that SPL sets
up the MMU on armv8 makes it more practical.

But for this series I believe we are going to have to define what
happens in what phase. We have power_init_board() which is the old way
of doing this...but perhaps we could use that as a way to start up
regulators which are needed.

As to my question about whether this happens in SPL / pre-reloc /
proper, I forgot that we have the bootph tags for that, so it should
be fine. The main issue is that in U-Boot proper we will re-init the
regulators even though that has already been done. Probably that can
be handled by Kconfig or a flag in SPL handoff.


> >
> > Also this seems to happen in SPL and again pre-reloc and again in
> > U-Boot post-reloc?
> >
> > Should we have a step in the init sequence where we set up the
> > regulators, by calling regulators_enable_boot_on() ?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
