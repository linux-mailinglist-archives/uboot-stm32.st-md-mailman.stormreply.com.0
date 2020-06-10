Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D39B21F5D57
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 22:46:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F3DCC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 20:46:26 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7756C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 20:46:25 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49hzYF0cgkz1qrfk;
 Wed, 10 Jun 2020 22:46:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49hzYF0147z1qql1;
 Wed, 10 Jun 2020 22:46:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id K8JAFvG6fgvx; Wed, 10 Jun 2020 22:46:24 +0200 (CEST)
X-Auth-Info: s+yPjEI/xwNymyJsLKh6morHUTztVA5ygppVM7gGDgs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 10 Jun 2020 22:46:23 +0200 (CEST)
To: Tom Rini <trini@konsulko.com>
References: <20200608092719.10643-1-patrick.delaunay@st.com>
 <20200610181019.GE24893@bill-the-cat>
 <9f331ffe-b156-8add-e098-69908b80cebf@denx.de>
 <20200610185218.GH24893@bill-the-cat>
 <552c2b40-7aaf-c015-ca49-ef14ae6ac905@denx.de>
 <20200610185851.GI24893@bill-the-cat>
 <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
 <20200610201148.GJ24893@bill-the-cat>
From: Marek Vasut <marex@denx.de>
Message-ID: <a3f20f91-fecb-81ed-6eb7-5070574f2c64@denx.de>
Date: Wed, 10 Jun 2020 22:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610201148.GJ24893@bill-the-cat>
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

On 6/10/20 10:11 PM, Tom Rini wrote:
[...]
>>>>> You mean be more like barebox and Linux where the board-specific stuff
>>>>> is kicked up one level and we have a more generic binary?  I don't know
>>>>> and there's so much work that would be required before having to move
>>>>> this from a Kconfig choice to just Kconfig options I don't see that as
>>>>> being a relevant question here.
>>>>>
>>>>> Or did I misunderstand the question?
>>>>
>>>> More like automatically have a Kconfig option generate it's _SPL and
>>>> _TPL variant.
>>>
>>> Ah.  Well, that is rephrasing my first question.  Would it ever make
>>> sense to have more than one of these enabled?
>>
>> For some sort of universal SPL, maybe ?
> 
> So no, there's not a reason today then and it should be a choice.

Can you provide some more detailed explanation why we shouldn't generate
_SPL and _TPL variants of Kconfig entries for all Kconfig entries ? It
would make things much simpler and permit configuring SPL/TPL the same
way U-Boot is configured, with their own set of options.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
