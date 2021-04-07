Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DCE35612B
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Apr 2021 04:01:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEF91C32E8F;
	Wed,  7 Apr 2021 02:01:11 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADE6CC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 02:01:10 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id e8so17694198iok.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Apr 2021 19:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tjbIScF4Kv5KP7ZjSs9UqPUEiBCkJChzANYf1l0U2D4=;
 b=ok1tjc6wxdp/+qZZjFLH2X1bHEzfJmjuGOAIb/zGD0r0XQF++URoLzr6GYHFP9ymwk
 ca5S2EBUfog/RirpOSbm+oy9fBaB7fhB2YFPv9RypA+EwzZEAdN7HHwQRRptKcxApVHT
 MWyy3xbnL/niw5AZ9AqfFBLfTV5msLeWgBUKTqvt9GS2ViMG3MocYz/sADoHlAaS5U91
 I7mY8Fy86knUbs6Q5OuqrSQZj2sF6hoDihhNRBFTYdYsFRqoDNpWUZ8pubAiCwxpEnSl
 e2ZnJ7zfeldLqN217hoSnfc8xBEB8H5YVGFq3xx7G0Lu0XHtdtTPH0YFQKjm5iQhxY7O
 iV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tjbIScF4Kv5KP7ZjSs9UqPUEiBCkJChzANYf1l0U2D4=;
 b=ULSSb0NsAgk8+EMbAvjZ/0RktVNwZdrx1puqPjwzb/p2S0qzpaafRmDpP8NfiWsXYX
 g9aYK2NwitfTQX0Ut9e7PRhCgVY2+CN6sHmeo3rtSOClCGkOzR9b5FqAOb5gza/YAkX6
 vJ8066qW/9y5nTWt5+DRcWilBOwk+9EqBStFWHbZnlSl+G6HRmLiSaMQZDSyXKc8pn33
 Mn+Y3fisSuw/0ELJtXd4dbKXtBVvZlO/k1DKoQQERsGk7nKUOXJOCTXwaOBnoKTuvTZI
 y0NoP5gjEihO/r9loj+DKJ8AJRX5nD+lgLjnGaExiXeSfxRkNQ6sFr7gQtwicip0gg9y
 b8CQ==
X-Gm-Message-State: AOAM5318YgswBeQ81mfc2a7cx0yP3l11U6RjCiPG+9LXM8/1x3oKUDYI
 WplHOxoyKfEnf7Eb+FMmZhUviLr9Sp5C7We6czg=
X-Google-Smtp-Source: ABdhPJxbXUpu94bpnVBkSHXDhPcDwfcP516lW16w+9Hg21yex3BYzr7rWSZmBM0a1Jp79FPl4HTQW54iea2vLP+YoHc=
X-Received: by 2002:a05:6602:280f:: with SMTP id
 d15mr606407ioe.127.1617760869498; 
 Tue, 06 Apr 2021 19:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 7 Apr 2021 10:00:33 +0800
Message-ID: <CAL9mu0J04K3rhYq3HuKxAnGTOg-sfA+DKETtztP2i+KfKHiH-g@mail.gmail.com>
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com, 
 Jagan Teki <jagan@amarulasolutions.com>, narmstrong@baylibre.com,
 marex@denx.de, 
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr, 
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com, 
 u-boot@lists.denx.de, Patrice CHOTARD <patrice.chotard@foss.st.com>, 
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com, 
 sjg@chromium.org
Subject: Re: [Uboot-stm32] [PATCH v4 0/7] Add rt-thread art-pi board support
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

Hi All,

Just a gentle ping, thanks.

Regards

On Fri, Apr 2, 2021 at 4:42 PM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> These patches aim to adds u-boot support on art-pi board.
>
> the board resources:
> - stm32h750xbh6 128k flash, 1024k sram
> - 32MiB sdram
> - 16MiB spi flash
> - 8MiB qspi flash
> - onboard wifi, bt, fm
>
> the detail board information can be found at:
> https://art-pi.gitee.io/website/
>
> ---
> changes in v4:
> - sync with kernel side device tree submit
> - use strlcpy in stm32_sdram.c
> - update CONFIG_BOOTARGS, remove rdinit=/linuxrc, to use kernel's devtmpfs
> - remove unused st,stm32h750-pinctrl from patch v3
>
> changes in v3:
> two mirror changes in [PATCH v3 2/6], others same to version 2
> - remove "for STMicroelectronics." from arch/arm/dts/stm32h750-pinctrl.dtsi
> - correct misspelling parameters
> you can found detail patch v2 information at link:
> https://patchwork.ozlabs.org/project/uboot/list/?series=236009
>
> changes in v2:
> - fix wrong author/date in previous submit
> - sync with kernel device tree files
> - add st,stm32h750-pinctrl in doc and pinctrl driver
>
> *** BLURB HERE ***
>
> dillon min (7):
>   ARM: dts: stm32: split sdram pin & timing parameter into specific
>     board dts
>   ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h750
>   ARM: dts: stm32: add new instances for stm32h743 MCU
>   ARM: dts: stm32: fix i2c node typo in stm32h743, update dmamux1
>     register
>   ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
>   ram: stm32: fix strsep failed on read only memory
>   board: Add rt-thread art-pi board support
>
>  arch/arm/dts/Makefile                        |   3 +-
>  arch/arm/dts/stm32h7-pinctrl.dtsi            | 274 ++++++++++++++++++++++++
>  arch/arm/dts/stm32h7-u-boot.dtsi             | 100 +--------
>  arch/arm/dts/stm32h743-pinctrl.dtsi          | 306 ---------------------------
>  arch/arm/dts/stm32h743.dtsi                  | 178 +++++++++++++++-
>  arch/arm/dts/stm32h743i-disco-u-boot.dtsi    |  98 +++++++++
>  arch/arm/dts/stm32h743i-disco.dts            |   2 +-
>  arch/arm/dts/stm32h743i-eval-u-boot.dtsi     |  98 +++++++++
>  arch/arm/dts/stm32h743i-eval.dts             |   2 +-
>  arch/arm/dts/stm32h750.dtsi                  |   5 +
>  arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi   |  81 +++++++
>  arch/arm/dts/stm32h750i-art-pi.dts           | 188 ++++++++++++++++
>  arch/arm/mach-stm32/stm32h7/Kconfig          |   4 +
>  board/st/stm32h750-art-pi/Kconfig            |  19 ++
>  board/st/stm32h750-art-pi/MAINTAINERS        |   7 +
>  board/st/stm32h750-art-pi/Makefile           |   6 +
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c |  58 +++++
>  configs/stm32h750-art-pi_defconfig           |  51 +++++
>  drivers/ram/stm32_sdram.c                    |   3 +
>  include/configs/stm32h750-art-pi.h           |  48 +++++
>  include/dt-bindings/memory/stm32-sdram.h     |   2 +
>  21 files changed, 1126 insertions(+), 407 deletions(-)
>  create mode 100644 arch/arm/dts/stm32h7-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32h743-pinctrl.dtsi
>  create mode 100644 arch/arm/dts/stm32h750.dtsi
>  create mode 100644 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32h750i-art-pi.dts
>  create mode 100644 board/st/stm32h750-art-pi/Kconfig
>  create mode 100644 board/st/stm32h750-art-pi/MAINTAINERS
>  create mode 100644 board/st/stm32h750-art-pi/Makefile
>  create mode 100644 board/st/stm32h750-art-pi/stm32h750-art-pi.c
>  create mode 100644 configs/stm32h750-art-pi_defconfig
>  create mode 100644 include/configs/stm32h750-art-pi.h
>
> --
> 2.7.4
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
