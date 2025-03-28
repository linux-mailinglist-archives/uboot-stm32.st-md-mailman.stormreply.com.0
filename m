Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B93A74E83
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Mar 2025 17:25:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A5AFC78F77;
	Fri, 28 Mar 2025 16:25:47 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2B87C78F75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 16:25:45 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3fefbbc7dd4so1306448b6e.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 09:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1743179144; x=1743783944;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mmX1FcR1u8D62ThEtLHNz9rsGgBsilCqLZo46P1FPZc=;
 b=C9RAfY3Qf58k7/7bVqyIlIW86HzVsgoh2+ImEmPMIY34yNvMKMSxvqV9DEHBo5afTD
 FA73NV9ZCVKUGY8huhnUCPXtGWT3rJWPstaT7NOoYPHKnBBqHIURSZU/tJb6oYSN7/kI
 +QmAFNEO8EqTTdkJCqWL1vuOgIUGE+zmonNO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743179144; x=1743783944;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmX1FcR1u8D62ThEtLHNz9rsGgBsilCqLZo46P1FPZc=;
 b=D36YwmGCeFx7SZaIf3s4LsUvwiSUSV3fg1IGNHQboXOidhSe41dNJH19ljEEn1uyen
 GUaDLARbyMwNp/n+Kjoa6ifdGrhMat1nbtH2oCYliubiU142Mw5OPJ2UdXly4PIlJ3ga
 BI+h3ss9N5JWYSgq+70mctGLflw7OxJTpUw3ywMG3U3taWCP4PLSgOg7I2Ajlv4okD9z
 9e9gC6O4HXrySWqM+Du8WmWPdavY0hUWlgcFSKhcU9Mmw6/tH0+L1Q0tHGoODlByS4vk
 50jW4K4AZjhl+8wDyidFQy/vFhVKjCbndkZkj2p+8wyBDsiBWNrlFxFGpk5xHCgEGHsO
 Jhtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEaxeuP9P7l/JBSoyXHllvgLBfsbjn4VFUUAQpY8A3p/Sopd2wXPj2SAMAQvpJVyEZWcPZAIjzAOjJEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQDEVo3EY/IUarWZgm3HhT7FWnUxcpBjPc39La3XRXOMhSXgcN
 RIpfWZj+QTKbMcbdsia7PW0CRTQUUYXOxBO1yyKeUHyUtQKtzbsH5SbJfHHOvz8=
X-Gm-Gg: ASbGnctAEMDIWyi/v63R8TLQvwxhvFPqgDlgAtkxsbF2ML9UT/OrxiLS6gnPRHgrnMm
 gewLwQrbcbOiOfXpnlFIKVZw/RLSXnR2awSbFzfVWfi8KjSJixrdYK4Vy3vnbep036PG2pS48Pl
 Y7CFcLL92FBUNMeoknDXraZEStFemEnj+vMciRFKKcCDF/JC1WYg/TDM4TGuAjlKUDcd+GKzOSJ
 9bv33BHoNAmGQQ2qHY6ppgpsu5w5JEIiKaCrXot96buXcG03ubyfbvfwu7zHFUX4lnEskT1rYKS
 DeGmBkcNQHAl/bIs7vaXNhIgKtaAREpePQjOy08fezsi4g5BDPh8F2F7Mo0yD7xl9BGS0kgCgnZ
 CldSN/A==
X-Google-Smtp-Source: AGHT+IEtEp8Fltx6zSaCsl4n0w1dNtkTFm0SwzyRJqyrP3mLSjtFqMWcDDu7PYnE1buu4SCmFX1gOw==
X-Received: by 2002:a05:6808:2e4b:b0:3fa:c549:d009 with SMTP id
 5614622812f47-3fefa4f387amr6523855b6e.2.1743179144163; 
 Fri, 28 Mar 2025 09:25:44 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-205-42.totalplay.net.
 [187.190.205.42]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3ff05279bb3sm383801b6e.31.2025.03.28.09.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 09:25:43 -0700 (PDT)
