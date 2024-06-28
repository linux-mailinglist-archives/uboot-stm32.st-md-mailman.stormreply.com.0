Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DD191B876
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2024 09:33:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA770C71287;
	Fri, 28 Jun 2024 07:33:10 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 313D3C6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 07:33:04 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6a3652a732fso1355896d6.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 00:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719559983; x=1720164783;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xOSKQsLRJGtNc9JM/GkjrdFacTmorGHY93zI8W//jw0=;
 b=SU75v73swwyGc2R227EGEVl7+lRIurQNKvbD/QNljyKDSXQJqwZ/L6bIrhBa0XTsEU
 g3uL6/euxiSTGfL/rzKqZw7IJU/4WDP+6XygcOFheB6+yc2eKXlr9dTIovfJ5t7mSDsu
 6Zrn8wNJXFe6/uk1mHJRTG/V14MImSPC/G/ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719559983; x=1720164783;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xOSKQsLRJGtNc9JM/GkjrdFacTmorGHY93zI8W//jw0=;
 b=ZtvtQHY4Rml1+nGok3+7VlP9HaJpxOPPL5NEAjLS0DpKLlJdzhL4Dwnrmq5jG6ykE8
 jaf6QYIF1OyB309moP2RgVoDZ6DrD6Sx5waupqsE+t3ImOUzSCY5ILC+fsn50MIx7J9n
 gPDKsvTDVr6y2HaKJ9/T4ghdd+6dcTrW6n9gBryDY89jG0gYwMbji9yqPKjelGRUEHNd
 fNwH++8xE4OjQThIJDyKEHkWMTDKjX5BCtm2fqCNQ+/refeoVO/ooYJc7eTP1Ks7gdP1
 I2zwgm+FbAWPdnrGakjm34vRt9Q4CeD/Qk5o6uqAc2cLC2XKarqyxZqq2M2BnZv3eKXB
 hGJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjNPde/Zf3ChteGOMt3jEe+mxl8uNFcFZ5z+W7xMiHU72+Yakrej/OidLkygkrdOlyVJaGw5Sx0LPlKN7wmekK4qyLXp64QD1//6CMK4BRdHJxiAOFroTV
X-Gm-Message-State: AOJu0YxfFsCP6k52FeGbNQN0AAYnmdtRaaj8ureETq0y2QybAvN0zqRW
 ChnD3vxtxmPFRW9ikepoXugn8l2iT5UWJ4Tm/b1i0xNruPXpsuGOAqTMVU8gBJrPoPUgoF9Pok3
 EJPHBb0XBXCWoc0aymQJGaPlCLYjyfEeECGwu
X-Google-Smtp-Source: AGHT+IFV/DgwFMjbibDzyUC5pb/VenCj6Ixf9HGX5T/Q4h61Vk9JrQnQk07O5g2L5HX/amlW+6XJs3yiPXjLlD9nv38=
X-Received: by 2002:ad4:5d4b:0:b0:6b5:9375:97bc with SMTP id
 6a1803df08f44-6b593759c8bmr65916616d6.43.1719559983707; Fri, 28 Jun 2024
 00:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <b84e8b10-8698-41f2-9648-0b3f5c399b02@linaro.org>
 <CAFLszTijRhB1dRraPBQSTU3ypJ_wJU7yghJ9c9Rk-XcbcfvkFg@mail.gmail.com>
 <38150a1b-6c71-4b42-a8ec-6b0de8ad6848@linaro.org>
In-Reply-To: <38150a1b-6c71-4b42-a8ec-6b0de8ad6848@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 28 Jun 2024 08:32:52 +0100
Message-ID: <CAFLszTg078XuQ5WxUVvMktA95zZm+PHs+MtVu2eL-xZYYkHxFA@mail.gmail.com>
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

