Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF8B9B69BB
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2024 17:56:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3620C78030;
	Wed, 30 Oct 2024 16:56:31 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9651C78020
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 16:56:23 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3e6104701ffso62827b6e.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 09:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1730307382; x=1730912182;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DWdlYOLLFrU90FDBOVhOfRVXbxYCQ1u8fAV64QQc7Y0=;
 b=tt3nKtLBebD4kCRUMRzPr57KJVSa1SwpKM03wSAEUcaxMtcu8MKufSoNRNarfi6xZ5
 l83X954RGRFNVunV7SNbT+jIhlwjrI+6PXZtHRKYmVX79NgC1o4Th735su1xQkphDqYn
 bvzlPWwDtvH4MBYp2+1em2oJjiHDZX6d1lkXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730307382; x=1730912182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWdlYOLLFrU90FDBOVhOfRVXbxYCQ1u8fAV64QQc7Y0=;
 b=CYoM8IcCnqPFKRI0QRHleJn//dM+Zgqm91q6ArAKANuU1/dxj3pSH9Ksof4e5PK0sF
 IKXJj+B3M7dufJLkgQkZiCPbaHjxWJ1/5bNX4lL7e8Oi3INziIsO/V2DSArtgKqsU1Y3
 iz5H6CN6sritDYWmBmTKJ7LsGsBLlm7B0xVEW2Ld+QCWzN70PTjesfUs8qJ8GuKMNBy5
 /qjmmnGD5E4oIhzSmlVaqQ6mrNl5Be4Js80Dy7hixkUF7k65ialgRW8suaaQGJkkE/QV
 txTwJRheL6giDt+VUWWAW7Hh9oywxzwnDlMCf4Wn/FRreXckrCw0AHEhOEax55fffkdC
 qcOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXItt0LDY+73arMq7bqEmd9ZyyRWsq8P7AmtEIbp8Z0k8LxhaDsAO7vZazHkqLiALaxxbckF/Fi2wGnMw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXBWYsLvqmvwpjqdfjHRcwvOGESGMghMETdA2lXzCLhqUvcHTm
 wxmEhPwv1z0xGL2KCRVUpcMCT2R6Y2T3XnFjpaiABe/sZkRCYmNA53qROuHxq5M=
X-Google-Smtp-Source: AGHT+IELV6luA1eV5eFsB5ixgJqsrdDRTkAt0rXOcts03kMdvGw0itPVRb9+3wLndsRmdO7TQlh8eQ==
X-Received: by 2002:a05:6808:10d0:b0:3e6:25df:2604 with SMTP id
 5614622812f47-3e6384432c6mr14695001b6e.14.1730307382549; 
 Wed, 30 Oct 2024 09:56:22 -0700 (PDT)
