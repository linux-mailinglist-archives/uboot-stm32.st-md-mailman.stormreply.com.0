Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8985EA74E31
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Mar 2025 17:04:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A19AC78F77;
	Fri, 28 Mar 2025 16:04:27 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3097C78F75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 16:04:25 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-72b82c8230aso682333a34.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 09:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1743177864; x=1743782664;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6LXDZMtdiKRz4SF7QnV3RlwlKgcW2Ame88Am7tunhO8=;
 b=r5ko2oONv3EVaAknSGUxhpBZB/0aUfsdrq/7hSNC3FaM7xemBqjxhqSTZQQs3xJRVB
 612uJ3a1rLY0RzIGguDgMsImgocZrlHzh+6jzbEiERKuqCJV06Qwp5sdUUgeDJmY6zVp
 zZJa4/pmowIuZgl475+/wk8e2RLDOYMVP3BKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743177864; x=1743782664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6LXDZMtdiKRz4SF7QnV3RlwlKgcW2Ame88Am7tunhO8=;
 b=r81MHFgzvRlPD98YCdI0YTRReVPem25NCAyvmwVzsYICgUlqfzK4cCjjC1yOEH4XOh
 OvMciMge2kV9G9xhj5N9Ci2JLSId1bV+tgf4ETAIvYqJpBOK1dUa01POjgW1k4L8K5/Z
 9Wki63SlDPz0B0G2SRTUaFUFeeEV1E6V5kgGMbOu0MU4axt9HYYVPGK1wWFCAXzb0PzY
 s24CKtENZs3OmzrOxAQA7Qy84y3gdnOgihGrMKXQ59FDICEjMCueUh3uva0RwpenNqvZ
 +7XnBPlpoV7mjATN2ho5WIxgPfJR7tYb/R8qv8kr+++vwbwRP+rO2frUgxQ/3msPDeox
 ACIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2OWf+DO+QqCqCBLLjL44ZWD0kQdZlR3TtbnYVXVPedlK6P/shMpyY+DJ+g/bmbbtLwMmxGfmyBWRjhg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy42u8yuNWmeUGnFsnMAsryTx3aOTZw5u5ufVU4e4RwCHVdxi8V
 kpu5ha16Vs4qKS8eMbaGYZMfoG1WtDmbWgD3JNARtpL5a5VA5JkRQNyqsVn0xYI=
X-Gm-Gg: ASbGnctHG356zDzTotsL3LbDepuTvKCKEIY5WGiV5hYlsbF3dJEXZkFOpD/lomqrpvq
 L20CdI4yk51EpiR3rAuXw8yKO/jxRBKTcmYQwBCxXrGDpKuBxKK6wpndwLtFdCjzcjz35BKj20Y
 peAzGUfgixuw93PzOQTZLLKElSWNMpt6+Mae0w1u6Pha2LHMzDyR5BhAq3bfxhCwEyIfbaEX2yU
 w4CLw4rkAWV8rU0jB99KtTwDzMKmWXngx8KFlDrwwZsQtp6QAB+t246sJny6ec31H3RgTFLI2WI
 lMm2cz+p6yckxiJR5dVMkoyUJQxBbzLOLImse/CpOKnVZW8jaBWCBZfTMUZMV3xRbtlUTnhXdjS
 bgx8FuA==
X-Google-Smtp-Source: AGHT+IHUWiqo7PrWlVOFaxtjLyL3/oyACnMc5EVJgGGICx5EQDwCWk+z7fZyktmVMpVVMlcWxZBicA==
X-Received: by 2002:a05:6830:438e:b0:727:3f3e:53ba with SMTP id
 46e09a7af769-72c4cae182cmr5103398a34.26.1743177864153; 
 Fri, 28 Mar 2025 09:04:24 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-205-42.totalplay.net.
 [187.190.205.42]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72c58267b91sm409187a34.52.2025.03.28.09.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 09:04:23 -0700 (PDT)
Date: Fri, 28 Mar 2025 10:04:19 -0600
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20250328160419.GX93000@bill-the-cat>
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
 <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
 <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
 <CAC_iWjLS_yNPCMY2RhGZ0390ZysH=N5x5JZ-qOnNjX7nofPS4Q@mail.gmail.com>
 <CAFLszThhK4-+Qh_eQLD0fuJZVodBkwit4rw5mOcGU58m6=5knw@mail.gmail.com>
 <CAC_iWj+2EsRUBT5ThAR7+wwxVkFSzrApCNDbTEEHQ-W658LwCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC_iWj+2EsRUBT5ThAR7+wwxVkFSzrApCNDbTEEHQ-W658LwCw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>,
 Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@arm.com>,
 u-boot@lists.denx.de, Wei Ming Chen <jj251510319013@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Udit Agarwal <udit.agarwal@nxp.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Manish Tomar <Manish.Tomar@nxp.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Wasim Khan <wasim.khan@nxp.com>,
 Mathew McBride <matt@traverse.com.au>,
 Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Tien Fong Chee <tien.fong.chee@altera.com>, e@freeshell.de,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Adriano Cordova <adrianox@gmail.com>, Ashish Kumar <Ashish.Kumar@nxp.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Sumit Garg <sumit.garg@kernel.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@intel.com>,
 Lukas Funke <lukas.funke@weidmueller.com>,
 Robert Marko <robert.marko@sartura.hr>, Michal Simek <michal.simek@amd.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tang Yuantian <andy.tang@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
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
Content-Type: multipart/mixed; boundary="===============8259455744325113805=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8259455744325113805==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hLehrxlBWO9PIkJf"
Content-Disposition: inline


