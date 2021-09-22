Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E2415098
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 21:43:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4D9AC5A4CD;
	Wed, 22 Sep 2021 19:42:59 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DAF0C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 19:42:59 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 73so13853098qki.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 12:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LMHcbciHPP2vWnWzcp+nu3DwDcd4ahJSCdtztd4T4Do=;
 b=aygm4FejnEi09dRAMb23Ig1FNcHEEx8I7sqXrqGZ7u+WuwPlgRvmTfGv/eiZfAvpk2
 60I0Vhp8jYjJOA+7371oeEyiI/0Z7kTUN5HNqZDe5pkK12lmKOjfo8xz1DRq5ebPZBOM
 ukSOosEuOuP9PgWh3+Iyf/vzAjjPKx51ONH6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LMHcbciHPP2vWnWzcp+nu3DwDcd4ahJSCdtztd4T4Do=;
 b=NxxULie6DSENtK19bQ2M8wasm8WpKC0mLsePoeTOvPa0kt09bD+XROxxM8fw57kMPg
 E7XWvWLUEucHh9xszpTxNY1tRuUbhYMcCntYCGUFSuDmbQ0z9g8WIyw3WnTmss0f8sVW
 ZWapnvCL+QFtwEyaOnBvYthrdQJ3UxFd8/2yLZcdHeGrQvcRBkuPnYVkazB7YaxCJBGv
 TlKr0PwXehdKXZG+iVpdsNLcb/Bog0+kD2JKPX/EvC6uq7cDyh4T1LipqU6xLmNv2gp7
 vlSykKTjA6I5kIyXJCQ72HbRG2RMu1Cn4aNyQzYP+ivvYc2YNwxJrKSOIS7Xfvn8iTGh
 gk3w==
X-Gm-Message-State: AOAM530yq0YQQTaUGyfKrhLqzjvgan7F1q3NmgfwwjR0xuNsbbwqcDz9
 iBEGB69Hd7hI92OqIN5SWD/2nQ==
X-Google-Smtp-Source: ABdhPJz9HoJ16Jz4SY9yR0gPu9W4dX3pSOwAvfrcQnGVKZcdSCZfbmrdLKhYqz4QoQ+Ca1Ue08Rt1A==
X-Received: by 2002:a37:4692:: with SMTP id t140mr1029491qka.429.1632339778412; 
 Wed, 22 Sep 2021 12:42:58 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-a58e-d475-4878-38e2.res6.spectrum.com.
 [2603:6081:7b01:cbda:a58e:d475:4878:38e2])
 by smtp.gmail.com with ESMTPSA id e16sm1920572qtx.7.2021.09.22.12.42.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Sep 2021 12:42:57 -0700 (PDT)
Date: Wed, 22 Sep 2021 15:42:55 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20210922194255.GC31748@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
 <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
MIME-Version: 1.0
In-Reply-To: <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
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
Content-Type: multipart/mixed; boundary="===============0337799370612655827=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0337799370612655827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Content-Disposition: inline


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 09:24:24PM +0200, Marek Vasut wrote:
[snip]
> Based on the comment from Tom, I think we are talking about two different
> things here. I am NOT talking about passing mtdparts to Linux at all, the=
re
> using DT is clear.
>=20
> I am talking about using nor%d in MTDIDS in U-Boot UBI code to look up fr=
om
> which device to attach UBI in U-Boot.

Thanks for clarifying what the use case here is, that does mean we can
stop making incorrect guesses about the problem.

--=20
Tom

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFLhz8ACgkQFHw5/5Y0
tyz8igv/YuGQSKU25RGT6UkxIVnAlF5991Jd5YRfCTQCAS/DrGmRtD4Se0oT6q/L
qNK6/Fz4ZGfePg/s16OQzd/hI+4OIrCXFrIgh4SkaYCuD3Q7Zaot5hKQ2M4O6pZc
C79lDVckAE0phQLXMAsg4GckUezOfC7+kFPisxIeAyrbsmYU+zpCr8J2vdWSt9jN
Ng+jf0Ttr7YpvxSBXmCDhYB/jSYwtxYh6UePx3WDdFu9xvGFQhT7mIHzcd4IgbDv
MCxiHi9OJV1+M7pjrnHJRj8cgn1j3aPFkI0aS4xIvQUcud6/ujLjIjSKKqw9P/2c
087H+HH+wa8wB4+Si0DLQqZ9WSH/ICBPHq76sLNKTc2D/xF7dwGSwe3JT2EYI4/L
AB6mYVbvdSoa09Mn2Ghxq7DRYkxgTYK5g7/uxhKqoOqtWpdyxX8Y3XU6NaPMOttO
s2o2Dzex/mmb8Lp7JLBHpyJoTYxv1/ImiaGq4sBFfIg+tK3a6IL/M7TuW2tkqZ3m
kPkHEg6a
=yVnv
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--

--===============0337799370612655827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0337799370612655827==--
