Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3257BB037
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Oct 2023 04:16:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FF99C6C836;
	Fri,  6 Oct 2023 02:16:23 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C961C6C835
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 02:16:21 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5a22eaafd72so20082367b3.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Oct 2023 19:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1696558580; x=1697163380;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w4ygzgpXvv2i7uIt7HnJAmBmKtoqn+BWCCZRV27bN9I=;
 b=P5JogK0v8x/wQ+kIWHF61/CvQE+hQ7o6bRQzXh37rOVZfR63S71g/4cHnM02/6FvAk
 NqmCSTMtGEpOHoEz7dIW4r1kmozD5s/wIxVCViyefJFCb6C5GXM5zOd4Ur052rgUAlmb
 rEJBWF+AVPgW6vpWR/cHG3zwOqI/sfWKtUsQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696558580; x=1697163380;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4ygzgpXvv2i7uIt7HnJAmBmKtoqn+BWCCZRV27bN9I=;
 b=jcxWj4x5G6g0ERejaxP3wBaXHmYEtlvHvJfXBc47emJcle6tx7z3yEQGFQygsr5W7N
 9lYjKA+z4gddirqJquGSMjivGlUNq+oHEyJFI4qSU1GhC4CaetMVCmFz2RSup2zKt6o4
 krQVUMQJixJd9+9CLuyHc8dBNvNlYrAjApfPgW0htI4dWSzl2zfASIe7t2doRDQpUVef
 znQMhIqJIyuRkJXbfWdCptP6Tk/wMQ2qMY8BLcA0drsBrMvjNIOzwKny0Ud4O6wMv9RO
 IEsee/9LPhRBklPdYjfLU0UPYHoppTC9rNcxEZVsmtbC+r2GbHDn47D0mdhxePeMRfWk
 Qj2Q==
X-Gm-Message-State: AOJu0YyntNfKdJDcktcHBJ1VO0S2CAHSnwFdAYJ2OvrCdGf1p0q2L0aB
 gC5T4RzTqptT6jnBexxN5Zd8VdVZRuTexUE/tfCGmA==
X-Google-Smtp-Source: AGHT+IG2Td0SF+LwfDlTI2Yo8+qTvlke/H+jCv+zwENRP4/MwXXh7Quu47iDpAJ8jzir2qPJhyIHvw==
X-Received: by 2002:a0d:d305:0:b0:56c:f32d:1753 with SMTP id
 v5-20020a0dd305000000b0056cf32d1753mr6866963ywd.44.1696558580292; 
 Thu, 05 Oct 2023 19:16:20 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-385b-0a87-6b23-cb7e.res6.spectrum.com.
 [2603:6081:7b00:6400:385b:a87:6b23:cb7e])
 by smtp.gmail.com with ESMTPSA id
 u68-20020a0deb47000000b005a1ca828930sm926255ywe.107.2023.10.05.19.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 19:16:19 -0700 (PDT)
Date: Thu, 5 Oct 2023 22:16:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20231006021616.GB2227687@bill-the-cat>
References: <20230924203953.1829820-1-sjg@chromium.org>
 <20230924203953.1829820-6-sjg@chromium.org>
 <20230924232658.GM305624@bill-the-cat>
 <CAPnjgZ2-ORog-+Onh1McptpMDrzccVc+BfByCMjp93wLqAms6w@mail.gmail.com>
 <20231005145350.GQ8465@bill-the-cat>
 <CAPnjgZ2Mbx9H_ve_F_gq_eqt2hvwmYF455-0PHB31fV5m9HN2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ2Mbx9H_ve_F_gq_eqt2hvwmYF455-0PHB31fV5m9HN2A@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4650478500029444717=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4650478500029444717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ykiKeVcwV9TzopKa"
Content-Disposition: inline


