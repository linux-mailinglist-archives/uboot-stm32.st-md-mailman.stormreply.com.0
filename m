Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 389549BF832
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2024 21:50:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBD64C6C855;
	Wed,  6 Nov 2024 20:50:47 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AE46C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 20:50:40 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XkHR20Hqhz9tGj;
 Wed,  6 Nov 2024 21:50:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1730926238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Adsvp/X+ew1+kO3La/O3fY9tUd7tBNOZAxDQ2V46kCI=;
 b=l2AnTTFlScEWS0GuZsneVbfypJBIFIFrByfhRtfvSELBI0B+gVxjYyPKGEGY5dxfExUG1x
 gnA7L5MBIbbVSOOqiaSv9SaoyaIUlHSeEZ8DAu5MSf3wu20uogo6CixSoOrkr+FiNpadwu
 j5P+KLMiL/VkjU7pCnK/8xPfeYBd0LmFw3K01ui0wCtPGBItUSLLBozffGdpHJrpeuvkuw
 dXU/jZ6k/h2nYrbb3JAvAVOQeHivduPGccfTodLxKWnRSTo0aW0LfDFdqdAwAWgyiDyP6E
 1s45KJeCSsDBHTuauvXJanIAjUMA5L6ggTGwn50O6f+QaLbmap9zsPssdt541w==
Message-ID: <edcec18f-75a0-44d8-907a-f042779ca6ee@mailbox.org>
Date: Wed, 6 Nov 2024 21:50:33 +0100
MIME-Version: 1.0
To: Jon Humphreys <j-humphreys@ti.com>, Michal Simek <michal.simek@amd.com>,
 u-boot@lists.denx.de
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <b9cb3ec8-b6f2-4f38-8cda-d3d10278f503@amd.com>
 <e9929e0c-aa43-428f-8bf7-7b4cdef0e9c3@mailbox.org>
 <86v7x05fyd.fsf@udb0321960.dhcp.ti.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <86v7x05fyd.fsf@udb0321960.dhcp.ti.com>
X-MBO-RS-META: c8kop66z7ecqt676niammtwd5jwfjpk9
X-MBO-RS-ID: a5578197f46efe02cc7
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
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

On 11/6/24 8:18 PM, Jon Humphreys wrote:
> Marek Vasut <marek.vasut@mailbox.org> writes:
> 
>> On 10/23/24 10:17 AM, Michal Simek wrote:
>>>
>>>
>>> On 10/22/24 23:06, Marek Vasut wrote:
>>>> This reverts commit 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.
>>>>
>>>> This parallel/stacked support breaks basic SPI NOR support,
>>>> e.g. this no longer works:
>>>>
>>>> => sf probe && sf update 0x50000000 0 0x160000
>>>> SF: Detected s25fs512s with page size 256 Bytes, erase size 256 KiB,
>>>> total 64 MiB
>>>> device 0 offset 0x0, size 0x160000
>>>> SPI flash failed in read step
>>>
>>> Reverting everything seems to me too much. Tom has tested it on his HW
>>> and didn't see any issue. That's why better to look at code which is
>>> causing this.
>>> You are reverting everything but likely there is specific patch which is
>>> causing this. Which one is it?
>>> Which board was used for your testing? Likely we don't have access to it.
>>> Is there any QEMU available which can be used for debugging?
>>
>> The testcase including the exact SPI NOR model is above.
>>
>> iMX6 with w25q16dw seems to be broken too.
>>
>> Basically every board I have access no longer has a working "sf probe ;
>> sf update" combination ... so yeah, this means this patchset is
>> fundamentally broken.
>>
> 
> I can also confirm that the patch series:
> 
> f8efc68b30e Merge patch series "spi-nor: Add parallel and stacked memories
> support"
> 
> breaks SPI NOR on TI platforms, particularly SK-AM62 and SK-AM62P:
> 
> U-Boot 2024.10-00752-gf8efc68b30e2 (Nov 06 2024 - 12:25:13 -0600)
> 
> SoC:   AM62X SR1.0 HS-FS
> Model: Texas Instruments AM625 SK
> ...
> Hit any key to stop autoboot:  0
> => sf probe && sf update ${loadaddr} 0x400000 0x10
> SF: Detected s28hs512t with page size 256 Bytes, erase size 256 KiB, total 64 MiB
> device 0 offset 0x400000, size 0x10
> SPI flash failed in read step
> =>
Sigh ... can you please test current u-boot/master and see if the error 
is fixed there ?

We really should've gone with a full revert I think ...
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
