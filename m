Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2827BA182
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Oct 2023 16:53:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01773C6C835;
	Thu,  5 Oct 2023 14:53:55 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A4D7C6B463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 14:53:54 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-59c215f2f4aso12195117b3.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Oct 2023 07:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1696517633; x=1697122433;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VjbYhOAt/YNDDaDTXsrimMZRlXkFQEwpct9VUjGHujg=;
 b=FHcAhDogcBtH6I56JKoR321j0CErZWiBJj1tqbQdAosD8YnY5yh23GNYkvmCWtlYxr
 MZ7OL/c+MG+rI25nSvFGzNySwvIufOI1ALsYG24wEebtWMxJ91ikMl/cqTSYgy+b0/02
 RwG14oemRhqZg6q7ulSkonBtGAFVANQMxadvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696517633; x=1697122433;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjbYhOAt/YNDDaDTXsrimMZRlXkFQEwpct9VUjGHujg=;
 b=mcDlaGyAZ4zP45LehiKkdSBameg29yk9E8uOwhAwOHzRc2Xxgy9vrwIEg3PRwp9SEP
 gFf3DKhrdIIq0K6aVg2WY7u6OQ19dLkEVRbcxaXe2iUwGzIqAnzgsdjWg+iOOMTTAghL
 5hIXDkYwkTIcQAsJIbue6RZ0wHF98fTDer1y65+c5+MH8qP0KgE8RP3VkDM4KZv5lRsh
 FVRKNHbeuErA/rApB+J+M2AkFosLaK+W2zeRqlD4Sq2X8OMrh2VnQiHDcs68MF3kjUZa
 VzuduyOBMzFJb7efA+fAKMBs07448inS5cekIBegAXfmxhudsz7Eu3MQqiXZbodzjgSA
 hTvw==
X-Gm-Message-State: AOJu0Yyie0mAW5Qq8zzG6mdJC8QD1qNuHx7RvvgnMwdUSmwpc5/+Jl8g
 DT07I3XUTlrWanuV4UmTxE1VaA==
X-Google-Smtp-Source: AGHT+IFBNTskLVxrGPXwJ1A2gj9IqTb9yti0SIHa8xNrGTq9gDNpAUVO+0Wxp2vyipdEqldxD/pYMA==
X-Received: by 2002:a81:6d48:0:b0:59f:4e6d:b56c with SMTP id
 i69-20020a816d48000000b0059f4e6db56cmr5652552ywc.22.1696517633135; 
 Thu, 05 Oct 2023 07:53:53 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-f1fa-53fc-3572-fce8.res6.spectrum.com.
 [2603:6081:7b00:6400:f1fa:53fc:3572:fce8])
 by smtp.gmail.com with ESMTPSA id
 r126-20020a0de884000000b005869f734036sm560996ywe.19.2023.10.05.07.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 07:53:52 -0700 (PDT)
Date: Thu, 5 Oct 2023 10:53:50 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20231005145350.GQ8465@bill-the-cat>
References: <20230924203953.1829820-1-sjg@chromium.org>
 <20230924203953.1829820-6-sjg@chromium.org>
 <20230924232658.GM305624@bill-the-cat>
 <CAPnjgZ2-ORog-+Onh1McptpMDrzccVc+BfByCMjp93wLqAms6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ2-ORog-+Onh1McptpMDrzccVc+BfByCMjp93wLqAms6w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Michal Suchanek <msuchanek@suse.de>,
 Leo <ycliang@andestech.com>, Stefan Roese <sr@denx.de>,
 Rick Chen <rick@andestech.com>, uboot-stm32@st-md-mailman.stormreply.com,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michael Walle <michael@walle.cc>,
 Stefano Babic <sbabic@denx.de>, "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 05/25] treewide: Correct use of long help
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
Content-Type: multipart/mixed; boundary="===============0025804221618753381=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0025804221618753381==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3WAuJ+cuHDAcGqDL"
Content-Disposition: inline


--3WAuJ+cuHDAcGqDL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2023 at 07:23:47PM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Sun, 24 Sept 2023 at 17:27, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Sun, Sep 24, 2023 at 02:39:23PM -0600, Simon Glass wrote:
> > > Some commands assume that CONFIG_SYS_LONGHELP is always defined.
> > > Declaration of long help should be bracketed by an #ifdef to avoid an
> > > 'unused variable' warning.
> > >
> > > Fix this treewide.
> > >
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > [snip]
> > > diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/mach-imx/cmd_dek.c
> > > index 6fa5b41fcd38..25ea7d3b37da 100644
> > > --- a/arch/arm/mach-imx/cmd_dek.c
> > > +++ b/arch/arm/mach-imx/cmd_dek.c
> > > @@ -393,11 +393,12 @@ static int do_dek_blob(struct cmd_tbl *cmdtp, i=
nt flag, int argc,
> > >       return blob_encap_dek(src_addr, dst_addr, len);
> > >  }
> > >
> > > -/***************************************************/
> > > +#if IS_ENABLED(CONFIG_SYS_LONGHELP)
> > >  static char dek_blob_help_text[] =3D
> > >       "src dst len            - Encapsulate and create blob of data\n"
> > >       "                         $len bits long at address $src and\n"
> > >       "                         store the result at address $dst.\n";
> > > +#endif
> > >
> > >  U_BOOT_CMD(
> > >       dek_blob, 4, 1, do_dek_blob,
> >
> > This really doesn't read nicely.  I would rather (globally and fix
> > existing users) __maybe_unused this instead.  I think there's just one
> > example today that isn't "foo_help_text".
>=20
> Hmm, what do you think about adding a __longhelp symbol to cause the
> linker to discard it when not needed?

Well, I don't think we need linker list magic when __maybe_unused will
just have them be discarded normally.

--=20
Tom

--3WAuJ+cuHDAcGqDL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmUezf4ACgkQFHw5/5Y0
tyyfxAv/Rzerxchv9zt5z6QoVeWO1UcGiai3TTMp0/WCwHa9LiPp4ltbRbWggVdw
Lx4t1JvUeClt0yk+5GRofoaxAvQm5Rah6NvA7Ima3b7wfvHDsSq/ir3G4Yb6EGmN
uwMLeF5/POkaXyHssQK5dZtIEvKmOE+fPEstDQ3egLkEHfL+hswmrv+HmJKVVt3Q
PzwgCCkEy06Gl58zGkSzXsibWLWYmAwQR8DgFqvidfs4fhoSvkYXiZKddZybI0Bd
qsp+FbhOuyYyqMQzVqsgZxKygZoI2GBAryYhEhZPlNQAfnjwtsjkzzlWJJzQivmx
OIQ/VKi3KI9dV2WYo/hgOZnbih27LtGwCcSpUTEtAp++G1LIPkiVaPwtgm40gWzq
xNx7mx+DILiBhAyu73hrjOPKhH141pINTif2eldZOfIkHbzZTI6V28fgL/ZhRRyq
lxSJOEespA3KH2C0RCW5L22v94QDORqg12VDjn+E7a/13QgKzy+x7zQ4LNg826O0
XH58CCsm
=gGR9
-----END PGP SIGNATURE-----

--3WAuJ+cuHDAcGqDL--

--===============0025804221618753381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0025804221618753381==--
