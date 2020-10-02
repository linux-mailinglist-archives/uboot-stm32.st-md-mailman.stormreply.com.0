Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD0228173B
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 17:56:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EF05C424B3;
	Fri,  2 Oct 2020 15:56:25 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B21FC32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 15:56:23 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id c62so1849413qke.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Oct 2020 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=n3NsotnTb/M4svn1YeCjflQhXa1BBqdhgCZDFM1Ugbo=;
 b=AvcYIKh3FwT712tP6EkvVPUtbZo9wmTG/2js6BXUe1KEfoLqJEV732OBGAVYtjFodJ
 d2SPgdLAnPFVL8ogIw8TUCB4WeqUFJtE6Iy8ZpJOBZ1VAvb3rCTzQDVQ4yNGtA/0p6h/
 bHs2Tqo93zyJn58hXZvHdwQC/IXtRN30/zTck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=n3NsotnTb/M4svn1YeCjflQhXa1BBqdhgCZDFM1Ugbo=;
 b=XNnMEOe0Dfk1N2siwsaDlAspM6p/AhYrjYREvglDoo+6WCleQJLE/sBVV2Tp1PY78I
 NjlsaK7W3RBr54IDHdQFjoIK3Yr7X2ScjCiv81+7VCH/IRETlGRnxZAkpb8HLMaXS75B
 9hf0+jgNjAex7L4RR8DZIxrwTL9krHUFFtpVG3PgtCKjIVjapvoKCc0o0Hui4uTz0yxZ
 ssh9b2WfS+wXR3M0hoBxK89hUgbAl4djH5KPn4mTKNR5VJqrf+jha8XbXVveRyfmE4OC
 SuGDN0NmXQoK3qXkl0U0S+ADK3ChNw3uCisxLTeXTKw+xR2cGZrXu1Bp0d41FZ0QSDbG
 qqug==
X-Gm-Message-State: AOAM530J6Eox7aiV8FYxNkE5ogRF5BfnN4GCI1aNiuLwcEhqJtJdV356
 Sf7on/WctFF6VHy4iy+HUMh/sg==
X-Google-Smtp-Source: ABdhPJzdTiTNus+oVp6K1QHMYCDOpvoF+FUMbnfA+WW79w1BtuWyFvuJvz36eUBzUKO0Z4bHixIPUQ==
X-Received: by 2002:a05:620a:45:: with SMTP id t5mr2763942qkt.41.1601654182052; 
 Fri, 02 Oct 2020 08:56:22 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-b80d-7712-37d0-daff.inf6.spectrum.com.
 [2606:a000:1401:8ebe:b80d:7712:37d0:daff])
 by smtp.gmail.com with ESMTPSA id 7sm1360407qkh.60.2020.10.02.08.56.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 02 Oct 2020 08:56:20 -0700 (PDT)
Date: Fri, 2 Oct 2020 11:56:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20201002155618.GC14816@bill-the-cat>
References: <1601642200954.8140@st.com>
MIME-Version: 1.0
In-Reply-To: <1601642200954.8140@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm32 for v2020.10=
 u-boot-stm32-20201002
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
Content-Type: multipart/mixed; boundary="===============2210039187908920715=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2210039187908920715==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uYN4FLSULGyR+p/T"
Content-Disposition: inline


--uYN4FLSULGyR+p/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 12:36:43PM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related patches for v2020.10:  u-boot-stm32-20201002
>=20
> With the last fixup:
> - Fixup SPI-NOR boot on AV96 board
>=20
> CI status:
>     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/4878
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u=
-boot-stm.git u-boot-stm32-20201002
>=20
> The following changes since commit 4f48163201f991de6d4a31b1c98a79e19971f5=
7f:
>=20
>   Merge https://gitlab.denx.de/u-boot/custodians/u-boot-marvell (2020-10-=
01 08:55:20 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20=
201002
>=20
> for you to fetch changes up to d9839417cb408415a240a5c513365973b3cb6031:
>=20
>   ARM: dts: stm32: Add missing dm-spl props for SPI NOR on AV96 (2020-10-=
02 14:18:00 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--uYN4FLSULGyR+p/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl93TZ8ACgkQFHw5/5Y0
tyxqowv/dmFTHdFR9TXskya91pMZNRY5fiA+gCDsA5AE5S69TK59/k7DOTYhAQCu
6kEuak/eyoG9Ge8zFdHgfxwhap2rn9wyzkfa/MYM5eBLEOGSXv4S3Ha39EjgZio6
zJohSXHKXpAAg4JygzCC39AjUs/hp4AHK0jkrQ9KiJoNVArI+oDH/RpUNi4NU6tx
7n5gIG0tNsj9pKrWmW4P2c5sS1WhAeFPzPjjE/SjIosyPR9Y4mAaaK0pmTyCrFJL
heB6GYjJHn5olC60usGd9UxBE9pJPuObffsQ9RgLuzWAa9C5ykSoMiD2LOkOm3Py
EJ7l32ETM1BmchZVeIAxVILzTmM4OxYZHPyJaaAxEQ/IPfWojmXt7dQRtd/3HAfD
zgcss8hi23lwqi401hfZex/t0oukJEdX8/7TFMgyO1bOO2iRHEBcmnQz53Rt+D8Z
9DBJDOdfSqr2o0XDFcZNIQatE07tXPggI+bHa5W12gOc9i/2uscFLQdSSYIIBlSa
2JwG2D3k
=5vDO
-----END PGP SIGNATURE-----

--uYN4FLSULGyR+p/T--

--===============2210039187908920715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2210039187908920715==--
