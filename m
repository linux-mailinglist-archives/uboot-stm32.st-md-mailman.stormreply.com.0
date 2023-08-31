Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD5678F30B
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Aug 2023 21:07:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 081FDC6A615;
	Thu, 31 Aug 2023 19:07:14 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAF72C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 19:07:12 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-58fb73e26a6so13670777b3.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 12:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1693508832; x=1694113632;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lihXGB6e6F7b/x07IILVWt8l3MlJEDWl7lW4k8eVK8o=;
 b=kKNG3Yrw4T+UiYEueeXdsslEVGoPVTFLAhuyVn9z4hXK+6Vsy3cmEiHchaRq1d6LbZ
 /z1662w7+xzoQN+B9BRqXX/UL3w1oBqYGjIfiJL3W74RkloXvrF68NywpZDl7blEkBHQ
 5aNh8iv+UxSer4J5qQ+qpD2xdDhREtztVunkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693508832; x=1694113632;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lihXGB6e6F7b/x07IILVWt8l3MlJEDWl7lW4k8eVK8o=;
 b=JE2iLDuvvF5MNixIw9n5n0pPSWltbrNJl+WyRaOTEr59e5XAkBs+M5uQUPsi02wSog
 IOaRXVWzDq1BaZpROJyX09pVXM4gpQo4z0b6aWL/6iQR4q1fRNHFBBH7FqpTzs6idTd9
 TQn3c0ujNxAyeXLXNBMRPawIL1+QAlMkBawZl1BTlNJSGkbM77jtLYbMGdR3uKN2uca7
 BFOuai/fCkUneKZatYkznxnvuZ5nOHtABIXqW08f3JKLmQxRasEeu3kyliYDOQ9yC7ev
 DLBJVQnKn+y8bNchBgg/ifju4pKThVex8+8f3y1pZUQl/RIO/zscMVX+m6Ydi/1ZuGfK
 U6Bw==
X-Gm-Message-State: AOJu0YyuO43eYzK+Tusa/esgdw5zc9Z9cCjJDdSIe9VEMSMJRKu95NX5
 4sBXS4fwBvXg5oHpk1q958/2vA==
X-Google-Smtp-Source: AGHT+IGy69Zd1otLmHkTljBaRN091UOrTdekzAwoL08wbg+a/6CY8obQK4y0ofGP94wiDW3ltfTHlA==
X-Received: by 2002:a0d:d68c:0:b0:590:e116:cef6 with SMTP id
 y134-20020a0dd68c000000b00590e116cef6mr372998ywd.26.1693508831745; 
 Thu, 31 Aug 2023 12:07:11 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-1cd4-1a46-fd5d-6cab.res6.spectrum.com.
 [2603:6081:7b00:6400:1cd4:1a46:fd5d:6cab])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a81d549000000b00594fff48796sm601305ywj.75.2023.08.31.12.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 12:07:11 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:07:09 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20230831190709.GO3101304@bill-the-cat>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
 <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
 <d4ce17ae-8b84-4c8a-acaa-287549ec23a3@gmail.com>
 <CAPnjgZ0sTAoZi5TDAaTZUNPVNQ5dqoyVENDWJr=exa5z2R8srw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ0sTAoZi5TDAaTZUNPVNQ5dqoyVENDWJr=exa5z2R8srw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4489979443075274971=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4489979443075274971==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3hewfFBUNrsNyoT"
Content-Disposition: inline


--w3hewfFBUNrsNyoT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 01:01:59PM -0600, Simon Glass wrote:
> Hi Alper,
>=20
> On Thu, 31 Aug 2023 at 04:20, Alper Nebi Yasak <alpernebiyasak@gmail.com>=
 wrote:
> >
> > On 2023-08-28 20:54 +03:00, Simon Glass wrote:
> > > Hi Alper,
> > >
> > > On Sun, 27 Aug 2023 at 13:17, Alper Nebi Yasak <alpernebiyasak@gmail.=
com> wrote:
> > >>
> > >> On 2023-08-24 06:02 +03:00, Simon Glass wrote:
> > >>> In this early stage of using binman to produce output files, we are=
 mostly
