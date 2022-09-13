Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE5E5B7604
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Sep 2022 18:03:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79721C640E7;
	Tue, 13 Sep 2022 16:03:29 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9D2FC0D2BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Sep 2022 16:03:27 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id i3so4011148qkl.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Sep 2022 09:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=uoO7yBaLTsAVEdwHW9bcsT3GZzqCyJBcNmkwn26Isq4=;
 b=ccXTMWz6uJRjhrRkj0duEU0bXzjsOz3zmNntyVRzjxyo9G8AYLEtEh1zyQ1/J+Hjbd
 rj2RlOAoZnMRx2b5J3xQupbTEpxIbqhQmAhVnOr9T9NftgvcM+O8uHrp1JdD7qaq0XIn
 jyi4gOPYiP+mm8sPfZGtYhvNI3zQpNYDHYoCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=uoO7yBaLTsAVEdwHW9bcsT3GZzqCyJBcNmkwn26Isq4=;
 b=N7SE9rnvBGlblWxwGDFj9O1kJIYEViRzc1JvV0WE6lQba/VgmCSEdZ3VjZJUdohpth
 tDu/y/KeiXF6LgNPNHsNvdtm3qi2D2NuK4A4h+SHmKtI27UA5+BVmvxcrEeHdoKaL/24
 sjQI+trvFcSI8T86zs+v5071Y8OsdUH23oy8PUynfDEhomJEs8Jk7jxHJeXzbVDIZLp9
 nHBX/B9MzAK10yzKC4AIRi4JkRJkeSP5T4i7QNwTaZJeBpAeQWgYzIBDvXAdBkvf3JEd
 mqqOj9gVy0iUGrMsd2KNbR3iCnY5la7Sm3ahZ7ZRQfYtBxgKM6J1+hu3PHO9JUVbrH4Y
 /O2A==
X-Gm-Message-State: ACgBeo2x4yPFrGmdovy/9mew2QfKCmmMCe8o48eAMKkwfeFgu7b92GGF
 Et3om7bkNDDAz1ktLrGPT1Mc3A==
X-Google-Smtp-Source: AA6agR5fT4OIX0OCQzC540fu6JXJlLeJxlPWeTXQX9SvfPznd17tnPBKJkQ7TrW08gCBav1L6dCnmA==
X-Received: by 2002:a37:8e06:0:b0:6cd:cca0:5fb2 with SMTP id
 q6-20020a378e06000000b006cdcca05fb2mr14158009qkd.646.1663085006566; 
 Tue, 13 Sep 2022 09:03:26 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-f8ad-dcc3-5c01-45c1.res6.spectrum.com.
 [2603:6081:7b00:6400:f8ad:dcc3:5c01:45c1])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05620a244b00b006cbe3be300esm9489363qkn.12.2022.09.13.09.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 09:03:26 -0700 (PDT)
Date: Tue, 13 Sep 2022 12:03:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20220913160322.GA2036901@bill-the-cat>
References: <20220812013503.1724919-1-sjg@chromium.org>
 <20220812013503.1724919-25-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20220812013503.1724919-25-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 Marek Vasut <marex@denx.de>, Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ricardo Salveti <ricardo@foundries.io>, Ramon Fried <rfried.dev@gmail.com>,
 schspa <schspa@gmail.com>, Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Max Merchel <Max.Merchel@tq-group.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 24/24] blk: Rename if_type to uclass_id
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
Content-Type: multipart/mixed; boundary="===============6868203060439305720=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6868203060439305720==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 07:35:03PM -0600, Simon Glass wrote:

> Use the word 'uclass' instead of 'if_type' to complete the conversion.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
> Changes in v2:
> - Use conv_uclass_id() instead of the confusing uclass_id_to_uclass_id()

So, for this series, 1 through 22 apply cleanly (one easy fixup
required), and 23/24 appears to be applied already. But large chunks of
this patch do not apply to lib/efi_loader/efi_disk.c and it's unclear
what I should do here. Should I just apply 1-22 of this series? Or do
you expect to v3 this? Thanks!

--=20
Tom

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMgqcoACgkQFHw5/5Y0
tyybcwv/We9B98bEkjKzl0RFxfJ6X4M8tsFMyBh/9fsVfWu3TSlcYPHGooclwOu0
MgR+NobZGV6HDxih/xqHDycj0NhCZhwpeUbzakJEUDcxRiqDLD8U9bzMcA9tutoz
VLzuzaFWf03wQdte2zfBtWlT/I7xvdQ6Xbqg8cW3NKZrXnROqaQou7dQq3FY6Dwt
DyLty8BszHNq9192ua8fKAkue9jyofgk8u/FBfLPmQ1PCqoeDJdaf0GHEdpkZZOD
PRwAaMGOAlDDKSqwu/UY15mQhwya7l3fjnR7ekTwwmq/LsdvYYkUcTHDIaYDBwFE
0ODU/AfKFGAg8bpe5+1VcLeEh06PtWGSSg8RaZBAGTP2NNkU7tYxWV0QVg81c9Ja
Yqj5IKV5XHpVOnAammTgLqmVMldGDJJFR5BUcsKxXje7bZEr4tD7oWhcLFGk1P1Q
g+mK37O4AZ+KPMsX4ieUTmbINJJMeN2LGWTVt1eefopHEocC8zorJvphzLtvR8j2
E6CuJXc1
=NxDR
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

--===============6868203060439305720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6868203060439305720==--
