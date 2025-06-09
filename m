Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F29AD198E
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 10:07:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EBA6C3F939;
	Mon,  9 Jun 2025 08:07:36 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 161B9C32E8E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 08:07:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C1FF510397298; 
 Mon,  9 Jun 2025 10:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1749456452; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=fLsHZxnr0W4ZqEEDmfOs7K9xaq2JWKihhqg9Eucf1II=;
 b=icleF1azFG3Jow17Q7rzqmsSgv0fYu+lw53D+Py/v6dGQqeFPO9hvzNoEipgHS7DDZFCt2
 7qpEln9jYHBfU7Yej1aOon+a5GM2rDd03ANRgigepQei43+hrKYSPjERPoaxXOC9BVdoFM
 PM5vzhEUO/mIS1nQ8FgqXBqHB89NLgcoKzTmMPkHWUsjZ3FpdpZHYnj3B8pz8cWw/VRBmd
 atJ34ixDhTay0PGTK7pL6tPJZU5ll1sOfN+p6gJHnE0FHStglofUIOXiQlVGUqY3B6hErl
 76nOERnk8Sk4PE+Zb/uthC29ruyvLABD99xg+uICwvkZaE/6S9g1GGqFlvSb1Q==
Date: Mon, 9 Jun 2025 10:07:27 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20250609100727.56d7de7b@wsk>
In-Reply-To: <316dd0c7-c7b8-407d-b34a-b5b90f056b94@foss.st.com>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <20250607093730.2249536-10-dario.binacchi@amarulasolutions.com>
 <316dd0c7-c7b8-407d-b34a-b5b90f056b94@foss.st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 9/9] board: stm32: add stm32h747-discovery
	board support
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
Content-Type: multipart/mixed; boundary="===============1906368821260723548=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1906368821260723548==
Content-Type: multipart/signed; boundary="Sig_/d8._++1h1ncMnd0A7S1dXSI";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/d8._++1h1ncMnd0A7S1dXSI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrice,

