Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8486419E06D
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 23:37:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E3A8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 21:37:57 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 135E8C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 21:37:56 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48vCw35L3xz1qrGG;
 Fri,  3 Apr 2020 23:37:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48vCw34pzSz1qv4s;
 Fri,  3 Apr 2020 23:37:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id iVsVANEyxARd; Fri,  3 Apr 2020 23:37:54 +0200 (CEST)
X-Auth-Info: Uk7pfMuD0kwAN7kn9aZ8h9xy/aFX19C2aqLZm+chb4Y=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  3 Apr 2020 23:37:54 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200330094610.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
 <15a7a5fc-35f0-844a-8bdb-aefcbc001243@denx.de>
 <85b6dd3be8a9460984dd958592a4d476@SFHDAG6NODE3.st.com>
 <2b7f0474-7e8e-0908-1971-3cc688a221ac@denx.de>
 <a933431e01de4a1b9973ad1b5f6d9ddb@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5a79913e-098c-71f4-8b7d-b987ff5eae26@denx.de>
Date: Fri, 3 Apr 2020 23:37:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a933431e01de4a1b9973ad1b5f6d9ddb@SFHDAG6NODE3.st.com>
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

On 4/3/20 10:03 AM, Patrick DELAUNAY wrote:
> Hi Marek,

Hi,

>> From: Marek Vasut <marex@denx.de>
>> Sent: lundi 30 mars 2020 16:04
>>
>> On 3/30/20 3:49 PM, Patrick DELAUNAY wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>> [...]
>>
>>>>> -	/* Enable D-cache. I-cache is already enabled in start.S */
>>>>> +	/* I-cache is already enabled in start.S */
>>>
>>> Not needed for arm V7 (I copy this function from other platfrom ... I
>>> don't remember which one)
>>
>> Maybe this needs to be de-duplicated if it's a copy ?
> 
> I don't remember.... 
> As I mixed several references
> 
> But I found the same content in many arm arch;
> 
> arch/arm/mach-imx/mx5/soc.c:67
> arch/arm/mach-rockchip/board.c:47
> arch/arm/mach-tegra/board.c:271
> arch/arm/mach-sunxi/board.c:347
> arch/arm/mach-exynos/soc.c:30:
> arch/arm/mach-zynq/cpu.c:88:
> arch/arm/cpu/armv7/iproc-common/hwinit-common.c:1
> arch/arm/mach-u8500/cache.c:14
> arch/arm/mach-keystone/init.c:206
> 
> And different implementation in 
> arch/arm/mach-socfpga/misc.c:55

On SoCFPGA, we are sure both need to be enabled, except SPL might not
want to enable dcache, which is why it's implemented there that way.
I dunno about the other platforms.

> mach-omap2/omap-cache.c:49
> void enable_caches(void)
> {
> 
> 	/* Enable I cache if not enabled */
> 	if (!icache_status())
> 		icache_enable();
> 
> 	dcache_enable();
> }
> 
> the issue the weak function empty, so it is mandatory to
> redefine the real implementation for each platform.
> 
> arch/arm/lib/cache.c:35
> /*
>  * Default implementation of enable_caches()
>  * Real implementation should be in platform code
>  */
> __weak void enable_caches(void)
> {
> 	puts("WARNING: Caches not enabled\n");
> }

Hm, that's a valid point. Then I think we're stuck with
re-reimplementing this one.

> [...]
> 
>>>>>
>>>>> +static void set_mmu_dcache(u32 addr, u32 size) {
>>>>> +	int	i;
>>>>> +	u32 start, end;
>>>>> +
>>>>> +	start = addr >> MMU_SECTION_SHIFT;
>>>>> +	end = ((u64)addr + (u64)size) >> MMU_SECTION_SHIFT;
>>>>
>>>> Is this a copy of dram_bank_mmu_setup() in arch/arm/lib/cache-cp15.c ?
>>>> Why ?
>>>
>>> It is not just a copy...
>>>
>>> set__mmu_dache is only a static helper for  function
>>> dram_bank_mmu_setup()
>>>
>>> I override the default implementation of the weak functon
>>> dram_bank_mmu_setup()
>>
>> Can you instead augment the original implementation to cater for this usecase or
>> would that be too difficult ?
> 
> Have a generic behavior...
> 
> I will propose to protect the access to bd->bi_dram[bank] in dram_bank_mmu_setup

Thanks!

[...]

>>> SYRAM content (board_f)
>>> - SPL code
>>> - SPL data
>>> - SPL stack (reversed order)
>>> - TTB
>>>
>>> But I can move it in BSS as global apl variable, I need to think about it....
>>> It is probably more clean.
>>
>> Please do :)
> 
> I willl move it in ".data" section in V2 for SPL and U-Boot.
> 
> Even in binary size increase and the SPL load time
> by ROM code is increase by 30ms.

Can it be mallocated instead ? If it's in initialized data, it will add
to the binary size, and I don't think you need it to be initialized data.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
