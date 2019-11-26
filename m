Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCC9109AB4
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 10:07:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14452C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:07:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 269B2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 09:07:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ94B6E021453
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 26 Nov 2019 10:07:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=FphZj0KocMpaFcfvzEkB5fxBRtLmOO2qkWcFAw5xCxI=;
 b=eEV8PFNzU+prB05nAcELOJrFUYfZpxX0XSfDRPSMIY3lNPitCqYOG9N5UuUOgJPKi7YQ
 e0qfEL/EVzcpJgaBn6pwMzWUCwczw7VHBh2f7DNSk2nRp/WBCXMhVOG7mDBGz7yTOMYf
 AOmr+wFpQteV+Zj/jPLJJg7N2iEqm7Yn8cN+gh04BDVzBMUtDWNm+Fx7fotmfcSdDuIR
 3fZerv8DWs3UjbvGMUt/ltvE/MufYJEDyD7zDLR/wx5eCTcgbwW9xSq/LrhY1rL4hi9s
 a35rdML+uamk2q7WFHHPQpTYOWpxzfTJrGTFI4XqmcIXLMxFWfnZptJG3gBSQ6ZuB1Sj zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wevhjp1fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 26 Nov 2019 10:07:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AB4C100038
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 10:07:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32AFE2AD9D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 10:07:10 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Nov
 2019 10:07:09 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 26 Nov 2019 10:07:09 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: update eMMC
 configuration for stm32mp157c-ev1
Thread-Index: AQHVpDjigRcV4MoDK0WTizIHpKrB8w==
Date: Tue, 26 Nov 2019 09:07:09 +0000
Message-ID: <c0c56c10-5046-b17e-7d73-e788a49e2cea@st.com>
References: <20191106151634.7834-1-patrick.delaunay@st.com>
 <20191106151634.7834-4-patrick.delaunay@st.com>
In-Reply-To: <20191106151634.7834-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <F063E38EE0815947ABD00D2FC7574CFC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-26,2019-11-26 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: update eMMC
 configuration for stm32mp157c-ev1
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
> Update the sdmmc2 node for eMMC support on eval board stm32mp157c-ev1.
> - update slew-rate for pin configuration
> - update "vqmmc-supply"
> - remove "st,sig-dir"
> - add mandatory "pinctrl-names"
> - add "mmc-ddr-3_3v"
>
> This patch solve the eMMC detection issue for command "mmc dev 1".
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp157-pinctrl.dtsi          | 57 +++++++++++++++++--
>  .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi |  5 +-
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |  5 +-
>  arch/arm/dts/stm32mp157c-ed1.dts              |  7 ++-
>  4 files changed, 66 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> index 2d73d502d9..0d53396119 100644
> --- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> @@ -812,31 +812,80 @@
>  			};
>  
>  			sdmmc2_b4_pins_a: sdmmc2-b4-0 {
> -				pins {
> +				pins1 {
>  					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
>  						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
>  						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
>  						 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
> -						 <STM32_PINMUX('E', 3, AF9)>, /* SDMMC2_CK */
>  						 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
> -					slew-rate = <3>;
> +					slew-rate = <1>;
> +					drive-push-pull;
> +					bias-pull-up;
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
> +					slew-rate = <2>;
>  					drive-push-pull;
>  					bias-pull-up;
>  				};
>  			};
>  
> +			sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
> +						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
> +						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
> +						 <STM32_PINMUX('B', 4, AF9)>; /* SDMMC2_D3 */
> +					slew-rate = <1>;
> +					drive-push-pull;
> +					bias-pull-up;
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
> +					slew-rate = <2>;
> +					drive-push-pull;
> +					bias-pull-up;
> +				};
> +				pins3 {
> +					pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
> +					slew-rate = <1>;
> +					drive-open-drain;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
> +						 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
> +						 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
> +						 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
> +						 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
> +						 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
> +				};
> +			};
> +
>  			sdmmc2_d47_pins_a: sdmmc2-d47-0 {
>  				pins {
>  					pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
>  						 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
>  						 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
>  						 <STM32_PINMUX('D', 3, AF9)>; /* SDMMC2_D7 */
> -					slew-rate = <3>;
> +					slew-rate = <1>;
>  					drive-push-pull;
>  					bias-pull-up;
>  				};
>  			};
>  
> +			sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
> +						 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
> +						 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
> +						 <STM32_PINMUX('D', 3, ANALOG)>; /* SDMMC2_D7 */
> +				};
> +			};
> +
>  			spdifrx_pins_a: spdifrx-0 {
>  				pins {
>  					pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
> diff --git a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> index 1ff681afb8..1104a70a65 100644
> --- a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> @@ -155,7 +155,10 @@
>  
>  &sdmmc2_b4_pins_a {
>  	u-boot,dm-spl;
> -	pins {
> +	pins1 {
> +		u-boot,dm-spl;
> +	};
> +	pins2 {
>  		u-boot,dm-spl;
>  	};
>  };
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index 4953a0db55..b2ac49472a 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -174,7 +174,10 @@
>  
>  &sdmmc2_b4_pins_a {
>  	u-boot,dm-spl;
> -	pins {
> +	pins1 {
> +		u-boot,dm-spl;
> +	};
> +	pins2 {
>  		u-boot,dm-spl;
>  	};
>  };
> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
> index 73d07cf42f..bc4d7e1ab5 100644
> --- a/arch/arm/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
> @@ -294,15 +294,18 @@
>  };
>  
>  &sdmmc2 {
> +	pinctrl-names = "default", "opendrain", "sleep";
>  	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
> +	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
>  	non-removable;
>  	no-sd;
>  	no-sdio;
> -	st,sig-dir;
>  	st,neg-edge;
>  	bus-width = <8>;
>  	vmmc-supply = <&v3v3>;
> -	vqmmc-supply = <&vdd>;
> +	vqmmc-supply = <&v3v3>;
> +	mmc-ddr-3_3v;
>  	status = "okay";
>  };
>  


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
