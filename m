Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFDF316D4C
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Feb 2021 18:51:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D14CDC57B52;
	Wed, 10 Feb 2021 17:51:18 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0519C5718A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 17:51:17 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id u20so2502441qku.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AlqH3hAleXwzwLF0nBC7duD6AApS8zQbiAX2GxppT4Q=;
 b=scLGlIAvTv9rMfRSqgtKGPm/u+o77ZZP9vXJSWZ+a2a2YCyzxOHn/OcJyxJv3tySxF
 bNrrfDFgvnt6A3eiqPB/tOW4cb0M8AbSQ+9XDuUK2hAocy6CVdb9y7jDDhCWHAis90WA
 j/NY/bqHCScfKykwr+BBkD+GaUGYXTPPZoHHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AlqH3hAleXwzwLF0nBC7duD6AApS8zQbiAX2GxppT4Q=;
 b=NOn5ynRUKnEtIlJ7KaOMJai8Fwtr1irs65d1eNKj8JmkLtixoAZxSeySyWjKxI/l9/
 AMaRHm4L06EMHLOx+0llmd7c9+hRP0bZtk+7H3Pgv3zJXul0ab+YXo3QnN6gAwHz04BT
 t48Tp1i2fntz1LNq5GsACJgFMiAwtmHIFFSK1nyDztTUi6g3nPg0vcn59RJ8MJ6BD2fx
 PxTFbXCIL0+QNfc7JwvsLSR9SdnImHYG1TL99SxULOq+nls9IOVGLnnfXiWYC3kzf9k/
 d+QDqCfgX1A0Sdy2j1KYOsJwwW0AtMDC3erBQOG661EXZVm8txL8Mh+Y1lXErCPZX2zC
 ENLg==
X-Gm-Message-State: AOAM533DCcV/hqku7lt9zB2cp1zYE7c4dV6WtPQNXe7D4ZlwfhHDqj3O
 Df8hGTUJPwrjpqm6x3yfbRasGg==
X-Google-Smtp-Source: ABdhPJzNJ9dFo1McjF+JmeAlg593igwqCvVZSWuvWELKrB+d6OwVNBTviejhonZLYIBUIq+kSed5LQ==
X-Received: by 2002:a05:620a:b13:: with SMTP id
 t19mr4654036qkg.300.1612979476128; 
 Wed, 10 Feb 2021 09:51:16 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-9541-aad2-0c20-3f85.res6.spectrum.com.
 [2603:6081:7b07:927a:9541:aad2:c20:3f85])
 by smtp.gmail.com with ESMTPSA id g20sm1720254qtq.35.2021.02.10.09.51.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 09:51:15 -0800 (PST)
Date: Wed, 10 Feb 2021 12:51:13 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20210210175113.GG10169@bill-the-cat>
References: <4966413e-eb02-fcab-f221-05fd83aa0acd@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <4966413e-eb02-fcab-f221-05fd83aa0acd@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.04
 = u-boot-stm32-20210209
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
Content-Type: multipart/mixed; boundary="===============5230775790077805035=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5230775790077805035==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v9zSwozLQR/G44kZ"
Content-Disposition: inline


--v9zSwozLQR/G44kZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 04:02:30PM +0100, Patrick DELAUNAY wrote:

>=20
> Hi Tom,
>=20
> Please pull the STM32 related patches for u-boot/master, v2021.04:
> u-boot-stm32-20210209
>=20
> - Enable the fastboot oem commands in stm32mp15 defconfig
> - Fixes pinctrol for stmfx and stm32
> - Add support of I2C6_K in stm32mp15 clock driver
> - Alignment with Linux kernel device tree v5.11-rc2 for ST boards
>=20
> CI status:
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/6326
>=20
> Thanks,
> Patric
>=20
> git request-pull origin/master
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> u-boot-stm32-20210209
>=20
> The following changes since commit e14d5762de1db84cae6d84d59c1e40f3eb26c4=
c3:
>=20
> =A0 Merge git://git.denx.de/u-boot-marvell (2021-02-08 10:55:51 -0500)
>=20
> are available in the Git repository at:
>=20
> =A0 https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> tags/u-boot-stm32-20210209
>=20
> for you to fetch changes up to f050e3fe4552dc8e24b1f01d26b835eeb762c467:
>=20
> =A0 arm: dts: stm32mp15: alignment with v5.11-rc2 (2021-02-09 10:56:06 +0=
100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--v9zSwozLQR/G44kZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAkHREACgkQFHw5/5Y0
tyx2AAv/XfQ9+PCX0PbTNTKZUyZOxVUvQqZ+nlP/ijkXi2+ScbS6HjfZXJ27GNuY
ioflRIgmzea86vD9OrbK1zxaYh51UfSMm5CPLLyC2qeWveBPF/q0IUnYnmiv/3u7
cQ6tbqcoHxtVMTEBrVPhfXT6XEsPR3aUQ1Njfaj7V5eyAS1tScsxCeXzehv2Jm8L
UHNWb6LYCArAOKnwiNotHEE9mnw9A/pewR8EfoCohy7KEJnsjstEZYwrjWMKjsV3
Kbb6WxUJbjV3DXUepWSJwP/+iIXHFSLYSelmf+VimdBV62YBVVjikyoZe3gizn2n
q4d8z8I58MWo+/ZxoWGkjBVrOMI3eitR8PqqkaPrh1tJDmOfM0y+debNwvbMCjSz
QIQid+MHek7acFf4DfOsZyAgsU9fP5IimP5S0zJH4G2n7HjxaK/vvtvkSnDpM/mX
ps9v7BKqOsoFhscOYR+GbR7qJIQwZdoZjBzQuFJzv5cOClhHdY9Hl268B207xur9
ukZw7XVX
=d14n
-----END PGP SIGNATURE-----

--v9zSwozLQR/G44kZ--

--===============5230775790077805035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5230775790077805035==--