Date: Fri, 28 Mar 2025 10:25:39 -0600
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <20250328162539.GC93000@bill-the-cat>
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
 <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
 <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
 <CAC_iWjLS_yNPCMY2RhGZ0390ZysH=N5x5JZ-qOnNjX7nofPS4Q@mail.gmail.com>
 <CAFLszThhK4-+Qh_eQLD0fuJZVodBkwit4rw5mOcGU58m6=5knw@mail.gmail.com>
 <CAC_iWj+2EsRUBT5ThAR7+wwxVkFSzrApCNDbTEEHQ-W658LwCw@mail.gmail.com>
 <20250328160419.GX93000@bill-the-cat>
 <2c9efc39-b0b9-41e7-b42e-1d026bc286a7@gmx.de>
MIME-Version: 1.0
In-Reply-To: <2c9efc39-b0b9-41e7-b42e-1d026bc286a7@gmx.de>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>,
 Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@arm.com>,
 u-boot@lists.denx.de, Wei Ming Chen <jj251510319013@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Udit Agarwal <udit.agarwal@nxp.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Manish Tomar <Manish.Tomar@nxp.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Wasim Khan <wasim.khan@nxp.com>,
 Mathew McBride <matt@traverse.com.au>,
 Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Tien Fong Chee <tien.fong.chee@altera.com>, e@freeshell.de,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Adriano Cordova <adrianox@gmail.com>, Ashish Kumar <Ashish.Kumar@nxp.com>,
 Sumit Garg <sumit.garg@kernel.org>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@intel.com>,
 Lukas Funke <lukas.funke@weidmueller.com>,
 Robert Marko <robert.marko@sartura.hr>, Michal Simek <michal.simek@amd.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tang Yuantian <andy.tang@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Maks Mishin <maks.mishinfz@gmail.com>,
 Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: remove EFI_BOUNCE_BUFFER
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
Content-Type: multipart/mixed; boundary="===============5259590234335575608=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5259590234335575608==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QoykfpATO7cYb6pP"
Content-Disposition: inline


--QoykfpATO7cYb6pP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 05:17:36PM +0100, Heinrich Schuchardt wrote:
> On 28.03.25 17:04, Tom Rini wrote:
> > On Fri, Mar 28, 2025 at 02:26:39PM +0200, Ilias Apalodimas wrote:
> > > On Fri, 28 Mar 2025 at 13:34, Simon Glass <sjg@chromium.org> wrote:
> > > >=20
> > > > Hi Ilias,
> > > >=20
> > > > On Thu, 27 Mar 2025 at 15:19, Ilias Apalodimas
> > > > <ilias.apalodimas@linaro.org> wrote:
> > > > >=20
> > > > > Hi Simon
> > > > >=20
> > > > > On Thu, 27 Mar 2025 at 15:33, Simon Glass <sjg@chromium.org> wrot=
e:
> > > > > >=20
> > > > > > Hi Ilias,
> > > > > >=20
> > > > > > On Wed, 26 Mar 2025 at 02:37, Ilias Apalodimas
> > > > > > <ilias.apalodimas@linaro.org> wrote:
> > > > > > >=20
> > > > > > > Hi Heinrich,
> > > > > > >=20
> > > > > > > On Mon, 24 Mar 2025 at 19:50, Heinrich Schuchardt <xypron.glp=
k@gmx.de> wrote:
> > > > > > > >=20
> > > > > > > > On 17.03.25 14:38, Ilias Apalodimas wrote:
> > > > > > > >=20
> > > > > > > > %s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/
> > > > > > > >=20
> > > > > > > > > The EFI subsystem defines its own bounce buffer for devic=
es that
> > > > > > > > > can't transfer data > 4GB. U-Boot already has a generic B=
OUNCE_BUFFER
> > > > > > > > > which can be reused instead of defining another symbol.
> > > > > > > > > The only limitation for EFI is that we don't know how big=
 the file a user
> > > > > > > > > chooses to transfer is and as a result we can't depend on=
 allocating the
> > > > > > > > > memory from the malloc area, which can prove too small.
> > > > > > > > >=20
> > > > > > > > > So allocate an EFI buffer of the correct size and pass it=
 to the DM,
