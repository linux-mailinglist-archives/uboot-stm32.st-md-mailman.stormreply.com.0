Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FA9DF42B
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 19:26:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77E62C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 17:26:21 +0000 (UTC)
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46159C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 17:26:20 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id d192so5191529ywa.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 10:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wXyLI1fFYu1gCo/BypsBPrMTAMGbIHIlO6FUdBhqP5g=;
 b=N0Yz9zVxXKFzf4MkK22bvtKbCpYjOv4fwjnxooyyESdH+QkI/xj6cg9q0RxsLZm0NM
 q4EUANvpjW7miZeosJjF/i/qYVQp160HM4dzvdBfpRocC6JQCkJMx7yJfO3lrKw55P74
 +Z4exz80qljp1rNNqwBVceuv9iSlpKCXC6NJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wXyLI1fFYu1gCo/BypsBPrMTAMGbIHIlO6FUdBhqP5g=;
 b=KOp+xI9H1TpHJNmax9+HmaPCjpQml39mgpJaOaOMotdLbJgkfECdEbpvOs4gTg+Hhn
 FQJ+hgWFIEwfE4+e4hnqQ0pLFDC4fV7QohYKpWEyL9DqAztlY5O+JaAeLeMqyd4kBkTz
 C8xZBtXe3U4C1b71xQBnZj5MPAUHP1sbxPYjDDSTVWipJamRFVQ6BfanjjsKFjNcrQdj
 nv7v/k9ttqoboA2zG6KEGygOftDAXarC430Cnpd6impDanCfnmbTSevw058XD0wfhwdt
 6gHz72SjcKT1lJxBJgMQ8wqRdN4I59CeeQ20a0hM3OEW/Cd6Q1DzssuMWfK5OiT7VKCj
 PKHw==
X-Gm-Message-State: APjAAAUirdsoTCZhjNtnhE0DgynZWCBGuQpX82J4QGhGqtNJ5zICS2wY
 81TwqYSfk34SwePx4kSWVMlNxQ==
X-Google-Smtp-Source: APXvYqwgQiP/vCmhVA7/1W+OMIxNrqOJ0MCBEf6LEXn/rxt20Zq8Y5AGtdO01slrzxXubKUpfeLWwA==
X-Received: by 2002:a81:2748:: with SMTP id n69mr2509292ywn.281.1571678779064; 
 Mon, 21 Oct 2019 10:26:19 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id s18sm631810ywk.33.2019.10.21.10.26.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Oct 2019 10:26:18 -0700 (PDT)
Date: Mon, 21 Oct 2019 13:26:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20191021172616.GR11173@bill-the-cat>
References: <20191021130240.31808-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20191021130240.31808-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2] dm: pinctrl: fix for
 introduce PINCONF_RECURSIVE option
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
Content-Type: multipart/mixed; boundary="===============8201321298439731368=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8201321298439731368==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2qwbT0JTInWqknst"
Content-Disposition: inline


--2qwbT0JTInWqknst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 03:02:40PM +0200, Patrick Delaunay wrote:

> Correct the name of the define used CONFIG_IS_ENABLED which is
> not aligned with Kconfig name: CONFIG_$(SPL_)PINCONF_RECURSIVE.
>=20
> The recursive calls is conditional only for UCLASS_PINCONFIG
> "pinconfig" driver.
> It is always needed to call pinctrl_post_bind for UCLASS_PINCTRL
> "pinctrl", the test CONFIG_IS_ENABLED(PINCONF_RECURSIVE) need to
> be removed for this driver.
>=20
> This correct a regression introduced because the same patch is
> applied twice times in u-boot-dm branch:
> - commit e878b53a79d1 ("dm: pinctrl: introduce PINCONF_RECURSIVE
>   option")
> - commit c20851b3d850 ("dm: pinctrl: introduce PINCONF_RECURSIVE
>   option")
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--2qwbT0JTInWqknst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl2t6jgACgkQh/n2NdMd
dlLe6xAAik0jpULJ9T75AV4/Q4Db0sONS9bIBA6oUP3Jmlndana7aZ/jPXmBlcZo
APi5938LFuWxV2CRRFroV2aZridpx4hPTCMS5sc3hMUtWJcm8Dh6fzOb2kQ/bNe5
LjV5z4JfinohEDlT8u/NxmgezwmZ6K1fcp2aIfyIM7y27F9V2jyltCzTfI8Ai4Jw
3I9YwmJAQI11uosSVrKJaKjXFMpqHv/dS0q4b/ubJg170Z2aDJFNufFDJeOhixI5
L/FgQdkt7I7MrV1r9WtuVsFEXQc363wUm+JzzLW9IyuSdZpuH/bjCZGN/q7P3Nd+
7Eewp/RR5LoJX1TVfcg6U4SA3IEiKx3S+AhNvuCkYnPFJpvw1UmHO3Ym6Yak6eZp
gQGgo/kmYLNTzI188X2oTkb4961d0XJ+RwHvO/WB1p5///NFR8GQFKak8zOpGhYU
YxLUamfGomkTUlZwO+oFGEXDRfdSWHb//TKMU8XMyf5pzzSOZIbW//SnF9+d7byN
/3enCzO847r1KBsVZFPOPnAWr15He20RCmlRKZq/Acmdi9Ao340ahNXcEy5fMHag
l68QOxXSYgj3AqgpxSmRbuYKyGP3Ck/aNJJqzQelG8fnYcW8CFv3V6nhmOnM2hMw
tR4WZ9Iv/38of1YDUFniA2I16eYxUhVTGxpt3Hxidm3YnGohR6U=
=o7xl
-----END PGP SIGNATURE-----

--2qwbT0JTInWqknst--

--===============8201321298439731368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8201321298439731368==--
