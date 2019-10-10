Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E447D26E0
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Oct 2019 12:04:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBE58C36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Oct 2019 10:04:17 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C15E2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 10:04:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46pmrv5VWyz1rMjx;
 Thu, 10 Oct 2019 12:04:15 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46pmrv5FHDz1qqkQ;
 Thu, 10 Oct 2019 12:04:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2F0efq9dZW-D; Thu, 10 Oct 2019 12:04:14 +0200 (CEST)
X-Auth-Info: 6GpibTcQOKpTXJbc+sB79sq2OKyz/R9sN0Ydx47I41Q=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 10 Oct 2019 12:04:14 +0200 (CEST)
Date: Thu, 10 Oct 2019 12:04:13 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20191010120413.344e70f8@jawa>
In-Reply-To: <20190930133832.11992-3-patrick.delaunay@st.com>
References: <20190930133832.11992-1-patrick.delaunay@st.com>
 <20190930133832.11992-3-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 02/16] doc: dfu: Add dfu documentation
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
Content-Type: multipart/mixed; boundary="===============6474423715910778871=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============6474423715910778871==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/bYzN+LzpGXgAEV/YFi0P=6P"; protocol="application/pgp-signature"

--Sig_/bYzN+LzpGXgAEV/YFi0P=6P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Add documentation for dfu stack and "dfu" command.
>=20

