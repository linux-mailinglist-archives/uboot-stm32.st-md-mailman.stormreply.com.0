Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE75F83C7A6
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jan 2024 17:14:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82A0FC6B477;
	Thu, 25 Jan 2024 16:14:48 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21BDBC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 16:14:47 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-602ab446cd8so13001127b3.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 08:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1706199286; x=1706804086;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xEJ9KYA+vQtgAGhHVjiW8lWboE4jHkh4LJ8KcrWFaBU=;
 b=MWhVCjXSZXws+1hd+HMehF1DNoKfqtQOTa/FeVo2lSIjGSAgAFtYgO6lmaXJ+Eg7Dj
 0FFjr7NqouSXKcvTJPSFjGfCfXHbx+WNOAuz/MfjfssTmhn5nuW0IucjfR57U8Yswk6R
 9eMFyIWncSWQgIyKcmw1wW+9heYzPy7ODUa9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706199286; x=1706804086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xEJ9KYA+vQtgAGhHVjiW8lWboE4jHkh4LJ8KcrWFaBU=;
 b=GtiR9xRGjCEV47A7ZTndO1TxnQlA7/D/u90oZ3X+3JUWLJcdW3kbrM38yoDItdTVFl
 Qct9TALvSCYUOwmav+hXLU6tUxzrwwsX/qht4lI7lQQCZubzSc6aE6qmnnOG0E7YicaO
 UlWyzU9doNr4nLcD32BDfiRBhA0hcP9BddyXt3u4JRqTKltG5718WkBse9agYhqlcBy3
 CAJudyFPGO2BJDeUtFvJX5oeZiVI85JdqgnsA9V+bQ9li3knePwmXYQ33TTucFWgwfaU
 S5l3NU8kX/CJ1ows5Uual1Kj5ZqF33BVwqkLWusnWqCr6eA4EmqBq0YtM9uzC63Ga3Bt
 pnUQ==
X-Gm-Message-State: AOJu0YyWvj8w6d2WTLvZHfBo4eY+rUA1QnDoZaJqfu09KpvV8VYzYdQE
 1zr6EZpplW8iOUDt7ynbhvuJ+0kdEhJqjUv1bsJVT++hGnRPkuvMl1GPNxTxZhY=
X-Google-Smtp-Source: AGHT+IEZCALIGKFSfR+YJ67oflusiEaI3kLRsCWKXAuuQNpg55UlEXSbSBSagUaMwuGgtsu9YsK2Wg==
X-Received: by 2002:a81:9b17:0:b0:5e8:61ec:4d7f with SMTP id
 s23-20020a819b17000000b005e861ec4d7fmr35213ywg.38.1706199286000; 
 Thu, 25 Jan 2024 08:14:46 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-3119-0000-0000-0000-1001.res6.spectrum.com.
 [2603:6081:7b00:3119::1001]) by smtp.gmail.com with ESMTPSA id
 bg10-20020a05690c030a00b005e703079702sm737046ywb.87.2024.01.25.08.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 08:14:45 -0800 (PST)
Date: Thu, 25 Jan 2024 11:14:43 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20240125161443.GT3652023@bill-the-cat>
References: <20240117123714.50380-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240117123714.50380-1-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Bin Meng <bmeng@tinylab.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ion Agorria <ion@agorria.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2] common: console: Fix print complete
	stdio device list
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
Content-Type: multipart/mixed; boundary="===============0238897628347650029=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0238897628347650029==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lDoYZQjGBiCxMcjv"
Content-Disposition: inline


--lDoYZQjGBiCxMcjv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 01:37:13PM +0100, Patrice Chotard wrote:

> In case CONSOLE_MUX and SYS_CONSOLE_IS_IN_ENV are on and
> stdin or stdout or stderr are missing in environment, as fallback, get
> these either from stdio_devices[std] or stdio_devices[std]->name.
>=20
> Fixes: 6b343ab38d ("console: Print out complete stdio device list")
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied to u-boot/master, thanks!

--=20
Tom

--lDoYZQjGBiCxMcjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmWyiPMACgkQFHw5/5Y0
tyxbHQwAsXS+tNUymfVqnuB3gPO5CfvWRKPjdpAPdibWLyD4E4T6G5JSlKVzoOsq
p8jqa5WEw3BJjtm956fRH+ghpNvX5pIZGv7THO78QVjMvtCwt55/XEdYNHOR3L3m
IMjj3/RBKftq9agl9X2wMFFXtr1p63DYy8bPdxWZ7UWJpXmesFz7DkAKL2Jl/xNb
KWHgA0Ar7XavMkFU1THqe2wdzFco40Oz0M9jbgY2VFFMZc7f2MvATffPj4SooL2I
WRoubSvCDIhhPiBv9CQAxJYE+O0YnZmyFk5nKY95v4w7ebGxATVlvywlInrcN1w4
YDe58P+GjrdpSLgVTil17siSRWyKTMD6Kznxqx0pJWqo9KCQDNKZ8N16iVaEJYhH
l0gLDi5TO727+SQHH5F7p3wvbw5oCU3m/DEmsqN7CTvGaeU8d4dQWbW1Ba8D5B3h
7eW0E9Po73ES9NZnLd5EvM8qkKyJQOjkonGDI4i9PaTwwDysf4u7nN/wJd1AwGHe
i8FUGxlr
=YKtV
-----END PGP SIGNATURE-----

--lDoYZQjGBiCxMcjv--

--===============0238897628347650029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0238897628347650029==--
