Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5CC19B57B
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 20:29:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3001C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 18:29:10 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73029C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 18:29:09 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id a5so943273qtw.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Apr 2020 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XXmPDJxcmM7Kgocgg1YJjsl/vI0SSWdxbiQa1Y4Y0Ao=;
 b=hdwAar5p8poXfb1DfqJdCo+gTlIVt54/qC0P1npS/q1OHu+dIEQm/MUT45qUHnojBx
 kg3A/h7TE6ZTJt/6X31HVOhKXWItFssFPykRsaXnTKMDrHvco7nqCpWQRTAmZHiCd7YR
 3LN5NeAUWjJCBr+3p4xDM37hJR4I2cMWpfjjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XXmPDJxcmM7Kgocgg1YJjsl/vI0SSWdxbiQa1Y4Y0Ao=;
 b=udWJOC5lTBQiXA+VFqa4ePonuPWGdbKm760bjQZ84M3iQuhts9/gkDAFBo8Gc8h94q
 658Z8AgGw0tfU+6q/6Cb/ldQkX5B5BQAjMDpEiZZ77mpmgdL9JeOaGS0X5IUqQTlRPdE
 X1Lwo3Tz7A+WrF9IUNSuAiA6aeXljO3LgWZj6x7dfhbvFxOfDpVtCcXu2IYgAEC7yb/Z
 0WVLwwC0C52pYrGwfgLYntIH50eyQiI6hyLI59b7beGp0/24AQ00m9LQt5HlB0BlGU5B
 jDWRajjX8QTiF8Lp4ZHHxUnGxOzIjoMRIoLbSTpdS8zquRWWpYi6uKUpZVVYZyDqlYtL
 nqkw==
X-Gm-Message-State: ANhLgQ34XJW9KZZs2XYomWoUFtDfu7bt1H8Fi53U1KpSVnNevWVDkCwc
 6/j6XsrhZwzAC7DKhgc8QouEdg==
X-Google-Smtp-Source: ADFU+vvfZ2rTkQ7/oJbcP+rkfP99kL1Icm7lWFpdVhK6uUa09HdDB0p0pm/q6ua8oxWx4FR/05M3qg==
X-Received: by 2002:ac8:7450:: with SMTP id h16mr11602014qtr.11.1585765748084; 
 Wed, 01 Apr 2020 11:29:08 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4518-0223-1e7c-39c9.inf6.spectrum.com.
 [2606:a000:1401:826f:4518:223:1e7c:39c9])
 by smtp.gmail.com with ESMTPSA id m65sm1959923qke.109.2020.04.01.11.29.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 Apr 2020 11:29:07 -0700 (PDT)
Date: Wed, 1 Apr 2020 14:29:04 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200401182904.GO27133@bill-the-cat>
References: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm/master
	=u-boot-stm32-20200401
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
Content-Type: multipart/mixed; boundary="===============7528495339671297115=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7528495339671297115==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i1d8offQF8oqidLm"
Content-Disposition: inline


--i1d8offQF8oqidLm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2020 at 12:43:44PM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the latest STM32 master bugfix for v2020.04 =3D u-boot-stm32-=
20200401
>=20
> With the following changes:
> - Fix device tree of Avenger96 board from Arrow Electronics and add
>   compatibility with stm32mp15_dhcom_basic_defconfig
>=20
> CI status: Failed for vexpress_ca9x4 test.py
>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2592
>=20
> But local compilation is OK with buildman on stm32 targets.
> I think it is enough as the Marek's patches only update the dh board code=
 and the AV96 device tree.
>=20
> Thanks,
> Patrick
>=20
> The following changes since commit af827140e5965e5bb2bcad1c53ca8419b428ff=
6d:
>=20
>   vexpress_ca9x4: Enable use of correct DTB file and restore EFI loader. =
(2020-03-23 16:11:46 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20200401
>=20
> for you to fetch changes up to 2f3c4b8a0f303edbea9fc112a49e546cf03776b0:
>=20
>   ARM: dts: stm32: Repair PMIC configuration on AV96 (2020-04-01 11:58:00=
 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--i1d8offQF8oqidLm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6E3WkACgkQFHw5/5Y0
tyyZ7gwAtF4K7Ks243pt55/D9fskOmrvI7TTfm70/Eq17Q1twaaCWdhwPoaRY8Zf
wJEhLFzfb/aAuLIm2HBSS+rCveaQ5DwPOdVHLcgcDm6Mak9IpQEnumfpelfgcbQJ
zoY1uDutbM4DMj1CnQvCiQC4npCIuVzI1K1rWnQykiINbR1Dd9UOhyG2M69GIwcd
HNu+HWf/tyg+CXXTQmeadCRuWyvtMDGCaMTkFcrQWW1+hmiAOwatWGDrxcl9BeWe
cPgpDiP4MWWqcsX1amlOjAd2PN4ts7gQ3C/In5bj21RnbpI3pUBcHnhbWVz3bsLS
A8lDdsOgS/CNK+GXCP+WV5k+6bi/cX6kuboT5auwxWDU/tr8CUsGpUM6dShTus0k
Qj1OXGIuaBWQZlZIAfs1qwovmglejTnDhty5/+PwKw25Oi8Xod9Cx9E+AUSMq5fX
wi5etFPQxK/jAfzXKL1q+Vz3008AYIprxbh4LIEZ+//asUt3/2sRbCl2IlHbS0G9
SDnZv3ji
=z7dL
-----END PGP SIGNATURE-----

--i1d8offQF8oqidLm--

--===============7528495339671297115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7528495339671297115==--
