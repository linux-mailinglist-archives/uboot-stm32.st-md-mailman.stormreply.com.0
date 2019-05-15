Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D41F971
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 May 2019 19:41:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC807C544EB
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 May 2019 17:41:56 +0000 (UTC)
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 170C9C349EC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2019 17:41:55 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id p18so6065828itm.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2019 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MUlsxVLVke/gH59duBiPq/+ypitrTOPVRY7HiTuCOWc=;
 b=F45ub38zdzz4zdVzlhQC0F9tF/JZIw7ppKThN8WCjZAmm3CuzstCikRhNRGeFR+zH9
 kGBE8j+oPXnodmcrXoJokBeqdL3LyovXVBTBiFB6m/DlXnQobqruEcAqw8kExm0LqBCu
 WiYcjw4cRj6WVvRgA/PbcX5c1Q9UX1nbMqh1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MUlsxVLVke/gH59duBiPq/+ypitrTOPVRY7HiTuCOWc=;
 b=qD8zmNX8U8jcPhoSpbP1kfGsm0LN0VFdUcX5e2fVRQ52fqR62fSTg5KqNVlN17Pu/u
 YjDC74912JYemyMYTDO113cpbn2n15mHvB0RRlP5T7qwfelZJRn2rv/AmQxlBl2QfOnP
 C/pXyWgWX7g8KPzUzZklSx9tJYhFrHhpf3DuOKPIxWY75tYyZb7MmXFVKYFayN9N1HmH
 V+uOtmCdxHTqW6BrAl5D8n462wsB1iXBTdFYbE3AWntVgassr0cs2wRGSi9478zE9drG
 c2DUsjdHjn2dwNabPGwMXA93VCVKvmB61rvd4jJuWzTuoUBlxlasQnX54/GoRiGMaFL2
 GjYA==
X-Gm-Message-State: APjAAAVuWTg9iJslObDMhosmfpUj88YapfrCiGn+IQP82rnuh8e+kFer
 QeKHb57G4ckCzwCy8/KedtP9Pg==
X-Google-Smtp-Source: APXvYqxd/l2qCFbjFQNiZJLxCwzcrSc3hIIPZjGZ0VoS0F7tMdO0pE7FPyzn1IuxYHcIY5vrr96ohA==
X-Received: by 2002:a24:2489:: with SMTP id f131mr6393444ita.14.1557942113883; 
 Wed, 15 May 2019 10:41:53 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
 [65.184.141.147])
 by smtp.gmail.com with ESMTPSA id f20sm844473ioh.4.2019.05.15.10.41.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 10:41:52 -0700 (PDT)
Date: Wed, 15 May 2019 13:41:50 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
Message-ID: <20190515174150.GK22232@bill-the-cat>
References: <13952811-6309-c39e-1251-8dcd2c15cdc6@st.com>
MIME-Version: 1.0
In-Reply-To: <13952811-6309-c39e-1251-8dcd2c15cdc6@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32]
 =?utf-8?q?=5BU-Boot=5D=5BPULL=5D_u-boot-stm32_for_v?=
 =?utf-8?b?MjAxOS4wN+KAiyAocm91bmQgMynigIs=?=
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
Content-Type: multipart/mixed; boundary="===============1326096112594233917=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1326096112594233917==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m1G908gh+QHqN0Gd"
Content-Disposition: inline


--m1G908gh+QHqN0Gd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2019 at 02:59:07PM +0000, Patrice CHOTARD wrote:

> Hi Tom
>=20
> Please find the pull request for STM32 round 3
>=20
> The following changes since commit a69120a0d7c8d4044cdaceea9eb03913ba4e49=
c7:
>=20
>   Prepare v2019.07-rc1 (2019-04-29 21:54:04 -0400)
>=20
> are available in the git repository at:
>=20
>   https://github.com/pchotard/u-boot.git tags/u-boot-stm32-mcu-20190514
>=20
> for you to fetch changes up to 1aaac8e60042b1e132f84184cfd9aa0f1a4afdde:
>=20
>   configs: stm32f469-disco: Disable PINCTRL_FULL flag (2019-05-06
> 11:15:16 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--m1G908gh+QHqN0Gd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc3E9eAAoJEIf59jXTHXZSICMP/0VpstNiOCkZCQ/UZ7iXmrcw
/4BCR1I/HfKoQhVnsQBeMEPBMg6WBzmRsSWZAQJ/tM7BGZ7P/KZaYBvXQtWrpx7h
qNv24bnkHHcf3aC3PUr9QfDoJpeLu8s8PQwvCP8cMx2xhlTR6gF/oGfBp4mcC6p2
W0TSEvlIGT+LAdNBz6iREcX7+n8gOFtGWHflqK7MYW3OiW0gc5CY4PsWu5DyPm8t
tlWjuIOLNgar/xZlf2VKAlXPZom5xC2vl0Xnsoz2qwRmRmP23VlNmuGhqbwk3TTK
eyN3EPkAjxDrajJTigKcyOu8e0uujg9AR5kr9I3AglBH5ynsfb4hrzYEzftWHTcp
FsqMdWLsuF28xi0MEQrVt+pncS78Cb/kqwtdP6yJXqP9Tg6HCX2h2o+y/mmY//p7
oqbj5/cWSphpQ+Ogb6vz/WYM/E5CFToUn7TaNRoU2zVhL3BT1YHCGjmBJPtauXd9
ll7ogvpLuAWcq/3KVzuaevhw/Xs97odkXjwRK6qB1QWhuw1hnPqRb6MgwbTprB81
wnQtF/PYjhnUZ1w36BFMO3YVg7P/gS7jOyt8UcNIvfWyl59X7JTyr7LXAB0LjAqk
bal4N102bWvwP7LL+qTNGukio959J++7cxJmaUfhlv/e9z31l4I4tmubBtHtqMYg
n9jFUTsOwbkdbM9X09dd
=LgI/
-----END PGP SIGNATURE-----

--m1G908gh+QHqN0Gd--

--===============1326096112594233917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1326096112594233917==--
