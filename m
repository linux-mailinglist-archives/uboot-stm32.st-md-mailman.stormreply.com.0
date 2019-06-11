Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E13C525
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 09:31:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5442CE6A3D
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 07:31:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DD98C07A27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 07:31:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B7VPjT032228; Tue, 11 Jun 2019 09:31:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=b2jXa82MCuNrNrcVPLPsiq+1ZbAlRvlthhrVXOsWQaw=;
 b=jXM9/j/LP4jizGnStWuSWUjuZjV8vzwguuQ4tLY/83wiQ8qJZMie6VxF6FBEEylxSNLL
 jIXoigYg7S0SUuuxliKtupLH7LQHJQdDJ/seydDUI6hPjl9i67m+yIaRekv2HHcutpA6
 oBK8a/1tyG909oCIXBfYawtOJqWY2zeBUY7f9xg9K5N+rWvL8Wo++PGppW+dIKf6V5zS
 l16kwS9ybNe9VMdrCYPtkNm8CxckN7i2QH+2vcoo8O1EoA5Y+0ZUyXJX9zD3fBLjglFZ
 n5qqS5rcUAsDgzm0cK1S1jh2qKlCW/yuPDB/nDEeDy1BYoKpw5xWVJKG1LiFo3Na8Z+G Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t26rjrddm-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 11 Jun 2019 09:31:47 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D104638;
 Tue, 11 Jun 2019 07:31:46 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B46DA160F;
 Tue, 11 Jun 2019 07:31:46 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 11 Jun
 2019 09:31:46 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 11 Jun 2019 09:31:46 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Christophe KERELLO <christophe.kerello@st.com>,
 "trini@konsulko.com" <trini@konsulko.com>
Thread-Topic: [PATCH v2 1/3] arm: dts: stm32mp157: Add missing pinctrl
 definitions
Thread-Index: AQHVALyirt6KxGkowkCAQQAdbrPQ7qaWLGYA
Date: Tue, 11 Jun 2019 07:31:46 +0000
Message-ID: <31c18d6e-c4ba-64a0-d70f-f64c43f85d5f@st.com>
References: <20190502075645.19901-1-manivannan.sadhasivam@linaro.org>
 <20190502075645.19901-2-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190502075645.19901-2-manivannan.sadhasivam@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <2474BA82DF26B14A9220524D79545526@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_03:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] arm: dts: stm32mp157: Add missing
 pinctrl definitions
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



On 5/2/19 9:56 AM, Manivannan Sadhasivam wrote:
> Add missing pinctrl definitions for STM32MP157.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/dts/stm32mp157-pinctrl.dtsi | 63 ++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> index 0aae69b0a04..200d2c00c5f 100644
> --- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> @@ -220,6 +220,16 @@
>  				};
>  			};
>  
> +			i2c1_pins_b: i2c1-1 {
> +				pins {
> +					pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
> +						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
> +					bias-disable;
> +					drive-open-drain;
> +					slew-rate = <0>;
> +				};
> +			};
> +
>  			i2c2_pins_a: i2c2-0 {
>  				pins {
>  					pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
> @@ -230,6 +240,16 @@
>  				};
>  			};
>  
> +			i2c2_pins_b: i2c2-1 {
> +				pins {
> +					pinmux = <STM32_PINMUX('Z', 0, AF3)>, /* I2C2_SCL */
> +						 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
> +					bias-disable;
> +					drive-open-drain;
> +					slew-rate = <0>;
> +				};
> +			};
> +
>  			i2c5_pins_a: i2c5-0 {
>  				pins {
>  					pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
> @@ -375,6 +395,21 @@
>  				};
>  			};
>  
> +			spi2_pins_a: spi2-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
> +						 <STM32_PINMUX('I', 0, AF5)>, /* SPI2_NSS */
> +						 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
> +					bias-disable;
> +					drive-push-pull;
> +					slew-rate = <3>;
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
> +					bias-disable;
> +				};
> +			};
> +
>  			stusb1600_pins_a: stusb1600-0 {
>  				pins {
>  					pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
> @@ -395,6 +430,34 @@
>  				};
>  			};
>  
> +			uart4_pins_b: uart4-1 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
> +					bias-disable;
> +					drive-push-pull;
> +					slew-rate = <0>;
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> +					bias-disable;
> +				};
> +			};
> +
> +			uart7_pins_a: uart7-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
> +					bias-disable;
> +					drive-push-pull;
> +					slew-rate = <0>;
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
> +						 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
> +						 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
> +					bias-disable;
> +				};
> +			};
> +
>  			usbotg_hs_pins_a: usbotg_hs-0 {
>  				pins {
>  					pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
> 

Applied

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
