Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0964697D892
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Sep 2024 18:49:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABBFDC6C841;
	Fri, 20 Sep 2024 16:49:10 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C181CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2024 16:49:03 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6c3f12d3930so16418836d6.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2024 09:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1726850942; x=1727455742;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n5mnlKp0YXkkmN8wV6HNdGcFRI0bd/y2EXv4WFH0iwo=;
 b=gEjrOrQp2i/Lg25y63LO3wMrfsjKD9Ma4UpOQA6rNwaDXyPcgC/tEESOR9C8ooY1wS
 hnUrOz91q+F90uSeT0VFDvUgAFgHwZg073Y0nMt+oV7VJABVYp05UL1e8pQJSWb5nDgC
 JzfoWgi6kTcB6HoywilWBV8D2bH93gmgn+sPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726850942; x=1727455742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n5mnlKp0YXkkmN8wV6HNdGcFRI0bd/y2EXv4WFH0iwo=;
 b=ndiP+oIdH+uoFRwwxvvGJ3L/untJyPWrvHx8OLvKgT+Np9N4HkahH4dZrPcmWX5DVo
 qfYLfgOggYy/3llilRYNhbLyJKgd+c8W4a7/zlXEpqpV0yM30H/GvZGoogfvoI45ta2o
 Vjmg2tsG9fSyGdkupL+PAXRK/u8dOwDusfJaqTsA60LJJ3puG156mNwgxD+8McVsQB7V
 UDlPsNCVUDsb6jOmUyxyvkB2WhoUXMku3X0vRcXEqXemIUYjI+2Ho87Ef5yPLaliuPrQ
 6f8rpjfRP1omRdNr2SrxRlVywQPFH1ekmJQA7o17FzbSVSFCLdAWqKDp0UyKtGxv5Twb
 JdQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJnjXwmdV350gER6bkZefVEpSXLgK26g0q+ww5ln2xrBJHDdR3yKHAoi/Q5Bg4PHOzcdVbZezyuBV05A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzAQIHll4+0eze+bWGmvNguQnKItVEnuUPxc63Tp9noZlyfNLKW
 Yw25odL5OKamhAVSJFlH2Ddw3Rp8XKNwtjDtR8ZBl7N9zfuqWiJU4217N/Jf3h4=
X-Google-Smtp-Source: AGHT+IGkcRRBUMv8IFlMMi/L5HW0d/LCyTD9yZAxI7oF9GA5uAAdbpB8A22XGp4tAjzmlyo7apfyig==
X-Received: by 2002:a05:6214:3293:b0:6c7:c753:d2d8 with SMTP id
 6a1803df08f44-6c7c753d4bcmr8147636d6.42.1726850942066; 
 Fri, 20 Sep 2024 09:49:02 -0700 (PDT)
Received: from bill-the-cat ([187.144.65.244])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c75e586d10sm19445536d6.141.2024.09.20.09.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 09:49:01 -0700 (PDT)
Date: Fri, 20 Sep 2024 10:48:56 -0600
From: Tom Rini <trini@konsulko.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Message-ID: <20240920164856.GI4252@bill-the-cat>
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <6abad4ba-b29a-47a3-addb-91e8f46ee425@denx.de>
 <CAFLszTgAqOXbkcJxYKxM4gn6_oOg7+nyaBK-Y34r_zVaPBScvA@mail.gmail.com>
 <616b231b-0291-4bb3-93d9-85970419ed62@denx.de>
 <CAFLszTiHy7yn0Z18GdkSLgykH0s=z8tJ=-QGf+knXPggKwyk9Q@mail.gmail.com>
 <20240916162758.GE4252@bill-the-cat>
 <CAPVz0n1krz0GxwEXA+FFr1DHVz-c4R4zm++Ji1KhmBTab9m_2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPVz0n1krz0GxwEXA+FFr1DHVz-c4R4zm++Ji1KhmBTab9m_2g@mail.gmail.com>
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
 Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
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
Content-Type: multipart/mixed; boundary="===============7927029646004003120=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7927029646004003120==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dqOtJzLmOffRWHzq"
Content-Disposition: inline


