Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 354286678EA
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:18:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEEC7C69049;
	Thu, 12 Jan 2023 15:18:30 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 577BFC69048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:18:29 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id jr10so9405969qtb.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 07:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0N3xisRVTxH2vEe2y1pOxPaASFhNO+A0waqtV1n+tYE=;
 b=r3TPEU3K4YpVS5osbTeIWnV7s0Ei3L09muJcJ+PzWaM6nkFdWrfR0XvtVXirjlrw6A
 4A9usraJG2J1Bvu9hHz/16QoLd7vB3Wv2X4rjiFD376d+UZE4SVW+RuuRxm38QxM0b/9
 b3UgkGGn60H6+UaDJruFlueG+I0CZE56SCjyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0N3xisRVTxH2vEe2y1pOxPaASFhNO+A0waqtV1n+tYE=;
 b=iY1ZuVhIuPiVGO+cEwm/Tkv0cCcTIMo1ioXoUMhHMkwl7tDug0B3Jy126o46LjLSNs
 hEpHv/GEAMKy/v9sIp2u9Zu9sgKbz13p0anOLfZXwZidFSovceV6aXP6L/N6hKpR6pbj
 iqX4cmWSGHugUu1wnfZj+2+629fivWgL/NbcdUdUaZr2CEwxarx5ghFpI8w7yk9lrysz
 ScRGIe/d07K/IkUrAAjEUPezWlGKsPrK6/YDnMKV3GM8lL3/MzyaHdRf2mpYr4aNLOoQ
 hCoh3VJT3+Pxbk/Ql9Ak4N7LT9LRvpZoOQOMP2m5pj4mvSL1t9TScF53NzooAEqiov0E
 CScQ==
X-Gm-Message-State: AFqh2krCsaFD9bpc/1fTcZIKEbAq+o7qB5xDLhDOi6QdNW14ppH/YWgS
 g1YRqSmRGP5Dc73CeVA2DWLx5w==
X-Google-Smtp-Source: AMrXdXub+NUU8i3Pxn4JrInHYUtkjOGwtdwPm+cv2BslfGESv/fXqy8x80s70ENUIKxtcVzOiqTRTw==
X-Received: by 2002:a05:622a:5a0e:b0:3ad:17ca:c3f with SMTP id
 fy14-20020a05622a5a0e00b003ad17ca0c3fmr17668324qtb.35.1673536708344; 
 Thu, 12 Jan 2023 07:18:28 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-38c4-8177-7e9d-a94f.res6.spectrum.com.
 [2603:6081:7b00:6400:38c4:8177:7e9d:a94f])
 by smtp.gmail.com with ESMTPSA id
 z13-20020ac875cd000000b003aef9d97465sm4380136qtq.43.2023.01.12.07.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 07:18:28 -0800 (PST)
Date: Thu, 12 Jan 2023 10:18:26 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230112151826.GD3787616@bill-the-cat>
References: <20221215095446.1.Ia16a826f3adcee45569a6d47e8ba5b5e3c1d7373@changeid>
MIME-Version: 1.0
In-Reply-To: <20221215095446.1.Ia16a826f3adcee45569a6d47e8ba5b5e3c1d7373@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Etienne CARRIERE <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] optee: bind the TA drivers on OP-TEE node
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
Content-Type: multipart/mixed; boundary="===============1909089937132055823=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1909089937132055823==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cUgtEJFx6IQj6a8a"
Content-Disposition: inline


--cUgtEJFx6IQj6a8a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2022 at 09:54:52AM +0100, Patrick Delaunay wrote:

> In U-Boot driver model the devices can be referenced by
> phandle in the U-Boot configuration nodes.
>=20
> Without a valid node provided during the bind, the driver
> associated to OP-TEE TA can't be referenced.
>=20
> For example to force the sequence number with alias
> (.flags =3D DM_UC_FLAG_SEQ_ALIAS)
>=20
>  	aliases {
> 		rng0 =3D &optee;
>  	};
>=20
> or other configuration:
>=20
> board-sysinfo {
>    compatible =3D "vendor,sysinfo-board";
>    ramdom =3D <&optee>;
> }
>=20
> With this patch all drivers bound from OP-TEE service
> discovery are now associated are associated to OP-TEE
> node, allowing to identify by phandle the driver
> provided by the TA for one UCLASS without modifying
> device tree.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--cUgtEJFx6IQj6a8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPAJMEACgkQFHw5/5Y0
tyw3KwwAiAL3+QNlnquwLID/fWK0SgJ3weD6BCdDgmQgU72cP+rggfhrQl7aafhv
SuNHPfxPgmrh+XqI11syJFEq5A+gZS+6gV1Jk5GFaHPLgIvZ2v/Mbzk4n00demKq
49gz5qkxhNeghwiMvNqGBC0yNFsuJPxYe0U5DKq6pwaISAwffkj/WfleB8nNol1y
C65LR6Ikthf6rx1lsPnjhCdCyQhbgS3shsBwtkrztY/T23y+vQqois1urDpfwgAD
Xtc0lcAMUeV40UlAq96WefCRM6wlXbh2+A0CXO+NgNx67k6GhnXc4TakLXazS3UL
jtNOeXhLElK7zSdBp0fumby82uicdj+hfpznrqw4y7SYxIRfGHlu7wq/dy+DYa+P
DIge9SwV5Q5FvT6qjortsk8zYiJKlt6a4drgIQECbsJGDV82XaMAk78l4ex8Ig+j
uvosR0KZrPzapQj6SGAFC0MSz8Nz/908XxIc0GTB6+4XNW/l53reiA54WyHLQtm+
l55/Yspl
=3hwJ
-----END PGP SIGNATURE-----

--cUgtEJFx6IQj6a8a--

--===============1909089937132055823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1909089937132055823==--
