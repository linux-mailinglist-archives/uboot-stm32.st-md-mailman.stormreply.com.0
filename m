Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6992F8DAB
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:24:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24DEBC57190;
	Sat, 16 Jan 2021 16:24:22 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E117C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:24:20 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id n142so14864115qkn.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MmYyoIrOI6mPFhndfA8CDgxWtxlHvnjXj8JiSxWa1o0=;
 b=J9kRde1RlNFVVCEfTqd160HI/y5mLd/LjprBUTSZK5Tj1FmqspuLaGFrKT9Z1QcwuG
 IMKgUNr0mUxSU+zQeMzA7bK3A1jf3NNu4lZCVDVmdWVZDlJTcjABYZTeX07MlnecWMhM
 aayiHGCyyuqjlucTQx5DAbZDq6EUiFEeQ+ZZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MmYyoIrOI6mPFhndfA8CDgxWtxlHvnjXj8JiSxWa1o0=;
 b=W+N7wec66xP4QU7bhX8VF1MxQCCL9u6p4i9Jb9D5S4S1lHYJcu1ATak5OlVdbOfSPA
 C+nAUSb0qQ/vhBO8tf1wMhwIGxtT+nBeYCJYQY90jInnOx2aPookq/UeVHN06FNT428T
 6EG0DrhRZEaHyDW7cxUQxQJt6lZAqHKQeIhnkEFxZUtSpIYdtZgYeoie8UXVdrS9vnle
 uijSc/XtfF2c+C4Zs+AkhR0YcBIrsGKYJlygPEs2JqNJaZ48Zgkt98t5SwpZW9XXkdhg
 h2Ymq4Lm8jtRX3vtc9CH6tEdgVVTXEMw/FzRYCTCN5WV50OBq+QJ+qGN/7LheoKFm1UO
 F7iA==
X-Gm-Message-State: AOAM531Rib6s/p5tGC2zhA3+gDVOrMQMjakOtNrVvlCcNBOAvifYlN+0
 5cQa41j3AcvDPU/N9FnSO9nPuQ==
X-Google-Smtp-Source: ABdhPJw4Hf/URMs2Pn3eCYuW1TTTKtIiEkALS8BrMgVUAwrFWxbDP7QgbDjCMoNKwTbEXG9qSvf3Tg==
X-Received: by 2002:a05:620a:2009:: with SMTP id
 c9mr17854483qka.159.1610814259171; 
 Sat, 16 Jan 2021 08:24:19 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id n7sm7238380qkg.19.2021.01.16.08.24.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:24:18 -0800 (PST)
Date: Sat, 16 Jan 2021 11:24:16 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210116162416.GM9782@bill-the-cat>
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
 <20201218124642.v3.1.Iaf4e6c8a8adfa754adbf7a27200c0bc9e9f9b363@changeid>
MIME-Version: 1.0
In-Reply-To: <20201218124642.v3.1.Iaf4e6c8a8adfa754adbf7a27200c0bc9e9f9b363@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 1/4] console: remove #ifdef CONFIG when
	it is possible
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
Content-Type: multipart/mixed; boundary="===============7757812035543973451=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7757812035543973451==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HAMBHDB9UZnMikye"
Content-Disposition: inline


--HAMBHDB9UZnMikye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 12:46:43PM +0100, Patrick Delaunay wrote:

> From: Patrick Delaunay <patrick.delaunay@st.com>
>=20
> Remove #ifdef or #ifndef for CONFIG when it is possible to simplify
> the console.c code and respect the U-Boot coding rules.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--HAMBHDB9UZnMikye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEzAACgkQFHw5/5Y0
tyw1bgv+NMQELK6AgUdDqtsVSNPRZqRWiDskxY1Ed5fPa3mYiBQu5PW0oF1P1gMi
xzbb2VFBSI6jlqEOnWClbA6xTteAxWKF6bLYM9E2O9Bp2eE3w6Bz3kKyizvcneqY
lprZwyeHRDSUq+w8S3IAXDvb9OmX6NJBPGyhNjAioX47/KSOZ1f55tjBcYgp0eJn
KpyV6Ct3aSKdl7sotextZIBIktlAjPm6fe0RnkpCq8dPtfhN1XceP0yk48OzHwa9
Sispt42XILE1u88HKLVIVrNodNwuErVXJzXmaDJ4NzqC16n1HkioRZt95vz+u1hd
X06I5R6cG4JsAlGQeOwASIrZjwRAtGcX9HKI0Z/4Px2ZUbar8KcSjD5M/YEYY1Pz
vAP0ssrnWZIECva7jpqyBvzka6P37epyqGWw8U8/5fto8rBPwFB6ncCkpmSDPryt
o5HIZNTHkPKPDo7UbZCJZtToN/lfP4HVaf7dqfKs+1R603V3yEu33SxcmVO4hJZ4
u+2pDd+F
=DO70
-----END PGP SIGNATURE-----

--HAMBHDB9UZnMikye--

--===============7757812035543973451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7757812035543973451==--
