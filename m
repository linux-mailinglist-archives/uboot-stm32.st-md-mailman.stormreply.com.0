Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F371B4C14
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 12:38:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E167CC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 10:38:54 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAEC3C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 10:38:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46XfjT0MNyz1rTYV;
 Tue, 17 Sep 2019 12:38:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46XfjS6gMwz1qqkJ;
 Tue, 17 Sep 2019 12:38:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 8H8OU3pFgz1I; Tue, 17 Sep 2019 12:38:51 +0200 (CEST)
X-Auth-Info: 35pasHi57CXkLm3oEz/ES470ouFxLYrh9XuXX0HjFe0=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 17 Sep 2019 12:38:51 +0200 (CEST)
Date: Tue, 17 Sep 2019 12:38:50 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190917123850.16f06fd8@jawa>
In-Reply-To: <20190913141930.15784-8-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-8-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 07/14] dfu: add partition support for MTD
	backend
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
Content-Type: multipart/mixed; boundary="===============4557657027627724341=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============4557657027627724341==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Mr7y/oA.STCXf2WCBxIKYqi"; protocol="application/pgp-signature"

--Sig_/Mr7y/oA.STCXf2WCBxIKYqi
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
>=20
> U-Boot> dfu 0 mtd nand0

The above information shall also be placed to dedicated
./doc/README.dfu file.

>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Acked-by: Lukasz Majewski <lukma@denx.de>

> ---
>=20
>  drivers/dfu/dfu_mtd.c | 78
> ++++++++++++++++++++++++++++++++++++++++++- include/dfu.h         |
> 2 ++ 2 files changed, 79 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> index 1168a6e278..223b0fe977 100644
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
> index 924952f805..a90732cc43 100644
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

--Sig_/Mr7y/oA.STCXf2WCBxIKYqi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2At7oACgkQAR8vZIA0
zr3wCwgA2OQQds+9A67xYX5PZFLTryftQwjfdahT0mdm88NKFR3UTcnmrEM3HRVd
nU6L1xd7Yq/Ku/ZWQVm4PXZWO6YwDg/CoSLmnZtOgTIfADnAw5MLuGIFciVjf00D
zMJoJyd7VQw02ZvFv7DPKLOztKCxazz1KgoXc9GnLvuPoG2U/aJtEWzE5DleJbLR
P94EpSDH8oVOBbFSqvHjgf/WDl77BF6lw15zLcLdjyVq6aF9jXH92zf5+DvxewzI
Tv7ugTIjSFzg6R7uaRuhCHLshZI7rvG+jQfal2/JCPjI2I8atNx1T4uOOoTdrAg6
pZiS6tm6L/n8zueL2+csjv0uhKwoXA==
=zsRc
-----END PGP SIGNATURE-----

--Sig_/Mr7y/oA.STCXf2WCBxIKYqi--

--===============4557657027627724341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4557657027627724341==--
