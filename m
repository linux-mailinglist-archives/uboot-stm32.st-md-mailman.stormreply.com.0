Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BABABC2C5BF
	for <lists+uboot-stm32@lfdr.de>; Mon, 03 Nov 2025 15:17:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7189AC62D2D;
	Mon,  3 Nov 2025 14:17:32 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF15AC5F1C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 14:17:30 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-3d220c5a16aso2820110fac.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1762179450; x=1762784250;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ryw1QHhCShG7ZEnRjA9RaY4JjG3v/UyzrigR96WVRjY=;
 b=oQ8uEdBJKFMSUOeeUXHU1/qJC2hhABgM3EjiGIQFMJ+czbG3b54F14kGdn/SilEef+
 CPc8Yh6YLXyxsJJRUQdLAxqVtp9+SbAiSzToELF4Wu4U16moEX0tNJwWgT2cAu2CQ2ON
 dff2tvWBcLhGmrEJdeVgcSG8TlhLYExiyTNUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762179450; x=1762784250;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ryw1QHhCShG7ZEnRjA9RaY4JjG3v/UyzrigR96WVRjY=;
 b=gosB0dimlWeDr5dRZOS6GRllhixp8yl3Z2gJJNHDT/Vb2EuwFr5EtukKrHyV8K9/AD
 sOhsRX25qsbM2PD48T89DpmwOJphivZGRtSRF3/ngmo+9BnnAmKPR7NfLtADycJzyAng
 JyZ3qPsWWNkM3RVISgaYQRRixdUJP8zxG0xizBHdMwLUiAMj2nr5KS7fZkx7IcACc3Ue
 wLjWLiAQGQktC1Iq/4IHp2L0b1Fuw2pDsKI37o+x6voxCaVdD/xS5f1FOBCDaO0sjpBG
 2L3GFH2gQEELPbdb04bzDz2duLXx3CHYWP5lxEWeoiw7/M93J111aeIgzPHrMfCeBhZb
 URGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlHO7R8fDJNm+Vb9spnjFHNtLGi8ucNYeiEjVTv1AJEmR9ur/q6kE0EOn+0d+KPzBeq+CJCrZfOUA6bA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2f3QOFCR/pLUI4GPwvHUuDrQzDn0DtpqtWwJf3oK+J34cWdL6
 ZsBsJ5N0p4GiCnSDwOHw3UWjywo5rRCZUCR61/fjUBxmtRc+tMtI9E+Jqsg/fjVj+LE=
X-Gm-Gg: ASbGnctULI+Z4LT1oJVvD7WIoNu18axURbO5eeeCt90SfbK1tcUzOmZYTHat8u7avgA
 R72MGRA1kH/cgbLNUcZvMvYwZnCCbsa+CBx3UxgJoBsKIyxOAqpFWsQzTO3sML8ECGayWTNlp1+
 j2HYvvbBHJx0bxIJGzpg2awTPaEJdNJU533GGJeiApZAYBGMecFSvZLkKWWvDd/W5tgvaFQ6VmB
 duD+gQD41YTsh5L6l5qeOwfT3ncdXh+DaD3fVdWw33lV9iO2HT8qRV0X1BQVBMsK3TTJBuTvMwg
 ID8AOYmm9eYGnajJLQhGgXu7PX1InLQUvJezM6NWLCu0iR7puiY47qkRAvWwZkM+l99IQ3AXh8X
 9D3tZETI34vaI2vVW84Zv+f2sLvz2qSvviq8Nhv/+Y/rKI51VT7TaKEj6G7DGbJLyLMDA8Pd27+
 YH9wGVDRSTqghPek7MmHLDnZEC+hMcmj8AcCts1Aw=
X-Google-Smtp-Source: AGHT+IGPwkMNxSr+dWAFHLWHwiy7iymH1PZdb9e+LV13y3wzQjPuqo2XLFWtbt11DZD75ySIBBC7SQ==
X-Received: by 2002:a05:6870:d107:b0:365:a979:553 with SMTP id
 586e51a60fabf-3dacc5ce491mr5452836fac.36.1762179449564; 
 Mon, 03 Nov 2025 06:17:29 -0800 (PST)
