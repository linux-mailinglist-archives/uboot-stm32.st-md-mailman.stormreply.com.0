Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A951AE731
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DDE6C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:15 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 774ACC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:14 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id s63so4006799qke.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/3WfQvciUi+BRv9euKF8U1CREl6lB+TbH8BhjIIFNrY=;
 b=ULONvOrpvI8vdvWZnBuQVqn3aHkVx/aoriXD5ww8cFqwucf5cyrq8k/LIMckl/7a8d
 0WTBfzO7l9GBLH2i6CA14r68R6CG0Jin3UQqGKHNSlmorSVy86C2xve6naBaRe5dV5e/
 BTree6cYIvUQvkzVg1dALxEIbAWWKGc3xe2a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/3WfQvciUi+BRv9euKF8U1CREl6lB+TbH8BhjIIFNrY=;
 b=uDuYPcfRMDih0C2yYlXn+OUSjkMnbgSmG/J4TPnkQMCGY359ijsPkkTyFl+EyYnjw4
 F+82WP76BFHE6HCmOKqiwKeWZJolssmwsKyWmNDsEijbqC2jQX0nB8QJ5OhSLGyoVCIB
 6wG8WvhBv6g42UBkRdXYoLlhV86Os2smLLH1oDmLbYJ6VFNABWY8ZRvgGLNrNlvixCuf
 m523iKtlzgv5eN2hg6F4up550VC0bPgPpD7imwJ6+gwbQeI9nzxY6U3mP/CxK8/hluTR
 cuYMcyZZEpIsNa1UkPfzo7mojdEFRMSTIBaemQfxJDb32vy1up8D7FBsOw86UKz0Ncts
 7DBA==
X-Gm-Message-State: AGi0PuZk8qpcT4FVobJv3eWUpmtce86YQ5tNzE1QVOBWm5URNVy0pXVq
 D9dU2ThYTf2nOHFJi70iX/l/7w==
X-Google-Smtp-Source: APiQypJKVnJAfP3AREiID0Ou6HlPgIGtrrmTv7Sa6CiBvsGgFFoqt+uBtuQcyy7qFJx1a+gINR+m3w==
X-Received: by 2002:a37:a046:: with SMTP id j67mr5394369qke.286.1587157633379; 
 Fri, 17 Apr 2020 14:07:13 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id m187sm7717221qkc.30.2020.04.17.14.07.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:12 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210710.GV4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-16-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-16-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 15/21] gpio: add ops to set dir flags
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
Content-Type: multipart/mixed; boundary="===============3582135007212801228=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3582135007212801228==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uRjmd8ppyyws0Tml"
Content-Disposition: inline


--uRjmd8ppyyws0Tml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:09AM +0100, Patrick Delaunay wrote:

> Add the ops for GPIO driver set_dir_flags() to set the dir flags.
> The user can update the direction and configuration
> of each GPIO with a only call to dm_gpio_set_dir_flags() or
> dm_gpio_set_dir() and respecting the configuration provided by
> device tree (saved in desc->flags).
>=20
> When these optional ops are absent, the gpio uclass use the mandatory
> ops (direction_output, direction_input, get_value) and desc->flags
> to manage only the main dir flags:
> - GPIOD_IS_IN
> - GPIOD_IS_OUT
> - GPIOD_IS_OUT_ACTIVE
> - GPIOD_ACTIVE_LOW
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--uRjmd8ppyyws0Tml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGn4ACgkQFHw5/5Y0
tyys8wv9ECiqdtS6suGRFZWO3plC7gqZQpMR6cLhN6IBPzCKdOIb3tnIdBmodtvk
1FBORL2iW2qTSHdw6X++1pI8suoE/lY1N2RcBO4pPHOQwgvRy+yzu4ljPNjj19bU
wNsgcCfA/uamEHIUH5I8c71ShjPKQfPwSz9nimpe54e58/gYBJLg7L73hzLqEgd3
GzAl79Aq2M2QWHr46fynkXmFrcxOkw6gsz8h2nrIU93h80A+kJHCDGPTJP39FUMc
l6//G1DbsYGeaAoXUHmbfvLvnvfJdSoEyW4/nhKMrQ9GTIpWzt4sR29nqb5AHmVb
WINXr+fG8K2rEfusIkQIJbV+Zr2p0q+V9cAAg+VM0Ln/cnv1otZIr5nHs8BhC0n2
6vlsXbtKcZmxIVwiXhHv8/cSoE3XfBv529ONkxugRhJG+/UZlqGhAZ/IpM58NCIr
ggO1MCP95mWzWpuxGuptnA3k7pvhbXYPgxPidmZDdD87WdA5qKtQxCKub38pkM2F
D+YR4mYZ
=y6Xq
-----END PGP SIGNATURE-----

--uRjmd8ppyyws0Tml--

--===============3582135007212801228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3582135007212801228==--
