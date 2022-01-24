Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F34497EE6
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Jan 2022 13:15:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FDC4C5F1D3;
	Mon, 24 Jan 2022 12:15:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E8FBC57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 12:15:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20O8b4DR017026;
 Mon, 24 Jan 2022 13:15:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MUl1nBH4bsCPK6zg9GH3iEw9n0sMt4HHYCX5wujs0q4=;
 b=Muv+/wmNOwwpNVKK8RCKON9+tiB3a4C+WFw9ffMNgsF5+nrnpLkpaoyeSLIIKN/Xo/4u
 0AS/GAq9uST8GbbJl2J2U3rfgeej1ZaIsVydgFAVlXRPgocSzKrPPZcSQlqo882XYclB
 vQPmxxW/rti+jFPrS5OJjS4mcQPZtfcqZx95hri62cVuw4mOIiJDznFfrGsnu3/iO1Vz
 mrSbgWI50QeGk6W2au16rdZq2lZgr+qIov2buoSUA7KeS0T4QnJJH1oJl6qssDNGKbpb
 dCtwFxnAqrWQ1mUbaSEVcj0sfEnmM7UrqCfmNzbiLZUUTWzIhDvtJE3f0Bg1geJf1S9e eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dsrru141w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 13:15:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A390B10002A;
 Mon, 24 Jan 2022 13:15:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9323C214D20;
 Mon, 24 Jan 2022 13:15:12 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 24 Jan
 2022 13:15:12 +0100
Message-ID: <4208a296-8f50-3c4b-bd61-45be2d218a86@foss.st.com>
Date: Mon, 24 Jan 2022 13:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211217163006.1.Ie868aca1e057629eb212dcc3c8f463c00d01ccb7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20211217163006.1.Ie868aca1e057629eb212dcc3c8f463c00d01ccb7@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_06,2022-01-24_01,2021-12-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with v5.16
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

