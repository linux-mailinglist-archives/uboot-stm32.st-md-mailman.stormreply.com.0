Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD10D1AE726
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A44C8C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:11 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 333B0C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:10 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id q31so1623130qvf.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6SeywJg7CXswAq5+0KsgYHskEgHltIINpUv8+JnyV5E=;
 b=RjmemFAVEUrddad8CbyB4FSSKP66rl1VgBOrOgAZv6jbnj2XkxamSeaiop2s6LjGcv
 LP/KJTEtyqY87ovDY7DO1lxuYBTpSjMuY511gpLjTeTToB1r5vRFRR4nVNshGasn9O5p
 FeYtdaV/BWcEat1mhPNYTlaCoDZFXO50ktct8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6SeywJg7CXswAq5+0KsgYHskEgHltIINpUv8+JnyV5E=;
 b=WF0x5GHVLYqTZ5CMaHQ7rB9a5up7NEYM4Odqdqaw6QpSgtFdnegsf18FBX062D9niN
 1yunUTmkKrlhLK64kED/zx1y2lRc9FMdVMUvi7D/Gn4nZ6iK4bLUszrxJE/RmTlzHJ2+
 MQQ12PZu0SbjQRvjubVZkPOTZej9R/Oo6S+YHKyW1IWlU/iRl8fp+rmcdno2Ncks3hth
 Fg5xAJA9UsKEzEoGXMFrRXK8XxnvgWVinRriF/zI6j/iwstNc6mm5T2m36EYHak+l0be
 8fxcn5kBwP8elwEovjkbjdLvkcm/X5d7r/uv5YFLhDxJFbh8USOYgMRjs/iBwMkPTkzd
 0wEA==
X-Gm-Message-State: AGi0PubwfpkIY3k9pT2kezQG3d91oxf0nlG6GlNdjXL+7UKuYMiGySoW
 toyq8OsEgWIyQ41Lnd+7Y/3ID6WbsDE=
X-Google-Smtp-Source: APiQypKXwhR/DpetO2iFlhpW0rfY5XbR/YSx8HUBPwf1NxTMeNFifHGGrHcNz7aFGWMrDsAcH8ZThA==
X-Received: by 2002:a0c:ed51:: with SMTP id v17mr4822632qvq.84.1587157568908; 
 Fri, 17 Apr 2020 14:06:08 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id v16sm2391937qkf.80.2020.04.17.14.06.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:08 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:06 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210606.GK4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-5-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-5-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 04/21] dt-bindings: gpio: document the
 new pull-up/pull-down flags
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
Content-Type: multipart/mixed; boundary="===============1084909241238688298=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1084909241238688298==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Content-Disposition: inline


--DO5DiztRLs659m5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:34:58AM +0100, Patrick Delaunay wrote:

> This commit extends the flags that can be used in GPIO specifiers to
> indicate if a pull-up resistor or pull-down resistor should be
> enabled.
>=20
> It is the backport of linux commit ede033e1e863c ('dt-bindings:
> gpio: document the new pull-up/pull-down flags')
> from Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> and integrated in v5.1-rc1
> https://github.com/torvalds/linux/commit/ede033e1e863c
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGj0ACgkQFHw5/5Y0
tywVrAwAgM3C0dnXqefVcd92agCBMdk+Ryv3L9wkVsYeOkj5AaY5KwLlfHykcBSW
QmxZpHU78g/B24HRuuVeJxn+HB+6elNV1bmWQ/4LufrB4tcRYmtj7hwoVf3CNn7E
wOyEuo6l3SQ0YwV8HDsAV7/daZEZwcMIfyuK1LpqsldLm0U463PR8fYgOjyM2Ot9
ftM8d9w9u+USTlM18u++tIXdqXbd7g+O4vyhu30RE7/HsWshAUMVgOswi2yIU5Id
wM82v9ZEscl0ZRgonaaSvPDJWnLGSmFJNRxKYv/cYhf5/8OR9t0Uvl/phlsxB4vW
txFrZBl3BpGKtYhOgeBesc3ETHINQ16Q56GZq5bMWJLcvctmVtpo8RJlJ5BvJonl
DaMpOVKsg9f6QmhheNpc4xtrfG7EgP61sULSwLcgnR79MrkM+al/OPlqs6RmnCWP
U/hPiKHMhsU/7O11U0au/2GHLTSckQ99AIKYd+j6WZqN6Nd8gAHbf3qzrc6LJzfG
MnCBsV4U
=c3FQ
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--

--===============1084909241238688298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1084909241238688298==--
