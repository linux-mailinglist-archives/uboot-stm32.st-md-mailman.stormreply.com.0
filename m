Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 006853FFDF1
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 12:08:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95004C597AC;
	Fri,  3 Sep 2021 10:08:17 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF54AC58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 10:08:14 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id r7so7261056edd.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Sep 2021 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q9oWzw1j8RRHPZ7uZ7VYN1ooJhdayrSqHp7lF3IQm6A=;
 b=S0/AGzROaB7kxCfKZarhR6qD20QPC7f2Hh952H1Nl4u6ljyeSFBuS4fpYepxhuLCrz
 Si8aOb9bL0guI0GzBhep39EqBJOnmG0IbJ16S9mlNRtb14tXTxCloZttYg+BJHtiOp/p
 jwN50lSX+vuagSsnGZ3NWhU6SYHc9nTr/LiSE4tI1mzcKZv2N8k1+6lisQy4r+97Yu70
 rzz3uwyuHcwmBY3vmU4KAOwYwSEv+ETGubzjwW1OIqekpmatywFjhgrUzWQnMR9i08a8
 rh06VUAS81eGtuw3GKFDR3a4zv8ARnIH9GpJqY7SDLgkGliF2/QltAD7HeSAT7LwRm7k
 b+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9oWzw1j8RRHPZ7uZ7VYN1ooJhdayrSqHp7lF3IQm6A=;
 b=nqd1XD/YwZMXue76ggT3ze6CgHsw8cIKaxVTyDltuBfLToEbFnkV++95fO4mtDg1Jw
 dpVKNN/nv6VncXzou81CM4z2R3y+x/zZcG1rU4L+AEywgtCo9Fdtvn1qPIJl/FsVMgPm
 t3Lmlrn9tE3xxMd9Zo+au+gQ2h6UBE/tWFEyc72/SIuT/TIQubwE1Y9Xsz1wrkOvrUdA
 /fd+drrkWBcnJwi6yuEQNHJxGSvJSDwBK8eC74VqDjJ8Yz1LveoddQ7CbqzZbeDI3SkR
 tbiN67zRNTKwCMc27NyzC9Ah/PTt2vNZ6C1+YhCXdrhHwJx86uAB1LzqLNZu581VVqIJ
 +N8w==
X-Gm-Message-State: AOAM5307VDL+nuT2mqjbSmvJe19ApP0n5i2fBkbU02j/rduqfwyKDQKa
 F7PCgfD2ZlZhOrnI36pyarYMnGs5lwL9EkY+FcieRA==
X-Google-Smtp-Source: ABdhPJysMd092/Dot09rtioj+kHFS7GQ8+BLdSkW3gIPcGFJc5W591R5cFceNp1zc5juxOu6wQFiNZD5lg4mDIVTitc=
X-Received: by 2002:a05:6402:4311:: with SMTP id
 m17mr3244881edc.188.1630663693898; 
 Fri, 03 Sep 2021 03:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
 <20210902115512.2.Ibfbc7792766c73de7904b13321d9fc5658d929a8@changeid>
In-Reply-To: <20210902115512.2.Ibfbc7792766c73de7904b13321d9fc5658d929a8@changeid>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 3 Sep 2021 12:08:02 +0200
Message-ID: <CAN5uoS-EY6B-nd+AmDVUOQZ2mRFC4c-v8n_q5jMM4VP28dMrow@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>, "Alex G ." <mr.nuke.me@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] tee: add a stub for tee_find_device
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
Content-Type: multipart/mixed; boundary="===============8654279485174486642=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============8654279485174486642==
Content-Type: multipart/alternative; boundary="00000000000039376405cb147a99"

--00000000000039376405cb147a99
Content-Type: text/plain; charset="UTF-8"

Hello Patrick,

On Thu, 2 Sept 2021 at 11:56, Patrick Delaunay <patrick.delaunay@foss.st.com>
wrote:

