Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C6115BA9F
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 09:13:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C5EBC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 08:13:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90397C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 08:13:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01D8Cu5n026743; Thu, 13 Feb 2020 09:13:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qhTtlvP3fFIbtZKScYuQCR1yug4XcO9RJXZhJfdKnUk=;
 b=DX1y6aI3/BNgRITwzgeN/Tsst+WfpDBwJFoswmaKm2kyBshpwCvw2IsZfVf2QT1kU99P
 larBtz9EG2xZ60NURPwJvLntUcrWQgD+44J7rggfzFNXD2v8Bjxwh/rQtoiHOmDyQNcV
 QSud/lWfcTbOjuGdkNvtbjLKhaBNHJyeJGsoZVOjDaaZTBegNktjJIpVgGJDzDJgf2sN
 PJBhu21RF9jCyNlrYutb7vx0QeGTYSnp1ycWt2aLeJLHzJzV9uHydHQDo96PzgfnIF+S
 3sSUsC5OQwys+p4VSOqswJ7zYMJaI5flOLtk/wko8EAmThfu8IX6bLBKf5esCsdgaasY hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhkhjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 09:13:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02FA410002A;
 Thu, 13 Feb 2020 09:13:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC7D9222CA2;
 Thu, 13 Feb 2020 09:13:26 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 09:13:26 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Feb 2020 09:13:26 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 6/9] ARM: dts: stm32m1: add reg for pll
 nodes
Thread-Index: AQHV1br0u7kYsnpLREm6LVd3yQthCKgYzrUA
Date: Thu, 13 Feb 2020 08:13:26 +0000
Message-ID: <84755d4e-8bad-1851-d2c7-0304841db46e@st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101042.6.I2f3909b277fbe345fc8d26129dfdf17ff2249b0a@changeid>
In-Reply-To: <20200128101042.6.I2f3909b277fbe345fc8d26129dfdf17ff2249b0a@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <A8BC92153B641D47BF61EB4ED0A028F9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_01:2020-02-12,
 2020-02-13 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 6/9] ARM: dts: stm32m1: add reg for pll
 nodes
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


