Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F27BC569C04
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:49:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FB1CC0D2BF;
	Thu,  7 Jul 2022 07:49:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 746D5C04005
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:48:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26715pZA025688;
 Thu, 7 Jul 2022 09:48:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=L0y4jt/+j6Ye2zneWefnhDxXNoBdA4ZwDkhkafnm3dc=;
 b=xRdRiGIEL/JTZdZp9x+iqFLFD9l4Y5T79udOYHzXcFmRNrD2/sN3dLX2Ug5NWnA8PLny
 BHpixTTrz7TspPP/4L8Sfmntkd5kDpB6MjPac5GOpUAADKdPMxbcyR2hpFvYIxeJN1r+
 5QdK9iAXeRTP4iXRIsVoGdTskhjjyIMhR4b1S1jYzyI2kNXb596pYteKyxLOb3qLJpKj
 IxaqjOkWD54Rz6VwqhlWX1mOFVvJeqmuSPlxSPs/pjE8ZPvrJTJowf9YRoFXgwe/v0/a
 0oh4faAP1A+70G+pAYr5/wLP12nb3FIqztTVKKrMvk+bTadcLUzVOs/PN5/eabqqZtI5 cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h58bp70t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:48:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38A6010002A;
 Thu,  7 Jul 2022 09:48:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EDD5211F0D;
 Thu,  7 Jul 2022 09:48:48 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:48:47 +0200
Message-ID: <2e6b1219-cd53-3dcc-22ac-95e8ba53f3d6@foss.st.com>
Date: Thu, 7 Jul 2022 09:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
 <20220705165545.4.I1c57fd745234d7facb43364a867b31fe5c4a8c39@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220705165545.4.I1c57fd745234d7facb43364a867b31fe5c4a8c39@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Fabio Estevam <festevam@denx.de>, Vikas Manocha <vikas.manocha@st.com>, Samuel
 Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Christian Hewitt <christianshewitt@gmail.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] ARM: dts: stm32: add SCMI version of
 STM32 boards (DK1/DK2/ED1/EV1)
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

