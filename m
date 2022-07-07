Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF50F569BC6
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:38:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72D3FC0D2BF;
	Thu,  7 Jul 2022 07:38:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 555E4C04005
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:38:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675B5X1029403;
 Thu, 7 Jul 2022 09:38:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vFTz0YNNnjtIfWoLA+Rh99xM5kvbAdb65nP01xvcI58=;
 b=q+qJDMNkoYphFOi80hVBQgA3PdKgX7sRn28qkEFD23ImEE5PRyNJ4QbQVcREMPe4vE/Z
 LnlJd7nIhS/YIAMvL5RFQgPcPH/Lj6VMNmZNcZI33qvkJl9e57MoS1Gv2V9HW2GUmB6x
 sWnNMii4hF6IMM3zd1QkitALry3xJWW4i/VoRbhwtW950NHHjJM2A1BmIIuSQsn18jzw
 N/RPNisodzrZr7srSHj2jYFzvcrDA9FtSGLuHAMb/s3dOdQcUbJMzN6YPLW6qVTqXksw
 BK+iKg2OPRia1gc4mdOgScHkOvtrXSS4K4vJAIqupenm47Or2VjYWuQ1MGnqfG4/uP8r 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ubfaysg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:38:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70D0B10002A;
 Thu,  7 Jul 2022 09:38:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A8BC211614;
 Thu,  7 Jul 2022 09:38:39 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:38:39 +0200
Message-ID: <9ce8ecf8-43b2-c6cd-8e1f-d09c88bb7c1e@foss.st.com>
Date: Thu, 7 Jul 2022 09:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
 <20220630101930.v2.4.Ib74d333801972878b95f6e10ed81a8160e1a121d@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630101930.v2.4.Ib74d333801972878b95f6e10ed81a8160e1a121d@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_05,2022-06-28_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2 04/10] ARM: dts: stm32mp13: alignment
	with v5.19
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

Hi Patrick

On 6/30/22 10:20, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v5.19-rc1 with:
> - ARM: dts: stm32: add UserPA13 button on stm32mp135f-dk
> - ARM: dts: stm32: add blue led (Linux heartbeat) on stm32mp135f-dk
> - ARM: dts: stm32: add EXTI interrupt-parent to pinctrl node on stm32mp131
> - ARM: dts: stm32: enable RTC support on stm32mp135f-dk
> - ARM: dts: stm32: add RTC node on stm32mp131
> - ARM: dts: stm32: fix pinctrl node name warnings (MPU soc)
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm/dts/stm32mp131.dtsi    | 19 ++++++++++++++++++-
>  arch/arm/dts/stm32mp135f-dk.dts | 29 +++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
> index 950e172e455..a30989f287e 100644
> --- a/arch/arm/dts/stm32mp131.dtsi
> +++ b/arch/arm/dts/stm32mp131.dtsi
> @@ -75,6 +75,12 @@
>  			compatible = "fixed-clock";
>  			clock-frequency = <99000000>;
>  		};
> +
> +		clk_rtc_k: clk-rtc-k {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32768>;
> +		};
>  	};
>  
>  	intc: interrupt-controller@a0021000 {
> @@ -218,6 +224,15 @@
>  			status = "disabled";
>  		};
>  
> +		rtc: rtc@5c004000 {
> +			compatible = "st,stm32mp1-rtc";
> +			reg = <0x5c004000 0x400>;
> +			interrupts-extended = <&exti 19 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_pclk4>, <&clk_rtc_k>;
> +			clock-names = "pclk", "rtc_ck";
> +			status = "disabled";
> +		};
> +
>  		bsec: efuse@5c005000 {
>  			compatible = "st,stm32mp13-bsec";
>  			reg = <0x5c005000 0x400>;
> @@ -239,11 +254,13 @@
>  		 * Break node order to solve dependency probe issue between
>  		 * pinctrl and exti.
>  		 */
> -		pinctrl: pin-controller@50002000 {
> +		pinctrl: pinctrl@50002000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "st,stm32mp135-pinctrl";
>  			ranges = <0 0x50002000 0x8400>;
> +			interrupt-parent = <&exti>;
> +			st,syscfg = <&exti 0x60 0xff>;
>  			pins-are-numbered;
>  
>  			gpioa: gpio@50002000 {
> diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
> index ee100d108ea..09d6226d598 100644
> --- a/arch/arm/dts/stm32mp135f-dk.dts
> +++ b/arch/arm/dts/stm32mp135f-dk.dts
> @@ -6,6 +6,9 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include "stm32mp135.dtsi"
>  #include "stm32mp13xf.dtsi"
>  #include "stm32mp13-pinctrl.dtsi"
> @@ -23,6 +26,28 @@
>  		reg = <0xc0000000 0x20000000>;
>  	};
>  
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		user-pa13 {
> +			label = "User-PA13";
> +			linux,code = <BTN_1>;
> +			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-blue {
> +			function = LED_FUNCTION_HEARTBEAT;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +			default-state = "off";
> +		};
> +	};
> +
>  	vdd_sd: vdd-sd {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vdd_sd";
> @@ -37,6 +62,10 @@
>  	status = "okay";
>  };
>  
> +&rtc {
> +	status = "okay";
> +};
> +
>  &sdmmc1 {
>  	pinctrl-names = "default", "opendrain", "sleep";
>  	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
