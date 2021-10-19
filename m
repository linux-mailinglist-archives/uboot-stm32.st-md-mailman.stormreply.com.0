Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F823433839
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 16:17:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D10CBC5C851;
	Tue, 19 Oct 2021 14:17:41 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95533C5C849
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 14:17:38 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id t16so67197qto.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 07:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vRUayOOSQSAyzcyI9qUCA/4DYkIzvWQhM/zouT42Y/0=;
 b=QtBXdwJO2Y6Cxkhxx9F2KftHG9Gr3/wEE4Nt1aWQ8TpRMuMGwRl1+jYrz57eCWfn5Q
 sDPcLOxidDuR48cWW8z1dFGaOcLj82Y2Y5mPRQycNwuFsRcVhiOA1fBJDc4C01/+riAj
 3zqhXUSPgnCCsfCpJdyXuFRsEUbNSFseZLe6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vRUayOOSQSAyzcyI9qUCA/4DYkIzvWQhM/zouT42Y/0=;
 b=lz4SEnruAiyyLCZHG5uBev48/NlG1tSy+FByr5gsQgAnKdsdYTkzhvm+yVc5Y9gk/4
 +KkRTjgZ/1+vqIEw6+BjG4rsP5UN8BAsodNfKHJgv0TdRSSVb3K0d0pZSKjYQ2y3hfgC
 etaBhfCT96to50joXwiG8RLc8K0Pfhyxb3WMukM1l+LeBVMvLiRWFwEJHBTWDSB52G24
 kpJnGzTrDRvGGC6s+OvPf+Cag/UugXzSD0R0uYzulIBd7i5ZD1v6nkSTS7RruoLCTVxx
 /a3zv5SX2OP4p6Vz09e1muYOkHtrD9zC2SFAgSKWJe3XNRLqgJwaEUPBlDfkkD0/gP2H
 EswQ==
X-Gm-Message-State: AOAM530UBnsqG26uk6Zjc14JNQ1atP5ex9Qc25uTCpJFkZ1rjXjdS6qv
 W865QB8m8ouJCeIplzJNLm1z6A==
X-Google-Smtp-Source: ABdhPJwvKCObNXkPBd/kP8rZdTDFAzR5lgKz1JN4svkbsg9bRrbFXw+m7YaPbErjNyqbTw8YWBatGQ==
X-Received: by 2002:ac8:5a41:: with SMTP id o1mr177317qta.21.1634653057435;
 Tue, 19 Oct 2021 07:17:37 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-b5ac-d4ae-96e7-5d3d.res6.spectrum.com.
 [2603:6081:7b01:cbda:b5ac:d4ae:96e7:5d3d])
 by smtp.gmail.com with ESMTPSA id b127sm7995871qkg.42.2021.10.19.07.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 07:17:36 -0700 (PDT)
Date: Tue, 19 Oct 2021 10:17:33 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20211019141733.GD7964@bill-the-cat>
References: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
 <CAPnjgZ3TOc7aEBWx0JDy3L=b1C-u39A6gnFFjqT5U1L9H4dDug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3TOc7aEBWx0JDy3L=b1C-u39A6gnFFjqT5U1L9H4dDug@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Zong Li <zong.li@sifive.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
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
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
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
Content-Type: multipart/mixed; boundary="===============4386215477722328214=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4386215477722328214==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xW1fcKycK9wPgARZ"
Content-Disposition: inline