> Add stub for tee_find_device function when CONFIG_TEE is not activated
> to simplify the caller code.
>
> This patch allows to remove the CONFIG_IS_ENABLED(OPTEE) tests
> for stm32 platform.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  arch/arm/mach-stm32mp/fdt.c        |  1 -
>  board/st/common/stm32mp_mtdparts.c |  3 +--
>  include/tee.h                      | 11 +++++++++++
>  3 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
> index a19e954cf7..91330a68a4 100644
> --- a/arch/arm/mach-stm32mp/fdt.c
> +++ b/arch/arm/mach-stm32mp/fdt.c
> @@ -341,7 +341,6 @@ int ft_system_setup(void *blob, struct bd_info *bd)
>          * when FIP is not used by TF-A
>          */
>         if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &&
> -           CONFIG_IS_ENABLED(OPTEE) &&
>             !tee_find_device(NULL, NULL, NULL, NULL))
>                 stm32_fdt_disable_optee(blob);
>
> diff --git a/board/st/common/stm32mp_mtdparts.c
> b/board/st/common/stm32mp_mtdparts.c
> index 8b636d62fa..18878424c7 100644
> --- a/board/st/common/stm32mp_mtdparts.c
> +++ b/board/st/common/stm32mp_mtdparts.c
> @@ -119,8 +119,7 @@ void board_mtdparts_default(const char **mtdids, const
> char **mtdparts)
>         }
>
>  #ifdef CONFIG_STM32MP15x_STM32IMAGE
> -       if (!serial && CONFIG_IS_ENABLED(OPTEE) &&
> -           tee_find_device(NULL, NULL, NULL, NULL))
> +       if (!serial && tee_find_device(NULL, NULL, NULL, NULL))
>                 tee = true;
>  #endif
>
> diff --git a/include/tee.h b/include/tee.h
> index 2ef29bfc8f..44e9cd4321 100644
> --- a/include/tee.h
> +++ b/include/tee.h
> @@ -307,11 +307,22 @@ bool tee_shm_is_registered(struct tee_shm *shm,
> struct udevice *dev);
>   * Returns a probed TEE device of the first TEE device matched by the
>   * match() callback or NULL.
>   */
> +#if CONFIG_IS_ENABLED(TEE)
>  struct udevice *tee_find_device(struct udevice *start,
>                                 int (*match)(struct tee_version_data *vers,
>                                              const void *data),
>                                 const void *data,
>                                 struct tee_version_data *vers);
> +#else
> +static inline struct udevice *tee_find_device(struct udevice *start,
> +                                             int (*match)(struct
> tee_version_data *vers,
> +                                                          const void
> *data),
> +                                             const void *data,
> +                                             struct tee_version_data
> *vers)
> +{
> +       return NULL;
> +}
> +#endif
>
>  /**
>   * tee_get_version() - Query capabilities of TEE device
> --
> 2.25.1
>
>
Acked-by: Etienne Carriere <etienne.carriere@inaro.org>

--00000000000039376405cb147a99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Patrick,</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 2 Sept 2021 at 11:5=
6, Patrick Delaunay &lt;<a href=3D"mailto:patrick.delaunay@foss.st.com">pat=
rick.delaunay@foss.st.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Add stub for tee_find_device function when CONFIG_=
TEE is not activated<br>
to simplify the caller code.<br>
<br>
This patch allows to remove the CONFIG_IS_ENABLED(OPTEE) tests<br>
for stm32 platform.<br>
<br>
Signed-off-by: Patrick Delaunay &lt;<a href=3D"mailto:patrick.delaunay@foss=
.st.com" target=3D"_blank">patrick.delaunay@foss.st.com</a>&gt;<br>
---<br>
<br>
=C2=A0arch/arm/mach-stm32mp/fdt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br=
>
=C2=A0board/st/common/stm32mp_mtdparts.c |=C2=A0 3 +--<br>
=C2=A0include/tee.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 11 +++++++++++<br>
=C2=A03 files changed, 12 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c<br>
index a19e954cf7..91330a68a4 100644<br>
--- a/arch/arm/mach-stm32mp/fdt.c<br>
+++ b/arch/arm/mach-stm32mp/fdt.c<br>
@@ -341,7 +341,6 @@ int ft_system_setup(void *blob, struct bd_info *bd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* when FIP is not used by TF-A<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &a=
mp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_IS_ENABLED(OPTEE) &amp;&am=
p;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !tee_find_device(NULL, NULL, NULL=
, NULL))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stm32_fdt_disable_o=
ptee(blob);<br>
<br>
diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_m=
tdparts.c<br>
index 8b636d62fa..18878424c7 100644<br>
--- a/board/st/common/stm32mp_mtdparts.c<br>
+++ b/board/st/common/stm32mp_mtdparts.c<br>
@@ -119,8 +119,7 @@ void board_mtdparts_default(const char **mtdids, const =
char **mtdparts)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0#ifdef CONFIG_STM32MP15x_STM32IMAGE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!serial &amp;&amp; CONFIG_IS_ENABLED(OPTEE)=
 &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tee_find_device(NULL, NULL, NULL,=
 NULL))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!serial &amp;&amp; tee_find_device(NULL, NU=
LL, NULL, NULL))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tee =3D true;<br>
=C2=A0#endif<br>
<br>
diff --git a/include/tee.h b/include/tee.h<br>
index 2ef29bfc8f..44e9cd4321 100644<br>
--- a/include/tee.h<br>
+++ b/include/tee.h<br>
@@ -307,11 +307,22 @@ bool tee_shm_is_registered(struct tee_shm *shm, struc=
t udevice *dev);<br>
=C2=A0 * Returns a probed TEE device of the first TEE device matched by the=
<br>
=C2=A0 * match() callback or NULL.<br>
=C2=A0 */<br>
+#if CONFIG_IS_ENABLED(TEE)<br>
=C2=A0struct udevice *tee_find_device(struct udevice *start,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int (*match)(struct tee_version_data=
 *vers,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const void *data),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct tee_version_data *vers);<br>
+#else<br>
+static inline struct udevice *tee_find_device(struct udevice *start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int (*match)(struct tee_version_data *vers,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const void *data),<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const void *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct tee_version_data *vers)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
+}<br>
+#endif<br>
<br>
=C2=A0/**<br>
=C2=A0 * tee_get_version() - Query capabilities of TEE device<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>Acked-by: Etienne Carriere &lt;<a href=
=3D"mailto:etienne.carriere@inaro.org">etienne.carriere@inaro.org</a>&gt;</=
div><div>=C2=A0</div></div></div>

--00000000000039376405cb147a99--

--===============8654279485174486642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8654279485174486642==--
