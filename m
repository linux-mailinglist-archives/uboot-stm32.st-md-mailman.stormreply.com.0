Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66B64A994
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 22:34:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 805F9C65E74;
	Mon, 12 Dec 2022 21:34:52 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB1A3C65047
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 21:34:50 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id a16so10203861qtw.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 13:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eMzebuxOH3/PJFe/Iap4g5MFZ1OKLi1dtFUmr3pTmS0=;
 b=MnFLm2YyLBzanQHOgNCeB16PhMXQ4fCKR51UwSkjbXjaCjU5BmMKu2Kw2XNgOvwNhI
 o2moiQDErtSsfUf7QGEVq1YoquOlpgGqpyFO7oznG3IOo7Nap710h/JuwVaVY0mbZYjM
 bX6lthTW0cQrv+OdF1dKccMvsW3JkAzR/i6RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMzebuxOH3/PJFe/Iap4g5MFZ1OKLi1dtFUmr3pTmS0=;
 b=0BUIKRQsL3KjQ9ROzgo0GK+uGEXnLz3NjdS+5TIhXYWVO63YfuD9POVjhANgyg0nw/
 AJ9ej3dicDfpZKykm6TS6I9wEX1bUHVzeROUzJJkjXA/+rsb7wng8B+ZXZATPtXCpMZz
 Xcz02ef8OPZRXUOk0hrudfS14ITvj/qk/1PNVpJ0LJEsEub0GPm1ePReomD7Wkfr4M58
 qpuc37s4CqZ8n4B2teM0V04HiwenfliHvjnZNIGXKPxP7vPDn5gIdaboFpjbdmWfgYwT
 gtG7MNgRYDWIbwadvU00YUISKktEvjDDarHRpwfTXxqwhQYNfM3FOaQjHUrOw9MOzD/W
 Fmow==
X-Gm-Message-State: ANoB5plJyJKmzjipCCGIjPv4gFHpqR96pAVZMnAHYq2LRT5CIzwRHUV6
 LMq9wStaU/Jv2psAA7sQBmhIxQ==
X-Google-Smtp-Source: AA0mqf4Nf1SatqnNjx2iwh9W5wV0rxEVLe6EfmxfYmp448eTrE4vxKjg/GIf5HNvbi0zecOCnV2cyA==
X-Received: by 2002:ac8:4750:0:b0:3a6:a699:3cd8 with SMTP id
 k16-20020ac84750000000b003a6a6993cd8mr26322726qtp.57.1670880889827; 
 Mon, 12 Dec 2022 13:34:49 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-8c5e-02dc-44a6-fa90.res6.spectrum.com.
 [2603:6081:7b00:6400:8c5e:2dc:44a6:fa90])
 by smtp.gmail.com with ESMTPSA id
 j21-20020ac84415000000b0035cd6a4ba3csm6402481qtn.39.2022.12.12.13.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 13:34:49 -0800 (PST)
Date: Mon, 12 Dec 2022 16:34:47 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20221212213447.GE3787616@bill-the-cat>
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <20221028110055.1.If04f25e393f3af8cd75af331ca2f432a7a1b88e8@changeid>
MIME-Version: 1.0
In-Reply-To: <20221028110055.1.If04f25e393f3af8cd75af331ca2f432a7a1b88e8@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 u-boot@lists.denx.de, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/3] cmd: pxe: reorder kernel treatment in
	label_boot
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
Content-Type: multipart/mixed; boundary="===============5841110048805226696=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5841110048805226696==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wEwhcsWiXxSN4Vns"
Content-Disposition: inline


--wEwhcsWiXxSN4Vns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 11:01:18AM +0200, Patrick Delaunay wrote:

> Reorder kernel treatment in label_boot at the beginning of the function.
>=20
> This patch doesn't change the pxe command behavior, it is only a
> preliminary step for next patch, build kernel_addr before parsing
> the label initrd and fdt to build the next bootm arguments.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied to u-boot/next, thanks!

--=20
Tom

--wEwhcsWiXxSN4Vns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOXnnEACgkQFHw5/5Y0
tyzrggwAkS1CZskiUAZatBdlhnAtgz8enF3eMpBkaQ2V7MuY9YiI4dTnvg28CDe7
O+EOD8zflSqfZ421HoGbJuqRnTxsNK0sfJOKzFVjROarmEYiN5GYPVZ2/d5u6UTt
V3E0g/yo+Ob0sN7yxT3tn7JTrr6RtPTsQ8FyWW4ObuC2poWI8aNNMzlStdJuSynO
IhYnIyb5fZHdrzIZCWmiJr63Mrrh5ycAUsXgf9Zu8D6/b/bElHvIvYpzEazFxHpn
w73WH/J13gjqMfm60O3Mr10vTL8On9WgJ/oZJ8mcwCrlF11vmRoclbDrcvvfdewv
xehEQ82e5a6fOaBWnNOdXVR2M1ONwVYIpABEm9hMrWONjMVn7ZUrE6TCBy5bVdMK
IRyS2/nPDcnIkp1F9Q0pLRS7a+M1nFbVny0HVM83v909JXvZjv25bfDDsaYZAl+K
s7fowQJDCMJUazuBcnhVtU+G3b45LpKswf7Tf65/7VXonbi6YUEpBOu/jqj69y3X
MqYiOuVa
=WPzH
-----END PGP SIGNATURE-----

--wEwhcsWiXxSN4Vns--

--===============5841110048805226696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5841110048805226696==--
