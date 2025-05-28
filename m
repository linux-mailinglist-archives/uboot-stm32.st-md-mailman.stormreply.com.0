Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 208A2AC623C
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 May 2025 08:45:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC0FCC36B2B;
	Wed, 28 May 2025 06:45:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7F80C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 06:45:08 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6Sptb000852;
 Wed, 28 May 2025 08:44:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4pc1Anu7c20ubG0XY5neJFmfZxEA3xMTYQHFlhnUnBI=; b=RgexKCEY1uOL9jac
 kkokGMtFQb+f2C1ZYW8TUp+EA0Y6q01Z2FZJySyPGpb/4N6hCT7M+huxW+dKekFf
 +qPuLHC1UcYz8R0KEG0AwGMapJOZ3crbP42lTooxL8xlJw9X9uSv1PEqMh4YDJEc
 Zi47tVOhZcP7rxKDExfhWqMwY/I/ssUfhlDwoSwd1Omk9riX6hpkpDTzmqwSnlCl
 K7NusmqhgnuU1tq43mO3cnAx5hC/tCBv04/+cz8yLIGqYpM4vbGvWty8lqq+lVff
 S/8RGePKH97CmTpH1WjqIPOJHCRHmVtcs51eRmJEavXHRfqv9MKu0MgZcSs8B4ts
 yuZ5Iw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4nb86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 08:44:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8750940055;
 Wed, 28 May 2025 08:43:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0988AB45521;
 Wed, 28 May 2025 08:43:13 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 08:43:12 +0200
Message-ID: <090404d1-c670-41e6-bbf7-432a3a9839ba@foss.st.com>
Date: Wed, 28 May 2025 08:43:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-9-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250512172149.150214-9-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 08/10] ARM: dts: stm32: Add STM32MP13x SPL
 specific DT additions
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



On 5/12/25 19:21, Marek Vasut wrote:
> Add DT additions required by U-Boot SPL to bring up the hardware.
> This includes binman node to generate STM32 Image v2.0 which can be
> booted by the BootROM, clock entries used by the SPL clock driver
> during clock tree initialization, and syscon-reboot node so U-Boot
> can reset the system without having to rely on PSCI call.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Cheick Traore <cheick.traore@foss.st.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13-u-boot.dtsi | 89 ++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
> index 1fe6966781c..ad63d5027b2 100644
> --- a/arch/arm/dts/stm32mp13-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
> @@ -17,6 +17,7 @@
>  		pinctrl0 = &pinctrl;
>  	};
>  
> +#if defined(CONFIG_TFABOOT)
>  	firmware {
>  		optee {
>  			bootph-all;
> @@ -27,6 +28,86 @@
>  	psci {
>  		bootph-some-ram;
>  	};
> +#else
> +	binman: binman {
> +		multiple-images;
> +
> +		spl-stm32 {
> +			filename = "u-boot-spl.stm32";
> +			mkimage {
> +				args = "-T stm32imagev2 -a 0x2ffe0000 -e 0x2ffe0000";
> +				u-boot-spl {
> +					no-write-symbols;
> +				};
> +			};
> +		};
> +	};
> +
> +	clocks {
> +		bootph-all;
> +
> +		clk_hse: ck_hse {
> +			bootph-all;
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +		};
> +
> +		clk_hsi: ck_hsi {
> +			bootph-all;
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <64000000>;
> +		};
> +
> +		clk_lse: ck_lse {
> +			bootph-all;
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32768>;
> +		};
> +
> +		clk_lsi: ck_lsi {
> +			bootph-all;
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +		};
> +
> +		clk_csi: ck_csi {
> +			bootph-all;
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <4000000>;
> +		};
> +	};
> +
> +	cpu0_opp_table: cpu0-opp-table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +		bootph-pre-ram;
> +		opp-650000000 {
> +			bootph-pre-ram;
> +			opp-hz = /bits/ 64 <650000000>;
> +			opp-microvolt = <1200000>;
> +			opp-supported-hw = <0x1>;
> +		};
> +		opp-1000000000 {
> +			bootph-pre-ram;
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <1350000>;
> +			opp-supported-hw = <0x2>;
> +		};
> +	};
> +
> +	reboot {
> +		bootph-all;
> +		compatible = "syscon-reboot";
> +		regmap = <&rcc>;
> +		offset = <0x114>;
> +		mask = <0x1>;
> +	};
> +#endif
>  
>  	soc {
>  		bootph-all;
> @@ -52,6 +133,14 @@
>  	bootph-all;
>  };
>  
> +#if !defined(CONFIG_TFABOOT)
> +&cpu0 {
> +	nvmem-cells = <&part_number_otp>;
> +	nvmem-cell-names = "part_number";
> +	operating-points-v2 = <&cpu0_opp_table>;
> +};
> +#endif
> +
>  &gpioa {
>  	bootph-all;
>  };
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
