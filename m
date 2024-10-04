Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B30E7991232
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Oct 2024 00:14:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6264DC7802B;
	Fri,  4 Oct 2024 22:14:34 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4464C78028
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 22:14:26 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7a9a30a045cso215821385a.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Oct 2024 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1728080066; x=1728684866;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pk01qqzpHdrrlSumtPbYoIT4xVWWg2XQOa+nCXsGR2U=;
 b=PFfgwSOR1OTO2UUR11ME7kDezIdxhAVdu0GLoszyeqGKeof8K8mVGR3zEMTTavbstA
 IONzlKULJ6AtQW0gY8GuGxhSGUDoyELW4OUa+9N8jzQymNpoego+frxMi2vc8ZrueAdX
 bGxzL3odmyfIRAPbO+dlbnZNSySMFavea1ytU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728080066; x=1728684866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pk01qqzpHdrrlSumtPbYoIT4xVWWg2XQOa+nCXsGR2U=;
 b=wBTvqWOBjMMkxjCQVmhAbmKl8nhlQxqp+uwpJuZVv4GGY1lpiVvdJ904/+sGeMiR8v
 LbrniUKx+/4sfqpBN06KqJMjsRjn1sMbxI4A5FHv9HA7wnE+E71k952JXz/YUklEAmVi
 45PtNDtLerwY/5om9Ubcoi46YOMVlVdu0w/qE6OjhfwBbvWVNnTuftJzuJBiaTEvKk3V
 vHcaRzmAQyaVdVdwz6OmvdHBBiawtv+GpM5rqVXbaIL9RsF6MFZ3sbYUaMuqGQvn/a0m
 b6JWTrulBtGu9s3+u8P5Na2SuskDkWQOg1RrqRmpdzMT3UibR8TsyriJqUonSqM1sU0T
 HBQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBAjRQc5x8c04o/UX6HdMBR48L5/Uq3UkPB6/UT6IJCIe6n6z37sMd7b7lQATHCPvDMmt/BSketqWlYA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyhBQIqjApcprm6pF8ucG6FsyJDqGmLRyydKd563vxzP28iQ3SW
 oBEJVZ4fF6/LE3y/KbE1gea+9KZTg3eDAMMvNtQ8yzWdqabwrucVJoNY2a/5DH8=
X-Google-Smtp-Source: AGHT+IEKdfkr/N+Nz5WHDnA9a6D4HEMvYsHqi60vj7qC9uThHd8Vi4Vz5gvIiuxB/BV3uGYVQ3FBaw==
X-Received: by 2002:a05:620a:1a9f:b0:7ac:e879:1a20 with SMTP id
 af79cd13be357-7ae6f432d43mr762602985a.1.1728080065740; 
 Fri, 04 Oct 2024 15:14:25 -0700 (PDT)
Received: from bill-the-cat ([187.144.65.244])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae75762d9csm23443885a.113.2024.10.04.15.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 15:14:24 -0700 (PDT)
Date: Fri, 4 Oct 2024 16:14:21 -0600
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20241004221421.GK4737@bill-the-cat>
References: <20241004215213.252840-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20241004215213.252840-1-marex@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Update MAINTAINERS file globs
 for STM32MP DHSOM
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
Content-Type: multipart/mixed; boundary="===============3770564779974368587=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3770564779974368587==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2PQXcoz4ys/RusKz"
Content-Disposition: inline


--2PQXcoz4ys/RusKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2024 at 11:51:46PM +0200, Marek Vasut wrote:
> Update the MAINTAINERS file glob to cover all of STM32MP DHSOM related fi=
les.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  board/dhelectronics/dh_stm32mp1/MAINTAINERS | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/board/dhelectronics/dh_stm32mp1/MAINTAINERS b/board/dhelectr=
onics/dh_stm32mp1/MAINTAINERS
> index 865588f5b8b..d6c33c15aac 100644
> --- a/board/dhelectronics/dh_stm32mp1/MAINTAINERS
> +++ b/board/dhelectronics/dh_stm32mp1/MAINTAINERS
> @@ -2,8 +2,7 @@ DH_STM32MP1_PDK2 BOARD
>  M:	Marek Vasut <marex@denx.de>
>  L:	u-boot@dh-electronics.com
>  S:	Maintained
> -F:	arch/arm/dts/stm32mp15xx-dhcom*
> +F:	arch/arm/dts/stm32mp*dhco*
>  F:	board/dhelectronics/dh_stm32mp1/
> -F:	configs/stm32mp15_dhcom_basic_defconfig
> -F:	configs/stm32mp15_dhcor_basic_defconfig
> +F:	configs/stm32*_dhco*defconfig
>  F:	include/configs/stm32mp15_dh_dhsom.h

Do you want to try the "N:	some-regex" syntax to see if that makes
it less likely to regress in the future? If not, this is fine.

--=20
Tom

--2PQXcoz4ys/RusKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmcAaLoACgkQFHw5/5Y0
tyzynwv/YVeQb/tjpjqF2SDo0L8s89DDTggdGL2FbSNhpDU1tn/ox3d43MJkv/iG
4EUf74bMZuvzkdRJtoxFK/e6l2yEz4jIavrlnvm3WBZU0KpKmYbZrERr68HPhkvq
IN/EQKrvZPP4jsYBiR2fpe9GesmUtoPX3/Cswx6gPOUj/4a75oNE3MgfD5+vQSh7
KUFxe2wCmCHMNQdrO7cVdJloo4pvVVwcyBbvP+YB0R5wA+0vK+cFd8uv7gp8cct1
lHMEVqaLcwdqt4Sx+Smkytsx3N4JSoiYZ1OLuph6xu9fIuIWRM+5PEdqCy8tMk4U
SKQSpkmqvDc39Y1S897lA/4+XLFhGzl/U9nPMlnBQF/MRW90WLqFn38Y4Xisl2h7
RbdUmJKYEQWCjR3SiwPgMUAMGOuOFEd6Jxs8ty18JL10IyuR4h1zmSnK+79YL/wC
v0Vt5kiQEKtoQJxq6RN6OHdt9vVI8GdtEKw4zGRui8xvO8TkR+iJnIx+2UBNEbo/
j0xXPUex
=PaBZ
-----END PGP SIGNATURE-----

--2PQXcoz4ys/RusKz--

--===============3770564779974368587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3770564779974368587==--
