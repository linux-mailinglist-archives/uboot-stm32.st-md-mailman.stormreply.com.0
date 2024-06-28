Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56991B877
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2024 09:33:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C30B9C7128F;
	Fri, 28 Jun 2024 07:33:10 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32F4CC71287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 07:33:03 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4450187d3d4so2306461cf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 00:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719559982; x=1720164782;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KRuwi8DrHNH9PM7BQRvaS+69U0hYrnjGzRWy+oNkAKQ=;
 b=RDTwWlZUgjGbRb0TWgcBjYirBd9EfujwsSUorHaVPlbC11RyCUQYrF0Wc7eQp6YJ4z
 16/skMR64QwB91CTG3Yvp9xjaqLxeVaUWIQ709i3GiFIRtiUlWJyGFKLfyT0Hfr0IMPa
 2+hqL140i6vhyI2Z2cFhVm1uvXlidslquqCj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719559982; x=1720164782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRuwi8DrHNH9PM7BQRvaS+69U0hYrnjGzRWy+oNkAKQ=;
 b=rMPgVNWGKmrNelLbGstoG9ROywkGajpeVLGN2R5GF071rDEc94Jmw5EqYOXgWk3zVu
 9IDXJbdrcSX2havQoQsw8KfYuDKzmcyQq0k1Rp0apL5A/BFRyi35MRFJryvT/9jmlU7X
 JFbMpvcWMiIiuvsbLq8tEGJRjQVcO+iVglDXs5MgVZU/AHkPh79a+Tgfc73zxa1phXMR
 wAQZOuPfuiOx5AyH+oShEIcrE10eM3Xmu76DQSP5cPz5lQQhjiQVaKKKTbFJyB1LW2vo
 DjH7olBN3l96Dni0M87GbY/Cyy21XYn3ZK7MkAqhoEpg0qrVNmgn9gADns+j+9Sj0fWJ
 CjVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAvXtBbczxltUZ6csR+go6czF9LC/2YWwBsgaZDV9kOy63i6L2mlmPW51ZH7QmQg8gCWs61VInv2iWul9ZQkzJS+MMzJErT5OL0jfNSRPZPuMaZ0YWECBC
X-Gm-Message-State: AOJu0YwGpDcLGW8TJwtkECdJxhjhz6wfIue4It4QDhkVmVXpcBA+nVHp
 8Gb/jyuzoHrjitQfvTdpGk+z8gu2g+zEVI4mhbAiKwe3z/iiCCw2VUO+8sgRlJAl6pEbFPlGLbw
 sMy9OOOra+E51eNG82sJKwiyIUFuhqXu7Ks+Q
X-Google-Smtp-Source: AGHT+IFvHS8F/jJHGPcQ4bZNB2icCP5fYXZEuEoijfxibR04ttx09THt4jWsZqzbSXConhwlFpuOZxRCLKW5++dpdpA=
X-Received: by 2002:a05:6214:2464:b0:6b5:88:7cc8 with SMTP id
 6a1803df08f44-6b54099e969mr225534066d6.7.1719559982078; Fri, 28 Jun 2024
 00:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <6abad4ba-b29a-47a3-addb-91e8f46ee425@denx.de>
In-Reply-To: <6abad4ba-b29a-47a3-addb-91e8f46ee425@denx.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 28 Jun 2024 08:32:50 +0100
Message-ID: <CAFLszTgAqOXbkcJxYKxM4gn6_oOg7+nyaBK-Y34r_zVaPBScvA@mail.gmail.com>
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

On Thu, 27 Jun 2024 at 17:05, Marek Vasut <marex@denx.de> wrote:
>
> On 6/27/24 10:37 AM, Simon Glass wrote:
> > Hi Marek,
>
> Hi,
>
> [...]
>
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
> Actually, it is reading only the bare minimum very early in bind, the
> always-on and boot-on, the rest is in pre_probe, i.e. later.

Yes, I see that. Also it is inevitable that these properties need to
be read before probe(), since they control whether to probe().

>
> > Also this seems to happen in SPL and again pre-reloc and again in
> > U-Boot post-reloc?
>
> What does, the uclass post_bind ?

I mean that this code will be called in SPL (if the regulators are in
the DT there), U-Boot pre-reloc and post-reloc, each time turning on
the regulators. We need a way to control that, don't we?

>
> > Should we have a step in the init sequence where we set up the
> > regulators, by calling regulators_enable_boot_on() ?
>
> Let's not do this , the entire point of this series is to get rid of
> those functions and do the regulator configuration the same way LED
> subsystem does it -- by probing always-on/boot-on regulators and
> configuring them correctly on probe.
>
> To me regulators_enable_boot_on() and the like was always an
> inconsistently applied workaround for missing DM_FLAG_PROBE_AFTER_BIND ,
> which is now implemented, so such workarounds can be removed.

That patch seemed to slip under the radar, sent and applied on the
same day! We really need to add a test for it, BTW.

My concern is that this might cause us ordering problems. We perhaps
want the regulators to be done first. If drivers are probed which use
regulators, then presumably they will enable them. Consider this:

- LED driver auto-probes
   - probes I2C bus 2
   - probes LDO1 which is autoset so turns on
- LDO1 probes, but is already running
- LDO2 probes, which is autoset so turns on

So long as it is OK to enable the regulators in any order, then this
seems fine. But is it? How do we handle the case where are particular
sequence is needed?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
