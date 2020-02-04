Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6E91514E5
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Feb 2020 05:13:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE670C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Feb 2020 04:13:50 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADC0EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 04:13:48 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g195so16598788qke.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2020 20:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E9hkABYg1C+JmazHKE3YVU5EgyIBZBTPPlCwESl5bzM=;
 b=SniQxTMWt5g03qHAf3/MF4lqOzOO4JrOv6ZFOhpO1pmRsSlZ1b7ZJWupCsFoGOmeAZ
 wkii1X1WeTCZxw9IrLT1Pu2fHdmrP33sFRVISLnjE//ltWS+N7OBghHaXwsH3+4g422Z
 aEjzVk6WTxIjVVr9NE7/pICRAb2g7cABo3EDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E9hkABYg1C+JmazHKE3YVU5EgyIBZBTPPlCwESl5bzM=;
 b=XaksrDgzz4DM8aHqRSbGhQG7hS5CyVURRPFtw9ulT3gmAk8UHCJhji6G7hIFbS9Lu5
 2LWATfQpnkrCVXQj9ZqbMkAHWYoTxIPqGLFQ5LqEeYcFUyNfI5y5E0q9kcU9Op+nDqGS
 O0a0BYQoaTMH4zSE+oEOkZicuyf7nMujQjm5HUL9EYaLp+VdBBXxMPi4iS/RtBt7JNbE
 8Sc0aDX2SyUDcpuKs5wL6sPYBN4RRBxLC7Jhw30InlDJAzwJjbr4GEy+oZ+yfGkhFDgo
 r2/g88TKLNg6hqeqcwC44n86+luT/jcEfkraGGJJudjeapSnYiy3F02wl9onjMFxIRHH
 y94A==
X-Gm-Message-State: APjAAAUxd3nxbwX3TKK8FF5KufLSRgQf0UPZZm7i4rPzer1knMkV9FtL
 vMHlTsIFbVWM5wN4skfFoT3+scx9EUjnGg==
X-Google-Smtp-Source: APXvYqx/u1sdHtwVGyGO50ekSII10wC9ckUdYV9evfbZ70V902vyN6o/SJOCvee1VgwriXSDdtARMQ==
X-Received: by 2002:a05:620a:b04:: with SMTP id
 t4mr27529676qkg.7.1580789627137; 
 Mon, 03 Feb 2020 20:13:47 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-e4ac-64fa-4c27-a5bf.inf6.spectrum.com.
 [2606:a000:1401:86dd:e4ac:64fa:4c27:a5bf])
 by smtp.gmail.com with ESMTPSA id d26sm10223388qka.28.2020.02.03.20.13.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Feb 2020 20:13:46 -0800 (PST)
Date: Mon, 3 Feb 2020 23:13:44 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20200204041344.GZ13379@bill-the-cat>
References: <20200203140059.2111-1-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20200203140059.2111-1-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] board: stih410-b2260: remove fdt_high and
	initrd_high
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
Content-Type: multipart/mixed; boundary="===============3492764826292742008=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3492764826292742008==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="koUF50DMN6AmuCAv"
Content-Disposition: inline


--koUF50DMN6AmuCAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 03:00:59PM +0100, Patrice Chotard wrote:

> Remove fdt_high and initrd_high as they shouldn't be used,
> this allows the fdt and initrd relocation.
> This implies to set CONFIG_SYS_BOOTMAPSZ to indicate the
> amount of memory available to contain kernel, device tree
> and initrd for relocation.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--koUF50DMN6AmuCAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4473gACgkQh/n2NdMd
dlLQdxAAtx57AwltXn1NJewcvMgH1rAM5m//Gn+Y9q7sV3MR8llpQprT/JVRw+hi
RRUdUCfpLfUkxMwXtcYt5j0vSYgUf+WhynO23p68hzGeAXdwsSLyKOaadMuKZSjd
Cg7PrQVP/opsW6eewzkBvu4H3SkgrFTSpqpPuo9o73XIT15dG8A0fc4uCNUQ44Hc
wiP10GpcIeMH6uYz+2eC+ZiT1I7j4YlnaCSxtGmNf+ylkMQmCMIh5aee4/xbcuSZ
34NbNNd9ssRtaWL9dZqNAcG0Y0oblzJEFXWbpI7UFpCdI2NNK6GgnuJ0vLFYx/0t
Y9/zDRh8nwwATxKmHUMHMdxUs4S+UHmDT4BXSveSc/C8Py1UdAZs5V1CRijK8Tyb
SyKaQg0EfVqAlHcDzHCn5t4hagCk1dXQ/HYalZiyfg3caEPmpicHh1j0qGouRoq0
Y4MhtcU0U3Mjx0/oTmsSyvtN7qvLt3buev608KwIEPI/wu5Lq8Y8XDohI/ssqR9h
iuBH2tj9FUV8MRgF5xZ2DB+TCrGONEkEtr2UvT//GA79zigD4FrqdCWQxoqC9dXo
uRfrwWg5+glgn2M+hmLv6JIM8qgF+vVnMm4qexmp930n5B3bLSMBS1Lp7PxJZtfM
6ZEuTpqm3lBsg8Vlk9sU2KEXOSj5g9uaoFBw45Y/X8+R6gg/eB0=
=tEUf
-----END PGP SIGNATURE-----

--koUF50DMN6AmuCAv--

--===============3492764826292742008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3492764826292742008==--
