Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38F9F63C6
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:49:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E227C78012;
	Wed, 18 Dec 2024 10:49:26 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68D35C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:49:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D31DF10485894; Wed, 18 Dec 2024 11:49:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734518959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtaPYyEaqySG5+65bd8xHn0IoFkBjSzrZ9D+mhxL1/k=;
 b=MAtk9MGMbEBbgkJIOjHr6mYzzuI2/8HxHDLmsBNJEaI3Cz5nOKOeR1bJUjNxj4ZPWYcTw4
 EZaF25eYTUuq1bpEV7pkSWRp6MDU6AQjQZk1bDh0rENvxDXpIiDKOR9O8o8lYcYx+G66M8
 IMixoY/x3s44BHTlbKQO3tnllV8eT09lDLoTmATo0qENluRVLoZRKZkgE4GTMy2BNO9Hw6
 9meLYqOjAxzaKo70U8QD10zTLq6+McJ4CruaPkSZgtUIyX7uATaMAhoY5SiLsKP25vuBeV
 mGFiDJtAh7R7K/WdX8RCwx7YLMMNvoOb0nuogniUSWBZiTZqli3Kv81WjftsPQ==
Message-ID: <69112757-7ed3-4501-993d-9bbe29871ea1@denx.de>
Date: Wed, 18 Dec 2024 11:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20241215233011.569287-1-marex@denx.de>
 <20241215233011.569287-2-marex@denx.de>
 <c78cd5dd-1e98-4c63-ba6a-dc97d4a91c7a@foss.st.com>
 <4dc85e80-3c73-4db0-8c47-2aaf7c35373a@foss.st.com>
 <782a079c-36e1-4f18-856e-35bbafca4e03@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <782a079c-36e1-4f18-856e-35bbafca4e03@foss.st.com>
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

On 12/18/24 11:38 AM, Patrice CHOTARD wrote:
> 
> 
> On 12/18/24 11:32, Patrice CHOTARD wrote:
>>
>>
>> On 12/16/24 09:54, Patrice CHOTARD wrote:
>>>
>>>
>>> On 12/16/24 00:29, Marek Vasut wrote:
>>>> Commit 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
>>>> broke booting from SD card on STM32MP15xx , reinstate raw mode SD
>>>> boot configuration options and select the correct raw mode partition
>>>> for STM32MP15xx to fix SD boot on STM32MP15xx DHSOM.
>>>>
>>>> Fixes: 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
>>>> Reported-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> NOTE: For 2025.01
>>>> ---
>>>> Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
>>>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>>>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>>> Cc: Simon Glass <sjg@chromium.org>
>>>> Cc: Tom Rini <trini@konsulko.com>
>>>> Cc: u-boot@dh-electronics.com
>>>> Cc: u-boot@lists.denx.de
>>>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>>>> ---
>>>>   configs/stm32mp15_dhsom.config | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
>>>> index efc149577ea..04ee9bfc444 100644
>>>> --- a/configs/stm32mp15_dhsom.config
>>>> +++ b/configs/stm32mp15_dhsom.config
>>>> @@ -57,11 +57,14 @@ CONFIG_SPL_SPI_FLASH_SUPPORT=y
>>>>   CONFIG_SPL_STACK=0x30000000
>>>>   CONFIG_SPL_SYS_MALLOC=y
>>>>   CONFIG_SPL_SYS_MALLOC_SIZE=0x1d00000
>>>> +CONFIG_SPL_SYS_MMCSD_RAW_MODE=y
>>>>   CONFIG_SPL_TEXT_BASE=0x2FFC2500
>>>>   CONFIG_SPL_USB_GADGET=y
>>>>   CONFIG_STM32_ADC=y
>>>>   CONFIG_SYSRESET_SYSCON=y
>>>>   CONFIG_SYS_BOOTCOUNT_ADDR=0x5C00A14C
>>>> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=0x3
>>>> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
>>>>   CONFIG_SYS_MALLOC_F_LEN=0x3000
>>>>   CONFIG_SYS_PBSIZE=1050
>>>>   CONFIG_PREBOOT="run dh_preboot"
>>>
>>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>> Thanks
>>> Patrice
>> Applied to u-boot-stm32/next
>>
>> Thanks
>> Patrice
> 
> Sorry, applied to u-boot-stm32/master
No worries, please ignore my previous email.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
