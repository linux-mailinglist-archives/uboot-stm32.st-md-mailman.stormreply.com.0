Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73F6DAEF4
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 Apr 2023 16:51:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4716C6B44A;
	Fri,  7 Apr 2023 14:51:06 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A91FC6B448
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 14:51:05 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id g9so30336287qvt.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Apr 2023 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1680879064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vp/QgDyfNvTWRbud3E4PPf3LBE5r8bliKu8vcWQHFkg=;
 b=GlNnojzShPUtvX19j/6w62p8xoTuPzUJ2UJKf44C1w8cY4nVgcsfV/VzJ/F2kT0AXe
 Doqb2LWBzYdrYNiQXacmn9GrAYVnGpQ++ULg7Vz92aiBEPx/Gmg+Olz6V/gp1z11KNdI
 oouJnNMDqhCA+b21fnzK0SfOIwUqJW76oRtao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680879064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vp/QgDyfNvTWRbud3E4PPf3LBE5r8bliKu8vcWQHFkg=;
 b=F8D4JLa5pr4x5xbnBA3bzozEStIFzLCbcS7TfOhDxUsYW20/LDRqu14s4KVCy+IDYg
 CZ7iv2UdU/znj5N452C+a41eDUniTgnQjaseGBr4M94P/8dwwW8Nt5lgEA1aNo1BSZ7X
 fnGJyoDdr9qCSNn2sblMNVvslra2Cv1DrvMuAmwgm9fA1KMOlsNrs4/pZy4PyAczSgKl
 xAdj3kM1xgCr3LGt0r7NGLApQxjDzc507yXjbGY2i7S16RH2SbfNgBxgdJa+GME0en6b
 os0vgPSLe7Rzh4bcenG30YYlEYMbW0lY7cBsj+ouIb/ldXuF+Vp40jku3LnZPWXgtV1M
 ZtzA==
X-Gm-Message-State: AAQBX9eQ+fMHapNgkXP7vkPDL4K19vt1piaPQKRjXUtXb6qtrsFdoqT2
 uLdZisflD8HSbX+MMs7eDHnbgQ==
X-Google-Smtp-Source: AKy350bR8TCdnLQBPt7kntay+BjtiqVVBFcwPaEtpd0Ghy6eb8bhZT8kVwzw1UIymJGWkPBjbmbrnQ==
X-Received: by 2002:a05:6214:5192:b0:5ac:f751:e07d with SMTP id
 kl18-20020a056214519200b005acf751e07dmr4436044qvb.1.1680879064157; 
 Fri, 07 Apr 2023 07:51:04 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-4d7a-a40c-ed12-3a35.res6.spectrum.com.
 [2603:6081:7b00:6400:4d7a:a40c:ed12:3a35])
 by smtp.gmail.com with ESMTPSA id
 ez16-20020ad45910000000b005dd8b934587sm154870qvb.31.2023.04.07.07.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 07:51:03 -0700 (PDT)
Date: Fri, 7 Apr 2023 10:51:01 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230407145101.GW1134230@bill-the-cat>
References: <20230322191223.v2.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
 <20230322191223.v2.2.I79b07546f01e96623c310b0a68382edadfacec31@changeid>
MIME-Version: 1.0
In-Reply-To: <20230322191223.v2.2.I79b07546f01e96623c310b0a68382edadfacec31@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, u-boot@lists.denx.de,
 Mark Millard <marklmi@yahoo.com>, Sjoerd Simons <sjoerd@collabora.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] lmb: add max number of region in
 lmb_dump_region() output
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
Content-Type: multipart/mixed; boundary="===============0184432838780310922=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0184432838780310922==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vo8k4nKfQfzF3OwY"
Content-Disposition: inline


--Vo8k4nKfQfzF3OwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 07:12:26PM +0100, Patrick Delaunay wrote:

> Add the max number of region in lmb dump; this patch allows to
> check the limit for usage of the LMB regions, memory or reserved.
>=20
> Result on STM32MP157C-DK2:
>=20
> STM32MP> bdinfo
> .....
> lmb_dump_all:
>  memory.cnt =3D 0x1 / max =3D 0x2
>  memory[0]	[0xc0000000-0xdfffffff], 0x20000000 bytes flags: 0
>  reserved.cnt =3D 0x6 / max =3D 0x10
>  reserved[0]	[0x10000000-0x10045fff], 0x00046000 bytes flags: 4
>  reserved[1]	[0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
>  reserved[2]	[0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
>  reserved[3]	[0xd4000000-0xd7ffffff], 0x04000000 bytes flags: 4
>  reserved[4]	[0xdcae5000-0xdfffffff], 0x0351b000 bytes flags: 0
>  reserved[5]	[0xddafb5b8-0xdfffffff], 0x02504a48 bytes flags: 0
> ....
>=20
> Reported-by: Mark Millard <marklmi@yahoo.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--Vo8k4nKfQfzF3OwY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmQwLdUACgkQFHw5/5Y0
tyw3DgwAsBTnJrESYPl5YGGG7mBG002f8GaG1EUoWspH0CR8xeHqBp2o2aisA+0x
s93GnjJjhvg798w9TF4i7EFu/Skopbrxz5yvqaj+YSvVDldR0nUYS9njY9S6E+MD
/ORzt/JRJ6HYN83kxBy5XSRctTx/JRTjTkYo8nsMp9+cKV3fINA+Cua2mAZuQRGz
iouTmBFTX6e1fRGojO7QxM+p1W4qD2LA7ldMES4ph/4Jo3Cnexbj6ZgAQ9FRGO7d
jpqCMPTas5r7HudHWGzvcQASpdnjw5ZYqBTTaCZzKWTIFfsS9dUGARlzfxmFMSG+
twS9dyaSsHXWMuji6xgjgHeexIGbzP5+RBYmSF8X+zF4YkWCwmQ8NnKENwHNSnJI
xZRJErj/dhYHsVatGP8C0O5AfTg8pxHgYkjp1Bf5GYv7RlUg9grdt85JaPiVwD6j
KIzJQY5L9wdnYwC1gDHvqD2sXFLBasuZrgxNHgaXtWm71TSTpoMIjg9bewtl5t8d
v6V4zqz8
=I3hL
-----END PGP SIGNATURE-----

--Vo8k4nKfQfzF3OwY--

--===============0184432838780310922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0184432838780310922==--
