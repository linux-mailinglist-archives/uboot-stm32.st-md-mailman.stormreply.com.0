Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6286157E7C
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 16:11:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 395B0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 15:11:05 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 848B1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 15:11:03 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id r5so3998948qtt.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 07:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dvYX00rp3j199+tBh9Mgjsm2mRzB47Z4e1yA5XfWklc=;
 b=MWxdUTogUWKs1dwbSA5ftiO0FDYO4xrMW/vziYAAHLu0AnoCdh0/E3G5vAUxKmVfSh
 sw9cD2AbxxqHb1f3yAjd6wSyUb+ihRWCi3LsEnOQ/aObyO2MIoj3YgVMITDbIWhghENr
 N5pv/RRXusFvml5X2chVTtqcjPc4BQOpxt3aU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dvYX00rp3j199+tBh9Mgjsm2mRzB47Z4e1yA5XfWklc=;
 b=ZtB2xQYzUuvI1HJCHaGkwC1lmMp4uPaZJ3ooVeONNW7/4aeMyciOTTOwrWXtGennyZ
 TMNNZgXp8SyIa3e0QoK5y/nfWd3SiliNfaoc6JaBJHD1DZ4kq/YSz3pIeGz71CCinjU8
 YdIHjJH2ZKtDkEiG+GMpX8qBdHmJhxoyMhh8WGIXclp8djEQqmhRBPbfaXrBE2wkOsom
 t4YaA4L2sdME7en0kLNDrtwpQFnm/XEV85ttz5Nr6CtXmzg501hp1cmR11iaf8wVfNjj
 e9YtKoB9MpjLKz7nyS75zHXu9zI7+HzoUbKTGE4hbJVf6YUnemN32qL/ddKdym7Th8H+
 6ODw==
X-Gm-Message-State: APjAAAVmo7aoRxJe3b2f0WyC/k3Q7IbdpedFUf6fQgiK4rvz+s/qGdB+
 gdH50KtKjqIy+Ab0eKnr9B8WCQ==
X-Google-Smtp-Source: APXvYqzVsUDkSqy+GRKXx5ZiqSDEGo6TUCNMM5ToHU5kVvV0V4bXz48MGQuCCJOewxA9YOMbbkn6ug==
X-Received: by 2002:ac8:53c7:: with SMTP id c7mr8551404qtq.311.1581347461635; 
 Mon, 10 Feb 2020 07:11:01 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-40d9-0482-2f9b-d60c.inf6.spectrum.com.
 [2606:a000:1401:86dd:40d9:482:2f9b:d60c])
 by smtp.gmail.com with ESMTPSA id t23sm282075qto.88.2020.02.10.07.11.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Feb 2020 07:11:00 -0800 (PST)
Date: Mon, 10 Feb 2020 10:10:58 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200210151058.GM13379@bill-the-cat>
References: <20200210115346.1.I82bc82f60e739674bce1015b8a7906d3852f0b93@changeid>
MIME-Version: 1.0
In-Reply-To: <20200210115346.1.I82bc82f60e739674bce1015b8a7906d3852f0b93@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: remove fdt_high and initrd_high
	in environment
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
Content-Type: multipart/mixed; boundary="===============1682001149343141075=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1682001149343141075==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eQHavJ7kYsCICkRS"
Content-Disposition: inline


--eQHavJ7kYsCICkRS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 11:54:11AM +0100, Patrick Delaunay wrote:

> Remove fdt_high and initrd_high (set to 0xffffffff) in stm32mp1 board
> enviromnent, and U-Boot always relocate FDT and initrd in bootm command.
>=20
> This relocation is limited by CONFIG_SYS_BOOTMAPSZ which indicates
> the size of the memory region where it is safe to place data passed
> to the Linux kernel (DTB, initrd), it is
> a) Less than or equal to RAM size.
> b) not within the kernel's highmem region
>=20
> So 256M seems large enough in most circumstances and users
> can override this value via environment variable "bootm_mapsize"
> if needed.
>=20
> This modification increases the boot time but avoid assumption
> on aligned address for bootm command.
>=20
> A user can still define this variables themselves if the FDT or
> initrd is either left in-place or copied to a specific location.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--eQHavJ7kYsCICkRS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl5Bcn8ACgkQh/n2NdMd
dlL9dBAAmaOHNS9CYpjqcxPAmT7Pe1l1URLTww9NTk1x9jjSjLfg/lE2Di1yag2g
Yq1Wppc6a5b03u7PM71w0bgstt/RRw4cAhA6o9VOUj9RKnkSLSnk8pHh4ptqBDiO
Y+s5gbQmOnoWaYeMXgcF3vEpsNB4DpF9lGWrer5B38HF77cEeQe6iGXHw3sXNoBl
LurXgplsM/jjLYvXX4LLFD8tydDDCjP8vESrRRh0K8xnU0985Gp9JDc5PXTnCF5Q
kSOLHDkfi9vjc1BBJvT44ORSyuJo1Wt5XTW2LAxT5y7am8piAL8fYpA9EX3ff2zB
XLdQXAfhXdtUBuTlBzGK0NH9kEIKmSvz5mEiE+qHNAQ3uQ68z+IQRQ+vNkZ3vGUH
932zDjscnjQsfMruc9fiUZnVGYSU1uutBUvvG/XKgCAwz9vqet4r6SP96WMzP6WU
J6LoaYc80WOKKNdMQ1u5qVL9pi7lJ1UGdxFiUg41e+E6Lpqih8YZNWxppvztq/Sj
uGKj1OHbQRTwED85aTvUh36Udl0YlIArZO4U8HOLUfEjVf4eaZneQYui29psAqLd
8+RYzSzZLvapwu6KwOIc4t2WuAe76GCUuw6iilxcqNX9U7eMmeCFctTPxXkM1vNQ
8gZM0J7MfCSN9K0ZEIFhWlaled/YEgJnu38O6KBM9/BTM2sk618=
=XM2q
-----END PGP SIGNATURE-----

--eQHavJ7kYsCICkRS--

--===============1682001149343141075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1682001149343141075==--
