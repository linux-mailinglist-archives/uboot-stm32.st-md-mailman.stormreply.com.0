Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E896FAF0
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 10:11:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FAB8CC23A5
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 08:11:28 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C8C9CC23A4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 08:11:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45sZ7g0MrKz1rXPv;
 Mon, 22 Jul 2019 10:11:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45sZ7f6hVTz1qqkD;
 Mon, 22 Jul 2019 10:11:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id soikgrp7fssY; Mon, 22 Jul 2019 10:11:25 +0200 (CEST)
X-Auth-Info: UiMx0jjyp8cMAs2QomonETw3rFfaFoD8JkE3E/6cAkQ=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Jul 2019 10:11:25 +0200 (CEST)
Date: Mon, 22 Jul 2019 10:11:24 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190722101124.015e1e0d@jawa>
In-Reply-To: <1563541046-6432-7-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
 <1563541046-6432-7-git-send-email-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 06/14] dfu: add backend for MTD device
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
Content-Type: multipart/mixed; boundary="===============0233538039527240463=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0233538039527240463==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/234Y.enW6B/mXaKMeiH8zzL"; protocol="application/pgp-signature"

--Sig_/234Y.enW6B/mXaKMeiH8zzL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Add DFU backend for MTD device: allow to read
> and write on any MTD device (RAW or SPI)
>=20
> For example :
> > set dfu_alt_info "nand_raw raw 0x0 0x100000"
> > dfu 0 mtd nand0 =20
>=20
> This MTD backend provides the same level than dfu nand
> backend for NAND in RAW mode and sf backend for NOR;
> So it can replace booth of them but it can also
> add support of spi-nand.
>=20
> > set dfu_alt_info "nand_raw raw 0x0 0x100000"
> > dfu 0 mtd spi-nand0 =20
>=20
> The backend code is based on the MTD command
> introduced by commit 5db66b3aee6f ("cmd: mtd:
> add 'mtd' command")

Please also add documentation entry for this feature/extension.

>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/Kconfig   |   6 ++
>  drivers/dfu/Makefile  |   1 +
>  drivers/dfu/dfu.c     |   5 +-
>  drivers/dfu/dfu_mtd.c | 230
> ++++++++++++++++++++++++++++++++++++++++++++++++++
> include/dfu.h         |  21 +++++ 5 files changed, 262 insertions(+),
> 1 deletion(-) create mode 100644 drivers/dfu/dfu_mtd.c
>=20
> diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
> index 4692736..ee664a3 100644
> --- a/drivers/dfu/Kconfig
> +++ b/drivers/dfu/Kconfig
> @@ -46,5 +46,11 @@ config DFU_SF
>  	  This option enables using DFU to read and write to SPI
> flash based storage.
> =20
> +config DFU_MTD
> +	bool "MTD back end for DFU"
> +	depends on MTD
> +	help
> +	  This option enables using DFU to read and write to on any
> MTD device. +
>  endif
>  endmenu
> diff --git a/drivers/dfu/Makefile b/drivers/dfu/Makefile
> index 4164f34..ebb119f 100644
> --- a/drivers/dfu/Makefile
> +++ b/drivers/dfu/Makefile
> @@ -5,6 +5,7 @@
> =20
>  obj-$(CONFIG_$(SPL_)DFU) +=3D dfu.o
>  obj-$(CONFIG_$(SPL_)DFU_MMC) +=3D dfu_mmc.o
> +obj-$(CONFIG_$(SPL_)DFU_MTD) +=3D dfu_mtd.o
>  obj-$(CONFIG_$(SPL_)DFU_NAND) +=3D dfu_nand.o
>  obj-$(CONFIG_$(SPL_)DFU_RAM) +=3D dfu_ram.o
>  obj-$(CONFIG_$(SPL_)DFU_SF) +=3D dfu_sf.o
> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
> index bcfa170..ab7fdc0 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -461,6 +461,9 @@ static int dfu_fill_entity(struct dfu_entity
> *dfu, char *s, int alt, if (strcmp(interface, "mmc") =3D=3D 0) {
>  		if (dfu_fill_entity_mmc(dfu, devstr, s))
>  			return -1;
> +	} else if (strcmp(interface, "mtd") =3D=3D 0) {
> +		if (dfu_fill_entity_mtd(dfu, devstr, s))
> +			return -1;
>  	} else if (strcmp(interface, "nand") =3D=3D 0) {
>  		if (dfu_fill_entity_nand(dfu, devstr, s))
>  			return -1;
> @@ -565,7 +568,7 @@ int dfu_config_entities(char *env, char
> *interface, char *devstr) const char *dfu_get_dev_type(enum
> dfu_device_type t) {
>  	const char *const dev_t[] =3D {NULL, "eMMC", "OneNAND",
> "NAND", "RAM",
> -				     "SF"};
> +				     "SF", "MTD"};
>  	return dev_t[t];
>  }
> =20
> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> new file mode 100644
> index 0000000..1168a6e
> --- /dev/null
> +++ b/drivers/dfu/dfu_mtd.c
> @@ -0,0 +1,230 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * dfu_mtd.c -- DFU for MTD device.
> + *
> + * Copyright (C) 2019,STMicroelectronics - All Rights Reserved
> + *
> + * Based on dfu_nand.c
> + */
> +
> +#include <common.h>
> +#include <dfu.h>
> +#include <mtd.h>
> +
> +static bool mtd_is_aligned_with_block_size(struct mtd_info *mtd, u64
> size) +{
> +	return !do_div(size, mtd->erasesize);
> +}
> +
> +static int mtd_block_op(enum dfu_op op, struct dfu_entity *dfu,
> +			u64 offset, void *buf, long *len)
> +{
> +	u64 off, lim, remaining;
> +	struct mtd_info *mtd =3D dfu->data.mtd.info;
> +	struct mtd_oob_ops io_op =3D {};
> +	int ret =3D 0;
> +	bool has_pages =3D mtd->type =3D=3D MTD_NANDFLASH ||
> +			 mtd->type =3D=3D MTD_MLCNANDFLASH;
> +
> +	/* if buf =3D=3D NULL return total size of the area */
> +	if (!buf) {
> +		*len =3D dfu->data.mtd.size;
> +		return 0;
> +	}
> +
> +	off =3D dfu->data.mtd.start + offset + dfu->bad_skip;
> +	lim =3D dfu->data.mtd.start + dfu->data.mtd.size;
> +
> +	if (off >=3D lim) {
> +		printf("Limit reached 0x%llx\n", lim);
> +		*len =3D 0;
> +		return op =3D=3D DFU_OP_READ ? 0 : -EIO;
> +	}
> +	/* limit request with the available size */
> +	if (off + *len >=3D lim)
> +		*len =3D lim - off;
> +
> +	if (!mtd_is_aligned_with_block_size(mtd, off)) {
> +		printf("Offset not aligned with a block (0x%x)\n",
> +		       mtd->erasesize);
> +		return 0;
> +	}
> +
> +	/* first erase */
> +	if (op =3D=3D DFU_OP_WRITE) {
> +		struct erase_info erase_op =3D {};
> +
> +		erase_op.mtd =3D mtd;
> +		erase_op.addr =3D off;
> +		erase_op.len =3D round_up(*len, mtd->erasesize);
> +		erase_op.scrub =3D 0;
> +
> +		while (erase_op.len) {
> +			if (erase_op.addr + erase_op.len > lim) {
> +				printf("Limit reached 0x%llx while
> erasing at offset 0x%llx\n",
> +				       lim, off);
> +				return -EIO;
> +			}
> +
> +			ret =3D mtd_erase(mtd, &erase_op);
> +			/* Abort if its not a bad block error */
> +			if (ret !=3D -EIO)
> +				break;
> +
> +			printf("Skipping bad block at 0x%08llx\n",
> +			       erase_op.fail_addr);
> +
> +			/* Continue erase behind bad block */
> +			erase_op.len -=3D erase_op.fail_addr -
> erase_op.addr;
> +			erase_op.addr =3D erase_op.fail_addr +
> mtd->erasesize;
> +		}
> +		if (ret && ret !=3D -EIO) {
> +			printf("Failure while erasing at offset
> 0x%llx\n",
> +			       erase_op.fail_addr);
> +			return 0;
> +		}
> +	}
> +
> +	io_op.mode =3D MTD_OPS_AUTO_OOB;
> +	io_op.len =3D *len;
> +	if (has_pages && io_op.len > mtd->writesize)
> +		io_op.len =3D mtd->writesize;
> +	io_op.ooblen =3D 0;
> +	io_op.datbuf =3D buf;
> +	io_op.oobbuf =3D NULL;
> +
> +	/* Loop over to do the actual read/write */
> +	remaining =3D *len;
> +	while (remaining) {
> +		if (off + remaining > lim) {
> +			printf("Limit reached 0x%llx while %s at
> offset 0x%llx\n",
> +			       lim, op =3D=3D DFU_OP_READ ? "reading" :
> "writing",
> +			       off);
> +			if (op =3D=3D DFU_OP_READ) {
> +				*len -=3D remaining;
> +				return 0;
> +			} else {
> +				return -EIO;
> +			}
> +		}
> +
> +		/* Skip the block if it is bad */
> +		if (mtd_is_aligned_with_block_size(mtd, off) &&
> +		    mtd_block_isbad(mtd, off)) {
> +			off +=3D mtd->erasesize;
> +			dfu->bad_skip +=3D mtd->erasesize;
> +			continue;
> +		}
> +
> +		if (op =3D=3D DFU_OP_READ)
> +			ret =3D mtd_read_oob(mtd, off, &io_op);
> +		else
> +			ret =3D mtd_write_oob(mtd, off, &io_op);
> +
> +		if (ret) {
> +			printf("Failure while %s at offset 0x%llx\n",
> +			       op =3D=3D DFU_OP_READ ? "reading" :
> "writing", off);
> +			return -EIO;
> +		}
> +
> +		off +=3D io_op.retlen;
> +		remaining -=3D io_op.retlen;
> +		io_op.datbuf +=3D io_op.retlen;
> +		io_op.len =3D remaining;
> +		if (has_pages && io_op.len > mtd->writesize)
> +			io_op.len =3D mtd->writesize;
> +	}
> +
> +	return ret;
> +}
> +
> +static int dfu_get_medium_size_mtd(struct dfu_entity *dfu, u64 *size)
> +{
> +	*size =3D dfu->data.mtd.info->size;
> +
> +	return 0;
> +}
> +
> +static int dfu_read_medium_mtd(struct dfu_entity *dfu, u64 offset,
> void *buf,
> +			       long *len)
> +{
> +	int ret =3D -1;
> +
> +	switch (dfu->layout) {
> +	case DFU_RAW_ADDR:
> +		ret =3D mtd_block_op(DFU_OP_READ, dfu, offset, buf,
> len);
> +		break;
> +	default:
> +		printf("%s: Layout (%s) not (yet) supported!\n",
> __func__,
> +		       dfu_get_layout(dfu->layout));
> +	}
> +
> +	return ret;
> +}
> +
> +static int dfu_write_medium_mtd(struct dfu_entity *dfu,
> +				u64 offset, void *buf, long *len)
> +{
> +	int ret =3D -1;
> +
> +	switch (dfu->layout) {
> +	case DFU_RAW_ADDR:
> +		ret =3D mtd_block_op(DFU_OP_WRITE, dfu, offset, buf,
> len);
> +		break;
> +	default:
> +		printf("%s: Layout (%s) not (yet) supported!\n",
> __func__,
> +		       dfu_get_layout(dfu->layout));
> +	}
> +
> +	return ret;
> +}
> +
> +static int dfu_flush_medium_mtd(struct dfu_entity *dfu)
> +{
> +	return 0;
> +}
> +
> +static unsigned int dfu_polltimeout_mtd(struct dfu_entity *dfu)
> +{
> +	return DFU_DEFAULT_POLL_TIMEOUT;
> +}
> +
> +int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char
> *s) +{
> +	char *st;
> +	struct mtd_info *mtd;
> +	bool has_pages;
> +
> +	mtd =3D get_mtd_device_nm(devstr);
> +	if (IS_ERR_OR_NULL(mtd))
> +		return -ENODEV;
> +	put_mtd_device(mtd);
> +
> +	dfu->dev_type =3D DFU_DEV_MTD;
> +	dfu->data.mtd.info =3D mtd;
> +
> +	has_pages =3D mtd->type =3D=3D MTD_NANDFLASH || mtd->type =3D=3D
> MTD_MLCNANDFLASH;
> +	dfu->max_buf_size =3D has_pages ? mtd->erasesize : 0;
> +
> +	st =3D strsep(&s, " ");
> +	if (!strcmp(st, "raw")) {
> +		dfu->layout =3D DFU_RAW_ADDR;
> +		dfu->data.mtd.start =3D simple_strtoul(s, &s, 16);
> +		s++;
> +		dfu->data.mtd.size =3D simple_strtoul(s, &s, 16);
> +	} else {
> +		printf("%s: (%s) not supported!\n", __func__, st);
> +		return -1;
> +	}
> +
> +	dfu->get_medium_size =3D dfu_get_medium_size_mtd;
> +	dfu->read_medium =3D dfu_read_medium_mtd;
> +	dfu->write_medium =3D dfu_write_medium_mtd;
> +	dfu->flush_medium =3D dfu_flush_medium_mtd;
> +	dfu->poll_timeout =3D dfu_polltimeout_mtd;
> +
> +	/* initial state */
> +	dfu->inited =3D 0;
> +
> +	return 0;
> +}
> diff --git a/include/dfu.h b/include/dfu.h
> index 7d60ffc..924952f 100644
> --- a/include/dfu.h
> +++ b/include/dfu.h
> @@ -22,6 +22,7 @@ enum dfu_device_type {
>  	DFU_DEV_NAND,
>  	DFU_DEV_RAM,
>  	DFU_DEV_SF,
> +	DFU_DEV_MTD,
>  };
> =20
>  enum dfu_layout {
> @@ -55,6 +56,14 @@ struct mmc_internal_data {
>  	unsigned int part;
>  };
> =20
> +struct mtd_internal_data {
> +	struct mtd_info *info;
> +
> +	/* RAW programming */
> +	u64 start;
> +	u64 size;
> +};
> +
>  struct nand_internal_data {
>  	/* RAW programming */
>  	u64 start;
> @@ -105,6 +114,7 @@ struct dfu_entity {
> =20
>  	union {
>  		struct mmc_internal_data mmc;
> +		struct mtd_internal_data mtd;
>  		struct nand_internal_data nand;
>  		struct ram_internal_data ram;
>  		struct sf_internal_data sf;
> @@ -249,6 +259,17 @@ static inline int dfu_fill_entity_sf(struct
> dfu_entity *dfu, char *devstr, }
>  #endif
> =20
> +#if CONFIG_IS_ENABLED(DFU_MTD)
> +int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char
> *s); +#else
> +static inline int dfu_fill_entity_mtd(struct dfu_entity *dfu, char
> *devstr,
> +				      char *s)
> +{
> +	puts("MTD support not available!\n");
> +	return -1;
> +}
> +#endif
> +
>  /**
>   * dfu_tftp_write - Write TFTP data to DFU medium
>   *




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/234Y.enW6B/mXaKMeiH8zzL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl01b6wACgkQAR8vZIA0
zr215wf/WXVrxulfIHxdz+CU6nZA0r09qYjbaAH205I8j/SWNMv4jk6rLpWNZP6M
E6d8oe3nyD6s1WgKZn7CX4eecVylerBWk2PIpTDBDBq3oF1ETaNpHLFOpcyvz5nl
YzVfzxVwVy+Eh7lVDTewlI1LW9Dzn3zkCjuvz8xol6OGkBXZPA4BFovbkaiDoKNY
5uM8lIKHvtrh1avkPDvBOe2pg7IlsoQe7rqucYIk1b7FG/0fBnZ9ol5nri5YbpYn
w6Gyen14FYqr7LsI4FtmVFBMlF9cPwnnf/98fBJbWghSuizHCRX+zAZ7R+/ZC7IT
rHkbDvzfiTXy0f3zzTufjxRmQE9QEw==
=jf/A
-----END PGP SIGNATURE-----

--Sig_/234Y.enW6B/mXaKMeiH8zzL--

--===============0233538039527240463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0233538039527240463==--
