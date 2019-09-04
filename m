Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1388A7E58
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Sep 2019 10:51:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17D32C36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Sep 2019 08:51:49 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43BA8C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 08:51:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46Ncxs3GXvz1rM68;
 Wed,  4 Sep 2019 10:51:45 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46Ncxs10KDz1qqkZ;
 Wed,  4 Sep 2019 10:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id k3OMsHXBIZcb; Wed,  4 Sep 2019 10:51:42 +0200 (CEST)
X-Auth-Info: B5p9sNq0Eg73WeLWQE+2p4bC9ycRwzQ0sI5jQd9onvs=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  4 Sep 2019 10:51:42 +0200 (CEST)
Date: Wed, 4 Sep 2019 10:51:41 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190904105141.71c20ab0@jawa>
In-Reply-To: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
References: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>, Simon
 Goldschmidt <simon.k.r.goldschmidt@gmail.com>, Markus
 Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Heiko Schocher <hs@denx.de>,
 Adam Ford <aford173@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH] env: Add CONFIG_ENV_SUPPORT
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
Content-Type: multipart/mixed; boundary="===============2051464084124629798=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============2051464084124629798==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jvkLMl9c+_OPhepMIExc072"; protocol="application/pgp-signature"

--Sig_/jvkLMl9c+_OPhepMIExc072
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

> Add a new flag CONFIG_ENV_SUPPORT to compile all
> the environment features in U-Boot (attributes, callbacks
> and flags). It is the equivalent of the 2 existing flags
> - CONFIG_SPL_ENV_SUPPORT for SPL
> - CONFIG_TPL_ENV_SUPPORT for TPL

Shouldn't it be the "supplement" ?

I guess that it is possible to define=20

CONFIG_SPL_ENV_SUPPORT to have ENV support in SPL

CONFIG_TPL_ENV_SUPPORT to have ENV support in TPL

and there is a third flag - CONFIG_ENV_SUPPORT to enable envs support
in U-Boot proper?

In that way one can enable ENV support only in SPL (via SPL_ENV_SUPPORT)
and disable envs in U-Boot proper (by NOT defining ENV_SUPPORT) and use
build in envs (in the binary).

