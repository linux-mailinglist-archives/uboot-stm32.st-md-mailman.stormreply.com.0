Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 197001F6C4C
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jun 2020 18:42:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF7BFC36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jun 2020 16:42:51 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 579B5C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2020 16:42:50 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49jV5j0snjz1rwvG;
 Thu, 11 Jun 2020 18:42:49 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49jV5j05fzz1qql8;
 Thu, 11 Jun 2020 18:42:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id jYX1u5tAeH0A; Thu, 11 Jun 2020 18:42:47 +0200 (CEST)
X-Auth-Info: bbBX9cTZA6kIXHtKdi3OqvZA5PsTMA6hGFTvPNOT+/M=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 11 Jun 2020 18:42:47 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>, Tom Rini <trini@konsulko.com>
References: <20200610185218.GH24893@bill-the-cat>
 <552c2b40-7aaf-c015-ca49-ef14ae6ac905@denx.de>
 <20200610185851.GI24893@bill-the-cat>
 <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
 <20200610201148.GJ24893@bill-the-cat>
 <a3f20f91-fecb-81ed-6eb7-5070574f2c64@denx.de>
 <20200610205444.GK24893@bill-the-cat>
 <e9bd8f83-2542-530a-1c47-3ae839f557a6@denx.de>
 <20200610213522.GM24893@bill-the-cat>
 <0b8142d8-2375-ee8f-515d-680f8e93beed@denx.de>
 <20200610215737.GO24893@bill-the-cat>
 <9c3c3eafbeed4db89058bca2b66a65cb@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5e637427-e279-c234-38ab-4030fb418786@denx.de>
Date: Thu, 11 Jun 2020 18:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9c3c3eafbeed4db89058bca2b66a65cb@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add Kconfig option to
 select supported configuration
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

On 6/11/20 3:44 PM, Patrick DELAUNAY wrote:
> Hi,
> 
>> From: Tom Rini <trini@konsulko.com>
>> Sent: mercredi 10 juin 2020 23:58
>>
>> On Wed, Jun 10, 2020 at 11:40:33PM +0200, Marek Vasut wrote:
>>> On 6/10/20 11:35 PM, Tom Rini wrote:
>>>> On Wed, Jun 10, 2020 at 10:56:40PM +0200, Marek Vasut wrote:
>>>>> On 6/10/20 10:54 PM, Tom Rini wrote:
>>>>>> On Wed, Jun 10, 2020 at 10:46:23PM +0200, Marek Vasut wrote:
>>>>>>> On 6/10/20 10:11 PM, Tom Rini wrote:
>>>>>>> [...]
>>>>>>>>>>>> You mean be more like barebox and Linux where the
>>>>>>>>>>>> board-specific stuff is kicked up one level and we have a
>>>>>>>>>>>> more generic binary?  I don't know and there's so much work
>>>>>>>>>>>> that would be required before having to move this from a
>>>>>>>>>>>> Kconfig choice to just Kconfig options I don't see that as being a
>> relevant question here.
>>>>>>>>>>>>
>>>>>>>>>>>> Or did I misunderstand the question?
>>>>>>>>>>>
>>>>>>>>>>> More like automatically have a Kconfig option generate it's
>>>>>>>>>>> _SPL and _TPL variant.
>>>>>>>>>>
>>>>>>>>>> Ah.  Well, that is rephrasing my first question.  Would it
>>>>>>>>>> ever make sense to have more than one of these enabled?
>>>>>>>>>
>>>>>>>>> For some sort of universal SPL, maybe ?
>>>>>>>>
>>>>>>>> So no, there's not a reason today then and it should be a choice.
>>>>>>>
>>>>>>> Can you provide some more detailed explanation why we shouldn't
>>>>>>> generate _SPL and _TPL variants of Kconfig entries for all
>>>>>>> Kconfig entries ? It would make things much simpler and permit
>>>>>>> configuring SPL/TPL the same way U-Boot is configured, with their own
>> set of options.
>>>>>>
>>>>>> In the context of this particular thread?  I don't see how it's
>>>>>> helpful to say 3 times that we're in fact building for Tegra or
>>>>>> STM32 or SoCFPGA when you can't build something that runs on more
>> than one of those.
>>>>>
>>>>> In general.
>>>>>
>>>>> Here I can imagine it is possible to build SoCFPGA+STM32 universal
>>>>> SD card image in fact.
>>>>
>>>> So that's the case I brought up at first and you said no to.
>>>
>>> I think I don't understand this part.
>>
>> You're talking about a binary that runs on more than one dissimilar SoC, yes?
>>
>>>> I don't
>>>> see that in the foreseeable future but I don't feel so strongly
>>>> about making this config area tidy enough to argue the point.  So
>>>> fine, leave it as separate options, the default y if ... is
>>>> reasonable enough to ensure we get functional builds.
>>>
>>> This patch is OK as-is.
>>
>> Yes, since I'm no longer asking for changes to it, it's fine.
> 
> I don't see possible use case where the 3 drivers configurations can be activated at the same time, 
> Except, as Marek indicated it, the same U-Boot binary compiled to be executed for several architecture
> (STM32, IMX, TEGRA).
> 
> But it is not possible (duplicate cote between arch)  as each configuration is linked to archictecture variant 
> (the synopsis IP is modified by SOC vendor).

You can build Linux for all three and use the same zImage, so it should
also be possible for U-Boot.

> For me it should be possible to change the config option to select,
> even it is no more requested and the patch is OK as-is (I keep the possibility to have the 3 options activated).

The patch is OK.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
