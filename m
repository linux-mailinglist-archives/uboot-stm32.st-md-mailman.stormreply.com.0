Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4315DA39
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 16:04:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A4F5C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 15:04:08 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCFEBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 15:04:02 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id v25so7128703qto.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 07:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l/lGFGGySYFqrHBaW/Ue/WtkCH3buFZGpz+CMYlMrPw=;
 b=qxnKlNGeEF9O3WshATSD8CP7NOduaQPJftVLy9nwtNi7CSRD00R/yMoXGOaFRoeUhS
 GzMWMw8uRHhXP1nk44AT5VEvNH0yUcLaOZcs4oB2GGmQFl+uQUUs3aMR8qne4zI8g4X1
 YnvEwOeU7kGcPAA3/BHOguQU+06Qi3oivGscE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l/lGFGGySYFqrHBaW/Ue/WtkCH3buFZGpz+CMYlMrPw=;
 b=kWpycOxtLV3UXp/w4yf6yrIdSFFHUwBoUqL33W+W9oSlEpBea4Z7FUuZizY+BR2a8r
 7SRN5QV5x+YfX4TjqCYCQxMQPLxW0j5E949/MV8xMiNYG5PLG4CiGqjdr8ymnKhwtArq
 zDx3gGcfOhmtAvaqS39gxhcYxKoH1wx3E+sEbqunX7jWsW3YHFP5sYCrMPccapOIWwNr
 CxtCFrLj8fDEF+EDjAE9xV0S6ZrC0dcExC+SE/4k4BJ0nA5NoSRH9dUzSDjy4GFH1MmP
 DbtTwNB/kBvrxy1QJeeA9EDksP3ungomwYrP1fJaPYo/wg/mNFQn+OIJkGD+fgFdXMqQ
 dlJg==
X-Gm-Message-State: APjAAAW/v6dJPsC6iu+Wuc29m12NPlqCv7AV84bNwQAETq/Ioj5V/MWB
 ogmPWhfHk3ocgUP7W5+eZ2CroQ==
X-Google-Smtp-Source: APXvYqxa8HDHH1t0mIV725iK7MshHniNb0Tr2EvWDqvoMcJsDkAko0Q9pVsBW5nUU6X2D6wlYK8HFg==
X-Received: by 2002:ac8:6f0b:: with SMTP id g11mr2850395qtv.308.1581692641005; 
 Fri, 14 Feb 2020 07:04:01 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-91ec-a738-df3b-226e.inf6.spectrum.com.
 [2606:a000:1401:86dd:91ec:a738:df3b:226e])
 by smtp.gmail.com with ESMTPSA id e2sm3463463qkb.112.2020.02.14.07.03.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Feb 2020 07:04:00 -0800 (PST)
Date: Fri, 14 Feb 2020 10:03:58 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200214150358.GY18302@bill-the-cat>
References: <e65235d356924d0393938ab1c8b0c306@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <e65235d356924d0393938ab1c8b0c306@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	u-boot-stm32-20200214
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
Content-Type: multipart/mixed; boundary="===============5822502377385126876=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5822502377385126876==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eV9cGEf2bJwTs/8b"
Content-Disposition: inline


--eV9cGEf2bJwTs/8b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2020 at 10:11:23AM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related patches for u-boot-stm32-20200214
> for v2020.04-rc3
>=20
> With the following changes:
> - add DH Electronics DHCOM SoM and PDK2 board
> - DT alignment with kernel v5.5-rc7 for stm32mp1 boards
> - fix STM32 image format for big endian hosts in mkimage
> - solve warnings in device tree and code for stm32mp1 boards
> - remove fdt_high and initrd_high for stm32 and stih boards
> - add support of STM32MP15x Rev.Z
> - update stm32mp1 readme
>=20
> CI status:
>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2194
>=20
> Thanks,
> Patrick
>=20
> The following changes since commit 721d6b594be4dc2d13b61f6afee9e437278d3d=
dd:
>=20
>   Prepare v2020.04-rc2 (2020-02-12 09:30:43 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20200214
>=20
> for you to fetch changes up to 8ee5e3c81f47b8647ef05219058d260199c51d1b:
>=20
>   board: stm32: remove fdt_high and fdt_highinitrd_high (2020-02-13 18:47=
:00 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--eV9cGEf2bJwTs/8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl5Gtt0ACgkQFHw5/5Y0
tyzGUgv/ZJHFuJHwJFLLcYTTCUTda/i0KU5Dbhzh7lnzzDidoL1YzIBSWmVS+Qzd
8uQyhz3fv9eCnM0WkDRrMm1pLaRJwBp3tiAFBEkrL8v62rR0nEOzBRepL0tW/Cpf
19GEZ+RbKAD03V/jhF7OjmmyH6FAGEg93uPtNTb4ggezNwJaaFy3UPoIiuNmu5pv
8uDx2e/+2hhFH7cJJkB0d7061JGoiaaOfEd0eyEFKsXpX2kNaUcLPzMGLgWOeVue
XfgyZh5WSFD0C/DzeVzuO7cbWohxuFJBUuPn09HNxfNcMkxYf9bT6IVR0QXJb/0Q
6ME4v/LgyJ1YLL/lLFiG5ypKXV/J9uBSDulDcNhDrY/9eePpItS8sAXR1ZX2V9j8
8rwOmbrhHB3N63CiAXqHrBDFO2pdfFLTo5pIlS2nuXnseTLkddwAAv3hBIKBtPtw
UrSTy5Ny6HuRN1dfqHatS9whMWvLOGRw6BFCGsjtHRTIie1E23qBKK0VxosyHemT
aZFVd5fM
=5Ak1
-----END PGP SIGNATURE-----

--eV9cGEf2bJwTs/8b--

--===============5822502377385126876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5822502377385126876==--
