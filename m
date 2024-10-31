Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3D9B80A0
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2024 17:54:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17EF7C78035;
	Thu, 31 Oct 2024 16:54:06 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E1E3C6C83A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 16:53:59 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7b157c9ad12so64109185a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 09:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1730393638; x=1730998438;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uuMFLayBMoIpZDEOcK0Ouoi/rqdMY4cTLJ2KNWxzs8A=;
 b=BD3JyXMUMaD7tMC/RVUCmx16gF060w/leQ+yXRDrxjt0kLXLsws2dP+aBI7inlZnqB
 4stNHhJ+Z9OSzCvvPoLD0FO4MJu8cOG8Fl2nouetl909PKVntIg2S4x3b8ijvq1Pmpu/
 aarUmmK0WgGsqATUpoZTC+fZqktBpccLK+qY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730393638; x=1730998438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uuMFLayBMoIpZDEOcK0Ouoi/rqdMY4cTLJ2KNWxzs8A=;
 b=AuaKhThbws+ZiEUyEzahwiPl8KTPSzOdHU66A8UZYtFQNzNEQsqKu9BQC+D0bl61I/
 THYoX0fvBY1edqkUwD7aIYrIEHSaf/wdjNaQnHmbWJcDA1wgndiexXfwzzdtKJ6Zb073
 ZNT/UAKTmlgm9sVwLDry6ayDQoEHzMrrsJkm0ZRSHY8PFisH+3Pe/sZfFwbB8v5hhap1
 ixXUVhmG6vsxaG91bX8w4YypyHTMLYKM0K5KTlEU7xwEVqg7r+JxmX2L9P1AX+YuWTPV
 xRxAScJNdDPBKv4kLIup1wM1NIOkxWnp5CLZR1/Cu77IO/lKly5XUbb/8at2Mir0VIVQ
 t+nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnWjA7nC2RZ09Wo2VCV6EqyGYv9fmiYCNlqgEcYBXoOSahPJuJglPtI/iyXq1EB4ykrpp+MIqLg9pivw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwRjgkkLv7nj08CceVyO5F38LgcDRXpt6p1xnvhspPNWaOa4KHB
 jz85FfZ0YAuVSz6jnrpe/IzC5M2W/Yvx2/DSeiuOy5m4v/sc96V+QfGVSLICD8M=
X-Google-Smtp-Source: AGHT+IHL1nkBq6X7Z4hOlzfomBOpmtfLZeqL8BNxx/lFisZojBus/CoAqCNxVaD2Og8ok4MOg3f3Kw==
X-Received: by 2002:a05:620a:4613:b0:7b1:1cc2:8238 with SMTP id
 af79cd13be357-7b193f045admr3203486585a.39.1730393637979; 
 Thu, 31 Oct 2024 09:53:57 -0700 (PDT)
