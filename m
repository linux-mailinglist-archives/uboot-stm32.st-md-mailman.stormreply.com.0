Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D03BB4389
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Sep 2019 23:49:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02E03C36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Sep 2019 21:49:56 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D14AC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2019 21:49:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46XKf938Cwz1rGRX;
 Mon, 16 Sep 2019 23:49:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46XKf92v0sz1qsDD;
 Mon, 16 Sep 2019 23:49:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id x8WMWLngYaQq; Mon, 16 Sep 2019 23:49:52 +0200 (CEST)
X-Auth-Info: a6PPkHE0iAmseYPWpusS5yELmnu1CekXn7mc+Af71x0=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 16 Sep 2019 23:49:52 +0200 (CEST)
Date: Mon, 16 Sep 2019 23:49:51 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190916234951.5a9055e0@jawa>
In-Reply-To: <20190913141930.15784-2-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 01/14] dfu: cosmetic: cleanup sf to avoid
 checkpatch error
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
Content-Type: multipart/mixed; boundary="===============0834229635467584256=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0834229635467584256==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/L8h=il3Rirf0W78K.oC3EOR"; protocol="application/pgp-signature"

--Sig_/L8h=il3Rirf0W78K.oC3EOR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Sep 2019 16:19:17 +0200
Patrick Delaunay <patrick.delaunay@st.com> wrote:

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/dfu.c    | 7 ++++---
>  drivers/dfu/dfu_sf.c | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
> index d2b67b18cf..e9db7f8d66 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -478,14 +478,15 @@ int dfu_config_entities(char *env, char
> *interface, char *devstr)=20
>  const char *dfu_get_dev_type(enum dfu_device_type t)
>  {
> -	const char *dev_t[] =3D {NULL, "eMMC", "OneNAND", "NAND",
> "RAM", "SF" };
> +	const char *const dev_t[] =3D {NULL, "eMMC", "OneNAND",
> "NAND", "RAM",
> +				     "SF"};
>  	return dev_t[t];
>  }
> =20
>  const char *dfu_get_layout(enum dfu_layout l)
>  {
> -	const char *dfu_layout[] =3D {NULL, "RAW_ADDR", "FAT", "EXT2",
> -					   "EXT3", "EXT4",
> "RAM_ADDR" };
> +	const char *const dfu_layout[] =3D {NULL, "RAW_ADDR", "FAT",
> "EXT2",
> +					  "EXT3", "EXT4", "RAM_ADDR"
> }; return dfu_layout[l];
>  }
> =20
> diff --git a/drivers/dfu/dfu_sf.c b/drivers/dfu/dfu_sf.c
> index 066e7670d1..b78fcfd3a1 100644
> --- a/drivers/dfu/dfu_sf.c
> +++ b/drivers/dfu/dfu_sf.c
> @@ -19,7 +19,7 @@ static int dfu_get_medium_size_sf(struct dfu_entity
> *dfu, u64 *size) }
> =20
>  static int dfu_read_medium_sf(struct dfu_entity *dfu, u64 offset,
> void *buf,
> -		long *len)
> +			      long *len)
>  {
>  	return spi_flash_read(dfu->data.sf.dev, dfu->data.sf.start +
> offset, *len, buf);
> @@ -32,7 +32,7 @@ static u64 find_sector(struct dfu_entity *dfu, u64
> start, u64 offset) }
> =20
>  static int dfu_write_medium_sf(struct dfu_entity *dfu,
> -		u64 offset, void *buf, long *len)
> +			       u64 offset, void *buf, long *len)
>  {
>  	int ret;
> =20

Acked-by: Lukasz Majewski <lukma@denx.de>


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/L8h=il3Rirf0W78K.oC3EOR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2AA38ACgkQAR8vZIA0
zr3W5Qf+I8piQ1UPkr5PVRrEqC6yPeC9ObFinJuojuHlSgpbIznL0nkCgcE8Z8/K
NRbUnGNsWYmbzeNMRxAQWl4XHZFgIQareXAO2chK+Ia5ObTD7cyJNsEsDxmyAK93
dR4aiXiRto/4CkHLQ3Vir5PU9LfVmr/f1WCTzvBKvQycJWQJrFJd74yxmGnJT7KA
79yxCFsHiwD8EMmYS422uOrtx5wvHmko51wpdC4zgWUutIp5mc3orD6AgvIRCeHw
vyy1yB78EyDmeP35AWoIC8ZFrA721X/m2kMXbic3YNu/7HtlY30mFYxMpGsxaxna
+8fRDCIsopn1aT69ErABTXKA1i4sFA==
=/5kK
-----END PGP SIGNATURE-----

--Sig_/L8h=il3Rirf0W78K.oC3EOR--

--===============0834229635467584256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0834229635467584256==--
