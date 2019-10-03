Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F39C9F3D
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Oct 2019 15:18:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D8F7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Oct 2019 13:18:24 +0000 (UTC)
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCD76C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 13:18:22 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id s6so989442ywe.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Oct 2019 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hXUawAQnus/oufH9l5zRihPDFkFjrmOQCT/gDXFLg1c=;
 b=UGpaGqIZO6/xI+HXU2d9CsrTh1xTQyvJr0TZjz/DRcAZwUpRWapAwIJP1hYHxTL/aG
 tIJsUIVIsaBJ53WgXqIWhfpyD+OLi4Cflsds8R80W1LB8x0oNJ536RqddYkEjYz3b5dv
 Aknx8snif26Xa6sFGxk/QQZkSL5KaoU4dXB4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hXUawAQnus/oufH9l5zRihPDFkFjrmOQCT/gDXFLg1c=;
 b=eCrpMyzssPhbZg7SX8VLkQ3XftQgiz0f0hliOnFvhTbplCWShGdwY5cet4/Fa9/Wb0
 e2EVHRRHPi2pslrt5/cuRxxNs0WcI0UD5hFYfapdeFJl083TnnSoMcRF3R0gClIZxxCY
 9m8qodyrIfv4xGES2C2U+riwElzPRhp4EJyaNUUOvl7PeBxhac5NHHVfixu7Soy0yKxY
 Vyhs6Czu1tOnq9mc6NnwYGyEV8TqzgLnMxhHeyPc96oUO/aDgJFIYINVyDvPJZFX4BMo
 VVlrIq0KIvUVkh7T8nXuTPsFv8Cy2NGCKXLJCwDiJ9fX+nDZPM93cPNl46K5Tst2sFRl
 Y0LA==
X-Gm-Message-State: APjAAAVMMHPiRkvpP55BZhI/X+eWAv8Dv8h3GLgSv+vWrbivDoJJb4T8
 J6/7Yed7mfi5eGMGophsrXdgdQ==
X-Google-Smtp-Source: APXvYqzy9rKOwPuq8q1Cgn4f6LiXdLrC3XKVAXG2ysR67vsWZ2oAnOuhajGGTIXj0daRP+JwOcQx8A==
X-Received: by 2002:a0d:d6d2:: with SMTP id y201mr6285585ywd.42.1570108701496; 
 Thu, 03 Oct 2019 06:18:21 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id t186sm651330ywd.54.2019.10.03.06.18.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Oct 2019 06:18:20 -0700 (PDT)
Date: Thu, 3 Oct 2019 09:18:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Wolfgang Denk <wd@denx.de>, Heiko Schocher <hs@denx.de>
Message-ID: <20191003131817.GA28627@bill-the-cat>
References: <20191003072428.19197-1-patrick.delaunay@st.com>
 <20191003072428.19197-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20191003072428.19197-2-patrick.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Ash Charles <ash@gumstix.com>, Wolfgang Denk <wd@denx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam Ford <aford173@gmail.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v4 1/3] env: correct the check of
 env_flags_validate presence
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
Content-Type: multipart/mixed; boundary="===============4833395000732404319=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4833395000732404319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IbA9xpzOQlG26JSn"
Content-Disposition: inline


--IbA9xpzOQlG26JSn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2019 at 09:24:26AM +0200, Patrick Delaunay wrote:

> This patch corrects the check of env_flags_validate presence because
> "flags.c" is always compiled in U-Boot and CONFIG_ENV_SUPPORT
> don't exist; so the macro CONFIG_IS_ENABLED(ENV_SUPPORT) only provides
> the expected result for SPL and TPL (check activation of
> CONFIG_SPL_ENV_SUPPORT and CONFIG_TPL_ENV_SUPPORT).
>=20
> This patch solves the regression introduced by
> commit 7d4776545b0f ("env: solve compilation error
> in SPL"); change_ok was always NULL in U-Boot.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  env/common.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/env/common.c b/env/common.c
> index 3fb60509dd..f677b5b0da 100644
> --- a/env/common.c
> +++ b/env/common.c
> @@ -24,8 +24,10 @@ DECLARE_GLOBAL_DATA_PTR;
>  #include <env_default.h>
> =20
>  struct hsearch_data env_htab =3D {
> -#if CONFIG_IS_ENABLED(ENV_SUPPORT)
> -	/* defined in flags.c, only compile with ENV_SUPPORT */
> +#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
> +	/* defined in flags.c, only compiled in U-Boot or
> +	 * with $(SPL_TPL_)ENV_SUPPORT
> +	 */
>  	.change_ok =3D env_flags_validate,
>  #endif
>  };

Joe? Wolfgang? Or Heiko (since you could verify the regression is fixed)?

Thanks!

--=20
Tom

--IbA9xpzOQlG26JSn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl2V9RUACgkQh/n2NdMd
dlKu6A//RWK17LftlhAsDRvvdN7c86Hp3w09YsgN9KCgbMpXkTHx8gYPna4GTMz1
gQdsNp3lZvcdPk+WJohSkEK7CJckpVDle0XgIbYggLvC5EKtVxipxQc2Eb3BJxEK
TDXZv5+gt/Qq5bgpsBO+Oz7trdbmWB4oV+fBj7KRNXxeLL0nB5gatNRHQ+xTcW57
WaMILG4ESU/Y6Moa4TLmJwCWOkQ4o6Vk9ZvPRbf6BAzOt3z7weazg1bzF4r6TmH1
Bw4FW54R4btovkRXWqoO1Q3n1Aqb//ZjRUgL4Tun5kol+w9t0ZITOEMQ2sRAcQ+g
DGcevUw+OjhBwhfsIHLq/mE5jJJhyf+TqEz5BCyYFgb62HMZJBnfI7xGhCmClY04
Xeo+G+009ZqAjsNBuJ+VAMnU0CkPpm9lifTpY5dFiDFZX8RnsHxfKDVEJRsS7wVb
KZwXaj9Tp7LxE8UleyvJRIIFML2AgPUu7prLtizSYdBn/UH7wEb5rgn5aSU4tjaQ
5T0qJqyA1+gRkzNDrl4GVHKeKpGRp2EQVOZDNPnD0LcNO8oBe0r00ReLCDAzwHzO
3Et7YElA06q9BibghwnmEMCFIp7WDwizHJFnkKxXFGknXDDLI/dssgUwxdHY92n9
HdFmYcpl0WqAId6D+4A7WoUCEbNesBa63DXTwX0PHB4lvT2Bupw=
=n8Jl
-----END PGP SIGNATURE-----

--IbA9xpzOQlG26JSn--

--===============4833395000732404319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4833395000732404319==--
