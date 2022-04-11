Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C387F4FC597
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Apr 2022 22:15:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89C6FC628AA;
	Mon, 11 Apr 2022 20:15:07 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A525DC628A6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 20:15:05 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id t2so17460250qtw.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0lsp6EOhX9jhybLz+y3CY8yLLK/fUifphKGi+fHq9l8=;
 b=HI//OySruFY1tSkpZu69O54sTYMK7gcOm0POE+HAv3SaAbe3zWjO+WThlVnSdwpwis
 wJ2d5MN/R/1DheXRr30m30UzWRD1Fc7YA1hn8o90x/fTQ/r1mtEsZ0D2DvnpbtYdz02k
 vthRg5+dJD/fckeAQNVX1RPgOcN//riNMHIEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0lsp6EOhX9jhybLz+y3CY8yLLK/fUifphKGi+fHq9l8=;
 b=BW8TQXjXU0++vOhb3nm2N8mgu9hwff7yzccPmbVIpqkXr+y6EMKsD/fn5pUoTt4OkW
 Brs3RQmeyydmvbpeg72al2UuF5mGaP014yHQk+F9pzAchBSnU7PtF25soMgF71lWbYhI
 7geNxXsUfRJuaiRV0hlx+V4wt1Z6Au2b2i4I7iXYJO2iDq69F60WUEeUh/YHxyu7mdPp
 1RLuCaQJWhtMvors3py4NSKUuPlbzyATl/Ip6bZKOC7nm6GzEhsDltCpz/saDoNbMkpP
 IonSzQzjU5E3Xk8H+jEPKtY3AntDBLrQZANnBqsnVVHt3Qdmi0fRGP6cNqOfU/FWRPzt
 hAPA==
X-Gm-Message-State: AOAM533TPIAHj/DgfwonLJbMpf+Gu9pBH4KKVO/La7RyNKL6gTTz6AZk
 ZYFRQm/dp7m8p487iJ/VDIw2gA==
X-Google-Smtp-Source: ABdhPJzuSnwNJ1CuLjdZOghQdMm3A+uUcIrT9ERLz9VB3gorejiVJC3jbwe7XCkdGjh5++qmBx/iww==
X-Received: by 2002:ac8:6614:0:b0:2ed:ac4:b38b with SMTP id
 c20-20020ac86614000000b002ed0ac4b38bmr855039qtp.379.1649708104614; 
 Mon, 11 Apr 2022 13:15:04 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id
 s31-20020a05622a1a9f00b002e1df010316sm27301873qtc.80.2022.04.11.13.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 13:15:03 -0700 (PDT)
Date: Mon, 11 Apr 2022 16:15:01 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220411201501.GX14282@bill-the-cat>
References: <20220321081337.28971-1-patrice.chotard@foss.st.com>
 <20220321081337.28971-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220321081337.28971-2-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Wolfgang Denk <wd@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Marek Behun <marek.behun@nic.cz>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Farhan Ali <farhan.ali@broadcom.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] mtd: Update the way partitions are
	parsed
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
Content-Type: multipart/mixed; boundary="===============0206844787182199185=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0206844787182199185==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="saoT5+PyEcEjd88F"
Content-Disposition: inline


--saoT5+PyEcEjd88F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2022 at 09:13:37AM +0100, Patrice Chotard wrote:

> In case mtd_info's dev field is not populated (raw nand's case),
> use the flash_node new field which reference the DT flash node where
> can be found "partitions" node with "fixed-partitions" compatible.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
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

--saoT5+PyEcEjd88F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmJUjEUACgkQFHw5/5Y0
tyxQuQv5AWRAtgf6QDC+QBeheTm+fIpp6cNCGCGgcMb9DlrZCKqoGUu++Wt9+Eml
Bjj4Gpb1ZBYnDSfaWBfQn17OrSVYVMTyYXVIY2vfWAGRWp4mSGZ9bcmQu5mG+Ylt
bjIV3XsZ3bMBRX+Ua8Q1zUu9Tx4LFbUJhVqcgHh1y1kNspgrnnroFVSO/sRb3zzV
z9wb2LODn8SXbmcS5HnKwg67jtU626gcqXJ3mAze8D/75teFWK56jpTkVJFW0X5q
t6UM45UjoMj/5mrtWydbyvhbAzyKXJ3rQ7O5iZR+4Esz9wVK2gbGJPGL9rUKHkkZ
nTH6/m4Sya3HDVckcw+O0OIzUvS7xbeGnbZ31leDndblfCSXSLMJgV4TQX0e8aX8
GFw8W9ygYvZPEWB20dlua5HZFuaoOB9vYVoE9FE0H+nfZQoj2+FfV7aCLrFDL3Tr
gYtJw/u8h12KcoN5N27NR5M0r52RdVDGCTVmguGgZ+vYRoXiNPcCcwUPXnGat1Eg
8IAiYQZD
=88Mu
-----END PGP SIGNATURE-----

--saoT5+PyEcEjd88F--

--===============0206844787182199185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0206844787182199185==--