> > > > > > > > > which already supports bounce buffering via bounce_buffer=
_start_extalign()
> > > > > > > >=20
> > > > > > > > Looking at
> > > > > > > >=20
> > > > > > > >       if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {
> > > > > > > >=20
> > > > > > > > in drivers/block/blk-uclass.c the bounce buffer has to be e=
xplicitly
> > > > > > > > enabled by the device driver. Only the scsi drivers sets bb=
 =3D true.
> > > > > > > >=20
> > > > > > > > Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce =
buffer flag
> > > > > > > > to blk_desc")
> > > > > > > >=20
> > > > > > > > Which device-drivers of the boards mentioned below do actua=
lly need
> > > > > > > > bounce buffering?
> > > > > > >=20
> > > > > > > Unfortunately, I don't have any of the hardware to test and I=
 havent
> > > > > > > worked with that platform much.
> > > > > > > That 'bb' variable and the fact that EFI needs bigger allocat=
ions is
> > > > > > > why I ended up allocationg properly aligned memory from the E=
FI
> > > > > > > subsystem. But as Mark pointed out, the cache flush is a no g=
o for
> > > > > > > now, so I'll drop this and see if I find time to rework the b=
ounce
> > > > > > > buffer logic overall
> > > > > >=20
> > > > > > There was quite a bit of discussion about all this in the conte=
xt of
> > > > > > my attempt to just add a message to warn the user[1]
> > > > > >=20
> > > > > > We might consider adding an event to reserve memory before relo=
cation,
> > > > > > along with a way to discover (in board_r) where the memory was
> > > > > > allocated. That would make the solution more generic.
> > > > >=20
> > > > > I am not sure what you are trying to solve here. The EFI bounce b=
uffer
> > > > > after the LMB patches can't overwrite memory, nor can it be
> > > > > overwritten.
> > > >=20
> > > > I am thinking of we can create a single implementation of the
> > > > bouncebuf logic which also works for EFI.
> > > >=20
> > > > I think the two sane things to do are:
> > > > - restrict U-Boot to using memory below 4GB for platforms which have
> > > > the DMA limitation
> > >=20
> > > You don't need that. The bounce buf code has a callback you can use to
> > > define the limitations
> > >=20
> > > > - create (in board_f) a special region below 4GB for use with the
> > > > bouncebuf logic
> > >=20
> > > The only problem with EFI is that you don't know how much memory it
> > > needs and we can't use the existing memalign calls. So if we replace
> > > that memalign in the bounce buffer code, with an lmb reservation we
> > > have everything we need.
> >=20
> > It's not even an EFI problem is it? You could hit the same problem
> > reading a file from a filesystem outside of EFI too. These specific
> > SoCs just aren't heavily exercised is one of the challenges I think and
> > so it's possible that we have a few things to yet improve in the
> > bounce buffer code (which was added for other SoCs and done as generic
> > enough starting point for others).
> >=20
>=20
> EFI or LMB allocate memory top down. So EFI applications have a good
> chance of loading files into high memory. Other file-system operations
> typically use predefined addresses line $loadaddr. This is why the
> problem became more visible in EFI.
>=20
> It is evident that the bounce-buffer functionality is not EFI specific
> per se.

Right. But it's not the destination address we're talking about but
rather that for "fun" system design reasons we need to have the storage
IP block read from device to one address and then bounce it over to the
final address. Or have I missed understood which kind of bounce buffer
we're needing something here for?

--=20
Tom

--QoykfpATO7cYb6pP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmfmzYMACgkQFHw5/5Y0
tyy4xwv/Wu+SO6u6ygojfL6RYNylSVYwvp4tSMIrPLG5G13681TfgCBSbPajbCRx
jgsrXXRwAI456zB+Fyjyvu+RrzruuOWVufcZeVaqXuijZiGmzwJugsxkuDkQpCOd
IxFTo2BQ2r7rG/dVXw3pDYv9Wyk/re42lemex2u37OfeKdrlphpr0of2cYsBijy5
fzMVMH6Admp83tj/OBaQjsvGsQvKHcM3NAG3Q/rUN4xZ/AlPoI3e4KVInmZX+uFh
TGePLsMZ1AbKvqk717PpAJEQSWpdHddEhJn8G+EZSih3P+WYfAGS59uVXU95y0fR
+gGAR9vliEu4xxD47OeJB+/ePnaCbYuP9oHZ8Ll29RSel0A5c+Q+5NuGhaU15aMx
4lOjdPrmaGuoUyewctIOScxxpKwKj/bwBW6kBN3s7hndNZioZObtn0Ibv9k3Ndci
rGD3rILX59Eo8jFsedXMMzLmgOxo0lZDn7e53x8SREgGvzh35+wtPsrYpAapgyox
pMpIUS/i
=LzfY
-----END PGP SIGNATURE-----

--QoykfpATO7cYb6pP--

--===============5259590234335575608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5259590234335575608==--
