Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D0C523A7B
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 May 2022 18:40:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BBC7C03FC3;
	Wed, 11 May 2022 16:40:05 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A39ABC035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 16:40:03 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id fu47so2412284qtb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rXZ5XE6r38cfYmV/ZlJZimdPmFe11X380z1Fj3bSwuA=;
 b=UdRb3MgB85JzeVe6XLnO0dUD+oo4yQ0rFvvo4+SOUGeQ/nTPAUseesnL7+UWJoX7Ff
 U3maIwu9+GrXfo3NsgG8qZEAn9Xyw/odja0xpx/DmxC0GJechX4V6BPiXs4N4IFU7pxX
 f/2duWx2BccDm9fhtZH3243Zg5MAkKNlEjy3kJbdgb3QrHvsJ+8ocglLVAroaDUAf8Ho
 OyqgIY9nSmDCiomF7ZucFKTiOK8J5nsaNSWS5/6lPLZdf8lC5SwXOHLikQcG2HYsB8zq
 38Y/7aYLgai7lLEkxZhiZU+xSOhdu4GrSqnl+aLXSRWHR0WzGnK0VQh6hP9IYNrsb+/5
 8Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rXZ5XE6r38cfYmV/ZlJZimdPmFe11X380z1Fj3bSwuA=;
 b=l6UjXjVeFxjepuaUlOAdjczQ9J+dX2enny6kvYwrG+zLBx80eMKufiERYTwzz6fpCY
 DRg3v8P1dJ2d2E4CVyByCnR3z5SFiVMNseOsa+yWdBpz+JJZzIzUXtWsxJ6ds44+lIeU
 32q4/XjPVW+Al++fLG13a4MGI8gFwsT7XmWmOduLWKrziVYgUJVU8+jY/09Qed5hP0i/
 m6jeJdfH1yxf6NQidMpKscMEoh5rmqzgF2ujBKe04cYn3XsEgjArNIny4ni6Hli6c+oP
 +emQplYFUE7NvSzxzwjollCMXKaqOAYCVZN9qZzXP6sYiICJ5soMPhyM8+urOks4L7n4
 CxiQ==
X-Gm-Message-State: AOAM530dtoewg/L9WSWJN85rfbB4XC86Ep9/zj99yBUwstNWRqTLnc9G
 U+k2Lk/loHrd53OwvKND9x66cUX+GNE=
X-Google-Smtp-Source: ABdhPJyWkc46usUmHZA1NZrHPgFrJwhPy2cP5I1TrUkYveRIAqnQzJbeQkxJv7e6oxyFkPZkZFV5tw==
X-Received: by 2002:ac8:59d3:0:b0:2f3:d7ee:2b54 with SMTP id
 f19-20020ac859d3000000b002f3d7ee2b54mr16042505qtf.290.1652287202111; 
 Wed, 11 May 2022 09:40:02 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-18-248-138.washdc.fios.verizon.net.
 [108.18.248.138]) by smtp.googlemail.com with ESMTPSA id
 h197-20020a379ece000000b0069fc13ce227sm1416865qke.88.2022.05.11.09.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 09:40:01 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
 <20220510095041.1.Ieec76f320c9cc6885d7b519dffddff9ad4c97b59@changeid>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <bd624113-dc28-eb83-35af-c1366b0595e1@gmail.com>
Date: Wed, 11 May 2022 12:40:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220510095041.1.Ieec76f320c9cc6885d7b519dffddff9ad4c97b59@changeid>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/4] clk: Add directory for STM32 clock
	drivers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 5/10/22 3:51 AM, Patrick Delaunay wrote:
