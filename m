Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E04A1AE727
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 284A9C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:19 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6EFCC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:15 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c63so4020512qke.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K4A0lAKyVMzRd7PmKQ9BLQBMBuvEAQXClaD++03B5nk=;
 b=WGYI2GOFonZ3xFb6HPxq/kpRja/ze8P/0nrCVR8Uk/miNyIRIiYqHJIAblskjsqSZ3
 QVfDCeV2tKYQAEV9oHTNEf0Q71ZsFR8KeW/IQdmaHsXGSv6ZeL62HkZjf36N90KKffd4
 DEDxim5UC5hHzhTiSWAUBqMDFzLpTKKyWjEYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K4A0lAKyVMzRd7PmKQ9BLQBMBuvEAQXClaD++03B5nk=;
 b=abcSI0PWNc+rDU3ffHED4QIkfwXVZQp47cxz0dSo70EVWOKPx91GMmsZwYrynKcsu8
 K3t+ObJylY09+uXtgtrp6VKCFV0j4o+4VV/cyfzFrlNL2UNnmS9ovCzfvH+6yhgBxCUt
 hUla6PowK++jgnPW7FbQUAztPmX7wwsTf8JoDtxUbhryYJFPRlr02Q5hKz6iUUzh9A7o
 X2rtnAGHfT5JGREn9gU5k7+VW309F8j5u5ZbJfw9e4Wgbq+YS1q53oj/pB0UVFm5jgEA
 Sz18ScSYiJXJ+vevk8YUpd5Ck5fGEGMuiIolIL2dMWP8A/dcGggh+1M9K9kK9rxoSZGD
 9UyA==
X-Gm-Message-State: AGi0PuZe5JkI+rftR0yVPT17sGGBl6Sn++etI7bDQxzcN1AmsT0FX4Ak
 nd3Hx15NgEiPhet8NyzuKyPddg==
X-Google-Smtp-Source: APiQypLPBwXon0zOZ/wMSFAwy1m65jiWjPIXUTdqesHLRbs2F+axCBgS6Zf+uVQ+wvgUPfVhxblcQw==
X-Received: by 2002:a37:8cc1:: with SMTP id o184mr5138350qkd.187.1587157574903; 
 Fri, 17 Apr 2020 14:06:14 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id b10sm18040322qtj.30.2020.04.17.14.06.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:14 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:12 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210612.GL4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-6-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-6-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 05/21] gpio: remove GPIOD_REQUESTED
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
Content-Type: multipart/mixed; boundary="===============7549580296600513921=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7549580296600513921==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2AXaZ4YhVcLc+PQ"
Content-Disposition: inline


--j2AXaZ4YhVcLc+PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:34:59AM +0100, Patrick Delaunay wrote:

> Remove the define GPIOD_REQUESTED as it is never used
> and use BIT() macro for other defines.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--j2AXaZ4YhVcLc+PQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGkMACgkQFHw5/5Y0
tyxfmwwAjULsJmSWix889JaGMe7fiabRtaMKu5mhPXrNnDdcnIhkVqnIC2Q9UFpz
eMJqPtQA42wYdvtG2FB4GhDSD4vsRVZ5o/cMVjqokRCkEembSTd3lpass75+Gus7
i6FHB4fNIeTjw5tqzFtwnO34af3u7KLGCBvpn9i70tf8M7pgZf7MmXOUDRg/11vd
wxRXnQV0RvPZqUVnt+RCmY7ldJxX3SFp+hbgzXYzSx/yYqWdH93yehM7TeKza5sI
DzIJTSHjvlXOEYSU0bLzHDvupjEENXQy4lIkjXGuAcmet9W3n/WkBd/Bv8XghrKL
Rp/E3m30QdHvQKhtd23iIEQsdBowNJsRQ6XJbR8sx+58PbUG/6Dj9B6ZyoBLRWgz
eScXxLS5g7nO49jx6LezTLxHRU0JWS1olDUDUI6e/Rhfp8WD07vFl+oy/mIF/hZG
6e4tsUJL38Q6rn7xhOjUT7qjmKr+yX8Un+x7ehkp6WnF2wxfsEe3PpvKgDpguXHv
sjPvfiMf
=5JAC
-----END PGP SIGNATURE-----

--j2AXaZ4YhVcLc+PQ--

--===============7549580296600513921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7549580296600513921==--
