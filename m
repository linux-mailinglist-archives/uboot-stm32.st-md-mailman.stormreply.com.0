Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 802DA8B31BC
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 09:56:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45A96C71292;
	Fri, 26 Apr 2024 07:56:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23FEEC71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 07:56:20 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q2HUEr021460;
 Fri, 26 Apr 2024 09:56:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=zDfxLC4xEgmXxZwiF0prgSHhhCaySGLINJQnbUIFTVM=; b=vK
 nkENGDxhwM1zDMKQGUBIK//ojZb357eahFnf8RsSQEvDsevwf6b44F5HBGP8QOjM
 CvRIV7eyD3beRIy4+NvY61zTfxFwTaRe5bck51KImKFzcYfAZ949rGLRM5AsdsGu
 f4GYpge7gNXk4lmIoCdtmLluWrxh90Zd+Cj7Pxv5ahWef7B1Nt/n2Ot6/MgBsQk5
 3uYlvRk57wMq9R/ATeWlSDFx84P3DDzpY2VqLtLajisk8Jjeu+vgXgyffQIiL7oe
 30mwM4bLU0B5C20841/1U2rscQqu7ZsI0mXNfeNTASH7TAoFjI6ELZnngQYzagRj
 qExYAJGukvsx9jJqD7kQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm51wh9fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 09:56:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3C31C40044;
 Fri, 26 Apr 2024 09:56:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5A85212FD6;
 Fri, 26 Apr 2024 09:55:51 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 09:55:51 +0200
Message-ID: <1e3a82ce-6821-4601-81b3-a048c76154d5@foss.st.com>
Date: Fri, 26 Apr 2024 09:55:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240421231849.194648-1-marex@denx.de>
 <20240421231849.194648-4-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240421231849.194648-4-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 04/19] ARM: dts: stm32: Add alternate
 pinmux for MP13 ETH2 pins
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
> Add another mux option for ETH2 pins, this is used on
> DH electronics STM32MP13xx DHCOR DHSBC board.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13-pinctrl.dtsi | 45 +++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> index c709d64edcc..899f0f98e1a 100644
> --- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> @@ -72,6 +72,51 @@
>  		};
>  	};
>  
> +	eth2_rgmii_pins_a: eth2-rgmii-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 7, AF11)>, /* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('G', 11, AF10)>, /* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('G', 1, AF10)>, /* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('E', 6, AF11)>, /* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('F', 6, AF11)>, /* ETH_RGMII_TX_CTL */
> +				 <STM32_PINMUX('G', 3, AF10)>, /* ETH_RGMII_GTX_CLK */
> +				 <STM32_PINMUX('B', 6, AF11)>, /* ETH_MDIO */
> +				 <STM32_PINMUX('G', 5, AF10)>; /* ETH_MDC */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +
> +		pins2 {
> +			pinmux = <STM32_PINMUX('F', 4, AF11)>, /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('E', 2, AF10)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('H', 6, AF12)>, /* ETH_RGMII_RXD2 */
> +				 <STM32_PINMUX('A', 8, AF11)>, /* ETH_RGMII_RXD3 */
> +				 <STM32_PINMUX('A', 12, AF11)>, /* ETH_RGMII_RX_CTL */
> +				 <STM32_PINMUX('H', 11, AF11)>; /* ETH_RGMII_RX_CLK */
> +			bias-disable;
> +		};
> +	};
> +
> +	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('G', 8, ANALOG)>, /* ETH_RGMII_TX_CTL */
> +				 <STM32_PINMUX('F', 6, ANALOG)>, /* ETH_RGMII_GTX_CLK */
> +				 <STM32_PINMUX('B', 2, ANALOG)>, /* ETH_MDIO */
> +				 <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_MDC */
> +				 <STM32_PINMUX('F', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD2 */
> +				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD3 */
> +				 <STM32_PINMUX('A', 12, ANALOG)>, /* ETH_RGMII_RX_CTL */
> +				 <STM32_PINMUX('H', 11, ANALOG)>; /* ETH_RGMII_RX_CLK */
> +		};
> +	};
> +
>  	i2c1_pins_a: i2c1-0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
