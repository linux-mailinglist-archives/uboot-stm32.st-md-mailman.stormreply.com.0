Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C130A23BCEE
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 17:05:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C48BC36B38
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 15:05:44 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A5C4C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 15:05:43 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id b25so31126713qto.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Aug 2020 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fVnfPZ7saYTHceIJC/nCJShffx1is2zWruJRZzMrdYA=;
 b=YW3QTNk7ssyIxeCwQd2rPlAyTPaeJQau5fXYf6AORa/aJ6+3FSCLgpc0PRwVaAihnk
 NTuBfaNigGk16FsXxEEr8jA4V+AVLXUumba2rVda/OHj4YOYgvzxOxeKhx4+ZTsHluP8
 PQdVB9ponfAGtpBJMxtSv4Sml2AzXuXQm7c+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fVnfPZ7saYTHceIJC/nCJShffx1is2zWruJRZzMrdYA=;
 b=feMp0Ww+8kue2q3KFv/k8eqLiwkznGZTLRPmLOCCaz+XCBu4elI1HUe9JPKq4PWnkU
 79IJfmDvAWUyTWfasHSIt+VzQWiumdsDY51x0sFAYtj6ZDcdfxshi9lw5yqWnRb0xD6H
 vv+kO4ZD6RyEVce32Smj01/mvZ/gtQbjzIGjrpsahZF5wX9ko0fXJPQ6pMwL6E8agh+h
 +2iNwqvxTxyMAvuROkI/KW36PRfrPRy+56fuNJfOoASR9Qf9qKmxH0BbAW5nClQUpzWz
 u3+0hL+fFAAjLOVHL/priqGn6tDZYQRY7XtQj9KtKSxfL4RQM6ObY7dQW+cMYM81FHUW
 2z6Q==
X-Gm-Message-State: AOAM530kOWK1K1i/xfxHTTchXQWn2rnYouaQX/B+0d3GV9RHh3tawMD+
 mUlkweeGZmJ7+uIdT/Fn0yDpd810wH6CVw==
X-Google-Smtp-Source: ABdhPJxPVm8QsNrgFFVRPplRi39fOfICo/+ppP3gdNztvfIEFkOoTNVD5mp9E/D2+G3tATXcJT3Hag==
X-Received: by 2002:aed:36aa:: with SMTP id f39mr22918367qtb.297.1596553541905; 
 Tue, 04 Aug 2020 08:05:41 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-30d1-2f2e-908f-c5ec.inf6.spectrum.com.
 [2606:a000:1401:8c61:30d1:2f2e:908f:c5ec])
 by smtp.gmail.com with ESMTPSA id b131sm21914098qkc.121.2020.08.04.08.05.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 08:05:41 -0700 (PDT)
Date: Tue, 4 Aug 2020 11:05:38 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20200804150538.GV6965@bill-the-cat>
References: <20200719161601.495421-1-sjg@chromium.org>
 <20200719161601.495421-23-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200719161601.495421-23-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [Uboot-stm32] [PATCH 22/31] adc: Drop dm.h header file
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
Content-Type: multipart/mixed; boundary="===============3073779150830239362=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3073779150830239362==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xncXys66qXuJqdVV"
Content-Disposition: inline


--xncXys66qXuJqdVV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2020 at 10:15:52AM -0600, Simon Glass wrote:

> This header file should not be included in other header files. Remove it
> and use a forward declaration instead.
>=20
> Drop the common.h inclusion also.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--xncXys66qXuJqdVV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8peUIACgkQFHw5/5Y0
tyx6Hgv/bw3Jf6cvHwWhQehKfQ+M4tqtuR5m6XxJEep5ESRjVvoBLz/Z1ZJ4etMu
bJxDfLDEyMrvokYA+Jkbz9Voyk6j4sOGpWIjIPvqLhme/P3ZOSKkiogmdiC47gwP
mAWT3Sib+AlmuXtggXYz3HWkN3P1MmGm8lfc0jW08rNohvLrrBTdqVbcgdsjLnx0
jSRf1ncsg2rXM1JMIPNlDkJYOrwG7yFOdgkUvwxkvy52jXK0yHOzXDvWYUuRaAJP
LsFOSCrk6tXy4YiWZCDygCHb4OJzEequsJSo9oVKi0v0DKC6frnt0zB/fFktav2Q
rD2BeemkkIykIU4FHwV2wm2754m1PyQ+diDCNsd7EEJD2trs47bKiCf9az5Jt7AE
6YEwgGwrf78T076KBgMSC29rOb+l5VLpJAKJw0y8fcS2XmQsGmB6ra+4gpR3NURk
1tqBKe9fLjhCXVUVZaWJKCHNXUe1Xg6r+TZy+ZNvL8agkv/eb+zxI3yt1Qp8AXTl
qIdEOH1s
=ZRre
-----END PGP SIGNATURE-----

--xncXys66qXuJqdVV--

--===============3073779150830239362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3073779150830239362==--
