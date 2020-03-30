Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C9197838
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Mar 2020 12:01:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2EEDC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Mar 2020 10:01:02 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B03DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 10:01:00 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rSdm0tX9z1rvRr;
 Mon, 30 Mar 2020 12:01:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rSdl73Brz1r0bt;
 Mon, 30 Mar 2020 12:00:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id OGyiT4ZRJ28n; Mon, 30 Mar 2020 12:00:58 +0200 (CEST)
X-Auth-Info: 1FsMBBF4UDh6lVmFegBOp0HTnTyBVGpVjfu9uNYkWU4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Mar 2020 12:00:58 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200330094610.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <15a7a5fc-35f0-844a-8bdb-aefcbc001243@denx.de>
Date: Mon, 30 Mar 2020 11:56:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200330094610.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp1: activate data cache in SPL
 and before relocation
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

On 3/30/20 9:46 AM, Patrick Delaunay wrote:
[...]

> 2/ And for the basic boot chain with SPL
> 
> a) Before the patch:
> 
>     STM32MP> bootstage report
>     Timer summary in microseconds (12 records):
>            Mark    Elapsed  Stage
>               0          0  reset
>         195,613    195,613  SPL
>         837,867    642,254  end SPL
>         840,117      2,250  board_init_f
>       2,739,639  1,899,522  board_init_r
>       3,066,815    327,176  id=64
>       3,103,377     36,562  id=65
>       3,104,078        701  main_loop
>       3,142,171     38,093  id=175
> 
>     Accumulated time:
>                     38,124  dm_spl
>                     41,956  dm_r
>                    648,861  dm_f
> 
> b) After the patch
> 
>     STM32MP> bootstage report
>     Timer summary in microseconds (12 records):
>            Mark    Elapsed  Stage
>               0          0  reset
>         195,859    195,859  SPL
>         330,190    134,331  end SPL
>         332,408      2,218  board_init_f
>         482,688    150,280  board_init_r
>         808,694    326,006  id=64
>         845,029     36,335  id=65
>         845,730        701  main_loop
>       3,281,876  2,436,146  id=175
> 
>     Accumulated time:
>                      3,169  dm_spl
>                     36,041  dm_f
>                     41,701  dm_r

Nice.

[...]

> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 36a9205819..579468a1a0 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -193,6 +193,26 @@ int arch_cpu_init(void)
>  {
>  	u32 boot_mode;
>  
> +	/*
> +	 * initialialize the MMU and activate data cache
> +	 * in SPL or in U- Boot pre-reloc stage
> +	 */
> +	gd->arch.tlb_size = PGTABLE_SIZE;
> +#if defined(CONFIG_SPL_BUILD)
> +#if (STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE - CONFIG_SPL_STACK < PGTABLE_SIZE)
> +#error "The reserved memory for SPL PGTABLE is not enough."
> +#endif

Move this check to the beginning of the file, out of the code.

> +	gd->arch.tlb_addr = CONFIG_SPL_STACK;

if (IS_ENABLED(SPL_BUILD))
 gd->....
else
 gd->....

> +#else
> +	/* TLB is located after U-Boot, assumed 2MB as max size */
> +	gd->arch.tlb_addr = CONFIG_SYS_TEXT_BASE + SZ_2M;
> +#endif

I think you also need to set arch.tlb_size . Also, this should be a
separate function.

> +	dcache_enable();

What about icache, shouldn't that one be enabled too ?

> +	/*
> +	 * MMU/TLB is updated in enable_caches() for U-Boot after relocation
> +	 * or is deactivated in U-Boot start.S::cpu_init_cp15 for SPL
> +	 */
> +
>  	/* early armv7 timer init: needed for polling */
>  	timer_init();
>  
> @@ -225,7 +245,13 @@ int arch_cpu_init(void)
>  
>  void enable_caches(void)
>  {

Icache should be enabled here too. You don't know what e.g. a debugger
did to caches.

> -	/* Enable D-cache. I-cache is already enabled in start.S */
> +	/* I-cache is already enabled in start.S */
> +	/* deactivate the data cache, early enabled in arch_cpu_init() */
> +	dcache_disable();
> +	/*
> +	 * update MMU after relocation, the TLB location was udpated in
> +	 * board_f.c::reserve_mmu, and enable the data cache
> +	 */
>  	dcache_enable();
>  }
>  
> diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
> index 3233415eff..15b39ecc03 100644
> --- a/arch/arm/mach-stm32mp/dram_init.c
> +++ b/arch/arm/mach-stm32mp/dram_init.c
> @@ -7,9 +7,29 @@
>  #include <dm.h>
>  #include <lmb.h>
>  #include <ram.h>
> +#include <asm/cache.h>
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> +static void set_mmu_dcache(u32 addr, u32 size)
> +{
> +	int	i;
> +	u32 start, end;
> +
> +	start = addr >> MMU_SECTION_SHIFT;
> +	end = ((u64)addr + (u64)size) >> MMU_SECTION_SHIFT;

Is this a copy of dram_bank_mmu_setup() in arch/arm/lib/cache-cp15.c ?
Why ?

> +	for (i = start; i < end; i++) {
> +#if defined(CONFIG_SYS_ARM_CACHE_WRITETHROUGH)
> +		set_section_dcache(i, DCACHE_WRITETHROUGH);
> +#elif defined(CONFIG_SYS_ARM_CACHE_WRITEALLOC)
> +		set_section_dcache(i, DCACHE_WRITEALLOC);
> +#else
> +		set_section_dcache(i, DCACHE_WRITEBACK);
> +#endif
> +	}
> +}

[...]

> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index c34a720e0c..5203fc93ad 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -58,8 +58,8 @@
>  
>  /* limit SYSRAM usage to first 128 KB */
>  #define CONFIG_SPL_MAX_SIZE		0x00020000
> -#define CONFIG_SPL_STACK		(STM32_SYSRAM_BASE + \
> -					 STM32_SYSRAM_SIZE)
> +/* stack at STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE - PGTABLE_SIZE (=16kB) */
> +#define CONFIG_SPL_STACK		0x2FFFC000

Can't you memalign() the pagetable area instead of this hacking around?
Or use something around board_init_f_alloc_reserve().
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
