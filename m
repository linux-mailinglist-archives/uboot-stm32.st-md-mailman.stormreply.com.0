Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A2D26F9
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Oct 2019 12:11:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4154FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Oct 2019 10:11:30 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEACDC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 10:11:29 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46pn1D1jJJz1rvRK;
 Thu, 10 Oct 2019 12:11:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46pn1D11S5z1qqkQ;
 Thu, 10 Oct 2019 12:11:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id JO2WpmAgExP0; Thu, 10 Oct 2019 12:11:26 +0200 (CEST)
X-Auth-Info: 3H49xSRNyNhrh6MuJG6Vn4HP/978/C9vaIYoywteJGA=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 10 Oct 2019 12:11:26 +0200 (CEST)
Date: Thu, 10 Oct 2019 12:11:25 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20191010121125.1fab75d4@jawa>
In-Reply-To: <20190930133832.11992-4-patrick.delaunay@st.com>
References: <20190930133832.11992-1-patrick.delaunay@st.com>
 <20190930133832.11992-4-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v2 03/16] dfu: sf: add partition support
	for nor backend
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
Content-Type: multipart/mixed; boundary="===============1591191506570535170=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1591191506570535170==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/tv0JHqvpse1sPPjxgzcniKz"; protocol="application/pgp-signature"

