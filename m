Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AEE39D790
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Jun 2021 10:39:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD30DC58D79;
	Mon,  7 Jun 2021 08:39:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BA25C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 08:39:53 +0000 (UTC)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 875AA814A4;
 Mon,  7 Jun 2021 10:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623055192;
 bh=3h/Hh4CbP9KuirkXpl6M1IN7n/c8vtpW6ti/CDVSoSM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ybs0i8pF+WCoAbPLsIVLGHlU4lS3MSJGoZzMqJqk8FJt836zJzzCTfvaWQ5i1aDnh
 t4abdhJkGHRKvy1M/7Mnjouw0Yi/qUC9SdaUk2DYs3qWUa2zgLrIWyozsy+kJpI6H/
 fgdR02fJWS9y7xsQ0vjYV2coJOEBsUdUms+qtiB+0HXC6ZxcaNgbuB5HxYShH02Pij
 rLdmsonubbjdR8sfpvcf18RrlFsV/vwRL7Pt2fWe8mmOaLdzTqjx2bWUgsm5d18tE5
 tYI3m+q4C7+4Jg87D65OGe3KqqwmYkUeBwwRtBeOlKwBcX6+z7vWJq7u8INCWpfaSy
 +Qf0v6mi8NTUQ==
Date: Mon, 7 Jun 2021 10:39:46 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20210607103946.5e235a20@ktm>
In-Reply-To: <0616d868-1939-e0dc-3d3a-8e4b150a95e9@foss.st.com>
References: <20210304174748.1.I1d824180669d63e22275f082e7ac0fe50c2b8646@changeid>
 <48f7454f-6bae-224c-bba3-4b24e81e800b@foss.st.com>
 <0616d868-1939-e0dc-3d3a-8e4b150a95e9@foss.st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Marek Vasut <marex@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dfu: dfu_mtd: set max_buf_size to
 erasesize also for NOR devices
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
Content-Type: multipart/mixed; boundary="===============8942506828043269689=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============8942506828043269689==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/0aL5ZImmmDTLmEN_=sfHA3t"; protocol="application/pgp-signature"

--Sig_/0aL5ZImmmDTLmEN_=sfHA3t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Thanks Patrice,
>=20
> On 4/20/21 12:24 PM, Patrice CHOTARD wrote:
> > Hi Patrick
> >
> > On 3/4/21 5:47 PM, Patrick Delaunay wrote: =20
> >> For NOR devices the logical DFU buffer size is the sector_size,
> >> as it is done in dfu_sf.c or in spi/sf_mtd.c
> >> (sf_mtd_info.erasesize =3D flash->sector_size)
> >>
> >> For NAND the DFU size was already limited to erasesize as
> >> has_pages =3D true.
> >>
> >> So the mtd dfu backend can use this erasesize for all the MTD
> >> devices, NOR and NAND with dfu->max_buf_size =3D mtd->erasesize
> >>
> >> This difference was initially copied from MTD command, where
> >> data is fully available in RAM without size limitation.
> >>
> >> This patch avoids to have many sector write in dfu_mtd.c at the end
> >> of the DFU transfer and avoids issues with USB timeout or WATCHDOG.
> >>
> >> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> >> ---
> >>
> >>   drivers/dfu/dfu_mtd.c | 5 +----
> >>   1 file changed, 1 insertion(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> >> index ca67585a7e..7efb3cbd79 100644
> >> --- a/drivers/dfu/dfu_mtd.c
> >> +++ b/drivers/dfu/dfu_mtd.c
> >> @@ -252,7 +252,6 @@ int dfu_fill_entity_mtd(struct dfu_entity
> >> *dfu, char *devstr, char *s) {
> >>   	char *st;
> >>   	struct mtd_info *mtd;
> >> -	bool has_pages;
> >>   	int ret, part;
> >>  =20
> >>   	mtd =3D get_mtd_device_nm(devstr);
> >> @@ -262,9 +261,7 @@ int dfu_fill_entity_mtd(struct dfu_entity
> >> *dfu, char *devstr, char *s)=20
> >>   	dfu->dev_type =3D DFU_DEV_MTD;
> >>   	dfu->data.mtd.info =3D mtd;
> >> -
> >> -	has_pages =3D mtd->type =3D=3D MTD_NANDFLASH || mtd->type =3D=3D
> >> MTD_MLCNANDFLASH;
> >> -	dfu->max_buf_size =3D has_pages ? mtd->erasesize : 0;
> >> +	dfu->max_buf_size =3D mtd->erasesize;
> >>  =20
> >>   	st =3D strsep(&s, " ");
> >>   	if (!strcmp(st, "raw")) {
> >> =20
> > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> >
> > Thanks
> >
> > Patrice =20
>=20
>=20
> Lukasz, any remarks on your side?
>=20
>=20
> Can I take this patch in my first STM32 pull request for v2020.10 ?

Please pull it to your tree.

>=20
> or a PR is already planed on your side ?
>=20
> http://patchwork.ozlabs.org/project/uboot/patch/20210304174748.1.I1d82418=
0669d63e22275f082e7ac0fe50c2b8646@changeid/
>=20
>=20
> Regards
>=20
> Patrick
>=20



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/0aL5ZImmmDTLmEN_=sfHA3t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmC921IACgkQAR8vZIA0
zr2Kvwf+Kl4zDARV5UuqqUjbVlOTi3lTrCKxl1PHCqpQGa09GQYxZaQKVWSxx9c0
kqgDr7WH6jqCNYRWAExspGZ/2esoUXTELDcC7zhWfyxy67MhngfdmE6rGfKNKOCs
v1Rd30rGcOOFHaMMkQWn/23n4f6QHJV6NbJchyrcYVWir6i8qjFLoP9/xt/FV6Aq
1oUkLEQn4ewiAF/9TxxSWE8NUFp96BjnUQcoJr/PEUfQWbKGZCngwyqqiKtMrKmp
jXDAca3IgYU7XBx93QLb+DwA2a7ltoaZyfSzEWfpGE5pggVCcRby4VF6zacgdY7T
GsO3PAK3Ni8JmDWvvkN7gca/OpZ9/g==
=Q5cn
-----END PGP SIGNATURE-----

--Sig_/0aL5ZImmmDTLmEN_=sfHA3t--

--===============8942506828043269689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8942506828043269689==--
