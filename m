Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD83DA95B
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jul 2021 18:49:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4636EC57B6B;
	Thu, 29 Jul 2021 16:49:28 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6AFBC57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 16:49:26 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id a19so4384375qtx.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kt6iSHC/RSBbeRISy5s0Fej/hMa157954/4aQBq6UMQ=;
 b=cqITlTd3+rF4YeWTMGJA3ORV1yFxjZWCx+jCalw9VDxzEVCESiKaZmWZJ5ymDPKZDv
 UfVtom3V3Z7l+vyIht7Xx2wtxy2kiK6/ZhE/pK9xCnorC4GlyiiEsJax465xBSZ4whEb
 D6P04ubZeZprCjqvxNpRhp4h5GQGwo3cB1Q8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kt6iSHC/RSBbeRISy5s0Fej/hMa157954/4aQBq6UMQ=;
 b=HZctQDuAd9Pgdsvp+nledsvpKa10gWyeC60i6oNSqMpTA/YtPkuw/Zj99uNo6/QfBR
 mTlQw+KWIxjBgQRjD88aOS9LfN0c01evMbSuYAuOD4tVyJYHd/vBZar3Iu2vVUCcrfYD
 RRlbavLdwE+/42OCYUB9T6bYpYSKwQSPDi4xFkECRISoWMDBjjtKs4OClVtghPXEctvr
 6O15QwAKTVKJSPrHmVkdRcs3CaLCNin8LZ+96RQLFn1T9byo7EPUCwYd+XsKdUW9QQXv
 W6348DHJSuQF7RkQyg1c2ua4MBxBKxCFJMrr082sjBMAFpagf6qB2TPOgFaKj2rcBH86
 H3nw==
X-Gm-Message-State: AOAM530eLoEXlWRT6EI3bvfq2OzBla3FdQhm/XxdD/hMql8Pf6F7PUOP
 SlSso2NTHt3wBke62i2QJbsgow==
X-Google-Smtp-Source: ABdhPJw6tAQuMr6YVId3/efOFbwSeanWhHlPa0k6fcKqU6PFQ4YWQxQUSftIhHmPoysJ/Xr9wgsbzA==
X-Received: by 2002:ac8:7691:: with SMTP id g17mr4900554qtr.287.1627577365850; 
 Thu, 29 Jul 2021 09:49:25 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-94ed-10de-2168-2ec4.res6.spectrum.com.
 [2603:6081:7b01:cbda:94ed:10de:2168:2ec4])
 by smtp.gmail.com with ESMTPSA id g24sm1437917qtr.86.2021.07.29.09.49.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Jul 2021 09:49:25 -0700 (PDT)
Date: Thu, 29 Jul 2021 12:49:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210729164922.GT9379@bill-the-cat>
References: <20210719092151.1346480-1-patrick.delaunay@foss.st.com>
 <20210719112135.v2.1.Idb1d70f42e92c6b612467611501246064bcddeef@changeid>
MIME-Version: 1.0
In-Reply-To: <20210719112135.v2.1.Idb1d70f42e92c6b612467611501246064bcddeef@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Ryder Lee <ryder.lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Weijie Gao <weijie.gao@mediatek.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Harald Seiler <hws@denx.de>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] arm: use the correct prototype for
 reset_cpu function
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
Content-Type: multipart/mixed; boundary="===============3584512454611343067=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3584512454611343067==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Iu0Tl93s8YP0EGMr"
Content-Disposition: inline


--Iu0Tl93s8YP0EGMr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 11:21:50AM +0200, Patrick Delaunay wrote:

> Align reset_cpu function with the next prototypes in
> sysreset.h or in cpu_func.h to solve compilation issue:
>=20
>   void reset_cpu(void);
>=20
> This patch solves the prototype conflict when cpu_func.h is
> included.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--Iu0Tl93s8YP0EGMr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmEC3BIACgkQFHw5/5Y0
tyzXuAv/TxZFYyhJPHoSgvIFIjMBwa64yXD7LYg0n7UYKO1Kg6hdj30ra+sxO+4H
pkK/uEs6dGBDAyjLwgFQuyPBwxtj5wNQvYCWHY7Ws9AJ0r+yIv1nNypy2YfGpF8k
JnEoflx5PfYEzOEjp3kZhaf43WVXSi7RSyh9+n1msglviYm0X6RSm4T5A4cMX+zp
7QCvYN+QFox9TbnMeecmgzBfSqcY5jNi8A7cCp9ex0wDoTP4Tt0O/yxHj+m2DRm9
wKMMRKKY5uFo359dliXeQAkcOthcDrBBolk5BGrTzpOkHs2iV+OUObBXFsYwkjxt
q+IvVk5yPfe0ZDBE7SOnarJ61QJQl3w4nylYgleSgXiH/BlTWgj1oqKHeFdssXIS
qLmlqv/1toAGIqvCsgAwO1l3JoWmFUfBwHv80R8ZIYpks5HzBHHXtkpi/evwRFLZ
szb9Mgv+HD84F7BbnzZgpWgyinVLBAEuaROvSe3gWtwXdwlDNL1Esl0bOC6l6lBc
GAvo6gz7
=4H3o
-----END PGP SIGNATURE-----

--Iu0Tl93s8YP0EGMr--

--===============3584512454611343067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3584512454611343067==--
