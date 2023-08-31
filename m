Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983478F341
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Aug 2023 21:24:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23FB2C6A615;
	Thu, 31 Aug 2023 19:24:36 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26E91C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 19:24:34 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-590685a3be5so13380897b3.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 12:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1693509873; x=1694114673;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L7KGnvV/GX3EmNiFtO0bHX5zD8fuHRQVRhTs6bukjVc=;
 b=G2ELz/M7/BlEzj4PcKLvWUZapH+GuJzJQjbdcXMdoz1oYIaP5FcoqKoE+0iWovlkDe
 asw4bIglghmixm3oM5rUykQBdWx4dUxwlxzINUkoU+r7/ISRIbx8EAVgc9arQvzygT3F
 qNqW22cvTV+fpCNcO8Do1HPjzB3ogpq5sCHN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693509873; x=1694114673;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7KGnvV/GX3EmNiFtO0bHX5zD8fuHRQVRhTs6bukjVc=;
 b=NQyBckvb2gZR+8Db3o2KnXHKdgTvVN2S7SsXQ0+k9HEdbCRPbIlzcOqh+agLElTnxW
 vbAcxcjTINLTyp7+hN/1foshfOtWpLaurza8bwPgbCo5vxBsqymlXCgGcS/iZwi2ODYt
 DqVVI3oDVHEs0/AxYRLIqYZ/0sHXEb3ZUKZ9uEZA+KAS7ZBc/fB3LmUzbaPPPvLvJTSx
 0RTDEz2eVfvGJ5rngkQA+F4S0ebPaY247L+dZEi+LpSF/Y6k/anDWUj8qBexECyrAVtT
 0HGgwnKyeDlTCeO6d7vXiUOb9mR0BLBFHOBTLV6b9bOBCFChoT6jhYfeiV0KBRml/0c1
 N2wQ==
X-Gm-Message-State: AOJu0YytGfI2wZrRo/frcbXlgvkKggjDINJ8qfcUjx66vI//O0BF4CT5
 6JeKWsGEY76XBTs30NWBZhozUw==
X-Google-Smtp-Source: AGHT+IG+uB36+eJbMYr39+3iDRQCzGIjcql7JVh8NsqlQHR/oteBx7poor7c5BGMuxtr6oKDjtpaqA==
X-Received: by 2002:a81:528a:0:b0:583:d6bb:4e96 with SMTP id
 g132-20020a81528a000000b00583d6bb4e96mr441798ywb.8.1693509872874; 
 Thu, 31 Aug 2023 12:24:32 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-1cd4-1a46-fd5d-6cab.res6.spectrum.com.
 [2603:6081:7b00:6400:1cd4:1a46:fd5d:6cab])
 by smtp.gmail.com with ESMTPSA id
 w191-20020a8149c8000000b00570253fc3e5sm601562ywa.105.2023.08.31.12.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 12:24:32 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:24:30 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20230831192430.GP3101304@bill-the-cat>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
 <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
 <d4ce17ae-8b84-4c8a-acaa-287549ec23a3@gmail.com>
 <CAPnjgZ0sTAoZi5TDAaTZUNPVNQ5dqoyVENDWJr=exa5z2R8srw@mail.gmail.com>
 <20230831190709.GO3101304@bill-the-cat>
 <CAPnjgZ0JtmKhY9t_gArwjRO2=qbZsUXDhMcra4mBqBiQmcbWBg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ0JtmKhY9t_gArwjRO2=qbZsUXDhMcra4mBqBiQmcbWBg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Neha Malcom Francis <n-francis@ti.com>, Michael Walle <michael@walle.cc>,
 Kamil Lulko <kamil.lulko@gmail.com>, Vikas Manocha <vikas.manocha@st.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com, Ivan Mikhaylov <fr0st61te@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard
 extensions for build output
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
Content-Type: multipart/mixed; boundary="===============4473833457009138756=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4473833457009138756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r+xHhn8itHORRzIp"
Content-Disposition: inline


--r+xHhn8itHORRzIp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 01:22:13PM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Thu, 31 Aug 2023 at 13:07, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Thu, Aug 31, 2023 at 01:01:59PM -0600, Simon Glass wrote:
> > > Hi Alper,
> > >
> > > On Thu, 31 Aug 2023 at 04:20, Alper Nebi Yasak <alpernebiyasak@gmail.=
com> wrote:
> > > >
> > > > On 2023-08-28 20:54 +03:00, Simon Glass wrote:
> > > > > Hi Alper,
> > > > >
> > > > > On Sun, 27 Aug 2023 at 13:17, Alper Nebi Yasak <alpernebiyasak@gm=
ail.com> wrote:
> > > > >>
> > > > >> On 2023-08-24 06:02 +03:00, Simon Glass wrote:
> > > > >>> In this early stage of using binman to produce output files, we=
 are mostly
