Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF73ED31A
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Aug 2021 13:34:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 419E2C57B60;
	Mon, 16 Aug 2021 11:34:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B52EBC57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 11:34:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GBWBnF014265; Mon, 16 Aug 2021 13:34:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lIgPEzHv3jJxPXCGCLmhqzDko2sZ4gmYprtB9wRQTC4=;
 b=CXHNMvDmFN5tKk03mhtXuHEDiy8oQiex+HQ2cpLq4JoSLnGhhygLWxSk9yTjIxfu4iYg
 yn4Bbm+/NgotXQDQym4ELQ0cXTD2gRJ1MpG2kbGGHfdBA/iwEAY6VP0QC7+9N90XjIVv
 hPQJn0DQ6IWkh4U63yJZBgND306g7VLVdhx/47f5Tl/y64tdwakXOAZLYOFG58fzcJW4
 0PhgKLWcjFBsTQgVthMwok7EfpSdo3WsqWmqX6brFbASUU5rko5LgLj4E1QjOioFf0Mx
 H9KzlKXxvddO4JP/7DGBh+f5lk1DmXNpKs4Lk4H2YgZxZpWN/cnBMJiy/RTouEZSaI5H XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3afcd1u6e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 13:34:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7476C10002A;
 Mon, 16 Aug 2021 13:34:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 536692309DA;
 Mon, 16 Aug 2021 13:34:10 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 13:34:09 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210727121500.1.Ide735d274413b7aa45e4cda9d2b4a46e976d7b08@changeid>
 <409a2f20-3e6f-3dff-ff8f-cc8725966be1@foss.st.com>
Message-ID: <98cec014-0d94-fce1-11c8-e934020ab3eb@foss.st.com>
Date: Mon, 16 Aug 2021 13:34:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <409a2f20-3e6f-3dff-ff8f-cc8725966be1@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_04:2021-08-16,
 2021-08-16 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>, Tom Rini <trini@konsulko.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Christophe Kerello <christophe.kerello@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with v5.14
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

On 8/2/21 2:41 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 7/27/21 12:15 PM, Patrick Delaunay wrote:
>> Device tree alignment with Linux kernel v5.14-rc3
>> - ARM: dts: stm32: move stmmac axi config in ethernet node on stm32mp15
>> - ARM: dts: stm32: Configure qspi's mdma transfer to block for stm32mp151
>> - ARM: dts: stm32: add a new DCMI pins group on stm32mp15
>> - ARM: dts: stm32: fix ltdc pinctrl on microdev2.0-of7
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp15-pinctrl.dtsi           | 33 +++++++++++++++++++
>>  arch/arm/dts/stm32mp151.dtsi                  | 16 ++++-----
>>  ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  2 +-
>>  3 files changed, 42 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
>> index 060baa8b7e..5b60ecbd71 100644
>> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
>> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
>> @@ -118,6 +118,39 @@
>>  		};
>>  	};
>>  
>> +	dcmi_pins_b: dcmi-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('A', 4,  AF13)>,/* DCMI_HSYNC */
>> +				 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
>> +				 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
>> +				 <STM32_PINMUX('C', 6,  AF13)>,/* DCMI_D0 */
>> +				 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
>> +				 <STM32_PINMUX('H', 11, AF13)>,/* DCMI_D2 */
>> +				 <STM32_PINMUX('E', 1,  AF13)>,/* DCMI_D3 */
>> +				 <STM32_PINMUX('E', 11, AF13)>,/* DCMI_D4 */
>> +				 <STM32_PINMUX('D', 3,  AF13)>,/* DCMI_D5 */
>> +				 <STM32_PINMUX('E', 13, AF13)>,/* DCMI_D6 */
>> +				 <STM32_PINMUX('B', 9,  AF13)>;/* DCMI_D7 */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	dcmi_sleep_pins_b: dcmi-sleep-1 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('A', 4,  ANALOG)>,/* DCMI_HSYNC */
>> +				 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
>> +				 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
>> +				 <STM32_PINMUX('C', 6,  ANALOG)>,/* DCMI_D0 */
>> +				 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
>> +				 <STM32_PINMUX('H', 11, ANALOG)>,/* DCMI_D2 */
>> +				 <STM32_PINMUX('E', 1,  ANALOG)>,/* DCMI_D3 */
>> +				 <STM32_PINMUX('E', 11, ANALOG)>,/* DCMI_D4 */
>> +				 <STM32_PINMUX('D', 3,  ANALOG)>,/* DCMI_D5 */
>> +				 <STM32_PINMUX('E', 13, ANALOG)>,/* DCMI_D6 */
>> +				 <STM32_PINMUX('B', 9,  ANALOG)>;/* DCMI_D7 */
>> +		};
>> +	};
>> +
>>  	ethernet0_rgmii_pins_a: rgmii-0 {
>>  		pins1 {
>>  			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
>> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
>> index 177927d14e..8e0a0bc1dd 100644
>> --- a/arch/arm/dts/stm32mp151.dtsi
>> +++ b/arch/arm/dts/stm32mp151.dtsi
>> @@ -1399,8 +1399,8 @@
>>  			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
>>  			reg-names = "qspi", "qspi_mm";
>>  			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>> -			dmas = <&mdma1 22 0x2 0x100002 0x0 0x0>,
>> -			       <&mdma1 22 0x2 0x100008 0x0 0x0>;
>> +			dmas = <&mdma1 22 0x2 0x10100002 0x0 0x0>,
>> +			       <&mdma1 22 0x2 0x10100008 0x0 0x0>;
>>  			dma-names = "tx", "rx";
>>  			clocks = <&rcc QSPI_K>;
>>  			resets = <&rcc QSPI_R>;
>> @@ -1446,12 +1446,6 @@
>>  			status = "disabled";
>>  		};
>>  
>> -		stmmac_axi_config_0: stmmac-axi-config {
>> -			snps,wr_osr_lmt = <0x7>;
>> -			snps,rd_osr_lmt = <0x7>;
>> -			snps,blen = <0 0 0 0 16 8 4>;
>> -		};
>> -
>>  		ethernet0: ethernet@5800a000 {
>>  			compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
>>  			reg = <0x5800a000 0x2000>;
>> @@ -1477,6 +1471,12 @@
>>  			snps,axi-config = <&stmmac_axi_config_0>;
>>  			snps,tso;
>>  			status = "disabled";
>> +
>> +			stmmac_axi_config_0: stmmac-axi-config {
>> +				snps,wr_osr_lmt = <0x7>;
>> +				snps,rd_osr_lmt = <0x7>;
>> +				snps,blen = <0 0 0 0 16 8 4>;
>> +			};
>>  		};
>>  
>>  		usbh_ohci: usb@5800c000 {
>> diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
>> index 674b2d330d..5670b23812 100644
>> --- a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
>> +++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
>> @@ -89,7 +89,7 @@
>>  };
>>  
>>  &pinctrl {
>> -	ltdc_pins: ltdc {
>> +	ltdc_pins: ltdc-0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('G', 10, AF14)>,	/* LTDC_B2 */
>>  				 <STM32_PINMUX('H', 12, AF14)>,	/* LTDC_R6 */
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
