Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B99D8A527A
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Apr 2024 15:59:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44977C6DD67;
	Mon, 15 Apr 2024 13:59:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83D06C6DD66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 13:59:34 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5B6288818C;
 Mon, 15 Apr 2024 15:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713189573;
 bh=AkLaxEQ40bXSLAy8Wh8a9xLKYnY6eQAsBH2Mmk7rUUg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MKxvCkbzhI1X+B/miDnC0OsB6YECL8kUPFgBP5zkHu2X0XWCU36LaPfUKhv9Bcx0i
 jwfEokUBfXSHr+PUA9dpyMz8bx3Xzyg+39WljQBTHFjsXd71K9TpOhk0swMwlt0TiG
 TT3bhnHeuNzjlS1EA7UejGlg5AxbaMhV3FkUWxYULe2YrkYrTmvl3eqGPIj7wX0byN
 SHJIU1byjrQ7dV0cRB8i8jLCwFJ/GCe8eNLWU6xtsbY78ztilgZB8isCFA1JKDw0ty
 qnWIdIoxX8K/9rFzFC/IkVjYEhL3IaFawXKJtVX8dnRjVwmfO36wYfWzh5VFM2pdRw
 QmQSxeOfy4q2Q==
Message-ID: <604d605d-b3a7-4bd7-adce-381ea68e6d60@denx.de>
Date: Mon, 15 Apr 2024 14:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20240414184028.147067-1-marex@denx.de>
 <f808ec3d-966c-43e6-87be-18e742f976b3@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f808ec3d-966c-43e6-87be-18e742f976b3@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Initialize TAMP_SMCR
 BKP..PROT fields on STM32MP15xx
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

On 4/15/24 11:48 AM, Patrice CHOTARD wrote:
> 
> 
> On 4/14/24 20:39, Marek Vasut wrote:
>> In case of an OTP-CLOSED STM32MP15xx system, the CPU core 1 cannot be
>> released from endless loop in BootROM only by populating TAMP BKPxR 4
>> and 5 with magic and branch address and sending SGI0 interrupt from
>> core 0 to core 1 twice. TAMP_SMCR BKP..PROT fields must be initialized
>> as well to release the core 1 from endless loop during the second SGI0
>> handling on core 1. Initialize TAMP_SMCR to protect the first 16 backup
>> registers, the ones which contain the core 1 magic, branch address and
>> boot information.
>>
>> This requirement seems to be undocumented, therefore it was necessary
>> to trace and analyze the STM32MP15xx BootROM using OpenOCD and objdump.
>> Ultimately, it turns out that a certain BootROM function reads out the
>> TAMP_SMCR register and tests whether the BKP..PROT fields are non-zero.
>> If they are zero, the BootROM code again waits for SGI0 using WFI, else
>> the execution moves forward until it reaches handoff to the TAMP BKPxR 5
>> branch address.
>>
>> This fixes CPU core 1 release using U-Boot PSCI implementation on an
>> OTP-CLOSED system, i.e. system with fuse 0 bit 6 set.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Simon Glass <sjg@chromium.org
>> Cc: Simon Glass <sjg@chromium.org>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> index dd99150fbc2..138a6d6b614 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> @@ -14,6 +14,7 @@
>>   #include <asm/arch/sys_proto.h>
>>   #include <dm/device.h>
>>   #include <dm/uclass.h>
>> +#include <linux/bitfield.h>
>>   
>>   /* RCC register */
>>   #define RCC_TZCR		(STM32_RCC_BASE + 0x00)
>> @@ -41,6 +42,9 @@
>>   #define TZC_REGION_ID_ACCESS0	(STM32_TZC_BASE + 0x114)
>>   
>>   #define TAMP_CR1		(STM32_TAMP_BASE + 0x00)
>> +#define TAMP_SMCR		(STM32_TAMP_BASE + 0x20)
>> +#define TAMP_SMCR_BKPRWDPROT	GENMASK(7, 0)
>> +#define TAMP_SMCR_BKPWDPROT	GENMASK(23, 16)
>>   
>>   #define PWR_CR1			(STM32_PWR_BASE + 0x00)
>>   #define PWR_MCUCR		(STM32_PWR_BASE + 0x14)
>> @@ -136,6 +140,18 @@ static void security_init(void)
>>   	 */
>>   	writel(0x0, TAMP_CR1);
>>   
>> +	/*
>> +	 * TAMP: Configure non-zero secure protection settings. This is
>> +	 * checked by BootROM function 35ac on OTP-CLOSED device during
>> +	 * CPU core 1 release from endless loop. If secure protection
>> +	 * fields are zero, the core 1 is not released from endless
>> +	 * loop on second SGI0.
>> +	 */
>> +	clrsetbits_le32(TAMP_SMCR,
>> +			TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPRWDPROT,
> 
> Hi Marek
> 
> there is a typo, you used twice TAMP_SMCR_BKPRWDPROT :
> 
> TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPRWDPROT  => TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPWDPROT
>                                      ^~~~~

Fixed in V2, thanks.

btw are there any other such undocumented surprises in the BootROM ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
