Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD45B3705D
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Aug 2025 18:32:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20756C3F933;
	Tue, 26 Aug 2025 16:32:03 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E098C3F932
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 16:32:01 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-74381f06578so2869433a34.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 09:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1756225920; x=1756830720;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KlfEqMa4VgwWahS2oaZmqxDXnAE83+MMgyttnnLKIUU=;
 b=ZbsW4s0OcYMuRHHi4A8SHajfUy9X0pnTgNvzXyr/JT6sYK5gcQTzYv+AbfWE5BWDjJ
 wNCnAT4HIVYykHl1JtE38eq6XPJWPuFZYEE4DafdvXIQpEDNCUZQ8ABbMWW6NYKcG8/5
 Qd+czSFtKi7N0/YjyhbKwlz4IfEikZ4KtVKzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756225920; x=1756830720;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlfEqMa4VgwWahS2oaZmqxDXnAE83+MMgyttnnLKIUU=;
 b=Xo0WEmM70q4Xk0iSRkfV0oup24+Z34dKrYTL2vhCRUTk48ccH4FlHOPOoAobMgr5e2
 mtoAmSzjinHKCZHsdJFeVaXoDTrx7bfxjZsTcKLWRcrHUhzyhGIrWaw1XYHtaYiYHEQ6
 RbMH3dn4NRYZ6yvTGUxC8+HNXckfRGQgpfOXDtlVZT3AEtV2WMcogK1tk4A4yPVO4VM1
 XZOfw6YDkuoXn8n6kzZ/ci2d4SEU0Lr0AepyeJPpgV+0FuExXSMqJcN1/NryvV0DkeaK
 ueRW5aad4bvdyA2URtD0NaCOPmzwjGjLtWOwOvLlSfOajX4HCMd/pHYFKMbcmeUUI7Sn
 V4CQ==
X-Gm-Message-State: AOJu0YxnGKP/Whgftbepcjq8t/eHTyPsklwZFBqYIuvWhbSAiFso3xF5
 mZ9H8sBDqKv/peSFqUYII7kMnKL2tfzwCxVNbb4xbrkLcdqByP4ww6mKeal4hjTVjMs=
X-Gm-Gg: ASbGncvKsI6bt5aHbq0z79NnspigSpXZ4l3UcemCmGWIhDvdzIjHPZ8DaoYYgStQIT7
 EjLKaqfHyLGPpRSvb24SpHXQ+xtoZtTExLjCJOJP7sxWYe37275kciBKHObUxIILI4qCc53Nymy
 NGEMq0qrDo9GjGcwCfcRoNKCHGFo3VLfqyhQBagZSqbG+0lNBA46Snq9g7YI9iMJ3S7ZGFoEJgY
 3nXzpdSFMFPzNgAK3kkucdIX0VC8h1A4YqD766hpc62BaodOSB7GyLZeZB3RokGhgDUVu9K7VhH
 QYH1mR6BD7vv9Y0Ndh4UgdlrvjCglN4YiuLHBddSIefQROX5iMqSlf3XFR80U/O+Q0Amrv0J15y
 jLV1JsWV+L0eGlLyuS4Hes0HEThxi9nK0crglaDDyvKBradCTQR3+AFe0
X-Google-Smtp-Source: AGHT+IF+/5s5imQY6n+siLxIfVQDSbrZoMrSca0+x1KdSwA+7YJevhnA2FmDiOpnsd4hJubsI4k6Cw==
X-Received: by 2002:a05:6830:2905:b0:741:9e2e:863e with SMTP id
 46e09a7af769-74500957613mr7762035a34.13.1756225919944; 
 Tue, 26 Aug 2025 09:31:59 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net.
 [189.203.97.42]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-61dc78c81e0sm1258494eaf.20.2025.08.26.09.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 09:31:59 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:31:57 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20250826163157.GD124814@bill-the-cat>
References: <2235ea33-6eb6-4a04-9cf9-e4ee47f27dab@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <2235ea33-6eb6-4a04-9cf9-e4ee47f27dab@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2025.10
 = u-boot-stm32-20250825
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
Content-Type: multipart/mixed; boundary="===============4873682814507753747=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4873682814507753747==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Tyjn1A/p3kD4lYyf"
Content-Disposition: inline


--Tyjn1A/p3kD4lYyf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 08:50:18AM +0200, Patrice CHOTARD wrote:

> Hi Tom
>=20
> Please pull the STM32 related patches for u-boot/master, v2025.10 =3D u-b=
oot-stm32-20250825
>=20
> CI status: https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipeline=
s/27466
>=20
> Thanks
> Patrice
>=20
> The following changes since commit 7d879baa6f7ca201bcecff74f2a75455602892=
80:
>=20
>   Merge branch 'u-boot-nand-23082025' of https://source.denx.de/u-boot/cu=
stodians/u-boot-nand-flash (2025-08-24 08:01:29 -0600)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20250825
>=20
> for you to fetch changes up to 198c48f2657e67ded7fc7679c2ed1c26227f9fdc:
>=20
>   configs: stm32mp25: Enable OF_UPSTREAM_BUILD_VENDOR (2025-08-25 16:54:5=
3 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--Tyjn1A/p3kD4lYyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaK3hdgAKCRAr4qD1Cr/k
CiuTAP0ckkQ1TYWc69FqasUylEnib7GiIZldHmOVbAfcy2b5rgEAvrFkw6gFIsEu
4boix2BStfQ9aBwQchpFIrXhXLXtjQ4=
=r+ai
-----END PGP SIGNATURE-----

--Tyjn1A/p3kD4lYyf--

--===============4873682814507753747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4873682814507753747==--
