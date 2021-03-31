Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D4734FC80
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Mar 2021 11:19:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 690CCC5662E;
	Wed, 31 Mar 2021 09:19:44 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8506C32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 09:19:41 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id e186so1859252iof.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=weY6SZCdlbSAUCelNa9pqJN4V1vD4kaEO2zbquIK0Rs=;
 b=dyTOv4XcbiBLwcE5iPczMA9sypXbpqlyNdaaeJSzBC98RQM/e0ThRKL1oWjkQFTk1l
 sqshNLrvGnfpDlw5lOtWPyqNkE+yNSebyjDJIQcUgLJ57Q7zWIRqTwqqgQM05xvHqgEC
 5/RS50ynWox8pdtjYUfZGwtke4mmeDn0iFH1UlEiB8X2lB8+VeQhsY8pnW3f3y6IIvfb
 9VPvWpLfL0qQDKAwOkcRTQjjZjAME2wies9RPFN+2+OJJu44yQ8D566NydIS++SnPvwh
 U1GPpLvMjXQx+IGOVFKG8dVcVUFA0tU1lZE/sqPHwZqqqRdeojH6WaA9aGyVzWVS44lf
 DSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=weY6SZCdlbSAUCelNa9pqJN4V1vD4kaEO2zbquIK0Rs=;
 b=t7pSzvUImqEqp6uGa5izZSs6O68AeP9itKpZ/w/bY5NQxny5XuDxPemdaPADBHVQHn
 VXEcVxsw3ibny3IxLen9oEYbPbPku1dCv6e4Q8wAMp9sNze41hfXwvW2EysjDVZ3xSlk
 tF15Ph61ownm4Z0WULXeXDhajVk/qQYst78/371r2AgBT7sdDk1YJKpfiMDofmn0YiNO
 +akJiLG4Bs+Mo/J9Mg3/bPe5OTAG+k6Ufc4Dt5v1T3xI49s/m/Czc3PE3gAp+JwAdT05
 JeOeQpFGxs/g/yt/6IVwLvZzT6N/lTi0e1Wmrk4o1ar/4uZi2ZND/ebjY9nScwzOJann
 bJdQ==
X-Gm-Message-State: AOAM5306mgPQJspA+FtYAOcj5RKCLH+Q+Ii/sM5IO5+CQ6XsjyNxHgpC
 H/kiff98zs9B5O5fN4/Ur31rmJVyZE6YFVHt2cA=
X-Google-Smtp-Source: ABdhPJxo869MMddXL4ZYz9gmeVgc8CD+KN7bKVkxa/oqAgMUjuc/fvebMzT0G0XH79XLOFsgsLq+Dw1popbDkMG00Cc=
X-Received: by 2002:a05:6602:280f:: with SMTP id
 d15mr1543935ioe.127.1617182380532; 
 Wed, 31 Mar 2021 02:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
 <cb2cd5bf-9f64-3076-6645-215769f4d271@foss.st.com>
In-Reply-To: <cb2cd5bf-9f64-3076-6645-215769f4d271@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 31 Mar 2021 17:19:04 +0800
Message-ID: <CAL9mu0KyQVqY1ZM7U5MZ14ovdGD54mXG3vfMhwTtU3wjnueMiw@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: marex@denx.de, heiko.stuebner@theobroma-systems.com,
 josip.kelecic@sartura.hr, narmstrong@baylibre.com, andre.przywara@arm.com,
 ioana.ciornei@nxp.com, kever.yang@rock-chips.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>, festevam@gmail.com,
 priyanka.jain@nxp.com, patrick.delaunay@foss.st.com, hs@denx.de,
 aford173@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v3 0/6] Add rt-thread art-pi board support
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

Hi Patrice,

Thanks for the reply,

On Wed, Mar 31, 2021 at 5:05 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> Hi Dillon
>
> I discussed with Alexandre Torque about the pinctrl rework you did on kernel side for stm32h750.
> When the kernel series will be fully accepted on kernel side, you can resubmit the equivalent on u-boot side.
>
Agree, I loop you to the kernel mailing list , just let you know the
status of device tree review on kernel side,  i'll hold u-boot's patch
submission, until kernel's patch is fully accepted.

> Nevertheless, there is one issue I didn't spot on previous review regarding patch 4 "ram: stm32: fix strsep failed on read only memory"
>
Okay, i'm going to rework that patch, thanks.

