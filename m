Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BFE5AD8EE
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Sep 2022 20:16:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEB47C0C920;
	Mon,  5 Sep 2022 18:16:43 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CAA2C03FC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 18:16:42 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-11f34610d4aso22979574fac.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Zf+sO5cXB1kP+NvA3P8u0L68wTUwo+xf7A/Hb6KmVaM=;
 b=lZ4fGRYFRTMa9iALexj9EbHSEJBDbRW+0L7aXBNfjjwIHBaedAmDhYhMUt3HCLBRdI
 CxMLJ1y6LmX3p6NZxf205lqPobGiLcmeOS9UuWi2zntv+Et6359HBd1VypQppi0Ilnz7
 JL53Ud2L1uHPaa8rYViTSYexbKOr0cZZUoMjWDzmfBBQyJOfMJQpLfHYXc3CU0m+6vua
 OFNXeHoNh8HQUlFkRfPKKV+bdYvWmp0TYQcP07jDmEoXel/xSgpDif35zdInnNgtkdqP
 SXAsERuUkeOt+j6nPKEChdQpzLYb3yh/M5Dx0MPAa4t+gvPxC4PhcV8l1lJcP3x2ggz5
 6KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Zf+sO5cXB1kP+NvA3P8u0L68wTUwo+xf7A/Hb6KmVaM=;
 b=xS2F0GXMO157GMd6sFaHr6PJI2Z5+xQ+M9e+4IBI1Thoqy/D2+qTmFdOyqxOlKhEW9
 3R5j4NJ9utYQQsF8H2n134DZMERHlCUyRrfbnNR//dF82Oo9p/SPvdHyDEnI6H7vBKiL
 LeK/Bt9h+L0FWruQDmZelextdk30vBQIChaqXGeG/QUV3Zi9LuUq4SGhAxN6Zzee0OKK
 mQq0UttDk3to/SIFTUb2IzvOmxbEhz9RyI3AT54OybTNR0ZGq6rp8g0hI+BEvxkFAKpJ
 eOG6Vg75Sfc229OJIVDLrq8sxR4x4Zut84nSxZ6tjJMcEiJttC40mMNqxwOlRVUtaQsA
 nLCw==
X-Gm-Message-State: ACgBeo1wDXgjKBXEPqWgAkghGRBmg/J9ic5K21KRUxHGGfK3V2mKKYTN
 IbSlienMAVbQtna2vb9a0/B/3xFaVfJFykSacqM=
X-Google-Smtp-Source: AA6agR6Oz2SMNzXGtaxVLVnzutyGqe82Nt08M8f73Z3DWAHAdwMtkW1GF46ZXmxxJ3aOpB0+eff8xwgs+KigzdE8V1E=
X-Received: by 2002:a05:6870:5624:b0:127:8ff5:1cb2 with SMTP id
 m36-20020a056870562400b001278ff51cb2mr1728087oao.201.1662401801126; Mon, 05
 Sep 2022 11:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220905173357.2231466-1-jorge@foundries.io>
In-Reply-To: <20220905173357.2231466-1-jorge@foundries.io>
From: Oleksandr Suvorov <cryosay@gmail.com>
Date: Mon, 5 Sep 2022 21:16:29 +0300
Message-ID: <CAGgjyvGSqrOiZu5=KUj5aahHhZBEEYxCQW1ijOjctq59LD11_A@mail.gmail.com>
To: Jorge Ramirez-Ortiz <jorge@foundries.io>
Cc: patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp*: fix system reset
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

On Mon, Sep 5, 2022 at 8:34 PM Jorge Ramirez-Ortiz <jorge@foundries.io> wrote:
>
> Enabling CONFIG_SYSRESET_PSCI prevents CONFIG_RESET_SCMI
> from executing.
>
> The side effect observed are I2C devices no longer being
> accessible from U-boot after a soft reset.
>
> Fixes: 11517ccc8c52 ("configs: add stm32mp13 defconfig")
> Fixes: 17aeb589fa9d ("stm32mp15: remove configs dependency on
>                       CONFIG_TFABOOT")
>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>

Acked-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>

> ---
>  configs/stm32mp13_defconfig         | 1 -
>  configs/stm32mp15_defconfig         | 1 -
>  configs/stm32mp15_trusted_defconfig | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 673b468d31..44cee2e656 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -69,7 +69,6 @@ CONFIG_RNG_OPTEE=y
>  CONFIG_DM_RTC=y
>  CONFIG_RTC_STM32=y
>  CONFIG_SERIAL_RX_BUFFER=y
> -CONFIG_SYSRESET_PSCI=y
>  CONFIG_TEE=y
>  CONFIG_OPTEE=y
>  # CONFIG_OPTEE_TA_AVB is not set
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index e5a2996c2c..2ad02f3652 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -133,7 +133,6 @@ CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  CONFIG_STM32_QSPI=y
>  CONFIG_STM32_SPI=y
> -CONFIG_SYSRESET_PSCI=y
>  CONFIG_TEE=y
>  CONFIG_OPTEE=y
>  # CONFIG_OPTEE_TA_AVB is not set
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index e14668042f..9e24e82920 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -134,7 +134,6 @@ CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  CONFIG_STM32_QSPI=y
>  CONFIG_STM32_SPI=y
> -CONFIG_SYSRESET_PSCI=y
>  CONFIG_TEE=y
>  CONFIG_OPTEE=y
>  # CONFIG_OPTEE_TA_AVB is not set
> --
> 2.34.1
>


-- 
Best regards
Oleksandr

Oleksandr Suvorov
cryosay@gmail.com
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
