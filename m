Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C2353155C
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 May 2022 19:57:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FB50C56630;
	Mon, 23 May 2022 17:57:42 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5FA6C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 17:57:40 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id cv1so451820qvb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xFM3S5PyoKziiGWNeE1CymmWaWIjRui8YlBPleKuDRQ=;
 b=jsiFkmdz8x6wV+G5YBnCJfTq76WfBHm0UbhU2Y2p29/kGzKUjDdgddJAMOlaljGFuP
 7XbaiukMQz6lSk1mwDJ5N2+0FNFwbZ3Ghc8SOGqfAes+1f5gwQ3gZ6P5laM6Gtrgo0Ge
 B7XZI4cALxHeHa+LPeKqHZpU1voGghfd7BbyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xFM3S5PyoKziiGWNeE1CymmWaWIjRui8YlBPleKuDRQ=;
 b=Y+wi0klmxBKaWepKcQ7VUyI7qHvIGz1Ga/vrIdtRAQ7ao3UEWeJEuRysYGvZPxlvO9
 OAsx04R+chvjsh1POD+HCij84hy9l+K1gHE4D5zcGsp3Z1MZRA0BTfQCWGa5GVmgXrBw
 nbdLPRTiHoSMZnaE5IVI1AiFQCMdqSJE4iN2o3AlyWRn2+/fBL8vuepr1usgeFYHUh5w
 hOwVuRU6hGFW4WhFiqRZGOReDobPDG2mOcz45sYU2IV+QLYdbSWxFuMMz44XZgn4wdjs
 AIs1bVdpNKYwkDp7a0iJBOZpYjvr+DNdFNN4sWjeIei9u7E8IQI0Bj6Pq+5OHE4Cep0j
 GrDQ==
X-Gm-Message-State: AOAM532pKnRGAUu+1ovlnhzhjZm1DrEBM/tsThLm4cAsJwYpa6fHVTC1
 J6xGukRdHd4NflPOKwyW0CumOrvxFxmD9g==
X-Google-Smtp-Source: ABdhPJzpQD4F3WB3LD9zb5y5MW0oxuNnCMPTVgaqHs0mcQwPl4pROcd36Gp23fofqJLchhN5qE2YKw==
X-Received: by 2002:a05:6214:764:b0:462:35eb:f822 with SMTP id
 f4-20020a056214076400b0046235ebf822mr5685254qvz.34.1653328660039; 
 Mon, 23 May 2022 10:57:40 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-25fd-0000-0000-0000-1003.res6.spectrum.com.
 [2603:6081:7b00:25fd::1003]) by smtp.gmail.com with ESMTPSA id
 c22-20020a05622a025600b002f39b99f689sm4673634qtx.35.2022.05.23.10.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 10:57:39 -0700 (PDT)
Date: Mon, 23 May 2022 13:57:36 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220523175736.GV13239@bill-the-cat>
References: <20220330073315.7703-1-patrice.chotard@foss.st.com>
 <20220330073315.7703-4-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220330073315.7703-4-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Vignesh R <vigneshr@ti.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Marek Behun <marek.behun@nic.cz>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Biwen Li <biwen.li@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 Igal Liberman <igall@marvell.com>, u-boot@lists.denx.de,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v4 3/3] test: dm: spi: Replace
 _spi_get_bus_and_cs() by spi_get_bus_and_cs() in some case
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
Content-Type: multipart/mixed; boundary="===============0238249729973089539=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0238249729973089539==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5xr6Gr0irOxp3+3c"
Content-Disposition: inline


--5xr6Gr0irOxp3+3c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 09:33:15AM +0200, Patrice Chotard wrote:

> In case _spi_get_bus_and_cs()'s parameters drv_name and dev_name are
> respectively set to NULL and 0, use spi_get_bus_and_cs() instead.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> Cc: Marek Behun <marek.behun@nic.cz>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Vignesh R <vigneshr@ti.com>
> Cc: Joe Hershberger <joe.hershberger@ni.com>
> Cc: Ramon Fried <rfried.dev@gmail.com>
> Cc: Lukasz Majewski <lukma@denx.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Wolfgang Denk <wd@denx.de>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Stefan Roese <sr@denx.de>
> Cc: "Pali Roh=E1r" <pali@kernel.org>
> Cc: Konstantin Porotchkin <kostap@marvell.com>
> Cc: Igal Liberman <igall@marvell.com>
> Cc: Bin Meng <bmeng.cn@gmail.com>
> Cc: Pratyush Yadav <p.yadav@ti.com>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Anji J <anji.jagarlmudi@nxp.com>
> Cc: Biwen Li <biwen.li@nxp.com>
> Cc: Priyanka Jain <priyanka.jain@nxp.com>
> Cc: Chaitanya Sakinam <chaitanya.sakinam@nxp.com>

Applied to u-boot/master, thanks!

--=20
Tom

--5xr6Gr0irOxp3+3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmKLyxAACgkQFHw5/5Y0
tyxINAwAmxjz4iMiKPcDhAzJecvNlJ/ZWZKlCen6DSr3raUJi1UCN4Vxtk6e02JP
zXbWeBKKEqL45QRO0u5pGlmt3852bevi+yIiDAlCW4Qth+ZjtjXCPlD8H+1OmgS6
fsZw+AP5iYLiBRI6IyCDjP5hgEzzr04+g8nWS47dHWp9nBbV0mh7w+K9gKn2IErJ
+Ab7zEWrz+t0cMDeODsCa3XJM6aD++PT80AEb4CNQgJFFs7LjxbfXVz/6Yo9FKqY
RBdmRPKqpTHmTUqrXipjmD61UynltzoAE3aTIKN/0Ei27i4j+sngCQC/XSt8KVLl
Tuwgm/Pin3HVxtcI4F2LwuLT8Tdy3Wi/LCxlGKPOAPgO7Ww4vjcuavY9ILE0RxOL
mzukwVfb8949zH7l+ns41Q0Z7SgUexxBaueObpDr/sc+FKypKvlduf/zpQHCpN6b
vzHmZdz2aFX/zzf/SmqgP/6r9f1no+8uS8v3SWJaQbbITMijlMWw1IRi6r7Qb/S9
QeuVF3Ia
=WgKu
-----END PGP SIGNATURE-----

--5xr6Gr0irOxp3+3c--

--===============0238249729973089539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0238249729973089539==--
