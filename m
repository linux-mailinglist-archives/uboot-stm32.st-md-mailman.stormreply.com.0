Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6446FAE4
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 10:05:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F23CC215D
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 08:05:49 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FABDCC215C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 08:05:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45sZ175RZGz1rKXw;
 Mon, 22 Jul 2019 10:05:47 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45sZ1755m7z1qqkD;
 Mon, 22 Jul 2019 10:05:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id REa_xGa8GiOe; Mon, 22 Jul 2019 10:05:46 +0200 (CEST)
X-Auth-Info: 43ruWB+E1YOF9qtUDi413kAAHaDgixDJsiRoHn1oEiY=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Jul 2019 10:05:46 +0200 (CEST)
Date: Mon, 22 Jul 2019 10:05:45 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190722100545.77881bb8@jawa>
In-Reply-To: <1563541046-6432-6-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
 <1563541046-6432-6-git-send-email-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [RFC PATCH 05/14] dfu: allow read with 0 data for
 EOF indication
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
Content-Type: multipart/mixed; boundary="===============2435516496121341982=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============2435516496121341982==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WRLnWUR=+miWOm8e1du4LUz"; protocol="application/pgp-signature"

--Sig_/WRLnWUR=+miWOm8e1du4LUz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> This patch allows into the DFU backend to indicate that there is no
> remaining data (for EOF for example). That allows users to read a
> buffer greater than the device size; the dfu stack stops the read
> request when the backend return a length=3D0 without error.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  drivers/dfu/dfu.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
> index 01ec690..bcfa170 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -395,6 +395,8 @@ static int dfu_read_buffer_fill(struct dfu_entity
> *dfu, void *buf, int size) debug("%s: Read error!\n", __func__);
>  				return ret;
>  			}
> +			if (dfu->b_left =3D=3D 0)
> +				break;
>  			dfu->offset +=3D dfu->b_left;
>  			dfu->r_left -=3D dfu->b_left;
> =20

Reviewed-by: Lukasz Majewski <lukma@denx.de>


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/WRLnWUR=+miWOm8e1du4LUz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl01bloACgkQAR8vZIA0
zr1FuQf/VnZ/UVj+/dtFyARGe7Vd3c1klnvz2kIkFgB7W8E49cdRhSqk0XoBnpSL
SJ9rb23V/0DCFf11o/L3ggzEF3hAtVZkOAVSLsmz84UjA9cVxy0O6MQOgKGilnHT
Se7vNr2el/kUotEGb2do12XlzMg5cMt3Esyr54ASsmY5zebXRh2n6axGyBKeYMO9
GyTf7zTVWWY0HLreugI6EpR5D9qrRaAaOtlHCQu0R5LyrarPkYztA+fvJAyK+CMa
+MSnvHBlqhjVVquNrQSpKxVR74LKY75Ok7LmbU/G05HPdmMWXDANuMnHfJzh/jhz
iAMuBZ6yb4nWjVw9bJN26XSCZlLK5g==
=4Qor
-----END PGP SIGNATURE-----

--Sig_/WRLnWUR=+miWOm8e1du4LUz--

--===============2435516496121341982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2435516496121341982==--
