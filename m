Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0539433E5
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Jul 2024 18:11:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 204C2C6DD96;
	Wed, 31 Jul 2024 16:11:58 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346EEC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 16:11:51 +0000 (UTC)
Received: from [192.168.192.146] (port=53536 helo=nx64de-b91e0e)
 by mx01.ayax.eu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gszymaszek@short.pl>)
 id 1sZBvV-002A2n-2O; Wed, 31 Jul 2024 18:11:45 +0200
Date: Wed, 31 Jul 2024 18:11:43 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <ZqpiP594mbXqx7SI@nx64de-b91e0e>
Mail-Followup-To: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com
References: <41ae952bf3f45545e3c6579463df3d0408f6343a.1722014005.git.gszymaszek@short.pl>
 <789acb2e22e681aa86302d522c9385a4bae34582.1722014005.git.gszymaszek@short.pl>
 <cc33dbd1-d4a9-4989-a236-f6cf8d950512@gmx.de>
MIME-Version: 1.0
In-Reply-To: <cc33dbd1-d4a9-4989-a236-f6cf8d950512@gmx.de>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 2/3] doc: stm32mp1: fix literal block
	markers (::)
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
Content-Type: multipart/mixed; boundary="===============0422790215707118396=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0422790215707118396==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s1gmahYwqwnp6XyG"
Content-Disposition: inline


--s1gmahYwqwnp6XyG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Heinrich,

thank you for comprehensive review. I'll respond to the specific points
later, but there's one thing I feel I should explain. In this series I
intended to only fix/improve the reStructuredText/HTML syntax and then,
if the changes were approved, I would go with making the actual text
easier to understand, I have some drafts already prepared. So I'm not
sure if fixing, for example, unnecessary root prompts is really in scope
of this changeset.

On Wed, Jul 31, 2024 at 07:15:10AM +0200, Heinrich Schuchardt wrote:
> Please, provide a commit message.

(Two perhaps, not one.) Is it really necessary in case of such trivial
changes? See sending_patches.rst:

> Put a detailed description after the summary and blank line. If the
> summary line is sufficient to describe the change (e.g. it is a trivial
> spelling correction or whitespace update), you can omit the blank line
> and detailed description.


All the best

--=20
Grzegorz

--s1gmahYwqwnp6XyG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmaqYj8ACgkQeE9lGUIc
pz7vhA/+M/rGwvJr/QiBQt08JxMX9glbpaUywssa6RyRHc8z1R3JsgtIOhLzZ33w
KDosKdSf1ERwFcBafudwKosvK92VB5DtZa5g9NiyPSXS5eVvkrKbc0/oZA4VajHR
KMLFJQw6aL9wxsbL/5jcBYl8O9nyrgjDRk/l3zl+EKNXS6WDUK+9InTvoD3ChRtL
o6KvFlowraym9m3Cla2Ifkvz9UnA1qeqw5S2ReFE/7dnFqXsBqLXV9HoqJKr6FG3
oygf4OAJznv9D4Lwj3im1w27HuBlhvZFhw0W/gCy9SzwHlGdVHwqnzQUkpq/bAE2
YR0BZRh9KKQYXRkEbwnmiqrjo08bduJueEr+7erzb0qZj80vFDQolZGgd4d7T895
jo2GcJ/arKtWVXisVzj4ba42n1yqHwHuj+iRyvR+FnnzM/8hzzszutZ9PvGBfyer
SgqVsy+nIoxeofbae/bUYymMLkriOtbHWVSgGZO5hMUZ3UkJREZt/Khx1qJWk0lN
CbssXL+i2zynEGMM9Nn6fSLacb5WMRR+RdT5nTYlejIbaMMTC+9xNogt856Vf9qW
zTw2ea5bm9AmJfFTSIAVNWqHzPFV7pvlHWNZy5D/FBkztANyGw1dnUx7H7bZgD0t
Ggd8X1TY+pWPP/pCVSYdg+NPp8/pknkog0NoviI0dPucZZENvpY=
=WQfw
-----END PGP SIGNATURE-----

--s1gmahYwqwnp6XyG--

--===============0422790215707118396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0422790215707118396==--
