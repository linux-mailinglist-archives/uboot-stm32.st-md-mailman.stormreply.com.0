Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1A8975850
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Sep 2024 18:25:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 165ABC6C841;
	Wed, 11 Sep 2024 16:25:17 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46C25C69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 16:25:09 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7a9aec89347so2135785a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1726071908; x=1726676708;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x9aeOgN8xMtMgMDmTT/h3ulinJsjS4y8oC1yyzYlb38=;
 b=WG0XiYXWJKpTkYYlIJvV8mOWTdR6jQwqeAsTMI90UniPN+z5KMC4syPyAmwC6S4kIs
 FklYBLeeCeh3Vga3K5v9wlAZxTOQS5q1mf+Jjn5+/a6v3vlJPNZJ5aKtR06jr0g5T10O
 rwPmNyLk8Ldt3sC8Px3NYtrF2XgmZzb3qV8oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726071908; x=1726676708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9aeOgN8xMtMgMDmTT/h3ulinJsjS4y8oC1yyzYlb38=;
 b=w53LOvCZENdo1brCoJEUEVWhsWjzztikE0HAg6NKB4qQb0mO/CC7JwaiouDS9K4Tgc
 Tp7VUO6rTskGQjuUozQx3rL7mz0YghwzJl1SPDW/HPewkMIGSjeRrFcDZWk6+ReilyRu
 vMysb4cvZ84DpH7D+LPujpthHvXs3ybiC0p75pRBKuOBQmVWMLT0HX7YNqvP/DTmoiEu
 x+IQfQMBuXKFyzW1cz3Tal2GCVHPsIuIgfCkvbemEE4vl6H2al2r+5E0CrvE0bADmBx9
 /+VZhfxuSfr18wvDhcyd3WL1/t90WN/RUvtk4V4d5KncOpkwkXEMiRxvydBad6h7g6GN
 R0tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT0jLVyTDJERP5vasdIheVKhDVQlvo4tDBicTsF47gVUhM0dcZfiQjQ2Ehu+jPOdM1JzNWIAckCp/b4A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyN504hwf7PWwH9oLVooPSK2/wXYiLD9g2tr6TcDGCYmJcR0QqA
 DrBSJOnuBGdzqkkc+rM/vr/PkEVjBD3L+0IgVanyhxtG64F/VcFGUCgYUW+mxkc=
X-Google-Smtp-Source: AGHT+IHgCATOhfD2w17tP2+icZgruUKYgHQ8g2cQhzGDqI5oAhF+y/wid/ws1zpD53j5nlOs9m9k2w==
X-Received: by 2002:a05:620a:1a1e:b0:7a9:a3e3:7270 with SMTP id
 af79cd13be357-7a9a3e3a396mr2482949485a.62.1726071907923; 
 Wed, 11 Sep 2024 09:25:07 -0700 (PDT)
Received: from bill-the-cat ([187.144.65.244])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45822e7f569sm42725791cf.31.2024.09.11.09.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 09:25:07 -0700 (PDT)
Date: Wed, 11 Sep 2024 10:25:03 -0600
From: Tom Rini <trini@konsulko.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Message-ID: <20240911162503.GQ4252@bill-the-cat>
References: <CAPVz0n3Ji1sKQK+Lnq8rP3ZqwX3o-kXe2btj93UuVBa3T5C=qw@mail.gmail.com>
 <eced1020-2157-44a4-98a9-845e218529d9@denx.de>
 <45c74c58-98cf-43df-b837-c48b0341c551@denx.de>
 <CAPVz0n2-DCKDcVrAi00kF6yDcE2bN1mtUhzBcw7JDiZoXgzu0w@mail.gmail.com>
 <e5837ce4-0a14-4822-960d-6ab667a9f4b1@denx.de>
 <CAPVz0n323ktF6kb3WHR9JcE+xOzQr9-aWOR47+ZvwQr=ib18rg@mail.gmail.com>
 <f778366b-bdaf-415d-a94e-c995f62e8c71@denx.de>
 <CAPVz0n0ru1rPb9SNw515mkwfs4=nNSOPjZY74JVkqnGbEouSLQ@mail.gmail.com>
 <cfc1a158-6c35-4288-aed0-fcc78a8db832@denx.de>
 <CAPVz0n1Vh7Vgnt8_Lx6U8p42QvtVnHB9yvb=RmjYrS=w1G3u1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPVz0n1Vh7Vgnt8_Lx6U8p42QvtVnHB9yvb=RmjYrS=w1G3u1A@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Sumit Garg <sumit.garg@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
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
Content-Type: multipart/mixed; boundary="===============3601104971886728680=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3601104971886728680==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="esSR2Cp/8Y/3KA2m"
Content-Disposition: inline


