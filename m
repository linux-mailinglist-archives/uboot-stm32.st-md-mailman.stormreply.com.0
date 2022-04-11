Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 178444FBF7F
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Apr 2022 16:47:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3E04C628A6;
	Mon, 11 Apr 2022 14:47:22 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6A7DC6049E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 14:47:21 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id 3so3335523qkj.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1n3DAdpwCeK4Oa3kOUCtgHffX0L+pPkk2MGUf3Uq2u4=;
 b=f0ahQd3FePX30PWWZzVABJqpxYRXiCqDDtyQkmQ7SmQMrfQT8iw/iac9lxN9TQ/22Z
 O4S15IWTut4L+8n4pG91pinl1cctmEslQwRho/i0Hd2OSHzQz6QbaH4TyTQNdxtHNcT1
 AG43s1gi7yIbEpFpWAO2ua2XghVI+HYr91jBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1n3DAdpwCeK4Oa3kOUCtgHffX0L+pPkk2MGUf3Uq2u4=;
 b=M4DD4VKFcv5hG63lNpM4/aeYoF3GtGlQDyaDTqh2y9WsDdFywbuSzc49VOS/3yeB02
 kH99R+bMPiMDx2Tyw6WeA3phPp5Ee58nHda6fgnhyqApOaMXyPXYcIwcPR0PtFueA+ax
 OKzQHIXpx3Nt/k6zHrQqR9wQBPvCfr0p+ltjScuLxtl6mAKtX2183wfkbivFXm/n2X0g
 yh41x3C+OLSC2oRmVUR44XJoJtpuNxufArEwxVrFjIf3Mlo+nG1DpjbXbM5ZSh1A63mB
 Fl/aIyAyld6bAA4hT/OFLJPIcH8wa8ENGsMidh2Qgj22MNpufKUmXsg+RU+inRZ9EQDs
 1wNg==
X-Gm-Message-State: AOAM530q/F3kWpbnEGBr/hVB9T+xL77stOy4OjitCwClZp3jz/Xl9nug
 9QIa1QpIOh+B/tyV6S46eU9N2w==
X-Google-Smtp-Source: ABdhPJxyCdJ7uo9IvNI3Y8R83uGoEqfm1vik0G5KmE9C3TSIxwfRsonkyHlmMnGI4SRsIp7E8aKWtQ==
X-Received: by 2002:a37:6382:0:b0:69b:fbde:42d1 with SMTP id
 x124-20020a376382000000b0069bfbde42d1mr7285803qkb.48.1649688440432; 
 Mon, 11 Apr 2022 07:47:20 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id
 f3-20020ac87f03000000b002ed137e0510sm5164830qtk.77.2022.04.11.07.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 07:47:19 -0700 (PDT)
Date: Mon, 11 Apr 2022 10:47:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220411144717.GF14282@bill-the-cat>
References: <20220329141831.v3.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
 <20220329141831.v3.2.I610cd6d6ab087268c699b320865cffe3bc899ff9@changeid>
MIME-Version: 1.0
In-Reply-To: <20220329141831.v3.2.I610cd6d6ab087268c699b320865cffe3bc899ff9@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 2/3] tee: optee: bind rng optee driver
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
Content-Type: multipart/mixed; boundary="===============7764559413504834145=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7764559413504834145==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vjt5mXJPvliG4SvL"
Content-Disposition: inline


--vjt5mXJPvliG4SvL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 02:21:24PM +0200, Patrick Delaunay wrote:

> In U-Boot, the discovery of TA based on its UUID on the TEE bus is
> not supported.
>=20
> This patch only binds the driver associated to the new supported
> OP-TEE TA =3D TA_HWRNG when this driver is enable.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--vjt5mXJPvliG4SvL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmJUP3UACgkQFHw5/5Y0
tyx61gwAuZ180fNuYdu2LF+Ihfg3pnxGfM+aBT19BbB4wMQ+ruN6GVeRJOBIBzxo
LEe+MRlydyYPlro9sMi+avoz676OKGCRe/W8TptY0lPyuvEWQQgTHHs1J/2J0X3c
gMv4OkdE3yD8/TxHKiVlDzQ0iY4G7qY4FYuO1ieQKwjhuMWhSmDls0TTwedY1jG0
nDlqfG9wUhcuESRzg8LeG8grBLzRHBEoElOugN8RYe7JPT9TvgX63s9y+GXNOul0
P93WsursmAbECtmAC98ant5pfZWY+XJNO0aSoK16A6AWR+J5xIsMZD49GhHB0pru
e2QpNqLlUz/xAn25rfcnMFnxJDVfK52GZsc4ijbfof0BfWHbcU8bd8UaUK/JapHt
BtKphR51XKLOsePTPraAp51TU1fSjWpcyRdVgkNClu52uz41kzQN0XeTYzHZWF0g
RVxDDrhRSGk3LsXb4qwIRDtEIdSfV98jaI3JAsoFOjXKsRfamLszru+1a/M/MIPa
N1tWW+vT
=Y963
-----END PGP SIGNATURE-----

--vjt5mXJPvliG4SvL--

--===============7764559413504834145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7764559413504834145==--
