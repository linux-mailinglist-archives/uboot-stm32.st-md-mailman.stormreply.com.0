Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25A9E36F
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Aug 2019 10:58:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BCF4C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Aug 2019 08:58:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA4E4C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2019 13:48:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QDlHgs018313; Mon, 26 Aug 2019 15:48:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=NyTcbE0/w7wJWk0RcWz058Jn0ULybeElemd6fhLNAB0=;
 b=yDmCVaxaJ2XBrFmeZ7Zy70fqnH8LZUk3QQXSaw+GAMnYHIseCHG0+Gob1yPPm4jHD+z5
 nrgOKmzUo9kkGlJx18ciX8PpaWYh/nIwb89ofA+xpqmEMahXJoGesxwn+q67ILja6eP+
 8/Ef2b73Fh/mhTDMkXhbrFvIX7eRcC96X9j9HvnmgPcmS29VVH3nItVbbnobBnYZxg8b
 ziIkU0kKutampfdqRuCSA0T7XOWnoIN8TjsG8tBOiNWT3C3HREDbcLJsn5+zGvOF1IX1
 n9rCV5XM1Ej5+gZSYsbi9ePxzQocKXhF9XHavhwb5TMYYP/FAJf9AF18+HrIOG22+XS+ nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2ujtcbc8p9-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 26 Aug 2019 15:48:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 326D331;
 Mon, 26 Aug 2019 13:48:22 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 149592220CE;
 Mon, 26 Aug 2019 15:48:17 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 26 Aug
 2019 15:48:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 26 Aug 2019 15:48:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] ARM: dts: stih410-b2260: Sync DT with kernel v5.2
Thread-Index: AQHVQVtH8Up8bpI4ZUWofAJI4wLy5qcNhZOA
Date: Mon, 26 Aug 2019 13:48:16 +0000
Message-ID: <84310204-7e19-bb40-2d55-12f64d8d2de8@st.com>
References: <20190723133330.28441-1-patrice.chotard@st.com>
In-Reply-To: <20190723133330.28441-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <EF4859366847FD4190F00C23EAB9381D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_07:, , signatures=0
X-Mailman-Approved-At: Tue, 27 Aug 2019 08:58:57 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stih410-b2260: Sync DT with
	kernel v5.2
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


