Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9334B753
	for <lists+uboot-stm32@lfdr.de>; Sat, 27 Mar 2021 14:11:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0CCFC57183;
	Sat, 27 Mar 2021 13:11:07 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CEBEC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Mar 2021 13:11:05 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id h7so261896ilj.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Mar 2021 06:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KjgzdAYxsVzHPwI6x1Py0lA8hC37+nh2KxWwPjbnLs8=;
 b=dYfLqnoXDG8DewKVV0Pg+TaO8U0L6Kv4gASN1O+Fg1di6a1HpA32j5aX2uxUa14ov7
 6nNXpTZZw5QcDXoeaZtlIhKGxQMmQAeLk9/c+odc/NreGHMnj+BBKcQwlEYK6MzHJgYw
 o6R2Fc8mAbQYjMbgIKIcmcrYzasrYAQmcPgG6dKCFNc6U6+OLZzFhEcJjmvHDib7rYDd
 9cXANdR0tdp5jGo9gzKXUrfr/+dwV60IjO+FJWCBbGFswhtGh6HPPjLENSbbVs+jzYBf
 f4N+VZ7Vaa/xoMBI9UuTPrIqt8JtFy4xVZwv1JE61w6MCggdZQ4bsvod7chIybBCHZfz
 SODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KjgzdAYxsVzHPwI6x1Py0lA8hC37+nh2KxWwPjbnLs8=;
 b=j3LaFYQFc7ZW68jtu5CemYi46HHvtbiJhnxlMSafmMn+gt9P0hrp0OkYJh33TM2rHx
 DM5rPOU48rD47zZYimS/7+Bx/D0UfZKYdWnm8B19aTlQ6RkcrnfgAEgbaxbX/gkknqVo
 oTtr1kQkDQrF0TAn2vGK7dzfzokOsUUBlixv6xFcK3koCI5iOAtNZeJYXDypXNTb3duv
 aRy1cDu5Ebh8zZhY1LnEr9REadWsvimw3YA570/je8p2H2cSow13MOLd8ew37mlEGo9D
 TjFP7GMzATyipFec9abpK4SzDxqY/C1DpRAwelYUnD6LJOS7Rf82ABRI+oW/jkceG7gZ
 3+8Q==
X-Gm-Message-State: AOAM532AYf63njXmajmxIYWRPVTbo3YUdJ+K2DAzrrSoA0DIhvh+45Mx
 d1didRkJW6SjQ17uilDM5NFf+0zqaP0vpUy8EHw=
X-Google-Smtp-Source: ABdhPJx70p1/+ZZSCzivwzeB0kL1+9tRmndMuncRNutsae7kBqxZVjsVh2tKmPod9TFGaPnGnQciCF7ijl/eIpEkJeM=
X-Received: by 2002:a05:6e02:198e:: with SMTP id
 g14mr13728969ilf.271.1616850664055; 
 Sat, 27 Mar 2021 06:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
 <1616754267-13845-3-git-send-email-dillon.minfei@gmail.com>
 <887b21f8-c22a-cfad-e026-b683dad7cc6e@foss.st.com>
In-Reply-To: <887b21f8-c22a-cfad-e026-b683dad7cc6e@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Sat, 27 Mar 2021 13:10:29 +0800
Message-ID: <CAL9mu0L4NLDJwCmCZf2j=B6-8oFyiEkCxivp6wwAwKo0T2jaiQ@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: marex@denx.de, heiko.stuebner@theobroma-systems.com,
 josip.kelecic@sartura.hr, narmstrong@baylibre.com, andre.przywara@arm.com,
 ioana.ciornei@nxp.com, kever.yang@rock-chips.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>, festevam@gmail.com,
 priyanka.jain@nxp.com, patrick.delaunay@foss.st.com, hs@denx.de,
 aford173@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/6] ARM: dts: stm32: Add RT-Thread
	art-pi board support
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

Thanks for the quick reply.

