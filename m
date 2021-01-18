Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EF2FA094
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Jan 2021 14:01:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D37BAC3089F;
	Mon, 18 Jan 2021 13:01:18 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18494C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 13:01:17 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id h13so7434504qvo.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 05:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HgttyfOUtH+cXwnu3T2QpAeY6gHq7B7xA06q/Ocmy6Y=;
 b=j84KvS9U3aspPbXDYuarrMeCtAEUBcxJ9zKaEZjvyv4FaAca2f8HDR85CSPkNzQkOL
 JYy0g1GfzzwH3FcGb7dHrkg60+BsoTkxf0v+DNW9eraFAw14pJeOE4lYpdq6m3LvsOb8
 kKyOwzVd9/Shko3RPcJGUrLtbZdL9MevfyrO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HgttyfOUtH+cXwnu3T2QpAeY6gHq7B7xA06q/Ocmy6Y=;
 b=TXOKuSUVtXBkh2CQsUNV8VKnIX37nxS4H60Rvq14wkgb2nyBvxKzg4DbHbQMoBCUKp
 xoVR9ZM9L802ltFo/vPwiJq1opais7DKA4/XqcNb3P1j7uBgYQJeEzjc8Cn4tITCDTny
 hhCve2WLCQu3LkRjWalhxkHaokQUL7qiMmTALNzjgKclSYE/yV7zcAYd7q99GPrJLS4z
 dxp+jRLwY1Zj6cwNpQv5XnV4O2Wu8V+es9R7JtxXV7whmMuu6SdyV6wzHAEkescJ6xTa
 Kj/bMNf1e29mW+VtFKUJjTYo4vJNwDd2Iiqr4Aw7Qb/bq4w1a3C8OTgroR10S0gTgQxT
 JLjg==
X-Gm-Message-State: AOAM533ybP6Z8y7248z+qB9/5P33E/ivjWoPCX3pKiVrWVZG/ILc9mHY
 pkxuW671De64tqZiVLIzQYK+6g==
X-Google-Smtp-Source: ABdhPJwEV3NcM96aorwT9N6ViEwFGwkx0ilwVpj1OWeryt2HFz2d5M9b4cofPpIMDJ4mtpkrxvEJWA==
X-Received: by 2002:a0c:db0d:: with SMTP id d13mr23581212qvk.34.1610974875997; 
 Mon, 18 Jan 2021 05:01:15 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-71d2-022a-d5fa-e283.res6.spectrum.com.
 [2603:6081:7b42:3f4c:71d2:22a:d5fa:e283])
 by smtp.gmail.com with ESMTPSA id n36sm10021577qte.71.2021.01.18.05.01.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 05:01:15 -0800 (PST)
Date: Mon, 18 Jan 2021 08:01:13 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210118130113.GT9782@bill-the-cat>
References: <20201202151553.1.I4114af6c3678fdd5bccc69f141dca0b7f30ccc92@changeid>
MIME-Version: 1.0
In-Reply-To: <20201202151553.1.I4114af6c3678fdd5bccc69f141dca0b7f30ccc92@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] console: cosmetics: remove #if 0
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
Content-Type: multipart/mixed; boundary="===============6587479845349127512=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6587479845349127512==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LNhbokj4cPIz1G/l"
Content-Disposition: inline


--LNhbokj4cPIz1G/l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 03:16:13PM +0100, Patrick Delaunay wrote:

> Remove the #if 0 present since the first version of console.c
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--LNhbokj4cPIz1G/l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAFhpkACgkQFHw5/5Y0
tyxq3QwAmAd6bpHKldAZDgH0iHPqcLyCr4WP0GVvPoOyjqf65P2dgTHdr3wD257a
0bNHUpVfTz+hKLxjNXRA42+mzwIJsmRKJX2roh7uJvGDs73F7lBejmWHa5UybdbR
KCodNahAeMv9GW+NXUBLDfiQPxoG4ooL2TPCsSPPSz3BeeG76LlmidWtslFf81rN
fUJB7eWUY3E8M7WVa3nsKImksudgynDkpaw4hA6qa+2dCTjaQtLaghrhn9tmXmSq
AoqhgjHfp9M4wTxpwizSsf9gBbF1j54ULo8ghyRGd0b+TQ/mwro2RuYEP+odyYAE
0M6NJiIIB+IC+8R+7ZQ8cLFGwFJcTh4Xh6vpdTSi1qqWLoovppMX6AUxoUkgdB06
1GQmLKBI4ju+U3Ce7xf4Rh7gfhJhfUBkXV3+2r1+YNcs3NYIQ+b23ZStyGB2v4CA
Tlcy8xURu3Lo9hbjDekaFKDtBEKWiHhqEEevsp/wgAJoPXKllDG8sMhARDkY4RDB
M5Pm7voH
=U7SW
-----END PGP SIGNATURE-----

--LNhbokj4cPIz1G/l--

--===============6587479845349127512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6587479845349127512==--
