Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F836354D
	for <lists+uboot-stm32@lfdr.de>; Sun, 18 Apr 2021 14:46:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28E0DC57195;
	Sun, 18 Apr 2021 12:46:17 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17003C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 12:46:16 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id f12so24247693qtf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 05:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yqcYm/kyAqZlPs+yBvptPL7qFf+ctjWujE0wwv3hBJo=;
 b=NeTbhis4AeAdkK9BGNULKwbq5f+fQlXFe66ueBp7hfXJzvG2HWFR7RzucWOpvp6tql
 hqQf8q+9byms0PITWaQFx+Uaqh5uzqOubuEmWJUdtBdepN9P1wTCotAQGAWBJPdMaGvS
 mLkEIdsL8wocGaQpLLibfTi0fA2sEtawLhbqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yqcYm/kyAqZlPs+yBvptPL7qFf+ctjWujE0wwv3hBJo=;
 b=lM4r4lFtRVL1FYLaSo6dateeM9MepufwUZJ8EIxBQ1hBNDAmdkZ/dY3Rww7BZwWtZP
 qF2v/OdDSqlFYd7YY/UgCUMpWe2tJeVEt+XUybDh3GDW4wMkkAuafRhPrQKqP0mMWQcU
 kMhye3kSiMzqk2IgbgbhFZFBxBtpFUnPeDLaUojV5lGxCEDHdrWwN7xC1Anzx+GuKB+V
 oHI3ZgZ6s2pZ/1o7FfWzNU+QctGZUK4ri5xBVg7JX9RXKjvS+QTfHuSPKQSNJ6Oqn15Z
 Nc0NSS/ls8vKim2rSUlbYQGJMPJF/FTKcEITwgYv23QQYyjfytJ3aBNQvu7dtW2fv9po
 TMhw==
X-Gm-Message-State: AOAM533SdzMvuSdEYhf130A8moHJsiTOonePDzF4AYqko99kF47rqiaQ
 ICOg1FHvYq7TfCsTB0iaQo0neQ==
X-Google-Smtp-Source: ABdhPJz+jE2IVhisoBdksHDdL4Xy3BJHO/gD9vuBqIoYEnh1X938RBqon1qlP4Dlce5D1IKw8bj2mQ==
X-Received: by 2002:ac8:4f48:: with SMTP id i8mr7511153qtw.36.1618749975117;
 Sun, 18 Apr 2021 05:46:15 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id 191sm7854455qkj.90.2021.04.18.05.46.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 18 Apr 2021 05:46:14 -0700 (PDT)
Date: Sun, 18 Apr 2021 08:46:12 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210418124612.GA18475@bill-the-cat>
References: <20210224105236.25663-1-patrick.delaunay@foss.st.com>
 <20210224115218.RFC.2.I5c06755fe3aea5afd6b9880630bfc7c8218eaa8b@changeid>
MIME-Version: 1.0
In-Reply-To: <20210224115218.RFC.2.I5c06755fe3aea5afd6b9880630bfc7c8218eaa8b@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 2/2] env: sf: remove the static
	env_flash variable
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
Content-Type: multipart/mixed; boundary="===============2840324164737911297=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2840324164737911297==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 11:52:36AM +0100, Patrick Delaunay wrote:

> As the the SPI flash is probed and is released in each ENV sf function
> the env_flash no more need to be static.
>=20
> This patch move this device handle as local variable of each function and
> simplify the associated code (env_flash is never =3D=3D NULL when
> setup_flash_device is called).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmB8KhQACgkQFHw5/5Y0
tyyXsAv/UUpA+WoCvBFcu1spuH9PEgJUY+1YVfQeM4umLGVJOzZbQ5KLlqzoAEXD
4hO5jv2LHEjnGToE04MSA226ZmNXi0NFFuGeAARKgUSYOge+Tbt0nzZzEGEmO4W6
gGQTSuZVx03s0Iyzi6BpXbxwd89nP/h0UZIAWBC0KT1QgPld3Ufx0dzFfcp/NC3S
ykfoxELDmL0TLLu/DP6UmPZ9URaQbg4DeB0QD1prol1YTc6dsrOAYVQmb/f/Lc8K
KmWtHUFXj9OosNgkRKVdAtbQlvXspalzoqggWPlz/OcaqP5ShVtAjDDJADl+Shgw
4aK9sPgeKVp3rwJPF+qwky9UOwARWhbPuHZikgQ8orBnLqOUUWHG9J2WWViKQgQ0
8hkM1pCnK1d/szFBdXPN61kPVnXMwWhqj06v1mh45dTqcl/XezJFPxI74QRYzUJX
lJSsTHBJHMnXL2UgUekIFKT11Qof/UltIQVv8SnNTIAjHcydBAJueOAldyOKcXV5
B9vJw5zI
=//Yw
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

--===============2840324164737911297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2840324164737911297==--
