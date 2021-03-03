Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBBF32BA1E
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Mar 2021 20:09:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 988CCC57B62;
	Wed,  3 Mar 2021 19:09:18 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACBDFC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 19:09:16 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id h7so5333918qvm.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 11:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cVt/jCYLmLeR+ojeDlyRmXXAhliPaKXb1DNkgY0PW8A=;
 b=PiuuOEYoOtN5VufLRRzElKTFVp4J0iWwkESiXZVgroAc+j1GpBh6/i1vT1zWLAbgi5
 1agI9R67pL0jCiJZFyAiTFD7ZcqpqdWey9bJVHt2jahXTsUAMSFHyVX8Bmy2r0fZHECx
 o9OSuadjFXGsYLDcCza8SbjL5wtBVwkTmbnaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cVt/jCYLmLeR+ojeDlyRmXXAhliPaKXb1DNkgY0PW8A=;
 b=IwNGfkItkMAeVBzL+CyASzuZQ8qDQmeJ5TuI9XSRhaRHpyWTkcCugCY+ypw7KjNj/X
 TMwKj3qg5M1D6SI5vuV3htNUuA/031paFSlMracbT8KnYcKxW8JDthGyZD2zSA73RXrf
 f4U+aKzaH2zEN6JVWz8chqpUzHSEnFHRkyw4MuV+1SBj8KwozFbGfqmUs/3dQVTq2Sxz
 wFSbC0uffWJ3yJ+kDI9CLTvR70hvHs88kxBhQWgQwJPLFqEc+payld1qTgjkgrhx2CLD
 /AsMdZJKGFIoFLPv2IAKGCTGTlMcW3ad3JlEdKCiQ+ZZf+n5W+Udo1lOkZiOWWHmw3ip
 s99Q==
X-Gm-Message-State: AOAM532Am2gB8Eh9Kf6+R5f5O2vjW7npLmD2IXiuY/m9SXVYDPGyTB6D
 hSXoej4SeQ9iTFMLWT0AQ4c2JtuN5kfGBA==
X-Google-Smtp-Source: ABdhPJx6QAEJopQGYj/OMZlR/k89C7tNgX2mOBJArXgW+I4F6RfsE4KsCjpSvnCfcR2Q2MO9DRBo2g==
X-Received: by 2002:ad4:4991:: with SMTP id t17mr309147qvx.33.1614798555699;
 Wed, 03 Mar 2021 11:09:15 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-451a-3a99-8647-33ef.res6.spectrum.com.
 [2603:6081:7b07:927a:451a:3a99:8647:33ef])
 by smtp.gmail.com with ESMTPSA id x187sm18068920qkd.83.2021.03.03.11.09.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Mar 2021 11:09:15 -0800 (PST)
Date: Wed, 3 Mar 2021 14:09:13 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210303190913.GR1310@bill-the-cat>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
 <20210205135332.5.I7ab5a1fc95ca9fae01a4ec194a67374ba6872638@changeid>
MIME-Version: 1.0
In-Reply-To: <20210205135332.5.I7ab5a1fc95ca9fae01a4ec194a67374ba6872638@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH 5/8] arm: cp15: update DACR value to
 activate access control
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
Content-Type: multipart/mixed; boundary="===============0041312414756318987=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0041312414756318987==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sf3MmCJcUNNLokcm"
Content-Disposition: inline


--Sf3MmCJcUNNLokcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 01:53:36PM +0100, Patrick Delaunay wrote:

> Update the initial value of Domain Access Control Register (DACR)
> and set by default the access permission to client (DACR_Dn_CLIENT =3D 1U)
> for each of the 16 domains and no more to all-supervisor
> (DACR_Dn_MANAGER =3D 3U).
>=20
> This patch allows to activate the domain checking in MMU against the
> permission bits in the translation tables and avoids prefetching issue
> on ARMv7 [1].
>=20
> Today it was already done for OMAP2 architecture
> ./arch/arm/mach-omap2/omap-cache.c::arm_init_domains
> introduced by commit de63ac278cba ("ARM: mmu: Set domain permissions
> to client access") which fixes lot of speculative prefetch aborts seen
> on OMAP5 secure devices.
>=20
> [1] https://developer.arm.com/documentation/ddi0406/b/System-Level-Archit=
ecture/Virtual-Memory-System-Architecture--VMSA-/Memory-access-control/The-=
Execute-Never--XN--attribute-and-instruction-prefetching
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reported-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--Sf3MmCJcUNNLokcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA/3tgACgkQFHw5/5Y0
tywJ3Av+Otlmvg7/YeZ2UdTu+b0KWrYy8bWvpiIjFT765RPPzyaIAJ4oT1EqY7VR
6HkkaNGkdro+R0SdEvpJO6vCWnvzFI/CQ2MQ322Amxjx/HEtc8joWJC6hBAG9CDi
i5GUeg7Vn9tLAdYi0uWacztXVrhOXP5WeY8dVG040ZyE13CR10Toq+zoUUL+wCMO
8jtZWj10y36mEloS8dus3KEq0aQu1Kh7kjqp8L93YE5zSp5BYpX6XOV+7IfhKWNA
6fxnN5rl735w+NDic1jz6skJWWagh7T/iDokgAaX5H8R2yPRS4Ec1jNc4KZlFrvg
flMifjBRmsBmnFh4V+5W5hSbaiDm7M4/ro44/GLKtiauKrruIK6Epmws7D5Zowx1
POWFtawl135dZ5KJ4m6R2KSf30hz9mP8nvdYh1+JwYm3ajTsP2RyIBy4ckNq+dlk
9LW0RHhqOXskEm121BaO8c6EC7nMBKsKDCyWRTLZxo9gatAH5jFE1Cp/0b6rmY5y
ZpXkLYqf
=H4dP
-----END PGP SIGNATURE-----

--Sf3MmCJcUNNLokcm--

--===============0041312414756318987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0041312414756318987==--
