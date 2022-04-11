Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D1F4FC596
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Apr 2022 22:15:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AC37C628AA;
	Mon, 11 Apr 2022 20:15:01 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2415C60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 20:14:59 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id g11so10925317qke.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 13:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ajEYcFb4N9CUOX7X+phdyaIHDZNjPhvedqShVfAP68o=;
 b=tIpVi5fVW3LhasUYL/eUYj3TR+HGOpfpcrshTPu3FmKwb6AGC4qJB+D99HbAksnmjc
 IlOlP7lFMoDYg7XwivkuaQzbahyxlN6VAZg63U/QgEwu5LBgRSqTVQIDGw/0F5uLfTFl
 nqtAoO12r+ap1pW7Ec5b5g1P5lPGNwL5Ol2b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ajEYcFb4N9CUOX7X+phdyaIHDZNjPhvedqShVfAP68o=;
 b=i6OX1dmoSh4u7z6TmR57+00q3KVTCG59kCZzZcCPxEoLGWJV6+smhTBeRRGG0p3ME4
 zDHHCmq1WWrUDQYyqQTboI9jtwP/5C24uRGeFBWywAlDtPnwLXK1J9RQQuljDf+chwPL
 5EfIoKJahJs58BVIUH/qf5RVNuX5iHAU4D/AfVj/YvXoAdr29eW2T4Xl4lp7PM5zTUEW
 4hU7PaJLYac9tcWg6sY6NtrqXveLzamVGFkixA+STl2NZvmI0JROd3xMawfi1E2r9ywG
 UUPQikpMBIUd2K3ic8GcNkHi/hipyMV2JoPec3m/op22cR9L3NUQZYagJ9FoA67Z5WYr
 Ox3Q==
X-Gm-Message-State: AOAM531CuHG0pt1WkOPOxHgz9sk9DaaVyVqex3a5dGoSAsW7FWNHoTHs
 b4plgS0Z9mtRvF07hBa5fYJ3kw==
X-Google-Smtp-Source: ABdhPJxp5x1OW9BTdtk9XwyKkj02lxa8DDE4P0sfi1jzlZe42VtiiYLJeQw3dSzBa5Z5TkD3s7c1Kg==
X-Received: by 2002:a05:620a:3196:b0:69c:188c:a702 with SMTP id
 bi22-20020a05620a319600b0069c188ca702mr838628qkb.702.1649708098878; 
 Mon, 11 Apr 2022 13:14:58 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id
 x20-20020ac85f14000000b002e1ee1c56c3sm26622563qta.76.2022.04.11.13.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 13:14:58 -0700 (PDT)
Date: Mon, 11 Apr 2022 16:14:55 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220411201455.GW14282@bill-the-cat>
References: <20220321081337.28971-1-patrice.chotard@foss.st.com>
 <20220321091329.v1.1.I6c2140112986b016356da7d05e846bcaefdd3fcf@changeid>
MIME-Version: 1.0
In-Reply-To: <20220321091329.v1.1.I6c2140112986b016356da7d05e846bcaefdd3fcf@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Wolfgang Denk <wd@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Marek Behun <marek.behun@nic.cz>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Farhan Ali <farhan.ali@broadcom.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] mtd: Add flash_node in struct
	mtd_info
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
Content-Type: multipart/mixed; boundary="===============0616519420337775447=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0616519420337775447==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O7V8ezaGjq23HET0"
Content-Disposition: inline


--O7V8ezaGjq23HET0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2022 at 09:13:36AM +0100, Patrice Chotard wrote:

> Currently, add_mtd_partitions_of() can be used only if dev field of
> mtd_info struct is populated. It's the case, for example, for a spi nor
> flash, which has a DT compatible "jedec,spi-nor" and an associated
> device. mtd->dev is populated in spi_nor_scan().
>=20
> But in case of a raw nand node, mtd_info's dev field can't be populated
> as flash node has no compatible, so no associated device.
> add_mtd_partitions_of() can't be used to parse "partitions" subnode.
>=20
> To remove this constraint, add an ofnode field in mtd_info struct
> which reference the DT flash node. This new field is populated by
> nand_scan_tail(). This new field will be used by add_mtd_partitions_of()
> to parse the flash node for "partitions" defined in DT.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Farhan Ali <farhan.ali@broadcom.com>
> Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Marek Behun <marek.behun@nic.cz>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Wolfgang Denk <wd@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--O7V8ezaGjq23HET0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmJUjD8ACgkQFHw5/5Y0
tyzmVAv9FJjdhx318WFTCW+m6muoGDRxEDqBG7xUw2X5CvmDH84emepplMAsr4Tg
gKkyQdyS1P1weUB+gN4GiCMRdk9wT/Inm/jA/Scg4yxLkuQ6/G73ZPM7C5/xMe/k
vi+B4sz5Gp2IMMmPdgy55csnYmRa74limuAIGS6HWYm/76/r30Sdbe9Nw3wLyhRY
vNi4zo8KM5Qfh1zORFyB0Jk1DzA6l3ElIGPQp+iv5FzdknQWHXRhRukWrsKxzOW7
TN/YfNKvvwOogFlyJPaWVlluurIxE7e1tqAZm+y8sTtw9kb7eDZ9dWxjtjz4pa+P
mrhs5OfTKK+Sq44j49LDDhUwjX6CLIQ7o9vY/zO7kD52LdGN872ptItkGoc9ck9G
JbzhE26bXqxVmS90Q2ironfQE/oUpTsPlXy6C0osQGBU5vaGwoiCLzj6L2pfi/rI
QTvpK69BiEyU3UZVUAIciOw8CMEV7swDtL6Pj+IP+mvSDEuE/0hrr3WboNG6Hpkw
wACeiAVX
=hfj2
-----END PGP SIGNATURE-----

--O7V8ezaGjq23HET0--

--===============0616519420337775447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0616519420337775447==--
