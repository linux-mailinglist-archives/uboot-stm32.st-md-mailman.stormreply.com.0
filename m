Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA3B14706
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Jul 2025 06:03:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FFEAC36B3F;
	Tue, 29 Jul 2025 04:03:21 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0398C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 04:03:19 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4brhXP3TKmz9tbL;
 Tue, 29 Jul 2025 06:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1753761797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yZDVs8hL+75fOHZKF0G37rm4qFxQfyDfih2PXTOTPg=;
 b=oFtmo+QRRPmafC0THbfMyXyoGGdu6sGfi6rqAVzGyDzn4yX8QU+XGLHbiwCYHdEtJpEokI
 it3vM/sg7yk2WhgqshZLjcE2SsRqBoALZ/V6j9hYWGEmmaf7rCcRzj3rg97gmOSW2hnSah
 D0G4YXjwlPUOno9Kqp6g86MeJYCFZyBuQLq6fD0tHzctPS8zlNh20gCDLaZI8GST4+27a4
 vg2jw1zZ+SNVorfO37dZtKrB1/8awoF0+gUezUqt9p5s1CcJgjlrd3MsZYHMbpGOiK39j9
 g2146dzd90AgGfGUeMkQjqeQdikWrrLfPhxijwkzfp4tWIgyPvGhEST2Y+XzEw==
Message-ID: <4199ed7b-77ed-4c4c-9da4-60843d25f57a@mailbox.org>
Date: Tue, 29 Jul 2025 06:03:15 +0200
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250630000926.952277-1-marek.vasut@mailbox.org>
 <8341a0eb-4182-4c40-9f0a-26b92941c18e@foss.st.com>
 <0c691188-9216-4f0c-ba42-73df986372e0@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <0c691188-9216-4f0c-ba42-73df986372e0@foss.st.com>
X-MBO-RS-ID: f20af5ad017c54451aa
X-MBO-RS-META: 8fgn9nqgj9c7m44q5mfbpousc8f1ym98
Cc: Tom Rini <trini@konsulko.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Simon Glass <sjg@chromium.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] reset: stm32: Fix header misuse
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

On 6/30/25 8:20 AM, Patrice CHOTARD wrote:

Hi,

>>> diff --git a/drivers/reset/stm32/stm32-reset.c b/drivers/reset/stm32/stm32-reset.c
>>> index 975f67f712a..918e81e588f 100644
>>> --- a/drivers/reset/stm32/stm32-reset.c
>>> +++ b/drivers/reset/stm32/stm32-reset.c
>>> @@ -5,7 +5,7 @@
>>>    */
>>>   
>>>   #include <dm.h>
>>> -#include <stm32-reset-core.h>
>>> +#include "stm32-reset-core.h"
>>>   
>>>   /* Timeout for deassert */
>>>   #define STM32_DEASSERT_TIMEOUT_US	10000
>>
>> Which version of gcc do you use ? on my side i got no issue with arm-none-eabi-gcc (Arm GNU Toolchain 14.2.Rel1 (Build arm-14.52)) 14.2.1 20241119
>> But nevertheless :
>>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Thanks
>> Patrice
>>
> 
> I double checked, in fact for AARCH64, i am using aarch64-none-elf-gcc (GNU Toolchain for the A-profile Architecture 10.3-2021.07 (arm-10.29)) 10.3.1 20210621 which is out of date.

2025.10-rc1 is now out, this is still broken.

-- 
Best regards,
Marek Vasut
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
