Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 829C1AD1F04
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 15:39:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 478C5C32E92;
	Mon,  9 Jun 2025 13:39:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 528A4C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 13:39:52 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559CwQbk000352;
 Mon, 9 Jun 2025 15:39:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VA3DnS3Mv6Wki9VuiZb6AJeEBtE9eDNM74CPeSfqfo8=; b=Z6BqUOiXjnb8a94k
 P9Ep3n+XWaMymIKpb83yxzkMj7MGqPshJ+mjOdXNxx1knJR0uhqX4enySUEVsakK
 4xgPGA01UYudxu9FvS1XY16oQ1i7jdjikr1W4/6ldfg6aB5TLbdpI6pT1A1pN9dh
 tgNXGSlQwMd1Q3zrhObOYeOY1ecDP8jUR8cnJYsOZZNC0YCB0J31bBK81crpPCdP
 bUEJMdsxHv3NVTicPXGgcSDEDm+UXdZ3qQKddH3hW1nQ8iRgHlWg7c/tAl7sHkMa
 wTMgVJ9yNw1Um54qNWgODio3hIl+t5qLaQgdLnfJDR6THnYB/kAJ7jdOSUF7/OEv
 3esJXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aum86cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 15:39:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E6CED4004D;
 Mon,  9 Jun 2025 15:38:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22F92BB7161;
 Mon,  9 Jun 2025 15:38:28 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 15:38:27 +0200
Message-ID: <22d4d7b2-8cb9-47d2-8fdc-6506d32c0ed3@foss.st.com>
Date: Mon, 9 Jun 2025 15:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sumit Garg <sumit.garg@kernel.org>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <20250607093730.2249536-2-dario.binacchi@amarulasolutions.com>
 <aEbflAM3LY5thVwf@sumit-X1>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <aEbflAM3LY5thVwf@sumit-X1>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 1/9] ARM: dts: stm32h7-pinctrl: add _a
 suffix to u[s]art_pins phandles
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



On 6/9/25 15:20, Sumit Garg wrote:
> Hi Dario,
> 
> On Sat, Jun 07, 2025 at 11:37:09AM +0200, Dario Binacchi wrote:
>> Allow expanding possible configurations for the same peripheral,
>> consistent with the scheme adopted in Linux.
>>
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> Link: https://lore.kernel.org/r/20250427074404.3278732-2-dario.binacchi@amarulasolutions.com
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>
>> [ upstream commit: 6a36dca4375fce51b627f5a985a79fc8b8bd7f55 ]
>>
> 
> This doesn't show as a proper cherry-pick from devicetree-rebasing tree,
> following fails for me:
> 
> $ ./tools/update-subtree.sh pick dts 6a36dca4375fce51b627f5a985a79fc8b8bd7f55
> From https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing
>  * branch                    master     -> FETCH_HEAD
> fatal: bad object 6a36dca4375fce51b627f5a985a79fc8b8bd7f55
> 
> Has this patch landed in Linux mainline?

Hi Sumit

I confirm this patch and subsequent patches are present in Linux Mainline
There are part of STM32 pull request with tag stm32-dt-for-v6.16-1.

Dario has updated "in advance" the current dts/upstream/src/arm/st directory.

Patrice
> 
> Ditto for all the subsequent patches in this series.
> 
> -Sumit
> 
>> ---
>>
>>  dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi  | 8 ++++----
>>  dts/upstream/src/arm/st/stm32h743i-disco.dts  | 2 +-
>>  dts/upstream/src/arm/st/stm32h743i-eval.dts   | 2 +-
>>  dts/upstream/src/arm/st/stm32h750i-art-pi.dts | 6 +++---
>>  4 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi b/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
>> index 7f1d234e1024..ad00c1080a96 100644
>> --- a/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
>> +++ b/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
>> @@ -198,7 +198,7 @@
>>  		};
>>  	};
>>  
>> -	uart4_pins: uart4-0 {
>> +	uart4_pins_a: uart4-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('A', 0, AF8)>; /* UART4_TX */
>>  			bias-disable;
>> @@ -211,7 +211,7 @@
>>  		};
>>  	};
>>  
>> -	usart1_pins: usart1-0 {
>> +	usart1_pins_a: usart1-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
>>  			bias-disable;
>> @@ -224,7 +224,7 @@
>>  		};
>>  	};
>>  
>> -	usart2_pins: usart2-0 {
>> +	usart2_pins_a: usart2-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
>>  			bias-disable;
>> @@ -237,7 +237,7 @@
>>  		};
>>  	};
>>  
>> -	usart3_pins: usart3-0 {
>> +	usart3_pins_a: usart3-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
>>  				 <STM32_PINMUX('D', 12, AF7)>; /* USART3_RTS_DE */
>> diff --git a/dts/upstream/src/arm/st/stm32h743i-disco.dts b/dts/upstream/src/arm/st/stm32h743i-disco.dts
>> index 2b452883a708..8451a54a9a08 100644
>> --- a/dts/upstream/src/arm/st/stm32h743i-disco.dts
>> +++ b/dts/upstream/src/arm/st/stm32h743i-disco.dts
>> @@ -105,7 +105,7 @@
>>  };
>>  
>>  &usart2 {
>> -	pinctrl-0 = <&usart2_pins>;
>> +	pinctrl-0 = <&usart2_pins_a>;
>>  	pinctrl-names = "default";
>>  	status = "okay";
>>  };
>> diff --git a/dts/upstream/src/arm/st/stm32h743i-eval.dts b/dts/upstream/src/arm/st/stm32h743i-eval.dts
>> index 5c5d8059bdc7..4b0ced27b80e 100644
>> --- a/dts/upstream/src/arm/st/stm32h743i-eval.dts
>> +++ b/dts/upstream/src/arm/st/stm32h743i-eval.dts
>> @@ -145,7 +145,7 @@
>>  };
>>  
>>  &usart1 {
>> -	pinctrl-0 = <&usart1_pins>;
>> +	pinctrl-0 = <&usart1_pins_a>;
>>  	pinctrl-names = "default";
>>  	status = "okay";
>>  };
>> diff --git a/dts/upstream/src/arm/st/stm32h750i-art-pi.dts b/dts/upstream/src/arm/st/stm32h750i-art-pi.dts
>> index 44c307f8b09c..00d195d52a45 100644
>> --- a/dts/upstream/src/arm/st/stm32h750i-art-pi.dts
>> +++ b/dts/upstream/src/arm/st/stm32h750i-art-pi.dts
>> @@ -197,14 +197,14 @@
>>  };
>>  
>>  &usart2 {
>> -	pinctrl-0 = <&usart2_pins>;
>> +	pinctrl-0 = <&usart2_pins_a>;
>>  	pinctrl-names = "default";
>>  	status = "disabled";
>>  };
>>  
>>  &usart3 {
>>  	pinctrl-names = "default";
>> -	pinctrl-0 = <&usart3_pins>;
>> +	pinctrl-0 = <&usart3_pins_a>;
>>  	dmas = <&dmamux1 45 0x400 0x05>,
>>  	       <&dmamux1 46 0x400 0x05>;
>>  	dma-names = "rx", "tx";
>> @@ -221,7 +221,7 @@
>>  };
>>  
>>  &uart4 {
>> -	pinctrl-0 = <&uart4_pins>;
>> +	pinctrl-0 = <&uart4_pins_a>;
>>  	pinctrl-names = "default";
>>  	status = "okay";
>>  };
>> -- 
>> 2.43.0
>>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
