Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCEB4BFA
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 12:28:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D30FC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 10:28:57 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2137BC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 10:28:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46XfTy3wMFz1rQBs;
 Tue, 17 Sep 2019 12:28:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46XfTy3Xh4z1qqkH;
 Tue, 17 Sep 2019 12:28:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 4ORL_v1IcdHF; Tue, 17 Sep 2019 12:28:53 +0200 (CEST)
X-Auth-Info: QBQkFlWT5OM4cJxQJktJKFsv3cce5SAU1pmnWD5tPX0=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 17 Sep 2019 12:28:53 +0200 (CEST)
Date: Tue, 17 Sep 2019 12:28:52 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190917122852.10d8c0f0@jawa>
In-Reply-To: <20190913141930.15784-6-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-6-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 05/14] dfu: allow read with 0 data for EOF
	indication
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
Content-Type: multipart/mixed; boundary="===============4564345223805846032=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============4564345223805846032==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A4CjX1gRkTzNlqZ55ykhG+_"; protocol="application/pgp-signature"

--Sig_/A4CjX1gRkTzNlqZ55ykhG+_
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
> index 8bd5216017..50919fcae9 100644
> --- a/drivers/dfu/dfu.c
> +++ b/drivers/dfu/dfu.c
> @@ -396,6 +396,8 @@ static int dfu_read_buffer_fill(struct dfu_entity
> *dfu, void *buf, int size) debug("%s: Read error!\n", __func__);
>  				return ret;
>  			}
> +			if (dfu->b_left =3D=3D 0)
> +				break;

I guess that this is the use case for sending commands?

Could you provide a more descriptive use case for this change (the
description in the above commit message is not enough for me to get it).

>  			dfu->offset +=3D dfu->b_left;
>  			dfu->r_left -=3D dfu->b_left;
> =20



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/A4CjX1gRkTzNlqZ55ykhG+_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2AtWQACgkQAR8vZIA0
zr3swQf9EdVbY+fUfrrgfiXCvT9nb0oBvS2lp3A2raAdRBDNS4Ri4rOWxPpf4LhQ
GC5FSRIgeuXQLUhs/ZpHpHQB/EAK1nw7qwNN/tkvE2YAQxHwkruIOMGexHndenhI
Z4owiHiV0vVi1SHewh677yza3sbcEAIKmwQ3JXcd8fX8rlaj5cL7VFvrHLCTJ3yA
lgGdNwz3t7ax3Jv3V4KP8tfMhMysAQCDiPTH0rZB6rt3UJ16QncyJnK9dRQPgsGf
jPzd6++y3OkVtARrCIue1xl2XAzd5eUFmGjyHdllvBnqJ/QqTDI0gwiI9yy/WV2x
ygMwe5So3LiOsMq8Eza3J9h5cIcXvg==
=mWtJ
-----END PGP SIGNATURE-----

--Sig_/A4CjX1gRkTzNlqZ55ykhG+_--

--===============4564345223805846032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4564345223805846032==--
