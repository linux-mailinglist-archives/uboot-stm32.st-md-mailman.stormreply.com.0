Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C69230EE1
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 18:09:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61C8FC36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:09:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99D58C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 16:09:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SG7HMs031562; Tue, 28 Jul 2020 18:09:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LyKF/u4fDRXuWJU35OfHFBWcg3e/GDZZS18Vk2e3Haw=;
 b=L79b0uRly32dU2eT2OpKXyzdd703WVugve3npUABOuW1aIaV93umsGPRI4TwDEZO9gPn
 3QGVQtzd3y4rNVstl2UOvFN3aUpvhe2rf/c2lNlnyvleV+xkHVhUOXco5tUdvzQM70LD
 Rha7Eo8nGc14C4i+bEi3PP+6lQnYmyLy4hPH7Mj4roEArvmcdYOwDG/otu45br6pFz6a
 3zJk5M3kzgK3yW0NbXNT67eCrpDtRw0Fc7f0aXvcQp4ADFjzD0LdAx2p+2HbwjjVB73F
 CWnhksk+OtG9WAyKXs3msxiYMrXQob/EOJkIgDfQ4r1le+7BnyrsXS2/TLDcfc9T6EV8 Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9fcfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 18:09:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72CC910002A;
 Tue, 28 Jul 2020 18:09:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6596C2208EF;
 Tue, 28 Jul 2020 18:09:07 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 18:09:06 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 18:09:06 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32mp1: DT alignment with
 Linux kernel v5.8-rc1
Thread-Index: AQHWZOQSg460MdYd2EaQw/w/7/22K6kdB4YA
Date: Tue, 28 Jul 2020 16:09:06 +0000
Message-ID: <ffb928a6-d241-dbcb-a335-551a09348510@st.com>
References: <20200706112653.18951-1-patrick.delaunay@st.com>
 <20200706112653.18951-3-patrick.delaunay@st.com>
 <b268c7f8-ff7f-3196-5359-24f3219f6515@st.com>
In-Reply-To: <b268c7f8-ff7f-3196-5359-24f3219f6515@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <69A6A4B68A4DD849A51B5DD88C875819@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_14:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32mp1: DT alignment with
 Linux kernel v5.8-rc1
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


