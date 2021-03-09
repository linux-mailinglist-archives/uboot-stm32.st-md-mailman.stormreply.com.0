Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9533272D
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 14:31:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9742C57B53;
	Tue,  9 Mar 2021 13:31:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA754C57195
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:31:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129DQ3fC021886; Tue, 9 Mar 2021 14:31:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RkG394i9B8qphzWV2UpET6B8ut8O/YyITeSyfXSXLek=;
 b=KLDNnOm54kp7vXIYGbovzfeXxR7O5DBWAA+Wg7VZ7cz2lQze4I3/2P4kudpbxtUUEDIq
 3GOKSVxaJDXE+bYhSoM3WiPv6dBx6aBbxLp3FMqxskNZAu1iYRa1ybSf0F9g4ycu7pp1
 6JDWxblUsmpbb7CnwgLmJKczrQy4pBfMXmuOuz7m2MHMR0J+uXlDqcBGBkhpOiHzL6Bb
 Ztj4xScL+rvxzjMg7G41QW1D1cyX628XCXy2G/Sf97H4uNbw7yRvs6sdXHIVwlFZVZ4c
 gbQdnZi/kaUFJT4eC71TmxfMbJgBfONQHh0sLH2VdnjNgJsV8KI5gwFJ53fUbfz7JkE1 XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y6sh0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 14:31:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2A6D100034;
 Tue,  9 Mar 2021 14:31:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 836DC25F41E;
 Tue,  9 Mar 2021 14:31:48 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 14:31:06 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210228155226.77904-1-jagan@amarulasolutions.com>
 <20210228155226.77904-2-jagan@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <2da7af63-9bc0-f144-f150-e71f442226d0@foss.st.com>
Date: Tue, 9 Mar 2021 14:31:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210228155226.77904-2-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 1/9] ARM: dts: stm32: Add Engicam i.Core
	STM32MP1 SoM
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

On 2/28/21 4:52 PM, Jagan Teki wrote:
> i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> 
> General features:
> - STM32MP157A
> - Up to 1GB DDR3L
> - 4GB eMMC
> - 10/100 Ethernet
> - USB 2.0 Host/OTG
> - I2S
> - MIPI DSI to LVDS
> - rest of STM32MP157A features
> 
> i.Core STM32MP1 needs to mount on top of Engicam baseboards
> for creating complete platform solutions.
> 
> Add support for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi | 196 +++++++++++++++++++
>  1 file changed, 196 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi
> 
> diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi b/arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi
> new file mode 100644
> index 0000000000..01166ccacf
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1.dtsi
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
> + * Copyright (c) 2020 Engicam srl
> + * Copyright (c) 2020 Amarula Solutons(India)
> + */
> +
> +/ {
> +	compatible = "engicam,icore-stm32mp1", "st,stm32mp157";
> +
> +	memory@c0000000 {
> +		device_type = "memory";
> +		reg = <0xc0000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		mcuram2: mcuram2@10000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10000000 0x40000>;
> +			no-map;
> +		};
> +
> +		vdev0vring0: vdev0vring0@10040000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10040000 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@10041000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10041000 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@10042000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10042000 0x4000>;
> +			no-map;
> +		};
> +
> +		mcuram: mcuram@30000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x30000000 0x40000>;
> +			no-map;
> +		};
> +
> +		retram: retram@38000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x38000000 0x10000>;
> +			no-map;
> +		};
> +	};
> +
> +	vddcore: regulator-vddcore {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vddcore";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +	};
> +
> +	vdd: regulator-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	vdd_usb: regulator-vdd-usb {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_usb";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	vdda: regulator-vdda {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdda";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	vdd_ddr: regulator-vdd-ddr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_ddr";
> +		regulator-min-microvolt = <1350000>;
> +		regulator-max-microvolt = <1350000>;
> +		regulator-always-on;
> +	};
> +
> +	vtt_ddr: regulator-vtt-ddr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vtt_ddr";
> +		regulator-min-microvolt = <675000>;
> +		regulator-max-microvolt = <675000>;
> +		regulator-always-on;
> +		vin-supply = <&vdd>;
> +	};
> +
> +	vref_ddr: regulator-vref-ddr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vref_ddr";
> +		regulator-min-microvolt = <675000>;
> +		regulator-max-microvolt = <675000>;
> +		regulator-always-on;
> +		vin-supply = <&vdd>;
> +	};
> +
> +	vdd_sd: regulator-vdd-sd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_sd";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	v3v3: regulator-v3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	v2v8: regulator-v2v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v2v8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		regulator-always-on;
> +		vin-supply = <&v3v3>;
> +	};
> +
> +	v1v8: regulator-v1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		vin-supply = <&v3v3>;
> +	};
> +};
> +
> +&dts {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	i2c-scl-falling-time-ns = <20>;
> +	i2c-scl-rising-time-ns = <185>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c2_pins_a>;
> +	pinctrl-1 = <&i2c2_sleep_pins_a>;
> +	status = "okay";
> +};
> +
> +&ipcc {
> +	status = "okay";
> +};
> +
> +&iwdg2{
> +	timeout-sec = <32>;
> +	status = "okay";
> +};
> +
> +&m4_rproc{
> +	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
> +			<&vdev0vring1>, <&vdev0buffer>;
> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> +	mbox-names = "vq0", "vq1", "shutdown";
> +	interrupt-parent = <&exti>;
> +	interrupts = <68 1>;
> +	status = "okay";
> +};
> +
> +&rng1 {
> +	status = "okay";
> +};
> +
> +&rtc{
> +	status = "okay";
> +};
> +
> +&vrefbuf {
> +	regulator-min-microvolt = <2500000>;
> +	regulator-max-microvolt = <2500000>;
> +	vdda-supply = <&vdd>;
> +	status = "okay";
> +};
> 


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
