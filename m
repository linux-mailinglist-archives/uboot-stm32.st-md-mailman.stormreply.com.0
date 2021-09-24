Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4C417B1D
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Sep 2021 20:29:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF1E2C5A4F4;
	Fri, 24 Sep 2021 18:29:49 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A80A6C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 18:29:48 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id t2so3791184qtx.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 11:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PjXj7nQr5eoZ3GbwxODi90JlA0OWOXkISxmaUwsGdT0=;
 b=bbSir2kF1ho2f6n85D4LeyVjs5nFlxsvObgNBbBKJLzMeg36I03wzxIs5CxaMGK8rG
 JzmquF0VJ7OMJX0wfiUfxZgdTj/SXwtiU0tZqcD/FPiVKdrwhKDineVLxwixCx/h3/C1
 JJAV0wCavnBWuF1vFFROAe1zBw/Cvbbq4TM6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PjXj7nQr5eoZ3GbwxODi90JlA0OWOXkISxmaUwsGdT0=;
 b=woRrcxBok0Rt8XR18Q8XWmgHNmPNb5+Ok5joHnYlZ8x4iU7Qs+J/9Ub6WEskOwHEiz
 KUnX8tJBExLZHDO3M2ULE7s8qt0IfUkvIrJiFkl6M0XfzO9KdxyhhVFOva0EhlCsij0D
 7Gg216ASR8VaNesea7TtOykleZfjKP7prRra02vwZhb2/qpPsP7bWa3+PkI2Cs2jdrtD
 tnkfa5nFcK8TG+HMsodyLfjYXDaIXFRAx8H+KrzJp5aFRNwyOQV3uT2+b7oL9ey7L3xQ
 lAkDXQaPfm4/fd2gt+6TXhP4CzIHWDwtYfzxWkJvTywIFiO6xiwa4ddXSeFBw/iKAMeb
 2aEA==
X-Gm-Message-State: AOAM5304djTJygZKPTepBQLwe/BV6VCP+Y6KW2lKkQqYBhlt+QltfPxc
 StXhSBKeewTd0fOODqYLJq2nXA==
X-Google-Smtp-Source: ABdhPJyaVew5nVnJHKwTvu/M8iWQK4jaGRZ2OsxrrmkWh3q73TmE6YzCgDfPzClpe573/DleaCqUvg==
X-Received: by 2002:ac8:6646:: with SMTP id j6mr5885037qtp.149.1632508187617; 
 Fri, 24 Sep 2021 11:29:47 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-11b7-7bd8-71db-92e9.res6.spectrum.com.
 [2603:6081:7b01:cbda:11b7:7bd8:71db:92e9])
 by smtp.gmail.com with ESMTPSA id c26sm4190386qka.33.2021.09.24.11.29.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Sep 2021 11:29:46 -0700 (PDT)
Date: Fri, 24 Sep 2021 14:29:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210924182945.GN31748@bill-the-cat>
References: <20210922110223.1.I82d7f080bc204e75e2f305a8056363038d3d9c0d@changeid>
MIME-Version: 1.0
In-Reply-To: <20210922110223.1.I82d7f080bc204e75e2f305a8056363038d3d9c0d@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] mtd: remove SPEAr flash driver st_smi
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
Content-Type: multipart/mixed; boundary="===============1060626631245091578=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1060626631245091578==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5adDe+nHDi68q/7x"
Content-Disposition: inline


--5adDe+nHDi68q/7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 11:02:26AM +0200, Patrick Delaunay wrote:

> Remove the driver st_smic.c used in SPEAr products and the associated
> config CONFIG_ST_SMI; this driver is no more used in U-Boot after the
> commit 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr
> support").
>=20
> Fixes: 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr s=
upport")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Stefan Roese <sr@denx.de>
> Reviewed-by: Tom Rini <trini@konsulko.com>

Applied to u-boot/master, thanks!

--=20
Tom

--5adDe+nHDi68q/7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFOGRgACgkQFHw5/5Y0
tyzLzAwArrD4kNZg09xfAU31nBcP1yfJTVtIzKXxiMEv+xaS7lOk8G2etOsz7Yth
d0EcN8Vo3pqB7ZF/wMnAbjlVgT4b0I1boVpPfhMFfuFIdEGosFzIxAwwr4dqMaJR
FtsGamEpGX3MhGJzD+Aupiak+dk/CEcNpIjtcYZRdMwZDVdAXfTbVxdT7N4QmbK1
U2ZYyFjnGx2/2eZepEsKuIJQcfFoNBgYFSkWVnvlj90YExcV4lE9YwVopckP77ZP
xFr9hiva79ExNiDDNk+zzndinHr7Rvo7glJk6faezTOnPJujsm0Qy+kGJlUqjxsw
Xzz9wseowIg4knkxQPdohRosQrfUiKDcqL1VgT6XzN1OR5gBxbBzLCvTIPHUJE67
JqqN3mLnXaZMnB7JF4LE6u5reIAuKsJR4Yws/FuTce5oWWKHzOUresfDEoPVp0jP
HpDZR8zkRVIUuA3tGFkOEM+NHpPdEdHxKft/uHjHdAwA4YCG//HFwIOfLTtCa2Hc
s0NwoMjM
=bbqc
-----END PGP SIGNATURE-----

--5adDe+nHDi68q/7x--

--===============1060626631245091578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1060626631245091578==--
