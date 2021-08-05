Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B83E14CD
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Aug 2021 14:35:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB3D5C597AF;
	Thu,  5 Aug 2021 12:35:07 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05797C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 12:35:04 +0000 (UTC)
Received: from [192.168.192.146] (port=57622 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1mBcaQ-0004Af-Be; Thu, 05 Aug 2021 14:34:58 +0200
Date: Thu, 5 Aug 2021 14:34:56 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <YQva8CrG4Upn7+Gi@nx64de-df6d00>
Mail-Followup-To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com
References: <cover.1622220270.git.gszymaszek@short.pl>
 <14a9a4a33f349059fc1d3f2f999f27c545f721f2.1622220270.git.gszymaszek@short.pl>
 <53b5b3a8-0f67-9e99-051b-ee2d176d1b1c@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <53b5b3a8-0f67-9e99-051b-ee2d176d1b1c@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 3/5] arm: dts: stm32mp157c-odyssey-som:
 set the SDMMC2 VQMMC supply
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
Content-Type: multipart/mixed; boundary="===============3852533822378937782=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3852533822378937782==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OdSqz+SfRzi2j5jR"
Content-Disposition: inline


--OdSqz+SfRzi2j5jR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 02, 2021 at 09:18:57AM +0200, Patrice Chotard wrote:
> On 5/28/21 6:54 PM, Grzegorz Szymaszek wrote:
> > Set the SDMMC2 VQMMC supply to vdd (buck3). Note that in the
> > corresponding Linux kernel device tree, the supply is set to v3v3
> > (buck4), which is wrong.
>=20
> Do you intend to send similar patch to kernel mailing list to fix it ?

I=E2=80=99m sorry for not replying, I missed this question. FWIW, yes, I=E2=
=80=99ve had
sent a patch[1] and it has since been applied at least on stm32-next and
some stable branches.

[1]: https://lore.kernel.org/linux-arm-kernel/YLj4AMTCi84yO9GO@nx64de-df6d0=
0/

All the best!

--=20
Grzegorz

--OdSqz+SfRzi2j5jR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmEL2vAACgkQeE9lGUIc
pz6tag/8CCE88p49fA76VF21xwBzr5NlWDBCQRZYuALbREG8jpc1outvSi6RYEHh
MSLQfoi98xVtlUuZLYUL3kdCpHRcivf2FStZDbVm1dRz5yM3lbMBQOilquDuhsLg
K8BNob+f5HKOi8KwvUsG09x2lIqY5+BmvOkC+E5boIu+Ljrz+daQMQxWHgetGzul
tYTPUU0PJHezGeokKX1y9DNqJZijrTNTRRtJu3asoizlWk/vKlnp8iYeyWRjB6hX
Wa6qhFAEgjqPgvW+5z/34URsEwo8E/XGzTGdiuXmvkgIe2y6Xa2ooys3FDw3P6QQ
PaxnWwnpNpydTU7xXU3eh3Wke64OibyyqaR0PBekaD7y9ufTSte9F+egtVAqgu5z
s2qu4ERIo/Yn7cboSjbLJDV/FObjtom4N9XP/EruWRt7rXsJ71prmYfWoIL0PCIr
VbLSfZv1SoYKpQWuyKMlM2Ny9rNyMKu6teh+lJuL89KkCCeKroSPBNs/Nr2cQLIK
eNchzexwErd9zm4F7fpEgIMMgXRdB3SjqEVKbY6OgTY+l4peW1HG6W4ijPuWC5BW
euJVq2JyC05EgztH2c5ahWhLIGaymOP5+NoiWCrwYOOysMK3+xnW4030vpn5sFDw
IDCrCHXp7FKifKOuQIFJPxpWzMa84QMSB8ZU1WtRHIwOh0oTcOI=
=+1Q9
-----END PGP SIGNATURE-----

--OdSqz+SfRzi2j5jR--

--===============3852533822378937782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3852533822378937782==--
