Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A0A42DDAF
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Oct 2021 17:11:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB510C5C83D;
	Thu, 14 Oct 2021 15:11:47 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CFF8C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 15:11:45 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id n63so8882598oif.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFWDT5XLMRRbwHS7DpzKjEoPmzU5LIeYm6JgdXxEHiQ=;
 b=dO31RfAPK+QHl733eER94/utaKTHlJhzk0x2f0rcZSWDBWNTHJCCn8/x7EeVnJ1GbC
 weC5nV4n32rQ/MTdqrVX5Tv5SEPbEB7YaBeO6uZI8h3QnO7+kdfl+zqDkGNuSsT0bWbz
 0Gn4gd52fmX6KiG89Znmub+82Azhj5Ee6sZsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFWDT5XLMRRbwHS7DpzKjEoPmzU5LIeYm6JgdXxEHiQ=;
 b=5iV7a+az3jbO7/Cvos7x5l+VEZaK7Bpl4c3MedZubaxRGe/0EaRfBay9iQm+pqVNPS
 U8v/PA35tQV0G/GQJubhh+nt105k9zqQPeLU+oPnFqCJUKD0DP+hmSj5GSzrL96ich3F
 XxRaFEqJDsJ7OqjVPe+xHB4jG2CvuiinATRwgJWP+gJWprYsuyIZLmz4FeT2v6btnwiw
 W9oej5H+rp4TD7+Z4nHMwxoj9ytsfkjKdcIcX49ZZ9AWT6BB95fpcInI0zfOrozMo+HA
 O9dQWPeBdJNhcmXYklYO9KjEeXNO/z/7Vc2djMhQsmEhox+t0r+hPv/gwP0scR/R3dF6
 LAAA==
X-Gm-Message-State: AOAM532Ll2p+9bQhfZ4ukC5f+79cugo9g5QlxYQAy2ONfUwA0cM6vL8O
 RXU/l2p4pE4O7a5Bk8N4+bRnRaK7wc94Y9+ot8D21g==
X-Google-Smtp-Source: ABdhPJxKqSXGfCr9yj8EHb/XBgS9Yo4stEmVwr9RyL2YRVxZnei1xGcGUMJixgX5p/mB6AWE68wsr/QjrBxLQud2BsI=
X-Received: by 2002:aca:ab15:: with SMTP id u21mr4617614oie.53.1634224302087; 
 Thu, 14 Oct 2021 08:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211011210137.136188-1-ilias.apalodimas@linaro.org>
In-Reply-To: <20211011210137.136188-1-ilias.apalodimas@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Oct 2021 09:11:28 -0600
Message-ID: <CAPnjgZ21PaYg8c39qEZm4Eb6g47s0LgL72k-FnHnr7zjXDD6JA@mail.gmail.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Zong Li <zong.li@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Heiko Schocher <hs@denx.de>,
 Asherah Connor <ashe@kivikakk.ee>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Wasim Khan <wasim.khan@nxp.com>,
 Harald Seiler <hws@denx.de>, Dario Binacchi <dariobin@libero.it>,
 Nandor Han <nandor.han@vaisala.com>, Andre Przywara <andre.przywara@arm.com>,
 Tim Harvey <tharvey@gateworks.com>, Green Wan <green.wan@sifive.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBEYW5pcw==?= <frederic.danis@collabora.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Pratyush Yadav <p.yadav@ti.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2] sandbox: Remove OF_HOSTFILE
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

Hi Ilias,

On Mon, 11 Oct 2021 at 15:01, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> unique and not causing any confusions,  we are better of having simpler
> config options for the DTB.
>
> So let's replace that with the existing OF_BOARD.  U-Boot would then
> have only three config options for the DTB origin.
> - OF_SEPARATE, build separately from U-Boot
> - OF_BOARD, board specific way of providing the DTB
> - OF_EMBED embedded in the u-boot binary(should not be used in production
>
> Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> ---
> Note that this must be applied on top of
> https://lore.kernel.org/u-boot/20210930071800.443059-1-ilias.apalodimas@linaro.org/
> Changes since v1:
> - Added internal error value on board_fdt_blob_setup().  Arguably
>   we can just check against NULL and simplify this even more if we
>   don't care about the errno
> - OF_BOARD is now default for sandbox builds
>  Makefile                                    |  6 ++---
>  arch/arm/mach-stm32mp/boot_params.c         |  3 ++-
>  arch/sandbox/cpu/cpu.c                      | 27 +++++++++++++--------
>  arch/sandbox/include/asm/u-boot-sandbox.h   |  8 ------
>  board/AndesTech/ax25-ae350/ax25-ae350.c     |  4 ++-
>  board/Marvell/octeontx/board-fdt.c          |  3 ++-
>  board/Marvell/octeontx2/board-fdt.c         |  3 ++-
>  board/Marvell/octeontx2/board.c             |  3 ++-
>  board/armltd/vexpress64/vexpress64.c        |  7 ++++--
>  board/broadcom/bcmstb/bcmstb.c              |  3 ++-
>  board/emulation/qemu-arm/qemu-arm.c         |  3 ++-
>  board/emulation/qemu-ppce500/qemu-ppce500.c |  3 ++-
>  board/emulation/qemu-riscv/qemu-riscv.c     |  3 ++-
>  board/highbank/highbank.c                   |  3 ++-
>  board/raspberrypi/rpi/rpi.c                 |  8 ++++--
>  board/sifive/unleashed/unleashed.c          |  3 ++-
>  board/sifive/unmatched/unmatched.c          |  3 ++-
>  board/socrates/socrates.c                   |  4 ++-
>  board/xen/xenguest_arm64/xenguest_arm64.c   |  7 ++++--
>  board/xilinx/common/board.c                 |  3 ++-
>  configs/sandbox64_defconfig                 |  1 -
>  configs/sandbox_defconfig                   |  1 -
>  configs/sandbox_flattree_defconfig          |  1 -
>  configs/sandbox_noinst_defconfig            |  1 -
>  configs/sandbox_spl_defconfig               |  1 -
>  configs/tools-only_defconfig                |  1 -
>  doc/develop/devicetree/control.rst          |  7 +++---
>  dts/Kconfig                                 | 10 +-------
>  include/fdtdec.h                            |  4 ++-
>  lib/fdtdec.c                                | 14 +++++------
>  scripts/Makefile.spl                        |  4 +--
>  31 files changed, 82 insertions(+), 70 deletions(-)
>

This patch does not apply cleanly on top you your other series.

Can you please resend it?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
