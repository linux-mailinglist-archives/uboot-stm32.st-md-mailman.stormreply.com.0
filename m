Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA1297CEE
	for <lists+uboot-stm32@lfdr.de>; Sat, 24 Oct 2020 16:51:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24E87C424BD;
	Sat, 24 Oct 2020 14:51:27 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BAB6C424BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Oct 2020 14:51:26 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id g13so2307306qvu.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Oct 2020 07:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oHNUog1EBWPScOG59alMk9N3Pwt+OMpXAlw7lc24Ywk=;
 b=PTMsV0DiJGsqgrSETlKNGYzjT2VESW6nT6OKYgP5dDZTaAs8DEJdw0wqZt3bOUz8v8
 7P2DsVafVRDYd5IqhzGhN4YMt61gVYbUgyPkz+RmAzQefkntUPxiBScVQBygCXArkYOI
 1ijWryjbTX5clX8Ulwk69taYWo1bNtR3Ii2iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oHNUog1EBWPScOG59alMk9N3Pwt+OMpXAlw7lc24Ywk=;
 b=oGlwwiSBU4r3dH7cl0EapAHc0s8AQddNLdpdry2Ny7Y4gVx296ap/Tbt9Nw4qL1heF
 6yo2e9bensVhxWfgGrnTjDbqpVfy5yEj0uZh9VRB1B/5IrQ5YiF6yRgasGGGiuRgiNOx
 zyy0OBhvsk9i1lQuh6iI4kixmGbZo0TdS1rbntoy5bOPHtRCMnl1Ub8ck5jxbOuQppNn
 VIVRACGps4wUcGx4OqLOWR3lQX7hrYp7Ra8xsgcdjGuKrgKGXyNVwDgjHfqdUFUFsKUP
 XQo6MbeMpWQyCbiQ5jj4zjCVr3hdcvds4H6i6Er+dTp7WXudfQuR9UUHxYWF+gWxEXcQ
 juKw==
X-Gm-Message-State: AOAM530s1i4/w1XJDuBSWJ3seFjQ2cN+407I0Ke6HkQyNAoObAKclwuU
 dSmEyRiNex3C61/IAIYInuY0uA==
X-Google-Smtp-Source: ABdhPJwHCWA9K9h+w/XVjsS/DjVw+HTbjdj6Q6DNBjxvyCrutNHWg+8OxkM1yW1wto+mSQ3nowONgw==
X-Received: by 2002:ad4:42ad:: with SMTP id e13mr4577792qvr.59.1603551085008; 
 Sat, 24 Oct 2020 07:51:25 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-9c01-c4e4-7778-4869.inf6.spectrum.com.
 [2606:a000:1401:8ebe:9c01:c4e4:7778:4869])
 by smtp.gmail.com with ESMTPSA id g24sm2855003qka.111.2020.10.24.07.51.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 24 Oct 2020 07:51:24 -0700 (PDT)
Date: Sat, 24 Oct 2020 10:51:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201024145122.GA14816@bill-the-cat>
References: <20200910161817.27535-1-patrick.delaunay@st.com>
 <20200910161817.27535-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200910161817.27535-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] power: regulator: gpio-regulator:
 Convert to use APIs which support live DT
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
Content-Type: multipart/mixed; boundary="===============3080907220909584837=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3080907220909584837==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="51SZQaDsYVTzMqCo"
Content-Disposition: inline


--51SZQaDsYVTzMqCo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 06:18:17PM +0200, Patrick Delaunay wrote:

> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--51SZQaDsYVTzMqCo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+UP2oACgkQFHw5/5Y0
tyzOigv/QTmFJkcJkBdLqRfXATlk7owdF//TJV5gOQKTFaE9xN0b1x5EAr2Q3m22
3LmvPBkkZfkTnM4NqBy3CRUM4kb9Uw8rd55F3C64vizwleh7d8rjcNpL+xYr07kP
3fUai2YJe6KRoRCQDyv15R8QiAeYooG3U5OhUdbHis//vBXFnrgw8ZXnxIIasZ46
1Y/1NaX7nof3R8PGqwoJTx7dbc+1Io/6FY9idh6Vj9DjYm/5gtGPbT+Nw8pEg9KN
zAIGwy61iUPwU4okBNTF8HRnxvCtGEG07I1CwwnaYMpeaCZtrESoiNORML41JhGF
dAWJPqLXfrid/k6JyJkAcdaAdrYUHN7gcfppb4ZKbfz+l9sLgppnoF0aHU2Ej0ss
OIPnNpqQ/S+H4PSJt7olXhXCtzr/aDxmsPuyKPLHo2jG3GLgbAqYseEwYTlwrtun
LNXzJOf1+gC4GgCmjtn9SbFXnY4/ec7AFhjAUSLP6reVkfa94hLZgqXyh8CbWgzZ
yw+r3YmV
=sWYj
-----END PGP SIGNATURE-----

--51SZQaDsYVTzMqCo--

--===============3080907220909584837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3080907220909584837==--
