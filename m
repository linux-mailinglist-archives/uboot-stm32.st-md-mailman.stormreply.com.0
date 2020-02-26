Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 138CB16FACC
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Feb 2020 10:35:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C024FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Feb 2020 09:35:03 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBADAC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 09:34:57 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48S9cv3Rhmz1qs0V;
 Wed, 26 Feb 2020 10:34:55 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48S9cv0fN5z1qqlD;
 Wed, 26 Feb 2020 10:34:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id PYLrFYazbeQe; Wed, 26 Feb 2020 10:34:53 +0100 (CET)
X-Auth-Info: UT+6UXA+zcz1qONuFjkySmQcvGrcj3XipWN9YHWzlHI=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 26 Feb 2020 10:34:53 +0100 (CET)
Date: Wed, 26 Feb 2020 10:34:46 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200226103446.1686c09a@jawa>
In-Reply-To: <20200226092842.5413-1-patrick.delaunay@st.com>
References: <20200226092842.5413-1-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Holger Brunck <holger.brunck@ch.abb.com>,
 Simon Glass <sjg@chromium.org>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 Mario Six <mario.six@gdsys.cc>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: migrate
 CONFIG_SET_DFU_ALT_INFO to defconfigs
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
Content-Type: multipart/mixed; boundary="===============3884975236950033504=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============3884975236950033504==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/O7T8GYp+sDg=XwLpzJwic.8"; protocol="application/pgp-signature"

--Sig_/O7T8GYp+sDg=XwLpzJwic.8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Move CONFIG_SET_DFU_ALT_INFO into Kconfig done by moveconfig.py.

Thank you for the conversion.

Acked-by: Lukasz Majewski <lukma@denx.de>

