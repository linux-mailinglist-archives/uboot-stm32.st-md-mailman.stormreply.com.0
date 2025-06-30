Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B39AED8AF
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jun 2025 11:28:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C219DC32E8F;
	Mon, 30 Jun 2025 09:28:14 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0DD5C32E8E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 09:28:12 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bW16f40g3z9t0t;
 Mon, 30 Jun 2025 11:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751275690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWafNUkmmtO/r5TKM0wBEROwq7sbgmj1ZygsZDn8GvM=;
 b=fQVZuSmF3VlXq53yMWddRLp6PvQjk9yfCYVikS4ge4RjlaKvK0LGFS0f6WEMmo94lb0OsF
 4VvUZWTQ2OQVvGqA/PCSgKEcKQY5NJlyxdDnTI979n2JLlZ4B3hETO7Cp0Nsygf2XgIp6+
 CrYAWANIMMX0tZyyP8njKxP69JqQL1XMXWxr+nbmcFNfUvr5LYUvBdMxdUQ0JHVdKRkVqx
 QbLY6QQbbCW1mODYBV0x7IFaBl4T3LWH+bC7As+CYCTqmYP3W/rdvPNvTZAzzzbZKUj0p9
 nLlny7okci9x6e8m0O5c2QlF2RYcfrYsW6xZSd3OsuilbESgw1CY90xxeRKi3w==
Message-ID: <ae58844c-da5c-4951-a1bc-05757788955a@mailbox.org>
Date: Mon, 30 Jun 2025 11:28:08 +0200
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250630000926.952277-1-marek.vasut@mailbox.org>
 <8341a0eb-4182-4c40-9f0a-26b92941c18e@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <8341a0eb-4182-4c40-9f0a-26b92941c18e@foss.st.com>
X-MBO-RS-META: zaiq8tzjss5kjtn36dnnhimdqrnswqqe
X-MBO-RS-ID: 7217b8de11fc4359b27
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

On 6/30/25 8:17 AM, Patrice CHOTARD wrote:

>> diff --git a/drivers/reset/stm32/stm32-reset.c b/drivers/reset/stm32/stm32-reset.c
>> index 975f67f712a..918e81e588f 100644
>> --- a/drivers/reset/stm32/stm32-reset.c
>> +++ b/drivers/reset/stm32/stm32-reset.c
>> @@ -5,7 +5,7 @@
>>    */
>>   
>>   #include <dm.h>
>> -#include <stm32-reset-core.h>
>> +#include "stm32-reset-core.h"
>>   
>>   /* Timeout for deassert */
>>   #define STM32_DEASSERT_TIMEOUT_US	10000
> 
> Which version of gcc do you use ? on my side i got no issue with arm-none-eabi-gcc (Arm GNU Toolchain 14.2.Rel1 (Build arm-14.52)) 14.2.1 20241119
> But nevertheless :
arm-linux-gnueabi-gcc (Debian 14.2.0-19) 14.2.0
aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0

Both STM32MP1 and, as I discovered now, stm32mp25_defconfig fail to 
build. I suspect the ARM GCC fork might be setting up some CFLAGS, or 
some other such environment variables, which avoid this issue ? Try and 
check your build environment ("$ env") and see if there is something 
like that.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
