Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D1986549
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 19:05:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDF95C7801E;
	Wed, 25 Sep 2024 17:05:18 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CFAFC78006
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 17:05:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C025588B11;
 Wed, 25 Sep 2024 19:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727283911;
 bh=CXIkLZIfmA65XiHglJ7v1Go+31HcR8kuKw34+s9j4Bk=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=UN792QB+AmmTB6mCnl4TvW6LX1qhWwrqmcRchWOUEw5te9kiinWGdTAbw7czMmWqF
 aT5jPhX7PzdikUfj+HedI02ci19LySe/87W3iruSd7q8SF6QL7+Z4BM8fFIydC7M+F
 mYjLBKudSs9rZ2ffdcprsEtvkp73MBujIA7mrexpEBSUBvmdBfgDJ4VKgZD321dDwg
 W3lAkcTviFXyEItwg0yIUA9A1A/J6Lt9AVhdrZbMcMzJY1BLFZfYg/hzz1DEAk8t2H
 tJeEq6bG+NQp+4TI6zVuowLG3pRZqbLQW7JrFok3cCJjTZd+8KN1wjIzo1tth1tB2T
 agK/m3+2u25Rw==
Message-ID: <6957bfce-21c5-4996-9e3f-a43f6243fa49@denx.de>
Date: Wed, 25 Sep 2024 19:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de,
 Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20240618225736.154959-1-marex@denx.de>
 <2fd69224-c299-4b43-9078-07e06cc345f5@foss.st.com>
Content-Language: en-US
In-Reply-To: <2fd69224-c299-4b43-9078-07e06cc345f5@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Fix TAMP_SMCR BKP..PROT
	fields on STM32MP15xx
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

On 6/19/24 8:35 AM, Patrice CHOTARD wrote:
> 
> 
> On 6/19/24 00:57, Marek Vasut wrote:
>> Update the TAMP_SMCR BKP..PROT fields to put first 10 registers
>> into protection zone 1 and next 5 into zone 2. This fixes use of
>> boot counter which is often in zone 3 and has to be updated from
>> Linux, which runs in NS.
>>
>> Fixes: 73f7fc944cf6 ("ARM: stm32: Initialize TAMP_SMCR BKP..PROT fields on STM32MP15xx")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> index f096fe538d8..ca202bec8ee 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> @@ -148,8 +148,8 @@ static void security_init(void)
>>   	 */
>>   	clrsetbits_le32(TAMP_SMCR,
>>   			TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPWDPROT,
>> -			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x20) |
>> -			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x20));
>> +			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x0A) |
>> +			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x0F));
>>   
>>   	/* GPIOZ: deactivate the security */
>>   	writel(BIT(0), RCC_MP_AHB5ENSETR);
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

I hope this bugfix will make it into 2024.10 , can you prepare a bugfix 
PR for 2024.10 ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
