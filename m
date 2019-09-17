Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B68B4C28
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 12:45:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55CAEC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 10:45:00 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44403C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 10:44:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46XfrV6Lwdz1rLPZ;
 Tue, 17 Sep 2019 12:44:58 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46XfrV5MqBz1qqkH;
 Tue, 17 Sep 2019 12:44:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id dj9iVSNMwaNt; Tue, 17 Sep 2019 12:44:57 +0200 (CEST)
X-Auth-Info: O7rVN2QHxQCvDYl2rep8OkCYodiklf9hhoijaRw3HCQ=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 17 Sep 2019 12:44:57 +0200 (CEST)
Date: Tue, 17 Sep 2019 12:44:56 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190917124456.7eb1be1b@jawa>
In-Reply-To: <20190913141930.15784-10-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-10-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 09/14] dfu: add callback for flush and
 initiated operation
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
Content-Type: multipart/mixed; boundary="===============5495198525634030562=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============5495198525634030562==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d.FCF3sdJ92jt8EHKg6H/f9"; protocol="application/pgp-signature"

--Sig_/d.FCF3sdJ92jt8EHKg6H/f9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Add weak callback to allow board specific behavior
> - flush
> - initiated
>=20
> This patch prepare usage of DFU back end for communication with
> STM32CubeProgrammer on stm32mp1 platform with stm32prog command.

As I've said previously - please add this use case and info to
./doc/README.dtu.

>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/dfu.c | 19 +++++++++++++++++++
>  include/dfu.h     |  2 ++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
> index 2697235c24..f12c5afc66 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -22,6 +22,22 @@ static int dfu_alt_num;
>  static int alt_num_cnt;
>  static struct hash_algo *dfu_hash_algo;
> =20
> +/*
> + * The purpose of the dfu_flush_callback() function is to
> + * provide callback for dfu user
> + */
> +__weak void dfu_flush_callback(struct dfu_entity *dfu)
> +{
> +}
> +
> +/*
> + * The purpose of the dfu_flush_callback() function is to
> + * provide callback for dfu user

Please update this repeated comment.

> + */
> +__weak void dfu_initiated_callback(struct dfu_entity *dfu)
> +{
> +}
> +
>  /*
>   * The purpose of the dfu_usb_get_reset() function is to
>   * provide information if after USB_DETACH request
> @@ -263,6 +279,7 @@ int dfu_transaction_initiate(struct dfu_entity
> *dfu, bool read) }
> =20
>  	dfu->inited =3D 1;
> +	dfu_initiated_callback(dfu);
> =20
>  	return 0;
>  }
> @@ -282,6 +299,8 @@ int dfu_flush(struct dfu_entity *dfu, void *buf,
> int size, int blk_seq_num) printf("\nDFU complete %s: 0x%08x\n",
> dfu_hash_algo->name, dfu->crc);
> =20
> +	dfu_flush_callback(dfu);
> +
>  	dfu_transaction_cleanup(dfu);
> =20
>  	return ret;
> diff --git a/include/dfu.h b/include/dfu.h
> index 4de7d35914..5d85cc35ef 100644
> --- a/include/dfu.h
> +++ b/include/dfu.h
> @@ -182,6 +182,8 @@ bool dfu_usb_get_reset(void);
>  int dfu_read(struct dfu_entity *de, void *buf, int size, int
> blk_seq_num); int dfu_write(struct dfu_entity *de, void *buf, int
> size, int blk_seq_num); int dfu_flush(struct dfu_entity *de, void
> *buf, int size, int blk_seq_num); +void dfu_flush_callback(struct
> dfu_entity *dfu); +void dfu_initiated_callback(struct dfu_entity
> *dfu);=20
>  /*
>   * dfu_defer_flush - pointer to store dfu_entity for deferred
> flashing.



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/d.FCF3sdJ92jt8EHKg6H/f9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2AuSgACgkQAR8vZIA0
zr2/4gf8C3aAzu8K54bg28kO5hFAAg4/Yom9nrBxLVI99K+tyjXw7rWc6Ma6lgR9
X8RYrIZkLwI+JiYBq3OTeMSq/51cDWgAjtMJhI+2H9k3cfLgo8QbiXIj+wD13EZQ
oMw9CcMTIiCwieWZDmDwb6NGdTnKeCSdhBLUouPuEZTIUOKmvrhKQujmmgIhUEQV
gYjpKpkQl4/eaqOPXe/ULLJoByHmmmEwggWaQ4Kyd3jneBHGoAjJEVXu1h97CB5e
CWDjmWmjZzov8EZ39x0EyfcHyNAj1ue7/c3HgdFWS2zBOMuf8D+3AEzvsItTO9e/
IOW6eSjScYPNpDZu6axNNkoCHao+XQ==
=qx02
-----END PGP SIGNATURE-----

--Sig_/d.FCF3sdJ92jt8EHKg6H/f9--

--===============5495198525634030562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5495198525634030562==--
