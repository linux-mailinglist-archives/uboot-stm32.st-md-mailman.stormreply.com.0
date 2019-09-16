Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E365BB43CE
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 00:12:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57D90C36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Sep 2019 22:12:31 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE635C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2019 22:12:29 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46XL8D4hkzz1rKK6;
 Tue, 17 Sep 2019 00:12:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46XL8D46JKz1qsV1;
 Tue, 17 Sep 2019 00:12:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 1P5p-3SxpbUP; Tue, 17 Sep 2019 00:12:27 +0200 (CEST)
X-Auth-Info: ObrLtXa8Rpu4C9LwrhpAVmdJFgtHxqUHD72qLNCGAso=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 17 Sep 2019 00:12:27 +0200 (CEST)
Date: Tue, 17 Sep 2019 00:12:20 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190917001220.1ca03228@jawa>
In-Reply-To: <20190913141930.15784-3-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-3-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 02/14] dfu: sf: add partition support for
	nor backend
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
Content-Type: multipart/mixed; boundary="===============7891693748165115116=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============7891693748165115116==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZPdQscu=gyMl=TuEjsAh/ZS"; protocol="application/pgp-signature"

--Sig_/ZPdQscu=gyMl=TuEjsAh/ZS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Sep 2019 16:19:18 +0200
Patrick Delaunay <patrick.delaunay@st.com> wrote:

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
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/dfu_sf.c | 51
> ++++++++++++++++++++++++++++++++++++++++++++ include/dfu.h        |
> 2 ++ 2 files changed, 53 insertions(+)
>=20
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

Acked-by: Lukasz Majewski <lukma@denx.de>

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/ZPdQscu=gyMl=TuEjsAh/ZS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2ACMUACgkQAR8vZIA0
zr2TXAf9EMW2VHrROVGMGnP8EIWDdwVlpzOOxAsKDyeRDwEFdrAPuPTrMMWKQUtC
RNILTlUBu8dCWnsOk5rm6dvHRVSpMlJe7p9xLpXl4zmHoHNR/yE95tr8zTTf9uA1
gHv9EAMP0oncOIhqk1rVjYuAYe+4HxrWAAbSUkahuZkYBjdB4a6+C/AlJ2hEcGMD
tHv+3lgcVEZfP/VvDcJWXzso67nIvo/PgsvidQRfcctGtAZ3Iuumsu2jCSQXQV7h
a9flDmxQOeMTO1P/dJUInPTCorgatVhkZ5Dvn5HxUB0pRqVDEI73kJgSl8r+/ln1
fRNZeCIWVPrl/RQX3VJCRV/Tq2bjzg==
=Q3AU
-----END PGP SIGNATURE-----

--Sig_/ZPdQscu=gyMl=TuEjsAh/ZS--

--===============7891693748165115116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7891693748165115116==--
