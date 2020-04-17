Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D21AE72D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B764C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:52 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1188C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:50 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l60so3201753qtd.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U2INk8LcoJp0iQsYpNlBfSXk8vxzw0r5tO8QYK5nQ/o=;
 b=jI0u7KQ6Ojs8jk6PXGCuzwoSAT/NHEf+vLWk6+TRtar+TPMgdElzVX1vwq/Mx4phyH
 +B4o5k8R7GdhyJeoP/4AvI3ELskCfjOAnmX2diC+R7Uiac7lzCAU3EIVXrYx5TdFhhNN
 AQN8NuL6OIRaq3uWgk98ktlkxody4heq9fhcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U2INk8LcoJp0iQsYpNlBfSXk8vxzw0r5tO8QYK5nQ/o=;
 b=p62Y1OUgreknPa9lYyI39thWpQf1narssP59iATvPsIEctJFHYRK5VIMpAuZ0W4DWq
 5809wzm1OYTSKlLH2uxNLHt5LJZBIbqigxYSGAImRiPUxEl8EB0ZLXom6yiY1QBdyNbp
 NjxSACZ419cAcEQbwOP4lTxJUqngAYpzzD/1fm02qNtLWm3GxOjxf2oWRGERWxwKjsZh
 goOtryY2tsZ2rsaRZuBM1oJ2d4sfItTDT88ttJcXFTBVB75tyAsbFxin2q/mgPiQPJ7f
 vhopF4NSm50mKy3EVeJOJbXH2I5/DqjUhqTaZkYrZwQzznVlDoalS6AoQBnTB1EdhsIj
 Au1A==
X-Gm-Message-State: AGi0PuaUkYCOlkBHDdnBZUpQFj6xPUnZy480hjKWz06tTiunJdgVgDX/
 5Z56NrQqM1+OOy0jry3fWPHMmQ==
X-Google-Smtp-Source: APiQypIGBYqI3nBxEpa71L+md4yMbDt1SigKrb5t3tEPzKqq92V/msFljx39ZHgBtEXWOdBiyO2Kbg==
X-Received: by 2002:ac8:5187:: with SMTP id c7mr5018994qtn.199.1587157609562; 
 Fri, 17 Apr 2020 14:06:49 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id p31sm16085211qtf.11.2020.04.17.14.06.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:48 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210646.GR4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-12-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-12-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 11/21] gpio: add helper
	GPIOD_FLAGS_OUTPUT
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
Content-Type: multipart/mixed; boundary="===============7594644604749288282=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7594644604749288282==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1rguoi8KZGYj2k4L"
Content-Disposition: inline


--1rguoi8KZGYj2k4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:05AM +0100, Patrick Delaunay wrote:

> Add a macro to provide the GPIO output value according
> the dir flags content.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--1rguoi8KZGYj2k4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGmYACgkQFHw5/5Y0
tyyVFAv/R6ZNFv7R1iS7eU4usBAgGELYXdtvMorW76B4tpedOv6WyDYnolJAt4Lw
iEVzVSUiu4PZB7N/E831ycETNfOwdlzc+1DaR2UPLgFJHFZlG4kvHSTL0f/C1UHt
bxx2siW5J7TRzIKnbAem9SYCWFPAeHp7xW/99UUeOazO31ETdotrgSFzJYY9ik3E
2Pfea1fE+kO+nCBKQXqeEyKly6bLGNVOPNhXyZ7bp+luSlNIfDF4Zr/jPW/tkfra
G2ebaRnzTHnLPYnuFwwhWDHM+ghz6TJIE0JLX4ekKI7bj8jyNqQKgSaYh8sCaepY
tIpiN/QpLLjmFzvhiPXd1aHzNNfNeEO8AjSBh7GC2y3LLObqWhIXF5WZuCJbHb1V
qrUzFEfv0X5F7BBrKodaTASLTmlELnOcZKOyTxYT7gUAdltl5wL/4PjOgf9Lzt/o
gHreh19dkYa1lV9lQUOxWkj8+DCpg8M0Ylg3guGzoBnl/vrFVQYWGELzBYvC+V+/
Y1gm0A7u
=tcj8
-----END PGP SIGNATURE-----

--1rguoi8KZGYj2k4L--

--===============7594644604749288282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7594644604749288282==--