On Fri, 28 Jun 2024 at 01:09, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
>
>
> On 27/06/2024 11:26, Simon Glass wrote:
> > Hi Caleb,
> >
> > On Thu, 27 Jun 2024 at 09:48, Caleb Connolly <caleb.connolly@linaro.org> wrote:
> >>
> >>
> >>
> >> On 27/06/2024 10:37, Simon Glass wrote:
> >>> Hi Marek,
> >>>
> >>> On Thu, 27 Jun 2024 at 00:57, Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> In case a regulator DT node contains regulator-always-on or regulator-boot-on
> >>>> property, make sure the regulator gets correctly configured by U-Boot on start
> >>>> up. Unconditionally probe such regulator drivers. This is a preparatory patch
> >>>> for introduction of .regulator_post_probe() which would trigger the regulator
> >>>> configuration.
> >>>>
> >>>> Parsing of regulator-always-on and regulator-boot-on DT property has been
> >>>> moved to regulator_post_bind() as the information is required early, the
> >>>> rest of the DT parsing has been kept in regulator_pre_probe() to avoid
> >>>> slowing down the boot process.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>> ---
> >>>> Cc: Ben Wolsieffer <benwolsieffer@gmail.com>
> >>>> Cc: Caleb Connolly <caleb.connolly@linaro.org>
> >>>> Cc: Chris Morgan <macromorgan@hotmail.com>
> >>>> Cc: Dragan Simic <dsimic@manjaro.org>
> >>>> Cc: Eugen Hristev <eugen.hristev@collabora.com>
> >>>> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> >>>> Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >>>> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> >>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >>>> Cc: Jonas Karlman <jonas@kwiboo.se>
> >>>> Cc: Kever Yang <kever.yang@rock-chips.com>
> >>>> Cc: Kostya Porotchkin <kostap@marvell.com>
> >>>> Cc: Matteo Lisi <matteo.lisi@engicam.com>
> >>>> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> >>>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> >>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >>>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> >>>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> >>>> Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >>>> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> >>>> Cc: Sam Day <me@samcday.com>
> >>>> Cc: Simon Glass <sjg@chromium.org>
> >>>> Cc: Sumit Garg <sumit.garg@linaro.org>
> >>>> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> >>>> Cc: Thierry Reding <treding@nvidia.com>
> >>>> Cc: Tom Rini <trini@konsulko.com>
> >>>> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> >>>> Cc: u-boot-amlogic@groups.io
> >>>> Cc: u-boot-qcom@groups.io
> >>>> Cc: u-boot@dh-electronics.com
> >>>> Cc: u-boot@lists.denx.de
> >>>> Cc: uboot-stm32@st-md-mailman.stormreply.com
> >>>> ---
> >>>>    drivers/power/regulator/regulator-uclass.c | 22 +++++++++++++++-------
> >>>>    1 file changed, 15 insertions(+), 7 deletions(-)
> >>>>
> >>>> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> >>>> index 66fd531da04..ccc4ef33d83 100644
> >>>> --- a/drivers/power/regulator/regulator-uclass.c
> >>>> +++ b/drivers/power/regulator/regulator-uclass.c
> >>>> @@ -433,6 +433,8 @@ static int regulator_post_bind(struct udevice *dev)
> >>>>           const char *property = "regulator-name";
> >>>>
> >>>>           uc_pdata = dev_get_uclass_plat(dev);
> >>>> +       uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
> >>>> +       uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
> >>>>
> >>>>           /* Regulator's mandatory constraint */
> >>>>           uc_pdata->name = dev_read_string(dev, property);
> >>>> @@ -444,13 +446,21 @@ static int regulator_post_bind(struct udevice *dev)
> >>>>                           return -EINVAL;
> >>>>           }
> >>>>
> >>>> -       if (regulator_name_is_unique(dev, uc_pdata->name))
> >>>> -               return 0;
> >>>> +       if (!regulator_name_is_unique(dev, uc_pdata->name)) {
> >>>> +               debug("'%s' of dev: '%s', has nonunique value: '%s\n",
> >>>> +                     property, dev->name, uc_pdata->name);
> >>>> +               return -EINVAL;
> >>>> +       }
> >>>>
> >>>> -       debug("'%s' of dev: '%s', has nonunique value: '%s\n",
> >>>> -             property, dev->name, uc_pdata->name);
> >>>> +       /*
> >>>> +        * In case the regulator has regulator-always-on or
> >>>> +        * regulator-boot-on DT property, trigger probe() to
> >>>> +        * configure its default state during startup.
> >>>> +        */
> >>>> +       if (uc_pdata->always_on && uc_pdata->boot_on)
> >>>> +               dev_or_flags(dev, DM_FLAG_PROBE_AFTER_BIND);
> >>>>
> >>>> -       return -EINVAL;
> >>>> +       return 0;
> >>>>    }
> >>>>
> >>>>    static int regulator_pre_probe(struct udevice *dev)
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
> >> Could we set up the livetree pre-bind? What about MMU? On armv8 at least
> >> this would have a huge impact on performance. I've done some
> >> measurements and there is at least 1 order of magnitude difference
> >> between parsing FDT with no caches vs parsing livetree with, it's huge.
> >
> > That seems like a great idea to me, in general. The fact that SPL sets
> > up the MMU on armv8 makes it more practical.
>
> Well, on qcom we don't use SPL (yet?), we did have a cyclical dependency
> since we rely on DTB for the memory layout, although I have some patches
> to do all the memory parsing in board_fdt_blob_setup() since that's
> needed for multi-dtb FIT. So I guess we could enable caches at the same
> time.

Yes...it seems that enabling cache in SPL has become common on armv8.

As to the memory layout, I'm not sure what is happening there, but it
seems that the DT does not describe it in general (at least not until
U-Boot adds the nodes).

> >
> > But for this series I believe we are going to have to define what
> > happens in what phase. We have power_init_board() which is the old way
> > of doing this...but perhaps we could use that as a way to start up
> > regulators which are needed.
> >
> > As to my question about whether this happens in SPL / pre-reloc /
> > proper, I forgot that we have the bootph tags for that, so it should
> > be fine. The main issue is that in U-Boot proper we will re-init the
> > regulators even though that has already been done. Probably that can
> > be handled by Kconfig or a flag in SPL handoff.
>
> Ensuring that it isn't done multiple times sounds like the right
> approach to me.

OK...I wonder how we can solve this. Needs some though.


> >
> >
> >>>
> >>> Also this seems to happen in SPL and again pre-reloc and again in
> >>> U-Boot post-reloc?
> >>>
> >>> Should we have a step in the init sequence where we set up the
> >>> regulators, by calling regulators_enable_boot_on() ?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
