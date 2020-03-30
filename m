Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A14C6197DCB
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Mar 2020 16:04:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6448EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Mar 2020 14:04:03 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 672BFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 14:03:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rZ270mQYz1qs0j;
 Mon, 30 Mar 2020 16:03:59 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rZ2671WTz1r0c8;
 Mon, 30 Mar 2020 16:03:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id bnFuBBHL9P8M; Mon, 30 Mar 2020 16:03:57 +0200 (CEST)
X-Auth-Info: eFWm9jDhxtcEjFJyZa3wHGR6q4LWA8sdQG39KwDigoE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Mar 2020 16:03:57 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200330094610.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
 <15a7a5fc-35f0-844a-8bdb-aefcbc001243@denx.de>
 <85b6dd3be8a9460984dd958592a4d476@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <2b7f0474-7e8e-0908-1971-3cc688a221ac@denx.de>
Date: Mon, 30 Mar 2020 16:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <85b6dd3be8a9460984dd958592a4d476@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>
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

On 3/30/20 3:49 PM, Patrick DELAUNAY wrote:
> Hi Marek,

Hi,

[...]

>>> -	/* Enable D-cache. I-cache is already enabled in start.S */
>>> +	/* I-cache is already enabled in start.S */
> 
> Not needed for arm V7 (I copy this function from other platfrom ... I don't remember which one)

Maybe this needs to be de-duplicated if it's a copy ?

[...]

>>> diff --git a/arch/arm/mach-stm32mp/dram_init.c
>>> b/arch/arm/mach-stm32mp/dram_init.c
>>> index 3233415eff..15b39ecc03 100644
>>> --- a/arch/arm/mach-stm32mp/dram_init.c
>>> +++ b/arch/arm/mach-stm32mp/dram_init.c
>>> @@ -7,9 +7,29 @@
>>>  #include <dm.h>
>>>  #include <lmb.h>
>>>  #include <ram.h>
>>> +#include <asm/cache.h>
>>>
>>>  DECLARE_GLOBAL_DATA_PTR;
>>>
>>> +static void set_mmu_dcache(u32 addr, u32 size) {
>>> +	int	i;
>>> +	u32 start, end;
>>> +
>>> +	start = addr >> MMU_SECTION_SHIFT;
>>> +	end = ((u64)addr + (u64)size) >> MMU_SECTION_SHIFT;
>>
>> Is this a copy of dram_bank_mmu_setup() in arch/arm/lib/cache-cp15.c ?
>> Why ?
> 
> It is not just a copy...
> 
> set__mmu_dache is only a static helper for  function dram_bank_mmu_setup()
> 
> I override the default implementation of the weak functon dram_bank_mmu_setup()

Can you instead augment the original implementation to cater for this
usecase or would that be too difficult ?

> 1/ mark  SYSRAM cacheable in SPL (embedded RAM used by SPL)
> 
> 2/ mark beginning of DDR cacheable in U-Boot pre-reloc (today all the DDR)
>     => I prepare a possible TF-A limitation: when TF-A is running in DDR,
>          a part of DDR is securized and can't be mapped to avoid speculative access 
> 
> 3/ after relocation, DDR init is performed.... 
>     use the default implementation to map all the DDR (gd->bd->bi_dram[0])
> 
>    PS: in future patches, I will only limit this case for reserved memory part,
>            with "no-map" tag (also for TF-A requirement)

OK, TF-A is just adding more and more problems.

> Now after my explcation I found a issue in my patch...
> SPL also use DDR (at least for CONFIG_SYS_SPL_MALLOC_START	0xC0300000) ,
>  so I need to marked DDR as cacheache also for SPL
> 
>>> +	for (i = start; i < end; i++) {
>>> +#if defined(CONFIG_SYS_ARM_CACHE_WRITETHROUGH)
>>> +		set_section_dcache(i, DCACHE_WRITETHROUGH); #elif
>>> +defined(CONFIG_SYS_ARM_CACHE_WRITEALLOC)
>>> +		set_section_dcache(i, DCACHE_WRITEALLOC); #else
>>> +		set_section_dcache(i, DCACHE_WRITEBACK); #endif
>>> +	}
>>> +}
>>
>> [...]
>>
>>> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
>>> index c34a720e0c..5203fc93ad 100644
>>> --- a/include/configs/stm32mp1.h
>>> +++ b/include/configs/stm32mp1.h
>>> @@ -58,8 +58,8 @@
>>>
>>>  /* limit SYSRAM usage to first 128 KB */
>>>  #define CONFIG_SPL_MAX_SIZE		0x00020000
>>> -#define CONFIG_SPL_STACK		(STM32_SYSRAM_BASE + \
>>> -					 STM32_SYSRAM_SIZE)
>>> +/* stack at STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE -
>> PGTABLE_SIZE (=16kB) */
>>> +#define CONFIG_SPL_STACK		0x2FFFC000
>>
>> Can't you memalign() the pagetable area instead of this hacking around?
>> Or use something around board_init_f_alloc_reserve().
> 
> It was my first idea: use malloc
> 
> But as I try to activate the data cache as soon as possible.
> So before spl_early_init call (for spl in board_init_f) and malloc is not yet accessible.
> 
> And board_init_f_alloc_reserve  is only called in U-Boot board-f.c..... 
> after the MMU configuration for pre-relocation / not called in SPL.
> 
> I don't see this address as hack but a memory configuration of SYSRAM:
> 
> SYRAM content (board_f)
> - SPL code
> - SPL data
> - SPL stack (reversed order)
> - TTB 
> 
> But I can move it in BSS as global apl variable, I need to think about it....
> It is probably more clean.

Please do :)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