--Sig_/tv0JHqvpse1sPPjxgzcniKz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Copy the partition support from NAND backend to SF,
> support part and partubi option.
> In case of ubi partition, erase the rest of the
> partition as it is mandatory for UBI.
>=20
> for example:
>=20
> U-Boot> env set dfu_alt_info "spl part 0 1;\
> u-boot part 0 2;u-boot-env part 0 3;UBI partubi 0 4"
> U-Boot> dfu 0 sf 0:0:10000000:0
>=20
> Acked-by: Lukasz Majewski <lukma@denx.de>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
> Changes in v2:
> - Update dfu documentation for callbacks
>=20
>  doc/README.dfu       |  4 ++++
>  drivers/dfu/dfu_sf.c | 51
> ++++++++++++++++++++++++++++++++++++++++++++ include/dfu.h        |
> 2 ++ 3 files changed, 57 insertions(+)
>=20
> diff --git a/doc/README.dfu b/doc/README.dfu
> index f5344e236c..cf5de28b01 100644
> --- a/doc/README.dfu
> +++ b/doc/README.dfu
> @@ -89,6 +89,10 @@ Commands:
>      cmd: dfu 0 sf <dev>
>      each element in "dfu_alt_info" =3D
>        <name> ram <offset> <size>  raw access to sf device
> +      <name> part <dev> <part_id>  raw acces to partition
> +      <name> partubi <dev> <part_id>  raw acces to ubi partition
> +
> +      with <partid> is the MTD partition index
> =20
>  Host tools:
>    When U-Boot runs the dfu stack, the DFU host tools can be used
> diff --git a/drivers/dfu/dfu_sf.c b/drivers/dfu/dfu_sf.c
> index b78fcfd3a1..d401b76c2e 100644
> --- a/drivers/dfu/dfu_sf.c
> +++ b/drivers/dfu/dfu_sf.c
> @@ -10,6 +10,8 @@
>  #include <dfu.h>
>  #include <spi.h>
>  #include <spi_flash.h>
> +#include <jffs2/load_kernel.h>
> +#include <linux/mtd/mtd.h>
> =20
>  static int dfu_get_medium_size_sf(struct dfu_entity *dfu, u64 *size)
>  {
> @@ -52,11 +54,33 @@ static int dfu_write_medium_sf(struct dfu_entity
> *dfu,=20
>  static int dfu_flush_medium_sf(struct dfu_entity *dfu)
>  {
> +	u64 off, length;
> +
> +	if (!dfu->data.sf.ubi)
> +		return 0;
> +
> +	/* in case of ubi partition, erase rest of the partition */
> +	off =3D find_sector(dfu, dfu->data.sf.start, dfu->offset);
> +	/* last write ended with unaligned length jump to next */
> +	if (off !=3D dfu->data.sf.start + dfu->offset)
> +		off +=3D dfu->data.sf.dev->sector_size;
> +	length =3D dfu->data.sf.start + dfu->data.sf.size - off;
> +	if (length)
> +		return spi_flash_erase(dfu->data.sf.dev, off,
> length); +
>  	return 0;
>  }
> =20
>  static unsigned int dfu_polltimeout_sf(struct dfu_entity *dfu)
>  {
> +	/*
> +	 * Currently, Poll Timeout !=3D 0 is only needed on nand
> +	 * ubi partition, as sectors which are not used need
> +	 * to be erased
> +	 */
> +	if (dfu->data.sf.ubi)
> +		return DFU_MANIFEST_POLL_TIMEOUT;
> +
>  	return DFU_DEFAULT_POLL_TIMEOUT;
>  }
> =20
> @@ -133,6 +157,33 @@ int dfu_fill_entity_sf(struct dfu_entity *dfu,
> char *devstr, char *s) dfu->data.sf.start =3D simple_strtoul(s, &s, 16);
>  		s++;
>  		dfu->data.sf.size =3D simple_strtoul(s, &s, 16);
> +	} else if ((!strcmp(st, "part")) || (!strcmp(st,
> "partubi"))) {
> +		char mtd_id[32];
> +		struct mtd_device *mtd_dev;
> +		u8 part_num;
> +		struct part_info *pi;
> +		int ret, dev, part;
> +
> +		dfu->layout =3D DFU_RAW_ADDR;
> +
> +		dev =3D simple_strtoul(s, &s, 10);
> +		s++;
> +		part =3D simple_strtoul(s, &s, 10);
> +
> +		sprintf(mtd_id, "%s%d,%d", "nor", dev, part - 1);
> +		printf("using id '%s'\n", mtd_id);
> +
> +		mtdparts_init();
> +
> +		ret =3D find_dev_and_part(mtd_id, &mtd_dev, &part_num,
> &pi);

This patch causes a build break on e.g. mx6sabreauto

drivers/built-in.o: In function `dfu_fill_entity_sf':
build/../drivers/dfu/dfu_sf.c:176: undefined reference to
`mtdparts_init' build/../drivers/dfu/dfu_sf.c:178: undefined reference
to `find_dev_and_part'

To reproduce:
./tools/buildman/buildman.py --branch=3DHEAD mx6sabreauto --show_errors
--force-build --count=3D22 --output-dir=3D../BUILD/

Branch:
github-lmajewski-dfu/testing
https://github.com/lmajewski/u-boot-dfu/commits/testing

Corresponding output from travis-ci:
https://travis-ci.org/lmajewski/u-boot-dfu/builds/595994620


(Please inspect all failed builds and resend v3)


> +		if (ret !=3D 0) {
> +			printf("Could not locate '%s'\n", mtd_id);
> +			return -1;
> +		}
> +		dfu->data.sf.start =3D pi->offset;
> +		dfu->data.sf.size =3D pi->size;
> +		if (!strcmp(st, "partubi"))
> +			dfu->data.sf.ubi =3D 1;
>  	} else {
>  		printf("%s: Memory layout (%s) not supported!\n",
> __func__, st); spi_flash_free(dfu->data.sf.dev);
> diff --git a/include/dfu.h b/include/dfu.h
> index 145a1576a3..bf51ab74a5 100644
> --- a/include/dfu.h
> +++ b/include/dfu.h
> @@ -77,6 +77,8 @@ struct sf_internal_data {
>  	/* RAW programming */
>  	u64 start;
>  	u64 size;
> +	/* for sf/ubi use */
> +	unsigned int ubi;
>  };
> =20
>  #define DFU_NAME_SIZE			32




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/tv0JHqvpse1sPPjxgzcniKz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2fA80ACgkQAR8vZIA0
zr0z9Qf6A94Pp/fkqQMujZ5OKtOU15QSnfIJ/8v+fhOa+zOZNpTxMJuNgXG7o/6o
84R1/wFekm9Xr40TPYwuK99QBqwH+0s8ic4a1UAbmns578HQOvXeed0rGwHC9Ydb
nljX4p+otiS7qIqOAUL1WNYRAzWMbBK5p4vjU/ZOfwAwjoYuDi2ZX65WEw/aZgyF
h767dHQtklon8tzWwoFLCoRrAaM1eiSXfJugYtReCnLnTQvTdbYJf17gDlYrAIV1
TQGJ0bp+nYWUP9GWBv0nvyXyP794UVxtijD001x/usnGaIFix9z3jdMd8j9XeTRW
PN8JfRGQEt8ig5I4Go8twsVcVuplmA==
=RBPy
-----END PGP SIGNATURE-----

--Sig_/tv0JHqvpse1sPPjxgzcniKz--

--===============1591191506570535170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1591191506570535170==--
