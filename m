Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87671B39EF
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Sep 2019 14:04:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F12DC36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Sep 2019 12:04:36 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 248E2C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2019 12:04:33 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46X4fn1Y35z1rK4Q;
 Mon, 16 Sep 2019 14:04:33 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46X4fn14jzz1rH3M;
 Mon, 16 Sep 2019 14:04:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id tcMWp6cAo8wr; Mon, 16 Sep 2019 14:04:32 +0200 (CEST)
X-Auth-Info: mqlZ86S36NbEAGI7v+xOzgkvZ2QmCYAyEoxc1VafKtY=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 16 Sep 2019 14:04:32 +0200 (CEST)
Date: Mon, 16 Sep 2019 14:04:31 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Message-ID: <20190916140431.059ee478@jawa>
In-Reply-To: <20190913224242.21054-2-frieder.schrempf@kontron.de>
References: <20190913224242.21054-1-frieder.schrempf@kontron.de>
 <20190913224242.21054-2-frieder.schrempf@kontron.de>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] stm32mp1: configs: Add
	CONFIG_SPL_SPI_FLASH_MTD
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
Content-Type: multipart/mixed; boundary="===============1702295548548870705=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1702295548548870705==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5qofdMIA+_EDnSh7yPXvCCy"; protocol="application/pgp-signature"

--Sig_/5qofdMIA+_EDnSh7yPXvCCy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Sep 2019 22:43:43 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> As SPI_FLASH_MTD is used in SPL and U-Boot proper, we enable both,
> now that a separate option for SPL was introduced.
>=20
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  configs/stm32mp15_basic_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/configs/stm32mp15_basic_defconfig
> b/configs/stm32mp15_basic_defconfig index 09785b5dc1..390319657f
> 100644 --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -7,10 +7,10 @@ CONFIG_TARGET_STM32MP1=3Dy
>  CONFIG_SPL_SPI_FLASH_SUPPORT=3Dy
>  CONFIG_SPL_SPI_SUPPORT=3Dy
>  # CONFIG_ARMV7_VIRT is not set
> +CONFIG_SPL_TEXT_BASE=3D0x2FFC2500
>  CONFIG_DISTRO_DEFAULTS=3Dy
>  CONFIG_FIT=3Dy
>  CONFIG_BOOTCOMMAND=3D"run bootcmd_stm32mp"
> -CONFIG_SPL_TEXT_BASE=3D0x2FFC2500
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=3Dy
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3D3
>  CONFIG_SPL_I2C_SUPPORT=3Dy
> @@ -90,6 +90,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
>  CONFIG_SPI_FLASH_WINBOND=3Dy
>  # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
>  CONFIG_SPI_FLASH_MTD=3Dy
> +CONFIG_SPL_SPI_FLASH_MTD=3Dy
>  CONFIG_DM_ETH=3Dy
>  CONFIG_DWC_ETH_QOS=3Dy
>  CONFIG_PHY=3Dy

Reviewed-by: Lukasz Majewski <lukma@denx.de>

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/5qofdMIA+_EDnSh7yPXvCCy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl1/ek8ACgkQAR8vZIA0
zr2IawgAwQISBRVldmfDOty20QfPUZpBAXca9oGizNHVJIDuuGxwNdeO7At0RmZA
yJ5x5YtQ3mi3tsaUU7rJwGsWGaWU3E87irgu/iAUIgso1Bl4R3RRTP6GDvmrXPfJ
K3B3wqCpU+rM0GS+DCfuJ3ChEwEIRtrXvxcaIV+qPKF9I2U2deiNf0fjmLf9xSeV
dbvqrDfjup++O9GE4orTi++FQ7ViIxxq5BShKWyZMkiqNWd9mykUbORMV63B5Z0J
B4cZw0prbNmrp/Ngx+M5QbmEAh4pFPoXJ0SNoo/Mv0AxkqAXctjrPT1X8cywiiUD
W2D8+XrX68vaHPyuXHIthitqIsQ8Cw==
=NOUj
-----END PGP SIGNATURE-----

--Sig_/5qofdMIA+_EDnSh7yPXvCCy--

--===============1702295548548870705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1702295548548870705==--
