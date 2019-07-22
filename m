Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F456FAE0
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 10:04:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFCA8CC2152
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 08:04:25 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1908DCC214F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 08:04:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45sYzW4xlLz1rWTR;
 Mon, 22 Jul 2019 10:04:23 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45sYzW4VCfz1qqkD;
 Mon, 22 Jul 2019 10:04:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id vixi7Mcd_c8A; Mon, 22 Jul 2019 10:04:22 +0200 (CEST)
X-Auth-Info: 7MOK8loUNDLwjvkjD6pgDysPjR286aLxWpj7Gunwkh8=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Jul 2019 10:04:22 +0200 (CEST)
Date: Mon, 22 Jul 2019 10:04:21 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190722100421.120e5b46@jawa>
In-Reply-To: <1563541046-6432-5-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
 <1563541046-6432-5-git-send-email-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [RFC PATCH 04/14] dfu: allow to manage DFU on
	several devices
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
Content-Type: multipart/mixed; boundary="===============4713593401701903502=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============4713593401701903502==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2sDIxf7r5aJuJdK94W=BEeM"; protocol="application/pgp-signature"

--Sig_/2sDIxf7r5aJuJdK94W=BEeM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Add support of DFU for several interface/device
> with one command.
>=20
> The format for "dfu_alt_info" in this case is :
>   interface with devstring'=3D'alternate list (';' separated)
>   and each interface is separated by '&'
>=20
> The previous behavior is always supported.

Good.

>=20
> One example for NOR (bootloaders) + NAND (rootfs in UBI):
>=20
> U-Boot> env set dfu_alt_info \
> "sf 0:0:10000000:0=3Dspl part 0 1;u-boot part 0 2; \
> u-boot-env part 0 3&nand 0=3DUBI partubi 0,3"
>=20
> U-Boot> dfu 0 list
>=20
> DFU alt settings list:
> dev: SF alt: 0 name: spl layout: RAW_ADDR
> dev: SF alt: 1 name: ssbl layout: RAW_ADDR
> dev: SF alt: 2 name: u-boot-env layout: RAW_ADDR
> dev: NAND alt: 3 name: UBI layout: RAW_ADDR
>=20
> U-Boot> dfu 0
>=20
> $> dfu-util -l =20
>=20
> Found DFU: [0483:5720] ver=3D9999, devnum=3D96, cfg=3D1, intf=3D0, alt=3D=
3,
> name=3D"UBI", serial=3D"002700333338511934383330" Found DFU: [0483:5720]
> ver=3D9999, devnum=3D96, cfg=3D1, intf=3D0, alt=3D2, name=3D"u-boot-env",
> serial=3D"002700333338511934383330" Found DFU: [0483:5720] ver=3D9999,
> devnum=3D96, cfg=3D1, intf=3D0, alt=3D1, name=3D"u-boot",
> serial=3D"002700333338511934383330" Found DFU: [0483:5720] ver=3D9999,
> devnum=3D96, cfg=3D1, intf=3D0, alt=3D0, name=3D"spl",
> serial=3D"002700333338511934383330"
>=20

Please add this info (with above example usage) to ./doc/README.dfu (in
a similar way as I did it some time ago for ./doc/README.dfutftp).

I also think that it would be beneficial for the community to add a
separate entry (in this file) for the description of ST's way to
program their platform with this code.

