Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1433584FC
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Apr 2021 15:41:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4042C56639;
	Thu,  8 Apr 2021 13:41:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD1F8C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 13:41:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138DVUQd016541; Thu, 8 Apr 2021 15:41:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oIa/YAnOIKzPqtj1DLH6SjeY6+5DMFTCJvut1z+7DKw=;
 b=f6CjhVso5gcfrYKqfQ/6dlnPf2RKDpafGuxtEzLKtYPRRozNsUVqxS0OpKKGd4S/xdBn
 0aqp+PMM1I+WKcIiTjXAFajZS46eb0j9d+zO3NhdaGPN5tpoUCv8HYFhyGq33/1mzfx1
 1BwiuyLwlLGDlFPKdPSuI93J9uLg+mlVND86ifhpDJlYFf8Kfn5ifQQsLuXtMxWbrXSd
 F4/yn/dxcQg0+L4uzhwpGPgFnx0A1EYJx7WzMblH6dg2bh+UFyyT9HKxOSTLrRg8aq9T
 Hyb+abKixY+T2EIxI0UwKcrgaAPU7obW1Hw6oq5e2Rjx+gykpjSvIPqfjTS9LA0/BYOG PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37sw5yt81h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 15:41:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94AFA10002A;
 Thu,  8 Apr 2021 15:41:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 05A6E237043;
 Thu,  8 Apr 2021 15:41:12 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Apr
 2021 15:41:11 +0200
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <sjg@chromium.org>
References: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
 <1617352961-20550-3-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <a2c1ab61-8c4c-d8a7-3654-f1a437396d20@foss.st.com>
Date: Thu, 8 Apr 2021 15:41:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617352961-20550-3-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v4 2/7] ARM: dts: stm32: introduce
 stm32h7-pinctrl.dtsi to support stm32h750
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

Hi Dillon

