Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 237D9109AB3
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 10:07:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D06EFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:07:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97BA5C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 09:07:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ91HH9022777; Tue, 26 Nov 2019 10:07:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IvYl+PBxePnpBR6jmb95/Y4bol7W5UkJn2WWg6T9eDo=;
 b=ULLwTSBti6IJGGuP9Kcf5C7Ai7zbH57gtKbFK6ysspmpAQp2Zex+QkluiKCAA/mFbSCO
 OfsZtIxNQFL8tbRxRcNCKu0RfCHpwWQAH4LOBvIcqsJ3ZJINtklGqRCY11xVTaB0yi+D
 m9y19Cca/q057YiMHH7ayj+PdVZHKbAiT7Q13xv0QjAkmdsS6wDIQ0OVW0OQUP41BzSA
 z6UmsLNP95+qFE2yfKr23BxSvhG/snf+ibDfhjv2xFCA1pvqY7tHvcy7QYYkjNS0Zxu/
 lFiDdfzyRDFpGgRqITGSkIkF20xZl9uAcMuR6wwoulnHtlDJh9UzluDx66HxzViW1sya 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9pb03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 10:07:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AA5B100034;
 Tue, 26 Nov 2019 10:07:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CE872A96F5;
 Tue, 26 Nov 2019 10:07:00 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Nov
 2019 10:06:59 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 26 Nov 2019 10:06:59 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/3] ARM: dts: stm32: DT alignment with kernel v5.4-rc4
Thread-Index: AQHVlLU1bj/5+pWWvEm1LrvDT/c/eaedN4mA
Date: Tue, 26 Nov 2019 09:06:59 +0000
Message-ID: <180c5fc3-0941-7e50-9b17-9453df29cc75@st.com>
References: <20191106151634.7834-1-patrick.delaunay@st.com>
 <20191106151634.7834-3-patrick.delaunay@st.com>
In-Reply-To: <20191106151634.7834-3-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <EC827BF5CFEFDF4D82A41C0E3B98C8D2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-26,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] ARM: dts: stm32: DT alignment with
	kernel v5.4-rc4
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

