Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2361BC043
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 15:54:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 505B5C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 13:54:16 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1420C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 13:54:14 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id di6so10366403qvb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3KXlpMQNOHUFUmlRz433Z03GqnyAAzJTM/OSrV0bZF0=;
 b=oIDUhk3GRV8B/EtZIGDreCoqORfCMREDEI3WX8R4sV4ddqQMiRe+V6KjD9KyGVXWXh
 YWFATmBt2CnHDFhpqUOQtc4E3ut0LsT9WOEAAaOobgfRcxl+7wg5YMndIhURamWaOLzw
 NoJW5WPTqBCzUnuVGrXXwoNvw4s6mOyb22umQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3KXlpMQNOHUFUmlRz433Z03GqnyAAzJTM/OSrV0bZF0=;
 b=mHjL6vE7CfktCVZshaKusDUMc9jgisjrj5tRWzo0Qb3TyU1OAakLgpx//tcpb32Tdr
 gNzsrX4EH+ogBhEXSEw3T6xp17C5Kc8CTFk7TwhruasiDxOf+/qNJemmTEwDtKmBPiwv
 rZZw/LJUFgdi6qqckE58DsR/+VSFGbzKnkXWR1c4Xxnh8tV/uOT0O+DLuVNdcH5owjGn
 41LQ0lOGrw0gAvqMsRLXsSIAr9iRHPRh/VVFeAswhf6nIotW0uCTHAs7Kn/jaKWiJkWV
 728o9nl0rLHk+mKUjpx51woOIPu+g8tJBu0j1MDtKgOfvVeF8Q+whh915O/9ZM3uPs5V
 NGKg==
X-Gm-Message-State: AGi0PubxtLK+uXaB/DtbHcqmyojGLUr54LcCyQIm3mI44OOzeocp/bdj
 Po/RSJqdwlXWYM0cjVQuDgDNRg==
X-Google-Smtp-Source: APiQypJJXlrEo+Z9l0akW4RTqI5jKx0fpmm4YLY8tUWpF9YdpTMZUmOAkewn77JaRzsHhLu/3fB/fw==
X-Received: by 2002:a05:6214:54a:: with SMTP id
 ci10mr28768268qvb.178.1588082053331; 
 Tue, 28 Apr 2020 06:54:13 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-c4e8-427e-eef8-640c.inf6.spectrum.com.
 [2606:a000:1401:826f:c4e8:427e:eef8:640c])
 by smtp.gmail.com with ESMTPSA id k43sm14477795qtk.67.2020.04.28.06.54.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Apr 2020 06:54:12 -0700 (PDT)
Date: Tue, 28 Apr 2020 09:54:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200428135410.GN4468@bill-the-cat>
References: <20200422141755.1.I8b005c35223011e3c07122ccbf558bf8d27b6aab@changeid>
MIME-Version: 1.0
In-Reply-To: <20200422141755.1.I8b005c35223011e3c07122ccbf558bf8d27b6aab@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] net: tftp: Add help for
	CONFIG_TFTP_BLOCKSIZE
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
Content-Type: multipart/mixed; boundary="===============3568461978667110175=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3568461978667110175==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yK/6QRnH3Zanb0EF"
Content-Disposition: inline


--yK/6QRnH3Zanb0EF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 02:18:25PM +0200, Patrick Delaunay wrote:

> Add help message for the CONFIG_TFTP_BLOCKSIZE default value,
> as explain in tftp.c before migration in commit b618b3707633
> ("net: Convert CONFIG_TFTP_BLOCKSIZE to Kconfig")
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--yK/6QRnH3Zanb0EF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6oNYIACgkQFHw5/5Y0
tyxgMAwAiN1QtMDhpz2dWl+tkiMHdU3is+xMPyA5Nb8ITYd4SAYQillS0mCQ2iqM
Tcjt3cW3rXLoDWuwpwYdGW/0O+L0rrR0M10MJJIRI4Ym/Q3BwKhauCsfUXMzbVjn
8qzkXYTWZJEJyWGGBMZ2IlPVK2Vo2IQ5FfhskEQKG4ZphI7l0MeFEUSwZ7Kw/NrY
g35JAj6xWfHWHNZyddLlylZpCSt4/jRu6it/nooQNLgJoyXo/AIIg9IpdJ1u0DBd
5Ce9ggZgCvRQQ4U7TUqXihR5RTZIiUv1gQ808ODSko1NBN2p1gedYpMShpZ7VhGd
YQe86QIR9/1BQ3Nfa+sMct9nQU6/5Bry1WdGNqGgQ1uhiE8MTwW7OgQzNokSv9xU
RGliVA8pkyEmHAieBewpYCJ4mErkPU75ZwnOsPwBhaZOFkcmJyKY5GQFe6583q1Y
4Xfxyfo/2kVgrzFBSQd5oE4mKsNc1N0umhPfshCG0lzhtX7b2HGhe0m0+22s7fwW
OXhecdX6
=fAbA
-----END PGP SIGNATURE-----

--yK/6QRnH3Zanb0EF--

--===============3568461978667110175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3568461978667110175==--
