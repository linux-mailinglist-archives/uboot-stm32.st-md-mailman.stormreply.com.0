Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3091A282B
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 19:59:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08B80C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 17:59:01 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A9DEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2020 17:58:57 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48yBq31S4dz1rjXM;
 Wed,  8 Apr 2020 19:58:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48yBq30C5yz1qtwm;
 Wed,  8 Apr 2020 19:58:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id iw5aHgw5yUaZ; Wed,  8 Apr 2020 19:58:53 +0200 (CEST)
X-Auth-Info: NC3o8PzCl2e6n1PvB06rYxPiTa46ktIMq3I3D04wsDc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  8 Apr 2020 19:58:53 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <714177fe-ba0e-cc2a-dcb4-0a5e4c036aa0@denx.de>
 <a6908629697c460483b35ded72b69e96@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <1ed7200f-3425-5c13-096f-1ea5694ea731@denx.de>
Date: Wed, 8 Apr 2020 19:57:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a6908629697c460483b35ded72b69e96@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] arm: caches: protect
 dram_bank_mmu_setup access to bi_dram
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

On 4/8/20 7:54 PM, Patrick DELAUNAY wrote:
> Dear Marek,
> 
>> From: Marek Vasut <marex@denx.de>
>> Sent: vendredi 3 avril 2020 23:27
>>
>> On 4/3/20 10:28 AM, Patrick Delaunay wrote:
>>> Add protection in dram_bank_mmu_setup() to avoid access to bd->bi_dram
>>> before relocation.
>>>
>>> This patch allow to use the generic weak function dram_bank_mmu_setup
>>> to activate the MMU and the data cache in SPL or in U-Boot before
>>> relocation, when bd->bi_dram is not yet initialized.
>>>
>>> In this cases, the MMU must be initialized explicitly with
>>> mmu_set_region_dcache_behaviour function.
>>>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>>> ---
>>>
>>>  arch/arm/lib/cache-cp15.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
>>> index f8d20960da..54509f11c3 100644
>>> --- a/arch/arm/lib/cache-cp15.c
>>> +++ b/arch/arm/lib/cache-cp15.c
>>> @@ -91,6 +91,10 @@ __weak void dram_bank_mmu_setup(int bank)
>>>  	bd_t *bd = gd->bd;
>>>  	int	i;
>>>
>>> +	/* bd->bi_dram is available only after relocation */
>>> +	if ((gd->flags & GD_FLG_RELOC) == 0)
>>> +		return;
>>
>> Why not just set the bd->bi_dram correctly before this is called ?
> 
> Just set "bd->bi_dram" seens as a hack.
> 
> For me the bd struct can be updated only in  common/board_f.c
> after reserve_board() for U-Boot 
> Or other spl_set_bd() called in board_init_r() for SPL. 
> 
> And that can cause issue if CONFIG_NR_DRAM_BANKS > 1
> (even it is not the case today for STM32MP1).
> 
> But if this kind of protection is not correct here I prefer come back
> to overidde of the weak fucntio dram_bank_mmu_setup in stm32mp arch
> (it is the reason this weak definition)

I'd say, let's wait for feedback from the others.

I would be inclined to set bd->bi_dram, but maybe others have other
opinions.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
