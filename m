Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749C6FF0B8
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 May 2023 13:54:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7035C6907C;
	Thu, 11 May 2023 11:54:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C48BC65E60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 11:54:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 65BCC85C96;
 Thu, 11 May 2023 13:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683806095;
 bh=ixLxOKA2mXuE63tDZnM17pCX81DYjxrIYLW7j8vqY+c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UXhZGxMWg9DkXfRvmu2Th1OEH8BwhQhlFbC5c2vtKRIpucwg4il/9oKH2k6d9/iVh
 VJRWZFXouYtDTlSaCbMfmBdCw/pViSUpuqlevCqO9qWTvdUDrYMFt4atjjKvX4WYDQ
 q82IJpSnxCj5m9pWAn2F76X1pR1Yl1jrF32yeIC/YQv8V6iuMOB/iu0D7YkMQtoM+h
 wNrdcI+JnYlRyVcvoSTdf2M0wB3COikY+c36TmIi80TxoyurW3PcKsnrQEREI1Cxqy
 st/nJIzkchGP+evH37P5uQoHYKb+tQim0glZLP6cjQ6OC7v3yrpOuGIfpqH7OSruMF
 hZbnmfQhF38Mw==
Message-ID: <0a44a562-fe18-c8a5-393a-a526be3ca42d@denx.de>
Date: Thu, 11 May 2023 13:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20230511002206.180116-1-marex@denx.de>
 <f30a7447-89e3-c3b3-3b8a-3ff048d0695b@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f30a7447-89e3-c3b3-3b8a-3ff048d0695b@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add IWDG handling into PSCI
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

On 5/11/23 08:39, Patrice CHOTARD wrote:

Hi,

> On 5/11/23 02:22, Marek Vasut wrote:
>> In case the IWDG is enabled by either U-Boot or Linux, the IWDG can never
>> be disabled again. That includes low power states, which means that if the
>> IWDG is enabled, the SoC would reset itself after a while in suspend via
>> the IWDG. This is not desired behavior.
>>
>> It is possible to enable IWDG pre-timeout IRQ which is routed into the EXTI,
>> and use that IRQ to wake the CPU up before the IWDG timeout is reached and
>> reset is triggered. This pre-timeout IRQ can be used to reload the WDT and
>> then suspend the CPU again every once in a while.
>>
>> Implement this functionality for both IWDG1 and IWDG2 by reading out all
>> the unmasked IRQs, comparing the list with currently pending IRQs in GICv3:
>> - If any IRQ is pending and it is NOT IWDG1 or IWDG2 pre-timeout IRQ,
>>    wake up and let OS handle the IRQs
>> - If IWDG1 or IWDG2 IRQ is pending and no other IRQ is pending,
>>    ping the respective IWDG and suspend again
>>
>> This does not seem to have any adverse impact on power consumption in suspend.

[...]

>> +		/* Ping IWDG2 and ACK pretimer IRQ */
>> +		if (iwdg2_wake) {
>> +			writel(IWDG_KR_RELOAD_KEY, STM32_IWDG2_BASE + IWDG_KR);
>> +			writel(IWDG_EWCR_EWIC, STM32_IWDG2_BASE + IWDG_EWCR);
>> +		}
>> +	}
>>   
>>   	writel(0x3, STM32_RCC_BASE + RCC_MP_SREQCLRR);
>>   	ddr_sw_self_refresh_exit();
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

I feel like maybe I need to whack the IWDG also BEFORE entering suspend, 
expect a V2 shortly.

Do you think this IWDG approach is fine to keep the system from 
rebooting in suspend ? Or do you see any better option for the MP1 ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
