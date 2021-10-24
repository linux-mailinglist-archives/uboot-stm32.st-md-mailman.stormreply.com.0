Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C700F438BB7
	for <lists+uboot-stm32@lfdr.de>; Sun, 24 Oct 2021 21:54:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 612C9C59781;
	Sun, 24 Oct 2021 19:54:24 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AC7DC58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Oct 2021 19:54:23 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 34-20020a9d0325000000b00552cae0decbso12011257otv.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Oct 2021 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bsocy5UEEPkwDTZPEwL0hyEv5Fn/MF8zjE51x4HKaHM=;
 b=kayxGCb9ehLOt0khEak2Xe0ldi2k7bHYN2P9fPEijSHpPs+oMTI+tIyRp121k1eUYd
 iE3G0K0sv6UkHt7PtuI1RW6/VKWwV3cfJgeQKy/DsV7dkIAX+qAdHk9W4qU8JlV5VVbt
 zRUZgHIrMzRIlpXNGFQmshb6N54YFkvIgu9sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bsocy5UEEPkwDTZPEwL0hyEv5Fn/MF8zjE51x4HKaHM=;
 b=DdDpWlEqP1itkDzrC5d2j6sWe9GCxfuBPxjnpUwS3MKyxQjfp+GiIJjB7ZLpjGsfSP
 1+3UZZYTEjkvEPyyogKPQqzaHqhpwNfTnbCmBR917lKlbhuaqq0t4cR0taU2GyN3oC2r
 t4PAFeYei86Blta9XLkKABf2JvBtstStae+AomaMoS8Psi2iK2OHC5YNQuP3yfWD2LfG
 D2T8ACxbdere/7ME/C8oIfg2PDfSeh6rBxnWEQzvZ409NTxDlW2JEoov0j8aqWc1zgBd
 VnsepFO0LBGzTDsfElTAuqqcpZ5ZEouIOreM5FrfcNUwj+LiQOqAYeWQIF1I69PxOsbj
 9hZw==
X-Gm-Message-State: AOAM531bg85DXuk6xIsxkPXw0/pZBsZStlPkkzemFpTX11ZWcWwLRjUv
 SAtnbYFT6CV905+rTeir/2pwzFpp21K83TQ7mFy9Rw==
X-Google-Smtp-Source: ABdhPJxJhelgak6Zr0dFZmBW6dluPL4MpQE/qyA+pHaqRfyz2ib7fHKQK2dKnrkqA6w10FQIsviWf9v2U4ZdAupV2/U=
X-Received: by 2002:a9d:17c5:: with SMTP id j63mr10642303otj.191.1635105261941; 
 Sun, 24 Oct 2021 12:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211022201136.1.I9077efa33ed992563301acb5a5534326a3f3d289@changeid>
In-Reply-To: <20211022201136.1.I9077efa33ed992563301acb5a5534326a3f3d289@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 24 Oct 2021 13:54:09 -0600
Message-ID: <CAPnjgZ2w4hiGhqvGPOnjjkT8FbhN73Zk7EnH9+yFHDmEkUVN-g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] gpio: stm32: create include file for
	driver private data
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

On Fri, 22 Oct 2021 at 12:12, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> The stm32 gpio driver private data are not needed in arch include files,
> they are not used by code except for stm32 gpio and pincontrol drivers,
> using the same IP; the defines for this IP is moved in a new file
> "stm32_gpio_priv.h" in driver/gpio.
>
> This patch avoids to have duplicated file gpio.h for each SOC
> in MPU directory mach-stm32mp and in each MCU directory arch-stm32*
> and allows to remove CONFIG_GPIO_EXTRA_HEADER for all STM32.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  arch/arm/Kconfig                              |  2 -
>  arch/arm/include/asm/arch-stm32f4/gpio.h      | 15 ----
>  arch/arm/include/asm/arch-stm32f7/gpio.h      | 12 ---
>  arch/arm/include/asm/arch-stm32h7/gpio.h      | 12 ---
>  arch/arm/mach-stm32mp/include/mach/gpio.h     | 87 -------------------
>  board/st/stm32f746-disco/stm32f746-disco.c    |  1 -
>  drivers/gpio/stm32_gpio.c                     |  3 +-
>  .../gpio.h => drivers/gpio/stm32_gpio_priv.h  |  6 +-
>  drivers/pinctrl/pinctrl_stm32.c               |  3 +-
>  drivers/video/dw_mipi_dsi.c                   |  1 -
>  drivers/video/stm32/stm32_dsi.c               |  1 -
>  drivers/video/stm32/stm32_ltdc.c              |  1 -
>  12 files changed, 7 insertions(+), 137 deletions(-)
>  delete mode 100644 arch/arm/include/asm/arch-stm32f4/gpio.h
>  delete mode 100644 arch/arm/include/asm/arch-stm32f7/gpio.h
>  delete mode 100644 arch/arm/include/asm/arch-stm32h7/gpio.h
>  delete mode 100644 arch/arm/mach-stm32mp/include/mach/gpio.h
>  rename arch/arm/include/asm/arch-stm32/gpio.h => drivers/gpio/stm32_gpio_priv.h (94%)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
