Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE264A997
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 22:35:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F051C65E74;
	Mon, 12 Dec 2022 21:35:03 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FE16C65047
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 21:35:02 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id ay32so10200191qtb.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 13:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E77/hAY8muHuh2o3jkciiUm76QsUFhcAUvFIb+fbyxY=;
 b=HpPZqZ7/d9zZDtgi1t/lNzPxhL68f37D1z+oNlNcu3XdfoNWXFuB+8LpNH+Zb8mAmF
 FCFWH7AngDE71FT3Kg5mD7xOvHPXsbaW9nO4pLWwcb2kp77ihjyx0Dq/ieOpzNExzXmp
 tMhh1yikFdNIaDgGby1A3+ois2kg/7SRR2bng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E77/hAY8muHuh2o3jkciiUm76QsUFhcAUvFIb+fbyxY=;
 b=Jzc3wKVsLIdqBtOgxTD1Ho5XUJ4R7yZeM0GHLAtkdfY2d+OcSnGd/T3Hzhmi4rUB+O
 VPnBgUBSIpw3R2i4dA8aadTIU0IahYwGnzUsK9Mz+AFH5qfV9IzlrBTuI6FihJ2Wcb78
 BVy4llkYiJDIH+pA1hOReTmROds47rSUBWhayXMK8Xwvwux+aQsu5GE8gZYiKarKfrKF
 dEQokgeUf7elEiF0APogInxXgcazZ7bLjQlMGd4ayfmMtpUQZxOqYjcbrCL1iROxkxut
 L4QIc3zSq4kucLUax2gutptb6oNym+Hz56vzwPA3kVydhVOeWGrVOvaVLA0a7xbcOlq6
 MOUg==
X-Gm-Message-State: ANoB5plikEkpZVsr5f5D/BqeUo6hlbzEtGY39cR2T18IDv3IDlsvGuNE
 NhyPEotSIvd+SgnTD3AV6MzzKw==
X-Google-Smtp-Source: AA0mqf5KmF7MmbqjeFGU79MzV/tQTEsnasQHFF8lEYIP+NOR0ZH0kafWIXTnxg06ZPRtrOcz/Mf1SQ==
X-Received: by 2002:ac8:6714:0:b0:3a5:fbfc:e3dd with SMTP id
 e20-20020ac86714000000b003a5fbfce3ddmr1005768qtp.18.1670880901083; 
 Mon, 12 Dec 2022 13:35:01 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-8c5e-02dc-44a6-fa90.res6.spectrum.com.
 [2603:6081:7b00:6400:8c5e:2dc:44a6:fa90])
 by smtp.gmail.com with ESMTPSA id
 d12-20020ac8118c000000b0039492d503cdsm6362854qtj.51.2022.12.12.13.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 13:35:00 -0800 (PST)
Date: Mon, 12 Dec 2022 16:34:58 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20221212213458.GG3787616@bill-the-cat>
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <20221028110055.3.I4bb4d81ec61fcc6340db1f81d5504905a22e90af@changeid>
MIME-Version: 1.0
In-Reply-To: <20221028110055.3.I4bb4d81ec61fcc6340db1f81d5504905a22e90af@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 u-boot@lists.denx.de, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 3/3] cmd: pxe: use strdup to copy config
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
Content-Type: multipart/mixed; boundary="===============1571084884121319343=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1571084884121319343==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2B2cjJMPDPJ+a7kE"
Content-Disposition: inline


--2B2cjJMPDPJ+a7kE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 11:01:20AM +0200, Patrick Delaunay wrote:

> Replace malloc and strcpy by strdup in
> function parse_label_kernel.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied to u-boot/next, thanks!

--=20
Tom

--2B2cjJMPDPJ+a7kE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOXnoIACgkQFHw5/5Y0
tywXBwv9GUFJRmXwRs1V+TjgQFKKegvUxnrl78bmSXxzLpODlstsU4yyiet7gVKO
q5+yCj11yxmTQY/5Wi7aey3LyMMcPPydAF65h8e7SyDcvjYZKvAcJz/QJSxmAYmz
Wr5XpbHmfjiGHYQz5UJNtZfBWVXAIF3kIw38NO021/v7EVm5dTwot37tII4zRrqE
jTXA3/ucumrFK1/ni4eGOCYDX2iyI2jXRwmo0bkq3TNCTQyR0UDWCHjEVwU8kaAm
o9sgwzdUF8+GytRlE4S6d6WDlxQOLPAGhObcYpz1F1hmYGBxl6lMB9Kfd9hiTJRv
PqDXsf/WjH9Gi2HfBtrrryPDeVz6A2BgvYTvOGHLuycwk5acIcjG4BJGOhNCYRYa
ZyMqnJInLVJXGI6f1Gat9ePWzIdncDRF2bMyiUumsXqbN96BsMJmRuxPeIHuSDyu
cOlKpJlFXVslX/GMR9QbzLHKApyRR7XvJUkDtS9MvsRSXfPsBm3lgpbuaQb+OWPW
XB/IQau2
=pxKQ
-----END PGP SIGNATURE-----

--2B2cjJMPDPJ+a7kE--

--===============1571084884121319343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1571084884121319343==--