On 7/28/20 3:36 PM, Patrice CHOTARD wrote:
> On 7/6/20 1:26 PM, Patrick Delaunay wrote:
>> DT alignment with Linux kernel v5.8-rc1 for the STM32MP15x soc
>> device tree files and the STMicroelectronics boards device tree files.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp15-pinctrl.dtsi | 562 ++++++++++++++++++++++++++--
>>  arch/arm/dts/stm32mp15-u-boot.dtsi  |   4 +
>>  arch/arm/dts/stm32mp151.dtsi        |  48 +--
>>  arch/arm/dts/stm32mp157.dtsi        |   8 +-
>>  arch/arm/dts/stm32mp157c-dk2.dts    |   8 -
>>  arch/arm/dts/stm32mp157c-ed1.dts    |   7 +-
>>  arch/arm/dts/stm32mp157c-ev1.dts    |  14 +-
>>  arch/arm/dts/stm32mp15xx-dkx.dtsi   |  20 +-
>>  8 files changed, 577 insertions(+), 94 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
>> index b0c2aa52f8..e9525b5d06 100644
>> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
>> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
>> @@ -6,7 +6,7 @@
>>  #include <dt-bindings/pinctrl/stm32-pinfunc.h>
>>  
>>  &pinctrl {
>> -	adc1_in6_pins_a: adc1-in6 {
>> +	adc1_in6_pins_a: adc1-in6-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('F', 12, ANALOG)>;
>>  		};
>> @@ -21,6 +21,13 @@
>>  		};
>>  	};
>>  
>> +	adc12_ain_pins_b: adc12-ain-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
>> +				 <STM32_PINMUX('F', 13, ANALOG)>; /* ADC2 in2 */
>> +		};
>> +	};
>> +
>>  	adc12_usb_cc_pins_a: adc12-usb-cc-pins-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* ADC12 in18 */
>> @@ -37,7 +44,7 @@
>>  		};
>>  	};
>>  
>> -	cec_pins_sleep_a: cec-sleep-0 {
>> +	cec_sleep_pins_a: cec-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* HDMI_CEC */
>>  		};
>> @@ -52,19 +59,19 @@
>>  		};
>>  	};
>>  
>> -	cec_pins_sleep_b: cec-sleep-1 {
>> +	cec_sleep_pins_b: cec-sleep-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* HDMI_CEC */
>>  		};
>>  	};
>>  
>> -	dac_ch1_pins_a: dac-ch1 {
>> +	dac_ch1_pins_a: dac-ch1-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('A', 4, ANALOG)>;
>>  		};
>>  	};
>>  
>> -	dac_ch2_pins_a: dac-ch2 {
>> +	dac_ch2_pins_a: dac-ch2-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('A', 5, ANALOG)>;
>>  		};
>> @@ -142,7 +149,7 @@
>>  		};
>>  	};
>>  
>> -	ethernet0_rgmii_pins_sleep_a: rgmii-sleep-0 {
>> +	ethernet0_rgmii_sleep_pins_a: rgmii-sleep-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
>>  				 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
>> @@ -162,6 +169,57 @@
>>  		};
>>  	};
>>  
>> +	ethernet0_rgmii_pins_b: rgmii-1 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
>> +				 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
>> +				 <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
>> +				 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
>> +				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
>> +				 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
>> +				 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
>> +				 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <2>;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <0>;
>> +		};
>> +		pins3 {
>> +			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
>> +				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
>> +				 <STM32_PINMUX('H', 6, AF11)>, /* ETH_RGMII_RXD2 */
>> +				 <STM32_PINMUX('H', 7, AF11)>, /* ETH_RGMII_RXD3 */
>> +				 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
>> +				 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	ethernet0_rgmii_sleep_pins_b: rgmii-sleep-1 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
>> +				 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
>> +				 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
>> +				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
>> +				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
>> +				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
>> +				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
>> +				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_MDC */
>> +				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
>> +				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
>> +				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
>> +				 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
>> +				 <STM32_PINMUX('H', 7, ANALOG)>, /* ETH_RGMII_RXD3 */
>> +				 <STM32_PINMUX('A', 1, ANALOG)>, /* ETH_RGMII_RX_CLK */
>> +				 <STM32_PINMUX('A', 7, ANALOG)>; /* ETH_RGMII_RX_CTL */
>> +		 };
>> +	};
>> +
>>  	ethernet0_rgmii_pins_c: rgmii-2 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
>> @@ -233,7 +291,7 @@
>>  		};
>>  	};
>>  
>> -	ethernet0_rmii_pins_sleep_a: rmii-sleep-0 {
>> +	ethernet0_rmii_sleep_pins_a: rmii-sleep-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH1_RMII_TXD0 */
>>  				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH1_RMII_TXD1 */
>> @@ -301,14 +359,14 @@
>>  		};
>>  	};
>>  
>> -	i2c1_pins_sleep_a: i2c1-1 {
>> +	i2c1_sleep_pins_a: i2c1-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
>>  				 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
>>  		};
>>  	};
>>  
>> -	i2c1_pins_b: i2c1-2 {
>> +	i2c1_pins_b: i2c1-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
>>  				 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
>> @@ -318,7 +376,7 @@
>>  		};
>>  	};
>>  
>> -	i2c1_pins_sleep_b: i2c1-3 {
>> +	i2c1_sleep_pins_b: i2c1-sleep-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
>>  				 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
>> @@ -335,14 +393,14 @@
>>  		};
>>  	};
>>  
>> -	i2c2_pins_sleep_a: i2c2-1 {
>> +	i2c2_sleep_pins_a: i2c2-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('H', 4, ANALOG)>, /* I2C2_SCL */
>>  				 <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
>>  		};
>>  	};
>>  
>> -	i2c2_pins_b1: i2c2-2 {
>> +	i2c2_pins_b1: i2c2-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
>>  			bias-disable;
>> @@ -351,13 +409,13 @@
>>  		};
>>  	};
>>  
>> -	i2c2_pins_sleep_b1: i2c2-3 {
>> +	i2c2_sleep_pins_b1: i2c2-sleep-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
>>  		};
>>  	};
>>  
>> -	i2c2_pins_c: i2c2-4 {
>> +	i2c2_pins_c: i2c2-2 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('F', 1, AF4)>, /* I2C2_SCL */
>>  				 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
>> @@ -367,7 +425,7 @@
>>  		};
>>  	};
>>  
>> -	i2c2_pins_sleep_c: i2c2-5 {
>> +	i2c2_pins_sleep_c: i2c2-sleep-2 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('F', 1, ANALOG)>, /* I2C2_SCL */
>>  				 <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
>> @@ -384,7 +442,7 @@
>>  		};
>>  	};
>>  
>> -	i2c5_pins_sleep_a: i2c5-1 {
>> +	i2c5_sleep_pins_a: i2c5-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('A', 11, ANALOG)>, /* I2C5_SCL */
>>  				 <STM32_PINMUX('A', 12, ANALOG)>; /* I2C5_SDA */
>> @@ -392,6 +450,23 @@
>>  		};
>>  	};
>>  
>> +	i2c5_pins_b: i2c5-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('D', 0, AF4)>, /* I2C5_SCL */
>> +				 <STM32_PINMUX('D', 1, AF4)>; /* I2C5_SDA */
>> +			bias-disable;
>> +			drive-open-drain;
>> +			slew-rate = <0>;
>> +		};
>> +	};
>> +
>> +	i2c5_sleep_pins_b: i2c5-sleep-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('D', 0, ANALOG)>, /* I2C5_SCL */
>> +				 <STM32_PINMUX('D', 1, ANALOG)>; /* I2C5_SDA */
>> +		};
>> +	};
>> +
>>  	i2s2_pins_a: i2s2-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('I', 3, AF5)>, /* I2S2_SDO */
>> @@ -403,7 +478,7 @@
>>  		};
>>  	};
>>  
>> -	i2s2_pins_sleep_a: i2s2-1 {
>> +	i2s2_sleep_pins_a: i2s2-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('I', 3, ANALOG)>, /* I2S2_SDO */
>>  				 <STM32_PINMUX('B', 9, ANALOG)>, /* I2S2_WS */
>> @@ -411,7 +486,7 @@
>>  		};
>>  	};
>>  
>> -	ltdc_pins_a: ltdc-a-0 {
>> +	ltdc_pins_a: ltdc-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('G',  7, AF14)>, /* LCD_CLK */
>>  				 <STM32_PINMUX('I', 10, AF14)>, /* LCD_HSYNC */
>> @@ -447,7 +522,7 @@
>>  		};
>>  	};
>>  
>> -	ltdc_pins_sleep_a: ltdc-a-1 {
>> +	ltdc_sleep_pins_a: ltdc-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_CLK */
>>  				 <STM32_PINMUX('I', 10, ANALOG)>, /* LCD_HSYNC */
>> @@ -480,7 +555,7 @@
>>  		};
>>  	};
>>  
>> -	ltdc_pins_b: ltdc-b-0 {
>> +	ltdc_pins_b: ltdc-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('I', 14, AF14)>, /* LCD_CLK */
>>  				 <STM32_PINMUX('I', 12, AF14)>, /* LCD_HSYNC */
>> @@ -516,7 +591,7 @@
>>  		};
>>  	};
>>  
>> -	ltdc_pins_sleep_b: ltdc-b-1 {
>> +	ltdc_sleep_pins_b: ltdc-sleep-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('I', 14, ANALOG)>, /* LCD_CLK */
>>  				 <STM32_PINMUX('I', 12, ANALOG)>, /* LCD_HSYNC */
>> @@ -549,6 +624,142 @@
>>  		};
>>  	};
>>  
>> +	ltdc_pins_c: ltdc-2 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('B',  1, AF9)>,  /* LTDC_R6 */
>> +				 <STM32_PINMUX('B',  9, AF14)>, /* LTDC_B7 */
>> +				 <STM32_PINMUX('C',  0, AF14)>, /* LTDC_R5 */
>> +				 <STM32_PINMUX('D',  3, AF14)>, /* LTDC_G7 */
>> +				 <STM32_PINMUX('D',  6, AF14)>, /* LTDC_B2 */
>> +				 <STM32_PINMUX('D', 10, AF14)>, /* LTDC_B3 */
>> +				 <STM32_PINMUX('E', 11, AF14)>, /* LTDC_G3 */
>> +				 <STM32_PINMUX('E', 12, AF14)>, /* LTDC_B4 */
>> +				 <STM32_PINMUX('E', 13, AF14)>, /* LTDC_DE */
>> +				 <STM32_PINMUX('E', 15, AF14)>, /* LTDC_R7 */
>> +				 <STM32_PINMUX('H',  4, AF9)>,  /* LTDC_G5 */
>> +				 <STM32_PINMUX('H',  8, AF14)>, /* LTDC_R2 */
>> +				 <STM32_PINMUX('H',  9, AF14)>, /* LTDC_R3 */
>> +				 <STM32_PINMUX('H', 10, AF14)>, /* LTDC_R4 */
>> +				 <STM32_PINMUX('H', 13, AF14)>, /* LTDC_G2 */
>> +				 <STM32_PINMUX('H', 15, AF14)>, /* LTDC_G4 */
>> +				 <STM32_PINMUX('I',  1, AF14)>, /* LTDC_G6 */
>> +				 <STM32_PINMUX('I',  5, AF14)>, /* LTDC_B5 */
>> +				 <STM32_PINMUX('I',  6, AF14)>, /* LTDC_B6 */
>> +				 <STM32_PINMUX('I',  9, AF14)>, /* LTDC_VSYNC */
>> +				 <STM32_PINMUX('I', 10, AF14)>; /* LTDC_HSYNC */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <0>;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('E', 14, AF14)>; /* LTDC_CLK */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <1>;
>> +		};
>> +	};
>> +
>> +	ltdc_sleep_pins_c: ltdc-sleep-2 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('B', 1, ANALOG)>,  /* LTDC_R6 */
>> +				 <STM32_PINMUX('B', 9, ANALOG)>, /* LTDC_B7 */
>> +				 <STM32_PINMUX('C', 0, ANALOG)>, /* LTDC_R5 */
>> +				 <STM32_PINMUX('D', 3, ANALOG)>, /* LTDC_G7 */
>> +				 <STM32_PINMUX('D', 6, ANALOG)>, /* LTDC_B2 */
>> +				 <STM32_PINMUX('D', 10, ANALOG)>, /* LTDC_B3 */
>> +				 <STM32_PINMUX('E', 11, ANALOG)>, /* LTDC_G3 */
>> +				 <STM32_PINMUX('E', 12, ANALOG)>, /* LTDC_B4 */
>> +				 <STM32_PINMUX('E', 13, ANALOG)>, /* LTDC_DE */
>> +				 <STM32_PINMUX('E', 15, ANALOG)>, /* LTDC_R7 */
>> +				 <STM32_PINMUX('H', 4, ANALOG)>,  /* LTDC_G5 */
>> +				 <STM32_PINMUX('H', 8, ANALOG)>, /* LTDC_R2 */
>> +				 <STM32_PINMUX('H', 9, ANALOG)>, /* LTDC_R3 */
>> +				 <STM32_PINMUX('H', 10, ANALOG)>, /* LTDC_R4 */
>> +				 <STM32_PINMUX('H', 13, ANALOG)>, /* LTDC_G2 */
>> +				 <STM32_PINMUX('H', 15, ANALOG)>, /* LTDC_G4 */
>> +				 <STM32_PINMUX('I', 1, ANALOG)>, /* LTDC_G6 */
>> +				 <STM32_PINMUX('I', 5, ANALOG)>, /* LTDC_B5 */
>> +				 <STM32_PINMUX('I', 6, ANALOG)>, /* LTDC_B6 */
>> +				 <STM32_PINMUX('I', 9, ANALOG)>, /* LTDC_VSYNC */
>> +				 <STM32_PINMUX('I', 10, ANALOG)>, /* LTDC_HSYNC */
>> +				 <STM32_PINMUX('E', 14, ANALOG)>; /* LTDC_CLK */
>> +		};
>> +	};
>> +
>> +	ltdc_pins_d: ltdc-3 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('G',  7, AF14)>; /* LCD_CLK */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <3>;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('I', 10, AF14)>, /* LCD_HSYNC */
>> +				 <STM32_PINMUX('I',  9, AF14)>, /* LCD_VSYNC */
>> +				 <STM32_PINMUX('E', 13, AF14)>, /* LCD_DE */
>> +				 <STM32_PINMUX('G', 13, AF14)>, /* LCD_R0 */
>> +				 <STM32_PINMUX('H',  3, AF14)>, /* LCD_R1 */
>> +				 <STM32_PINMUX('H',  8, AF14)>, /* LCD_R2 */
>> +				 <STM32_PINMUX('H',  9, AF14)>, /* LCD_R3 */
>> +				 <STM32_PINMUX('A',  5, AF14)>, /* LCD_R4 */
>> +				 <STM32_PINMUX('H', 11, AF14)>, /* LCD_R5 */
>> +				 <STM32_PINMUX('H', 12, AF14)>, /* LCD_R6 */
>> +				 <STM32_PINMUX('E', 15, AF14)>, /* LCD_R7 */
>> +				 <STM32_PINMUX('E',  5, AF14)>, /* LCD_G0 */
>> +				 <STM32_PINMUX('B',  0, AF14)>, /* LCD_G1 */
>> +				 <STM32_PINMUX('H', 13, AF14)>, /* LCD_G2 */
>> +				 <STM32_PINMUX('E', 11, AF14)>, /* LCD_G3 */
>> +				 <STM32_PINMUX('H', 15, AF14)>, /* LCD_G4 */
>> +				 <STM32_PINMUX('H',  4,  AF9)>, /* LCD_G5 */
>> +				 <STM32_PINMUX('I', 11,  AF9)>, /* LCD_G6 */
>> +				 <STM32_PINMUX('G',  8, AF14)>, /* LCD_G7 */
>> +				 <STM32_PINMUX('D',  9, AF14)>, /* LCD_B0 */
>> +				 <STM32_PINMUX('G', 12, AF14)>, /* LCD_B1 */
>> +				 <STM32_PINMUX('G', 10, AF14)>, /* LCD_B2 */
>> +				 <STM32_PINMUX('D', 10, AF14)>, /* LCD_B3 */
>> +				 <STM32_PINMUX('E', 12, AF14)>, /* LCD_B4 */
>> +				 <STM32_PINMUX('A',  3, AF14)>, /* LCD_B5 */
>> +				 <STM32_PINMUX('B',  8, AF14)>, /* LCD_B6 */
>> +				 <STM32_PINMUX('I',  7, AF14)>; /* LCD_B7 */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <2>;
>> +		};
>> +	};
>> +
>> +	ltdc_sleep_pins_d: ltdc-sleep-3 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_CLK */
>> +				 <STM32_PINMUX('I', 10, ANALOG)>, /* LCD_HSYNC */
>> +				 <STM32_PINMUX('I',  9, ANALOG)>, /* LCD_VSYNC */
>> +				 <STM32_PINMUX('E', 13, ANALOG)>, /* LCD_DE */
>> +				 <STM32_PINMUX('G', 13, ANALOG)>, /* LCD_R0 */
>> +				 <STM32_PINMUX('H',  3, ANALOG)>, /* LCD_R1 */
>> +				 <STM32_PINMUX('H',  8, ANALOG)>, /* LCD_R2 */
>> +				 <STM32_PINMUX('H',  9, ANALOG)>, /* LCD_R3 */
>> +				 <STM32_PINMUX('A',  5, ANALOG)>, /* LCD_R4 */
>> +				 <STM32_PINMUX('H', 11, ANALOG)>, /* LCD_R5 */
>> +				 <STM32_PINMUX('H', 12, ANALOG)>, /* LCD_R6 */
>> +				 <STM32_PINMUX('E', 15, ANALOG)>, /* LCD_R7 */
>> +				 <STM32_PINMUX('E',  5, ANALOG)>, /* LCD_G0 */
>> +				 <STM32_PINMUX('B',  0, ANALOG)>, /* LCD_G1 */
>> +				 <STM32_PINMUX('H', 13, ANALOG)>, /* LCD_G2 */
>> +				 <STM32_PINMUX('E', 11, ANALOG)>, /* LCD_G3 */
>> +				 <STM32_PINMUX('H', 15, ANALOG)>, /* LCD_G4 */
>> +				 <STM32_PINMUX('H',  4, ANALOG)>, /* LCD_G5 */
>> +				 <STM32_PINMUX('I', 11, ANALOG)>, /* LCD_G6 */
>> +				 <STM32_PINMUX('G',  8, ANALOG)>, /* LCD_G7 */
>> +				 <STM32_PINMUX('D',  9, ANALOG)>, /* LCD_B0 */
>> +				 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_B1 */
>> +				 <STM32_PINMUX('G', 10, ANALOG)>, /* LCD_B2 */
>> +				 <STM32_PINMUX('D', 10, ANALOG)>, /* LCD_B3 */
>> +				 <STM32_PINMUX('E', 12, ANALOG)>, /* LCD_B4 */
>> +				 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B5 */
>> +				 <STM32_PINMUX('B',  8, ANALOG)>, /* LCD_B6 */
>> +				 <STM32_PINMUX('I',  7, ANALOG)>; /* LCD_B7 */
>> +		};
>> +	};
>> +
>>  	m_can1_pins_a: m-can1-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
>> @@ -569,6 +780,46 @@
>>  		};
>>  	};
>>  
>> +	m_can1_pins_b: m-can1-1 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('A', 12, AF9)>; /* CAN1_TX */
>> +			slew-rate = <1>;
>> +			drive-push-pull;
>> +			bias-disable;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('A', 11, AF9)>; /* CAN1_RX */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	m_can1_sleep_pins_b: m_can1-sleep-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('A', 12, ANALOG)>, /* CAN1_TX */
>> +				 <STM32_PINMUX('A', 11, ANALOG)>; /* CAN1_RX */
>> +		};
>> +	};
>> +
>> +	m_can2_pins_a: m-can2-0 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
>> +			slew-rate = <1>;
>> +			drive-push-pull;
>> +			bias-disable;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('B', 5, AF9)>; /* CAN2_RX */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	m_can2_sleep_pins_a: m_can2-sleep-0 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('B', 13, ANALOG)>, /* CAN2_TX */
>> +				 <STM32_PINMUX('B', 5, ANALOG)>; /* CAN2_RX */
>> +		};
>> +	};
>> +
>>  	pwm1_pins_a: pwm1-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('E', 9, AF1)>, /* TIM1_CH1 */
>> @@ -618,6 +869,21 @@
>>  		};
>>  	};
>>  
>> +	pwm3_pins_b: pwm3-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('B', 5, AF2)>; /* TIM3_CH2 */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <0>;
>> +		};
>> +	};
>> +
>> +	pwm3_sleep_pins_b: pwm3-sleep-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* TIM3_CH2 */
>> +		};
>> +	};
>> +
>>  	pwm4_pins_a: pwm4-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('D', 14, AF2)>, /* TIM4_CH3 */
>> @@ -665,6 +931,25 @@
>>  		};
>>  	};
>>  
>> +	pwm5_pins_b: pwm5-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('H', 11, AF2)>, /* TIM5_CH2 */
>> +				 <STM32_PINMUX('H', 12, AF2)>, /* TIM5_CH3 */
>> +				 <STM32_PINMUX('I', 0, AF2)>; /* TIM5_CH4 */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <0>;
>> +		};
>> +	};
>> +
>> +	pwm5_sleep_pins_b: pwm5-sleep-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('H', 11, ANALOG)>, /* TIM5_CH2 */
>> +				 <STM32_PINMUX('H', 12, ANALOG)>, /* TIM5_CH3 */
>> +				 <STM32_PINMUX('I', 0, ANALOG)>; /* TIM5_CH4 */
>> +		};
>> +	};
>> +
>>  	pwm8_pins_a: pwm8-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('I', 2, AF3)>; /* TIM8_CH4 */
>> @@ -778,7 +1063,7 @@
>>  		};
>>  	};
>>  
>> -	sai2a_sleep_pins_a: sai2a-1 {
>> +	sai2a_sleep_pins_a: sai2a-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('I', 5, ANALOG)>, /* SAI2_SCK_A */
>>  				 <STM32_PINMUX('I', 6, ANALOG)>, /* SAI2_SD_A */
>> @@ -787,7 +1072,7 @@
>>  		};
>>  	};
>>  
>> -	sai2a_pins_b: sai2a-2 {
>> +	sai2a_pins_b: sai2a-1 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('I', 6, AF10)>,	/* SAI2_SD_A */
>>  				 <STM32_PINMUX('I', 7, AF10)>,	/* SAI2_FS_A */
>> @@ -798,7 +1083,7 @@
>>  		};
>>  	};
>>  
>> -	sai2a_sleep_pins_b: sai2a-sleep-3 {
>> +	sai2a_sleep_pins_b: sai2a-sleep-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('I', 6, ANALOG)>,  /* SAI2_SD_A */
>>  				 <STM32_PINMUX('I', 7, ANALOG)>,  /* SAI2_FS_A */
>> @@ -806,6 +1091,25 @@
>>  		};
>>  	};
>>  
>> +	sai2a_pins_c: sai2a-4 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('D', 13, AF10)>, /* SAI2_SCK_A */
>> +				 <STM32_PINMUX('D', 11, AF10)>, /* SAI2_SD_A */
>> +				 <STM32_PINMUX('D', 12, AF10)>; /* SAI2_FS_A */
>> +			slew-rate = <0>;
>> +			drive-push-pull;
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	sai2a_sleep_pins_c: sai2a-5 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('D', 13, ANALOG)>, /* SAI2_SCK_A */
>> +				 <STM32_PINMUX('D', 11, ANALOG)>, /* SAI2_SD_A */
>> +				 <STM32_PINMUX('D', 12, ANALOG)>; /* SAI2_FS_A */
>> +		};
>> +	};
>> +
>>  	sai2b_pins_a: sai2b-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('E', 12, AF10)>, /* SAI2_SCK_B */
>> @@ -821,7 +1125,7 @@
>>  		};
>>  	};
>>  
>> -	sai2b_sleep_pins_a: sai2b-1 {
>> +	sai2b_sleep_pins_a: sai2b-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* SAI2_SD_B */
>>  				 <STM32_PINMUX('E', 12, ANALOG)>, /* SAI2_SCK_B */
>> @@ -830,14 +1134,27 @@
>>  		};
>>  	};
>>  
>> -	sai2b_pins_b: sai2b-2 {
>> +	sai2b_pins_b: sai2b-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
>>  			bias-disable;
>>  		};
>>  	};
>>  
>> -	sai2b_sleep_pins_b: sai2b-3 {
>> +	sai2b_sleep_pins_b: sai2b-sleep-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
>> +		};
>> +	};
>> +
>> +	sai2b_pins_c: sai2a-4 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	sai2b_sleep_pins_c: sai2a-sleep-5 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
>>  		};
>> @@ -852,7 +1169,7 @@
>>  		};
>>  	};
>>  
>> -	sai4a_sleep_pins_a: sai4a-1 {
>> +	sai4a_sleep_pins_a: sai4a-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* SAI4_SD_A */
>>  		};
>> @@ -939,7 +1256,7 @@
>>  	sdmmc1_dir_pins_b: sdmmc1-dir-1 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
>> -				 <STM32_PINMUX('E', 14, AF8)>, /* SDMMC1_D123DIR */
>> +				 <STM32_PINMUX('E', 14, AF11)>, /* SDMMC1_D123DIR */
>>  				 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
>>  			slew-rate = <1>;
>>  			drive-push-pull;
>> @@ -954,9 +1271,9 @@
>>  	sdmmc1_dir_sleep_pins_b: sdmmc1-dir-sleep-1 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* SDMMC1_D0DIR */
>> -			 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC1_D123DIR */
>> -			 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
>> -			 <STM32_PINMUX('E', 4, ANALOG)>; /* SDMMC1_CKIN */
>> +				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC1_D123DIR */
>> +				 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
>> +				 <STM32_PINMUX('E', 4, ANALOG)>; /* SDMMC1_CKIN */
>>  		};
>>  	};
>>  
>> @@ -1079,6 +1396,27 @@
>>  	};
>>  
>>  	sdmmc2_d47_pins_b: sdmmc2-d47-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('A', 8, AF9)>,  /* SDMMC2_D4 */
>> +				 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
>> +				 <STM32_PINMUX('C', 6, AF10)>, /* SDMMC2_D6 */
>> +				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
>> +			slew-rate = <1>;
>> +			drive-push-pull;
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	sdmmc2_d47_sleep_pins_b: sdmmc2-d47-sleep-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
>> +				 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
>> +				 <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC2_D6 */
>> +				 <STM32_PINMUX('C', 7, ANALOG)>; /* SDMMC2_D7 */
>> +		};
>> +	};
>> +
>> +	sdmmc2_d47_pins_c: sdmmc2-d47-2 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
>>  				 <STM32_PINMUX('A', 15, AF9)>, /* SDMMC2_D5 */
>> @@ -1090,7 +1428,7 @@
>>  		};
>>  	};
>>  
>> -	sdmmc2_d47_sleep_pins_b: sdmmc2-d47-sleep-1 {
>> +	sdmmc2_d47_sleep_pins_c: sdmmc2-d47-sleep-2 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
>>  				 <STM32_PINMUX('A', 15, ANALOG)>, /* SDMMC2_D5 */
>> @@ -1153,6 +1491,60 @@
>>  		};
>>  	};
>>  
>> +	sdmmc3_b4_pins_b: sdmmc3-b4-1 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
>> +				 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
>> +				 <STM32_PINMUX('D', 5, AF10)>, /* SDMMC3_D2 */
>> +				 <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
>> +				 <STM32_PINMUX('D', 0, AF10)>; /* SDMMC3_CMD */
>> +			slew-rate = <1>;
>> +			drive-push-pull;
>> +			bias-pull-up;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
>> +			slew-rate = <2>;
>> +			drive-push-pull;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	sdmmc3_b4_od_pins_b: sdmmc3-b4-od-1 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
>> +				 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
>> +				 <STM32_PINMUX('D', 5, AF10)>, /* SDMMC3_D2 */
>> +				 <STM32_PINMUX('D', 7, AF10)>; /* SDMMC3_D3 */
>> +			slew-rate = <1>;
>> +			drive-push-pull;
>> +			bias-pull-up;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
>> +			slew-rate = <2>;
>> +			drive-push-pull;
>> +			bias-pull-up;
>> +		};
>> +		pins3 {
>> +			pinmux = <STM32_PINMUX('D', 0, AF10)>; /* SDMMC2_CMD */
>> +			slew-rate = <1>;
>> +			drive-open-drain;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	sdmmc3_b4_sleep_pins_b: sdmmc3-b4-sleep-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* SDMMC3_D0 */
>> +				 <STM32_PINMUX('F', 4, ANALOG)>, /* SDMMC3_D1 */
>> +				 <STM32_PINMUX('D', 5, ANALOG)>, /* SDMMC3_D2 */
>> +				 <STM32_PINMUX('D', 7, ANALOG)>, /* SDMMC3_D3 */
>> +				 <STM32_PINMUX('G', 15, ANALOG)>, /* SDMMC3_CK */
>> +				 <STM32_PINMUX('D', 0, ANALOG)>; /* SDMMC3_CMD */
>> +		};
>> +	};
>> +
>>  	spdifrx_pins_a: spdifrx-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
>> @@ -1160,7 +1552,7 @@
>>  		};
>>  	};
>>  
>> -	spdifrx_sleep_pins_a: spdifrx-1 {
>> +	spdifrx_sleep_pins_a: spdifrx-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('G', 12, ANALOG)>; /* SPDIF_IN1 */
>>  		};
>> @@ -1168,15 +1560,15 @@
>>  
>>  	spi2_pins_a: spi2-0 {
>>  		pins1 {
>> -			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
>> -				 <STM32_PINMUX('I', 0, AF5)>, /* SPI2_NSS */
>> -				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
>> +			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI1_SCK */
>> +				 <STM32_PINMUX('I', 3, AF5)>; /* SPI1_MOSI */
>>  			bias-disable;
>>  			drive-push-pull;
>> -			slew-rate = <3>;
>> +			slew-rate = <1>;
>>  		};
>> +
>>  		pins2 {
>> -			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
>> +			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI1_MISO */
>>  			bias-disable;
>>  		};
>>  	};
>> @@ -1188,6 +1580,54 @@
>>  		};
>>  	};
>>  
>> +	usart2_pins_a: usart2-0 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
>> +				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <0>;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
>> +				 <STM32_PINMUX('D', 3, AF7)>; /* USART2_CTS_NSS */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	usart2_sleep_pins_a: usart2-sleep-0 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
>> +				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
>> +				 <STM32_PINMUX('D', 6, ANALOG)>, /* USART2_RX */
>> +				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
>> +		};
>> +	};
>> +
>> +	usart2_pins_b: usart2-1 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
>> +				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <0>;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('F', 4, AF7)>, /* USART2_RX */
>> +				 <STM32_PINMUX('E', 15, AF7)>; /* USART2_CTS_NSS */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	usart2_sleep_pins_b: usart2-sleep-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
>> +				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
>> +				 <STM32_PINMUX('F', 4, ANALOG)>, /* USART2_RX */
>> +				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
>> +		};
>> +	};
>> +
>>  	usart3_pins_a: usart3-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
>> @@ -1227,6 +1667,19 @@
>>  		};
>>  	};
>>  
>> +	uart4_pins_c: uart4-2 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <0>;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>>  	uart7_pins_a: uart7-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
>> @@ -1242,6 +1695,19 @@
>>  		};
>>  	};
>>  
>> +	uart7_pins_b: uart7-1 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('F', 7, AF7)>; /* UART7_TX */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <0>;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('F', 6, AF7)>; /* UART7_RX */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>>  	uart8_pins_a: uart8-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
>> @@ -1279,7 +1745,7 @@
>>  		};
>>  	};
>>  
>> -	i2c2_pins_sleep_b2: i2c2-1 {
>> +	i2c2_sleep_pins_b2: i2c2-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('Z', 0, ANALOG)>; /* I2C2_SCL */
>>  		};
>> @@ -1295,7 +1761,7 @@
>>  		};
>>  	};
>>  
>> -	i2c4_pins_sleep_a: i2c4-1 {
>> +	i2c4_sleep_pins_a: i2c4-sleep-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C4_SCL */
>>  				 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
>> @@ -1316,4 +1782,18 @@
>>  			bias-disable;
>>  		};
>>  	};
>> +
>> +	spi4_pins_a: spi4-0 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
>> +				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <1>;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
>> +			bias-disable;
>> +		};
>> +	};
>>  };
>> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
>> index 1279589a56..142ad25c43 100644
>> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
>> @@ -32,6 +32,10 @@
>>  
>>  	reboot {
>>  		u-boot,dm-pre-reloc;
>> +		compatible = "syscon-reboot";
>> +		regmap = <&rcc>;
>> +		offset = <0x404>;
>> +		mask = <0x1>;
>>  	};
>>  
>>  	soc {
>> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
>> index 75d2c0d296..fb9bfeb633 100644
>> --- a/arch/arm/dts/stm32mp151.dtsi
>> +++ b/arch/arm/dts/stm32mp151.dtsi
>> @@ -26,8 +26,6 @@
>>  	psci {
>>  		compatible = "arm,psci-1.0";
>>  		method = "smc";
>> -		cpu_off = <0x84000002>;
>> -		cpu_on = <0x84000003>;
>>  	};
>>  
>>  	intc: interrupt-controller@a0021000 {
>> @@ -110,13 +108,6 @@
>>  		status = "disabled";
>>  	};
>>  
>> -	reboot {
>> -		compatible = "syscon-reboot";
>> -		regmap = <&rcc>;
>> -		offset = <0x404>;
>> -		mask = <0x1>;
>> -	};
>> -
>>  	soc {
>>  		compatible = "simple-bus";
>>  		#address-cells = <1>;
>> @@ -482,7 +473,7 @@
>>  		};
>>  
>>  		i2c1: i2c@40012000 {
>> -			compatible = "st,stm32f7-i2c";
>> +			compatible = "st,stm32mp15-i2c";
>>  			reg = <0x40012000 0x400>;
>>  			interrupt-names = "event", "error";
>>  			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
>> @@ -491,12 +482,13 @@
>>  			resets = <&rcc I2C1_R>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
>> +			st,syscfg-fmp = <&syscfg 0x4 0x1>;
>>  			wakeup-source;
>>  			status = "disabled";
>>  		};
>>  
>>  		i2c2: i2c@40013000 {
>> -			compatible = "st,stm32f7-i2c";
>> +			compatible = "st,stm32mp15-i2c";
>>  			reg = <0x40013000 0x400>;
>>  			interrupt-names = "event", "error";
>>  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
>> @@ -505,12 +497,13 @@
>>  			resets = <&rcc I2C2_R>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
>> +			st,syscfg-fmp = <&syscfg 0x4 0x2>;
>>  			wakeup-source;
>>  			status = "disabled";
>>  		};
>>  
>>  		i2c3: i2c@40014000 {
>> -			compatible = "st,stm32f7-i2c";
>> +			compatible = "st,stm32mp15-i2c";
>>  			reg = <0x40014000 0x400>;
>>  			interrupt-names = "event", "error";
>>  			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
>> @@ -519,12 +512,13 @@
>>  			resets = <&rcc I2C3_R>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
>> +			st,syscfg-fmp = <&syscfg 0x4 0x4>;
>>  			wakeup-source;
>>  			status = "disabled";
>>  		};
>>  
>>  		i2c5: i2c@40015000 {
>> -			compatible = "st,stm32f7-i2c";
>> +			compatible = "st,stm32mp15-i2c";
>>  			reg = <0x40015000 0x400>;
>>  			interrupt-names = "event", "error";
>>  			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
>> @@ -533,6 +527,7 @@
>>  			resets = <&rcc I2C5_R>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
>> +			st,syscfg-fmp = <&syscfg 0x4 0x10>;
>>  			wakeup-source;
>>  			status = "disabled";
>>  		};
>> @@ -557,14 +552,14 @@
>>  
>>  			dac1: dac@1 {
>>  				compatible = "st,stm32-dac";
>> -				#io-channels-cells = <1>;
>> +				#io-channel-cells = <1>;
>>  				reg = <1>;
>>  				status = "disabled";
>>  			};
>>  
>>  			dac2: dac@2 {
>>  				compatible = "st,stm32-dac";
>> -				#io-channels-cells = <1>;
>> +				#io-channel-cells = <1>;
>>  				reg = <2>;
>>  				status = "disabled";
>>  			};
>> @@ -1139,6 +1134,11 @@
>>  			};
>>  		};
>>  
>> +		pwr_mcu: pwr_mcu@50001014 {
>> +			compatible = "syscon";
>> +			reg = <0x50001014 0x4>;
>> +		};
>> +
>>  		exti: interrupt-controller@5000d000 {
>>  			compatible = "st,stm32mp1-exti", "syscon";
>>  			interrupt-controller;
>> @@ -1395,14 +1395,12 @@
>>  				      "mac-clk-tx",
>>  				      "mac-clk-rx",
>>  				      "eth-ck",
>> -				      "ethstp",
>> -				      "syscfg-clk";
>> +				      "ethstp";
>>  			clocks = <&rcc ETHMAC>,
>>  				 <&rcc ETHTX>,
>>  				 <&rcc ETHRX>,
>>  				 <&rcc ETHCK_K>,
>> -				 <&rcc ETHSTP>,
>> -				 <&rcc SYSCFG>;
>> +				 <&rcc ETHSTP>;
>>  			st,syscon = <&syscfg 0x4>;
>>  			snps,mixed-burst;
>>  			snps,pbl = <2>;
>> @@ -1440,6 +1438,11 @@
>>  			clock-names = "lcd";
>>  			resets = <&rcc LTDC_R>;
>>  			status = "disabled";
>> +
>> +			port {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +			};
>>  		};
>>  
>>  		iwdg2: watchdog@5a002000 {
>> @@ -1495,7 +1498,7 @@
>>  		};
>>  
>>  		i2c4: i2c@5c002000 {
>> -			compatible = "st,stm32f7-i2c";
>> +			compatible = "st,stm32mp15-i2c";
>>  			reg = <0x5c002000 0x400>;
>>  			interrupt-names = "event", "error";
>>  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
>> @@ -1504,6 +1507,7 @@
>>  			resets = <&rcc I2C4_R>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
>> +			st,syscfg-fmp = <&syscfg 0x4 0x8>;
>>  			wakeup-source;
>>  			status = "disabled";
>>  		};
>> @@ -1531,7 +1535,7 @@
>>  		};
>>  
>>  		i2c6: i2c@5c009000 {
>> -			compatible = "st,stm32f7-i2c";
>> +			compatible = "st,stm32mp15-i2c";
>>  			reg = <0x5c009000 0x400>;
>>  			interrupt-names = "event", "error";
>>  			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
>> @@ -1540,6 +1544,7 @@
>>  			resets = <&rcc I2C6_R>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
>> +			st,syscfg-fmp = <&syscfg 0x4 0x20>;
>>  			wakeup-source;
>>  			status = "disabled";
>>  		};
>> @@ -1721,6 +1726,7 @@
>>  			resets = <&rcc MCU_R>;
>>  			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
>>  			st,syscfg-tz = <&rcc 0x000 0x1>;
>> +			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
>>  			status = "disabled";
>>  		};
>>  	};
>> diff --git a/arch/arm/dts/stm32mp157.dtsi b/arch/arm/dts/stm32mp157.dtsi
>> index 3f0a4a91cc..54e73ccea4 100644
>> --- a/arch/arm/dts/stm32mp157.dtsi
>> +++ b/arch/arm/dts/stm32mp157.dtsi
>> @@ -15,7 +15,6 @@
>>  			clocks = <&rcc GPU>, <&rcc GPU_K>;
>>  			clock-names = "bus" ,"core";
>>  			resets = <&rcc GPU_R>;
>> -			status = "disabled";
>>  		};
>>  
>>  		dsi: dsi@5a000000 {
>> @@ -25,7 +24,14 @@
>>  			clock-names = "pclk", "ref", "px_clk";
>>  			resets = <&rcc DSI_R>;
>>  			reset-names = "apb";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>>  			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +			};
>>  		};
>>  	};
>>  };
>> diff --git a/arch/arm/dts/stm32mp157c-dk2.dts b/arch/arm/dts/stm32mp157c-dk2.dts
>> index 7985b80967..9a8a26710a 100644
>> --- a/arch/arm/dts/stm32mp157c-dk2.dts
>> +++ b/arch/arm/dts/stm32mp157c-dk2.dts
>> @@ -27,15 +27,10 @@
>>  };
>>  
>>  &dsi {
>> -	#address-cells = <1>;
>> -	#size-cells = <0>;
>>  	status = "okay";
>>  	phy-dsi-supply = <&reg18>;
>>  
>>  	ports {
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -
>>  		port@0 {
>>  			reg = <0>;
>>  			dsi_in: endpoint {
>> @@ -83,9 +78,6 @@
>>  	status = "okay";
>>  
>>  	port {
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -
>>  		ltdc_ep1_out: endpoint@1 {
>>  			reg = <1>;
>>  			remote-endpoint = <&dsi_in>;
>> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
>> index 186dc46754..c3a43c1423 100644
>> --- a/arch/arm/dts/stm32mp157c-ed1.dts
>> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
>> @@ -126,13 +126,12 @@
>>  
>>  &gpu {
>>  	contiguous-area = <&gpu_reserved>;
>> -	status = "okay";
>>  };
>>  
>>  &i2c4 {
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-0 = <&i2c4_pins_a>;
>> -	pinctrl-1 = <&i2c4_pins_sleep_a>;
>> +	pinctrl-1 = <&i2c4_sleep_pins_a>;
>>  	i2c-scl-rising-time-ns = <185>;
>>  	i2c-scl-falling-time-ns = <20>;
>>  	clock-frequency = <400000>;
>> @@ -320,6 +319,10 @@
>>  	bus-width = <4>;
>>  	vmmc-supply = <&vdd_sd>;
>>  	vqmmc-supply = <&sd_switch>;
>> +	sd-uhs-sdr12;
>> +	sd-uhs-sdr25;
>> +	sd-uhs-sdr50;
>> +	sd-uhs-ddr50;
>>  	status = "okay";
>>  };
>>  
>> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
>> index 8a4c7ff31a..b19056557e 100644
>> --- a/arch/arm/dts/stm32mp157c-ev1.dts
>> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
>> @@ -98,15 +98,10 @@
>>  };
>>  
>>  &dsi {
>> -	#address-cells = <1>;
>> -	#size-cells = <0>;
>>  	phy-dsi-supply = <&reg18>;
>>  	status = "okay";
>>  
>>  	ports {
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -
>>  		port@0 {
>>  			reg = <0>;
>>  			dsi_in: endpoint {
>> @@ -141,7 +136,7 @@
>>  &ethernet0 {
>>  	status = "okay";
>>  	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
>> -	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
>> +	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
>>  	pinctrl-names = "default", "sleep";
>>  	phy-mode = "rgmii-id";
>>  	max-speed = <1000>;
>> @@ -176,7 +171,7 @@
>>  &i2c2 {
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-0 = <&i2c2_pins_a>;
>> -	pinctrl-1 = <&i2c2_pins_sleep_a>;
>> +	pinctrl-1 = <&i2c2_sleep_pins_a>;
>>  	i2c-scl-rising-time-ns = <185>;
>>  	i2c-scl-falling-time-ns = <20>;
>>  	status = "okay";
>> @@ -230,7 +225,7 @@
>>  &i2c5 {
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-0 = <&i2c5_pins_a>;
>> -	pinctrl-1 = <&i2c5_pins_sleep_a>;
>> +	pinctrl-1 = <&i2c5_sleep_pins_a>;
>>  	i2c-scl-rising-time-ns = <185>;
>>  	i2c-scl-falling-time-ns = <20>;
>>  	status = "okay";
>> @@ -240,9 +235,6 @@
>>  	status = "okay";
>>  
>>  	port {
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -
>>  		ltdc_ep0_out: endpoint@0 {
>>  			reg = <0>;
>>  			remote-endpoint = <&dsi_in>;
>> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
>> index 7589c6f9dc..05cafb79b3 100644
>> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
>> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
>> @@ -112,14 +112,18 @@
>>  &cec {
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-0 = <&cec_pins_b>;
>> -	pinctrl-1 = <&cec_pins_sleep_b>;
>> +	pinctrl-1 = <&cec_sleep_pins_b>;
>> +	status = "okay";
>> +};
>> +
>> +&dts {
>>  	status = "okay";
>>  };
>>  
>>  &ethernet0 {
>>  	status = "okay";
>>  	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
>> -	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
>> +	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
>>  	pinctrl-names = "default", "sleep";
>>  	phy-mode = "rgmii-id";
>>  	max-speed = <1000>;
>> @@ -137,13 +141,12 @@
>>  
>>  &gpu {
>>  	contiguous-area = <&gpu_reserved>;
>> -	status = "okay";
>>  };
>>  
>>  &i2c1 {
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-0 = <&i2c1_pins_a>;
>> -	pinctrl-1 = <&i2c1_pins_sleep_a>;
>> +	pinctrl-1 = <&i2c1_sleep_pins_a>;
>>  	i2c-scl-rising-time-ns = <100>;
>>  	i2c-scl-falling-time-ns = <7>;
>>  	status = "okay";
>> @@ -218,7 +221,7 @@
>>  &i2c4 {
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-0 = <&i2c4_pins_a>;
>> -	pinctrl-1 = <&i2c4_pins_sleep_a>;
>> +	pinctrl-1 = <&i2c4_sleep_pins_a>;
>>  	i2c-scl-rising-time-ns = <185>;
>>  	i2c-scl-falling-time-ns = <20>;
>>  	clock-frequency = <400000>;
>> @@ -385,7 +388,7 @@
>>  	clock-names = "pclk", "i2sclk", "x8k", "x11k";
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-0 = <&i2s2_pins_a>;
>> -	pinctrl-1 = <&i2s2_pins_sleep_a>;
>> +	pinctrl-1 = <&i2s2_sleep_pins_a>;
>>  	status = "okay";
>>  
>>  	i2s2_port: port {
>> @@ -409,13 +412,10 @@
>>  &ltdc {
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-0 = <&ltdc_pins_a>;
>> -	pinctrl-1 = <&ltdc_pins_sleep_a>;
>> +	pinctrl-1 = <&ltdc_sleep_pins_a>;
>>  	status = "okay";
>>  
>>  	port {
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -
>>  		ltdc_ep0_out: endpoint@0 {
>>  			reg = <0>;
>>  			remote-endpoint = <&sii9022_in>;
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
Applied to u-boot-stm/master

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