> Add a directory in drivers/clk to regroup the clock drivers for all
> STM32 Soc with CONFIG_ARCH_STM32 (MCUs with cortex M) or
> CONFIG_ARCH_STM32MP (MPUs with cortex A).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   MAINTAINERS                            |  2 +-
>   drivers/clk/Kconfig                    | 17 +----------------
>   drivers/clk/Makefile                   |  5 ++---
>   drivers/clk/stm32/Kconfig              | 23 +++++++++++++++++++++++
>   drivers/clk/stm32/Makefile             |  7 +++++++
>   drivers/clk/{ => stm32}/clk_stm32f.c   |  0
>   drivers/clk/{ => stm32}/clk_stm32h7.c  |  0
>   drivers/clk/{ => stm32}/clk_stm32mp1.c |  0
>   8 files changed, 34 insertions(+), 20 deletions(-)
>   create mode 100644 drivers/clk/stm32/Kconfig
>   create mode 100644 drivers/clk/stm32/Makefile
>   rename drivers/clk/{ => stm32}/clk_stm32f.c (100%)
>   rename drivers/clk/{ => stm32}/clk_stm32h7.c (100%)
>   rename drivers/clk/{ => stm32}/clk_stm32mp1.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56be0bfad0..3f37edd716 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -469,7 +469,7 @@ S:	Maintained
>   F:	arch/arm/mach-stm32mp/
>   F:	doc/board/st/
>   F:	drivers/adc/stm32-adc*
> -F:	drivers/clk/clk_stm32mp1.c
> +F:	drivers/clk/stm32/
>   F:	drivers/gpio/stm32_gpio.c
>   F:	drivers/hwspinlock/stm32_hwspinlock.c
>   F:	drivers/i2c/stm32f7_i2c.c
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 6dc271f71b..98ad481d9e 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -140,22 +140,6 @@ config CLK_SCMI
>   	  by a SCMI agent based on SCMI clock protocol communication
>   	  with a SCMI server.
>   
> -config CLK_STM32F
> -	bool "Enable clock driver support for STM32F family"
> -	depends on CLK && (STM32F7 || STM32F4)
> -	default y
> -	help
> -	  This clock driver adds support for RCC clock management
> -	  for STM32F4 and STM32F7 SoCs.
> -
> -config CLK_STM32MP1
> -	bool "Enable RCC clock driver for STM32MP1"
> -	depends on ARCH_STM32MP && CLK
> -	default y
> -	help
> -	  Enable the STM32 clock (RCC) driver. Enable support for
> -	  manipulating STM32MP1's on-SoC clocks.
> -
>   config CLK_HSDK
>   	bool "Enable cgu clock driver for HSDK boards"
>   	depends on CLK && TARGET_HSDK
> @@ -225,6 +209,7 @@ source "drivers/clk/owl/Kconfig"
>   source "drivers/clk/renesas/Kconfig"
>   source "drivers/clk/sunxi/Kconfig"
>   source "drivers/clk/sifive/Kconfig"
> +source "drivers/clk/stm32/Kconfig"
>   source "drivers/clk/tegra/Kconfig"
>   source "drivers/clk/ti/Kconfig"
>   source "drivers/clk/uniphier/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index bb4eee5d99..09fbaf6233 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -22,6 +22,8 @@ obj-$(CONFIG_ARCH_MESON) += meson/
>   obj-$(CONFIG_ARCH_MTMIPS) += mtmips/
>   obj-$(CONFIG_ARCH_ROCKCHIP) += rockchip/
>   obj-$(CONFIG_ARCH_SOCFPGA) += altera/
> +obj-$(CONFIG_ARCH_STM32) += stm32/
> +obj-$(CONFIG_ARCH_STM32MP) += stm32/
>   obj-$(CONFIG_ARCH_SUNXI) += sunxi/
>   obj-$(CONFIG_CLK_AT91) += at91/
>   obj-$(CONFIG_CLK_BCM6345) += clk_bcm6345.o
> @@ -38,8 +40,6 @@ obj-$(CONFIG_CLK_OWL) += owl/
>   obj-$(CONFIG_CLK_RENESAS) += renesas/
>   obj-$(CONFIG_CLK_SCMI) += clk_scmi.o
>   obj-$(CONFIG_CLK_SIFIVE) += sifive/
> -obj-$(CONFIG_CLK_STM32F) += clk_stm32f.o
> -obj-$(CONFIG_CLK_STM32MP1) += clk_stm32mp1.o
>   obj-$(CONFIG_CLK_UNIPHIER) += uniphier/
>   obj-$(CONFIG_CLK_VERSACLOCK) += clk_versaclock.o
>   obj-$(CONFIG_CLK_VERSAL) += clk_versal.o
> @@ -52,4 +52,3 @@ obj-$(CONFIG_MACH_PIC32) += clk_pic32.o
>   obj-$(CONFIG_SANDBOX_CLK_CCF) += clk_sandbox_ccf.o
>   obj-$(CONFIG_SANDBOX) += clk_sandbox.o
>   obj-$(CONFIG_SANDBOX) += clk_sandbox_test.o
> -obj-$(CONFIG_STM32H7) += clk_stm32h7.o
> diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
> new file mode 100644
> index 0000000000..eac3fc1e9d
> --- /dev/null
> +++ b/drivers/clk/stm32/Kconfig
> @@ -0,0 +1,23 @@
> +config CLK_STM32F
> +	bool "Enable clock driver support for STM32F family"
> +	depends on CLK && (STM32F7 || STM32F4)
> +	default y
> +	help
> +	  This clock driver adds support for RCC clock management
> +	  for STM32F4 and STM32F7 SoCs.
> +
> +config CLK_STM32H7
> +	bool "Enable clock driver support for STM32H7 family"
> +	depends on CLK && STM32H7
> +	default y
> +	help
> +	  This clock driver adds support for RCC clock management
> +	  for STM32H7 SoCs.
> +
> +config CLK_STM32MP1
> +	bool "Enable RCC clock driver for STM32MP15"
> +	depends on ARCH_STM32MP && CLK
> +	default y if STM32MP15x
> +	help
> +	  Enable the STM32 clock (RCC) driver. Enable support for
> +	  manipulating STM32MP15's on-SoC clocks.
> diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
> new file mode 100644
> index 0000000000..b420eeaa4e
> --- /dev/null
> +++ b/drivers/clk/stm32/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Copyright (C) 2022, STMicroelectronics - All Rights Reserved
> +
> +obj-$(CONFIG_CLK_STM32F) += clk_stm32f.o
> +obj-$(CONFIG_CLK_STM32H7) += clk_stm32h7.o
> +obj-$(CONFIG_CLK_STM32MP1) += clk_stm32mp1.o
> diff --git a/drivers/clk/clk_stm32f.c b/drivers/clk/stm32/clk_stm32f.c
> similarity index 100%
> rename from drivers/clk/clk_stm32f.c
> rename to drivers/clk/stm32/clk_stm32f.c
> diff --git a/drivers/clk/clk_stm32h7.c b/drivers/clk/stm32/clk_stm32h7.c
> similarity index 100%
> rename from drivers/clk/clk_stm32h7.c
> rename to drivers/clk/stm32/clk_stm32h7.c
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/stm32/clk_stm32mp1.c
> similarity index 100%
> rename from drivers/clk/clk_stm32mp1.c
> rename to drivers/clk/stm32/clk_stm32mp1.c
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
