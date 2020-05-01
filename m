Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 695641C2021
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 May 2020 23:55:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23B28C36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 May 2020 21:55:51 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 196FEC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 21:55:48 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id b1so9106266qtt.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2020 14:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QRCgmJQgnGhNGZuEEKjpFRq4e4OcziSSNFTejSg1Hy4=;
 b=FsbTsqyy47hJn5HdG59XwuxZdXtlcp1qjW5ak3XOeUBlKSxgAq+xjbSCEK140eXk3b
 aUICEflHkkRZNOrJiUh5ZlymK2iWyVxnptjFO0G8Lm097R89lT2ebnY0+6yZAAvk0Td+
 MZAxvKlJRe3jpRytu/ZNrPe8Cn0nCWAg28iJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QRCgmJQgnGhNGZuEEKjpFRq4e4OcziSSNFTejSg1Hy4=;
 b=kuziMmH7lHVRyceupQcpRrK9V3MCCvWYr9sWzhVkhizQbStbfAeUrqO3dPSmEdy8mj
 ABwMghdK3eOfzuETm8BJl/SF04qnfCp+9iUH/c/Sw9fmR4ABOUmFgH38kDAQqzDRfjmP
 UjqRXt+7TDENriDBcAN2x+wmLPJds18MVOp/9YR3dBmaDit4sRSYdZdSfGxzUCowcz74
 trbqqEQKi4ESAAOkeRcM4/2YuLBEGhxvg2terx7rqiayFDy1jTaB5U8I8Eg/l3JnO4Rh
 uwvKxPxKNdI+7vlng1qHXMLSRyxFbyYk2D29+YOODqyv51+I1dDLYxVRKESUkjXiHmiZ
 RL8Q==
X-Gm-Message-State: AGi0PuY1wwzVhJ5QeMiuNR2s7kjYR2+M3FHLbevIZ/1pxpxtO1tqk8FD
 gtAmeVgHxIZeAttygRd4776m3g==
X-Google-Smtp-Source: APiQypI562Xrq8y5kKWcjCWGoFiLRmPVD7bQ7FTtEUc0+fRf9IxqcNUYNXGi6hNHzLXTKGIEDoAnSw==
X-Received: by 2002:aed:3346:: with SMTP id u64mr5941231qtd.1.1588370147160;
 Fri, 01 May 2020 14:55:47 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-8453-a408-e16a-eb16.inf6.spectrum.com.
 [2606:a000:1401:826f:8453:a408:e16a:eb16])
 by smtp.gmail.com with ESMTPSA id p31sm3836695qtf.11.2020.05.01.14.55.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 May 2020 14:55:46 -0700 (PDT)
Date: Fri, 1 May 2020 17:55:43 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200501215543.GG12564@bill-the-cat>
References: <20200410160158.v2.1.Ib3bfddef91204749326b4bdd0a089ed0bfcac33e@changeid>
MIME-Version: 1.0
In-Reply-To: <20200410160158.v2.1.Ib3bfddef91204749326b4bdd0a089ed0bfcac33e@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Marek Vasut <marek.vasut@gmail.com>, Simon Glass <sjg@chromium.org>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 u-boot@lists.denx.de, Mario Six <mario.six@gdsys.cc>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2] configs: migrate
	CONFIG_SYS_ARM_CACHE_* in Kconfig
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
Content-Type: multipart/mixed; boundary="===============6016701135480491031=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6016701135480491031==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 04:02:02PM +0200, Patrick Delaunay wrote:

> Move CONFIG_SYS_ARM_CACHE_WRITETHROUGH and
> CONFIG_SYS_ARM_CACHE_WRITEALLOC into Kconfig done by moveconfig.py.
>=20
> Kconfig uses a choice between the 3 values supported in U-Boot,
> including the new configuration CONFIG_SYS_ARM_CACHE_WRITEBACK
> (the default configuration).
>=20
> The patch also avoids to select simultaneously 2 configurations.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6smtwACgkQFHw5/5Y0
tywgjgv/RF45WbCH0U9YAOkDXgVWFZo6jekmV1TNH2UoyeavYqs54W1eaC4lheue
XuuqYV7qE9ByMLLJ3F+OLwwiUhC6nhAy9d9KDo0KrWjUsEoN0qLfymQLgq32NV6b
Jc8FIR+MKQIVpsAr4SKqu04PSWljBjYTMXjEUiZZQQFEjVxrXH9aU81yr2zgS6WW
U0lvX0wLSWbB84UubSwJATxTuOji3BJT293ACbhEZfQ3joietD6R+AB6vR5cyrQk
nA7wc09roFVG8VnQOu4ex6QWO/T2qBHBGeaXHrrSsfLo8hieLeYLHD0/l4uUiafD
DnoJo5jjpSsyly1z+QINih+gLq9cWvJqSBTsq46AvIFPFBdf+35cxUiTmGcrWukz
ylsnCWGencowqNOoUSTj7LF9O/NQriR3wcYt5UJxRgdWclgHbwgpCjbKCHz4OfYY
+LyDG2KZHscIIQtzfoyOSfW4HWnGURJIuOqW17y5srvh+Uc3Wpe5mRJoZ1Q37iOH
YR8kSbV/
=M2AK
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--

--===============6016701135480491031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6016701135480491031==--
