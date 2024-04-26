Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDA78B31E6
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 10:03:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3621FC71292;
	Fri, 26 Apr 2024 08:03:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E82A6C71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 08:03:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q0t904018310;
 Fri, 26 Apr 2024 10:03:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=uKjrv0UJHfTLHDUMVVHeZVn5Gn6msDv50i7tpgmf7P8=; b=E/
 QQU7F8cOynQarSzCE1Dy2UkeyYdCHjT1MZEffxicRfwpWNzWXFMwIRCKBRqmUOWz
 SVwUoL8ZpF7GRqfUQPsJ7aINy5geLZ4x78bDHReb9y5ZsblXRRUtHa5/d55dXNQ/
 4u3upJx6X74abIUqw84eomB7oI7UG/95XedxYNFhEo0mbQPcksXFieTKduEv3l87
 eIDkqFAtQvpcoCz05hhd42sgkqQJR5l3G28sYWAh20YilscCxQylmbhkpSdq38c9
 foh2/n4Cq7RH3Ni6IF7POgdRXlm9aXbJvRyp2cJmbWChdA6yOFcsk0oJVPzhEf25
 CPZVccMlg9DzgiKC/+8A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4cnshfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 10:03:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D9C574002D;
 Fri, 26 Apr 2024 10:03:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B2742138D1;
 Fri, 26 Apr 2024 10:02:51 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 10:02:50 +0200
Message-ID: <2d24e7bc-d962-46ab-8c13-3aecf486c80c@foss.st.com>
Date: Fri, 26 Apr 2024 10:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240421231849.194648-1-marex@denx.de>
 <20240421231849.194648-14-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240421231849.194648-14-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 14/19] ARM: dts: stm32: Add alternate
 pinmux for MP13 SPI3 pins
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



On 4/22/24 01:17, Marek Vasut wrote:
> Add another mux option for SPI3 pins, this is used on
> DH electronics STM32MP13xx DHCOR DHSBC board.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13-pinctrl.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> index 17acd2850d3..7abd227e69f 100644
> --- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> @@ -534,6 +534,29 @@
>  		};
>  	};
>  
> +	spi3_pins_a: spi3-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('H', 13, AF6)>, /* SPI3_SCK */
> +				 <STM32_PINMUX('F', 1, AF5)>; /* SPI3_MOSI */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +
> +		pins2 {
> +			pinmux = <STM32_PINMUX('D', 4, AF5)>; /* SPI3_MISO */
> +			bias-disable;
> +		};
> +	};
> +
> +	spi3_sleep_pins_a: spi3-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* SPI3_SCK */
> +				 <STM32_PINMUX('D', 4, ANALOG)>, /* SPI3_MISO */
> +				 <STM32_PINMUX('F', 1, ANALOG)>; /* SPI3_MOSI */
> +		};
> +	};
> +
>  	spi5_pins_a: spi5-0 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('H', 7, AF6)>, /* SPI5_SCK */

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
