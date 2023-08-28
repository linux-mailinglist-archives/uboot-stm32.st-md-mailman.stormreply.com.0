Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C834C78B796
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Aug 2023 20:53:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77AE4C6A61D;
	Mon, 28 Aug 2023 18:53:19 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0258CC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 18:53:17 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-5733bcf6eb6so1877457eaf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 11:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1693248797; x=1693853597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r2+YFhtnkdSPdbvBB5qXjkqMPxojVqqvRfkXsqlanu4=;
 b=R/QfpQu8bA2XgsdfZ0BwVbW1q1mn5k5yl9zak//HgQyG+puuPkPoQ4a8XlemkY1cPN
 kHNconqDYPA3awlL+Xkbk9ZPTDxyK/G6DKmbWp1qhXaV36p1MYTrDoR9UVltGXx9LG6U
 IRqHcbJaL5mkZt+4Z1I0Z0HCYYTZBC/LZpPDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693248797; x=1693853597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2+YFhtnkdSPdbvBB5qXjkqMPxojVqqvRfkXsqlanu4=;
 b=dmWzk5HBLGbh+AreUNqJ6hZNmPBwyKybTADGT4YyPgeEKq54kimacaWCn8qS2wkDKa
 LoxjLTOFyTI4stYpA9oPSwIRiIZWQm7E/+Xd9/U8Yv7pT/ee0NhGPgL+M3VmTYz3Q5/G
 Uv9p/AH9EXVdWXvaeUTOeYjpDKE7ocBsINFdLBqggfl/gtdyRWMqEfZT4yn5Q5NCfEVC
 6A7Shrer9MbJS3N5/BU561V/9jfHrJagxvBmxTfoX4pLGg/3b4CnmB2G/wLAmzP4gtwg
 3Z/TfAwiizNR/ovIZ8IvdwAhpB1ET6Sry5ZWInlmDMB9xB4rXWfPU/7nDkmWrKZkNvBs
 oHzA==
X-Gm-Message-State: AOJu0YwTEU0ezJdbmauHlf7N6AbQaXywqR5NHzoTP3MWOP26KxgjHwTy
 zSKgYtJMo97W+phsqAMB3GBvvQ==
X-Google-Smtp-Source: AGHT+IHN/0TlD9jfk8uwqAUduA/op/Zl6UkXZuSi5rSsVeJwSh+kQmRr9NUwy/wkiClbKMun0ktDtg==
X-Received: by 2002:a05:6358:430b:b0:12b:e47a:8191 with SMTP id
 r11-20020a056358430b00b0012be47a8191mr16158616rwc.16.1693248796703; 
 Mon, 28 Aug 2023 11:53:16 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-c01a-9a8d-1e42-2ea4.res6.spectrum.com.
 [2603:6081:7b00:6400:c01a:9a8d:1e42:2ea4])
 by smtp.gmail.com with ESMTPSA id
 t93-20020a25aae6000000b00d780d87cb73sm1805160ybi.51.2023.08.28.11.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 11:53:16 -0700 (PDT)
Date: Mon, 28 Aug 2023 14:53:13 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20230828185313.GO3953269@bill-the-cat>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
 <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5535603089654403650=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5535603089654403650==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8H9BdoROiTfgy/VL"
Content-Disposition: inline


--8H9BdoROiTfgy/VL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 11:54:55AM -0600, Simon Glass wrote:
> Hi Alper,
>=20
> On Sun, 27 Aug 2023 at 13:17, Alper Nebi Yasak <alpernebiyasak@gmail.com>=
 wrote:
> >
> > On 2023-08-24 06:02 +03:00, Simon Glass wrote:
> > > In this early stage of using binman to produce output files, we are m=
ostly
> > > seeing people using common extensions such as '.bin' and '.rom'
> > >
> > > But unusual extensions appear in some places.
> > >
> > > We would like 'buildman -k' to keep the build outputs, but this is ha=
rd if
> > > there is no consistency as to the extension used.
> > >
> > > This series adjusts binman to enforce just 4 extensions for output im=
ages:
> > >
> > >    .bin
> > >    .rom
> > >    .itb
> > >    .img
> > >
> > > Other extensions will produce an error. With this rule observed, buil=
dman
> > > can keep the required files.
> >
> > I dislike this limitation. We know what files we will generate, they are
> > listed in binman dtb, so we can add something like `binman build --ls`
> > to print their names/paths for buildman to preserve them.
>=20
> Yes, it would be good to have that...
>=20
> But why do you dislike the limitation? Do you think extensions provide
> useful information? I suppose one problem is that *.bin might pick up
> private blobs that happen to be in the source directory?

I think all of the complaints thus far have shown the problem with
trying to enforce an arbitrary limit here.

--=20
Tom

--8H9BdoROiTfgy/VL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTs7RMACgkQFHw5/5Y0
tywczwv/W/+2WfWziobicYJaae94xnLvnnop8hRq58wRH6FqJQo61KPwIuFKQ162
f+9WmEAuDs48oNKJsqPQefAvP/AJnEXEjlVlyv++T4BeHusQWnrOa6oWnPo/8uK5
ZLad0G0OCYoja471KfNq0ASkwOu64hmQHkXQO4olZ+Cfc4MrmRDIigMfIZ6vhy1O
0pUtXFyF/JH2srjxeDh9hAvR5SzLVBzgbzMopMacRwcXMgLCz/WoYD7eIyI2UKuO
p0vp8bCa324NE76lH8xB6lKGgLywrk9MpXDHW6XzbIkHVl6CW0GoIsQfeMjAxFgx
tC/vPKh+Kqpw2A3xiRYtgWZmnN1rMnRg7ltn80C6YMcbAEgCBvxLSzjtbbhMpRV5
cvXWDe2N6LxqxJtNgepm0QPFGIzsRyHv4etVSRU8AJp2Fi4VXTEgSwY0wMAdRVT5
Sohn/POxYRGfoClH15aaAV/H+Hv/2NwHZTRO5g0S4G2bxKS20u1jVCD74zRXKIJx
WoI47rEi
=SXTm
-----END PGP SIGNATURE-----

--8H9BdoROiTfgy/VL--

--===============5535603089654403650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5535603089654403650==--
