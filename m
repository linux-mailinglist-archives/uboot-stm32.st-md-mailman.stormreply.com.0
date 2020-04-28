Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 980F01BC045
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 15:54:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 615A0C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 13:54:26 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC076C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 13:54:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z90so17236047qtd.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9VNeOO1It6alMmtGxfQouO6XHrdXbRA5l7nDEQ4cUtk=;
 b=AMvIQSMxqw/CFEAoQg7LgrBQGm2XevWsyv3JCLRuyZWMp3Hq+endF+2XCkmJCjwGT+
 KIHXdTGzCZgIXzP/ZMFC/sYR6jUC7QKDa8YEPVmfExdVirJIoiPQcBTnfX6cJyvmcAaJ
 j3SzLRYJ3M2QNY49QNQqGT180UezoyUuTmWkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9VNeOO1It6alMmtGxfQouO6XHrdXbRA5l7nDEQ4cUtk=;
 b=jMEX/Njyj8JPBNZTdIYfrJ667iWSJziufUBOV9fCv8sinjs5vz1Cs4wxT04tChKT/g
 vktrNi4uNejCcXOEKIKKvOCRDu4NP+yadylvfM972JfGNiBWMuuNHj0Z72T5Kj6E/aKR
 +F12azEA6t3KPh7sKh7pc0vTRLvTUjfsHSnY8K+hBvjaMJe4R9lYm9Q3lkG+j8e+OIuN
 iCgUJWT1axuG9BnQB5TTCT9KI1c4bGjAktgRbGaT/YZcXC1XWzRe3wIB9RpoqWHfTsEp
 GcZTaBJQsgt5Aw6EL39GKd3cGvIYGrClEjhUSqTz8tps0A9FXofhIa18JmvxQPB3mtS6
 HF8A==
X-Gm-Message-State: AGi0PuZBtxOP6wHmTZDOSE4lah3huBCQDkAXo0LZ8ZzSkruKVVssl3+e
 N+3GNDc5DAYNziVt1B57VZ0n8A==
X-Google-Smtp-Source: APiQypJjynggVgz/93Ijusv30oJuqM3eBQ5mraWaXITDxGoc3n9CGuE0F/1E7bfINzq6u31TFdZ9ZQ==
X-Received: by 2002:aed:2b43:: with SMTP id p61mr28707008qtd.298.1588082064564; 
 Tue, 28 Apr 2020 06:54:24 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-c4e8-427e-eef8-640c.inf6.spectrum.com.
 [2606:a000:1401:826f:c4e8:427e:eef8:640c])
 by smtp.gmail.com with ESMTPSA id s8sm12501931qtb.0.2020.04.28.06.54.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Apr 2020 06:54:23 -0700 (PDT)
Date: Tue, 28 Apr 2020 09:54:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200428135421.GP4468@bill-the-cat>
References: <20200423093845.1.Idf086bdb530238139f0066b3fecc01529d7c0b7d@changeid>
MIME-Version: 1.0
In-Reply-To: <20200423093845.1.Idf086bdb530238139f0066b3fecc01529d7c0b7d@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 Michal Simek <michal.simek@xilinx.com>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] Makefile: copy SPL_FIT_SOURCE in build
	directory
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
Content-Type: multipart/mixed; boundary="===============6784392103926097739=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6784392103926097739==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4IFtMBbmeqbTM/ox"
Content-Disposition: inline


--4IFtMBbmeqbTM/ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 09:39:08AM +0200, Patrick Delaunay wrote:

> Copy the .its source file selected by CONFIG_SPL_FIT_SOURCE
> in builddir and in a file named "u-boot.its".
>=20
> This patch avoid compilation issue when CONFIG_SPL_FIT_SOURCE is used
> and KBUILD_OUTPUT is defined, in buildman for example.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Tested-by: Marek Vasut <marex@denx.de>
> Acked-by: Marek Vasut <marex@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--4IFtMBbmeqbTM/ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6oNY0ACgkQFHw5/5Y0
tyz5bgv9Fuk9m6WRIHlPeveiJkeWIAHm0Z0ca0rj3T2U3bkZsA+UivFve2PNITkU
eYf4K+jYGgTY01VF/9ChEONWFJO3NisxFRkpiwCiiQbF4WXdPpyNo0Ig4t54AiLz
jYaAT1BxFwtcSd1X0eRJ0UcIGtthh0h6jhlUxMcddF1A966n4/n0X01M5xxAChz3
/N58+eV3cu7uCqlruUUODyFY+Namy11zcK7d7IXvQmLBnJw55+CXBN4OPrDQSY5M
i0IVYkCuL5rpglV/uK5CBmran01xzoBYzXqUT+osDFMQwefgO4OxbiQUJxizJoi3
YJZM7XNHcFAngYOLQya5ERgguvLE4n2blHY0QRIDfn4fUHU3GXT8DjLvbrY2yAjY
zduO37pph38ckUvacYK+lRfBAyv6pMKxE3x5tlalBtu2EhT9pCzZwpiAV9Q6qU8T
X3EDgeWmp47vxYZGkn6lcbxqjlDNb6Gg59w0z6MQrCAsFwIkv5K6fuSha691Trfc
w8GctHYQ
=W0KB
-----END PGP SIGNATURE-----

--4IFtMBbmeqbTM/ox--

--===============6784392103926097739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6784392103926097739==--