On Fri, Mar 26, 2021 at 10:24 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> some minors remark below
>
> with this, you can add
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> thanks
>
> Patrice
>
> On 3/26/21 11:24 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > All these files are add for support rt-thread art-pi board
> >
> > the detail board information can be found at:
> > https://art-pi.gitee.io/website/
> >
> > board resources:
> > - stm32h750xbh6 128k flash, 1024k sram
> > - 32MiB sdram
> > - 16MiB spi flash
> > - 8MiB qspi flash
> > - onboard wifi, bt, fm
> >
> > Add following changes to sync with kernel device tree files:
> > - add stm32h7-pinctrl.dtsi to include pin defines for all stm32h743/50 boards
> > - add stm32h7(5/3)0-pinctrl.dtsi
> > - move gpio(a..k) register defines to stm32h743.dtsi, sync with kernel
> > - introduce stm32h750i-art-pi-u-boot.dtsi for sdram paramter, fmc pins
>
> s/parmeter/parameter
Okay.
>
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
>
> [...]
Will add diff description in next submission.
>
> > diff --git a/arch/arm/dts/stm32h750-pinctrl.dtsi b/arch/arm/dts/stm32h750-pinctrl.dtsi
> > new file mode 100644
> > index 0000000..24e9997
> > --- /dev/null
> > +++ b/arch/arm/dts/stm32h750-pinctrl.dtsi
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> > +/*
> > + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> > + * Author: Dillon Min  <dillon.minfei@gmail.com> for STMicroelectronics.
>
> As you are not member of STMicroelectronics company, remove the "for STMicroelectronics."
Okay, thanks.
>
> > + */
> > +
> > +#include "stm32h7-pinctrl.dtsi"
> > +
> > +&pinctrl{
> > +     compatible = "st,stm32h750-pinctrl";
> > +};
> > diff --git a/arch/arm/dts/stm32h750.dtsi b/arch/arm/dts/stm32h750.dtsi
> > new file mode 100644
> > index 0000000..99533f3
> > --- /dev/null
> > +++ b/arch/arm/dts/stm32h750.dtsi
> > @@ -0,0 +1,5 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> > +/* Copyright (C) STMicroelectronics 2021 - All Rights Reserved */
> > +
> > +#include "stm32h743.dtsi"
> > +
> > diff --git a/arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi b/arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
> > new file mode 100644
> > index 0000000..326a553
> > --- /dev/null
> > +++ b/arch/arm/dts/stm32h750i-art-pi-u-boot.dtsi
> > @@ -0,0 +1,81 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +#include <stm32h7-u-boot.dtsi>
> > +
> > +&fmc {
> > +     /*
> > +      * Memory configuration from sdram datasheet W9825G6KH
> > +      * first bank is bank@0
> > +      * second bank is bank@1
> > +      */
> > +     bank1: bank@0 {
> > +             st,sdram-control = /bits/ 8 <NO_COL_9
> > +                                          NO_ROW_13
> > +                                          MWIDTH_16
> > +                                          BANKS_4
> > +                                          CAS_2
> > +                                          SDCLK_3
> > +                                          RD_BURST_EN
> > +                                          RD_PIPE_DL_0>;
> > +             st,sdram-timing = /bits/ 8 <TMRD_2
> > +                                         TXSR_6
> > +                                         TRAS_6
> > +                                         TRC_6
> > +                                         TRP_2
> > +                                         TWR_2
> > +                                         TRCD_2>;
> > +             st,sdram-refcount = <677>;
> > +     };
> > +};
> > +
> > +&pinctrl {
> > +     fmc_pins: fmc@0 {
> > +             pins {
> > +                     pinmux = <STM32_PINMUX('D', 0, AF12)>,
> > +                              <STM32_PINMUX('D', 1, AF12)>,
> > +                              <STM32_PINMUX('D', 8, AF12)>,
> > +                              <STM32_PINMUX('D', 9, AF12)>,
> > +                              <STM32_PINMUX('D',10, AF12)>,
> > +                              <STM32_PINMUX('D',14, AF12)>,
> > +                              <STM32_PINMUX('D',15, AF12)>,
> > +
> > +                              <STM32_PINMUX('E', 0, AF12)>,
> > +                              <STM32_PINMUX('E', 1, AF12)>,
> > +                              <STM32_PINMUX('E', 7, AF12)>,
> > +                              <STM32_PINMUX('E', 8, AF12)>,
> > +                              <STM32_PINMUX('E', 9, AF12)>,
> > +                              <STM32_PINMUX('E',10, AF12)>,
> > +                              <STM32_PINMUX('E',11, AF12)>,
> > +                              <STM32_PINMUX('E',12, AF12)>,
> > +                              <STM32_PINMUX('E',13, AF12)>,
> > +                              <STM32_PINMUX('E',14, AF12)>,
> > +                              <STM32_PINMUX('E',15, AF12)>,
> > +
> > +                              <STM32_PINMUX('F', 0, AF12)>,
> > +                              <STM32_PINMUX('F', 1, AF12)>,
> > +                              <STM32_PINMUX('F', 2, AF12)>,
> > +                              <STM32_PINMUX('F', 3, AF12)>,
> > +                              <STM32_PINMUX('F', 4, AF12)>,
> > +                              <STM32_PINMUX('F', 5, AF12)>,
> > +                              <STM32_PINMUX('F',11, AF12)>,
> > +                              <STM32_PINMUX('F',12, AF12)>,
> > +                              <STM32_PINMUX('F',13, AF12)>,
> > +                              <STM32_PINMUX('F',14, AF12)>,
> > +                              <STM32_PINMUX('F',15, AF12)>,
> > +
> > +                              <STM32_PINMUX('G', 0, AF12)>,
> > +                              <STM32_PINMUX('G', 1, AF12)>,
> > +                              <STM32_PINMUX('G', 2, AF12)>,
> > +                              <STM32_PINMUX('G', 4, AF12)>,
> > +                              <STM32_PINMUX('G', 5, AF12)>,
> > +                              <STM32_PINMUX('G', 8, AF12)>,
> > +                              <STM32_PINMUX('G',15, AF12)>,
> > +
> > +                              <STM32_PINMUX('H', 5, AF12)>,
> > +                              <STM32_PINMUX('C', 2, AF12)>,
> > +                              <STM32_PINMUX('C', 3, AF12)>;
> > +
> > +                     slew-rate = <3>;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/arm/dts/stm32h750i-art-pi.dts b/arch/arm/dts/stm32h750i-art-pi.dts
> > new file mode 100644
> > index 0000000..dd81198
> > --- /dev/null
> > +++ b/arch/arm/dts/stm32h750i-art-pi.dts
> > @@ -0,0 +1,188 @@
> > +// SPDX-License-Identifier: GPL-2.0+ OR X11
> > +/*
> > + * Copyright 2021 - Dillon Min <dillon.minfei@gmail.com>
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +#include "stm32h750.dtsi"
> > +#include "stm32h750-pinctrl.dtsi"
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +     model = "RT-Thread STM32H750i-ART-PI board";
> > +     compatible = "st,stm32h750i-art-pi", "st,stm32h750";
> > +
> > +     chosen {
> > +             bootargs = "root=/dev/ram";
> > +             stdout-path = "serial0:2000000n8";
> > +     };
> > +
> > +     memory@c0000000 {
> > +             device_type = "memory";
> > +             reg = <0xc0000000 0x2000000>;
> > +     };
> > +
> > +     reserved-memory {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             ranges;
> > +
> > +             linux,cma {
> > +                     compatible = "shared-dma-pool";
> > +                     no-map;
> > +                     size = <0x100000>;
> > +                     linux,dma-default;
> > +             };
> > +     };
> > +
> > +     aliases {
> > +             serial0 = &uart4;
> > +             serial1 = &usart3;
> > +     };
> > +
> > +     leds {
> > +             compatible = "gpio-leds";
> > +             led-red {
> > +                     gpios = <&gpioi 8 0>;
> > +             };
> > +             led-green {
> > +                     gpios = <&gpioc 15 0>;
> > +                     linux,default-trigger = "heartbeat";
> > +             };
> > +     };
> > +
> > +     v3v3: regulator-v3v3 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "v3v3";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     wlan_pwr: regulator-wlan {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "wl-reg";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +
> > +             gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +};
> > +
> > +&clk_hse {
> > +     clock-frequency = <25000000>;
> > +};
> > +
> > +&dma1 {
> > +     status = "okay";
> > +};
> > +
> > +&dma2 {
> > +     status = "okay";
> > +};
> > +
> > +&mac {
> > +     status = "disabled";
> > +     pinctrl-0       = <&ethernet_rmii>;
> > +     pinctrl-names   = "default";
> > +     phy-mode        = "rmii";
> > +     phy-handle      = <&phy0>;
> > +
> > +     mdio0 {
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             compatible = "snps,dwmac-mdio";
> > +             phy0: ethernet-phy@0 {
> > +                     reg = <0>;
> > +             };
> > +     };
> > +};
> > +
> > +&sdmmc1 {
> > +     pinctrl-names = "default", "opendrain", "sleep";
> > +     pinctrl-0 = <&sdmmc1_b4_pins_a>;
> > +     pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> > +     pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> > +     broken-cd;
> > +     st,neg-edge;
> > +     bus-width = <4>;
> > +     vmmc-supply = <&v3v3>;
> > +     status = "okay";
> > +};
> > +
> > +&sdmmc2 {
> > +     pinctrl-names = "default", "opendrain", "sleep";
> > +     pinctrl-0 = <&sdmmc2_b4_pins_a>;
> > +     pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
> > +     pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
> > +     broken-cd;
> > +     non-removable;
> > +     st,neg-edge;
> > +     bus-width = <4>;
> > +     vmmc-supply = <&wlan_pwr>;
> > +     status = "okay";
> > +
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +     brcmf: bcrmf@1 {
> > +             reg = <1>;
> > +             compatible = "brcm,bcm4329-fmac";
> > +     };
> > +};
> > +
> > +&spi1 {
> > +     status = "okay";
> > +     pinctrl-0 = <&spi1_pins>;
> > +     pinctrl-names = "default";
> > +     cs-gpios = <&gpioa 4 GPIO_ACTIVE_LOW>;
> > +     dmas = <&dmamux1 37 0x400 0x05>,
> > +            <&dmamux1 38 0x400 0x05>;
> > +     dma-names = "rx", "tx";
> > +
> > +     flash@0 {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             compatible = "winbond,w25q128", "jedec,spi-nor";
> > +             reg = <0>;
> > +             spi-max-frequency = <80000000>;
> > +
> > +             partition@0 {
> > +                     label = "root filesystem";
> > +                     reg = <0 0x1000000>;
> > +             };
> > +     };
> > +};
> > +
> > +&usart2 {
> > +     pinctrl-0 = <&usart2_pins>;
> > +     pinctrl-names = "default";
> > +     status = "disabled";
> > +};
> > +
> > +&usart3 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&usart3_pins>;
> > +     dmas = <&dmamux1 45 0x400 0x05>,
> > +            <&dmamux1 46 0x400 0x05>;
> > +     dma-names = "rx", "tx";
> > +     st,hw-flow-ctrl;
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             compatible = "brcm,bcm43438-bt";
> > +             host-wakeup-gpios = <&gpioc 0 GPIO_ACTIVE_HIGH>;
> > +             device-wakeup-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
> > +             shutdown-gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
> > +             max-speed = <115200>;
> > +     };
> > +};
> > +
> > +&uart4 {
> > +     pinctrl-0 = <&uart4_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +};
> > diff --git a/include/dt-bindings/memory/stm32-sdram.h b/include/dt-bindings/memory/stm32-sdram.h
> > index ab91d2b..90ef2e1 100644
> > --- a/include/dt-bindings/memory/stm32-sdram.h
> > +++ b/include/dt-bindings/memory/stm32-sdram.h
> > @@ -34,8 +34,10 @@
> >  #define TXSR_1               (1 - 1)
> >  #define TXSR_6               (6 - 1)
> >  #define TXSR_7               (7 - 1)
> > +#define TXSR_8               (8 - 1)
> >  #define TRAS_1               (1 - 1)
> >  #define TRAS_4               (4 - 1)
> > +#define TRAS_6               (6 - 1)
> >  #define TRC_6                (6 - 1)
> >  #define TWR_1                (1 - 1)
> >  #define TWR_2                (2 - 1)
> >
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