> Patrice
>
> On 3/29/21 5:04 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > These patches aim to adds u-boot support on art-pi board.
> >
> > the board resources:
> > - stm32h750xbh6 128k flash, 1024k sram
> > - 32MiB sdram
> > - 16MiB spi flash
> > - 8MiB qspi flash
> > - onboard wifi, bt, fm
> >
> > the detail board information can be found at:
> > https://art-pi.gitee.io/website/
> >
> > ---
> > changes in v3:
> > two mirror changes in [PATCH v3 2/6], others same to version 2
> > - remove "for STMicroelectronics." from arch/arm/dts/stm32h750-pinctrl.dtsi
> > - correct misspelling parameters
> > you can found detail patch v2 information at link:
> > https://patchwork.ozlabs.org/project/uboot/list/?series=236009
> >
> > changes in v2:
> > - fix wrong author/date in previous submit
> > - sync with kernel device tree files
> > - add st,stm32h750-pinctrl in doc and pinctrl driver
> >
> >
> > *** BLURB HERE ***
> >
> > dillon min (6):
> >   ARM: dts: stm32: split sdram pin & timing parameter into specific
> >     board dts
> >   ARM: dts: stm32: Add RT-Thread art-pi board support
> >   board: Add rt-thread art-pi board support
> >   ram: stm32: fix strsep failed on read only memory
> >   dt-bindings: pinctrl: stm32: Add st,stm32h750-pinctrl for stm32h750
> >     soc
> >   pinctrl: stm32: Add st,stm32h750-pinctrl compatible string
> >
> >  arch/arm/dts/Makefile                              |   3 +-
> >  arch/arm/dts/stm32h7-pinctrl.dtsi                  | 340 +++++++++++++++++++++
> >  arch/arm/dts/stm32h7-u-boot.dtsi                   | 100 +-----
> >  arch/arm/dts/stm32h743-pinctrl.dtsi                | 307 +------------------
> >  arch/arm/dts/stm32h743.dtsi                        | 168 +++++++++-
> >  arch/arm/dts/stm32h743i-disco-u-boot.dtsi          |  98 ++++++
> >  arch/arm/dts/stm32h743i-eval-u-boot.dtsi           |  98 ++++++
> >  arch/arm/dts/stm32h750-pinctrl.dtsi                |  11 +
> >  arch/arm/dts/stm32h750.dtsi                        |   5 +
> >  arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi         |  81 +++++
> >  arch/arm/dts/stm32h750i-art-pi.dts                 | 188 ++++++++++++
> >  arch/arm/mach-stm32/stm32h7/Kconfig                |   4 +
> >  board/st/stm32h750-art-pi/Kconfig                  |  19 ++
> >  board/st/stm32h750-art-pi/MAINTAINERS              |   7 +
> >  board/st/stm32h750-art-pi/Makefile                 |   6 +
> >  board/st/stm32h750-art-pi/stm32h750-art-pi.c       |  58 ++++
> >  configs/stm32h750-art-pi_defconfig                 |  51 ++++
> >  .../pinctrl/st,stm32-pinctrl.txt                   |   1 +
> >  drivers/pinctrl/pinctrl_stm32.c                    |   1 +
> >  drivers/ram/stm32_sdram.c                          |   3 +
> >  include/configs/stm32h750-art-pi.h                 |  48 +++
> >  include/dt-bindings/memory/stm32-sdram.h           |   2 +
> >  22 files changed, 1198 insertions(+), 401 deletions(-)
> >  create mode 100644 arch/arm/dts/stm32h7-pinctrl.dtsi
> >  create mode 100644 arch/arm/dts/stm32h750-pinctrl.dtsi
> >  create mode 100644 arch/arm/dts/stm32h750.dtsi
> >  create mode 100644 arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
> >  create mode 100644 arch/arm/dts/stm32h750i-art-pi.dts
> >  create mode 100644 board/st/stm32h750-art-pi/Kconfig
> >  create mode 100644 board/st/stm32h750-art-pi/MAINTAINERS
> >  create mode 100644 board/st/stm32h750-art-pi/Makefile
> >  create mode 100644 board/st/stm32h750-art-pi/stm32h750-art-pi.c
> >  create mode 100644 configs/stm32h750-art-pi_defconfig
> >  create mode 100644 include/configs/stm32h750-art-pi.h
> >
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