--xW1fcKycK9wPgARZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 08:03:07AM -0600, Simon Glass wrote:
> Hi Ilias,
>=20
> On Tue, 19 Oct 2021 at 07:07, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> > unique and not causing any confusions,  we are better of having simpler
> > config options for the DTB.
> >
> > So let's replace that with the existing OF_BOARD.  U-Boot would then
> > have only three config options for the DTB origin.
> > - OF_SEPARATE, build separately from U-Boot
> > - OF_BOARD, board specific way of providing the DTB
> > - OF_EMBED embedded in the u-boot binary(should not be used in producti=
on
> >
> > Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > ---
> > Note that this must be applied on top of
> > https://lore.kernel.org/u-boot/20211011210016.135929-1-ilias.apalodimas=
@linaro.org/
> > changes since v3:
> > - fix xilinx platforms based on xilinx_zynq_virt_defconfig
> > changes since v2:
> > - Rebased on top of the updated OF_BOARD patchset
> > Changes since v1:
> > - Added internal error value on board_fdt_blob_setup().  Arguably
> >   we can just check against NULL and simplify this even more if we
> >   don't care about the errno
> > - OF_BOARD is now default for sandbox builds
> >  Makefile                                    |  6 ++---
> >  arch/arm/mach-stm32mp/boot_params.c         |  3 ++-
> >  arch/sandbox/cpu/cpu.c                      | 27 +++++++++++++--------
> >  arch/sandbox/include/asm/u-boot-sandbox.h   |  8 ------
> >  board/AndesTech/ax25-ae350/ax25-ae350.c     |  2 ++
> >  board/Marvell/octeontx/board-fdt.c          |  3 ++-
> >  board/Marvell/octeontx2/board-fdt.c         |  3 ++-
> >  board/Marvell/octeontx2/board.c             |  3 ++-
> >  board/armltd/vexpress64/vexpress64.c        |  7 ++++--
> >  board/broadcom/bcmstb/bcmstb.c              |  3 ++-
> >  board/emulation/qemu-arm/qemu-arm.c         |  3 ++-
> >  board/emulation/qemu-ppce500/qemu-ppce500.c |  3 ++-
> >  board/emulation/qemu-riscv/qemu-riscv.c     |  3 ++-
> >  board/highbank/highbank.c                   |  3 ++-
> >  board/raspberrypi/rpi/rpi.c                 |  8 ++++--
> >  board/sifive/unleashed/unleashed.c          |  3 ++-
> >  board/sifive/unmatched/unmatched.c          |  3 ++-
> >  board/socrates/socrates.c                   |  4 ++-
> >  board/xen/xenguest_arm64/xenguest_arm64.c   |  7 ++++--
> >  board/xilinx/common/board.c                 |  3 ++-
> >  configs/sandbox64_defconfig                 |  1 -
> >  configs/sandbox_defconfig                   |  1 -
> >  configs/sandbox_flattree_defconfig          |  1 -
> >  configs/sandbox_noinst_defconfig            |  1 -
> >  configs/sandbox_spl_defconfig               |  1 -
> >  configs/tools-only_defconfig                |  1 -
> >  doc/develop/devicetree/control.rst          |  7 +++---
> >  dts/Kconfig                                 | 10 +-------
> >  include/fdtdec.h                            |  4 ++-
> >  lib/fdtdec.c                                | 14 +++++------
> >  scripts/Makefile.spl                        |  4 +--
> >  31 files changed, 81 insertions(+), 69 deletions(-)
> >
>=20
> For some reason this still does not apply for me on -master. Can you
> please confirm the hash you are using?

The hunk for scripts/Makefile.spl still fails (it failed on v3 as well),
but is easily fixed-up, fwiw.

--=20
Tom

--xW1fcKycK9wPgARZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFu03kACgkQFHw5/5Y0
tyzgtwv+M2hSIPO2EaxJtkyAYFVVOA9C1zrwoF5Ga+/AIPcDZJhaKDS/xNtP2rxN
wwnJrjt89q0hh8jSAh2nFBQ1f2hsrA3SG+v7DEQSOXaB/+uwBDlT/esNzEmjp7l/
a7eEQU9vAJCh6m5Ld2hFrI74DXR9/WcTWVQDQf045Z0NZVv1EXkPv6Nm/I0PSPl7
G5Je74hyS+o/EDziaFCXRUnqLTUmsw7VBtIvqwZYMW0pgz6NI3i3b54Opx80zX87
GM6M6cy+7MuT7NYOckJlaO27pk+/Xf6mADN8ti8rCbl9rlBqzW64hc+anpCmx2mN
mBiGGlqWxkkPWQJWzk4Io6++4TFrC6FJ4llHfuf4CI/qcyQUmjalAXDm/Fq0abpR
S4J6sKjrhSvKULtLXQbc5ojnIXZlhwqcBE+ZPoahM5kGSDCL3dQKcT4tvIdUgdEx
7xkdXpy5vpOsOchtAAWxTgZFt7AsjAkkzPSLtw29uD9B3fal2nw2ncvH4es6QytS
k/mAR7Mm
=Ufn8
-----END PGP SIGNATURE-----

--xW1fcKycK9wPgARZ--

--===============4386215477722328214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4386215477722328214==--