>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  configs/odroid-xu3_defconfig            | 1 +
>  configs/odroid_defconfig                | 1 +
>  configs/stm32mp15_basic_defconfig       | 1 +
>  configs/stm32mp15_dhcom_basic_defconfig | 1 +
>  configs/stm32mp15_optee_defconfig       | 1 +
>  configs/stm32mp15_trusted_defconfig     | 1 +
>  drivers/dfu/Kconfig                     | 5 +++++
>  include/configs/odroid.h                | 1 -
>  include/configs/odroid_xu3.h            | 1 -
>  include/configs/stm32mp1.h              | 2 --
>  scripts/config_whitelist.txt            | 1 -
>  11 files changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/configs/odroid-xu3_defconfig
> b/configs/odroid-xu3_defconfig index 2e982e1b53..1a2183ce19 100644
> --- a/configs/odroid-xu3_defconfig
> +++ b/configs/odroid-xu3_defconfig
> @@ -39,6 +39,7 @@ CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=3Dy
>  CONFIG_ADC=3Dy
>  CONFIG_ADC_EXYNOS=3Dy
>  CONFIG_DFU_MMC=3Dy
> +CONFIG_SET_DFU_ALT_INFO=3Dy
>  CONFIG_SUPPORT_EMMC_BOOT=3Dy
>  CONFIG_MMC_DW=3Dy
>  CONFIG_MTD=3Dy
> diff --git a/configs/odroid_defconfig b/configs/odroid_defconfig
> index e4392e477e..345cc3b940 100644
> --- a/configs/odroid_defconfig
> +++ b/configs/odroid_defconfig
> @@ -40,6 +40,7 @@ CONFIG_DEFAULT_DEVICE_TREE=3D"exynos4412-odroid"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=3Dy
>  CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=3Dy
>  CONFIG_DFU_MMC=3Dy
> +CONFIG_SET_DFU_ALT_INFO=3Dy
>  CONFIG_SYS_I2C_S3C24X0=3Dy
>  CONFIG_MMC_DW=3Dy
>  CONFIG_MMC_SDHCI=3Dy
> diff --git a/configs/stm32mp15_basic_defconfig
> b/configs/stm32mp15_basic_defconfig index f691306800..4efb1bf9c2
> 100644 --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -71,6 +71,7 @@ CONFIG_DFU_MMC=3Dy
>  CONFIG_DFU_RAM=3Dy
>  CONFIG_DFU_MTD=3Dy
>  CONFIG_DFU_VIRT=3Dy
> +CONFIG_SET_DFU_ALT_INFO=3Dy
>  CONFIG_USB_FUNCTION_FASTBOOT=3Dy
>  CONFIG_FASTBOOT_BUF_ADDR=3D0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=3D0x02000000
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig
> b/configs/stm32mp15_dhcom_basic_defconfig index
> 921dea242a..9b5e54748d 100644 ---
> a/configs/stm32mp15_dhcom_basic_defconfig +++
> b/configs/stm32mp15_dhcom_basic_defconfig @@ -70,6 +70,7 @@
> CONFIG_SPL_BLOCK_CACHE=3Dy CONFIG_DFU_MMC=3Dy
>  CONFIG_DFU_RAM=3Dy
>  CONFIG_DFU_VIRT=3Dy
> +CONFIG_SET_DFU_ALT_INFO=3Dy
>  CONFIG_DM_HWSPINLOCK=3Dy
>  CONFIG_HWSPINLOCK_STM32=3Dy
>  CONFIG_DM_I2C=3Dy
> diff --git a/configs/stm32mp15_optee_defconfig
> b/configs/stm32mp15_optee_defconfig index 521b24e2cb..54135b28aa
> 100644 --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -58,6 +58,7 @@ CONFIG_DFU_MMC=3Dy
>  CONFIG_DFU_RAM=3Dy
>  CONFIG_DFU_MTD=3Dy
>  CONFIG_DFU_VIRT=3Dy
> +CONFIG_SET_DFU_ALT_INFO=3Dy
>  CONFIG_USB_FUNCTION_FASTBOOT=3Dy
>  CONFIG_FASTBOOT_BUF_ADDR=3D0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=3D0x02000000
> diff --git a/configs/stm32mp15_trusted_defconfig
> b/configs/stm32mp15_trusted_defconfig index c8b328d01a..d7d0b6c296
> 100644 --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -57,6 +57,7 @@ CONFIG_DFU_MMC=3Dy
>  CONFIG_DFU_RAM=3Dy
>  CONFIG_DFU_MTD=3Dy
>  CONFIG_DFU_VIRT=3Dy
> +CONFIG_SET_DFU_ALT_INFO=3Dy
>  CONFIG_USB_FUNCTION_FASTBOOT=3Dy
>  CONFIG_FASTBOOT_BUF_ADDR=3D0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=3D0x02000000
> diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
> index 174fb588a6..5d45d7d7c2 100644
> --- a/drivers/dfu/Kconfig
> +++ b/drivers/dfu/Kconfig
> @@ -81,5 +81,10 @@ config DFU_VIRT
>  	  used at board level to manage specific behavior
>  	  (OTP update for example).
> =20
> +config SET_DFU_ALT_INFO
> +	bool "Dynamic set of DFU alternate information"
> +	help
> +	  This option allows to call the function set_dfu_alt_info to
> +	  dynamically build dfu_alt_info in board.
>  endif
>  endmenu
> diff --git a/include/configs/odroid.h b/include/configs/odroid.h
> index a7e2a3d9a2..4044365328 100644
> --- a/include/configs/odroid.h
> +++ b/include/configs/odroid.h
> @@ -64,7 +64,6 @@
>  	""PARTS_BOOT" part 0 1;" \
>  	""PARTS_ROOT" part 0 2\0" \
> =20
> -#define CONFIG_SET_DFU_ALT_INFO
>  #define CONFIG_SET_DFU_ALT_BUF_LEN	(SZ_1K)
> =20
>  #define CONFIG_DFU_ALT_BOOT_EMMC \
> diff --git a/include/configs/odroid_xu3.h
> b/include/configs/odroid_xu3.h index 47c30543f8..564319c231 100644
> --- a/include/configs/odroid_xu3.h
> +++ b/include/configs/odroid_xu3.h
> @@ -76,7 +76,6 @@
> =20
>  /* Enable: board/samsung/common/misc.c to use set_dfu_alt_info() */
>  #define CONFIG_MISC_COMMON
> -#define CONFIG_SET_DFU_ALT_INFO
>  #define CONFIG_SET_DFU_ALT_BUF_LEN	(SZ_1K)
> =20
>  /* Set soc_rev, soc_id, board_rev, board_name, fdtfile */
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index 42717c167e..592638072a 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -90,8 +90,6 @@
>  #define CONFIG_SYS_MTDPARTS_RUNTIME
>  #endif
> =20
> -#define CONFIG_SET_DFU_ALT_INFO
> -
>  #ifdef CONFIG_DM_VIDEO
>  #define CONFIG_VIDEO_BMP_RLE8
>  #define CONFIG_BMP_16BPP
> diff --git a/scripts/config_whitelist.txt
> b/scripts/config_whitelist.txt index 405c62e9be..85d55b182e 100644
> --- a/scripts/config_whitelist.txt
> +++ b/scripts/config_whitelist.txt
> @@ -1529,7 +1529,6 @@ CONFIG_SETUP_MEMORY_TAGS
>  CONFIG_SET_BIST
>  CONFIG_SET_BOOTARGS
>  CONFIG_SET_DFU_ALT_BUF_LEN
> -CONFIG_SET_DFU_ALT_INFO
>  CONFIG_SFIO
>  CONFIG_SF_DATAFLASH
>  CONFIG_SGI_IP28




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/O7T8GYp+sDg=XwLpzJwic.8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5WO7cACgkQAR8vZIA0
zr2hEwgAmSrhYOFY5AgPIxCYbA0dcORzeEaUOwOORkcTNFWJy2njEEOzUk2T/ew+
174/q5hNL6ZLhn1NN618kJDEa65fOoKbyONF5o/cn930tNRRIK54Av48SCFSwTm1
yIzlBIz9uh/g+AgN9HnFDYtTTlbnGSzq3eu2fhny3VxKSiG7H2WuuEoqaZ918oiF
BDsvZZ5trxZ0SR2x8M3f3e+TixR2l5OEVMufd78Cf+uAnsHhbVczxusnQaTDROpA
B8lNigQzNOfeecaPsX/VI35Y+0YSnfwjuIhD/p5Dl9lfNkvhEWXhBlsVYws0dD1h
VqqGodqUREPg59cs4Di85aIsqsCjHw==
=jWZC
-----END PGP SIGNATURE-----

--Sig_/O7T8GYp+sDg=XwLpzJwic.8--

--===============3884975236950033504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3884975236950033504==--
