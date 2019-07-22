Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD36FB10
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 10:16:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66B09CC23AC
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 08:16:09 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F289ACC23AB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 08:16:07 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45sZF34NhSz1rL13;
 Mon, 22 Jul 2019 10:16:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45sZF33rwcz1qqkD;
 Mon, 22 Jul 2019 10:16:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id SCjWIrAbJwHh; Mon, 22 Jul 2019 10:16:06 +0200 (CEST)
X-Auth-Info: NcxwKBjP/Vdq8HE5XfaR07dFRXiapwkmIvYAKPRjNMk=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Jul 2019 10:16:06 +0200 (CEST)
Date: Mon, 22 Jul 2019 10:16:05 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190722101605.29a43a73@jawa>
In-Reply-To: <1563541046-6432-8-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
 <1563541046-6432-8-git-send-email-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 07/14] dfu: add partition support for
	MTD backend
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
Content-Type: multipart/mixed; boundary="===============4135205272048439022=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============4135205272048439022==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mnYNhe_0Me9o+l9o=9=Mu3p"; protocol="application/pgp-signature"

--Sig_/mnYNhe_0Me9o+l9o=9=Mu3p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Add the support of MTD partition for the MTD backend.
>=20
> The expected dfu_alt_info for one alternate on the mtd device :
> 	<name> part <part_id>
>         <name> partubi <part_id>
>=20
> "partubi" also erase up to the end of the partition after write
> operation.
>=20
> For example: dfu_alt_info =3D "spl part 1;u-boot part 2; UBI partubi 3"

As in the previous comments - please add this info to dedicated doc
entry.

