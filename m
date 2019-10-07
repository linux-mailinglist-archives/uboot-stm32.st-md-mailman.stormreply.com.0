Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F92CEF21
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Oct 2019 00:36:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E2D5C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 22:36:57 +0000 (UTC)
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1C30C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 22:36:55 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id r134so5760607ywg.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Oct 2019 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QQHdymAN3OyaXdmZCZwLj77P/DHPeZLbdSbAri2Rj9I=;
 b=m20qjY8RvfCNogh7HsHY4YDdZ8bGZcG3lR3vSHiCLFweI/mjMdNKsRGdxIJdxpF1hF
 pDdnBOomQtlKusBarrPsdLaL2bM814ffaCNR7qyBJgYeg8v2MO6+hXO9PZzmvoENRiZV
 JT3Ur/udJ0mgiSjEJrmjJjFqZHHl5UBV1pnuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QQHdymAN3OyaXdmZCZwLj77P/DHPeZLbdSbAri2Rj9I=;
 b=hoTbcT1Y+EeDq+dayoQsHkpRsnJj/ieT77J6ZZ5W4e/Y6S4VheoNNWYGtI7voJP/B6
 IEYwqTKFPd6WTgSOZYsyCkMciYZx95WyWxYUuL2yDwMiFTudhWFC4HEQpLjyWVUjeB1w
 gozsd1ukOXbmjJEMsWykgvsxBUvdHpWf5xuJJ33Wo7EuXxfiEnwVhgIvjlM6M9TkfAMi
 8pakLjLwym88M6xvfNwAuMZfXSBclRBJZDqXO6D4hZcI8X82VBaIEN1F7cWhy0xOd4Y9
 ydJH/t/BxO5Ez1tfpYs+fXyzFfVeSeyUo2Tvj/WnqubK2K0s2+cX7swN94tdisq/TGM/
 wSuA==
X-Gm-Message-State: APjAAAUsGDpQXy+FNb/INEQHAp2+mtbnpwwD3h0kHTXp5W6xHN7Agq/d
 7EtXQHBJ7DriQSxMZTBCROO9qg==
X-Google-Smtp-Source: APXvYqzqO1jhoIEz+XBvDvzxMpLxRCyIKgPOYg5JQpl31xJq2Rp1tj8gzLl0n2sDCzTINgk/dIfLMQ==
X-Received: by 2002:a0d:e802:: with SMTP id r2mr20712331ywe.109.1570487814549; 
 Mon, 07 Oct 2019 15:36:54 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id x12sm4330578ywj.87.2019.10.07.15.36.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Oct 2019 15:36:53 -0700 (PDT)
Date: Mon, 7 Oct 2019 18:36:50 -0400
From: Tom Rini <trini@konsulko.com>
To: Wolfgang Denk <wd@denx.de>
Message-ID: <20191007223650.GR6716@bill-the-cat>
References: <20191003072428.19197-1-patrick.delaunay@st.com>
 <20191007175635.D9824240044@gemini.denx.de>
MIME-Version: 1.0
In-Reply-To: <20191007175635.D9824240044@gemini.denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Lukasz Majewski <lukma@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Ash Charles <ash@gumstix.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam Ford <aford173@gmail.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/3] env: Add CONFIG_ENV_FULL_SUPPORT
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
Content-Type: multipart/mixed; boundary="===============2052284651571490585=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2052284651571490585==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3wfpuDtTLg8/Vq6g"
Content-Disposition: inline


--3wfpuDtTLg8/Vq6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2019 at 07:56:35PM +0200, Wolfgang Denk wrote:
> Dear Patrick,
>=20
> In message <20191003072428.19197-1-patrick.delaunay@st.com> you wrote:
> >=20
> > This patchset follow
> >   http://patchwork.ozlabs.org/project/uboot/list/?series=3D131268&state=
=3D*
> >
> > It follow the first proposal
> >   http://patchwork.ozlabs.org/project/uboot/list/?series=3D129339
> >   "env: Add CONFIG_ENV_SUPPORT"
>=20
> Do I understand correctly that all of this is obsolete and no longer
> needed after Tom's commit d90fc9c3de ``Revert "env: solve
> compilation error in SPL"'' ?

So, I think there's a new topic here.  I seem to recall a concern from
the previous thread that we could have less restrictive environment
protections in SPL/TPL than we do in full U-Boot and thus open ourselves
to a potential problem.  As of today, U-Boot is back to where it was
prior to the problematic patch being applied.  But do we not have the
potential problem above and thus need to evaluate the rest of the
series (as the revert was largely the same as the first patch in the
series) ?  Thanks!

--=20
Tom

--3wfpuDtTLg8/Vq6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl2bvfYACgkQh/n2NdMd
dlI6ww//cMzuu1j1ZlX2sOgb1Xmt/CqWuIYC4lkx9MylOuNZBrSBoKJooWu3S8xE
RvXC82Dd8pgjn4FEnt80yaaHuY7OVw4PaN4AIcJW1dG7VOwUTCgI/KMtXDQrIOEe
Y+Yt9LztsZzOQpMMHGUxyMmssFkKlyQHMdQzZRxNKJEdJK54y0J0LyvPbad/M8NU
HN85KvbBRDyWaie2s2w6Tx29vh1XK+Aeh3uVySx8WhehKKI+oP4xEkh/kAYEdaQM
5h1J3WqIeKWYFKEbRV/3SSLm532Vud0SqsiWYitFHugoHGrpD5158BCwIIU6KGoT
oX6t6LeUajDdMhcDEKU7eT94Pc7xcdpz/tB6GhrnG+1pFqzyfLTtYho3W5Rqpf5X
LU662Uh0i6ZY+306UJwktvpojEC0Monlj6IuJTp/IPIQ2kqB1KcgzVgPcP5dfb80
KHemHgkZ9/3lkxW+URqFFNXjYa8RX3/TbbzkO/A5Lp8bEzFycGutswyx/nuEk+ao
91cRDvcjKcI1jiKW/dNSaa52LImAFnYWsUE+54LupvgGSFIXwJ+/WXq7yADE0xgQ
lvo4D1SSTqxUykM0+qRwHr1fL5Llkj0mD9FvVw7h51pG39pQMoUknkmBZSg8cy1a
G5ARK4Qp9/e9G4apA3uONd8hH7rbcSZvpozOH6I5iT4m4BNUy/U=
=3wz/
-----END PGP SIGNATURE-----

--3wfpuDtTLg8/Vq6g--

--===============2052284651571490585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2052284651571490585==--
