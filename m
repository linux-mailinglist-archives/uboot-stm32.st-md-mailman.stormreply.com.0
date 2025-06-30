Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0FCAED46E
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jun 2025 08:22:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16777C3089D;
	Mon, 30 Jun 2025 06:22:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A7C0C30883
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 06:22:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U1AIeu031876;
 Mon, 30 Jun 2025 08:21:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 gMe6ommB8swqZiAdDQU9Qr3bHUFSCAPuKxST/U/8t+I=; b=2D6244Xoa4etQ+3E
 aUfsC1WWHjp8V0Lla20U8g9js3HHMAjP40R7iqgxVLjaLBgoo7rDnFfYmF5OJBJX
 45R1itolClPNLq93xNIs2Vg0vVX2JafCQQVH35IxMsQm7uU28VMRayctmibTUcMo
 nVQuuFZYk9PXB393sp1h/qFmaJxogAZgb9ZfUaETx7yJw3jPkfkcLGlMZcpUBbLx
 z2ck3i0v0OBVKSBeY2G8tAT4uZRX+4AZYMhDq2uJxs5pZBj3srwnm2t558rjo4ri
 cnb1LdfOuvze2kZv7oZKB2esAmIncelIzXmZzgzY+XfDrZDcHcfl34GKnmjTWgjg
 Zl+kQg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5h8ns0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 08:21:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 251D440050;
 Mon, 30 Jun 2025 08:20:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 706516D168F;
 Mon, 30 Jun 2025 08:20:13 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 08:20:12 +0200
Message-ID: <0c691188-9216-4f0c-ba42-73df986372e0@foss.st.com>
Date: Mon, 30 Jun 2025 08:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250630000926.952277-1-marek.vasut@mailbox.org>
 <8341a0eb-4182-4c40-9f0a-26b92941c18e@foss.st.com>
Content-Language: en-US
In-Reply-To: <8341a0eb-4182-4c40-9f0a-26b92941c18e@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 6/30/25 08:17, Patrice CHOTARD wrote:
> 
> 
> On 6/30/25 02:09, Marek Vasut wrote:
>> The stm32-reset-core.h is located in drivers/reset/stm32/ , it has to
>> be included using "stm32-reset-core.h" and not <stm32-reset-core.h> ,
>> otherwise the build fails. Fix it.
>>
>> Fixes: 0994a627c278 ("reset: stm32mp25: add stm32mp25 reset driver")
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Cc: Simon Glass <sjg@chromium.org>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  MAINTAINERS                            | 1 -
>>  drivers/reset/stm32/stm32-reset-core.c | 2 +-
>>  drivers/reset/stm32/stm32-reset-mp1.c  | 2 +-
>>  drivers/reset/stm32/stm32-reset-mp25.c | 2 +-
>>  drivers/reset/stm32/stm32-reset.c      | 2 +-
>>  5 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 92119667618..da16816e51c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -730,7 +730,6 @@ F:	include/dt-bindings/clock/stm32fx-clock.h
>>  F:	include/dt-bindings/clock/stm32mp*
>>  F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
>>  F:	include/dt-bindings/reset/stm32mp*
>> -F:	include/stm32-reset-core.h
>>  F:	include/stm32_rcc.h
>>  F:	tools/logos/st.bmp
>>  F:	tools/stm32image.c
>> diff --git a/drivers/reset/stm32/stm32-reset-core.c b/drivers/reset/stm32/stm32-reset-core.c
>> index 7dd92e07e1a..9eeed6536e0 100644
>> --- a/drivers/reset/stm32/stm32-reset-core.c
>> +++ b/drivers/reset/stm32/stm32-reset-core.c
>> @@ -6,7 +6,7 @@
>>  
>>  #include <dm.h>
>>  #include <reset-uclass.h>
>> -#include <stm32-reset-core.h>
>> +#include "stm32-reset-core.h"
>>  #include <stm32_rcc.h>
>>  #include <dm/device_compat.h>
>>  #include <linux/iopoll.h>
>> diff --git a/drivers/reset/stm32/stm32-reset-mp1.c b/drivers/reset/stm32/stm32-reset-mp1.c
>> index 6863f6e64b7..ce4532561e5 100644
>> --- a/drivers/reset/stm32/stm32-reset-mp1.c
>> +++ b/drivers/reset/stm32/stm32-reset-mp1.c
>> @@ -5,7 +5,7 @@
>>   */
>>  
>>  #include <dm.h>
>> -#include <stm32-reset-core.h>
>> +#include "stm32-reset-core.h"
>>  
>>  /* Reset clear offset for STM32MP RCC */
>>  #define RCC_CLR_OFFSET			0x4
>> diff --git a/drivers/reset/stm32/stm32-reset-mp25.c b/drivers/reset/stm32/stm32-reset-mp25.c
>> index 91c0336bc58..1cbe5c7f3d5 100644
>> --- a/drivers/reset/stm32/stm32-reset-mp25.c
>> +++ b/drivers/reset/stm32/stm32-reset-mp25.c
>> @@ -5,7 +5,7 @@
>>   */
>>  
>>  #include <dm.h>
>> -#include <stm32-reset-core.h>
>> +#include "stm32-reset-core.h"
>>  #include <stm32mp25_rcc.h>
>>  #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>>  
>> diff --git a/drivers/reset/stm32/stm32-reset.c b/drivers/reset/stm32/stm32-reset.c
>> index 975f67f712a..918e81e588f 100644
>> --- a/drivers/reset/stm32/stm32-reset.c
>> +++ b/drivers/reset/stm32/stm32-reset.c
>> @@ -5,7 +5,7 @@
>>   */
>>  
>>  #include <dm.h>
>> -#include <stm32-reset-core.h>
>> +#include "stm32-reset-core.h"
>>  
>>  /* Timeout for deassert */
>>  #define STM32_DEASSERT_TIMEOUT_US	10000
> 
> Which version of gcc do you use ? on my side i got no issue with arm-none-eabi-gcc (Arm GNU Toolchain 14.2.Rel1 (Build arm-14.52)) 14.2.1 20241119
> But nevertheless :
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> 

I double checked, in fact for AARCH64, i am using aarch64-none-elf-gcc (GNU Toolchain for the A-profile Architecture 10.3-2021.07 (arm-10.29)) 10.3.1 20210621 which is out of date.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
