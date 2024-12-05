Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3629A9E4CFF
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Dec 2024 05:17:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2C2FC71292;
	Thu,  5 Dec 2024 04:17:23 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6325BC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 04:17:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B54GdBw1892735
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2024 22:16:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1733372199;
 bh=feWS9gOTOCZFLRlAHLyZL5+U0wTwZccyKn22LwFkUpo=;
 h=From:To:CC:Subject:In-Reply-To:References:Date;
 b=jansHxxKSRHoiNgQzLW/IgVtYH7z6jrFFy6Lraw/lULGuqIb1vsC7nPOpcINOckFw
 kZqQ8eBn3eP20Ess/gBDK+/efxO/3Gqi8E82WPgCHGY92boLMhu1mEOn9hH3d9eo5n
 wvCNwIigWmPi4+863AP3Idbtp2LBokePggMwwvuI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B54Gd4Q097163
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Dec 2024 22:16:39 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 22:16:38 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 22:16:38 -0600
Received: from localhost (udb0321960.dhcp.ti.com [128.247.79.44])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B54Gcln014936;
 Wed, 4 Dec 2024 22:16:38 -0600
From: Jon Humphreys <j-humphreys@ti.com>
To: Marek Vasut <marek.vasut@mailbox.org>, Michal Simek
 <michal.simek@amd.com>, <u-boot@lists.denx.de>,
 Tom Rini <trini@konsulko.com>
In-Reply-To: <86ldxp6ehf.fsf@udb0321960.dhcp.ti.com>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <b9cb3ec8-b6f2-4f38-8cda-d3d10278f503@amd.com>
 <e9929e0c-aa43-428f-8bf7-7b4cdef0e9c3@mailbox.org>
 <86v7x05fyd.fsf@udb0321960.dhcp.ti.com>
 <edcec18f-75a0-44d8-907a-f042779ca6ee@mailbox.org>
 <86ses458k3.fsf@udb0321960.dhcp.ti.com>
 <f7bb335d-681a-4b60-92f6-b605cc6f477f@mailbox.org>
 <86pln759j9.fsf@udb0321960.dhcp.ti.com>
 <33e99705-77e3-4acf-95f7-fad65f60ae62@mailbox.org>
 <86ldxp6ehf.fsf@udb0321960.dhcp.ti.com>
Date: Wed, 4 Dec 2024 22:16:38 -0600
Message-ID: <865xny69y1.fsf@udb0321960.dhcp.ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Jon Humphreys <j-humphreys@ti.com> writes:

> Marek Vasut <marek.vasut@mailbox.org> writes:
>
>> On 11/7/24 4:49 PM, Jon Humphreys wrote:
>>> Marek Vasut <marek.vasut@mailbox.org> writes:
>>> 
>>>> On 11/6/24 10:58 PM, Jon Humphreys wrote:
>>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
>>>>>
>>>>>> On 11/6/24 8:18 PM, Jon Humphreys wrote:
>>>>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
>>>>>>>
>>>>>>>> On 10/23/24 10:17 AM, Michal Simek wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 10/22/24 23:06, Marek Vasut wrote:
>>>>>>>>>> This reverts commit 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.
>>>>>>>>>>
>>>>>>>>>> This parallel/stacked support breaks basic SPI NOR support,
>>>>>>>>>> e.g. this no longer works:
>>>>>>>>>>
>>>>>>>>>> => sf probe && sf update 0x50000000 0 0x160000
>>>>>>>>>> SF: Detected s25fs512s with page size 256 Bytes, erase size 256 KiB,
>>>>>>>>>> total 64 MiB
>>>>>>>>>> device 0 offset 0x0, size 0x160000
>>>>>>>>>> SPI flash failed in read step
>>>>>>>>>
>>>>>>>>> Reverting everything seems to me too much. Tom has tested it on his HW
>>>>>>>>> and didn't see any issue. That's why better to look at code which is
>>>>>>>>> causing this.
>>>>>>>>> You are reverting everything but likely there is specific patch which is
>>>>>>>>> causing this. Which one is it?
>>>>>>>>> Which board was used for your testing? Likely we don't have access to it.
>>>>>>>>> Is there any QEMU available which can be used for debugging?
>>>>>>>>
>>>>>>>> The testcase including the exact SPI NOR model is above.
>>>>>>>>
>>>>>>>> iMX6 with w25q16dw seems to be broken too.
>>>>>>>>
>>>>>>>> Basically every board I have access no longer has a working "sf probe ;
>>>>>>>> sf update" combination ... so yeah, this means this patchset is
>>>>>>>> fundamentally broken.
>>>>>>>>
>>>>>>>
>>>>>>> I can also confirm that the patch series:
>>>>>>>
>>>>>>> f8efc68b30e Merge patch series "spi-nor: Add parallel and stacked memories
>>>>>>> support"
>>>>>>>
>>>>>>> breaks SPI NOR on TI platforms, particularly SK-AM62 and SK-AM62P:
>>>>>>>
>>>>>>> U-Boot 2024.10-00752-gf8efc68b30e2 (Nov 06 2024 - 12:25:13 -0600)
>>>>>>>
>>>>>>> SoC:   AM62X SR1.0 HS-FS
>>>>>>> Model: Texas Instruments AM625 SK
>>>>>>> ...
>>>>>>> Hit any key to stop autoboot:  0
>>>>>>> => sf probe && sf update ${loadaddr} 0x400000 0x10
>>>>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size 256 KiB, total 64 MiB
>>>>>>> device 0 offset 0x400000, size 0x10
>>>>>>> SPI flash failed in read step
>>>>>>> =>
>>>>>> Sigh ... can you please test current u-boot/master and see if the error
>>>>>> is fixed there ?
>>>>>>
>>>>>
>>>>> Yes I had verified it also fails against master, although the behavior was
>>>>> a bit different.  The .'s below are our DMA engine waiting indefinitely.
>>>>>
>>>>> => sf probe && sf update ${loadaddr} 0x400000 0x10
>>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size 256 KiB, total 64 MiB
>>>>> device 0 offset 0x400000, size 0x10
>>>>> .....................................................
>>>>>
>>>>> I have not investigated further.
>>>>
>>>> Can you try and run some 'git bisect' to find out exactly which commit
>>>> broke your use case ? There is a bunch of fixes for the worst breakage
>>>> that landed recently, but clearly there is more.
>>>>
>>>> Full revert seems increasingly appealing ...
>>> 
>>> commit 5d40b3d384d
>> So there is still something broken in that specific commit that I missed 
>> when removing the defects ? Sigh ... can you try to narrow it down ?
>
> Hi Marek, I tried to narrow the changes in commit
> 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 a bit by first applying all of the
> changes in the .h files, and then for spi-nor-core.c, only applying changes
> per function. The only function change that causes errors was
> spi_nor_read(). With the changes in spi_nor_read() in commit
> 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 applied to the prior commit
> fbe16bc2801, did I get:
>
> => sf probe && sf update ${loadaddr} 0x400000 0x10
> SF: Detected s28hs512t with page size 256 Bytes, erase size 256 KiB, total 64 MiB
> device 0 offset 0x400000, size 0x10
> SPI flash failed in read step
>

Hi all.  What is the status of addressing the failures introduced by this
patchset?  I tried building from u-boot next and still see the failure.

Marek, was the isolation of changes I performed above helpful in
understanding the failure?

Thanks
Jon

> Let me know if this helps.  
>
> Jon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
