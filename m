Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC86FB25
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 10:20:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A670CC23C0
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 08:20:28 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33F15CC23BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 08:20:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45sZL13n8vz1rXQ9;
 Mon, 22 Jul 2019 10:20:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45sZL1389Rz1qqkJ;
 Mon, 22 Jul 2019 10:20:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 5sHsUF0J8HVm; Mon, 22 Jul 2019 10:20:23 +0200 (CEST)
X-Auth-Info: BrdU91GZ7vkOJJg3vMd7aHXYb+quU/WSpO6UyUGbDyk=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Jul 2019 10:20:23 +0200 (CEST)
Date: Mon, 22 Jul 2019 10:20:22 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190722102022.1716084e@jawa>
In-Reply-To: <1563541046-6432-9-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
 <1563541046-6432-9-git-send-email-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 08/14] dfu: add DFU virtual backend
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
Content-Type: multipart/mixed; boundary="===============6923367889337788298=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============6923367889337788298==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_=gwmm=o9/lmH1d4oeL4/Dp"; protocol="application/pgp-signature"

--Sig_/_=gwmm=o9/lmH1d4oeL4/Dp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Add a virtual DFU backend to allow board specific read and write
> (for OTP update for example).

This looks like a great enhancement. Please add detailed documentation
entry of its intended usage.

