Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D3142FAB6
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Oct 2021 20:02:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7926BC5C841;
	Fri, 15 Oct 2021 18:02:28 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E751EC06F81
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 18:02:24 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id j12so6197507qvk.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aANw5K+a+ShlYMq8i1gCAY4LpS+Fnytwvrzse2sSEY4=;
 b=SprNgr8J7bKZZfNMWoBMLfzIyupbZ9LogzCic/GvsJbYmKKYiRTUZATqzAu2d5MRK5
 Ypmbz2nNLQy6YItq9cm6qkp3+RZN6Byl0Ft3T113S7i/fWvhCtAmc2Op9rhvs3mwP+lx
 NFfZQtclk2THbLPC6mvn9sSEV/EL3/Xz/GTwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aANw5K+a+ShlYMq8i1gCAY4LpS+Fnytwvrzse2sSEY4=;
 b=OCVwPJk2pyqVrG/qPBgfQBHzJzvlygW/YAs131FQxjwxtc0+we61HtBOfqBeOFjKOp
 +pD7/d6Qs9+s6rNd6mYj+JjlfKDsaKSJi/EbqSyiD3i61H7Kk4NImdeqMwbG9EuEzkE2
 d3UgoLFfiIfVJHwfJWLq7iKnrzFctLP2wftfGP3MOSqZ+IJpi+GUtERDAoTolyNncX7R
 Cakxzvk0woMPawXuSoApbuTnYlaPvMtDumeT2S+eGEjJNV/xxhU9Dya+RmiGQzYwWbAM
 qGTdnJorr5UmdplT/VCylseUhO5NJTNXg0F5XnhVb3Wc+zcx0o9pyKNlQLTIg4sL3P4C
 B+FQ==
X-Gm-Message-State: AOAM532qyhzZVIlq7LHBTLRbxUH1ynRtd0jFzFfRVBskquviiu5zNyi5
 I5MpIyU5rD/Nf8Cz8sIpik2g8A==
X-Google-Smtp-Source: ABdhPJxTR5zIrcODbdkreT6nblFBjxkRvnSI2QFulzLbAq0Yfs6onZsgqQp99pz3Lt+HqUHkeWPMbA==
X-Received: by 2002:a0c:b38a:: with SMTP id t10mr12467323qve.42.1634320943168; 
 Fri, 15 Oct 2021 11:02:23 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-f8b0-5c25-4d47-ecdb.res6.spectrum.com.
 [2603:6081:7b01:cbda:f8b0:5c25:4d47:ecdb])
 by smtp.gmail.com with ESMTPSA id t24sm2957557qkj.52.2021.10.15.11.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 11:02:22 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:02:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211015180220.GA7964@bill-the-cat>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
MIME-Version: 1.0
In-Reply-To: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Stefan Roese <sr@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/6] scripts: remove some configs in
	config_whitelist.txt
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
Content-Type: multipart/mixed; boundary="===============5726619162097119112=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5726619162097119112==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EGSOW1ksd/vhoQGa"
Content-Disposition: inline


--EGSOW1ksd/vhoQGa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 11:59:50AM +0200, Patrick Delaunay wrote:

> Remove some config finishing by _ badly added by
> scripts/build-whitelist.sh when joker is used in comments.
>=20
> for example:
>   doc/uImage.FIT/command_syntax_extensions.txt:
>      ... #ifdef CONFIG_OF_*  |	...
>=20
>   cmd/nvedit.c:# error Define one of CONFIG_ENV_IS_IN_{EEPROM| \
>      FLASH|MMC|FAT|EXT4|\
>=20
> Remove also configs only used in comments:
> - CONFIG_BOOGER in include/linux/kconfig.h
> - CONFIG_COMMANDS
> - CONFIG_INIT_IGNORE_ERROR
> - CONFIG_REG_*
> - CONFIG_HOTPLUG : drivers/watchdog/omap_wdt.c:18
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Tested-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--EGSOW1ksd/vhoQGa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFpwikACgkQFHw5/5Y0
tywa1gv/TZ6Dkm9XmrWvLEUs6MKZ9ZtKyhhKTonPAdcd/o8OrRN5vl364f2U+Stx
Cs7nF9HWoeGJe+SZUh3x0v9k7qre3EeT0AfuhVibwcn4K2nyvnfLAUz+aH+CEMIL
UZZgAyROHBQNvRw0jLC81WH4pb04/Pa42kufmKMaBMfzBkckZfj6iZkO2nvCU69u
dLzEhk+SmOKQvJBa6RjeZemkFk+Q701iW4uldoF3iVa16k2/LVdf655n6KJOwOWW
x61GFU0ymlX8mwj2noIkG+xvb8wSxKxF67GONd6Ct4b3zh2ITkZjhyMzEJxksfI8
570g55PyHzOKxEcuZffIT10mqVhOx9zuzqfgI6hchN2uX5q5Ma4O1vdD7o93UcMn
Pi/6H9k8vGXoJR03wu/6fr/MiePYJYrsC3VgGt2gFigsutxVUe9L0Zp8ukeF2p53
B6F58VdH0ZYW2Lso/Sz49hpYinaQ27+7PoI2ReiPIUTqm0yzCHYL87pAMfFHuGt3
/G1gEUHt
=rhso
-----END PGP SIGNATURE-----

--EGSOW1ksd/vhoQGa--

--===============5726619162097119112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5726619162097119112==--