--dqOtJzLmOffRWHzq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 07:40:35PM +0300, Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 16 =D0=B2=D0=B5=D1=80. 2024=E2=80=AF=D1=80. =D0=BE 19:28 To=
m Rini <trini@konsulko.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Wed, Sep 11, 2024 at 07:00:56PM -0600, Simon Glass wrote:
> > > Hi Marek,
> > >
> > > On Fri, 28 Jun 2024 at 07:26, Marek Vasut <marex@denx.de> wrote:
> > > >
> > > > On 6/28/24 9:32 AM, Simon Glass wrote:
> > > > > Hi Marek,
> > > >
> > > > Hi,
> > > >
> > > > [...]
> > > >
> > > > >>>> @@ -473,8 +483,6 @@ static int regulator_pre_probe(struct udev=
ice *dev)
> > > > >>>>                                                   -ENODATA);
> > > > >>>>           uc_pdata->max_uA =3D dev_read_u32_default(dev, "regu=
lator-max-microamp",
> > > > >>>>                                                   -ENODATA);
> > > > >>>> -       uc_pdata->always_on =3D dev_read_bool(dev, "regulator-=
always-on");
> > > > >>>> -       uc_pdata->boot_on =3D dev_read_bool(dev, "regulator-bo=
ot-on");
> > > > >>>>           uc_pdata->ramp_delay =3D dev_read_u32_default(dev, "=
regulator-ramp-delay",
> > > > >>>>                                                       0);
> > > > >>>>           uc_pdata->force_off =3D dev_read_bool(dev, "regulato=
r-force-boot-off");
> > > > >>>> --
> > > > >>>> 2.43.0
> > > > >>>>
> > > > >>>
> > > > >>> This is reading a lot of DT stuff very early, which may be slow=
=2E It is
> > > > >>> also reading from the DT in the bind() step which we sometimes =
have to
> > > > >>> do, but try to avoid.
> > > > >>
> > > > >> Actually, it is reading only the bare minimum very early in bind=
, the
> > > > >> always-on and boot-on, the rest is in pre_probe, i.e. later.
> > > > >
> > > > > Yes, I see that. Also it is inevitable that these properties need=
 to
> > > > > be read before probe(), since they control whether to probe().
> > > > >
> > > > >>
> > > > >>> Also this seems to happen in SPL and again pre-reloc and again =
in
> > > > >>> U-Boot post-reloc?
> > > > >>
> > > > >> What does, the uclass post_bind ?
> > > > >
> > > > > I mean that this code will be called in SPL (if the regulators ar=
e in
> > > > > the DT there), U-Boot pre-reloc and post-reloc, each time turning=
 on
> > > > > the regulators. We need a way to control that, don't we?
> > > >
> > > > I would assume that if those regulators are turned on once in the
> > > > earliest stage , turning them on again in the follow up stage would=
 be a
> > > > noop ? This is the point of regulator-*-on, to keep the regulators =
on.
> > >
> > > No, there is sometimes a particular sequence needed.
> > >
> > > >
> > > > >>> Should we have a step in the init sequence where we set up the
> > > > >>> regulators, by calling regulators_enable_boot_on() ?
> > > > >>
> > > > >> Let's not do this , the entire point of this series is to get ri=
d of
> > > > >> those functions and do the regulator configuration the same way =
LED
> > > > >> subsystem does it -- by probing always-on/boot-on regulators and
> > > > >> configuring them correctly on probe.
> > > > >>
> > > > >> To me regulators_enable_boot_on() and the like was always an
> > > > >> inconsistently applied workaround for missing DM_FLAG_PROBE_AFTE=
R_BIND ,
> > > > >> which is now implemented, so such workarounds can be removed.
> > > > >
> > > > > That patch seemed to slip under the radar, sent and applied on the
> > > > > same day! We really need to add a test for it, BTW.
> > > >
> > > > Which patch ? My recollection of DM_FLAG_PROBE_AFTER_BIND was that =
it
> > > > took a while to get in.
> > >
> > > [1]
> > >
> > > >
> > > > > My concern is that this might cause us ordering problems. We perh=
aps
> > > > > want the regulators to be done first. If drivers are probed which=
 use
> > > > > regulators, then presumably they will enable them. Consider this:
> > > > >
> > > > > - LED driver auto-probes
> > > > >     - probes I2C bus 2
> > > > >     - probes LDO1 which is autoset so turns on
> > > > > - LDO1 probes, but is already running
> > > > > - LDO2 probes, which is autoset so turns on
> > > > >
> > > > > So long as it is OK to enable the regulators in any order, then t=
his
> > > > > seems fine. But is it? How do we handle the case where are partic=
ular
> > > > > sequence is needed?
> > > >
> > > > Did we finally arrive at the point where we need -EPROBE_DEFER alike
> > > > mechanism ?
> > >
> > > Nope. But I am concerned that this patch is leading us there. bind()
> > > really needs to be as clean as possible. It is one of the design
> > > elements of driver model which Linux should adopt.
> > >
> > > There is always a race to be the first to init something, move the
> > > init earlier, etc... I don't see any general need to init the
> > > regulators right at the start. It should be done in a separate
> > > function and be optional. I am happy to send a patch if you like.
> >
> > Since we're currently stuck on the point where Marek has patches that
> > fix a real problem, and Svyatoslav has a problem with them, but isn't
> > currently able to debug it, yes, please put forward your patch that
> > might address both sets of problems so we can all figure out how to
> > resolve the problems, thanks!
>=20
> With patches from Marek there is no i2c chip probe of PMIC, while
> without i2c chip probe is called (probe_chip function). How this is
> even possible?

Yes, it's very puzzling. Do you have the ability to get some debug
console type information out so you can sprinkle in some prints and
figure it out?

--=20
Tom

--dqOtJzLmOffRWHzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmbtp3gACgkQFHw5/5Y0
tywr6Av/XI9hPV+8aqFzHxVis9rqKhD8iGfdD7dHTHckrlHyLh+JPPda2flYbKMS
EIH6lPxHAsNhVwZ0BS/1qLDlicaUoI4Dg6bi1ffkux0gCk0GOg0K1SLUUHczOjPE
8p7OygaFVS08w0AiLE25LP8B6d+HKBITMWOgGiOdY5ZP9uMOfLWFT98MVJDfna1R
h2bGW/u9JwXqK2eCsyrt5uGZ5o+nbyqmLGHmu0SCzNEKvfkoJSVGI7lEfho5Ljwv
2i/cvUyNBSXFaCdKUBhIKFPPu0sF22GXjwF1q50582bkJ08QxprpxpxHDvPGGCiD
mp5FmlbxuAfkmNMZ+VLKitvHOhsD35oxq4jfwgJ1FDewDRKCpipo+WsG3StHirau
q9H71Z7l+JR0FRyAYSS1mvRASiHDEgVjuEAkajmc2r4lCrxPWke5vSjr0d/8Zr7Q
Jw88u2J+n8iSfm8+r7ShCxbV2OHzzijb2JwQviEQP9tXBF7IIXmYXI+a2s9J1k4s
PuhveSmr
=LQhm
-----END PGP SIGNATURE-----

--dqOtJzLmOffRWHzq--

--===============7927029646004003120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7927029646004003120==--
