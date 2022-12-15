Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5064F64D77D
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Dec 2022 09:02:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 128FAC65E46;
	Thu, 15 Dec 2022 08:02:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CD79C6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Dec 2022 08:02:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BF6Qu3e004892; Thu, 15 Dec 2022 09:02:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7iGff440fGK4ocJm+t1TyEX7TvnL4LHsuNWP3BknnQ8=;
 b=C1nXe7qL31HLRPLrpVrdRL2HIMpwsbgRKeibn7+iww1JTRhVZsnMQ1+TN3+LOKp5wK9+
 A6IGB0e9dGJjeYJPp2ceIE0/8iuqs8K7QB7Z6FllNmUT7IaAXgTDVNcEIpraOk8wCg9L
 ZQIiSb3jOPjSptJGsUXV6EwxiZGNLTT68J1JZYag/wAs4s7M//kGP+iLGkSgQzaR3Az7
 PsAbldA01lUH6wqUldHJk+B2NQuPeLtenqRgraARwUrs0lYd+E/2mmsuy90HFyg18mcb
 x9e8V3bkd66tW3oTorkHzANaUzm2l3y5nMSuW77yzWY7S3uhvRnoH5axuseCb9k+aCI9 Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mf6ut8utn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 09:02:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1DFE100039;
 Thu, 15 Dec 2022 09:02:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC0132132F9;
 Thu, 15 Dec 2022 09:02:14 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 15 Dec
 2022 09:02:14 +0100
Message-ID: <0906dd6f-cde9-fe6e-871c-1de3783bef88@foss.st.com>
Date: Thu, 15 Dec 2022 09:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221214162434.1.Ib96329f23b27691d7a9c091a6a88be2658143ddc@changeid>
 <20221214162434.3.I55c811a8c5e305f772dac7f0337e23d37143c36a@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221214162434.3.I55c811a8c5e305f772dac7f0337e23d37143c36a@changeid>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_03,2022-12-14_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: Add timer interrupts
	on stm32mp15
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



On 12/14/22 16:25, Patrick Delaunay wrote:
> The timer units in the stm32mp15x CPUs have interrupts, depending on the
> timer flavour either one "global" or four dedicated ones. Add the irqs
> to the timer units on stm32mp15x.
> 
> Sync the DT Files with linux kernel v6.1 and with commit a9b70102253ce
> ("ARM: dts: stm32: Add timer interrupts on stm32mp15")
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp151.dtsi | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
> index f0fb022fc63e..27ea6a3d3d14 100644
> --- a/arch/arm/dts/stm32mp151.dtsi
> +++ b/arch/arm/dts/stm32mp151.dtsi
> @@ -145,6 +145,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40000000 0x400>;
> +			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM2_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 18 0x400 0x1>,
> @@ -178,6 +180,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40001000 0x400>;
> +			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM3_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 23 0x400 0x1>,
> @@ -212,6 +216,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40002000 0x400>;
> +			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM4_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 29 0x400 0x1>,
> @@ -244,6 +250,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40003000 0x400>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM5_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 55 0x400 0x1>,
> @@ -278,6 +286,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40004000 0x400>;
> +			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM6_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 69 0x400 0x1>;
> @@ -296,6 +306,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40005000 0x400>;
> +			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM7_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 70 0x400 0x1>;
> @@ -314,6 +326,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40006000 0x400>;
> +			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM12_K>;
>  			clock-names = "int";
>  			status = "disabled";
> @@ -336,6 +350,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40007000 0x400>;
> +			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM13_K>;
>  			clock-names = "int";
>  			status = "disabled";
> @@ -358,6 +374,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x40008000 0x400>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM14_K>;
>  			clock-names = "int";
>  			status = "disabled";
> @@ -641,6 +659,11 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x44000000 0x400>;
> +			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "brk", "up", "trg-com", "cc";
>  			clocks = <&rcc TIM1_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 11 0x400 0x1>,
> @@ -677,6 +700,11 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x44001000 0x400>;
> +			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "brk", "up", "trg-com", "cc";
>  			clocks = <&rcc TIM8_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 47 0x400 0x1>,
> @@ -764,6 +792,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x44006000 0x400>;
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM15_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 105 0x400 0x1>,
> @@ -791,6 +821,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x44007000 0x400>;
> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM16_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 109 0x400 0x1>,
> @@ -815,6 +847,8 @@
>  			#size-cells = <0>;
>  			compatible = "st,stm32-timers";
>  			reg = <0x44008000 0x400>;
> +			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global";
>  			clocks = <&rcc TIM17_K>;
>  			clock-names = "int";
>  			dmas = <&dmamux1 111 0x400 0x1>,
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
