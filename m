Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3759B5F4
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Aug 2019 19:58:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4402EC36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Aug 2019 17:58:30 +0000 (UTC)
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F667C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2019 17:58:28 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id c9so4342943ybf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2019 10:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bBbO0BNhne+C11kw473Eq7M6OiMc/987P3Kgw9AkPD0=;
 b=Z5A3otBYOurOjnt+nOkATdtpKOriGJsUFm1kRDqLgFTEJbqhH3SkM6e4WWFrSp69rJ
 XUivxfnlIINhXz6U2AAlqVFpOjsglD4QLnyxx/djTXjGVx7kTF93lp1LNA6qWY5gRaPq
 ty8+/ixXK+GExMxBZFVpVY9oMmoyEHl9F8mnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bBbO0BNhne+C11kw473Eq7M6OiMc/987P3Kgw9AkPD0=;
 b=k52rb1D8p/19TGRqYofRcmDB44HJAKUDINf/09VzlXFL9jeWrpVv5j6RieqzJJticv
 DvmumVw5B+66BzNyEJVfPEfEnmbAXXPl3SDKozlrglIjRgUGYh+hS0j0lboK/dMyUfiN
 aqtFGGXQqP3hxy+7428yFV3/1vfFEuIT5vwuyadwGYHT8W77+Y9buGsP922BQQLo0hmA
 sSTn5p46LCWulMDLXRvilclupXfVQPhmj907NcyQ951lto3CLuu3qjblajI2nF+k0Svq
 ewpii16oLvsb3W9pxtJ14CL/TwIhHFvx/ZsH3VbP4bEAYmWMdZXKouIhLihawby5gf+l
 F9cw==
X-Gm-Message-State: APjAAAUslrpVRM/wt+pNoTrQuRhoxqrtRdFtRX56tQJmD/6ZQlAA0VDB
 CwSxj2oMDd0QY/qKFcpptcx4iQ==
X-Google-Smtp-Source: APXvYqxSSp670PYdkZIz6CrIWECjAonOskkfGO16ctXVSBbvigPylyBxv9XVlxfL8qxA37VuR//mkA==
X-Received: by 2002:a25:742:: with SMTP id 63mr4004666ybh.52.1566583107148;
 Fri, 23 Aug 2019 10:58:27 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-39DF-5035-6A93-260D.dyn6.twc.com.
 [2606:a000:1401:82de:39df:5035:6a93:260d])
 by smtp.gmail.com with ESMTPSA id c7sm730234ywb.48.2019.08.23.10.58.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:58:25 -0700 (PDT)
Date: Fri, 23 Aug 2019 13:58:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Lukasz Majewski <lukma@denx.de>
Message-ID: <20190823175822.GA4506@bill-the-cat>
References: <20190813134731.25024-1-lukma@denx.de>
 <20190813134731.25024-5-lukma@denx.de>
MIME-Version: 1.0
In-Reply-To: <20190813134731.25024-5-lukma@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Content-Type: multipart/mixed; boundary="===============2956021929097133317=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2956021929097133317==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 03:47:31PM +0200, Lukasz Majewski wrote:
> This change allows more fine tuning of driver model based SPI support in
> SPL and TPL. It is now possible to explicitly enable/disable the DM_SPI
> support in SPL and TPL via Kconfig option.
>=20
> Before this change it was necessary to use:
>     /* SPI Flash Configs */
>     #if defined(CONFIG_SPL_BUILD)
>     #undef CONFIG_DM_SPI
>     #undef CONFIG_DM_SPI_FLASH
>     #undef CONFIG_SPI_FLASH_MTD
>     #endif
>=20
> in the ./include/configs/<board>.h, which is error prone and shall be
> avoided when we strive to switch to Kconfig.
>=20
> The goal of this patch:
>=20
> Provide distinction for DM_SPI support in both U-Boot proper and SPL (TPL=
).
> Valid use case is when U-Boot proper wants to use DM_SPI, but SPL must
> still support non DM driver.
>=20
> Another use case is the conversion of non DM/DTS SPI driver to support
> DM/DTS. When such driver needs to work in both SPL and U-Boot proper, the
> distinction is needed in Kconfig (also if SPL version of the driver
> supports OF_PLATDATA).
>=20
> In the end of the day one would have to support following use cases (in
> single driver file - e.g. mxs_spi.c):
>=20
> - U-Boot proper driver supporting DT/DTS
> - U-Boot proper driver without DT/DTS support (deprecated)
> - SPL driver without DT/DTS support
> - SPL (and TPL) driver with DT/DTS (when the SoC has enough resources to
>   run full blown DT/DTS)
> - SPL driver with DT/DTS and SPL_OF_PLATDATA (when one have constrained
>   environment with no fitImage and OF_LIBFDT support).
>=20
> Some boards do require SPI support (with DM) in SPL (TPL) and some only
> have DM_SPI{_FLASH} defined to allow compiling SPL.
>=20
> This patch converts #ifdef CONFIG_DM_SPI* to #if CONFIG_IS_ENABLED(DM_SPI)
> and provides corresponding defines in Kconfig.
>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Tested-by: Adam Ford <aford173@gmail.com> #da850-evm

