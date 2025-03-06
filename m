Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B14A54D6A
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 Mar 2025 15:18:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4173C7802C;
	Thu,  6 Mar 2025 14:18:48 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3187FCFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 14:18:47 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526D6QuR028050;
 Thu, 6 Mar 2025 15:18:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 O3wb5Mug24HR+BcOGmooGJPfc5Bpd6OkqTbvEaq62PU=; b=l40jB+q7Z35I0hvQ
 cBgLNiFXur0FRd0ei7KkKjYRa5GOTNylkkkflNo7s67j7XLyz+MOutA5gsnlkOtt
 L/zjl6jy2NUpBGrBvCd0twE96wFFXydSDIjZcft8wVmq4juHvETfHBg78Qbi8svE
 8jo+3QuW/8JGU8/dIv8uZEh5R4S37Ep7Y9J2d1Q8oWIBZT/Q422PlYBBy4lhZICW
 fec3O2x2GPOnLUFpl9Zn/5iocZfFwyr1hX9P8wcjPteQZluVKOJmsBvcstM1LULj
 8L8eZyczEfLsTMx6aWh60Pp4ye4QpfkwygEHW3p7yGwOdONratCxj3Yo0q/C8KR5
 VZT20g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 457a6fhka5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Mar 2025 15:18:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 31DA340092;
 Thu,  6 Mar 2025 15:17:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2555A58B422;
 Thu,  6 Mar 2025 15:15:51 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 15:15:50 +0100
Message-ID: <8e3c03a0-1c4d-4ba8-a7b1-cd40d4970f61@foss.st.com>
Date: Thu, 6 Mar 2025 15:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cheick Traore <cheick.traore@foss.st.com>, <u-boot@lists.denx.de>
References: <20250306105620.624760-1-cheick.traore@foss.st.com>
 <20250306115558.5.I5d62f5f0b3ce4f79b98141f4b79668f0756ea992@changeid>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250306115558.5.I5d62f5f0b3ce4f79b98141f4b79668f0756ea992@changeid>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 5/5] ARM: dts: stm32: Add TIMERS inverted
 PWM channel 3 on STM32MP135F-DK
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



On 3/6/25 11:56, Cheick Traore wrote:
> The pwm source TIM1_CH3N channel (on PE12) in inverted polarity mode
> will be used to manage the brightness of the panel backlight on
> STM32MP135F-DK.
> 
> Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp13-pinctrl.dtsi | 15 +++++++++++++++
>  arch/arm/dts/stm32mp135f-dk.dts     | 14 ++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> index c01d39f03ea..52c2a9f24d7 100644
> --- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> @@ -215,6 +215,21 @@
>  		};
>  	};
>  
> +	pwm1_ch3n_pins_a: pwm1-ch3n-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('E', 12, AF1)>; /* TIM1_CH3N */
> +			bias-pull-down;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	pwm1_ch3n_sleep_pins_a: pwm1-ch3n-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('E', 12, ANALOG)>; /* TIM1_CH3N */
> +		};
> +	};
> +
>  	pwm3_pins_a: pwm3-0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('B', 1, AF2)>; /* TIM3_CH4 */
> diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
> index eea740d097c..275823da3c6 100644
> --- a/arch/arm/dts/stm32mp135f-dk.dts
> +++ b/arch/arm/dts/stm32mp135f-dk.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pwm/pwm.h>
>  #include <dt-bindings/regulator/st,stm32mp13-regulator.h>
>  #include "stm32mp135.dtsi"
>  #include "stm32mp13xf.dtsi"
> @@ -207,6 +208,19 @@
>  	status = "disabled";
>  };
>  
> +&timers1 {
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "okay";
> +	pwm1: pwm {
> +		pinctrl-0 = <&pwm1_ch3n_pins_a>;
> +		pinctrl-1 = <&pwm1_ch3n_sleep_pins_a>;
> +		pinctrl-names = "default", "sleep";
> +		status = "okay";
> +	};
> +};
> +
>  &timers3 {
>  	/delete-property/dmas;
>  	/delete-property/dma-names;


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