>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/Kconfig    |  7 +++++++
>  drivers/dfu/Makefile   |  1 +
>  drivers/dfu/dfu.c      |  5 ++++-
>  drivers/dfu/dfu_virt.c | 49
> +++++++++++++++++++++++++++++++++++++++++++++++++
> include/dfu.h          | 22 ++++++++++++++++++++++ 5 files changed,
> 83 insertions(+), 1 deletion(-) create mode 100644
> drivers/dfu/dfu_virt.c
>=20
> diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
> index ee664a3..c0e6e5d 100644
> --- a/drivers/dfu/Kconfig
> +++ b/drivers/dfu/Kconfig
> @@ -52,5 +52,12 @@ config DFU_MTD
>  	help
>  	  This option enables using DFU to read and write to on any
> MTD device.=20
> +config DFU_VIRT
> +	bool "VIRTUAL flash back end for DFU"
> +	help
> +	  This option enables using DFU to read and write to VIRTUAL
> device
> +	  used at board level to manage specific behavior
> +	  (OTP update for example).
> +
>  endif
>  endmenu
> diff --git a/drivers/dfu/Makefile b/drivers/dfu/Makefile
> index ebb119f..0d7925c 100644
> --- a/drivers/dfu/Makefile
> +++ b/drivers/dfu/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_$(SPL_)DFU_NAND) +=3D dfu_nand.o
>  obj-$(CONFIG_$(SPL_)DFU_RAM) +=3D dfu_ram.o
>  obj-$(CONFIG_$(SPL_)DFU_SF) +=3D dfu_sf.o
>  obj-$(CONFIG_$(SPL_)DFU_TFTP) +=3D dfu_tftp.o
> +obj-$(CONFIG_$(SPL_)DFU_VIRT) +=3D dfu_virt.o
> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
> index ab7fdc0..a960b6e 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -473,6 +473,9 @@ static int dfu_fill_entity(struct dfu_entity
> *dfu, char *s, int alt, } else if (strcmp(interface, "sf") =3D=3D 0) {
>  		if (dfu_fill_entity_sf(dfu, devstr, s))
>  			return -1;
> +	} else if (strcmp(interface, "virt") =3D=3D 0) {
> +		if (dfu_fill_entity_virt(dfu, devstr, s))
> +			return -1;
>  	} else {
>  		printf("%s: Device %s not (yet) supported!\n",
>  		       __func__,  interface);
> @@ -568,7 +571,7 @@ int dfu_config_entities(char *env, char
> *interface, char *devstr) const char *dfu_get_dev_type(enum
> dfu_device_type t) {
>  	const char *const dev_t[] =3D {NULL, "eMMC", "OneNAND",
> "NAND", "RAM",
> -				     "SF", "MTD"};
> +				     "SF", "MTD", "VIRT"};
>  	return dev_t[t];
>  }
> =20
> diff --git a/drivers/dfu/dfu_virt.c b/drivers/dfu/dfu_virt.c
> new file mode 100644
> index 0000000..ea8c71f
> --- /dev/null
> +++ b/drivers/dfu/dfu_virt.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
> + */
> +#include <common.h>
> +#include <dfu.h>
> +#include <errno.h>
> +#include <malloc.h>
> +
> +int __weak dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
> +				 void *buf, long *len)
> +{
> +	debug("%s: off=3D0x%llx, len=3D0x%x\n", __func__, offset,
> (u32)*len); +
> +	return 0;
> +}
> +
> +int __weak dfu_get_medium_size_virt(struct dfu_entity *dfu, u64
> *size) +{
> +	*size =3D 0;
> +
> +	return 0;
> +}
> +
> +int __weak dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
> +				void *buf, long *len)
> +{
> +	debug("%s: off=3D0x%llx, len=3D0x%x\n", __func__, offset,
> (u32)*len);
> +	*len =3D 0;
> +
> +	return 0;
> +}
> +
> +int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr, char
> *s) +{
> +	debug("%s: devstr =3D %s\n", __func__, devstr);
> +
> +	dfu->dev_type =3D DFU_DEV_VIRT;
> +	dfu->layout =3D DFU_RAW_ADDR;
> +	dfu->data.virt.dev_num =3D simple_strtoul(devstr, NULL, 10);
> +
> +	dfu->write_medium =3D dfu_write_medium_virt;
> +	dfu->get_medium_size =3D dfu_get_medium_size_virt;
> +	dfu->read_medium =3D dfu_read_medium_virt;
> +
> +	dfu->inited =3D 0;
> +
> +	return 0;
> +}
> diff --git a/include/dfu.h b/include/dfu.h
> index a90732c..4de7d35 100644
> --- a/include/dfu.h
> +++ b/include/dfu.h
> @@ -23,6 +23,7 @@ enum dfu_device_type {
>  	DFU_DEV_RAM,
>  	DFU_DEV_SF,
>  	DFU_DEV_MTD,
> +	DFU_DEV_VIRT,
>  };
> =20
>  enum dfu_layout {
> @@ -92,6 +93,10 @@ struct sf_internal_data {
>  	unsigned int ubi;
>  };
> =20
> +struct virt_internal_data {
> +	int dev_num;
> +};
> +
>  #define DFU_NAME_SIZE			32
>  #ifndef CONFIG_SYS_DFU_DATA_BUF_SIZE
>  #define CONFIG_SYS_DFU_DATA_BUF_SIZE
> (1024*1024*8)	/* 8 MiB */ @@ -120,6 +125,7 @@ struct
> dfu_entity { struct nand_internal_data nand;
>  		struct ram_internal_data ram;
>  		struct sf_internal_data sf;
> +		struct virt_internal_data virt;
>  	} data;
> =20
>  	int (*get_medium_size)(struct dfu_entity *dfu, u64 *size);
> @@ -272,6 +278,22 @@ static inline int dfu_fill_entity_mtd(struct
> dfu_entity *dfu, char *devstr, }
>  #endif
> =20
> +#ifdef CONFIG_DFU_VIRT
> +int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr, char
> *s); +int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
> +			  void *buf, long *len);
> +int dfu_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
> +int dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
> +			 void *buf, long *len);
> +#else
> +static inline int dfu_fill_entity_virt(struct dfu_entity *dfu, char
> *devstr,
> +				       char *s)
> +{
> +	puts("VIRT support not available!\n");
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

--Sig_/_=gwmm=o9/lmH1d4oeL4/Dp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl01ccYACgkQAR8vZIA0
zr3fAgf7BNnXvVCft/MqbpNwoU7D6UnpXkW2+lretjpThUR+hYT2uJ3gARi/0S0Y
DLwJKE5q21SoWc+Cf55lyXYsIQGJPXiXRCO5QgnUY49Z/sL8u9RmSWZNZ2oba4Lc
NTqVlKk0RGtVAjRF+ae8dqTswL/n68BLbQXo6KXb7wApaO7JSox00fGokBIk+xB8
m/R7xGVwectSLWtbXhXHw/351Ipj4OJAiJr0ql7uPGFxeVuME9p/sm3vTRFW1dFt
kuMOR1grbxK/Vn3op+QBCtJoW4qXx4GLsXVk9M9zQZcdJIzU/mCxvSnLk61aa8Wj
ndd44NhASly+z+Rlbk1IePXLx4yhWw==
=tA/L
-----END PGP SIGNATURE-----

--Sig_/_=gwmm=o9/lmH1d4oeL4/Dp--

--===============6923367889337788298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6923367889337788298==--
