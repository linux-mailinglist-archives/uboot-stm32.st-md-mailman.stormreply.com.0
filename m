Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B34CA115D5
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 10:54:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DF4AC628B7
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 08:54:44 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E00DC628B6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 08:54:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b3so806965pfd.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=n7o7zRM+W9K9rjz4avC+kIkupmW7C+TQar0k3dZr0cA=;
 b=ymJV//WqjqTQ/dZOiatq4jwTgh+SjqMAyVvDttaZzlaUEzvLq6ORprOuc6KfK3bXNc
 myNUIIsT0IcYnTnI22P74vHq+Q/BLe5DAmxqjbrZxjJbAkDDFTNib7EQvQkIeEntrUhr
 fkG1GBpUwGHjUyllMUDpRmof4nclDGnVARWIQtuZkOgfvoTS9jZRuE/R1v8gE3jI5/Eu
 DqZBw8WnTNMgyAlIvkJscjVBIbVl3T4ed6PMMwcRfZxJ9vo4LER7it5OAGi0L5HOmF1M
 QnsGkQO9/ivSVzZeDdPFJjywpZ1FcJoy5deZhAqxtoN+rqITtcq00/mNWHCt8G6lWfG1
 bxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=n7o7zRM+W9K9rjz4avC+kIkupmW7C+TQar0k3dZr0cA=;
 b=MEQyRzNQlhNUxSur8SuvgiM6AWmxEKH0QxYd67co33c1rQLPRmReG7W3TzeiMcD1Hx
 ksdGqsE5ZHYjH1wnBU3wjFvIaMSNJhUEmUIiQU1V1PwOGLz1+ZSzm2IYdhd0QdDJxfRj
 orirJASDkR3WjXLgJrPg6GHMnV7CYiKigMEyeh8pP5Cja8DaIfn6AhndbKBp2IEa7+8l
 6wL4VG2zplLXtKREwel43Vfo5Y/EOLAa5YnOEGd9jZYFUUQptdpEj/jcOKvTST0XeaAZ
 mAWHWQqPgvc79Busj3lbblWS/8b3nq0832ea2y7JziBvB7uzIHeSLT2gyvC5VyIEyTiH
 +tgQ==
X-Gm-Message-State: APjAAAVYbP+Dd8eZk9TftRQahxI3/0pD6AVXwQpxMQ1LrsH3X9QPSgMd
 UVzTxifH4StOoHA72jTasmC1
X-Google-Smtp-Source: APXvYqxfZjP7Mct7Q/p245afax8xDjawDi/f/slnvfgkAC0UVis6Ju62jU/fgyA767CAEp7pUuXF5g==
X-Received: by 2002:a63:f64f:: with SMTP id u15mr2809036pgj.192.1556787281156; 
 Thu, 02 May 2019 01:54:41 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6284:a261:31df:f367:f70b:ed86])
 by smtp.gmail.com with ESMTPSA id h20sm111999162pfj.40.2019.05.02.01.54.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 01:54:39 -0700 (PDT)
Date: Thu, 2 May 2019 14:24:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Patrice CHOTARD <patrice.chotard@st.com>
Message-ID: <20190502085433.GB7425@Mani-XPS-13-9360>
References: <20190429120359.23332-1-manivannan.sadhasivam@linaro.org>
 <20190429120359.23332-3-manivannan.sadhasivam@linaro.org>
 <868fc1c2-d661-b352-24b5-86a2739d37d7@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <868fc1c2-d661-b352-24b5-86a2739d37d7@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "trini@konsulko.com" <trini@konsulko.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] board: stm32mp1: Add Avenger96 board
	support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, May 02, 2019 at 08:41:29AM +0000, Patrice CHOTARD wrote:
> Hi Manivannan
> =

> On 4/29/19 2:03 PM, Manivannan Sadhasivam wrote:
> > Add support for Avenger96 board from Arrow Electronics based on STM32MP=
157
> > MPU. This board is one of the Consumer Edition (CE) boards of the 96Boa=
rds
> > family and has the following features:
> > =

