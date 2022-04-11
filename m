Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66B4FBF7E
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Apr 2022 16:47:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5551C6049E;
	Mon, 11 Apr 2022 14:47:15 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31316C60495
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 14:47:14 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id d9so3724675qvm.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3khZJrfE0qcwgaKTtVNAibgNI3UVS0DLeOgwcxj0ujA=;
 b=fvjasSzIfjpGVFWTSp0ZVPhnOaZGLt2W+OT/p7CfNWmuMIOAToYQnDoUogvdvUt3WL
 e7fB4kJGpWkUAtrqWnIgln7jTeHfF2A5Nmbhds3nQMPvMgIb31tPXCoKWN9RqEcpJvOD
 Q5Yndrc1lRPz6TyNWI5uNj1Z2ujiqc5j0GBbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3khZJrfE0qcwgaKTtVNAibgNI3UVS0DLeOgwcxj0ujA=;
 b=7Iy0I4e/1SRMkvhWBcJ9jolKDOJAJu8HJNPnqQcIQ4sLiYJOkMmWt/iAbh6uytIU00
 eKiadypOPxOj8mLHtHT+bX3nryiE5B8iWi3dBGNGbIVCUC0iD1IOlvSbqgMpwlRr+lCH
 g1WJGoBfHMMKrocsCbrwm79ibC1VKPzFphg/aOwezQ38oxlwsQwskZYeDfV0pmdbokFw
 rBry3Vv7WjHAh0sH+4de7VtyACWj7MGU3dYg/pk5xxY20Y1CSGxIGc+OlN69fUydLGC7
 wpx6RS0k6bCBXiOU21lV3donWqT510K6Fj9mDoBU6JiBZiojgoADZnonfmDng/wtCNED
 h0Wg==
X-Gm-Message-State: AOAM531q7IeF0eAbX55beBSteT089hYyjqAl8H2u7GvLhvR0GsoSJ2yh
 Ii1+PwAKTE+Vz9buMNSwiG57UA==
X-Google-Smtp-Source: ABdhPJzgxH6hlY0xXVEpoPHf+YClfq+7KzbqAVzSHHVFjSlfmqsAkdADKNh+pdTU7YXM3P6k6mAXKw==
X-Received: by 2002:ad4:5cc3:0:b0:441:1959:cb45 with SMTP id
 iu3-20020ad45cc3000000b004411959cb45mr27546152qvb.93.1649688432916; 
 Mon, 11 Apr 2022 07:47:12 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id
 b206-20020a3767d7000000b0069be71815b8sm5977666qkc.42.2022.04.11.07.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 07:47:12 -0700 (PDT)
Date: Mon, 11 Apr 2022 10:47:09 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220411144709.GE14282@bill-the-cat>
References: <20220329141831.v3.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
MIME-Version: 1.0
In-Reply-To: <20220329141831.v3.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, u-boot@lists.denx.de,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] rng: add OP-TEE based Random
	Number Generator
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
Content-Type: multipart/mixed; boundary="===============0636423114862140332=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0636423114862140332==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PmeXHqXogrb8Ap3n"
Content-Disposition: inline


--PmeXHqXogrb8Ap3n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 02:21:23PM +0200, Patrick Delaunay wrote:

> Add driver for OP-TEE based Random Number Generator on ARM SoCs
> where hardware entropy sources are not accessible to normal world
> and the RNG service is provided by a HWRNG Trusted Application (TA).
>=20
> This driver is based on the linux driver: char/hw_random/optee-rng.c
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--PmeXHqXogrb8Ap3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmJUP2gACgkQFHw5/5Y0
tyzpEgv/SBIg0yfJz7v3uY/jUFSDqmF9/x5Mw3a0Y9tmId715ClSDv80Mjn7nVxL
hFgIXFqli9XHSalgYDWsqMY9YWOGMR0GxIY4PKth+BlEt3gqvfSLTR18Ula5K6Yx
9ArpP4+39tIFryIXXuHu/cki6Z3T9XRAgwtg7jIUmVJhXyMQQznFA8nDqX0rpCN5
64NKahYW8WEO2JRKabwCHbuSsTzHT3/iFwGeA1wAqiIWcfl5KNFO5rDYABnTZPfO
epWEQAauF0SxDWWQdh66ruA7syU0MAsAir2VAiI56hNBn7mLKU/ULbnPcXKo3TVk
X3qMpiiJ10waB3Kh3G3repsICaqfwYbfgK2vf+TjDx4nUIg4l3RUvZu237NkEOeO
nP5UDwQrbcNkrDj4sYAgd10VRR6KdcNwOzVPpxxCqAPu4fHECd9KjRTg5f35ngc7
R6rYfZV0CO0cdq/lV7zx6dwgmbI8rgWN4RL2GlSrn1UKf2dfoI6DWNNLl9PIOb3t
ECbS3zvk
=dlS9
-----END PGP SIGNATURE-----

--PmeXHqXogrb8Ap3n--

--===============0636423114862140332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0636423114862140332==--
