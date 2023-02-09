Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C4690F8C
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Feb 2023 18:50:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63F05C6A5E8;
	Thu,  9 Feb 2023 17:50:03 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00C65C01E98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 17:50:01 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id ch10so1737681qtb.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Feb 2023 09:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WZzVn+pzKSlPunYrwIgOgV1+YYw5iiG2bieKJxPVX5Y=;
 b=AOLZepy0rU2DLtzhZ6fmg4cppyT/25UJHweVj8rgw2UZg+gs7Md3uguSrXHEb6RgFy
 CMjEAvTfSvIlUn6bxzVHjCEZvPpIVPjvvPpYdI/VKWVuPZb9R9uFoA+siSIKkFZfQeZv
 ruFQ303GaRTxDDCjD5O8SRLmKoeBlPvZb3O0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WZzVn+pzKSlPunYrwIgOgV1+YYw5iiG2bieKJxPVX5Y=;
 b=lbj+nVsmxYjr7uWjNKu02GeTN69BOEQD35Zqkvo7ClS/MkjqXW0isMleTF4+UBkgmj
 wA1xE6qUsPa3m6WCl3JA85Quz3wxPDyMlt8TIj0g0ctcWXRuZyI/EFz+vJj+vN4s4x3F
 WEeM8LuGF2sZdaswoy3tfDNDwjFBpbMj0ASAIptbHGhR7TXHFi4axo2GPF6rkFQondMb
 fL1xjnhntf5W5QL7Y3jGUh/QK/t3mq6JNnLhT6B9BJL6wmuaRcizMqHVARP2QzrK2gwr
 6yWz+zIHV2FZRzGD2eySFsaPA5X02b/v+PBr/d07uGPfuzl56sgWA2jzNl0UEQmN4j/3
 s7YQ==
X-Gm-Message-State: AO0yUKUX1tJBX2WAjy/dq9ZiyxKyuJAWeljB2tVxLO9iaS2ojFncKrPv
 h8v6ztJ7VBCzYf8JAkThP1c0sQ==
X-Google-Smtp-Source: AK7set+bECutiLE15/i8RQF/ELThj7cRQVwbGjcIiuKh5wkvrjzkBTDxTRtJMp7RQrHTJ2NWsC+QSg==
X-Received: by 2002:a05:622a:506:b0:3b7:ebb2:a4bf with SMTP id
 l6-20020a05622a050600b003b7ebb2a4bfmr20512480qtx.24.1675965000918; 
 Thu, 09 Feb 2023 09:50:00 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-538d-baa1-e57f-2a07.res6.spectrum.com.
 [2603:6081:7b00:6400:538d:baa1:e57f:2a07])
 by smtp.gmail.com with ESMTPSA id
 k13-20020ac8074d000000b003b630ea0ea1sm1647131qth.19.2023.02.09.09.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 09:50:00 -0800 (PST)
Date: Thu, 9 Feb 2023 12:49:58 -0500
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <Y+UyRnQI9TS4MLiP@bill-the-cat>
References: <20230205224118.233425-63-sjg@chromium.org>
 <20230205224118.233425-65-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20230205224118.233425-65-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 064/169] Correct SPL uses of DFU_VIRT
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
Content-Type: multipart/mixed; boundary="===============1101873563065750380=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1101873563065750380==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dm6fyh7l758rHHFW"
Content-Disposition: inline


--dm6fyh7l758rHHFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 05, 2023 at 03:39:33PM -0700, Simon Glass wrote:
> This converts 3 usages of this option to the non-SPL form, since there is
> no SPL_DFU_VIRT defined in Kconfig
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
> (no changes since v1)
>=20
>  board/st/common/stm32mp_dfu.c | 2 +-
>  drivers/dfu/Makefile          | 2 +-
>  include/dfu.h                 | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
> index 0096f71dfc1..19e9c3b2402 100644
> --- a/board/st/common/stm32mp_dfu.c
> +++ b/board/st/common/stm32mp_dfu.c
> @@ -159,7 +159,7 @@ void set_dfu_alt_info(char *interface, char *devstr)
>  	puts("DFU alt info setting: done\n");
>  }
> =20
> -#if CONFIG_IS_ENABLED(DFU_VIRT)
> +#if IS_ENABLED(CONFIG_DFU_VIRT)
>  #include <dfu.h>
>  #include <power/stpmic1.h>
> =20
> diff --git a/drivers/dfu/Makefile b/drivers/dfu/Makefile
> index dfbf64da667..df88f4be59a 100644
> --- a/drivers/dfu/Makefile
> +++ b/drivers/dfu/Makefile
> @@ -10,4 +10,4 @@ obj-$(CONFIG_$(SPL_)DFU_NAND) +=3D dfu_nand.o
>  obj-$(CONFIG_$(SPL_)DFU_RAM) +=3D dfu_ram.o
>  obj-$(CONFIG_$(SPL_)DFU_SF) +=3D dfu_sf.o
>  obj-$(CONFIG_$(SPL_)DFU_WRITE_ALT) +=3D dfu_alt.o
> -obj-$(CONFIG_$(SPL_)DFU_VIRT) +=3D dfu_virt.o
> +obj-$(CONFIG_DFU_VIRT) +=3D dfu_virt.o
> diff --git a/include/dfu.h b/include/dfu.h
> index 07922224ef1..06efbf4b208 100644
> --- a/include/dfu.h
> +++ b/include/dfu.h
> @@ -495,7 +495,7 @@ static inline int dfu_fill_entity_mtd(struct dfu_enti=
ty *dfu, char *devstr,
>  }
>  #endif
> =20
> -#if CONFIG_IS_ENABLED(DFU_VIRT)
> +#if IS_ENABLED(CONFIG_DFU_VIRT)
>  int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr,
>  			 char **argv, int argc);
>  int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,

This is I believe an intentional usage.

--=20
Tom

--dm6fyh7l758rHHFW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPlMjwACgkQFHw5/5Y0
tywyZAwAo5v+ou036grMRDqao4C/ZytqgADynq2iaVXKM76DFfXVVA83IqjaRk0d
sxbHcR5ZoCuDAu/LexKhK+rFxVT2yddhxnbsnpWFDH+KdtrM9/MxADMeMM/eufl3
zJp9AKIKZl5WEqpyVAzdrWlK36Xie3Hlqz9axV1rQ+zzvsUgxpFKclxSXBaCAPXr
Za8PImg91KLQaI942e1TAeD/S2YiE0SqYURegPzTjEaT7ZO/O9v4PpdSuLZEM9YI
SmyXDQU9vSX7xlMubyrpQUBmXrKSs5rMjAHC2xMjwhrQVq20ZGd1hUWwYvih8sgN
Y6+LBcO4ntT4EAdPXYucZ2sErCXW5cavWRxqVAZ+G9v6j24XDPBADbxxKWz6C6N+
K8QYeGZ2jgzOL8tE6TXvhyipYf1fp4vTioGQj7TkU+UmlZPzyXL1juSm1Nl3nSpy
t3ScBD1zVlBswyjLmaKP/8fyKw4oggesRmMPevj2qy5vbkJEpsDwPA58TmLlQOJC
p5/+RcQG
=dxP3
-----END PGP SIGNATURE-----

--dm6fyh7l758rHHFW--

--===============1101873563065750380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1101873563065750380==--
