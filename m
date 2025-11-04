Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B75C32296
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 17:55:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21A73C62ED4;
	Tue,  4 Nov 2025 16:55:43 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C0B3C62ECF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 16:55:42 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-65698036968so1834189eaf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 08:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1762275341; x=1762880141;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IkLNRLNqOH6PLHfnZ/dCNi3VIFSpIyebFM4l5gGkk0E=;
 b=jX9YSqE0+QcbLTg5K7dpw8uKABWPeeSE8ZDcc181vMPxMTXgIr9/zKWtJVus9S//ow
 c4WjKszMa2/LFgzvjVg7rYZAGyPIwV1opDQTmOdjCgOwl7eclog3b2FQJS0KfDoKX228
 Qq1qAV77dUpVK2CbCSoIAyKfOD3ExKZa+LoeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762275341; x=1762880141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IkLNRLNqOH6PLHfnZ/dCNi3VIFSpIyebFM4l5gGkk0E=;
 b=gPZ3CAZeVYFHel46XHjsRAnjetP8rW9x36h/Nsg/yhZVFfzgm//8a5e8lu3NJhTGr0
 veuDmGcRo9jK7BGfBq3uFpOt+RYcBXTDLG1FuAJC+a+aYlfSRNEt9afA3MFPsTRfqV/k
 W+5WdL1kFPC3OfXsiQG+RIrjQ+t6rYuIummkMkR3A9dN9cyeAfS7dupNiA1nbfachi3W
 ZG44MNoFIBFvZqjE4GBEeoco0GBHH2hG+Sl58rGzDIQaX0d3IvWLaxh/qXHJOqghg1tP
 WsH2EJz28aEme7IQ2ak0V/1HBD0Qh7PkI5vPYsPrHz0ZOESc5LA1E3Q/R9aIW4wsq5Ma
 04aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVx5CoVOdixpHklF2l/tL7EKD117FMxjPNhUCzRZe4kHDaYWbM00qk1n/gzK0AOEdD6KTJG19TAaMYmg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyzUrQQjA+7jDDMK/JDj6kb+g7DPC64zGcoeC6kl4fOe3qqt94i
 i5928BnKWaOsF1cqES5q/C0jBIiVqbJIi+lGQvgxfbEp5e0yuH1rub1aRXjlOISpfHs=
X-Gm-Gg: ASbGncsea6IfgCN1+gs7FGrP+s0MM3qmR8MfX7y9NUkOKhxFzrVA9P0AG8o4JT9lhqp
 wK19IXiZDE0xwkYHu7TWCshEL7avzPLmK/QPGF8w8hgCiuueuUr9XO/+Gg63Ev9AKrtIxrHR7pt
 fTNYpRxzpM//6hstwjLVOcuskd7rzx/cF8ZzXsagtZAs9xtGqpoxLsfBlY3QiAyExVBNX7etSD3
 iFN/3PhaK5zMCoez0gwmay9g4yLHPmpQx5CUVIhm7WfKEGYqDTVOqewB45WveHNdnHvChTsazYJ
 RE/STd6kMgZOmS5CmCPHjC4XN9xMujCv71WXU7i1jUcEgbxv2QYVcaSR6z7fJvBj+RXLfd5HYaj
 1b7dg94OYTC+ZD0VyNgHN/uemIB4W5gy8CoYNZYccZzVhM1SWbw4tC+QZmorFFi/+ZqI4UbJvcE
 ulvJLsTSExVYo4Kn+qpEjXLpKEp4rd1UsQTFG8O0k=
X-Google-Smtp-Source: AGHT+IGtkci2KGgzfOgGbbOWQj9U/T1UmzrdYNg4EhMv2R2A1yu04OXwkeIOWGBpQtwDVMbO4GlmdQ==
X-Received: by 2002:a05:6808:c163:b0:44d:a429:e816 with SMTP id
 5614622812f47-44fed4fcbdcmr20217b6e.53.1762275340847; 
 Tue, 04 Nov 2025 08:55:40 -0800 (PST)