On 4/2/21 10:42 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> This patch is intend to add support stm32h750 value line,
> just add stm32h7-pinctrl.dtsi for extending, with following changes:
> 
> - rename stm32h743-pinctrl.dtsi to stm32h7-pinctrl.dtsi
> - move 'pin-controller' from stm32h7-pinctrl.dtsi to stm32h743.dtsi
> - update stm32h743i-{disco, eval}.dts to include stm32h7-pinctrl.dtsi
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> v4: sync with kernel side commit
> link:
> https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git/commit/?h=stm32-dt-for-v5.13&id=d3f715e63f2d6ff98fd4426015847f3442b8805f
> 
>  arch/arm/dts/stm32h7-pinctrl.dtsi   | 185 ++++++++++++++++++++++
>  arch/arm/dts/stm32h743-pinctrl.dtsi | 306 ------------------------------------
>  arch/arm/dts/stm32h743.dtsi         | 142 +++++++++++++++++
>  arch/arm/dts/stm32h743i-disco.dts   |   2 +-
>  arch/arm/dts/stm32h743i-eval.dts    |   2 +-
>  5 files changed, 329 insertions(+), 308 deletions(-)
>  create mode 100644 arch/arm/dts/stm32h7-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32h743-pinctrl.dtsi
> 
> diff --git a/arch/arm/dts/stm32h7-pinctrl.dtsi b/arch/arm/dts/stm32h7-pinctrl.dtsi
> new file mode 100644
> index 0000000..f6968b5
> --- /dev/null
> +++ b/arch/arm/dts/stm32h7-pinctrl.dtsi
> @@ -0,0 +1,185 @@
> +/*
> + * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <dt-bindings/pinctrl/stm32-pinfunc.h>
> +
> +&pinctrl {
> +
> +	i2c1_pins_a: i2c1-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 6, AF4)>, /* I2C1_SCL */
> +				 <STM32_PINMUX('B', 7, AF4)>; /* I2C1_SDA */
> +			bias-disable;
> +			drive-open-drain;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	ethernet_rmii: rmii-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('G', 11, AF11)>,
> +				 <STM32_PINMUX('G', 13, AF11)>,
> +				 <STM32_PINMUX('G', 12, AF11)>,
> +				 <STM32_PINMUX('C', 4, AF11)>,
> +				 <STM32_PINMUX('C', 5, AF11)>,
> +				 <STM32_PINMUX('A', 7, AF11)>,
> +				 <STM32_PINMUX('C', 1, AF11)>,
> +				 <STM32_PINMUX('A', 2, AF11)>,
> +				 <STM32_PINMUX('A', 1, AF11)>;
> +			slew-rate = <2>;
> +		};
> +	};
> +
> +	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
> +				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> +			slew-rate = <3>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> +			slew-rate = <3>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +		pins2{
> +			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> +			slew-rate = <3>;
> +			drive-open-drain;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
> +				 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
> +				 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
> +		};
> +	};
> +
> +	sdmmc1_dir_pins_a: sdmmc1-dir-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('C', 6, AF8)>, /* SDMMC1_D0DIR */
> +				 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
> +				 <STM32_PINMUX('B', 9, AF7)>; /* SDMMC1_CDIR */
> +			slew-rate = <3>;
> +			drive-push-pull;
> +			bias-pull-up;
> +		};
> +		pins2{
> +			pinmux = <STM32_PINMUX('B', 8, AF7)>; /* SDMMC1_CKIN */
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC1_D0DIR */
> +				 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
> +				 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
> +				 <STM32_PINMUX('B', 8, ANALOG)>; /* SDMMC1_CKIN */
> +		};
> +	};
> +
> +	usart1_pins: usart1-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 15, AF4)>; /* USART1_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	usart2_pins: usart2-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <0>;
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
> +			bias-disable;
> +		};
> +	};
> +
> +	usbotg_hs_pins_a: usbotg-hs-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('H', 4, AF10)>,	/* ULPI_NXT */
> +					 <STM32_PINMUX('I', 11, AF10)>, /* ULPI_DIR> */
> +					 <STM32_PINMUX('C', 0, AF10)>,	/* ULPI_STP> */
> +					 <STM32_PINMUX('A', 5, AF10)>,	/* ULPI_CK> */
> +					 <STM32_PINMUX('A', 3, AF10)>,	/* ULPI_D0> */
> +					 <STM32_PINMUX('B', 0, AF10)>,	/* ULPI_D1> */
> +					 <STM32_PINMUX('B', 1, AF10)>,	/* ULPI_D2> */
> +					 <STM32_PINMUX('B', 10, AF10)>, /* ULPI_D3> */
> +					 <STM32_PINMUX('B', 11, AF10)>, /* ULPI_D4> */
> +					 <STM32_PINMUX('B', 12, AF10)>, /* ULPI_D5> */
> +					 <STM32_PINMUX('B', 13, AF10)>, /* ULPI_D6> */
> +					 <STM32_PINMUX('B', 5, AF10)>;	/* ULPI_D7> */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/dts/stm32h743-pinctrl.dtsi b/arch/arm/dts/stm32h743-pinctrl.dtsi
> deleted file mode 100644
> index 141083f..0000000
> --- a/arch/arm/dts/stm32h743-pinctrl.dtsi
> +++ /dev/null
> @@ -1,306 +0,0 @@
> -/*
> - * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
> - *
> - * This file is dual-licensed: you can use it either under the terms
> - * of the GPL or the X11 license, at your option. Note that this dual
> - * licensing only applies to this file, and not this project as a
> - * whole.
> - *
> - *  a) This file is free software; you can redistribute it and/or
> - *     modify it under the terms of the GNU General Public License as
> - *     published by the Free Software Foundation; either version 2 of the
> - *     License, or (at your option) any later version.
> - *
> - *     This file is distributed in the hope that it will be useful,
> - *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *     GNU General Public License for more details.
> - *
> - * Or, alternatively,
> - *
> - *  b) Permission is hereby granted, free of charge, to any person
> - *     obtaining a copy of this software and associated documentation
> - *     files (the "Software"), to deal in the Software without
> - *     restriction, including without limitation the rights to use,
> - *     copy, modify, merge, publish, distribute, sublicense, and/or
> - *     sell copies of the Software, and to permit persons to whom the
> - *     Software is furnished to do so, subject to the following
> - *     conditions:
> - *
> - *     The above copyright notice and this permission notice shall be
> - *     included in all copies or substantial portions of the Software.
> - *
> - *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> - *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> - *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> - *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> - *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - *     OTHER DEALINGS IN THE SOFTWARE.
> - */
> -
> -#include <dt-bindings/pinctrl/stm32-pinfunc.h>
> -
> -/ {
> -	soc {
> -		pinctrl: pin-controller {
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			compatible = "st,stm32h743-pinctrl";
> -			ranges = <0 0x58020000 0x3000>;
> -			interrupt-parent = <&exti>;
> -			st,syscfg = <&syscfg 0x8>;
> -			pins-are-numbered;
> -
> -			gpioa: gpio@58020000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x0 0x400>;
> -				clocks = <&rcc GPIOA_CK>;
> -				st,bank-name = "GPIOA";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpiob: gpio@58020400 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x400 0x400>;
> -				clocks = <&rcc GPIOB_CK>;
> -				st,bank-name = "GPIOB";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpioc: gpio@58020800 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x800 0x400>;
> -				clocks = <&rcc GPIOC_CK>;
> -				st,bank-name = "GPIOC";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpiod: gpio@58020c00 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0xc00 0x400>;
> -				clocks = <&rcc GPIOD_CK>;
> -				st,bank-name = "GPIOD";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpioe: gpio@58021000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x1000 0x400>;
> -				clocks = <&rcc GPIOE_CK>;
> -				st,bank-name = "GPIOE";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpiof: gpio@58021400 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x1400 0x400>;
> -				clocks = <&rcc GPIOF_CK>;
> -				st,bank-name = "GPIOF";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpiog: gpio@58021800 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x1800 0x400>;
> -				clocks = <&rcc GPIOG_CK>;
> -				st,bank-name = "GPIOG";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpioh: gpio@58021c00 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x1c00 0x400>;
> -				clocks = <&rcc GPIOH_CK>;
> -				st,bank-name = "GPIOH";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpioi: gpio@58022000 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x2000 0x400>;
> -				clocks = <&rcc GPIOI_CK>;
> -				st,bank-name = "GPIOI";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpioj: gpio@58022400 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x2400 0x400>;
> -				clocks = <&rcc GPIOJ_CK>;
> -				st,bank-name = "GPIOJ";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			gpiok: gpio@58022800 {
> -				gpio-controller;
> -				#gpio-cells = <2>;
> -				reg = <0x2800 0x400>;
> -				clocks = <&rcc GPIOK_CK>;
> -				st,bank-name = "GPIOK";
> -				interrupt-controller;
> -				#interrupt-cells = <2>;
> -			};
> -
> -			i2c1_pins_a: i2c1-0 {
> -				pins {
> -					pinmux = <STM32_PINMUX('B', 6, AF4)>, /* I2C1_SCL */
> -						 <STM32_PINMUX('B', 7, AF4)>; /* I2C1_SDA */
> -					bias-disable;
> -					drive-open-drain;
> -					slew-rate = <0>;
> -				};
> -			};
> -
> -			ethernet_rmii: rmii-0 {
> -				pins {
> -					pinmux = <STM32_PINMUX('G', 11, AF11)>,
> -						 <STM32_PINMUX('G', 13, AF11)>,
> -						 <STM32_PINMUX('G', 12, AF11)>,
> -						 <STM32_PINMUX('C', 4, AF11)>,
> -						 <STM32_PINMUX('C', 5, AF11)>,
> -						 <STM32_PINMUX('A', 7, AF11)>,
> -						 <STM32_PINMUX('C', 1, AF11)>,
> -						 <STM32_PINMUX('A', 2, AF11)>,
> -						 <STM32_PINMUX('A', 1, AF11)>;
> -					slew-rate = <2>;
> -				};
> -			};
> -
> -			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
> -				pins {
> -					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> -						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> -						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> -						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> -						 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
> -						 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> -					slew-rate = <3>;
> -					drive-push-pull;
> -					bias-disable;
> -				};
> -			};
> -
> -			sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
> -				pins1 {
> -					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> -						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> -						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> -						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> -						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> -					slew-rate = <3>;
> -					drive-push-pull;
> -					bias-disable;
> -				};
> -				pins2{
> -					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> -					slew-rate = <3>;
> -					drive-open-drain;
> -					bias-disable;
> -				};
> -			};
> -
> -			sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
> -				pins {
> -					pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> -						 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
> -						 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
> -						 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
> -						 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
> -						 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
> -				};
> -			};
> -
> -			sdmmc1_dir_pins_a: sdmmc1-dir-0 {
> -				pins1 {
> -					pinmux = <STM32_PINMUX('C', 6, AF8)>, /* SDMMC1_D0DIR */
> -						 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
> -						 <STM32_PINMUX('B', 9, AF7)>; /* SDMMC1_CDIR */
> -					slew-rate = <3>;
> -					drive-push-pull;
> -					bias-pull-up;
> -				};
> -				pins2{
> -					pinmux = <STM32_PINMUX('B', 8, AF7)>; /* SDMMC1_CKIN */
> -					bias-pull-up;
> -				};
> -			};
> -
> -			sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
> -				pins {
> -					pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC1_D0DIR */
> -						 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
> -						 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
> -						 <STM32_PINMUX('B', 8, ANALOG)>; /* SDMMC1_CKIN */
> -				};
> -			};
> -
> -			usart1_pins: usart1-0 {
> -				pins1 {
> -					pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
> -					bias-disable;
> -					drive-push-pull;
> -					slew-rate = <0>;
> -				};
> -				pins2 {
> -					pinmux = <STM32_PINMUX('B', 15, AF4)>; /* USART1_RX */
> -					bias-disable;
> -				};
> -			};
> -
> -			usart2_pins: usart2-0 {
> -				pins1 {
> -					pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
> -					bias-disable;
> -					drive-push-pull;
> -					slew-rate = <0>;
> -				};
> -				pins2 {
> -					pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
> -					bias-disable;
> -				};
> -			};
> -
> -			usbotg_hs_pins_a: usbotg-hs-0 {
> -				pins {
> -					pinmux = <STM32_PINMUX('H', 4, AF10)>,	/* ULPI_NXT */
> -							 <STM32_PINMUX('I', 11, AF10)>, /* ULPI_DIR> */
> -							 <STM32_PINMUX('C', 0, AF10)>,	/* ULPI_STP> */
> -							 <STM32_PINMUX('A', 5, AF10)>,	/* ULPI_CK> */
> -							 <STM32_PINMUX('A', 3, AF10)>,	/* ULPI_D0> */
> -							 <STM32_PINMUX('B', 0, AF10)>,	/* ULPI_D1> */
> -							 <STM32_PINMUX('B', 1, AF10)>,	/* ULPI_D2> */
> -							 <STM32_PINMUX('B', 10, AF10)>, /* ULPI_D3> */
> -							 <STM32_PINMUX('B', 11, AF10)>, /* ULPI_D4> */
> -							 <STM32_PINMUX('B', 12, AF10)>, /* ULPI_D5> */
> -							 <STM32_PINMUX('B', 13, AF10)>, /* ULPI_D6> */
> -							 <STM32_PINMUX('B', 5, AF10)>;	/* ULPI_D7> */
> -					bias-disable;
> -					drive-push-pull;
> -					slew-rate = <2>;
> -				};
> -			};
> -		};
> -	};
> -};
> diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
> index e4e4723..8c96698 100644
> --- a/arch/arm/dts/stm32h743.dtsi
> +++ b/arch/arm/dts/stm32h743.dtsi
> @@ -519,6 +519,148 @@
>  			snps,pbl = <8>;
>  			status = "disabled";
>  		};
> +
> +		pinctrl: pin-controller@58020000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "st,stm32h743-pinctrl";
> +			ranges = <0 0x58020000 0x3000>;
> +			interrupt-parent = <&exti>;
> +			st,syscfg = <&syscfg 0x8>;
> +			pins-are-numbered;
> +
> +			gpioa: gpio@58020000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x0 0x400>;
> +				clocks = <&rcc GPIOA_CK>;
> +				st,bank-name = "GPIOA";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 0 16>;
> +			};
> +
> +			gpiob: gpio@58020400 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x400 0x400>;
> +				clocks = <&rcc GPIOB_CK>;
> +				st,bank-name = "GPIOB";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 16 16>;
> +			};
> +
> +			gpioc: gpio@58020800 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x800 0x400>;
> +				clocks = <&rcc GPIOC_CK>;
> +				st,bank-name = "GPIOC";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 32 16>;
> +			};
> +
> +			gpiod: gpio@58020c00 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0xc00 0x400>;
> +				clocks = <&rcc GPIOD_CK>;
> +				st,bank-name = "GPIOD";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 48 16>;
> +			};
> +
> +			gpioe: gpio@58021000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x1000 0x400>;
> +				clocks = <&rcc GPIOE_CK>;
> +				st,bank-name = "GPIOE";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 64 16>;
> +			};
> +
> +			gpiof: gpio@58021400 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x1400 0x400>;
> +				clocks = <&rcc GPIOF_CK>;
> +				st,bank-name = "GPIOF";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 80 16>;
> +			};
> +
> +			gpiog: gpio@58021800 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x1800 0x400>;
> +				clocks = <&rcc GPIOG_CK>;
> +				st,bank-name = "GPIOG";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 96 16>;
> +			};
> +
> +			gpioh: gpio@58021c00 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x1c00 0x400>;
> +				clocks = <&rcc GPIOH_CK>;
> +				st,bank-name = "GPIOH";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 112 16>;
> +			};
> +
> +			gpioi: gpio@58022000 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x2000 0x400>;
> +				clocks = <&rcc GPIOI_CK>;
> +				st,bank-name = "GPIOI";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 128 16>;
> +			};
> +
> +			gpioj: gpio@58022400 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x2400 0x400>;
> +				clocks = <&rcc GPIOJ_CK>;
> +				st,bank-name = "GPIOJ";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 144 16>;
> +			};
> +
> +			gpiok: gpio@58022800 {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x2800 0x400>;
> +				clocks = <&rcc GPIOK_CK>;
> +				st,bank-name = "GPIOK";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				ngpios = <8>;
> +				gpio-ranges = <&pinctrl 0 160 8>;
> +			};
> +		};
>  	};
>  };
>  
> diff --git a/arch/arm/dts/stm32h743i-disco.dts b/arch/arm/dts/stm32h743i-disco.dts
> index 7927310..3a01ebd 100644
> --- a/arch/arm/dts/stm32h743i-disco.dts
> +++ b/arch/arm/dts/stm32h743i-disco.dts
> @@ -6,7 +6,7 @@
>  
>  /dts-v1/;
>  #include "stm32h743.dtsi"
> -#include "stm32h743-pinctrl.dtsi"
> +#include "stm32h7-pinctrl.dtsi"
>  
>  / {
>  	model = "STMicroelectronics STM32H743i-Discovery board";
> diff --git a/arch/arm/dts/stm32h743i-eval.dts b/arch/arm/dts/stm32h743i-eval.dts
> index 8f39817..38cc7fa 100644
> --- a/arch/arm/dts/stm32h743i-eval.dts
> +++ b/arch/arm/dts/stm32h743i-eval.dts
> @@ -42,7 +42,7 @@
>  
>  /dts-v1/;
>  #include "stm32h743.dtsi"
> -#include "stm32h743-pinctrl.dtsi"
> +#include "stm32h7-pinctrl.dtsi"
>  
>  / {
>  	model = "STMicroelectronics STM32H743i-EVAL board";
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
