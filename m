Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 743FBB19308
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Aug 2025 10:12:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B76CC36B3E;
	Sun,  3 Aug 2025 08:12:06 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAEC9C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Aug 2025 08:12:04 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b391ca6146eso2881074a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Aug 2025 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754208723; x=1754813523;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hayk1yNflQc5UUXr2YccUCUe18PpU1HKEwM8SBTIq3g=;
 b=Cpo+PSPJliV5L3hkwMfSLWttfJTG+Erpmt5A2xS+yEyiNJBvtuYwP8x7x9BqbS/8sR
 FQuep63ChyhPoMiaWi22BULa4Nsk1bc67tyNfb5gkQmucIkbrfoWwzcVSWXuzw8pEUNd
 fvXZF82yfFq27mQcb2k75m9G0Y5Tyz/79Qbmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754208723; x=1754813523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hayk1yNflQc5UUXr2YccUCUe18PpU1HKEwM8SBTIq3g=;
 b=mnJbG2EZQjta6x2ywqo189iDt9YGHS32/t6uvPTc6xxgVtG/VNhI/hYRpIC0Oo/CMP
 jjgTyy+3ulTg5kVNCGPXxa736NiiNeVZf/SdZsuk0b5AXN4/tdWT5pbSw5SXn6kwzrGr
 waVXnqbwtAMWRXm9rvYwmYaWwPg4BgZXr61rXLyZztiG1b1v5SsUkU1/cDA33NnNinXv
 msMkDHsi+nS738J5KMIQNJKUKXp3bJBfw00fPp/ySiW0XyHtyZf3JXUYuUd3I4OrFn8m
 4JWT4y8lacst+l6RBdS+84WpAe123uZqAwOKfEc43q/U0YFJkf3jaOGpBPpmmXGDMHFJ
 W7sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoCRLv/epMY63IVyANYLb3VLwgGc2wNLB9mBH03Aoxab3CZA/a+VlquJmtqpJ+QZh6UtHaJdQGWwQjhA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy3s5DGL3OjrxWXqACNQtWbWDPVn+ZaGH3p6mqu6W7boTKNcRCt
 i6rpEr+g97M0CxagfbwfaRRcfsoMO3LwZNVpD8f/n28F6JzNcmvdbj1Qi37UrFApMFLuePv5hjG
 91qIHQJcMVagW5OBtP0ee1CU2pE8vttKxEVEmnW1+Lw==
X-Gm-Gg: ASbGncsmUPMWdCm3gnC/Qno48ascFvtBMaesxp88JTmY059q8bSc2bskUdHCFdMkA6B
 8qils7Ev/DZkWenjFoWik8+hfjoLWbi3CifFjCKccXtyYONxf6HFbuBGj5eZGdmFOQBvlE1a/Qh
 eUxVk+TXv1wBHC/WxbFXvcjdPImAUReE5PoKk1+JYKOQWw0tlknSSnnziqWEWe2VFRl7Q2fNG2q
 6/NUg==
X-Google-Smtp-Source: AGHT+IGS8+qTnTp6eD8Fw/14Y92bZ65a74kNsvn4/0KOLorjUti//qgVnT6VGzhoHOAMoJubRxErdVsEAzp1b3DN8jE=
X-Received: by 2002:a17:90b:4a81:b0:31f:210d:2e56 with SMTP id
 98e67ed59e1d1-3211630de49mr6886013a91.28.1754208723155; Sun, 03 Aug 2025
 01:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtd_nand_raw2-v1-0-bdabdeb35b46@linaro.org>
 <20250801-mtd_nand_raw2-v1-3-bdabdeb35b46@linaro.org>
In-Reply-To: <20250801-mtd_nand_raw2-v1-3-bdabdeb35b46@linaro.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sun, 3 Aug 2025 10:11:51 +0200
X-Gm-Features: Ac12FXwKG0lKXI8lMDVxLNPHnayVxth5FpgWVhwLnWJjbPKvMnawjNj5WgM5xdY
Message-ID: <CAOf5uwnL_O4WGy3-n4QNbziv4X7EC+3N2tnUycDu5WH-6JPBwQ@mail.gmail.com>
To: Andrew Goodbody <andrew.goodbody@linaro.org>
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] mtd: nand: sunxi: Free allocated
	memory on errors
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
Content-Type: multipart/mixed; boundary="===============0693023103072240196=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0693023103072240196==
Content-Type: multipart/alternative; boundary="000000000000ce564d063b718b78"

