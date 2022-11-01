Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E38B614C41
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Nov 2022 15:07:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5784C64104;
	Tue,  1 Nov 2022 14:07:26 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A84EC035A5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Nov 2022 14:07:25 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id j9so4065226qtv.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Nov 2022 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BVvQQ3AWiibBx5VFImCwe5KDK1zwGuAi+zl9vNQD3qI=;
 b=FUnX2oS1dkTUUavKMrXULh+k5bcfY5+ALQRjqKTTzcl9BgOgrblOkDxWR1FR27kvwq
 Y1lkxsM0vtwjN9si2iSJO6VIb2CxLO9FFt2IFDUN1L34nIYnxvLR2XVEn7kNOqGWJFZR
 tRYkDuBWqXVX0fShkcH/S+4T0dz+IUCZytbPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVvQQ3AWiibBx5VFImCwe5KDK1zwGuAi+zl9vNQD3qI=;
 b=qRoBLERAR/NHSMFpxTfMlR5iRDuL3FMIm3Y2ZINW/rp5tDdq28TzZqvtIktcM+kdXe
 Mn8o0S8mUDSsbMQgTIABwGhEOvaRgu+JUsZ62EblEKcO20kJULLP0QhSM9tI7jywh0kB
 v4PCHxQKs5jFhr8Bkh+Qy+9iPRVbGp42gLQTO9gGht8TJeRbWgrP9n+PH42SCqZEcI9F
 vtgs9Kuof+oAZUAi6+H0oXnfPeRtjDDv0r2qqj7LtxO+y3dczaEOb+Dx5wQlN9t/DJkX
 yrHsMqKK79jz/9c55Qms2Nfy8gK9Dk5o0ejgXfBJ+4eU9rriF3gtWMtdtUCTuQBd/r4B
 k43g==
X-Gm-Message-State: ACrzQf0wDnFVliyTPGYyhEF2WaWWxDDB6AJAWha4nNG0drKkSfEjgBvs
 ighfgu5Km7+3h6P84Qdh8xc7ebS1c9jClg==
X-Google-Smtp-Source: AMsMyM4XlrXl5xmIzUAbAcUV+2WxYXSHec6lu7Q+uMg7Tj30xi9i2qvBytWGewrmAi7BSe1ht7Oo5Q==
X-Received: by 2002:ac8:5a50:0:b0:3a5:ce3:a657 with SMTP id
 o16-20020ac85a50000000b003a50ce3a657mr15102099qta.277.1667311644149; 
 Tue, 01 Nov 2022 07:07:24 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-e15b-227c-17a8-c48a.res6.spectrum.com.
 [2603:6081:7b00:6400:e15b:227c:17a8:c48a])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05620a0c4500b006fa22f0494bsm4989685qki.117.2022.11.01.07.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:07:23 -0700 (PDT)
Date: Tue, 1 Nov 2022 10:07:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20221101140721.GB2116612@bill-the-cat>
References: <20221028161850.565610-1-max.oss.09@gmail.com>
 <20221028161850.565610-2-max.oss.09@gmail.com>
 <20221028164047.ljcy67r2itkkrkeb@pali>
 <CAEHkU3U_xmv6dHvtgSc8Eh0_x6zmdjRj3kVwaRaK2RYjqxST0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEHkU3U_xmv6dHvtgSc8Eh0_x6zmdjRj3kVwaRaK2RYjqxST0A@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Adam Ford <aford173@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v2 1/1] Makefile: rework
	u-boot-initial-env target
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
Content-Type: multipart/mixed; boundary="===============3727397046266034399=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3727397046266034399==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y5yQnZmVlpWlTeDv"
Content-Disposition: inline


