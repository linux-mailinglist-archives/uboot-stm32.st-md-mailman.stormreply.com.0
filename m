Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E387F521512
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 14:18:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C490C03FC0;
	Tue, 10 May 2022 12:18:25 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDE04C035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 12:18:24 +0000 (UTC)
Received: from [192.168.192.146] (port=36610 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1noOoj-0003qh-TR; Tue, 10 May 2022 14:18:18 +0200
Date: Tue, 10 May 2022 14:18:16 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <YnpYCCpHX4Ax0S9s@nx64de-df6d00>
Mail-Followup-To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@lists.denx.de,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Lukasz Majewski <lukma@denx.de>
References: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
 <20220510095041.2.I98b0b23318f39ef6411b8f96c05f5b11b4cf5de7@changeid>
MIME-Version: 1.0
In-Reply-To: <20220510095041.2.I98b0b23318f39ef6411b8f96c05f5b11b4cf5de7@changeid>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] clk: stm32mp13: add a STM32MP13 RCC
 clock driver
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
Content-Type: multipart/mixed; boundary="===============2621700611900664893=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2621700611900664893==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SzLTGRoezlSIG1Wz"
Content-Disposition: inline


--SzLTGRoezlSIG1Wz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 10, 2022 at 09:51:11AM +0200, Patrick Delaunay wrote:
> Introduce a minimal STM32MP13 RCC driver only to allow bind of RCC MISC
> driver.

Consider s/only/just/ and s/bind of/binding of the/.

> diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
> -%<-
>  obj-$(CONFIG_CLK_STM32MP1) +=3D clk_stm32mp1.o
> +obj-$(CONFIG_CLK_STM32MP13) +=3D clk-stm32mp13.o
> \ No newline at end of file

Could you add a newline here? I think it was there in the previous
patch. Also, note that the new file name seems to break the convention
of using underscores.


All the best

--=20
Grzegorz

--SzLTGRoezlSIG1Wz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmJ6WAgACgkQeE9lGUIc
pz559A//cAaHTDK6yVhH3rwgxgmjvl+0WOsJKIud8zCl9r17FAATQlY1xXXq7/Xs
py5/xrBhwNvDwbWtcO1TqRGhGw3TGz1Nx3aSMrtcyrD8Lfm0poM2UKJsZ+URN458
DptIZZGbzcejvUENGRC84lfvVCo7GBLYvOjO6tq0GXZI4+H/iXpIllipzxQcIhVH
zfiRRiuUvNFMf2Omm++hfgNVZHbpF22mVzNzd9PBrfIAKF3XhWPNTaMkwGvxN9+K
QgQ/V4Aelap9bgb5i6E4A5dzXNygTe7lczZOIhi36zW8L0ad+av0COKOjlu6/Qrg
ZhHGVQTb3pPGyJi/38YEcOKWGw0h5BO/UhURAtWFQlKk2NvRt4MaygMbfjo/mH8R
/HEq9Y5lcgvNGx0dT+I2kTxA+1juTaGlYKDDl++m717Fc6kWiIKcRcMSExuw+UF7
qOLNkEu5zuUtmajP3yJtbXg3HwsWWsy67qZThphIg2haIVQ+531gZIx5b8/Dmg3w
lktiM7l1dN79LFv38faJZWZNb1ngip9BFaRIPEsI2tFl8oUapbeNqbYoD91dWdR4
vaz7sbheLfjrTqGEpkB3bxSZPbJ+hOrIbfdMpMhpqVRiPhHTP7HWh9vVW3MSodVG
D2AW12U4IMzCMN6eHRmugPdS6K5Yb1XkiPmToh2j6Ry+f5WThLI=
=rFhj
-----END PGP SIGNATURE-----

--SzLTGRoezlSIG1Wz--

--===============2621700611900664893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2621700611900664893==--
