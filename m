Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A648B31F4
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 10:05:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B5EFC71292;
	Fri, 26 Apr 2024 08:05:22 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F698C71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 08:05:21 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q03FN6029882;
 Fri, 26 Apr 2024 10:05:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ndoOF1OpZGTg6/nqbwtHAEhrvdBDYSP6oKt8eowX8gM=; b=IA
 oI9Rwi1e6OSeaAPAmAu1fPvCWvWlefLfXI7fe1KMPkyvri0FxX7oLxWcmjyyCyvB
 sJRhOcW/5Txr2hH+qzkVIlieJy5jXgXPzIw8461Kc8nbFHfFm0iAmAQ30a29t6X9
 lokN5vmuaf+k991Wz5KRF5dUZ1l7yg9G79YH7Kb4KCB6ChU1aRFD7qV9VJxk76CE
 KdcKFH9ayG+EJwadfOdWHpYeQlL1IlzJJpLojADSC5vFPJRQDel2ZF/7z88Lsqz4
 9V/3XpvPvMtyvT4FioG5axKB3rk3Pflb0uNKLmrOU3e5AtFVZZcRwd5LV7+JrddQ
 S5h6LGwggjKw0tSsdaRA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmrnjeehy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 10:05:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 92B0540044;
 Fri, 26 Apr 2024 10:05:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EF6E2138D3;
 Fri, 26 Apr 2024 10:04:53 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 10:04:53 +0200
Message-ID: <8161e388-59d8-42a4-be1a-f389b4d3e1f7@foss.st.com>
Date: Fri, 26 Apr 2024 10:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240421231849.194648-1-marex@denx.de>
 <20240421231849.194648-18-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240421231849.194648-18-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 18/19] ARM: dts: stm32: Add alternate
 pinmux for MP13 UART7 pins
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
> Add another mux option for UART7 pins, this is used on
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
> index 7014c7a6d23..c01d39f03ea 100644
> --- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> @@ -647,6 +647,47 @@
>  		};
>  	};
>  
> +	uart7_pins_a: uart7-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('H', 2, AF8)>, /* UART7_TX */
> +				 <STM32_PINMUX('B', 12, AF7)>; /* UART7_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('E', 10, AF7)>, /* UART7_RX */
> +				 <STM32_PINMUX('G', 7, AF8)>; /* UART7_CTS_NSS */
> +			bias-disable;
> +		};
> +	};
> +
> +	uart7_idle_pins_a: uart7-idle-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* UART7_TX */
> +				 <STM32_PINMUX('G', 7, ANALOG)>; /* UART7_CTS_NSS */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 12, AF7)>; /* UART7_RTS */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins3 {
> +			pinmux = <STM32_PINMUX('E', 10, AF7)>; /* UART7_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	uart7_sleep_pins_a: uart7-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* UART7_TX */
> +				 <STM32_PINMUX('B', 12, ANALOG)>, /* UART7_RTS */
> +				 <STM32_PINMUX('E', 10, ANALOG)>, /* UART7_RX */
> +				 <STM32_PINMUX('G', 7, ANALOG)>; /* UART7_CTS_NSS */
> +		};
> +	};
> +
>  	uart8_pins_a: uart8-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