>=20
> This new configuration allows to use the macro
> CONFIG_IS_ENABLED(ENV_SUPPORT) in the code without
> issue and solves the regression introduced by
> commit 7d4776545b0f ("env: solve compilation error
> in SPL"); change_ok was always NULL in U-Boot.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  cmd/Kconfig            |  2 ++
>  env/Kconfig            |  7 +++++++
>  env/Makefile           | 11 ++++-------
>  include/env_callback.h |  4 ++++
>  include/env_flags.h    |  4 ++++
>  5 files changed, 21 insertions(+), 7 deletions(-)
>=20
> diff --git a/cmd/Kconfig b/cmd/Kconfig
> index 05872fa..f7a1b1f 100644
> --- a/cmd/Kconfig
> +++ b/cmd/Kconfig
> @@ -465,6 +465,7 @@ config CMD_ENV_EXISTS
> =20
>  config CMD_ENV_CALLBACK
>  	bool "env callbacks - print callbacks and their associated
> variables"
> +	depends on ENV_SUPPORT
>  	help
>  	  Some environment variable have callbacks defined by
>  	  U_BOOT_ENV_CALLBACK. These are called when the variable
> changes. @@ -473,6 +474,7 @@ config CMD_ENV_CALLBACK
> =20
>  config CMD_ENV_FLAGS
>  	bool "env flags -print variables that have non-default flags"
> +	depends on ENV_SUPPORT
>  	help
>  	  Some environment variables have special flags that control
> their behaviour. For example, serial# can only be written once and
> cannot diff --git a/env/Kconfig b/env/Kconfig
> index 74db2f3..f0c5a7a 100644
> --- a/env/Kconfig
> +++ b/env/Kconfig
> @@ -1,5 +1,12 @@
>  menu "Environment"
> =20
> +config ENV_SUPPORT
> +	bool "Support all environment features"
> +	default y
> +	help
> +	  Enable full environment support in U-Boot,
> +	  including attributes, callbacks and flags.
> +
>  config ENV_IS_NOWHERE
>  	bool "Environment is not stored"
>  	default y if !ENV_IS_IN_EEPROM && !ENV_IS_IN_EXT4 && \
> diff --git a/env/Makefile b/env/Makefile
> index 90144d6..2a468ac 100644
> --- a/env/Makefile
> +++ b/env/Makefile
> @@ -5,10 +5,11 @@
> =20
>  obj-y +=3D common.o env.o
> =20
> +obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) +=3D attr.o
> +obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) +=3D flags.o
> +obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) +=3D callback.o
> +
>  ifndef CONFIG_SPL_BUILD
> -obj-y +=3D attr.o
> -obj-y +=3D callback.o
> -obj-y +=3D flags.o
>  obj-$(CONFIG_ENV_IS_IN_EEPROM) +=3D eeprom.o
>  extra-$(CONFIG_ENV_IS_EMBEDDED) +=3D embedded.o
>  obj-$(CONFIG_ENV_IS_IN_EEPROM) +=3D embedded.o
> @@ -19,10 +20,6 @@ obj-$(CONFIG_ENV_IS_IN_ONENAND) +=3D onenand.o
>  obj-$(CONFIG_ENV_IS_IN_SATA) +=3D sata.o
>  obj-$(CONFIG_ENV_IS_IN_REMOTE) +=3D remote.o
>  obj-$(CONFIG_ENV_IS_IN_UBI) +=3D ubi.o
> -else
> -obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) +=3D attr.o
> -obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) +=3D flags.o
> -obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) +=3D callback.o
>  endif
> =20
>  obj-$(CONFIG_$(SPL_TPL_)ENV_IS_NOWHERE) +=3D nowhere.o
> diff --git a/include/env_callback.h b/include/env_callback.h
> index 982c078..a757fe6 100644
> --- a/include/env_callback.h
> +++ b/include/env_callback.h
> @@ -72,6 +72,10 @@
>  	"serial#:serialno," \
>  	CONFIG_ENV_CALLBACK_LIST_STATIC
> =20
> +#if CONFIG_IS_ENABLED(ENV_SUPPORT)
>  void env_callback_init(struct env_entry *var_entry);
> +#else
> +static inline void env_callback_init(struct env_entry *var_entry) { }
> +#endif
> =20
>  #endif /* __ENV_CALLBACK_H__ */
> diff --git a/include/env_flags.h b/include/env_flags.h
> index e5380f2..ec480e3 100644
> --- a/include/env_flags.h
> +++ b/include/env_flags.h
> @@ -153,7 +153,11 @@ int env_flags_validate_env_set_params(char
> *name, char *const val[], int count);
>   * When adding a variable to the environment, initialize the flags
> for that
>   * variable.
>   */
> +#if CONFIG_IS_ENABLED(ENV_SUPPORT)
>  void env_flags_init(struct env_entry *var_entry);
> +#else
> +static inline void env_flags_init(struct env_entry *var_entry) { }
> +#endif
> =20
>  /*
>   * Validate the newval for to conform with the requirements defined
> by its flags



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/jvkLMl9c+_OPhepMIExc072
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl1vex0ACgkQAR8vZIA0
zr0U/QgAl+shGg/cvmxfSiCpxAmNiptAgVSXiA87kpmRyfmyEEWKpgjWTM1XZ739
PhIdtfiHmKtIn9uM9ulSbwDcMJASbVotQAyk1dlkDdbiEoW8pHcUu71QRjaxg/Yu
OCYunKEvhAanlyuYCpqUYlhc1vnu+B6yDrO7T/Id2m/R/Oyu3U337CTzL3LkAxuG
ss0rskk/KVaROXSQQy/CgE//x8UPHjGfr4WQ68Pl4xKFoawFEe44REXENzlc+iRk
y0vDzS56HGKwUaQqjdduB2F8eOvDYglsqgwmgLCeG4KKSZXAFFyWRBK7WpFizJkw
Wz0DybnFFujvhpnjRXhuZxRh53oa1Q==
=ti83
-----END PGP SIGNATURE-----

--Sig_/jvkLMl9c+_OPhepMIExc072--

--===============2051464084124629798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2051464084124629798==--
