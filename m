Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 412BC1CDBC2
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:49:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E3ECC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:49:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ACABC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:49:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDRwbp007378; Mon, 11 May 2020 15:49:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=rAwQffEa4rlr6stTSmLDVIvk/p6xE/yX95OR1KGm6TU=;
 b=J6AL5WLamSHSPb6oiaxmxGf3qz5+utyJ8PceVxYb5GwH0mHEosqNNRqez/nrksbe32Nj
 da/ziKJoATqqsKM3rRNqFR3h+jaSzSFjVvyiZ5d7ofaZm/nnu5CyG2T2Ay7zQz9L97gZ
 jsdyU7cSaY7J0b1K6aV4tvzBVLhUEm94aZbdzTq2Y9A+rNBdkkzrEF6sPeo26+76tYzk
 bo1HDO/YYLCFbAjNQ7V3F744yyTJKoBcrZsYTSs5tP9deZFdDEpkKl3D9QZB3zk9JBSM
 x9gTxqkDx2s8jqpvZw9vEPzVIvtCijwzLBgROEDJtAClCpG+Lb+0MdmnW1NuBQQGG5PW hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj01tver-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:49:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBCB410002A;
 Mon, 11 May 2020 15:49:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C288E2AD2DB;
 Mon, 11 May 2020 15:49:16 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 15:49:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:49:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/9] ARM: dts: stm32: add cpufreq support
 on stm32mp15x
Thread-Index: AQHWJ5r2CnTQYlQ350uGIjIBLLjGTw==
Date: Mon, 11 May 2020 13:49:16 +0000
Message-ID: <260dbeb9-28fa-7100-75d7-001eeb063026@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
 <20200421171123.2.Id3620aec4deb419f1c1a5876b865556e86d3aba1@changeid>
In-Reply-To: <20200421171123.2.Id3620aec4deb419f1c1a5876b865556e86d3aba1@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <79C296529750F34995E354367152167E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/9] ARM: dts: stm32: add cpufreq support
 on stm32mp15x
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

On 4/21/20 5:11 PM, Patrick Delaunay wrote:
> This commit adds cpufreq support on stm32mp15x SOC. STM32 cpufreq uses
> operating points V2 bindings (no legacy). Nvmem cells have to be used to
> know the chip version and then which OPPs are available. Note that STM32
> cpufreq driver is mainly based on "cpufreq-dt" driver.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp151.dtsi      | 21 +++++++++++++++++++++
>  arch/arm/dts/stm32mp157c-ed1.dts  |  8 ++++++++
>  arch/arm/dts/stm32mp15xx-dkx.dtsi |  8 ++++++++
>  3 files changed, 37 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
> index f185639a46..1d465c3064 100644
> --- a/arch/arm/dts/stm32mp151.dtsi
> +++ b/arch/arm/dts/stm32mp151.dtsi
> @@ -19,6 +19,24 @@
>  			compatible = "arm,cortex-a7";
>  			device_type = "cpu";
>  			reg = <0>;
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			nvmem-cells = <&part_number_otp>;
> +			nvmem-cell-names = "part_number";
> +		};
> +	};
> +
> +	cpu0_opp_table: cpu0-opp-table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +		opp-650000000 {
> +			opp-hz = /bits/ 64 <650000000>;
> +			opp-microvolt = <1200000>;
> +			opp-supported-hw = <0x1>;
> +		};
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-microvolt = <1350000>;
> +			opp-supported-hw = <0x2>;
>  		};
>  	};
>  
> @@ -1512,6 +1530,9 @@
>  			reg = <0x5c005000 0x400>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +			part_number_otp: part_number_otp@4 {
> +				reg = <0x4 0x1>;
> +			};
>  			ts_cal1: calib@5c {
>  				reg = <0x5c 0x2>;
>  			};
> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
> index 54af7c97b3..7215eb4768 100644
> --- a/arch/arm/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
> @@ -107,6 +107,14 @@
>  	};
>  };
>  
> +&cpu0{
> +	cpu-supply = <&vddcore>;
> +};
> +
> +&cpu1{
> +	cpu-supply = <&vddcore>;
> +};
> +
>  &dac {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> index 42d3f0cb2d..861280afe8 100644
> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> @@ -116,6 +116,14 @@
>  	status = "okay";
>  };
>  
> +&cpu0{
> +	cpu-supply = <&vddcore>;
> +};
> +
> +&cpu1{
> +	cpu-supply = <&vddcore>;
> +};
> +
>  &ethernet0 {
>  	status = "okay";
>  	pinctrl-0 = <&ethernet0_rgmii_pins_a>;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
