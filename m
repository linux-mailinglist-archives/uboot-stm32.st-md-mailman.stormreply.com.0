Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD58A049
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Aug 2019 16:02:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C960C35E01
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Aug 2019 14:02:59 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 584E0C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2019 14:02:58 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 466cxY3qsHz1rgj5;
 Mon, 12 Aug 2019 16:02:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 466cxY0M4bz1qqkS;
 Mon, 12 Aug 2019 16:02:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id VCnAUsuccFzu; Mon, 12 Aug 2019 16:02:53 +0200 (CEST)
X-Auth-Info: ZMhvt9cljyIw9DnUZHeXnFSLiqJu1526vnq05AL+9iI=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 12 Aug 2019 16:02:53 +0200 (CEST)
Date: Mon, 12 Aug 2019 16:02:47 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Adam Ford <aford173@gmail.com>
Message-ID: <20190812160247.7032dd85@jawa>
In-Reply-To: <CAHCN7xKhCgvO57UYZLm3bCH=dy0nNrsM2MFZyFZrH6dR139gcg@mail.gmail.com>
References: <20190812070748.7315-1-lukma@denx.de>
 <CAHCN7xKhCgvO57UYZLm3bCH=dy0nNrsM2MFZyFZrH6dR139gcg@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Mans Rullgard <mans@mansr.com>, Vignesh R <vigneshr@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Pankit Garg <pankit.garg@nxp.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Tom Rini <trini@konsulko.com>,
 Tien Fong Chee <tien.fong.chee@intel.com>, Abel Vesa <abel.vesa@nxp.com>,
 Sumit Garg <sumit.garg@nxp.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Yinbo Zhu <yinbo.zhu@nxp.com>,
 Heiko Schocher <hs@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Feng Li <feng.li_2@nxp.com>, Rajesh Bhagat <rajesh.bhagat@nxp.com>,
 Alison Wang <alison.wang@nxp.com>, Mian Yousaf Kaukab <ykaukab@suse.de>,
 York Sun <york.sun@nxp.com>, Stefano Babic <sbabic@denx.de>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Wen He <wen.he_1@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Simon Glass <sjg@chromium.org>, "Andrew F. Davis" <afd@ti.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH v1 0/4] spi: Split CONFIG_DM_SPI* to
 CONFIG_{SPL_TPL}DM_SPI*
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
Content-Type: multipart/mixed; boundary="===============0949255937422591442=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0949255937422591442==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ui7vvcl5iJpiLPgzLQHxy3R"; protocol="application/pgp-signature"

--Sig_/Ui7vvcl5iJpiLPgzLQHxy3R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Adam,

> On Mon, Aug 12, 2019 at 2:08 AM Lukasz Majewski <lukma@denx.de> wrote:
> >
> > This patch series introduces new SPL and TPL specific Kconfig
> > entries for DM_SPI* options. Such change allows using the spi
> > driver in SPL/TPL or U-Boot proper.
> >
> > First two patches - related to ls10{42}* NXP soc fix some issues
> > with defining the DM_SPI* defines in <board>.h file instead of
> > Kconfig.
> >
> > This series doesn't introduce build breaks, but board maintainers
> > are kindly asked to check if their boards still boots.
> > =20
>=20
> FYI,  when I pulled the latest u-boot/master, this patch didn't apply
> cleanly, so I ended up having to skip a few items that wouldn't impact
> the da850-evm which boots from SPI flash.

I see. I've applied it on the newest master:

SHA1: feb5a02f869d5678190dfc915ef6c2781b4f7a6c

>=20
> From what I can tell, this seems to work just fine on the da850-evm
>=20
> Tested-by: Adam Ford <aford173@gmail.com> #da850-evm
>=20

Thanks for testing :-)

