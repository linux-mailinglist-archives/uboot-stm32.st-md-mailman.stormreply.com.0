Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B36678E8
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:18:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCFACC69049;
	Thu, 12 Jan 2023 15:18:26 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 175CFC69048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:18:25 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-4d19b2686a9so116487797b3.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 07:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=euEkK95LirmR1VddlzZlR7bTZv/+7Twr4GpG9jO2FiM=;
 b=OOHTC6wyVRIbjuKJwmPuka6Lk9ylt4lOq+3WjfUrZlbZWgy4vLSqKI1JhOl9jMCHK9
 cHDksovViuPPs24jPnEearkQEnAEP1I9tecjH+hMKuNS0SgrHBQXpRmoHyYwomGd32x/
 iUxeyhtMI/i/d5ogChSI6STvPejlfvRonXpIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euEkK95LirmR1VddlzZlR7bTZv/+7Twr4GpG9jO2FiM=;
 b=50BDQcQ4iba6y7r9ItdtRkV4TH5t5z05SCy/UKpOzuK4o/MmWA+cvpVpvOeQ3D6LSS
 /Y1VVEOx2IRX1aIrxtij4XIHR/HV1NjA+A8jyReX1E9smn+nh/rINuiCgmmoV71wXwEA
 +SQTucZVfZnhKDz16j6CydICJxtSW4V1zCLEmumboiKTcRoDZsXW6vj2ZQf8s3Q/Y5bO
 bQ/wVY9fnOUf71XC2dv51BHus/pzXqW4XzRvWCr9hw471bRcagXNgF7DPh219RHdcw7l
 vcOXlPUwp1uf9k8ys7iivx58pOInl3sGtO6eY2PsXfcpa3aZi4nMK/B76WZzaXrFvNCE
 L9eQ==
X-Gm-Message-State: AFqh2kqI/ZJmCPqFtK3S8gohdHZ6S2oCj1vPgmoqP3AJeCvW9hI619pI
 SWtj9QiLhJm+9MUioD24LahQxGCWQVNJebtvkSs=
X-Google-Smtp-Source: AMrXdXsKDv+REUHbrr1b+IkzL+mm60t2SLx3PQ5G1muX8+fhhu1MahR24XR+rAmsGu8MPOm/0YKh4g==
X-Received: by 2002:a05:7500:54ce:b0:f0:56b8:1645 with SMTP id
 a14-20020a05750054ce00b000f056b81645mr1286595gac.6.1673536703948; 
 Thu, 12 Jan 2023 07:18:23 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-38c4-8177-7e9d-a94f.res6.spectrum.com.
 [2603:6081:7b00:6400:38c4:8177:7e9d:a94f])
 by smtp.gmail.com with ESMTPSA id
 bj30-20020a05620a191e00b006bb82221013sm10873717qkb.0.2023.01.12.07.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 07:18:23 -0800 (PST)
Date: Thu, 12 Jan 2023 10:18:21 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230112151821.GC3787616@bill-the-cat>
References: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
 <20221214165126.2.I10631f84f71a23c2c3c6ede7299743000ce82ccd@changeid>
MIME-Version: 1.0
In-Reply-To: <20221214165126.2.I10631f84f71a23c2c3c6ede7299743000ce82ccd@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] env: add failing trace in env_erase
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
Content-Type: multipart/mixed; boundary="===============1870100077466300497=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1870100077466300497==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+dE/IHwS5UNbqpO4"
Content-Disposition: inline


--+dE/IHwS5UNbqpO4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2022 at 04:51:32PM +0100, Patrick Delaunay wrote:

> Add trace in env save to indicate any errors to end user and avoid
> silent output when the command 'env erase' is not executed as it is
> done in env_save with commit 8968288cb477 ("env: add failing trace in
> env_save")
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Heiko Schocher <hs@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--+dE/IHwS5UNbqpO4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPAJL0ACgkQFHw5/5Y0
tyzy5Qv/UF8s7QkICgmH8YkTfkSfh/HIH04B9zZ+9BP6uY68wYRXFCZqdLVC/ztu
y4zghozBVileCGdhtAvcWC2zmUhLD7xKkWNf6TUoyHnHsaWtcJyqXiMn6ihLR06h
0knEWsARRkmELBQiZ7Fu/7HztPJOoSLghJ2arlynjGLgbqSfrdeWRrmqChlmYAiI
OZcNu5I2Olb1v5mGLYqQTspdmulxVTanE34eiOvisTklKoGLv8MsUqUP6NVmxky+
6u6OcCJdirWiAVSdCsMkRXnMBKvIRtKwWXN7CdZxQzOEijIVYLIkWkWmDwnbqwhq
vO/I79yW1x0UVo/EWC95cOA9GSP84YBU2ew/KhtPMh8hkYjTRXGHcBioF7gBXtu1
uAbc/m20GMV7D0iqQtTtAAH2rZb4EVseKcGxRjYRj01fSYKJ+tYRFIPYFbDBcOaN
hKn9h2JGj+31iqhwfU1SLnZeaFvwX7kMuIOJ2qwv0TnW1BCcP0yVqYPdk2llY46P
dRpqVe5y
=EkcK
-----END PGP SIGNATURE-----

--+dE/IHwS5UNbqpO4--

--===============1870100077466300497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1870100077466300497==--
