Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3BCB4C22
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 12:42:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2926AC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 10:42:43 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15786C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 10:42:42 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46Xfns3mQLz1rL1L;
 Tue, 17 Sep 2019 12:42:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46Xfns3Lnkz1qqkG;
 Tue, 17 Sep 2019 12:42:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ttYD9yxHOmKk; Tue, 17 Sep 2019 12:42:40 +0200 (CEST)
X-Auth-Info: GA2+ji55csZk0Qh02F8rodD1QzlGzddXjtEkDQ8I7ow=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 17 Sep 2019 12:42:40 +0200 (CEST)
Date: Tue, 17 Sep 2019 12:42:39 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190917124239.5879c6fc@jawa>
In-Reply-To: <20190913141930.15784-9-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-9-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 08/14] dfu: add DFU virtual backend
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
Content-Type: multipart/mixed; boundary="===============3849843235445126629=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============3849843235445126629==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/C_4WnQSBlTVh3DP8AQAGfZl"; protocol="application/pgp-signature"

--Sig_/C_4WnQSBlTVh3DP8AQAGfZl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Add a virtual DFU backend to allow board specific read and write
> (for OTP update for example).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/Kconfig    |  7 ++++++
>  drivers/dfu/Makefile   |  1 +
>  drivers/dfu/dfu.c      |  5 ++++-
>  drivers/dfu/dfu_virt.c | 49
> ++++++++++++++++++++++++++++++++++++++++++ include/dfu.h          |
> 22 +++++++++++++++++++ 5 files changed, 83 insertions(+), 1
> deletion(-) create mode 100644 drivers/dfu/dfu_virt.c
>=20
> diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
> index ee664a331b..c0e6e5d8f0 100644
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
> index ebb119f398..0d7925c083 100644
> --- a/drivers/dfu/Makefile
> +++ b/drivers/dfu/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_$(SPL_)DFU_NAND) +=3D dfu_nand.o
>  obj-$(CONFIG_$(SPL_)DFU_RAM) +=3D dfu_ram.o
>  obj-$(CONFIG_$(SPL_)DFU_SF) +=3D dfu_sf.o
>  obj-$(CONFIG_$(SPL_)DFU_TFTP) +=3D dfu_tftp.o
> +obj-$(CONFIG_$(SPL_)DFU_VIRT) +=3D dfu_virt.o
> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
> index 4f4a07b790..2697235c24 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -474,6 +474,9 @@ static int dfu_fill_entity(struct dfu_entity
> *dfu, char *s, int alt, } else if (strcmp(interface, "sf") =3D=3D 0) {
>  		if (dfu_fill_entity_sf(dfu, devstr, s))
>  			return -1;
> +	} else if (strcmp(interface, "virt") =3D=3D 0) {
> +		if (dfu_fill_entity_virt(dfu, devstr, s))
> +			return -1;
>  	} else {
>  		printf("%s: Device %s not (yet) supported!\n",
>  		       __func__,  interface);
> @@ -569,7 +572,7 @@ int dfu_config_entities(char *env, char
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
> index 0000000000..ea8c71f100
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
> index a90732cc43..4de7d35914 100644
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

Acked-by: Lukasz Majewski <lukma@denx.de>

I will test this patch series (if it don't break current setup) and
provide the feedback.

As you mentioned - this series is heading to 2020.01, so I will put it
into next (if no regression is found on BBB).


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/C_4WnQSBlTVh3DP8AQAGfZl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2AuJ8ACgkQAR8vZIA0
zr2MqAf/SXeYeVFQS9tZKOSLJpuaApL4tDcBnxHMw017++j13hd3f5lyX3VT7mpN
nW3zuUonZmMMHI/7Wp+yWRtBV7giJDry+ewvuBfrQ+sSOzCUm35tFcUIPU8JYFfj
Q9gekCHCDQ89mhbttoBmyL/Cfbw2INRweyJOOVoXuPhp7uNJzss1OZ8ijWr4nvAc
jeY2zwn6tS2h8zbB/XsJpwTSJIHOG3jme2/7wupuG1v4miQvky9rt8cIsec2BMBE
zOsj+uxK5EX6GywvOKVyb3dNWZPrhTuRQDn+epcoP1GAdKyeGaCMEe65F7S82tvy
VqzMnB59FaRFcoFNxYZW0G2ishJDzQ==
=3atV
-----END PGP SIGNATURE-----

--Sig_/C_4WnQSBlTVh3DP8AQAGfZl--

--===============3849843235445126629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3849843235445126629==--