--ykiKeVcwV9TzopKa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2023 at 07:41:49PM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Thu, 5 Oct 2023 at 08:53, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Oct 04, 2023 at 07:23:47PM -0600, Simon Glass wrote:
> > > Hi Tom,
> > >
> > > On Sun, 24 Sept 2023 at 17:27, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > On Sun, Sep 24, 2023 at 02:39:23PM -0600, Simon Glass wrote:
> > > > > Some commands assume that CONFIG_SYS_LONGHELP is always defined.
> > > > > Declaration of long help should be bracketed by an #ifdef to avoi=
d an
> > > > > 'unused variable' warning.
> > > > >
> > > > > Fix this treewide.
> > > > >
> > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > [snip]
> > > > > diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/mach-imx/cmd_=
dek.c
> > > > > index 6fa5b41fcd38..25ea7d3b37da 100644
> > > > > --- a/arch/arm/mach-imx/cmd_dek.c
> > > > > +++ b/arch/arm/mach-imx/cmd_dek.c
> > > > > @@ -393,11 +393,12 @@ static int do_dek_blob(struct cmd_tbl *cmdt=
p, int flag, int argc,
> > > > >       return blob_encap_dek(src_addr, dst_addr, len);
> > > > >  }
> > > > >
> > > > > -/***************************************************/
> > > > > +#if IS_ENABLED(CONFIG_SYS_LONGHELP)
> > > > >  static char dek_blob_help_text[] =3D
> > > > >       "src dst len            - Encapsulate and create blob of da=
ta\n"
> > > > >       "                         $len bits long at address $src an=
d\n"
> > > > >       "                         store the result at address $dst.=
\n";
> > > > > +#endif
> > > > >
> > > > >  U_BOOT_CMD(
> > > > >       dek_blob, 4, 1, do_dek_blob,
> > > >
> > > > This really doesn't read nicely.  I would rather (globally and fix
> > > > existing users) __maybe_unused this instead.  I think there's just =
one
> > > > example today that isn't "foo_help_text".
> > >
> > > Hmm, what do you think about adding a __longhelp symbol to cause the
> > > linker to discard it when not needed?
> >
> > Well, I don't think we need linker list magic when __maybe_unused will
> > just have them be discarded normally.
>=20
> Yes, perhaps things are in a better state than they used to be, but
> there is a linker discard for commands at present.

Yes, but __maybe_unused means we don't get a warning about it, and it's
literally discarded as part of --gc-sections as it done everywhere with
maybe 3 exceptions?

--=20
Tom

--ykiKeVcwV9TzopKa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmUfbe0ACgkQFHw5/5Y0
tywQjAv/WL8w9u04QtJGJXVvqWma8GUpRkT1byHmueswnnJCnTpSVVoqsg06goUt
zb5jQCx09PpqlIrrpbVuMtsO3M34XUHS6BdfzNkrUSgU918jzWRhza0NVR3An7FC
A+m5gwhPTUK5fESCABApUMHiY1Pry8iLD2c8OuNHAtApHD4nil/Qq7BEvDU4jnaa
TC6Q0is2ytV8LrdgQBPCOarIr1dkGFp5EKPN0zRtdRW2Oy30QNY9b+ftbFFcji1z
PCzSBS7jXa8Bq94ej30FQcKOxHExFDzoNDhk45jqAbYxFydWivbh/kQmJ0qbwdfO
bnq357eUccuHkWhvqAB1NQk5zBTq7g5TMnOQOAkD6mJczrDD2ZgHXh8rCkzoNZU1
MlgBcCwS7nXU/GdPd45HxppfR8m9K2va26G4LrQdRFa3VKqmT2WshJWC0WgA55Bx
OyFKBlLFW3wzS/T+XF6xLHtTbBkcrXKRTeOsWMkxVJ03U2yVqs8+D7wPR23JaBuJ
CqFEy4WP
=4RPY
-----END PGP SIGNATURE-----

--ykiKeVcwV9TzopKa--

--===============4650478500029444717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4650478500029444717==--
