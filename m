Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 827FC531559
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 May 2022 19:57:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20AC8C03FC8;
	Mon, 23 May 2022 17:57:27 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64CC8C035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 17:57:25 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id i68so12125926qke.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 10:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1lodtJsZukkJ677MycAlPFlOyzf3MQopDeQL5sO7SL0=;
 b=HyyJUsSOfw8+k2mdEQKWFCHUL9M8tI+5FGcQmzzc+A49MEg2w+6z3QvQbsSB7HEVTL
 5D2UKFDkba5NN3/wK2aVdIp09CLOpQ8KBQbPqVz43C/PTY7cZaxBC0Ght2ZpX+S1XpGu
 DMlau8jpPzoTMrpdc6qoC4LohIWB6ob/3zg8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1lodtJsZukkJ677MycAlPFlOyzf3MQopDeQL5sO7SL0=;
 b=LSMpE9L7Jh9lahyCK3EKOAee+w1FfUfQV/hmTglQse8nGR+dxEpDKiWnrhouD19DSv
 2y4+ZRxwM+j/GcPVG/mvhtmfK+D/64GqRqdJt59yvFgx8YkhAjLza0b8GifYZzl190fk
 VjqJeAjcmwXve7gkZIwrBMKt8JSHhpd1sjWmMJP/aFdzOPsX0vXi9Kb+SIUFv3lj32R1
 smJlg5NtwG+INwYSTGaSiThAMpCYMnSEQd4mNlNeHkKjaPKIkyHoMn/GZ/n3+Qh4Fqy4
 ZAFoy2+bcsJPsxKaatiA0SpMztoXZYqSbVuK8n+gLjpUM0VhX5981N9m8RJxZCLbrUQk
 kR9A==
X-Gm-Message-State: AOAM530bCw1PsdZLOHPZ815MdiFp9ud4sZT59HB7mztLW2KLD6FeqZg1
 cBpCn9gAdFWqNo2Dk00BeuSifA==
X-Google-Smtp-Source: ABdhPJxeJm8oHybt49z88ACGrUpfhrjIq61vH8bkORHnuTaOUZp+QGZ6MGv6acF6q2c/ya/uxN3kIQ==
X-Received: by 2002:a37:a797:0:b0:6a3:2db9:45b4 with SMTP id
 q145-20020a37a797000000b006a32db945b4mr13923718qke.171.1653328644359; 
 Mon, 23 May 2022 10:57:24 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-25fd-0000-0000-0000-1003.res6.spectrum.com.
 [2603:6081:7b00:25fd::1003]) by smtp.gmail.com with ESMTPSA id
 a69-20020ae9e848000000b0069fc13ce252sm4628394qkg.131.2022.05.23.10.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 10:57:23 -0700 (PDT)
Date: Mon, 23 May 2022 13:57:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220523175720.GT13239@bill-the-cat>
References: <20220330073315.7703-1-patrice.chotard@foss.st.com>
 <20220330073315.7703-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220330073315.7703-2-patrice.chotard@foss.st.com>
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
Subject: Re: [Uboot-stm32] [PATCH v4 1/3] spi: spi-uclass: Add new
 spi_get_bus_and_cs() implementation
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
Content-Type: multipart/mixed; boundary="===============1873115271103199187=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1873115271103199187==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ga5bsqHr1s/xcZEm"
Content-Disposition: inline


--ga5bsqHr1s/xcZEm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 09:33:13AM +0200, Patrice Chotard wrote:

> Move legacy spi_get_bus_and_cs() code to _spi_get_bus_and_cs().
>=20
> Add new spi_get_bus_and_cs() implementation which rely on DT
> for speed and mode and don't need any drv_name nor dev_name
> parameters. This will prepare the ground for next patch.
>=20
> Update all callers to use _spi_get_bus_and_cs() to keep the
> same behavior.
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

--ga5bsqHr1s/xcZEm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmKLywAACgkQFHw5/5Y0
tyx66gwAhpZrd2Eg0R9Dlubr3YF9/wzCND4Cst9tIIIDb6FLGRBmv1T2qMGJSeCi
pJ3ctDpdDtT7luEyUyL+hdN6qRXjwFCIrPjnwZMYHWKNo2llnFp8Gx5RLaJYwQGS
3KzSLVCD+JLosUcpBwVvG+cV1IZisVNJZ7RmS8gwp/gLpBGjuIt5vDw8of0Rv40C
I404tpVEzXN2LbHPz7xdMrCU6xK4X1H1woiarcNaqTCDgVm4cps39QNmbsHCW29i
Gdz5YOryvQiLDw76fS4mK5yoSuhm20RahU3d3O8mUcYgCYE9Mmr9aFEva7xVNMZ/
GQevqVQEqLEd5ei1z8uJT89li07V4Z3yRCJq2i6Uw77DocAurpsXqcOpGkIC4Rbi
weeaE6E08/C+MQhBQxjkBNMQtH0D2hWSQYhDqDMhACpTPmzg8GmcDWJPVE3oTuVQ
6mCtHVqKADioUVDTeYvVg+WZINJOSn92EOagD2RfLWfT/eNLIA7Um/FAg9s8MQut
lajAQ6xW
=tCtd
-----END PGP SIGNATURE-----

--ga5bsqHr1s/xcZEm--

--===============1873115271103199187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1873115271103199187==--
