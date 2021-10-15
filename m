Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D57442FABA
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Oct 2021 20:02:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04A8EC5C848;
	Fri, 15 Oct 2021 18:02:51 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DAF9C5C846
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 18:02:48 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id z24so9501318qtv.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 11:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KgmN1ABgn4oND4tEYicCrwaeyqR8DmpGvWYh9pZFeiA=;
 b=hmPLwzO5JHXfnXnzAj3y4QRzwixxxH2OzPzMuDcxt2uRYInMfVaPI8qpOFok/26yOp
 T5yHW/a7mU++1nJaf2N22BgtK5Q5nKNqoM/zJkfj0nsksoEKuLfX2FplQvMEekd8bnBi
 M6zfYzBICKxY+VsYY2NGjawSeiurjozgYWHEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KgmN1ABgn4oND4tEYicCrwaeyqR8DmpGvWYh9pZFeiA=;
 b=qjvkYVxb3NVRgXdl+MCb0aCZraISWMzWT+SunLVP6qPeOsb40MC2Ca/grtXFi9gRsr
 A/bRP+xRVTxdpL155Alowha8cv9RwC5XETxyLuzwLgJHTMfMmYnyNimm6BgMLSEV+NWs
 JJ0k0GKb0mSb0BXO3ksrHBpYt8vLRO4wpqgs2TmIbH7S9URREGDpVOpslzzpmZD9fZ60
 smoM4eIP7X5cKIHfVpuXodOVIQalAhW1G+z5IP/M5h2GTgQCyS9BPin7wS0O+o/L8dq0
 LbMO0gQfEKvHpfkBKd6AqyKHxyPLzbdBCJtFl6nfbdHzDhuTO81hL6dvIglAe+jH6sY9
 oXxQ==
X-Gm-Message-State: AOAM531G5rhUVCasYGBiLtQ+yTNCB7ese+izwSh1AIxaFycvu5TUs97e
 LE3kCnE6I4FaMpFzKQiGV+kR2Q==
X-Google-Smtp-Source: ABdhPJwU7XJtfztNDolNIsVCxR1p9F1k87o+LzXYnRPPz5+2ZS76n9Q2Q4cUYXNzlOiGbkGB9l2vag==
X-Received: by 2002:a05:622a:1051:: with SMTP id
 f17mr14735150qte.65.1634320967766; 
 Fri, 15 Oct 2021 11:02:47 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-f8b0-5c25-4d47-ecdb.res6.spectrum.com.
 [2603:6081:7b01:cbda:f8b0:5c25:4d47:ecdb])
 by smtp.gmail.com with ESMTPSA id h14sm3192684qkn.4.2021.10.15.11.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 11:02:47 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:02:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211015180245.GE7964@bill-the-cat>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.5.I524a7a0139ad01d1a9b935314446e64fec9d5b8b@changeid>
MIME-Version: 1.0
In-Reply-To: <20211004115942.5.I524a7a0139ad01d1a9b935314446e64fec9d5b8b@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Stefan Roese <sr@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 5/6] Remove unused CONFIG_CONS_NONE
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
Content-Type: multipart/mixed; boundary="===============0725309547192012248=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0725309547192012248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tz827eEgdc+99pmc"
Content-Disposition: inline


--tz827eEgdc+99pmc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 11:59:54AM +0200, Patrick Delaunay wrote:

> Remove the latest reference of CONFIG_CONS_NONE in code
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--tz827eEgdc+99pmc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFpwkQACgkQFHw5/5Y0
tyytWwv/ccdGPLPYiBvVqvjU7HOyHxt5UuxcgGuet13+IFM/oqqH2WzZCp76Biba
U4u+N2Gfrfx7yEPV0ykZuMw6G+wbq+Qpe9hEKL7Ddh1LbrqEiQ1QLIPlai756NfI
VSXdpFX5wLd5PtAExbnjvPTcVm9yCZL6hReYULbcYK2ECxtlLDNR5P5w1Qm4l+F0
cgagwd+mPsCXk9A9mMac/+Tbn53knjPJahQnFX7OaPtZLoyjgtmZPVxOqwgiryc3
YYFN3D6FNIKOoiEATQnv7W1xO+qwtr3HtY2OJrFYxxYQ42y7LG1HnrQU4yZr0spd
n1Jm2yVEDphiPSjjRbG2RfTcgZijSJLRZBUo4M2zV8lU6uu61J4WZ/aWjwowjxq7
TBzxZn2aq4DygMND2+ZzujhCevGLetaOVZHdXpVORPJmv8lionWB6hUOwZxDy/04
dB9Q/4KqSPBaL9U/IpR5FUtJ//H4dhMzYlA5pKgwTFrndHhFi3MTHInpCbsFMA9m
Yf8btuho
=vnvS
-----END PGP SIGNATURE-----

--tz827eEgdc+99pmc--

--===============0725309547192012248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0725309547192012248==--
