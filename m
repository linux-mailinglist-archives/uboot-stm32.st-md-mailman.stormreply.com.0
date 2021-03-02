Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAAE32ABD0
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Mar 2021 21:51:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83FFBC56634;
	Tue,  2 Mar 2021 20:51:03 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7B34C5660F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 20:51:00 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id j8so112040qtq.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Mar 2021 12:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4GFHYzBB7q9EZ74rXwtAyiY21xe60xNzGJzyv4aU16Y=;
 b=R6kXjZymD2eSvzEEfUqo9GmI1ZhZSEoy82eMwmSNfv85Fwg4Wqm5us2antRQHRVYHW
 MD/aSZ3g5VjH96wELlgQDxOVEUK/g56DuwNdQ5z4yrq6GW8qBZbE93gpnXc42IvCuXRp
 c0x/P5CSz5oXLgxWzPnwKPXCLQSO+gY+RBBYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4GFHYzBB7q9EZ74rXwtAyiY21xe60xNzGJzyv4aU16Y=;
 b=Hao0W4Atqql76nRvWegImwqZdX88Y/ymRoSf4dnaitlZGeKHCXICHnuPl2RWTYhENj
 Ufyi+SFiY7cLLt9t09iIgGSHemKbXqTJXzrkS7GlkIziDfFEQOEBqE2GCaxQBuLwcXVg
 1segw65l61QtAdWKof7/C2tDZiBt6tmeZNjvf+G1AtA2qebAVPCJVYfsBK8+iQndiQXg
 bYQW5TaHJ068hfILXNrJ/CHoyEQI2Fn4hQQgsb+T3kVHg2BHJN6V0t3ixMwLKCm/WnUX
 WuyCXzEYD7cus9UlY9lLClruXHmplfRSJOpDQ5uEInIIUS56g6mHYIQNNZEczWQaCmHB
 lx6A==
X-Gm-Message-State: AOAM531WqKG/9gGkI90nbWAzBfLFAp9VP+hDFUq7LXogG0pj86R/F7yV
 wMzqw7PCIXWa20cO1SKusUoyxA==
X-Google-Smtp-Source: ABdhPJzPHzMle0K+YTIkevKZW71re1OHlXDtzL0NSw6/HQPYu2F1MrWXoyHItIE1DNUfrJCZYFRrXA==
X-Received: by 2002:ac8:649:: with SMTP id e9mr13669916qth.114.1614718259342; 
 Tue, 02 Mar 2021 12:50:59 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-4917-ae06-1734-d397.res6.spectrum.com.
 [2603:6081:7b07:927a:4917:ae06:1734:d397])
 by smtp.gmail.com with ESMTPSA id j2sm15382195qkk.96.2021.03.02.12.50.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Mar 2021 12:50:58 -0800 (PST)
Date: Tue, 2 Mar 2021 15:50:53 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <20210302205053.GF10169@bill-the-cat>
References: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Reuben Dowle <reubendowle0@gmail.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Atish Patra <atish.patra@wdc.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Masahiro Yamada <masahiroy@kernel.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Thomas Chou <thomas@wytron.com.tw>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Andre Przywara <andre.przywara@arm.com>, Huan Wang <alison.wang@nxp.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Mario Six <mario.six@gdsys.cc>,
 Sam Protsenko <joe.skb7@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 0/5] lmb: Add config for the number of
 memory and reserved regions
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
Content-Type: multipart/mixed; boundary="===============3152521822085898921=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3152521822085898921==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XhPuWTY5Vo2ftMVe"
Content-Disposition: inline


--XhPuWTY5Vo2ftMVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2021 at 01:59:07PM +0100, Patrick Delaunay wrote:

> Hi,
>=20
> I propose a update of the lmb library to allow the configuration
> with Kconfig of the number of memory and reserved regions in lmb
> libary:
> - CONFIG_LMB_RESERVED_REGIONS
> - CONFIG_LMB_MEMORY_REGIONS
>=20
> By default, I keep the default value of 8 regions.
>=20
> This serie avoids issue on stm32mp15 platform,
> as the kernel device tree defines many and non contiguous reserved
> regions.
>=20
>=20
>=20
> Patrick Delaunay (5):
>   lmb: move CONFIG_LMB in Kconfig
>   lmb: remove lmb_region.size
>   lmb: Move lmb property arrays in struct lmb
>   lmb: Add 2 config to define the max number of regions
>   configs: stm32mp15: increase the number of reserved memory region in
>     lmb
>=20
>  arch/arc/include/asm/config.h        |  2 --
>  arch/arm/include/asm/config.h        |  1 -
>  arch/m68k/include/asm/config.h       |  1 -
>  arch/microblaze/include/asm/config.h |  2 --
>  arch/mips/include/asm/config.h       |  1 -
>  arch/nds32/include/asm/config.h      |  1 -
>  arch/powerpc/include/asm/config.h    |  1 -
>  arch/riscv/include/asm/config.h      |  1 -
>  arch/sh/include/asm/config.h         |  2 --
>  arch/x86/include/asm/config.h        |  1 -
>  arch/xtensa/include/asm/config.h     |  2 --
>  configs/stm32mp15_basic_defconfig    |  1 +
>  configs/stm32mp15_trusted_defconfig  |  1 +
>  include/configs/10m50_devboard.h     |  5 ----
>  include/configs/3c120_devboard.h     |  5 ----
>  include/configs/sandbox.h            |  2 --
>  include/configs/x86-common.h         |  2 --
>  include/image.h                      |  2 +-
>  include/lmb.h                        | 34 ++++++++++++++++++++++++----
>  lib/Kconfig                          | 23 +++++++++++++++++++
>  lib/lmb.c                            | 14 ++++++------
>  scripts/config_whitelist.txt         |  1 -
>  22 files changed, 63 insertions(+), 42 deletions(-)

This series causes a little bit of size growth everywhere.  It's fatal
on nokia_rx51 (and caught via the test script).  We can bring nokia_rx51
back under size by disabling the optimized memcpy/memset functions, but
that's not ideal.  Can we do your changes here in a more size-concious
way?  Thanks!

--=20
Tom

--XhPuWTY5Vo2ftMVe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA+pSoACgkQFHw5/5Y0
tyyZ6wv9GplI69if4nOyQe8L2F992tWiacWO4Q44KBj6fm+/M0+pdcYopJTwAR8h
HanM0wvnakEwxpoNPD/+P23oZq7PP5rXJ57YEaCJR6jAZDucV/7nVSN6u7XDqQng
thQDfpp05A5xNAGNNIaDAX4i4Uhub7pQeVyO8BI1lfP+dwVNRazT5ncbmG8bRueb
8VI5tSU/JfEkheZgjL+Ow4HrgFopEAj/dtoeJdn4O1BrGi5ysDtb9N4dtStwaY+P
x7ydnbt7gHvxsqm29ZT4ApKpNTZs5dR4mbRgPkrbSJAX2UgwW49JPQQ5qMcJxV0b
lhtQxJDIEaZyG39HLMSxaCihxPq15bLB3qQLy673DS+hzjm8qZRNULwz7RJt/yHS
Vi748Y7Ig6oS9KyV5OfBKo9wD+GLddXrVuXK7CDv0TvlcsFnFF7j6nHpvFRaB2On
4vXcPLTm3C3nOG/LoqBXntU8a5Iu9U2EiAbpiSa8EfY4xp7argdHDDWHJVrZHvAI
QRMW6tU7
=C9MJ
-----END PGP SIGNATURE-----

--XhPuWTY5Vo2ftMVe--

--===============3152521822085898921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3152521822085898921==--
