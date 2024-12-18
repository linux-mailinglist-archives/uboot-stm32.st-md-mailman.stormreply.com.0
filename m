Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B7F9F63C7
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:49:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABCDDC78018;
	Wed, 18 Dec 2024 10:49:26 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AFEEC78012
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:49:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D21B10485892; Wed, 18 Dec 2024 11:49:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734518957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GF2IAtkdg4RF37m0GIfVfs10QPQ75NLkO7PQTFRgblw=;
 b=f9bRh/g31Jn3yZxEij4tQFLmquXoKGvhusRUcSfc/2x0CbgpYNZoOOu71i/0gTDO7DDlSi
 5k6KLF9ga5WR6nAp/l/ZlXmqyowVKbqIlvQ3MoaV1uuREvSEog/MxhpHPahoVbl6n2l1Bb
 MBeIcR5r7omDxu3mEZ8xzQ3/lxe+leRefc9kz+m0Njprovg+w6/aj1WYnxfoZ2QDbDMtou
 +etM8IcVGLoHSvNjjBd0OnD4BXfw2+Hp5T4CU2PKLpBm0rjtWkpJFEoJqxNuHMa2NY+I3v
 DjunxApzQdyybSZ6OtuiT5UnUHfIuo8cL7WhxMpqUWH+uQRIJzxoE2Yu7ulw+A==
Message-ID: <28be5835-46e6-4447-a7c0-d19e3777a98c@denx.de>
Date: Wed, 18 Dec 2024 11:42:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20241215233011.569287-1-marex@denx.de>
 <20241215233011.569287-2-marex@denx.de>
 <c78cd5dd-1e98-4c63-ba6a-dc97d4a91c7a@foss.st.com>
 <4dc85e80-3c73-4db0-8c47-2aaf7c35373a@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4dc85e80-3c73-4db0-8c47-2aaf7c35373a@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] ARM: dts: stm32: Reinstate
 SPL_SYS_MMCSD_RAW_MODE on DH STM32MP15xx DHSOM
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

On 12/18/24 11:32 AM, Patrice CHOTARD wrote:
> 
> 
> On 12/16/24 09:54, Patrice CHOTARD wrote:
>>
>>
>> On 12/16/24 00:29, Marek Vasut wrote:
>>> Commit 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
>>> broke booting from SD card on STM32MP15xx , reinstate raw mode SD
>>> boot configuration options and select the correct raw mode partition
>>> for STM32MP15xx to fix SD boot on STM32MP15xx DHSOM.
>>>
>>> Fixes: 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
>>> Reported-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> NOTE: For 2025.01
>>> ---
>>> Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
>>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>> Cc: Simon Glass <sjg@chromium.org>
>>> Cc: Tom Rini <trini@konsulko.com>
>>> Cc: u-boot@dh-electronics.com
>>> Cc: u-boot@lists.denx.de
>>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>>> ---
>>>   configs/stm32mp15_dhsom.config | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
>>> index efc149577ea..04ee9bfc444 100644
>>> --- a/configs/stm32mp15_dhsom.config
>>> +++ b/configs/stm32mp15_dhsom.config
>>> @@ -57,11 +57,14 @@ CONFIG_SPL_SPI_FLASH_SUPPORT=y
>>>   CONFIG_SPL_STACK=0x30000000
>>>   CONFIG_SPL_SYS_MALLOC=y
>>>   CONFIG_SPL_SYS_MALLOC_SIZE=0x1d00000
>>> +CONFIG_SPL_SYS_MMCSD_RAW_MODE=y
>>>   CONFIG_SPL_TEXT_BASE=0x2FFC2500
>>>   CONFIG_SPL_USB_GADGET=y
>>>   CONFIG_STM32_ADC=y
>>>   CONFIG_SYSRESET_SYSCON=y
>>>   CONFIG_SYS_BOOTCOUNT_ADDR=0x5C00A14C
>>> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=0x3
>>> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
>>>   CONFIG_SYS_MALLOC_F_LEN=0x3000
>>>   CONFIG_SYS_PBSIZE=1050
>>>   CONFIG_PREBOOT="run dh_preboot"
>>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Thanks
>> Patrice
> Applied to u-boot-stm32/next
u-boot-stm32/master, right ?
              ^^^^^^

This is for 2025.01 .
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
