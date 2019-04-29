Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D05DFA4
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 11:40:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1D1DC35E03
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 09:40:35 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 286C3C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 09:40:34 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 91DBD4CAAF;
 Mon, 29 Apr 2019 11:40:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id eI6oCEPeHmnL; Mon, 29 Apr 2019 11:40:20 +0200 (CEST)
To: Patrice Chotard <patrice.chotard@st.com>, Simon Glass <sjg@chromium.org>, 
 michal.simek@xilinx.com, u-boot@lists.denx.de
References: <1556529805-23820-1-git-send-email-patrice.chotard@st.com>
 <1556529805-23820-2-git-send-email-patrice.chotard@st.com>
From: Stefan Roese <sr@denx.de>
Message-ID: <e83b95b9-3b5d-fd08-99e4-e8193e88874f@denx.de>
Date: Mon, 29 Apr 2019 11:40:20 +0200
MIME-Version: 1.0
In-Reply-To: <1556529805-23820-2-git-send-email-patrice.chotard@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] watchdog: Kconfig: Sort entry
	alphabetically
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

On 29.04.19 11:23, Patrice Chotard wrote:
> To make adding new entry easier, sort Kconfig entries in
> alphabetical order.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>   drivers/watchdog/Kconfig | 87 ++++++++++++++++++++++++------------------------
>   1 file changed, 44 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 3bce0aa..4a3ff7a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -26,6 +26,13 @@ config BCM2835_WDT
>   	  This provides basic infrastructure to support BCM2835/2836 watchdog
>   	  hardware, with a max timeout of ~15secs.
>   
> +config IMX_WATCHDOG
> +	bool "Enable Watchdog Timer support for IMX and LSCH2 of NXP"
> +	select HW_WATCHDOG
> +	help
> +	   Select this to enable the IMX and LSCH2 of Layerscape watchdog
> +	   driver.
> +
>   config OMAP_WATCHDOG
>   	bool "TI OMAP watchdog driver"
>   	depends on ARCH_OMAP2PLUS
> @@ -59,14 +66,6 @@ config WDT
>   	  What exactly happens when the timer expires is up to a particular
>   	  device/driver.
>   
> -config WDT_SANDBOX
> -	bool "Enable Watchdog Timer support for Sandbox"
> -	depends on SANDBOX && WDT
> -	help
> -	  Enable Watchdog Timer support in Sandbox. This is a dummy device that
> -	  can be probed and supports all of the methods of WDT, but does not
> -	  really do anything.
> -
>   config WDT_ARMADA_37XX
>   	bool "Marvell Armada 37xx watchdog timer support"
>   	depends on WDT && ARMADA_3700
> @@ -87,6 +86,13 @@ config WDT_ASPEED
>   	  It currently does not support Boot Flash Addressing Mode Detection or
>   	  Second Boot.
>   
> +config WDT_AT91
> +	bool "AT91 watchdog timer support"
> +	depends on WDT
> +	help
> +	   Select this to enable Microchip watchdog timer, which can be found on
> +	   some AT91 devices.
> +
>   config WDT_BCM6345
>   	bool "BCM6345 watchdog timer support"
>   	depends on WDT && (ARCH_BMIPS || ARCH_BCM6858 || ARCH_BCM63158)
> @@ -95,14 +101,6 @@ config WDT_BCM6345
>   	  The watchdog timer is stopped when initialized.
>   	  It performs full SoC reset.
>   
> -config WDT_ORION
> -	bool "Orion watchdog timer support"
> -	depends on WDT
> -	select CLK
> -	help
> -	   Select this to enable Orion watchdog timer, which can be found on some
> -	   Marvell Armada chips.
> -
>   config WDT_CDNS
>   	bool "Cadence watchdog timer support"
>   	depends on WDT
> @@ -111,6 +109,20 @@ config WDT_CDNS
>   	   Select this to enable Cadence watchdog timer, which can be found on some
>   	   Xilinx Microzed Platform.
>   
> +config WDT_MPC8xx
> +	bool "MPC8xx watchdog timer support"
> +	depends on WDT && MPC8xx
> +	select CONFIG_MPC8xx_WATCHDOG
> +	help
> +	   Select this to enable mpc8xx watchdog timer
> +
> +config WDT_MT7621
> +	bool "MediaTek MT7621 watchdog timer support"
> +	depends on WDT && ARCH_MT7620
> +	help
> +	   Select this to enable Ralink / Mediatek watchdog timer,
> +	   which can be found on some MediaTek chips.
> +
>   config WDT_MTK
>   	bool "MediaTek watchdog timer support"
>   	depends on WDT && ARCH_MEDIATEK
> @@ -119,39 +131,28 @@ config WDT_MTK
>   	  The watchdog timer is stopped when initialized.
>   	  It performs full SoC reset.
>   
> -config XILINX_TB_WATCHDOG
> -	bool "Xilinx Axi watchdog timer support"
> +config WDT_ORION
> +	bool "Orion watchdog timer support"
>   	depends on WDT
> -	imply WATCHDOG
> +	select CLK
>   	help
> -	   Select this to enable Xilinx Axi watchdog timer, which can be found on some
> -	   Xilinx Microblaze Platforms.
> +	   Select this to enable Orion watchdog timer, which can be found on some
> +	   Marvell Armada chips.
>   
> -config IMX_WATCHDOG
> -	bool "Enable Watchdog Timer support for IMX and LSCH2 of NXP"
> -	select HW_WATCHDOG
> +config WDT_SANDBOX
> +	bool "Enable Watchdog Timer support for Sandbox"
> +	depends on SANDBOX && WDT
>   	help
> -	   Select this to enable the IMX and LSCH2 of Layerscape watchdog
> -	   driver.
> +	  Enable Watchdog Timer support in Sandbox. This is a dummy device that
> +	  can be probed and supports all of the methods of WDT, but does not
> +	  really do anything.
>   
> -config WDT_AT91
> -	bool "AT91 watchdog timer support"
> +config XILINX_TB_WATCHDOG
> +	bool "Xilinx Axi watchdog timer support"
>   	depends on WDT
> +	imply WATCHDOG
>   	help
> -	   Select this to enable Microchip watchdog timer, which can be found on
> -	   some AT91 devices.
> -
> -config WDT_MT7621
> -	bool "MediaTek MT7621 watchdog timer support"
> -	depends on WDT && ARCH_MT7620
> -	help
> -	   Select this to enable Ralink / Mediatek watchdog timer,
> -	   which can be found on some MediaTek chips.
> -
> -config WDT_MPC8xx
> -	bool "MPC8xx watchdog timer support"
> -	depends on WDT && MPC8xx
> -	help
> -	   Select this to enable mpc8xx watchdog timer
> +	   Select this to enable Xilinx Axi watchdog timer, which can be found on some
> +	   Xilinx Microblaze Platforms.
>   
>   endmenu
> 

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
