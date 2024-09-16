Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3B797A5F5
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Sep 2024 18:28:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4905C78014;
	Mon, 16 Sep 2024 16:28:14 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B525C78010
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2024 16:28:07 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-709346604a7so1455710a34.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2024 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1726504086; x=1727108886;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EF0G2jQNMJy6viIsTcTH6P2KkptSEkkmUDZfppdy6k4=;
 b=G3pn4I9CkrqOn5sEpR0vupt9FSvW+eoCSNMhn+Q8PTiQKHP0X7xnGjEKjeB4ruhto/
 /9EuD6XIkJv1U/tiBthr0XGSCDazF/mwiQLz2AxomK0Jm3STiQ6c1H+Ou37V+s5HEyvm
 Qy1gw9trICvok/GE4EL7HzufA56RzE7YUYFPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726504086; x=1727108886;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EF0G2jQNMJy6viIsTcTH6P2KkptSEkkmUDZfppdy6k4=;
 b=NaqNg47rlvXoivphhrceN8FE7vNMXYDZWq7pmKv5Bsouv0omNNk0oR9/CscF1n85Vb
 lIch3G8kFoGhuoUjKMKXQAlBKF9T79qJURiAKaN2I/joXz//BpEfH99e6t+pogZjwW2k
 eFtsPOz/yH/6hPyBuUUQvrcM1DfWv7s3SReXeMm4uZzJRQ/jNlTqhhjEg9XHg03pSmZY
 gOe0bK1wUCJU8Td2sZqdAXc7EZW2diZKJ009vU9lMbYvGPe8RczXzKU4p73hvZ7swmLt
 HaNBigZlmdHyNixTtp7wtloLpgRppWxUxepcfrNIrNcygcMVewfsl5XZIJ1fugtwidIH
 tX+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQYakGY8T4iUUUE4MibhghFGqGA3qgozq3+h8aBwrqOJe/d0h+3o+c47q+3TrnUQZYzdFcJCjm2L2uWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjVmkzWQqMyrl9lrEWYldYYK7q1BF30jxFV6TD5XXL+PqdU83I
 R+aUlK4wspVw5FGc/OUC1hK0863jVbgHlV/bY8VGc4miTc99tteZ2WZFnmC1HC4=
X-Google-Smtp-Source: AGHT+IEGGoKrkeYZTDx6+y8aLlMeNnu3/sLcIrs3HtPAPlkPWVWoTR7nkC5JxQreu3BBrQ0Jr7LRIg==
X-Received: by 2002:a05:6358:430c:b0:1b8:33b2:1482 with SMTP id
 e5c5f4694b2df-1bc3941ab52mr261652355d.1.1726504085991; 
 Mon, 16 Sep 2024 09:28:05 -0700 (PDT)
Received: from bill-the-cat ([187.144.65.244])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-459aac61237sm28776961cf.16.2024.09.16.09.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 09:28:04 -0700 (PDT)
Date: Mon, 16 Sep 2024 10:27:58 -0600
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20240916162758.GE4252@bill-the-cat>
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <6abad4ba-b29a-47a3-addb-91e8f46ee425@denx.de>
 <CAFLszTgAqOXbkcJxYKxM4gn6_oOg7+nyaBK-Y34r_zVaPBScvA@mail.gmail.com>
 <616b231b-0291-4bb3-93d9-85970419ed62@denx.de>
 <CAFLszTiHy7yn0Z18GdkSLgykH0s=z8tJ=-QGf+knXPggKwyk9Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLszTiHy7yn0Z18GdkSLgykH0s=z8tJ=-QGf+knXPggKwyk9Q@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Marek Vasut <marex@denx.de>, u-boot-qcom@groups.io,
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
Content-Type: multipart/mixed; boundary="===============8872338187194963770=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8872338187194963770==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T6cII7xq/+DvBuQn"
Content-Disposition: inline


