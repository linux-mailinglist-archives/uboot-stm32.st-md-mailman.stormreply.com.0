Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF00332809
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 15:04:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CF9FC57195;
	Tue,  9 Mar 2021 14:04:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C54EC57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 14:04:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129E2jxT030188; Tue, 9 Mar 2021 15:04:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=X6gJV9k9ZDjO584xyuoqvrBuFgybEcuqWB2W73O8Q+s=;
 b=vHkDhFzCkhbu6k15y7et//fUBGvIJOEW2rw6xA7ZXdEV7cbArGjIgs9isgQMmpDC0Pk7
 e3SfakZzA3ugV7+CRsI1WbbyFOMXVdVRj8gZvsK8AkosqoYzuyVSsWZBd3Ci+bHGiIBs
 nou4mNBWhSQhlxeUdvSNOdipXy5eAy9tHd6C77BX4F0EOlCW8WRUtKEkWnVCu5IrfzS5
 2CZolloc6RVtsG3OXn8XhmIcdPlkVEdWkSTatqHgG25GBsOliCPQX60yXI419s8QmakF
 RI1hsAReJhjpzYdZ/ubDCmmVcXwkRYLV2cvWv6E7IYgsWr7UyK+v84UxdOCcfbdt4hhX +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374036t9en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 15:04:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D49110002A;
 Tue,  9 Mar 2021 15:04:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D9D024BEB9;
 Tue,  9 Mar 2021 15:04:36 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 15:04:35 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210228155226.77904-1-jagan@amarulasolutions.com>
 <20210228155226.77904-5-jagan@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <adefa133-7279-3b65-b4bc-f6d8ecb47b85@foss.st.com>
Date: Tue, 9 Mar 2021 15:04:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210228155226.77904-5-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 4/9] board: stm32: Add Engicam i.Core
 STM32MP1 EDIMM2.2 Starter Kit
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

Hi Jagan

one remark below