Sorry I didn't bisect down to which part of the series is doing this,
but I see problems with:
ls1046ardb_sdcard ls1046ardb_qspi_spl ls1043ardb_nand ls1046aqds_tfa
ls1046aq ds_nand ls1046ardb_qspi ls1046aqds_sdcard_ifc
ls1046aqds_SECURE_BOOT ls1046aqds_sdcard_qspi ls1 046aqds_qspi
ls1043ardb_sdcard ls1043aqds_sdcard_ifc ls1046ardb_tfa
ls1046ardb_tfa_SECURE_BOOT ls1043aqds_nand ls1046aqds_lpuart
ls1046ardb_emmc ls1046aqds_tfa_SECURE_BOOT ls1046afrwy_tfa ls 1046aqds
ls1043ardb_nand_SECURE_BOOT ls1046ardb_qspi_SECURE_BOOT
ls1043aqds_sdcard_qspi

Some of which are dependency problems about SPL/SPL_DM.  I also see:
   aarch64: (for 225/225 boards) all -294.2 bss -0.0 data -11.7 rodata -72.=
5 spl/u-boot-spl:all -0.3 spl/u-boot-spl:text -0.3 text -210.0
[snip]
            ls1043ardb_nand: all -9435 data -376 rodata -2331 text -6728
            ls1043ardb_sdcard: all -9435 data -376 rodata -2331 text -6728
            ls1043aqds_sdcard_ifc: all -9435 data -376 rodata -2331 text -6=
728
            ls1043aqds_nand: all -9435 data -376 rodata -2331 text -6728
            ls1043ardb_nand_SECURE_BOOT: all -9435 data -376 rodata -2331 t=
ext -6728
            ls1043ardb_sdcard_SECURE_BOOT: all -9435 data -376 rodata -2331=
 text -6728
            ls1043aqds_sdcard_qspi: all -9436 bss -8 data -376 rodata -2324=
 text -6728

which I think means a few conversions weren't right.

--=20
Tom

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdYCk+AAoJEIf59jXTHXZSV18QAKxpBXGIv236RYMYLNOXL8T2
qlPSWB73gLJQgUro61Q034Bk+mlMKKaOsbZEU/aFAzAu1LtOvduJtVCXO2Z5wYbN
mPsUvxsf9Jmi4RyTKuoekze+k9+je5YbayhjtAxbVUe95/9d309CXwkON4Y5pTcL
9INI6AXXqaq8Z6ZZ2y+gAv1JxW+qXeMc8CpyIDy5iz0iEDx6c+GyUwyReRTnhrMp
6veSX6BCVHGrolPBFRFRDIFPswKjxIgJoronsB6LEqrySVrcK8adCPe6IwHiAvY3
Ja1+dM0dPwvCNyi+FiBgmiM9n//vGUN0BDFVJFkU4/MxsQQCoYTLvumufhqfUBHC
mQDiEdCnXt2svACuIq0xPMZI8UUyzdoKCMI4x8rDcpI3bnZZQJhROpqqy/gqxfI9
vuH78tsCBbLcqa8q2UY1Ig54f+7kbELeSC5qYmFSwTIStQeN8RRXCHsmWMGzW6jg
rT2vjgLlXlLznS3ZQxlqJJ6m9T0qO4/thyqvBG6a9rzn55/9A0vBVxZAyyHuXVUg
k9cvkvr/PKMuxreYVhICV9M7LimtDq2nMCckLKzFg6nOJg8gby76+2YnWNq1Ou7c
8EwPqkzUPwa0973qcXfFQ5IZmiYNSrmuVGrCbbevCbEbSJkSjcs1Fsfra6NQ4/Hx
W1zOfVAO0IPt+HZo+l7H
=F0VV
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--

--===============2956021929097133317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2956021929097133317==--
