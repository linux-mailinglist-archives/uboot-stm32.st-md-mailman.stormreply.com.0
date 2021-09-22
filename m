Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 058004150E6
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 22:01:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 553A6C5A4CD;
	Wed, 22 Sep 2021 20:00:59 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C635C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 20:00:57 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id d207so14318614qkg.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 13:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mnAd3ZDZC150wdruYpspobJ3NpSoDU0CCIKOVKdZcNo=;
 b=dk1Qj1uw9CKqPbApC/utYNwzMYSwCI1vCnSjJkD/cDM1CBZnreNHtj3yqDxXXE3FD9
 jIayqIj8oIBcZjOWBkTfb36HwgumV1KV71ahrDo9aSGKCpJTbvlJtsyHpCjYItSxhqP8
 LYlyVGdgZYcVkm5it3ZYukwdQdk/gCcKiD3lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mnAd3ZDZC150wdruYpspobJ3NpSoDU0CCIKOVKdZcNo=;
 b=bTLmxbo580zdOYiJfOgmT3LZh3wyYKiF2BPxv94Jf+6NBOnHl+fTYLzpnJTYDSwUGq
 qyu9R4kpR3P3DtQzhTDPpnmVCgWY67z4/337EqugQ7Vw5l9pJwc2XYnSwnP62T95mNsm
 G8c3dcxuKzBUthk7CuQo/4xmjJsL9xCpz/9aOijMyCfgMMu5hEvRKeEC/x07Y0/67elh
 3gIBHtXAF4Z18l+hg2ErtBEnFv8iupJIggTv9uke/wUx7AlaOqTN3xLj2DWes9oIPbP5
 qQ8Z006nRLaTR/yDsS/Eo1A7F2qpFFBGiH7xPmgw5kI/G49k6IczCMDTKPV52DcaFRf/
 0rsQ==
X-Gm-Message-State: AOAM533xLy/5XnTijvPtwKsNutmXkF+njYCFVrAtbxd2Qaupwr8Ifwlq
 04hTiU3Kxm+sMaM6ZSHv7xBDNQ==
X-Google-Smtp-Source: ABdhPJx/30I+P+norMKjA4GjGTswuE1AmopvlwM/bZM6aVU/dQdxjA+mzUY+Sh9ijjSNw8v14kH2iQ==
X-Received: by 2002:a37:270f:: with SMTP id n15mr1124415qkn.203.1632340856559; 
 Wed, 22 Sep 2021 13:00:56 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-a58e-d475-4878-38e2.res6.spectrum.com.
 [2603:6081:7b01:cbda:a58e:d475:4878:38e2])
 by smtp.gmail.com with ESMTPSA id s7sm2176692qtc.33.2021.09.22.13.00.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Sep 2021 13:00:55 -0700 (PDT)
Date: Wed, 22 Sep 2021 16:00:53 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20210922200053.GE31748@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
 <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
 <20210922194615.GD31748@bill-the-cat>
 <59ce8fa7-64f2-07c9-ee2b-4b59335b3907@denx.de>
MIME-Version: 1.0
In-Reply-To: <59ce8fa7-64f2-07c9-ee2b-4b59335b3907@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
Content-Type: multipart/mixed; boundary="===============1338729631220946849=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1338729631220946849==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Content-Disposition: inline


--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 09:56:26PM +0200, Marek Vasut wrote:
> On 9/22/21 9:46 PM, Tom Rini wrote:
> > On Wed, Sep 22, 2021 at 09:24:24PM +0200, Marek Vasut wrote:
> >=20
> > > I am talking about using nor%d in MTDIDS in U-Boot UBI code to look u=
p from
> > > which device to attach UBI in U-Boot.
> >=20
> > OK, so are we not able to pass in the correct name now?  Or just worried
> > about old environment and new U-Boot?
>=20
> Say you have the following in board config:
>=20
> CONFIG_MTDIDS_DEFAULT=3D"nor0=3Dff705000.spi.0"
> CONFIG_MTDPARTS_DEFAULT=3D"mtdparts=3Dff705000.spi.0:-(fs);"
>=20
> Then run "=3D> ubi part fs", which will fail to find nor0, because now th=
at
> nor0 is called something else. That is what this series tries to fix.

Yes, and what is nor0 now, and what happens if you use it?

--=20
Tom

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFLi3EACgkQFHw5/5Y0
tyytiAwAjyKP19O4hf8ZE00Fk99eMzwqB5fgn+Ut8z80gZxo84HkMlLqjjhl9mU3
mYY17ZutEZTCbn5SJYWqAItjWlG8w69s+7CCmZ+6vRaFy/P11JU9RbUeySFc5jOW
S4taRSlFnpUEwwsk7PpP1I7hCqcFKzbMczdg/j85mejHn24tFd8o4pmG3FF3NAvO
8ANq9oSXIdOWlKg/V8qM/ln/+vsSJJG7+/nOAvHJLW9/tSDFICDTbM/hQM8wcLLJ
iiaXF2r1im6KYGn40WkylEznnRghJ66DV0fqQta74c2TW4Wy9vCFL/J2Gl1pv4lv
1s0RX3Ge/OX2cfBvtx7C8qfrOdA2QfsG1ExO/roMV06MDd3GTx2qHCPvIHi4U3iW
hVGR2PguA7PnPEkOIupAQ4iMAaIfZam8A+h6tCV0zQ/uxKkOzI9A7i84Q05uEsNZ
mNMnvnssbixW8U4oIm8oJ8dkpDc5sK7X7F7Le5aTfjT8++fCzdg6KHBJ/OGDA943
i2si/YIW
=9/xi
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--

--===============1338729631220946849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1338729631220946849==--
