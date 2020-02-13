Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 347EB15BA92
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 09:13:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAC1EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 08:13:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 759FEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 08:13:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01D8CkO1010873; Thu, 13 Feb 2020 09:13:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=cU2Nep+bNq7nPbGi/3pFELHwBuI23B/AOvdtaop3Ocw=;
 b=HZ1zzTFoh6BdJlwuflxNSeEBkkBJ4KG0HAua2pqMcvwRiLMVgShmTvslXaxdODwmT85L
 vk5JzcXeLAMRdcMFzglFHaDIyThZwdNJNC9oXp2kI4nuwQ180Ls6p7pLFpVA/qvzkFAU
 VFrLSK4C5/3tH3bG05QohQSlsfu4eG0gSbfZyEp7XeEFb0vf5gFZ7YK0iHczwCCLUpto
 2yYTLz9VXn+J9RFERYktlPdTyEhx5KslASZePeeDqp95rivIQ7lgWtt4hkuO0I9CxUh0
 aM2EbieEmYwfgX6Fn8QAgrg3P/1p4rGH56RDW75vduTy2hxHLbxVAsehFuCZhRrMj916 jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhknys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 09:13:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5B23100034;
 Thu, 13 Feb 2020 09:12:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0C3B222CA2;
 Thu, 13 Feb 2020 09:12:59 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 09:12:59 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Feb 2020 09:12:59 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to
 PLL4_R
Thread-Index: AQHV1brzes+qWFFUb0uaAvnK4d0c6qgYzpMA
Date: Thu, 13 Feb 2020 08:12:59 +0000
Message-ID: <d0b0df64-ed06-b988-4da2-8cade3c574ab@st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
In-Reply-To: <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <2C34622F47F7C8459867B3C5C44FC744@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_01:2020-02-12,
 2020-02-13 signatures=0
Cc: Antonio BORNEO <antonio.borneo@st.com>, Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to
 PLL4_R
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
> From: Antonio Borneo <antonio.borneo@st.com>
>
> LTDC modifies the clock frequency to adapt it to the display. Such
> frequency change is not detected by the FDCAN driver that instead
> cache the value at probe and pretend to use it later.
>
> Keep the LTDC alone on PLL4_Q by moving the FDCAN to PLL4_R.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi | 2 +-
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi       | 2 +-
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi       | 2 +-
>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> index 1104a70a65..d8a4617d90 100644
> --- a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> @@ -91,7 +91,7 @@
>  		CLK_UART6_HSI
>  		CLK_UART78_HSI
>  		CLK_SPDIF_PLL4P
> -		CLK_FDCAN_PLL4Q
> +		CLK_FDCAN_PLL4R
>  		CLK_SAI1_PLL3Q
>  		CLK_SAI2_PLL3Q
>  		CLK_SAI3_PLL3Q
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index 4045a6e731..a7a125c087 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -110,7 +110,7 @@
>  		CLK_UART6_HSI
>  		CLK_UART78_HSI
>  		CLK_SPDIF_PLL4P
> -		CLK_FDCAN_PLL4Q
> +		CLK_FDCAN_PLL4R
>  		CLK_SAI1_PLL3Q
>  		CLK_SAI2_PLL3Q
>  		CLK_SAI3_PLL3Q
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index b2ac49472a..32d95b84e7 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -107,7 +107,7 @@
>  		CLK_UART6_HSI
>  		CLK_UART78_HSI
>  		CLK_SPDIF_PLL4P
> -		CLK_FDCAN_PLL4Q
> +		CLK_FDCAN_PLL4R
>  		CLK_SAI1_PLL3Q
>  		CLK_SAI2_PLL3Q
>  		CLK_SAI3_PLL3Q
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> index 320912edd8..21aa4bfb86 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> @@ -142,7 +142,7 @@
>  		CLK_UART6_HSI
>  		CLK_UART78_HSI
>  		CLK_SPDIF_PLL4P
> -		CLK_FDCAN_PLL4Q
> +		CLK_FDCAN_PLL4R
>  		CLK_SAI1_PLL3Q
>  		CLK_SAI2_PLL3Q
>  		CLK_SAI3_PLL3Q

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