On 7/5/22 16:55, Patrick Delaunay wrote:
> Add a "secure" version of STM32 boards based on SCMI when RCC_TZCR.TZEN=1.
> 
> Only boards provided by STMicroelectronics are concerned:
> -STM32MP157A-DK1
> -STM32MP157C-DK2
> -STM32MP157C-ED1
> -STM32MP157C-EV1
> 
> The resources secured by RCC_TZCR.TZEN=1 are managed by OP-TEE
> and the associated SCMI services, reset and clock.
> 
> These device trees are only supported with stm32mp15_defconfig,
> with OP-TEE, SCMI and without SPL support.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/Makefile                         |   4 +
>  arch/arm/dts/stm32mp15-scmi-u-boot.dtsi       | 167 ++++++++++++++++++
>  arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi |  57 ++++++
>  arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi |   6 +
>  arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi |  47 +++++
>  arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi |  17 ++
>  doc/board/st/stm32mp1.rst                     |  19 ++
>  7 files changed, 317 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 87b210dbb01..a6b5295afc3 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -1171,13 +1171,17 @@ dtb-$(CONFIG_STM32MP13x) += \
>  
>  dtb-$(CONFIG_STM32MP15x) += \
>  	stm32mp157a-dk1.dtb \
> +	stm32mp157a-dk1-scmi.dtb \
>  	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
>  	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
>  	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
>  	stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb \
>  	stm32mp157c-dk2.dtb \
> +	stm32mp157c-dk2-scmi.dtb \
>  	stm32mp157c-ed1.dtb \
> +	stm32mp157c-ed1-scmi.dtb \
>  	stm32mp157c-ev1.dtb \
> +	stm32mp157c-ev1-scmi.dtb \
>  	stm32mp157c-odyssey.dtb \
>  	stm32mp15xx-dhcom-drc02.dtb \
>  	stm32mp15xx-dhcom-pdk2.dtb \
> diff --git a/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
> new file mode 100644
> index 00000000000..314fc39a054
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + */
> +
> +/ {
> +	aliases {
> +		gpio0 = &gpioa;
> +		gpio1 = &gpiob;
> +		gpio2 = &gpioc;
> +		gpio3 = &gpiod;
> +		gpio4 = &gpioe;
> +		gpio5 = &gpiof;
> +		gpio6 = &gpiog;
> +		gpio7 = &gpioh;
> +		gpio8 = &gpioi;
> +		gpio9 = &gpioj;
> +		gpio10 = &gpiok;
> +		gpio25 = &gpioz;
> +		pinctrl0 = &pinctrl;
> +		pinctrl1 = &pinctrl_z;
> +	};
> +
> +	binman: binman {
> +		multiple-images;
> +	};
> +
> +	soc {
> +		u-boot,dm-pre-reloc;
> +
> +		ddr: ddr@5a003000 {
> +			u-boot,dm-pre-reloc;
> +
> +			compatible = "st,stm32mp1-ddr";
> +
> +			reg = <0x5a003000 0x550
> +			       0x5a004000 0x234>;
> +
> +			status = "okay";
> +		};
> +	};
> +
> +	/* need PSCI for sysreset during board_f */
> +	psci {
> +		u-boot,dm-pre-proper;
> +	};
> +};
> +
> +&bsec {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpioa {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpiob {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpioc {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpiod {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpioe {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpiof {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpiog {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpioh {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpioi {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpioj {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpiok {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&gpioz {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&optee {
> +	u-boot,dm-pre-proper;
> +};
> +
> +&iwdg2 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +/* pre-reloc probe = reserve video frame buffer in video_reserve() */
> +&ltdc {
> +	u-boot,dm-pre-proper;
> +};
> +
> +/* temp = waiting kernel update */
> +&m4_rproc {
> +	resets = <&scmi_reset RST_SCMI_MCU>,
> +		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
> +	reset-names = "mcu_rst", "hold_boot";
> +};
> +
> +&pinctrl {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&pinctrl_z {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&rcc {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&scmi {
> +	u-boot,dm-pre-proper;
> +};
> +
> +&usart1 {
> +	resets = <&rcc USART1_R>;
> +};
> +
> +&usart2 {
> +	resets = <&rcc USART2_R>;
> +};
> +
> +&usart3 {
> +	resets = <&rcc USART3_R>;
> +};
> +
> +&uart4 {
> +	resets = <&rcc UART4_R>;
> +};
> +
> +&uart5 {
> +	resets = <&rcc UART5_R>;
> +};
> +
> +&usart6 {
> +	resets = <&rcc USART6_R>;
> +};
> +
> +&uart7 {
> +	resets = <&rcc UART7_R>;
> +};
> +
> +&uart8{
> +	resets = <&rcc UART8_R>;
> +};
> diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
> new file mode 100644
> index 00000000000..2db045e7cec
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright : STMicroelectronics 2022
> + */
> +
> +#include <dt-bindings/clock/stm32mp1-clksrc.h>
> +#include "stm32mp15-scmi-u-boot.dtsi"
> +#include "stm32mp15-ddr3-1x4Gb-1066-binG.dtsi"
> +
> +/ {
> +	aliases {
> +		i2c3 = &i2c4;
> +		usb0 = &usbotg_hs;
> +	};
> +
> +	config {
> +		u-boot,boot-led = "heartbeat";
> +		u-boot,error-led = "error";
> +		u-boot,mmc-env-partition = "u-boot-env";
> +		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
> +		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	};
> +
> +	led {
> +		red {
> +			label = "error";
> +			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +			status = "okay";
> +		};
> +	};
> +};
> +
> +&adc {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&uart4_pins_a {
> +	u-boot,dm-pre-reloc;
> +	pins1 {
> +		u-boot,dm-pre-reloc;
> +	};
> +	pins2 {
> +		u-boot,dm-pre-reloc;
> +		/* pull-up on rx to avoid floating level */
> +		bias-pull-up;
> +	};
> +};
> +
> +&usbotg_hs {
> +	u-boot,force-b-session-valid;
> +};
> diff --git a/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi
> new file mode 100644
> index 00000000000..5a8fc15ab2b
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright : STMicroelectronics 2022
> + */
> +
> +#include "stm32mp157a-dk1-scmi-u-boot.dtsi"
> diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
> new file mode 100644
> index 00000000000..54662f7e290
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright : STMicroelectronics 2022
> + */
> +
> +#include <dt-bindings/clock/stm32mp1-clksrc.h>
> +#include "stm32mp15-scmi-u-boot.dtsi"
> +#include "stm32mp15-ddr3-2x4Gb-1066-binG.dtsi"
> +
> +/ {
> +	aliases {
> +		i2c3 = &i2c4;
> +	};
> +
> +	config {
> +		u-boot,boot-led = "heartbeat";
> +		u-boot,error-led = "error";
> +		u-boot,mmc-env-partition = "u-boot-env";
> +		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	};
> +
> +	led {
> +		red {
> +			label = "error";
> +			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +			status = "okay";
> +		};
> +	};
> +};
> +
> +&uart4 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&uart4_pins_a {
> +	u-boot,dm-pre-reloc;
> +	pins1 {
> +		u-boot,dm-pre-reloc;
> +	};
> +	pins2 {
> +		u-boot,dm-pre-reloc;
> +		/* pull-up on rx to avoid floating level */
> +		bias-pull-up;
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
> new file mode 100644
> index 00000000000..71a94f9130a
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright : STMicroelectronics 2022
> + */
> +
> +#include "stm32mp157c-ed1-scmi-u-boot.dtsi"
> +
> +/ {
> +	aliases {
> +		gpio26 = &stmfx_pinctrl;
> +		i2c1 = &i2c2;
> +		i2c4 = &i2c5;
> +		pinctrl2 = &stmfx_pinctrl;
> +		spi0 = &qspi;
> +		usb0 = &usbotg_hs;
> +	};
> +};
> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
> index 00f9b454421..3759df353ee 100644
> --- a/doc/board/st/stm32mp1.rst
> +++ b/doc/board/st/stm32mp1.rst
> @@ -77,6 +77,16 @@ Currently the following boards are supported:
>   + stm32mp157c-ev1.dts
>   + stm32mp15xx-dhcor-avenger96.dts
>  
> +The SCMI variant of each board is supported by a specific "scmi" device tree:
> + + stm32mp157a-dk1-scmi.dts
> + + stm32mp157c-dk2-scmi.dts
> + + stm32mp157c-ed1-scmi.dts
> + + stm32mp157c-ev1-scmi.dts
> +
> +SCMI variant is used only with stm32mp15_defconfig, when the resources are
> +secured with RCC_TZCR.TZEN=1 in OP-TEE. The access to these reset and clock
> +resources are provided by OP-TEE and the associated SCMI services.
> +
>  STM32MP13x
>  ``````````
>  
> @@ -136,6 +146,9 @@ TF-A_ (BL2) initialize the DDR and loads the next stage binaries from a FIP file
>       the secure monitor to access to secure resources.
>     + HW_CONFIG: The hardware configuration file = the U-Boot device tree
>  
> +The scmi variant of each device tree is only support with OP-TEE as secure
> +monitor, with stm32mp15_defconfig.
> +
>  The **Basic** boot chain with SPL (for STM32MP15x)
>  ``````````````````````````````````````````````````
>  
> @@ -248,6 +261,12 @@ Build Procedure
>  
>    a) trusted boot with FIP on STM32MP15x ev1::
>  
> +     # export KBUILD_OUTPUT=stm32mp15
> +     # make stm32mp15_defconfig
> +     # make DEVICE_TREE=stm32mp157c-ev1-scmi all
> +
> +    or without SCMI support
> +
>       # export KBUILD_OUTPUT=stm32mp15
>       # make stm32mp15_defconfig
>       # make DEVICE_TREE=stm32mp157c-ev1 all
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