> On 6/7/25 11:37, Dario Binacchi wrote:
> > The board includes an STM32H747XI SoC with the following resources:
> >  - 2 Mbytes Flash
> >  - 1 Mbyte SRAM
> >  - LCD-TFT controller
> >  - MIPI-DSI interface
> >  - FD-CAN
> >  - USB 2.0 high-speed/full-speed
> >  - Ethernet MAC
> >  - camera interface
> >=20
> > Detailed information can be found at:
> > https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> >=20
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >=20
> > ---
> >=20
> >  arch/arm/mach-stm32/stm32h7/Kconfig        |  4 +++
> >  board/st/stm32h747-disco/Kconfig           | 15 ++++++++
> >  board/st/stm32h747-disco/MAINTAINERS       |  7 ++++
> >  board/st/stm32h747-disco/Makefile          |  6 ++++
> >  board/st/stm32h747-disco/stm32h747-disco.c | 42
> > ++++++++++++++++++++++ configs/stm32h747-disco_defconfig          |
> > 35 ++++++++++++++++++ drivers/clk/stm32/clk-stm32h7.c            |
> > 5 +++ include/configs/stm32h747-disco.h          | 32
> > +++++++++++++++++ 8 files changed, 146 insertions(+)
> >  create mode 100644 board/st/stm32h747-disco/Kconfig
> >  create mode 100644 board/st/stm32h747-disco/MAINTAINERS
> >  create mode 100644 board/st/stm32h747-disco/Makefile
> >  create mode 100644 board/st/stm32h747-disco/stm32h747-disco.c
> >  create mode 100644 configs/stm32h747-disco_defconfig
> >  create mode 100644 include/configs/stm32h747-disco.h
> >=20
> > diff --git a/arch/arm/mach-stm32/stm32h7/Kconfig
> > b/arch/arm/mach-stm32/stm32h7/Kconfig index
> > 70233a4b23cd..72f20c477d04 100644 ---
> > a/arch/arm/mach-stm32/stm32h7/Kconfig +++
> > b/arch/arm/mach-stm32/stm32h7/Kconfig @@ -6,11 +6,15 @@ config
> > TARGET_STM32H743_DISCO config TARGET_STM32H743_EVAL
> >  	bool "STM32H743 Evaluation board"
> > =20
> > +config TARGET_STM32H747_DISCO
> > +	bool "STM32H747 Discovery board"
> > +
> >  config TARGET_STM32H750_ART_PI
> >  	bool "STM32H750 ART Pi board"
> > =20
> >  source "board/st/stm32h743-eval/Kconfig"
> >  source "board/st/stm32h743-disco/Kconfig"
> > +source "board/st/stm32h747-disco/Kconfig"
> >  source "board/st/stm32h750-art-pi/Kconfig"
> > =20
> >  endif
> > diff --git a/board/st/stm32h747-disco/Kconfig
> > b/board/st/stm32h747-disco/Kconfig new file mode 100644
> > index 000000000000..a7b2c09a327f
> > --- /dev/null
> > +++ b/board/st/stm32h747-disco/Kconfig
> > @@ -0,0 +1,15 @@
> > +if TARGET_STM32H747_DISCO
> > +
> > +config SYS_BOARD
> > +	default "stm32h747-disco"
> > +
> > +config SYS_VENDOR
> > +	default "st"
> > +
> > +config SYS_SOC
> > +	default "stm32h7"
> > +
> > +config SYS_CONFIG_NAME
> > +	default "stm32h747-disco"
> > +
> > +endif
> > diff --git a/board/st/stm32h747-disco/MAINTAINERS
> > b/board/st/stm32h747-disco/MAINTAINERS new file mode 100644
> > index 000000000000..d48649f773f3
> > --- /dev/null
> > +++ b/board/st/stm32h747-disco/MAINTAINERS
> > @@ -0,0 +1,7 @@
> > +STM32H747 DISCOVERY BOARD
> > +M:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > +S:	Maintained
> > +F:	board/st/stm32h747-disco
> > +F:	include/configs/stm32h747-disco.h
> > +F:	configs/stm32h747-disco_defconfig
> > +F:	arch/arm/dts/stm32h747*
> > diff --git a/board/st/stm32h747-disco/Makefile
> > b/board/st/stm32h747-disco/Makefile new file mode 100644
> > index 000000000000..e11f052cc88f
> > --- /dev/null
> > +++ b/board/st/stm32h747-disco/Makefile
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0+
> > +#
> > +# Copyright (c) 2025 Dario Binacchi
> > <dario.binacchi@amarulasolutions.com> +#
> > +
> > +obj-y	:=3D stm32h747-disco.o
> > diff --git a/board/st/stm32h747-disco/stm32h747-disco.c
> > b/board/st/stm32h747-disco/stm32h747-disco.c new file mode 100644
> > index 000000000000..be0884bdeb4d
> > --- /dev/null
> > +++ b/board/st/stm32h747-disco/stm32h747-disco.c
> > @@ -0,0 +1,42 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * stm32h747i-disco support
> > + *
> > + * Copyright (C) 2025 Dario Binacchi
> > <dario.binacchi@amarulasolutions.com>
> > + */
> > +
> > +#include <dm.h>
> > +#include <init.h>
> > +#include <log.h>
> > +#include <asm/global_data.h>
> > +
> > +DECLARE_GLOBAL_DATA_PTR;
> > +
> > +int dram_init(void)
> > +{
> > +	struct udevice *dev;
> > +	int ret;
> > +
> > +	ret =3D uclass_get_device(UCLASS_RAM, 0, &dev);
> > +	if (ret) {
> > +		debug("DRAM init failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	if (fdtdec_setup_mem_size_base() !=3D 0)
> > +		ret =3D -EINVAL;
> > +
> > +	return ret;
> > +}
> > +
> > +int dram_init_banksize(void)
> > +{
> > +	fdtdec_setup_memory_banksize();
> > +
> > +	return 0;
> > +}
> > +
> > +int board_init(void)
> > +{
> > +	return 0;
> > +}
> > diff --git a/configs/stm32h747-disco_defconfig
> > b/configs/stm32h747-disco_defconfig new file mode 100644
> > index 000000000000..8a0c72450d1e
> > --- /dev/null
> > +++ b/configs/stm32h747-disco_defconfig
> > @@ -0,0 +1,35 @@
> > +CONFIG_ARM=3Dy
> > +CONFIG_ARCH_STM32=3Dy
> > +CONFIG_TEXT_BASE=3D0x08000000
> > +CONFIG_SYS_MALLOC_LEN=3D0x100000
> > +CONFIG_NR_DRAM_BANKS=3D1
> > +CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=3Dy
> > +CONFIG_CUSTOM_SYS_INIT_SP_ADDR=3D0x24040000
> > +CONFIG_ENV_SIZE=3D0x2000
> > +CONFIG_DEFAULT_DEVICE_TREE=3D"st/stm32h747i-disco"
> > +CONFIG_OF_LIBFDT_OVERLAY=3Dy
> > +CONFIG_SYS_LOAD_ADDR=3D0xd0400000
> > +CONFIG_STM32H7=3Dy
> > +CONFIG_TARGET_STM32H747_DISCO=3Dy
> > +CONFIG_DISTRO_DEFAULTS=3Dy

I'm just wondering if there is any plan to move forward to use the new
approach?

As fair as I remember this is the "deprecated" option...

> > +CONFIG_BOOTDELAY=3D3
> > +CONFIG_AUTOBOOT_KEYED=3Dy
> > +CONFIG_AUTOBOOT_PROMPT=3D"Hit SPACE in %d seconds to stop
> > autoboot.\n" +CONFIG_AUTOBOOT_STOP_STR=3D" "
> > +CONFIG_DEFAULT_FDT_FILE=3D"stm32h747i-disco"
> > +CONFIG_SYS_CBSIZE=3D256
> > +CONFIG_SYS_PBSIZE=3D282
> > +# CONFIG_DISPLAY_CPUINFO is not set
> > +CONFIG_SYS_PROMPT=3D"U-Boot > "
> > +CONFIG_CMD_GPT=3Dy
> > +CONFIG_CMD_MMC=3Dy
> > +# CONFIG_CMD_SETEXPR is not set
> > +CONFIG_CMD_CACHE=3Dy
> > +CONFIG_CMD_TIMER=3Dy
> > +CONFIG_CMD_EXT4_WRITE=3Dy
> > +# CONFIG_ISO_PARTITION is not set
> > +CONFIG_OF_CONTROL=3Dy
> > +CONFIG_SYS_RELOC_GD_ENV_ADDR=3Dy
> > +CONFIG_NO_NET=3Dy
> > +CONFIG_STM32_SDMMC2=3Dy
> > +# CONFIG_PINCTRL_FULL is not set
> > diff --git a/drivers/clk/stm32/clk-stm32h7.c
> > b/drivers/clk/stm32/clk-stm32h7.c index 6acf2ff0a8fb..aa3be414a29f
> > 100644 --- a/drivers/clk/stm32/clk-stm32h7.c
> > +++ b/drivers/clk/stm32/clk-stm32h7.c
> > @@ -114,6 +114,7 @@
> >  #define		QSPISRC_PER_CK		3
> > =20
> >  #define PWR_CR3				0x0c
> > +#define PWR_CR3_LDOEN			BIT(1)
> >  #define PWR_CR3_SCUEN			BIT(2)
> >  #define PWR_D3CR			0x18
> >  #define PWR_D3CR_VOS_MASK		GENMASK(15, 14)
> > @@ -375,7 +376,11 @@ int configure_clocks(struct udevice *dev)
> >  	clrsetbits_le32(pwr_base + PWR_D3CR, PWR_D3CR_VOS_MASK,
> >  			VOS_SCALE_1 << PWR_D3CR_VOS_SHIFT);
> >  	/* Lock supply configuration update */
> > +#if IS_ENABLED(CONFIG_TARGET_STM32H747_DISCO)
> > +	clrbits_le32(pwr_base + PWR_CR3, PWR_CR3_LDOEN);
> > +#else
> >  	clrbits_le32(pwr_base + PWR_CR3, PWR_CR3_SCUEN);
> > +#endif
> >  	while (!(readl(pwr_base + PWR_D3CR) & PWR_D3CR_VOSREADY))
> >  		;
> > =20
> > diff --git a/include/configs/stm32h747-disco.h
> > b/include/configs/stm32h747-disco.h new file mode 100644
> > index 000000000000..393445a8ae1f
> > --- /dev/null
> > +++ b/include/configs/stm32h747-disco.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright (C) 2025 Dario Binacchi
> > <dario.binacchi@amarulasolutions.com>
> > + */
> > +
> > +#ifndef __CONFIG_H
> > +#define __CONFIG_H
> > +
> > +#include <config.h>
> > +#include <linux/sizes.h>
> > +
> > +/* For booting Linux, use the first 16MB of memory */
> > +#define CFG_SYS_BOOTMAPSZ		SZ_16M
> > +
> > +#define CFG_SYS_FLASH_BASE		0x08000000
> > +
> > +#define CFG_SYS_HZ_CLOCK		1000000
> > +
> > +#define BOOT_TARGET_DEVICES(func) \
> > +	func(MMC, mmc, 0)
> > +
> > +#include <config_distro_bootcmd.h>
> > +#define CFG_EXTRA_ENV_SETTINGS				\
> > +			"kernel_addr_r=3D0xD0008000\0"
> > 	\
> > +			"fdtfile=3Dstm32h747i-disco.dtb\0"	\
> > +			"fdt_addr_r=3D0xD0408000\0"		\
> > +			"scriptaddr=3D0xD0418000\0"		\
> > +			"pxefile_addr_r=3D0xD0428000\0" \
> > +			"ramdisk_addr_r=3D0xD0438000\0"
> > 	\
> > +			BOOTENV
> > +
> > +#endif /* __CONFIG_H */ =20
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> Thanks
> Patrice




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/d8._++1h1ncMnd0A7S1dXSI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmhGlj8ACgkQAR8vZIA0
zr1zvQf5Ab61M5SvYy7rczibvdf3s0odLrVSS1nbDEQIGCWcLKjXiHalRLO2X4uw
WWcTlf3szAbXKFpwdCVzqg5So/BoB4Wa441qWUQzXlF1EIRkZbYCvIsnfSJeFZlB
zpSGPBhCjtH6EmQU7C9sc4iZm57+82e7H+zUdt8iEuV3NaRpezSxHduXpUpuWShn
lSK+p73yd5p+EfhnJ1ORMufH10efBXx4Il04IOdND2TSovTEa8lkGj/XVx37/uGh
eYiXqw/W/34irXyf4pe1C/nMhNbftOIALzG3ccPOcN55rkbRXmpc/L/NBV/qJP05
AY3l94hdm2bPqGI0yH1IuDl4ux1Xmg==
=x6gz
-----END PGP SIGNATURE-----

--Sig_/d8._++1h1ncMnd0A7S1dXSI--

--===============1906368821260723548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1906368821260723548==--
