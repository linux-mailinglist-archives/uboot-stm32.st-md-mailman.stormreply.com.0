Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF416FAD1
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 09:57:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31BEACC213B
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 07:57:24 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C2DACC213A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 07:57:22 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45sYqP0Rftz1rW6B;
 Mon, 22 Jul 2019 09:57:21 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45sYqN6yB8z1qqkJ;
 Mon, 22 Jul 2019 09:57:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id QMO5OU1KqgY5; Mon, 22 Jul 2019 09:57:19 +0200 (CEST)
X-Auth-Info: H6mhlrVn9XH80QaAeKbtmtq1IoEgvZETFsER1AitlL0=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Jul 2019 09:57:19 +0200 (CEST)
Date: Mon, 22 Jul 2019 09:57:18 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190722095718.18fae749@jawa>
In-Reply-To: <1563541046-6432-4-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
 <1563541046-6432-4-git-send-email-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 03/14] dfu: prepare the support of
 multiple interface
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
Content-Type: multipart/mixed; boundary="===============5620104042069934417=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============5620104042069934417==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mjUrr8u8qmkz7Sr+.oyrLsG"; protocol="application/pgp-signature"

--Sig_/mjUrr8u8qmkz7Sr+.oyrLsG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Split the function dfu_config_entities with 2 new functions
> - dfu_alt_init
> - dfu_alt_add

Ok.

>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/dfu.c | 51
> +++++++++++++++++++++++++++++++++++++++------------ include/dfu.h
> |  2 ++ 2 files changed, 41 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
> index eb3a3c6..79a652e 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -438,13 +438,12 @@ void dfu_free_entities(void)
>  	alt_num_cnt =3D 0;
>  }
> =20
> -int dfu_config_entities(char *env, char *interface, char *devstr)
> +int dfu_alt_init(int num, struct dfu_entity **dfu)
>  {
> -	struct dfu_entity *dfu;
> -	int i, ret;
>  	char *s;
> +	int ret;
> =20
> -	dfu_alt_num =3D dfu_find_alt_num(env);
> +	dfu_alt_num =3D num;
>  	debug("%s: dfu_alt_num=3D%d\n", __func__, dfu_alt_num);
> =20
>  	dfu_hash_algo =3D NULL;
> @@ -455,21 +454,49 @@ int dfu_config_entities(char *env, char
> *interface, char *devstr) pr_err("Hash algorithm %s not supported\n",
> s); }
> =20
> -	dfu =3D calloc(sizeof(*dfu), dfu_alt_num);
> -	if (!dfu)
> +	*dfu =3D calloc(sizeof(struct dfu_entity), dfu_alt_num);
> +	if (!*dfu)
> +		return -1;

I'm aware that the dfu.c file in some places uses -1 or -<errno> as
return value.

I would prefer that with new code we shall add -<errno>. In this
particular case it would be -ENOMEM=20

> +
> +	return 0;
> +}
> +
> +int dfu_alt_add(struct dfu_entity *dfu, char *interface, char
> *devstr, char *s) +{
> +	struct dfu_entity *p_dfu;
> +	int ret;
> +
> +	if (alt_num_cnt >=3D dfu_alt_num)
> +		return -1;
> +
> +	p_dfu =3D &dfu[alt_num_cnt];
> +	ret =3D dfu_fill_entity(p_dfu, s, alt_num_cnt, interface,
> devstr);
> +	if (ret)
>  		return -1;
> -	for (i =3D 0; i < dfu_alt_num; i++) {
> =20
> +	list_add_tail(&p_dfu->list, &dfu_list);
> +	alt_num_cnt++;
> +
> +	return 0;
> +}
> +
> +int dfu_config_entities(char *env, char *interface, char *devstr)
> +{
> +	struct dfu_entity *dfu;
> +	int i, ret;
> +	char *s;
> +
> +	ret =3D dfu_alt_init(dfu_find_alt_num(env), &dfu);
> +	if (ret)
> +		return -1;
> +
> +	for (i =3D 0; i < dfu_alt_num; i++) {
>  		s =3D strsep(&env, ";");
> -		ret =3D dfu_fill_entity(&dfu[i], s, alt_num_cnt,
> interface,
> -				      devstr);
> +		ret =3D dfu_alt_add(dfu, interface, devstr, s);
>  		if (ret) {
>  			/* We will free "dfu" in dfu_free_entities()
> */ return -1;
>  		}
> -
> -		list_add_tail(&dfu[i].list, &dfu_list);
> -		alt_num_cnt++;
>  	}
> =20
>  	return 0;
> diff --git a/include/dfu.h b/include/dfu.h
> index bf51ab7..7d60ffc 100644
> --- a/include/dfu.h
> +++ b/include/dfu.h
> @@ -143,6 +143,8 @@ struct dfu_entity {
>  #ifdef CONFIG_SET_DFU_ALT_INFO
>  void set_dfu_alt_info(char *interface, char *devstr);
>  #endif
> +int dfu_alt_init(int num, struct dfu_entity **dfu);
> +int dfu_alt_add(struct dfu_entity *dfu, char *interface, char
> *devstr, char *s); int dfu_config_entities(char *s, char *interface,
> char *devstr); void dfu_free_entities(void);
>  void dfu_show_entities(void);




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/mjUrr8u8qmkz7Sr+.oyrLsG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl01bF4ACgkQAR8vZIA0
zr2B4AgA5bBwcJPz1DYmJ00mI+1HvKcvxZSx4SBW4JSE3N3uA3PmxoK5tqwPfy8o
LUQQuOmuZilgRVmzD3aKok+wU/Y3GgsTJ8FV3tyGSHVIUibbyhv6qvEpM/ISEoYJ
n2zNGgzP+3Tvqgm9b6A4aPEr/ta7Oj5+Dj7WsVDek0i61e45HPaR6ctJlMz180Zp
CdyM5OrNiRp8kPqgn3dyq2xW3rN23pUI7gsEV3y7CTBGoHXUy6/nzrHjt2Rz6UCc
RWcNNJBsmMkIGwDRuIMD8ZzU4a7vnm0J7M3Tm7QrG5T+f/5Ao6zR/BOGQ34sTYv+
nyXETZDWCQCCGD2B3OsIZlukZ+Vd/Q==
=IXVe
-----END PGP SIGNATURE-----

--Sig_/mjUrr8u8qmkz7Sr+.oyrLsG--

--===============5620104042069934417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5620104042069934417==--
