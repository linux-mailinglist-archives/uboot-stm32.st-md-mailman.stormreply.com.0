Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5070AB4BED
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 12:25:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08B7AC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 10:25:54 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF21AC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 10:25:51 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46XfQQ607bz1rHD4;
 Tue, 17 Sep 2019 12:25:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46XfQQ5jkdz1qqkH;
 Tue, 17 Sep 2019 12:25:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id hNMW96IBJUD5; Tue, 17 Sep 2019 12:25:49 +0200 (CEST)
X-Auth-Info: pb2pwyIyrsY2EeRDe15et10ngVPnrvJXuJlyJJGDTLE=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 17 Sep 2019 12:25:49 +0200 (CEST)
Date: Tue, 17 Sep 2019 12:25:39 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190917122539.4dd99678@jawa>
In-Reply-To: <20190913141930.15784-5-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-5-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 04/14] dfu: allow to manage DFU on several
	devices
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
Content-Type: multipart/mixed; boundary="===============7327746147825469341=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============7327746147825469341==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/f=5W9YYD2jvj2/4SsJK1d1W"; protocol="application/pgp-signature"

--Sig_/f=5W9YYD2jvj2/4SsJK1d1W
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
> Found DFU: [0483:5720] ver=3D9999, devnum=3D96, cfg=3D1,\
>  intf=3D0, alt=3D3, name=3D"UBI", serial=3D"002700333338511934383330"
> Found DFU: [0483:5720] ver=3D9999, devnum=3D96, cfg=3D1,\
>  intf=3D0, alt=3D2, name=3D"u-boot-env", serial=3D"0027003333385119343833=
30"
> Found DFU: [0483:5720] ver=3D9999, devnum=3D96, cfg=3D1,\
>  intf=3D0, alt=3D1, name=3D"u-boot", serial=3D"002700333338511934383330"
> Found DFU: [0483:5720] ver=3D9999, devnum=3D96, cfg=3D1,\
>  intf=3D0, alt=3D0, name=3D"spl", serial=3D"002700333338511934383330"
>=20

My two remarks:

1. As you mentioned above - the current behavior must be preserved
(this is my main concern).

2. You added the example of usage to the commit message. Could you also
add it to the ./doc/README.dfu (not yet present) file ?

Anyway, thanks for your work :-)

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Acked-by: Lukasz Majewski <lukma@denx.de>

> ---
>=20
>  cmd/dfu.c         | 21 ++++++++++-------
>  drivers/dfu/dfu.c | 60
> ++++++++++++++++++++++++++++++++++++++++++++++- 2 files changed, 72
> insertions(+), 9 deletions(-)
>=20
> diff --git a/cmd/dfu.c b/cmd/dfu.c
> index 91a750a4fc..33491d0bc9 100644
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
> index 900a844d15..8bd5216017 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -53,6 +53,54 @@ static int dfu_find_alt_num(const char *s)
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
> @@ -69,7 +117,11 @@ int dfu_init_env_entities(char *interface, char
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
> dfu_alt_info?)\n"); @@ -83,6 +135,7 @@ done:
> =20
>  static unsigned char *dfu_buf;
>  static unsigned long dfu_buf_size;
> +static enum dfu_device_type dfu_buf_device_type;
> =20
>  unsigned char *dfu_free_buf(void)
>  {
> @@ -100,6 +153,10 @@ unsigned char *dfu_get_buf(struct dfu_entity
> *dfu) {
>  	char *s;
> =20
> +	/* manage several entity with several contraint */
> +	if (dfu_buf && dfu->dev_type !=3D dfu_buf_device_type)
> +		dfu_free_buf();
> +
>  	if (dfu_buf !=3D NULL)
>  		return dfu_buf;
> =20
> @@ -118,6 +175,7 @@ unsigned char *dfu_get_buf(struct dfu_entity *dfu)
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

--Sig_/f=5W9YYD2jvj2/4SsJK1d1W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2AtKMACgkQAR8vZIA0
zr0aLggAl7B8iN7V4wIWIJPaMqH+MXuFW1isl9vaiRML8lx688qh+6nUJNEGOq9i
VopHb4l/QAP3NdXAgAtFrznbCoDXci3gBsHlzaoZkXajkT9YbzrbrWGeLU5BWQSm
+ZIqCZuB6cK6pY18I1eNBZC8/fQCN6zi2jGqP5hA2fcTi4FG2r7RKVdkiU1lffSh
ObSRo5bkp+jxR1zfxJzuPpR/jSl5AlRjR2v8YMPLsr+dgB6XfykpUSV6opjhrVci
T9ZvdQdkUSZpImx1hjbX38BfPIXMuXVZ1YHkFxmK5NjLUVY0wLTEAfsqzqe0gChV
zSGsir9hT33lugslTCb4SKOF0Gs+Cw==
=7Z/m
-----END PGP SIGNATURE-----

--Sig_/f=5W9YYD2jvj2/4SsJK1d1W--

--===============7327746147825469341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7327746147825469341==--