Received: from bill-the-cat (fixed-187-190-202-235.totalplay.net.
 [187.190.202.235]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3dff6f625b7sm87258fac.15.2025.11.03.06.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 06:17:28 -0800 (PST)
Date: Mon, 3 Nov 2025 08:17:26 -0600
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20251103141726.GJ6688@bill-the-cat>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
 <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
 <aQavXq6jVagkIa53@thinkstation>
 <CAFLszThdV7cZ-uBXzqRYWv-HsGbNJV9BVKVOC4FQUD1yjZDNkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLszThdV7cZ-uBXzqRYWv-HsGbNJV9BVKVOC4FQUD1yjZDNkg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] ofnode: support panel-timings in
 ofnode_decode_display_timing
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
Content-Type: multipart/mixed; boundary="===============4376175469789198764=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4376175469789198764==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qbjBMJgEwQtVadz2"
Content-Disposition: inline


--qbjBMJgEwQtVadz2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 02, 2025 at 08:53:43PM +0100, Simon Glass wrote:
> Hi Raphael,
>=20
> On Sun, 2 Nov 2025 at 02:10, Rapha=EBl Gallais-Pou <rgallaispou@gmail.com>
> wrote:
> >
> > Le Sat, Nov 01, 2025 at 10:03:59AM +0100, Simon Glass a =E9crit :
> > > Hi Raphael,
> > >
> > > On Thu, 4 Sept 2025 at 14:53, Raphael Gallais-Pou
> > > <raphael.gallais-pou@foss.st.com> wrote:
> > > >
> > > > The "Display Timings" in panel-common.yaml can be provided by 2
> properties
> > > > - panel-timing: when display panels are restricted to a single
> resolution
> > > >                 the "panel-timing" node expresses the required
> timings.
> > > > - display-timings: several resolutions with different timings are
> supported
> > > >                    with several timing subnode of "display-timings"
> node
> > > >
> > > > This patch update the parsing function to handle this 2 possibility
> > > > when index =3D 0.
> > > >
> > > > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > > > Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> > > > ---
> > > >  drivers/core/ofnode.c | 17 ++++++++++-------
> > > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
> > > > index
> e040e3f2806ffe74c58dcd82f36307351acd5a99..5a721b46e5a3214e7bd437739776362=
c2d22a3c9
> 100644
> > > > --- a/drivers/core/ofnode.c
> > > > +++ b/drivers/core/ofnode.c
> > > > @@ -1221,13 +1221,16 @@ int ofnode_decode_display_timing(ofnode
> parent, int index,
> > > >         int ret =3D 0;
> > > >
> > > >         timings =3D ofnode_find_subnode(parent, "display-timings");
> > > > -       if (!ofnode_valid(timings))
> > > > -               return -EINVAL;
> > > > -
> > > > -       i =3D 0;
> > > > -       ofnode_for_each_subnode(node, timings) {
> > > > -               if (i++ =3D=3D index)
> > > > -                       break;
> > > > +       if (ofnode_valid(timings)) {
> > > > +               i =3D 0;
> > > > +               ofnode_for_each_subnode(node, timings) {
> > > > +                       if (i++ =3D=3D index)
> > > > +                               break;
> > > > +               }
> > > > +       } else {
> > > > +               if (index !=3D 0)
> > > > +                       return -EINVAL;
> > > > +               node =3D ofnode_find_subnode(parent, "panel-timing"=
);
> > > >         }
> > > >
> > > >         if (!ofnode_valid(node))
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > Please add a test for this in test/dm/ofnode.c
> >
> > Hi Simon,
> >
> > I'll gladly do that, but I haven't write and use any test in U-Boot.  So
> > it is a bit foggy how to implement it.
>=20
> There is some info here:
>=20
> https://docs.u-boot.org/en/latest/develop/testing.html
>=20
> >
> > Do we want to create a fake device-tree and test each configuration or
> > do we want to test in the _current_ device-tree if timings are correctly
> > set according to the index value ?
>=20
> It looks like there is a 'display-timings' node in test.dts, with three
> subnodes, so you should just be able to get an ofnode for that and then
> read out one of them and check it.

OK, but what is the utility in doing that? We don't, and aren't, going
to have tests for every valid possible DT node, and this isn't
introducing new library parsing functionality (the most recent patch to
test/dm/ofnode.c was for ofnode_graph and that is important to test). We
don't have display-timing tests to start with, so we're fine not adding
something more here.

--=20
Tom

--qbjBMJgEwQtVadz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaQi5cwAKCRAr4qD1Cr/k
Cq0NAP45uCx3S5eNa2JBm2ta5ckDnStj6Szp37Ej6bCS6MtLpQD/YZ3dDqGbeJWp
HIrPZMN5QKqTN42LbFlWHLipf5yIogA=
=zg5P
-----END PGP SIGNATURE-----

--qbjBMJgEwQtVadz2--

--===============4376175469789198764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4376175469789198764==--
