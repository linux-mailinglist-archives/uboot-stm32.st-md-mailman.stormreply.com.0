Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31233C08D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Mar 2021 16:53:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D7B7C56632;
	Mon, 15 Mar 2021 15:53:27 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3339C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 15:53:25 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id t4so32152106qkp.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I2VIwaoeobx7vv9kh2h6femQd+z9zuH7J4eS7LPGm9k=;
 b=PdqMtSYUcvNc1Bxrp2sZAc6Y2Y3iYTFYjOiF6W75V/BSRO56hFwWRCNPN6ctardEZ3
 zJGQPTcdnJ+OIyzC8b79mp2wp9TDbueACF3lZtJK8QsBKjpbTjvz2mBfzqDuyH0mXDZW
 9cH9EvSve6w/Buf2xX+xao6yhhiI9tQQ7lJ5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I2VIwaoeobx7vv9kh2h6femQd+z9zuH7J4eS7LPGm9k=;
 b=RYvrq8nqb+kup6JBe+JAA2o0mQmKopylf96MStQUT9ARPZ8+4+8TMcbnZ8HhY2OaBG
 +nM92nWt27PA5tLQNMG1zTbBeSmPQPqQuSkWFnw4ntatE1pBBTa2uYGiWfjxY/Tb6VkY
 YeHHIQRk/Miz4AhKFoJB9Bc6jXsktBcZkdateC3nZ5TkFQi3+435FxpOYmEwQmvgl5Oi
 0KIiBuz8bgPhU2kw68+2IMiTHvRWq1fMIkEnyuNik3POqaBrtrHNMhq56L+CXrbgpMmQ
 eSKUxSij6d9geSz0XouNWZJKVe4RLQyXFeD4isTIxDwd+0w9PfsoqcYD9pPKyPu1VlFB
 TOmg==
X-Gm-Message-State: AOAM531P1Ia4GBc6BoEl7UaOjR399cb1RKOojUmFtF4j1Xn/X5XESGUa
 F01LzKpcSdymf584dGTf1RizBQ==
X-Google-Smtp-Source: ABdhPJxRAXFD9C0/vPpO4Q9/pFzAea2/PImLicP+UgYTPplG74/X3F8udrRioc4CK9VlZnTgwjozyg==
X-Received: by 2002:a05:620a:f95:: with SMTP id
 b21mr26037221qkn.251.1615823604887; 
 Mon, 15 Mar 2021 08:53:24 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b07-927a-3530-5189-3a04-fa8e.res6.spectrum.com.
 [2603:6081:7b07:927a:3530:5189:3a04:fa8e])
 by smtp.gmail.com with ESMTPSA id b27sm12283267qkl.102.2021.03.15.08.53.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Mar 2021 08:53:24 -0700 (PDT)
Date: Mon, 15 Mar 2021 11:53:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20210315155322.GS1310@bill-the-cat>
References: <47b59500-0dc8-7ae1-6042-1a2b55a40b79@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <47b59500-0dc8-7ae1-6042-1a2b55a40b79@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Etienne CARRIERE <etienne.carriere@st.com>,
 "patrice.chotard@st.com" <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Yannick =?iso-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.07
 = u-boot-stm32-20210312
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
Content-Type: multipart/mixed; boundary="===============1869671400456248216=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1869671400456248216==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zBy0hMa+jq07jX86"
Content-Disposition: inline


--zBy0hMa+jq07jX86
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 08:35:48AM +0100, Patrice CHOTARD wrote:

> Hi Tom
>=20
> Please pull the STM32 related patches for u-boot/master, v2021.07: u-boot=
-stm32-20210312
>=20
> CI status: https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipeline=
s/6732
>=20
>=20
> he following changes since commit c5219c4a18f2b27547ecd799914f94e48b0fa86=
f:
>=20
>   Prepare v2021.04-rc3 (2021-03-01 22:46:41 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20210312
>=20
> for you to fetch changes up to b076cbe8aa2b3c29a3acc89fbea9fb7676f15fa7:
>=20
>   doc: stm32mp1: Use u-boot.itb if CONFIG_SPL_LOAD_FIT=3Dy (2021-03-12 15=
:25:55 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--zBy0hMa+jq07jX86
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmBPgvIACgkQFHw5/5Y0
tywyuwv+KNRV9xUh+RqnT8kCoEn1KdiqK0bzbXwgq7jlDz4L/ugsXDFDheXseG43
mOpWTCg870inarAtcLfv9l6VMm+WnKOkj4Esxxia4Oeob3Cqo4ESMi33jRM3rrIL
tyRGIInedpjF3MPmRHLpeplYlttDVBAZYKTygz/3VzJGUDpfmwMURaZjfW3Cjkr9
BEWw1dZmjaN1StBv51Anwz3t0y7qkxpYqC8ezlZt8JL5a4IgSac4QOeMIZl2TLga
oZ1shXaiTPr+Nz9E+QnzhbQrcStHeF4zfPDzAyAMrWigI35CkS2nPV6fe2QKbJA3
pq5HIJRxYjSucb+lQL3BTduEy/6+2bx/nZWyPmHESUE8Tqg4cUj71OnUfDuAY/XO
GaR3H7UQCNW6fz07U4vpclsUycXJ2TIFTuWoaFp+uVh66VnE4dpqDh0FQTpdDECs
JHA7bQv+vLZyuy3DabTDARbP+I2UfK1ddy+5KFk3pYCTKEv0lOG3AAAy2S2i9LX6
9JvIxgQh
=z48F
-----END PGP SIGNATURE-----

--zBy0hMa+jq07jX86--

--===============1869671400456248216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1869671400456248216==--
