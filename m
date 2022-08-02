Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB133587C80
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Aug 2022 14:36:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70B32C0D2C0;
	Tue,  2 Aug 2022 12:36:09 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5CCAC03FC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Aug 2022 12:36:07 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id e12so7876860qkl.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Aug 2022 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Lz90lCN8jAVzUZdo9A1EZi4JdRB+yaPxCe9oVnFN5ks=;
 b=RnHyMxszJJ7GGWALbgImYDTqu6JJYd+QsWBK+IGpf/LGvz6ZeFoH165sAhPhzTDwJ4
 dtVOUwrFbCi9StCMzyNbE+RGtvdWl3497A1UnzSN/Wgx1BWJy6by7eFk0ncrbkfGqOR6
 usPUOncNDum4UDDU17R8wyeXcoAq/5LkwIdus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lz90lCN8jAVzUZdo9A1EZi4JdRB+yaPxCe9oVnFN5ks=;
 b=Li0OaPq9cSa9Qm10dXUgYOUrbayNBPNy0q1m6Bzoik1SAVaqL01jKgqCkrQuH2yOSS
 LbGoVZzefbN5zNdiGwJWJtsCZqrrYpkmfBhyZ8sjmouUESo4bfHoYsZXkjXXIf9+Hmqj
 kU5h0DFo0ZX/OFVDII4XQjIhBHmLoiT4OPttf6nfRvX2qVHJA72DOhiskr/lkdWKmfaA
 FJqqT7BZvILm4NkDyi5Gp1Q54IDh0tKRa91YG4O4SXOV4665DWLik6L00lQJdK80jFU6
 sa2R0elMuFBURmKPTbnIJMZUHvexK/4GXZvSTn5txcP8jWz/k+g6RdNt8wuuPFZV1eyX
 bW4A==
X-Gm-Message-State: ACgBeo1R4Ijec7N5+5aHLpyBQVfcwyE89+/rBHALzf6VVXgZS4aCldg/
 UMoUfJS52cNNAQ+od8bSX/AMpg==
X-Google-Smtp-Source: AA6agR5PfGOIYUrCJL8gcHxdAMyQtliT4ZgECmvmm8NJ3sLx9dm0c53XbmWmtsgl/DDXw3BsE6Hl2A==
X-Received: by 2002:a05:620a:2a16:b0:6b8:cd40:7049 with SMTP id
 o22-20020a05620a2a1600b006b8cd407049mr1741317qkp.360.1659443766732; 
 Tue, 02 Aug 2022 05:36:06 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 h6-20020ac846c6000000b0033b6f4895afsm445621qto.42.2022.08.02.05.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 05:36:06 -0700 (PDT)
Date: Tue, 2 Aug 2022 08:36:04 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220802123604.GK1146598@bill-the-cat>
References: <20220802082135.271308-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220802082135.271308-1-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH] lmb: Fix LMB_MEMORY_REGIONS flag usage
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
Content-Type: multipart/mixed; boundary="===============3147598390291899644=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3147598390291899644==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dUJjq503+dRsiN0s"
Content-Disposition: inline


--dUJjq503+dRsiN0s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 10:21:35AM +0200, Patrice Chotard wrote:

> This patch is fixing a broken boot observed on stm32mp157c-dk2 board.
>=20
> IS_ENABLED macro should be used to check if a compilation flag is set
> to "y" or "m".
> LMB_MEMORY_REGIONS is set to a numerical value, IS_ENABLED macro is not
> suitable in this case.
>=20
> Fixes: 7c1860fce4e3 ("lmb: Fix lmb property's defination under struct lmb=
")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

And I'll pick this up in a bit, thanks.

--=20
Tom

--dUJjq503+dRsiN0s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmLpGikACgkQFHw5/5Y0
tyz/HQv8Cw8q430OUSi9e8zrKvaeOHNAOWdxxBDCDcjHT9vr4gCrjERdzEJEYpIr
sP70XcC1Vyg0twzdEDAUwWzKsnmzVQQC8dW4JwnVYQpYclZoZeNH2A9QWF1xb+LB
7fEzxfWq588yWW811UaIICaRHECq8+AOOJAB4XX48ru59zBFlYOXJ2huH4/7Y5qg
Lg32FWQvI/7gjLURmHWrs47toM+XaSdmbLsu3SoXzkPOQ3k2EaZYvLY19fRocxQu
TPtwZA4kGW7ytqScSTUnDYUGqdJWDoWYYc6nzVmafIQKZr6ViNIaRmqJZO1l+BSs
Muk8clnV9+GPOaVp/oQcbwh54w2dKiPHNWAXoUlTb0WMEGgMZ7MauxKDjnrhIYj1
fZOwWCxEWJRjCWQoceYZaOpPgAvcqYtJ87cqya+9QVgLF37RU4L3Q+B2upGtAPFo
E69uLUWJQXXD3CGSVZVtbb0wV0kb4YXJAWlkiEQN6HxmRFE6dyAxHe4whl/TH1QD
2uk9wfK/
=KboU
-----END PGP SIGNATURE-----

--dUJjq503+dRsiN0s--

--===============3147598390291899644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3147598390291899644==--
