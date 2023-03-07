Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A9E6AEC29
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Mar 2023 18:52:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A4B8C65E60;
	Tue,  7 Mar 2023 17:52:55 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 996F3C65E5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Mar 2023 17:52:54 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id l13so15295590qtv.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Mar 2023 09:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1678211573;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wC5xOIAx/pZvEp68s3EdX+GNTKBuY919Z3Kf/5kk45w=;
 b=B3xXglTNtAzC8ulslOhviJvZxWWw+nMLPhLy65oRR4QHwYbkYDdbWYvXDoklspcdAZ
 eDz+TpegbR8m8rchPLDV8UoTmAgr3s9UKuy8Vo/k3OEMO11BfsXZ87WjDLcrXzkCQokI
 GZrQOVAoqhWnSHailjUlc1lhyJj78JXPWKiWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211573;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wC5xOIAx/pZvEp68s3EdX+GNTKBuY919Z3Kf/5kk45w=;
 b=z9TDeAgMfGjqBX8fP1IwLXF3JDYa324UyvT9oMyMPVhu6Pe2pvZX6zETK4xqTgYd/+
 AFiRJS3oLH0/UnKj/gDbO2kw3zy6UCZ0RyWqRgHAYszdmFjeuFfPLMWk4evM7vneVJjP
 94SyXkCSvX7Jbc8XKj726j5JXNi5Ez9xcIwAdfGe7sazJH1QcY1dyzPu8KNp9wbCPGYR
 ZAnyHLskaQ4xt3PM82IKKiCi2dzogK9pxu2DtaoBKTyE3LGHikhkykyORnCuk1dwAChg
 RBabhvxgV7b9pqRqe6l6gCfSogiWgLgxK5xWd8lvJOHsRutQJt4dmCJXQQO7WJO0s9Vi
 1jTg==
X-Gm-Message-State: AO0yUKXP1GOoZ/XM7OkEsOW/L9hLRRWVqzD1mwlO22ScEM+Rz+bucn0N
 pJ4mLRh656+zw68zuzuRoxh6IQ==
X-Google-Smtp-Source: AK7set/ZA7ZTObPRXELa6UTDxEUKgboAMXAdmsPKETT7ltMsR2zAVDwZjTZpWWDSXH+xdHoiDjnVyw==
X-Received: by 2002:a05:622a:1a1c:b0:3bf:e034:5f53 with SMTP id
 f28-20020a05622a1a1c00b003bfe0345f53mr25316329qtb.59.1678211573453; 
 Tue, 07 Mar 2023 09:52:53 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-0000-0000-0000-036b.res6.spectrum.com.
 [2603:6081:7b00:6400::36b]) by smtp.gmail.com with ESMTPSA id
 h15-20020ac85e0f000000b003b85ed59fa2sm10380202qtx.50.2023.03.07.09.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:52:53 -0800 (PST)
Date: Tue, 7 Mar 2023 12:52:51 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230307175251.GT968799@bill-the-cat>
References: <20230222201943.1.I901beb8819b481b6a9b55b2c00768225e5e12649@changeid>
MIME-Version: 1.0
In-Reply-To: <20230222201943.1.I901beb8819b481b6a9b55b2c00768225e5e12649@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: remove SPEAR entry in makefile
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
Content-Type: multipart/mixed; boundary="===============5717733533869770234=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5717733533869770234==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wTks81/+czA0TBQa"
Content-Disposition: inline


--wTks81/+czA0TBQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 08:19:58PM +0100, Patrick Delaunay wrote:

> As the lastest spear directories are removed, delete the associated entry
> in Makefile.
>=20
> Fixes: 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr s=
upport")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--wTks81/+czA0TBQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmQHefMACgkQFHw5/5Y0
tywFgwv6A6gLcFY+STqAOWm4HAIBe+ZMHrGjM5ORHUiGdH+0IcXgFycY2I5dM9+T
Eas3pbCC3lv7aksuQ5Ph6VUkFDb+fObIzljM4ZTdKLMxqRwlYG3AHyDVT7AebZ1+
WZLsbmZu3Rv4FpIi5e7dp0+nZQxMwwj1XPCnN5rjxKaxZvrhxKlBCfARZGrrwfye
UjwwP5oKz4bZtG7gS3q2T1NPkZAvFyIVUduQDiBaq0Rc438DGtRd0h1ln+B85ePL
QJOe3ikT1s/Jy+jEUxyQQZCz7V42YaHt+a9QZuvwETmS0c0AOCEk9BH9WQlmTyIe
7HnEbE16q+JbFdyYJA4QxDP8WwzJD2x3hpchNDncM6ZQfXHHRMB5DBPPscNOvfy7
8T4BEAZI+RhQXQG4CjOIN5OYThLl5tgs/lOznYbsJ+qGAY15EHjV4i3TzFB+ET9n
+w665x4WQLsLyIARzP8GakFA+VLG+cSLnS4IFg3ZlsTJWXM6RMUVFi9faRydAKGT
4O89iDt2
=PFhK
-----END PGP SIGNATURE-----

--wTks81/+czA0TBQa--

--===============5717733533869770234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5717733533869770234==--
