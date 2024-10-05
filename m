Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6D9919F5
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Oct 2024 21:34:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94A0EC78028;
	Sat,  5 Oct 2024 19:34:53 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1575C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2024 19:34:46 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7a99d23e036so344694985a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Oct 2024 12:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1728156886; x=1728761686;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yYl/A+04S4ahIseLCriKrjx96OphSp7ZeTGQh+FVEZw=;
 b=X1GR/nXmwN7bpvEe9Px6Nu+W5LpcZ3Tfkn35snU9Q3Rp+jV8l/ArtAXNrXSco1T82u
 iPaHYLESJn/HGivz0nDCFjvqcGOO5uwfqZY/082KHJW5vnRmliGViqov5I8UCaa0iu4E
 qetxdu9SR7vhdEnd6NKt0DGkVi6fafI3A3fhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728156886; x=1728761686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYl/A+04S4ahIseLCriKrjx96OphSp7ZeTGQh+FVEZw=;
 b=R3dbrx5//vzm8N2aptfSCwYgyfGGNwHJwJtND7kbyQ5NbQ4VZ3UpolMkz9eI/+sHWM
 i+5ajq9v4z20MgFt//nHjmjrAE/YNL09xEapPvVlQR2ZNdcJptQvouPIhhwRQ1+IFiSz
 aP3y9tew4lFDGtJIvGhE0VYZvC3cHvVsSrJpujkDmDwLgNIOTttub0Y3LKZIHggWOpHg
 eHc3QPF2kjCyg/76hKFLiqOrEHsB15wr8UXGvt+VYgNHE7eJ+Ae/VfXT+5ytJVLeo4mP
 CYH4ez8gn4hOYOIGEhmsODOpwJaD9McC7u3efU1xm0X+zm76+PcukaW7PLecmZ5YM307
 Igkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmc1IVm44xi6+n1Zz1nrHC677sRdXhAtpLJlAIOqEoyjYSPgIH3AhWYUCBfAJWBZ0ITLSAsuyt64P8gA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz7LHUnleA+kqeszcg/THF0J2wlXl04GNpMCth1v+QkKx3TdxHN
 fvz5iF2x/Mmq83wPjjDdHeY4UoQfYdYgWJOYOgLVfdXCjRjWgJZ6s/UG1N3jlTA=
X-Google-Smtp-Source: AGHT+IHpHBkFAAut9snqzZ0xMs8oQXDFPu6rugphO+lrNXqqMLt8Xc0z9efVH21GbnW+z2GC62SpkQ==
X-Received: by 2002:a05:620a:4085:b0:7a9:ac2d:596c with SMTP id
 af79cd13be357-7ae6f45442fmr1269974185a.32.1728156885670; 
 Sat, 05 Oct 2024 12:34:45 -0700 (PDT)
Received: from bill-the-cat ([187.144.65.244])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae75620040sm103340585a.18.2024.10.05.12.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 12:34:43 -0700 (PDT)
Date: Sat, 5 Oct 2024 13:34:39 -0600
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20241005193439.GM4737@bill-the-cat>
References: <20241004235641.395703-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20241004235641.395703-1-marex@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v2] ARM: stm32: Update MAINTAINERS file
 globs for STM32MP DHSOM
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
Content-Type: multipart/mixed; boundary="===============1627287670560548043=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1627287670560548043==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xbxJOVqNvJwcRRzd"
Content-Disposition: inline


--xbxJOVqNvJwcRRzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 05, 2024 at 01:56:21AM +0200, Marek Vasut wrote:

> Update the MAINTAINERS file glob to cover all of STM32MP DHSOM related fi=
les.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--xbxJOVqNvJwcRRzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmcBlMwACgkQFHw5/5Y0
tyyY2Qv/cQQRr9lU4X8bvIJJArf4r9zUQGbK+ymr6VVHcV8pz8vtmO5RzA00JZmU
H4M9Mk9SdYdJ4szDchJRxxZIMPDlT1c4HeQsRr48mptKbb7L9/rqLgh86OU0WrZl
cMiOFPPcovR2ORLRamjD2k/fPbQ2HPTXjeO4nRpsz/4p1wxiUUl+OJ1S/ClTO3zN
siKGYfBzWXNuZfFEjtM7fbjmYxZMKyydxw4N8FMXEdFjMjmybpELzbRo0d7IPrrD
U0sQLLVEcXIwmty3GLw1nfihm8p8+0VaezOL29+BPoHfvu2Tvmyo0D52NkaP+Apg
8qVRC/O4xKrip1aSO7t7dp74kbO5D2/2MoQuWRlKdWDZ+2cBVzyaae5G/eDRz+L/
s2hFYcTvZuT8hvsQAm4Ex0BSk/W3jxiF1EfmfsJ7U1ybrqEeI0hrRwZy24eGlSvF
U+3rW5TxL96Gjube7sstgt0FELNScS6XmkkTivx3iiIhP8CTpbB1yRr4/cNgL5+F
thresb70
=vYP1
-----END PGP SIGNATURE-----

--xbxJOVqNvJwcRRzd--

--===============1627287670560548043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1627287670560548043==--
