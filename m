Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7516E5FD0
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Apr 2023 13:28:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B36B1C6A5FA;
	Tue, 18 Apr 2023 11:28:04 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9A38C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 11:28:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5665D85B70;
 Tue, 18 Apr 2023 13:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681817283;
 bh=NC3Ccws+tDseX4G9Niqih3m9o4jRn/ZwQgmHVi+eliY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GgT474BXZmlSVGBx23QoLLiZw0Z5xzBqaxdTc8ieqpE/Wu77VLoGezJiR8hVOJj6o
 UCwizozjFMV2CExbZDmQN+pe3zy/djgAiWTeruEXr4EwOCRpDY7OHngjHrcYW3G6vl
 WWLCzoZtqYpTaO6ROKKtvlagqoQ1kGGLmnMKEBwx1Pf0TezA3XWvYX7C0ry6IjK/FI
 mzCChckDENCyGTXNUSU85cxqwAA+8/GVQeQN24LGjYrQ5rPYxwyW2yw9fURg+2k278
 49B98B22h7WvYQJ5Q560cj4jaxY55iItetgCG7EQyz1V5LuPr1KSYxOVKBH56FZToh
 NlsbqqTJDPcMw==
Message-ID: <90af888a-b00a-7548-a28e-053d0096d5ad@denx.de>
Date: Tue, 18 Apr 2023 13:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20230417185558.1.If7ed2ccb5a1c1a84637d29d763cc1935d9b8815e@changeid>
 <d3e391f5-ce85-e5f9-41e4-81e271db8deb@denx.de>
 <f1de64e5-a99c-1eb2-edf5-3f6bd492692e@foss.st.com>
 <a0754b42-9ea4-5b38-1bae-2dd91ceb7f28@denx.de>
 <815f44f9-f6ac-c02d-77c0-bfadc665e808@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <815f44f9-f6ac-c02d-77c0-bfadc665e808@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: onboard-hub: Don't disable regulator
 in remove() callback
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 4/18/23 11:14, Patrice CHOTARD wrote:
> Hi Marek

Hello Patrice,

> On 4/18/23 10:25, Marek Vasut wrote:
>> On 4/18/23 09:21, Patrice CHOTARD wrote:
>>> Hi Marek
>>
>> Hello Patrice,
>>
>>> On 4/17/23 19:00, Marek Vasut wrote:
>>>> On 4/17/23 18:56, Patrice Chotard wrote:
>>>>> In case USB hub regulator is shared, unexpected behavior occurs.
>>>>> On stm32mp135f-dk, stm32mp157c-ev1 and stm32mp157x-dkx, regulator
>>>>> v3v3 is shared between several IP/devices (USB, panel, ethernet phy,
>>>>> camera, ...).
>>>>> Running command "usb stop", v3v3 regulator is switched off and
>>>>> the splashscreen content disappear.
>>>>>
>>>>> v3v3 shouldn't be disabled on usb_onboard_hub_remove() callback.
>>>>
>>>> Isn't the regulator enable/disable refcounted ?
>>>
>>> There is no refcount on regulator that's why we let regulator enable.
>>
>> Can we add that, instead of hacking around the missing refcount in every driver ?
> 
> I agree, it should a nice solution but, there is a but ;-)
>   _ it's the same situation for clocks and resets, there is no ref counter.

Those should indeed be fixed too. Hayashi-san from Socionext ran into 
the same problem recently IIRC.

>   _ what about side effects by adding ref counter where some platforms does
>     several enable on the same regulator (or even clock or reset) and only one
>     disable on it thinking that it's off ? or introduce new regulator_shared_xxx() API
>     to avoid side-effect with existing code.

Such platforms should be fixed if they misuse the regulators.

>   _ unfortunately, currently, i didn't get enough bandwidth to address these points :-(.

I also don't want to perpetuate these workarounds, can you find someone 
to add the refcounting ? It shouldn't be that hard, probably a new 
regulator struct member and ++/-- in enable/disable , maybe with some 
underflow check here and there.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
