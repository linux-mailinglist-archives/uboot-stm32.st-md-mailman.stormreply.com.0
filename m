Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02C199AE9
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:07:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E379C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:07:17 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1B07C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:07:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sDjv4JClz1rsXX;
 Tue, 31 Mar 2020 18:07:15 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sDjv3czdz1qqkQ;
 Tue, 31 Mar 2020 18:07:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id caCMoicMJZog; Tue, 31 Mar 2020 18:07:14 +0200 (CEST)
X-Auth-Info: X42bcTwH6UI4RA1AeGIusKmWDdjSxrJUVe7lRESFQCY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 31 Mar 2020 18:07:14 +0200 (CEST)
To: Patrice CHOTARD <patrice.chotard@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <1546595706-31360-1-git-send-email-patrice.chotard@st.com>
 <1546595706-31360-3-git-send-email-patrice.chotard@st.com>
 <f3e23915-c6ae-7c4d-7c5a-f725f726b5d4@denx.de>
 <ed1f23e8-6ae1-4f62-cb23-10f8061a45d1@st.com>
 <08d1a5d5-4d90-1c97-6e88-b44391bc0fe0@denx.de>
 <c0c7ba79-763e-3096-fbe6-f97e9f076592@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5916e5a0-bfcf-ce91-1fa5-e4f78c63e47b@denx.de>
Date: Tue, 31 Mar 2020 18:07:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c0c7ba79-763e-3096-fbe6-f97e9f076592@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v1 2/2] gpio: stm32f7: Fix SPL
	code size
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

On 3/31/20 4:10 PM, Patrice CHOTARD wrote:
> 
> On 3/31/20 1:22 PM, Marek Vasut wrote:
>> On 3/31/20 10:12 AM, Patrice CHOTARD wrote:
>>> Hi Marek
>> Hi,
>>
>>> On 3/31/20 4:51 AM, Marek Vasut wrote:
>>>> On 1/4/19 10:55 AM, Patrice Chotard wrote:
>>>>
>>>> Hi,
>>>>
>>>>> @@ -215,7 +220,9 @@ U_BOOT_DRIVER(gpio_stm32) = {
>>>>>  	.id	= UCLASS_GPIO,
>>>>>  	.of_match = stm32_gpio_ids,
>>>>>  	.probe	= gpio_stm32_probe,
>>>>> +#ifndef CONFIG_SPL_BUILD
>>>>>  	.ops	= &gpio_stm32_ops,
>>>>> +#endif
>>>>>  	.flags	= DM_UC_FLAG_SEQ_ALIAS,
>>>>>  	.priv_auto_alloc_size	= sizeof(struct stm32_gpio_priv),
>>>>>  };
>>>> The U-Boot DM GPIO uclass code assumes the .ops is always non-NULL.
>>>> Hence, this patch breaks all GPIO access (actually crashes SPL) on STM32
>>>> in SPL.
>>> I suppose it breaks AV96 boot ?
>> No, it does not. I was trying to read GPIO value in SPL and found this.
>>
>>> On my side i have checked on v2020-04-rc4 U-boot release, by reverting "gpio: stm32f7: Fix SPL code size"
>>>
>>> the stm32f7 SPL code size is below the 32Kb limit.
>>>
>>> I will send a patch to revert it.
>> OK sure, does that apply to all the STM32 systems ?
> Yes, all STM32 based platforms (F4/F7/H7 and MP1) are using this gpio driver.

What I wanted to ask about is whether you're sure they don't overflow in
SPL. But I suspect CI would tell you by now.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
