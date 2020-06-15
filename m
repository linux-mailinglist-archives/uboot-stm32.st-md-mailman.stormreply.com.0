Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D71FA0D3
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 21:55:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C7B6C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 19:55:49 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3437C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 19:55:46 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w90so13659573qtd.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 12:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1TtqQbxrAQ/2DkXtT03MvoSxQkV5ER6El4/ZBhjO0uY=;
 b=qk2Wwudigto6b5Np09HtSPHUxXflnu5n7RfhBKlTJJKq1eaiSO4GCAWfLS/ZR4vPRG
 7G8uiiGah/Fhe47kIoHGETY9Hu+ih/LTwVf0hf18/WfhNdfDshqofyR1UqAm1Fk2ztVu
 cMm4ul/Mo3WIz5MmVEUwB3RQRi7ZDT4tsdSks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1TtqQbxrAQ/2DkXtT03MvoSxQkV5ER6El4/ZBhjO0uY=;
 b=GIH/SlM3MlWIj5e3fD+ujvlvqYZ7NyLhcLqAK3XloVpoSHrS8y79Y1mHzZpXCOYfJs
 aX1D5NWxapywaORWRqSQtA4RUmIRYFHl5yp+m4rHFairwvqV2XdU26CkHsWgIzgwk3vS
 uMdabKYj/tRvyphZ7Jwv06oPkJY86esQQ/AQjvvSenzqcQYLxFLr8LOyVLaVVLopzG0X
 D+DqDeHNPZex9++T3yG2nl1wWOaiQ5hDAdDzGOIUehtlAZoLwVeMQqrZHFMk153/wWFM
 cl3FbeawWjyrGjaM+axHSO8M1Zmn2Ti8iwVyMKSCpGtue0vhKQA07+CvsEZNNzl/5h7J
 vr5Q==
X-Gm-Message-State: AOAM533e+ezzA1wl9E/tNPgWETuCHhJUVvM+blNZ6PQVD3doHIpvvTKY
 3VnCCzSNfEQEIxYQCh4SL30jew==
X-Google-Smtp-Source: ABdhPJx3U+2DtlFFFltz6qM9wv9o4fIatyOeP9Pksr4n0vWLX09U00HU2XWGDICMbTAaC/QyUAYfWg==
X-Received: by 2002:ac8:7b4d:: with SMTP id m13mr18394153qtu.165.1592250945084; 
 Mon, 15 Jun 2020 12:55:45 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-e549-6d95-b852-7fe8.inf6.spectrum.com.
 [2606:a000:1401:8080:e549:6d95:b852:7fe8])
 by smtp.gmail.com with ESMTPSA id r77sm12020730qke.6.2020.06.15.12.55.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jun 2020 12:55:44 -0700 (PDT)
Date: Mon, 15 Jun 2020 15:55:42 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200615195542.GK24893@bill-the-cat>
References: <20200605092205.1.Ibab98d647c5748ec387b62823fa04035ac0afd74@changeid>
MIME-Version: 1.0
In-Reply-To: <20200605092205.1.Ibab98d647c5748ec387b62823fa04035ac0afd74@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Etienne Carriere <etienne.carriere@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] optee: fix copy of optee reserved-memory
	node
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
Content-Type: multipart/mixed; boundary="===============2719125841569121333=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2719125841569121333==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H/+f64s09DbLO2Th"
Content-Disposition: inline


--H/+f64s09DbLO2Th
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2020 at 09:22:11AM +0200, Patrick Delaunay wrote:

> From: Etienne Carriere <etienne.carriere@linaro.org>
>=20
> Fix the loop that parses FDT for a reserved memory node named "optee".
>=20
> Before this change, if at least one subnode was found in the
> reserved-memory node, the function endlessly looped since instruction
> continue returned back in the loop without updating variable subnode.
> This change fixes the issue by using a for loop.
>=20
> Fixes: 6ccb05eae01b ("image: fdt: copy possible optee nodes to a loaded d=
evicetree")
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--H/+f64s09DbLO2Th
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7n0j4ACgkQFHw5/5Y0
tyymCwv+MlpIOdynPBXwRG/NdOS2A+bUvC2+5H9zqQ/5hTvjlDgWB6T2+gahJxlZ
vLpFB7thVQUTYE4bXHZ1sVZA2Rz8PkatFBhM9MGlPEyKqSQ7/vfa9eBOp6q1QFZi
P2uxwtgvxxap/diF8MkPhssxDV+hTV/w2dxmPvZwUW41k1aghbiOYjmUwKojiwBV
rZ8pH227G/lLe/XW26wE+U5yS7Je5RyQETGuIqSjLoGU5Fg23JUPfi63GK+UU1kw
YGTQt4TKtTsXoLz49tXI41c0R4xAVaO/RLVmVBbxFPAFR8jdvW8AgA7pW5zhyIDr
xZsBYV9RUCU/KcxtbKzS2lQMuJbAOWpN/YJjv/ujWknQMBjzhB4dWXnGTmfNXbE7
8coxmUFoOX15uvUvpiWTjN/+waEIWVGHXVTWmFUfStX4jPl0laUfr9JI99M2M7/u
pB7TrFD39COpnEZANV2yk56+BIheOcRave08QEfa94/JMx3kdb240x/bq990HHys
eg76TmUj
=RDSL
-----END PGP SIGNATURE-----

--H/+f64s09DbLO2Th--

--===============2719125841569121333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2719125841569121333==--
