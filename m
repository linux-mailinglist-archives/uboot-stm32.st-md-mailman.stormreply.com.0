Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 211401FFBC6
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 21:25:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E00C2C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 19:25:56 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 165DAC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 19:25:56 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id j68so3366930qkb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BEEFjK02VCZn2X4Y8P6L5LoT4U4+4WulAcp4lbthEKQ=;
 b=cmDIDmVrxGAUQganj8aEEiKuKV/BhUiEbCX9moHjrIdtprtbvUuLQGAe0hJ+dPBPmR
 AiUQbvqr8isY35LXKUsXqnHCujhK97BuCRsLdPE/diEbM3SwByzNJObbh/x0JspjU1ql
 N3mcuzFwNzeVV+caktrX55KH/UmCwDbkv1Jow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BEEFjK02VCZn2X4Y8P6L5LoT4U4+4WulAcp4lbthEKQ=;
 b=NG+gf/evmw3nV05JNLBPvUTIekTxi5yEmhurimstJfmDi7LrsrH0aBkYk/7Vc7jWBz
 2Psx+ftaTEjZZnCWALMRyVBq2XO4o3ym2klS0xySgB9D+9QSD2Y+vJ+lhl8bLmDttFf4
 ficM8+IQfFTl9hettssI0RuAOhqap57Nv99ohg0u2zX6/JAR9xURn6DJzk/gAYA+xWC6
 sZKIDNZOCD+Eb1cT6Aa0TVUdZAkRJ6yT1vlRyl9DKr4vTcEnpo49p7agrWHpuCSFpgFb
 u1BgI9s3eaijszDr3tOs6Kwve282F+QVbO1W6tEvL6kHv/90H9VsgDH/V8QpL4wTpoFq
 8uTg==
X-Gm-Message-State: AOAM532BJiuXhxopfsGXcy5G1DJs0WWabPaLRITrUq5TDVfiWHhTkBaP
 rK4k+KhyITIUyZPCQoWeYObp+g==
X-Google-Smtp-Source: ABdhPJz22fR1hDKFeOF5cUeMvOZ3wW/q8iudsP3M+y/Jl3K5HRDV9rZ2EHR1Kq7T8cdp+3WgbuWaag==
X-Received: by 2002:a37:e30a:: with SMTP id y10mr403134qki.151.1592508355057; 
 Thu, 18 Jun 2020 12:25:55 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-3530-e3a2-751f-ef7e.inf6.spectrum.com.
 [2606:a000:1401:8080:3530:e3a2:751f:ef7e])
 by smtp.gmail.com with ESMTPSA id n1sm3882398qkf.54.2020.06.18.12.25.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Jun 2020 12:25:54 -0700 (PDT)
Date: Thu, 18 Jun 2020 15:25:52 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200618192552.GX27801@bill-the-cat>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200616074048.7898-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/9] env: ext4: set gd->env_valid
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
Content-Type: multipart/mixed; boundary="===============3620992656360770017=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3620992656360770017==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+dH9khzwljbvYE07"
Content-Disposition: inline


--+dH9khzwljbvYE07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 09:40:41AM +0200, Patrick Delaunay wrote:

> Add a missing initialization of gd->env_valid in env_ext4_load
> as it is already done in some other env device.
>=20
> Set gd->env_valid =3D ENV_VALID in env_ext4_save() and env_ext4_load().
>=20
> This patch allows to have a correct information in 'env info' command.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--+dH9khzwljbvYE07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7rv78ACgkQFHw5/5Y0
tyx8Ogv/ZDp+gRraNRixHfj1K10Jxu9ywdVlQi+oK0wGrvAcRNplO1W//xNFnKX1
9CeLUPC/HDFfoToY39qKkwoXqxL5QS/gYUvLN1e2m/K3QmxgWqJaMA6e/H88oFAh
DYDC4tPjsKxKBK+SDaQYo+JekpVYNWLZxPcmkadXcSLy6I3E1FE3/XnO5V0T5nco
i+7VoyFX+CbRjvPD9G2U2oanpICI9MC1za1znl2YEq0vlr+GX+DNqKJIGK+fa9hg
xT3piPmBEwkmdtFQEmeBdWFyfQz1inRLtLE9pTMVsVAQPh5cbHjTKO7E6H1ou4+2
yv4uHgTiN4nRe6nHEm4hJ+G7D4YNWLg1zlal1oM0sygrqXfeQRhGNP8OgrvDFoIt
55OHB2U8wJQ1qKSN3puLebVJJYlLR9X94s1Yq91nZbkwfYTm/Ua+VkIYf2pjBomk
UH2Pb9nVEn4gzjLZ6QMZpZUu4rU9Y/pYsREmRFhBA9XhXIuxk9tEtV2ZmtNhjN6n
t7NyVw5e
=eQcz
-----END PGP SIGNATURE-----

--+dH9khzwljbvYE07--

--===============3620992656360770017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3620992656360770017==--
