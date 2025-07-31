Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE3CB16E74
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:21:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CEB7C3F933;
	Thu, 31 Jul 2025 09:21:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A188CC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:21:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V8mLdo031715;
 Thu, 31 Jul 2025 11:21:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ZOtU+/ibxzs3ZDBphfmufeiN7t/xWCHZi0iTxB4zK6s=; b=xifeL0+SkGP2tNh2
 OUVE4yCTYbvhevrkqLjBrJsPvNdQbuIghTBBxa8rO31cQxeVRU1M1oDr4RA7h7jb
 tzH4qEJ7y7DATaDY4NL2aeYHquUqOAHeGIMIWAsawPhAA05q5gjBbphnuR9BoFGZ
 959qexWpXY1w1Oh8aWDS3MR5zoaZioBjw+/9iadWihXY9tK8alXj9YfVtmEaBaO2
 e6RovbXIKDV2E7HOSHar8H42F0QTG25ozmYKzPdJzfpLAG9eK0zu1G0/m/FjZUkD
 9iME2XgfaZy/wdKP02KIkzfrHWg+J2NBRAOpNMOBo1YZGbSApKzEZ1zTw7lLenL1
 VCfdAA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484m59dwpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:21:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5B2494002D;
 Thu, 31 Jul 2025 11:20:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E32267530B7;
 Thu, 31 Jul 2025 11:20:25 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:20:25 +0200
Message-ID: <bdd7d4f8-a198-450a-bfa2-3b7766a3a1ae@foss.st.com>
Date: Thu, 31 Jul 2025 11:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Andrew Goodbody <andrew.goodbody@linaro.org>, Lukasz Majewski
 <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Tom Rini <trini@konsulko.com>
References: <20250724-clk_stm32-v1-1-c12dd33d28c2@linaro.org>
 <cb580383-8aa9-45e9-88a3-344232eec428@foss.st.com>
Content-Language: en-US
In-Reply-To: <cb580383-8aa9-45e9-88a3-344232eec428@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32: Wrong macros used in register
 read
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



On 7/28/25 10:47, Patrice CHOTARD wrote:
> 
> 
> On 7/24/25 13:37, Andrew Goodbody wrote:
>> Smatch reported a warning about a shift macro being used as a mask. Make
>> the obvious changes to make this register read calculation work the same
>> as the previous ones.
>>
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> ---
>> This fix is somewhat speculative as it is being made without
>> reference to any manual.
>> ---
>>  drivers/clk/stm32/clk-stm32h7.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/stm32/clk-stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
>> index aa3be414a29..df82db69738 100644
>> --- a/drivers/clk/stm32/clk-stm32h7.c
>> +++ b/drivers/clk/stm32/clk-stm32h7.c
>> @@ -549,8 +549,8 @@ static u32 stm32_get_PLL1_rate(struct stm32_rcc_regs *regs,
>>  	divr1 = readl(&regs->pll1divr) & RCC_PLL1DIVR_DIVR1_MASK;
>>  	divr1 = (divr1 >> RCC_PLL1DIVR_DIVR1_SHIFT) + 1;
>>  
>> -	fracn1 = readl(&regs->pll1fracr) & RCC_PLL1DIVR_DIVR1_MASK;
>> -	fracn1 = fracn1 & RCC_PLL1DIVR_DIVR1_SHIFT;
>> +	fracn1 = readl(&regs->pll1fracr) & RCC_PLL1FRACR_FRACN1_MASK;
>> +	fracn1 = (fracn1 >> RCC_PLL1FRACR_FRACN1_SHIFT) + 1;
>>  
>>  	vco = (pllsrc / divm1) * divn1;
>>  	rate = (pllsrc * fracn1) / (divm1 * 8192);
>>
>> ---
>> base-commit: 3532f1f5edfc97c9dcea723cdeb732eda44bc669
>> change-id: 20250724-clk_stm32-b097d32f3fe9
>>
>> Best regards,
> 
> Hi Andrew
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks

Applied to u-boot-stm32/master

Thanks
Patrice

> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
