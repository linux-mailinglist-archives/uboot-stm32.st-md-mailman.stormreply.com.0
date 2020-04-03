Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A6F19E06C
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 23:37:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 471A8C36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 21:37:55 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56800C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 21:37:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48vCw201hYz1rnJW;
 Fri,  3 Apr 2020 23:37:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48vCw16Q4fz1qv4r;
 Fri,  3 Apr 2020 23:37:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id h6_aUsFRPvQ3; Fri,  3 Apr 2020 23:37:52 +0200 (CEST)
X-Auth-Info: X5I+kYs5ko7AbCvbiOTeWaK+qTsJ5LqDSf8vtit1Usw=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  3 Apr 2020 23:37:52 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200403092537.19961-1-patrick.delaunay@st.com>
 <20200403105644.v2.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <2b133f06-e111-e709-8bdb-b01e791df284@denx.de>
Date: Fri, 3 Apr 2020 23:32:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200403105644.v2.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] arm: stm32mp: activate data cache
	on DDR in SPL
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

On 4/3/20 11:25 AM, Patrick Delaunay wrote:
> Activate cache on DDR to improves the accesses to DDR used by SPL:
> - CONFIG_SPL_BSS_START_ADDR
> - CONFIG_SYS_SPL_MALLOC_START
> 
> Cache is configured only when DDR is fully initialized,
> to avoid speculative access and issue in get_ram_size().
> Data cache is deactivated at the end of SPL, to flush the data cache
> and the TLB.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2:
> - new
> 
>  arch/arm/mach-stm32mp/spl.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index 9cd7b418a4..279121af75 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <common.h>
> +#include <cpu_func.h>
>  #include <dm.h>
>  #include <hang.h>
>  #include <spl.h>
> @@ -117,4 +118,24 @@ void board_init_f(ulong dummy)
>  		printf("DRAM init failed: %d\n", ret);
>  		hang();
>  	}
> +
> +	/*
> +	 * activate cache on DDR only when DDR is fully initialized
> +	 * to avoid speculative access and issue in get_ram_size()
> +	 */
> +	if (!CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
> +		mmu_set_region_dcache_behaviour(STM32_DDR_BASE, STM32_DDR_SIZE,
> +						DCACHE_DEFAULT_OPTION);
> +}
> +
> +void spl_board_prepare_for_boot(void)
> +{
> +	dcache_disable();
> +	debug("SPL bye\n");
> +}
> +
> +void spl_board_prepare_for_boot_linux(void)
> +{
> +	dcache_disable();
> +	debug("SPL bye\n");

Is the debug() statement really needed ? I think the common SPL code
already has some.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
