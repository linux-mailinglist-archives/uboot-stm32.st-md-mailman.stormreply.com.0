Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C8253155A
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 May 2022 19:57:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 304FCC03FC8;
	Mon, 23 May 2022 17:57:34 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DB25C035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 17:57:32 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id l1so12653285qvh.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 10:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gyA7N40gZYZz4hkHb1t9UB+NeE9ISeyrdI6kIYpVQdE=;
 b=roGqmRoGwzhYZomgQAL2IqegIqnTwhyIiREOD3y7vlhBXUXkUw2u9ck1et+LNfXmWM
 f51/aNTDIhR2WW9VFbqtwkMLqW6A6AcIKYMV1/X71tLD5YdagsviT7ZvNAycyMsrx0w8
 cXqgD/S3Zd+w/4KsP+jNSbcjL1znf1XHQ2O3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gyA7N40gZYZz4hkHb1t9UB+NeE9ISeyrdI6kIYpVQdE=;
 b=2w+Hw/5ieC9i33anx/Xzxc82vVQ/P3H4d6fbBzu8Oe0bL+krOs5+wYzDc/GvkgSr1U
 Ngk5tewF45kQ8R9SwfWMdth3kT+Kwgl4CX4wmYCLE+SDhrSXFjyFIo9eCRklcQSeHaqT
 ijovybXWWlDXHQKnEU+DuMDVtgdXvTdLgPWbqkI6rZqx4gX1x5bAIdYusHON6wbjES3J
 CzZwSxF+ofXTn9R987OBR9k3MSpu2nqtINv9+aHbdXxNyzToLwDIpT5qhTVAWcT81Z9w
 TK77MYdC3OyaqYdScZBueOeIncp1rrY1tpAbNx7uKzduAylqUjxUaGq3PBzBentJzas6
 my6Q==
X-Gm-Message-State: AOAM530MWbS+GJa4aj3m8oWalqi6RvG7973SIx35pNFjO18O5YAzuntj
 H0t2wDX2PUSZJ6VQyN8R+EMcnQ==
X-Google-Smtp-Source: ABdhPJycWVIyYaUSAWHtPz0l3mGRFBo23XhEa2/8p22iduSbuYDlCWyNFiHQ9XCHKMocI2/vXKiQgg==
X-Received: by 2002:ad4:5b8e:0:b0:45e:727e:581 with SMTP id
 14-20020ad45b8e000000b0045e727e0581mr18163805qvp.91.1653328651667; 
 Mon, 23 May 2022 10:57:31 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-25fd-0000-0000-0000-1003.res6.spectrum.com.
 [2603:6081:7b00:25fd::1003]) by smtp.gmail.com with ESMTPSA id
 w7-20020ac857c7000000b002f9303ce545sm4285492qta.39.2022.05.23.10.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 10:57:30 -0700 (PDT)
Date: Mon, 23 May 2022 13:57:28 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220523175728.GU13239@bill-the-cat>
References: <20220330073315.7703-1-patrice.chotard@foss.st.com>
 <20220330073315.7703-3-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220330073315.7703-3-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Vignesh R <vigneshr@ti.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Marek Behun <marek.behun@nic.cz>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Biwen Li <biwen.li@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Igal Liberman <igall@marvell.com>,
 u-boot@lists.denx.de, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v4 2/3] spi: spi_flash_probe_bus_cs() rely
 on DT for spi speed and mode
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
Content-Type: multipart/mixed; boundary="===============2760981547526615996=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2760981547526615996==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7kD9y3RnPUgTZee0"
Content-Disposition: inline


--7kD9y3RnPUgTZee0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 09:33:14AM +0200, Patrice Chotard wrote:

> Now, spi_flash_probe_bus_cs() relies on DT for spi speed and mode
> and logically calls spi_get_bus_and_cs(). In case spi mode and speed are
> not read from DT, make usage of spi_flash_probe() instead.
>=20
> To sum-up:
>  - Previous call tree was:
>     spi_flash_probe() -> spi_flash_probe_bus_cs() -> spi_get_bus_and_cs()
>=20
>  - Current call tree is:
>     spi_flash_probe() -> _spi_get_bus_and_cs()
>     spi_flash_probe_bus_cs() -> spi_get_bus_and_cs()
>=20
> This patch impacts the following :
>   - cmd/sf.c: if spi mode and/or speed is passed in argument of
>     do_spi_flash_probe(), call spi_flash_probe() otherwise call
>     spi_flash_probe_bus_cs().
>=20
>   - drivers/net/fm/fm.c: as by default spi speed and mode was set to
>     0 and a comment indicates that speed and mode are read from DT,
>     use spi_flash_probe_bus_cs().
>=20
>   - drivers/net/pfe_eth/pfe_firmware.c: spi speed and mode are not read
>     from DT by all platforms using this driver, so keep legacy and replace
>     spi_flash_probe_bus_cs() by spi_flash_probe();
>=20
>   - drivers/net/sni_netsec.c : spi speed and mode are not read from DT,
>     so replace spi_flash_probe_bus_cs() by spi_flash_probe().
>=20
>   - drivers/usb/gadget/max3420_udc.c: Can't find any platform which make
>     usage of this driver, nevertheless, keep legacy and replace
>     spi_get_bus_and_cs() by _spi_get_bus_and_cs().
>=20
>   - env/sf.c: a comment indicates that speed and mode are read
>     from DT. So use spi_flash_probe_bus_cs().
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

--7kD9y3RnPUgTZee0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmKLywcACgkQFHw5/5Y0
tyxUCAwAtFcguDn8jxk1yaJW5QWt6y8dxNPPafzYzJTEbtEiDbP0ZMDGIjQYoczF
DzAeRAWU77wvMK6vKx1CvO8AVBxQXipoJSvv83lz1Ba2rgWrOVtryZI8YUkP+kq+
yrAkWgxWQ8MrOBRtmVxnjkSvP+4B/9X87Ey5kcrvv+NddLoy2UGwq45ihSLlxhyT
/kcu3LGz3+wjSmPbCmfrgqEFGMCCumEtS2TGW5sclrbZ/7H3oLRCMQ0U61wsX1Fz
Py9CNMxK/8406Sh0CE1EusRxbb0f7UUwSI0xgFYf72V7XUAJ8Mpph6Dh+NGD4QkI
i5rhfqnHGANplxkJWG318h0dZlW05LJGNizXwObVPJIyCS27PXFQuKUSx7/HV9sJ
+k7wqe88eHQ9DK6H+eeikYSwZ0FrSbyYnF5IPPQG7tXg7CBOan/JCkHUxNdVJIke
jT3XyPEfDZ6uvQA3m82Carv/fF9rv5JoDMqP2FB7XCkGkxEbwp/TISptw9bDB0D7
z2jostbE
=RCSx
-----END PGP SIGNATURE-----

--7kD9y3RnPUgTZee0--

--===============2760981547526615996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2760981547526615996==--
