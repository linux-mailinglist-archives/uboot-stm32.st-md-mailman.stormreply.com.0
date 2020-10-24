Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 626CE297CEF
	for <lists+uboot-stm32@lfdr.de>; Sat, 24 Oct 2020 16:51:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D552C424BD;
	Sat, 24 Oct 2020 14:51:36 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84D93C424BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Oct 2020 14:51:34 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m9so3620695qth.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Oct 2020 07:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R23RI/AO2BVzQDytjq200Wt2nfiigWznFynd/wTLQdw=;
 b=daxvnIJaQw1YbJ8PQhU+eDwf8Llsrf4+izv/DMHpCqFi8U6aqg/shZ++9lhI+Hnpwv
 heoxOO6HQVJswB5+b0r2bSoDXlntCpQ/74nwNZqDnwMxp/TP5ki+9JjbQ1eqkPHkFF57
 zw4YDBjZHnFWAGLMplhOukepQuDUq8czJc9QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R23RI/AO2BVzQDytjq200Wt2nfiigWznFynd/wTLQdw=;
 b=hgYN0bqmjYMDw+Nu/yyYlloY5PuhsE0BGLXqyIrsYt0Q/tNlx4GR1VTmsn1iZujB0R
 d2oRT4H77/nMVQI6D6X+3dascMylWrBh4/P132amGxFycEme+RoS+nGe5sDQT4Szd9hp
 GUyHIYghT+pMge8eqv+zC8wOYj6h7c54TsYHde87P2ud3v03/Xm5gz1L5hIx779by02e
 7XUXyChVER9Zoup7vJCUtTrGL/OjyOB4HqLR6KtIW5aoGGveUMlNlX/UMO5vPT4VXWkk
 YE/uoZrOxu/pXuyNeiVqYllbU2MHLmo+c85iyfsXymOCgs0SZooTfh73F5cUutwZRimV
 pkSw==
X-Gm-Message-State: AOAM533CBvvdsM0fe8qnyJiufQQcd6dR8OoqqztiN2qVL7hFjnLp83Ev
 zstbq+QHIdT6/w7TgYxBshRP3A==
X-Google-Smtp-Source: ABdhPJzXUbswMjOx4+aMt4YfHl963DGX01a8Jl7Lw9ljhXH1+VdO+B24dS66mJxZyiuaJpza9Iihrw==
X-Received: by 2002:aed:22fa:: with SMTP id q55mr7237666qtc.229.1603551093533; 
 Sat, 24 Oct 2020 07:51:33 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-9c01-c4e4-7778-4869.inf6.spectrum.com.
 [2606:a000:1401:8ebe:9c01:c4e4:7778:4869])
 by smtp.gmail.com with ESMTPSA id o193sm2963508qke.12.2020.10.24.07.51.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 24 Oct 2020 07:51:32 -0700 (PDT)
Date: Sat, 24 Oct 2020 10:51:30 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201024145130.GB14816@bill-the-cat>
References: <20200910162509.27997-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200910162509.27997-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] i2c: i2c-gpio: Convert to use APIs which
	support live DT
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
Content-Type: multipart/mixed; boundary="===============6159452980167848222=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6159452980167848222==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KbG+cpf3i6ZSdWei"
Content-Disposition: inline


--KbG+cpf3i6ZSdWei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 06:25:09PM +0200, Patrick Delaunay wrote:

> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Heiko Schocher <hs@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--KbG+cpf3i6ZSdWei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+UP3IACgkQFHw5/5Y0
tywZ9Av/TSLXKp3//NIAu39ih0qtMMu+HNZw0BHi2E6AC7EgpYav+x9gCK3Cqbui
qBbm8RuER2C/RnhqBz/cGrZUYMAPLkh4jFUXirTEPy8Lh5lZxZhjr2zTpUr+R0de
uOj6b8HlkV2dgdxlkOnwh2MwT9nS8OutN7Yhe+su1+vRW8FFX1ECWXdu5K9dhUh6
Ip/Q0PNjEwI67cFycluX6ictbMvzgP3tyF0mJtlSOTdHZbOJlHqQqlCQ32S0JUoe
fN4cZ5UOskOj8jmpHot92ov03viOa1zKvaWSqtMVohh7APv1LQOYj+EdbAbPVgek
BPzCXK5vg7p3pcx8h4RiWeKfpC7ruiM0RhkMlCduutitozU2Gstofhz4sLO8wLXz
JUzb8N+GXGt63c/ljNGH/kYwOr5iNH7/gU4tbjY1WWTX99vzQIGI5syij8qiCpkF
Ahc30Si+h4d4qbWGTu0JreHChmdjkmDr6mPGxZ1td+9Y+MbVNLqqAzJs3rqX0s3t
hVTi/LN2
=OmOF
-----END PGP SIGNATURE-----

--KbG+cpf3i6ZSdWei--

--===============6159452980167848222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6159452980167848222==--
