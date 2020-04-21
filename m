Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BC11B25EE
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 14:26:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F0CBC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 12:26:36 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF0D7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 12:26:34 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r19so1418525qtu.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 05:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RvZn+vMH0RmRViHf6gujI69lcW+xt4obgSwXhdGO6Wk=;
 b=NTb3GGzhxU9+1nw8TFnCG6XMGikaGkleenvOnmE8IeXskUsDt5VSawqKkqFdMtiAvf
 PKiHj5+Jp+ISD7+PEoooTo5m5w50stKaTGTccKpvgZDynZCT8e7BsTWL11UCD7UO3r28
 yATQ4DXV9iNgLxElVikqeQOhsaKJtu2fKCzaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RvZn+vMH0RmRViHf6gujI69lcW+xt4obgSwXhdGO6Wk=;
 b=rRS3x5lIfWNtWZ2sCjF+yz6kMFP7ob4A4+iN755A+2mBzQvxhZrEfaJeKJzVNsTiTN
 xYZ7hFfR0pySF2zyY0+1tg907ji0P3imDUYm0GlUzCX01sCM8sTjoMnMLFFQtl9y7I86
 IEBRl4GWU9l+tWT6TIww9r4Z3Af+p8FinXraNkspexffhyGXAQXf+htTFrj+F5IpCgXH
 7DE2vgE4cEKx6PwqolWGCzGgcNl19Qycbr2b96N7KAyAuMrb73QrBv1BweezWMiCsY2R
 b5wl4PBzQO9zamoeDEiSPo2Vkx3FL4O01lGQdq2o7D4mwlJT4vKzKx+CFzUKhv6Y46Ib
 8lYw==
X-Gm-Message-State: AGi0PuYPMzzJdNgKagzBn+qGG6xNPv5B6/N+DyH2kkFeOsOAv6Ymv4Om
 1iRLxlPfMY51Aqsv2/5Viys7gw==
X-Google-Smtp-Source: APiQypKUttqVfml6Gp9TuzmiARiaT6QHLYIPKX8BArI5cmjt9ussMQ3VDOh4jl//4hE3mkWaPg3Aug==
X-Received: by 2002:ac8:776f:: with SMTP id h15mr21244783qtu.36.1587471993604; 
 Tue, 21 Apr 2020 05:26:33 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-3d58-7014-cb56-b1a9.inf6.spectrum.com.
 [2606:a000:1401:826f:3d58:7014:cb56:b1a9])
 by smtp.gmail.com with ESMTPSA id x6sm1648489qtx.91.2020.04.21.05.26.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Apr 2020 05:26:32 -0700 (PDT)
Date: Tue, 21 Apr 2020 08:26:30 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200421122630.GB4555@bill-the-cat>
References: <20200302091241.10371-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200302091241.10371-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Thomas Hebb <tommyhebb@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: spl: update reference to
	driver-model/README.txt
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
Content-Type: multipart/mixed; boundary="===============5331086847514072650=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5331086847514072650==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/7AFTq66AsXNQ7GX"
Content-Disposition: inline


--/7AFTq66AsXNQ7GX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2020 at 10:12:41AM +0100, Patrick Delaunay wrote:

> Update the reference in doc/README.SPL to a no more existing file:
> "driver-model/README.txt", it is changed to "doc/driver-model/design.rst".
>=20
> Adding the directory path /doc/ allows to check this reference with
> 'make refcheckdocs'.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--/7AFTq66AsXNQ7GX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6e5nYACgkQFHw5/5Y0
tywP1Qv7BTguZUjXOpZTnu3kyy+6fRDAbHgcCp5n384DyYtDpVLuncrzG/pU4g2U
ErtDMgpRO1iG6hCXWbVox/7g5xaTNwnvmthn+9t5TmYd3f1nARpKHQKyG1XLpPQW
zFjNDXPIzfBzDHDhJNaW6/C3Uy7Fpj7GZ2LTEKaBmrRDyPkK9WF3z6hZbqeml1uX
0ixZ1WxPB/o49fV0aTr38GcG6bXpqsNkNQc+pLE9qiD5et1FNQ1dyy+RnQpzD0/q
vJRCuF1INgHFpTyJffT2qzNqXFEQnpAkscwG14qw0I7UGIfr5cVWVuaO4eWbKHvc
S9+xLjqWC3+dh9XZ6lQbIEBQ5/+mo0Lu3IgfpItGiQseoA6dWjh8j7iCKfTDt6Ae
LJY4OwB94CI8AOaCIHy8cDeOAVvlWKAJVaY+WW5PuktgcpnqmJ5pQJf7YJo/Jwte
71ykjiJYy+WB+fQHQn9nkgqBRuNwwmlMZkZPpnIdG3mIPyMalHyI6mXDUnopaNy6
rQOzCHWZ
=ftcg
-----END PGP SIGNATURE-----

--/7AFTq66AsXNQ7GX--

--===============5331086847514072650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5331086847514072650==--
