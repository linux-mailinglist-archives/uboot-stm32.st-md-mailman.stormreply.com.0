Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3502230EE2
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 18:09:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BAA1C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:09:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 051EAC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 16:09:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SG3eUq012815; Tue, 28 Jul 2020 18:09:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=uWqny9rMR4ALfNW+y+Bz/Foh2f4boKd25ymsvLN/izA=;
 b=UIkMjAlNUgwDYaFyKV2oR/KC2IA+X8gNUWDrdjmRI6iaXIvhKm9fSV745M1Pdsz65pw+
 M3zyokFnfGzHxCmBj/iM6Dmk83xEMEM9DHcQrmO1/FHNrHLWLh3gyxEt9vwl15YS2VxH
 RGQR2p9UpgZVNcwec8U5rU5y3rOP/SO1JvqK4+49aT5AXob6kyXxv4PlGRW862RVJ5ml
 fhN3rmOtvIJTncKEmJMZqoK6aCplq7lQoFuOD1hsFL5fyktt1lhLgziDG2aKqNz3uPxQ
 lqdidBZcmf5j5HemEiJT+LRnL5dhlVAqUxJ1siabRJbOg3LF/9G7x9jNChHemDemXOT4 mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv71u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 18:09:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 205FD10002A;
 Tue, 28 Jul 2020 18:09:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 182CE2A9784;
 Tue, 28 Jul 2020 18:09:22 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 18:09:21 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 18:09:21 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 1/3] ARM: dts: rename stm32mp15xx-avenger96
 ethernet0_rgmii_pins
Thread-Index: AQHWZPl0R4YzubhR0EGk0SoMPme6kw==
Date: Tue, 28 Jul 2020 16:09:21 +0000
Message-ID: <8cf6adde-4cba-67c4-7ed7-d517434c5b9b@st.com>
References: <20200706112653.18951-1-patrick.delaunay@st.com>
In-Reply-To: <20200706112653.18951-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <9A5F9F592B76734D97F525884A2080D2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] ARM: dts: rename
 stm32mp15xx-avenger96 ethernet0_rgmii_pins
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


On 7/6/20 1:26 PM, Patrick Delaunay wrote:
> Alignment with pins name used in Linux kernel v5.8.
>
> It is a preleminary step for device tree alignment.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp15-pinctrl.dtsi          | 4 ++--
>  arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> index c385896ebc..b0c2aa52f8 100644
> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> @@ -162,7 +162,7 @@
>  		};
>  	};
>  
> -	ethernet0_rgmii_pins_b: rgmii-1 {
> +	ethernet0_rgmii_pins_c: rgmii-2 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
>  				 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
> @@ -193,7 +193,7 @@
>  		};
>  	};
>  
> -	ethernet0_rgmii_pins_sleep_b: rgmii-sleep-1 {
> +	ethernet0_rgmii_sleep_pins_c: rgmii-sleep-2 {
>  		pins1 {
>  			pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
>  				 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
> diff --git a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
> index c1cc80bcf5..88f25d89b2 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
> +++ b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
> @@ -89,8 +89,8 @@
>  
>  &ethernet0 {
>  	status = "okay";
> -	pinctrl-0 = <&ethernet0_rgmii_pins_b>;
> -	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_b>;
> +	pinctrl-0 = <&ethernet0_rgmii_pins_c>;
> +	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_c>;
>  	pinctrl-names = "default", "sleep";
>  	phy-mode = "rgmii";
>  	max-speed = <1000>;
Applied to u-boot-stm/master

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
