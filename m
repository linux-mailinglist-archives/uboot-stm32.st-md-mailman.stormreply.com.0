Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6643ABF1
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Oct 2021 07:58:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE187C5719C;
	Tue, 26 Oct 2021 05:58:37 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E51EC06B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 05:58:36 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id y80so14044840ybe.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Oct 2021 22:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+YKUal6iG9NSHTbWImghg1rg994lb0uA3AdV8hWqe84=;
 b=d0/hKrCFY95KArStBf7Ruf++SccxC31Oec2zE15mHQsvLMcCDlvuvut+STEsP4sdCn
 M6e6X8iR8KJKqM21HhCr71Y6EkXuA2siu6mcF+I5G6HG9wxYXL1+RtIFpLe52s0afEhV
 cuR0Zzgsb3QakBhPrHM1S1lSyDxAtOe4TNJK0RyhR3PzhchuhDyFQyklM3XwW380avrd
 rudSo1PzC1UwJQQ8612gruhQ9pnq9NCcBSu5RQFtaFaOGFv97r0+dk6HXAD/dh2uyig3
 RTfIJROchI0EcmptH9O69zTzrO3AYDSwuOKSj+duhWNMUiX4mojdiGBvYAYxCgcg8+nS
 Jgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YKUal6iG9NSHTbWImghg1rg994lb0uA3AdV8hWqe84=;
 b=YlHQ9lKmZLFAnJaoY1SUwfrUxGDMuxhP4yt5KHCs3GAb4z+rPYp1VZH3U/VeZDVK2W
 RHh8vb2UDthlxL9M34W1q/bxu35O211PDABLV+54rIxV2N8sgRczs31NZZwRNNTGD/xT
 aoRTiijQ+DAvF0m+Wl6Ir7Z1K3zNUchZIKf7hb6ZLnI0kc0g2vwP4BDCrwpKEVOBpHB+
 0DRFPeZqI/sIAmPV3/vuDchUZZgxOLDf+QEmCl9rsU5DdlRAualjwk+prpe7yiuHK7xI
 m9+2RryYPHXUih06C/pVTuyd2hIqf5FFT2AqpNWiyz7IRnZLSaZZ62ajtBKZ2E5zQcVw
 kTvA==
X-Gm-Message-State: AOAM531H9jlBKYedgC6nUELUmh9D9E9wTzGuB3pgwEb40ve/QnF+fxS1
 whapQPcudf/GPRsJuKhSWO/sKlCLmnIVKZEsFMVt8A==
X-Google-Smtp-Source: ABdhPJwJCGQ3fGoT1uPPHjPzpvuVx5wsIjT2fjRAB1h+z0U36/I4aUSI+vVFTKTT+tEJiimJVPaeBqYAzktp7BMEmsA=
X-Received: by 2002:a25:d3cc:: with SMTP id
 e195mr24375594ybf.410.1635227915247; 
 Mon, 25 Oct 2021 22:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
 <20211025211713.GA1992726@bill-the-cat>
In-Reply-To: <20211025211713.GA1992726@bill-the-cat>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 26 Oct 2021 08:57:59 +0300
Message-ID: <CAC_iWjJdmAFRNPc9nikEbucH5zTgL4RRmjhQ57Yqo8W5CMfatQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Zong Li <zong.li@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
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
 Priyanka Jain <priyanka.jain@nxp.com>, sjg@chromium.org,
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

On Tue, 26 Oct 2021 at 00:17, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Oct 19, 2021 at 04:07:21PM +0300, Ilias Apalodimas wrote:
>
> > OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> > unique and not causing any confusions,  we are better of having simpler
> > config options for the DTB.
> >
> > So let's replace that with the existing OF_BOARD.  U-Boot would then
> > have only three config options for the DTB origin.
> > - OF_SEPARATE, build separately from U-Boot
> > - OF_BOARD, board specific way of providing the DTB
> > - OF_EMBED embedded in the u-boot binary(should not be used in production
> >
> > Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > Reviewed-by: Simon Glass <sjg@chromium.org>
>
>
> This doesn't build on riscv:
> +(ae350_rv64) board/AndesTech/ax25-ae350/ax25-ae350.c:57:7: error: conflicting types for 'board_fdt_blob_setup'; have 'void *(void)'
> +(ae350_rv64)    57 | void *board_fdt_blob_setup(void)
> +(ae350_rv64)       |       ^~~~~~~~~~~~~~~~~~~~
> +(ae350_rv64) In file included from include/asm-generic/global_data.h:23,
> +(ae350_rv64)                  from arch/riscv/include/asm/global_data.h:35,
> +(ae350_rv64)                  from include/init.h:21,
> +(ae350_rv64)                  from board/AndesTech/ax25-ae350/ax25-ae350.c:10:
> +(ae350_rv64) include/fdtdec.h:1164:7: note: previous declaration of 'board_fdt_blob_setup' with type 'void *(int *)'
> +(ae350_rv64)  1164 | void *board_fdt_blob_setup(int *err);
> +(ae350_rv64) board/AndesTech/ax25-ae350/ax25-ae350.c: In function 'board_fdt_blob_setup':
> +(ae350_rv64) board/AndesTech/ax25-ae350/ax25-ae350.c:59:10: error: 'err' undeclared (first use in this function); did you mean 'errno'?
> +(ae350_rv64)    59 |         *err = 0;
> +(ae350_rv64)       |          ^~~
> +(ae350_rv64)       |          errno
> +(ae350_rv64) board/AndesTech/ax25-ae350/ax25-ae350.c:59:10: note: each undeclared identifier is reported only once for each function it appears in
> +(ae350_rv64) make[2]: *** [scripts/Makefile.build:254: board/AndesTech/ax25-ae350/ax25-ae350.o] Error 1
> +(ae350_rv64) make[1]: *** [Makefile:1801: board/AndesTech/ax25-ae350] Error 2
> +(ae350_rv64) make: *** [Makefile:177: sub-make] Error 2

Yea I somehow managed to mess up my merges.  Apologies for the noise,
I'll send a v5

Cheers
/Ilias
>
> --
> Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