--T6cII7xq/+DvBuQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 07:00:56PM -0600, Simon Glass wrote:
> Hi Marek,
>=20
> On Fri, 28 Jun 2024 at 07:26, Marek Vasut <marex@denx.de> wrote:
> >
> > On 6/28/24 9:32 AM, Simon Glass wrote:
> > > Hi Marek,
> >
> > Hi,
> >
> > [...]
> >
> > >>>> @@ -473,8 +483,6 @@ static int regulator_pre_probe(struct udevice =
*dev)
> > >>>>                                                   -ENODATA);
> > >>>>           uc_pdata->max_uA =3D dev_read_u32_default(dev, "regulato=
r-max-microamp",
> > >>>>                                                   -ENODATA);
> > >>>> -       uc_pdata->always_on =3D dev_read_bool(dev, "regulator-alwa=
ys-on");
> > >>>> -       uc_pdata->boot_on =3D dev_read_bool(dev, "regulator-boot-o=
n");
> > >>>>           uc_pdata->ramp_delay =3D dev_read_u32_default(dev, "regu=
lator-ramp-delay",
> > >>>>                                                       0);
> > >>>>           uc_pdata->force_off =3D dev_read_bool(dev, "regulator-fo=
rce-boot-off");
> > >>>> --
> > >>>> 2.43.0
> > >>>>
> > >>>
> > >>> This is reading a lot of DT stuff very early, which may be slow. It=
 is
> > >>> also reading from the DT in the bind() step which we sometimes have=
 to
> > >>> do, but try to avoid.
> > >>
> > >> Actually, it is reading only the bare minimum very early in bind, the
> > >> always-on and boot-on, the rest is in pre_probe, i.e. later.
> > >
> > > Yes, I see that. Also it is inevitable that these properties need to
> > > be read before probe(), since they control whether to probe().
> > >
> > >>
> > >>> Also this seems to happen in SPL and again pre-reloc and again in
> > >>> U-Boot post-reloc?
> > >>
> > >> What does, the uclass post_bind ?
> > >
> > > I mean that this code will be called in SPL (if the regulators are in
> > > the DT there), U-Boot pre-reloc and post-reloc, each time turning on
> > > the regulators. We need a way to control that, don't we?
> >
> > I would assume that if those regulators are turned on once in the
> > earliest stage , turning them on again in the follow up stage would be a
> > noop ? This is the point of regulator-*-on, to keep the regulators on.
>=20
> No, there is sometimes a particular sequence needed.
>=20
> >
> > >>> Should we have a step in the init sequence where we set up the
> > >>> regulators, by calling regulators_enable_boot_on() ?
> > >>
> > >> Let's not do this , the entire point of this series is to get rid of
> > >> those functions and do the regulator configuration the same way LED
> > >> subsystem does it -- by probing always-on/boot-on regulators and
> > >> configuring them correctly on probe.
> > >>
> > >> To me regulators_enable_boot_on() and the like was always an
> > >> inconsistently applied workaround for missing DM_FLAG_PROBE_AFTER_BI=
ND ,
> > >> which is now implemented, so such workarounds can be removed.
> > >
> > > That patch seemed to slip under the radar, sent and applied on the
> > > same day! We really need to add a test for it, BTW.
> >
> > Which patch ? My recollection of DM_FLAG_PROBE_AFTER_BIND was that it
> > took a while to get in.
>=20
> [1]
>=20
> >
> > > My concern is that this might cause us ordering problems. We perhaps
> > > want the regulators to be done first. If drivers are probed which use
> > > regulators, then presumably they will enable them. Consider this:
> > >
> > > - LED driver auto-probes
> > >     - probes I2C bus 2
> > >     - probes LDO1 which is autoset so turns on
> > > - LDO1 probes, but is already running
> > > - LDO2 probes, which is autoset so turns on
> > >
> > > So long as it is OK to enable the regulators in any order, then this
> > > seems fine. But is it? How do we handle the case where are particular
> > > sequence is needed?
> >
> > Did we finally arrive at the point where we need -EPROBE_DEFER alike
> > mechanism ?
>=20
> Nope. But I am concerned that this patch is leading us there. bind()
> really needs to be as clean as possible. It is one of the design
> elements of driver model which Linux should adopt.
>=20
> There is always a race to be the first to init something, move the
> init earlier, etc... I don't see any general need to init the
> regulators right at the start. It should be done in a separate
> function and be optional. I am happy to send a patch if you like.

Since we're currently stuck on the point where Marek has patches that
fix a real problem, and Svyatoslav has a problem with them, but isn't
currently able to debug it, yes, please put forward your patch that
might address both sets of problems so we can all figure out how to
resolve the problems, thanks!

--=20
Tom

--T6cII7xq/+DvBuQn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmboXIsACgkQFHw5/5Y0
tyxNjQv+MMGXX9xIKCbeFdYltaw7eLEqMQFyig/4VOgf1x82FcxpYrfFMa4gopjM
j3I111hWh4tO69F8O+j2guT2Sr08pa0rO7JL+vaJY1iukXFHMtNJrL3WgIL3EpS9
cqgRLEe7e5YbPibKqXPKconEfjXwcjXVOSwwFXFfNFnJJ+0IWLUUxd/pgWXpTziK
2CwoDLICFx/OE2EXTWIC9gQZPrIeK24jOjMJbKur953KBIYOxNcYFLJML7k78kQc
swjPNXeQZMq4PwmUZpsvO9Aq0O1iBAx8ly9rMQYtCYD9/dx2N0qplie0M/IHI0O1
IO0WtlHPNpOTdJzcgEYpDqLUE2rced+GjE6piuxkr/zepocm4MXm03fFc5Kh3Ltf
cfryRrBotyqYLH5ldXbtrKSSSSps0NeDO4e9uDCN1vEq4QSMdXGSEhKFD0jIa5f6
LgUcniXI4IzWxHPCfCCmcIKtN6wF7o7xEXA/HCHv8T+sJmxZDi6SdVWOBgtfxAlq
z2sx3b6p
=JwHe
-----END PGP SIGNATURE-----

--T6cII7xq/+DvBuQn--

--===============8872338187194963770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8872338187194963770==--