Received: from bill-the-cat (fixed-187-190-202-235.totalplay.net.
 [187.190.202.235]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-656ad40e2f5sm940985eaf.10.2025.11.04.08.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 08:55:40 -0800 (PST)
Date: Tue, 4 Nov 2025 10:55:37 -0600
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20251104165537.GC6688@bill-the-cat>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
 <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
 <aQavXq6jVagkIa53@thinkstation>
 <CAFLszThdV7cZ-uBXzqRYWv-HsGbNJV9BVKVOC4FQUD1yjZDNkg@mail.gmail.com>
 <20251103141726.GJ6688@bill-the-cat>
 <CAFLszTgvpjf4GUfCPJyb0-tkhLPUSwH9pcsF4+0QWvpAKRkFwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLszTgvpjf4GUfCPJyb0-tkhLPUSwH9pcsF4+0QWvpAKRkFwg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3645228437553957014=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3645228437553957014==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nSx9v3OAtiYSQBV7"
Content-Disposition: inline


--nSx9v3OAtiYSQBV7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 05:31:21PM +0100, Simon Glass wrote:
> Hi Tom,
>=20
> On Mon, 3 Nov 2025 at 15:17, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Sun, Nov 02, 2025 at 08:53:43PM +0100, Simon Glass wrote:
> > > Hi Raphael,
> > >
> > > On Sun, 2 Nov 2025 at 02:10, Rapha=EBl Gallais-Pou <rgallaispou@gmail=
=2Ecom>
> > > wrote:
> > > >
> > > > Le Sat, Nov 01, 2025 at 10:03:59AM +0100, Simon Glass a =E9crit :
> > > > > Hi Raphael,
> > > > >
> > > > > On Thu, 4 Sept 2025 at 14:53, Raphael Gallais-Pou
> > > > > <raphael.gallais-pou@foss.st.com> wrote:
> > > > > >
> > > > > > The "Display Timings" in panel-common.yaml can be provided by 2
> > > properties
> > > > > > - panel-timing: when display panels are restricted to a single
> > > resolution
> > > > > >                 the "panel-timing" node expresses the required
> > > timings.
> > > > > > - display-timings: several resolutions with different timings a=
re
> > > supported
> > > > > >                    with several timing subnode of "display-timi=
ngs"
> > > node
> > > > > >
> > > > > > This patch update the parsing function to handle this 2 possibi=
lity
> > > > > > when index =3D 0.
> > > > > >
> > > > > > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > > > Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > > > > > Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st=
=2Ecom>
> > > > > > ---
> > > > > >  drivers/core/ofnode.c | 17 ++++++++++-------
> > > > > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
> > > > > > index
> > > e040e3f2806ffe74c58dcd82f36307351acd5a99..5a721b46e5a3214e7bd43773977=
6362c2d22a3c9
> > > 100644
> > > > > > --- a/drivers/core/ofnode.c
> > > > > > +++ b/drivers/core/ofnode.c
> > > > > > @@ -1221,13 +1221,16 @@ int ofnode_decode_display_timing(ofnode
> > > parent, int index,
> > > > > >         int ret =3D 0;
> > > > > >
> > > > > >         timings =3D ofnode_find_subnode(parent, "display-timing=
s");
> > > > > > -       if (!ofnode_valid(timings))
> > > > > > -               return -EINVAL;
> > > > > > -
> > > > > > -       i =3D 0;
> > > > > > -       ofnode_for_each_subnode(node, timings) {
> > > > > > -               if (i++ =3D=3D index)
> > > > > > -                       break;
> > > > > > +       if (ofnode_valid(timings)) {
> > > > > > +               i =3D 0;
> > > > > > +               ofnode_for_each_subnode(node, timings) {
> > > > > > +                       if (i++ =3D=3D index)
> > > > > > +                               break;
> > > > > > +               }
> > > > > > +       } else {
> > > > > > +               if (index !=3D 0)
> > > > > > +                       return -EINVAL;
> > > > > > +               node =3D ofnode_find_subnode(parent, "panel-tim=
ing");
> > > > > >         }
> > > > > >
> > > > > >         if (!ofnode_valid(node))
> > > > > >
> > > > > > --
> > > > > > 2.25.1
> > > > > >
> > > > >
> > > > > Please add a test for this in test/dm/ofnode.c
> > > >
> > > > Hi Simon,
> > > >
> > > > I'll gladly do that, but I haven't write and use any test in U-Boot=
=2E  So
> > > > it is a bit foggy how to implement it.
> > >
> > > There is some info here:
> > >
> > > https://docs.u-boot.org/en/latest/develop/testing.html
> > >
> > > >
> > > > Do we want to create a fake device-tree and test each configuration=
 or
> > > > do we want to test in the _current_ device-tree if timings are corr=
ectly
> > > > set according to the index value ?
> > >
> > > It looks like there is a 'display-timings' node in test.dts, with thr=
ee
> > > subnodes, so you should just be able to get an ofnode for that and th=
en
> > > read out one of them and check it.
> >
> > OK, but what is the utility in doing that? We don't, and aren't, going
> > to have tests for every valid possible DT node, and this isn't
> > introducing new library parsing functionality (the most recent patch to
> > test/dm/ofnode.c was for ofnode_graph and that is important to test). We
> > don't have display-timing tests to start with, so we're fine not adding
> > something more here.
>=20
> The utility is that code is tested, so it works now and doesn't break
> later. For ofnode we do have tests - see test/dm/ofnode.c

That is a circular and unsatisfying answer to what I said. I did read
test/dm/ofnode.c and then re-read the patch and don't see any value in
adding nodes and then reading nodes, but gave an example of what kind of
changes do make sense to add tests for because they add value. And in
the interest of not having yet another seemingly infinite thread with
you, this is all I'm going to further add here.

--=20
Tom

--nSx9v3OAtiYSQBV7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaQowBQAKCRAr4qD1Cr/k
Cu0HAQDNOJgjqHbul061ao2tl8xpeh6qy14WLu2utBrs7Q+OSwEAuZFXmmuAt/Ba
exIF782dwNx7Aj2mzQkuiTzNEYD+RAM=
=lEk2
-----END PGP SIGNATURE-----

--nSx9v3OAtiYSQBV7--

--===============3645228437553957014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3645228437553957014==--
