Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AAA134CEC
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 21:13:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E767C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 20:13:02 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD4EFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 20:12:59 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id z3so2003532qvn.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 12:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gmpr5uT5UcOjjqKUyAo3qiyLHQ3Xpy9rHTfAebgHm5s=;
 b=MzSRm+UkGYDT87ZmWaxdulPvDoiUWbQPL9FxuBnbO/BmHgoW1E7Md9YRa1jj9Y+5fy
 RmpXQFXzpUdgH5BXeVfv58KgIW9gqCA+0jECD3FTVeTR/7aorINJo21o9Y9uqlGhfHCg
 8vYzzzHjnDp+ME2V2I472YqMOHSlRkYj7DGFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gmpr5uT5UcOjjqKUyAo3qiyLHQ3Xpy9rHTfAebgHm5s=;
 b=DV5X76ReKSEhls5EVG4AZwFCz0gQFqoVp/dnK0YspgwYMIfD0s1bnP+WC71ZqttWnh
 A6SP3WWxNodAELm1bOsOkDPVF+SD5Mf7r5jfybR07LkXDorRx90E7iHu2O/ai08u2m8h
 GLV7iGe4f5QHc86NotnzEuGUygMCcBL3TrrVzW7MvJf0yVxQQqHAmNV8kdKowviCTh8f
 6EgNoQ9PefbWTsLvSTukO59eM5KSyLyKt9ulAr3BzgDjbRaY12IlCndvhi4g7c3Af4uH
 /BUKhb7KWFDvLStXOHfyZBJntg5vis3qM0iioKcMgyZp7guO5wKcjOYIKHT0bVIpjSWM
 BnxQ==
X-Gm-Message-State: APjAAAXC6FGih/uOkI+GUDNJhFmVzuczK/RA9llGZ3xsftoqqBCEkB7I
 3GK95v0M0C8x7hBLJ59sUjlyMhLYtmZadA==
X-Google-Smtp-Source: APXvYqzVjZSlShTnR40RZr8dJVwxlz/QLLiglwQmSn50+FgvtZYancSkqHcfrb4W/OOkzOzdEmC4sQ==
X-Received: by 2002:a05:6214:180e:: with SMTP id
 o14mr5599780qvw.209.1578514378139; 
 Wed, 08 Jan 2020 12:12:58 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id v7sm2227515qtk.89.2020.01.08.12.12.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 12:12:57 -0800 (PST)
Date: Wed, 8 Jan 2020 15:12:55 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20200108201255.GP31026@bill-the-cat>
References: <20191206140149.7426-1-patrice.chotard@st.com>
 <20191206140149.7426-2-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20191206140149.7426-2-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Chris Packham <judge.packham@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] Makefile: Fix
	CONFIG_SYS_UBOOT_START default value
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
Content-Type: multipart/mixed; boundary="===============8746928467797115540=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8746928467797115540==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kY0AMSsGPnDJoAXR"
Content-Disposition: inline


--kY0AMSsGPnDJoAXR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 03:01:48PM +0100, Patrice Chotard wrote:

> This patches restores boot on boards which rely on
> CONFIG_SYS_UBOOT_START equal to CONFIG_SYS_TEXT_BASE when using SPL
>=20
> Fixes: d3e97b53c1f2 ("spl: fix entry_point equal to load_addr")
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--kY0AMSsGPnDJoAXR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4WN8cACgkQh/n2NdMd
dlKF5g/+NaZj9ZyLDDKFPBF3DzxPIMYD0MANtu3Cre7AkB9YG20tuvZ9GsKcDAH+
AboDErdSUv20ibKNuePq1kYyPVr6jTs99l4wFIAmPKW1gviOlshhEIkrOXWbS9WA
7tHgCNPtgX9bkJSgmH5r6Pus1U5M9Dd3p4DDxTYR3t67cLVgfFKfgV0nIfrAEfok
dvL4DkQ3QV9ttT2f8WipYhc/hUYc4TChzhtCiIFJNHIbNEkQKxcyliGh3MTDFKtV
L8jKvcjTUX5n59t5ZSKmsTpis22gXMRtIncI6oWW8Lk8Tq1K4XEwaMm3yyuUwcAG
vYTXfgHAtVaoCCvq29qp6UvLURv3IHSTB3rV2eQ1/1jv8lHbzRklrP/TOycR/Q1t
y4ibRT2pVweLZfv/6K5bLT1jGWcuOeTEM4w7mTNgAtJ8IkeBm3nIoNHr8dkl+jse
s8lR20+sg79O7B0KdPIUr4QKNQb3zazBCWZgY88FJBz6yS/u7yZ4XB2EhziPHoXo
7zza18Kqh4RgluIde6w+rhqKeLYGNLB4aeGQx3IBfMHcqljw1yuNL0Ss1jCUOD4f
9YgjL/Mega9ICSX5ymb7+BIkuhOZ9+LsKji/ow7OSustLt9RGUTJssz+34w4UUlk
5NlaKSqw0jVChCaK1wXcRFToBqjFsVqHObZMLXe6zugrqTeISqk=
=d43X
-----END PGP SIGNATURE-----

--kY0AMSsGPnDJoAXR--

--===============8746928467797115540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8746928467797115540==--
