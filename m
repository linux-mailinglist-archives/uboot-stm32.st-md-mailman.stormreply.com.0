Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109A8B3162
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 09:32:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A511BC71292;
	Fri, 26 Apr 2024 07:32:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28AB7C71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 07:32:42 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q0t7UY018278;
 Fri, 26 Apr 2024 09:32:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=6ss6JiDC+0T/zdQkAbBTJxkLAMuzJ1LzJXNanzEGjz8=; b=mN
 NZHVhUT5fy23o6UsdcZIWGPWDrOei3PGL5iWsp+21ho1nRHzn3cC0pa7m6cZmLBn
 /QSN18SQhDNn+Ta36Snp7FL9bVKR+suu9Ga0GmYp4a/Hb5u0bJmuIbzuNA3CY3yt
 Xhaaum+ek47vmOTSR69JJbSsuuC/mA1vZpPbgw+mrg4wRqpodR6uaEwCfzfZXOZq
 EQRfzPYRpB2ADquqO75Rsbt8E1Dg6Xs6Qp8eGUXwBuN4uyp+y8YKds01YkL6C7tF
 STf5ELDBLpgYrafdVcXpqtxkxlxO+Aef3X9+If6QpE/uZaRQDSBlO6bYCGQBDaDB
 cTrKok+LoveRp9VMO9Bw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4cnsdfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 09:32:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A77314002D;
 Fri, 26 Apr 2024 09:32:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 505CA21195F;
 Fri, 26 Apr 2024 09:32:02 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 09:32:01 +0200
Message-ID: <ed398ee1-b88f-4f78-ac4f-91fc910d7dc9@foss.st.com>
Date: Fri, 26 Apr 2024 09:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240319024534.103299-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240319024534.103299-1-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: dts: stm32: add PWR regulators
 support on stm32mp131
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



On 3/19/24 03:45, Marek Vasut wrote:
> This patch adds STM32 PWR regulators DT support on stm32mp131.
> This requires TFA to clear RCC_SECCFGR, is disabled by default
> and can only be enabled on board DT level.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp131.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
> index 81d99a7582b..ad331b73d18 100644
> --- a/arch/arm/dts/stm32mp131.dtsi
> +++ b/arch/arm/dts/stm32mp131.dtsi
> @@ -1092,6 +1092,30 @@
>  				 <&scmi_clk CK_SCMI_LSI>;
>  		};
>  
> +		pwr_regulators: pwr@50001000 {
> +			compatible = "st,stm32mp1,pwr-reg";
> +			reg = <0x50001000 0x10>;
> +			status = "disabled";
> +
> +			reg11: reg11 {
> +				regulator-name = "reg11";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +			};
> +
> +			reg18: reg18 {
> +				regulator-name = "reg18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +
> +			usb33: usb33 {
> +				regulator-name = "usb33";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +		};
> +
>  		exti: interrupt-controller@5000d000 {
>  			compatible = "st,stm32mp13-exti", "syscon";
>  			interrupt-controller;

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
