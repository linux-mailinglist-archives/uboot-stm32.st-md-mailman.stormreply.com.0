Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A94FB2F8DA7
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:22:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73024C57190;
	Sat, 16 Jan 2021 16:22:03 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07BF6C5717E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:22:01 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id 2so8319596qtt.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ceKO8PxUQMC8XtxEfaOYr6VTeSIMnAel5H9N9BJElus=;
 b=c9GVAZ11+WvQ4CJZWVTYWqv+BtZnLkyLGaisPZWSKrBxC22SPU4mRx0TU5PA7C2dnH
 y8BKeYUoiRyZEOQJ/neusNBAd9skZLBFGc1v+qFK1ALDZxq+0OEPxNGfMmY1Dp9KA2SI
 F0MWfvPrvfEpd9q08eR9NN9WfQ1jtGRF1Mods=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ceKO8PxUQMC8XtxEfaOYr6VTeSIMnAel5H9N9BJElus=;
 b=t15d0LcxV1vhZcm3CXH097IDOnBaeANR35lpUjCFNjmJjtWHvK7vqrHll8f3bQ3F6y
 CPR8VuEf/s/8Se8F8VajLkHpJ9JTpSKjcrMk+Ln/Ub32RyXoVTsVuL87hfcmzwg4feT9
 P4W2F35YCRwXqEKbFseEZ2E+7b0z1d37UmljxqKREvH2OMTtKHVInQr9NDl2KdbPH+v0
 GCuWesxTr3gooyo5Juf/V5PC203RFtUFiKuuKcsiTl/4zjWlcSyBJDI2lDvAJrB8buiy
 7tlmxErZ2adwit6C7ZseCs/sgJtt5GF47ybAKntre4WNY55zVqDklU32mM08Ew/REn4L
 TKYQ==
X-Gm-Message-State: AOAM533WQwGDa9NyddQ5NYb2zZBTrz2R0dyU8IqSrr87urwMr/90Zchk
 FNZoUX2ooSFEFWIPca3vPiVzhg==
X-Google-Smtp-Source: ABdhPJzepeCZYGNeXv+dcdLR/M5SKo+pdxB7P+CC+EKeBpsL3Z2luP+Xw3iQa8hGe547rF+BZy2otQ==
X-Received: by 2002:ac8:4445:: with SMTP id m5mr16702287qtn.179.1610814120022; 
 Sat, 16 Jan 2021 08:22:00 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id 8sm7129765qkr.28.2021.01.16.08.21.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:21:59 -0800 (PST)
Date: Sat, 16 Jan 2021 11:21:57 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116162157.GP9782@bill-the-cat>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-5-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-5-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 6/9] console: remove duplicated test on
	gd value
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
Content-Type: multipart/mixed; boundary="===============0128871245916716541=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0128871245916716541==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A6Z7MKnLVMfR85kG"
Content-Disposition: inline


--A6Z7MKnLVMfR85kG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:20:56AM +0100, Patrick Delaunay wrote:

> Reorder test on gd value and remove the duplicated test (!gd)
> in putc and puts function.
>=20
> This patch is a preliminary step for rework of this function.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Sean Anderson <seanga2@gmail.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--A6Z7MKnLVMfR85kG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEqQACgkQFHw5/5Y0
tyydGgv/UeicwB9uFPuAyHMCMNRJlEpKsE8zTgDOPaK0zeBCJReW77ilU4ZujUE0
1cEX3KoFQ1/lu1bq3NECuCfgNAza9wJHzxv2TrExCjPrri691xb22pYS+HMXKrmR
aS2+4TgtMkkmdn3YohGRs7xaN83SQSrMgpIfXijs6+4wNWnGrj4f3hzhAV2y7waP
4X6TFK47kVo13rLNal1MvxdfkuJNcKBQg4ZAAJgJy1CHtdTrNA32MmzxovBcrH0m
xtr1F/KNB5J33CZzrQfIiS7ZitSVuLFn5PmYpetfLzMAB+BBG5fXB7YyBfzdfGX8
8x7fdDIOp8o9g/tUHCbuxY55wCyr8jEnlk539VGh1hyHtQuQowkFUbljBmEEqm7B
LDb12CGD72BoSUrZ2YQiN0+mKMMHmHklApIb/OcwsnuvIj0QgiQFxzyDnmiNv4Mv
hGvMGC4Tu0600HwAvKkPnrYqL+ad79/PmMiH8OoGVHIgvTI2M6WvG1982yPEGW2M
FTKrg7fD
=uS5w
-----END PGP SIGNATURE-----

--A6Z7MKnLVMfR85kG--

--===============0128871245916716541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0128871245916716541==--