--y5yQnZmVlpWlTeDv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 11:51:45AM +0100, Max Krummenacher wrote:
> Hi
>=20
> On Fri, Oct 28, 2022 at 6:40 PM Pali Roh=E1r <pali@kernel.org> wrote:
> >
> > Hello! This is really much better solution! Few comments are below.
> >
> > On Friday 28 October 2022 18:18:49 Max Krummenacher wrote:
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > With LTO enabled the U-Boot initial environment is no longer stored
> > > in an easy accessible section in env/common.o. I.e. the section name
> > > changes from build to build, its content maybe compressed and it is
> > > annotated with additional data.
> > >
> > > Drop trying to read the initial env with elf tools from the compiler
> > > specific object file in favour of adding and using a host tool with
> > > the only functionality of printing the initial env to stdout.
> > >
> > > See also:
> > > https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss=
=2Est.com/
> > >
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > ---
> > >
> > > Changes in v2:
> > > - reworked to build a host tool which prints the configured
> > >   environment as proposed by Pali Roh=E1r
> > >   https://lore.kernel.org/u-boot/20221018174827.1393211-1-max.oss.09@=
gmail.com/
> > > - renamed patch, v1 used "Makefile: fix u-boot-initial-env target if =
lto is enabled"
> > >
> > >  Makefile                  |  7 ++++---
> > >  scripts/.gitignore        |  1 +
> > >  scripts/Makefile          |  5 +++++
> > >  scripts/printinitialenv.c | 44 +++++++++++++++++++++++++++++++++++++=
++
> > >  4 files changed, 54 insertions(+), 3 deletions(-)
> > >  create mode 100644 scripts/printinitialenv.c
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 0f1174718f7..2f97d63c398 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -2442,9 +2442,10 @@ endif
> > >       $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> > >
> > >  quiet_cmd_genenv =3D GENENV  $@
> > > -cmd_genenv =3D $(OBJCOPY) --dump-section .rodata.default_environment=
=3D$@ env/common.o; \
> > > -     sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$=
$/d' $@; \
> > > -     sort --field-separator=3D=3D -k1,1 --stable $@ -o $@
> > > +cmd_genenv =3D \
> > > +     scripts/printinitialenv | \
> > > +     sed -e 's/\x00/\x0A/g' -e '/^\s*$$/d' | \
> >
> > I think that you do not need this sed anymore as you print newline in
> > host tool.
>=20
> Missed that one, will change in a V3.
>=20
> >
> > > +     sort --field-separator=3D=3D -k1,1 --stable -o $@
> > >
> > >  u-boot-initial-env: u-boot.bin
> >
> > It is needed to update dependencies for u-boot-initial-env target. Now
> > it does not depend on u-boot.bin but rather on printinitialenv tool.
>=20
> I'm unsure if that is the best way forward. The initial solution would
> also not need to depend on u-boot.bin but rather on env/common.o.
>=20
> I guess that the intention was that the U-Boot binary and the
> u-boot-initial-env file should not be out of sync.
>=20
> Opinions?
>=20
> >
> > >       $(call if_changed,genenv)
> > > diff --git a/scripts/.gitignore b/scripts/.gitignore
> > > index 08cc824bac3..6068724a0d4 100644
> > > --- a/scripts/.gitignore
> > > +++ b/scripts/.gitignore
> > > @@ -2,3 +2,4 @@
> > >  # Generated files
> > >  #
> > >  bin2c
> > > +printinitialenv
> > > diff --git a/scripts/Makefile b/scripts/Makefile
> > > index 8731e6cecd7..ba993820571 100644
> > > --- a/scripts/Makefile
> > > +++ b/scripts/Makefile
> > > @@ -5,8 +5,13 @@
> > >  # ------------------------------------------------------------------=
---------
> > >
> > >  hostprogs-$(CONFIG_BUILD_BIN2C)              +=3D bin2c
> > > +hostprogs-y                          +=3D printinitialenv
> >
> > I'm not sure if the scripts/ is the correct directory for the this tool.
> > Maybe it should be in tools? Lets wait what maintainers or Tom say.
>=20
> According to tools/Makefile tools should be used for tools which
> are not dependent on any boards. This here is a helper during
> the build of a particular U-Boot configuration. That is why I put it
> into scripts/.

I think it should go to tools/ as the comment there isn't an absolute
(other env things are there too).

--=20
Tom

--y5yQnZmVlpWlTeDv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNhKBYACgkQFHw5/5Y0
tyy91Qv/VXcGSw/x5E8SBFtitWi7P+fw/nzQn4k7fgTE0WkpMvJiCT+T2nkzOD1l
jHCJjGjuj9PmE4h1ItglAQMTo2hREEs+jMJ00mq2XzrL53FgQ8J+6A4T0zQjORkD
MXSUJXL/sccIRcyRsAyB1kJZSqbNLYENNoKM4P81ZrhNjkDFq/FMVVT/Ced+9vFW
ICglHxcsU1CvFU6ikTeZQY4wd5yJtnCfmdju0bmTQq6Q1D/ibnx6i4B/MCrgDEYq
IWTjGEocVdBISYLLU4OAb8+g99KnrFpi2fpjFlfgOawNoiMvtduH7yq/8aqbzVhQ
RjX6rfVtFs4L+XqfZZ0oMQShfX+yjuCJLcD9+kB91TVgM+/jkTKPrd9/ien5vTDd
XJ01bxbfIqbL0VMquRxM5H0E8W7d1l1h0ccrNBai1AGqTiT0aOodSOqCRH49vDBg
VVhkkgXtTvweeA6fYLtM5Gfqkcfe4ZpiYbaaOHSuPnPThbXk/XmFyfoapa994uNo
hAwbWbXi
=NdcU
-----END PGP SIGNATURE-----

--y5yQnZmVlpWlTeDv--

--===============3727397046266034399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3727397046266034399==--
