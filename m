Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADC78E185
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 23:37:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9F5DC6B442;
	Wed, 30 Aug 2023 21:37:40 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2870CC6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 21:37:40 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-58ca499456dso3041137b3.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 14:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1693431459; x=1694036259;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YVw0P8ZqrqnbI8f8qdkC7qnW0RChVOiS5Khb2nBhugg=;
 b=aPt9kuIgdCkCu2oTHtmb8ygfBCV5GLlXeAcCvo0oF1BF2AXlKG/HhXeL6Fd2bK+YqX
 5mA5hlHIClCv4zHsMvUwXyVXojwJo/Meg6NeMJAJsrAbiJMJGAdS9rHVgvWRJ4oDQbyv
 KTpMvotKCcNrbvn4lMG+b7VZCl5DvVpG57vtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693431459; x=1694036259;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YVw0P8ZqrqnbI8f8qdkC7qnW0RChVOiS5Khb2nBhugg=;
 b=UMCdbga8jyhA7gI3K0SmwjSzOzTa+71eHPOScRLKLbv8DpTOjRoA3rCkpcOQKlPA7S
 AnfnEfSbU5dlmumKwblgLza9CbFWP/I9ZOWP+0O/XITkiIMCBnMunc3uL5hz2oOCvtqz
 2nHl3OUYSrkUn6yMFApnAXBDVwCBhbGoI/W+mMx8huD3HPpL6708DHArS2k/h5K5+GK2
 9yLjg6N+zjBeJvfCrfCzQOnFEViPxI/QKViutlS1lVNkEHGhCOYc1vaAHBVh8Zqa8kMF
 blFS0obcsUWBelWmsPDKAayhKdVBwe7deWtmlNkH45fshCakAy+mIT0Nnl2yGH/73DyV
 XZjw==
X-Gm-Message-State: AOJu0Yy/IgwhYbYJ/Nu3DIiGBhk1kDgj5M5Ycp2D22IzN5LgJFJ/qbEI
 rvqSx3u16k4GHReEnBWnQam8vQ==
X-Google-Smtp-Source: AGHT+IGvs7TZ2tKoyoNPhNnoLqXTftv38R57kxOxhP9VilfjM0bGaql4bsewZQo7s5/kbLm0iJiRRg==
X-Received: by 2002:a81:478b:0:b0:58c:d87b:b028 with SMTP id
 u133-20020a81478b000000b0058cd87bb028mr3397138ywa.16.1693431458963; 
 Wed, 30 Aug 2023 14:37:38 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-39b1-0d8a-4eb9-f110.res6.spectrum.com.
 [2603:6081:7b00:6400:39b1:d8a:4eb9:f110])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a0dca43000000b0057a57a9a932sm26474ywd.107.2023.08.30.14.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 14:37:38 -0700 (PDT)
Date: Wed, 30 Aug 2023 17:37:35 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20230830213735.GK3101304@bill-the-cat>
References: <20230830180524.315916-1-sjg@chromium.org>
 <20230830180524.315916-4-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20230830180524.315916-4-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Mario Kicherer <dev@kicherer.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Lukasz Majewski <lukma@denx.de>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Simone CIANNI <simone.cianni@bticino.it>,
 Jagan Teki <jagan@amarulasolutions.com>, Thomas Weber <weber@corscience.de>,
 Elena Popa <elena.popa@nxp.com>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Roger Quadros <rogerq@kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Michal Simek <michal.simek@amd.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Vikas Manocha <vikas.manocha@st.com>, Adam Ford <aford173@gmail.com>,
 Nikhil M Jain <n-jain1@ti.com>, Tom McLeod <tom.mcleod@opalkelly.com>
Subject: Re: [Uboot-stm32] [PATCH 03/32] spl: Rename SYS_SPL_ARGS_ADDR to
	SPL_SYS_ARGS_ADDR
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
Content-Type: multipart/mixed; boundary="===============3543090453867807002=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3543090453867807002==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xj3qLXjgI81c/IIY"
Content-Disposition: inline


--Xj3qLXjgI81c/IIY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 12:04:34PM -0600, Simon Glass wrote:

> Rename this so that SPL is first, as per U-Boot convention.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
[snip]
> diff --git a/doc/develop/falcon.rst b/doc/develop/falcon.rst
> index a569d1a2951..fbf8c10e47e 100644
> --- a/doc/develop/falcon.rst
> +++ b/doc/develop/falcon.rst
> @@ -63,7 +63,7 @@ CONFIG_CMD_SPL
>      Enable the "spl export" command.
>      The command "spl export" is then available in U-Boot mode.
> =20
> -CONFIG_SYS_SPL_ARGS_ADDR
> +CONFIG_SPL_SYS_ARGS_ADDR
>      Address in RAM where the parameters must be copied by SPL.
>      In most cases, it is <start_of_ram> + 0x100.

This was intentionally "CONFIG_SYS_SPL_ARGS_ADDR" and not the other way
around, for semi-dubious reasons.  We should instead try and give this
perhaps a better name to describe that it is where in memory the
parameters for our payload have been stored.

--=20
Tom

--Xj3qLXjgI81c/IIY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTvtp8ACgkQFHw5/5Y0
tyymRQv8Ct72SE2Em8ev+YoC8icLcOKe4CJS7oYE7pW3LEoinBAY1W0YuzvcjgI6
obwghSA2vZJJgX+8Af9NXecoq4Wn1g/yUfQKurtZCYWGKtktrwFYFKqabBgZ9Wsx
hXnjfHtSYD4ycJ2Bj9zTLhaz5aopaHQpK12O4VRXhKsyMJS0H2aika1KXV84XWmd
P4pUCf625kzVOlMV7fJc0ND5Hrnbk5nDc56/ufmSQMZxwLC3oSp+UsRN+FUslxmD
GZIX3XaeQuYmmM2refaG6hAV7ZEqTMk2PNN7p+ASeNXWl66NEAo0bV7QPXoIo8QC
hUmiD+N5ByOY3+icXSsDjZUO3Cl953s8Fs1doN9y9mx3iGFx2n7klyeX4Y7LEH6x
OYgeX4VaQ1LBRdy7ZuWF2sK/l2VS2QarCPp/yW+4lEZ0vvoVFbjkKBByZ5lvdsIs
cIqcnPwyx9KcybDOBBqtPklcF5h2zkWS4QLyxrspa449qzQZ0ZIpJioxQRFFrEMq
eUMwcic8
=oZKB
-----END PGP SIGNATURE-----

--Xj3qLXjgI81c/IIY--

--===============3543090453867807002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3543090453867807002==--
