Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8401822E2A4
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Jul 2020 22:50:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C37A4C36B25
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Jul 2020 20:50:39 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 696F6C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jul 2020 20:50:36 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id s15so2118444qvv.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jul 2020 13:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RQbClAWiXUHMdEwsdo25umU4b5LxLvDtD7IQkegvjec=;
 b=GCN9DLK4miuqkWe49pg5Vwp7pnOEwJ0fpGYrqhS7OMtY0TlnRgi/uZGiNx4uu+0Gny
 dwXcER6ulxdH4sbI7sCDpVo6Q98cWKStEbcBYpXv5bOERcomUwcuFnytAaOSDptwXS1m
 BvSd+hd4IOxHvIeY2Feq5wkvmduKo6smOleRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RQbClAWiXUHMdEwsdo25umU4b5LxLvDtD7IQkegvjec=;
 b=Os85qOgwrl3nkY2CLx1bjpXrKLbgLDm3egDsbQiGRJNzJG+l1WjGMQJ3H3OpQUmRa2
 U0+DHPSRaV8xQ6yx7ccwR4ieHSs6YcJCPcej5BroxkEK3rn95BbdwLvItXuhkNAqwgeF
 f+W6GHdReYByEpnBAZ5wEVxyU5xGyN7MaDu06fCaYtVUsQJOMFJeCk7ijeiKHcBUHJfX
 B11aK1sQnYMP13eVw5di1Ye0zJ8RONbGi2omq4yUTict9Gef8YTit8+bzVJC2tnNQm25
 z5i4PzsSdi1YKNKwrpgBgLzx5U+QdA2DnCkHqv0JOTr/Lp11vyYVXZvdvqIWCGtyTc3Q
 f0vQ==
X-Gm-Message-State: AOAM53052HVWRe17NTtd4O+Z5IjeyEbz+wokJIgC9+vJXphMmiyKPAgt
 v/nNe/VzVMmf1gU4YWr7vBwcvg==
X-Google-Smtp-Source: ABdhPJxGnBwyAM9Tnd4maQ5b0UrrWC3i8w6rSNI2eYgn8sH25SLtX0A/Qe6q6dpsYz8UyZn38EOtRg==
X-Received: by 2002:a0c:e008:: with SMTP id j8mr19976271qvk.87.1595796635556; 
 Sun, 26 Jul 2020 13:50:35 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id i20sm15006361qka.17.2020.07.26.13.50.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 Jul 2020 13:50:34 -0700 (PDT)
Date: Sun, 26 Jul 2020 16:50:32 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200726205032.GA15418@bill-the-cat>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
 <20200625075958.9868-6-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200625075958.9868-6-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 05/14] env: nowhere: add .load ops
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
Content-Type: multipart/mixed; boundary="===============3480900472368721763=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3480900472368721763==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 09:59:49AM +0200, Patrick Delaunay wrote:

> Add the ops .load for nowhere ENV backend to load the
> default environment.
>=20
> This ops is needed for the command 'env load'
>=20
>=20
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Tom Rini <trini@konsulko.com>
> ---
>=20
> Changes in v3:
> - new: add ?load ops in nowhere
>=20
>  env/nowhere.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/env/nowhere.c b/env/nowhere.c
> index f5b0a17652..6949810a1f 100644
> --- a/env/nowhere.c
> +++ b/env/nowhere.c
> @@ -27,8 +27,17 @@ static int env_nowhere_init(void)
>  	return 0;
>  }
> =20
> +static int env_nowhere_load(void)
> +{
> +	env_set_default(NULL, 0);
> +	gd->env_valid	=3D ENV_INVALID;
> +
> +	return 0;
> +}
> +
>  U_BOOT_ENV_LOCATION(nowhere) =3D {
>  	.location	=3D ENVL_NOWHERE,
>  	.init		=3D env_nowhere_init,
> +	.load		=3D env_nowhere_load,
>  	ENV_NAME("nowhere")
>  };

Build testing this, we get 8KiB size increase in SPL in targets which
have ENV_NOWHERE in SPL.  Can we guard this somehow, with a logical
tie-in to being needed for 'env load' ? Thanks!

--=20
Tom

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8d7JQACgkQFHw5/5Y0
tyzGEQv/a3wrdWCHqoHoU3sFf+t0K0nh2Z4wG/TrtML+N6vEancZfou6FnJe6bgA
0A+Fu5AU/nX2kiErbhYaOUclt4hOxKkXQh059xmb2dNSKSjGkcr0msLEWY8ekHnY
1LKQuB7RA1OMBgK9Q0F6r118/gfbqF0X+vm1QZju5mcKGlr6h4L4LTtcCQ/ZMub5
z8OqWov87TCOPhcZLNTLnGU6ZEFQr11QlEgQjhNYOeUIGammlI8aDR9nMNOMA0JM
kxMJOIA0448DXIeYWd/zr2erPL0MaBznNKs2DSjL33EgKS7fCKD62r3y2u+Jx46D
w4BVrbmEV0sTInYkp/GZjE5mypiKqpGoJa/T/MMJmTJxzonC/5U2ODwnQ1z3s3oi
TyD7Hv4OcQB0k2e9SgnBUeX43zGG0Vr056U1KjwqVasF7pyaM/Hfq745mmgocBp6
8xcTVEbYWWczvljnDrljXWOCZWqCg0Qjeg9nYAE9pyNMOtBmBTSjLznnuD1dpOJr
SM6pws1P
=k408
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--

--===============3480900472368721763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3480900472368721763==--
