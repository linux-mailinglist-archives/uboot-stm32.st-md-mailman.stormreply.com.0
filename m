Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2583C1F5E5D
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jun 2020 00:32:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93CACC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 22:32:47 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 393ECC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 22:32:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49j1vw0JS6z1qrf4;
 Thu, 11 Jun 2020 00:32:44 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49j1vv6rpwz1qqkt;
 Thu, 11 Jun 2020 00:32:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id G_XzSOki4lKS; Thu, 11 Jun 2020 00:32:42 +0200 (CEST)
X-Auth-Info: QPo+uCBXIRxSThMulktbj1IpE0Nm2XdTfkgY1VLS1t4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 11 Jun 2020 00:32:42 +0200 (CEST)
To: Tom Rini <trini@konsulko.com>
References: <20200610185851.GI24893@bill-the-cat>
 <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
 <20200610201148.GJ24893@bill-the-cat>
 <a3f20f91-fecb-81ed-6eb7-5070574f2c64@denx.de>
 <20200610205444.GK24893@bill-the-cat>
 <e9bd8f83-2542-530a-1c47-3ae839f557a6@denx.de>
 <20200610213522.GM24893@bill-the-cat>
 <0b8142d8-2375-ee8f-515d-680f8e93beed@denx.de>
 <20200610215737.GO24893@bill-the-cat>
 <7db25e91-a2ad-26d8-2fb9-f65ea7db0bce@denx.de>
 <20200610221747.GQ24893@bill-the-cat>
From: Marek Vasut <marex@denx.de>
Message-ID: <c2e4c1f1-5e0f-c7af-7bfd-6a5ca0125ffe@denx.de>
Date: Thu, 11 Jun 2020 00:32:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610221747.GQ24893@bill-the-cat>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@st.com>,
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

On 6/11/20 12:17 AM, Tom Rini wrote:
> On Thu, Jun 11, 2020 at 12:02:08AM +0200, Marek Vasut wrote:
>> On 6/10/20 11:57 PM, Tom Rini wrote:
>> [...]
>>
>>>> My point is more in the general direction of being able to configure
>>>> SPL/TPL/U-Boot separately, without being forced to craft nasty ifdeffery
>>>> in include/config/board.h if I need something enabled in SPL, but not in
>>>> U-Boot, and vice versa. And for that the Kconfig should be able to
>>>> somehow emit the _SPL/_TPL/U-Boot options of all symbols I think, so
>>>> that we won't need separate entry for each.
>>>
>>> I haven't seen a case where the nasty ifdeffery in a config header file
>>> wasn't basically either:
>>> - Now wrong (we _have_ the symbols today to say we don't want X in SPL)
>>> - Working around a case where we need to use $(SPL_TPL_) somewhere but
>>>   didn't know that we could use $(SPL_TPL_) to fix the problem instead.
>>> - Now not useful (for example, disable CMD_xxx for SPL, but we've really
>>>   sorted things out so now so doing that didn't help anything).
>>>
>>> Now I'm happy to admit that I just might be missing a case as I've only
>>> gotten as far as "undef CONFIG_[ABC]" and BOOTCOMMAND is possibly
>>> leading to embedding a long string where we really don't want it.
>>> Please point me at more undef cases that need to be resolved in some
>>> way.
>>
>> I don't want to resolve these problems one-by-one , the obvious solution
>> for them AND the growth of Kconfig files with multiple copies of the
>> same symbol for SPL/TPL/U-Boot is the have Kconfig generate those
>> symbols automatically for SPL/TPL/U-Boot and then let user pick the
>> configuration as needed. That would make the undefs in
>> include/configs/board.h go away easily and would reduce the duplication
>> in Kconfig files.
> 
> I strongly disagree that having two or three times the number of symbols
> to select from will result in a better outcome.  I see 386 SPL_
> '^config ' lines (of which a number are 'default y' lines) and that's
> more than I thought there would be.  There's also 6175 overall symbols
> today.  I would be hopeful that the "lets look at the DTS files and see
> what we can tell about a platform" thread could help with configuring a
> good binary better.  Because to me the worrisome entries are things like
> MMC_HS200_SUPPORT / SPL_MMC_HS200_SUPPORT as I would start by asking if
> the cases where we don't enable that in SPL are intention or oversight.

Surely HS200 (and HS400/SDR104/UHS) , which wastes _A_LOT_ of boot time
and a lot of space, is a good candidate for something to be disabled in SPL.

Some core platform-specific symbols are fine with not having matching
_SPL/_TPL counterpart, sure, but that's not the majority of the Kconfig
symbols, right? Or maybe we need some new Kconfig keyword (instead of
'config') to describe symbols which do need _SPL/_TPL variants ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
