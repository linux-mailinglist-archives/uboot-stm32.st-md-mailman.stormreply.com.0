Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40920A3FCEA
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Feb 2025 18:09:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AC2CC7A839;
	Fri, 21 Feb 2025 17:09:45 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E7C2C7A838
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 17:09:43 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-220e989edb6so65783505ad.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 09:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1740157782; x=1740762582;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F4zwV+TPY8UZNInQJylSdSCmxbz/EqtJLO4myiA5zKo=;
 b=LjQndmVstXVv7Klp6J98Sl+jp6eCGpQQ0v1FhvvX89rkFLy1NUxORI3ZOqGyx4wDc4
 TTb54hWGPCvNEpGE60WtA5qBU+5FHF1z5+LEtl57m0r9UzvHcD1n/Bk4HvCws9Nawzwb
 36PjgWqsWIVl7UoxC1UO47paf+101iDQgGuAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157782; x=1740762582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F4zwV+TPY8UZNInQJylSdSCmxbz/EqtJLO4myiA5zKo=;
 b=f4th8+tUkoa3B8oJYpkrwtQLQ4xc8NLKdllmjI8gCb1vBK201Ltb8FGNjP+EDaydbT
 oi9f5eoKedeXt4zI8wXEsH5bnaVfW9zh2lK/VzaRFiQNs6PMNpFJnCGFrDu2awybAkH7
 4W0pNiOTsS3RzPG/5DmY2i4SsMkIaG3gkNwFIgXiuF8rTJPh5GqwzlWi8qWWCwfqgMTA
 9XcN2SiSBlwjmyY/T1/RzUJXuXaEmhuR7LHYk66kyxxUcLxb1SwJ0eR2HuYMGH0RbHr+
 lGhAbXd+RXLBuWxc3eLTLo7A5qo5nZgHW+g2kBFVXeO+DxbAc1r1kiZN6WWLo+lj4DcH
 JXcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9hxfq5L1emjpk3Mhp9e05n6LkqLVKe4yPA4p1RIVMojukFvmCv242ftCGN1Ykol4SaTC9pCRboRoLFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx8d4faaGxA1KHbv0Qpit2Hs2+4CZ5reyH4Mj3M5WBNUXralXeP
 jqPlfeGrhTDzQlE+7SjuHueVYPA0/IW6nGu8se5XCmo82YA0x+ySO9oq3JJdNFk=
X-Gm-Gg: ASbGnctlk9pElNl3NGkFXIUtqAFDvQE3/RsaT/xzi4VGqSGUb7bkF4MRFIf27G11sds
 AVDe80WOrwJ+1Abq5QsgH/MAgTrEG4QyJBfvGjwdq6zmwQDaOT+0oPaJ0dQVrsilkR7H4t6cgRR
 XZoAJTXvWtJacdwFN+OwY1G6D7Frxt8Fy5/UCTu0LeL2wnJjbIhPNM8AyQ7kOFZGPYE3N6STxfe
 GZfR4fLAljr9mX0IjmiMc95YDbk0GToPtZieMng8+BV4Yh46L2L214meVSluJQcsHLOlKzNdvTL
 9PMPI7YI0pGz7UVUBUmUuqOF
X-Google-Smtp-Source: AGHT+IFYfkBNap521KpCeYVm2UzShRJhhia7ZIJviCr73WySyphsNY9RsMr2gsNw6S7r0TdsQ0wRDA==
X-Received: by 2002:a17:902:f64f:b0:21f:7a8b:d675 with SMTP id
 d9443c01a7336-2219ff334bcmr74122945ad.4.1740157782114; 
 Fri, 21 Feb 2025 09:09:42 -0800 (PST)
Received: from bill-the-cat ([189.177.125.6]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d545d039sm138598315ad.133.2025.02.21.09.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:09:41 -0800 (PST)
Date: Fri, 21 Feb 2025 11:09:38 -0600
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20250221170938.GM1233568@bill-the-cat>
References: <20250221170851.184893-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20250221170851.184893-1-marex@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: u-boot@dh-electronics.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Fix
 CONFIG_BOOTCOUNT_ALTBOOTCMD update on DH STM32MP1 DHSOM
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
Content-Type: multipart/mixed; boundary="===============4248060019722278350=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4248060019722278350==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wb5ri22CHIrB8dnB"
Content-Disposition: inline


--Wb5ri22CHIrB8dnB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 06:08:38PM +0100, Marek Vasut wrote:

> The environment is missing closing quotes for string variable, but the
> variable is empty on this system, remove the CONFIG_BOOTCOUNT_ALTBOOTCMD
> assignment entirely.
>=20
> Fixes: 940135eea5df ("Kconfig: Move CONFIG_BOOTCOUNT_ALTBOOTCMD to Kconfi=
g")
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--Wb5ri22CHIrB8dnB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAme4s1IACgkQFHw5/5Y0
tyxxRgv5AYlPVrVY2aqfj3+6GqnQ3CFq1shBjgHS2jkhnl+zqsJiwSKekVQzlC+G
1mjzqbS4y+HC+YEIMtFFxra89/fswyyjmDFna+DKf/BdMClfV/nA/4FgrqX9m6Ox
HC+T0wfbm67I2S1SE5ghSq1qI7pbtnRNIq8nH5on0gpJ8BI7f+kcHeTCpFmPlVLi
4rj9PvAeG/+zugzNg8h3EDe/RK4lIO6YV6cf/mjk6Bi18JKmvgdmXntkhCse000M
6MXuHqBHqBRe7DXsRYQklHKcJOfY4T5pim66T2WhmfaKR63iyzg13bMM7aGaxY+M
47EWd5redmQQyufy5DB0RkFkVdBwC8No0VJLhrMO6qo6KNNU+ZAJQRBy+WjqhBxA
oZMBgzL/KVXiWdvVP5yy2TCS9IImgAXQNoX7RJZiLggQ2rfEY2vXgrfA5vzNy1jH
CN/cSk7HJ22wTrUZhThLzL+gTk2w59IMe3CgKQfcRXjvJLFRNFNd17KUp2cmMyX5
OEHJgADb
=I9/z
-----END PGP SIGNATURE-----

--Wb5ri22CHIrB8dnB--

--===============4248060019722278350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4248060019722278350==--
