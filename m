Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A6852E4F7
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:27:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 774A8C03FEB;
	Fri, 20 May 2022 06:27:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 533BBC035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:27:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K64oGn024882;
 Fri, 20 May 2022 08:27:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5P+85tgbqhHln2FopA40LVhBV1FQGpYRBPyL+YLAVHw=;
 b=T0bD4sjK5YIKaYCH6FVMciVti+VgpsCOCAdMCcukAe/Ji86p8oJy6oIAdn6uUgdt69Do
 kDmVNZkqCmqVsmR/Cm6A6V9s9Q32slonJca55Gsd6+3Am4Xmewml4t58noBpzPElBaHa
 98bOl3eHyfKyaZbn7tvksLtIfhIQVQMZA4Npq2gi7omuMGo9jQu2NUNh92fy53ohyElM
 FKNmLhmAMuRwCcCCXAhPZZMgqmhWg1Je40mthb/9c0yjN77Kg8JxX6TChh3mPjuUm7n+
 OZoK4LuK6MRTmwY+5jOCR/YEM4xrVbfpcFrNAZn567tjkE79lPygBFASnsV7ngxgvsg/ rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj64be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:27:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C10E10002A;
 Fri, 20 May 2022 08:27:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F3A3210F96;
 Fri, 20 May 2022 08:27:50 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:27:49 +0200
Message-ID: <3ca91605-546d-8a6f-e8fd-57fdbc0b8e4c@foss.st.com>
Date: Fri, 20 May 2022 08:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220519155647.1433652-1-patrick.delaunay@foss.st.com>
 <20220519175614.v2.1.Ieec76f320c9cc6885d7b519dffddff9ad4c97b59@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220519175614.v2.1.Ieec76f320c9cc6885d7b519dffddff9ad4c97b59@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Sean Anderson <seanga2@gmail.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] clk: Add directory for STM32 clock
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick

On 5/19/22 17:56, Patrick Delaunay wrote:
> Add a directory in drivers/clk to regroup the clock drivers for all
> STM32 Soc with CONFIG_ARCH_STM32 (MCUs with cortex M) or
> CONFIG_ARCH_STM32MP (MPUs with cortex A).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - replace '_' by '-' in file names to be consistant with other clk drivers
>   and prepare introduction of new files for stm32mp13
> 
>  MAINTAINERS                                   |  2 +-
>  drivers/clk/Kconfig                           | 17 +-------------
>  drivers/clk/Makefile                          |  5 ++--
>  drivers/clk/stm32/Kconfig                     | 23 +++++++++++++++++++
>  drivers/clk/stm32/Makefile                    |  7 ++++++
>  .../clk/{clk_stm32f.c => stm32/clk-stm32f.c}  |  0
>  .../{clk_stm32h7.c => stm32/clk-stm32h7.c}    |  0
>  .../{clk_stm32mp1.c => stm32/clk-stm32mp1.c}  |  0
>  8 files changed, 34 insertions(+), 20 deletions(-)
>  create mode 100644 drivers/clk/stm32/Kconfig
>  create mode 100644 drivers/clk/stm32/Makefile
>  rename drivers/clk/{clk_stm32f.c => stm32/clk-stm32f.c} (100%)
>  rename drivers/clk/{clk_stm32h7.c => stm32/clk-stm32h7.c} (100%)
>  rename drivers/clk/{clk_stm32mp1.c => stm32/clk-stm32mp1.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56be0bfad0..3f37edd716 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -469,7 +469,7 @@ S:	Maintained
>  F:	arch/arm/mach-stm32mp/
>  F:	doc/board/st/
>  F:	drivers/adc/stm32-adc*
> -F:	drivers/clk/clk_stm32mp1.c
> +F:	drivers/clk/stm32/
>  F:	drivers/gpio/stm32_gpio.c
>  F:	drivers/hwspinlock/stm32_hwspinlock.c
>  F:	drivers/i2c/stm32f7_i2c.c
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index a62b81a123..fd9e1a80c6 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -166,22 +166,6 @@ config CLK_SCMI
>  	  by a SCMI agent based on SCMI clock protocol communication
>  	  with a SCMI server.
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
>  config CLK_HSDK
>  	bool "Enable cgu clock driver for HSDK boards"
>  	depends on CLK && TARGET_HSDK
> @@ -251,6 +235,7 @@ source "drivers/clk/owl/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/sunxi/Kconfig"
>  source "drivers/clk/sifive/Kconfig"
> +source "drivers/clk/stm32/Kconfig"
>  source "drivers/clk/tegra/Kconfig"
>  source "drivers/clk/ti/Kconfig"
>  source "drivers/clk/uniphier/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f5b553172c..c274cda77c 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -23,6 +23,8 @@ obj-$(CONFIG_ARCH_MTMIPS) += mtmips/
>  obj-$(CONFIG_ARCH_NPCM) += nuvoton/
>  obj-$(CONFIG_ARCH_ROCKCHIP) += rockchip/
>  obj-$(CONFIG_ARCH_SOCFPGA) += altera/
> +obj-$(CONFIG_ARCH_STM32) += stm32/
> +obj-$(CONFIG_ARCH_STM32MP) += stm32/
>  obj-$(CONFIG_ARCH_SUNXI) += sunxi/
>  obj-$(CONFIG_CLK_AT91) += at91/
>  obj-$(CONFIG_CLK_BCM6345) += clk_bcm6345.o
> @@ -39,8 +41,6 @@ obj-$(CONFIG_CLK_OWL) += owl/
>  obj-$(CONFIG_CLK_RENESAS) += renesas/
>  obj-$(CONFIG_CLK_SCMI) += clk_scmi.o
>  obj-$(CONFIG_CLK_SIFIVE) += sifive/
> -obj-$(CONFIG_CLK_STM32F) += clk_stm32f.o
> -obj-$(CONFIG_CLK_STM32MP1) += clk_stm32mp1.o
>  obj-$(CONFIG_CLK_UNIPHIER) += uniphier/
>  obj-$(CONFIG_CLK_VERSACLOCK) += clk_versaclock.o
>  obj-$(CONFIG_CLK_VERSAL) += clk_versal.o
> @@ -53,4 +53,3 @@ obj-$(CONFIG_MACH_PIC32) += clk_pic32.o
>  obj-$(CONFIG_SANDBOX_CLK_CCF) += clk_sandbox_ccf.o
>  obj-$(CONFIG_SANDBOX) += clk_sandbox.o
>  obj-$(CONFIG_SANDBOX) += clk_sandbox_test.o
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
> index 0000000000..f66f295403
> --- /dev/null
> +++ b/drivers/clk/stm32/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Copyright (C) 2022, STMicroelectronics - All Rights Reserved
> +
> +obj-$(CONFIG_CLK_STM32F) += clk-stm32f.o
> +obj-$(CONFIG_CLK_STM32H7) += clk-stm32h7.o
> +obj-$(CONFIG_CLK_STM32MP1) += clk-stm32mp1.o
> diff --git a/drivers/clk/clk_stm32f.c b/drivers/clk/stm32/clk-stm32f.c
> similarity index 100%
> rename from drivers/clk/clk_stm32f.c
> rename to drivers/clk/stm32/clk-stm32f.c
> diff --git a/drivers/clk/clk_stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
> similarity index 100%
> rename from drivers/clk/clk_stm32h7.c
> rename to drivers/clk/stm32/clk-stm32h7.c
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
> similarity index 100%
> rename from drivers/clk/clk_stm32mp1.c
> rename to drivers/clk/stm32/clk-stm32mp1.c


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
