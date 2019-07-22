Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB16FABB
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 09:51:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC7E7CC184D
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 07:51:56 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8C35CC184C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 07:51:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45sYj64cqRz1rKXM;
 Mon, 22 Jul 2019 09:51:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45sYj64L8Bz1qqkJ;
 Mon, 22 Jul 2019 09:51:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id VFxrClroIkKi; Mon, 22 Jul 2019 09:51:53 +0200 (CEST)
X-Auth-Info: F8vfqy7PvaT3u3Vc4V8GkOQzderpHUGAvVpif3KQ/SA=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Jul 2019 09:51:53 +0200 (CEST)
Date: Mon, 22 Jul 2019 09:51:47 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190722095147.12ed0f11@jawa>
In-Reply-To: <1563541046-6432-2-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
 <1563541046-6432-2-git-send-email-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [RFC PATCH 01/14] dfu: cosmetic: cleanup sf to
 avoid checkpatch error
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
Content-Type: multipart/mixed; boundary="===============8502897735955041149=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============8502897735955041149==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nlRky9=5Gf0GG6z0CV7roik"; protocol="application/pgp-signature"

--Sig_/nlRky9=5Gf0GG6z0CV7roik
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/dfu.c    | 7 ++++---
>  drivers/dfu/dfu_sf.c | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
> index 3189495..eb3a3c6 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -477,14 +477,15 @@ int dfu_config_entities(char *env, char
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
> +					  "EXT3", "EXT4",
> "RAM_ADDR" }; return dfu_layout[l];
>  }
> =20
> diff --git a/drivers/dfu/dfu_sf.c b/drivers/dfu/dfu_sf.c
> index 066e767..b78fcfd 100644
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

Thanks for fixing this.

Acked-by: Lukasz Majewski <lukma@denx.de>


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/nlRky9=5Gf0GG6z0CV7roik
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl01axMACgkQAR8vZIA0
zr1XUwgAzrVbRfrP15h/E5QC9IaA/H78Hz7akMscC7rZM/yRNrpgvhFR5Q6DvR9w
yebCK2asKfs/pbS5SHUQG2HWjg0s/aX1vls/Q9Kym7hQVrg6xgIeAfovfU1WOBy6
XAHW3iFyGQuARKbVpjN7Wts68ftm+hoTvMM3nzkegd110zLRYm+7oG/oPatk9G3G
WxSKjkWtKNaZSjeKw6PiP6HHFctEzVwnyMkQbBoZgNOs5RTBLWncpcEtkqx9LJaG
Gi40tqFExg2yKBeFswdLljq0SVUBdLy5BiLtNzF9OyBMoeyg9HiKATDeiTQbm49i
sWbkQzEEn7ylnCJ6o1MMa1UoHxQsKA==
=W2TX
-----END PGP SIGNATURE-----

--Sig_/nlRky9=5Gf0GG6z0CV7roik--

--===============8502897735955041149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8502897735955041149==--
