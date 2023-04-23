Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A967E6EC0FD
	for <lists+uboot-stm32@lfdr.de>; Sun, 23 Apr 2023 18:15:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51CF1C65E60;
	Sun, 23 Apr 2023 16:15:18 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FAA6C035BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Apr 2023 16:15:16 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-b992ed878ebso9074948276.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Apr 2023 09:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1682266515; x=1684858515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g9/Vq1FEj71G3nwxolMXsI68XwO/8+HhsdX5l2bx1WA=;
 b=OuNTmgDQljqZeaGS9YiUCGYWpAxAiRbArF0AJHG8IaFDyhmTX96E7OaBauMaIn+05R
 bFg+0Fe3nrVyZ48qUfAPtQenCNJjtMibuoQwWIKY5hexf9bKjIzRWOsdF6hhth3G3Tvh
 k5j2EwpMdLzt7wDy4R7EGuOHfvwKD/YT091hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682266515; x=1684858515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9/Vq1FEj71G3nwxolMXsI68XwO/8+HhsdX5l2bx1WA=;
 b=SUE09zvECI3Vg0bMDisd1+QPmeBf6HzrYktE7Q92pYKwi7PXtBwXunIO50evUGdQUm
 3u//8b62pCUsweoFN0ew1YvFXQNgRmW+WP5MbB0bFah9v7uMs57ydVwP4iszm5Gkkyww
 wBIi15IJnZ0cVRb3mAX7mUGaZq/xJOOfHjLmxTaiZDqQP6yD+GGjMdoHy6G+L5jr4MfU
 1n6d4out79jBhGFzvIhl6wCPpFzxkz3iPLN5hKjtzmZL94FR4MBwZh+ASVZF+jB7dibP
 aiiIsyblSSEKNc34Csx4t98SO9GzrKGlHwm5LE08Y/N1xcszpmOfc5KCORikR0mKtrpK
 zzcg==
X-Gm-Message-State: AAQBX9dXn3jabrgYFzsJeFI4QJzQPnND9MBzp8E+UvmsL7/La20qHHf+
 8S1ujmgHfSgzWWBY0rhm4EhiqqV0skB8KBlq/pL9+w==
X-Google-Smtp-Source: AKy350ZLCLAgD4PJ2i7WgxUNFMROz8EgPQKhrFjRXfzgJpL+lrkzOvd5POCvFG6CeMJz9Q/3wG+j2Q==
X-Received: by 2002:a25:2494:0:b0:b8f:67d5:474d with SMTP id
 k142-20020a252494000000b00b8f67d5474dmr6793178ybk.23.1682266515409; 
 Sun, 23 Apr 2023 09:15:15 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-06a6-3da9-fff0-2a31.res6.spectrum.com.
 [2603:6081:7b00:6400:6a6:3da9:fff0:2a31])
 by smtp.gmail.com with ESMTPSA id
 x129-20020a254a87000000b00b8f558022bbsm2353496yba.2.2023.04.23.09.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 09:15:14 -0700 (PDT)
Date: Sun, 23 Apr 2023 12:15:13 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20230423161513.GL1134230@bill-the-cat>
References: <e77f91bd-5743-7509-a9ba-0dafe29ed999@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <e77f91bd-5743-7509-a9ba-0dafe29ed999@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [Uboot-stm32]
 =?utf-8?q?=5BPULL=5D_Pull_request_for_u-boot_master?=
 =?utf-8?q?_/_v2023=2E07_=3D_u-boot-stm32=5F20230409=E2=80=8B?=
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
Content-Type: multipart/mixed; boundary="===============4003787472156219829=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4003787472156219829==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BlBlYDIDEx6Isiya"
Content-Disposition: inline


--BlBlYDIDEx6Isiya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 11:35:58AM +0200, Patrice CHOTARD wrote:

> Hi Tom
>=20
> Please pull the STM32 related fixes for u-boot/master, v2023.07: u-boot-s=
tm32-20230419
>=20
> CI status: https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipeline=
s/16033
>=20
> The following changes since commit 5db4972a5bbdbf9e3af48ffc9bc4fec73b7b6a=
79:
>=20
>   Merge tag 'u-boot-nand-20230417' of https://source.denx.de/u-boot/custo=
dians/u-boot-nand-flash (2023-04-17 10:47:33 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20230419
>=20
> for you to fetch changes up to 0d5bd362f61dd3dc54f9a32fd38541b8d5c5d869:
>=20
>   configs: stm32mp15: set CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=3D2s (2023-04-1=
9 10:10:17 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--BlBlYDIDEx6Isiya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmRFWZEACgkQFHw5/5Y0
tyxG0QwAof+j/HNX9zUtmIvjyyneODrm3xK+dqmKGzvMiUgxfhEaoE+mbRXeZTr1
ZxjeERswkbjaTcbzM2dTjtO8PxEskxj2m1VgM377EilpWxRh4KyTsoVBrnUkBQKe
ZPQwujPMrv0H2qUN4ymFntE8o2spliQ3QgNqduI9aDHNeLQYqM5wnnkOWuHiY2+D
vx/MSw7Y+rexui2NEptxNJsKUGIDcQSPgZrA8FSW3HPdWXdpT7dcXkFicOSdbocr
uxh8IE4dhkQ/i+KzvwqW3aEh0k0Gks3qB97GHJSontdxyl4uXV+mu+BUSg32kg4m
qkMb0kbppoiC3LME1rjGRqrlKNsfdFS3hh2vn/uDhiEze52bSOaa7Cj38VeKJmED
RQC9uIfWmor97OS1iEV9HE9ICjsTx3mGH1gwbzHYb1vCNKv0yNY4MOOrdUbfjrxI
o543Erv/99Umz7JFVcv1zqCm5+TXqe7xeomhBTN4Jqlq1J69efSE9nkRKFG6Jmet
l1wH8M7M
=J9+B
-----END PGP SIGNATURE-----

--BlBlYDIDEx6Isiya--

--===============4003787472156219829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4003787472156219829==--