On 12/17/21 16:30, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v5.16-rc5
> - ARM: dts: stm32: set otg-rev on stm32mp151
> - ARM: dts: stm32: use usbphyc ck_usbo_48m as USBH OHCI clock on stm32mp151
> - ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15
> - ARM: dts: stm32: fix SAI sub nodes register range
> - ARM: dts: stm32: fix STUSB1600 Type-C irq level on stm32mp15xx-dkx
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-pinctrl.dtsi |  8 ++++----
>  arch/arm/dts/stm32mp151.dtsi        | 19 ++++++++++---------
>  arch/arm/dts/stm32mp15xx-dkx.dtsi   |  2 +-
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> index 5b60ecbd71..d3553e0f01 100644
> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> @@ -1179,7 +1179,7 @@
>  		};
>  	};
>  
> -	sai2a_pins_c: sai2a-4 {
> +	sai2a_pins_c: sai2a-2 {
>  		pins {
>  			pinmux = <STM32_PINMUX('D', 13, AF10)>, /* SAI2_SCK_A */
>  				 <STM32_PINMUX('D', 11, AF10)>, /* SAI2_SD_A */
> @@ -1190,7 +1190,7 @@
>  		};
>  	};
>  
> -	sai2a_sleep_pins_c: sai2a-5 {
> +	sai2a_sleep_pins_c: sai2a-sleep-2 {
>  		pins {
>  			pinmux = <STM32_PINMUX('D', 13, ANALOG)>, /* SAI2_SCK_A */
>  				 <STM32_PINMUX('D', 11, ANALOG)>, /* SAI2_SD_A */
> @@ -1235,14 +1235,14 @@
>  		};
>  	};
>  
> -	sai2b_pins_c: sai2a-4 {
> +	sai2b_pins_c: sai2b-2 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
>  			bias-disable;
>  		};
>  	};
>  
> -	sai2b_sleep_pins_c: sai2a-sleep-5 {
> +	sai2b_sleep_pins_c: sai2b-sleep-2 {
>  		pins {
>  			pinmux = <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
>  		};
> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
> index 8e0a0bc1dd..5a2be00758 100644
> --- a/arch/arm/dts/stm32mp151.dtsi
> +++ b/arch/arm/dts/stm32mp151.dtsi
> @@ -842,7 +842,7 @@
>  				#sound-dai-cells = <0>;
>  
>  				compatible = "st,stm32-sai-sub-a";
> -				reg = <0x4 0x1c>;
> +				reg = <0x4 0x20>;
>  				clocks = <&rcc SAI1_K>;
>  				clock-names = "sai_ck";
>  				dmas = <&dmamux1 87 0x400 0x01>;
> @@ -852,7 +852,7 @@
>  			sai1b: audio-controller@4400a024 {
>  				#sound-dai-cells = <0>;
>  				compatible = "st,stm32-sai-sub-b";
> -				reg = <0x24 0x1c>;
> +				reg = <0x24 0x20>;
>  				clocks = <&rcc SAI1_K>;
>  				clock-names = "sai_ck";
>  				dmas = <&dmamux1 88 0x400 0x01>;
> @@ -873,7 +873,7 @@
>  			sai2a: audio-controller@4400b004 {
>  				#sound-dai-cells = <0>;
>  				compatible = "st,stm32-sai-sub-a";
> -				reg = <0x4 0x1c>;
> +				reg = <0x4 0x20>;
>  				clocks = <&rcc SAI2_K>;
>  				clock-names = "sai_ck";
>  				dmas = <&dmamux1 89 0x400 0x01>;
> @@ -883,7 +883,7 @@
>  			sai2b: audio-controller@4400b024 {
>  				#sound-dai-cells = <0>;
>  				compatible = "st,stm32-sai-sub-b";
> -				reg = <0x24 0x1c>;
> +				reg = <0x24 0x20>;
>  				clocks = <&rcc SAI2_K>;
>  				clock-names = "sai_ck";
>  				dmas = <&dmamux1 90 0x400 0x01>;
> @@ -904,7 +904,7 @@
>  			sai3a: audio-controller@4400c004 {
>  				#sound-dai-cells = <0>;
>  				compatible = "st,stm32-sai-sub-a";
> -				reg = <0x04 0x1c>;
> +				reg = <0x04 0x20>;
>  				clocks = <&rcc SAI3_K>;
>  				clock-names = "sai_ck";
>  				dmas = <&dmamux1 113 0x400 0x01>;
> @@ -914,7 +914,7 @@
>  			sai3b: audio-controller@4400c024 {
>  				#sound-dai-cells = <0>;
>  				compatible = "st,stm32-sai-sub-b";
> -				reg = <0x24 0x1c>;
> +				reg = <0x24 0x20>;
>  				clocks = <&rcc SAI3_K>;
>  				clock-names = "sai_ck";
>  				dmas = <&dmamux1 114 0x400 0x01>;
> @@ -1103,6 +1103,7 @@
>  			g-np-tx-fifo-size = <32>;
>  			g-tx-fifo-size = <256 16 16 16 16 16 16 16>;
>  			dr_mode = "otg";
> +			otg-rev = <0x200>;
>  			usb33d-supply = <&usb33>;
>  			status = "disabled";
>  		};
> @@ -1301,7 +1302,7 @@
>  			sai4a: audio-controller@50027004 {
>  				#sound-dai-cells = <0>;
>  				compatible = "st,stm32-sai-sub-a";
> -				reg = <0x04 0x1c>;
> +				reg = <0x04 0x20>;
>  				clocks = <&rcc SAI4_K>;
>  				clock-names = "sai_ck";
>  				dmas = <&dmamux1 99 0x400 0x01>;
> @@ -1311,7 +1312,7 @@
>  			sai4b: audio-controller@50027024 {
>  				#sound-dai-cells = <0>;
>  				compatible = "st,stm32-sai-sub-b";
> -				reg = <0x24 0x1c>;
> +				reg = <0x24 0x20>;
>  				clocks = <&rcc SAI4_K>;
>  				clock-names = "sai_ck";
>  				dmas = <&dmamux1 100 0x400 0x01>;
> @@ -1482,7 +1483,7 @@
>  		usbh_ohci: usb@5800c000 {
>  			compatible = "generic-ohci";
>  			reg = <0x5800c000 0x1000>;
> -			clocks = <&rcc USBH>;
> +			clocks = <&rcc USBH>, <&usbphyc>;
>  			resets = <&rcc USBH_R>;
>  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> index 8fc93b0f94..5502eec94b 100644
> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> @@ -257,7 +257,7 @@
>  	stusb1600@28 {
>  		compatible = "st,stusb1600";
>  		reg = <0x28>;
> -		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-parent = <&gpioi>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&stusb1600_pins_a>;
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
