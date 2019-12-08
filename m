Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8403116268
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 Dec 2019 15:24:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38D2EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 Dec 2019 14:24:52 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 718D3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Dec 2019 14:24:50 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47W7rJ5nysz1qqkV;
 Sun,  8 Dec 2019 15:24:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47W7rJ3L4fz1rYZv;
 Sun,  8 Dec 2019 15:24:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id f3fhhG2Q2NLk; Sun,  8 Dec 2019 15:24:45 +0100 (CET)
X-Auth-Info: zUz+F/UW1Yu5HuToBntOUt4RPrQLnY6fMxO5vOXO/UI=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  8 Dec 2019 15:24:45 +0100 (CET)
Date: Sun, 8 Dec 2019 15:24:44 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191208152444.0a473a75@jawa>
In-Reply-To: <20191206140149.7426-3-patrice.chotard@st.com>
References: <20191206140149.7426-1-patrice.chotard@st.com>
 <20191206140149.7426-3-patrice.chotard@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pankit Garg <pankit.garg@nxp.com>, "Albert ARIBAUD
 \(3ADEV\)" <albert.aribaud@3adev.fr>, Fabien Parent <fparent@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Udit Agarwal <udit.agarwal@nxp.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Peter Robinson <pbrobinson@gmail.com>, Stefan Roese <sr@denx.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Mingming lee <mingming.lee@mediatek.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Mian Yousaf Kaukab <ykaukab@suse.de>,
 Vabhav Sharma <vabhav.sharma@nxp.com>, Michal Simek <monstr@monstr.eu>,
 u-boot@lists.denx.de, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] treewide: Remove
 CONFIG_SYS_UBOOT_START from configs board files
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
Content-Type: multipart/mixed; boundary="===============2487644314715752312=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============2487644314715752312==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/ZPFkfpRw_7QX0Wn47MzUjLW"; protocol="application/pgp-signature"

--Sig_/ZPFkfpRw_7QX0Wn47MzUjLW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Dec 2019 15:01:49 +0100
Patrice Chotard <patrice.chotard@st.com> wrote:

