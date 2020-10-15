Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05F28F582
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 17:06:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3104AC424AF;
	Thu, 15 Oct 2020 15:06:11 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04073C3FADE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 15:06:09 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m11so3143028otk.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QW86g9giGgRJuiXRo81xAoL5YGBMXjMC8vnXYypX/AE=;
 b=EAJfoy/esfGSkRrOgDpF9a0Hd2AvyRQRw4A1AAjRArLZDo8C1MwyjWfTeb4cR7BpUR
 abC3Zq8G6Te2o4k0e/z3iQYt89enpEDPsV/LN5dsSiyMS2Zpp2eXDFSd28n1tptb4Rsc
 n6MqWXaur1sScRz81/TZ/t+dKDKa8vGhBGH98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QW86g9giGgRJuiXRo81xAoL5YGBMXjMC8vnXYypX/AE=;
 b=U/djK4Naeg2nf3AUjEVxFTog5Sb5BnAMqmayDbAQSddY19367XJ8RHWVaf41qJMJEO
 FdMHKEaX0b9h2K+mp9M5onRIWHFPtZRstuLhcy72tU7uGQBO3VZhKXzovUfU9HA84lYF
 YMO9L/jij0L6rKRRTZHcaGXkpiTRtU4tI8aKuGVwV+dZR95hjgEDR7O2ee3YF1+lvdvz
 5rDzhe7ajNNhomLlMACtqDWx+t3V3shg5F+5i2AXuR2F/ynhJmPX9/SQ4DcBW4DaZZ+4
 UoRGAZRntfkAzyT39Ywh9QOwkGpPthGs1TCM777xwTpsqF3phZWdJoJJBbbzaxZ8oScv
 7/Pg==
X-Gm-Message-State: AOAM530hWAltPnFos9fgcVvnDHIezVLcKofGcnD1sU6NxNkm+0J5KkDm
 8yGwboBKdB+8k5Ei5yW7LtYdBv6SJ6HTmQjFfp/qdg==
X-Google-Smtp-Source: ABdhPJy75Ahugi6z6Z3OVfvRRWw6/GTuu8ISKO4IATpLiklQbPC93cb4Fhds92jLrBYe5y8vv5mg+nQGmYamoR/C3bE=
X-Received: by 2002:a9d:44e:: with SMTP id 72mr2819970otc.88.1602774367359;
 Thu, 15 Oct 2020 08:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201014091646.4233-1-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 15 Oct 2020 09:05:53 -0600
Message-ID: <CAPnjgZ2Z8=hXqoWXz8nuUToWTGz3sCY8zneGA9WsaVGYPprxzQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Heiko Schocher <hs@denx.de>, Christophe Kerello <christophe.kerello@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Lukasz Majewski <lukma@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Yannick Fertre <yannick.fertre@st.com>
Subject: Re: [Uboot-stm32] [PATCH 00/33] stm32: enable logging features
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

Hi Patrick,

On Wed, 14 Oct 2020 at 03:16, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
>
> This patch-set migrates several stm32 drivers to API compatible with
> logging features (use dev_...() or log_...() function) and activate
> the logging features in STM32MP15 boards.
>
> The size of U-Boot increased by 19kB (933026 to 952830 on STM32MP157C-EV1
> board for basic defconfig) but the boot time don't change drastically.

>
> For example on STM32MP157C-EV1 board:
>
> 1/ Before LOG patchset
>
> Timer summary in microseconds (12 records):
>        Mark    Elapsed  Stage
>           0          0  reset
>     224,514    224,514  SPL
>     961,170    736,656  end SPL
>     964,006      2,836  board_init_f
>   1,186,986    222,980  board_init_r
>   1,651,379    464,393  id=64
>   1,674,463     23,084  id=65
>   1,675,164        701  main_loop
>   4,025,806  2,350,642  id=175
>
> Accumulated time:
>                 55,064  dm_f
>                 66,749  dm_r
>                 88,796  dm_spl
>
> 2/ With LOG activated (after this patchset)
>
> Timer summary in microseconds (12 records):
>        Mark    Elapsed  Stage
>           0          0  reset
>     227,142    227,142  SPL
>     984,585    757,443  end SPL
>     987,579      2,994  board_init_f
>   1,210,091    222,512  board_init_r
>   1,673,354    463,263  id=64
>   1,696,073     22,719  id=65
>   1,696,775        702  main_loop
>   5,443,104  3,746,329  id=175
>
> Accumulated time:
>                 62,154  dm_f
>                 66,264  dm_r
>                 89,376  dm_spl
>
> For information even with all trace embbeded in U-Boot but not
> activated, MAX_LOG_LEVEL=8 and LOG_DEFAULT_LEVEL=6
>
> Size increase by 190KB (952830 to 1147918) but
> boot time is stable (1,748s vs 1,696s).

This seems pretty bad. Is this because of console output, or something
else? I understand the size increase, but not the boot time increase.