On 1/28/20 10:11 AM, Patrick Delaunay wrote:
> Fix the following DT dtc warnings for stm32mp1 boards:
>
> Warning (unit_address_vs_reg): /soc/rcc@50000000/st,pll@0:
>   node has a unit name, but no reg property
> Warning (unit_address_vs_reg): /soc/rcc@50000000/st,pll@1:
>   node has a unit name, but no reg property
> Warning (unit_address_vs_reg): /soc/rcc@50000000/st,pll@2:
>   node has a unit name, but no reg property
> Warning (unit_address_vs_reg): /soc/rcc@50000000/st,pll@3:
>   node has a unit name, but no reg property
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp157-u-boot.dtsi           |  2 ++
>  .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi |  8 +++++
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |  8 +++++
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |  8 +++++
>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi    |  8 +++++
>  .../clock/st,stm32mp1.txt                     | 32 ++++++++++++++++---
>  6 files changed, 62 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157-u-boot.dtsi b/arch/arm/dts/stm32mp157-u-boot.dtsi
> index cb8d60e33d..8f9535a4db 100644
> --- a/arch/arm/dts/stm32mp157-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157-u-boot.dtsi
> @@ -134,6 +134,8 @@
>  
>  &rcc {
>  	u-boot,dm-pre-reloc;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  };
>  
>  &sdmmc1 {
> diff --git a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> index d8a4617d90..d6dc746365 100644
> --- a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> @@ -105,6 +105,8 @@
>  
>  	/* VCO = 1300.0 MHz => P = 650 (CPU) */
>  	pll1: st,pll@0 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <0>;
>  		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
>  		frac = < 0x800 >;
>  		u-boot,dm-pre-reloc;
> @@ -112,6 +114,8 @@
>  
>  	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
>  	pll2: st,pll@1 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <1>;
>  		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
>  		frac = < 0x1400 >;
>  		u-boot,dm-pre-reloc;
> @@ -119,6 +123,8 @@
>  
>  	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
>  	pll3: st,pll@2 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <2>;
>  		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
>  		frac = < 0x1a04 >;
>  		u-boot,dm-pre-reloc;
> @@ -126,6 +132,8 @@
>  
>  	/* VCO = 480.0 MHz => P = 120, Q = 40, R = 96 */
>  	pll4: st,pll@3 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <3>;
>  		cfg = < 1 39 3 11 4 PQR(1,1,1) >;
>  		u-boot,dm-pre-reloc;
>  	};
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index a7a125c087..a5cc01dd19 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -124,6 +124,8 @@
>  
>  	/* VCO = 1300.0 MHz => P = 650 (CPU) */
>  	pll1: st,pll@0 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <0>;
>  		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
>  		frac = < 0x800 >;
>  		u-boot,dm-pre-reloc;
> @@ -131,6 +133,8 @@
>  
>  	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
>  	pll2: st,pll@1 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <1>;
>  		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
>  		frac = < 0x1400 >;
>  		u-boot,dm-pre-reloc;
> @@ -138,6 +142,8 @@
>  
>  	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
>  	pll3: st,pll@2 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <2>;
>  		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
>  		frac = < 0x1a04 >;
>  		u-boot,dm-pre-reloc;
> @@ -145,6 +151,8 @@
>  
>  	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
>  	pll4: st,pll@3 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <3>;
>  		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
>  		u-boot,dm-pre-reloc;
>  	};
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index 32d95b84e7..347edf7e58 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -121,6 +121,8 @@
>  
>  	/* VCO = 1300.0 MHz => P = 650 (CPU) */
>  	pll1: st,pll@0 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <0>;
>  		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
>  		frac = < 0x800 >;
>  		u-boot,dm-pre-reloc;
> @@ -128,6 +130,8 @@
>  
>  	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
>  	pll2: st,pll@1 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <1>;
>  		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
>  		frac = < 0x1400 >;
>  		u-boot,dm-pre-reloc;
> @@ -135,6 +139,8 @@
>  
>  	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
>  	pll3: st,pll@2 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <2>;
>  		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
>  		frac = < 0x1a04 >;
>  		u-boot,dm-pre-reloc;
> @@ -142,6 +148,8 @@
>  
>  	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
>  	pll4: st,pll@3 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <3>;
>  		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
>  		u-boot,dm-pre-reloc;
>  	};
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> index 21aa4bfb86..6c952a57ee 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> @@ -156,6 +156,8 @@
>  
>  	/* VCO = 1300.0 MHz => P = 650 (CPU) */
>  	pll1: st,pll@0 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <0>;
>  		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
>  		frac = < 0x800 >;
>  		u-boot,dm-pre-reloc;
> @@ -163,6 +165,8 @@
>  
>  	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
>  	pll2: st,pll@1 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <1>;
>  		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
>  		frac = < 0x1400 >;
>  		u-boot,dm-pre-reloc;
> @@ -170,6 +174,8 @@
>  
>  	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
>  	pll3: st,pll@2 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <2>;
>  		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
>  		frac = < 0x1a04 >;
>  		u-boot,dm-pre-reloc;
> @@ -177,6 +183,8 @@
>  
>  	/* VCO = 600.0 MHz => P = 50, Q = 50, R = 50 */
>  	pll4: st,pll@3 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <3>;
>  		cfg = < 1 49 11 11 11 PQR(1,1,1) >;
>  		u-boot,dm-pre-reloc;
>  	};
> diff --git a/doc/device-tree-bindings/clock/st,stm32mp1.txt b/doc/device-tree-bindings/clock/st,stm32mp1.txt
> index ec1d703f34..a3d427911d 100644
> --- a/doc/device-tree-bindings/clock/st,stm32mp1.txt
> +++ b/doc/device-tree-bindings/clock/st,stm32mp1.txt
> @@ -12,6 +12,9 @@ describes the fields added for clock tree initialization which are not present
>  in Linux binding for compatible "st,stm32mp1-rcc" defined in st,stm32mp1-rcc.txt
>  file.
>  
> +This parent node may optionally have additional children nodes which define
> +specific init values for RCC elements.
> +
>  The added properties for clock tree initialization are:
>  
>  Required properties:
> @@ -78,13 +81,16 @@ Required properties:
>  	>;
>  
>  Optional Properties:
> -- st,pll : A specific PLL configuration, including frequency.
> +- children for a PLL configuration with "st,stm32mp1-pll" compatible
>  
> -  PLL children nodes for PLL1 to PLL4 (see ref manual for details)
> -  are listed with associated index 0 to 3 (st,pll@0 to st,pll@3).
> -  PLLx is off when the associated node is absent.
> +  each PLL children nodes for PLL1 to PLL4 (see ref manual for details)
> +  are listed with associated reg 0 to 3.
> +  PLLx is off when the associated node is absent or deactivated.
>  
>    Here are the available properties for each PLL node:
> +    - compatible: should be "st,stm32mp1-pll"
> +
> +    - reg: index of the pll instance
>  
>      - cfg: The parameters for PLL configuration in the following order:
>             DIVM DIVN DIVP DIVQ DIVR Output.
> @@ -118,18 +124,26 @@ Optional Properties:
>  
>      Example:
>  	st,pll@0 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <0>;
>  		cfg = < 1 53 0 0 0 1 >;
>  		frac = < 0x810 >;
>  	};
>  	st,pll@1 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <1>;
>  		cfg = < 1 43 1 0 0 PQR(0,1,1) >;
>  		csg = < 10 20 1 >;
>  	};
>  	st,pll@2 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <2>;
>  		cfg = < 2 85 3 13 3 0 >;
>  		csg = < 10 20 SSCG_MODE_CENTER_SPREAD >;
>  		};
>  	st,pll@3 {
> +		compatible = "st,stm32mp1-pll";
> +		reg = <3>;
>  		cfg = < 2 78 4 7 9 3 >;
>  	};
>  
> @@ -277,6 +291,8 @@ Example of clock tree initialization
>  			u-boot,dm-pre-reloc;
>  			compatible = "st,stm32mp1-rcc", "syscon";
>  			reg = <0x50000000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> @@ -347,6 +363,8 @@ Example of clock tree initialization
>  
>  			/* VCO = 1300.0 MHz => P = 650 (CPU) */
>  			pll1: st,pll@0 {
> +				compatible = "st,stm32mp1-pll";
> +				reg = <0>;
>  				cfg = < 2 80 0 0 0 PQR(1,0,0) >;
>  				frac = < 0x800 >;
>  				u-boot,dm-pre-reloc;
> @@ -355,6 +373,8 @@ Example of clock tree initialization
>  			/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU),
>  			                       R = 533 (DDR) */
>  			pll2: st,pll@1 {
> +				compatible = "st,stm32mp1-pll";
> +				reg = <1>;
>  				cfg = < 2 65 1 0 0 PQR(1,1,1) >;
>  				frac = < 0x1400 >;
>  				u-boot,dm-pre-reloc;
> @@ -362,6 +382,8 @@ Example of clock tree initialization
>  
>  			/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
>  			pll3: st,pll@2 {
> +				compatible = "st,stm32mp1-pll";
> +				reg = <2>;
>  				cfg = < 1 33 1 16 36 PQR(1,1,1) >;
>  				frac = < 0x1a04 >;
>  				u-boot,dm-pre-reloc;
> @@ -369,6 +391,8 @@ Example of clock tree initialization
>  
>  			/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
>  			pll4: st,pll@3 {
> +				compatible = "st,stm32mp1-pll";
> +				reg = <3>;
>  				cfg = < 3 98 5 7 7 PQR(1,1,1) >;
>  				u-boot,dm-pre-reloc;
>  			};

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
