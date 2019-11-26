Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45724109D5B
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 12:56:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAD08C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 11:55:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89EEAC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 09:07:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ91JN6022788; Tue, 26 Nov 2019 10:06:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=JpVF+gFJve0F3dUGJ1wfnICdcpSKmjiCMl97Q3pdU9A=;
 b=rin1lBw5zObyZl2unW2O7ovPGb6qGi62qACghvqRKWRClO2PLXrl0RkxQeiGBJHWA49f
 S0o5rMZOht6KT3rLpOuxdIFdSh6j8rHOQ0tKbt2nzOmGrWaZQm/bVaFcilsMhf1JnNMk
 8dHGz+1hl/G0gC6DpojnK51iiseAodFR+ixbLga66AZtEwhYiWRJILHKbYwphrL3n6G1
 qDpQNxCBy74+Z+nT4Msfx79M8I45+Cv+HNc46nQduEiofnZhMyByjO6kHhg/DVLpunWH
 Z/6O5hAblZo9AdbKD9ODGNDyMcLQ3Hllb7DkqzjpEWDkEH1EEhO1pd8Ku6ZSx337Sckk 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9payb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 10:06:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACFD5100034;
 Tue, 26 Nov 2019 10:06:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4FD192ACE72;
 Tue, 26 Nov 2019 10:06:49 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Nov
 2019 10:06:48 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 26 Nov 2019 10:06:48 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/3] ARM: dts: stm32: DT alignment with kernel v5.3
Thread-Index: AQHVlLU0jmCTqnSqNky5RtcMhSHOb6edN3wA
Date: Tue, 26 Nov 2019 09:06:48 +0000
Message-ID: <e6f8fb7e-f401-380d-1f60-b01a45fc115e@st.com>
References: <20191106151634.7834-1-patrick.delaunay@st.com>
 <20191106151634.7834-2-patrick.delaunay@st.com>
