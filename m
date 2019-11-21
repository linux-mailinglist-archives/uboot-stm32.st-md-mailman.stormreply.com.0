Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 196DE105870
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Nov 2019 18:17:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2692C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Nov 2019 17:17:28 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1B16C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 17:17:26 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id a7so4023676ild.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 09:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y2N0lCg3mkPItUdyLNQTMG4MRjkKLboorJDhgnZQRaI=;
 b=US4isAWGgYhY0Ipiq+wTdfwQ2wvlzkhHhDZ20pji2cy9fhEUly06Tx6fDI2fM5Hqcs
 OeyfEAdY7/clQ4ofM4DvTGZiHwWYofyk2cBl25wwmu+WvxmET+wNnc2NOP2153i9XAiN
 EM7r1sG0mxSOtrcrcG6YqJksqgsyddOKQO7Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y2N0lCg3mkPItUdyLNQTMG4MRjkKLboorJDhgnZQRaI=;
 b=HhrX7BsaKRkkYNfMWXnLGxY/zlBhqUF38w7op7w6Wwg4zTQMFn00D0KKY5jwCv6Qot
 Fbfh2HSywZnScL7EASvj9lrehC8saeQoOdPsW65sC1J+7WMYZOre5kc6y9Lls1RBVR8x
 OJXns7XI/ouzlJTTNS46wcMcwiBQXrfsu/o08VoQCBLMjKcQ7Kno3zw88DxbQOg/2gvC
 7n90qvFoYSOjzc+3rfi8IpGgDIHGZ0Hxs57iWhV4ZBb4fpbe9lWrWL9BgT9IYzv3ib7T
 FqS3Cn7M9KbQdTFONXolhktEjy8rhVOKp+aOPvj2eHZauLUdrGC0jSpVTtiLNNYs+VoO
 2KkA==
X-Gm-Message-State: APjAAAUgKj4WXWwoqkk8ZX70bLK+oQ0APXGWUDvwrLcDWQshAhhu+glw
 Sf1ocfx3TIBq2UGGvzG1MYLHKg==
X-Google-Smtp-Source: APXvYqwEKJZu9FX+DLhYof/Svv/5elfWKZ6BoDzuJ8ZrbPegtSow4+fHnda6K1JT30AXqvhqw3SWqw==
X-Received: by 2002:a92:b70c:: with SMTP id k12mr11354396ili.55.1574356645462; 
 Thu, 21 Nov 2019 09:17:25 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-d15b-50ee-ef30-b467.inf6.spectrum.com.
 [2606:a000:1401:86dd:d15b:50ee:ef30:b467])
 by smtp.gmail.com with ESMTPSA id u21sm1443199ila.41.2019.11.21.09.17.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Nov 2019 09:17:24 -0800 (PST)
Date: Thu, 21 Nov 2019 12:17:22 -0500
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Message-ID: <20191121171722.GK971@bill-the-cat>
References: <20191119010210.24477-1-trini@konsulko.com>
 <20191119010210.24477-5-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20191119010210.24477-5-trini@konsulko.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCHv2 5/5] env: Finish migration of
 common ENV options
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
Content-Type: multipart/mixed; boundary="===============4656114602389005904=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4656114602389005904==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BFVE2HhgxTpCzM8t"
Content-Disposition: inline


--BFVE2HhgxTpCzM8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 08:02:10PM -0500, Tom Rini wrote:

> - In ARMv8 NXP Layerscape platforms we also need to make use of
>   CONFIG_SYS_RELOC_GD_ENV_ADDR now, do so.
> - On ENV_IS_IN_REMOTE, CONFIG_ENV_OFFSET is never used, drop the define
>   to 0.
> - Add Kconfig entry for ENV_ADDR.
> - Make ENV_ADDR / ENV_OFFSET depend on the env locations that use it.
> - Add ENV_xxx_REDUND options that depend on their primary option and
>   SYS_REDUNDAND_ENVIRONMENT
> - On a number of PowerPC platforms, use SPL_ENV_ADDR not CONFIG_ENV_ADDR
>   for the pre-main-U-Boot environment location.
> - On ENV_IS_IN_SPI_FLASH, check not for CONFIG_ENV_ADDR being set but
>   rather it being non-zero, as it will now be zero by default.
> - Rework the env_offset absolute in env/embedded.o to not use
>   CONFIG_ENV_OFFSET as it was the only use of ENV_OFFSET within
>   ENV_IS_IN_FLASH.
> - Migrate all platforms.
>=20
> Cc: Wolfgang Denk <wd@denx.de>
> Cc: Joe Hershberger <joe.hershberger@ni.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Tom Rini <trini@konsulko.com>
> Acked-by: Joe Hershberger <joe.hershberger@ni.com>
> Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

Applied to u-boot/master, thanks!

--=20
Tom

--BFVE2HhgxTpCzM8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3WxqIACgkQh/n2NdMd
dlKlhxAAtX5yyB5gZuZpsPrsQS9jLelGVVIwVXe1dWsUHW26BxsHEGhgzyZPIXmU
L50szS+2osweelRNg2sN0cUhreGkZkPljdL6xizA4x0cbtIUKZRxfaq2L3Z431Tl
qUBDJRAUK902zXaBHnWpyiVY7Bu4eIb1tIC/c8KuMAMizOh7oZpwhYMh1pZL98uL
EQoS1E8Wxu6rEDOiF38JbXQa5wjdlH4Rcqvc1FPd8E5rK4+1bmbOHEmRojV7ovET
AVwPcnMlA93T7nSHUAvmPE4jW/X3sWjKi+k2LE2y1odryBmJQzkthhTt2dzwTwA5
sA586vOlzJR8px9ScVb3sup+RYpd8E5h1sy9bopAc/lB53AjeoOSXGl5AqNojULf
mDjG5YqFUQnSEB0MC2uLiK7iURyismLf0k9Bo0vaT27u4iDvaIBww0GkhYjVEUUm
+FuGPgJHua2F6LMlIxd2gdw80Z5W5S+aQCOdyKMjx4zdunDuscsoTNMCSRfJhCWT
huweGbNKgZ9Oh3t9toC+CrfHdQn6aoPovb725untIhDWaMzXMOhyy6Lof2XzSZdL
0JIS7FoYQbIznGgkEff4cO3RKxC5XDkZiHzhrlo74kpwmMy/P/FXbKCvaYaCKiFk
S0JxjiEZMIvArCiAC3mRujsrvqHcZ800oYdiUYiNGRXUelAaVkc=
=Do4D
-----END PGP SIGNATURE-----

--BFVE2HhgxTpCzM8t--

--===============4656114602389005904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4656114602389005904==--
