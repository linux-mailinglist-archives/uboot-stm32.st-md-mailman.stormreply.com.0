Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AA548D9AB
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Jan 2022 15:24:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF00BC5F1F5;
	Thu, 13 Jan 2022 14:24:21 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EFE9C5F1F4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 14:24:20 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id h15so2614386qtx.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 06:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3DUpEiIgbtExy4R2HgenUwhHoYABakTgyXXo6z5nqhY=;
 b=RVkzVPvKE4SpnKcqeazDBRF5TVsa+tsPtJZ8J9ekL8VB5Au75Au9wrTr01vE7Tcxni
 /u+E9YDK+21yuRSTXCM2Ibxh6GAonIm5rEoQo6s58WZCke4f+OtgnmQtU6/avp8J03Ii
 zUhxB1ZGRG1Qc46mskq7b5cZ++2vBwi0xozo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3DUpEiIgbtExy4R2HgenUwhHoYABakTgyXXo6z5nqhY=;
 b=jD36Uo4qMLaAH4n59twg4aUD0CiHmZugL9Sgygoke/EjTQaULnH1QVjoWlCjHGrtcL
 OrJNbSbFRy76y3Aj/kGo9aRZO9KODhnh+wGp93RLc8qYg5aANyqPh2ehA1LX38oH93w8
 IyxQnX13KH+e4PK+KvVCABNH4+xD5JoJJTpHwouTGWbTC/X2OfpdR/rpdFQrQmvytCfR
 0B6PdYyWFzZjAR78VAx3rU7jWEfWk5jUPpm5mpzlfIcIUu2uys/muvuoBnsum0KDYIVU
 41ILlp+V2QOVip5aCr6+5j4Gl1pN0wmVuAycXoprc6opDWN8i78+exmeISIri6NnNeTZ
 GsSw==
X-Gm-Message-State: AOAM533URbqGn1Kz4Wm7a3CjUWT7/q56effNOtSvW3i5K0HzFuso6tSC
 pb550bngEN+klVvZ5DCEOsCfIg==
X-Google-Smtp-Source: ABdhPJy69Xp5pKdnCwX8Inncy9iQos0/1e9FnEDFxUDXVhsmWCqBrddI4ZxXjMph0DYFRhXhh9uflg==
X-Received: by 2002:ac8:5901:: with SMTP id 1mr3710665qty.278.1642083859119;
 Thu, 13 Jan 2022 06:24:19 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2440-966a-5ce3-c6d0.res6.spectrum.com.
 [2603:6081:7b01:cbda:2440:966a:5ce3:c6d0])
 by smtp.gmail.com with ESMTPSA id j14sm1904992qkp.28.2022.01.13.06.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 06:24:18 -0800 (PST)
Date: Thu, 13 Jan 2022 09:24:16 -0500
From: Tom Rini <trini@konsulko.com>
To: Sean Anderson <seanga2@gmail.com>
Message-ID: <20220113142416.GU9207@bill-the-cat>
References: <20211201192653.2171260-1-seanga2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211201192653.2171260-1-seanga2@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Hai Pham <hai.pham.ud@renesas.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: Re: [Uboot-stm32] [PATCH] treewide: invaild -> invalid
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
Content-Type: multipart/mixed; boundary="===============6824496502634775253=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6824496502634775253==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OQpOxDqDax7rN7YB"
Content-Disposition: inline


--OQpOxDqDax7rN7YB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 02:26:53PM -0500, Sean Anderson wrote:

> Somewhere along the way, someone misspelt "invalid" and it got copied
> everywhere. Fix it.
>=20
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> Reviewed-by: Alexander Dahl <ada@thorsis.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--OQpOxDqDax7rN7YB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHgNhAACgkQFHw5/5Y0
tywU0gwAjy62v8L9GnQzZBUK648VqW5bOWF/Z4b2h5YYl69drZtGOtAMuVwl7pnE
SNzuTzO5IZCJ/M8tjVVj2YtlM1kH9IQLh0NYqbTcsClVZBpI/Bbh+Vp1Z6M4FjOz
Uj60gfhQOTfrI4Cvm+/zLzBwhPc2SM5RGy6mnefI+g26JCj2/W+5i7LSzYVNI0O5
sa71AVJpeSimRR1H81NfHlKKrLj6OVSBUqE3Lcsveewzy0sRxdBPPO/rLuf3XnEz
zZoTIKHc7VEyR+KMO5F6VXzi13l/XM8dUrpvmXDxMfu+TzfYPGhALlAt1Rz3kNVE
YGIF+eWZLfMrcw5V50KS/AFDfMOWEMq1cOl1P5sEI2nLUAtpihBoTxgJ2uLZzNi0
TM3mWkhvDCfwlD0U8p6EwUJX0bV9Ti88YEufn4Ie3O7UMLmsTbn0g0njtD9FdXVp
2IVkNXphKa6S+8QPh85JSmmEr58r0dUFmjSRLh4ZIL+O1TKqhPvLK5kXL5kDp/jr
YAQKRSwF
=xptJ
-----END PGP SIGNATURE-----

--OQpOxDqDax7rN7YB--

--===============6824496502634775253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6824496502634775253==--
