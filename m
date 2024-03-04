Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E9870561
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 16:28:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E613C6C83A;
	Mon,  4 Mar 2024 15:28:00 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D8B6C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 15:27:58 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7881e45ccb5so187806985a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 07:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1709566077; x=1710170877;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+uwaHUKjmFHQBAWSTTcNHyEi0v1Q1D8l2ks0KzzdO90=;
 b=rCl/Mo+wmBQyo6xcKIkHh8cwqgnqV4Ta/p3KRgjGJbih8u09hJrJqh3v7Up8/knL7l
 vDlXMNPipOYpePyI8xWBydHlq/BKAJMoY1cgn3akk9sRj87f7BfQt0coQB3GclSp+/r2
 Lyz8SiuqjRDY1HU8oCGp7FD6DAYMvc6GSVNhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566077; x=1710170877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uwaHUKjmFHQBAWSTTcNHyEi0v1Q1D8l2ks0KzzdO90=;
 b=hzhuUhXN/gWaMWdEoqfu7nYlrKx855S4xR4uvsqNeD+ItfoZlkpLhluFm18ONL2M8a
 GvJd/66xBvuHLh4qYwF/nNaI/NBtPJkscg2XMVRA3eH2NPqaWu6SryepsPz02CyG/1Bp
 73phHWZK4tB41YnrUEKRpRwgo60Vt4f22OYIfFIYh2iTzJJE0Mir2gIRkzyjQq1udkKj
 4cp0rXBEnNwqCk0Gmy0OG2867cnTv4LtHOo7UfZmmYd3vBzq/Y3s9xa7bS29B/PCI0ha
 bI2zTNsTMTBg7rRu7K0fmi/XoPkgD5hb4I7yz2cXPZNqujuQ843PKX2a6G5GpuNf3Bhw
 pv+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBvbuvIC2hGeOV5BE+kp0r+1D4ouSI0tg4tAL1SE9CmsRwy0iUa9KzBANNR/hOYXcLDF8wRmyVKo/GotpOmsbczOrAhWySir5EytXDlphwt+7uKDEqnARG
X-Gm-Message-State: AOJu0Yx22vnYRLZvsLq71j+ByVap0i60FDUnT6GjqfQ+s/f0erHxOGQF
 A5cjSKm2GDm6mul2uC8l99s3B6Z9nqMiGPBQBCWSRgG1r3FfyQRTZI9l5wm4xj8=
X-Google-Smtp-Source: AGHT+IHF876t80XWppK/NlpzetTMzUyA3PlTQyXhh7PdAxua8v9j5T76fV/y+tHaXiT4WP9zkfqYXw==
X-Received: by 2002:a05:620a:471e:b0:788:22ad:c880 with SMTP id
 bs30-20020a05620a471e00b0078822adc880mr6591225qkb.5.1709566077008; 
 Mon, 04 Mar 2024 07:27:57 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-007f-0000-0000-0000-1002.res6.spectrum.com.
 [2603:6081:7b00:7f::1002]) by smtp.gmail.com with ESMTPSA id
 x10-20020ae9e64a000000b0078803b1a3d3sm3816541qkl.86.2024.03.04.07.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:27:56 -0800 (PST)
Date: Mon, 4 Mar 2024 10:27:53 -0500
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Message-ID: <20240304152753.GX1523872@bill-the-cat>
References: <20240212234448.39552-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20240212234448.39552-1-heinrich.schuchardt@canonical.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Lin Jinhan <troy.lin@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Luka Perkov <luka.perkov@sartura.hr>, Chris Morgan <macromorgan@hotmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot-amlogic@groups.io,
 Alexey Romanov <avromanov@salutedevices.com>, u-boot@lists.denx.de,
 Luka Kovacic <luka.kovacic@sartura.hr>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] rng: eliminate common.h include from
	RNG drivers
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
Content-Type: multipart/mixed; boundary="===============6515581105573600239=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6515581105573600239==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fL5JQseD61u+N1pp"
Content-Disposition: inline


--fL5JQseD61u+N1pp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 12:44:47AM +0100, Heinrich Schuchardt wrote:

> Usage of common.h is deprecated.
>=20
> * Remove common.h from RNG drivers.
> * Sort includes.
> * Add time.h to sandbox driver.
> * Add linux/types.h to rng.h to provide size_t.
>=20
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Applied to u-boot/next, thanks!

--=20
Tom

--fL5JQseD61u+N1pp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmXl6HkACgkQFHw5/5Y0
tyzw1wv+JeTwaJaK5UzvL9LWZGDQ6/R6461oWelyXMgFp4x77sm0nxuf+brduo1y
LbAX7tXjPBeeq6TsHfrQccvy4iKbfYg+GhyI4QjEiL2i2uPr2D/Gu7nACz1YQ/5O
+FUowtLvU2RsZj1XnuuX2flY34DSx3pmdK2Ui98Thd64NqK4xZFCL64dU3rhl62P
T7Obfq5s+7+KhI3qFyxI/BWUQu3O8tzaCrZjIEsKm/Hyj8ZzB1r4zinWZPX16jmi
Cs2fX/P61197NBEha1yDyL7JqP8TUfiUfSosi+OAIajmAO8ZDERT6lrMQNIKc9x2
/yLad8rDHG8VKhwP5oUo68xuh02+E4BGDgYItGYhYKO5R3k+ZZw0io7S2khvurmB
xo/Ixde5EERYzsr7EDnrBYDzIrLPSW4S/oAiKBifu1ATmtPvnjtbxKUhHFwTKsVn
EJQvbfLVuM7OM+gAJEptBLqAiO4EOWNYKnrwJ9Tk0p3ELJsgKjtHy3Meigp67ktv
WZeDTcv9
=TUhl
-----END PGP SIGNATURE-----

--fL5JQseD61u+N1pp--

--===============6515581105573600239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6515581105573600239==--
