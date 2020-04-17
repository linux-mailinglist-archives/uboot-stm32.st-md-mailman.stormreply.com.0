Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D32211AE725
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C674C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:06 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB8A8C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id c16so3255795qtv.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aOxpED+LCkq+25m+cBBB5GYGakxM4o+NzuxPgbMs39A=;
 b=gPmFhnvzcw0BpPs1q9xv9hs9iLtJ1o3zmCtzgFC/jGjKniqxv5dFuAdeKIz3/mDTMI
 h2O0VnMv9tm+OiAJG2apDQq7kE/5wzZ37+yYrPawRuuCTt2Mk9tVzeNfA1pl40TnaGs6
 yk5u7PzkWr/9ZpZxIdnBOrjChUHATibSjEI+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aOxpED+LCkq+25m+cBBB5GYGakxM4o+NzuxPgbMs39A=;
 b=uahYKwDV0E2xNamTQV5BPStWXfppOVZAYVfvpPqwoka/Zh8VyZ/kQMSzkMRnKZ1A43
 xFvOl5aT8CxDiC2gZAGpJ5X6GA265MQ2d3y5I0+0hHG9YR3/bvB+R3An/Mn+3fYO0neQ
 57TgVDeAYN/IN8u8fa53zWKzJmZkrU35frSKUxaHhGj/cG4e8PuuyMUPXk2KrvvD+ULe
 yU89jVlGoUvX1DuQvScOdcfNscYVSc6wuxBD7qJzQLy1GdpQlLRooC93VDtGm1LYtQu4
 oV+KfwBNfMWXpVxgCoBl+24hXgLJAus1F42RarmIVD+A2a8JpzvOD5bRyi29oUZVth5h
 kFTQ==
X-Gm-Message-State: AGi0PubuGDeJu5M5x0XHa4Ufb9pL6pHCnnBJykYOhLwPfBMCpeHH6Yqw
 PBtAcZY5OxzGrwpwZpt/r98xfQ==
X-Google-Smtp-Source: APiQypJvsWvfhQ/DyfEDdVk/c5AoWoCfJtUaZSJA3ZZi4QlLSZR7+7Xin99i4+wvs7ff5ikhixqXrg==
X-Received: by 2002:ac8:46d0:: with SMTP id h16mr5261907qto.242.1587157563529; 
 Fri, 17 Apr 2020 14:06:03 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id l7sm18012827qkb.47.2020.04.17.14.06.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:02 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:00 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210600.GJ4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-4-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-4-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 03/21] dm: pinctrl: migrate
	pinctrl-generic to livetree
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
Content-Type: multipart/mixed; boundary="===============8182914697556553558=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8182914697556553558==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Content-Disposition: inline


--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:34:57AM +0100, Patrick Delaunay wrote:

> Migrate pinctrl-generic to livetree:
> - dev_for_each_property
> - dev_read_prop_by_prop
> - dev_read_string_count
> - dev_read_string_index
> and get rid of DECLARE_GLOBAL_DATA_PTR.
>=20
> This patch solves the parsing issue during sandbox tests for pin
> configuration (OF_LIVE is activated in sandbox_defconfig
> and sub node are not correctly parsed in
> pinctrl_generic_set_state_subnode with fdt lib API).
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGjgACgkQFHw5/5Y0
tywT9Av9F4jzLDoCMgZZoAZuVjuvIBh1GglNX0N/o6T6/T9kUqisy3Oe9ehp363O
QstpZA9/7ttH4Slqy+kM3vTHis8zD4fTOIcn+MglZRBmRyKfEXcSJH6Pi8lzStrc
+aCvTcvJfheUE4Wm/uwaE0Fju0mt/+PTmbMpimPs915nDxsLJHUvf95+QEuEgEHJ
ivtn+k61Tgme0GFHpNqgn23SitFjU4BQVHtItotlP9+TNOrquIVlzClcGNDQfYMJ
PAMPyauH8aXnzMcr9Hh9eLVojXkTPKXHqONn7IzeGV41/CMQr8lxqdj8+CtsQal6
tO/qrWZYd7PD10L8rk9+Om977ArzrlB0Mh3Uvz2pGHwO8VbE6VmBWmv5EYczNHoM
Z6JhZcRr6KR3KonWWPp/0q4aJX4BbwU94AF0Rk5+Vay2Jv8iGvUSdUZ83m4pE7Ks
54wwRhkt9ksYCm0ZcB4lvRgAbzLABCJs67gSMLPWo4LD9XNDKQhVvKoub9TOdxsU
337MyqkY
=KnDq
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--

--===============8182914697556553558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8182914697556553558==--
