Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DACF9B802
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Aug 2019 23:05:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5A10C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Aug 2019 21:05:25 +0000 (UTC)
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85CD8C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2019 21:05:24 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id e65so4385181ywh.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2019 14:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0QoFjfj/lzeKfVu/PKsQRzFKdld48/Fjw9vocs0qvbY=;
 b=FZJblkh/bMEK8IQGTmJn8E5bJmsuxKbLKO6WzbpdE+9kJqfxv49617rCEKrqT72qHp
 +XB9YeLkN6Hd09+brL2XPGPhMRh5f/YvBbsLFlSWcxIVdCunulgbNCMeqwZ6ocNheGmV
 q19NK2KbvTZcGY7AiQo0FTNa0jRulxDZ3r9Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0QoFjfj/lzeKfVu/PKsQRzFKdld48/Fjw9vocs0qvbY=;
 b=U5UDewj3TD0Epvxf+h/LkpZEDdPLzhZ1GCbmidk3Y6aYb1i0zD87zNVePKwNG/WsQ6
 d6c8UHgA9yiH+pURawhTeEPuvefJJz1Ih8VYtB3UXEccWx3QRaBWswF+eI0F1W947whR
 U88sAac3j7zF5Sb/QWnrAzTw7KoDGFlWtf6pG5mW6lFnfYF96U+Eru02Fyy0pZi9k1GH
 aIQwPqJyzVgIP9um1oawTZ4+VqSn4bZDBP24rTl5bCypj6HaT4lvdXBngrGjMnm94gX/
 ejDvvc8+ONizDIMaiS9oTCdJ3IYeyRjnRQI5qBBOzNn01pMp1kx56ki3K6Cq25/7COL9
 E6dQ==
X-Gm-Message-State: APjAAAVsPho//Of0e8/9lU2hWLDo2wZTIFpXZU0+Ybq8B0MOWWHr4fE+
 GeETFzHpXEWaFP4yFyJq8wkcPw==
X-Google-Smtp-Source: APXvYqxakGstQt/ahbA8Y8orYVs134dCXGQ2qaYkIFLlP8N2gj2MQHYFBrWWFj8453IMdRjY6MitCA==
X-Received: by 2002:a81:3249:: with SMTP id y70mr4777783ywy.40.1566594323163; 
 Fri, 23 Aug 2019 14:05:23 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-39DF-5035-6A93-260D.dyn6.twc.com.
 [2606:a000:1401:82de:39df:5035:6a93:260d])
 by smtp.gmail.com with ESMTPSA id r20sm796975ywe.41.2019.08.23.14.05.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 14:05:22 -0700 (PDT)
Date: Fri, 23 Aug 2019 17:05:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Lukasz Majewski <lukma@denx.de>
Message-ID: <20190823210518.GB26850@bill-the-cat>
References: <20190813134731.25024-1-lukma@denx.de>
 <20190813134731.25024-5-lukma@denx.de>
 <20190823175822.GA4506@bill-the-cat> <20190823230227.0f3bc971@jawa>
