Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B21EA466351
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Dec 2021 13:14:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54F30C5F1D4;
	Thu,  2 Dec 2021 12:14:41 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23C2FC5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 12:14:40 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id i9so34396250qki.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 04:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xvwregs1x0MoaZrVBjHe/J/21qFYixXgBm3FxblL3YA=;
 b=dZta8oxRWEd6HE3l0MYnfR9dlhZEwFRYmXpspf/A2bC2odRUWJ5LOHkLwChJtbCthh
 tUy4DpNr8r7105wt7GKZh4ycQG8R1o18z+532itTdpiSucLewYsANE7oBtfCjemQXxcC
 9DCaPhNVrSznjzxj7LSqhftO4wYO96wvF0G8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xvwregs1x0MoaZrVBjHe/J/21qFYixXgBm3FxblL3YA=;
 b=6Ab6CvJoWScVeshvY8VbtMELd0Apk73Wqlad1grt71Buyw6b0+EA/nxb1LSfCFEkkI
 b3Th9hFt5D2WyvrPnqGLnf49NqSiOagFSLe/CoVOu0GBXCn2LkwzKtMqdg0X7T6hCkAg
 ZZ95b0e7X5KwwUuavv/QYxqvCG6TNLGcy3mzhDa/azEA+Fb0BtmFw02Jw6UTOX4iS8DW
 dKjh3NVCYlMS3cE2SjiM5MUtY+4KmESh7Q+gFXCP5dQ535efhai9xn3OtGJYzXvLuJpJ
 mddJ9emHOpHUelnhlBJVXGCxETqhPcryBtrShLuKLdCoF/BdD38NbqlLlLlvp3QjFZUv
 r6sw==
X-Gm-Message-State: AOAM5305Rrn2kkRoGPo8Yc1YGQr6ZGIU4F9M0LPv6xR7tRfpQcNgJN8V
 RMW5r6OiIDMtwjo7aX4Gp3BXmQ==
X-Google-Smtp-Source: ABdhPJyT61o81KV6H+TyEg8bZ9urSY6ALZULUZJMcCPTvGBDtqkrgECpQZ6ilDca0rl7r0nMKm83pA==
X-Received: by 2002:a37:a1c1:: with SMTP id
 k184mr11815502qke.383.1638447279115; 
 Thu, 02 Dec 2021 04:14:39 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-c825-72b9-4e49-4490.res6.spectrum.com.
 [2603:6081:7b01:cbda:c825:72b9:4e49:4490])
 by smtp.gmail.com with ESMTPSA id ay42sm1380052qkb.40.2021.12.02.04.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 04:14:38 -0800 (PST)
Date: Thu, 2 Dec 2021 07:14:36 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211202121436.GO1220664@bill-the-cat>
References: <20211108102034.1.I5bb33aa84680ff548976f04f18cafca7ebb0ec91@changeid>
MIME-Version: 1.0
In-Reply-To: <20211108102034.1.I5bb33aa84680ff548976f04f18cafca7ebb0ec91@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 1/2] scripts: remove CONFIG_IS_ENABLED and
 CONFIG_VAL in generated u_boot.cfg
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
Content-Type: multipart/mixed; boundary="===============4665434387076757112=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4665434387076757112==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/t6ASE28jIy1gGy9"
Content-Disposition: inline


--/t6ASE28jIy1gGy9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 08, 2021 at 10:21:21AM +0100, Patrick Delaunay wrote:

> The two helpers macros CONFIG_IS_ENABLED and CONFIG_VAL are defined in
> include/linux/kconfig.h but they are not real configurations; they can
> be safely removed in the generated configuration file "u-boot.cfg".
>=20
> This patch simplifies the comparison of this U-Boot configuration file.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Acked-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/next, thanks!

--=20
Tom

--/t6ASE28jIy1gGy9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGouKwACgkQFHw5/5Y0
tyz3NgwAjTPWhRSP68BIiwWImsbG3hE+1Mq6Llkbl4EXUQfS0Qx86bzdAheBNBSQ
xL3vNo2QVWCzOacdKiyaJ6T53bIXnky9qyZKX4I/6eOxkczbpLB/8ywJTbzruTcu
3t7X8CKiJ9bgdHIx1Sp4loxU/1CldXrqqrcq2DhhYNtnO8zcnjkRmN3pcxxSap2q
3SHkP1YZ+TpnTiCDsIgkiVX+ZMHKTE7k5BbuYiLpD5Lj8GUv5oR9b5zYWnTSSohP
O8tZC7kmh69fYz+qZzHjSXZRqZZrq8lziBY2qNdhkICttCs+Bpd/x9NIQjSOTAx2
I1x+yNtWa/eccya2fMZ13xmqEA+po6nkJk9/0zR8Ce0wyXHEakz3c8A7NCLDWzL5
K+s3sJG5ZB22/bf8C6Kvs6Ck7rWjl0mcGlwzrgnnz+1DzIxwXEwK81au/0bTMhmb
tfdYQVI8Jk3foz+83np1p8mBdhwoT5XvAVDMN9EzvWAHKxymZK5tZRIp+sQmliEV
mc5dIho6
=9xtE
-----END PGP SIGNATURE-----

--/t6ASE28jIy1gGy9--

--===============4665434387076757112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4665434387076757112==--
