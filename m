Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DBE78720B
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 16:45:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CF6EC6B44F;
	Thu, 24 Aug 2023 14:45:40 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22070C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 14:45:39 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-59289606ca6so4539777b3.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1692888338; x=1693493138;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RuZuNba/1z1BSYPHNRIyTDmuzVfAzMDhfdqChAwlfwI=;
 b=DinjybyDYxqzbChph6I0O09T63Mc/v9df7iW/jDgw2sn6wptW6HnbyXN/PuB7wskDH
 9PVkMrGgKfQ2VPEurj8+7P+zGt/4wfelOKyPVBZ6lRnrwYVHDBf9R/jYrEPGCMOy7uWx
 E5OMFkP3T9BlItHPDpikCvh9TIYT1/du0WDDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692888338; x=1693493138;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RuZuNba/1z1BSYPHNRIyTDmuzVfAzMDhfdqChAwlfwI=;
 b=N/9hqWsviDTqPH7Fz3gqfjYCRFLYioHH6bT7e7bEWv6UJzCas6MpLMeJA6u4QJrhHP
 FCyLv8chGe6+5FOrZ8OWfrRt4CF1vqSsl2FHFJNrfUFFQ7iGMy+GghbG+MphNeP7DTuT
 svokwq3T8vFfBu16JYCxTfTZ0C2fzasEpWAb455VQSXFtFO7sKPMJChfnqzXMbSmAuIp
 VibfczqMBSlPyqO3TkJ/iYoNkbWz3jmKSrKBGyoAxsz6R5KxNLiAGqOLEOzvAck2rXT0
 ewAiuRsTWYiWIgAZIImhz9EdFLo7kQAYx+KqUgNQ8uYCACVQW+J+QRhULxYsxdXFMRnJ
 Anpg==
X-Gm-Message-State: AOJu0Yz4Hj8lIwohQlYtQJqAkakkaztQVF4gOjMznojmLyn5IAsmO268
 lNKnw/EnwW9ppgwBNBk5LWc0Rg==
X-Google-Smtp-Source: AGHT+IELgZXg7ay13oUpcFbbrKsE5BUDJLNTgTUTkiB0lLy+EjakcXJMZ1z+Tm0GMEuzOjpL2LKY8w==
X-Received: by 2002:a0d:df57:0:b0:584:3f4a:b790 with SMTP id
 i84-20020a0ddf57000000b005843f4ab790mr16372173ywe.33.1692888337782; 
 Thu, 24 Aug 2023 07:45:37 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-37ed-1199-bcc5-406f.res6.spectrum.com.
 [2603:6081:7b00:6400:37ed:1199:bcc5:406f])
 by smtp.gmail.com with ESMTPSA id
 p63-20020a0de642000000b00586b5b6347csm3938707ywe.109.2023.08.24.07.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:45:37 -0700 (PDT)
Date: Thu, 24 Aug 2023 10:45:35 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20230824144535.GP3953269@bill-the-cat>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <20230824133814.GH3953269@bill-the-cat>
 <CAPnjgZ1oY9SRWNj9RUe2L8=1ndE2LfxkmqqEj-MNtxL_ff-QyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ1oY9SRWNj9RUe2L8=1ndE2LfxkmqqEj-MNtxL_ff-QyQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neha Malcom Francis <n-francis@ti.com>,
 Vikas Manocha <vikas.manocha@st.com>, Michael Walle <michael@walle.cc>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
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
Content-Type: multipart/mixed; boundary="===============9050779177620679780=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============9050779177620679780==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yVQitOjrOouggXfn"
Content-Disposition: inline


--yVQitOjrOouggXfn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 08:41:21AM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Thu, 24 Aug 2023 at 07:38, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Aug 23, 2023 at 09:02:53PM -0600, Simon Glass wrote:
> >
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
> > >
> > > Some patches are included to fix up some easy problems. But the follo=
wing
> > > boards generate 'custMpk.pem' and it is not clear how to fix this, so=
 I am
> > > asking for help from the maintainers:
> > >
> > >    am62ax_evm_r5 am62x_evm_r5 am64x_evm_r5 am65x_evm_r5
> > >    am65x_evm_r5_usbdfu am65x_evm_r5_usbmsc am65x_hs_evm_r5
> > >    j7200_evm_r5 j721e_evm_r5 j721s2_evm_r5 verdin-am62_r5
> > >    am62ax_evm_a53 am62x_evm_a53 am64x_evm_a53 am65x_evm_a53
> > >    am65x_hs_evm_a53 j7200_evm_a72 j721e_evm_a72 j721s2_evm_a72
> > >    verdin-am62_a53
> > >
> > > It looks like the .pem files are listed as top-level images, e.g.:
> > >
> > >    &custmpk_pem {
> > >       filename =3D "../../ti/keys/custMpk.pem";
> > >    };
> > >
> > > but if the only objective is to pick up an existing file, it is bette=
r to
> > > set BINMAN_INDIRS to include that directory. Also we should only have
> > > simple leafnames in the 'filename' property, so the '../../ti/keys' i=
s not
> > > correct. It makes it harder for people to get the files from other pl=
aces.
> > > Making this easier is one of binman's goals.
> > >
> > > Most likely the custmpk_pem node can be removed and the .pem file can=
 be