On 2/28/21 4:52 PM, Jagan Teki wrote:
> Engicam EDIMM2.2 Starter Kit is an EDIMM 2.2 Form Factor Capacitive
> Evaluation Board.
> 
> Genaral features:
> - LCD 7" C.Touch
> - microSD slot
> - Ethernet 1Gb
> - Wifi/BT
> - 2x LVDS Full HD interfaces
> - 3x USB 2.0
> - 1x USB 3.0
> - HDMI Out
> - Mini PCIe
> - MIPI CSI
> - 2x CAN
> - Audio Out
> 
> i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> 
> i.Core STM32MP1 needs to mount on top of this Evaluation board for
> creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.
> 
> Add support for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm/dts/Makefile                         |   1 +
>  ...mp157a-icore-stm32mp1-edimm2.2-u-boot.dtsi |  51 ++++++
>  .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  47 ++++++
>  .../stm32mp157a-icore-stm32mp1-u-boot.dtsi    | 146 ++++++++++++++++++
>  arch/arm/mach-stm32mp/Kconfig                 |  20 +++
>  board/engicam/stm32mp1/Kconfig                |  12 ++
>  board/engicam/stm32mp1/MAINTAINERS            |   6 +
>  board/engicam/stm32mp1/Makefile               |  10 ++
>  board/engicam/stm32mp1/spl.c                  |  48 ++++++
>  board/engicam/stm32mp1/stm32mp1.c             | 131 ++++++++++++++++
>  ...tm32mp15-icore-stm32mp1-edimm2.2_defconfig |  80 ++++++++++
>  11 files changed, 552 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
>  create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-u-boot.dtsi
>  create mode 100644 board/engicam/stm32mp1/Kconfig
>  create mode 100644 board/engicam/stm32mp1/MAINTAINERS
>  create mode 100644 board/engicam/stm32mp1/Makefile
>  create mode 100644 board/engicam/stm32mp1/spl.c
>  create mode 100644 board/engicam/stm32mp1/stm32mp1.c
>  create mode 100644 configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index f478f6f18f..f4a48c65e8 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -979,6 +979,7 @@ dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
>  dtb-$(CONFIG_STM32MP15x) += \
>  	stm32mp157a-dk1.dtb \
>  	stm32mp157a-avenger96.dtb \
> +	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
>  	stm32mp157c-dk2.dtb \
>  	stm32mp157c-ed1.dtb \
>  	stm32mp157c-ev1.dtb \
> diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2-u-boot.dtsi b/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2-u-boot.dtsi
> new file mode 100644
> index 0000000000..96fe461235
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2-u-boot.dtsi
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Copyright (c) 2020 Amarula Solutions(India)
> + * Author: Jagan Teki <jagan@amarulasolutions.com>
> + */
> +
> +#include "stm32mp157a-icore-stm32mp1-u-boot.dtsi"
> +
> +/{
> +	aliases {
> +		mmc0 = &sdmmc1;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart4;
> +	};
> +};
> +
> +&sdmmc1 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&sdmmc1_b4_pins_a {
> +	u-boot,dm-pre-reloc;
> +
> +	pins1 {
> +		u-boot,dm-pre-reloc;
> +	};
> +
> +	pins2 {
> +		u-boot,dm-pre-reloc;
> +	};
> +};
> +
> +&uart4 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&uart4_pins_a {
> +	u-boot,dm-pre-reloc;
> +
> +	pins1 {
> +		u-boot,dm-pre-reloc;
> +	};
> +
> +	pins2 {
> +		u-boot,dm-pre-reloc;
> +		bias-pull-up;
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> new file mode 100644
> index 0000000000..ec9f1d1cd5
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
> + * Copyright (c) 2020 Engicam srl
> + * Copyright (c) 2020 Amarula Solutons(India)
> + */
> +
> +/dts-v1/;
> +#include "stm32mp157.dtsi"
> +#include "stm32mp157a-icore-stm32mp1.dtsi"
> +#include "stm32mp15-pinctrl.dtsi"
> +#include "stm32mp15xxaa-pinctrl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit";
> +	compatible = "engicam,icore-stm32mp1-edimm2.2",
> +		     "engicam,icore-stm32mp1", "st,stm32mp157";
> +
> +	aliases {
> +		serial0 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&sdmmc1 {
> +	bus-width = <4>;
> +	disable-wp;
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	st,neg-edge;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart4_pins_a>;
> +	pinctrl-1 = <&uart4_sleep_pins_a>;
> +	pinctrl-2 = <&uart4_idle_pins_a>;
> +	status = "okay";
> +};
> diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-icore-stm32mp1-u-boot.dtsi
> new file mode 100644
> index 0000000000..d62c24d4ce
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1-u-boot.dtsi
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Copyright (c) 2020 Amarula Solutions(India)
> + * Author: Jagan Teki <jagan@amarulasolutions.com>
> + */
> +
> +#include <dt-bindings/clock/stm32mp1-clksrc.h>
> +#include "stm32mp15-u-boot.dtsi"
> +#include "stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi"
> +
> +&vddcore {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&vdd {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&vdd_usb {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&vdda {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&vdd_ddr {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&vtt_ddr {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&vref_ddr {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&vdd_sd {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&v3v3 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&v2v8 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&v1v8 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&rcc {
> +	st,clksrc = <
> +		CLK_MPU_PLL1P
> +		CLK_AXI_PLL2P
> +		CLK_MCU_PLL3P
> +		CLK_PLL12_HSE
> +		CLK_PLL3_HSE
> +		CLK_PLL4_HSE
> +		CLK_RTC_LSE
> +		CLK_MCO1_DISABLED
> +		CLK_MCO2_DISABLED
> +	>;
> +
> +	st,clkdiv = <
> +		1 /*MPU*/
> +		0 /*AXI*/
> +		0 /*MCU*/
> +		1 /*APB1*/
> +		1 /*APB2*/
> +		1 /*APB3*/
> +		1 /*APB4*/
> +		2 /*APB5*/
> +		23 /*RTC*/
> +		0 /*MCO1*/
> +		0 /*MCO2*/
> +	>;
> +
> +	st,pkcs = <
> +		CLK_CKPER_HSE
> +		CLK_FMC_ACLK
> +		CLK_QSPI_ACLK
> +		CLK_ETH_DISABLED
> +		CLK_SDMMC12_PLL4P
> +		CLK_DSI_DSIPLL
> +		CLK_STGEN_HSE
> +		CLK_USBPHY_HSE
> +		CLK_SPI2S1_PLL3Q
> +		CLK_SPI2S23_PLL3Q
> +		CLK_SPI45_HSI
> +		CLK_SPI6_HSI
> +		CLK_I2C46_HSI
> +		CLK_SDMMC3_PLL4P
> +		CLK_USBO_USBPHY
> +		CLK_ADC_CKPER
> +		CLK_CEC_LSE
> +		CLK_I2C12_HSI
> +		CLK_I2C35_HSI
> +		CLK_UART1_HSI
> +		CLK_UART24_HSI
> +		CLK_UART35_HSI
> +		CLK_UART6_HSI
> +		CLK_UART78_HSI
> +		CLK_SPDIF_PLL4P
> +		CLK_FDCAN_PLL4R
> +		CLK_SAI1_PLL3Q
> +		CLK_SAI2_PLL3Q
> +		CLK_SAI3_PLL3Q
> +		CLK_SAI4_PLL3Q
> +		CLK_RNG1_LSI
> +		CLK_RNG2_LSI
> +		CLK_LPTIM1_PCLK1
> +		CLK_LPTIM23_PCLK3
> +		CLK_LPTIM45_LSE
> +	>;
> +
> +	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
> +	pll2: st,pll@1 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <1>;
> +		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
> +		frac = < 0x1400 >;
> +		u-boot,dm-pre-reloc;
> +	};
> +
> +	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
> +	pll3: st,pll@2 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <2>;
> +		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
> +		frac = < 0x1a04 >;
> +		u-boot,dm-pre-reloc;
> +	};
> +
> +	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
> +	pll4: st,pll@3 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <3>;
> +		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
> +		u-boot,dm-pre-reloc;
> +	};
> +};
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 79ffd5191d..5a2123063a 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -77,6 +77,25 @@ config TARGET_ST_STM32MP15x
>  		Evalulation board (EV1) or Discovery board (DK1 and DK2).
>  		The difference between board are managed with devicetree
>  
> +config TARGET_ICORE_STM32MP1
> +	bool "Engicam i.Core STM32MP1 SOM"
> +	select STM32MP15x
> +	imply BOOTCOUNT_LIMIT
> +	imply BOOTSTAGE
> +	imply CMD_BOOTCOUNT
> +	imply CMD_BOOTSTAGE
> +	imply CMD_CLS if CMD_BMP
> +	imply DISABLE_CONSOLE
> +	imply PRE_CONSOLE_BUFFER
> +	imply SILENT_CONSOLE
> +	help
> +	  i.Core STM32MP1 is an EDIMM SOM based on STM32MP157A.
> +
> +	  i.Core STM32MP1 EDIMM2.2:
> +	  * EDIMM2.2 is a Form Factor Capacitive Evaluation Board.
> +	  * i.Core STM32MP1 needs to mount on top of EDIMM2.2 for
> +	    creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.
> +
>  config TARGET_DH_STM32MP1_PDK2
>  	bool "DH STM32MP1 PDK2"
>  	select STM32MP15x
> @@ -177,6 +196,7 @@ config DEBUG_UART_CLOCK
>  	default 64000000
>  endif
>  
> +source "board/engicam/stm32mp1/Kconfig"
>  source "board/st/stm32mp1/Kconfig"
>  source "board/dhelectronics/dh_stm32mp1/Kconfig"
>  
> diff --git a/board/engicam/stm32mp1/Kconfig b/board/engicam/stm32mp1/Kconfig
> new file mode 100644
> index 0000000000..e7bccc09fb
> --- /dev/null
> +++ b/board/engicam/stm32mp1/Kconfig
> @@ -0,0 +1,12 @@
> +if TARGET_ICORE_STM32MP1
> +
> +config SYS_BOARD
> +	default "stm32mp1"
> +
> +config SYS_VENDOR
> +	default "engicam"
> +
> +config SYS_CONFIG_NAME
> +	default "stm32mp1"
> +
> +endif
> diff --git a/board/engicam/stm32mp1/MAINTAINERS b/board/engicam/stm32mp1/MAINTAINERS
> new file mode 100644
> index 0000000000..3230a7a6e8
> --- /dev/null
> +++ b/board/engicam/stm32mp1/MAINTAINERS
> @@ -0,0 +1,6 @@
> +i.Core-STM32MP1-EDIMM2.2
> +M:	Jagan Teki <jagan@amarulasolutions.com>
> +M:	Matteo Lisi <matteo.lisi@engicam.com>
> +S:	Maintained
> +F:	board/engicam/stm32mp1
> +F:	configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> diff --git a/board/engicam/stm32mp1/Makefile b/board/engicam/stm32mp1/Makefile
> new file mode 100644
> index 0000000000..65560df290
> --- /dev/null
> +++ b/board/engicam/stm32mp1/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +#
> +# Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> +#
> +
> +ifdef CONFIG_SPL_BUILD
> +obj-y += spl.o
> +else
> +obj-y += stm32mp1.o
> +endif
> diff --git a/board/engicam/stm32mp1/spl.c b/board/engicam/stm32mp1/spl.c
> new file mode 100644
> index 0000000000..79adb5f529
> --- /dev/null
> +++ b/board/engicam/stm32mp1/spl.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> + * Copyright (C) 2020 Engicam S.r.l.
> + * Copyright (C) 2020 Amarula Solutions(India)
> + */
> +
> +#include <common.h>
> +#include <asm/io.h>
> +
> +/* board early initialisation in board_f: need to use global variable */
> +static u32 opp_voltage_mv __section(".data");
> +
> +void board_vddcore_init(u32 voltage_mv)
> +{
> +	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER_SUPPORT))
> +		opp_voltage_mv = voltage_mv;
> +}
> +
> +int board_early_init_f(void)
> +{
> +	return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_UART_BOARD_INIT
> +void board_debug_uart_init(void)
> +{
> +#if (CONFIG_DEBUG_UART_BASE == STM32_UART4_BASE)
> +
> +#define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0A00)
> +#define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0A28)
> +
> +	/* UART4 clock enable */
> +	setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
> +
> +#define GPIOG_BASE 0x50008000
> +	/* GPIOG clock enable */
> +	writel(BIT(6), RCC_MP_AHB4ENSETR);
> +	/* GPIO configuration for ST boards: Uart4 TX = G11 */
> +	writel(0xffbfffff, GPIOG_BASE + 0x00);
> +	writel(0x00006000, GPIOG_BASE + 0x24);
> +#else
> +
> +#error("CONFIG_DEBUG_UART_BASE: not supported value")
> +
> +#endif
> +}
> +#endif
> diff --git a/board/engicam/stm32mp1/stm32mp1.c b/board/engicam/stm32mp1/stm32mp1.c
> new file mode 100644
> index 0000000000..2bd71a8fd7
> --- /dev/null
> +++ b/board/engicam/stm32mp1/stm32mp1.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> + * Copyright (C) 2020 Engicam S.r.l.
> + * Copyright (C) 2020 Amarula Solutions(India)
> + * Author: Jagan Teki <jagan@amarulasolutions.com>
> + */
> +
> +#include <common.h>
> +#include <env.h>
> +#include <env_internal.h>
> +#include <syscon.h>
> +#include <asm/io.h>
> +#include <asm/arch/sys_proto.h>
> +#include <power/regulator.h>
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +int board_early_init_f(void)
> +{
> +	/* nothing to do, only used in SPL */
> +	return 0;
> +}

As board_early_init_f() is empty here and also in /board/engicam/stm32mp1/spl.c, it can be removed
and compilation flag CONFIG_BOARD_EARLY_INIT_F as well.

Patrice

> +
> +int checkboard(void)
> +{
> +	char *mode;
> +	const char *fdt_compat;
> +	int fdt_compat_len;
> +
> +	if (IS_ENABLED(CONFIG_TFABOOT))
> +		mode = "trusted";
> +	else
> +		mode = "basic";
> +
> +	printf("Board: stm32mp1 in %s mode", mode);
> +	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
> +				 &fdt_compat_len);
> +	if (fdt_compat && fdt_compat_len)
> +		printf(" (%s)", fdt_compat);
> +	puts("\n");
> +
> +	return 0;
> +}
> +
> +/* board dependent setup after realloc */
> +int board_init(void)
> +{
> +	/* address of boot parameters */
> +	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
> +
> +	if (IS_ENABLED(CONFIG_DM_REGULATOR))
> +		regulators_enable_boot_on(_DEBUG);
> +
> +	return 0;
> +}
> +
> +int board_late_init(void)
> +{
> +	return 0;
> +}
> +
> +enum env_location env_get_location(enum env_operation op, int prio)
> +{
> +	u32 bootmode = get_bootmode();
> +
> +	if (prio)
> +		return ENVL_UNKNOWN;
> +
> +	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
> +	case BOOT_FLASH_SD:
> +	case BOOT_FLASH_EMMC:
> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_MMC))
> +			return ENVL_MMC;
> +		else if (CONFIG_IS_ENABLED(ENV_IS_IN_EXT4))
> +			return ENVL_EXT4;
> +		else
> +			return ENVL_NOWHERE;
> +
> +	case BOOT_FLASH_NAND:
> +	case BOOT_FLASH_SPINAND:
> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
> +			return ENVL_UBI;
> +		else
> +			return ENVL_NOWHERE;
> +
> +	case BOOT_FLASH_NOR:
> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH))
> +			return ENVL_SPI_FLASH;
> +		else
> +			return ENVL_NOWHERE;
> +
> +	default:
> +		return ENVL_NOWHERE;
> +	}
> +}
> +
> +const char *env_ext4_get_intf(void)
> +{
> +	u32 bootmode = get_bootmode();
> +
> +	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
> +	case BOOT_FLASH_SD:
> +	case BOOT_FLASH_EMMC:
> +		return "mmc";
> +	default:
> +		return "";
> +	}
> +}
> +
> +const char *env_ext4_get_dev_part(void)
> +{
> +	static char *const dev_part[] = {"0:auto", "1:auto", "2:auto"};
> +	u32 bootmode = get_bootmode();
> +
> +	return dev_part[(bootmode & TAMP_BOOT_INSTANCE_MASK) - 1];
> +}
> +
> +int mmc_get_env_dev(void)
> +{
> +	u32 bootmode = get_bootmode();
> +
> +	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
> +}
> +
> +#if defined(CONFIG_OF_BOARD_SETUP)
> +int ft_board_setup(void *blob, struct bd_info *bd)
> +{
> +	return 0;
> +}
> +#endif
> diff --git a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> new file mode 100644
> index 0000000000..48cf207f4c
> --- /dev/null
> +++ b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> @@ -0,0 +1,80 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_STM32MP=y
> +CONFIG_SYS_MALLOC_F_LEN=0x3000
> +CONFIG_SYS_MEMTEST_START=0xc0000000
> +CONFIG_SYS_MEMTEST_END=0xc4000000
> +CONFIG_ENV_OFFSET=0x280000
> +CONFIG_SPL_TEXT_BASE=0x2FFC2500
> +CONFIG_SPL_MMC_SUPPORT=y
> +CONFIG_SPL=y
> +CONFIG_TARGET_ICORE_STM32MP1=y
> +CONFIG_ENV_OFFSET_REDUND=0x2C0000
> +# CONFIG_ARMV7_VIRT is not set
> +CONFIG_DEFAULT_DEVICE_TREE="stm32mp157a-icore-stm32mp1-edimm2.2"
> +CONFIG_DISTRO_DEFAULTS=y
> +CONFIG_FIT=y
> +CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> +CONFIG_BOARD_EARLY_INIT_F=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
> +CONFIG_SPL_ENV_SUPPORT=y
> +CONFIG_SPL_I2C_SUPPORT=y
> +CONFIG_SPL_POWER_SUPPORT=y
> +CONFIG_SYS_PROMPT="STM32MP> "
> +CONFIG_CMD_ADTIMG=y
> +CONFIG_CMD_ERASEENV=y
> +CONFIG_CMD_MEMINFO=y
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_CMD_ADC=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_FUSE=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_I2C=y
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_REMOTEPROC=y
> +CONFIG_CMD_CACHE=y
> +CONFIG_CMD_TIME=y
> +CONFIG_CMD_TIMER=y
> +CONFIG_CMD_PMIC=y
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_CMD_EXT4_WRITE=y
> +# CONFIG_SPL_DOS_PARTITION is not set
> +CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
> +CONFIG_ENV_IS_NOWHERE=y
> +CONFIG_ENV_IS_IN_MMC=y
> +CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +# CONFIG_SPL_ENV_IS_NOWHERE is not set
> +CONFIG_DM_HWSPINLOCK=y
> +CONFIG_HWSPINLOCK_STM32=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_STM32F7=y
> +CONFIG_LED=y
> +CONFIG_LED_GPIO=y
> +CONFIG_DM_MAILBOX=y
> +CONFIG_STM32_IPCC=y
> +CONFIG_STM32_FMC2_EBI=y
> +CONFIG_DM_MMC=y
> +CONFIG_SUPPORT_EMMC_BOOT=y
> +CONFIG_STM32_SDMMC2=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_DM_ETH=y
> +CONFIG_DWC_ETH_QOS=y
> +CONFIG_PHY=y
> +CONFIG_PINCONF=y
> +# CONFIG_SPL_PINCTRL_FULL is not set
> +CONFIG_PINCTRL_STMFX=y
> +CONFIG_DM_PMIC=y
> +# CONFIG_SPL_PMIC_CHILDREN is not set
> +CONFIG_PMIC_STPMIC1=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_REGULATOR_GPIO=y
> +CONFIG_REMOTEPROC_STM32_COPRO=y
> +CONFIG_DM_RTC=y
> +CONFIG_RTC_STM32=y
> +CONFIG_SERIAL_RX_BUFFER=y
> +CONFIG_WDT=y
> +CONFIG_WDT_STM32MP=y
> +CONFIG_LZO=y
> +CONFIG_ERRNO_STR=y
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
