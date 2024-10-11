Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 496B499A912
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2024 18:43:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6934C71290;
	Fri, 11 Oct 2024 16:43:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74D9CC6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 16:43:23 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCM0DF002474;
 Fri, 11 Oct 2024 18:43:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8S/5K9w67sdg3Z04B1vH4rX/iNwVA5Jck7IWoFPSO18=; b=SGbQCqvjaO4p6yY7
 vT72JDhJe5D8v7nWPOz/H3zhMxpfbd0hz+I+/C1jC9x+Li/GaLo/ESkAt1dTJnz8
 2MTo32q2BAHGYfXzBGoYF8FBGiW6O+r/HMCcSk+buTxN45YrODG9gEeYzFQjX45L
 bUaNaY3tkxtSdjeD9oSvHuo5sFgclTRC6IEmw92+AXamjRDSmY4S322tuJIiK1yE
 lypkBSvRRXeSxbUL8qhCRl1VOZuTcOCZNkVwp3WUl23oCvnirA9A1CuihR71J5pm
 J4vDk+hL1JeH0dgbA2xjGWTSpVVI7ox7Q0o7P9zxfWHcfi5EI9TNvXhkMJ9/EgNq
 D/p9Tw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f11dggv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 18:43:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D1A6400F1;
 Fri, 11 Oct 2024 18:42:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22A172A5D51;
 Fri, 11 Oct 2024 18:39:16 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 11 Oct
 2024 18:39:15 +0200
Message-ID: <9a050534-4853-4644-871f-62951dc33425@foss.st.com>
Date: Fri, 11 Oct 2024 18:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241004225916.361000-1-marex@denx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241004225916.361000-1-marex@denx.de>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 1/3] ARM: dts: stm32: Duplicate
 cpu0-opp-table node into stm32mp15-u-boot.dtsi
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 10/5/24 00:57, Marek Vasut wrote:
> The cpu0-opp-table {} node does not exist in upstream Linux stm32mp151.dtsi
> file, in order to enable conversion to OF_UPSTREAM, duplicate the node from
> current U-Boot stm32mp151.dtsi into stm32mp15-u-boot.dtsi. This makes STM32
> DTs buildable even with OF_UPSTREAM enabled. No functional change, since the
> current U-Boot stm32mp151.dtsi already contains the cpu0-opp-table {} node,
> stm32mp15-u-boot.dtsi is applied at the end, and does not bring in any new
> content.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/dts/stm32mp15-u-boot.dtsi | 30 ++++++++++++++++++++++--------
>   1 file changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
> index fe56f05616a..66d4c40c6a8 100644
> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
> @@ -56,6 +56,24 @@
>   			status = "okay";
>   		};
>   	};
> +
> +	cpu0_opp_table: cpu0-opp-table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +		bootph-pre-ram;
> +		opp-650000000 {
> +			bootph-pre-ram;
> +			opp-hz = /bits/ 64 <650000000>;
> +			opp-microvolt = <1200000>;
> +			opp-supported-hw = <0x1>;
> +		};
> +		opp-800000000 {
> +			bootph-pre-ram;
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-microvolt = <1350000>;
> +			opp-supported-hw = <0x2>;
> +		};
> +	};
>   };
>   
>   &bsec {
> @@ -82,14 +100,10 @@
>   	bootph-all;
>   };
>   
> -&cpu0_opp_table {
> -	bootph-pre-ram;
> -	opp-650000000 {
> -		bootph-pre-ram;
> -	};
> -	opp-800000000 {
> -		bootph-pre-ram;
> -	};
> +&cpu0 {
> +	nvmem-cells = <&part_number_otp>;
> +	nvmem-cell-names = "part_number";
> +	operating-points-v2 = <&cpu0_opp_table>;
>   };
>   
>   &gpioa {


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
