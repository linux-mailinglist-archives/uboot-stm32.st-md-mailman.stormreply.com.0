Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA934A578
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Mar 2021 11:27:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67980C57B79;
	Fri, 26 Mar 2021 10:27:02 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C531BC57B60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 10:27:00 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id l5so4593967ilv.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 03:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g7QZyaLM2l85pT7x8ILVBvg4JNCpvawzNNA9CB05UzY=;
 b=hY8ntwe+Op7PTzTx3dK2oVeasoWz1rVZ6mAN1VoBh+iL0jCraUe8GSmkRNo1BQtve6
 9dF7cm8EuWhKGsyn13Qar6jC6TaE0SYLSdRnBeBvVpKH6YMaPnGoKhBDdk61BH5RueKh
 1WnWJ41k13j0a0NmqNp6dP92qv/0YoejknWJxATxBGRTpZXEyDt61oVH5SwogHOIDEz0
 t1dldziYcYNLSBaB3EGIv0oLpb4UXWDCxlEfHFRFwHkbUVo3EqFTT4RXdDKLdue8CSXJ
 6mfe3hsriP/aHhCWztowka/2kjUbEh7RtiMrS8AycVcgzLKizW+1GelAy07ZMPjxmRQI
 NeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g7QZyaLM2l85pT7x8ILVBvg4JNCpvawzNNA9CB05UzY=;
 b=Qx96yjbcUScRVto6OuQ87F1D4ayWKFV2Cvw9ujt63GLS48i2uTUym5BlEE8FT8fF3w
 hsiN8J/EaUuYcXOF4Xpk4hPcOkelecHvFCmCG7Fvm2j60Hu8GbfoNWJaOKulbqFfRNkV
 phDBv0raM5X4GC64GPbC1PW8U9mKYKukLbbdC7Jt3dWDuyYGdb0vhhjvGOZQRqdD6NkB
 z4dMyBitB7irpjv11MYq/OHzY3yQDNDydoVN+gOOScbDFZTYwZd/UCAqFDS2tkHyGbe+
 lXjTL6khxEazaKTVIGXMJV3BKYoWfXThpkbJFV6zywlwNMM5BrFI2vrqytDGrAypHv32
 bHgg==
X-Gm-Message-State: AOAM532Cy4iAMeGaHc1NZO1X+/9SnW4DM0oqpfqrwnMW2JNB0fZv77Xe
 QRx/Lr2WDEYnB3CDMfda+JUK1GK7HHDBUd2ouPI=
X-Google-Smtp-Source: ABdhPJz9gQnY8yeXxsDBzsaa9GstN7vuzwXPFJj4/gP2+OdL/QGyh4mEhI/lh5mm4PEDPC+6shv0JKaIXsQDB4D9+0Q=
X-Received: by 2002:a05:6e02:156e:: with SMTP id
 k14mr9992463ilu.200.1616754419659; 
 Fri, 26 Mar 2021 03:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
 <102900f0-f583-2195-edd5-6d3052313de9@foss.st.com>
In-Reply-To: <102900f0-f583-2195-edd5-6d3052313de9@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 26 Mar 2021 18:26:23 +0800
Message-ID: <CAL9mu0Kprf2-+MtF=6vQ2g_x-u6Rxxwv1OKFYg+MOqG_1dK85A@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: marex@denx.de, heiko.stuebner@theobroma-systems.com,
 josip.kelecic@sartura.hr, narmstrong@baylibre.com, andre.przywara@arm.com,
 ioana.ciornei@nxp.com, kever.yang@rock-chips.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>, festevam@gmail.com,
 priyanka.jain@nxp.com, patrick.delaunay@foss.st.com, hs@denx.de,
 aford173@gmail.com
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

Hi Patrice,

Thanks for your review.

On Thu, Mar 25, 2021 at 10:41 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> Hi Dillon
>
> One general remark, i saw that you have submitted a similar serie on kernel side
> to add rt_thread art-pi board support.
> On this kernel series, you split the DT pinctrl files by introducing stm32h7-pinctrl.dtsi file.
> Can you apply the same device tree files split between kernel and u-boot please.
>
> The idea is that u-boot and kernel device tree files are in sync.
>
> Thanks
> Patrice
>
Agree, i just send out patch v2 for sync with kernel device tree files, and fix
incorrect author name & date.

thanks again.
regards.
>
>
> On 3/11/21 7:43 AM, dillon.minfei@gmail.com wrote:
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
> > dillon min (4):
> >   ARM: dts: stm32: split sdram pin & timing parameter into specific
> >     board dts
> >   ARM: dts: stm32: Add RT-Thread art-pi board support
> >   board: Add rt-thread art-pi board support
> >   ram: stm32: fix strsep failed on read only memory
> >
> >  arch/arm/dts/Makefile                        |   3 +-
> >  arch/arm/dts/stm32h7-u-boot.dtsi             |  95 --------
> >  arch/arm/dts/stm32h743.dtsi                  |   8 +
> >  arch/arm/dts/stm32h743i-disco-u-boot.dtsi    |  98 ++++++++
> >  arch/arm/dts/stm32h743i-eval-u-boot.dtsi     |  98 ++++++++
> >  arch/arm/dts/stm32h750-pinctrl.dtsi          | 319 +++++++++++++++++++++++++++
> >  arch/arm/dts/stm32h750.dtsi                  |   5 +
> >  arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi   |  81 +++++++
> >  arch/arm/dts/stm32h750i-art-pi.dts           |  75 +++++++
> >  arch/arm/mach-stm32/stm32h7/Kconfig          |   4 +
> >  board/st/stm32h750-art-pi/Kconfig            |  19 ++
> >  board/st/stm32h750-art-pi/MAINTAINERS        |   7 +
> >  board/st/stm32h750-art-pi/Makefile           |   6 +
> >  board/st/stm32h750-art-pi/stm32h750-art-pi.c |  58 +++++
> >  configs/stm32h750-art-pi_defconfig           |  51 +++++
> >  drivers/ram/stm32_sdram.c                    |   3 +
> >  include/configs/stm32h750-art-pi.h           |  48 ++++
> >  include/dt-bindings/memory/stm32-sdram.h     |   2 +
> >  18 files changed, 884 insertions(+), 96 deletions(-)
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
