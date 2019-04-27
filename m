Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF0B3C6
	for <lists+uboot-stm32@lfdr.de>; Sat, 27 Apr 2019 16:45:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBE0AC29039
	for <lists+uboot-stm32@lfdr.de>; Sat, 27 Apr 2019 14:45:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18C4EC35E19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2019 14:45:12 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p21so5800374wmc.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2019 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sf6RbLbsHD6e07SoJD6eKmrx8O0u41bD3SERXRRTL+k=;
 b=Ciso6+WlKZ+V5i6GZmrWuTugPYSRPaLeg9+WLcmvfBb1XZDcz2ZLQpNtIzv1uEk7Um
 A7pABhaDa2DrT/dpbwbuQI8bR+H+51nLIE1FQ7wesTSL5kZTPc5UWr7ykzdP43/LlDyz
 solaIc95aGVx84D4U+hQGcHbq/rXxuGQ/lzaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sf6RbLbsHD6e07SoJD6eKmrx8O0u41bD3SERXRRTL+k=;
 b=K8Z0rV7W++ANAv2iEUkLYMF5IsnKLTtMT7h1La9FxDmCTdplJD/Q73O6E2t4hJ7EXx
 ZKkjV4atTQKUL/KzU5TCU8qQ8PAXb4qX2uSgT5YGHoBGDwWREEgGmj6i/sTVqp0AgXk2
 c1Kkt7fsUpXz7QxbvkI8ZFS6C84ApmT1rvQk5aJSVsq3v5b51zqYQfNV3RuSy0i9l+n2
 DjBQtKSJvvvTpY3kMR5xFRsu/d9o53UdV3z/3eTo0xhnDWuDEJPcWAZSdcOKsmvTzg+S
 g1xIUlXiRzhj00cktC/M6BnzedkSOIDt8/DSPAvcZTGneiUEofiWrA6hR3RFdob6wVlQ
 3plw==
X-Gm-Message-State: APjAAAWzCfv7/Gj8xT19lUDs50j/+O4PUjSzRfXHwxOFLefZ8p19a550
 W8T6jKnuhnyRKCActP23z78iEw==
X-Google-Smtp-Source: APXvYqwz3ZmSAPeBME/9vStyR75ifO6SHmL+GJc5U2qf79yLHcUuJTz3ayYMKOQu0SdkHivJRZAgnw==
X-Received: by 2002:a1c:6587:: with SMTP id z129mr11297831wmb.84.1556376311636; 
 Sat, 27 Apr 2019 07:45:11 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
 [65.184.141.147])
 by smtp.gmail.com with ESMTPSA id 7sm5062207wro.85.2019.04.27.07.45.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Apr 2019 07:45:10 -0700 (PDT)
Date: Sat, 27 Apr 2019 10:45:07 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20190427144507.GD31207@bill-the-cat>
References: <1554973993-13272-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <1554973993-13272-1-git-send-email-patrice.chotard@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [U-Boot] cmd: pxe: Display splashscreen from
	extlinux.conf input
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
Content-Type: multipart/mixed; boundary="===============3142898304676663933=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3142898304676663933==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kWb2NB+iM6KO7H8g"
Content-Disposition: inline


--kWb2NB+iM6KO7H8g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 11:13:13AM +0200, Patrice Chotard wrote:

> The objective is to provide a simple way to retrieve a BMP file,
> and display it as splashscreen, from extlinux.conf file input.
>=20
> For this, we take example on https://www.syslinux.org/wiki/
> index.php?title=3DMenu#The_advanced_menu_system
> and more particularly on MENU BACKGROUND chapter.
> For this, add "menu background" support in pxe command.
>=20
> As example, extlinux.conf content will look like:
>=20
> # Generic Distro Configuration file generated by OpenEmbedded
> menu title Select the boot mode
> TIMEOUT 20
> menu background ../splash.bmp
> DEFAULT stm32mp157c-ev1-sdcard
> LABEL stm32mp157c-ev1-sdcard
> 	KERNEL /uImage
> 	FDT /stm32mp157c-ev1.dtb
> 	APPEND root=3D/dev/mmcblk0p6 rootwait rw earlyprintk console=3DttySTM0,1=
15200
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--kWb2NB+iM6KO7H8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcxGryAAoJEIf59jXTHXZSm5IP/0xRoiXA47rv174hcScazJUM
OQrGAKG22mIFim3y6I0ClO4hJG+okaDHgGkAcYLpsrjYFq6ai38h39bNb7+mNPwo
7TJH88SQDBtaj6K0LfZWkLpira1MMWN1uMVEzeU/0sdUB3YdfRVLjMaem7bK4b3q
1stm4EFji0h4XHLT8X3oLkRTTkNfcglemKtFJtl966zBiY9mqaxyhDrQvWrDyQq3
xF5uKLqFeZpdiu+zqPYSe7yLbnWHgQ77yeQrefT4AuohjCR4PUl+sZEcIPn6DFco
S98G7hBEwcdxiJowSkkaldd0fvLNOYOzpq0Y5biSV56PP3IPT+HVzulsyO1FHk5K
qUbJU7Xx4nX1reUpKluDzHBIoiw9bO/BhNMj+Qnmi2EdUVU+xjGIY0cRH42aHAr5
XGuW27n2ZsVDz4/XPV0pvL9+HOndtpj6j0/e6BRLtdnUBWKeMc7dpVw8XDRKJKxE
td8hhYEjA+74YESp2bo1HrasEigwyfHhjS7Wn2iytt0XmwKITjhF34dYaI65S4OC
CFGiFj7O6/Tm5R/ub0mSKQsi5SfAyK/Me4l5bf8JNkT9yvD8neP31oEOg73yfJat
6v74MeowCyvR7875s8TxCvaJO1USMbdsI36qColC/yrMZbnQ+PIcEv49vTtt+tFk
k0nxA1Me6isGjxfSI2LK
=hGFR
-----END PGP SIGNATURE-----

--kWb2NB+iM6KO7H8g--

--===============3142898304676663933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3142898304676663933==--
