Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA4EE7708
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Oct 2019 17:51:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 664CCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Oct 2019 16:51:54 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE574C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2019 16:51:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47212w4V78z1rD9j;
 Mon, 28 Oct 2019 17:51:52 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47212w3pSdz1qqkd;
 Mon, 28 Oct 2019 17:51:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id o7LzvLmE2zNI; Mon, 28 Oct 2019 17:51:50 +0100 (CET)
X-Auth-Info: IZHYw+LNAFwtwkaM4uTUVdhH43EQVn66UsoXyd3/+XI=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 28 Oct 2019 17:51:50 +0100 (CET)
Date: Mon, 28 Oct 2019 17:51:44 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>
Message-ID: <20191028175144.5718cd05@jawa>
In-Reply-To: <20191015140307.3940831d@jawa>
References: <20191015094536.2c5bbb8f@jawa>
 <b17362c5-f4b2-4e5b-360a-0ad026e5ed4d@denx.de>
 <20191015140307.3940831d@jawa>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Ralph Siemsen <ralph.siemsen@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [GIT] Pull request: u-boot-dfu (15.10.2019)
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
Content-Type: multipart/mixed; boundary="===============1410810842000375775=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1410810842000375775==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/tNqzSY_CJXIxBs90t7pWRh4"; protocol="application/pgp-signature"

--Sig_/tNqzSY_CJXIxBs90t7pWRh4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marek,

> Hi Marek,
>=20
> > On 10/15/19 9:45 AM, Lukasz Majewski wrote: =20
> > > Dear Marek,   =20
> >=20
> > Hello Lukasz,
> >  =20
> > > The following changes since commit
> > > 7a779ed1755c2d5011bd9598da90291f759ae760:
> > >=20
> > >   travis: Exclude MIPS from the bcm job (2019-10-13 11:21:56
> > > -0400)
> > >=20
> > > are available in the Git repository at:
> > >=20
> > >   git@gitlab.denx.de:u-boot/custodians/u-boot-dfu.git=20
> > >=20
> > > for you to fetch changes up to
> > > 5d897631065bb2f36bbc1bd7fabb670ce5da3ce8:
> > >=20
> > >   dfu: add callback for flush and initiated operation (2019-10-14
> > >   12:26:19 +0200)   =20
> >=20
> > Which branch shall I pull ? This information is missing from the PR,
> > again :-( =20
>=20
> Ach. I'm still (unfortunately) use my old script for PR.
>=20
> You shall use the -master branch:
> https://gitlab.denx.de/u-boot/custodians/u-boot-dfu/commits/master
>=20
> I've written also the merge tag for this PR:
> https://gitlab.denx.de/u-boot/custodians/u-boot-dfu/-/tags
>=20
> Sorry for inconvenience and confusion.

Marek, are there any issues with this PR?=20

Unfortunately, I did not noticed it being applied to your u-boot-usb
tree. Do you need any help?

>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/tNqzSY_CJXIxBs90t7pWRh4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl23HKAACgkQAR8vZIA0
zr2MGgf/ePx5hy2nie9LAKOAz2NDoZhpubImyTEB8rRyr1wPavYQOdum8Qc5m8JX
JiDcLz1NOH7/PYWacrXEcUYbZWirQxPVpYRBJqMIhu8J3QnVRuVmysa9xnB60/gb
xktvyi/h2bu9EpI5puSrZXpJFI1cVNmRsAzRiEkqu9wu0BFchEskpdJdnebtoZ25
KZkDd+1Z3p0iCtNgexBo/1luGVuLZkPiSnpbKbAzlpm49vWtL12Rj0UsXFlzDaew
zmfP9MehqKNrJo/CjcjCNV0H1aSKOcgM3oUTcwx0euLiFOrpENqT3R1muWDzI+So
SB95p3NjhVpZttdIH6NNcf0svYgaGg==
=SGgX
-----END PGP SIGNATURE-----

--Sig_/tNqzSY_CJXIxBs90t7pWRh4--

--===============1410810842000375775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1410810842000375775==--
