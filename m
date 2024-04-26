Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4F8B31EC
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 10:04:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51E3EC71292;
	Fri, 26 Apr 2024 08:04:28 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14CBBC71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 08:04:27 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q27nxx010202;
 Fri, 26 Apr 2024 10:04:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=SskUt9q6Vi8+rcJ5M2G3exI+h51lgLFmZETAG/p1k9g=; b=Je
 6XP9v+KO+ez6t8iX9rmheqRP2eZEqJROXjAKIduuibDyjFK6imgacEnmIw8GQiY2
 SIsl4qQuopbxYh8SmnSRTx1yzMf0INUI92okCyznQXh1gp0pKYn9znSruqyRkaCr
 wbmrLBo3Bbi98pWSdnN6kVQABp12JHCyBpLd7DVFoh3TIeOn3xlxZsj5h6AeNv9R
 RCCo5XTwfFjyjBWQd4fxBiGf09UO2pdC2Ur+fDpV+3POn15KYkm8JRsrZYDIRfEF
 ILlsxMr0Ph6s3C1ti9aXKdtw6eNFstprbXxHJYfDq3YWtD/+jYUari46ZCMUUEEk
 DXo9WAGGbyvKh6aPZFzA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmrnjeedp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 10:04:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E469B40046;
 Fri, 26 Apr 2024 10:04:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5905A2138D3;
 Fri, 26 Apr 2024 10:03:57 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 10:03:56 +0200
Message-ID: <802424ba-0f03-4d1d-9b92-be24e44fbd8d@foss.st.com>
Date: Fri, 26 Apr 2024 10:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240421231849.194648-1-marex@denx.de>
 <20240421231849.194648-16-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240421231849.194648-16-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 16/19] ARM: dts: stm32: Add alternate
 pinmux for MP13 USART2 pins
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



On 4/22/24 01:17, Marek Vasut wrote:
> Add another mux option for USART2 pins, this is used on
> DH electronics STM32MP13xx DHCOR DHSBC board.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13-pinctrl.dtsi | 41 +++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> index dae015a0ddf..65f91265a4d 100644
> --- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> @@ -758,4 +758,45 @@
>  				 <STM32_PINMUX('E', 11, ANALOG)>; /* USART2_CTS_NSS */
>  		};
>  	};
> +
> +	usart2_pins_b: usart2-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 11, AF1)>, /* USART2_TX */
> +				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('D', 15, AF1)>, /* USART2_RX */
> +				 <STM32_PINMUX('E', 15, AF3)>; /* USART2_CTS_NSS */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart2_idle_pins_b: usart2-idle-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
> +				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('D', 15, AF1)>; /* USART2_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart2_sleep_pins_b: usart2-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
> +				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
> +				 <STM32_PINMUX('D', 15, ANALOG)>, /* USART2_RX */
> +				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
> +		};
> +	};
>  };

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