> > SoC: STM32MP157AAC
> > PMIC: STPMIC1A
> > RAM: 1024 Mbyte @ 533MHz
> > Storage: eMMC v4.51: 8 Gbyte
> >          microSD Socket: UHS-1 v3.01
> > Ethernet Port: 10/100/1000 Mbit/s, IEEE 802.3 Compliant
> > Wireless: WiFi 5 GHz & 2.4GHz IEEE 802.11a/b/g/n/ac
> >           Bluetooth=AEv4.2 (BR/EDR/BLE)
> > USB: 2x Type A (USB 2.0) Host and 1x Micro B (USB 2.0) OTG
> > Display: HDMI: WXGA (1366x768)@ 60 fps, HDMI 1.4
> > LED: 4x User LED, 1x WiFi LED, 1x BT LED
> > =

> > More information about this board can be found in 96Boards website:
> > https://www.96boards.org/product/avenger96/
> > =

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm/dts/Makefile                         |   1 +
> >  .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi | 177 +++++++++
> >  arch/arm/dts/stm32mp157a-avenger96.dts        | 362 ++++++++++++++++++
> >  board/st/stm32mp1/README                      |  23 ++
> >  4 files changed, 563 insertions(+)
> >  create mode 100644 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> >  create mode 100644 arch/arm/dts/stm32mp157a-avenger96.dts
> > =

> > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > index b4dc57edbd1..97a182f3abc 100644
> > --- a/arch/arm/dts/Makefile
> > +++ b/arch/arm/dts/Makefile
> > @@ -711,6 +711,7 @@ dtb-$(CONFIG_ARCH_STI) +=3D stih410-b2260.dtb
> >  =

