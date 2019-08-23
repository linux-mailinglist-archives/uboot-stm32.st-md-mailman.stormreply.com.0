Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC09B7F9
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Aug 2019 23:02:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B72C5C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Aug 2019 21:02:39 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25411C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2019 21:02:37 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46FYkj18fsz1rGRp;
 Fri, 23 Aug 2019 23:02:37 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46FYkh6rDMz1qqkC;
 Fri, 23 Aug 2019 23:02:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id NRLmIaLPXcWm; Fri, 23 Aug 2019 23:02:35 +0200 (CEST)
X-Auth-Info: UHYSPVncWZa9ZeinqrTEpdXxGZ5hnZ/PoD3RGRvTPNo=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 23 Aug 2019 23:02:34 +0200 (CEST)
Date: Fri, 23 Aug 2019 23:02:27 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20190823230227.0f3bc971@jawa>
In-Reply-To: <20190823175822.GA4506@bill-the-cat>
References: <20190813134731.25024-1-lukma@denx.de>
 <20190813134731.25024-5-lukma@denx.de>
 <20190823175822.GA4506@bill-the-cat>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Feng Li <feng.li_2@nxp.com>, Tien Fong Chee <tien.fong.chee@intel.com>,
 u-boot@lists.denx.de, Sumit Garg <sumit.garg@nxp.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Alison Wang <alison.wang@nxp.com>, Pankit Garg <pankit.garg@nxp.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Yinbo Zhu <yinbo.zhu@nxp.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 York Sun <york.sun@nxp.com>, Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 4/4] spi: Convert
 CONFIG_DM_SPI* to CONFIG_$(SPL_TPL_)DM_SPI*
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
Content-Type: multipart/mixed; boundary="===============6237456159176615504=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============6237456159176615504==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FjgcZA=A81m/QSD80nu7uVi"; protocol="application/pgp-signature"

--Sig_/FjgcZA=A81m/QSD80nu7uVi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tom,

> On Tue, Aug 13, 2019 at 03:47:31PM +0200, Lukasz Majewski wrote:
> > This change allows more fine tuning of driver model based SPI
> > support in SPL and TPL. It is now possible to explicitly
> > enable/disable the DM_SPI support in SPL and TPL via Kconfig option.
> >=20
> > Before this change it was necessary to use:
> >     /* SPI Flash Configs */
> >     #if defined(CONFIG_SPL_BUILD)
> >     #undef CONFIG_DM_SPI
> >     #undef CONFIG_DM_SPI_FLASH
> >     #undef CONFIG_SPI_FLASH_MTD
> >     #endif
> >=20
> > in the ./include/configs/<board>.h, which is error prone and shall
> > be avoided when we strive to switch to Kconfig.
> >=20
> > The goal of this patch:
> >=20
> > Provide distinction for DM_SPI support in both U-Boot proper and
> > SPL (TPL). Valid use case is when U-Boot proper wants to use
> > DM_SPI, but SPL must still support non DM driver.
> >=20
> > Another use case is the conversion of non DM/DTS SPI driver to
> > support DM/DTS. When such driver needs to work in both SPL and
> > U-Boot proper, the distinction is needed in Kconfig (also if SPL
> > version of the driver supports OF_PLATDATA).
> >=20
> > In the end of the day one would have to support following use cases
> > (in single driver file - e.g. mxs_spi.c):
> >=20
> > - U-Boot proper driver supporting DT/DTS
> > - U-Boot proper driver without DT/DTS support (deprecated)
> > - SPL driver without DT/DTS support
> > - SPL (and TPL) driver with DT/DTS (when the SoC has enough
> > resources to run full blown DT/DTS)
> > - SPL driver with DT/DTS and SPL_OF_PLATDATA (when one have
> > constrained environment with no fitImage and OF_LIBFDT support).
> >=20
> > Some boards do require SPI support (with DM) in SPL (TPL) and some
> > only have DM_SPI{_FLASH} defined to allow compiling SPL.
> >=20
> > This patch converts #ifdef CONFIG_DM_SPI* to #if
> > CONFIG_IS_ENABLED(DM_SPI) and provides corresponding defines in
> > Kconfig.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > Tested-by: Adam Ford <aford173@gmail.com> #da850-evm =20
>=20
> Sorry I didn't bisect down to which part of the series is doing this,
> but I see problems with:
> ls1046ardb_sdcard ls1046ardb_qspi_spl ls1043ardb_nand ls1046aqds_tfa
> ls1046aq ds_nand ls1046ardb_qspi ls1046aqds_sdcard_ifc
> ls1046aqds_SECURE_BOOT ls1046aqds_sdcard_qspi ls1 046aqds_qspi
> ls1043ardb_sdcard ls1043aqds_sdcard_ifc ls1046ardb_tfa
> ls1046ardb_tfa_SECURE_BOOT ls1043aqds_nand ls1046aqds_lpuart
> ls1046ardb_emmc ls1046aqds_tfa_SECURE_BOOT ls1046afrwy_tfa ls 1046aqds
> ls1043ardb_nand_SECURE_BOOT ls1046ardb_qspi_SECURE_BOOT
> ls1043aqds_sdcard_qspi
>=20
> Some of which are dependency problems about SPL/SPL_DM.  I also see:
>    aarch64: (for 225/225 boards) all -294.2 bss -0.0 data -11.7
> rodata -72.5 spl/u-boot-spl:all -0.3 spl/u-boot-spl:text -0.3 text
> -210.0 [snip] ls1043ardb_nand: all -9435 data -376 rodata -2331 text
> -6728 ls1043ardb_sdcard: all -9435 data -376 rodata -2331 text -6728
>             ls1043aqds_sdcard_ifc: all -9435 data -376 rodata -2331
> text -6728 ls1043aqds_nand: all -9435 data -376 rodata -2331 text
> -6728 ls1043ardb_nand_SECURE_BOOT: all -9435 data -376 rodata -2331
> text -6728 ls1043ardb_sdcard_SECURE_BOOT: all -9435 data -376 rodata
> -2331 text -6728 ls1043aqds_sdcard_qspi: all -9436 bss -8 data -376
> rodata -2324 text -6728
>=20
> which I think means a few conversions weren't right.

It looks like some parts of the SPL are not build ....

Is the delta of size available from travis-CI or from any other script
(maybe there is some buildman switch)?

>=20



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/FjgcZA=A81m/QSD80nu7uVi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl1gVGQACgkQAR8vZIA0
zr17wQf/QYACtjqAGmZKENxUlxRtXa3tZBSx9WClr655X4BGtMev6zxYBLMhN39x
HZwTbJVMNVw8aMbKsQweZenbUqs5q6Nd9ceGTXH1ITohZ8l8KvqPrQVwc0iPD3tO
p7Enm0gF/O7d8O4ne6xuAHFiV3xOrezN9FzMPp/7+ucTfruj76SpVz79hLdhHUDK
v7icxGgJqbCH9n8d+OuQlsZgZPhkRmf8EN2bKZetQT38ZNAU8caHFLpSG+1f39FL
YIzOexKUk5n3Ax9595emKamiNCbvL+1nI0TOl+m1r9EKyNR0slrytNK8g+tOahZ9
HZ8lWJOv05FBrJq/2wgmj/Pc0CKPMA==
=TKPg
-----END PGP SIGNATURE-----

--Sig_/FjgcZA=A81m/QSD80nu7uVi--

--===============6237456159176615504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6237456159176615504==--
