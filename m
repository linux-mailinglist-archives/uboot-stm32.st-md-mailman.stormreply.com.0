Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6636354C
	for <lists+uboot-stm32@lfdr.de>; Sun, 18 Apr 2021 14:46:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C034BC57195;
	Sun, 18 Apr 2021 12:46:00 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4F12C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 12:45:59 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d6so5950755qtx.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 05:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DRkGbMk8j+VDlV7mopLZQ6amHe8CaWDygTWKGSktzP8=;
 b=Bs97uAd2FvRllhKXSKYj/ucexjWZsPMzDdjG+WFIDbYOATfRXTVR3Yi1g85hBodmmJ
 I6oUMm4cxyVj4LXEXWGMoaSqiFDJTfGbkYu9zXYahsGh9qvavPAIjLK8RD5ZHMBCBrEW
 CImqIwNym72vfhB7UqJHPh1BUmQzZRhqfmzRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DRkGbMk8j+VDlV7mopLZQ6amHe8CaWDygTWKGSktzP8=;
 b=gOTHIe1QgXURK+EMysmKQjrKtI2YS6barqOp7VS4G/iUcc8rzLD2nClwawh6HvK8Dq
 hbT3FRrcGMF3GpOxJVrhzHnBXn63Z4TmEDNpUbdEEHpMmJi3sFCdNYn/4AZk1Ikih3Cr
 rg6of1heri5KSZA7Nl/MI0gszHXc8uymkdw8ajFyW+JXCBBpS5V+IUyDA0bWfwOlTFhj
 IrsdSt5eN3DRxektrkOpWvvduutbiidURnb5xK+Ls3ePqFfVie+o9SovQEmQAJagIPTI
 37vKg9uL4GtEVEYo+RFhoof1C2Hk1F1oRWIhBvggYva3yPysM8jexPlpeKuoIv7wK7oe
 4wvQ==
X-Gm-Message-State: AOAM531rgI44DZ+PMFKwsn9XiNWVYwkxBpBwafdo0SJaqKqDGAjEgszG
 JBgV0T+KiHJbiX6O6HCbXh0dGQ==
X-Google-Smtp-Source: ABdhPJwQNfZRC/LkIwDDsj3W/UdLRAmeSIjUsDRXCiXJmQy2lv2iR81rJh/ZzptdsAJaixYU9En3xw==
X-Received: by 2002:ac8:5a4e:: with SMTP id o14mr7244767qta.299.1618749958805; 
 Sun, 18 Apr 2021 05:45:58 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id u11sm7096272qta.91.2021.04.18.05.45.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 18 Apr 2021 05:45:58 -0700 (PDT)
Date: Sun, 18 Apr 2021 08:45:56 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210418124556.GR1310@bill-the-cat>
References: <20210224105236.25663-1-patrick.delaunay@foss.st.com>
 <20210224115218.RFC.1.Ie56b2c6882d80bb19c6e899de5ddeca350a89d61@changeid>
MIME-Version: 1.0
In-Reply-To: <20210224115218.RFC.1.Ie56b2c6882d80bb19c6e899de5ddeca350a89d61@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 1/2] env: sf: add missing
	spi_flash_free
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
Content-Type: multipart/mixed; boundary="===============6529169801576217734=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6529169801576217734==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QtJyaGZVamEBO1n+"
Content-Disposition: inline


--QtJyaGZVamEBO1n+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 11:52:35AM +0100, Patrick Delaunay wrote:

> Free the SPI resources by calling spi_flash_free() in each env sf
> function to avoid issue for other SPI users.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--QtJyaGZVamEBO1n+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmB8KgQACgkQFHw5/5Y0
tyxxtgwAovaaSRqcivsqmFa6TEBy1RM4zhDn9LcNspifLYVeb8+qMfGLWS0PKywf
4kNVcCPuoH6JN46NPKOKxc0h+z0M438jFi32hXavs8Klm1Z48qtrQJPMhWW4/A/k
w68YTXkBnfLgym3THSx/ADKVCflp2r6IvVs36S6rsdUIYR7loac2SCo93GeMmccC
cgwfNz9F8SR0/pwoEwSNd/w0ZRPlK2aS67EyVcIDdB+41y033K6p9ZJRVPsPihks
f5o+Oc5zAeZCmshDImDJYHHHLpPs8hQpd2CstP5Uq5R+q2HV67BZqZnd++B1HsjS
/Oy/yM9h19UGE4b7jvdI3lFqUCqI/iM9GdlRU4vBlkBHUIryiz4p17EZnCD/Y+YH
g4BYgmIMhRAzu0IMVLEjfaFvxdOJPT7irXDF1bN+5/u8e/yweLzKIL6zsSc4welH
AP3Zc8X8+hZy0GmQYLs/5DlMqKoR8Ef/t9pDK9KXeGnm5C5MHmbkcivnphel/+a1
u0H1j1ZG
=lai9
-----END PGP SIGNATURE-----

--QtJyaGZVamEBO1n+--

--===============6529169801576217734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6529169801576217734==--