--esSR2Cp/8Y/3KA2m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 02:12:12PM +0300, Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 11 =D0=B2=D0=B5=D1=80. 2024=E2=80=AF=D1=80. =D0=BE 14:01 Ma=
rek Vasut <marex@denx.de> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On 9/11/24 7:57 AM, Svyatoslav Ryhel wrote:
> >
> > [...]
> >
> > >>>> You did mention something regarding I2C/PMIC driver probe timing, =
but it
> > >>>> seems the I2C driver and PMIC drivers probe roughly around the sam=
e time
> > >>>> in both pass and fail cases ?
> > >>>
> > >>> Yes, here I agree that they both probe and probe passes, but I assu=
me
> > >>> timing of i2c call is critical and there may be some dependency whi=
ch
> > >>> is not ready.
> > >>
> > >> My guess would be pinmux or clock, maybe the i2c controller is marke=
d as
> > >> bootph-* in DT and its pinmux/clock is not? Maybe the i2c on tegra w=
orks
> > >> by sheer coincidence right now? Can you have a look?
> > >
> > > Power i2c line (one that hosts PMIC) is configured extremely early in
> > > SPL since it is needed for cpu and core voltage setup so even if, as
> > > you say, tegra works by sheer coincidence, specifically this i2c line
> > > should work non the less, since it has all its pre-requisites (clock
> > > and pinmux) configured on early stage.
> >
> > Is it possible that this configuration is somehow reset or reconfigured
> > from DT early on in U-Boot proper ?
>=20
> No
>=20
> > Do you have serial console output in board_f.c time in U-Boot proper ,
> > possibly using DEUBG_UART , to check if there might be some prior
> > failing I2C transfer at that board_f.c time ?
>=20
> Haven't spotted anything weird there.
>=20
> > > As I have told, I was not able to determine exact reason why this
> > > happens, it should not and yet it does. This is why I have abandoned
> > > my attempt to implement same changes you are currently proposing.
> >
> > If tegra has a problem, it should be fixed on tegra side and not block
> > core plumbing. I am not seeing the problem on stm32 or imx systems, so I
> > am banking toward tegra-specific issue.
> >
>=20
> And yet you are pushing tegra breaking stuff. I will insist on
> reverting this is it passes.
>=20
> > Are you able to debug this ?
>=20
> No, I am not able find exact cuse of this behavior.

How do you propose we resolve this then, Svyatoslav? I threw this patch
at some TI platforms as well and they're all fine. Are you unable to get
some early debuging information out like Marek was asking? Thanks.

--=20
Tom

--esSR2Cp/8Y/3KA2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmbhxFsACgkQFHw5/5Y0
tyw71wwAn/baxpBRJxptF4uekpATAo24mWw9w0JoKRSdXSBVgNui+btFcvkyQ1X/
VtJHwJWtem9hhKeIqbbYyQNVjb5dN1brT7ORRtBDN5cXtzTSG6Ylj+pd1ORs73bu
oHitL2pffneo+8ful/SkqOa8xTpaMZlNV/fb5hYf4gOrWNt++UOawM9NFG+BSK4r
PdAXmkpnNBMHBA+a8E4JcijdY2SoNsZF4YQpC+fJ7ErKB8BFx5HOd/4Sc86kmL+0
z964CJU0Rc8D/ZJT9qMvE8c2S7RImO8PXME6QiLIyfBAtG40whlQZrV5XrQqYYRU
71euKRzHE8s7PEQ3hLYlmdKYUYf5y8smAkx8+HBru4rkJylYpSBEToSH9Y7iOmKY
YGbtZgQ5rTHiegHftUXbAhMG97P9ThYUjG1XBg6VMKSVRsTBoRRkt5+DdoR1rxaY
FJrRr82pW3GWJwi4KsEnEcy1J+P7o2aXfNrtq/E6YZzuD6lO0KT8Z3VaQnWcOwOg
vzxf8SHc
=9uk4
-----END PGP SIGNATURE-----

--esSR2Cp/8Y/3KA2m--

--===============3601104971886728680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3601104971886728680==--
