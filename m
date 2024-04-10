Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C842989FB89
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Apr 2024 17:29:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84A0AC6C820;
	Wed, 10 Apr 2024 15:29:02 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE990C6B47A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 15:29:01 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-78ebcfcd3abso18574485a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 08:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1712762940; x=1713367740;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wdHMvIu+fMNRCLwjutQwKPjyqXtNhbgx7XPjublCCCQ=;
 b=WO7fpLljxKDivKT+w7QQIjPcM+4j6fd2GIwED8OSb1JoEBYkJX51/pnJN0/V5gk1Vz
 2VfgsPJ+i1pYQpvc6zVnKk/pO7WOX/TExh19Qr9mUpgQV0F5HJen8IfyfRXXUq4rJj9o
 DfrhdPaGHCV8Gd06802KZ1tY7j22MSiW3hDOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712762940; x=1713367740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wdHMvIu+fMNRCLwjutQwKPjyqXtNhbgx7XPjublCCCQ=;
 b=SmKPCiQ02niraBbSt575l+rexfvEySq0A4N8Iq4/UVdCM6wrqIGWjQvQZZM8HEbZyE
 ta1wAM9F++mgNQBu/sKREr2Np+AFMNsvRnvIP7m1DmFMFYMKHD/TSTv4GJYNShXCXhln
 0rUrykv2vh0JZ9zDT/YOvkMUavSXAOmCQPIp8+PkbMBqsk6zrTc1aUw+XUBFCKjVqvYx
 KpnKDz1CihejHHZyXJ9BDbfpXU5KfXsGmArL69jHzA7cwEqZUznPDLQvvx6u/4yRiS3A
 2euLu1iDdW5uTHLd2a2yEGIodYtKz8jPrphQ1855gwjnieeIlvOXGSYLrc6XAy5rljkP
 7rcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGLEAnryqW3tX6g7a5gyyrPcNylLx1MAgT+0nNwZXds+4lPUI/Nuf8AYtun0KP5D2jVK2mQQHhHNBBqyRs3HqpIylbQ4EX3lXIkzmYzy8/nDrXbt9unKdJ
X-Gm-Message-State: AOJu0Ywd/1mOc0cwUgvGcqpMacj9tYDhkWizcUTtirpFoytwzAauMxMs
 8fnyQ/xvqKPLgfN5RmZAt79FTZV0AuG8LdfTK58Aqtoobyb1W9agrX8D9QvsaDA=
X-Google-Smtp-Source: AGHT+IFzwaEEqx1NxeZNvc+CMZ2FIogwp3ag4zLcTKW/HMXJrvHq2gSCNpMv53N8SbE6tjEVB8Oyyw==
X-Received: by 2002:a05:620a:1087:b0:78a:6a01:d8d with SMTP id
 g7-20020a05620a108700b0078a6a010d8dmr3194072qkk.65.1712762940087; 
 Wed, 10 Apr 2024 08:29:00 -0700 (PDT)
Received: from bill-the-cat ([187.144.96.143])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a05620a057800b0078d6c4b0b3bsm2006942qkp.26.2024.04.10.08.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 08:28:59 -0700 (PDT)
Date: Wed, 10 Apr 2024 09:28:56 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20240410152856.GA4170860@bill-the-cat>
References: <20240311143918.2927406-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240311143918.2927406-1-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Udit Kumar <u-kumar1@ti.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lmb: Avoid to add identical region in
 lmb_add_region_flags()
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
Content-Type: multipart/mixed; boundary="===============4846343515779575289=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4846343515779575289==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GVUORwRFlfnlZZIr"
Content-Disposition: inline


--GVUORwRFlfnlZZIr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 03:39:17PM +0100, Patrice Chotard wrote:

> In case lmb_add_region_flags() is called with the same parameter than
> an already existing lmb and this lmb is adjacent to its previous lmb with
> different flag, this lmb is added again.
>=20
> Instead breaking the loop, continue, at the next iteration, we are able
> to detect that this region already exist.
>=20
> Issue reproduced on STM32MP157-DK2 with SCMI DT, bdinfo command's output
> shows:
>=20
> Before this patch, the last LMB [0xde000000-0xdfffffff] is duplicated:
> ...
> lmb_dump_all:nnn
>  memory.cnt =3D 0x1 / max =3D 0x2
>  memory[0]      [0xc0000000-0xdfffffff], 0x20000000 bytes flags: 0
>  reserved.cnt =3D 0x6 / max =3D 0x10
>  reserved[0]    [0x10000000-0x10045fff], 0x00046000 bytes flags: 4
>  reserved[1]    [0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
>  reserved[2]    [0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
>  reserved[3]    [0xdaadf000-0xdfffffff], 0x05521000 bytes flags: 0
>  reserved[4]    [0xde000000-0xdfffffff], 0x02000000 bytes flags: 4
>  reserved[5]    [0xde000000-0xdfffffff], 0x02000000 bytes flags: 4
> ...
>=20
> After this patch:
> ...
> lmb_dump_all:
>  memory.cnt =3D 0x1 / max =3D 0x2
>  memory[0]      [0xc0000000-0xdfffffff], 0x20000000 bytes flags: 0
>  reserved.cnt =3D 0x5 / max =3D 0x10
>  reserved[0]    [0x10000000-0x10045fff], 0x00046000 bytes flags: 4
>  reserved[1]    [0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
>  reserved[2]    [0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
>  reserved[3]    [0xdaadf000-0xdfffffff], 0x05521000 bytes flags: 0
>  reserved[4]    [0xde000000-0xdfffffff], 0x02000000 bytes flags: 4
> ...
>=20
> Fixes: 59c0ea5df33f ("lmb: Add support of flags for no-map properties")
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

This series leads to CI failures:
https://source.denx.de/u-boot/u-boot/-/jobs/814084

--=20
Tom

--GVUORwRFlfnlZZIr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmYWsDQACgkQFHw5/5Y0
tyy5Qwv+NwcZaWbaM9O6vMWfacaXd64dF33Z1OhtD7XWU+cIqqChbICFBRZEiDpa
EIxjTZcol2+d0O6vX0WGimjAK7xuEXdvKlTw2qEG/8lOECrJ4KGFMDkYii6iwxOz
dW1Lajg+OfwBD5pTZOmOisFV1q3qqdycqV7BgRAU7qPUMMUEjIStoiadxlWUBAoW
gvNikg2+cZqHG8UxvMgp5p1yeEHlcmpYEX0Ett0X+VLGlCADH+i6yazGS0ESYAsc
uj3V8LPZwAEdy7PjyOA1z3iDJl1LYFjAepjiVNHcVyWJZdaAcZZRiDDBh3NwJrwP
vRYThkLPaNkfZuNPk7Ah6ly4P/VK0Y/iJUwMW76rkoYaQRy2B6g1KAeHS8v4IevY
f8YfNyfIRlQVS6cJtgMw7jkW9SBAO9ZkRUJIWayjHJpaJSRM1OdKRs31lkXFfnfk
+12RCHXYBPcByFzU1xrwy3xgHpbQZuvTFtrtWD7yIpCRS94xNnPNueEsOXXhTfJn
++W6AGMk
=Jz0j
-----END PGP SIGNATURE-----

--GVUORwRFlfnlZZIr--

--===============4846343515779575289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4846343515779575289==--
