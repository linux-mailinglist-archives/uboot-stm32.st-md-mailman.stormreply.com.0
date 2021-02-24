Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F00BF323E74
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 14:43:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA035C57B58;
	Wed, 24 Feb 2021 13:43:03 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 337ECC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 13:43:02 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id f17so2095975qkl.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 05:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=moZ/cRc7YaoTMcyompL5UKfFS1uKenCrRFhSkzjhwkE=;
 b=HUKwBPkc6guZhwfKBpBRLMnFNgTRiQ1TKugUT0jXt76V1U+K/UXOU3yAVk/K/E5fkB
 AHyTjMM422cwAIgo6alOfv3yEFV5oL4HUqBUsljOqXIR2toVF9tYdXZJ3zcNO0Y5KyrP
 i8RVaXy76flR3jO740/fzbqU+gcoe8QJ5Eb/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=moZ/cRc7YaoTMcyompL5UKfFS1uKenCrRFhSkzjhwkE=;
 b=r6YOhvBBCXiwtn7wgkmbNDK5UhtlBWTZ+8Nx5/zn8q+9qNsy6ClRKM6PIU35W7Kq/r
 Cjqc7La/7o2iESkefuwlMmLHYPqAkC6mN4eZkHLmAiQympRxGKzG2PVEySiww3eKbYuT
 PvHuReqEv/MArJl4z9Nvo6SY/A6nQJKRcY28BUnjnJfS/w99Gm3XCTLLL3s0siHhyRG7
 064zcVb+PoXzL1Xu/HkT5oU8bXBiXwX6Q1J/m1RSGx9pivmcaWKGAEMiZhnjwNoaWqJT
 zT5xDFWvIdzll1TZvYUKukA4VWcp6eAenLSaGOtARXlN06xkOy03f/tA6CJj046ppp8F
 p/UA==
X-Gm-Message-State: AOAM5333YJxsPEN7GEc2a/xU/k4DM9/uVl7mFtd3S+zznVOdZNCze/+d
 7Q9KbrZzHPxB5RBGMqdLYL19OQ==
X-Google-Smtp-Source: ABdhPJyU7NffsRCk+w+rPUOipGcxIJqjSLZtd8rMHLSnKZ04EiM3B7CLT0/VmAI4ngWcmyQboyq9Hg==
X-Received: by 2002:a37:794:: with SMTP id 142mr30699946qkh.108.1614174181017; 
 Wed, 24 Feb 2021 05:43:01 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-359f-2326-aa06-4d35.res6.spectrum.com.
 [2603:6081:7b07:927a:359f:2326:aa06:4d35])
 by smtp.gmail.com with ESMTPSA id k26sm1427337qkj.131.2021.02.24.05.42.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Feb 2021 05:42:59 -0800 (PST)
Date: Wed, 24 Feb 2021 08:42:57 -0500
From: Tom Rini <trini@konsulko.com>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20210224134257.GJ10169@bill-the-cat>
References: <20210224121904.13927-1-xypron.glpk@gmx.de>
 <CAEUhbmV-ie_-G=jASQNDQ26VO78jQXX5D-wQUJPp3psWS67snQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEUhbmV-ie_-G=jASQNDQ26VO78jQXX5D-wQUJPp3psWS67snQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Bin Meng <bin.meng@windriver.com>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Weijie Gao <weijie.gao@mediatek.com>,
 Marek Vasut <marek.vasut@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Wolfgang Denk <wd@denx.de>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] Correct U-Boot upstream repository
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
Content-Type: multipart/mixed; boundary="===============0804305563487408264=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0804305563487408264==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xkNb03ROHe2/B3kn"
Content-Disposition: inline


--xkNb03ROHe2/B3kn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 09:17:46PM +0800, Bin Meng wrote:
> Hi Heinrich,
>=20
> On Wed, Feb 24, 2021 at 8:20 PM Heinrich Schuchardt <xypron.glpk@gmx.de> =
wrote:
> >
> > The U-Boot source moves to https://source.denx.de/u-boot/u-boot.git
> > effective 2021-02-28.
>=20
> Where is this information posted?

https://lists.denx.de/pipermail/u-boot/2021-February/442175.html

Which yes, we need to figure out how to get more widely seen most
likely.

--=20
Tom

--xkNb03ROHe2/B3kn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA2V90ACgkQFHw5/5Y0
tywVGgwAnlILq99hKgmKncqmBtAJ5qv824Hd9/nT6UK4qftfbjdWs0+APlKYRQ8K
5UNrQixLGJ+5Gg1gAOekl+8fXH+K1TvMF9VvQLlToV3w03NfVph1WaVTN+0iyE6L
+IPhpgOatj6z5o2/QRKmLFCP9RrkRjynDPBXC/ldaGzaPogxUj0z+VM4opn42aou
qXV9wAVOGrJ7E+8K8+2EkKuSDyBf/9ZtaM7ZyV/6pUiD7IWA2NW0IJiFM8wZzg4z
SMOGOB7gGNXQCG3el+U9y0IAW7uo+rYTYUoNSBACoOyrW3k7cFpDy6W25BoagOYY
DU7dVdFzWaPDRm/gwTli87RLLYRU99xW3rScJvGL2XBRRsHkfMuDpkugaHchUEZE
ssNEYNJGC/BIY1fPmQgLTnor5qR6Qy+DbYiZHaXCyi5YLb8cy4diqw2BfYQxRqnq
nTozDEz2+0E7fsGjwBvW7n1aGbTFbBRNV7y6IwqCwdcb0a86YKx7j1pkNC5hlESc
T4WECIt3
=IQxo
-----END PGP SIGNATURE-----

--xkNb03ROHe2/B3kn--

--===============0804305563487408264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0804305563487408264==--
