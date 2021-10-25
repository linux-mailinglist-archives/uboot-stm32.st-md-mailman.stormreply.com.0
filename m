Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7840243A5AD
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Oct 2021 23:17:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 038EAC57183;
	Mon, 25 Oct 2021 21:17:23 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7000BC57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Oct 2021 21:17:19 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id h20so13021683qko.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Oct 2021 14:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v+9paet9Jo9509MvsZN31TmwBLTrm3nhOPKdnPIxDj0=;
 b=sGMbRdD0/UV2cM4gboqnBEEtsA8YbeOBx4b6t/orwPtHKkld2ZtY2jg/SZv9At8QP4
 pGNu2KrYMVD9+skZUImpd5+3lb83ChOgrGgS1sGAEO8u9PISr6AQApZQ2FEvMs5dk9UK
 shlnoo7d8LC7ZJ7hlkjBBeIHSW8u2jJmS3bBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v+9paet9Jo9509MvsZN31TmwBLTrm3nhOPKdnPIxDj0=;
 b=uztIsWvVzH/qtnRwccvZ8W5jey3Ola9xt1TfN+vh7mabhSfPlpKUEJEtej3/NE+gq5
 oi61fr+24TPt2DVy79ldnDdIz6iXeasWDbgKVjI//p8GCtBqYeszUyrAeb0rFtD4LxE6
 tfkbOIgn5j7dFINB8lnvnt/ryPIfLI3UNjRIS3XUveDK4tLlFqi6RXtnFffWGjjiyX0w
 0y8z9Vf3CkD2L1BV/6O+B9dkRm4kjx8i5ukcbqnTwRaHJschWaPgX0yrm09CRKntT9oU
 pTBX4OwFoZf0FRePiIPQrbLt6Ut+B+aY6qFkUyuvA77wY8PXsfLJ+IgVE3EUSsCHPLFo
 8OFQ==
X-Gm-Message-State: AOAM531sQc76jGP23/zfkPimwT2LIHxKcPaEhJSSFNWc0WwcLy92/VXU
 AyUoLyohS3slCsuNUmrCcfqFPA==
X-Google-Smtp-Source: ABdhPJwDcG5kUjtTo01PT732FKc/GN8xNQTpGnzuFB5jcISrzbAN1HP1ctz9LpGpAxc+yWHhMPmxkA==
X-Received: by 2002:a37:d09:: with SMTP id 9mr15711322qkn.409.1635196637918;
 Mon, 25 Oct 2021 14:17:17 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-c992-6a97-7d08-4b0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:c992:6a97:7d08:4b0c])
 by smtp.gmail.com with ESMTPSA id k8sm8970547qth.2.2021.10.25.14.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 14:17:17 -0700 (PDT)
Date: Mon, 25 Oct 2021 17:17:13 -0400
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20211025211713.GA1992726@bill-the-cat>
References: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Zong Li <zong.li@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Heiko Schocher <hs@denx.de>,
 Asherah Connor <ashe@kivikakk.ee>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Wasim Khan <wasim.khan@nxp.com>,
 Harald Seiler <hws@denx.de>, Nandor Han <nandor.han@vaisala.com>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Green Wan <green.wan@sifive.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, sjg@chromium.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4] sandbox: Remove OF_HOSTFILE
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
Content-Type: multipart/mixed; boundary="===============1074106841490936512=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1074106841490936512==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 04:07:21PM +0300, Ilias Apalodimas wrote:

> OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> unique and not causing any confusions,  we are better of having simpler
> config options for the DTB.
>=20
> So let's replace that with the existing OF_BOARD.  U-Boot would then
> have only three config options for the DTB origin.
> - OF_SEPARATE, build separately from U-Boot
> - OF_BOARD, board specific way of providing the DTB
> - OF_EMBED embedded in the u-boot binary(should not be used in production
>=20
> Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>


This doesn't build on riscv:
+(ae350_rv64) board/AndesTech/ax25-ae350/ax25-ae350.c:57:7: error: conflict=
ing types for 'board_fdt_blob_setup'; have 'void *(void)'
+(ae350_rv64)    57 | void *board_fdt_blob_setup(void)
+(ae350_rv64)       |       ^~~~~~~~~~~~~~~~~~~~
+(ae350_rv64) In file included from include/asm-generic/global_data.h:23,
+(ae350_rv64)                  from arch/riscv/include/asm/global_data.h:35,
+(ae350_rv64)                  from include/init.h:21,
+(ae350_rv64)                  from board/AndesTech/ax25-ae350/ax25-ae350.c=
:10:
+(ae350_rv64) include/fdtdec.h:1164:7: note: previous declaration of 'board=
_fdt_blob_setup' with type 'void *(int *)'
+(ae350_rv64)  1164 | void *board_fdt_blob_setup(int *err);
+(ae350_rv64) board/AndesTech/ax25-ae350/ax25-ae350.c: In function 'board_f=
dt_blob_setup':
+(ae350_rv64) board/AndesTech/ax25-ae350/ax25-ae350.c:59:10: error: 'err' u=
ndeclared (first use in this function); did you mean 'errno'?
+(ae350_rv64)    59 |         *err =3D 0;
+(ae350_rv64)       |          ^~~
+(ae350_rv64)       |          errno
+(ae350_rv64) board/AndesTech/ax25-ae350/ax25-ae350.c:59:10: note: each und=
eclared identifier is reported only once for each function it appears in
+(ae350_rv64) make[2]: *** [scripts/Makefile.build:254: board/AndesTech/ax2=
5-ae350/ax25-ae350.o] Error 1
+(ae350_rv64) make[1]: *** [Makefile:1801: board/AndesTech/ax25-ae350] Erro=
r 2
+(ae350_rv64) make: *** [Makefile:177: sub-make] Error 2

--=20
Tom

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF3HtYACgkQFHw5/5Y0
tyyxHwv8DbBlDiUk1CW5VPrkU6p/ZoP2l7As0drMLOfsonoOSpJ2m8II4+ryWyul
ioaQmmWyt9QNnwDqtM9Qsh0lhFKZVRgT4ZVWN5N0X85/dMBHxwg/S+9Bt+HDH3AZ
VbYSsjYY32DZnX1biRTlFN4RXSjw4bHymMN08txo99nNXg9no01Ptjgdp60GxttO
V2FRsMLWv4HbiPgpJ96g3k1D3KfYz1zb4V3GuXsts+5zuS4xP06m6V6wA/hTjTFK
f9YFZUujReG5Qe1IVyc37PpDG/EBhS825/08J/CrkUv30wLscEdFAgO/yQ9/6qOT
Vvnen1R5CO+RhlBIGsW8+lEdf4nE4m/EXkImL1Yt5iv6INgLwy16Wj+z0x4lOZii
evZygcJ38hHjzXWkQXM3do+9rutLHn85GtV29rCIN/nTf6BqEi85Us7woiyoTY8j
DVR1wp2CYY1YxJWRtYrD+aiIkTqzHstEN85dbbbObDMN6RD3UJC+bdLkqhdDSs9c
x0QQfZe6
=P/1z
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============1074106841490936512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1074106841490936512==--
