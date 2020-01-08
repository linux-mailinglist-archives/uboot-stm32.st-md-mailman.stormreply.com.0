Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE41134CE0
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 21:11:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAF04C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 20:11:56 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D27BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 20:11:55 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id o18so1996436qvf.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 12:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AWennSYXg/atLr7LMR7MRaRQuydAppz08wkyxCETjRY=;
 b=JgAX1hcUHc0Fn5CsUl6mfhqdDXCcs+g/xtTcwDJP6GTpRu2JLzDJf0rAQYl6J9g5Ws
 ifZTKlvO4omyyCBmcBNkCrJdIoOmuA0knTOaSeWy7EjgQKfhfpXjoJw3x4A8e/+FMa9b
 uVzmWRnzG/j7VGjfA/VdfcLQ86yWl+Nc8jkvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AWennSYXg/atLr7LMR7MRaRQuydAppz08wkyxCETjRY=;
 b=l82/HQTtIund1GaP6akz4YqqNbvYifZiJcwcSLhKA9BklQV0Y4p4v7soyfmPdx5tym
 B4qsibXWcAMUmhK0SLzswIRCXzx6D6iPNljZv0xtFCGPOSAY/dt8mX1g0q+MiGIwUatu
 TsdZ8/417wpDPjwTqqvSy1R5U9Xr3fgpdMhSXR+o4JzYTU6ARw/paybwTRaBcpw95N6w
 MviXu+IIemuTtY5n1+5ewDMHnUvlncxb7V1uvhjD2A7s+Vp8+bPs1Lp9hh9iwV/JsQUD
 A44MkTCeK4gmPxyadgFpndL6I6xy/cFe0O2AF9CaHwJBm7wYwG0DMnTRH2U+PvbGZ64L
 840Q==
X-Gm-Message-State: APjAAAXaPCdaRqzsDIFpicMnxIfoZ14N/YDEHjMHubaLEI9sNANMA9sa
 WiPboTO5j1jIIDOSfcFzhGdKCQ==
X-Google-Smtp-Source: APXvYqz+zID0EplxwDDqCDifWSRRGQIQG/ja6a+ST7vEqmlqpt6+H/Q21P309OAOA3rwdJXujI9XDA==
X-Received: by 2002:a0c:e2cf:: with SMTP id t15mr5940406qvl.127.1578514314030; 
 Wed, 08 Jan 2020 12:11:54 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id d184sm1923976qkb.128.2020.01.08.12.11.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 12:11:53 -0800 (PST)
Date: Wed, 8 Jan 2020 15:11:51 -0500
From: Tom Rini <trini@konsulko.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20200108201151.GE31026@bill-the-cat>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
 <1572442713-26353-3-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
In-Reply-To: <1572442713-26353-3-git-send-email-fabien.dessenne@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Suman Anna <s-anna@ti.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 2/6] stm32mp1: declare backup
 registers for coprocessor
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
Content-Type: multipart/mixed; boundary="===============6155932409227190241=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6155932409227190241==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uLm21ivgZj9Xvi41"
Content-Disposition: inline


--uLm21ivgZj9Xvi41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 02:38:29PM +0100, Fabien Dessenne wrote:

> Use the backup register #17 as coprocessor resource table address and
> backup register #18 as coprocessor state.
>=20
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--uLm21ivgZj9Xvi41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4WN4cACgkQh/n2NdMd
dlKqgRAAi/E7dRk7F2hC7xn3B0tCSNMFXn4NZ08GTqgKQJtvlFdy9sgTZIWtzrpS
KE82zsl4OvkIBCkKCnGguN9YsLHvwYAmgfxapE79yrjoE1z0009AAvyNBkJECr0e
n909jbyKPMhKfwELTnlQ2Fmt/RpnY2nzkB2ip7tENsypF6/b62pYXxI79Uw/QSAX
sWfZakcgUr0+FJwkwwc+vqi6uscHaDGsDHeR0DtL1HMfpTHhIagEG9OR0KCvW1pO
4rWxQti3e5hwui0XG/xLJJB4j+8H0/8JB3ORT/WZkUbmb/9kNhlHb99EVwY8xoDd
Az9t/4AtCXeCbmj01aDfAzPZcUDKQajBtgLXoSPG9Xz27V2VBjZdgykBrIoUk6Wt
mOuDxrVyUA/NVcynzsr7q9cQjbe4B99Cl5BkWOsDzWiNeEzDZGGTMgWIiqO2CARQ
h4l+3lzLDWXKm3ADdpCbxLlnRSs/PTo+f3Xzkb/34kXZT9LeargBVi8CHJnD3VGq
JX/2R/7wAk3t62yEa1BFl7yTD/9T+p0tBPpVhEqQ9fYRpGiCG6bsiZUgzLlqze+U
9B4URlPbnV1EvkP/Y3B/a/erz2e9TpJaA9BIEEGPZzY3ouSPygOUzrvOIO8PFtPs
9r3ywkZPUX/XCTKaxFjqq1XacXXdl8pppn2LNxFIlIGCEaOd6AE=
=hCwX
-----END PGP SIGNATURE-----

--uLm21ivgZj9Xvi41--

--===============6155932409227190241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6155932409227190241==--