> > >>> seeing people using common extensions such as '.bin' and '.rom'
> > >>>
> > >>> But unusual extensions appear in some places.
> > >>>
> > >>> We would like 'buildman -k' to keep the build outputs, but this is =
hard if
> > >>> there is no consistency as to the extension used.
> > >>>
> > >>> This series adjusts binman to enforce just 4 extensions for output =
images:
> > >>>
> > >>>    .bin
> > >>>    .rom
> > >>>    .itb
> > >>>    .img
> > >>>
> > >>> Other extensions will produce an error. With this rule observed, bu=
ildman
> > >>> can keep the required files.
> > >>
> > >> I dislike this limitation. We know what files we will generate, they=
 are
> > >> listed in binman dtb, so we can add something like `binman build --l=
s`
> > >> to print their names/paths for buildman to preserve them.
> > >
> > > Yes, it would be good to have that...
> > >
> > > But why do you dislike the limitation? Do you think extensions provide
> > > useful information? I suppose one problem is that *.bin might pick up
> > > private blobs that happen to be in the source directory?
> >
> > I guess my strongest argument is that people already/will have workflows
> > that depend on certain filenames or extensions, and shouldn't have to
> > modify binman code (consider that people may be using the PyPI wheels)
> > to accommodate those when we are already putting the name in the dtb.
> >
> > I do want some standardization to the U-Boot build outputs though, but
> > more like a global binman.dts with like u-boot.rom, u-boot-sdmmc.img
> > images with well-defined TPL, SPL, U-Boot sections that arch-dtsi files
> > can fill in.
> >
> > >> Regarding the output directory suggestion, I think the binman outputs
> > >> (not temporary/intermediate files) should be in the same directory as
> > >> make outputs
> > >
> > > Agreed
> > >
> > >> , and the Makefile should default to O=3Dbuild to achieve the
> > >> "output dir". I'm not sure if that's going to happen.
> > >
> > > I would quite like the 'non-output' file (i.e. things that are not a
> > > binman image) to appear in a 'binman-work' subdir of the output dir.
> > > What do you think?
> >
> > I'd prefer them to go in a tempfile.TemporaryDirectory() and discarded
> > at the end of a binman run, and a "--tmpdir <path>" option to use a
> > given directory instead and preserve things for debugging.
>=20
> Actually, that was the original purpose of the output directory in the
> u_boot_pylib.tools module. But with all the files binman creates, that
> has been lost. I think we should restore that purpose (with an output
> dir as a temp dir) and then I think what you have written here will
> work.

Just please note the rest of the feedback that's been given to this
series too.

--=20
Tom

--w3hewfFBUNrsNyoT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTw5NoACgkQFHw5/5Y0
tyyz6Av/a5yUFtF9wrgC20sA473Ip6+PezKJwattoJQcY2RGtbgRMrpCRBZyKbue
UC7qSEaxRN3tjXIDPuO7F35WU2q8qmnHhL9RyWHYyq1NeWpfe2Fo25Vn0SUd7LU2
L7EhAf0cz0K8Wi1XPJJQ/NwBioZ6CdeuBRDB2hUhdbQxXkCvZ4LaAK2Af3gp6g94
w5VIrrmm7dmdyiL3W+hKoSfVZlSwNY7wO1lQljiZ0WjA8BiwXR2CWQ7O+F5otm6c
O2aK29gbPUzJ0LIW8hVgpQ6ViJgOmF9mUWgaPLhetp56ph2EsvvBPZ3hQ3tb56Mn
jZOmD6d53emfQ/SYR3KwSAZanhjOFS891mmCaDgR0BUJ4ihqJnyWrG8Z4Xt0ZZCP
EMZjlBE960dyDEBuvSrMBPD1hqELzIngNGq+ACNKmStkm79/413fABuNLipPx4a9
/7CoOWAkgG6rw3ejtKdLLFBM66YqeMiTz7znlgED3ddVy/Ba3wVAuVIAped7Pudt
XO2iyCoF
=1s/U
-----END PGP SIGNATURE-----

--w3hewfFBUNrsNyoT--

--===============4489979443075274971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4489979443075274971==--
