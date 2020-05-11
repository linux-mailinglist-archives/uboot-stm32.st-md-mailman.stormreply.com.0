Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AC61CDC70
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 16:02:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AFCBC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 14:02:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53981C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 14:02:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDS8mm025189; Mon, 11 May 2020 16:01:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=wX/5z9OFC9eb5t/NoC4tfsUTqqAxaTIVKWTBl/CVeXY=;
 b=gc4MjK8TJ9WWTOkUeLUiC0tlyaXz04E0DFCyXrjR/d1B75dkTZyJjBprRrKjdsANPGYI
 RgGGZGRW6EykkOLrBI4QkhcpWrLjnOHn07eoD31wZQb35fkFp+Xtc/ZG4kwpohKP6css
 e5Un+6r49OX1GrF50SUMo4JK+IkxigVY0hTAxm4l6eglLToj+uqASA/WU4H7qVdxorWF
 o9kxxp+hZ4IUMg9D/dsYZ5bcyR+n0O5V151bajysxz8UJbxZic130P96RY2HKLPmZxQ+
 W62vxGwmeRN+VMLOm/8c+IgQPQPg1pu4JBkSRHnaTqutEsec7tu0VePoHVPd69k/sxPX mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30whn9atrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 16:01:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E243810002A;
 Mon, 11 May 2020 16:01:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 98A082A654A;
 Mon, 11 May 2020 16:01:38 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 16:01:38 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 16:01:38 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] ARM: dts: stm32mp1: DT alignment with
 Linux 5.7-rc2
Thread-Index: AQHWJ5ywRKEm6X+rsU6l5qJHIOH1MA==
Date: Mon, 11 May 2020 14:01:38 +0000
Message-ID: <6a244f0b-daaf-017d-1132-2b694cf09994@st.com>
References: <20200430155234.1.If8f63efaa47eb0830ce241e3a62b2aa420e0883a@changeid>
In-Reply-To: <20200430155234.1.If8f63efaa47eb0830ce241e3a62b2aa420e0883a@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <ADC34BD64A982446801E905FB56B4209@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp1: DT alignment with
 Linux 5.7-rc2
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

