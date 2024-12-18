Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C309F6375
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:39:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E5C6C78014;
	Wed, 18 Dec 2024 10:39:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26CDBC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:39:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60NJW011765;
 Wed, 18 Dec 2024 11:39:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wZQsRsmmR6gvjui3fD6ZLLSbboXFvFkdJwNc1YvHaNI=; b=AteKwr3YJFlfr0p+
 B/ncmpLl2916ff0lldg7BMCNbE+kgTCmXq2WMwR0JwxgNjiqjWAn3XBKIlMeoI5J
 h2az9dtcBAG0SXl8t1eM4Y7t36xsr4XOG938aoWPn58Z16d0abUelHaz/LxE3B7A
 MJPDCC43W4dFYPchc/FPR8B3b9ej6UlLhzNOsHDp7jZg/ychhC68sRn8i8y0cGPq
 nnc6S0XnittrCUm28+/4VCS14OTjJrBJn4gHXzXX61Qp/kGbs6Ahrw66JHtslEZ+
 AmUKe0ceNjNt7RyZ9q4E2SVyq9wmrfiBJKCovJIi/+phXiGoyOuW1vneGJURyuWl
 57+z2Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcs4ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:39:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A41D74005D;
 Wed, 18 Dec 2024 11:38:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E8CE26181C;
 Wed, 18 Dec 2024 11:36:21 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:36:20 +0100
Message-ID: <18af62bf-e7c4-4056-a8f8-ed74ff493cf8@foss.st.com>
Date: Wed, 18 Dec 2024 11:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241215233011.569287-1-marex@denx.de>
 <9e0c75e5-8047-4f21-9a0b-da2e058b0f09@foss.st.com>
 <1f436aef-5640-4792-be7b-0a9a5a7da8f9@foss.st.com>
Content-Language: en-US
In-Reply-To: <1f436aef-5640-4792-be7b-0a9a5a7da8f9@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] ARM: dts: stm32: Reinstate missing
 root oscillators on DH STM32MP15xx DHCOR
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



On 12/18/24 11:31, Patrice CHOTARD wrote:
> 
> 
> On 12/17/24 17:42, Patrice CHOTARD wrote:
>>
>>
>> On 12/16/24 00:29, Marek Vasut wrote:
>>> The root oscillators reference used to be in rcc node since
>>> 3d15245502c4 ("ARM: dts: stm32mp1: explicit clock reference needed by RCC clock driver")
>>> however this is not part of upstream stm32mp151.dtsi . The
>>> RCC driver does need this reference, reinstate it locally.
>>>
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
>>>  arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
>>> index 08439342cb2..ab162f39473 100644
>>> --- a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
>>> +++ b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
>>> @@ -112,6 +112,10 @@
>>>  };
>>>  
>>>  &rcc {
>>> +	clock-names = "hse", "hsi", "csi", "lse", "lsi";
>>> +	clocks = <&clk_hse>, <&clk_hsi>, <&clk_csi>,
>>> +		 <&clk_lse>, <&clk_lsi>;
>>> +
>>>  	st,clksrc = <
>>>  		CLK_MPU_PLL1P
>>>  		CLK_AXI_PLL2P
>>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Thanks
>> PAtrice
> Applied to u-boot-stm32/next
> 
> Thanks
> Patrice

Sorry, applied to u-boot-stm32/master

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
