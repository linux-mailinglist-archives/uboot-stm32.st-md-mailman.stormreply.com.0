Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE45A1CF40
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jan 2025 01:00:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D94C78034;
	Mon, 27 Jan 2025 00:00:20 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B33B8C7802D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 00:00:12 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6d8f65ef5abso31614396d6.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jan 2025 16:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1737936011; x=1738540811;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cpx8XBFbxigmyro/qfbnmSPvsTlbi1NxGll/VQ8e0dk=;
 b=Uy1ECPlVKDvc8s5QqY/y8fdLNk7NMlWwvX0H5VvgiOv7Efi7DA0ifssUoWy/FfRa29
 Eyt9j3RTkvUsJnBuA/qawrY/8E9hUdum0eAkj1fitbcumly7XXbGGJU7L3E0dbZM4cGu
 eFggWEgKSG9M2dQTvVeO5V+IRqO4ZtGiipU7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737936011; x=1738540811;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cpx8XBFbxigmyro/qfbnmSPvsTlbi1NxGll/VQ8e0dk=;
 b=rGPG2v2mnJxhm0ThU64MR97b/tU8xtqz9B2Qbxs1EAWQdJepDvdn7FOPHwI0Na51M8
 gVW27/E0sCLDbbRoIRLqGBcQ4F96w+qw+JgsK1lMPAILZc8sXv5fNbWXY/BhyHjMplVV
 RYF6c4N0NmFbxIlo1E1DORKplVs6YK2F8fU9tipsk94b6KVgVZWNf2q1wbh9ZFHd1qbK
 WtpoE4NauQvHH44jV8AsPPXtLcAUo5JFF1enmrFO3xPVgqqNZa8uPCJ3cgnzzLEflDbm
 w2kP85FlpqxkF+UAmTZSBUEdqy7zD6NsW6F/96AsLsMn9HVihNDRN/OAUnrwVKc+15Qn
 uiTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaNU0lkRuHqba5MFeJFtI2xVLgOZi/5deRzvFBN0EyycHw7aBPO+42P4GNJul0lIR3y+E0ZuT7dDkP0w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHYqrUVG8kCAX5TTXuMiw28oav2axhdKEq3adlaCgEkBOvusB5
 kUNp6Q9V70EbrpbiuvFIau1xnqpKaeRaSAw70gAvaZiy13+PTi1HyhNiXgtP8/U=
X-Gm-Gg: ASbGncujACVKOH4mkfVwfnxV7ArGhJwUv3wmOhqQz8RympD4QEqNFjQmn6pKzFYpzKH
 tDj2B50TQmPq+KowjkWWUMiINEoJgDLWkSoPtXiLUS1TFcewQ3yMROTNot7WaKuyidPRbZiha4m
 nD5OHHNCPE1gW/u0K5jCqMGRoMnz6hqR4187ZZngL3EzcUVy3KZTvZI3WU/2rJMGelmlVd1s+Ob
 riksMj3Fmwnc7y09eJB6IjY99zyUV3ixll8f2Cceyp0e8/ikhK6mcxooTld7K0SJ0OiOVnoews4
 dNNE
X-Google-Smtp-Source: AGHT+IEme9BwXtrS1isLMhad9RCDTSmou8WAdlVmTxRsaz8eYTpxR1Ihz4INI6H/QzeVjOyyND/CJA==
X-Received: by 2002:a05:6214:5002:b0:6d4:1c9d:4f47 with SMTP id
 6a1803df08f44-6e1b2141a31mr654998486d6.13.1737936011603; 
 Sun, 26 Jan 2025 16:00:11 -0800 (PST)
Received: from bill-the-cat ([189.177.145.20])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e205ac4aabsm29384246d6.121.2025.01.26.16.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 16:00:10 -0800 (PST)
Date: Sun, 26 Jan 2025 18:00:07 -0600
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Message-ID: <20250127000007.GB1233568@bill-the-cat>
References: <20250121203147.4133618-1-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20250121203147.4133618-1-trini@konsulko.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: u-boot-qcom@groups.io, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: Re: [Uboot-stm32] [PATCH] Squashed 'dts/upstream/' changes from
 9b6ba2666d63..8531b4b4988c
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
Content-Type: multipart/mixed; boundary="===============8332725149707348273=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8332725149707348273==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zGz4rOrqldkk0xpy"
Content-Disposition: inline


--zGz4rOrqldkk0xpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 02:31:37PM -0600, Tom Rini wrote:

> 8531b4b4988c Merge tag 'v6.13-rc7-dts-raw'
> [snip]
> git-subtree-dir: dts/upstream
> git-subtree-split: 8531b4b4988c2c9bddc90ea74f2d3e2dca9d5056
> ---
> This will bring us to the v6.13-dts tag of the devicetree-rebasing tree
> and so match v6.13 release. Changes and changelog omitted due to size,
> and everyone who is listed as a maintainer of a platform with
> OF_UPSTREAM enabled has been bcc'd, while other lists were cc'd to avoid
> being marked as spam, hopefully.

This is now in master.

--=20
Tom

--zGz4rOrqldkk0xpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmeWzIQACgkQFHw5/5Y0
tyy6cwv/eqlAAS6+VNNQuUyTpbWOLRXB3rk6mQ8CuslZrQ/7XUrg26HmX5rtq66m
FcnObmtU7LjAYoNJx8gK2NKoGV3PJz7g8Up+zgnNFiC/4+m0G1H2bZBa2CCbGPXV
oQsDR5KkSn9u8MkKMAo6pLesdcEQ6eIIrWRFuwl/noXQ3pw/MA/KeIUvfr3GrdAa
/janhj+3ZOQf3oApLhR/XJFnmsvMXPoaMvLmRuAnjXkwrWb+4dQ0vFB/V+cAxAdi
RYSQTzbk/RafV6Vde+6XA8ZPtlulrJ6kfpxM4Ey56zXj+v/Xa9UNZtgXB+Pljrzj
w2EigIDoETPvIHr/l+6X11n0PnOkZZW5XVYRqlLrbq6nZ0Dy4XZ//JSTdqoUGgYQ
Zz5DSAd8qEqWrq6uMykSgR6I8yv/xSBbZDR6r0xNj5OdhWKnzhN0iGuRMLtC/ckt
Fd9P6d6iJD92dU2oDRYHZ9hDesxKiMEli5DSraX/R0ikO8e24k6FdzSH88+f5wJO
99fJ6Pck
=23MR
-----END PGP SIGNATURE-----

--zGz4rOrqldkk0xpy--

--===============8332725149707348273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8332725149707348273==--
