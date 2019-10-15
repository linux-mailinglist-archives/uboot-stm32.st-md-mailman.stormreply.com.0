Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 147A9D75B9
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 14:03:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A4DCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 12:03:17 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E173C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 12:03:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46svFv4Lgkz1rW60;
 Tue, 15 Oct 2019 14:03:15 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46svFv31ghz1qqkD;
 Tue, 15 Oct 2019 14:03:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ceV25NCYHuPT; Tue, 15 Oct 2019 14:03:14 +0200 (CEST)
X-Auth-Info: hOXZBgLRw+9IMaqOsg2LqfsuVS+K6sO9DAfqmL41zL4=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 15 Oct 2019 14:03:13 +0200 (CEST)
Date: Tue, 15 Oct 2019 14:03:07 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>
Message-ID: <20191015140307.3940831d@jawa>
In-Reply-To: <b17362c5-f4b2-4e5b-360a-0ad026e5ed4d@denx.de>
References: <20191015094536.2c5bbb8f@jawa>
 <b17362c5-f4b2-4e5b-360a-0ad026e5ed4d@denx.de>
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
Content-Type: multipart/mixed; boundary="===============1636886188713015645=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1636886188713015645==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/P2nu3nPAmevjsuOZB9p1aVb"; protocol="application/pgp-signature"

--Sig_/P2nu3nPAmevjsuOZB9p1aVb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marek,

> On 10/15/19 9:45 AM, Lukasz Majewski wrote:
> > Dear Marek, =20
>=20
> Hello Lukasz,
>=20
> > The following changes since commit
> > 7a779ed1755c2d5011bd9598da90291f759ae760:
> >=20
> >   travis: Exclude MIPS from the bcm job (2019-10-13 11:21:56 -0400)
> >=20
> > are available in the Git repository at:
> >=20
> >   git@gitlab.denx.de:u-boot/custodians/u-boot-dfu.git=20
> >=20
> > for you to fetch changes up to
> > 5d897631065bb2f36bbc1bd7fabb670ce5da3ce8:
> >=20
> >   dfu: add callback for flush and initiated operation (2019-10-14
> >   12:26:19 +0200) =20
>=20
> Which branch shall I pull ? This information is missing from the PR,
> again :-(

Ach. I'm still (unfortunately) use my old script for PR.

You shall use the -master branch:
https://gitlab.denx.de/u-boot/custodians/u-boot-dfu/commits/master

I've written also the merge tag for this PR:
https://gitlab.denx.de/u-boot/custodians/u-boot-dfu/-/tags

Sorry for inconvenience and confusion.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/P2nu3nPAmevjsuOZB9p1aVb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2ltXsACgkQAR8vZIA0
zr3ixwgAhFXRM8BdI5hKOiNL4AlmmRRSdfPX414WdFTVv5EGlHVN607Zw9bqYiOQ
AghTyUn/KpwMiSRtCBc+tnCpV5HjQ/NaK59D7aTDUymYx7GV/fkD0eU+Vkap0iEJ
a/dv7gNYj/BqrW+26F/omhR1sRjbhIqgGT2GydzBP1QT1/YcTcQX1xoS8zBSNk00
uzradXrC0QHi+VWeTTcj2DHrHrZ2fc+HSBFc0HrPCnudG4TVFgMVMH3XkqfRdHd6
nD0Qe4ZtRrDyI6gALGErmgXdxD5ODp9cFHT8q81r3X0XM5I4isEzpTmtD1TpTUGF
c4+8XC20YIkaziaB9LV+B+4ZRTsWzw==
=Y3/K
-----END PGP SIGNATURE-----

--Sig_/P2nu3nPAmevjsuOZB9p1aVb--

--===============1636886188713015645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1636886188713015645==--