On 7/23/19 3:33 PM, Patrice Chotard wrote:
> Synchronize U-boot DT with kernel v5.2 for stih410-b2260.
> Update stih410-b2260-u-boot.dtsi accordingly.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
>  arch/arm/dts/stih407-clock.dtsi        | 113 ++++++------
>  arch/arm/dts/stih407-family.dtsi       | 200 ++++++++++++----------
>  arch/arm/dts/stih407-pinctrl.dtsi      | 129 +++++---------
>  arch/arm/dts/stih410-b2260-u-boot.dtsi |  17 ++
>  arch/arm/dts/stih410-b2260.dts         | 128 +++++++-------
>  arch/arm/dts/stih410-clock.dtsi        | 110 ++++++------
>  arch/arm/dts/stih410-pinctrl.dtsi      |   7 +-
>  arch/arm/dts/stih410.dtsi              | 227 ++++---------------------
>  8 files changed, 370 insertions(+), 561 deletions(-)
>
> diff --git a/arch/arm/dts/stih407-clock.dtsi b/arch/arm/dts/stih407-clock.dtsi
> index 13029c03d7..1ab40db7c9 100644
> --- a/arch/arm/dts/stih407-clock.dtsi
> +++ b/arch/arm/dts/stih407-clock.dtsi
> @@ -1,38 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2014 STMicroelectronics R&D Limited
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
>   */
>  #include <dt-bindings/clock/stih407-clks.h>
>  / {
> +	/*
> +	 * Fixed 30MHz oscillator inputs to SoC
> +	 */
> +	clk_sysin: clk-sysin {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <30000000>;
> +	};
> +
> +	clk_tmdsout_hdmi: clk-tmdsout-hdmi {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +	};
> +
>  	clocks {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges;
>  
> -		/*
> -		 * Fixed 30MHz oscillator inputs to SoC
> -		 */
> -		clk_sysin: clk-sysin {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <30000000>;
> -		};
> -
> -		/*
> -		 * ARM Peripheral clock for timers
> -		 */
> -		arm_periph_clk: clk-m-a9-periphs {
> -			#clock-cells = <0>;
> -			compatible = "fixed-factor-clock";
> -
> -			clocks = <&clk_m_a9>;
> -			clock-div = <2>;
> -			clock-mult = <1>;
> -		};
> -
>  		/*
>  		 * A9 PLL.
>  		 */
> @@ -62,35 +53,22 @@
>  				 <&clockgen_a9_pll 0>,
>  				 <&clk_s_c0_flexgen 13>,
>  				 <&clk_m_a9_ext2f_div2>;
> -		};
>  
> -		/*
> -		 * ARM Peripheral clock for timers
> -		 */
> -		clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
> -			#clock-cells = <0>;
> -			compatible = "fixed-factor-clock";
>  
> -			clocks = <&clk_s_c0_flexgen 13>;
> -
> -			clock-output-names = "clk-m-a9-ext2f-div2";
> -
> -			clock-div = <2>;
> -			clock-mult = <1>;
> -		};
> +			/*
> +			 * ARM Peripheral clock for timers
> +			 */
> +			arm_periph_clk: clk-m-a9-periphs {
> +				#clock-cells = <0>;
> +				compatible = "fixed-factor-clock";
>  
> -		/*
> -		 * Bootloader initialized system infrastructure clock for
> -		 * serial devices.
> -		 */
> -		clk_ext2f_a9: clockgen-c0@13 {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <200000000>;
> -			clock-output-names = "clk-s-icn-reg-0";
> +				clocks = <&clk_m_a9>;
> +				clock-div = <2>;
> +				clock-mult = <1>;
> +			};
>  		};
>  
> -		clockgen-a@090ff000 {
> +		clockgen-a@90ff000 {
>  			compatible = "st,clkgen-c32";
>  			reg = <0x90ff000 0x1000>;
>  
> @@ -101,6 +79,7 @@
>  				clocks = <&clk_sysin>;
>  
>  				clock-output-names = "clk-s-a0-pll-ofd-0";
> +				clock-critical = <0>; /* clk-s-a0-pll-ofd-0 */
>  			};
>  
>  			clk_s_a0_flexgen: clk-s-a0-flexgen {
> @@ -112,6 +91,7 @@
>  					 <&clk_sysin>;
>  
>  				clock-output-names = "clk-ic-lmi0";
> +				clock-critical = <CLK_IC_LMI0>;
>  			};
>  		};
>  
> @@ -126,9 +106,10 @@
>  					     "clk-s-c0-fs0-ch1",
>  					     "clk-s-c0-fs0-ch2",
>  					     "clk-s-c0-fs0-ch3";
> +			clock-critical = <0>; /* clk-s-c0-fs0-ch0 */
>  		};
>  
> -		clk_s_c0: clockgen-c@09103000 {
> +		clk_s_c0: clockgen-c@9103000 {
>  			compatible = "st,clkgen-c32";
>  			reg = <0x9103000 0x1000>;
>  
> @@ -139,6 +120,7 @@
>  				clocks = <&clk_sysin>;
>  
>  				clock-output-names = "clk-s-c0-pll0-odf-0";
> +				clock-critical = <0>; /* clk-s-c0-pll0-odf-0 */
>  			};
>  
>  			clk_s_c0_pll1: clk-s-c0-pll1 {
> @@ -194,6 +176,27 @@
>  						     "clk-main-disp",
>  						     "clk-aux-disp",
>  						     "clk-compo-dvp";
> +				clock-critical = <CLK_PROC_STFE>,
> +						 <CLK_ICN_CPU>,
> +						 <CLK_TX_ICN_DMU>,
> +						 <CLK_EXT2F_A9>,
> +						 <CLK_ICN_LMI>,
> +						 <CLK_ICN_SBC>;
> +
> +				/*
> +				 * ARM Peripheral clock for timers
> +				 */
> +				clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
> +					#clock-cells = <0>;
> +					compatible = "fixed-factor-clock";
> +
> +					clocks = <&clk_s_c0_flexgen 13>;
> +
> +					clock-output-names = "clk-m-a9-ext2f-div2";
> +
> +					clock-div = <2>;
> +					clock-mult = <1>;
> +				};
>  			};
>  		};
>  
> @@ -210,7 +213,7 @@
>  					     "clk-s-d0-fs0-ch3";
>  		};
>  
> -		clockgen-d0@09104000 {
> +		clockgen-d0@9104000 {
>  			compatible = "st,clkgen-c32";
>  			reg = <0x9104000 0x1000>;
>  
> @@ -244,13 +247,7 @@
>  					     "clk-s-d2-fs0-ch3";
>  		};
>  
> -		clk_tmdsout_hdmi: clk-tmdsout-hdmi {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <0>;
> -		};
> -
> -		clockgen-d2@x9106000 {
> +		clockgen-d2@9106000 {
>  			compatible = "st,clkgen-c32";
>  			reg = <0x9106000 0x1000>;
>  
> diff --git a/arch/arm/dts/stih407-family.dtsi b/arch/arm/dts/stih407-family.dtsi
> index 6c6de58029..7c36c37260 100644
> --- a/arch/arm/dts/stih407-family.dtsi
> +++ b/arch/arm/dts/stih407-family.dtsi
> @@ -1,10 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2014 STMicroelectronics Limited.
>   * Author: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * publishhed by the Free Software Foundation.
>   */
>  #include "stih407-pinctrl.dtsi"
>  #include <dt-bindings/mfd/st-lpc.h>
> @@ -20,7 +17,13 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> -		dmu_reserved: rproc@44000000 {
> +		gp0_reserved: rproc@45000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x45000000 0x00400000>;
> +			no-map;
> +		};
> +
> +		delta_reserved: rproc@44000000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x44000000 0x01000000>;
>  			no-map;
> @@ -47,6 +50,7 @@
>  			clocks = <&clk_m_a9>;
>  			clock-names = "cpu";
>  			clock-latency = <100000>;
> +			cpu0-supply = <&pwm_regulator>;
>  			st,syscfg = <&syscfg_core 0x8e0>;
>  		};
>  		cpu@1 {
> @@ -65,19 +69,19 @@
>  		};
>  	};
>  
> -	intc: interrupt-controller@08761000 {
> +	intc: interrupt-controller@8761000 {
>  		compatible = "arm,cortex-a9-gic";
>  		#interrupt-cells = <3>;
>  		interrupt-controller;
>  		reg = <0x08761000 0x1000>, <0x08760100 0x100>;
>  	};
>  
> -	scu@08760000 {
> +	scu@8760000 {
>  		compatible = "arm,cortex-a9-scu";
>  		reg = <0x08760000 0x1000>;
>  	};
>  
> -	timer@08760200 {
> +	timer@8760200 {
>  		interrupt-parent = <&intc>;
>  		compatible = "arm,cortex-a9-global-timer";
>  		reg = <0x08760200 0x100>;
> @@ -85,7 +89,7 @@
>  		clocks = <&arm_periph_clk>;
>  	};
>  
> -	l2: cache-controller {
> +	l2: cache-controller@8762000 {
>  		compatible = "arm,pl310-cache";
>  		reg = <0x08762000 0x1000>;
>  		arm,data-latency = <3 3 3>;
> @@ -118,24 +122,28 @@
>  		ranges;
>  		compatible = "simple-bus";
>  
> -		restart {
> +		restart: restart-controller@0 {
>  			compatible = "st,stih407-restart";
> +			reg = <0 0>;
>  			st,syscfg = <&syscfg_sbc_reg>;
>  			status = "okay";
>  		};
>  
> -		powerdown: powerdown-controller {
> +		powerdown: powerdown-controller@0 {
>  			compatible = "st,stih407-powerdown";
> +			reg = <0 0>;
>  			#reset-cells = <1>;
>  		};
>  
> -		softreset: softreset-controller {
> +		softreset: softreset-controller@0 {
>  			compatible = "st,stih407-softreset";
> +			reg = <0 0>;
>  			#reset-cells = <1>;
>  		};
>  
> -		picophyreset: picophyreset-controller {
> +		picophyreset: picophyreset-controller@0 {
>  			compatible = "st,stih407-picophyreset";
> +			reg = <0 0>;
>  			#reset-cells = <1>;
>  		};
>  
> @@ -167,6 +175,13 @@
>  		syscfg_core: core-syscfg@92b0000 {
>  			compatible = "st,stih407-core-syscfg", "syscon";
>  			reg = <0x92b0000 0x1000>;
> +
> +			sti_sasg_codec: sti-sasg-codec {
> +				compatible = "st,stih407-sas-codec";
> +				#sound-dai-cells = <1>;
> +				status = "disabled";
> +				st,syscfg = <&syscfg_core>;
> +			};
>  		};
>  
>  		syscfg_lpm: lpm-syscfg@94b5100 {
> @@ -174,8 +189,9 @@
>  			reg = <0x94b5100 0x1000>;
>  		};
>  
> -		irq-syscfg {
> +		irq-syscfg@0 {
>  			compatible    = "st,stih407-irq-syscfg";
> +			reg = <0 0>;
>  			st,syscfg     = <&syscfg_core>;
>  			st,irq-device = <ST_IRQ_SYSCFG_PMU_0>,
>  					<ST_IRQ_SYSCFG_PMU_1>;
> @@ -187,22 +203,21 @@
>  		vtg_main: sti-vtg-main@8d02800 {
>  			compatible = "st,vtg";
>  			reg = <0x8d02800 0x200>;
> -			interrupts = <GIC_SPI 108 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
>  		vtg_aux: sti-vtg-aux@8d00200 {
>  			compatible = "st,vtg";
>  			reg = <0x8d00200 0x100>;
> -			interrupts = <GIC_SPI 109 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
>  		serial@9830000 {
>  			compatible = "st,asc";
>  			reg = <0x9830000 0x2c>;
> -			interrupts = <GIC_SPI 122 IRQ_TYPE_NONE>;
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&pinctrl_serial0>;
> +			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +			/* Pinctrl moved out to a per-board configuration */
>  
>  			status = "disabled";
>  		};
> @@ -210,7 +225,7 @@
>  		serial@9831000 {
>  			compatible = "st,asc";
>  			reg = <0x9831000 0x2c>;
> -			interrupts = <GIC_SPI 123 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_serial1>;
>  			clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
> @@ -221,7 +236,7 @@
>  		serial@9832000 {
>  			compatible = "st,asc";
>  			reg = <0x9832000 0x2c>;
> -			interrupts = <GIC_SPI 124 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_serial2>;
>  			clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
> @@ -233,7 +248,7 @@
>  		sbc_serial0: serial@9530000 {
>  			compatible = "st,asc";
>  			reg = <0x9530000 0x2c>;
> -			interrupts = <GIC_SPI 138 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_sbc_serial0>;
>  			clocks = <&clk_sysin>;
> @@ -244,7 +259,7 @@
>  		serial@9531000 {
>  			compatible = "st,asc";
>  			reg = <0x9531000 0x2c>;
> -			interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_sbc_serial1>;
>  			clocks = <&clk_sysin>;
> @@ -374,8 +389,9 @@
>  			status = "disabled";
>  		};
>  
> -		usb2_picophy0: phy1 {
> +		usb2_picophy0: phy1@0 {
>  			compatible = "st,stih407-usb2-phy";
> +			reg = <0 0>;
>  			#phy-cells = <0>;
>  			st,syscfg = <&syscfg_core 0x100 0xf4>;
>  			resets = <&softreset STIH407_PICOPHY_SOFTRESET>,
> @@ -383,12 +399,13 @@
>  			reset-names = "global", "port";
>  		};
>  
> -		miphy28lp_phy: miphy28lp@9b22000 {
> +		miphy28lp_phy: miphy28lp@0 {
>  			compatible = "st,miphy28lp-phy";
>  			st,syscfg = <&syscfg_core>;
>  			#address-cells	= <1>;
>  			#size-cells	= <1>;
>  			ranges;
> +			reg = <0 0>;
>  
>  			phy_port0: port@9b22000 {
>  				reg = <0x9b22000 0xff>,
> @@ -458,6 +475,8 @@
>  			clock-names = "ssc";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_spi1_default>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>  
>  			status = "disabled";
>  		};
> @@ -470,6 +489,8 @@
>  			clock-names = "ssc";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_spi2_default>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>  
>  			status = "disabled";
>  		};
> @@ -482,6 +503,8 @@
>  			clock-names = "ssc";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_spi3_default>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>  
>  			status = "disabled";
>  		};
> @@ -494,6 +517,8 @@
>  			clock-names = "ssc";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_spi4_default>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>  
>  			status = "disabled";
>  		};
> @@ -507,6 +532,8 @@
>  			clock-names = "ssc";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_spi10_default>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>  
>  			status = "disabled";
>  		};
> @@ -519,6 +546,8 @@
>  			clock-names = "ssc";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_spi11_default>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>  
>  			status = "disabled";
>  		};
> @@ -531,16 +560,18 @@
>  			clock-names = "ssc";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_spi12_default>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>  
>  			status = "disabled";
>  		};
>  
> -		mmc0: sdhci@09060000 {
> +		mmc0: sdhci@9060000 {
>  			compatible = "st,sdhci-stih407", "st,sdhci";
>  			status = "disabled";
>  			reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
>  			reg-names = "mmc", "top-mmc-delay";
> -			interrupts = <GIC_SPI 92 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "mmcirq";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_mmc0>;
> @@ -550,12 +581,12 @@
>  			bus-width = <8>;
>  		};
>  
> -		mmc1: sdhci@09080000 {
> +		mmc1: sdhci@9080000 {
>  			compatible = "st,sdhci-stih407", "st,sdhci";
>  			status = "disabled";
>  			reg = <0x09080000 0x7ff>;
>  			reg-names = "mmc";
> -			interrupts = <GIC_SPI 90 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "mmcirq";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_sd1>;
> @@ -563,7 +594,6 @@
>  			clocks = <&clk_s_c0_flexgen CLK_MMC_1>,
>  				 <&clk_s_c0_flexgen CLK_RX_ICN_HVA>;
>  			resets = <&softreset STIH407_MMC1_SOFTRESET>;
> -			reset-names = "softreset";
>  			bus-width = <4>;
>  		};
>  
> @@ -590,7 +620,7 @@
>  			compatible = "st,ahci";
>  			reg = <0x9b20000 0x1000>;
>  
> -			interrupts = <GIC_SPI 159 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "hostc";
>  
>  			phys = <&phy_port0 PHY_TYPE_SATA>;
> @@ -613,7 +643,7 @@
>  			compatible = "st,ahci";
>  			reg = <0x9b28000 0x1000>;
>  
> -			interrupts = <GIC_SPI 170 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "hostc";
>  
>  			phys = <&phy_port1 PHY_TYPE_SATA>;
> @@ -654,11 +684,12 @@
>  			dwc3: dwc3@9900000 {
>  				compatible	= "snps,dwc3";
>  				reg		= <0x09900000 0x100000>;
> -				interrupts	= <GIC_SPI 155 IRQ_TYPE_NONE>;
> -				dr_mode		= "peripheral";
> +				interrupts	= <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +				dr_mode		= "host";
>  				phy-names	= "usb2-phy", "usb3-phy";
>  				phys		= <&usb2_picophy0>,
>  						  <&phy_port2 PHY_TYPE_USB3>;
> +				snps,dis_u3_susphy_quirk;
>  			};
>  		};
>  
> @@ -667,7 +698,7 @@
>  			compatible	= "st,sti-pwm";
>  			#pwm-cells	= <2>;
>  			reg		= <0x9810000 0x68>;
> -			interrupts      = <GIC_SPI 128 IRQ_TYPE_NONE>;
> +			interrupts      = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
>  			pinctrl-names	= "default";
>  			pinctrl-0	= <&pinctrl_pwm0_chan0_default>;
>  			clock-names	= "pwm";
> @@ -682,6 +713,7 @@
>  			compatible	= "st,sti-pwm";
>  			#pwm-cells	= <2>;
>  			reg		= <0x9510000 0x68>;
> +			interrupts      = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
>  			pinctrl-names	= "default";
>  			pinctrl-0	= <&pinctrl_pwm1_chan0_default
>  					&pinctrl_pwm1_chan1_default
> @@ -694,14 +726,14 @@
>  			status		= "disabled";
>  		};
>  
> -		rng10: rng@08a89000 {
> +		rng10: rng@8a89000 {
>  			compatible      = "st,rng";
>  			reg		= <0x08a89000 0x1000>;
>  			clocks          = <&clk_sysin>;
>  			status		= "okay";
>  		};
>  
> -		rng11: rng@08a8a000 {
> +		rng11: rng@8a8a000 {
>  			compatible      = "st,rng";
>  			reg		= <0x08a8a000 0x1000>;
>  			clocks          = <&clk_sysin>;
> @@ -720,8 +752,8 @@
>  			resets = <&softreset STIH407_ETH1_SOFTRESET>;
>  			reset-names = "stmmaceth";
>  
> -			interrupts = <GIC_SPI 98 IRQ_TYPE_NONE>,
> -				     <GIC_SPI 99 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq", "eth_wake_irq";
>  
>  			/* DMA Bus Mode */
> @@ -735,26 +767,14 @@
>  				 <&clk_s_c0_flexgen CLK_ETH_PHY>;
>  		};
>  
> -		cec: sti-cec@094a087c {
> -			compatible = "st,stih-cec";
> -			reg = <0x94a087c 0x64>;
> -			clocks = <&clk_sysin>;
> -			clock-names = "cec-clk";
> -			interrupts = <GIC_SPI 140 IRQ_TYPE_NONE>;
> -			interrupt-names = "cec-irq";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&pinctrl_cec0_default>;
> -			resets = <&softreset STIH407_LPM_SOFTRESET>;
> -		};
> -
> -		rng10: rng@08a89000 {
> +		rng10: rng@8a89000 {
>  			compatible      = "st,rng";
>  			reg		= <0x08a89000 0x1000>;
>  			clocks          = <&clk_sysin>;
>  			status		= "okay";
>  		};
>  
> -		rng11: rng@08a8a000 {
> +		rng11: rng@8a8a000 {
>  			compatible      = "st,rng";
>  			reg		= <0x08a8a000 0x1000>;
>  			clocks          = <&clk_sysin>;
> @@ -764,7 +784,7 @@
>  		mailbox0: mailbox@8f00000  {
>  			compatible	= "st,stih407-mailbox";
>  			reg		= <0x8f00000 0x1000>;
> -			interrupts	= <GIC_SPI 1 IRQ_TYPE_NONE>;
> +			interrupts	= <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>  			#mbox-cells	= <2>;
>  			mbox-name	= "a9";
>  			status		= "okay";
> @@ -794,9 +814,24 @@
>  			status		= "okay";
>  		};
>  
> -		st231_delta: st231-delta@44000000 {
> +		st231_gp0: st231-gp0@0 {
>  			compatible	= "st,st231-rproc";
> -			memory-region	= <&dmu_reserved>;
> +			reg		= <0 0>;
> +			memory-region	= <&gp0_reserved>;
> +			resets		= <&softreset STIH407_ST231_GP0_SOFTRESET>;
> +			reset-names	= "sw_reset";
> +			clocks		= <&clk_s_c0_flexgen CLK_ST231_GP_0>;
> +			clock-frequency	= <600000000>;
> +			st,syscfg	= <&syscfg_core 0x22c>;
> +			#mbox-cells = <1>;
> +			mbox-names = "vq0_rx", "vq0_tx", "vq1_rx", "vq1_tx";
> +			mboxes = <&mailbox0 0 2>, <&mailbox2 0 1>, <&mailbox0 0 3>, <&mailbox2 0 0>;
> +		};
> +
> +		st231_delta: st231-delta@0 {
> +			compatible	= "st,st231-rproc";
> +			reg		= <0 0>;
> +			memory-region	= <&delta_reserved>;
>  			resets		= <&softreset STIH407_ST231_DMU_SOFTRESET>;
>  			reset-names	= "sw_reset";
>  			clocks		= <&clk_s_c0_flexgen CLK_ST231_DMU>;
> @@ -819,7 +854,7 @@
>  				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
>  				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
>  				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
> -			interrupts = <GIC_SPI 5 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>  			dma-channels = <16>;
>  			#dma-cells = <3>;
>  		};
> @@ -837,9 +872,11 @@
>  				<&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
>  				<&clk_s_c0_flexgen CLK_EXT2F_A9>;
>  
> -			interrupts = <GIC_SPI 7 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  			dma-channels = <16>;
>  			#dma-cells = <3>;
> +
> +			status = "disabled";
>  		};
>  
>  		/* fdma free running */
> @@ -850,20 +887,15 @@
>  			      <0x8e77000 0x1000>,
>  			      <0x8e78000 0x8000>;
>  			reg-names = "slimcore", "dmem", "peripherals", "imem";
> -			interrupts = <GIC_SPI 9 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  			dma-channels = <16>;
>  			#dma-cells = <3>;
>  			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
>  				<&clk_s_c0_flexgen CLK_EXT2F_A9>,
>  				<&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
>  				<&clk_s_c0_flexgen CLK_EXT2F_A9>;
> -		};
>  
> -		sti_sasg_codec: sti-sasg-codec {
> -			compatible = "st,stih407-sas-codec";
> -			#sound-dai-cells = <1>;
>  			status = "disabled";
> -			st,syscfg = <&syscfg_core>;
>  		};
>  
>  		sti_uni_player0: sti-uni-player@8d80000 {
> @@ -875,7 +907,7 @@
>  			assigned-clock-parents = <0>, <&clk_s_d0_quadfs 0>;
>  			assigned-clock-rates = <50000000>;
>  			reg = <0x8d80000 0x158>;
> -			interrupts = <GIC_SPI 84 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
>  			dmas = <&fdma0 2 0 1>;
>  			dma-names = "tx";
>  
> @@ -891,7 +923,7 @@
>  			assigned-clock-parents = <0>, <&clk_s_d0_quadfs 1>;
>  			assigned-clock-rates = <50000000>;
>  			reg = <0x8d81000 0x158>;
> -			interrupts = <GIC_SPI 85 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
>  			dmas = <&fdma0 3 0 1>;
>  			dma-names = "tx";
>  
> @@ -907,7 +939,7 @@
>  			assigned-clock-parents = <0>, <&clk_s_d0_quadfs 2>;
>  			assigned-clock-rates = <50000000>;
>  			reg = <0x8d82000 0x158>;
> -			interrupts = <GIC_SPI 86 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>  			dmas = <&fdma0 4 0 1>;
>  			dma-names = "tx";
>  
> @@ -923,7 +955,7 @@
>  			assigned-clock-parents = <0>, <&clk_s_d0_quadfs 3>;
>  			assigned-clock-rates = <50000000>;
>  			reg = <0x8d85000 0x158>;
> -			interrupts = <GIC_SPI 89 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>  			dmas = <&fdma0 7 0 1>;
>  			dma-names = "tx";
>  
> @@ -935,7 +967,7 @@
>  			#sound-dai-cells = <0>;
>  			st,syscfg = <&syscfg_core>;
>  			reg = <0x8d83000 0x158>;
> -			interrupts = <GIC_SPI 87 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
>  			dmas = <&fdma0 5 0 1>;
>  			dma-names = "rx";
>  
> @@ -947,32 +979,22 @@
>  			#sound-dai-cells = <0>;
>  			st,syscfg = <&syscfg_core>;
>  			reg = <0x8d84000 0x158>;
> -			interrupts = <GIC_SPI 88 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
>  			dmas = <&fdma0 6 0 1>;
>  			dma-names = "rx";
>  
>  			status = "disabled";
>  		};
>  
> -		rc: rc@09518000 {
> -			compatible = "st,comms-irb";
> -			reg = <0x09518000 0x234>;
> -			interrupts = <GIC_SPI 132 IRQ_TYPE_NONE>;
> -			rx-mode = "infrared";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&pinctrl_ir
> -				     &pinctrl_uhf
> -				     &pinctrl_tx
> -				     &pinctrl_tx_od>;
> -			clocks = <&clk_sysin>;
> -			resets = <&softreset STIH407_IRB_SOFTRESET>;
> -
> -			status = "disabled";
> -		};
> -
> -		socinfo {
> -			compatible = "st,stih407-socinfo";
> -			st,syscfg = <&syscfg_core>;
> +		delta0@0 {
> +			compatible = "st,st-delta";
> +			reg = <0 0>;
> +			clock-names = "delta",
> +				      "delta-st231",
> +				      "delta-flash-promip";
> +			clocks = <&clk_s_c0_flexgen CLK_VID_DMU>,
> +				 <&clk_s_c0_flexgen CLK_ST231_DMU>,
> +				 <&clk_s_c0_flexgen CLK_FLASH_PROMIP>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/dts/stih407-pinctrl.dtsi b/arch/arm/dts/stih407-pinctrl.dtsi
> index f27ae21f67..2cf335714c 100644
> --- a/arch/arm/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/dts/stih407-pinctrl.dtsi
> @@ -1,10 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2014 STMicroelectronics Limited.
>   * Author: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * publishhed by the Free Software Foundation.
>   */
>  #include "st-pincfg.h"
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -45,18 +42,18 @@
>  	};
>  
>  	soc {
> -		pin-controller-sbc {
> +		pin-controller-sbc@961f080 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "st,stih407-sbc-pinctrl";
>  			st,syscfg = <&syscfg_sbc>;
>  			reg = <0x0961f080 0x4>;
>  			reg-names = "irqmux";
> -			interrupts = <GIC_SPI 188 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "irqmux";
>  			ranges = <0 0x09610000 0x6000>;
>  
> -			pio0: gpio@09610000 {
> +			pio0: gpio@9610000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -64,7 +61,7 @@
>  				reg = <0x0 0x100>;
>  				st,bank-name = "PIO0";
>  			};
> -			pio1: gpio@09611000 {
> +			pio1: gpio@9611000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -72,7 +69,7 @@
>  				reg = <0x1000 0x100>;
>  				st,bank-name = "PIO1";
>  			};
> -			pio2: gpio@09612000 {
> +			pio2: gpio@9612000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -80,7 +77,7 @@
>  				reg = <0x2000 0x100>;
>  				st,bank-name = "PIO2";
>  			};
> -			pio3: gpio@09613000 {
> +			pio3: gpio@9613000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -88,7 +85,7 @@
>  				reg = <0x3000 0x100>;
>  				st,bank-name = "PIO3";
>  			};
> -			pio4: gpio@09614000 {
> +			pio4: gpio@9614000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -97,7 +94,7 @@
>  				st,bank-name = "PIO4";
>  			};
>  
> -			pio5: gpio@09615000 {
> +			pio5: gpio@9615000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -369,18 +366,18 @@
>  			};
>  		};
>  
> -		pin-controller-front0 {
> +		pin-controller-front0@920f080 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "st,stih407-front-pinctrl";
>  			st,syscfg = <&syscfg_front>;
>  			reg = <0x0920f080 0x4>;
>  			reg-names = "irqmux";
> -			interrupts = <GIC_SPI 189 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "irqmux";
>  			ranges = <0 0x09200000 0x10000>;
>  
> -			pio10: pio@09200000 {
> +			pio10: pio@9200000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -388,7 +385,7 @@
>  				reg = <0x0 0x100>;
>  				st,bank-name = "PIO10";
>  			};
> -			pio11: pio@09201000 {
> +			pio11: pio@9201000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -396,7 +393,7 @@
>  				reg = <0x1000 0x100>;
>  				st,bank-name = "PIO11";
>  			};
> -			pio12: pio@09202000 {
> +			pio12: pio@9202000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -404,7 +401,7 @@
>  				reg = <0x2000 0x100>;
>  				st,bank-name = "PIO12";
>  			};
> -			pio13: pio@09203000 {
> +			pio13: pio@9203000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -412,7 +409,7 @@
>  				reg = <0x3000 0x100>;
>  				st,bank-name = "PIO13";
>  			};
> -			pio14: pio@09204000 {
> +			pio14: pio@9204000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -420,7 +417,7 @@
>  				reg = <0x4000 0x100>;
>  				st,bank-name = "PIO14";
>  			};
> -			pio15: pio@09205000 {
> +			pio15: pio@9205000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -428,7 +425,7 @@
>  				reg = <0x5000 0x100>;
>  				st,bank-name = "PIO15";
>  			};
> -			pio16: pio@09206000 {
> +			pio16: pio@9206000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -436,7 +433,7 @@
>  				reg = <0x6000 0x100>;
>  				st,bank-name = "PIO16";
>  			};
> -			pio17: pio@09207000 {
> +			pio17: pio@9207000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -444,7 +441,7 @@
>  				reg = <0x7000 0x100>;
>  				st,bank-name = "PIO17";
>  			};
> -			pio18: pio@09208000 {
> +			pio18: pio@9208000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -452,7 +449,7 @@
>  				reg = <0x8000 0x100>;
>  				st,bank-name = "PIO18";
>  			};
> -			pio19: pio@09209000 {
> +			pio19: pio@9209000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -465,19 +462,16 @@
>  			serial0 {
>  				pinctrl_serial0: serial0-0 {
>  					st,pins {
> -						tx = <&pio17 0 ALT1 OUT>;
> -						rx = <&pio17 1 ALT1 IN>;
> +						tx =  <&pio17 0 ALT1 OUT>;
> +						rx =  <&pio17 1 ALT1 IN>;
>  					};
>  				};
> -				pinctrl_serial0_rts: serial0_rts {
> -					st,pins {
> -						rts = <&pio17 3 ALT1 OUT>;
> -					};
> -				};
> -
> -				pinctrl_serial0_cts: serial0_cts {
> +				pinctrl_serial0_hw_flowctrl: serial0-0_hw_flowctrl {
>  					st,pins {
> +						tx =  <&pio17 0 ALT1 OUT>;
> +						rx =  <&pio17 1 ALT1 IN>;
>  						cts = <&pio17 2 ALT1 IN>;
> +						rts = <&pio17 3 ALT1 OUT>;
>  					};
>  				};
>  			};
> @@ -932,18 +926,18 @@
>  			};
>  		};
>  
> -		pin-controller-front1 {
> +		pin-controller-front1@921f080 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "st,stih407-front-pinctrl";
>  			st,syscfg = <&syscfg_front>;
>  			reg = <0x0921f080 0x4>;
>  			reg-names = "irqmux";
> -			interrupts = <GIC_SPI 190 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "irqmux";
>  			ranges = <0 0x09210000 0x10000>;
>  
> -			pio20: pio@09210000 {
> +			pio20: pio@9210000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -965,18 +959,18 @@
>  			};
>  		};
>  
> -		pin-controller-rear {
> +		pin-controller-rear@922f080 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "st,stih407-rear-pinctrl";
>  			st,syscfg = <&syscfg_rear>;
>  			reg = <0x0922f080 0x4>;
>  			reg-names = "irqmux";
> -			interrupts = <GIC_SPI 191 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "irqmux";
>  			ranges = <0 0x09220000 0x6000>;
>  
> -			pio30: gpio@09220000 {
> +			pio30: gpio@9220000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -984,7 +978,7 @@
>  				reg = <0x0 0x100>;
>  				st,bank-name = "PIO30";
>  			};
> -			pio31: gpio@09221000 {
> +			pio31: gpio@9221000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -992,7 +986,7 @@
>  				reg = <0x1000 0x100>;
>  				st,bank-name = "PIO31";
>  			};
> -			pio32: gpio@09222000 {
> +			pio32: gpio@9222000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -1000,7 +994,7 @@
>  				reg = <0x2000 0x100>;
>  				st,bank-name = "PIO32";
>  			};
> -			pio33: gpio@09223000 {
> +			pio33: gpio@9223000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -1008,7 +1002,7 @@
>  				reg = <0x3000 0x100>;
>  				st,bank-name = "PIO33";
>  			};
> -			pio34: gpio@09224000 {
> +			pio34: gpio@9224000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -1016,7 +1010,7 @@
>  				reg = <0x4000 0x100>;
>  				st,bank-name = "PIO34";
>  			};
> -			pio35: gpio@09225000 {
> +			pio35: gpio@9225000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -1026,41 +1020,6 @@
>  				st,retime-pin-mask = <0x7f>;
>  			};
>  
> -			dvo {
> -				pinctrl_dvo: dvo {
> -					st,pins {
> -						hs = <&pio30 0 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						vs = <&pio30 1 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						de = <&pio30 2 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						ck = <&pio30 3 ALT2 (OE | CLKNOTDATA) 0>;
> -						d0 = <&pio30 4 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d1 = <&pio30 5 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d2 = <&pio30 6 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d3 = <&pio30 7 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d4 = <&pio31 0 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d5 = <&pio31 1 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d6 = <&pio31 2 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d7 = <&pio31 3 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d8 = <&pio31 4 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d9 = <&pio31 5 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d10 = <&pio31 6 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d11 = <&pio31 7 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d12 = <&pio32 0 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d13 = <&pio32 1 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d14 = <&pio32 2 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d15 = <&pio32 3 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d16 = <&pio32 4 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d17 = <&pio32 5 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d18 = <&pio32 6 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d19 = <&pio32 7 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d20 = <&pio33 0 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d21 = <&pio33 1 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d22 = <&pio33 2 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -						d23 = <&pio33 3 ALT2 OUT SE_NICLK_IO 0 CLK_A>;
> -					};
> -				};
> -			};
> -
>  			i2c4 {
>  				pinctrl_i2c4_default: i2c4-default {
>  					st,pins {
> @@ -1195,18 +1154,18 @@
>  			};
>  		};
>  
> -		pin-controller-flash {
> +		pin-controller-flash@923f080 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "st,stih407-flash-pinctrl";
>  			st,syscfg = <&syscfg_flash>;
>  			reg = <0x0923f080 0x4>;
>  			reg-names = "irqmux";
> -			interrupts = <GIC_SPI 192 IRQ_TYPE_NONE>;
> -			interrupts-names = "irqmux";
> +			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "irqmux";
>  			ranges = <0 0x09230000 0x3000>;
>  
> -			pio40: gpio@09230000 {
> +			pio40: gpio@9230000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -1214,7 +1173,7 @@
>  				reg = <0 0x100>;
>  				st,bank-name = "PIO40";
>  			};
> -			pio41: gpio@09231000 {
> +			pio41: gpio@9231000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> @@ -1222,7 +1181,7 @@
>  				reg = <0x1000 0x100>;
>  				st,bank-name = "PIO41";
>  			};
> -			pio42: gpio@09232000 {
> +			pio42: gpio@9232000 {
>  				gpio-controller;
>  				#gpio-cells = <2>;
>  				interrupt-controller;
> diff --git a/arch/arm/dts/stih410-b2260-u-boot.dtsi b/arch/arm/dts/stih410-b2260-u-boot.dtsi
> index 83916319fc..897c42146a 100644
> --- a/arch/arm/dts/stih410-b2260-u-boot.dtsi
> +++ b/arch/arm/dts/stih410-b2260-u-boot.dtsi
> @@ -9,8 +9,25 @@
>  	soc {
>  		st_dwc3: dwc3@8f94000 {
>  			dwc3: dwc3@9900000 {
> +				dr_mode	= "peripheral";
>  				phys = <&usb2_picophy0>;
>  			};
>  		};
> +
> +		ohci0: usb@9a03c00 {
> +			compatible = "generic-ohci";
> +		};
> +
> +		ehci0: usb@9a03e00 {
> +			compatible = "generic-ehci";
> +		};
> +
> +		ohci1: usb@9a83c00 {
> +			compatible = "generic-ohci";
> +		};
> +
> +		ehci1: usb@9a83e00 {
> +			compatible = "generic-ehci";
> +		};
>  	};
>  };
> diff --git a/arch/arm/dts/stih410-b2260.dts b/arch/arm/dts/stih410-b2260.dts
> index 54250e2518..4fbd8e9eb5 100644
> --- a/arch/arm/dts/stih410-b2260.dts
> +++ b/arch/arm/dts/stih410-b2260.dts
> @@ -1,10 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2016 STMicroelectronics (R&D) Limited.
>   * Author: Patrice Chotard <patrice.chotard@st.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
>   */
>  /dts-v1/;
>  #include "stih410.dtsi"
> @@ -15,68 +12,79 @@
>  	compatible = "st,stih410-b2260", "st,stih410";
>  
>  	chosen {
> -		bootargs = "console=ttyAS1,115200";
> -		linux,stdout-path = &uart1;
> +		bootargs = "clk_ignore_unused";
>  		stdout-path = &uart1;
>  	};
>  
> -	memory {
> +	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x40000000 0x40000000>;
>  	};
>  
>  	aliases {
> -		ttyAS1 = &uart1;
> +		serial1 = &uart1;
>  		ethernet0 = &ethernet0;
>  	};
>  
> -	soc {
> -
> -		leds {
> -			compatible = "gpio-leds";
> -			user_green_1 {
> -				label = "User_green_1";
> -				gpios = <&pio1 3 GPIO_ACTIVE_LOW>;
> -				linux,default-trigger = "heartbeat";
> -				default-state = "off";
> -			};
> +	leds {
> +		compatible = "gpio-leds";
> +		user_green_1 {
> +			label = "User_green_1";
> +			gpios = <&pio1 3 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +			default-state = "off";
> +		};
>  
> -			user_green_2 {
> -				label = "User_green_2";
> -				gpios = <&pio4 1 GPIO_ACTIVE_LOW>;
> -				default-state = "off";
> -			};
> +		user_green_2 {
> +			label = "User_green_2";
> +			gpios = <&pio4 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
>  
> -			user_green_3 {
> -				label = "User_green_3";
> -				gpios = <&pio2 1 GPIO_ACTIVE_LOW>;
> -				default-state = "off";
> -			};
> +		user_green_3 {
> +			label = "User_green_3";
> +			gpios = <&pio2 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
>  
> -			user_green_4 {
> -				label = "User_green_4";
> -				gpios = <&pio2 5 GPIO_ACTIVE_LOW>;
> -				default-state = "off";
> -			};
> +		user_green_4 {
> +			label = "User_green_4";
> +			gpios = <&pio2 5 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +	};
>  
> -			wifi_yellow {
> -				label = "Wifi_yellow";
> -				gpios = <&pio4 0 GPIO_ACTIVE_LOW>;
> -				linux,default-trigger = "wifi-activity";
> -				default-state = "off";
> +	sound: sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "STI-B2260";
> +		status = "okay";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg = <0>;
> +			/* DAC */
> +			format = "i2s";
> +			mclk-fs = <128>;
> +			cpu {
> +				sound-dai = <&sti_uni_player0>;
>  			};
>  
> -			bt_blue {
> -				label = "Bluetooth_blue";
> -				gpios = <&pio3 3 GPIO_ACTIVE_LOW>;
> -				linux,default-trigger = "hci0-power";
> -				default-state = "off";
> +			codec {
> +				sound-dai = <&sti_hdmi>;
>  			};
>  		};
> +	};
>  
> +	soc {
>  		/* Low speed expansion connector */
>  		uart0: serial@9830000 {
>  			label = "LS-UART0";
> +			pinctrl-names = "default", "no-hw-flowctrl";
> +			pinctrl-0 = <&pinctrl_serial0_hw_flowctrl>;
> +			pinctrl-1 = <&pinctrl_serial0>;
> +			rts-gpios = <&pio17 3 GPIO_ACTIVE_LOW>;
> +			uart-has-rtscts;
>  			status = "okay";
>  		};
>  
> @@ -119,14 +127,14 @@
>  			status = "okay";
>  		};
>  
> -		mmc0: sdhci@09060000 {
> +		mmc0: sdhci@9060000 {
>  			pinctrl-0 = <&pinctrl_sd0>;
>  			bus-width = <4>;
>  			status = "okay";
>  		};
>  
>  		/* high speed expansion connector */
> -		mmc1: sdhci@09080000 {
> +		mmc1: sdhci@9080000 {
>  			status = "okay";
>  		};
>  
> @@ -138,11 +146,11 @@
>  			status = "okay";
>  		};
>  
> -		usb2_picophy1: phy2 {
> +		usb2_picophy1: phy2@0 {
>  			status = "okay";
>  		};
>  
> -		usb2_picophy2: phy3 {
> +		usb2_picophy2: phy3@0 {
>  			status = "okay";
>  		};
>  
> @@ -183,17 +191,17 @@
>  		sti_uni_player0: sti-uni-player@8d80000 {
>  			status = "okay";
>  		};
> -
>  		/* SSC11 to HDMI */
>  		hdmiddc: i2c@9541000 {
>  			/* HDMI V1.3a supports Standard mode only */
>  			clock-frequency = <100000>;
>  			st,i2c-min-scl-pulse-width-us = <0>;
> -			st,i2c-min-sda-pulse-width-us = <1>;
> +			st,i2c-min-sda-pulse-width-us = <5>;
>  			status = "okay";
>  		};
>  
> -		miphy28lp_phy: miphy28lp@9b22000 {
> +		miphy28lp_phy: miphy28lp@0 {
> +
>  			phy_port1: port@9b2a000 {
>  				st,osc-force-ext;
>  			};
> @@ -202,25 +210,5 @@
>  		sata1: sata@9b28000 {
>  			status = "okay";
>  		};
> -
> -		sound {
> -			compatible = "simple-audio-card";
> -			simple-audio-card,name = "STI-B2260";
> -			status = "okay";
> -
> -			simple-audio-card,dai-link@0 {
> -				/* DAC */
> -				format = "i2s";
> -				mclk-fs = <128>;
> -				cpu {
> -					sound-dai = <&sti_uni_player0>;
> -				};
> -
> -				codec {
> -					sound-dai = <&sti_hdmi>;
> -				};
> -			};
> -		};
> -
>  	};
>  };
> diff --git a/arch/arm/dts/stih410-clock.dtsi b/arch/arm/dts/stih410-clock.dtsi
> index 8598effd6c..81a8c25d7b 100644
> --- a/arch/arm/dts/stih410-clock.dtsi
> +++ b/arch/arm/dts/stih410-clock.dtsi
> @@ -1,12 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2014 STMicroelectronics R&D Limited
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
>   */
>  #include <dt-bindings/clock/stih410-clks.h>
>  / {
> +	/*
> +	 * Fixed 30MHz oscillator inputs to SoC
> +	 */
> +	clk_sysin: clk-sysin {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <30000000>;
> +		clock-output-names = "CLK_SYSIN";
> +	};
> +
> +	clk_tmdsout_hdmi: clk-tmdsout-hdmi {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +	};
> +
>  	clocks {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> @@ -14,27 +27,6 @@
>  
>  		compatible = "st,stih410-clk", "simple-bus";
>  
> -		/*
> -		 * Fixed 30MHz oscillator inputs to SoC
> -		 */
> -		clk_sysin: clk-sysin {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <30000000>;
> -			clock-output-names = "CLK_SYSIN";
> -		};
> -
> -		/*
> -		 * ARM Peripheral clock for timers
> -		 */
> -		arm_periph_clk: clk-m-a9-periphs {
> -			#clock-cells = <0>;
> -			compatible = "fixed-factor-clock";
> -			clocks = <&clk_m_a9>;
> -			clock-div = <2>;
> -			clock-mult = <1>;
> -		};
> -
>  		/*
>  		 * A9 PLL.
>  		 */
> @@ -64,35 +56,19 @@
>  				 <&clockgen_a9_pll 0>,
>  				 <&clk_s_c0_flexgen 13>,
>  				 <&clk_m_a9_ext2f_div2>;
> +			/*
> +			 * ARM Peripheral clock for timers
> +			 */
> +			arm_periph_clk: clk-m-a9-periphs {
> +				#clock-cells = <0>;
> +				compatible = "fixed-factor-clock";
> +				clocks = <&clk_m_a9>;
> +				clock-div = <2>;
> +				clock-mult = <1>;
> +			};
>  		};
>  
> -		/*
> -		 * ARM Peripheral clock for timers
> -		 */
> -		clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
> -			#clock-cells = <0>;
> -			compatible = "fixed-factor-clock";
> -
> -			clocks = <&clk_s_c0_flexgen 13>;
> -
> -			clock-output-names = "clk-m-a9-ext2f-div2";
> -
> -			clock-div = <2>;
> -			clock-mult = <1>;
> -		};
> -
> -		/*
> -		 * Bootloader initialized system infrastructure clock for
> -		 * serial devices.
> -		 */
> -		clk_ext2f_a9: clockgen-c0@13 {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <200000000>;
> -			clock-output-names = "clk-s-icn-reg-0";
> -		};
> -
> -		clockgen-a@090ff000 {
> +		clockgen-a@90ff000 {
>  			compatible = "st,clkgen-c32";
>  			reg = <0x90ff000 0x1000>;
>  
> @@ -134,7 +110,7 @@
>  			clock-critical = <0>; /* clk-s-c0-fs0-ch0 */
>  		};
>  
> -		clk_s_c0: clockgen-c@09103000 {
> +		clk_s_c0: clockgen-c@9103000 {
>  			compatible = "st,clkgen-c32";
>  			reg = <0x9103000 0x1000>;
>  
> @@ -208,11 +184,27 @@
>  						     "clk-clust-hades",
>  						     "clk-hwpe-hades",
>  						     "clk-fc-hades";
> -				clock-critical = <CLK_ICN_CPU>,
> +				clock-critical = <CLK_PROC_STFE>,
> +						 <CLK_ICN_CPU>,
>  						 <CLK_TX_ICN_DMU>,
>  						 <CLK_EXT2F_A9>,
>  						 <CLK_ICN_LMI>,
>  						 <CLK_ICN_SBC>;
> +
> +				/*
> +				 * ARM Peripheral clock for timers
> +				 */
> +				clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
> +					#clock-cells = <0>;
> +					compatible = "fixed-factor-clock";
> +
> +					clocks = <&clk_s_c0_flexgen 13>;
> +
> +					clock-output-names = "clk-m-a9-ext2f-div2";
> +
> +					clock-div = <2>;
> +					clock-mult = <1>;
> +				};
>  			};
>  		};
>  
> @@ -229,7 +221,7 @@
>  					     "clk-s-d0-fs0-ch3";
>  		};
>  
> -		clockgen-d0@09104000 {
> +		clockgen-d0@9104000 {
>  			compatible = "st,clkgen-c32";
>  			reg = <0x9104000 0x1000>;
>  
> @@ -265,13 +257,7 @@
>  					     "clk-s-d2-fs0-ch3";
>  		};
>  
> -		clk_tmdsout_hdmi: clk-tmdsout-hdmi {
> -			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <0>;
> -		};
> -
> -		clockgen-d2@x9106000 {
> +		clockgen-d2@9106000 {
>  			compatible = "st,clkgen-c32";
>  			reg = <0x9106000 0x1000>;
>  
> diff --git a/arch/arm/dts/stih410-pinctrl.dtsi b/arch/arm/dts/stih410-pinctrl.dtsi
> index b3e9dfc81c..e6eadd1244 100644
> --- a/arch/arm/dts/stih410-pinctrl.dtsi
> +++ b/arch/arm/dts/stih410-pinctrl.dtsi
> @@ -1,16 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2014 STMicroelectronics Limited.
>   * Author: Peter Griffin <peter.griffin@linaro.org>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * publishhed by the Free Software Foundation.
>   */
>  #include "st-pincfg.h"
>  / {
>  
>  	soc {
> -		pin-controller-rear {
> +		pin-controller-rear@922f080 {
>  
>  			usb0 {
>  				pinctrl_usb0: usb2-0 {
> diff --git a/arch/arm/dts/stih410.dtsi b/arch/arm/dts/stih410.dtsi
> index b59b110989..6d847019c5 100644
> --- a/arch/arm/dts/stih410.dtsi
> +++ b/arch/arm/dts/stih410.dtsi
> @@ -1,67 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2014 STMicroelectronics Limited.
>   * Author: Peter Griffin <peter.griffin@linaro.org>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * publishhed by the Free Software Foundation.
>   */
>  #include "stih410-clock.dtsi"
>  #include "stih407-family.dtsi"
>  #include "stih410-pinctrl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  / {
>  	aliases {
>  		bdisp0 = &bdisp0;
>  	};
>  
> -	cpus {
> -		cpu@0 {
> -			st,syscfg = <&syscfg_core 0x8e0>;
> -			st,syscfg-eng = <&syscfg_opp 0x4 0x0>;
> -			clocks = <&clk_m_a9>;
> -			operating-points-v2 = <&cpu0_opp_table>;
> -		};
> -		cpu@1 {
> -			clocks = <&clk_m_a9>;
> -			operating-points-v2 = <&cpu0_opp_table>;
> -		};
> -	};
> -
> -	cpu0_opp_table: opp_table0 {
> -		compatible = "operating-points-v2";
> -		opp-shared;
> -
> -		opp@1500000000 {
> -			opp-supported-hw = <0xffffffff  0xffffffff  0xffffffff>;
> -			opp-hz = /bits/ 64 <1500000000>;
> -			clock-latency-ns = <10000000>;
> -			opp-suspend;
> -		};
> -		opp@1200000000 {
> -			opp-supported-hw = <0xffffffff  0xffffffff  0xffffffff>;
> -			opp-hz = /bits/ 64 <1200000000>;
> -			clock-latency-ns = <10000000>;
> -		};
> -		opp@800000000 {
> -			opp-supported-hw = <0xffffffff  0xffffffff  0xffffffff>;
> -			opp-hz = /bits/ 64 <800000000>;
> -			clock-latency-ns = <10000000>;
> -		};
> -		opp@400000000 {
> -			opp-supported-hw = <0xffffffff  0xffffffff  0xffffffff>;
> -			opp-hz = /bits/ 64 <400000000>;
> -			clock-latency-ns = <10000000>;
> -		};
> -	};
> -
>  	soc {
> -		syscfg_opp: @08a6583c {
> -			compatible = "syscon";
> -			reg = <0x08a6583c 0x8>;
> -		};
> -
> -		usb2_picophy1: phy2 {
> +		usb2_picophy1: phy2@0 {
>  			compatible = "st,stih407-usb2-phy";
> +			reg = <0 0>;
>  			#phy-cells = <0>;
>  			st,syscfg = <&syscfg_core 0xf8 0xf4>;
>  			resets = <&softreset STIH407_PICOPHY_SOFTRESET>,
> @@ -71,8 +25,9 @@
>  			status = "disabled";
>  		};
>  
> -		usb2_picophy2: phy3 {
> +		usb2_picophy2: phy3@0 {
>  			compatible = "st,stih407-usb2-phy";
> +			reg = <0 0>;
>  			#phy-cells = <0>;
>  			st,syscfg = <&syscfg_core 0xfc 0xf4>;
>  			resets = <&softreset STIH407_PICOPHY_SOFTRESET>,
> @@ -83,15 +38,14 @@
>  		};
>  
>  		ohci0: usb@9a03c00 {
> -			compatible = "generic-ohci";
> +			compatible = "st,st-ohci-300x";
>  			reg = <0x9a03c00 0x100>;
> -			interrupts = <GIC_SPI 180 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
>  				 <&clk_s_c0_flexgen CLK_RX_ICN_DISP_0>;
>  			resets = <&powerdown STIH407_USB2_PORT0_POWERDOWN>,
>  				 <&softreset STIH407_USB2_PORT0_SOFTRESET>;
>  			reset-names = "power", "softreset";
> -
>  			phys = <&usb2_picophy1>;
>  			phy-names = "usb";
>  
> @@ -99,9 +53,9 @@
>  		};
>  
>  		ehci0: usb@9a03e00 {
> -			compatible = "generic-ehci";
> +			compatible = "st,st-ehci-300x";
>  			reg = <0x9a03e00 0x100>;
> -			interrupts = <GIC_SPI 151 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usb0>;
>  			clocks = <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
> @@ -116,15 +70,14 @@
>  		};
>  
>  		ohci1: usb@9a83c00 {
> -			compatible = "generic-ohci";
> +			compatible = "st,st-ohci-300x";
>  			reg = <0x9a83c00 0x100>;
> -			interrupts = <GIC_SPI 181 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
>  				 <&clk_s_c0_flexgen CLK_RX_ICN_DISP_0>;
>  			resets = <&powerdown STIH407_USB2_PORT1_POWERDOWN>,
>  				 <&softreset STIH407_USB2_PORT1_SOFTRESET>;
>  			reset-names = "power", "softreset";
> -
>  			phys = <&usb2_picophy2>;
>  			phy-names = "usb";
>  
> @@ -132,9 +85,9 @@
>  		};
>  
>  		ehci1: usb@9a83e00 {
> -			compatible = "generic-ehci";
> +			compatible = "st,st-ehci-300x";
>  			reg = <0x9a83e00 0x100>;
> -			interrupts = <GIC_SPI 153 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usb1>;
>  			clocks = <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
> @@ -142,18 +95,18 @@
>  			resets = <&powerdown STIH407_USB2_PORT1_POWERDOWN>,
>  				 <&softreset STIH407_USB2_PORT1_SOFTRESET>;
>  			reset-names = "power", "softreset";
> -
>  			phys = <&usb2_picophy2>;
>  			phy-names = "usb";
>  
>  			status = "disabled";
>  		};
>  
> -		sti-display-subsystem {
> +		sti-display-subsystem@0 {
>  			compatible = "st,sti-display-subsystem";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  
> +			reg = <0 0>;
>  			assigned-clocks	= <&clk_s_d2_quadfs 0>,
>  					  <&clk_s_d2_quadfs 1>,
>  					  <&clk_s_c0_pll1 0>,
> @@ -243,10 +196,10 @@
>  
>  			sti_hdmi: sti-hdmi@8d04000 {
>  				compatible = "st,stih407-hdmi";
> -				#sound-dai-cells = <0>;
>  				reg = <0x8d04000 0x1000>;
>  				reg-names = "hdmi-reg";
> -				interrupts = <GIC_SPI 106 IRQ_TYPE_NONE>;
> +				#sound-dai-cells = <0>;
> +				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
>  				interrupt-names	= "irq";
>  				clock-names = "pix",
>  					      "tmds",
> @@ -262,7 +215,7 @@
>  					 <&clk_s_d2_quadfs 0>,
>  					 <&clk_s_d2_quadfs 1>;
>  
> -				hdmi,hpd-gpio = <&pio5 3>;
> +				hdmi,hpd-gpio = <&pio5 3 GPIO_ACTIVE_LOW>;
>  				reset-names = "hdmi";
>  				resets = <&softreset STIH407_HDMI_TX_PHY_SOFTRESET>;
>  				ddc = <&hdmiddc>;
> @@ -283,24 +236,7 @@
>  					 <&clk_s_d2_quadfs 1>;
>  			};
>  
> -			sti-dvo@8d00400 {
> -				compatible = "st,stih407-dvo";
> -				status = "disabled";
> -				reg = <0x8d00400 0x200>;
> -				reg-names = "dvo-reg";
> -				clock-names = "dvo_pix",
> -					      "dvo",
> -					      "main_parent",
> -					      "aux_parent";
> -				clocks = <&clk_s_d2_flexgen CLK_PIX_DVO>,
> -					 <&clk_s_d2_flexgen CLK_DVO>,
> -					 <&clk_s_d2_quadfs 0>,
> -					 <&clk_s_d2_quadfs 1>;
> -				pinctrl-names = "default";
> -				pinctrl-0 = <&pinctrl_dvo>;
> -			};
> -
> -			sti-hqvdp@9c000000 {
> +			sti-hqvdp@9c00000 {
>  				compatible = "st,stih407-hqvdp";
>  				reg = <0x9C00000 0x100000>;
>  				clock-names = "hqvdp", "pix_main";
> @@ -315,7 +251,7 @@
>  		bdisp0:bdisp@9f10000 {
>  			compatible = "st,stih407-bdisp";
>  			reg = <0x9f10000 0x1000>;
> -			interrupts = <GIC_SPI 38 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names = "bdisp";
>  			clocks = <&clk_s_c0_flexgen CLK_IC_BDISP_0>;
>  		};
> @@ -324,8 +260,8 @@
>  			compatible = "st,st-hva";
>  			reg = <0x8c85000 0x400>, <0x6000000 0x40000>;
>  			reg-names = "hva_registers", "hva_esram";
> -			interrupts = <GIC_SPI 58 IRQ_TYPE_NONE>,
> -				     <GIC_SPI 59 IRQ_TYPE_NONE>;
> +			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names = "clk_hva";
>  			clocks = <&clk_s_c0_flexgen CLK_HVA>;
>  		};
> @@ -338,66 +274,7 @@
>  			interrupts = <GIC_SPI 205 IRQ_TYPE_EDGE_RISING>;
>  		};
>  
> -		g1@8c80000 {
> -			compatible = "st,g1";
> -			reg = <0x8c80000 0x194>;
> -			interrupts = <GIC_SPI 57 IRQ_TYPE_NONE>;
> -		};
> -
> -		temp0{
> -			compatible = "st,stih407-thermal";
> -			reg = <0x91a0000 0x28>;
> -			clock-names = "thermal";
> -			clocks = <&clk_sysin>;
> -			interrupts = <GIC_SPI 205 IRQ_TYPE_EDGE_RISING>;
> -		};
> -
> -		delta0 {
> -			compatible = "st,delta";
> -			clock-names = "delta", "delta-st231", "delta-flash-promip";
> -			clocks = <&clk_s_c0_flexgen CLK_VID_DMU>,
> -			    <&clk_s_c0_flexgen CLK_ST231_DMU>,
> -			    <&clk_s_c0_flexgen CLK_FLASH_PROMIP>;
> -		};
> -
> -		h264pp0: h264pp@8c00000 {
> -			compatible = "st,h264pp";
> -			reg = <0x8c00000 0x20000>;
> -			interrupts = <GIC_SPI 53 IRQ_TYPE_NONE>;
> -			clock-names = "clk_h264pp_0";
> -			clocks = <&clk_s_c0_flexgen CLK_PP_DMU>;
> -		};
> -
> -		mali: mali@09f00000 {
> -			compatible	= "arm,mali-400";
> -			reg		= <0x09f00000 0x10000>;
> -			interrupts	= <GIC_SPI 49 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 50 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 41 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 45 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 42 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 46 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 43 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 47 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 44 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 48 IRQ_TYPE_NONE>;
> -			interrupt-names = "IRQGP",
> -					  "IRQGPMMU",
> -					  "IRQPP0",
> -					  "IRQPPMMU0",
> -					  "IRQPP1",
> -					  "IRQPPMMU1",
> -					  "IRQPP2",
> -					  "IRQPPMMU2",
> -					  "IRQPP3",
> -					  "IRQPPMMU3";
> -			clock-names	= "gpu-clk";
> -			clocks		= <&clk_s_c0_flexgen CLK_ICN_GPU>;
> -			reset-names	= "gpu";
> -			resets		= <&softreset STIH407_GPU_SOFTRESET>;
> -		};
> -
> -		delta0 {
> +		delta0@0 {
>  			compatible = "st,st-delta";
>  			clock-names = "delta",
>  				      "delta-st231",
> @@ -407,51 +284,17 @@
>  				 <&clk_s_c0_flexgen CLK_FLASH_PROMIP>;
>  		};
>  
> -		h264pp0: h264pp@8c00000 {
> -			compatible = "st,h264pp";
> -			reg = <0x8c00000 0x20000>;
> -			interrupts = <GIC_SPI 53 IRQ_TYPE_NONE>;
> -			clock-names = "clk_h264pp_0";
> -			clocks = <&clk_s_c0_flexgen CLK_PP_DMU>;
> -		};
> -
> -		mali: mali@09f00000 {
> -			compatible	= "arm,mali-400";
> -			reg		= <0x09f00000 0x10000>;
> -			interrupts	= <GIC_SPI 49 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 50 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 41 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 45 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 42 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 46 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 43 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 47 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 44 IRQ_TYPE_NONE>,
> -					  <GIC_SPI 48 IRQ_TYPE_NONE>;
> -			interrupt-names = "IRQGP",
> -					  "IRQGPMMU",
> -					  "IRQPP0",
> -					  "IRQPPMMU0",
> -					  "IRQPP1",
> -					  "IRQPPMMU1",
> -					  "IRQPP2",
> -					  "IRQPPMMU2",
> -					  "IRQPP3",
> -					  "IRQPPMMU3";
> -			clock-names	= "gpu-clk";
> -			clocks		= <&clk_s_c0_flexgen CLK_ICN_GPU>;
> -			reset-names	= "gpu";
> -			resets		= <&softreset STIH407_GPU_SOFTRESET>;
> -		};
> -
> -		hva@8c85000{
> -			compatible = "st,st-hva";
> -			reg = <0x8c85000 0x400>, <0x6000000 0x40000>;
> -			reg-names = "hva_registers", "hva_esram";
> -			interrupts = <GIC_SPI 58 IRQ_TYPE_NONE>,
> -				     <GIC_SPI 59 IRQ_TYPE_NONE>;
> -			clock-names = "clk_hva";
> -			clocks = <&clk_s_c0_flexgen CLK_HVA>;
> +		sti-cec@94a087c {
> +			compatible = "st,stih-cec";
> +			reg = <0x94a087c 0x64>;
> +			clocks = <&clk_sysin>;
> +			clock-names = "cec-clk";
> +			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cec-irq";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_cec0_default>;
> +			resets = <&softreset STIH407_LPM_SOFTRESET>;
> +			hdmi-phandle = <&sti_hdmi>;
>  		};
>  	};
>  };


Applied on STM32 tree

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
