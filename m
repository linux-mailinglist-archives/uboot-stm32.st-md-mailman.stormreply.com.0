Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A56FB3599FF
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 11:55:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BDFDC5719D;
	Fri,  9 Apr 2021 09:55:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69ABDC5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 09:55:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1399kguL021508; Fri, 9 Apr 2021 11:55:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=amFH9X1Vro7lZGWiYwi05CyIyOnxg7NOuv4uHpNFvB0=;
 b=tJzCeGo+fOcrZzZP74CEmCivgNnepB2Rot/WvLyGvA7iCuF4LJx59FKkbg5/MmsNjK4S
 k3ZN9Dr4xlPb3tcy9/FWWUOk75vbNSBvTxF0KPY1AwihaR11xoGxiv3Zl68YhmvvyDGn
 oInOSroFqlR18w7WnEUK1/dUdu3o4GfEghQfNHePDoxuo5UZlzxIuJcKa1nKQn4tC4AK
 pzZlqMyf+SgMz8VK36FkDhb4wGf/WMTh4j/FCBp8n2Yz8l1B0RsvNoD2KZQGvXSdzdJn
 0h2eOX1mf2xomLCte7OYHhvWF83JgEQFilsfkFWDNf05bw10GlF64NCDm79zG0VTdge0 fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tj4d94kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 11:55:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 165BE10002A;
 Fri,  9 Apr 2021 11:55:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C41322845C;
 Fri,  9 Apr 2021 11:55:12 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 11:55:11 +0200
To: Jagan Teki <jagan@amarulasolutions.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210316162207.35641-1-jagan@amarulasolutions.com>
 <20210316162207.35641-7-jagan@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <eb16b3d1-29d6-74f5-a6a1-a954ca63a7b3@foss.st.com>
Date: Fri, 9 Apr 2021 11:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210316162207.35641-7-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v3 6/8] ARM: dts: stm32: Add Engicam
 MicroGEA STM32MP1 Micro SoM
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
> MicroGEA STM32MP1 is a STM32MP157A based Micro SoM.
> 
> General features:
> - STM32MP157AAC
> - Up to 1GB DDR3L-800
> - 512MB Nand flash
> - I2S
> 
> MicroGEA STM32MP1 needs to mount on top of Engicam MicroDev carrier
> boards for creating complete platform solutions.
> 
> Linux dts commit details:
> 
> commit <0be81dfaeaf8> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
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
> - drop CONFIG_BOARD_EARLY_INIT_F
> 
>  .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi
> 
> diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi
> new file mode 100644
> index 0000000000..0b85175f15
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
> + * Copyright (c) 2020 Engicam srl
> + * Copyright (c) 2020 Amarula Solutons(India)
> + */
> +
> +/ {
> +	compatible = "engicam,microgea-stm32mp1", "st,stm32mp157";
> +
> +	memory@c0000000 {
> +		device_type = "memory";
> +		reg = <0xc0000000 0x10000000>;
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
> +	vin: regulator-vin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vin";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	vddcore: regulator-vddcore {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vddcore";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +		vin-supply = <&vin>;
> +	};
> +
> +	vdd: regulator-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		vin-supply = <&vin>;
> +	};
> +
> +	vddq_ddr: regulator-vddq-ddr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vddq_ddr";
> +		regulator-min-microvolt = <1350000>;
> +		regulator-max-microvolt = <1350000>;
> +		regulator-always-on;
> +		vin-supply = <&vin>;
> +	};
> +};
> +
> +&dts {
> +	status = "okay";
> +};
> +
> +&fmc {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&fmc_pins_a>;
> +	pinctrl-1 = <&fmc_sleep_pins_a>;
> +	status = "okay";
> +
> +	nand-controller@4,0 {
> +		status = "okay";
> +
> +		nand@0 {
> +			reg = <0>;
> +			nand-on-flash-bbt;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +	};
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
