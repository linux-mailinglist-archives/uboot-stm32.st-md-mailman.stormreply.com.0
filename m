Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D748AA74563
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Mar 2025 09:30:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EF59C78F77;
	Fri, 28 Mar 2025 08:30:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C0B0C78F74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 08:30:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S211Qv015578;
 Fri, 28 Mar 2025 09:30:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tAaIaomdRUxrNf096Ixr5AXQXTKfYlw529hKgV1cJks=; b=ecApZYxzbdYD8SIQ
 Qeq86NwpqSFbaPJu6RZ8aTrl/Ws9vhRi7SAqOugDa2iVj6ss/iKSWdfsLyQWB3UW
 J2S8ZRXWHo5R0IAlwOFzlCMV/3JXMC9ywzvX+6ix94plZ8fq7gmsREWiG3gnqGsj
 xhX/VIBdLLV9qOr9R93O4PHAGQ6xzHji/0mkJGr2zlaGwYrj8ii40K7ioB8yhrFI
 bOeXNgYzg8aAxQGV+g/fwQ+AKT6b2C1vFnPcb6gVWtKCDvEFs6tN95ZRdiFaAtuH
 tOICbQFzkz2jMjsVq3EgGVSvracBMnpzD7ACtP84cv0rb/i5CnGnptZxTRJXfQPg
 XGOBJA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45me34rbgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Mar 2025 09:30:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1351F400A7;
 Fri, 28 Mar 2025 09:28:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9165D89CB83;
 Fri, 28 Mar 2025 09:26:02 +0100 (CET)
Received: from [10.252.6.4] (10.252.6.4) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 09:26:02 +0100
Message-ID: <f94cb194-8a74-44a6-a443-db35349c3348@foss.st.com>
Date: Fri, 28 Mar 2025 09:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
 <20250324180047.1571378-4-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250324180047.1571378-4-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.252.6.4]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_04,2025-03-27_02,2024-11-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 3/6] ARM: dts: stm32: add display support
 on stm32f769-disco
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



On 3/24/25 19:00, Dario Binacchi wrote:
> [backport from Linux commit 598e5adfeb6062f5d4d352c0ef888b2b29d7e215]
> 
> The patch adds display support on the stm32f769-disco board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  arch/arm/dts/stm32f769-disco-u-boot.dtsi | 34 --------------
>  arch/arm/dts/stm32f769-disco.dts         | 58 ++++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> index c5ae753debe6..16a9eecd4a99 100644
> --- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> @@ -32,18 +32,6 @@
>  		compatible = "st,led1";
>  		led-gpio = <&gpioj 5 0>;
>  	};
> -
> -	panel: panel {
> -		compatible = "orisetech,otm8009a";
> -		reset-gpios = <&gpioj 15 1>;
> -		status = "okay";
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&dsi_out>;
> -			};
> -		};
> -	};
>  };
>  
>  &dsi {
> @@ -52,33 +40,11 @@
>  		 <&clk_hse>;
>  	clock-names = "pclk", "px_clk", "ref";
>  	bootph-all;
> -	status = "okay";
> -
> -	ports {
> -		port@0 {
> -			dsi_out: endpoint {
> -				remote-endpoint = <&panel_in>;
> -			};
> -		};
> -		port@1 {
> -			dsi_in: endpoint {
> -				remote-endpoint = <&dp_out>;
> -			};
> -		};
> -	};
>  };
>  
>  &ltdc {
>  	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
>  	bootph-all;
> -
> -	ports {
> -		port@0 {
> -			dp_out: endpoint {
> -				remote-endpoint = <&dsi_in>;
> -			};
> -		};
> -	};
>  };
>  
>  &fmc {
> diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
> index b4e240a8e3eb..3fd5140ec5eb 100644
> --- a/arch/arm/dts/stm32f769-disco.dts
> +++ b/arch/arm/dts/stm32f769-disco.dts
> @@ -24,6 +24,19 @@
>  		reg = <0xC0000000 0x1000000>;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		linux,dma {
> +			compatible = "shared-dma-pool";
> +			linux,dma-default;
> +			no-map;
> +			size = <0x100000>;
> +		};
> +	};
> +
>  	aliases {
>  		serial0 = &usart1;
>  	};
> @@ -78,6 +91,45 @@
>  	clock-frequency = <25000000>;
>  };
>  
> +&dsi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			dsi_in: endpoint {
> +				remote-endpoint = <&ltdc_out_dsi>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			dsi_out: endpoint {
> +				remote-endpoint = <&dsi_panel_in>;
> +			};
> +		};
> +	};
> +
> +	panel0: panel@0 {
> +		compatible = "orisetech,otm8009a";
> +		reg = <0>; /* dsi virtual channel (0..3) */
> +		reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
> +		power-supply = <&vcc_3v3>;
> +		status = "okay";
> +
> +		port {
> +			dsi_panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +};
> +
>  &i2c1 {
>  	pinctrl-0 = <&i2c1_pins_b>;
>  	pinctrl-names = "default";
> @@ -88,6 +140,12 @@
>  
>  &ltdc {
>  	status = "okay";
> +
> +	port {
> +		ltdc_out_dsi: endpoint {
> +			remote-endpoint = <&dsi_in>;
> +		};
> +	};
>  };
>  
>  &rtc {


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
