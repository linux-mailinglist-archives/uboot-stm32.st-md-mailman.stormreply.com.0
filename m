Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB8297CED
	for <lists+uboot-stm32@lfdr.de>; Sat, 24 Oct 2020 16:51:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C925C424BD;
	Sat, 24 Oct 2020 14:51:22 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BD15C424BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Oct 2020 14:51:20 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h140so4414049qke.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Oct 2020 07:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZLoczW1Y3v4+HctALxK+4hv4MuGqsDwdymhfKIzrPeU=;
 b=pBlyzKFxpRHaZTTAqoZZvWXZc+lqjp/++3ALm7b8IM2qcf7EjhzT8+tBjaUaTqAXs2
 Rvefg/K9g4gAKaOg3SMPl2ml6wOTlG25JvHr7unDljqhVfQ75L9zRvHfSi4JdTc+rRR+
 56rDGLGLPByoUmnvjpmgQsTRamJTrzB5ciIzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZLoczW1Y3v4+HctALxK+4hv4MuGqsDwdymhfKIzrPeU=;
 b=KeMLYZQ7DZCIlqLFV8HcNz2RZ2fz0X+/uuo3yb/1CP229saCNMJCEL4qq7PdPDuhEs
 l2fMe9swTLqWoj1v/QS4oPRi5Bc4FNkcdHu+r+86yfWVX/z4D9YN4oKLHgZ8iNkB2LXm
 y9DKmWpeWI0TkXftO9G8sGVeepogy3vH8YSHWLbiGVYfAVZ5hrcdv3EJa6PpuPXrOz30
 IGG2uFmvKT9CGWrDzu5DmDZcgia5OLj4eWbBCcFUKKxMke6eUZuxvtr4yhKuT0CdOEYa
 WhAFszLO3U90YuQtV8JGX4GXqMFZ/qJjXrHNr/cB1heXG/RYLkhPh+7HF6L1dlSRJ6Bm
 giDQ==
X-Gm-Message-State: AOAM532xvSWMU+2I9lQr/rNiNFQHV2RfbJKKGWCVke0Mf7jqOxdnnKd7
 Tlfy6mGxBu2biUHQ0au3n9VhGQ==
X-Google-Smtp-Source: ABdhPJwmnMbujVV65TWGGnjlByQxMl677ffoRz/tqAuADqnynUh0Cqxakl+gQY3bS/LiPzFoJpulNg==
X-Received: by 2002:a05:620a:a8a:: with SMTP id
 v10mr7705531qkg.430.1603551079126; 
 Sat, 24 Oct 2020 07:51:19 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-9c01-c4e4-7778-4869.inf6.spectrum.com.
 [2606:a000:1401:8ebe:9c01:c4e4:7778:4869])
 by smtp.gmail.com with ESMTPSA id u90sm3176150qtd.29.2020.10.24.07.51.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 24 Oct 2020 07:51:18 -0700 (PDT)
Date: Sat, 24 Oct 2020 10:51:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201024145116.GZ14816@bill-the-cat>
References: <20200910161817.27535-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200910161817.27535-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] power: regulator: gpio-regulator:
	protect count value
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
Content-Type: multipart/mixed; boundary="===============4295161422345466268=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4295161422345466268==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+2QUFYUjFlPLR95M"
Content-Disposition: inline


--+2QUFYUjFlPLR95M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 06:18:16PM +0200, Patrick Delaunay wrote:

> Update the size of states_array to avoid overflow for
> dev_pdata->voltages[j] and dev_pdata->states[j].
>=20
> As the size of array is GPIO_REGULATOR_MAX_STATES, the size of
> states_array is limited by GPIO_REGULATOR_MAX_STATES * 2 =3D 4
> instead of 8 previously.
>=20
> The value of the "count" variable is limited by the third parameter of
> fdtdec_get_int_array_count.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--+2QUFYUjFlPLR95M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+UP2QACgkQFHw5/5Y0
tyxTZgv/dlKGZNX/jzn/ChFe3FT+owO7HvdzszsKMZUh3KhhmNuIcmRe1GD89GgQ
GgxhhvQhnyZMNr/vkJVntI2VmBALIoxGUpfXXHIFjgXl+46oVV5mKyOD7KPMsmvM
uhX3CHxF9KvzRBN0DLn9uMFjDJZOPu5bF26X66K4adUknYkkrmf9NeZxAxzEo/pe
3mLOxy1tXJnZdmbJGSPGDHqyxe1/QWnKvQjof4mOge+A3QTC08dElcpSi3I/TF1m
0FhDht33yKgdvpRevFqsFGPGgxWDbxmwc7NtcpjJGYcANpBN74RNkQxOnDbOa3Vc
L05P/75XZyBItW85uRRECjBroPEJGu2zr0uaspfdmH+rl1KtcWQH4vq1fY/8mGJB
eZYNcUA+MryiH8i9LbaUfop5uR/BWloRNse3qQmin1bKkYOWHvUnwh6tTxlRDn8O
y6Uwas3ppLGwcxZ7QFkYMJKlOi9hkWNikKXKILj3IkwX9dMbvL5p6IlpGzHOF+/O
NbVc+2i6
=Ukfw
-----END PGP SIGNATURE-----

--+2QUFYUjFlPLR95M--

--===============4295161422345466268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4295161422345466268==--