> > > included directly in the place that needs it, e.g. by adjusting the
> > > ti-secure-rom etype (or ex509_cert) to use tools.get_input_filename()=
 when
> > > reading the key file.
> > >
> > > For example, this:
> > >
> > >    custMpk {
> > >       filename =3D "custMpk.pem";
> > >       custmpk_pem: blob-ext {
> > >          filename =3D "../keys/custMpk.pem";
> > >       };
> > >    };
> > >
> > > is really just copying a file from '../keys/custMpk.pem' to 'custMpk.=
pem'
> > > so is equivalent to:
> > >
> > >    custMpk {
> > >       type =3D "blob";
> > >       filename =3D "custMpk.pem";
> > >    }
> > >
> > > (note that blob-ext implies that the blob may be missing, so blob is a
> > > better choice, since the key cannot be missing)
> > >
> > > The fact that the .pem files are at the top level means that they are
> > > output images, which surely is not intended. They should be buried in=
 the
> > > image description, at a lower level, as part of something else.
> > >
> > > So please take a loke at the above and see if the binman descriptions=
 can
> > > be reworked slightly to follow these new rules.
> > >
> > >
> > > Simon Glass (6):
> > >   binman: Require image filenames to have certain extensions
> > >   buildman: Keep all permitted output files
> > >   buildman: Show progress when regenerating the board.cfg file
> > >   buildman: Start the clock when the build starts
> > >   kontron_sl28: Use u-boot-update.bin instead of u-boot.update
> > >   stm32mp15: Use u-boot-spl-stm32.bin instead of u-boot-spl.stm32
> > >
> > >  .../dts/fsl-ls1028a-kontron-sl28-u-boot.dtsi   |  2 +-
> > >  arch/arm/dts/stm32mp15-u-boot.dtsi             |  2 +-
> > >  doc/board/kontron/sl28.rst                     |  4 ++--
> > >  doc/board/st/stm32mp1.rst                      | 18 +++++++++-------=
--
> > >  include/configs/stm32mp15_dh_dhsom.h           |  2 +-
> > >  tools/binman/binman.rst                        |  5 +++++
> > >  tools/binman/etype/section.py                  |  3 +--
> > >  tools/binman/ftest.py                          | 12 ++++++++++--
> > >  tools/binman/image.py                          |  9 +++++++++
> > >  tools/binman/test/022_image_name.dts           |  4 ++--
> > >  tools/binman/test/311_bad_image_name.dts       | 17 +++++++++++++++++
> > >  tools/buildman/boards.py                       | 15 ++++++++++++---
> > >  tools/buildman/builder.py                      |  3 ++-
> > >  tools/buildman/builderthread.py                | 11 +++++++----
> > >  tools/buildman/control.py                      |  3 ++-
> > >  15 files changed, 81 insertions(+), 29 deletions(-)
> > >  create mode 100644 tools/binman/test/311_bad_image_name.dts
> >
> > This doesn't seem to address the ones I pointed out on IRC as being the
> > first order (to me anyhow) problem of needing the _unsigned files on the
> > platforms you list above for PEM files.
>=20
> I think it should be xxx-unsigned.bin instead of xxx.bin_unsigned

As I was saying on IRC, you need to make that change then, if we're
going to go down this path, before v2023.10 is out.

And to repeat what I said inside another part of the thread, the u-boot*
glob is hiding other "arbitrary" extensions that we've had in-use for
forever.

--=20
Tom

--yVQitOjrOouggXfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTnbQ8ACgkQFHw5/5Y0
tyw10wwAoEilPrKKp0Sqf67Ainq6eXkGu+zGLB+ug7wd2OGfV/ah6j7dzlAqtzk3
8l+9UZEjfZTMSVYBzm/erGkRm6FcEDv32EBjpG1aH9PZFjSs+PfnDmm81iqTu1mZ
yLbixirQWZuMntkyNs+Sx88DWlnOeKAbvOXT0ce+Nnb+CGg47st7fiXsr+AxZ2T3
pYIJ2ATvFiZVBZfqFrOC4MIiJogXDLTykk9U4Q54FJAVEtztHImAtVtv1L4V57j/
cI2SbKmtrlus0qRfZXS8uEkzxkdkUsRr3MHAdoLmsJHkSNhp8txHYRDYJo3MaHIJ
l2ck2aG++uepgxyZ+mdH1kMg/dsDEDVM5eqkN+a+Gr41jl6+XRXQS+qoAObNaXOl
Rg5ynMrgnZ2p2aJ0oDPVWE5HHiqpLiFHpkEVHjas0bmWVMV8LVAtiKt6ofDbn0iP
FSogpuugRK1ggSGBkiflVkDxiSzeRVZL5OhelXYHO77BVqt8LoxPDdDNF9OmcEOj
tuFDdh5d
=LgU3
-----END PGP SIGNATURE-----

--yVQitOjrOouggXfn--

--===============9050779177620679780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============9050779177620679780==--
