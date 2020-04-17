Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A551AE73D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E06AEC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:18 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0212C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:08:16 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id o10so3220877qtr.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5AdQiecFxiV1HjW/0Z4Oup/Y+njj4fpQD4rF2sGiTq8=;
 b=eJz44D9wjcdUWTFHrKExKsVyB4Cm+6J7S8v98qsfhRVLXZiCato1+A0mqpEIcPEke1
 jtq767I1TneqA2Q/S6Z1aRCV43fBjv6cCroCxPKLSmkUiFhU85w/05PpTJpxeWIsQ/8t
 R0SVlMVNfRRx8OClkKOdEud0mBTCli1SjHHQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5AdQiecFxiV1HjW/0Z4Oup/Y+njj4fpQD4rF2sGiTq8=;
 b=HSdRly5TM+HaVCySL3fseRM3oaLcsSLxOzzAsQThA/5CVFW9ZTurtTLVgLAwJ8zRnr
 skp1wV7Cd8zY65G+k3+PKLBBapGb7NyePePuV9VPJNxdeQwRu8fKgpUq26yq5oziPicX
 YQf5bNHRxlZVKJT9f6wdcFz9cRrhVG6ZqDMyUl6zQL/ypunb6FDYFFtvYiTZqcTpm/Xz
 /soCtQDgj9A4Wx83QKNPLtNFLb662VE8Icl6WXMNzrMJjTbezcEAGmypFi0H7oFtTxxR
 lFR9OKeULj+XVJycCd8EPJ9sDFaI5zhnq2apRo+6Wzr8VGGdhtm7pCvDZ/r6vsoP/02N
 IeJQ==
X-Gm-Message-State: AGi0PualApzMSztsLnd+FSkPWvUhs9r3+dZZ5wbMX3MbxtGo9rfeOTru
 MDcLycOr8vzm0UfbQVHJQuonkw==
X-Google-Smtp-Source: APiQypKQpUujUU+8YdktmvQEQCiI25BKjcOhJ2bAFFfAQBL506Tb7AtiDLWffM3TnWKiSKFDtH0shg==
X-Received: by 2002:ac8:692:: with SMTP id f18mr5068356qth.201.1587157695910; 
 Fri, 17 Apr 2020 14:08:15 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id 195sm16832020qkd.6.2020.04.17.14.08.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:08:15 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:08:12 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210812.GG4555@bill-the-cat>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
 <20200228141816.1644-6-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200228141816.1644-6-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, TsiChung Liew <Tsi-Chung.Liew@nxp.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 5/7] doc: update reference to README.board
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
Content-Type: multipart/mixed; boundary="===============8258603416486094422=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8258603416486094422==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IFrzt5yFNjsAZ17G"
Content-Disposition: inline


--IFrzt5yFNjsAZ17G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 03:18:14PM +0100, Patrick Delaunay wrote:

> Update reference in files detected by
> scripts/documentation-file-ref-check
>=20
> doc/README.<board>  =3D> board/<board>/README
>=20
> Files moved in board directory in
> commit 702e6014f15b ("doc: cleanup - move board
> READMEs into respective board directories")'
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--IFrzt5yFNjsAZ17G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGrwACgkQFHw5/5Y0
tyyuVwv/ahlJ1q7nEbNs0EG1UHYlsyp2+zAirO2D8wcaQ6E2GlpD4XKyIYrDsyiE
pQpTk+7xLeB++WIdhQTJslexK6q3idbOuHEJdohLU7GRc1ocYNIJDYgYwozSSwl4
qdofdMNHFWNMFRDY52/E8BHrZCaRY8WogHj2HBr/CQrTCfwGZ2boEorN4vNLHlG0
wnd7DO1eWhCtj63PWu0zd7dP7gVKa1MqA1BIGC6pV+6v7dgj85nyF8Dsalp+kJC+
iyWNgPFnJpIDK9BVwgV/rp/RKqsge0i59a5rLly6bNNqxOBVpqUI7a+tdaoeBin7
jAjRLzxwICTBsDN17vj96cgdltLbELItwt/Qlz6uq9FKagdZX5DSP3Hj07JiFnUt
Fra7lU/1NpaV1BB8/vzt5YsFwSqtWCcjzSBXdSZcD8Z+EVtVkFS09Sktt8FRE84n
vjrT8H3pgXkqCcBGIRUKeHV4jhDnGEmIYA11R2p0QSu9i2ZEQ3UU2hpF64L/J5Os
BBmaEpoc
=ufS1
-----END PGP SIGNATURE-----

--IFrzt5yFNjsAZ17G--

--===============8258603416486094422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8258603416486094422==--