(I mean simple howto for people who would like to start playing around
with ST & U-Boot & DFU).

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  cmd/dfu.c         | 21 +++++++++++--------
>  drivers/dfu/dfu.c | 60
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++- 2 files
> changed, 72 insertions(+), 9 deletions(-)
>=20
> diff --git a/cmd/dfu.c b/cmd/dfu.c
> index 91a750a..33491d0 100644
> --- a/cmd/dfu.c
> +++ b/cmd/dfu.c
> @@ -21,23 +21,28 @@
>  static int do_dfu(cmd_tbl_t *cmdtp, int flag, int argc, char * const
> argv[]) {
> =20
> -	if (argc < 4)
> +	if (argc < 2)
>  		return CMD_RET_USAGE;
> =20
>  #ifdef CONFIG_DFU_OVER_USB
>  	char *usb_controller =3D argv[1];
>  #endif
>  #if defined(CONFIG_DFU_OVER_USB) || defined(CONFIG_DFU_OVER_TFTP)
> -	char *interface =3D argv[2];
> -	char *devstring =3D argv[3];
> +	char *interface =3D NULL;
> +	char *devstring =3D NULL;
> +
> +	if (argc >=3D 4) {
> +		interface =3D argv[2];
> +		devstring =3D argv[3];
> +	}
>  #endif
> =20
>  	int ret =3D 0;
>  #ifdef CONFIG_DFU_OVER_TFTP
>  	unsigned long addr =3D 0;
>  	if (!strcmp(argv[1], "tftp")) {
> -		if (argc =3D=3D 5)
> -			addr =3D simple_strtoul(argv[4], NULL, 0);
> +		if (argc =3D=3D 5 || argc =3D=3D 3)
> +			addr =3D simple_strtoul(argv[argc - 1], NULL,
> 0);=20
>  		return update_tftp(addr, interface, devstring);
>  	}
> @@ -48,7 +53,7 @@ static int do_dfu(cmd_tbl_t *cmdtp, int flag, int
> argc, char * const argv[]) goto done;
> =20
>  	ret =3D CMD_RET_SUCCESS;
> -	if (argc > 4 && strcmp(argv[4], "list") =3D=3D 0) {
> +	if (strcmp(argv[argc - 1], "list") =3D=3D 0) {
>  		dfu_show_entities();
>  		goto done;
>  	}
> @@ -67,7 +72,7 @@ U_BOOT_CMD(dfu, CONFIG_SYS_MAXARGS, 1, do_dfu,
>  	"Device Firmware Upgrade",
>  	""
>  #ifdef CONFIG_DFU_OVER_USB
> -	"<USB_controller> <interface> <dev> [list]\n"
> +	"<USB_controller> [<interface> <dev>] [list]\n"
>  	"  - device firmware upgrade via <USB_controller>\n"
>  	"    on device <dev>, attached to interface\n"
>  	"    <interface>\n"
> @@ -77,7 +82,7 @@ U_BOOT_CMD(dfu, CONFIG_SYS_MAXARGS, 1, do_dfu,
>  #ifdef CONFIG_DFU_OVER_USB
>  	"dfu "
>  #endif
> -	"tftp <interface> <dev> [<addr>]\n"
> +	"tftp [<interface> <dev>] [<addr>]\n"
>  	"  - device firmware upgrade via TFTP\n"
>  	"    on device <dev>, attached to interface\n"
>  	"    <interface>\n"
> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
> index 79a652e..01ec690 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -52,6 +52,54 @@ static int dfu_find_alt_num(const char *s)
>  	return ++i;
>  }
> =20
> +/*
> + * treat dfu_alt_info with several interface information
> + * to allow DFU on several device with one command,
> + * the string format is
> + * interface devstring'=3D'alternate list (';' separated)
> + * and each interface separated by '&'
> + */
> +int dfu_config_interfaces(char *env)
> +{
> +	struct dfu_entity *dfu;
> +	char *s, *i, *d, *a, *part;
> +	int ret =3D -EINVAL;
> +	int n =3D 1;
> +
> +	s =3D env;
> +	for (; *s; s++) {
> +		if (*s =3D=3D ';')
> +			n++;
> +		if (*s =3D=3D '&')
> +			n++;
> +	}
> +	ret =3D dfu_alt_init(n, &dfu);
> +	if (ret)
> +		return ret;
> +
> +	s =3D env;
> +	while (s) {
> +		ret =3D -EINVAL;
> +		i =3D strsep(&s, " ");
> +		if (!i)
> +			break;
> +		d =3D strsep(&s, "=3D");
> +		if (!d)
> +			break;
> +		a =3D strsep(&s, "&");
> +		if (!a)
> +			a =3D s;
> +		do {
> +			part =3D strsep(&a, ";");
> +			ret =3D dfu_alt_add(dfu, i, d, part);
> +			if (ret)
> +				return ret;
> +		} while (a);
> +	}
> +
> +	return ret;
> +}
> +
>  int dfu_init_env_entities(char *interface, char *devstr)
>  {
>  	const char *str_env;
> @@ -68,7 +116,11 @@ int dfu_init_env_entities(char *interface, char
> *devstr) }
> =20
>  	env_bkp =3D strdup(str_env);
> -	ret =3D dfu_config_entities(env_bkp, interface, devstr);
> +	if (!interface && !devstr)
> +		ret =3D dfu_config_interfaces(env_bkp);
> +	else
> +		ret =3D dfu_config_entities(env_bkp, interface,
> devstr); +
>  	if (ret) {
>  		pr_err("DFU entities configuration failed!\n");
>  		pr_err("(partition table does not match
> dfu_alt_info?)\n"); @@ -82,6 +134,7 @@ done:
> =20
>  static unsigned char *dfu_buf;
>  static unsigned long dfu_buf_size;
> +static enum dfu_device_type dfu_buf_device_type;
> =20
>  unsigned char *dfu_free_buf(void)
>  {
> @@ -99,6 +152,10 @@ unsigned char *dfu_get_buf(struct dfu_entity *dfu)
>  {
>  	char *s;
> =20
> +	/* manage several entity with several contraint */
> +	if (dfu_buf && dfu->dev_type !=3D dfu_buf_device_type)
> +		dfu_free_buf();
> +
>  	if (dfu_buf !=3D NULL)
>  		return dfu_buf;
> =20
> @@ -117,6 +174,7 @@ unsigned char *dfu_get_buf(struct dfu_entity *dfu)
>  		printf("%s: Could not memalign 0x%lx bytes\n",
>  		       __func__, dfu_buf_size);
> =20
> +	dfu_buf_device_type =3D dfu->dev_type;
>  	return dfu_buf;
>  }
> =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/2sDIxf7r5aJuJdK94W=BEeM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl01bgUACgkQAR8vZIA0
zr1OOgf8CgiPRUim5OqE8mfSgkj3yLrTZT0PUGHhYNEi+K+ot4V0M0/mFOIWRVww
oq9c5B3CPJdXO1JdTERC1PoNh/NdO1aV4ab4vdmYWM93f7BCDi0lVkutqcg31b7Z
mSuu4PVw56VdUdFTgd+Rg13nnkrugj8MTJFsjoLj6p78FPq5curms5FOZecMNUlB
vpn2cY1KPLJzodykI3eQECPfbQVOInYquaoqDhtTLgrLH8UCjPRbw1R9S5KPtrwn
VvYX+ZeOPjjr9Eh7lFs10uE5oYdkVx0MmZGAfyQiTy/sDxXnfqZ3IWP5G781pZ5z
PI/QnXqICQv/iwPJlkXZLMhY4BO/8w==
=1dYS
-----END PGP SIGNATURE-----

--Sig_/2sDIxf7r5aJuJdK94W=BEeM--

--===============4713593401701903502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4713593401701903502==--
