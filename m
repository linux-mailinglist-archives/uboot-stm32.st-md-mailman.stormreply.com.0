Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA33C5B9C80
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 16:03:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACEC2C63324;
	Thu, 15 Sep 2022 14:03:26 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6233DC0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 14:03:25 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id g4so14219219qvo.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=75BUga7fnotRuADvfS9lnC2gAqTFFaSoQ2V6xbCSa1M=;
 b=e1zRXl5v9mGET562lr9H658Y1DocCmhWjb5QBo5My/n4tXMR08EGFjl7sGJcBF7dMF
 WSznz/ClspB0ikWF4gS+QTi3VIzrteFrRgElM5uPcJft+dpGihBV5qjB4S+6GN0rtckx
 zrGrCWYUDHeSaI6iT1XBBICd2PHAYZB/4Nuok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=75BUga7fnotRuADvfS9lnC2gAqTFFaSoQ2V6xbCSa1M=;
 b=cZZh258cMe+E2Nmi1ie7Q4OHm15Je7mkA9LrVfMgzkBXsOK0yNPl5M2TOPsApI5sl8
 O3P6iKXNhkr2L8HktuyFjRTNx8VCckctLfVMfh8bDnNZUM2mZ5q9GY2RRfqWcppldM37
 epfULywyYaLQCHviWJcColIpT8MjQ5oCx2Q01uryVIx1I2u1dMtJ2xC2DEunASRA6UK+
 3WZiTw2I4Lq3RKJin/n+xBfqtwvwyewnEiTgJqi1GVVVRGypTw5BK6MFc7hsLIyK2OGS
 Gs04naHeTwTdBqw3ZgL4QwIoXGvstJ1+SDNw9njtsZ+7jpfXlks8nvfkYXUSznT2MmS4
 2xbg==
X-Gm-Message-State: ACrzQf1SWdFEu3P7tQ82R5X7uvdM3iXY8dyW0fGt+TOxU1wmW77bChd2
 5/hiTE4P8xWg0mWcyNvdiUYQRQ==
X-Google-Smtp-Source: AMsMyM7QX3uasx8YAk9Ae9q+15v2TXdXLIupMY9SjHEm8FVXVoN93QZRxyQyBca5kPSp8eDYIhYCUg==
X-Received: by 2002:a05:6214:5609:b0:4ac:aa5e:5425 with SMTP id
 mg9-20020a056214560900b004acaa5e5425mr115351qvb.81.1663250604339; 
 Thu, 15 Sep 2022 07:03:24 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-6011-212c-4988-e1af.res6.spectrum.com.
 [2603:6081:7b00:6400:6011:212c:4988:e1af])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a05620a258500b006bc1512986esm4154074qko.97.2022.09.15.07.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 07:03:23 -0700 (PDT)
Date: Thu, 15 Sep 2022 10:03:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220915140322.GM6993@bill-the-cat>
References: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
 <20220830120914.2329522-5-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220830120914.2329522-5-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 4/4] gpio: sandbox: Add GPIOD_IS_AF for
 gpio configured in alternate function
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
Content-Type: multipart/mixed; boundary="===============4466733375383141298=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4466733375383141298==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jxJZfy9MYHgKPwT/"
Content-Disposition: inline


--jxJZfy9MYHgKPwT/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2022 at 02:09:14PM +0200, Patrice Chotard wrote:

> This allows to test if a pin's label if displayed using gpio_get_status()
> when this pin is configured in alternate function.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--jxJZfy9MYHgKPwT/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMjMKkACgkQFHw5/5Y0
tyzXsAv8DyyWQZrl9DciIrkM3e1BtRhIISbMeZXqV9HkwTwDupwngxiidc0wNDPU
kXGLn5zLZ/cUS7ACiTykIMNmlKbpzTqIsr0AYOKdJYu/NM3D8PitkbGNFjoo3Ua2
CoO2bYLR3JSYUf9M+3OzinQNuIGleOzW0Hdp5eG5SMVWxIz7XoCoS2nScStp4Rv9
xWz7psyKDxNAeAgfg8Nm8IkFMfKn9H8stDsbzuZVfbXH4B+MKzaasRILV+rAMGQo
svoFeyVuJhMlsnnAal0dxdyPY8sQe12Z0sRdScn3WRHnz6q+GVPgD+AQZssFtpb1
XemaPpOdoTNNv1w7F7fBtNQoIqItsSD87WpAY/glU4efl2HvTjWKjMmd+9d1ffIn
7YQ14v5EUThqkpmJyVAGU5CgRVqvU3hiZUoyoFfhfZhJicwzNYS51F18Cv7UDFJO
bFMAWpNAWLDnGICV0hRoB3p2FWc/+hfomftJO4u2UH3stRAMOZXtVmIU/wA84cN9
DwcRg/y8
=fb9t
-----END PGP SIGNATURE-----

--jxJZfy9MYHgKPwT/--

--===============4466733375383141298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4466733375383141298==--
