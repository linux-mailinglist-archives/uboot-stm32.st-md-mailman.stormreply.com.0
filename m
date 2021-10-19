Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD414337FA
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 16:03:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C2BCC5C850;
	Tue, 19 Oct 2021 14:03:21 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAF55C5C849
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 14:03:19 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id f3so34421uap.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3XsCETU8o6kvgdgA9NvDMBEWvFoltw20rsm0afMFGo0=;
 b=lqza6DEodW+oEcBJLSqJWDBxGpfH6Ymn2VQwNNp6oqn3oglUQhxoUloTKzIhgTISWv
 9jCXBbDuXr6hPtxWl8oTaTi5NrXcHng7DceYjisVhYc3vLMd4oNDDDTI1XrdwRazK02n
 U5va2iomOEMqw0AGglmnmoE6wsmJDRPC4GZuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3XsCETU8o6kvgdgA9NvDMBEWvFoltw20rsm0afMFGo0=;
 b=K71jarbWVB80NX2XGbJ62MhVtjuQFDDGnyu2OLCO4hBjlDQPhO+zn/ncR7dHlnQ/6r
 x5cLHvUDX5r8n/pMdzgw8YkBQV9Xgm6mtpnZCcyZdVISp4HkHTt/xe2harxwrP166Xdt
 aE24AH1pJunRLHHZdaFeBd45mXqZdtpCtFTuNRmeIZTnrqvjGeB0mZeCcIU4QRWF3mLw
 rrSQp3m8U8tvukWA4laMftzyjlj0lKAEj8DvUo1j3dwgkWDLoJPEXZzTDU7FDXROQ2uc
 2QkJfRrbKI+Pzfh8iTVI8rIrCbZWLwb4TdeyY5JvKc+DtjBb0y+i/uFEkfIJ+T+pwhaI
 Habg==
X-Gm-Message-State: AOAM533DGX2KOJUpEP0E3sB3wjS8PRBPUwbn3TlnDrW9mxoqhQOmoJbc
 79VTM2+8hJUSBAUKYiwo9PbG78Bh6DNFeyIHODP5VQ==
X-Google-Smtp-Source: ABdhPJyq/nspac5G+YgNbGwXRMqH0S4z/4zh+SDE2dKY1pr21WHg5RPulz9r7TaxfTAMWYExioE62F+kEl7trJF+sIE=
X-Received: by 2002:ab0:4952:: with SMTP id a18mr71819uad.35.1634652198317;
 Tue, 19 Oct 2021 07:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
In-Reply-To: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 19 Oct 2021 08:03:07 -0600
Message-ID: <CAPnjgZ3TOc7aEBWx0JDy3L=b1C-u39A6gnFFjqT5U1L9H4dDug@mail.gmail.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Zong Li <zong.li@sifive.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Tom Rini <trini@konsulko.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
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

Hi Ilias,

On Tue, 19 Oct 2021 at 07:07, Ilias Apalodimas
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
> https://lore.kernel.org/u-boot/20211011210016.135929-1-ilias.apalodimas@linaro.org/
> changes since v3:
> - fix xilinx platforms based on xilinx_zynq_virt_defconfig
> changes since v2:
> - Rebased on top of the updated OF_BOARD patchset
> Changes since v1:
> - Added internal error value on board_fdt_blob_setup().  Arguably
>   we can just check against NULL and simplify this even more if we
>   don't care about the errno
> - OF_BOARD is now default for sandbox builds
>  Makefile                                    |  6 ++---
>  arch/arm/mach-stm32mp/boot_params.c         |  3 ++-
>  arch/sandbox/cpu/cpu.c                      | 27 +++++++++++++--------
>  arch/sandbox/include/asm/u-boot-sandbox.h   |  8 ------
>  board/AndesTech/ax25-ae350/ax25-ae350.c     |  2 ++
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
>  31 files changed, 81 insertions(+), 69 deletions(-)
>

For some reason this still does not apply for me on -master. Can you
please confirm the hash you are using?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