> >  dtb-$(CONFIG_TARGET_STM32MP1) +=3D \
> >  	stm32mp157a-dk1.dtb \
> > +	stm32mp157a-avenger96.dtb \
> >  	stm32mp157c-dk2.dtb \
> >  	stm32mp157c-ed1.dtb \
> >  	stm32mp157c-ev1.dtb
> > diff --git a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi b/arch/arm/=
dts/stm32mp157a-avenger96-u-boot.dtsi
> > new file mode 100644
> > index 00000000000..dd6f0cf8b5f
> > --- /dev/null
> > +++ b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> > @@ -0,0 +1,177 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> > +/*
> > + * Copyright : STMicroelectronics 2018
> > + *
> > + * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
> > + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > + */
> > +
> > +#include <dt-bindings/clock/stm32mp1-clksrc.h>
> > +#include "stm32mp157-u-boot.dtsi"
> > +#include "stm32mp15-ddr3-2x4Gb-1066-binG.dtsi"
> > +
> > +/ {
> > +	aliases {
> > +		mmc0 =3D &sdmmc1;
> > +		mmc1 =3D &sdmmc2;
> > +		usb0 =3D &usbotg_hs;
> > +	};
> > +
> > +	config {
> > +		u-boot,boot-led =3D "led1";
> > +		u-boot,error-led =3D "led4";
> > +	};
> > +};
> > +
> > +&i2c4 {
> > +	u-boot,dm-pre-reloc;
> > +};
> > +
> > +&i2c4_pins_a {
> =

> Shouldn't be i2c4_pins_b instead ? This should be the root cause of your
> SPL issue.
> =


Nope. As I mentioned in v2, the culprit was UART and SDMMC. Please review t=
hat
one.

Thanks,
Mani

> > +	u-boot,dm-pre-reloc;
> > +	pins {
> > +		u-boot,dm-pre-reloc;
> > +	};
> > +};
> > +
> > +&pmic {
> > +	u-boot,dm-pre-reloc;
> > +};
> > +
> > +&rcc {
> > +	st,clksrc =3D <
> > +		CLK_MPU_PLL1P
> > +		CLK_AXI_PLL2P
> > +		CLK_MCU_PLL3P
> > +		CLK_PLL12_HSE
> > +		CLK_PLL3_HSE
> > +		CLK_PLL4_HSE
> > +		CLK_RTC_LSE
> > +		CLK_MCO1_DISABLED
> > +		CLK_MCO2_DISABLED
> > +	>;
> > +
> > +	st,clkdiv =3D <
> > +		1 /*MPU*/
> > +		0 /*AXI*/
> > +		0 /*MCU*/
> > +		1 /*APB1*/
> > +		1 /*APB2*/
> > +		1 /*APB3*/
> > +		1 /*APB4*/
> > +		2 /*APB5*/
> > +		23 /*RTC*/
> > +		0 /*MCO1*/
> > +		0 /*MCO2*/
> > +	>;
> > +
> > +	st,pkcs =3D <
> > +		CLK_CKPER_HSE
> > +		CLK_FMC_ACLK
> > +		CLK_QSPI_ACLK
> > +		CLK_ETH_DISABLED
> > +		CLK_SDMMC12_PLL4P
> > +		CLK_DSI_DSIPLL
> > +		CLK_STGEN_HSE
> > +		CLK_USBPHY_HSE
> > +		CLK_SPI2S1_PLL3Q
> > +		CLK_SPI2S23_PLL3Q
> > +		CLK_SPI45_HSI
> > +		CLK_SPI6_HSI
> > +		CLK_I2C46_HSI
> > +		CLK_SDMMC3_PLL4P
> > +		CLK_USBO_USBPHY
> > +		CLK_ADC_CKPER
> > +		CLK_CEC_LSE
> > +		CLK_I2C12_HSI
> > +		CLK_I2C35_HSI
> > +		CLK_UART1_HSI
> > +		CLK_UART24_HSI
> > +		CLK_UART35_HSI
> > +		CLK_UART6_HSI
> > +		CLK_UART78_HSI
> > +		CLK_SPDIF_PLL4P
> > +		CLK_FDCAN_PLL4Q
> > +		CLK_SAI1_PLL3Q
> > +		CLK_SAI2_PLL3Q
> > +		CLK_SAI3_PLL3Q
> > +		CLK_SAI4_PLL3Q
> > +		CLK_RNG1_LSI
> > +		CLK_RNG2_LSI
> > +		CLK_LPTIM1_PCLK1
> > +		CLK_LPTIM23_PCLK3
> > +		CLK_LPTIM45_LSE
> > +	>;
> > +
> > +	/* VCO =3D 1300.0 MHz =3D> P =3D 650 (CPU) */
> > +	pll1: st,pll@0 {
> > +		cfg =3D < 2 80 0 0 0 PQR(1,0,0) >;
> > +		frac =3D < 0x800 >;
> > +		u-boot,dm-pre-reloc;
> > +	};
> > +
> > +	/* VCO =3D 1066.0 MHz =3D> P =3D 266 (AXI), Q =3D 533 (GPU), R =3D 53=
3 (DDR) */
> > +	pll2: st,pll@1 {
> > +		cfg =3D < 2 65 1 0 0 PQR(1,1,1) >;
> > +		frac =3D < 0x1400 >;
> > +		u-boot,dm-pre-reloc;
> > +	};
> > +
> > +	/* VCO =3D 417.8 MHz =3D> P =3D 209, Q =3D 24, R =3D 11 */
> > +	pll3: st,pll@2 {
> > +		cfg =3D < 1 33 1 16 36 PQR(1,1,1) >;
> > +		frac =3D < 0x1a04 >;
> > +		u-boot,dm-pre-reloc;
> > +	};
> > +
> > +	/* VCO =3D 480.0 MHz =3D> P =3D 120, Q =3D 40, R =3D 96 */
> > +	pll4: st,pll@3 {
> > +		cfg =3D < 1 39 3 11 4 PQR(1,1,1) >;
> > +		u-boot,dm-pre-reloc;
> > +	};
> > +};
> > +
> > +&sdmmc1 {
> > +	u-boot,dm-spl;
> > +};
> > +
> > +&sdmmc1_b4_pins_a {
> > +	u-boot,dm-spl;
> > +	pins {
> > +		u-boot,dm-spl;
> > +	};
> > +};
> > +
> > +&sdmmc2 {
> > +	u-boot,dm-spl;
> > +};
> > +
> > +&sdmmc2_b4_pins_a {
> > +	u-boot,dm-spl;
> > +	pins {
> > +		u-boot,dm-spl;
> > +	};
> > +};
> > +
> > +&uart4 {
> > +	u-boot,dm-pre-reloc;
> > +};
> > +
> > +&uart4_pins_a {
> > +	u-boot,dm-pre-reloc;
> > +	pins1 {
> > +		u-boot,dm-pre-reloc;
> > +	};
> > +	pins2 {
> > +		u-boot,dm-pre-reloc;
> > +	};
> > +};
> > +
> > +&usbotg_hs {
> > +	u-boot,force-b-session-valid;
> > +	hnp-srp-disable;
> > +};
> > +
> > +&v3v3 {
> > +	regulator-always-on;
> > +};
> > diff --git a/arch/arm/dts/stm32mp157a-avenger96.dts b/arch/arm/dts/stm3=
2mp157a-avenger96.dts
> > new file mode 100644
> > index 00000000000..dd0859769bf
> > --- /dev/null
> > +++ b/arch/arm/dts/stm32mp157a-avenger96.dts
> > @@ -0,0 +1,362 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> > +/*
> > + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> > + * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelect=
ronics.
> > + *
> > + * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
> > + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "stm32mp157c.dtsi"
> > +#include "stm32mp157-pinctrl.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/mfd/st,stpmic1.h>
> > +
> > +/ {
> > +	model =3D "Arrow Electronics STM32MP157A Avenger96 board";
> > +	compatible =3D "st,stm32mp157a-avenger96", "st,stm32mp157";
> > +
> > +	aliases {
> > +		ethernet0 =3D &ethernet0;
> > +		serial0 =3D &uart4;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	memory@c0000000 {
> > +		reg =3D <0xc0000000 0x40000000>;
> > +	};
> > +
> > +	led {
> > +		compatible =3D "gpio-leds";
> > +		led1 {
> > +			label =3D "green:user1";
> > +			gpios =3D <&gpioz 7 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger =3D "heartbeat";
> > +			default-state =3D "off";
> > +		};
> > +
> > +		led2 {
> > +			label =3D "green:user2";
> > +			gpios =3D <&gpiof 3 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger =3D "mmc0";
> > +			default-state =3D "off";
> > +		};
> > +
> > +		led3 {
> > +			label =3D "green:user3";
> > +			gpios =3D <&gpiog 0 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger =3D "mmc1";
> > +			default-state =3D "off";
> > +		};
> > +
> > +		led4 {
> > +			label =3D "green:user3";
> > +			gpios =3D <&gpiog 1 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger =3D "none";
> > +			default-state =3D "off";
> > +			panic-indicator;
> > +		};
> > +
> > +		led5 {
> > +			label =3D "yellow:wifi";
> > +			gpios =3D <&gpioz 3 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger =3D "phy0tx";
> > +			default-state =3D "off";
> > +		};
> > +
> > +		led6 {
> > +			label =3D "blue:bt";
> > +			gpios =3D <&gpioz 6 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger =3D "bluetooth-power";
> > +			default-state =3D "off";
> > +		};
> > +	};
> > +};
> > +
> > +&ethernet0 {
> > +	status =3D "okay";
> > +	pinctrl-0 =3D <&ethernet0_rgmii_pins_a>;
> > +	pinctrl-1 =3D <&ethernet0_rgmii_pins_sleep_a>;
> > +	pinctrl-names =3D "default", "sleep";
> > +	phy-mode =3D "rgmii";
> > +	max-speed =3D <1000>;
> > +	phy-handle =3D <&phy0>;
> > +
> > +	mdio0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		compatible =3D "snps,dwmac-mdio";
> > +		phy0: ethernet-phy@7 {
> > +			reg =3D <7>;
> > +		};
> > +	};
> > +};
> > +
> > +&i2c1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c1_pins_b>;
> > +	i2c-scl-rising-time-ns =3D <185>;
> > +	i2c-scl-falling-time-ns =3D <20>;
> > +	status =3D "okay";
> > +	/delete-property/dmas;
> > +	/delete-property/dma-names;
> > +};
> > +
> > +&i2c2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c2_pins_b>;
> > +	i2c-scl-rising-time-ns =3D <185>;
> > +	i2c-scl-falling-time-ns =3D <20>;
> > +	status =3D "okay";
> > +	/delete-property/dmas;
> > +	/delete-property/dma-names;
> > +};
> > +
> > +&i2c4 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c4_pins_a>;
> > +	i2c-scl-rising-time-ns =3D <185>;
> > +	i2c-scl-falling-time-ns =3D <20>;
> > +	status =3D "okay";
> > +	/delete-property/dmas;
> > +	/delete-property/dma-names;
> > +
> > +	pmic: stpmic@33 {
> > +		compatible =3D "st,stpmic1";
> > +		reg =3D <0x33>;
> > +		interrupts-extended =3D <&exti 55 IRQ_TYPE_EDGE_FALLING>;
> > +		interrupt-controller;
> > +		#interrupt-cells =3D <2>;
> > +		status =3D "okay";
> > +
> > +		st,main-control-register =3D <0x04>;
> > +		st,vin-control-register =3D <0xc0>;
> > +		st,usb-control-register =3D <0x30>;
> > +
> > +		regulators {
> > +			compatible =3D "st,stpmic1-regulators";
> > +
> > +			ldo1-supply =3D <&v3v3>;
> > +			ldo2-supply =3D <&v3v3>;
> > +			ldo3-supply =3D <&vdd_ddr>;
> > +			ldo5-supply =3D <&v3v3>;
> > +			ldo6-supply =3D <&v3v3>;
> > +			pwr_sw1-supply =3D <&bst_out>;
> > +			pwr_sw2-supply =3D <&bst_out>;
> > +
> > +			vddcore: buck1 {
> > +				regulator-name =3D "vddcore";
> > +				regulator-min-microvolt =3D <800000>;
> > +				regulator-max-microvolt =3D <1350000>;
> > +				regulator-always-on;
> > +				regulator-initial-mode =3D <2>;
> > +				regulator-over-current-protection;
> > +			};
> > +
> > +			vdd_ddr: buck2 {
> > +				regulator-name =3D "vdd_ddr";
> > +				regulator-min-microvolt =3D <1350000>;
> > +				regulator-max-microvolt =3D <1350000>;
> > +				regulator-always-on;
> > +				regulator-initial-mode =3D <2>;
> > +				regulator-over-current-protection;
> > +			};
> > +
> > +			vdd: buck3 {
> > +				regulator-name =3D "vdd";
> > +				regulator-min-microvolt =3D <2500000>;
> > +				regulator-max-microvolt =3D <2500000>;
> > +				regulator-always-on;
> > +				st,mask_reset;
> > +				regulator-initial-mode =3D <8>;
> > +				regulator-over-current-protection;
> > +			};
> > +
> > +			v3v3: buck4 {
> > +				regulator-name =3D "v3v3";
> > +				regulator-min-microvolt =3D <3300000>;
> > +				regulator-max-microvolt =3D <3300000>;
> > +				regulator-always-on;
> > +				regulator-over-current-protection;
> > +				regulator-initial-mode =3D <8>;
> > +			};
> > +
> > +			vdda: ldo1 {
> > +				regulator-name =3D "vdda";
> > +				regulator-min-microvolt =3D <2900000>;
> > +				regulator-max-microvolt =3D <2900000>;
> > +				interrupts =3D <IT_CURLIM_LDO1 0>;
> > +				interrupt-parent =3D <&pmic>;
> > +			};
> > +
> > +			v2v8: ldo2 {
> > +				regulator-name =3D "v2v8";
> > +				regulator-min-microvolt =3D <2800000>;
> > +				regulator-max-microvolt =3D <2800000>;
> > +				interrupts =3D <IT_CURLIM_LDO2 0>;
> > +				interrupt-parent =3D <&pmic>;
> > +			};
> > +
> > +			vtt_ddr: ldo3 {
> > +				regulator-name =3D "vtt_ddr";
> > +				regulator-min-microvolt =3D <0000000>;
> > +				regulator-max-microvolt =3D <1000000>;
> > +				regulator-always-on;
> > +				regulator-over-current-protection;
> > +			};
> > +
> > +			vdd_usb: ldo4 {
> > +				regulator-name =3D "vdd_usb";
> > +				regulator-min-microvolt =3D <3300000>;
> > +				regulator-max-microvolt =3D <3300000>;
> > +				interrupts =3D <IT_CURLIM_LDO4 0>;
> > +				interrupt-parent =3D <&pmic>;
> > +			};
> > +
> > +			vdd_sd: ldo5 {
> > +				regulator-name =3D "vdd_sd";
> > +				regulator-min-microvolt =3D <2900000>;
> > +				regulator-max-microvolt =3D <2900000>;
> > +				interrupts =3D <IT_CURLIM_LDO5 0>;
> > +				interrupt-parent =3D <&pmic>;
> > +				regulator-boot-on;
> > +			};
> > +
> > +			v1v8: ldo6 {
> > +				regulator-name =3D "v1v8";
> > +				regulator-min-microvolt =3D <1800000>;
> > +				regulator-max-microvolt =3D <1800000>;
> > +				interrupts =3D <IT_CURLIM_LDO6 0>;
> > +				interrupt-parent =3D <&pmic>;
> > +			};
> > +
> > +			vref_ddr: vref_ddr {
> > +				regulator-name =3D "vref_ddr";
> > +				regulator-always-on;
> > +				regulator-over-current-protection;
> > +			};
> > +
> > +			bst_out: boost {
> > +				regulator-name =3D "bst_out";
> > +				interrupts =3D <IT_OCP_BOOST 0>;
> > +				interrupt-parent =3D <&pmic>;
> > +			};
> > +
> > +			vbus_otg: pwr_sw1 {
> > +				regulator-name =3D "vbus_otg";
> > +				interrupts =3D <IT_OCP_OTG 0>;
> > +				interrupt-parent =3D <&pmic>;
> > +				regulator-active-discharge;
> > +			};
> > +
> > +			vbus_sw: pwr_sw2 {
> > +				regulator-name =3D "vbus_sw";
> > +				interrupts =3D <IT_OCP_SWOUT 0>;
> > +				interrupt-parent =3D <&pmic>;
> > +				regulator-active-discharge;
> > +			};
> > +		};
> > +
> > +		onkey {
> > +			compatible =3D "st,stpmic1-onkey";
> > +			interrupts =3D <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
> > +			interrupt-names =3D "onkey-falling", "onkey-rising";
> > +			status =3D "okay";
> > +		};
> > +
> > +		watchdog {
> > +			compatible =3D "st,stpmic1-wdt";
> > +			status =3D "disabled";
> > +		};
> > +	};
> > +};
> > +
> > +&iwdg2 {
> > +	timeout-sec =3D <32>;
> > +	status =3D "okay";
> > +};
> > +
> > +&pwr {
> > +	pwr-supply =3D <&vdd>;
> > +};
> > +
> > +&rng1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&rtc {
> > +	status =3D "okay";
> > +};
> > +
> > +&sdmmc1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
> > +	broken-cd;
> > +	st,sig-dir;
> > +	st,neg-edge;
> > +	st,use-ckin;
> > +	bus-width =3D <4>;
> > +	vmmc-supply =3D <&vdd_sd>;
> > +	status =3D "okay";
> > +};
> > +
> > +&sdmmc2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> > +	non-removable;
> > +	no-sd;
> > +	no-sdio;
> > +	st,neg-edge;
> > +	bus-width =3D <8>;
> > +	vmmc-supply =3D <&v3v3>;
> > +	mmc-ddr-3_3v;
> > +	status =3D "okay";
> > +};
> > +
> > +&spi2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&spi2_pins_a>;
> > +	status =3D "okay";
> > +};
> > +
> > +&uart4 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart4_pins_b>;
> > +	status =3D "okay";
> > +};
> > +
> > +&uart7 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart7_pins_a>;
> > +	status =3D "okay";
> > +};
> > +
> > +&usbh_ehci {
> > +	phys =3D <&usbphyc_port0>;
> > +	phy-names =3D "usb";
> > +	status =3D "okay";
> > +};
> > +
> > +&usbotg_hs {
> > +	dr_mode =3D "peripheral";
> > +	phys =3D <&usbphyc_port1 0>;
> > +	phy-names =3D "usb2-phy";
> > +	status =3D "okay";
> > +};
> > +
> > +&usbphyc {
> > +	status =3D "okay";
> > +};
> > +
> > +&usbphyc_port0 {
> > +	phy-supply =3D <&vdd_usb>;
> > +};
> > +
> > +&usbphyc_port1 {
> > +	phy-supply =3D <&vdd_usb>;
> > +};
> > diff --git a/board/st/stm32mp1/README b/board/st/stm32mp1/README
> > index 1cd3534ae4e..b0c83250612 100644
> > --- a/board/st/stm32mp1/README
> > +++ b/board/st/stm32mp1/README
> > @@ -37,6 +37,7 @@ Currently the following boards are supported:
> >  + stm32mp157c-ed1
> >  + stm32mp157a-dk1
> >  + stm32mp157c-dk2
> > ++ stm32mp157a-avenger96
> >  =

> >  3. Boot Sequences
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > @@ -84,6 +85,9 @@ the supported device trees for stm32mp157 are:
> >  + dk2: Discovery board =3D dk1 with a BT/WiFI combo and a DSI panel
> >    dts: stm32mp157c-dk2
> >  =

> > ++ avenger96: Avenger96 board from Arrow Electronics
> > +  dts: stm32mp157a-avenger96
> > +
> >  5. Build Procedure
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =

> > @@ -140,6 +144,11 @@ the supported device trees for stm32mp157 are:
> >  	# make stm32mp15_basic_defconfig
> >  	# make DEVICE_TREE=3Dstm32mp157c-dk2 all
> >  =

> > +  d) basic boot on avenger96
> > +	# export KBUILD_OUTPUT=3Dstm32mp15_basic
> > +	# make stm32mp15_basic_defconfig
> > +	# make DEVICE_TREE=3Dstm32mp157a-avenger96 all
> > +
> >  6. Output files
> >  =

> >    BootRom and TF-A expect binaries with STM32 image header
> > @@ -182,6 +191,20 @@ You can select the boot mode, on the board ed1 wit=
h the switch SW1
> >    SD-Card	1      1
> >    Recovery	0      0
> >  =

> > +- Boot mode of Avenger96 can be selected using switch S3
> > +
> > + -----------------------------------
> > +  Boot Mode   BOOT2   BOOT1   BOOT0
> > + -----------------------------------
> > +  Recovery	0	0	0
> > +  NOR		0	0	1
> > +  SD-Card	1	0	1
> > +  eMMC		0	1	0
> > +  NAND		0	1	1
> > +  Reserved	1	0	0
> > +  Recovery	1	1	0
> > +  SD-Card	1	1	1
> > +
> >  Recovery is a boot from serial link (UART/USB) and it is used with
> >  STM32CubeProgrammer tool to load executable in RAM and to update the f=
lash
> >  devices available on the board (NOR/NAND/eMMC/SDCARD).
> > =

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