>
> STM32MP> bootstage report
> Timer summary in microseconds (12 records):
>        Mark    Elapsed  Stage
>           0          0  reset
>     230,028    230,028  SPL
>     996,117    766,089  end SPL
>     999,082      2,965  board_init_f
>   1,220,225    221,143  board_init_r
>   1,718,641    498,416  id=64
>   1,746,096     27,455  id=65
>   1,748,202      2,106  main_loop
>   4,509,271  2,761,069  id=175
>
> Accumulated time:
>                 58,481  dm_f
>                 68,881  dm_r
>                 89,385  dm_spl
>
>
>
> Patrick Delaunay (33):
>   arm: stm32mp: migrate trace to log macro
>   arm: stm32mp: migrate cmd_stm32prog to log macro
>   arm: stm32mp: bsec: migrate trace to log macro
>   pinctrl: stm32: migrate trace to log macro
>   gpio: stm32-gpio: migrate trace to dev and log macro
>   remoproc: stm32: migrate trace to log macro
>   ram: stm32: migrate trace to log macro
>   ram: stm32mp1: migrate trace to dev or log macro
>   mmc: stm32_sdmmc2: migrate trace to dev and log macro
>   timer: stm32: migrate trace to log macro
>   hwspinlock: stm32: migrate trace to log macro
>   rtc: stm32: migrate trace to log macro
>   watchdog: stm32mp: migrate trace to dev macro
>   power: regulator: stm32-verfbuf: define LOG_CATEGORY
>   misc: rcc: migrate trace to dev macro
>   misc: rcc: keep the rcc device name for subnode
>   clk: stm32mp1: migrate trace to dev and log macro
>   clk: clk_stm32f: migrate trace to dev and log macro
>   clk: clk_stm32h7: migrate trace to dev and log macro
>   reset: stm32-reset: migrate trace to dev and log macro
>   mailbox: stm32-ipcc: migrate trace to dev and log macro
>   i2c: stm32f7_i2c: migrate trace to dev and log macro
>   phy: stm32-usbphyc: migrate trace to dev and log macro
>   spi: stm32_spi: migrate trace to dev and log macro
>   spi: stm32_qspi: migrate trace to dev and log macro
>   mtd: stm32_fmc2: migrate trace to dev and log macro
>   memory: stm32-fmc2: migrate trace to dev and log macro
>   serial: stm32: define LOG_CATEGORY
>   video: stm32_ltdc: migrate trace to dev and log macro
>   video: stm32_dsi: migrate trace to dev and log macro
>   board: st: stm32mp1: migrate trace to dev and log macro
>   board: st: common: migrate trace to dev and log macro
>   configs: stm32mp15: enable LOG features
>
>  arch/arm/mach-stm32mp/boot_params.c           |   8 +-
>  arch/arm/mach-stm32mp/bsec.c                  |  38 +++--
>  arch/arm/mach-stm32mp/cmd_stm32key.c          |   3 +-
>  .../cmd_stm32prog/cmd_stm32prog.c             |   4 +-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 112 ++++++-------
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   2 +-
>  .../cmd_stm32prog/stm32prog_serial.c          |  24 +--
>  .../cmd_stm32prog/stm32prog_usb.c             |  14 +-
>  arch/arm/mach-stm32mp/cpu.c                   |  18 ++-
>  arch/arm/mach-stm32mp/dram_init.c             |   8 +-
>  arch/arm/mach-stm32mp/fdt.c                   |  17 +-
>  arch/arm/mach-stm32mp/pwr_regulator.c         |   2 +
>  arch/arm/mach-stm32mp/spl.c                   |  16 +-
>  board/st/common/stm32mp_dfu.c                 |   3 +-
>  board/st/common/stm32mp_mtdparts.c            |   5 +-
>  board/st/common/stpmic1.c                     |   5 +-
>  board/st/common/stusb160x.c                   |   2 +
>  board/st/stm32mp1/stm32mp1.c                  | 134 ++++++++--------
>  configs/stm32mp15_basic_defconfig             |   2 +
>  configs/stm32mp15_trusted_defconfig           |   1 +
>  drivers/clk/clk_stm32f.c                      |  39 ++---
>  drivers/clk/clk_stm32h7.c                     |  70 +++++----
>  drivers/clk/clk_stm32mp1.c                    | 147 +++++++++---------
>  drivers/gpio/stm32_gpio.c                     |   4 +-
>  drivers/hwspinlock/stm32_hwspinlock.c         |   2 +
>  drivers/i2c/stm32f7_i2c.c                     |  74 ++++-----
>  drivers/mailbox/stm32-ipcc.c                  |  16 +-
>  drivers/memory/stm32-fmc2-ebi.c               |  30 ++--
>  drivers/misc/stm32_rcc.c                      |  10 +-
>  drivers/mmc/stm32_sdmmc2.c                    |  85 +++++-----
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c        |  40 +++--
>  drivers/phy/phy-stm32-usbphyc.c               |  18 ++-
>  drivers/pinctrl/pinctrl_stm32.c               |  30 ++--
>  drivers/power/regulator/stm32-vrefbuf.c       |   2 +
>  drivers/ram/stm32_sdram.c                     |  10 +-
>  drivers/ram/stm32mp1/stm32mp1_ddr.c           |  36 +++--
>  drivers/ram/stm32mp1/stm32mp1_interactive.c   |   4 +-
>  drivers/ram/stm32mp1/stm32mp1_ram.c           |  37 +++--
>  drivers/ram/stm32mp1/stm32mp1_tests.c         |  19 ++-
>  drivers/ram/stm32mp1/stm32mp1_tuning.c        | 124 +++++++--------
>  drivers/remoteproc/stm32_copro.c              |   3 +-
>  drivers/reset/stm32-reset.c                   |  13 +-
>  drivers/rtc/stm32_rtc.c                       |   3 +
>  drivers/serial/serial_stm32.c                 |   3 +
>  drivers/spi/stm32_qspi.c                      |  46 +++---
>  drivers/spi/stm32_spi.c                       |  31 ++--
>  drivers/timer/stm32_timer.c                   |   2 +
>  drivers/video/stm32/stm32_dsi.c               |  18 ++-
>  drivers/video/stm32/stm32_ltdc.c              |  33 ++--
>  drivers/watchdog/stm32mp_wdt.c                |   9 +-
>  50 files changed, 731 insertions(+), 645 deletions(-)
>
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
