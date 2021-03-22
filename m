Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2CB343BCB
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Mar 2021 09:29:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D9F6C58D5B;
	Mon, 22 Mar 2021 08:29:02 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CED0EC58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 08:29:00 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id k25so890187iob.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 01:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=gsFtAJir8w+QUwjCfzeO9Qzl9yCvsHW5ae5Vu5vfP28=;
 b=NRHBNYWYFSsIujxEDrl23QQ3AxfSObm524T+DXgNWSmnG6glCNlOtedcLOJdNdTSg6
 CFc1vHpUirYBHIQo8GnMiaroQvBnslbmdcPCqXgI+zxvPLZX8M0kCWENm/msU69rS8Ns
 MgdvNBcMADU1J/yC4lZaMNDGpwnlar41TlOqdoZz2NnExQYGLeoM1uoA5oCQxWTxLyRk
 F/UqlAtyI+4dtWFIfWzc42zgDDYXjqTuGbHVJft0HnrE/ha3QdE+3KRs0bLrrWWjGZ2x
 hwaFY+cVtmAwFw+9tgI3oZAcqinmQd7YK7gu6KvjWTINXOPpCcUFdrbdV27mnfIH7wPp
 nC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=gsFtAJir8w+QUwjCfzeO9Qzl9yCvsHW5ae5Vu5vfP28=;
 b=fbdDmLjWiAfPiv5faUletp0kFth6uSRAGEgGFQx7k/clrDCw9CHPc13kFyg2CkOScr
 ZXKzYRod3WjXpuudnfU9EohT5oYHp7jqhSeia8j7P3tQr+wXCfXw1+5h3Fqhe30sn5GJ
 Fn5RqRN58efj27oC1H3o9ZmWZHZJSqzbztvNaZkBNhvKeo+R2cV3ru7Gw8Rg8Ov+vUIF
 gGgXAEgHUbTnc2/GiQ/FTMpjABzhOuiWaNhzSYIJwduSta3oVhhPNLezSYNaAAY23z4O
 bOoJkXbuLpamyOWUdZ7ugKfFuAZw0fSQgHh0rDH4RXOpgUoBlOak01ncletRHjHJQcK8
 Pn/Q==
X-Gm-Message-State: AOAM533IlWmULzHoKEBxVyHUkU3aInpBueontARICxoPbyk+/qk9cuwf
 ddPuVh4oHUXppdmksUpx3egUjs49yH58mxEPhNY=
X-Google-Smtp-Source: ABdhPJxeCQBhdQf0Q10TPraXeFc7TeZvGuT1DH9UOhLiB0wJ7tJbKz5nfsKdRKLHFzQSZAW3VDMGhag7/LBuVCCuoOo=
X-Received: by 2002:a05:6638:d47:: with SMTP id
 d7mr10209587jak.2.1616401739092; 
 Mon, 22 Mar 2021 01:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 22 Mar 2021 16:28:23 +0800
Message-ID: <CAL9mu0J0Ggv1_02vhDOjf6r5XH_nPEDoWMGxsEN5tsnBuGevuQ@mail.gmail.com>
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com, 
 Jagan Teki <jagan@amarulasolutions.com>, narmstrong@baylibre.com,
 marex@denx.de, 
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr, 
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com, 
 u-boot@lists.denx.de, patrice.chotard@foss.st.com, 
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 0/4] Add rt-thread art-pi board support
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

Hi,

Just a gentle ping.

On Thu, Mar 11, 2021 at 2:44 PM <dillon.minfei@gmail.com> wrote:
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
> dillon min (4):
>   ARM: dts: stm32: split sdram pin & timing parameter into specific
>     board dts
>   ARM: dts: stm32: Add RT-Thread art-pi board support
>   board: Add rt-thread art-pi board support
>   ram: stm32: fix strsep failed on read only memory
>
>  arch/arm/dts/Makefile                        |   3 +-
>  arch/arm/dts/stm32h7-u-boot.dtsi             |  95 --------
>  arch/arm/dts/stm32h743.dtsi                  |   8 +
>  arch/arm/dts/stm32h743i-disco-u-boot.dtsi    |  98 ++++++++
>  arch/arm/dts/stm32h743i-eval-u-boot.dtsi     |  98 ++++++++
>  arch/arm/dts/stm32h750-pinctrl.dtsi          | 319 +++++++++++++++++++++++++++
>  arch/arm/dts/stm32h750.dtsi                  |   5 +
>  arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi   |  81 +++++++
>  arch/arm/dts/stm32h750i-art-pi.dts           |  75 +++++++
>  arch/arm/mach-stm32/stm32h7/Kconfig          |   4 +
>  board/st/stm32h750-art-pi/Kconfig            |  19 ++
>  board/st/stm32h750-art-pi/MAINTAINERS        |   7 +
>  board/st/stm32h750-art-pi/Makefile           |   6 +
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c |  58 +++++
>  configs/stm32h750-art-pi_defconfig           |  51 +++++
>  drivers/ram/stm32_sdram.c                    |   3 +
>  include/configs/stm32h750-art-pi.h           |  48 ++++
>  include/dt-bindings/memory/stm32-sdram.h     |   2 +
>  18 files changed, 884 insertions(+), 96 deletions(-)
>  create mode 100644 arch/arm/dts/stm32h750-pinctrl.dtsi
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
