Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B583C908CE0
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 16:00:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E813C78012;
	Fri, 14 Jun 2024 14:00:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BCAEC6B460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 14:00:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CB5D9889E1;
 Fri, 14 Jun 2024 16:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718373636;
 bh=gGdoFSOWi/ZD8wwPN09pkI1El/Edww9RyaOk5FlLEhw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BDbV2XCQJ7kPwInzNY7RWkq1tfF/YEmlt5j++3YzdU4GluyCQBcv9DRSvVQ21BPER
 kw9uD5dUxgjPVqfv1CfCKNzMkThDouwuWHYlR9mBwEvNyUJW1NXyarhU3UBPaRCgz+
 x3kLqDNMqTGL3GrbZcNcMx2D+zdEURL23zMuPaqYCa7UVaG5UMXn+M8tKYEMizqeyF
 Ukc0oNH/vZdPsYc0Op2mjWnwfD+GoUD3F5oNgEAYFzcaKUCSS7C1Rf3dnvLE/qeOG4
 PqUy81CTonSpxJem7jfTAaiLtyF4nBkhY230xT0Oztx6rHzcjp7G+9gD1RAKzb9fK1
 uPasCbtSkVgXw==
Message-ID: <ca3c6071-2adf-452b-b4af-574fa57443f9@denx.de>
Date: Fri, 14 Jun 2024 15:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20240419220331.277574-1-marex@denx.de>
 <433560cb-8d8a-4db4-bc9b-d49a05da127b@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <433560cb-8d8a-4db4-bc9b-d49a05da127b@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Ping IWDG on exit from PSCI
	suspend code
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

On 6/14/24 2:00 PM, Patrice CHOTARD wrote:
> 
> 
> On 4/20/24 00:03, Marek Vasut wrote:
>> Make sure the OS would not get any spurious IWDG pretimeout IRQ
>> right after the system wakes up. This may happen in case the SoC
>> got woken up by another source than the IWDG pretimeout and the
>> pretimeout IRQ arrived immediately afterward, but too late to be
>> handled by the suspend main loop. In case either of the IWDG is
>> enabled, ping it first and then return to the OS.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Simon Glass <sjg@chromium.org>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   arch/arm/mach-stm32mp/stm32mp1/psci.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/psci.c b/arch/arm/mach-stm32mp/stm32mp1/psci.c
>> index 4f2379df45f..e99103910d9 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/psci.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/psci.c
>> @@ -808,6 +808,27 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
>>   	writel(SYSCFG_CMPENR_MPUEN, STM32_SYSCFG_BASE + SYSCFG_CMPENSETR);
>>   	clrbits_le32(STM32_SYSCFG_BASE + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
>>   
>> +	/*
>> +	 * Make sure the OS would not get any spurious IWDG pretimeout IRQ
>> +	 * right after the system wakes up. This may happen in case the SoC
>> +	 * got woken up by another source than the IWDG pretimeout and the
>> +	 * pretimeout IRQ arrived immediately afterward, but too late to be
>> +	 * handled by the main loop above. In case either of the IWDG is
>> +	 * enabled, ping it first and then return to the OS.
>> +	 */
>> +
>> +	/* Ping IWDG1 and ACK pretimer IRQ */
>> +	if (gic_enabled[4] & BIT(22)) {
>> +		writel(IWDG_KR_RELOAD_KEY, STM32_IWDG1_BASE + IWDG_KR);
>> +		writel(IWDG_EWCR_EWIC, STM32_IWDG1_BASE + IWDG_EWCR);
>> +	}
>> +
>> +	/* Ping IWDG2 and ACK pretimer IRQ */
>> +	if (gic_enabled[4] & BIT(23)) {
>> +		writel(IWDG_KR_RELOAD_KEY, STM32_IWDG2_BASE + IWDG_KR);
>> +		writel(IWDG_EWCR_EWIC, STM32_IWDG2_BASE + IWDG_EWCR);
>> +	}
>> +
>>   	/*
>>   	 * The system has resumed successfully. Rewrite LR register stored
>>   	 * on stack with 'ep' value, so that on return from this PSCI call,
> Applied to u-boot-stm32/next

This is a fix, should go into /master .
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