>=20
> U-Boot> dfu 0 mtd nand0
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/dfu_mtd.c | 78
> ++++++++++++++++++++++++++++++++++++++++++++++++++-
> include/dfu.h         |  2 ++ 2 files changed, 79 insertions(+), 1
> deletion(-)
>=20
> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> index 1168a6e..223b0fe 100644
> --- a/drivers/dfu/dfu_mtd.c
> +++ b/drivers/dfu/dfu_mtd.c
> @@ -10,6 +10,7 @@
>  #include <common.h>
>  #include <dfu.h>
>  #include <mtd.h>
> +#include <jffs2/load_kernel.h>
> =20
>  static bool mtd_is_aligned_with_block_size(struct mtd_info *mtd, u64
> size) {
> @@ -181,11 +182,49 @@ static int dfu_write_medium_mtd(struct
> dfu_entity *dfu,=20
>  static int dfu_flush_medium_mtd(struct dfu_entity *dfu)
>  {
> +	struct mtd_info *mtd =3D dfu->data.mtd.info;
> +	int ret;
> +
> +	/* in case of ubi partition, erase rest of the partition */
> +	if (dfu->data.nand.ubi) {
> +		struct erase_info erase_op =3D {};
> +
> +		erase_op.mtd =3D dfu->data.mtd.info;
> +		erase_op.addr =3D round_up(dfu->data.mtd.start +
> dfu->offset +
> +					 dfu->bad_skip,
> mtd->erasesize);
> +		erase_op.len =3D dfu->data.mtd.start +
> dfu->data.mtd.size -
> +			       erase_op.addr;
> +		erase_op.scrub =3D 0;
> +
> +		while (erase_op.len) {
> +			ret =3D mtd_erase(mtd, &erase_op);
> +			/* Abort if its not a bad block error */
> +			if (ret !=3D -EIO)
> +				break;
> +
> +			printf("Skipping bad block at 0x%08llx\n",
> +			       erase_op.fail_addr);
> +
> +			/* Skip bad block and continue behind it */
> +			erase_op.addr =3D erase_op.fail_addr +
> mtd->erasesize;
> +			erase_op.len =3D dfu->data.mtd.start +
> +				       dfu->data.mtd.size -
> +				       erase_op.addr;
> +		}
> +	}
>  	return 0;
>  }
> =20
>  static unsigned int dfu_polltimeout_mtd(struct dfu_entity *dfu)
>  {
> +	/*
> +	 * Currently, Poll Timeout !=3D 0 is only needed on nand
> +	 * ubi partition, as sectors which are not used need
> +	 * to be erased
> +	 */
> +	if (dfu->data.nand.ubi)
> +		return DFU_MANIFEST_POLL_TIMEOUT;
> +
>  	return DFU_DEFAULT_POLL_TIMEOUT;
>  }
> =20
> @@ -194,6 +233,7 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu,
> char *devstr, char *s) char *st;
>  	struct mtd_info *mtd;
>  	bool has_pages;
> +	int ret, part;
> =20
>  	mtd =3D get_mtd_device_nm(devstr);
>  	if (IS_ERR_OR_NULL(mtd))
> @@ -212,11 +252,47 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu,
> char *devstr, char *s) dfu->data.mtd.start =3D simple_strtoul(s, &s,
> 16); s++;
>  		dfu->data.mtd.size =3D simple_strtoul(s, &s, 16);
> +	} else if ((!strcmp(st, "part")) || (!strcmp(st,
> "partubi"))) {
> +		char mtd_id[32];
> +		struct mtd_device *mtd_dev;
> +		u8 part_num;
> +		struct part_info *pi;
> +
> +		dfu->layout =3D DFU_RAW_ADDR;
> +
> +		part =3D simple_strtoul(s, &s, 10);
> +
> +		sprintf(mtd_id, "%s,%d", devstr, part - 1);
> +		printf("using id '%s'\n", mtd_id);
> +
> +		mtdparts_init();
> +
> +		ret =3D find_dev_and_part(mtd_id, &mtd_dev, &part_num,
> &pi);
> +		if (ret !=3D 0) {
> +			printf("Could not locate '%s'\n", mtd_id);
> +			return -1;

			-ENODEV maybe would be more appropriate ?

> +		}
> +
> +		dfu->data.mtd.start =3D pi->offset;
> +		dfu->data.mtd.size =3D pi->size;
> +		if (!strcmp(st, "partubi"))
> +			dfu->data.mtd.ubi =3D 1;
>  	} else {
> -		printf("%s: (%s) not supported!\n", __func__, st);
> +		printf("%s: Memory layout (%s) not supported!\n",
> __func__, st); return -1;
>  	}
> =20
> +	if (!mtd_is_aligned_with_block_size(mtd,
> dfu->data.mtd.start)) {
> +		printf("Offset not aligned with a block (0x%x)\n",
> +		       mtd->erasesize);
> +		return -EINVAL;
> +	}
> +	if (!mtd_is_aligned_with_block_size(mtd,
> dfu->data.mtd.size)) {
> +		printf("Size not aligned with a block (0x%x)\n",
> +		       mtd->erasesize);
> +		return -EINVAL;
> +	}
> +
>  	dfu->get_medium_size =3D dfu_get_medium_size_mtd;
>  	dfu->read_medium =3D dfu_read_medium_mtd;
>  	dfu->write_medium =3D dfu_write_medium_mtd;
> diff --git a/include/dfu.h b/include/dfu.h
> index 924952f..a90732c 100644
> --- a/include/dfu.h
> +++ b/include/dfu.h
> @@ -62,6 +62,8 @@ struct mtd_internal_data {
>  	/* RAW programming */
>  	u64 start;
>  	u64 size;
> +	/* for ubi partition */
> +	unsigned int ubi;
>  };
> =20
>  struct nand_internal_data {




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/mnYNhe_0Me9o+l9o=9=Mu3p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl01cMUACgkQAR8vZIA0
zr04bAf/cPZTN8Z/LOhyCeXiA9mYDpTXHLSldJnvdxkIY/CTeUYffGlk1SES3hun
hRIYGZ4XBzaVac7yB//d2yWScjTh5DKez6poB0Q8gFBlYAl+T8H162AKG4duYPzV
qISjz1ZG0b0pf5Mg67vCFWZgP9aNCWx3+Qjo2fDSVE3U1qNyPy7ZkKQGR2ARxAcL
38FdTmpBONq8756TlPssQ++c91YQRBjXbOwk5JMKKR6crFQl3VjtXIx8FDacKAkS
aL6ZmTcVDDPqN8Y2nyzzpLPKhGGgyqm6u5OAG+85i+aL7xd7rzaL3yKpZ5nkEP1g
c4OV1k1rXNkkpRBCgJt88LavY7hYqA==
=/31p
-----END PGP SIGNATURE-----

--Sig_/mnYNhe_0Me9o+l9o=9=Mu3p--

--===============4135205272048439022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4135205272048439022==--
