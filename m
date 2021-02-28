Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BF3274A2
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Feb 2021 22:39:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F2BCC56634;
	Sun, 28 Feb 2021 21:39:34 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17CEAC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 21:39:30 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id r24so10693330qtt.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 13:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=X2cnScUKnVMmrn03W7w4v6NRjAOsp5QoySqyuxTn04k=;
 b=HdVSIu8cD+MRH6EUfkJwX2rEYmc8LlIyzCk3s0Yrb90miXBrv+KttD6lDox8HMwi9u
 b0YAj3vfuHsfRaGul6EjH3SF72yjPfbsFJQpLfC6i0tTxcp5//ahi8lcVYZljgLufOIG
 npaxusYzgV3uCjsTfv12dokcBcssxDUTmyk1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X2cnScUKnVMmrn03W7w4v6NRjAOsp5QoySqyuxTn04k=;
 b=MriH/WO1f9ywsG/mTCmVRh9vRfnNypbwmgDZxu/pLFex0MAdDnceAhlBQy4qs0+YW2
 oM19WIa29Q+v+hM2Q6ShDXJsIcwGeW7qPJxbcRJJI26hOKftqP+e6+U3djX7bYElb7Vc
 4MD/BpOcfBT/kV9LyZqONOStrl2dMAtTKGIE7hIdneqM23ZO74A6v5PYPRbXLnKSIpH0
 taW4zDLOmlVeryW0T62C9/sXyTT5eyyz++VdX16bz0rOby7lV0m4/VHYKRDZsC+N4pBa
 tM+UxbKTdlb/onpoV3x5XRkhcAp14UZZwHQg232+/yx2+IWWwHvGgmYEDUAMQzF/8aTd
 kn9w==
X-Gm-Message-State: AOAM5324Q6rkexySt6rBr7yjGBBM6DvTYDB4rcGqBpIIXoWCVUQ95n+8
 VlryoyoDWuKmZ3G9Hl6iudelpQ==
X-Google-Smtp-Source: ABdhPJyRvux5Dsy7twCy7tIDyE+TlbR87+sRxxJv5PfH81REm5epKc87m4EZcMPUwJpLypitdVElAg==
X-Received: by 2002:ac8:35dc:: with SMTP id l28mr10697607qtb.319.1614548369031; 
 Sun, 28 Feb 2021 13:39:29 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-854a-184f-b061-bcdb.res6.spectrum.com.
 [2603:6081:7b07:927a:854a:184f:b061:bcdb])
 by smtp.gmail.com with ESMTPSA id q8sm11592021qkn.39.2021.02.28.13.39.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Feb 2021 13:39:28 -0800 (PST)
Date: Sun, 28 Feb 2021 16:39:25 -0500
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <20210228213925.GW10169@bill-the-cat>
References: <20210224121904.13927-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
In-Reply-To: <20210224121904.13927-1-xypron.glpk@gmx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Michal Simek <monstr@monstr.eu>, Stefan Roese <sr@denx.de>,
 Wolfgang Denk <wd@denx.de>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 u-boot@lists.denx.de, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bin.meng@windriver.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Marek Vasut <marek.vasut@gmail.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ramon Fried <rfried.dev@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] Correct U-Boot upstream repository
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
Content-Type: multipart/mixed; boundary="===============7551014459675062621=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7551014459675062621==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K5nRL+nTNCPL13nI"
Content-Disposition: inline


--K5nRL+nTNCPL13nI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 01:19:04PM +0100, Heinrich Schuchardt wrote:

> The U-Boot source moves to https://source.denx.de/u-boot/u-boot.git
> effective 2021-02-28.
>=20
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--K5nRL+nTNCPL13nI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA8DY0ACgkQFHw5/5Y0
tyyW2Av9HCv38u+OLVfIT2w4cuJpVtxYz0mFIoNV4Gn4cHrA9BDhB97h9UJtTxSN
PGbrt/lpG+UDZncgyHx9QcJ4KMW1zzGEBRclkuxP38HrS1saXD1bnwHy51oYqFYI
kpF0XU+zFS33QB8/n79bKLYTfHCIhdghOJ0K8SPC0vV43x1gD32P6vlr3WNMIyFi
dyMTTaMgVsyslXA57HAgkwDSvCWWqXD+7npMRyi64DpxOMJouUSlV6iB7GEXsXzq
h/urzyF+wuQAidnnc5d/ico65jm5U0eXRR/5bIzBtC3FyVe/3H+ooTASe/rp1icT
4q3WrVcWzO035DvXKMe2wf8a1gKRkw8FJJAPkc3Kf79Bw39WeiXf7jTxzArxby54
fOW62m69X3Juzzi1DVv7wBmqjWKSJkn8ZJSEaGpmvULY6+fZd/RFMSFEPGow9IaT
9jeAqgCkiKNKj9Cg0UWRUf2TWgr+PiHsQZlBk0BvN67m5Jhkqxav0w+ef7q9sK/n
SncRLKex
=ZDNr
-----END PGP SIGNATURE-----

--K5nRL+nTNCPL13nI--

--===============7551014459675062621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7551014459675062621==--