Received: from bill-the-cat ([187.144.104.2]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b2f39fb99csm85658485a.36.2024.10.31.09.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 09:53:57 -0700 (PDT)
Date: Thu, 31 Oct 2024 10:53:53 -0600
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Message-ID: <20241031165353.GS2558755@bill-the-cat>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
 <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
 <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
 <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
 <20241030165618.GP2558755@bill-the-cat>
 <37c64d4a-1d5b-4f5e-bf2d-6e2a8b6b7669@linaro.org>
 <997b584a-8065-48dd-9bbf-d56dbcb18626@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <997b584a-8065-48dd-9bbf-d56dbcb18626@mailbox.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Michael Walle <mwalle@kernel.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
 nor->addr_width == 3 test
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
Content-Type: multipart/mixed; boundary="===============4690180912938950255=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4690180912938950255==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jteHIgrYFMJyfPQ1"
Content-Disposition: inline


--jteHIgrYFMJyfPQ1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 02:39:14PM +0100, Marek Vasut wrote:
> On 10/31/24 8:10 AM, Tudor Ambarus wrote:
> >=20
> >=20
> > On 10/30/24 4:56 PM, Tom Rini wrote:
> > > On Wed, Oct 30, 2024 at 04:20:32PM +0100, Michal Simek wrote:
> > > >=20
> > > >=20
> > > > On 10/30/24 15:49, Tudor Ambarus wrote:
> > > > >=20
> > > > >=20
> > > > > On 10/30/24 2:17 PM, Jagan Teki wrote:
> > > > > > On Wed, Oct 30, 2024 at 4:15=E2=80=AFPM Tudor Ambarus <tudor.am=
barus@linaro.org> wrote:
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > On 10/30/24 10:33 AM, Jagan Teki wrote:
> > > > > > > > Hi Marek,
> > > > > > > >=20
> > > > > > > > On Sun, Oct 27, 2024 at 1:48=E2=80=AFAM Marek Vasut
> > > > > > > > <marek.vasut+renesas@mailbox.org> wrote:
> > > > > > > > >=20
> > > > > > > > > Remove undocumented nor->addr_width =3D=3D 3 test. This w=
as added in commit
> > > > > > > > > 5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked mem=
ories support")
> > > > > > > > > without any explanation in the commit message. Remove it.
> > > > > > > > >=20
> > > > > > > > > This also has a bad side-effect which breaks READ operati=
on of every SPI NOR
> > > > > > > > > which does not use addr_width =3D=3D 3, e.g. s25fs512s do=
es not work at all. This
> > > > > > > > > is because if addr_width !=3D 3, rem_bank_len is always 0=
, and if rem_bank_len
> > > > > > > > > is 0, then read_len is 0 and if read_len is 0, then the s=
pi_nor_read() returns
> > > > > > > > > -EIO.
> > > > > > > > >=20
> > > > > > > > > Basic reproducer is as follows:
> > > > > > > > > "
> > > > > > > > > =3D> sf probe ; sf read 0x50000000 0 0x10000
> > > > > > > > > SF: Detected s25fs512s with page size 256 Bytes, erase si=
ze 256 KiB, total 64 MiB
> > > > > > > > > device 0 offset 0x0, size 0x10000
> > > > > > > > > SF: 65536 bytes @ 0x0 Read: ERROR -5
> > > > > > > > > "
> > > > > > > > >=20
> > > > > > > > > Fixes: 5d40b3d384dc ("mtd: spi-nor: Add parallel and stac=
ked memories support")
> > > > > > > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.o=
rg>
> > > > > > > > > ---
> > > > > > > > > Cc: Andre Przywara <andre.przywara@arm.com>
> > > > > > > > > Cc: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
> > > > > > > > > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > > > > Cc: Michael Walle <mwalle@kernel.org>
> > > > > > > > > Cc: Michal Simek <michal.simek@amd.com>
> > > > > > > > > Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > > > > > > Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > > > > > > > > Cc: Pratyush Yadav <p.yadav@ti.com>
> > > > > > > > > Cc: Quentin Schulz <quentin.schulz@cherry.de>
> > > > > > > > > Cc: Sean Anderson <seanga2@gmail.com>
> > > > > > > > > Cc: Simon Glass <sjg@chromium.org>
> > > > > > > > > Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> > > > > > > > > Cc: Tom Rini <trini@konsulko.com>
> > > > > > > > > Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> > > > > > > > > Cc: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
> > > > > > > > > Cc: u-boot@lists.denx.de
> > > > > > > > > Cc: uboot-stm32@st-md-mailman.stormreply.com
> > > > > > > > > ---
> > > > > > > >=20
> > > > > > > > Is this patch-set next version for 'previous' reverted seri=
es?
> > > > > > > >=20
> > > > > > >=20
> > > > > > > my 2c: I think I lean towards reverting the stacked/parallel =
support.
> > > > > > > The only one that benefits of is AMD, while affecting the cor=
e code
> > > > > > > quality. It also slows down further contributions and I assum=
e it
> > > > > > > hardens maintainer's job.
> > > > > >=20
> > > > > > I did try this before and it is hard to separate from the core.=
 and at
> > > > > > the same time it is hard to maintain the core too.
> > > > > >=20
> > > > > > >=20
> > > > > > > Even if I (we?) haven't made my mind on how to best implement=
 this, it's
> > > > > > > clear that it shall be above SPI NOR without affecting curren=
t devices.
> > > > > > >=20
> > > > > > > Not sure if it's fine to revert everything, haven't followed =
u-boot
> > > > > > > lately, your choice to make.
> > > > > >=20
> > > > > > If we find a way (not sure if it's possible) separate like a wr=
apper
> > > > > > or fix the things without revert - these are two points I can s=
ee as
> > > > > > of now.
> > > > > >=20
> > > > >=20
> > > > > Then this set shall help move in this direction. Some involvement=
 from
> > > > > the stacked/parallel authors would be nice here, and some commitm=
ent
> > > > > that the current status in just a temporary situation.
> > > >=20
> > > > I hope that by authors you mean SW owners not really HW authors of =
this wiring.
> > > > Jagan is aware that we are using this configuration for quite a lon=
g time
> > > > and we are still here and not leaving.
> > > > As you know Amit is trying to find a solution in Linux but nothing =
has been
> > > > agreed yet. If there is agreement to separate it to own driver or s=
o we will
> > > > be definitely working with u-boot to get it to the same state.
> > > >=20
> > > > This patchset is using the latest approved DT binding created by Mi=
quel and
> > > > if new binding is accepted we will be working to align to it.
> > > > Also intention is to bring this functionality to customers and not =
break
> > > > others. That's why these patches are pulled into rc1 to get better =
test
> > > > coverage.
> > > >=20
> > > > And to be fair to say version which has been merged was v14 and any=
body
> > > > could comment it before and we are definitely here to help to resol=
ve issues
> > > > on other boards caused by this patchset. But we need to have help f=
rom
> > > > others because obviously we don't have other boards and they are li=
kely also
> > > > not wired in CI.
> > >=20
> > > To be clear, we need to resolve the problems that have shown up now on
> > > all of the hardware that was working in v2024.10. My current inclinat=
ion
> > > is to merge
> > > https://patchwork.ozlabs.org/project/uboot/list/?series=3D429932&stat=
e=3D*
> > > (aka this series in question) ASAP.
> > >=20
> >=20
> > We can surely live with this temporary situation. Now that we're assured
> > to have AMD's help in moving forward, it feels less like a transfer of
> > responsibility on the poorly designed stacked/parallel software support.
> > Fine by me to choose the smaller fixes/improvements over the full rever=
t.
> Considering how many unexplained subtle broken changes even the first com=
mit
> of the stacked/parallel series included, I would be banking toward a full
> revert. The hints on which changes were unexplained are in this series.

I'm going to start with this series. If there's still unaddressable
problems, now that we have more eyes on everything, it's not overly hard
to revert this series merge and then the initial series merge.

--=20
Tom

--jteHIgrYFMJyfPQ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmcjthYACgkQFHw5/5Y0
tyzwGwv8Ca5lYFGGkeMHjZGCH3wAGUwDM2rEaJy/EaJd8OjswvtgJO9iCzCLslN+
MCXqeEoyQBtut3uXdaWqLs6dQGlp9Vrn/jrCeVYpBjo2DvQym7EK1HbPiFkCB21E
fre/Kok1q2rbggRtysgrqIfly1TDjpgAMOS17WxC+yiQurjP6pb3sAgDay1g4epZ
iC/WY0myO4CrEVVk+uqz64Orwbow1+POozz6gkRmjXU1QHEVicQ3d8WUY4sABXJZ
4Pc9CasmP64fWMRpsbUMyQBPF2+wUZOEHCb1+/4Q/FoiaFHuWFpQ8gUfx8F+NENh
bZCCPtH18an/XCYWNKjgosbRWk9B+LLeLZliRcU1CuOC2DMhQFwGG4s2T9QE5yXO
G7uiBRjr+UAn8QFthVv/Ub8Dir9v4yjm22tCEdIhEjdamKDx7SU//Xqa15tnVas4
wKiAiFXArk3PCpG5Qk/FPPhZiQ7ZObXCx0YX8PpQTaKvQC51QJEBlFM6w6Sc3rbZ
0J/JdkjN
=MHCh
-----END PGP SIGNATURE-----

--jteHIgrYFMJyfPQ1--

--===============4690180912938950255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4690180912938950255==--
