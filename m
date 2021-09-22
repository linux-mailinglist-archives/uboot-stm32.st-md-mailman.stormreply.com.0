Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11771414AAE
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 15:39:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2487C5A4CD;
	Wed, 22 Sep 2021 13:39:30 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FA1FC5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 13:39:27 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id w17so2627645qta.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PTwtSdwxd/jvIHeTulvzkuBOugjuC/4bdjjtXA8SGrA=;
 b=lVs9qOTS27TL5UVggZ9Z6Li6KrFW6AdkK+Y6JZTtGkvFdooimU0iPQZKOfzrAMX3F3
 3QzcuLhDr5qrxXeuM2rD1LcJIppAYVJT7KBfggOgoOn4ESALFIY1Bs7v9ZUHQz0A825j
 m7Vt8weW9P9eQP+d51kuoLNeAyVTHmYqHk6hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PTwtSdwxd/jvIHeTulvzkuBOugjuC/4bdjjtXA8SGrA=;
 b=7I6eQlx0floSUiCUcC+XfZjcnV7J5rXFTXPvsAf2CkeSBKgIDDupGRj1+ShwFi2Fdf
 u3b+7EHHsB8P2APBuJ2NLYU60NLNCvEZunIQ1YRH5sbrrhPnQb1BmMkl4FaY8EjYlYff
 Rk91Z/pVX8cfjo3Iia0xAjX1gdlJJWQ7OwDhSRE8U7sC/bFO5kNhuxv0Xo/L46IBJ4VQ
 L6pXd5C9wxZJ7GKbC+ZnLNnsGTlS5VErQAA/O4DcSbG87uaeaGqrFnpUMD6KIY69Psgm
 8QHrgJHBDbzFUWGp8VyJfMFJ/fmW8ih84qXlgziwIgBnEKKMgMTZFu3A+9PKnPqLO392
 t7MA==
X-Gm-Message-State: AOAM531y9AOSCFYZtoa1i1UQHTJfYeRIqVH2rRKf3IBDHD0L17X1pelH
 sKAsdQtlsJTWzMq/a8qdpVsz7Q==
X-Google-Smtp-Source: ABdhPJwhIi4zlbOTmX0XU23OA46kzHqdGwB6LRTHYr/2aApLtrQURSxBRY1yI9lN4Tsj/xziiY6nWA==
X-Received: by 2002:ac8:7c8d:: with SMTP id y13mr14353295qtv.27.1632317966395; 
 Wed, 22 Sep 2021 06:39:26 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-01ae-c37f-f577-ef41.res6.spectrum.com.
 [2603:6081:7b01:cbda:1ae:c37f:f577:ef41])
 by smtp.gmail.com with ESMTPSA id x6sm1804285qkh.45.2021.09.22.06.39.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Sep 2021 06:39:25 -0700 (PDT)
Date: Wed, 22 Sep 2021 09:39:23 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210922133923.GJ8579@bill-the-cat>
References: <20210922110223.1.I82d7f080bc204e75e2f305a8056363038d3d9c0d@changeid>
MIME-Version: 1.0
In-Reply-To: <20210922110223.1.I82d7f080bc204e75e2f305a8056363038d3d9c0d@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] mtd: remove SPEAr flash driver st_smi
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
Content-Type: multipart/mixed; boundary="===============8182164663003213887=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8182164663003213887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0PQOkvCAw33/u/bm"
Content-Disposition: inline


--0PQOkvCAw33/u/bm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 11:02:26AM +0200, Patrick Delaunay wrote:

> Remove the driver st_smic.c used in SPEAr products and the associated
> config CONFIG_ST_SMI; this driver is no more used in U-Boot after the
> commit 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr
> support").
>=20
> Fixes: 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr s=
upport")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--0PQOkvCAw33/u/bm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFLMgEACgkQFHw5/5Y0
tyyxAAv/Y8RdhtUiKImkS/Z25lMEOq+K5JirEs0xEDAIZOiUk/P24WC5dOH2NU06
+kz4NkKgfpqg1rP2ThmRs23y3pxNXywXFnz11Wv36kDGplrWeF3VUoBRb2IVyER8
223ZarC5mU7jNeRX2rrWzpSZCvU1svIo8vSmtTDpifnePqSfgZDMIZvUONU15XLX
v4r9D+rCtFPXLtx3UV+/vyw9EkzWEQeMpMj5/crADkY2SPjnsJMUr355//6l34q2
/0NQC97NrN3t8pAHdzia5fxb8GD5A0J/53wJS5dy74I0GIDn9CtCW0Bg9/1fRcEn
+Jt4ojdH0NptSqHzguLprSVRGFPztHmka1skSXsRtq+kRUF2Av+WwRNMMhiJzS+V
dgmbrZjYqapy1erFxKPEx1Vp00vQQpl1ZbEmXQcFBN72QJyyWJ8Ws3N1KrS/g5os
qlOAH9scmlkbRquj9bI5GifLUOjAES6eqyJbcW0PPwwnpIFMDkfn6QybT+Sk46Tu
LDTBKrYH
=4wSC
-----END PGP SIGNATURE-----

--0PQOkvCAw33/u/bm--

--===============8182164663003213887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8182164663003213887==--