Reviewed-by: Lukasz Majewski <lukma@denx.de>

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
> Changes in v2:
> - Add dfu documentation
>=20
>  doc/README.dfu | 144
> +++++++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 144
> insertions(+) create mode 100644 doc/README.dfu
>=20
> diff --git a/doc/README.dfu b/doc/README.dfu
> new file mode 100644
> index 0000000000..f5344e236c
> --- /dev/null
> +++ b/doc/README.dfu
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +Device Firmware Upgrade (DFU)
> +
> +Overview:
> +
> +  The Device Firmware Upgrade (DFU) allows to download and upload
> firmware
> +  to/from U-Boot connected over USB.
> +
> +  U-boot follows the Universal Serial Bus Device Class Specification
> for
> +  Device Firmware Upgrade Version 1.1 the USB forum (DFU v1.1 in
> www.usb.org). +
> +  U-Boot implements this DFU capability (CONFIG_DFU) with the
> command dfu
> +  (cmd/dfu.c / CONFIG_CMD_DFU) based on:
> +  - the DFU stack (common/dfu.c and common/spl/spl_dfu.c), based on
> the
> +    USB DFU download gadget (drivers/usb/gadget/f_dfu.c)
> +  - The access to mediums is done in DFU backends (driver/dfu)
> +
> +  Today the supported DFU backends are:
> +  - MMC (RAW or FAT / EXT2 / EXT3 / EXT4 file system)
> +  - NAND
> +  - RAM
> +  - SF (serial flash)
> +
> +  These DFU backends are also used by
> +  - the dfutftp (see README.dfutftp)
> +  - the thordown command (cmd/thordown.c and gadget/f_thor.c)
> +
> +Configuration Options:
> +  CONFIG_DFU
> +  CONFIG_DFU_OVER_USB
> +  CONFIG_DFU_MMC
> +  CONFIG_DFU_NAND
> +  CONFIG_DFU_RAM
> +  CONFIG_DFU_SF
> +  CONFIG_CMD_DFU
> +
> +Environment variables:
> +  the dfu command use 3 environments variables:
> +  "dfu_alt_info" : the DFU setting for the USB download gadget with
> a comma
> +                   separated string of information on each alternate:
> +                   dfu_alt_info=3D"<alt1>;<alt2>;....;<altN>"
> +
> +  "dfu_bufsiz" : size of the DFU buffer, when absent, use
> +                 CONFIG_SYS_DFU_DATA_BUF_SIZE (8MiB by default)
> +
> +  "dfu_hash_algo" : name of the hash algorithm to use
> +
> +Commands:
> +  dfu <USB_controller> <interface> <dev> list
> +    list the alternate device defined in "dfu_alt_info"
> +
> +  dfu <USB_controller> <interface> <dev>
> +    start the dfu stack on the USB instance with the selected medium
> +    backend and use the "dfu_alt_info" variable to configure the
> +    alternate setting and link each one with the medium
> +    The dfu command continue until receive a ^C in console or
> +    a DFU detach transaction from HOST.
> +
> +  The possible values of <interface> are :
> +  (with <USB controller> =3D 0 in the dfu command example)
> +
> +  "mmc" (for eMMC and SD card)
> +    cmd: dfu 0 mmc <dev>
> +    each element in "dfu_alt_info" =3D
> +      <name> raw <offset> <size>   raw access to mmc device
> +      <name> part <dev> <part_id>  raw acces to partition
> +      <name> fat <dev> <part_id>   file in FAT partition
> +      <name> ext4 <dev> <part_id>  file in EXT4 partition
> +
> +      with <partid> is the GPT or DOS partition index
> +
> +  "nand" (raw slc nand device)
> +    cmd: dfu 0 nand <dev>
> +    each element in "dfu_alt_info" =3D
> +      <name> raw <offset> <size>   raw access to mmc device
> +      <name> part <dev> <part_id>  raw acces to partition
> +      <name> partubi <dev> <part_id>  raw acces to ubi partition
> +
> +      with <partid> is the MTD partition index
> +
> +  "ram"
> +    cmd: dfu 0 ram <dev>
> +    (<dev> is not used for RAM target)
> +    each element in "dfu_alt_info" =3D
> +      <name> ram <offset> <size>  raw access to ram
> +
> +  "sf" (serial flash : NOR)
> +    cmd: dfu 0 sf <dev>
> +    each element in "dfu_alt_info" =3D
> +      <name> ram <offset> <size>  raw access to sf device
> +
> +Host tools:
> +  When U-Boot runs the dfu stack, the DFU host tools can be used
> +  to send/receive firmwares on each configurated alternate.
> +
> +  For example dfu-util is a host side implementation of the DFU 1.1
> +  specifications(http://dfu-util.sourceforge.net/) which works with
> U-Boot. +
> +Usage:
> +  Example for firmware located in eMMC or SD card, with:
> +  - alternate 1 (alt=3D1) for SPL partition (GPT partition 1)
> +  - alternate 2 (alt=3D2) for U-Boot partition (GPT partition 2)
> +
> +  The U-Boot configuration is:
> +
> +  U-Boot> env set dfu_alt_info "spl part 0 1;u-boot part 0 2"
> +
> +  U-Boot> dfu 0 mmc 0 list
> +  DFU alt settings list:
> +  dev: eMMC alt: 0 name: spl layout: RAW_ADDR
> +  dev: eMMC alt: 1 name: u-boot layout: RAW_ADDR
> +
> +  Boot> dfu 0 mmc 0
> +
> +  On the Host side:
> +
> +  list the available alternate setting:
> +
> +  $> dfu-util -l
> +  dfu-util 0.9
> +
> +  Copyright 2005-2009 Weston Schmidt, Harald Welte and OpenMoko Inc.
> +  Copyright 2010-2016 Tormod Volden and Stefan Schmidt
> +  This program is Free Software and has ABSOLUTELY NO WARRANTY
> +  Please report bugs to http://sourceforge.net/p/dfu-util/tickets/
> +
> +  Found DFU: [0483:5720] ver=3D0200, devnum=3D45, cfg=3D1, intf=3D0,
> path=3D"3-1.3.1", \
> +     alt=3D1, name=3D"u-boot", serial=3D"003A00203438510D36383238"
> +  Found DFU: [0483:5720] ver=3D0200, devnum=3D45, cfg=3D1, intf=3D0,
> path=3D"3-1.3.1", \
> +     alt=3D0, name=3D"spl", serial=3D"003A00203438510D36383238"
> +
> +  To download to U-Boot, use -D option
> +
> +  $> dfu-util -a 0 -D u-boot-spl.bin
> +  $> dfu-util -a 1 -D u-boot.bin
> +
> +  To upload from U-Boot, use -U option
> +
> +  $> dfu-util -a 0 -U u-boot-spl.bin
> +  $> dfu-util -a 1 -U u-boot.bin
> +
> +  To request a DFU detach and reset the USB connection:
> +  $> dfu-util -a 0 -e  -R




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/bYzN+LzpGXgAEV/YFi0P=6P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2fAh0ACgkQAR8vZIA0
zr2VAggA0SR+hjpvYiwwadJ/p8WhNeFNrftO/cCl3JNzNlZNMTB5d6RrcdF43dfe
ZkxGbIEk0gDY2piRsv5W/TF307mwN38UOVTuU7ZfxDdzkA3aq39LZPOhMQLEBB0W
mww45hxTPj8TKGQz1XNjbONb026/tgLKgA03lU38UZAXH9ukLpKgfYK+O4PRbYU8
aBOxLeFV0vC4n41VmPUfSFCqpq2K02woLXsgfJD63RKjWDETFNv/VXvaX6UxPlP1
BYTyRytlpaJq4CD2ZE70aYH9MiH7tt2T0WszZTMyAZvBJy/c3jaGd0KkT/9YOIbS
phBYELagLL5qXu5l2A1NK9Zi3V2W2Q==
=QcbH
-----END PGP SIGNATURE-----

--Sig_/bYzN+LzpGXgAEV/YFi0P=6P--

--===============6474423715910778871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6474423715910778871==--
