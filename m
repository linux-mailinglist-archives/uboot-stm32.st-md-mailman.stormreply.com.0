Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F63599E1
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 11:54:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ECF7C5719D;
	Fri,  9 Apr 2021 09:54:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C86B3C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 09:54:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1399pjpG014962; Fri, 9 Apr 2021 11:54:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nrQevd6qPetf7+62ktjjjkrbCs9KiKERbIzkxi+0xkQ=;
 b=c1d6L+UwVCWCkOrPY7x8145DCFp2cJg/BwJ5RPKTaik82spFoi6kpD/T+4sqaGFoZBQK
 f7nvY6wbva7kiwEAZhMUN7EOnnJ/45maNe0+3kfJR8U2yDownNCONBKghvv9vcjzJnuq
 IH1EE3vl4tbIH2+NDC+BWaXLjFxJ3z6prRs8rtg/s72K6z7kxzPOBVH1XPbcUaXeQZhO
 lzMDxky13QltjA5oHCc7cc4Y1eNID+w5T/Wiou0Y9P//+4nq9m8AWbBmT9TS8QSrFMDI
 fTaEjvh1JQVuZx5PObd1EIlO0ajUbt7nPdE7EKrlKHIea/bxCo36N2bTUjxRH96F9W3R 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37sw5yyr0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 11:54:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76B1710002A;
 Fri,  9 Apr 2021 11:54:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65FF9228A0A;
 Fri,  9 Apr 2021 11:54:11 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 11:54:10 +0200
To: Jagan Teki <jagan@amarulasolutions.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210316162207.35641-1-jagan@amarulasolutions.com>
 <20210316162207.35641-2-jagan@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <9b530749-73ed-ec9d-22b4-6c121bec0af7@foss.st.com>
Date: Fri, 9 Apr 2021 11:54:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210316162207.35641-2-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v3 1/8] ARM: dts: stm32: Add Engicam
	i.Core STM32MP1 SoM
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

On 3/16/21 5:22 PM, Jagan Teki wrote:
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
> Linux commit details:
> 
> commit <30f9a9da4ee1> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
> SoM")
> 
> Add support for it.
> 
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - collect Patrice r-b
> Changes for v2:
> - collect Patrice r-b
> - add linux dts commit 
> 
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
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