MIME-Version: 1.0
In-Reply-To: <20190823230227.0f3bc971@jawa>
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
Content-Type: multipart/mixed; boundary="===============3439156778336706578=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3439156778336706578==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2019 at 11:02:27PM +0200, Lukasz Majewski wrote:
> Hi Tom,
>=20
> > On Tue, Aug 13, 2019 at 03:47:31PM +0200, Lukasz Majewski wrote:
> > > This change allows more fine tuning of driver model based SPI
> > > support in SPL and TPL. It is now possible to explicitly
> > > enable/disable the DM_SPI support in SPL and TPL via Kconfig option.
> > >=20
> > > Before this change it was necessary to use:
> > >     /* SPI Flash Configs */
> > >     #if defined(CONFIG_SPL_BUILD)
> > >     #undef CONFIG_DM_SPI
> > >     #undef CONFIG_DM_SPI_FLASH
> > >     #undef CONFIG_SPI_FLASH_MTD
> > >     #endif
> > >=20
> > > in the ./include/configs/<board>.h, which is error prone and shall
> > > be avoided when we strive to switch to Kconfig.
> > >=20
> > > The goal of this patch:
> > >=20
> > > Provide distinction for DM_SPI support in both U-Boot proper and
> > > SPL (TPL). Valid use case is when U-Boot proper wants to use
> > > DM_SPI, but SPL must still support non DM driver.
> > >=20
> > > Another use case is the conversion of non DM/DTS SPI driver to
> > > support DM/DTS. When such driver needs to work in both SPL and
> > > U-Boot proper, the distinction is needed in Kconfig (also if SPL
> > > version of the driver supports OF_PLATDATA).
> > >=20
> > > In the end of the day one would have to support following use cases
> > > (in single driver file - e.g. mxs_spi.c):
> > >=20
> > > - U-Boot proper driver supporting DT/DTS
> > > - U-Boot proper driver without DT/DTS support (deprecated)
> > > - SPL driver without DT/DTS support
> > > - SPL (and TPL) driver with DT/DTS (when the SoC has enough
> > > resources to run full blown DT/DTS)
> > > - SPL driver with DT/DTS and SPL_OF_PLATDATA (when one have
> > > constrained environment with no fitImage and OF_LIBFDT support).
> > >=20
> > > Some boards do require SPI support (with DM) in SPL (TPL) and some
> > > only have DM_SPI{_FLASH} defined to allow compiling SPL.
> > >=20
> > > This patch converts #ifdef CONFIG_DM_SPI* to #if
> > > CONFIG_IS_ENABLED(DM_SPI) and provides corresponding defines in
> > > Kconfig.
> > >=20
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > Tested-by: Adam Ford <aford173@gmail.com> #da850-evm =20
> >=20
> > Sorry I didn't bisect down to which part of the series is doing this,
> > but I see problems with:
> > ls1046ardb_sdcard ls1046ardb_qspi_spl ls1043ardb_nand ls1046aqds_tfa
> > ls1046aq ds_nand ls1046ardb_qspi ls1046aqds_sdcard_ifc
> > ls1046aqds_SECURE_BOOT ls1046aqds_sdcard_qspi ls1 046aqds_qspi
> > ls1043ardb_sdcard ls1043aqds_sdcard_ifc ls1046ardb_tfa
> > ls1046ardb_tfa_SECURE_BOOT ls1043aqds_nand ls1046aqds_lpuart
> > ls1046ardb_emmc ls1046aqds_tfa_SECURE_BOOT ls1046afrwy_tfa ls 1046aqds
> > ls1043ardb_nand_SECURE_BOOT ls1046ardb_qspi_SECURE_BOOT
> > ls1043aqds_sdcard_qspi
> >=20
> > Some of which are dependency problems about SPL/SPL_DM.  I also see:
> >    aarch64: (for 225/225 boards) all -294.2 bss -0.0 data -11.7
> > rodata -72.5 spl/u-boot-spl:all -0.3 spl/u-boot-spl:text -0.3 text
> > -210.0 [snip] ls1043ardb_nand: all -9435 data -376 rodata -2331 text
> > -6728 ls1043ardb_sdcard: all -9435 data -376 rodata -2331 text -6728
> >             ls1043aqds_sdcard_ifc: all -9435 data -376 rodata -2331
> > text -6728 ls1043aqds_nand: all -9435 data -376 rodata -2331 text
> > -6728 ls1043ardb_nand_SECURE_BOOT: all -9435 data -376 rodata -2331
> > text -6728 ls1043ardb_sdcard_SECURE_BOOT: all -9435 data -376 rodata
> > -2331 text -6728 ls1043aqds_sdcard_qspi: all -9436 bss -8 data -376
> > rodata -2324 text -6728
> >=20
> > which I think means a few conversions weren't right.
>=20
> It looks like some parts of the SPL are not build ....

Yes, there's some dependency problem Kconfig is spotting related to
SPL/SPL_DM.

> Is the delta of size available from travis-CI or from any other script
> (maybe there is some buildman switch)?

Yes, it's part of buildman.  I do:
$ export SOURCE_DATE_EPOCH=3D`date +%s`
$ ./tools/buildman/buildman -o  /tmp/test --step 0 -b origin/master.. --for=
ce-build -CveE
$ ./tools/buildman/buildman -o  /tmp/test --step 0 -b origin/master.. -Ssdel

to get size changes between point A and point Z in a branch, and omit
--step 0 when I need to see which patch in between them caused the size
change.

--=20
Tom

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdYFUOAAoJEIf59jXTHXZSzG0P/iXbKVaFduXN9XXVR03HL/l9
6H47e0lxXrEt6YHKopQ3Ets51Z1fnP+vYUWhFqn4e4VlZPZi66QbXJGeL/gLYSa9
24dfUA7c5dWYRehILMD1ELlJlXcxhehkHrPOwwgprH/mQF25pMPgSfd+9O97RuhK
rFDuZSkS3eudJ8X3l2SWVg9QOhFjYVV9B1/ojHvRMOieN+4AaNvhkxI1drWAxiIU
vO25P+NrCqa/PSSPnGtKkAywnEDvgNnxcJ5v/jI2GBtE8fY3Phl5UiMkOTUNBd2L
hMTviownEnpOwgEChBh84ZHtwLL+fppMwCqrfuxB+284X4a3Vg75JKFiRBbsVM5I
dLUh6sbW6ubjTbIHb+DplJkn+dudCcWyXXAcTrRNlW6D2fLY308eZVQcUInGqXf2
mPnqru1Hwl1x/gEkshleOcVaQTJ6ZUSjIrtQXP+Zxhr4Tls68eM4L8RLzvy2RWbu
VgVY2cOhcARROGSi+zPoFSGYsgWIbRxaW0Aff+Y1zlSmOJXq57YpAZTuuXTUkAUx
zzM2kpgBLpEr7KEL8Te8BLBVeLPMUaSC8tEON5B/n5naNOnX4Zc6N5BGF5+RzFpy
7tPGQZAu3d+dSGesjSDNzSl7ZMgpq0hp74TlIUgz8jMZCX7TgKazy1fbr0nyZVbF
/jmP8Rg0yJhpakCbF/rV
=AuX3
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--

--===============3439156778336706578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3439156778336706578==--