On 11/6/19 4:16 PM, Patrick Delaunay wrote:
> Device tree and binding alignment with kernel v5.4-rc4
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/st-pincfg.h              |   1 +
>  arch/arm/dts/stm32429i-eval.dts       |  25 ++---
>  arch/arm/dts/stm32f429.dtsi           |  12 +++
>  arch/arm/dts/stm32f746.dtsi           |  12 +++
>  arch/arm/dts/stm32h743i-eval.dts      |   1 +
>  arch/arm/dts/stm32mp157-pinctrl.dtsi  |   2 +-
>  arch/arm/dts/stm32mp157a-dk1.dts      | 129 ++++++++++++++++++++++++++
>  arch/arm/dts/stm32mp157c-ed1.dts      |  40 ++++++++
>  arch/arm/dts/stm32mp157c-ev1.dts      |   3 +-
>  arch/arm/dts/stm32mp157c.dtsi         |  26 ++++++
>  include/dt-bindings/mfd/stm32f7-rcc.h |   1 +
>  include/dt-bindings/mfd/stm32h7-rcc.h |   2 +-
>  12 files changed, 239 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/dts/st-pincfg.h b/arch/arm/dts/st-pincfg.h
> index 4851c387d5..d805512022 100644
> --- a/arch/arm/dts/st-pincfg.h
> +++ b/arch/arm/dts/st-pincfg.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _ST_PINCFG_H_
>  #define _ST_PINCFG_H_
>  
> diff --git a/arch/arm/dts/stm32429i-eval.dts b/arch/arm/dts/stm32429i-eval.dts
> index bd41ae3c14..c5afa0c162 100644
> --- a/arch/arm/dts/stm32429i-eval.dts
> +++ b/arch/arm/dts/stm32429i-eval.dts
> @@ -40,18 +40,18 @@
>  		dma-ranges = <0xc0000000 0x0 0x10000000>;
>  	};
>  
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> +	vdda: regulator-vdda {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdda";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
>  
> -		reg_vref: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "vref";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -		};
> +	vref: regulator-vref {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vref";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
>  	};
>  
>  	leds {
> @@ -116,7 +116,8 @@
>  &adc {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&adc3_in8_pin>;
> -	vref-supply = <&reg_vref>;
> +	vdda-supply = <&vdda>;
> +	vref-supply = <&vref>;
>  	status = "okay";
>  	adc3: adc@200 {
>  		st,adc-channels = <8>;
> diff --git a/arch/arm/dts/stm32f429.dtsi b/arch/arm/dts/stm32f429.dtsi
> index ec84ae4f52..db0b82e89e 100644
> --- a/arch/arm/dts/stm32f429.dtsi
> +++ b/arch/arm/dts/stm32f429.dtsi
> @@ -71,6 +71,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -100,6 +101,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -129,6 +131,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -157,6 +160,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -226,6 +230,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -247,6 +252,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  		};
> @@ -262,6 +268,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  		};
> @@ -407,6 +414,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -428,6 +436,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -561,6 +570,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -582,6 +592,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  		};
> @@ -597,6 +608,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  		};
> diff --git a/arch/arm/dts/stm32f746.dtsi b/arch/arm/dts/stm32f746.dtsi
> index 66360cf21c..3f312ab3a7 100644
> --- a/arch/arm/dts/stm32f746.dtsi
> +++ b/arch/arm/dts/stm32f746.dtsi
> @@ -58,6 +58,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -87,6 +88,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -116,6 +118,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -144,6 +147,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -213,6 +217,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -234,6 +239,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  		};
> @@ -249,6 +255,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  		};
> @@ -383,6 +390,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -404,6 +412,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -476,6 +485,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -497,6 +507,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  		};
> @@ -512,6 +523,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  		};
> diff --git a/arch/arm/dts/stm32h743i-eval.dts b/arch/arm/dts/stm32h743i-eval.dts
> index ab78ad5323..e4d3c58f3d 100644
> --- a/arch/arm/dts/stm32h743i-eval.dts
> +++ b/arch/arm/dts/stm32h743i-eval.dts
> @@ -87,6 +87,7 @@
>  };
>  
>  &adc_12 {
> +	vdda-supply = <&vdda>;
>  	vref-supply = <&vdda>;
>  	status = "okay";
>  	adc1: adc@0 {
> diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> index 4367e8dcf7..2d73d502d9 100644
> --- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> @@ -565,7 +565,7 @@
>  				};
>  			};
>  
> -			m_can1_sleep_pins_a: m_can1-sleep@0 {
> +			m_can1_sleep_pins_a: m_can1-sleep-0 {
>  				pins {
>  					pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
>  						 <STM32_PINMUX('I', 9, ANALOG)>; /* CAN1_RX */
> diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
> index c210acc0aa..4652253012 100644
> --- a/arch/arm/dts/stm32mp157a-dk1.dts
> +++ b/arch/arm/dts/stm32mp157a-dk1.dts
> @@ -33,6 +33,42 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> +		mcuram2: mcuram2@10000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10000000 0x40000>;
> +			no-map;
> +		};
> +
> +		vdev0vring0: vdev0vring0@10040000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10040000 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@10041000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10041000 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@10042000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10042000 0x4000>;
> +			no-map;
> +		};
> +
> +		mcuram: mcuram@30000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x30000000 0x40000>;
> +			no-map;
> +		};
> +
> +		retram: retram@38000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x38000000 0x10000>;
> +			no-map;
> +		};
> +
>  		gpu_reserved: gpu@d4000000 {
>  			reg = <0xd4000000 0x4000000>;
>  			no-map;
> @@ -48,6 +84,17 @@
>  			default-state = "off";
>  		};
>  	};
> +
> +	sound {
> +		compatible = "audio-graph-card";
> +		label = "STM32MP1-DK";
> +		routing =
> +			"Playback" , "MCLK",
> +			"Capture" , "MCLK",
> +			"MICL" , "Mic Bias";
> +		dais = <&sai2a_port &sai2b_port>;
> +		status = "okay";
> +	};
>  };
>  
>  &cec {
> @@ -116,6 +163,39 @@
>  			};
>  		};
>  	};
> +
> +	cs42l51: cs42l51@4a {
> +		compatible = "cirrus,cs42l51";
> +		reg = <0x4a>;
> +		#sound-dai-cells = <0>;
> +		VL-supply = <&v3v3>;
> +		VD-supply = <&v1v8_audio>;
> +		VA-supply = <&v1v8_audio>;
> +		VAHP-supply = <&v1v8_audio>;
> +		reset-gpios = <&gpiog 9 GPIO_ACTIVE_LOW>;
> +		clocks = <&sai2a>;
> +		clock-names = "MCLK";
> +		status = "okay";
> +
> +		cs42l51_port: port {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			cs42l51_tx_endpoint: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&sai2a_endpoint>;
> +				frame-master;
> +				bitclock-master;
> +			};
> +
> +			cs42l51_rx_endpoint: endpoint@1 {
> +				reg = <1>;
> +				remote-endpoint = <&sai2b_endpoint>;
> +				frame-master;
> +				bitclock-master;
> +			};
> +		};
> +	};
>  };
>  
>  &i2c4 {
> @@ -308,8 +388,12 @@
>  };
>  
>  &m4_rproc {
> +	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
> +			<&vdev0vring1>, <&vdev0buffer>;
>  	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>  	mbox-names = "vq0", "vq1", "shutdown";
> +	interrupt-parent = <&exti>;
> +	interrupts = <68 1>;
>  	status = "okay";
>  };
>  
> @@ -328,6 +412,51 @@
>  	status = "okay";
>  };
>  
> +&sai2 {
> +	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
> +	clock-names = "pclk", "x8k", "x11k";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sai2a_pins_a>, <&sai2b_pins_b>;
> +	pinctrl-1 = <&sai2a_sleep_pins_a>, <&sai2b_sleep_pins_b>;
> +	status = "okay";
> +
> +	sai2a: audio-controller@4400b004 {
> +		#clock-cells = <0>;
> +		dma-names = "tx";
> +		clocks = <&rcc SAI2_K>;
> +		clock-names = "sai_ck";
> +		status = "okay";
> +
> +		sai2a_port: port {
> +			sai2a_endpoint: endpoint {
> +				remote-endpoint = <&cs42l51_tx_endpoint>;
> +				format = "i2s";
> +				mclk-fs = <256>;
> +				dai-tdm-slot-num = <2>;
> +				dai-tdm-slot-width = <32>;
> +			};
> +		};
> +	};
> +
> +	sai2b: audio-controller@4400b024 {
> +		dma-names = "rx";
> +		st,sync = <&sai2a 2>;
> +		clocks = <&rcc SAI2_K>, <&sai2a>;
> +		clock-names = "sai_ck", "MCLK";
> +		status = "okay";
> +
> +		sai2b_port: port {
> +			sai2b_endpoint: endpoint {
> +				remote-endpoint = <&cs42l51_rx_endpoint>;
> +				format = "i2s";
> +				mclk-fs = <256>;
> +				dai-tdm-slot-num = <2>;
> +				dai-tdm-slot-width = <32>;
> +			};
> +		};
> +	};
> +};
> +
>  &sdmmc1 {
>  	pinctrl-names = "default", "opendrain", "sleep";
>  	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
> index 66deca1bc9..73d07cf42f 100644
> --- a/arch/arm/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
> @@ -28,6 +28,42 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> +		mcuram2: mcuram2@10000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10000000 0x40000>;
> +			no-map;
> +		};
> +
> +		vdev0vring0: vdev0vring0@10040000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10040000 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@10041000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10041000 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@10042000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10042000 0x4000>;
> +			no-map;
> +		};
> +
> +		mcuram: mcuram@30000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x30000000 0x40000>;
> +			no-map;
> +		};
> +
> +		retram: retram@38000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x38000000 0x10000>;
> +			no-map;
> +		};
> +
>  		gpu_reserved: gpu@e8000000 {
>  			reg = <0xe8000000 0x8000000>;
>  			no-map;
> @@ -218,8 +254,12 @@
>  };
>  
>  &m4_rproc {
> +	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
> +			<&vdev0vring1>, <&vdev0buffer>;
>  	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>  	mbox-names = "vq0", "vq1", "shutdown";
> +	interrupt-parent = <&exti>;
> +	interrupts = <68 1>;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
> index 23de232831..89d29b50c3 100644
> --- a/arch/arm/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
> @@ -101,6 +101,7 @@
>  &dsi {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> +	phy-dsi-supply = <&reg18>;
>  	status = "okay";
>  
>  	ports {
> @@ -165,7 +166,7 @@
>  	#address-cells = <1>;
>  	#size-cells = <0>;
>  
> -	nand: nand@0 {
> +	nand@0 {
>  		reg = <0>;
>  		nand-on-flash-bbt;
>  		#address-cells = <1>;
> diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
> index a6045dd682..6c670cf9a3 100644
> --- a/arch/arm/dts/stm32mp157c.dtsi
> +++ b/arch/arm/dts/stm32mp157c.dtsi
> @@ -109,6 +109,12 @@
>  		};
>  	};
>  
> +	booster: regulator-booster {
> +		compatible = "st,stm32mp1-booster";
> +		st,syscfg = <&syscfg>;
> +		status = "disabled";
> +	};
> +
>  	reboot {
>  		compatible = "syscon-reboot";
>  		regmap = <&rcc>;
> @@ -140,6 +146,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -168,6 +175,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -194,6 +202,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -222,6 +231,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -279,6 +289,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -300,6 +311,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -321,6 +333,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -574,6 +587,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -604,6 +618,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -677,6 +692,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -701,6 +717,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  			timer@15 {
> @@ -724,6 +741,7 @@
>  
>  			pwm {
>  				compatible = "st,stm32-pwm";
> +				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
>  
> @@ -990,6 +1008,7 @@
>  			clocks = <&rcc ADC12>, <&rcc ADC12_K>;
>  			clock-names = "bus", "adc";
>  			interrupt-controller;
> +			st,syscfg = <&syscfg>;
>  			#interrupt-cells = <1>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> @@ -1313,6 +1332,10 @@
>  			      <0x89010000 0x1000>,
>  			      <0x89020000 0x1000>;
>  			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
> +			       <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
> +			       <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
> +			dma-names = "tx", "rx", "ecc";
>  			clocks = <&rcc FMC_K>;
>  			resets = <&rcc FMC_R>;
>  			status = "disabled";
> @@ -1323,6 +1346,9 @@
>  			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
>  			reg-names = "qspi", "qspi_mm";
>  			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&mdma1 22 0x10 0x100002 0x0 0x0>,
> +			       <&mdma1 22 0x10 0x100008 0x0 0x0>;
> +			dma-names = "tx", "rx";
>  			clocks = <&rcc QSPI_K>;
>  			resets = <&rcc QSPI_R>;
>  			status = "disabled";
> diff --git a/include/dt-bindings/mfd/stm32f7-rcc.h b/include/dt-bindings/mfd/stm32f7-rcc.h
> index c9087f5f3d..ba5cb7456e 100644
> --- a/include/dt-bindings/mfd/stm32f7-rcc.h
> +++ b/include/dt-bindings/mfd/stm32f7-rcc.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * This header provides constants for the STM32F7 RCC IP
>   */
> diff --git a/include/dt-bindings/mfd/stm32h7-rcc.h b/include/dt-bindings/mfd/stm32h7-rcc.h
> index b96b3c3ac1..06e8476bf0 100644
> --- a/include/dt-bindings/mfd/stm32h7-rcc.h
> +++ b/include/dt-bindings/mfd/stm32h7-rcc.h
> @@ -12,6 +12,7 @@
>  #define STM32H7_RCC_AHB3_FMC		12
>  #define STM32H7_RCC_AHB3_QUADSPI	14
>  #define STM32H7_RCC_AHB3_SDMMC1		16
> +#define STM32H7_RCC_AHB3_CPU		31
>  #define STM32H7_RCC_AHB3_CPU1		31
>  
>  #define STM32H7_AHB3_RESET(bit) (STM32H7_RCC_AHB3_##bit + (0x7C * 8))
> @@ -56,7 +57,6 @@
>  
>  #define STM32H7_AHB4_RESET(bit) (STM32H7_RCC_AHB4_##bit + (0x88 * 8))
>  
> -
>  /* APB3 */
>  #define STM32H7_RCC_APB3_LTDC		3
>  #define STM32H7_RCC_APB3_DSI		4


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
