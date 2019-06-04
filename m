Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3F341DA
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jun 2019 10:32:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D66C0C46D54
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jun 2019 08:32:13 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BF2BC46D53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2019 08:32:12 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45J4sl1v7vz1rXvq;
 Tue,  4 Jun 2019 10:32:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45J4sl0sVkz1qqkh;
 Tue,  4 Jun 2019 10:32:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 0zJvNYe4qL2g; Tue,  4 Jun 2019 10:32:09 +0200 (CEST)
X-Auth-Info: VeMjKSqEsTVqL/zHewdHmNT14uMdQhWDUeeCCSWfpVA=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  4 Jun 2019 10:32:09 +0200 (CEST)
Date: Tue, 4 Jun 2019 10:32:03 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20190604103203.0983fbd3@jawa>
In-Reply-To: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 0/7] Add STM32 Cortex-M4
	remoteproc driver
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
Content-Type: multipart/mixed; boundary="===============8817849876893397290=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============8817849876893397290==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0v_+TRmsx3cw0GE+R.=FQXS"; protocol="application/pgp-signature"

--Sig_/0v_+TRmsx3cw0GE+R.=FQXS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabien,

> This patchset adds an STM32 remoteproc driver.
>=20
> Patch 1 adds the xxx_translate_dma_address() API which is the
> equivalent of the xxx_translate_address() relying on the "dma-ranges"
> property instead of the "ranges" property.
>=20
> Patch 2 fixes and completes function headers of remoteproc.h.
>=20
> Patch 3 & 4 add the support of the ELF image loading (the current
> implementation supports only binary image loading).
>=20
> Patch 5 is about the driver, and patches 6 & 7 are about MAINTAINERS
> and configs update.
>=20

Thank you for your work - the Vybrid VF610 also has Cortex-M4/M3
embedded and (probably) in some future somebody will want to setup it
in U-Boot. Those changes looks generic and shall be easily re-usable.

Thanks one more time.

> Changes since v2:
> -Moved helpers to rproc-elf-loader.c
> -Rename *elf* functions in *elf32*, preparing future support for elf64
> Changes since v1:
> -Added tests for rproc_elf*() and *_translate_dma_address()
> -Changed memory translation ops from da_to_pa() to device_to_virt() :
> the name is updated and the translation now converts to virtual
> instead of physical. -Merged rproc_elf_is_valid() in
> rproc_elf_sanity_check() -Used explicit error values in
> rproc_elf_sanity_check() -Added and fix comments in various headers
> -Misc minor changes
>=20
> Fabien Dessenne (7):
>   dm: core: Introduce xxx_translate_dma_address()
>   remoteproc: fix function headers
>   remoteproc: add device_to_virt ops
>   remoteproc: add elf file load support
>   remoteproc: Introduce STM32 Cortex-M4 remoteproc driver
>   MAINTAINERS: Add stm32 remoteproc driver
>   configs: stm32mp15: enable stm32 remoteproc
>=20
>  MAINTAINERS                           |   1 +
>  arch/sandbox/dts/test.dts             |   4 +
>  common/fdt_support.c                  |   6 +
>  configs/stm32mp15_basic_defconfig     |   2 +
>  configs/stm32mp15_trusted_defconfig   |   2 +
>  drivers/core/of_addr.c                |   4 +
>  drivers/core/ofnode.c                 |   8 ++
>  drivers/core/read.c                   |   5 +
>  drivers/remoteproc/Kconfig            |  10 ++
>  drivers/remoteproc/Makefile           |   3 +-
>  drivers/remoteproc/rproc-elf-loader.c | 106 ++++++++++++++
>  drivers/remoteproc/sandbox_testproc.c |  19 +++
>  drivers/remoteproc/stm32_copro.c      | 257
> ++++++++++++++++++++++++++++++++++
> include/dm/of_addr.h                  |  18 +++
> include/dm/ofnode.h                   |  16 ++-
> include/dm/read.h                     |  20 ++-
> include/fdt_support.h                 |  24 ++++
> include/remoteproc.h                  | 146 +++++++++++++------
> test/dm/remoteproc.c                  | 122 ++++++++++++++++
> test/dm/test-fdt.c                    |  12 ++ 20 files changed, 743
> insertions(+), 42 deletions(-) create mode 100644
> drivers/remoteproc/rproc-elf-loader.c create mode 100644
> drivers/remoteproc/stm32_copro.c
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/0v_+TRmsx3cw0GE+R.=FQXS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlz2LIMACgkQAR8vZIA0
zr2b7wgA0Lm4B40ndphD2Cx0IUAXFgnjDCNMpw02hz+kX6q7nOspn5wxGflOJgQd
ZXr81j5iojYiNenTwS1yorXuYiUDLXqYcZj7JUYZZ/v7JjSAcm4BVIFasYjF9Ve2
EeYvUBs6EnShBptEcwqxllCwNhj3NPrCyQ0dbYYM0zxFRb/GHjac3F4ebtgPdZ6A
Jl2F5yudkID3A2ehPncw4NfP8Gf83iiN2u/0WI3BnF/jWh9labFkrMzovWx3MalT
5ObrAHfFAJmlkBJl6bec4J6zkOqHWnOvkf+qjCCsUriq+cPSepo8WMfVABG4iNgg
hT/OF1yaCZ1nx+U9JSwG6iq/Bx31Bw==
=Z/et
-----END PGP SIGNATURE-----

--Sig_/0v_+TRmsx3cw0GE+R.=FQXS--

--===============8817849876893397290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8817849876893397290==--
