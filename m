Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3E433A74
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 17:31:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EB5AC5C852;
	Tue, 19 Oct 2021 15:31:36 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DE9BC5C850
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 15:31:34 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id f4so671073uad.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B7gRCna3TBDfqIFQVrW30DnOS/xErsKJ4Pl61wvbwGY=;
 b=QzxRNedNCDFOCzT8VtGkq/0dTSHU7SkMFZyIFGlPxKSodqhJTtAKhLodTcX3ITVXqo
 AL0JVA8Wmgv8m59yR4JrJfZc7x1vxzrNEKK80FqAWuzdFyoIWmyKXjC0ffmr4dS8IJp6
 ttTaJJCZoiV4y/vqiyRmA5YHwPt7iFoeGrmM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B7gRCna3TBDfqIFQVrW30DnOS/xErsKJ4Pl61wvbwGY=;
 b=njnjCy4rQuw4uIT0RLlyxB1M/m74X9srRSw93UJETjXu5F8ZqirOPV4swENJjy2Yxn
 a2gem3iNiCV/uR8xe65UJPkocWP6kaKiyFrZ220mhn7+kVbGHx++GBP14MaptaIM9EcH
 rUfrGuwZWq0VaxQjcr6Y63Yy8VDTe7Zb5DvcTToLMoBy6aTioK+xgYFvR3VrWwcTO14M
 Aqd7AEOIj/+HMgARrOMRlcHs9E16Df922HrpDHBFyuhl2UhYelDI8I37k59ayltUhoIo
 1ykVMLZfPQiCF5Z/W57uWVhJQwkE/CmvFrH57c0jMTUlZOksHLEZknaylFVHbyor9DJY
 oL2w==
X-Gm-Message-State: AOAM530vptFgTtbrE+IkbVYGVqaJLRP/vBADNCVfrK++o/FQXSMlGcP0
 p/07WmCZLF8iSOBQ1BWsb4ZXssNDTb5NGghNldlRsA==
X-Google-Smtp-Source: ABdhPJwxFvwULttl/mR+RsP8Cj9VVWn02GjMmIhXPfo6t8mlFsA2XTDEfaBpJPYCiRXod4WDHiIYrtdOoQMQkDn9NVo=
X-Received: by 2002:a05:6130:321:: with SMTP id
 ay33mr683064uab.140.1634657491445; 
 Tue, 19 Oct 2021 08:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
 <CAPnjgZ3TOc7aEBWx0JDy3L=b1C-u39A6gnFFjqT5U1L9H4dDug@mail.gmail.com>
 <20211019141733.GD7964@bill-the-cat>
In-Reply-To: <20211019141733.GD7964@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 19 Oct 2021 09:31:19 -0600
Message-ID: <CAPnjgZ1MCpgvnv4FyxBWWveBZLMoUq4_CAU0QpAGnAQrkCmd3A@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
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
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
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
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Pratyush Yadav <p.yadav@ti.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 19 Oct 2021 at 08:17, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Oct 19, 2021 at 08:03:07AM -0600, Simon Glass wrote:
> > Hi Ilias,
> >
> > On Tue, 19 Oct 2021 at 07:07, Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:
> > >
> > > OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> > > unique and not causing any confusions,  we are better of having simpler
> > > config options for the DTB.
> > >
> > > So let's replace that with the existing OF_BOARD.  U-Boot would then
> > > have only three config options for the DTB origin.
> > > - OF_SEPARATE, build separately from U-Boot
> > > - OF_BOARD, board specific way of providing the DTB
> > > - OF_EMBED embedded in the u-boot binary(should not be used in production
> > >
> > > Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > ---
> > > Note that this must be applied on top of
> > > https://lore.kernel.org/u-boot/20211011210016.135929-1-ilias.apalodimas@linaro.org/
> > > changes since v3:
> > > - fix xilinx platforms based on xilinx_zynq_virt_defconfig
> > > changes since v2:
> > > - Rebased on top of the updated OF_BOARD patchset
> > > Changes since v1:
> > > - Added internal error value on board_fdt_blob_setup().  Arguably
> > >   we can just check against NULL and simplify this even more if we
> > >   don't care about the errno
> > > - OF_BOARD is now default for sandbox builds
> > >  Makefile                                    |  6 ++---
> > >  arch/arm/mach-stm32mp/boot_params.c         |  3 ++-
> > >  arch/sandbox/cpu/cpu.c                      | 27 +++++++++++++--------
> > >  arch/sandbox/include/asm/u-boot-sandbox.h   |  8 ------
> > >  board/AndesTech/ax25-ae350/ax25-ae350.c     |  2 ++
> > >  board/Marvell/octeontx/board-fdt.c          |  3 ++-
> > >  board/Marvell/octeontx2/board-fdt.c         |  3 ++-
> > >  board/Marvell/octeontx2/board.c             |  3 ++-
> > >  board/armltd/vexpress64/vexpress64.c        |  7 ++++--
> > >  board/broadcom/bcmstb/bcmstb.c              |  3 ++-
> > >  board/emulation/qemu-arm/qemu-arm.c         |  3 ++-
> > >  board/emulation/qemu-ppce500/qemu-ppce500.c |  3 ++-
> > >  board/emulation/qemu-riscv/qemu-riscv.c     |  3 ++-
> > >  board/highbank/highbank.c                   |  3 ++-
> > >  board/raspberrypi/rpi/rpi.c                 |  8 ++++--
> > >  board/sifive/unleashed/unleashed.c          |  3 ++-
> > >  board/sifive/unmatched/unmatched.c          |  3 ++-
> > >  board/socrates/socrates.c                   |  4 ++-
> > >  board/xen/xenguest_arm64/xenguest_arm64.c   |  7 ++++--
> > >  board/xilinx/common/board.c                 |  3 ++-
> > >  configs/sandbox64_defconfig                 |  1 -
> > >  configs/sandbox_defconfig                   |  1 -
> > >  configs/sandbox_flattree_defconfig          |  1 -
> > >  configs/sandbox_noinst_defconfig            |  1 -
> > >  configs/sandbox_spl_defconfig               |  1 -
> > >  configs/tools-only_defconfig                |  1 -
> > >  doc/develop/devicetree/control.rst          |  7 +++---
> > >  dts/Kconfig                                 | 10 +-------
> > >  include/fdtdec.h                            |  4 ++-
> > >  lib/fdtdec.c                                | 14 +++++------
> > >  scripts/Makefile.spl                        |  4 +--
> > >  31 files changed, 81 insertions(+), 69 deletions(-)
> > >
> >
> > For some reason this still does not apply for me on -master. Can you
> > please confirm the hash you are using?
>
> The hunk for scripts/Makefile.spl still fails (it failed on v3 as well),
> but is easily fixed-up, fwiw.

OK I see.

Reviewed-by: Simon Glass <sjg@chromium.org>

This still has the CONFIG_SANDBOX in Makefile.spl but my OF_BOARD
series can tidy that up.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
