Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F22766DAEF3
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 Apr 2023 16:50:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A605BC6B44A;
	Fri,  7 Apr 2023 14:50:59 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0219DC6B448
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 14:50:57 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id oe8so30340183qvb.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Apr 2023 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1680879057;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zhy35ZKmSacK7270PrUM+wZF/kYXpIZXeREL1mgDLDk=;
 b=G6NAcKmJ52uIfCD6jKgWVNd3wFnOvXvinYDfoj4rvGQHESuxtoUY9U6r4pWvGc9S8c
 /G4gSQALHQWiABhFrNxxz79hfbiQK3+VQVdP8/MZnZTrFrl1W1KiqhrLtQ9521pXwiHH
 d0llMmEoUCtPHN9zVoyA80Y+QBUyTyP2/rL9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680879057;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhy35ZKmSacK7270PrUM+wZF/kYXpIZXeREL1mgDLDk=;
 b=FHUOMUUjMaZDSresHkzUq1Noxit2kKtT5VXCY2grkILcL4xkqg7l3Bn8IGnP1VBjGc
 hrFT6WKOxizsYygVuFCZWNDa8j6NiiExBlnEMZj34VJZhIHd6tQsxoRcKsCy8qxds/RG
 +arLerxpGE1H9+ss+ic8pLB0C2POpRr8EMTI1IePE8lSV8GMITZnM0ahj9xMakLob8PF
 0FXpffk6AK7w0cgPwOqLYlB46K4tntwjDKQuBICg4sHgwJ+JLl89pqXTV/eXHbT8A55W
 kAyj1Kc0Vt4ZRsgSBIB2jnxLJjs3lUaSRvFvuBttSH3EqnT4J9nKMNcc8AwZ2zFOmklz
 /OlA==
X-Gm-Message-State: AAQBX9eqpwjxNFjyGTEPCI+6MBa7uQT9YYxtYcKbzuw/nUwCedP0qfcZ
 +7duN9sC2kZptWGmMKI6m1I9wg==
X-Google-Smtp-Source: AKy350bYFUJMocXkfBR1F3RYNH+htsCn7zDIISxsJNDedWLPpm+2UPYVLfaQ5/lAAgpValDhcbWSug==
X-Received: by 2002:a05:6214:501d:b0:5e0:30cc:830b with SMTP id
 jo29-20020a056214501d00b005e030cc830bmr5957871qvb.0.1680879056874; 
 Fri, 07 Apr 2023 07:50:56 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-4d7a-a40c-ed12-3a35.res6.spectrum.com.
 [2603:6081:7b00:6400:4d7a:a40c:ed12:3a35])
 by smtp.gmail.com with ESMTPSA id
 my7-20020a0562142e4700b005dd8b9345adsm1371294qvb.69.2023.04.07.07.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 07:50:56 -0700 (PDT)
Date: Fri, 7 Apr 2023 10:50:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230407145054.GV1134230@bill-the-cat>
References: <20230322191223.v2.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
MIME-Version: 1.0
In-Reply-To: <20230322191223.v2.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Kautuk Consul <kconsul@ventanamicro.com>, u-boot@lists.denx.de,
 Mark Millard <marklmi@yahoo.com>, Brandon Maier <brandon.maier@collins.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Michal Simek <michal.simek@amd.com>, Sjoerd Simons <sjoerd@collabora.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] lmb: Fix LMB_MEMORY_REGIONS flag
	usage
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
Content-Type: multipart/mixed; boundary="===============0288470625599495831=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0288470625599495831==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UmAGBitAy50yMDrU"
Content-Disposition: inline


--UmAGBitAy50yMDrU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 07:12:25PM +0100, Patrick Delaunay wrote:

> Remove test on CONFIG_LMB_MEMORY_REGIONS introduced by commit
> 7c1860fce4e3 ("lmb: Fix lmb property's defination under struct lmb").
>=20
> This code in lmb_init() is strange, because if CONFIG_LMB_USE_MAX_REGIONS
> and CONFIG_LMB_MEMORY_REGIONS are not defined, the implicit #else is empty
> and the required initialization is not done:
> lmb->memory.max =3D ?
> lmb->reserved.max =3D ?
>=20
> But this setting is not possible:
> - CONFIG_LMB_USE_MAX_REGIONS not defined
> - CONFIG_LMB_MEMORY_REGIONS not defined
> because CONFIG_LMB_MEMORY_REGIONS and CONFIG_LMB_RESERVED_REGIONS are
> defined as soon as the CONFIG_LMB_USE_MAX_REGIONS is not defined.
>=20
> This patch removes this impossible case #elif and I add some
> explanation in lmb.h to explain why in the struct lmb {} the lmb
> property is defined if CONFIG_LMB_MEMORY_REGIONS is NOT defined.
>=20
> This patch also removes CONFIG_LMB_XXX dependency on CONFIG_LMB as these
> defines are used in API file lmb.h and not only in library file.
>=20
> Fixes: 5e2548c1d6e03 ("lmb: Fix LMB_MEMORY_REGIONS flag usage")
> Reported-by: Mark Millard <marklmi@yahoo.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to u-boot/master, thanks!

--=20
Tom

--UmAGBitAy50yMDrU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmQwLc4ACgkQFHw5/5Y0
tyzjPQwAg/ssXjTAxuFwSo5eJYeAhLEsbu/e5OiMji8be19fNxcvNZiMozwL/N3D
HMaZCTcYYr+lbjc8F/REdfG0jakBn5M7cl4gOiywSDavSAvpmvdJu5W79jUE89Tt
ehXwofH3grKCShOxgMCBw9bgabEVrjkk6Uas95u+28Cjv3H5x4IgCrvUSUuuAfEl
Tt/+tpMs+smYABG3DgaYIcRNx/LmaYqYjJGb5W557wGP1T6Gbvt0cJPxjPTcqHMR
icXc8a7va6UKOWWZotzwkyd/4Sl09cpI8vx/+7n8dGmL734QrlhUnSk+mFrMRlId
xgTPSs9SdNq9zuQv0BO8l6QRtVe57ij8faTMI4/U/KOSaNWRyi5c3Fh5GMuIP/JK
5gh6/xwVyhu9AR/oyUGTK2nplBXz/ebiIuhBf1uL+z8AueTGrlhk4HskHe7F0Auz
tcoDUjX0OxPvJU4vKIX8xksLxsSWJy4k2eXuJHg/mxFNoZ/UJrciGUYEYzopHgTw
RFk3cwUF
=FCFF
-----END PGP SIGNATURE-----

--UmAGBitAy50yMDrU--

--===============0288470625599495831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0288470625599495831==--
