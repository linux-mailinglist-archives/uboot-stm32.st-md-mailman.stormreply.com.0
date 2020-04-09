Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE171A3269
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 12:21:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB4D0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 10:21:33 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05882C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2020 10:21:31 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48yccq1Gjyz1qsjp;
 Thu,  9 Apr 2020 12:21:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48yccq0JN4z1qv47;
 Thu,  9 Apr 2020 12:21:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id HSG4gj9eQUN6; Thu,  9 Apr 2020 12:21:29 +0200 (CEST)
X-Auth-Info: B1R1Dho7JMnAc1W0HpZ1dHXcHv6xcirYpNHCqbTiIy0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  9 Apr 2020 12:21:29 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <20200403102815.2.Ib6abcb05422a74bc6bc03daa71b15c98c99dbc5d@changeid>
 <ea5a59e9-dd9f-f2b6-a210-d99b417cb8f2@denx.de>
 <faf4ef59ca6a49c7a8a032726468fe43@SFHDAG6NODE3.st.com>
 <6e789fd398524ffbbdd6122278d72564@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <0dda916f-0573-6f02-a774-cc4e463759e4@denx.de>
Date: Thu, 9 Apr 2020 12:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6e789fd398524ffbbdd6122278d72564@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] arm: caches: add DCACHE_DEFAULT_OPTION
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

On 4/9/20 12:01 PM, Patrick DELAUNAY wrote:
> Dear Marek,

Hi,

>> From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On
>> Behalf Of Patrick DELAUNAY
>>
>> Dear Marek,
>>
>>> From: Marek Vasut <marex@denx.de>
>>> Sent: vendredi 3 avril 2020 23:29
>>>
>>> On 4/3/20 10:28 AM, Patrick Delaunay wrote:
>>>> Add the new flags DCACHE_DEFAULT_OPTION to define the default option
>>>> to use according the compilation flags
>>>> CONFIG_SYS_ARM_CACHE_WRITETHROUGH or
>>> CONFIG_SYS_ARM_CACHE_WRITEALLOC.
>>>
>>> Can't you unify these macros into a single Kconfig "select" statement
>>> instead , and then just select the matching cache configuration in Kconfig ?
>>
>> Yes I will try, with 2 steps
>> - migrate existing CONFIG_SYS_ARM_CACHE_.... in Kconfig
> 
> First step done...
> I will push it as a separate patchset I think.
> 
>> - add new option CONFIG_SYS_ARM_CACHE_OPTION
> 
> In fact it is to difficult to use select because each defines
> DCACHE_XXX value can have several values
> 
> they are build according CONFIG_ARM64 / LPAE
> 
> But, I can't use this define in Kconfig
> 
> I try :
> option	ARM_OPTION
> 	int "option"
> 	default DCACHE_WRITETHROUGHT if CONFIG_SYS_ARM_CACHE_WRITETHROUGH
> 	default DCACHE_ WRITEALLOC if CONFIG_SYS_ARM_CACHE_ WRITEALLOC
> 	default DCACHE_WRITEBACK if CONFIG_SYS_ARM_CACHE_WRITEBACK
> 
> int and hex is invalid, and string can't be use with "".
> 
> And I don't found way to build it automatically when option is activated.
> 
> Any idea ?

Maybe you can have a select in the Kconfig to set some differently named
option, e.g.

DCACHE_MODE_WRITE{THROUGH,ALLOC,BACK}

and then an ifdef in some header file, e.g.

#ifdef CONFIG_DCACHE_MODE_WRITETHROUGH
#define ARM_CACHE_MODE DCACHE_WRITETHROUGH
...

And then use ARM_CACHE_MODE where you need a value and
CONFIG_DCACHE_MODE{...} where you need a config option check.

Does this work ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