Received: from bill-the-cat ([187.144.104.2]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d179a02663sm53305116d6.83.2024.10.30.09.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 09:56:21 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:56:18 -0600
From: Tom Rini <trini@konsulko.com>
To: Michal Simek <michal.simek@amd.com>
Message-ID: <20241030165618.GP2558755@bill-the-cat>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
 <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
 <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
 <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
MIME-Version: 1.0
In-Reply-To: <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
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
Content-Type: multipart/mixed; boundary="===============2130323652691656685=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2130323652691656685==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbTieb52Sljzv7cO"
Content-Disposition: inline


--tbTieb52Sljzv7cO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 04:20:32PM +0100, Michal Simek wrote:
>=20
>=20
> On 10/30/24 15:49, Tudor Ambarus wrote:
> >=20
> >=20
> > On 10/30/24 2:17 PM, Jagan Teki wrote:
> > > On Wed, Oct 30, 2024 at 4:15=E2=80=AFPM Tudor Ambarus <tudor.ambarus@=
linaro.org> wrote:
> > > >=20
> > > >=20
> > > >=20
> > > > On 10/30/24 10:33 AM, Jagan Teki wrote:
> > > > > Hi Marek,
> > > > >=20
> > > > > On Sun, Oct 27, 2024 at 1:48=E2=80=AFAM Marek Vasut
> > > > > <marek.vasut+renesas@mailbox.org> wrote:
> > > > > >=20
> > > > > > Remove undocumented nor->addr_width =3D=3D 3 test. This was add=
ed in commit
> > > > > > 5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked memories =
support")
> > > > > > without any explanation in the commit message. Remove it.
> > > > > >=20
> > > > > > This also has a bad side-effect which breaks READ operation of =
every SPI NOR
> > > > > > which does not use addr_width =3D=3D 3, e.g. s25fs512s does not=
 work at all. This
> > > > > > is because if addr_width !=3D 3, rem_bank_len is always 0, and =
if rem_bank_len
> > > > > > is 0, then read_len is 0 and if read_len is 0, then the spi_nor=
_read() returns
> > > > > > -EIO.
> > > > > >=20
> > > > > > Basic reproducer is as follows:
> > > > > > "
> > > > > > =3D> sf probe ; sf read 0x50000000 0 0x10000
> > > > > > SF: Detected s25fs512s with page size 256 Bytes, erase size 256=
 KiB, total 64 MiB
> > > > > > device 0 offset 0x0, size 0x10000
> > > > > > SF: 65536 bytes @ 0x0 Read: ERROR -5
> > > > > > "
> > > > > >=20
> > > > > > Fixes: 5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked me=
mories support")
> > > > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > > > > ---
> > > > > > Cc: Andre Przywara <andre.przywara@arm.com>
> > > > > > Cc: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
> > > > > > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > Cc: Michael Walle <mwalle@kernel.org>
> > > > > > Cc: Michal Simek <michal.simek@amd.com>
> > > > > > Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > > > Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > > > > > Cc: Pratyush Yadav <p.yadav@ti.com>
> > > > > > Cc: Quentin Schulz <quentin.schulz@cherry.de>
> > > > > > Cc: Sean Anderson <seanga2@gmail.com>
> > > > > > Cc: Simon Glass <sjg@chromium.org>
> > > > > > Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> > > > > > Cc: Tom Rini <trini@konsulko.com>
> > > > > > Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> > > > > > Cc: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
> > > > > > Cc: u-boot@lists.denx.de
> > > > > > Cc: uboot-stm32@st-md-mailman.stormreply.com
> > > > > > ---
> > > > >=20
> > > > > Is this patch-set next version for 'previous' reverted series?
> > > > >=20
> > > >=20
> > > > my 2c: I think I lean towards reverting the stacked/parallel suppor=
t.
> > > > The only one that benefits of is AMD, while affecting the core code
> > > > quality. It also slows down further contributions and I assume it
> > > > hardens maintainer's job.
> > >=20
> > > I did try this before and it is hard to separate from the core. and at
> > > the same time it is hard to maintain the core too.
> > >=20
> > > >=20
> > > > Even if I (we?) haven't made my mind on how to best implement this,=
 it's
> > > > clear that it shall be above SPI NOR without affecting current devi=
ces.
> > > >=20
> > > > Not sure if it's fine to revert everything, haven't followed u-boot
> > > > lately, your choice to make.
> > >=20
> > > If we find a way (not sure if it's possible) separate like a wrapper
> > > or fix the things without revert - these are two points I can see as
> > > of now.
> > >=20
> >=20
> > Then this set shall help move in this direction. Some involvement from
> > the stacked/parallel authors would be nice here, and some commitment
> > that the current status in just a temporary situation.
>=20
> I hope that by authors you mean SW owners not really HW authors of this w=
iring.
> Jagan is aware that we are using this configuration for quite a long time
> and we are still here and not leaving.
> As you know Amit is trying to find a solution in Linux but nothing has be=
en
> agreed yet. If there is agreement to separate it to own driver or so we w=
ill
> be definitely working with u-boot to get it to the same state.
>=20
> This patchset is using the latest approved DT binding created by Miquel a=
nd
> if new binding is accepted we will be working to align to it.
> Also intention is to bring this functionality to customers and not break
> others. That's why these patches are pulled into rc1 to get better test
> coverage.
>=20
> And to be fair to say version which has been merged was v14 and anybody
> could comment it before and we are definitely here to help to resolve iss=
ues
> on other boards caused by this patchset. But we need to have help from
> others because obviously we don't have other boards and they are likely a=
lso
> not wired in CI.

To be clear, we need to resolve the problems that have shown up now on
all of the hardware that was working in v2024.10. My current inclination
is to merge
https://patchwork.ozlabs.org/project/uboot/list/?series=3D429932&state=3D*
(aka this series in question) ASAP.

--=20
Tom

--tbTieb52Sljzv7cO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmciZS4ACgkQFHw5/5Y0
tywzvQv/Yu+CyGNxdBoI2Vjj9Uk1yyi0DJUA4jxscB+AIRHxkikIGCYpMaJEN7xh
Hxmi4axL0iveZ+FDrLr4eOrxrLWv0xF364jqHwmOFjFiRAUC8/u0xYYtzRy9wRpW
gEei8SDlUjiXZ9HQgYgUObHObeY5gNI7XpuEjYkFeW1lIK/Hz+g5ZRqt/4uE5fNW
Prn+O99ryNmxWwKrTCDLfYyzve7fpxmPO8CCVk6w3pdu4zeXiplRYgwyhnF+UFxa
8zEDPQpGEow+M/9y1DqZlhN5buOW3nQ/3wIT7PAwqwFnVx1/wSKPnDO380Jk5xnp
aCu8NKvK3Ldbh29sY1gklW97TwNXHHdr/Uz8qMRU2CnU/i0V9d0w361GZ27rNBkH
hIWDtOVR1YN81MPmImX/PagaGC0ejCxzk1MxTaiMWbolzl25vAWgiQpKeyItgFZY
8abKL1wkfbyCVhyb4yH0dTBtl7Fr5nTAE1ZjI6P/By0zmURYnR0HmcHGenN+aWN6
AHNnQo8E
=Ube/
-----END PGP SIGNATURE-----

--tbTieb52Sljzv7cO--

--===============2130323652691656685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2130323652691656685==--
