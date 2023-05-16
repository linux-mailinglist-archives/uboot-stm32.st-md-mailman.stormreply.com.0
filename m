Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE17051F2
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 May 2023 17:19:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7399DC6A61F;
	Tue, 16 May 2023 15:19:52 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E43AC6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 15:19:51 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-559e53d1195so201182677b3.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 08:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1684250390; x=1686842390;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Azynhadzyxs5W+asQDVH6wmORo2XuCm3Ug0UwtkrU4U=;
 b=UIpUbSSCdIAOUzaDbjox4tCGFM18F8O5Xl/H09Ac8nrTP5DXZwGDmmPzcMxymW4gZ0
 Y59b3LAPilJQsuhGL3eN3PF6i5oWIIvKbledH8TdU8Mfxu9p7Zp+goahVhQIfjROeTNt
 xOFukN5PHZIEUZzqCHZKtHx51ahwQ40PNLn5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684250390; x=1686842390;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Azynhadzyxs5W+asQDVH6wmORo2XuCm3Ug0UwtkrU4U=;
 b=g03TftSTbLfP+pAQ2FfQd6mSzv+FCHE8i5SyrorcxXuG3mPtKEGuTrJF9QjZPqnZGi
 A+YdM/qnBpw+KwEPLe9yOXkLpYQ1pctlnGNwCKJml7DO3D52Rt+RhuJwxWKpZ3zRAvI4
 ZV87Ao4NveDhvpx6YYmotMj+sD4oWAxxF3ushPojDNV7iZcUVztefwp8XVnz9kJyNWXH
 83xJQLgwplDBYMejPfa2fPdkYol4BpnVWYH7fqSuYL6cqqjXbZihJG1aXHXJE7ucBqWQ
 gwVENS/P9Md4kMCdBypr9lz1NuJZ0Tr+BqpUagamDWEoVXey5gWT4W54pVKPawB5RAin
 j4Aw==
X-Gm-Message-State: AC+VfDzlfiXYfIHmsvc1pZF/lTSSHtD9lb8K33q3nEpivpoptjXtfPIo
 YxwOJr13aIG1OKaLNjDrDYMUUA==
X-Google-Smtp-Source: ACHHUZ6FOOMQEVoasVWP9dgT8+cJPWmtx1NBZSZO5fGkOX2p9yJEdMOKn+EEzLgqmgjPMum+b2XXDQ==
X-Received: by 2002:a0d:db15:0:b0:55a:3cd6:cded with SMTP id
 d21-20020a0ddb15000000b0055a3cd6cdedmr37837838ywe.4.1684250389970; 
 Tue, 16 May 2023 08:19:49 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-b213-426d-36fe-d1f1.res6.spectrum.com.
 [2603:6081:7b00:6400:b213:426d:36fe:d1f1])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a81d54e000000b00545a08184e0sm647246ywj.112.2023.05.16.08.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 08:19:49 -0700 (PDT)
Date: Tue, 16 May 2023 11:19:47 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230516151947.GE2398826@bill-the-cat>
References: <20230511163616.1.I4548bdac5ed5e82ef903e7187781536e21d9b06a@changeid>
MIME-Version: 1.0
In-Reply-To: <20230511163616.1.I4548bdac5ed5e82ef903e7187781536e21d9b06a@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, u-boot@lists.denx.de,
 Nikhil M Jain <n-jain1@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] drivers: core: ofnode: fix typo in panel
	timing decode
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
Content-Type: multipart/mixed; boundary="===============3781243649084020340=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3781243649084020340==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C+m6O9futrCu4N1r"
Content-Disposition: inline


--C+m6O9futrCu4N1r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 04:36:52PM +0200, Patrick Delaunay wrote:

> From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>=20
> In case where a single timing resolution is implemented in the
> device-tree, the property is named "panel-timing", as specify
> in Linux kernel binding file:
>=20
> Documentation/devicetree/bindings/display/panel/panel-common.yaml
>=20
>   # Display Timings
>   panel-timing:
>     description:
>       Most display panels are restricted to a single resolution and
>       require specific display timings. The panel-timing subnode expresse=
s those
>       timings.
>     $ref: panel-timing.yaml#
>=20
>   display-timings:
>     description:
>       Some display panels support several resolutions with different timi=
ngs.
>       The display-timings bindings supports specifying several timings and
>       optionally specifying which is the native mode.
>     $ref: display-timings.yaml#
>=20
> Fixes: 0347cc773270 ("drivers: core: ofnode: Add panel timing decode.")
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--C+m6O9futrCu4N1r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmRjnxMACgkQFHw5/5Y0
tywRswv6Armzh6LzlWeVLnRxG1Dwv7FjC16tSFa7olibpsVZ1s2FWV3moAoeJAoX
bfokEu1FM1H2ftJRSRS0D/1w5AmODt3lSqIndRbbruvbGvcC9koEV2VBGn7Yr4nU
3XCq/H+ZonHdo19rrljU2pOEaS0OG1lP16Ac/uVK6QP4/5yy10lugzL6ETAjZ4X5
w6Q6PK2mdfkVr2u4ZjsCdKmu3GgECo3R5AmRDq0EO1GWFsl8mgXHqWXhNlQA+1vM
Lxw4HXVRPoFGcFzyiY2j8RHi2Il66LZKz7/b07R+M5I7UBnqc6+V/8fmCOmohFLL
wKNiEDh3qIa6TRmxOM4xFPMaz3GdEaorxKWHG1xsiB1G5NnU9Y7/1S1KbtYXwD/Z
VNgLCQwHCq2FUf2RdSg+vxRrec3FbJV5NSmOKxqVKiE9DRjLRMngS0RTG7liqxKt
d1E57TFsZkjKonMXWMIzB2V295eG+NVAYpTVuHpa9DZsHQfc7jSTfFipSpN7gyvT
akUlyl4f
=xnur
-----END PGP SIGNATURE-----

--C+m6O9futrCu4N1r--

--===============3781243649084020340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3781243649084020340==--
