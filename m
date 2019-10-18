Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B85DD002
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Oct 2019 22:25:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF135C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Oct 2019 20:25:30 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EE26C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2019 20:25:29 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46vyG02Fhnz1qqkc;
 Fri, 18 Oct 2019 22:25:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46vyG00pGHz1qqkD;
 Fri, 18 Oct 2019 22:25:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id zk_GJrop_EEI; Fri, 18 Oct 2019 22:25:26 +0200 (CEST)
X-Auth-Info: IvqE5xqGx4/qKDN5+tNykaTSBweBoD6IsAVq/iupqY0=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 18 Oct 2019 22:25:26 +0200 (CEST)
Date: Fri, 18 Oct 2019 22:25:18 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20191018222518.65a61fbc@jawa>
In-Reply-To: <20191018182922.22960-1-patrick.delaunay@st.com>
References: <20191018182922.22960-1-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Urja Rannikko <urjaman@gmail.com>, u-boot@lists.denx.de,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] dm: pinctrl: fix for introduce
	PINCONF_RECURSIVE option
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
Content-Type: multipart/mixed; boundary="===============6398557897476333328=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============6398557897476333328==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/WpoiUt/44xkhhWtb=yU/=Qt"; protocol="application/pgp-signature"

--Sig_/WpoiUt/44xkhhWtb=yU/=Qt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Oct 2019 20:29:22 +0200
Patrick Delaunay <patrick.delaunay@st.com> wrote:

> Correct the name of the define used in CONFIG_IS_ENABLED():
> it is not align with Kconfig name=3D CONFIG_$(SPL_)PINCONF_RECURSIVE.
>=20
> This correct a regression introduced by
> commit c20851b3d850 ("dm: pinctrl: introduce PINCONF_RECURSIVE
> option")
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/pinctrl/pinctrl-uclass.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-uclass.c
> b/drivers/pinctrl/pinctrl-uclass.c index 0b1eb7fab4..dc2340b779 100644
> --- a/drivers/pinctrl/pinctrl-uclass.c
> +++ b/drivers/pinctrl/pinctrl-uclass.c
> @@ -157,7 +157,7 @@ static int pinconfig_post_bind(struct udevice
> *dev)=20
>  UCLASS_DRIVER(pinconfig) =3D {
>  	.id =3D UCLASS_PINCONFIG,
> -#if CONFIG_IS_ENABLED(PINCONFIG_RECURSIVE)
> +#if CONFIG_IS_ENABLED(PINCONF_RECURSIVE)
>  	.post_bind =3D pinconfig_post_bind,
>  #endif
>  	.name =3D "pinconfig",

Reviewed-by: Lukasz Majewski <lukma@denx.de>


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/WpoiUt/44xkhhWtb=yU/=Qt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2qH64ACgkQAR8vZIA0
zr1M8wgApJ7MfSbgd3JrzeQzunUJIw37zP1UrDMIEv0XTk7uVZMLOzYuZJffYFJp
eQpU1ItstJWhdRdsek5ijWoSuE8mmOE3A0J6Wy1zj1nIIYsgx9lHS6Hh02kHxtnj
Dizr3engQyrgtqwBQPB1XjVmXiTrXeofnMpj021lQsPIAg2ZlSZk5si87KBdi6XZ
fCBg6i97xDKbL/GRDys4p0jzxrgDqer12zh884GJTdz/Rm6+OPrc9OI1dKoNjuUG
QR3q8s4U9Rv1sPESJAyguCElJhDKixckez6KcpUTrEm5crFr97+afpiU2jXsi2th
mIWu9QcoO3BvAegqlMjjnBFxL8wOOw==
=ZkWH
-----END PGP SIGNATURE-----

--Sig_/WpoiUt/44xkhhWtb=yU/=Qt--

--===============6398557897476333328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6398557897476333328==--
