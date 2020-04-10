Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8690A1A4997
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 19:57:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33772C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 17:57:11 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72921C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 17:57:09 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48zQh41LQfz1qrML;
 Fri, 10 Apr 2020 19:57:08 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48zQh40F3Lz1qqkg;
 Fri, 10 Apr 2020 19:57:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2lpD50u8MZ8I; Fri, 10 Apr 2020 19:57:06 +0200 (CEST)
X-Auth-Info: gBuokqaA1qIWbvfsMzltNxTypuOSUxxNVYgaTWGTPhc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 10 Apr 2020 19:57:06 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <20200403102815.3.Ic2c7c6923035711a4c653d52ae7c0f57ca6f9210@changeid>
 <9e48b552-38a0-53f9-349c-68f5542b18bd@denx.de>
 <cfae3f9ab7de4515b302533c379a3457@SFHDAG6NODE3.st.com>
 <583926ae-0bcd-bbaa-33dd-78978ab49395@denx.de>
 <bb316e5469cd457f84625712f837fe5a@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <46694c1e-0836-a4bd-faeb-bfd1cc1ce03a@denx.de>
Date: Fri, 10 Apr 2020 19:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bb316e5469cd457f84625712f837fe5a@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] arm: caches: manage phys_addr_t
 overflow in mmu_set_region_dcache_behaviour
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

On 4/10/20 3:24 PM, Patrick DELAUNAY wrote:
> Dear Marek
> 
>> From: Marek Vasut <marex@denx.de>
>> Sent: vendredi 10 avril 2020 10:06
>>
>> On 4/9/20 4:18 PM, Patrick DELAUNAY wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Marek Vasut <marex@denx.de>
>>>> Sent: vendredi 3 avril 2020 23:31
>>>> To: Patrick DELAUNAY <patrick.delaunay@st.com>; u-boot@lists.denx.de
>>>> Cc: Simon Glass <sjg@chromium.org>; Alexey Brodkin
>>>> <abrodkin@synopsys.com>; Lokesh Vutla <lokeshvutla@ti.com>; Tom Rini
>>>> <trini@konsulko.com>; Trevor Woerner <trevor@toganlabs.com>; U-Boot
>>>> STM32 <uboot-stm32@st-md-mailman.stormreply.com>
>>>> Subject: Re: [PATCH 3/3] arm: caches: manage phys_addr_t overflow in
>>>> mmu_set_region_dcache_behaviour
>>>> Importance: High
>>>>
>>>> On 4/3/20 10:28 AM, Patrick Delaunay wrote:
>>>>> Detect and solve the overflow on phys_addr_t type for start + size
>>>>> in
>>>>> mmu_set_region_dcache_behaviour() function.
>>>>>
>>>>> This issue occurs for example with ARM32, start = 0xC0000000 and
>>>>> size = 0x40000000: start + size = 0x100000000 and end = 0x0.
>>>>>
>>>>> Overflow is detected when end < start.
>>>>> In normal case the previous behavior is still used: when start is
>>>>> not aligned on MMU section, the end address is only aligned after
>>>>> the sum start + size.
>>>>>
>>>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>>>>> ---
>>>>>
>>>>>  arch/arm/lib/cache-cp15.c | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
>>>>> index d15144188b..e5a7fd0ef4 100644
>>>>> --- a/arch/arm/lib/cache-cp15.c
>>>>> +++ b/arch/arm/lib/cache-cp15.c
>>>>> @@ -63,6 +63,11 @@ void mmu_set_region_dcache_behaviour(phys_addr_t
>>>>> start, size_t size,
>>>>>
>>>>>  	end = ALIGN(start + size, MMU_SECTION_SIZE) >>
>>>> MMU_SECTION_SHIFT;
>>>>>  	start = start >> MMU_SECTION_SHIFT;
>>>>> +
>>>>> +	/* phys_addr_t overflow detected */
>>>>> +	if (end < start)
>>>>> +		end = (~(phys_addr_t)0x0 >> MMU_SECTION_SHIFT) + 1;
>>>>> +
>>>>
>>>> Or, you can divide $start and $size separately by MMU_SECTION_SIZE
>>>> and then add them up .
>>>
>>> It was my first idea but that change the function behavior, because
>>> today start and size can be not aligned on MMU_SECTION aligned.
>>>
>>> I think it is strange, but I preferred to don't change this part.
>>>
>>> Example with shift = 21 and 2MB section size: 0x200000
>>>
>>> Start = 0x1000000
>>> Size = 0x1000000
>>>
>>> End = 0x2000000
>>>
>>> => after alignment start = 0x0, end = 0x1
>>>
>>> But if we align the start and size before addition as proposed, the
>>> final result change
>>>
>>> Start = 0x1000000 => 0
>>> Size = 0x1000000 => 0
>>>
>>> End = 0x0
>>>
>>> I prefer don't modify this current (strange) behavior to avoid regression.
>>>
>>> But if it is acceptable (because the caller MUST always use start and
>>> size MMU_SECTION aligned), I will change the proposal
>>
>> The minimum page size is 4k, right ? Then divide both by 4k and then by the rest
>> of MMU_SECTION_SHIFT.
> 
> Yes, good idea...
> I am waiting possible other feedbacks
> 
> but I think ii ts candidate to integrate V2.

It's much better than dealing with overflows, esp. if you're shifting by
power-of-two anyway. And using 4k should also take care of LPAE 36bit
address space.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