On 4/30/20 3:52 PM, Patrick Delaunay wrote:
> DT alignment with Linux 5.7-rc2, including the kernel commits
>
> 431c89e6f323 ARM: dts: stm32: use correct vqmmc regu for eMMC on stm32mp1 ED1/EV1 boards
> 79e965053872 ARM: dts: stm32: add disable-wp property for SD-card on STM32MP1 boards
> 877db62ea516 ARM: dts: stm32: add cd-gpios properties for SD-cards on STM32MP1 boards
> 7519e95ba5f8 ARM: dts: stm32: Do clean up in stmpic nodes on stm32mp15 boards
> f68e2dbc591a ARM: dts: stm32: Rename stmfx joystick pins on stm32mp157c-ev1
> d6210da4f8bf ARM: dts: stm32: add cpu clock-frequency property on stm32mp15x
> b65b6fc56925 ARM: dts: stm32: add wakeup-source in all I2C nodes of stm32mp157c
> 1c1cf5996cfb ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp157c-ed1
> bef15fc0fad9 ARM: dts: stm32: add i2c2/i2c5 sleep pinctrl on stm32mp157c-ev1
> b7fc0a87b9ac ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp15xx-dkx
> a5e557655285 ARM: dts: stm32: set i2c4 bus freq to 400KHz on stm32mp15 DK boards
> 8bc631b650a6 ARM: dts: stm32: set i2c4 bus freq to 400KHz on stm32mp157c-ed1
> fccd6a577bb3 ARM: dts: stm32: Correct stmfx node name on stm32mp157c-ev1 board
> cc775a83db65 ARM: dts: stm32: add resets property on all DMA nodes on stm32mp151
> c5fae093511b ARM: dts: stm32: enable USB OTG Dual Role on stm32mp157c-ev1
> 9879e2165758 ARM: dts: stm32: add USB OTG pinctrl to stm32mp15
> 82ac8a81f985 ARM: dts: stm32: add USB OTG full support on stm32mp151
> 8714b26e2863 ARM: dts: stm32: remove useless properties in stm32mp157a-avenger96 stmpic node
> a7959919709e ARM: dts: stm32: Add UART8 pins A pinmux entry on stm32mp1
> 4d7c53a684da ARM: dts: stm32: Add USART3 pins A pinmux entry on stm32mp1
> 80ab128332ee ARM: dts: stm32: Add SAI2A pins B pinmux entry on stm32mp1
> ab7f98c0c546 ARM: dts: stm32: Add Ethernet0 RMII pins A pinmux entry on stm32mp1
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> Hi,
>
> Dependency with correction of GPIO support in SPL:
>
> [v2,09/12] gpio: stm32: support gpio ops in SPL
> http://patchwork.ozlabs.org/project/uboot/patch/20200422142834.v2.9.I355ddbc804eba6047ea147d830be57a5b9c4a87e@changeid/
>
> Patrick
>
>
>  arch/arm/dts/stm32mp15-pinctrl.dtsi | 92 +++++++++++++++++++++++++++++
>  arch/arm/dts/stm32mp151.dtsi        | 13 +++-
>  arch/arm/dts/stm32mp153.dtsi        |  1 +
>  arch/arm/dts/stm32mp157c-ed1.dts    | 12 ++--
>  arch/arm/dts/stm32mp157c-ev1.dts    | 13 ++--
>  arch/arm/dts/stm32mp15xx-dhcom.dtsi |  3 +-
>  arch/arm/dts/stm32mp15xx-dhcor.dtsi |  8 ---
>  arch/arm/dts/stm32mp15xx-dkx.dtsi   | 10 ++--
>  8 files changed, 126 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> index 29acdc4afd..8d00391978 100644
> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> @@ -213,6 +213,40 @@
>  		};
>  	};
>  
> +	ethernet0_rmii_pins_a: rmii-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH1_RMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, AF11)>, /* ETH1_RMII_TXD1 */
> +				 <STM32_PINMUX('B', 11, AF11)>, /* ETH1_RMII_TX_EN */
> +				 <STM32_PINMUX('A', 1, AF0)>,   /* ETH1_RMII_REF_CLK */
> +				 <STM32_PINMUX('A', 2, AF11)>,  /* ETH1_MDIO */
> +				 <STM32_PINMUX('C', 1, AF11)>;  /* ETH1_MDC */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('C', 4, AF11)>,  /* ETH1_RMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, AF11)>,  /* ETH1_RMII_RXD1 */
> +				 <STM32_PINMUX('A', 7, AF11)>;  /* ETH1_RMII_CRS_DV */
> +			bias-disable;
> +		};
> +	};
> +
> +	ethernet0_rmii_pins_sleep_a: rmii-sleep-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH1_RMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH1_RMII_TXD1 */
> +				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH1_RMII_TX_EN */
> +				 <STM32_PINMUX('A', 2, ANALOG)>,  /* ETH1_MDIO */
> +				 <STM32_PINMUX('C', 1, ANALOG)>,  /* ETH1_MDC */
> +				 <STM32_PINMUX('C', 4, ANALOG)>,  /* ETH1_RMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, ANALOG)>,  /* ETH1_RMII_RXD1 */
> +				 <STM32_PINMUX('A', 1, ANALOG)>,  /* ETH1_RMII_REF_CLK */
> +				 <STM32_PINMUX('A', 7, ANALOG)>;  /* ETH1_RMII_CRS_DV */
> +		};
> +	};
> +
>  	fmc_pins_a: fmc-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
> @@ -736,6 +770,25 @@
>  		};
>  	};
>  
> +	sai2a_pins_b: sai2a-2 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('I', 6, AF10)>,	/* SAI2_SD_A */
> +				 <STM32_PINMUX('I', 7, AF10)>,	/* SAI2_FS_A */
> +				 <STM32_PINMUX('D', 13, AF10)>;	/* SAI2_SCK_A */
> +			slew-rate = <0>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +
> +	sai2a_sleep_pins_b: sai2a-sleep-3 {
> +		pins {
> +			pinmux = <STM32_PINMUX('I', 6, ANALOG)>,  /* SAI2_SD_A */
> +				 <STM32_PINMUX('I', 7, ANALOG)>,  /* SAI2_FS_A */
> +				 <STM32_PINMUX('D', 13, ANALOG)>; /* SAI2_SCK_A */
> +		};
> +	};
> +
>  	sai2b_pins_a: sai2b-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('E', 12, AF10)>, /* SAI2_SCK_B */
> @@ -1118,6 +1171,19 @@
>  		};
>  	};
>  
> +	usart3_pins_a: usart3-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
> +			bias-disable;
> +		};
> +	};
> +
>  	uart4_pins_a: uart4-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
> @@ -1158,6 +1224,32 @@
>  			bias-disable;
>  		};
>  	};
> +
> +	uart8_pins_a: uart8-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* UART8_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	usbotg_hs_pins_a: usbotg-hs-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
> +		};
> +	};
> +
> +	usbotg_fs_dp_dm_pins_a: usbotg-fs-dp-dm-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('A', 11, ANALOG)>, /* OTG_FS_DM */
> +				 <STM32_PINMUX('A', 12, ANALOG)>; /* OTG_FS_DP */
> +		};
> +	};
>  };
>  
>  &pinctrl_z {
> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
> index f185639a46..75d2c0d296 100644
> --- a/arch/arm/dts/stm32mp151.dtsi
> +++ b/arch/arm/dts/stm32mp151.dtsi
> @@ -17,6 +17,7 @@
>  
>  		cpu0: cpu@0 {
>  			compatible = "arm,cortex-a7";
> +			clock-frequency = <650000000>;
>  			device_type = "cpu";
>  			reg = <0>;
>  		};
> @@ -490,6 +491,7 @@
>  			resets = <&rcc I2C1_R>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -503,6 +505,7 @@
>  			resets = <&rcc I2C2_R>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -516,6 +519,7 @@
>  			resets = <&rcc I2C3_R>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -529,6 +533,7 @@
>  			resets = <&rcc I2C5_R>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -966,6 +971,7 @@
>  				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc DMA1>;
> +			resets = <&rcc DMA1_R>;
>  			#dma-cells = <4>;
>  			st,mem2mem;
>  			dma-requests = <8>;
> @@ -983,6 +989,7 @@
>  				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc DMA2>;
> +			resets = <&rcc DMA2_R>;
>  			#dma-cells = <4>;
>  			st,mem2mem;
>  			dma-requests = <8>;
> @@ -996,6 +1003,7 @@
>  			dma-masters = <&dma1 &dma2>;
>  			dma-channels = <16>;
>  			clocks = <&rcc DMAMUX>;
> +			resets = <&rcc DMAMUX_R>;
>  		};
>  
>  		adc: adc@48003000 {
> @@ -1051,7 +1059,7 @@
>  		};
>  
>  		usbotg_hs: usb-otg@49000000 {
> -			compatible = "snps,dwc2";
> +			compatible = "st,stm32mp15-hsotg", "snps,dwc2";
>  			reg = <0x49000000 0x10000>;
>  			clocks = <&rcc USBO_K>;
>  			clock-names = "otg";
> @@ -1296,6 +1304,7 @@
>  			reg = <0x58000000 0x1000>;
>  			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rcc MDMA>;
> +			resets = <&rcc MDMA_R>;
>  			#dma-cells = <5>;
>  			dma-channels = <32>;
>  			dma-requests = <48>;
> @@ -1495,6 +1504,7 @@
>  			resets = <&rcc I2C4_R>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -1530,6 +1540,7 @@
>  			resets = <&rcc I2C6_R>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> diff --git a/arch/arm/dts/stm32mp153.dtsi b/arch/arm/dts/stm32mp153.dtsi
> index 2d759fc601..6d9ab08667 100644
> --- a/arch/arm/dts/stm32mp153.dtsi
> +++ b/arch/arm/dts/stm32mp153.dtsi
> @@ -10,6 +10,7 @@
>  	cpus {
>  		cpu1: cpu@1 {
>  			compatible = "arm,cortex-a7";
> +			clock-frequency = <650000000>;
>  			device_type = "cpu";
>  			reg = <1>;
>  		};
> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
> index 05d5326405..4fb71100f5 100644
> --- a/arch/arm/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
> @@ -135,10 +135,12 @@
>  };
>  
>  &i2c4 {
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&i2c4_pins_a>;
> +	pinctrl-1 = <&i2c4_pins_sleep_a>;
>  	i2c-scl-rising-time-ns = <185>;
>  	i2c-scl-falling-time-ns = <20>;
> +	clock-frequency = <400000>;
>  	status = "okay";
>  	/* spare dmas for other usage */
>  	/delete-property/dmas;
> @@ -223,8 +225,6 @@
>  
>  			vdd_usb: ldo4 {
>  				regulator-name = "vdd_usb";
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
>  				interrupts = <IT_CURLIM_LDO4 0>;
>  			};
>  
> @@ -246,7 +246,6 @@
>  			vref_ddr: vref_ddr {
>  				regulator-name = "vref_ddr";
>  				regulator-always-on;
> -				regulator-over-current-protection;
>  			};
>  
>  			bst_out: boost {
> @@ -318,7 +317,8 @@
>  	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
>  	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
>  	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
> -	broken-cd;
> +	cd-gpios = <&gpiog 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	disable-wp;
>  	st,sig-dir;
>  	st,neg-edge;
>  	st,use-ckin;
> @@ -339,7 +339,7 @@
>  	st,neg-edge;
>  	bus-width = <8>;
>  	vmmc-supply = <&v3v3>;
> -	vqmmc-supply = <&v3v3>;
> +	vqmmc-supply = <&vdd>;
>  	mmc-ddr-3_3v;
>  	status = "okay";
>  };
> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
> index 228e35e168..8a4c7ff31a 100644
> --- a/arch/arm/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
> @@ -174,8 +174,9 @@
>  };
>  
>  &i2c2 {
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&i2c2_pins_a>;
> +	pinctrl-1 = <&i2c2_pins_sleep_a>;
>  	i2c-scl-rising-time-ns = <185>;
>  	i2c-scl-falling-time-ns = <20>;
>  	status = "okay";
> @@ -210,7 +211,7 @@
>  		interrupt-parent = <&gpioi>;
>  		vdd-supply = <&v3v3>;
>  
> -		stmfx_pinctrl: stmfx-pin-controller {
> +		stmfx_pinctrl: pinctrl {
>  			compatible = "st,stmfx-0300-pinctrl";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> @@ -218,7 +219,7 @@
>  			#interrupt-cells = <2>;
>  			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
>  
> -			joystick_pins: joystick {
> +			joystick_pins: joystick-pins {
>  				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
>  				bias-pull-down;
>  			};
> @@ -227,8 +228,9 @@
>  };
>  
>  &i2c5 {
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&i2c5_pins_a>;
> +	pinctrl-1 = <&i2c5_pins_sleep_a>;
>  	i2c-scl-rising-time-ns = <185>;
>  	i2c-scl-falling-time-ns = <20>;
>  	status = "okay";
> @@ -353,7 +355,8 @@
>  };
>  
>  &usbotg_hs {
> -	dr_mode = "peripheral";
> +	pinctrl-0 = <&usbotg_hs_pins_a>;
> +	pinctrl-names = "default";
>  	phys = <&usbphyc_port1 0>;
>  	phy-names = "usb2-phy";
>  	status = "okay";
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom.dtsi b/arch/arm/dts/stm32mp15xx-dhcom.dtsi
> index d8a255b9c6..b3f4cb4515 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom.dtsi
> @@ -269,7 +269,8 @@
>  	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
>  	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
>  	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
> -	broken-cd;
> +	cd-gpios = <&gpioi 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	disable-wp;
>  	st,sig-dir;
>  	st,neg-edge;
>  	st,use-ckin;
> diff --git a/arch/arm/dts/stm32mp15xx-dhcor.dtsi b/arch/arm/dts/stm32mp15xx-dhcor.dtsi
> index 97d370e119..ce17997142 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcor.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcor.dtsi
> @@ -51,10 +51,6 @@
>  		#interrupt-cells = <2>;
>  		status = "okay";
>  
> -		st,main-control-register = <0x04>;
> -		st,vin-control-register = <0xc0>;
> -		st,usb-control-register = <0x30>;
> -
>  		regulators {
>  			compatible = "st,stpmic1-regulators";
>  
> @@ -89,7 +85,6 @@
>  				regulator-min-microvolt = <2900000>;
>  				regulator-max-microvolt = <2900000>;
>  				regulator-always-on;
> -				st,mask_reset;
>  				regulator-initial-mode = <0>;
>  				regulator-over-current-protection;
>  			};
> @@ -129,8 +124,6 @@
>  
>  			vdd_usb: ldo4 {
>  				regulator-name = "vdd_usb";
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
>  				interrupts = <IT_CURLIM_LDO4 0>;
>  				interrupt-parent = <&pmic>;
>  			};
> @@ -156,7 +149,6 @@
>  			vref_ddr: vref_ddr {
>  				regulator-name = "vref_ddr";
>  				regulator-always-on;
> -				regulator-over-current-protection;
>  			};
>  
>  			bst_out: boost {
> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> index 9ce10a52f0..812e370ee4 100644
> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> @@ -221,10 +221,12 @@
>  };
>  
>  &i2c4 {
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&i2c4_pins_a>;
> +	pinctrl-1 = <&i2c4_pins_sleep_a>;
>  	i2c-scl-rising-time-ns = <185>;
>  	i2c-scl-falling-time-ns = <20>;
> +	clock-frequency = <400000>;
>  	status = "okay";
>  	/* spare dmas for other usage */
>  	/delete-property/dmas;
> @@ -327,8 +329,6 @@
>  
>  			vdd_usb: ldo4 {
>  				regulator-name = "vdd_usb";
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
>  				interrupts = <IT_CURLIM_LDO4 0>;
>  			};
>  
> @@ -351,7 +351,6 @@
>  			vref_ddr: vref_ddr {
>  				regulator-name = "vref_ddr";
>  				regulator-always-on;
> -				regulator-over-current-protection;
>  			};
>  
>  			 bst_out: boost {
> @@ -502,7 +501,8 @@
>  	pinctrl-0 = <&sdmmc1_b4_pins_a>;
>  	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
>  	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> -	broken-cd;
> +	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	disable-wp;
>  	st,neg-edge;
>  	bus-width = <4>;
>  	vmmc-supply = <&v3v3>;
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
