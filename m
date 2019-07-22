Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A406FB44
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 10:27:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1779ECC2676
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 08:27:11 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1687BCC2673
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 08:27:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45sZTn3XnVz1rXQg;
 Mon, 22 Jul 2019 10:27:09 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45sZTn2spnz1qqkD;
 Mon, 22 Jul 2019 10:27:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id yjiKBkamDENV; Mon, 22 Jul 2019 10:27:08 +0200 (CEST)
X-Auth-Info: V2t0FbuPmwgSqnpgVcmsKLV0RMFvE8cGwdj03ow6/5k=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Jul 2019 10:27:08 +0200 (CEST)
Date: Mon, 22 Jul 2019 10:27:07 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>, Heiko Schocher <hs@denx.de>
Message-ID: <20190722102707.2f19e2f8@jawa>
In-Reply-To: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 00/14] dfu: update dfu stack and use
 them for stm32mp1
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
Content-Type: multipart/mixed; boundary="===============1417761978691765281=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1417761978691765281==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/U0KwlDTqap0sN/.aEXb6B_n"; protocol="application/pgp-signature"

--Sig_/U0KwlDTqap0sN/.aEXb6B_n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> This serie based on v2019.07 propose some update on the DFU stack:
> - add capability to have several DFU backend running in parallel
> - add MTD backend for NAND, NOR or SPI-NAND
> - add VIRTUAL backend for board/command specific behavior
> - add some weak callback
>=20
> To test the feature and as example, I update the stm32mp1
> to use the new features (tested with command "dfu 0")
>=20
> This serie prepares the DFU backend for communication with
> STM32CubeProgrammer on stm32mp1 platform (stm32prog command).
> This STMicroelectronics tool is based on DFU protocol and
> update the boot devices and the OTPs on the ST boards.
>=20

Thanks for such great enhancement on DFU. I've added Heiko to CC, so he
also would be aware of your work (as some of his boards use DFU for
update).

Please add detailed documentation entry (as I've indicated in other
patches reviewed) for above features.

The roadmap:

- Please send v1 (without RFC). (Please run buildman on several siemens
  and trats/trats2/odroid-x* boards)

- I will test it on odroid-XU3 (and probably Heiko would test it for
  regression).





A side question - would you need in some point updating envs via DFU
(no matter if those would be a whole image created with mkimage or an
individual one) ?

>=20
>=20
> Patrick Delaunay (14):
>   dfu: cosmetic: cleanup sf to avoid checkpatch error
>   dfu: sf: add partition support for nor backend
>   dfu: prepare the support of multiple interface
>   dfu: allow to manage DFU on several devices
>   dfu: allow read with 0 data for EOF indication
>   dfu: add backend for MTD device
>   dfu: add partition support for MTD backend
>   dfu: add DFU virtual backend
>   dfu: add callback for flush and initiated operation
>   stm32mp1: activate DFU support and command MTD
>   stm32mp1: activate SET_DFU_ALT_INFO
>   stp32mp1: configs: activate CONFIG_MTD_SPI_NAND
>   stm32mp1: board: add spi nand support
>   stm32mp1: add support for virtual partition read
>=20
>  board/st/stm32mp1/README            | 111 +++++++++++++
>  board/st/stm32mp1/stm32mp1.c        | 165 ++++++++++++++++++-
>  cmd/dfu.c                           |  21 ++-
>  configs/stm32mp15_basic_defconfig   |   6 +
>  configs/stm32mp15_trusted_defconfig |   6 +
>  drivers/dfu/Kconfig                 |  13 ++
>  drivers/dfu/Makefile                |   2 +
>  drivers/dfu/dfu.c                   | 145 +++++++++++++++--
>  drivers/dfu/dfu_mtd.c               | 306
> ++++++++++++++++++++++++++++++++++++
> drivers/dfu/dfu_sf.c                |  55 ++++++-
> drivers/dfu/dfu_virt.c              |  49 ++++++
> include/configs/stm32mp1.h          |  38 ++++-
> include/dfu.h                       |  51 ++++++ 13 files changed,
> 939 insertions(+), 29 deletions(-) create mode 100644
> drivers/dfu/dfu_mtd.c create mode 100644 drivers/dfu/dfu_virt.c
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/U0KwlDTqap0sN/.aEXb6B_n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl01c1sACgkQAR8vZIA0
zr03twf/fgtdR0TD5+JYUegAH3eqRIY0Tekaf0Dw6b/iS1L34DqZDj4GPsZfEIxr
NDLfgTz0u8qDMfoHOBg5rJNs40JKnOOWMPFYk+2cTcLv7Grgug0iOSDKaJQm3BJ2
cuaI0F4TXYRfvrHG0ULPvkGR4u+Y1uCW0yiKY8DK1XG8WutfImJ5a4G+QONSYs8s
ejGil9RHb6bxiXmbieFwYZV/B8s5z+RdOMFta0Ikk/cpJxc7lJnQ3aNeEVhwWL4s
hUkM6XL0ejXvKb1Wr4SCx29N/3sOP1o2657NredGdpvDUVJ79f0P1zLe65eQCZVJ
Jkl/g2Bfs5qiBm3fUO7wbN3o4tOVPg==
=HTh8
-----END PGP SIGNATURE-----

--Sig_/U0KwlDTqap0sN/.aEXb6B_n--

--===============1417761978691765281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1417761978691765281==--
