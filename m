Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEFD975E4D
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Sep 2024 03:01:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 462D0C6C855;
	Thu, 12 Sep 2024 01:01:10 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12113C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 01:01:09 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-718d91eef2eso229081b3a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 18:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726102868; x=1726707668;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t5LnUs+3E25GlONNtCSTzMe04eZa+40fJGqgIpkNx7U=;
 b=JhA6uONi49J4uANmJ9mdweelAnBa5Xi+gaLLqF9atYd15oUfXlgXddfqLCsIOoB9zr
 b/KJeNKez1PBUM0ukvDw4/ID+ODysKI1wc/t6dDZvbXdS3fS1VBueCY0SdESmhAk1fS+
 BWMR1eXAxQc/GB1O3vuEV3pKwtPndxiIe5B/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726102868; x=1726707668;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t5LnUs+3E25GlONNtCSTzMe04eZa+40fJGqgIpkNx7U=;
 b=JmkBEYqRlmhijwIuubogviHq6sEoFRUBrPttNDgU1F4cNAxy2SIMwltACmwZWriJHU
 WsElJy6sYXO0DdgRaDqkLNI7tax4DodUqHOa/V7JaheIGpQyJOv/PqgZTQFRz9xRfYJg
 /1qbLWiAp5rRmui9L7s+cqQ2bSL7ZDwyAne5NCaKwfo7jE9INk+ORIpOx4wdpxJV4ma1
 Zd2DkjlK28M7/hsj0jsDRDLDIgs/c0P8SHCl6cUf1Joyw2gGjwDibVz1aMxVyow0NDsI
 35bT4+2FtqQF9afp1+ZBykHgniNmDYjCLXFRnW09w7KrrZqo4iMuF9Zmk2K5/5FKdJQN
 OG7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnb7p7hSXR3lqHfelXCaWVCSTrOVaRGhOs3o6UH0TKBrhGJ0C41uhQEvnxFL/0mWR1/2P1Y53TD3OcMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZAeRyRc0I+AvXcNL6anvZpFGZ/ma1Mca9l7jwJjkFDQMXv+gd
 eSGxfqSKgGVMjmnGu6y4vCfgH4ejpZN3AsXtbQNat9MsIza3Mpv8CT7bmRyZakiomc/K+bgbYiF
 bpH6BzKnE0xvtnBTgIsyj9DaSGDW62saZwJHX
X-Google-Smtp-Source: AGHT+IGayIgO2cDB67qAr/r9Qm3MVp5BQGGEHNZGej4dF4Fh8qVqB5M2/R/eJKiw84ELwE+iwxDn0k2KG+AheTH83/E=
X-Received: by 2002:a05:6a00:8985:b0:718:dda3:d7fe with SMTP id
 d2e1a72fcca58-71907f718c9mr11800099b3a.12.1726102867602; Wed, 11 Sep 2024
 18:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <6abad4ba-b29a-47a3-addb-91e8f46ee425@denx.de>
 <CAFLszTgAqOXbkcJxYKxM4gn6_oOg7+nyaBK-Y34r_zVaPBScvA@mail.gmail.com>
 <616b231b-0291-4bb3-93d9-85970419ed62@denx.de>
In-Reply-To: <616b231b-0291-4bb3-93d9-85970419ed62@denx.de>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Sep 2024 19:00:56 -0600
Message-ID: <CAFLszTiHy7yn0Z18GdkSLgykH0s=z8tJ=-QGf+knXPggKwyk9Q@mail.gmail.com>
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

On Fri, 28 Jun 2024 at 07:26, Marek Vasut <marex@denx.de> wrote:
>
> On 6/28/24 9:32 AM, Simon Glass wrote:
> > Hi Marek,
>
> Hi,
>
> [...]
>
> >>>> @@ -473,8 +483,6 @@ static int regulator_pre_probe(struct udevice *dev)
> >>>>                                                   -ENODATA);
> >>>>           uc_pdata->max_uA = dev_read_u32_default(dev, "regulator-max-microamp",
> >>>>                                                   -ENODATA);
> >>>> -       uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
> >>>> -       uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
> >>>>           uc_pdata->ramp_delay = dev_read_u32_default(dev, "regulator-ramp-delay",
> >>>>                                                       0);
> >>>>           uc_pdata->force_off = dev_read_bool(dev, "regulator-force-boot-off");
> >>>> --
> >>>> 2.43.0
> >>>>
> >>>
> >>> This is reading a lot of DT stuff very early, which may be slow. It is
> >>> also reading from the DT in the bind() step which we sometimes have to
> >>> do, but try to avoid.
> >>
> >> Actually, it is reading only the bare minimum very early in bind, the
> >> always-on and boot-on, the rest is in pre_probe, i.e. later.
> >
> > Yes, I see that. Also it is inevitable that these properties need to
> > be read before probe(), since they control whether to probe().
> >
> >>
> >>> Also this seems to happen in SPL and again pre-reloc and again in
> >>> U-Boot post-reloc?
> >>
> >> What does, the uclass post_bind ?
> >
> > I mean that this code will be called in SPL (if the regulators are in
> > the DT there), U-Boot pre-reloc and post-reloc, each time turning on
> > the regulators. We need a way to control that, don't we?
>
> I would assume that if those regulators are turned on once in the
> earliest stage , turning them on again in the follow up stage would be a
> noop ? This is the point of regulator-*-on, to keep the regulators on.

No, there is sometimes a particular sequence needed.

>
> >>> Should we have a step in the init sequence where we set up the
> >>> regulators, by calling regulators_enable_boot_on() ?
> >>
> >> Let's not do this , the entire point of this series is to get rid of
> >> those functions and do the regulator configuration the same way LED
> >> subsystem does it -- by probing always-on/boot-on regulators and
> >> configuring them correctly on probe.
> >>
> >> To me regulators_enable_boot_on() and the like was always an
> >> inconsistently applied workaround for missing DM_FLAG_PROBE_AFTER_BIND ,
> >> which is now implemented, so such workarounds can be removed.
> >
> > That patch seemed to slip under the radar, sent and applied on the
> > same day! We really need to add a test for it, BTW.
>
> Which patch ? My recollection of DM_FLAG_PROBE_AFTER_BIND was that it
> took a while to get in.

[1]

>
> > My concern is that this might cause us ordering problems. We perhaps
> > want the regulators to be done first. If drivers are probed which use
> > regulators, then presumably they will enable them. Consider this:
> >
> > - LED driver auto-probes
> >     - probes I2C bus 2
> >     - probes LDO1 which is autoset so turns on
> > - LDO1 probes, but is already running
> > - LDO2 probes, which is autoset so turns on
> >
> > So long as it is OK to enable the regulators in any order, then this
> > seems fine. But is it? How do we handle the case where are particular
> > sequence is needed?
>
> Did we finally arrive at the point where we need -EPROBE_DEFER alike
> mechanism ?

Nope. But I am concerned that this patch is leading us there. bind()
really needs to be as clean as possible. It is one of the design
elements of driver model which Linux should adopt.

There is always a race to be the first to init something, move the
init earlier, etc... I don't see any general need to init the
regulators right at the start. It should be done in a separate
function and be optional. I am happy to send a patch if you like.

Regards,
Simon

[1] https://patchwork.ozlabs.org/project/uboot/patch/20220422131555.123598-1-marex@denx.de/
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
