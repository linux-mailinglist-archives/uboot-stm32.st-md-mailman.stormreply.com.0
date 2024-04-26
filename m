Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0D8B31DE
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 10:01:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF379C71292;
	Fri, 26 Apr 2024 08:01:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D39CC71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 08:01:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q23PHT032401;
 Fri, 26 Apr 2024 10:01:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=xam9uDHD4amENAYesZJARszH3YbRl56XC4SvS+seTGc=; b=Ok
 6K2YELPPsWEj5uZ9zFMDor5xL8XimVJej1D5fErc/glBtO469Xxn72IPFy1kVJeH
 E+JdLY53pAgUm/yL1MgCnmM9D0PAgWrdbu+HHYBHw34sbAxJ4h13NrUUBbbvRGjx
 AVFvslwvX58bL/ulfxyMWP9gNsukNJQcfdChb3ly7wCDbsxMFbYiS8jIh597sTyT
 EHDvRrOF2L+liI6TM/+PzyHYjHDmqbWtad+kC5UYBYLBUo6rVMxPbCocmpEBilnN
 hHDKvvaAxDdgKtfwd3H0Zb7IWWpzCIght4V9McAGruw046l6ZtY7SnCatZ7zYtLX
 SUqgsTWb8Rj3G8uCmWkg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4kbgmag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 10:01:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 304B840045;
 Fri, 26 Apr 2024 10:01:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFAD92138C3;
 Fri, 26 Apr 2024 10:00:50 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 10:00:50 +0200
Message-ID: <cc46bdf0-dad9-4771-a785-9a8e305deb38@foss.st.com>
Date: Fri, 26 Apr 2024 10:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240421231849.194648-1-marex@denx.de>
 <20240421231849.194648-10-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240421231849.194648-10-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 10/19] ARM: dts: stm32: Add alternate
 pinmux for MP13 QSPI pins
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



On 4/22/24 01:16, Marek Vasut wrote:
> Add another mux option for QSPI pins, this is used on
> DH electronics STM32MP13xx DHCOR DHSBC board.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13-pinctrl.dtsi | 51 +++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> index cf070fbd7f7..77a222903de 100644
> --- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> @@ -305,6 +305,57 @@
>  		};
>  	};
>  
> +	qspi_clk_pins_a: qspi-clk-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 10, AF9)>; /* QSPI_CLK */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <3>;
> +		};
> +	};
> +
> +	qspi_clk_sleep_pins_a: qspi-clk-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 10, ANALOG)>; /* QSPI_CLK */
> +		};
> +	};
> +
> +	qspi_bk1_pins_a: qspi-bk1-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
> +				 <STM32_PINMUX('F', 9, AF10)>, /* QSPI_BK1_IO1 */
> +				 <STM32_PINMUX('D', 11, AF9)>, /* QSPI_BK1_IO2 */
> +				 <STM32_PINMUX('H', 7, AF13)>; /* QSPI_BK1_IO3 */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +	};
> +
> +	qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
> +				 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
> +				 <STM32_PINMUX('D', 11, ANALOG)>, /* QSPI_BK1_IO2 */
> +				 <STM32_PINMUX('H', 7, ANALOG)>; /* QSPI_BK1_IO3 */
> +		};
> +	};
> +
> +	qspi_cs1_pins_a: qspi-cs1-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 2, AF9)>; /* QSPI_BK1_NCS */
> +			bias-pull-up;
> +			drive-push-pull;
> +			slew-rate = <1>;
> +		};
> +	};
> +
> +	qspi_cs1_sleep_pins_a: qspi-cs1-sleep-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('B', 2, ANALOG)>; /* QSPI_BK1_NCS */
> +		};
> +	};
> +
>  	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
