Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD41AE72F
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6978DC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:03 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 704C4C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:02 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id w29so3240645qtv.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dC+netGXPBZuIJw1GCTdzsPiBqNzeTJThGXaSB77Mvw=;
 b=ndbP46sJfTxETk0Dj0+tQ6gvfkkefmkx8bi9lDEJcDT2mUTQhje2MG8F7/aBRJUsdL
 abeNPEGETUl86MVaHIVaHFVKoLqHkBbdCg+LWaGJVQLPlLB0etXjWjuhyWQI1NI/RIwZ
 /LjKlnc43+ZMhRt738sYQInLiOLhbU8se/XBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dC+netGXPBZuIJw1GCTdzsPiBqNzeTJThGXaSB77Mvw=;
 b=QstqCN66j1lw4nFBhK8Zl8kND1/r+/3x/W1cyxhprYdRrV0mdvi8ut/ci85XqmLyc7
 AMMlj56ZMzAtKQys1tuGRlYNKC35RaNQaXkJ/ql2VZq93G4RV5E59flqtsSJHqQapDbp
 meoQWPIL3MRRNtjiiaBZY6+tQegyURu7R/5HkSYRhuVfSpPRU9t/Hb6JSloOLEKLgDWF
 xzWKwzj+B8uzr2hmwK/UkHOKHO2R4S7J0tjChKeRHHNxhoEYqz3WZXK3g9RxNm0dfbDx
 wH3xfUbRhg9cS1x4CkWUZwM4gW2pEnuoXR31kd2ErV5KeHLLEZJfRnleCwtQYtw3jfNa
 0krw==
X-Gm-Message-State: AGi0PuZDLAXSA1qTRPolA9mJZadKBYWCjjVTKIzdq8aSgHnymmkyAom6
 CDy9JD8ryZuqV749UkYRQ2wpVw==
X-Google-Smtp-Source: APiQypJU5WsBdp9UfJSrf51UG3ANsCoxDLyJgUmRRhLVN6Gvg67iP4xi/w/pptbzwKAPXgeLKmWBRw==
X-Received: by 2002:ac8:a09:: with SMTP id b9mr5146754qti.190.1587157621304;
 Fri, 17 Apr 2020 14:07:01 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id y17sm14273234qky.33.2020.04.17.14.07.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:00 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210658.GT4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-14-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-14-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 13/21] gpio: add support of new GPIO
	direction flag
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
Content-Type: multipart/mixed; boundary="===============0397419983137978844=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0397419983137978844==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V7BlxAaPrdhzdIM1"
Content-Disposition: inline


--V7BlxAaPrdhzdIM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:07AM +0100, Patrick Delaunay wrote:

> This commit manages the new dir flags that can be used in gpio
> specifiers to indicate the pull-up or pull-down resistor
> configuration for output gpio (GPIO_PULL_UP, GPIO_PULL_DOWN)
> or the Open Drain/Open Source configuration for input gpio
> (GPIO_OPEN_DRAIN, GPIO_OPEN_SOURCE).
>=20
> These flags are already supported in Linux kernel in gpio lib.
>=20
> This patch only parse and save the direction flags in GPIO
> descriptor (desc->flags), it prepares the introduction of new ops
> to manage them.
> The GPIO uclass supports new GPIO flags from device-tree
> (GPIO_XXX define in include/dt-bindings/gpio/gpio.h)
> and translate them in the dir flags (GPIOD_XXX):
> - GPIO_PULL_UP     =3D> GPIOD_PULL_UP
> - GPIO_PULL_DOWN   =3D> GPIOD_PULL_DOWN
> - GPIO_OPEN_DRAIN  =3D> GPIOD_OPEN_DRAIN
> - GPIO_OPEN_SOURCE =3D> GPIOD_OPEN_SOURCE
>=20
> This patch also adds protection in the check_dir_flags function for
> new invalid configuration of the dir flags.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--V7BlxAaPrdhzdIM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGnIACgkQFHw5/5Y0
tyymxQwAoIZ7EqnNzHGvaDOtfsXBIxirasaieOVgkDQAfLnEEAT2tjBPVd+qElnX
PJBqmQAQab5FirHHkcs7maxAVD7hevuaFv0XqEQ8DeQe63/V+Iy2EVaR+134vEjv
QKRRREC+eWWolp9C+XR7fD28bjnntEY1kSvRdnh0r7JY+KWSNEFX7pHffAKM/tYi
AK5/8M+GFdV5zKFx6nZJMYfmSik2ndKmAFFCdGGQtLcL2kMk6V4b5Lyupx7F7KcU
52SkSfMwoPgQwvuNiCAlg4eNFI0WAgAT1eJWW8rRisBnxitYndKs4fWdnmS8F4Wh
TmqywBZU31AWzgT2i09DiFXjMMl0b1OEWKHAchf47MNtB2MJp5Sohdk/VFIMdW9o
sGB8/1w69Zhhz772sb+oFL2hsRD2vXqd3S/gZoUlXT2iRJX4SLBKX7GyAWkq9ro/
Zi1NZ6Wbocll7XgFlwW1nBhb5iJ7dD73dE7GElTFuwMCB9YlTvEp1eQ8rFdYiL6F
hdtb8QFF
=VcuZ
-----END PGP SIGNATURE-----

--V7BlxAaPrdhzdIM1--

--===============0397419983137978844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0397419983137978844==--