--hLehrxlBWO9PIkJf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 02:26:39PM +0200, Ilias Apalodimas wrote:
> On Fri, 28 Mar 2025 at 13:34, Simon Glass <sjg@chromium.org> wrote:
> >
> > Hi Ilias,
> >
> > On Thu, 27 Mar 2025 at 15:19, Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:
> > >
> > > Hi Simon
> > >
> > > On Thu, 27 Mar 2025 at 15:33, Simon Glass <sjg@chromium.org> wrote:
> > > >
> > > > Hi Ilias,
> > > >
> > > > On Wed, 26 Mar 2025 at 02:37, Ilias Apalodimas
> > > > <ilias.apalodimas@linaro.org> wrote:
> > > > >
> > > > > Hi Heinrich,
> > > > >
> > > > > On Mon, 24 Mar 2025 at 19:50, Heinrich Schuchardt <xypron.glpk@gm=
x.de> wrote:
> > > > > >
> > > > > > On 17.03.25 14:38, Ilias Apalodimas wrote:
> > > > > >
> > > > > > %s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/
> > > > > >
> > > > > > > The EFI subsystem defines its own bounce buffer for devices t=
hat
> > > > > > > can't transfer data > 4GB. U-Boot already has a generic BOUNC=
E_BUFFER
> > > > > > > which can be reused instead of defining another symbol.
> > > > > > > The only limitation for EFI is that we don't know how big the=
 file a user
> > > > > > > chooses to transfer is and as a result we can't depend on all=
ocating the
> > > > > > > memory from the malloc area, which can prove too small.
> > > > > > >
> > > > > > > So allocate an EFI buffer of the correct size and pass it to =
the DM,
> > > > > > > which already supports bounce buffering via bounce_buffer_sta=
rt_extalign()
> > > > > >
> > > > > > Looking at
> > > > > >
> > > > > >      if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {
> > > > > >
> > > > > > in drivers/block/blk-uclass.c the bounce buffer has to be expli=
citly
> > > > > > enabled by the device driver. Only the scsi drivers sets bb =3D=
 true.
> > > > > >
> > > > > > Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce buff=
er flag
> > > > > > to blk_desc")
> > > > > >
> > > > > > Which device-drivers of the boards mentioned below do actually =
need
> > > > > > bounce buffering?
> > > > >
> > > > > Unfortunately, I don't have any of the hardware to test and I hav=
ent
> > > > > worked with that platform much.
> > > > > That 'bb' variable and the fact that EFI needs bigger allocations=
 is
> > > > > why I ended up allocationg properly aligned memory from the EFI
> > > > > subsystem. But as Mark pointed out, the cache flush is a no go for
> > > > > now, so I'll drop this and see if I find time to rework the bounce
> > > > > buffer logic overall
> > > >
> > > > There was quite a bit of discussion about all this in the context of
> > > > my attempt to just add a message to warn the user[1]
> > > >
> > > > We might consider adding an event to reserve memory before relocati=
on,
> > > > along with a way to discover (in board_r) where the memory was
> > > > allocated. That would make the solution more generic.
> > >
> > > I am not sure what you are trying to solve here. The EFI bounce buffer
> > > after the LMB patches can't overwrite memory, nor can it be
> > > overwritten.
> >
> > I am thinking of we can create a single implementation of the
> > bouncebuf logic which also works for EFI.
> >
> > I think the two sane things to do are:
> > - restrict U-Boot to using memory below 4GB for platforms which have
> > the DMA limitation
>=20
> You don't need that. The bounce buf code has a callback you can use to
> define the limitations
>=20
> > - create (in board_f) a special region below 4GB for use with the
> > bouncebuf logic
>=20
> The only problem with EFI is that you don't know how much memory it
> needs and we can't use the existing memalign calls. So if we replace
> that memalign in the bounce buffer code, with an lmb reservation we
> have everything we need.

It's not even an EFI problem is it? You could hit the same problem
reading a file from a filesystem outside of EFI too. These specific
SoCs just aren't heavily exercised is one of the challenges I think and
so it's possible that we have a few things to yet improve in the
bounce buffer code (which was added for other SoCs and done as generic
enough starting point for others).

--=20
Tom

--hLehrxlBWO9PIkJf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmfmyIMACgkQFHw5/5Y0
tyxi3gv+NpXYr5G1oYTyQtVtjOdKjGPn0Qh0zPMeWnHxHEybg5AynX1yDck+yYUH
fGsYcCktmApk5KfzLMUVmRgrQvY0eK58boaHffkdNIAKbPH4wcLLoz5S1GT7q6Sx
qNWZEsFAqexZxl38hAPd20mzghkNoc/w3tfdIectEZo98yvdnC0lxtIOzQ4D9QWa
GBK0br4xSV99htl4N5ISwmgr6B74Bx3HNuU+JlhkR6yqO0Npnx1XrSZSP8WPMo2C
/PX27m+sp+VXQOS1ekyoOeoOvGMTF7F2+IwrGFVd1Cl+zko5Iem8sNJe+x0ajPKH
cHSEDYGZ5Yq0QJHiII2lsLIbqxEzRVVnFFamdI+oEiO2lsSo4cuzuPnheE7vtQJ3
TeCdqJ5/rt2F1rulmHBujtJyRmx9zAco6IfZ39TOJmK8Yk/tx0RBya9f8YRRScZj
0BDyCHfLtNAFQX3k1ifmqQA7Faoxw/FiIRZWbUhbMkPW8/C9n/C10h23vCLhxk6h
bOCiZOoF
=ShgF
-----END PGP SIGNATURE-----

--hLehrxlBWO9PIkJf--

--===============8259455744325113805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8259455744325113805==--