> > > > >>> seeing people using common extensions such as '.bin' and '.rom'
> > > > >>>
> > > > >>> But unusual extensions appear in some places.
> > > > >>>
> > > > >>> We would like 'buildman -k' to keep the build outputs, but this=
 is hard if
> > > > >>> there is no consistency as to the extension used.
> > > > >>>
> > > > >>> This series adjusts binman to enforce just 4 extensions for out=
put images:
> > > > >>>
> > > > >>>    .bin
> > > > >>>    .rom
> > > > >>>    .itb
> > > > >>>    .img
> > > > >>>
> > > > >>> Other extensions will produce an error. With this rule observed=
, buildman
> > > > >>> can keep the required files.
> > > > >>
> > > > >> I dislike this limitation. We know what files we will generate, =
they are
> > > > >> listed in binman dtb, so we can add something like `binman build=
 --ls`
> > > > >> to print their names/paths for buildman to preserve them.
> > > > >
> > > > > Yes, it would be good to have that...
> > > > >
> > > > > But why do you dislike the limitation? Do you think extensions pr=
ovide
> > > > > useful information? I suppose one problem is that *.bin might pic=
k up
> > > > > private blobs that happen to be in the source directory?
> > > >
> > > > I guess my strongest argument is that people already/will have work=
flows
> > > > that depend on certain filenames or extensions, and shouldn't have =
to
> > > > modify binman code (consider that people may be using the PyPI whee=
ls)
> > > > to accommodate those when we are already putting the name in the dt=
b.
> > > >
> > > > I do want some standardization to the U-Boot build outputs though, =
but
> > > > more like a global binman.dts with like u-boot.rom, u-boot-sdmmc.img
> > > > images with well-defined TPL, SPL, U-Boot sections that arch-dtsi f=
iles
> > > > can fill in.
> > > >
> > > > >> Regarding the output directory suggestion, I think the binman ou=
tputs
> > > > >> (not temporary/intermediate files) should be in the same directo=
ry as
> > > > >> make outputs
> > > > >
> > > > > Agreed
> > > > >
> > > > >> , and the Makefile should default to O=3Dbuild to achieve the
> > > > >> "output dir". I'm not sure if that's going to happen.
> > > > >
> > > > > I would quite like the 'non-output' file (i.e. things that are no=
t a
> > > > > binman image) to appear in a 'binman-work' subdir of the output d=
ir.
> > > > > What do you think?
> > > >
> > > > I'd prefer them to go in a tempfile.TemporaryDirectory() and discar=
ded
> > > > at the end of a binman run, and a "--tmpdir <path>" option to use a
> > > > given directory instead and preserve things for debugging.
> > >
> > > Actually, that was the original purpose of the output directory in the
> > > u_boot_pylib.tools module. But with all the files binman creates, that
> > > has been lost. I think we should restore that purpose (with an output
> > > dir as a temp dir) and then I think what you have written here will
> > > work.
> >
> > Just please note the rest of the feedback that's been given to this
> > series too.
>=20
> Yes. It is a bit hard to know what to do. I suppose we need binman to
> publish a list of the image files it writes, so buildman can use that
> to save them. Or we could just add some more special cases to the rule
> in buildman?

Extend the list of files that we do keep today, so that at least more
cases could work, set aside the "everything else is an error" notion for
now.

--=20
Tom

--r+xHhn8itHORRzIp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTw6OIACgkQFHw5/5Y0
tyxjLgwApbXcpp3Z50FxHe3+rZzGJVLTnVPBjqbueixbj3H1E16qLSPTrUJJTrU9
HFucJBTdGXXqDJIXyyFwNN+lg5gbpZUg+GsrpYPyjjxP7YeTLyYvCPCzRigcn0IP
NAvUjsWcDUqSiacJqqqyoeu8I1LTjdi8iKbnXo1AFuTfJ2bF3ROQknjWpN4rYqS0
7IZlMjfPTB3bFXs49/Qbgs6Tz7dvSMypKBHQffJwZZDuGJ35TtEjfcN74tDHVIvw
alGI74w6yt8i6lHWjpoI7Z0uLkJ78KR+71TM6bCZSI+oNAR2L4Vr7xlqkxwVlB50
7Eiqnl62fNJLcDaAodUT7LD0TNCNie26UQ7VKERfEh7du49vCCURc2IxFPaKc/O/
mbdflLb0yVkssNGkzH7SNOJI7XQsBHfYoK78gvzOWNYegIlxMza75cF9fBtpVgag
Do9HyvtciTR6NeqK1bB/yqJ8PlokWCLEdVOIQCQ0jRpOCI2VdIsT8BnSzIpo52+g
m7+nzd8k
=7pkv
-----END PGP SIGNATURE-----

--r+xHhn8itHORRzIp--

--===============4473833457009138756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4473833457009138756==--
