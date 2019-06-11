Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 407483C538
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 09:35:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A320CBD2E9
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 07:35:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5FCCCB51F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 07:35:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B7UriC028412; Tue, 11 Jun 2019 09:35:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=svYB3lbGJGCbZ6NlQItIo87RH+iP9n/A7jmzc+Wd0Zg=;
 b=csIlUeeVikMI0qxMIbrodscbDNdw+GbK+m4N6USBD9yjbcf+Ju6J2u5OrsW3cBt8fI0B
 YiP7obCnGoct2n71dUys3IHWTAvTVKDgKLz8YG0CT0xiVpCVnIhy2KA+uOKUFco3N/X+
 DpHB2bD0bOXsTo7eP1wHVoMwepEtP9KAJdy26pQMKkcj4p4wJv32UiCIy/Sr5OVROxBQ
 aO/o7MvJkE2NbacMXQB3wnoBbecQMqKpLHzgYgEO95iCvSE4jUjukiH4zmwvZVMv8J0i
 6/XNAcIbMc3w+6zS4+OYLWqcLxw8JNa8mav/AWZVlYC1WlpiW0sHFLEqV+auUFsuKgl2 Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t26rm8e0q-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 11 Jun 2019 09:35:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59C7F31;
 Tue, 11 Jun 2019 07:35:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EC8C13AE;
 Tue, 11 Jun 2019 07:35:15 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 11 Jun
 2019 09:35:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 11 Jun 2019 09:35:14 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe ROULLIER <christophe.roullier@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 4/6] ARM: dts: stm32: Add Ethernet support on stm32mp1
Thread-Index: AQHVDLGvvOU7GP7IvEizhtHEjYXhIqaWFX8A
Date: Tue, 11 Jun 2019 07:35:14 +0000
Message-ID: <5b472979-4cd6-0dd4-ad57-f0663fb6c28e@st.com>
References: <20190517130847.13144-1-christophe.roullier@st.com>
 <20190517130847.13144-5-christophe.roullier@st.com>
In-Reply-To: <20190517130847.13144-5-christophe.roullier@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <FF19E4EB8A8FD24784C9C0F38EB7885D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_03:, , signatures=0
Cc: Tom Rini <trini@konsulko.com>, Christophe
 KERELLO <christophe.kerello@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/6] ARM: dts: stm32: Add Ethernet
	support on stm32mp1
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



On 5/17/19 3:08 PM, Christophe Roullier wrote:
> This patch add Ethernet support on stm32mp157 eval board
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
> 
> Changes in v2: None
> 
>  arch/arm/dts/stm32mp157-pinctrl.dtsi |  9 +++++++--
>  arch/arm/dts/stm32mp157c-ev1.dts     |  2 +-
>  arch/arm/dts/stm32mp157c.dtsi        | 16 ++++++++++------
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> index 0aae69b0a04..1962267033d 100644
> --- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> @@ -173,13 +173,18 @@
>  						 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
>  						 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
>  						 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
> -						 <STM32_PINMUX('A', 2, AF11)>, /* ETH_MDIO */
>  						 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
>  					bias-disable;
>  					drive-push-pull;
> -					slew-rate = <3>;
> +					slew-rate = <2>;
>  				};
>  				pins2 {
> +					pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
> +					bias-disable;
> +					drive-push-pull;
> +					slew-rate = <0>;
> +				};
> +				pins3 {
>  					pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
>  						 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
>  						 <STM32_PINMUX('B', 0, AF11)>, /* ETH_RGMII_RXD2 */
> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
> index a6ee37924fe..d2232004410 100644
> --- a/arch/arm/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
> @@ -78,7 +78,7 @@
>  	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
>  	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
>  	pinctrl-names = "default", "sleep";
> -	phy-mode = "rgmii";
> +	phy-mode = "rgmii-id";
>  	max-speed = <1000>;
>  	phy-handle = <&phy0>;
>  
> diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
> index 94634336a5e..82177b50afe 100644
> --- a/arch/arm/dts/stm32mp157c.dtsi
> +++ b/arch/arm/dts/stm32mp157c.dtsi
> @@ -1087,21 +1087,25 @@
>  			compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
>  			reg = <0x5800a000 0x2000>;
>  			reg-names = "stmmaceth";
> -			interrupts-extended = <&intc GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "macirq";
> +			interrupts-extended =
> +				<&intc GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +				<&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +				<&exti 70 1>;
> +			interrupt-names = "macirq",
> +					  "eth_wake_irq",
> +					  "stm32_pwr_wakeup";
>  			clock-names = "stmmaceth",
>  				      "mac-clk-tx",
>  				      "mac-clk-rx",
> -				      "ethstp",
> -				      "syscfg-clk";
> +				      "ethstp";
>  			clocks = <&rcc ETHMAC>,
>  				 <&rcc ETHTX>,
>  				 <&rcc ETHRX>,
> -				 <&rcc ETHSTP>,
> -				 <&rcc SYSCFG>;
> +				 <&rcc ETHSTP>;
>  			st,syscon = <&syscfg 0x4>;
>  			snps,mixed-burst;
>  			snps,pbl = <2>;
> +			snps,en-tx-lpi-clockgating;
>  			snps,axi-config = <&stmmac_axi_config_0>;
>  			snps,tso;
>  			status = "disabled";
> 

Applied

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
