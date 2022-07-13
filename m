Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A457382D
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jul 2022 16:00:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6195AC640FD;
	Wed, 13 Jul 2022 14:00:47 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EC88C06F81
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 14:00:46 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id v6so8636748qkh.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ykQ33FbEFu7WQhZ8uVUz53JsKWfWNo6UYF5vGMBg3mc=;
 b=sWbGOvuuZN+i8xq1+qnT6/zx6C1Kz8N6BozO/0nFJOzlZtUZ/ZU+BlsSmxB3WKvU8U
 0FnOVNl5UChj7CYR8E5uVUJlc1s5Gq6kCw+0mg5FQZOQ93z12ooqZZ0uqR2Ev+Zl5TdS
 BWwdm7+Dspaz28tKPV4MVDyqIyKGW4URvqzhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ykQ33FbEFu7WQhZ8uVUz53JsKWfWNo6UYF5vGMBg3mc=;
 b=7a0d6BifNs2fOKSIgKVr5ryTTX+Snxwse4yM9UkmLHtGj2KqKZjDl9MSFMGxhKwSYz
 o0B7kKLfAagnNceVLcq7BnlqYtJPg73KEhaQtVTWoqpWZh529sj2ya+KFUnvJBIjfGxB
 1HWdio1vTXxOaxt7Je+DSu251ebbHZyMxnB+eJSEl19wmekrB7/vWrYFdzx168GPVZen
 WV9KI/caXfDAjsg8+z1DY7V6lfyiHuQxeKwfi4lhZB2zsV9xucGqpFKT1WnEbOVFH423
 pwUNOtvr5yeNYUI8ZL5zuCGfrTVZjus4GY/w4Dw9mdcsVvA9PgZmhgxiMkCv1+wQgaTH
 hdsA==
X-Gm-Message-State: AJIora9iqUlJc9mmjAoRLdwurIPiI5guJ0U+6oCY6h8HAlqFfkDy+iiJ
 Tc0xhX9yeEBZUyo83EQA48qrLg==
X-Google-Smtp-Source: AGRyM1ukt7cXrJtuXKZ4HCG72SerPJSInRKn+40NLqVTgZxcuZSjt4bp0KhsR+8MRHL9fXv6S/0KIA==
X-Received: by 2002:a37:492:0:b0:6b5:ba37:bcd5 with SMTP id
 140-20020a370492000000b006b5ba37bcd5mr1594366qke.438.1657720844957; 
 Wed, 13 Jul 2022 07:00:44 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 h67-20020a375346000000b006a6a4b43c01sm11389935qkb.38.2022.07.13.07.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 07:00:44 -0700 (PDT)
Date: Wed, 13 Jul 2022 10:00:42 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20220713140042.GA1146598@bill-the-cat>
References: <511b8ff9-b508-b70e-2b42-a9ec62dbe7b2@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <511b8ff9-b508-b70e-2b42-a9ec62dbe7b2@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Johann Neuhauser <jneuhauser@dh-electronics.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot next / v2022.10 =
 u-boot-stm32-20220712
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
Content-Type: multipart/mixed; boundary="===============3063964357493963391=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3063964357493963391==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/XhCFiTgXIbwc69B"
Content-Disposition: inline


--/XhCFiTgXIbwc69B
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 09:57:48AM +0200, Patrick DELAUNAY wrote:

> I Tom,
>=20
> Please pull the STM32 related fixes for u-boot/next, v2022.10:
> u-boot-stm32-20220712
>=20
> - Alignment with Linux kernel device tree v5.19 for stm32mp15 and stm32mp=
13
> - Add OP-TEE nodes for stm32mp13x, aligned with upstreamed OP-TEE
> - Introduce of_to_plat ops in stm32_sdmmc2 driver
> - Activate more features in stm32mp13 defconfig and support of STM32MP13x
> Rev.Y
> - Drop fastboot and stm32prog trigger gpios on STM32MP15x DHCOM board
>=20
> CI status:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/12721
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/next
> https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> u-boot-stm32-20220712
>=20
>=20
> The following changes since commit 05a4859637567b13219efd6f1707fb236648b1=
b7:
>=20
> =A0 Merge branch '2022-07-08-Kconfig-migrations' into next (2022-07-08
> 18:03:08 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> tags/u-boot-stm32-20220712
>=20
> for you to fetch changes up to 48d9eaf6826a1816c5f9839a564ea6338da609a7:
>=20
> =A0 arm: dts: stm32mp1: Drop fastboot and stm32prog trigger gpios on DHCOM
> (2022-07-12 11:48:15 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--/XhCFiTgXIbwc69B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmLO0AoACgkQFHw5/5Y0
tyyWwAv/Sd7Z7G8yBMV0YPyiCALW8Q8HiygxtlCzDDwdx+i5OKyDqEGzGBE3DtJj
ykvawwM3JJqTPF4jS/Xg85xdIJamErjzoRjiMojeGAEyz38YM7PgjWnrSg1qulXv
R2XFiQN2xPRvNMO6dmR5uSIzH3CoalqfF+IBBlPjVnqqiUfmhcOZLCHBNmnw1BBF
5UtY0itbZUDO2UcvVm4v2wRNIstZG02GJxf1C2yam4yB9dSeEKV4ATMV2nVqhaGi
nWpX9gnWnL8EEIb9HVd0HFfSlEvxXpRdjR1SmsgLwx6YpPfeBlrYOTYl9E4d1X+A
/uNTSRHFlPbWhpKcUsNmqRqZIk194u9AbElBhM2BMYS0Y0Q9SUN+o/Fog7/EnXjA
jZk/jc6KyyVy8DLvsVxSwzncxlXcIdRnTsM0YGZoO7W46rMonJXFw8uG4JSvBotj
lIFqX3f8bA6aQY82yGBg5mu7i/Eu9paDjXrwsIrilvXi8xRdxCH4aBTDDTeN039A
NWFGLiUP
=hGN6
-----END PGP SIGNATURE-----

--/XhCFiTgXIbwc69B--

--===============3063964357493963391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3063964357493963391==--