> As previous CONFIG_SYS_UBOOT_START is now set by default to
> CONFIG_SYS_TEXT_BASE when not defined, CONFIG_SYS_UBOOT_START
> can be removed from include/configs board files.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>=20
> ---
>=20
>  include/configs/gardena-smart-gateway-at91sam.h | 1 -
>  include/configs/ls1046a_common.h                | 1 -
>  include/configs/mccmon6.h                       | 1 -
>  include/configs/microblaze-generic.h            | 2 --
>  include/configs/mt7623.h                        | 1 -
>  include/configs/mt7629.h                        | 1 -
>  include/configs/mt8518.h                        | 1 -
>  include/configs/omap3_cairo.h                   | 1 -
>  include/configs/pumpkin.h                       | 1 -
>  include/configs/tegra-common.h                  | 1 -
>  include/configs/x600.h                          | 1 -
>  include/configs/xilinx_zynqmp_r5.h              | 2 --
>  include/configs/zynq-common.h                   | 2 --
>  13 files changed, 16 deletions(-)
>=20
> diff --git a/include/configs/gardena-smart-gateway-at91sam.h
> b/include/configs/gardena-smart-gateway-at91sam.h index
> 482e4714b1..f5ee65cb8a 100644 ---
> a/include/configs/gardena-smart-gateway-at91sam.h +++
> b/include/configs/gardena-smart-gateway-at91sam.h @@ -64,7 +64,6 @@
>  #define CONFIG_SPL_NAND_RAW_ONLY
>  #define CONFIG_SYS_NAND_U_BOOT_OFFS	0x40000
>  #define CONFIG_SYS_NAND_U_BOOT_SIZE	0xa0000
> -#define	CONFIG_SYS_UBOOT_START
> CONFIG_SYS_TEXT_BASE #define
> CONFIG_SYS_NAND_U_BOOT_START	CONFIG_SYS_TEXT_BASE #define
> CONFIG_SYS_NAND_U_BOOT_DST	CONFIG_SYS_TEXT_BASE=20
> diff --git a/include/configs/ls1046a_common.h
> b/include/configs/ls1046a_common.h index cc8f4c0210..6543cfd868 100644
> --- a/include/configs/ls1046a_common.h
> +++ b/include/configs/ls1046a_common.h
> @@ -98,7 +98,6 @@
>  					CONFIG_SPL_BSS_MAX_SIZE)
>  #define CONFIG_SYS_SPL_MALLOC_SIZE	0x100000
>  #define CONFIG_SYS_MONITOR_LEN		0x100000
> -#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
>  #endif
> =20
>  /* NAND SPL */
> diff --git a/include/configs/mccmon6.h b/include/configs/mccmon6.h
> index 045a9f7bdf..0aee1e1cf6 100644
> --- a/include/configs/mccmon6.h
> +++ b/include/configs/mccmon6.h
> @@ -12,7 +12,6 @@
>  #define CONFIG_SPL_LIBCOMMON_SUPPORT
>  #include "imx6_spl.h"
> =20
> -#define CONFIG_SYS_UBOOT_START CONFIG_SYS_TEXT_BASE
>  #define CONFIG_SYS_UBOOT_BASE (CONFIG_SYS_FLASH_BASE + 0x80000)
>  #define CONFIG_SYS_SPL_ARGS_ADDR	0x18000000
> =20
> diff --git a/include/configs/microblaze-generic.h
> b/include/configs/microblaze-generic.h index 385b30c99b..8ca0e83c78
> 100644 --- a/include/configs/microblaze-generic.h
> +++ b/include/configs/microblaze-generic.h
> @@ -173,8 +173,6 @@
>  /* Just for sure that there is a space for stack */
>  #define CONFIG_SPL_STACK_SIZE		0x100
> =20
> -#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
> -
>  #define CONFIG_SPL_MAX_FOOTPRINT	(CONFIG_SYS_INIT_RAM_SIZE - \
>  					 CONFIG_SYS_INIT_RAM_ADDR - \
>  					 CONFIG_SYS_MALLOC_F_LEN - \
> diff --git a/include/configs/mt7623.h b/include/configs/mt7623.h
> index e5182aeea8..faab0913fc 100644
> --- a/include/configs/mt7623.h
> +++ b/include/configs/mt7623.h
> @@ -31,7 +31,6 @@
>  #define CONFIG_ENV_OVERWRITE
> =20
>  /* Preloader -> Uboot */
> -#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
>  #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_TEXT_BASE
> + SZ_2M - \ GENERATED_GBL_DATA_SIZE)
> =20
> diff --git a/include/configs/mt7629.h b/include/configs/mt7629.h
> index 4aef894c6e..6a6c2f2414 100644
> --- a/include/configs/mt7629.h
> +++ b/include/configs/mt7629.h
> @@ -40,7 +40,6 @@
>  #define CONFIG_SYS_UBOOT_BASE		(CONFIG_SPI_ADDR +
> CONFIG_SPL_PAD_TO)=20
>  /* SPL -> Uboot */
> -#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
>  #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_TEXT_BASE
> + SZ_2M - \ GENERATED_GBL_DATA_SIZE)
> =20
> diff --git a/include/configs/mt8518.h b/include/configs/mt8518.h
> index a7fe83a605..514722be99 100644
> --- a/include/configs/mt8518.h
> +++ b/include/configs/mt8518.h
> @@ -29,7 +29,6 @@
>  #define CONFIG_SYS_BOOTM_LEN			SZ_64M
> =20
>  /* Uboot definition */
> -#define CONFIG_SYS_UBOOT_START
> CONFIG_SYS_TEXT_BASE #define CONFIG_SYS_INIT_SP_ADDR
> 	(CONFIG_SYS_TEXT_BASE + \ SZ_2M - \
>  						GENERATED_GBL_DATA_SIZE)
> diff --git a/include/configs/omap3_cairo.h
> b/include/configs/omap3_cairo.h index 1b1a56d7cd..c76c81ddd5 100644
> --- a/include/configs/omap3_cairo.h
> +++ b/include/configs/omap3_cairo.h
> @@ -26,7 +26,6 @@
>   * other needs.  We use this rather than the inherited defines from
>   * ti_armv7_common.h for backwards compatibility.
>   */
> -#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
>  #define CONFIG_SPL_BSS_START_ADDR	0x80000000
>  #define CONFIG_SPL_BSS_MAX_SIZE		(512 << 10)	/*
> 512 KB */ #define CONFIG_SYS_SPL_MALLOC_START	0x80208000
> diff --git a/include/configs/pumpkin.h b/include/configs/pumpkin.h
> index 35e28be950..9c52cae41d 100644
> --- a/include/configs/pumpkin.h
> +++ b/include/configs/pumpkin.h
> @@ -23,7 +23,6 @@
>  #define CONFIG_SYS_NS16550_COM1		0x11005000
>  #define CONFIG_SYS_NS16550_CLK		26000000
> =20
> -#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
>  #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_TEXT_BASE
> + SZ_2M - \ GENERATED_GBL_DATA_SIZE)
> =20
> diff --git a/include/configs/tegra-common.h
> b/include/configs/tegra-common.h index b4da1f8428..f2cdd9c019 100644
> --- a/include/configs/tegra-common.h
> +++ b/include/configs/tegra-common.h
> @@ -61,7 +61,6 @@
>  #define PHYS_SDRAM_1		NV_PA_SDRC_CS0
>  #define PHYS_SDRAM_1_SIZE	0x20000000	/* 512M */
> =20
> -#define CONFIG_SYS_UBOOT_START	CONFIG_SYS_TEXT_BASE
>  #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
> =20
>  #define CONFIG_SYS_BOOTMAPSZ	(256 << 20)	/* 256M */
> diff --git a/include/configs/x600.h b/include/configs/x600.h
> index 63092b24a5..8b6caae7be 100644
> --- a/include/configs/x600.h
> +++ b/include/configs/x600.h
> @@ -27,7 +27,6 @@
>  #define CONFIG_SYS_SPL_LEN			CONFIG_SPL_PAD_TO
>  #define CONFIG_SYS_UBOOT_BASE
> (CONFIG_SYS_FLASH_BASE + \ CONFIG_SYS_SPL_LEN)
> -#define CONFIG_SYS_UBOOT_START
> CONFIG_SYS_TEXT_BASE #define CONFIG_SYS_MONITOR_BASE
> 	CONFIG_SYS_FLASH_BASE #define CONFIG_SYS_MONITOR_LEN
> 		0x60000=20
> diff --git a/include/configs/xilinx_zynqmp_r5.h
> b/include/configs/xilinx_zynqmp_r5.h index 38d952d0c0..155d7fe883
> 100644 --- a/include/configs/xilinx_zynqmp_r5.h
> +++ b/include/configs/xilinx_zynqmp_r5.h
> @@ -35,8 +35,6 @@
>  /* Extend size of kernel image for uncompression */
>  #define CONFIG_SYS_BOOTM_LEN	(60 * 1024 * 1024)
> =20
> -#define CONFIG_SYS_UBOOT_START	CONFIG_SYS_TEXT_BASE
> -
>  #define CONFIG_SKIP_LOWLEVEL_INIT
> =20
>  /* 0x0 - 0x40 is used for placing exception vectors */
> diff --git a/include/configs/zynq-common.h
> b/include/configs/zynq-common.h index 274cc19112..189ca81bbe 100644
> --- a/include/configs/zynq-common.h
> +++ b/include/configs/zynq-common.h
> @@ -274,6 +274,4 @@
> =20
>  #define CONFIG_SPL_LOAD_FIT_ADDRESS 0x10000000
> =20
> -#define CONFIG_SYS_UBOOT_START	CONFIG_SYS_TEXT_BASE
> -
>  #endif /* __CONFIG_ZYNQ_COMMON_H */

Acked-by: Lukasz Majewski <lukma@denx.de>


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/ZPFkfpRw_7QX0Wn47MzUjLW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl3tB6wACgkQAR8vZIA0
zr30qwgA27t2oW5r0ugLPYJVxcR5shvVbTzg0hoRYjp5Bi0jIySVrmtvRjfS8Jz9
BKbFd2o0SFHM6yMWSHW2nMwAG/tptQBLcUVRGGlf39Qm/pvUqs78TuBYOUAqqRaI
P/IakGgu/HztcrEeK8hn6xm77L+m0PtHeDTnZ8hnGOfuTDKt8gFOlcTpSfxlA6UL
PuLTu7kljKjYhA2Jnal2Zs77gWB/f56E7Got+bp4mfz7DnqxGshjM9HmYf9MvEdQ
2uIt0HVvCAeOyHAbsVupAVMU/alDfqU+iusecNyDzQFHkmt5u5ginLYT4WnAGXzn
FpXdfRHOJEV32GyIPJNzkrQ9AkHriA==
=hPjA
-----END PGP SIGNATURE-----

--Sig_/ZPFkfpRw_7QX0Wn47MzUjLW--

--===============2487644314715752312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2487644314715752312==--
