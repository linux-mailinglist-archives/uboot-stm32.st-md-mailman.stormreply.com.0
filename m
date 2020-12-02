Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F752CC8CA
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 22:21:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0DCDC424C0;
	Wed,  2 Dec 2020 21:21:43 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2754BC424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 21:21:39 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id i199so179682qke.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Dec 2020 13:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iDLuZLP85fzpqkfe+yCPncDncrK/j27fFvmbsSzn/s4=;
 b=CFv7hHmoZ6vjFn4zaxTmopTC8rzVaR9BfEFu/vARYs8SbJ9q2IGReel2vTSFYL+vvp
 ndgkrQKxX7z1BaUGET6JY05E26ko5Q41NoLRRuvMQx9fcIYMhbYjz8WKTwvt6nEmBowL
 uld9iB9LVj6jF0AI2hfb/IOEhaixRGxKMGCb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iDLuZLP85fzpqkfe+yCPncDncrK/j27fFvmbsSzn/s4=;
 b=kuDgVIzHxah96OAfL4QY7h8jFDzKQJZXqHghVO5Y6IHO8RbeILXIFdajXdxhdVrl1U
 bI+5Ow7gDGIFxNsnvj+ykFiumWyKDtQH/qWfZHJAD4puZu230MB1CcDLSnRGJHNRVy/c
 DT6j2AhVi9CyhTax6VPK2bOIKV1ZKr988DnHj9FJ64BkPiI6ZvRHWkVkNBQU6qKGuV7r
 W6ibBQ9XKWuhEGXd7CHKLsUJ7P5U/hFXURAbByBODtSDw46ODBRs+Fvpspsyo0kk6+Dw
 T0LriQLFKafvXC2RVJsQBx5EC7mmzlgHtglbJLVSqOCw32DZSlUkkvZc5NkntqxVy7Cv
 Slzg==
X-Gm-Message-State: AOAM530aFjFTCWghMctNwKujOjeY3ZmV0ANkxA1XnmzMHHtPxYYwt1zS
 4RY8N+2tVnTqsmXC6a0BuO6GRg==
X-Google-Smtp-Source: ABdhPJwsVctErPX9SaT6qac8iq23qA5leYXcvLGnJNLj7utNJyt8hTiFAzQp8CdpRGOVb4Xu/rxPbQ==
X-Received: by 2002:a37:5c3:: with SMTP id 186mr4609071qkf.234.1606944098317; 
 Wed, 02 Dec 2020 13:21:38 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-135-175.ec.res.rr.com.
 [65.184.135.175])
 by smtp.gmail.com with ESMTPSA id b12sm117804qtj.12.2020.12.02.13.21.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Dec 2020 13:21:37 -0800 (PST)
Date: Wed, 2 Dec 2020 16:21:35 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201202212135.GL32272@bill-the-cat>
References: <20200909162617.31576-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200909162617.31576-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Heiko Schocher <hs@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] gpio: Convert to use APIs which support
	live DT
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
Content-Type: multipart/mixed; boundary="===============3381053471049101584=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3381053471049101584==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhcyhtwhiTBwkXGM"
Content-Disposition: inline


--zhcyhtwhiTBwkXGM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 06:26:16PM +0200, Patrick Delaunay wrote:

> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Heiko Schocher <hs@denx.de>

Applied to u-boot/next, thanks!

--=20
Tom

--zhcyhtwhiTBwkXGM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/IBV8ACgkQFHw5/5Y0
tyys7gv/Q/dYvAweZOpzU4IsGyB0nJowbQHifcdaTa1DwEx/kEqINTs0NtAcq5hm
0SukY4+8AhgFSyqrTpeydyjex41RFJlcYKKtS0Ubxl4q4S8yKIvM521IQKEu9YJ/
aaSIg/jQ0VRuXxVhs/3P1ac3VOpthm5ZoU5cbmbEOpO1kPQZX3PdxsxKXPUcysoL
3Ygox9VMhJt4eCMNeZ2PaZFOEEqEboD9v4DxotFUQD7aktfcN4qjiARrLqycu7cN
gq8nGD7+2kU5DWi+PONMV0A+2unt0Gz9FatjTQ2DmQJ7KjugXH3TRehxxBiGAiDG
y1pd5HRqCm0EmszAEgnZCr+wUvwhH3sFqJswMm9CQ7z1HDtMtiRpUnuNKI2a1AMQ
yZmd8uZz8F5uDQFC3n8iF+O6dvYyTCugQaYdxBunF50PzPfOsbUaoQujKBoPGQM8
k8SdJtQKl9syox2dVzHf/HGmx399ccQy0FsBhFU28FOrU0rpF97Xa4A413l7s5cn
s2SYvrCT
=JPpx
-----END PGP SIGNATURE-----

--zhcyhtwhiTBwkXGM--

--===============3381053471049101584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3381053471049101584==--
