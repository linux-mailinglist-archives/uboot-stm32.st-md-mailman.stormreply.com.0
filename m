Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD11A44D5
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 11:58:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCD74C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 09:58:27 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2ABCC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 09:58:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48zD3k2KLrz1qs03;
 Fri, 10 Apr 2020 11:58:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48zD3k1YGJz1r0bb;
 Fri, 10 Apr 2020 11:58:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id hf6M-_GggVw9; Fri, 10 Apr 2020 11:58:25 +0200 (CEST)
X-Auth-Info: iLuQ8dzVYInWlDfaqZeA3N26nQFMwq7iWyJrBo1lP9o=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 10 Apr 2020 11:58:25 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200403092537.19961-1-patrick.delaunay@st.com>
 <20200403105644.v2.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
 <3398ff5a-73d0-d6ab-9573-d8ed649f7537@denx.de>
 <5d207feb8ae3445ba520dd206d37a54a@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <4ef31b21-09da-715f-085b-cf1ffbc21468@denx.de>
Date: Fri, 10 Apr 2020 10:15:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5d207feb8ae3445ba520dd206d37a54a@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] arm: stm32mp: activate data cache
 in SPL and before relocation
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

On 4/9/20 8:32 PM, Patrick DELAUNAY wrote:
> Dear Marek,
> 
>> From: Marek Vasut <marex@denx.de>
>> Sent: vendredi 3 avril 2020 23:32
>>
>> On 4/3/20 11:25 AM, Patrick Delaunay wrote:
>> [...]
>>> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
>>> index 36a9205819..c22c1a9bbc 100644
>>> --- a/arch/arm/mach-stm32mp/cpu.c
>>> +++ b/arch/arm/mach-stm32mp/cpu.c
>>> @@ -75,6 +75,12 @@
>>>  #define PKG_SHIFT	27
>>>  #define PKG_MASK	GENMASK(2, 0)
>>>
>>> +/*
>>> + * early TLB into the .data section so that it not get cleared
>>> + * with 16kB allignment (see TTBR0_BASE_ADDR_MASK)  */
>>> +u8 early_tlb[PGTABLE_SIZE] __section(".data") __aligned(0x4000);
>>
>> Can you early-malloc this one ?
> 
> I try to early maloc and it is failing because my code in arch_cpu_init() is executed before 
> the early poll initialization done in spl_common_init () called by spl_early_init()
> So it too late for my use case....
> 
> And if I initialise the MMU and the cache after this function it is too late, as
> dm_init_and_scan and fdt parsin is also called in spl_common_init()

Aha, OK. Can you document it in the commit message ? That's a real good
piece of information.

>> (why do you need this in __section("data") ?)
> 
> I try to use .bss and it is failing because the bss is resetted to 0 in SPL 
> after board_init_f, and the MMU is cleared without notice.
> 
> In fact BBS is not available, board_init_f() can use only stack variables
> and global_data (see README:258).
> 
> When I investigate the issue, I found CONFIG_SPL_EARLY_BSS
> that explain this point :
> 
> config SPL_EARLY_BSS
> 	depends on ARM && !ARM64
> 	bool "Allows initializing BSS early before entering board_init_f"
> 	help
> 	  On some platform we have sufficient memory available early on to
> 	  allow setting up and using a basic BSS prior to entering
> 	  board_init_f. Activating this option will also de-activate the
> 	  clearing of BSS during the SPL relocation process, thus allowing
> 	  to carry state from board_init_f to board_init_r by way of BSS.
> 
> So it is s compromise between harcoded addred (end of SYSRAM)
> or glabal variable in .data section
> 
> V2 patch with .data seems more elegant for me (it avoid assumption on
> U-Boot size for preloc case).
> 
> And if you have size issue for SPL you can deactivate cache for SPL only
> (CONFIG_SPL_SYS_DCACHE_OFF).

OK
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
