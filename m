Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1282E1CDC3C
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:55:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2009C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:55:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E365C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:55:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDS0t7007457; Mon, 11 May 2020 15:55:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=FqUS2AK+/voKNWyaHFkGO8gBjihNJOwLnn3nqefKSQA=;
 b=FJxEbtGCDR2Q6vXS7OfnE6CS+n4+/O/fPXfrOqkobmuHg0Sve/tYZm9Qpou3QFY8fIxv
 LlNCXhBZn7OStq5GIVOdHgDwlLZzSqiyENHq8r6oYT4G5ljeZBBSAdWlMVqQ8vd8L3/4
 Tm8lFg5i8wI9E+FXhV1W9gOSNFEY7ulC0FZuzFP1ucpMFTdMYti2QnWz45HknlEWHAB5
 EDx2vEqVgwtX0NZcS6eIzywdY7WbBtM7Tj+9ZLEJ84zSeVrm0WSFk9OrxXVggeTTPMz6
 +Brn2Ay3JjsHOOJ2Y2QzK6g8Re75Cj99XA5MV/reNtvlEasMZQT1gpdWFeKVpyajlm6N pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj01twe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:55:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BC3510002A;
 Mon, 11 May 2020 15:55:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70CAC2A9776;
 Mon, 11 May 2020 15:55:49 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 15:55:49 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:55:49 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 9/9] ARM: dts: stm32mp1: use OPP
 information for PLL1 settings in SPL
Thread-Index: AQHWJ5vg/mFNWaz7A0+yFeF+hGdiEQ==
Date: Mon, 11 May 2020 13:55:49 +0000
Message-ID: <785aa329-3579-0484-4d29-13b16b9c118e@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
 <20200421171123.9.I6fbccaae99254e6b1baf41a29257b5927df5f3f8@changeid>
In-Reply-To: <20200421171123.9.I6fbccaae99254e6b1baf41a29257b5927df5f3f8@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <E0D038F94B56E347BDDD3B77F0521024@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 9/9] ARM: dts: stm32mp1: use OPP
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

Hi Patrick

On 4/21/20 5:11 PM, Patrick Delaunay wrote:
> This patch allows to switch the CPU frequency to 800MHz on the
> ST Microelectronics board (DK1/DK2 and EV1) when it supported by the HW
> (for STM32MP15xD and STM32MP15xF).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp15-u-boot.dtsi       | 10 ++++++++++
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |  9 ---------
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  9 ---------
>  3 files changed, 10 insertions(+), 18 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
> index e0b1223de8..497c1a01ec 100644
> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
> @@ -63,6 +63,16 @@
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
> index 5844d41c53..97d5ea43c3 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -122,15 +122,6 @@
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
> index ed2f024be9..9f9aa4ac65 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -119,15 +119,6 @@
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

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
