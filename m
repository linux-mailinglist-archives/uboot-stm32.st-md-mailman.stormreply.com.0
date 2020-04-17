Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9431AE738
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7E3DC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:49 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8365CC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:48 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l60so3204073qtd.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zc3UhZqNWpGwbptVt3YObK8bXH1pyMj4PJapyDJHJsE=;
 b=oRfgrakBWRtkUGmVo7Ihno9biB5D1i4qjXRJuAHkiHUOShHrLHCvXW3KxWULLcMCJj
 lAx5lopX3zmFm8a2kNaeWlkqEcfCcZoyF26W/xHCfrnxPggcZUEGtVoNgHQv0nBtvOgB
 aJZDhPf5DzLKrdiO3+JWD8QfM50LX6eVzL/WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zc3UhZqNWpGwbptVt3YObK8bXH1pyMj4PJapyDJHJsE=;
 b=VV4utP5nZWxjtIDh2/s+zXwdNM7K11wH19u3jcOuVaRkAiKepOBkTkBXnWEz3/n+5a
 ZOOcCAYFShWIxdVHnodR42YdNHzMPuARvialWYFvnr++sX2l1UxR+xQECqlQvN99o/RQ
 mOWmk5YJ4VvHdKWq/YdDBIV5Suy08r/eplQ6VCCznWALqg0SqKVWxfJP/3lNa1IbfoIv
 2/pHBqHBvLECb4JSZZxhx0lY2sFtTNf4iaNvB1TcztP4V/7LGti4VWQw39M36EAasqzP
 MzAyWNZrPzELSHXVIL5wShQ1Mp7+UgHRjeBtKVFpvqsjkd+Qvrg6jCwKlnT07L7T0100
 3bBA==
X-Gm-Message-State: AGi0Pub4IQpHrUrz4Obg9c7DkddniyShd0haj67jtfqF5xmhIThAkDDP
 B8DipxlY3/2x8dN/lACQEbPcxWV99Cs=
X-Google-Smtp-Source: APiQypI02K6ttefKNyB3IgsNPkyNPegKYFrnSZv7xqMNPt/l4eemj3sZkL+lSXkvMDyHLSbMHtSF9g==
X-Received: by 2002:ac8:23ed:: with SMTP id r42mr5118853qtr.372.1587157667464; 
 Fri, 17 Apr 2020 14:07:47 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id g187sm17346258qkf.115.2020.04.17.14.07.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:46 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:44 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210744.GB4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-22-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-22-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 21/21] test: pinmux: add
 pincontrol-gpio for pin configuration
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
Content-Type: multipart/mixed; boundary="===============7264691713871388802=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7264691713871388802==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ahZICQ7iXVM/oLYH"
Content-Disposition: inline


--ahZICQ7iXVM/oLYH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:15AM +0100, Patrick Delaunay wrote:

> Add a simple pincontrol associated to the sandbox gpio driver,
> that allows to check pin configuration with the command pinmux.
>=20
> The pinmux test is also updated to test behavior with 2 pincontrols.
>=20
> Example to check LED pin configuration:
>=20
> =3D> pinmux list
> | Device                        | Driver                        | Parent
> | pinctrl-gpio                  | sandbox_pinctrl_gpio          | root_dr=
iver
> | pinctrl                       | sandbox_pinctrl               | root_dr=
iver
>=20
> =3D> pinmux dev pinctrl-gpio
>=20
> =3D> pinmux status
>=20
> a0        : gpio input .
> a1        : gpio input .
> a2        : gpio input .
> a3        : gpio input .
> a4        : gpio input .
> a5        : gpio output .
> a6        : gpio output .
> ...
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--ahZICQ7iXVM/oLYH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGqAACgkQFHw5/5Y0
tywiYgv9Ex/zVY0/2rZqoA2HUpNQ9F10GdUg+nI6cgGfauqXYOH5+9646fOXjAqw
FUa8zLxQenhGEr5lBXuoGYr2EidMmlbtCQCwcJh4IIr7Uqb0sBmwgaY/Sd91bGnr
vx7Nl8xIImo4GHac4sSH4TmKPbZCr7oT3kLiSdA5/vBSGU7vtcsLDOw/sfYBVcF3
QSZpLGy8DTqVbhWoOmxFexgmvH+EbNuKa2vcTlSr0ZzAqoC0Fr2O4TTGtwI0iw+s
L5zvFMOd1X0NCAqLJddubMaxyjqm+HItBP02ukOQFBDCgJV2Mv2GGnYdD9x+pIoc
aFe8FyA8k+E1L150lUa5VQZAb5tv7te325JGsG2YIFNimH7oFsDiHa6tx+HFV5TL
nMtMQPDKI5DZxzaeECN5KL4DckV8Wq7jgaaDp+0ywo7RETH2m/UIL4JqGZFqt7iH
twu8tVCg59CbGMmm5QK4Tk8pbtQpt+PDXGt6fBLjaXyaj8g0Ak/lkN8Fy/kMo3x/
1WXwRaTs
=8fMW
-----END PGP SIGNATURE-----

--ahZICQ7iXVM/oLYH--

--===============7264691713871388802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7264691713871388802==--
