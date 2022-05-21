Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BEE52F77D
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 May 2022 04:07:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ACA5C03FDE;
	Sat, 21 May 2022 02:07:39 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 133B4C03FD1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 02:07:37 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id c1so9121256qkf.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 19:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YyUqXpBeU3UVp6dbBllYn5LstT3AE2Nxixk+V3b3srM=;
 b=tPZdkdqCrK8/guFamtI32TlEROb+4NeTMED0mNEvp0lHc8vnxnQF0GnMk2sy9lbIS4
 kjeEdKJ4YQfrlv5JYqdere5Np2LwdPUUa+v1m3YmQDiI4I0AQhAyqYeeOEyol5UEw6Ub
 EJVdTUiVap56IX8YjFjFR+7Do76ZSZbO0lK3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YyUqXpBeU3UVp6dbBllYn5LstT3AE2Nxixk+V3b3srM=;
 b=mtwNy1qar++BVcDLrCul6jBZFGswX/jUTf32jjrWbwPafchqgSZwi2loDCSKV1jy+t
 3SXjLcoD/M0nxtbtC7q7rR9RL6wyrjlNms1U0fwjLoID5PYHwvggIM3XMy/VIMezrJ3e
 zQl4cJxX+L9V0/NpX9R8XbJ6O7U1d2mYQAwsqDA1S8cbIMR9lm8q/ebFmjAuk54+k7GH
 zDJvGycOoh3LF+gM5zod7TcS/k/nX4LDh0qHfAV8PLntz067ERFQYXS0xRRZKJgG9O2n
 RN93YBUWhVONU1lp16yU+wMOHA6hKB3yOa9V1h7QMr0JrFPJ9B6O9FgSNuUQvF3NQa7E
 rFnQ==
X-Gm-Message-State: AOAM532jRz4CS1J1+NOjRxadVkaYjrZxwNDF+TNhRh5dxtkZIlNiTl3T
 T6zaNsCWtT+H/FQ+8m8NwZzYmg==
X-Google-Smtp-Source: ABdhPJyl0N4HOP5TC19Ux3tghsuwFXS3Lt0saU9P7nKst7cfrLo3+VDZiXqB/YNwiZ14kdAsmps+zQ==
X-Received: by 2002:a05:620a:bc9:b0:67b:e954:e3e2 with SMTP id
 s9-20020a05620a0bc900b0067be954e3e2mr8058184qki.491.1653098855926; 
 Fri, 20 May 2022 19:07:35 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-200-14.ec.res.rr.com. [65.184.200.14])
 by smtp.gmail.com with ESMTPSA id
 o25-20020ac86999000000b002f3e127be41sm656587qtq.20.2022.05.20.19.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 19:07:34 -0700 (PDT)
Date: Fri, 20 May 2022 22:07:32 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20220521020732.GH13239@bill-the-cat>
References: <174e5807-917a-7363-2daa-93c90ac9a118@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <174e5807-917a-7363-2daa-93c90ac9a118@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 U-Boot Mailing List <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2022.07
 = u-boot-stm32-20220520
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
Content-Type: multipart/mixed; boundary="===============0868237198457728004=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0868237198457728004==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Content-Disposition: inline


--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 09:25:16AM +0200, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related fixes for u-boot/master, v2022.07:
> u-boot-stm32-20220520
>=20
> - spi: fix busy bit check in stm32_qspi driver
> - stm32mp15: configure Buck3 voltage per PMIC NVM on Avenger96 board
>=20
> CI status:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/12043
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master
> https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> u-boot-stm32-20220520
>=20
>=20
>=20
> The following changes since commit f83bd23e2a0e9861969c9d43395299a14f25dd=
da:
>=20
> =A0 Merge https://source.denx.de/u-boot/custodians/u-boot-marvell (2022-0=
5-18
> 08:41:13 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> tags/u-boot-stm32-20220520
>=20
> for you to fetch changes up to b6a469360a0dec01dbbf087c5184a59dda494569:
>=20
> =A0 spi: stm32_qspi: Remove SR_BUSY bit check before sending command
> (2022-05-19 18:54:18 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmKISWEACgkQFHw5/5Y0
tyxR+AwAq3PZhM9xRALp+scOWErN7vZ7opFKMXowCLiFzp5SWIjRoWorNkE/BF8G
R23Hlmym8RbJCyideJWEBLp24mhBW8L0DxzYamOgHsstd4PxcSYT8KT0aJXpYNXs
Os5Gz0sZlytae/o0cMSR+z5ZYgNjrXEzLdzLWgvRNPqd4GJZLEYy0Gfid1rvJSOi
4BldYAR9aq1GSPCPAXAZ+HOGuBx+EiIWX2cCzDa6nMPQe1+g3BfPZFpqX2rw/CuG
hRRW/4jP0iw1gGaldTkpqcIo7d/dZpSC1bb8rz4BBBiWz5nGzy9NwkxNOUXkqmzO
G/jV6GrRuOgCL7oBrFnDOkgpIBMczY4R4IfVHPwSdjM7dHzgxcMvrTySMv1fyavo
K4D4zNwz9Gk/nglmYRtXA0tEblW/n/LvBHMbCOJuNLx4DmV+bFQ9woA2ivXPZzqS
KOpvSmCrH8gBsHkR6ta5Sn7ouUGSsDsBQIKiWS28YnkFxc+/sqnooiukxIVsDLt0
UUZlr1bl
=LZUE
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--

--===============0868237198457728004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0868237198457728004==--
