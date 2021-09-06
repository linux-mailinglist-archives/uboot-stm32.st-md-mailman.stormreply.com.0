Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F151401D38
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Sep 2021 16:42:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0C06C597B6;
	Mon,  6 Sep 2021 14:42:14 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18306C597B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Sep 2021 14:42:14 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id gf5so4070997qvb.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Sep 2021 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zcuDKOS75jYa2oNqTVs28dfHuizjOpXTzh0dF8OsvK0=;
 b=Q3l2Z6JcHhbVNCELebtWRq38zTCSalACtrct+rzBk93fjt932Nv5T8lL1PVxOTuJ0x
 67OKnUVqbWjOsGH0taVE52itk6LCvLupagKH2DXBPWlENSLJXy8uatCwHYc0OhA57UWw
 6tJX8zdjrhpnF5/64ToRu5U7RBmb/3gg4nEaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zcuDKOS75jYa2oNqTVs28dfHuizjOpXTzh0dF8OsvK0=;
 b=RYjJ758V69r2OMf9X6V1aFWCylWCQ+ijfTDRhHAvc2f/psu1fQYMuOa2qh/efctRnt
 WHPZxw/1oNJGJwGiSloASijjHIRbG/dDiZbAbOeadB6zdLp4Y8sDG0+ehJXv9p7zF/Aa
 lC52TGIvywigt8xcZ0SBq9RQdtLO1lFxnZK2SrobHrjHUSbkZwrmHOW3JCLMZM4DonZD
 sszV5uMhPdQ5NYKi8ZwRC/C/B9DWuw5Tget4e1OJCNT4wTtI4oduu/brasyaL07gfWgv
 Tfw05hOrje5MR9cNRcIpg8RQ7WyVsICESP5eLYpvxrwo0p2OtTv9+kbX3azrhPWX2qVQ
 aoxA==
X-Gm-Message-State: AOAM53006g+DO8jGq251ZhhwK7g5kfLxmqGJ8erBWnwdBgCSln1BrGhL
 kLbiG603axjhplP37Uhh4mKkIA==
X-Google-Smtp-Source: ABdhPJy7Z3c6Jhmo4V1nReXUqogjjc2NeO5/wNo8RpXbwPBecheHC7gtnkuNrOrvPNjrPwd/EpwEJw==
X-Received: by 2002:a0c:8bc9:: with SMTP id a9mr12160842qvc.29.1630939332878; 
 Mon, 06 Sep 2021 07:42:12 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-f0af-7dea-fd8a-f044.res6.spectrum.com.
 [2603:6081:7b01:cbda:f0af:7dea:fd8a:f044])
 by smtp.gmail.com with ESMTPSA id c2sm6813653qkd.57.2021.09.06.07.42.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Sep 2021 07:42:12 -0700 (PDT)
Date: Mon, 6 Sep 2021 10:42:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20210906144210.GM12964@bill-the-cat>
References: <8d7790a9-82d0-9470-78a4-fe836d1280f9@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <8d7790a9-82d0-9470-78a4-fe836d1280f9@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.10
 = u-boot-stm32-20210906
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
Content-Type: multipart/mixed; boundary="===============8595072910652054811=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8595072910652054811==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M2Pxvdb9QxnGd/3e"
Content-Disposition: inline


--M2Pxvdb9QxnGd/3e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 02:23:25PM +0200, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related fixes for u-boot/master, v2021.10:
> u-boot-stm32-20210906
>=20
> - fix EFI boot with OP-TEE for STM32MP15 boards
>=20
> CI status:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/9006
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master
> https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> u-boot-stm32-20210906
>=20
>=20
>=20
> The following changes since commit ecd6e0ce5aaeeb1149b0b8ebe6bed8198d0bd2=
fe:
>=20
> =A0 Merge tag 'xilinx-for-v2021.10-rc4' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze (2021-09-03
> 13:17:43 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> tags/u-boot-stm32-20210906
>=20
> for you to fetch changes up to c8510e397fad4056619d2dab6f2b61c48766a239:
>=20
> =A0 stm32mp: Fix board_get_usable_ram_top() (2021-09-06 10:00:11 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--M2Pxvdb9QxnGd/3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmE2KL4ACgkQFHw5/5Y0
tywu9Av+IPBDJ/+4pLXiq6+cvWBojvmblA8AFhLU5xkHIKDekUb2uBC7+uRsc4n4
nJtmklkG3+cbAB3f6CzTLMHzWk2S/z9lDkA154ILH+7xfnTYZ82WdMg+iYySguKi
iZdlOiHyVJVXRdVesDLu1YiQ14A/wXWePW1xtCaOmf9veoJilOWu5nMdO9qvYyqn
gV8ub3AJrEffesVrGNMOC9g835IPgiQeav7D+XVp30Q1aHXGQkQePWP5dbl08gxA
70fCxliu+yl+Tjj8AcXsmLE08CmdxRJjwWaLvoiNsXTGFODQ+US6d3OCbMZTc7uQ
i0KdYRK+sCyndmt+XlupPcaJlg/UxM/0GB/IZ72Me4GMsB8SDOd9WYRhDJcvl0X3
mARfnLIWWx8P1LZ7MoW+tqzLeqiWxMGYvHLj5PJD5FQzMqA+Q+LILC8gK2w6eVOd
Jyjtbt9lhwqODE/PKS/uR47JeLXUV6BNeROw0HL4eFGTWz3Cg7nQYx1Be0ZF9kse
q0aESt4g
=GFDX
-----END PGP SIGNATURE-----

--M2Pxvdb9QxnGd/3e--

--===============8595072910652054811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8595072910652054811==--
