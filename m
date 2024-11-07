Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4689C0ABF
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Nov 2024 17:04:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39750C6C855;
	Thu,  7 Nov 2024 16:04:48 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85628C6C83A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 16:04:41 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Xkn2b1cKxz9t8r;
 Thu,  7 Nov 2024 17:04:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1730995479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aE+F+l7PKxkm+iVQKJkBzB8Q9YHN6Z5pwK8T3bhFJx8=;
 b=S1suoMLOxtP4xLY+R6GXd9A/bedOnF8DsUPFIg383qzKfHxopPpSrtXc93kOF5TKoslxkd
 FLHmXw5izNPjEL4TjFoRBwpSRn9G1l0pf5yWcxQM4OY7HfpwMMWIP6wk9GaRbYV/p9uyvk
 7F5hhu7aOrL6LthsPTwBN45xNBHOqCdjlYMJ5jfNK5cbU+RwAZ1K3y5Rib/ToftDsSCufP
 bdNiaky13bBwddoKDsFh5s2DlPl/NhPqfcNKUv0Jt9LUaRR91LE1ZBHkwtnUBj7RO+IdwH
 lEcFQjj0yNxpvuKJO+3aRKTQpvl/VtwWEOcuIv5Ga3NlX3YwhnDQuAD8byJZcA==
Message-ID: <33e99705-77e3-4acf-95f7-fad65f60ae62@mailbox.org>
Date: Thu, 7 Nov 2024 17:04:35 +0100
MIME-Version: 1.0
To: Jon Humphreys <j-humphreys@ti.com>, Michal Simek <michal.simek@amd.com>,
 u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <b9cb3ec8-b6f2-4f38-8cda-d3d10278f503@amd.com>
 <e9929e0c-aa43-428f-8bf7-7b4cdef0e9c3@mailbox.org>
 <86v7x05fyd.fsf@udb0321960.dhcp.ti.com>
 <edcec18f-75a0-44d8-907a-f042779ca6ee@mailbox.org>
 <86ses458k3.fsf@udb0321960.dhcp.ti.com>
 <f7bb335d-681a-4b60-92f6-b605cc6f477f@mailbox.org>
 <86pln759j9.fsf@udb0321960.dhcp.ti.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <86pln759j9.fsf@udb0321960.dhcp.ti.com>
X-MBO-RS-ID: 87b71524b6b8fa36a2d
X-MBO-RS-META: 6nh1ijerm9qktmxifpsy348kc7t48g7h
Cc: Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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

On 11/7/24 4:49 PM, Jon Humphreys wrote:
> Marek Vasut <marek.vasut@mailbox.org> writes:
> 
>> On 11/6/24 10:58 PM, Jon Humphreys wrote:
>>> Marek Vasut <marek.vasut@mailbox.org> writes:
>>>
>>>> On 11/6/24 8:18 PM, Jon Humphreys wrote:
>>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
>>>>>
>>>>>> On 10/23/24 10:17 AM, Michal Simek wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 10/22/24 23:06, Marek Vasut wrote:
>>>>>>>> This reverts commit 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.
>>>>>>>>
>>>>>>>> This parallel/stacked support breaks basic SPI NOR support,
>>>>>>>> e.g. this no longer works:
>>>>>>>>
>>>>>>>> => sf probe && sf update 0x50000000 0 0x160000
>>>>>>>> SF: Detected s25fs512s with page size 256 Bytes, erase size 256 KiB,
>>>>>>>> total 64 MiB
>>>>>>>> device 0 offset 0x0, size 0x160000
>>>>>>>> SPI flash failed in read step
>>>>>>>
>>>>>>> Reverting everything seems to me too much. Tom has tested it on his HW
>>>>>>> and didn't see any issue. That's why better to look at code which is
>>>>>>> causing this.
>>>>>>> You are reverting everything but likely there is specific patch which is
>>>>>>> causing this. Which one is it?
>>>>>>> Which board was used for your testing? Likely we don't have access to it.
>>>>>>> Is there any QEMU available which can be used for debugging?
>>>>>>
>>>>>> The testcase including the exact SPI NOR model is above.
>>>>>>
>>>>>> iMX6 with w25q16dw seems to be broken too.
>>>>>>
>>>>>> Basically every board I have access no longer has a working "sf probe ;
>>>>>> sf update" combination ... so yeah, this means this patchset is
>>>>>> fundamentally broken.
>>>>>>
>>>>>
>>>>> I can also confirm that the patch series:
>>>>>
>>>>> f8efc68b30e Merge patch series "spi-nor: Add parallel and stacked memories
>>>>> support"
>>>>>
>>>>> breaks SPI NOR on TI platforms, particularly SK-AM62 and SK-AM62P:
>>>>>
>>>>> U-Boot 2024.10-00752-gf8efc68b30e2 (Nov 06 2024 - 12:25:13 -0600)
>>>>>
>>>>> SoC:   AM62X SR1.0 HS-FS
>>>>> Model: Texas Instruments AM625 SK
>>>>> ...
>>>>> Hit any key to stop autoboot:  0
>>>>> => sf probe && sf update ${loadaddr} 0x400000 0x10
>>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size 256 KiB, total 64 MiB
>>>>> device 0 offset 0x400000, size 0x10
>>>>> SPI flash failed in read step
>>>>> =>
>>>> Sigh ... can you please test current u-boot/master and see if the error
>>>> is fixed there ?
>>>>
>>>
>>> Yes I had verified it also fails against master, although the behavior was
>>> a bit different.  The .'s below are our DMA engine waiting indefinitely.
>>>
>>> => sf probe && sf update ${loadaddr} 0x400000 0x10
>>> SF: Detected s28hs512t with page size 256 Bytes, erase size 256 KiB, total 64 MiB
>>> device 0 offset 0x400000, size 0x10
>>> .....................................................
>>>
>>> I have not investigated further.
>>
>> Can you try and run some 'git bisect' to find out exactly which commit
>> broke your use case ? There is a bunch of fixes for the worst breakage
>> that landed recently, but clearly there is more.
>>
>> Full revert seems increasingly appealing ...
> 
> commit 5d40b3d384d
So there is still something broken in that specific commit that I missed 
when removing the defects ? Sigh ... can you try to narrow it down ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
