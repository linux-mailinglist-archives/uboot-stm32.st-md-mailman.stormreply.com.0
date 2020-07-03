Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C0C2134A4
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 09:07:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 214CDC36B24
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 07:07:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65D92C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 07:07:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063757wk016837; Fri, 3 Jul 2020 09:07:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=okYNaT7I7JNF/uO/IR4DNOZgEuzl8dYqH5pHjmt9il8=;
 b=tr6e6RpCKvUzt2HaON/pV5Tx35rulLPUEhG57wRIL3LyfFsLykOYmkBGrUmorjSvH6xE
 0PMQgKBt2XixRKNY10iQqkua/hJb0+iGjnCuUgPWyGYILCi6Fu1blxC1CS2k5LUDp5g3
 M0ytz4BVUCiEFbVsR6H5UMrA4vDjEMgWzIufttx9qTk4Cq3G4O9tV57UF7TcupBbhZso
 uv0EDIlOdH6Zd8KamAsS4lHsOzHNISunnU5QJddXldfR4brp+b63xBv7uLreXktiY3fL
 a48bZx7c1cnqBaSucUoo4YEF/gmzfVwbf03My1LcnP1zz7phjSCzG+860IRSOO6VqAPn 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwmukd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 09:07:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B39510002A;
 Fri,  3 Jul 2020 09:07:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F4DD2AD2AA;
 Fri,  3 Jul 2020 09:07:17 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 Jul
 2020 09:07:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 3 Jul 2020 09:07:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 8/9] ARM: dts: stm32mp1: use OPP
 information for PLL1 settings in SPL
Thread-Index: AQHWUQiV7upCrpe5nEu1ORfExEyhxw==
Date: Fri, 3 Jul 2020 07:07:16 +0000
Message-ID: <824946d5-8848-b202-af66-28f1bfadaba0@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
 <20200525101949.15944-9-patrick.delaunay@st.com>
In-Reply-To: <20200525101949.15944-9-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <F24C265FC8C0C64C93DDD3A8A4B8057A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_02:2020-07-02,
 2020-07-03 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 8/9] ARM: dts: stm32mp1: use OPP
 information for PLL1 settings in SPL
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

HI Patrick

On 5/25/20 12:19 PM, Patrick Delaunay wrote:
> This patch allows to switch the CPU frequency to 800MHz on the
> ST Microelectronics board (DK1/DK2 and EV1) or dh electronics SOM
> using the STM32MP15x SOC and when it is supported by the HW
> (for STM32MP15xD and STM32MP15xF).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - update stm32mp15xx-dhcor and dhcom device tree
>
>  arch/arm/dts/stm32mp15-u-boot.dtsi         | 10 ++++++++++
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi   |  9 ---------
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi   |  9 ---------
>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi |  9 ---------
>  arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi |  9 ---------
>  5 files changed, 10 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
> index a0d971ad88..66be7df9ae 100644
> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
> @@ -88,6 +88,16 @@
>  	u-boot,dm-pre-reloc;
>  };
>  
> +&cpu0_opp_table {
> +	u-boot,dm-spl;
> +	opp-650000000 {
> +		u-boot,dm-spl;
> +	};
> +	opp-800000000 {
> +		u-boot,dm-spl;
> +	};
> +};
> +
>  &gpioa {
>  	u-boot,dm-pre-reloc;
>  };
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index c52abeb1e7..69cdae6685 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -118,15 +118,6 @@
>  		CLK_LPTIM45_LSE
>  	>;
>  
> -	/* VCO = 1300.0 MHz => P = 650 (CPU) */
> -	pll1: st,pll@0 {
> -		compatible = "st,stm32mp1-pll";
> -		reg = <0>;
> -		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
> -		frac = < 0x800 >;
> -		u-boot,dm-pre-reloc;
> -	};
> -
>  	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
>  	pll2: st,pll@1 {
>  		compatible = "st,stm32mp1-pll";
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index 84af7fa47b..3f716306be 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -115,15 +115,6 @@
>  		CLK_LPTIM45_LSE
>  	>;
>  
> -	/* VCO = 1300.0 MHz => P = 650 (CPU) */
> -	pll1: st,pll@0 {
> -		compatible = "st,stm32mp1-pll";
> -		reg = <0>;
> -		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
> -		frac = < 0x800 >;
> -		u-boot,dm-pre-reloc;
> -	};
> -
>  	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
>  	pll2: st,pll@1 {
>  		compatible = "st,stm32mp1-pll";
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> index 75d75266e8..f96de9e7a3 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> @@ -235,15 +235,6 @@
>  		CLK_LPTIM45_LSE
>  	>;
>  
> -	/* VCO = 1300.0 MHz => P = 650 (CPU) */
> -	pll1: st,pll@0 {
> -		compatible = "st,stm32mp1-pll";
> -		reg = <0>;
> -		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
> -		frac = < 0x800 >;
> -		u-boot,dm-pre-reloc;
> -	};
> -
>  	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
>  	pll2: st,pll@1 {
>  		compatible = "st,stm32mp1-pll";
> diff --git a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
> index ef730a8322..4059dabf1d 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
> @@ -105,15 +105,6 @@
>  		CLK_LPTIM45_LSE
>  	>;
>  
> -	/* VCO = 1300.0 MHz => P = 650 (CPU) */
> -	pll1: st,pll@0 {
> -		compatible = "st,stm32mp1-pll";
> -		reg = <0>;
> -		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
> -		frac = < 0x800 >;
> -		u-boot,dm-pre-reloc;
> -	};
> -
>  	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
>  	pll2: st,pll@1 {
>  		compatible = "st,stm32mp1-pll";

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
