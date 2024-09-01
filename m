Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C626D96755E
	for <lists+uboot-stm32@lfdr.de>; Sun,  1 Sep 2024 08:54:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71F08C6DD9F;
	Sun,  1 Sep 2024 06:54:55 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 313C0C6DD9D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Sep 2024 06:54:48 +0000 (UTC)
Received: from [192.168.192.146] (port=51134 helo=nx64de-b91e0e)
 by mx01.ayax.eu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gszymaszek@short.pl>)
 id 1skeTx-000XpK-V5; Sun, 01 Sep 2024 08:54:41 +0200
Date: Sun, 1 Sep 2024 08:54:39 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <ZtQPr1wKHkvAVNv-@nx64de-b91e0e>
Mail-Followup-To: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com
References: <41ae952bf3f45545e3c6579463df3d0408f6343a.1722014005.git.gszymaszek@short.pl>
 <789acb2e22e681aa86302d522c9385a4bae34582.1722014005.git.gszymaszek@short.pl>
 <cc33dbd1-d4a9-4989-a236-f6cf8d950512@gmx.de>
 <ZqpiP594mbXqx7SI@nx64de-b91e0e>
MIME-Version: 1.0
In-Reply-To: <ZqpiP594mbXqx7SI@nx64de-b91e0e>
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
Content-Type: multipart/mixed; boundary="===============2878247408001758191=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2878247408001758191==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9mSM6gLp99aXOr+U"
Content-Disposition: inline


--9mSM6gLp99aXOr+U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 06:11:43PM +0200, Grzegorz Szymaszek wrote:
> Hi Heinrich,
>=20
> thank you for comprehensive review. I'll respond to the specific points
> later, but there's one thing I feel I should explain. In this series I
> intended to only fix/improve the reStructuredText/HTML syntax and then,
> if the changes were approved, I would go with making the actual text
> easier to understand, I have some drafts already prepared. So I'm not
> sure if fixing, for example, unnecessary root prompts is really in scope
> of this changeset.

A gentle ping, I'm still unsure how to approach the issue.

> On Wed, Jul 31, 2024 at 07:15:10AM +0200, Heinrich Schuchardt wrote:
> > Please, provide a commit message.
>=20
> (Two perhaps, not one.) Is it really necessary in case of such trivial
> changes? See sending_patches.rst:
>=20
> > Put a detailed description after the summary and blank line. If the
> > summary line is sufficient to describe the change (e.g. it is a trivial
> > spelling correction or whitespace update), you can omit the blank line
> > and detailed description.

Same here.

--9mSM6gLp99aXOr+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmbUD68ACgkQeE9lGUIc
pz4m1w//aPauycaPMfu8aVeGFHrS0OoXF54oQyRS+JErYN2C5NkENY1FQi3TOE7N
eOQc7i/cfH0Bdg2XiScJTCLMaxJ2RS7E5SSn6bAKZmyWXJre7ThG19ef5z5vqjTG
E4eDue6+zklQIts4P3Qt6dzuBmSfQDTrytWTeIyDSC/Cyff5TtSVEB0nculjSGGa
mvtyYVs5AtPQl/uBckDRE2zUMmSxu7JIVNuurfFhOf4NsIghm7Z71h6O9fkEhqA6
9KyDWczvbwYTAXzmMZ1SMFa6WsHkPoVOHD6lZbfuohI/+iymruPsEpGlKY7V+5a5
2M4mj6MYA0IVwMh3VDlul+nO03KygC1dDWZpFpDIuq/S19mgfPyJikHIHmsyv8mV
bprofM7LjhF8IcL79rsA62lfeaYOchPZmgPyu1PrZDRgNCLIXOT3AvCkeMgBwOgv
edRz7kdUtmhmquP51d3qphh7ZnYQIDWJbm4wxO+FHYVm+VWp0YgLWhtqgZMBKBqZ
isE0VRGZu8rOwaO0Kpri0CMmYoiQcjfQkMaPT75n+Vgg4YZ9goUsHzkP6McnvRV+
KN0nSN/zz1FhZDLMi9mS3AbRR574005wVbBJRNOwD0dJ1rbLGF2Viqp9RvE+Oqi0
Oe1GzVSa+4ImkfXoY0slLjbhDKfqGpDbqN9m+g48dWgLBpmp+XQ=
=ufUV
-----END PGP SIGNATURE-----

--9mSM6gLp99aXOr+U--

--===============2878247408001758191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2878247408001758191==--