--000000000000ce564d063b718b78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 1, 2025 at 12:39=E2=80=AFPM Andrew Goodbody <andrew.goodbody@li=
naro.org>
wrote:

> Add kfree calls on error paths for memory that was allocated. This will
> prevent memory leaks.
>
> This issue found by Smatch.
>
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c
> b/drivers/mtd/nand/raw/sunxi_nand.c
> index 34197bb09a1..1ce09b56b80 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1403,8 +1403,10 @@ static int
> sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
>         if (!data)
>                 return -ENOMEM;
>
> -       if (ecc->size !=3D 512 && ecc->size !=3D 1024)
> +       if (ecc->size !=3D 512 && ecc->size !=3D 1024) {
> +               kfree(data);
>                 return -EINVAL;
> +       }
>
>         /* Prefer 1k ECC chunk over 512 ones */
>         if (ecc->size =3D=3D 512 && mtd->writesize > 512) {
> @@ -1641,17 +1643,20 @@ static int sunxi_nand_chip_init(struct udevice
> *dev, struct sunxi_nfc *nfc,
>                 if (ret) {
>                         dev_err(dev, "could not retrieve reg property:
> %d\n",
>                                 ret);
> +                       kfree(chip);
>                         return ret;
>                 }
>
>                 if (tmp > NFC_MAX_CS) {
>                         dev_err(dev,
>                                 "invalid reg value: %u (max CS =3D 7)\n",
> tmp);
> +                       kfree(chip);
>                         return -EINVAL;
>                 }
>
>                 if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
>                         dev_err(dev, "CS %d already assigned\n", tmp);
> +                       kfree(chip);
>                         return -EINVAL;
>                 }
>
> @@ -1678,12 +1683,14 @@ static int sunxi_nand_chip_init(struct udevice
> *dev, struct sunxi_nfc *nfc,
>                 dev_err(dev,
>                         "could not retrieve timings for ONFI mode 0: %d\n=
",
>                         ret);
> +               kfree(chip);
>                 return ret;
>         }
>
>         ret =3D sunxi_nand_chip_set_timings(nfc, chip, timings);
>         if (ret) {
>                 dev_err(dev, "could not configure chip timings: %d\n",
> ret);
> +               kfree(chip);
>                 return ret;
>         }
>
> @@ -1705,8 +1712,10 @@ static int sunxi_nand_chip_init(struct udevice
> *dev, struct sunxi_nfc *nfc,
>
>         mtd =3D nand_to_mtd(nand);
>         ret =3D nand_scan_ident(mtd, nsels, NULL);
> -       if (ret)
> +       if (ret) {
> +               kfree(chip);
>                 return ret;
> +       }
>
>         if (nand->bbt_options & NAND_BBT_USE_FLASH)
>                 nand->bbt_options |=3D NAND_BBT_NO_OOB;
> @@ -1719,24 +1728,28 @@ static int sunxi_nand_chip_init(struct udevice
> *dev, struct sunxi_nfc *nfc,
>         ret =3D sunxi_nand_chip_init_timings(nfc, chip);
>         if (ret) {
>                 dev_err(dev, "could not configure chip timings: %d\n",
> ret);
> +               kfree(chip);
>                 return ret;
>         }
>
>         ret =3D sunxi_nand_ecc_init(mtd, &nand->ecc);
>         if (ret) {
>                 dev_err(dev, "ECC init failed: %d\n", ret);
> +               kfree(chip);
>                 return ret;
>         }
>
>         ret =3D nand_scan_tail(mtd);
>         if (ret) {
>                 dev_err(dev, "nand_scan_tail failed: %d\n", ret);
> +               kfree(chip);
>                 return ret;
>         }
>
>         ret =3D nand_register(devnum, mtd);
>         if (ret) {
>                 dev_err(dev, "failed to register mtd device: %d\n", ret);
> +               kfree(chip);
>                 return ret;
>         }
>

Reviewed-By: Michael Trimarchi <michael@amarulasolutions.com>



>
> --
> 2.39.5
>
>

--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

--000000000000ce564d063b718b78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 1, 2025 at 12:39=
=E2=80=AFPM Andrew Goodbody &lt;<a href=3D"mailto:andrew.goodbody@linaro.or=
g">andrew.goodbody@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Add kfree calls on error paths for memory that=
 was allocated. This will<br>
prevent memory leaks.<br>
<br>
This issue found by Smatch.<br>
<br>
Signed-off-by: Andrew Goodbody &lt;<a href=3D"mailto:andrew.goodbody@linaro=
.org" target=3D"_blank">andrew.goodbody@linaro.org</a>&gt;<br>
---<br>
=C2=A0drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--<br>
=C2=A01 file changed, 15 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi=
_nand.c<br>
index 34197bb09a1..1ce09b56b80 100644<br>
--- a/drivers/mtd/nand/raw/sunxi_nand.c<br>
+++ b/drivers/mtd/nand/raw/sunxi_nand.c<br>
@@ -1403,8 +1403,10 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct=
 mtd_info *mtd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecc-&gt;size !=3D 512 &amp;&amp; ecc-&gt;si=
ze !=3D 1024)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecc-&gt;size !=3D 512 &amp;&amp; ecc-&gt;si=
ze !=3D 1024) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(data);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Prefer 1k ECC chunk over 512 ones */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ecc-&gt;size =3D=3D 512 &amp;&amp; mtd-&gt;=
writesize &gt; 512) {<br>
@@ -1641,17 +1643,20 @@ static int sunxi_nand_chip_init(struct udevice *dev=
, struct sunxi_nfc *nfc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(dev, &quot;could not retrieve reg property: %d\n&quot;,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tmp &gt; NFC_MA=
X_CS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;invalid reg value: %u (max CS =
=3D 7)\n&quot;, tmp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (test_and_set_bi=
t(tmp, &amp;nfc-&gt;assigned_cs)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(dev, &quot;CS %d already assigned\n&quot;, tmp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -1678,12 +1683,14 @@ static int sunxi_nand_chip_init(struct udevice *dev=
, struct sunxi_nfc *nfc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;could not retrieve timings for ONFI mode 0: %d\n&quot;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sunxi_nand_chip_set_timings(nfc, chip, =
timings);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
could not configure chip timings: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -1705,8 +1712,10 @@ static int sunxi_nand_chip_init(struct udevice *dev,=
 struct sunxi_nfc *nfc,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtd =3D nand_to_mtd(nand);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nand_scan_ident(mtd, nsels, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nand-&gt;bbt_options &amp; NAND_BBT_USE_FLA=
SH)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nand-&gt;bbt_option=
s |=3D NAND_BBT_NO_OOB;<br>
@@ -1719,24 +1728,28 @@ static int sunxi_nand_chip_init(struct udevice *dev=
, struct sunxi_nfc *nfc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sunxi_nand_chip_init_timings(nfc, chip)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
could not configure chip timings: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sunxi_nand_ecc_init(mtd, &amp;nand-&gt;=
ecc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
ECC init failed: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nand_scan_tail(mtd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
nand_scan_tail failed: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nand_register(devnum, mtd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
failed to register mtd device: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Reviewed-=
By: Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.com">m=
ichael@amarulasolutions.com</a>&gt;</div><div><br></div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Nazzareno Trimarchi<br>Co-Founder &amp; =
Chief Executive Officer<br>M. +39 347 913 2170<br><a href=3D"mailto:michael=
@amarulasolutions.com" target=3D"_blank">michael@amarulasolutions.com</a><b=
r>__________________________________<br><div><br></div><div>Amarula Solutio=
ns BV</div>Joop Geesinkweg 125, 1114 AB, Amsterdam, NL<br>T. +31 (0)85 111 =
9172<br><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info=
@amarulasolutions.com</a><br><a href=3D"http://www.amarulasolutions.com" ta=
rget=3D"_blank">www.amarulasolutions.com</a><br></div></div></div>

--000000000000ce564d063b718b78--

--===============0693023103072240196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0693023103072240196==--