> >
> >
> > Lukasz Majewski (4):
> >   kconfig: Update comment regarding CONFIG_IS_ENABLED(FOO) for TPL
> >   spi: Move DM_SPI_FLASH to Kconfig (for NXP's ls1043a)
> >   spi: Move DM_SPI_FLASH and SPI_FLASH_DATAFLASH to Kconfig (for
> >     ls1021aXXX)
> >   spi: Convert CONFIG_DM_SPI* to CONFIG_$(SPL_TPL_)DM_SPI*
> >
> >  arch/arm/Kconfig                            | 23
> > +++++++++++++++++++++-- board/l+g/vinco/vinco.c
> > |  4 ++-- cmd/sf.c                                    |  4 ++--
> >  cmd/spi.c                                   |  6 +++---
> >  common/spl/Kconfig                          | 28
> > ++++++++++++++++++++++++++++ configs/am57xx_evm_defconfig
> >      |  2 ++ configs/am57xx_hs_evm_defconfig             |  2 ++
> >  configs/am57xx_hs_evm_usb_defconfig         |  2 ++
> >  configs/axm_defconfig                       |  2 ++
> >  configs/chromebook_link64_defconfig         |  2 ++
> >  configs/chromebook_samus_tpl_defconfig      |  4 ++++
> >  configs/dra7xx_evm_defconfig                |  2 ++
> >  configs/dra7xx_hs_evm_defconfig             |  2 ++
> >  configs/dra7xx_hs_evm_usb_defconfig         |  2 ++
> >  configs/imx28_xea_defconfig                 |  2 ++
> >  configs/j721e_evm_a72_defconfig             |  2 ++
> >  configs/j721e_evm_r5_defconfig              |  2 ++
> >  configs/ls1021aiot_qspi_defconfig           |  2 ++
> >  configs/ls1021aiot_sdcard_defconfig         |  2 ++
> >  configs/ls1021aqds_qspi_defconfig           |  1 +
> >  configs/ls1021aqds_sdcard_qspi_defconfig    |  1 +
> >  configs/ls1021atwr_qspi_defconfig           |  1 +
> >  configs/sama5d2_xplained_spiflash_defconfig |  2 ++
> >  configs/sama5d3xek_spiflash_defconfig       |  7 ++++---
> >  configs/sama5d4_xplained_spiflash_defconfig |  2 ++
> >  configs/sama5d4ek_spiflash_defconfig        |  2 ++
> >  configs/stm32mp15_basic_defconfig           |  2 ++
> >  configs/taurus_defconfig                    |  2 ++
> >  drivers/mtd/spi/Makefile                    |  4 ++--
> >  drivers/mtd/spi/sf_probe.c                  |  8 ++++----
> >  drivers/net/fm/fm.c                         |  4 ++--
> >  drivers/spi/Makefile                        |  2 +-
> >  drivers/spi/atmel_spi.c                     |  4 ++--
> >  drivers/spi/davinci_spi.c                   |  6 +++---
> >  drivers/spi/fsl_dspi.c                      |  5 +++--
> >  drivers/spi/kirkwood_spi.c                  |  2 +-
> >  drivers/spi/mxc_spi.c                       |  6 +++---
> >  drivers/spi/omap3_spi.c                     |  4 ++--
> >  drivers/spi/sh_qspi.c                       |  4 ++--
> >  env/sf.c                                    |  2 +-
> >  include/configs/ls1021aiot.h                |  6 ------
> >  include/configs/ls1021aqds.h                |  8 --------
> >  include/configs/ls1021atwr.h                |  5 -----
> >  include/configs/ls1043a_common.h            |  2 --
> >  include/linux/kconfig.h                     |  2 ++
> >  include/spi.h                               |  8 ++++----
> >  include/spi_flash.h                         |  2 +-
> >  test/dm/spi.c                               |  2 +-
> >  48 files changed, 137 insertions(+), 64 deletions(-)
> >
> > --
> > 2.11.0
> > =20



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/Ui7vvcl5iJpiLPgzLQHxy3R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl1RcYcACgkQAR8vZIA0
zr1+YQf/WfSdh8LY9u7JZwfp2/VahCqQhlgOWlBYmPX6amIqIR0Jf5vHgVn6i+sv
41TpSmDEXvGTN0m7d1IKXEVPP9ZGymG8fjmtWBabJK5z2B0OtVzTdo6QVYV5dsnl
VynD+d2wS8UWI9QRcqCc5vJ/2YPp8TmHeyXJjyBzv4UxRgpS7Wp5YoTfTtSvb+Qw
33MjN0FhtlSxKaBtxTIv+sBsrD8qCuK4ZfKWeFDaskY2cov+LMekGv6PjoOCT1i1
AzT+fwPfbxhBjSTjfCqdRi3SAfUCeESmQ6uRQ6m5qDuV0ny7ntcvJ5++M9HM92/X
w4OWkdZgsabE0DLFcpq0B85cRtmgXg==
=brWe
-----END PGP SIGNATURE-----

--Sig_/Ui7vvcl5iJpiLPgzLQHxy3R--

--===============0949255937422591442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0949255937422591442==--
