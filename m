Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0533DA960
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jul 2021 18:49:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAFE1C57B6B;
	Thu, 29 Jul 2021 16:49:42 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E1D3C57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 16:49:41 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id t66so6665922qkb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 09:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oteFK1jWhxIJ0vaoESCJ5Np6etQPHT2N9Z2AahyNwn0=;
 b=pxugp+eH2rOsScVdofhl6OxvA37V8P1B9Z1lFZmDmX2huTDHj6bJtGMznZmmUuCNym
 h7AKWHtp6uzh2tKKfXDaDSlDrGDE/wsnwf9Dbuz+T64QwE0i5RCdMTJRZlTrEKX48XcV
 i+lBJAj8TxFXKjCacosli0zYhGSq4DitFO9TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oteFK1jWhxIJ0vaoESCJ5Np6etQPHT2N9Z2AahyNwn0=;
 b=r3ywMa3mpKrKldLkzwwgebYUHMHlDICAx4LAq8kWVi+JVDE/6MUzHscpwvH2gG5jbc
 hfQLU/S3ju9ywmE4jG+xU5MiqyXY0D+LKka+gKR32vFN5gIVTNYL75sgdZHStRvssTvQ
 MjJbNes6hIMWhvRQqnzvKah+nTx1mAE6JwvXaqneG2W7x2KIiXszKrU9tSF2SFEJ+SFq
 T8fZkrRxlzYAEea6Uig4LXqK0udVtjjDl30bU3pfk/vI9i+XKlcQBtMzTzu+kM+kvbph
 cKs/mLx85iHQVSOeJxTRQxTS00IdqInH2HJG3smDn7Vy4xC5ss6eynYqVTwfBTjonwlL
 5WdA==
X-Gm-Message-State: AOAM533k33EcNEd3ljRGPu7XZaGBi5Xv8fBo/+zI3rH17shawl+nNFJV
 KGCZiEmM92Vm7tv5nvIChayx1Q==
X-Google-Smtp-Source: ABdhPJzhWWjibD9qhIAYfYHDm9ItlmoxtRsm/q9ijTu703hPCLizBcNKojJALVYpPTxcae17Turccw==
X-Received: by 2002:a05:620a:1521:: with SMTP id
 n1mr6076180qkk.400.1627577380192; 
 Thu, 29 Jul 2021 09:49:40 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-94ed-10de-2168-2ec4.res6.spectrum.com.
 [2603:6081:7b01:cbda:94ed:10de:2168:2ec4])
 by smtp.gmail.com with ESMTPSA id w71sm2059776qkb.67.2021.07.29.09.49.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Jul 2021 09:49:39 -0700 (PDT)
Date: Thu, 29 Jul 2021 12:49:37 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210729164937.GU9379@bill-the-cat>
References: <20210719092151.1346480-1-patrick.delaunay@foss.st.com>
 <20210719112135.v2.2.I43db93d122a7c13b1505b1f565127780cad729ef@changeid>
MIME-Version: 1.0
In-Reply-To: <20210719112135.v2.2.I43db93d122a7c13b1505b1f565127780cad729ef@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Glass <sjg@chromium.org>, Suneel Garapati <sgarapati@marvell.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Harald Seiler <hws@denx.de>, mark.kettenis@xs4all.nl
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] arm64: Update memcpy_{from,
	to}io() helpers
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
Content-Type: multipart/mixed; boundary="===============8386701433779860867=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8386701433779860867==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e080i1BlFqO+k9+3"
Content-Disposition: inline


--e080i1BlFqO+k9+3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 11:21:51AM +0200, Patrick Delaunay wrote:

> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> At early U-Boot stage, before relocation, MMU is not yet configured
> and disabled. DDR may not be configured with the correct memory
> attributes (can be configured in MT_DEVICE instead of MT_MEMORY).
>=20
> In this case, usage of memcpy_{from, to}io() may leads to synchronous
> abort in AARCH64 in case the normal memory address is not 64Bits aligned.
>=20
> To avoid such situation, forbid usage of normal memory cast to (u64 *) in
> case MMU is not enabled.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: mark.kettenis@xs4all.nl
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--e080i1BlFqO+k9+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmEC3CEACgkQFHw5/5Y0
tywV7AwAuMsT4jLvkmkrpJKbHQFTTKWfmd61+Hxtxz2xTKTZhtxJdrUMjeZt/3Cq
YRUcbgWagOZKh2JeDqPpGAvhY9A6fZFXmDfP1XEm9F7w6Hjvz28rYFASev4Nl3Bd
8Hgg8mk4nGswoIquTPGAbz7Y0ts2fuM7jtxT8u2Du1Yrc5l6zCivhMiARKg0Is+w
8Q/QjZFbQt362xpQTV6FqvCR1TyZYdnTMYENN5OoLZW9nMGrdvV5JTlCd/lU8kSa
EunhcrLdxErvMo8thEvYZYqShUh72xeelLZzzeoH6k3jZr6tUBQLwPU3Wjmwllv/
2n7Bzqb55C038vZUJnvBiAYpA2zWg+EwSysz5UDPI7pVuyed3X3dK4Ajfg0q6MZl
J/VXru+hqxttptHjnHC2N97hB2ct3YerCO4aR8bAkKCzkgalAY/p/GqtpdKskaAJ
UbLpfwsHXCVmujmiVmjjpSQEXrvGbHHtE2PzTZoU0Wi0fkLjTgCxiJsT5iIAZD8i
wzggAKw2
=SA5z
-----END PGP SIGNATURE-----

--e080i1BlFqO+k9+3--

--===============8386701433779860867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8386701433779860867==--
