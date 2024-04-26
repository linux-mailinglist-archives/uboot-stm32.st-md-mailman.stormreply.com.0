Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 826D58B31BA
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 09:56:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E361C71292;
	Fri, 26 Apr 2024 07:56:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 295C9C71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 07:56:11 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q0t7YR018278;
 Fri, 26 Apr 2024 09:56:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ZjQ3oySCKZ5FOYmEgN2PLVlAudK/pjuf4ClJGkq0iqc=; b=uF
 PK7U21ccvdOpuMgmo+QYXax1RuTHVSEb9NOgXb4Iin0hlFUxAacs8YWTI4aSbMak
 jMzexvujrnxEvyIXHKzZ5QdJuYRsPbg2E7zTnZNewTe/Wl9sF7ZLA5rqK9cc1BOu
 r+Lz2Eadrw+6a539YA/3h3RzliSxu223HcqXimY9+k9VV0qIXs/XTMu0JHSjIfcf
 OmPEhM9eCexy9qr1v29cixkREAfal3ELkRzbC8XryWOE9g6zVZH7ILLzx2HSmI8/
 P+Q3DZ0GuRCqlSG1ItBn+jfIbHm3IARyNbyMF8UYH3mVuwxl6EEtZRy4vbNUIYgU
 liM5PcZy3pRffyAvSVcw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4cnsge6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 09:56:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D5EC540044;
 Fri, 26 Apr 2024 09:55:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B2BB2132DB;
 Fri, 26 Apr 2024 09:55:41 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 09:55:40 +0200
Message-ID: <766d50d7-1f7d-4782-9c3b-829e128bd03d@foss.st.com>
Date: Fri, 26 Apr 2024 09:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240421231849.194648-1-marex@denx.de>
 <20240421231849.194648-3-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240421231849.194648-3-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 03/19] ARM: dts: stm32: Add alternate
 pinmux for MP13 ETH1 pins
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
> Add another mux option for ETH1 pins, this is used on
> DH electronics STM32MP13xx DHCOR DHSBC board.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13-pinctrl.dtsi | 46 +++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> index 396fb6eee84..c709d64edcc 100644
> --- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
> @@ -26,6 +26,52 @@
>  		};
>  	};
>  
> +	eth1_rgmii_pins_a: eth1-rgmii-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('E', 5, AF10)>, /* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
> +				 <STM32_PINMUX('C', 1, AF11)>, /* ETH_RGMII_GTX_CLK */
> +				 <STM32_PINMUX('A', 2, AF11)>, /* ETH_MDIO */
> +				 <STM32_PINMUX('G', 2, AF11)>; /* ETH_MDC */
> +			bias-disable;
> +			drive-push-pull;
> +			slew-rate = <2>;
> +		};
> +
> +		pins2 {
> +			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('B', 0, AF11)>, /* ETH_RGMII_RXD2 */
> +				 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
> +				 <STM32_PINMUX('A', 7, AF11)>, /* ETH_RGMII_RX_CTL */
> +				 <STM32_PINMUX('D', 7, AF10)>; /* ETH_RGMII_RX_CLK */
> +			bias-disable;
> +		};
> +
> +	};
> +
> +	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
> +				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
> +				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
> +				 <STM32_PINMUX('E', 5, ANALOG)>, /* ETH_RGMII_TXD3 */
> +				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
> +				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_GTX_CLK */
> +				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
> +				 <STM32_PINMUX('G', 2, ANALOG)>, /* ETH_MDC */
> +				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
> +				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH_RGMII_RXD1 */
> +				 <STM32_PINMUX('A', 7, ANALOG)>, /* ETH_RGMII_RX_CTL */
> +				 <STM32_PINMUX('D', 7, ANALOG)>; /* ETH_RGMII_RX_CLK */
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
