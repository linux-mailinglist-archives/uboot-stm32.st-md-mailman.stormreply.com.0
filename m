Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 185939F6393
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:42:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5055C78012;
	Wed, 18 Dec 2024 10:42:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 995B0C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:42:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60KUL011349;
 Wed, 18 Dec 2024 11:41:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 xs7OEkGIYWuvkaZ9foaG1jb6qYwzfmtII3/hRljkb9I=; b=cnCagSwcv87akeuF
 hzxt4AMtH+n+JcR6JukYLIIq1O7EvNeIYv3jX+eP1Dm19ParnJEWGm5AtHOoOYwk
 0qOJTXC6mjM9sdMVxcFNc/vxv3WyQaPsq78oRA7JCb8VdPWJHY5KEkplYt1jRxLF
 nhG3abAtCQBLD+JDMx1PwIYt3kx3ks2em6FUhVoRllQhHunosHad09qhyK33eKoz
 rBuV9tZwwZlhwdCT82LW+zTyfgMGyim5YBXsZ+c05V+Pg2vvI9bhev5oCJMmqs+Z
 1Jqi0IiXO5LfqO8A0QcbcLBUnmxYHs0hA3HizBw/SQBCZf8re+Auiiq0mjj2pUna
 qcsQhQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcs4mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:41:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 947284004D;
 Wed, 18 Dec 2024 11:40:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 377BD268199;
 Wed, 18 Dec 2024 11:40:21 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:40:20 +0100
Message-ID: <124da8d3-f126-434c-b5e7-933938702780@foss.st.com>
Date: Wed, 18 Dec 2024 11:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241215233210.569642-1-marex@denx.de>
 <f993a286-924f-4e73-8991-4563043c6c5c@foss.st.com>
 <996b51ba-9867-4d72-ad09-b16b610ec64b@foss.st.com>
Content-Language: en-US
In-Reply-To: <996b51ba-9867-4d72-ad09-b16b610ec64b@foss.st.com>
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
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Reinstate missing root
 oscillators on STM32MP15xx
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
> On 12/16/24 09:23, Patrice CHOTARD wrote:
>>
>>
>> On 12/16/24 00:31, Marek Vasut wrote:
>>> The root oscillators reference used to be in rcc node since
>>> 3d15245502c4 ("ARM: dts: stm32mp1: explicit clock reference needed by RCC clock driver")
>>> however this is not part of upstream stm32mp151.dtsi . The
>>> RCC driver does need this reference, reinstate it globally.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> NOTE: Would be good for 2025.01, but needs to be tested on other systems
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
>>>  arch/arm/dts/stm32mp15-u-boot.dtsi | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
>>> index 66d4c40c6a8..3f57bd5fe0f 100644
>>> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
>>> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
>>> @@ -186,6 +186,9 @@
>>>  	bootph-all;
>>>  	#address-cells = <1>;
>>>  	#size-cells = <0>;
>>> +	clock-names = "hse", "hsi", "csi", "lse", "lsi";
>>> +	clocks = <&clk_hse>, <&clk_hsi>, <&clk_csi>,
>>> +		 <&clk_lse>, <&clk_lsi>;
>>>  };
>>>  
>>>  &usart1 {
>>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Tested on STM32MP157C-DK2 and STM32MP157C-EV1
>>
>> Thanks
>> Patrice
>> _______________________________________________
>> Uboot-stm32 mailing list
>> Uboot-stm32@st-md-mailman.stormreply.com
>> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
> 
> Applied to u-boot-stm32/next
> 
> Thanks
> Patrice
Sorry, applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
