Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903D4A3170
	for <lists+uboot-stm32@lfdr.de>; Sat, 29 Jan 2022 19:49:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33DA8C5EC56;
	Sat, 29 Jan 2022 18:49:48 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1262C57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jan 2022 18:49:46 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id y8so7995052qtn.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jan 2022 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VV+JoKddFafoeu+mauf3VlT+0xAaQzhR46NuEwh6eHc=;
 b=uWtCYmJ3b/tVJfnxTpomhl9JYa9XbqUO7dVeJQxYd5YFBMcHAcP9rNgoBtWgtjOhtu
 z08goQHoZx/7SHrAFxMB96bfyyA5Q3ob2vwuP3eyZNS77ewvEa9RywxIrIkRTAwKLHRg
 Xs3dFvF47epP3c7miOgJkYbykfTsUICTp0JYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VV+JoKddFafoeu+mauf3VlT+0xAaQzhR46NuEwh6eHc=;
 b=N17TDsrhDSdBj701vj8jbg/2PmvuyiBFDsoIZ3uNK822gJpMRtFIcc601TVan3cvuk
 iYdjpLD4ogw3eqfg4nkcDqMCvdT808+kTdrGsjT6urUbbd3PVk5DSHCmD6aU4JXSCxtq
 +q/nEfX10QzhoNORgvlQcZSQVjV+BIXJvrHT2Fjky+t897DuTh5CpkRO2gE/ma/nbhJm
 eTdOv9X+QVBNaOgIhnaE2yDMvfYoovhSBscHUM8DZdGSjkefhjpftAiQxDLMmhVZdiPO
 adrIqy062DruM0A0KJ10edHuDLu18q5nJ19hTTcW83BGzdGZD0nHGlQcL61TI7Ed9kzy
 JlSQ==
X-Gm-Message-State: AOAM532sS+PFe2QAiJRaub9ssTiOgveHvkMnihY02euDBni2KpwJm2ke
 ecQIRbMA64V1kbrDgYY6HuldtA==
X-Google-Smtp-Source: ABdhPJwsPHPiXW+sEHFzjovexj4wicackjHbqaJHFXiB7jzqxSjQzaHsz9zT3hauvsnDlChNQK/Snw==
X-Received: by 2002:ac8:5c16:: with SMTP id i22mr10058694qti.669.1643482185851; 
 Sat, 29 Jan 2022 10:49:45 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id s34sm5381610qtc.88.2022.01.29.10.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 10:49:45 -0800 (PST)
Date: Sat, 29 Jan 2022 13:49:43 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220129184943.GC7515@bill-the-cat>
References: <20220118102619.1.I161a621b6f151ada380bedac41d2a2bd67d47933@changeid>
MIME-Version: 1.0
In-Reply-To: <20220118102619.1.I161a621b6f151ada380bedac41d2a2bd67d47933@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dfu: mtd: skip empty pages when writing
 page for UBI partition
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
Content-Type: multipart/mixed; boundary="===============1465014254203313556=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1465014254203313556==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8lT/blNmSiRvUClR"
Content-Disposition: inline


--8lT/blNmSiRvUClR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 10:26:21AM +0100, Patrick Delaunay wrote:

> Align the DFU MTD backend for the UBI partitions with the mtd command wri=
te
> behavior when the option .dontskipff is not used: don't write the empty
> pages (full of 0xFF); it is not required for UBI, see [1] for details.
>=20
> This patch avoids the "free space fixup" procedure in the kernel [2]
> and allows to program a UBIFS volume generated by mkfs.ubifs without the
> option -F, --space-fixup.
>=20
> The MTD DFU backend implements this behavior introduced on DFU NAND
> backend by the commit 13cb7cc9e8e4 ("dfu: Add option to skip empty pages
> when flashing UBI images to NAND") and also supported by the command nand
> by CONFIG_CMD_NAND_TRIMFFS and by commit c9494866df83 ("cmd_nand: add nand
> write.trimffs command").
>=20
> [1] http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo
> [2] http://www.linux-mtd.infradead.org/faq/ubifs.html#L_free_space_fixup
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--8lT/blNmSiRvUClR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmH1jEcACgkQFHw5/5Y0
tyz2pwv9HHiHk4p73ZW4Bkmkb1MMjDhKPb77xyYK3Mw6aX/2FC8tZOU9a7hVHdL8
qnMs6UrUbXXUX2H/UgIw4yVlyfGJyOMUJcAedj4BTnMv2YsGyq8KqY5l2pQU6XkI
c3c9DXEY/DuyGi0uce/lixkB6dUZd/xKyNSNjR1ZD6XASq/J+kmWV8uhPqUdBZx8
k4JJqrBSsH17EnenMDy/q9iwST0rL/JXj9mZGM5HamgaG7yQy6AaqcmErXmNpTr2
teOWrkHK4kuBqCNq382Y91KP6c73CfCixCvQAia6Ot/Xj9XCQaDeAfVDv4eA9flA
hKU1Ny7+IJ3nNp3bLvKLro/yUVhLOVbvQTiveEKW+bch/duNrFiwveYYvVhgTUvU
r/gVguUp7uHrzaXH51xLJcVgqNQ5SOX9p4SOkM47rMKcYOO/mngoCoWI0Wp/n7Bl
54xa73QFM20aCdbS+xyT8vmTlZFLTcm1s6s/+NfxSRbzNSnuKBt/VpEJjUXzxlfs
KM+3UXa2
=T8+K
-----END PGP SIGNATURE-----

--8lT/blNmSiRvUClR--

--===============1465014254203313556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1465014254203313556==--