In-Reply-To: <20191106151634.7834-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <88735B947DC88145B320305B5674A701@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-26,2019-11-26 signatures=0
X-Mailman-Approved-At: Tue, 26 Nov 2019 11:55:59 +0000
Cc: Tom Rini <trini@konsulko.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Rick Chen <rick@andestech.com>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@openedev.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] ARM: dts: stm32: DT alignment with
	kernel v5.3
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
> Device tree and binding alignment with kernel v5.3
> and converted to SPDX.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32429i-eval.dts           |   4 +-
>  arch/arm/dts/stm32746g-eval.dts           | 105 +++++++++++++-------
>  arch/arm/dts/stm32f4-pinctrl.dtsi         |  38 +------
>  arch/arm/dts/stm32f429-disco.dts          |  40 +-------
>  arch/arm/dts/stm32f429-pinctrl.dtsi       |  38 +------
>  arch/arm/dts/stm32f429.dtsi               | 115 +++++++++++++++-------
>  arch/arm/dts/stm32f469-disco.dts          |  39 +-------
>  arch/arm/dts/stm32f469-pinctrl.dtsi       |  39 +-------
>  arch/arm/dts/stm32f469.dtsi               |   2 +-
>  arch/arm/dts/stm32f746-disco.dts          |  39 +-------
>  arch/arm/dts/stm32f746.dtsi               |  42 +-------
>  arch/arm/dts/stm32f769-disco.dts          |  43 ++------
>  arch/arm/dts/stm32h7-u-boot.dtsi          |  41 +-------
>  arch/arm/dts/stm32h743-pinctrl.dtsi       |  83 ++++++++++++++++
>  arch/arm/dts/stm32h743.dtsi               |  69 ++++++-------
>  arch/arm/dts/stm32h743i-disco-u-boot.dtsi |   8 --
>  arch/arm/dts/stm32h743i-disco.dts         |  76 +++++++-------
>  arch/arm/dts/stm32h743i-eval-u-boot.dtsi  |   9 --
>  arch/arm/dts/stm32h743i-eval.dts          |  41 +++++++-
>  arch/arm/dts/stm32mp157c-ed1.dts          |   4 +-
>  include/dt-bindings/clock/stm32fx-clock.h |   9 +-
>  include/dt-bindings/mfd/st,stpmic1.h      |   4 +
>  22 files changed, 377 insertions(+), 511 deletions(-)
>
> diff --git a/arch/arm/dts/stm32429i-eval.dts b/arch/arm/dts/stm32429i-eval.dts
> index 1eec951188..bd41ae3c14 100644
> --- a/arch/arm/dts/stm32429i-eval.dts
> +++ b/arch/arm/dts/stm32429i-eval.dts
> @@ -20,6 +20,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		reg = <0x00000000 0x2000000>;
>  	};
>  
> @@ -72,6 +73,7 @@
>  
>  	gpio_keys {
>  		compatible = "gpio-keys";
> +		#address-cells = <1>;
>  		#size-cells = <0>;
>  		autorepeat;
>  		button@0 {
> @@ -227,7 +229,7 @@
>  	pinctrl-0 = <&sdio_pins>;
>  	pinctrl-1 = <&sdio_pins_od>;
>  	bus-width = <4>;
> -	max-frequency = <14000000>;
> +	max-frequency = <12500000>;
>  };
>  
>  &timers1 {
> diff --git a/arch/arm/dts/stm32746g-eval.dts b/arch/arm/dts/stm32746g-eval.dts
> index 8c081eaf20..d77eb53c6a 100644
> --- a/arch/arm/dts/stm32746g-eval.dts
> +++ b/arch/arm/dts/stm32746g-eval.dts
> @@ -1,49 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2015 - Maxime Coquelin <mcoquelin.stm32@gmail.com>
>   *
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
>   */
>  
>  /dts-v1/;
>  #include "stm32f746.dtsi"
>  #include "stm32f746-pinctrl.dtsi"
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  
>  / {
>  	model = "STMicroelectronics STM32746g-EVAL board";
> @@ -55,6 +20,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		reg = <0xc0000000 0x2000000>;
>  	};
>  
> @@ -68,9 +34,15 @@
>  			gpios = <&gpiof 10 1>;
>  			linux,default-trigger = "heartbeat";
>  		};
> +		orange {
> +			gpios = <&stmfx_pinctrl 17 1>;
> +		};
>  		red {
>  			gpios = <&gpiob 7 1>;
>  		};
> +		blue {
> +			gpios = <&stmfx_pinctrl 19 1>;
> +		};
>  	};
>  
>  	gpio_keys {
> @@ -85,6 +57,43 @@
>  		};
>  	};
>  
> +	joystick {
> +		compatible = "gpio-keys";
> +		#size-cells = <0>;
> +		pinctrl-0 = <&joystick_pins>;
> +		pinctrl-names = "default";
> +		button-0 {
> +			label = "JoySel";
> +			linux,code = <KEY_ENTER>;
> +			interrupt-parent = <&stmfx_pinctrl>;
> +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +		button-1 {
> +			label = "JoyDown";
> +			linux,code = <KEY_DOWN>;
> +			interrupt-parent = <&stmfx_pinctrl>;
> +			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +		button-2 {
> +			label = "JoyLeft";
> +			linux,code = <KEY_LEFT>;
> +			interrupt-parent = <&stmfx_pinctrl>;
> +			interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +		button-3 {
> +			label = "JoyRight";
> +			linux,code = <KEY_RIGHT>;
> +			interrupt-parent = <&stmfx_pinctrl>;
> +			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +		button-4 {
> +			label = "JoyUp";
> +			linux,code = <KEY_UP>;
> +			interrupt-parent = <&stmfx_pinctrl>;
> +			interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +	};
> +
>  	usbotg_hs_phy: usb-phy {
>  		#phy-cells = <0>;
>  		compatible = "usb-nop-xceiv";
> @@ -114,6 +123,28 @@
>  	i2c-scl-rising-time-ns = <185>;
>  	i2c-scl-falling-time-ns = <20>;
>  	status = "okay";
> +
> +	stmfx: stmfx@42 {
> +		compatible = "st,stmfx-0300";
> +		reg = <0x42>;
> +		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-parent = <&gpioi>;
> +
> +		stmfx_pinctrl: stmfx-pin-controller {
> +			compatible = "st,stmfx-0300-pinctrl";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
> +
> +			joystick_pins: joystick {
> +				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
> +				drive-push-pull;
> +				bias-pull-up;
> +			};
> +		};
> +	};
>  };
>  
>  &rtc {
> diff --git a/arch/arm/dts/stm32f4-pinctrl.dtsi b/arch/arm/dts/stm32f4-pinctrl.dtsi
> index 35202896c0..7ed68286ba 100644
> --- a/arch/arm/dts/stm32f4-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32f4-pinctrl.dtsi
> @@ -1,43 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
>   *
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
>   */
>  
>  #include <dt-bindings/pinctrl/stm32-pinfunc.h>
> diff --git a/arch/arm/dts/stm32f429-disco.dts b/arch/arm/dts/stm32f429-disco.dts
> index d99f47aa72..3a83ef5f60 100644
> --- a/arch/arm/dts/stm32f429-disco.dts
> +++ b/arch/arm/dts/stm32f429-disco.dts
> @@ -1,43 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2015 - Maxime Coquelin <mcoquelin.stm32@gmail.com>
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
>   */
>  
>  /dts-v1/;
> @@ -55,6 +18,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		reg = <0x90000000 0x800000>;
>  	};
>  
> diff --git a/arch/arm/dts/stm32f429-pinctrl.dtsi b/arch/arm/dts/stm32f429-pinctrl.dtsi
> index 3e7a17d911..575c7eecab 100644
> --- a/arch/arm/dts/stm32f429-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32f429-pinctrl.dtsi
> @@ -1,43 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
>   *
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
>   */
>  
>  #include "stm32f4-pinctrl.dtsi"
> diff --git a/arch/arm/dts/stm32f429.dtsi b/arch/arm/dts/stm32f429.dtsi
> index c5c029b9e3..ec84ae4f52 100644
> --- a/arch/arm/dts/stm32f429.dtsi
> +++ b/arch/arm/dts/stm32f429.dtsi
> @@ -1,51 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2015 - Maxime Coquelin <mcoquelin.stm32@gmail.com>
>   *
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
>   */
>  
> -#include "skeleton.dtsi"
>  #include "armv7-m.dtsi"
>  #include <dt-bindings/clock/stm32fx-clock.h>
>  #include <dt-bindings/mfd/stm32f4-rcc.h>
>  
>  / {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
>  	clocks {
>  		clk_hse: clk-hse {
>  			#clock-cells = <0>;
> @@ -73,6 +39,19 @@
>  	};
>  
>  	soc {
> +		romem: nvmem@1fff7800 {
> +			compatible = "st,stm32f4-otp";
> +			reg = <0x1fff7800 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ts_cal1: calib@22c {
> +				reg = <0x22c 0x2>;
> +			};
> +			ts_cal2: calib@22e {
> +				reg = <0x22e 0x2>;
> +			};
> +		};
> +
>  		timer2: timer@40000000 {
>  			compatible = "st,stm32-timer";
>  			reg = <0x40000000 0x400>;
> @@ -309,6 +288,26 @@
>  			status = "disabled";
>  		};
>  
> +		spi2: spi@40003800 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32f4-spi";
> +			reg = <0x40003800 0x400>;
> +			interrupts = <36>;
> +			clocks = <&rcc 0 STM32F4_APB1_CLOCK(SPI2)>;
> +			status = "disabled";
> +		};
> +
> +		spi3: spi@40003c00 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32f4-spi";
> +			reg = <0x40003c00 0x400>;
> +			interrupts = <51>;
> +			clocks = <&rcc 0 STM32F4_APB1_CLOCK(SPI3)>;
> +			status = "disabled";
> +		};
> +
>  		usart2: serial@40004400 {
>  			compatible = "st,stm32-uart";
>  			reg = <0x40004400 0x400>;
> @@ -518,6 +517,26 @@
>  			status = "disabled";
>  		};
>  
> +		spi1: spi@40013000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32f4-spi";
> +			reg = <0x40013000 0x400>;
> +			interrupts = <35>;
> +			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SPI1)>;
> +			status = "disabled";
> +		};
> +
> +		spi4: spi@40013400 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32f4-spi";
> +			reg = <0x40013400 0x400>;
> +			interrupts = <84>;
> +			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SPI4)>;
> +			status = "disabled";
> +		};
> +
>  		syscfg: system-config@40013800 {
>  			compatible = "syscon";
>  			reg = <0x40013800 0x400>;
> @@ -582,6 +601,26 @@
>  			};
>  		};
>  
> +		spi5: spi@40015000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32f4-spi";
> +			reg = <0x40015000 0x400>;
> +			interrupts = <85>;
> +			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SPI5)>;
> +			status = "disabled";
> +		};
> +
> +		spi6: spi@40015400 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32f4-spi";
> +			reg = <0x40015400 0x400>;
> +			interrupts = <86>;
> +			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SPI6)>;
> +			status = "disabled";
> +		};
> +
>  		pwrcfg: power-config@40007000 {
>  			compatible = "syscon";
>  			reg = <0x40007000 0x400>;
> diff --git a/arch/arm/dts/stm32f469-disco.dts b/arch/arm/dts/stm32f469-disco.dts
> index 3ceb84d8ba..d50c38dc78 100644
> --- a/arch/arm/dts/stm32f469-disco.dts
> +++ b/arch/arm/dts/stm32f469-disco.dts
> @@ -1,43 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2016 - Lee Jones <lee.jones@linaro.org>
>   *
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
>   */
>  
>  /dts-v1/;
> @@ -56,6 +20,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		reg = <0x00000000 0x1000000>;
>  	};
>  
> diff --git a/arch/arm/dts/stm32f469-pinctrl.dtsi b/arch/arm/dts/stm32f469-pinctrl.dtsi
> index fff542662e..1e2bb0191e 100644
> --- a/arch/arm/dts/stm32f469-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32f469-pinctrl.dtsi
> @@ -1,43 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
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
>   */
>  
>  #include "stm32f4-pinctrl.dtsi"
> diff --git a/arch/arm/dts/stm32f469.dtsi b/arch/arm/dts/stm32f469.dtsi
> index 0d58d40649..69c862d973 100644
> --- a/arch/arm/dts/stm32f469.dtsi
> +++ b/arch/arm/dts/stm32f469.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /* Copyright (C) STMicroelectronics 2017 - All Rights Reserved */
>  
>  #include "stm32f429.dtsi"
> diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
> index e3a7bd338d..4fef0164cf 100644
> --- a/arch/arm/dts/stm32f746-disco.dts
> +++ b/arch/arm/dts/stm32f746-disco.dts
> @@ -1,43 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2017 - Vikas MANOCHA <vikas.manocha@st.com>
>   *
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
>   */
>  
>  /dts-v1/;
> @@ -56,6 +20,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		reg = <0xC0000000 0x800000>;
>  	};
>  
> diff --git a/arch/arm/dts/stm32f746.dtsi b/arch/arm/dts/stm32f746.dtsi
> index f48d06a80d..66360cf21c 100644
> --- a/arch/arm/dts/stm32f746.dtsi
> +++ b/arch/arm/dts/stm32f746.dtsi
> @@ -1,51 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2015 - Maxime Coquelin <mcoquelin.stm32@gmail.com>
>   *
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
>   */
>  
> -#include "skeleton.dtsi"
>  #include "armv7-m.dtsi"
>  #include <dt-bindings/clock/stm32fx-clock.h>
>  #include <dt-bindings/mfd/stm32f7-rcc.h>
>  
>  / {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
>  	clocks {
>  		clk_hse: clk-hse {
>  			#clock-cells = <0>;
> diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
> index 483d896e2b..8d51e5b0fb 100644
> --- a/arch/arm/dts/stm32f769-disco.dts
> +++ b/arch/arm/dts/stm32f769-disco.dts
> @@ -1,43 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2017 - Vikas MANOCHA <vikas.manocha@st.com>
>   *
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
>   */
>  
>  /dts-v1/;
> @@ -56,6 +20,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		reg = <0xC0000000 0x1000000>;
>  	};
>  
> @@ -101,6 +66,10 @@
>  	};
>  };
>  
> +&rcc {
> +	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
> +};
> +
>  &cec {
>  	pinctrl-0 = <&cec_pins_a>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm/dts/stm32h7-u-boot.dtsi b/arch/arm/dts/stm32h7-u-boot.dtsi
> index 99fa0e673a..361c8e5d80 100644
> --- a/arch/arm/dts/stm32h7-u-boot.dtsi
> +++ b/arch/arm/dts/stm32h7-u-boot.dtsi
> @@ -61,17 +61,6 @@
>  				st,sdram-refcount = <1539>;
>  			};
>  		};
> -
> -		sdmmc1: sdmmc@52007000 {
> -			compatible = "st,stm32-sdmmc2";
> -			reg = <0x52007000 0x1000>;
> -			interrupts = <49>;
> -			clocks = <&rcc SDMMC1_CK>;
> -			resets = <&rcc STM32H7_AHB3_RESET(SDMMC1)>;
> -			st,idma = <1>;
> -			cap-sd-highspeed;
> -			cap-mmc-highspeed;
> -		};
>  	};
>  };
>  
> @@ -216,32 +205,6 @@
>  			slew-rate = <3>;
>  		};
>  	};
> -
> -	pinctrl_sdmmc1_level_shifter: sdmmc0_ls@0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('B', 8, AF7)>,
> -				 <STM32_PINMUX('B', 9, AF7)>,
> -				 <STM32_PINMUX('C', 6, AF8)>,
> -				 <STM32_PINMUX('C', 7, AF8)>;
> -			drive-push-pull;
> -			slew-rate = <3>;
> -		};
> -	};
> -
> -	sdmmc1_pins: sdmmc@0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('C', 8, AF12)>,
> -				 <STM32_PINMUX('C', 9, AF12)>,
> -				 <STM32_PINMUX('C',10, AF12)>,
> -				 <STM32_PINMUX('C',11, AF12)>,
> -				 <STM32_PINMUX('C',12, AF12)>,
> -				 <STM32_PINMUX('D', 2, AF12)>;
> -
> -			slew-rate = <3>;
> -			drive-push-pull;
> -			bias-disable;
> -		};
> -	};
>  };
>  
>  &pwrcfg {
> @@ -251,3 +214,7 @@
>  &rcc {
>  	u-boot,dm-pre-reloc;
>  };
> +
> +&sdmmc1 {
> +	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
> +};
> diff --git a/arch/arm/dts/stm32h743-pinctrl.dtsi b/arch/arm/dts/stm32h743-pinctrl.dtsi
> index c823541a0d..e3a5c537f3 100644
> --- a/arch/arm/dts/stm32h743-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32h743-pinctrl.dtsi
> @@ -173,6 +173,89 @@
>  				};
>  			};
>  
> +			ethernet_rmii: rmii@0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('G', 11, AF11)>,
> +						 <STM32_PINMUX('G', 13, AF11)>,
> +						 <STM32_PINMUX('G', 12, AF11)>,
> +						 <STM32_PINMUX('C', 4, AF11)>,
> +						 <STM32_PINMUX('C', 5, AF11)>,
> +						 <STM32_PINMUX('A', 7, AF11)>,
> +						 <STM32_PINMUX('C', 1, AF11)>,
> +						 <STM32_PINMUX('A', 2, AF11)>,
> +						 <STM32_PINMUX('A', 1, AF11)>;
> +					slew-rate = <2>;
> +				};
> +			};
> +
> +			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> +						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> +						 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
> +						 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> +					slew-rate = <3>;
> +					drive-push-pull;
> +					bias-disable;
> +				};
> +			};
> +
> +			sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> +						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> +						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> +						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> +						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> +					slew-rate = <3>;
> +					drive-push-pull;
> +					bias-disable;
> +				};
> +				pins2{
> +					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> +					slew-rate = <3>;
> +					drive-open-drain;
> +					bias-disable;
> +				};
> +			};
> +
> +			sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> +						 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
> +						 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
> +						 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
> +						 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
> +						 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
> +				};
> +			};
> +
> +			sdmmc1_dir_pins_a: sdmmc1-dir-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('C', 6, AF8)>, /* SDMMC1_D0DIR */
> +						 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
> +						 <STM32_PINMUX('B', 9, AF7)>; /* SDMMC1_CDIR */
> +					slew-rate = <3>;
> +					drive-push-pull;
> +					bias-pull-up;
> +				};
> +				pins2{
> +					pinmux = <STM32_PINMUX('B', 8, AF7)>; /* SDMMC1_CKIN */
> +					bias-pull-up;
> +				};
> +			};
> +
> +			sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC1_D0DIR */
> +						 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
> +						 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
> +						 <STM32_PINMUX('B', 8, ANALOG)>; /* SDMMC1_CKIN */
> +				};
> +			};
> +
>  			usart1_pins: usart1@0 {
>  				pins1 {
>  					pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
> diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
> index cbdd69ca9e..4b4e7a99f7 100644
> --- a/arch/arm/dts/stm32h743.dtsi
> +++ b/arch/arm/dts/stm32h743.dtsi
> @@ -1,52 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
>   *
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
>   */
>  
> -#include "skeleton.dtsi"
>  #include "armv7-m.dtsi"
>  #include <dt-bindings/clock/stm32h7-clks.h>
>  #include <dt-bindings/mfd/stm32h7-rcc.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
>  / {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
>  	clocks {
>  		clk_hse: clk-hse {
>  			#clock-cells = <0>;
> @@ -337,6 +303,20 @@
>  			dma-requests = <32>;
>  		};
>  
> +		sdmmc1: sdmmc@52007000 {
> +			compatible = "arm,pl18x", "arm,primecell";
> +			arm,primecell-periphid = <0x10153180>;
> +			reg = <0x52007000 0x1000>;
> +			interrupts = <49>;
> +			interrupt-names	= "cmd_irq";
> +			clocks = <&rcc SDMMC1_CK>;
> +			clock-names = "apb_pclk";
> +			resets = <&rcc STM32H7_AHB3_RESET(SDMMC1)>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			max-frequency = <120000000>;
> +		};
> +
>  		exti: interrupt-controller@58000000 {
>  			compatible = "st,stm32h7-exti";
>  			interrupt-controller;
> @@ -511,6 +491,19 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		mac: ethernet@40028000 {
> +			compatible = "st,stm32-dwmac", "snps,dwmac-4.10a";
> +			reg = <0x40028000 0x8000>;
> +			reg-names = "stmmaceth";
> +			interrupts = <61>;
> +			interrupt-names = "macirq";
> +			clock-names = "stmmaceth", "mac-clk-tx", "mac-clk-rx";
> +			clocks = <&rcc ETH1MAC_CK>, <&rcc ETH1TX_CK>, <&rcc ETH1RX_CK>;
> +			st,syscon = <&syscfg 0x4>;
> +			snps,pbl = <8>;
> +			status = "disabled";
> +		};
>  	};
>  };
>  
> diff --git a/arch/arm/dts/stm32h743i-disco-u-boot.dtsi b/arch/arm/dts/stm32h743i-disco-u-boot.dtsi
> index 2d6b41bfb9..5965afcbe4 100644
> --- a/arch/arm/dts/stm32h743i-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32h743i-disco-u-boot.dtsi
> @@ -1,11 +1,3 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <stm32h7-u-boot.dtsi>
> -
> -&sdmmc1 {
> -	status = "okay";
> -	pinctrl-0 = <&sdmmc1_pins>;
> -	pinctrl-names = "default";
> -	bus-width = <4>;
> -	cd-gpios = <&gpioi 8 1>;
> -};
> diff --git a/arch/arm/dts/stm32h743i-disco.dts b/arch/arm/dts/stm32h743i-disco.dts
> index 45e088c557..43c30bfcbe 100644
> --- a/arch/arm/dts/stm32h743i-disco.dts
> +++ b/arch/arm/dts/stm32h743i-disco.dts
> @@ -1,43 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR X11
>  /*
>   * Copyright 2017 - Patrice Chotard <patrice.chotard@st.com>
>   *
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
>   */
>  
>  /dts-v1/;
> @@ -54,18 +18,56 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		reg = <0xd0000000 0x2000000>;
>  	};
>  
>  	aliases {
>  		serial0 = &usart2;
>  	};
> +
> +	v3v3: regulator-v3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &clk_hse {
>  	clock-frequency = <25000000>;
>  };
>  
> +&mac {
> +	status = "disabled";
> +	pinctrl-0	= <&ethernet_rmii>;
> +	pinctrl-names	= "default";
> +	phy-mode	= "rmii";
> +	phy-handle	= <&phy0>;
> +
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +	};
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	broken-cd;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
>  &usart2 {
>  	pinctrl-0 = <&usart2_pins>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm/dts/stm32h743i-eval-u-boot.dtsi b/arch/arm/dts/stm32h743i-eval-u-boot.dtsi
> index 251977abe0..5965afcbe4 100644
> --- a/arch/arm/dts/stm32h743i-eval-u-boot.dtsi
> +++ b/arch/arm/dts/stm32h743i-eval-u-boot.dtsi
> @@ -1,12 +1,3 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <stm32h7-u-boot.dtsi>
> -
> -&sdmmc1 {
> -	status = "okay";
> -	pinctrl-0 = <&sdmmc1_pins>,
> -		    <&pinctrl_sdmmc1_level_shifter>;
> -	pinctrl-names = "default";
> -	bus-width = <4>;
> -	st,sig-dir;
> -};
> diff --git a/arch/arm/dts/stm32h743i-eval.dts b/arch/arm/dts/stm32h743i-eval.dts
> index 3f8e0c4a99..ab78ad5323 100644
> --- a/arch/arm/dts/stm32h743i-eval.dts
> +++ b/arch/arm/dts/stm32h743i-eval.dts
> @@ -54,6 +54,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		reg = <0xd0000000 0x2000000>;
>  	};
>  
> @@ -69,13 +70,20 @@
>  		regulator-always-on;
>  	};
>  
> +	v2v9_sd: regulator-v2v9_sd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v2v9_sd";
> +		regulator-min-microvolt = <2900000>;
> +		regulator-max-microvolt = <2900000>;
> +		regulator-always-on;
> +	};
> +
>  	usbotg_hs_phy: usb-phy {
>  		#phy-cells = <0>;
>  		compatible = "usb-nop-xceiv";
>  		clocks = <&rcc USB1ULPI_CK>;
>  		clock-names = "main_clk";
>  	};
> -
>  };
>  
>  &adc_12 {
> @@ -104,6 +112,37 @@
>  	status = "okay";
>  };
>  
> +&mac {
> +	status = "disabled";
> +	pinctrl-0	= <&ethernet_rmii>;
> +	pinctrl-names	= "default";
> +	phy-mode	= "rmii";
> +	phy-handle	= <&phy0>;
> +
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +	};
> +};
> +
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
> +	broken-cd;
> +	st,sig-dir;
> +	st,neg-edge;
> +	st,use-ckin;
> +	bus-width = <4>;
> +	vmmc-supply = <&v2v9_sd>;
> +	status = "okay";
> +};
> +
>  &usart1 {
>  	pinctrl-0 = <&usart1_pins>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
> index 1d9cc734f1..66deca1bc9 100644
> --- a/arch/arm/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
> @@ -176,10 +176,10 @@
>  				regulator-over-current-protection;
>  			};
>  
> -			 bst_out: boost {
> +			bst_out: boost {
>  				regulator-name = "bst_out";
>  				interrupts = <IT_OCP_BOOST 0>;
> -			 };
> +			};
>  
>  			vbus_otg: pwr_sw1 {
>  				regulator-name = "vbus_otg";
> diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
> index 58d8b515be..1cc89c5485 100644
> --- a/include/dt-bindings/clock/stm32fx-clock.h
> +++ b/include/dt-bindings/clock/stm32fx-clock.h
> @@ -1,9 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * stm32fx-clock.h
>   *
>   * Copyright (C) 2016 STMicroelectronics
>   * Author: Gabriel Fernandez for STMicroelectronics.
> - * License terms:  GNU General Public License (GPL), version 2
>   */
>  
>  /*
> @@ -54,7 +54,10 @@
>  #define CLK_I2C3		28
>  #define CLK_I2C4		29
>  #define CLK_LPTIMER		30
> -
> -#define END_PRIMARY_CLK_F7	31
> +#define CLK_PLL_SRC		31
> +#define CLK_DFSDM1		32
> +#define CLK_ADFSDM1		33
> +#define CLK_F769_DSI		34
> +#define END_PRIMARY_CLK_F7	35
>  
>  #endif
> diff --git a/include/dt-bindings/mfd/st,stpmic1.h b/include/dt-bindings/mfd/st,stpmic1.h
> index b2d6c83462..321cd08797 100644
> --- a/include/dt-bindings/mfd/st,stpmic1.h
> +++ b/include/dt-bindings/mfd/st,stpmic1.h
> @@ -43,4 +43,8 @@
>  #define IT_SWIN_F	30
>  #define IT_SWIN_R	31
>  
> +/* BUCK MODES definitions */
> +#define STPMIC1_BUCK_MODE_NORMAL 0
> +#define STPMIC1_BUCK_MODE_LP 2
> +
>  #endif /* __DT_BINDINGS_STPMIC1_H__ */


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
