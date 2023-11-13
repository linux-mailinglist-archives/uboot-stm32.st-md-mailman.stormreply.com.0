Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9887E987C
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Nov 2023 10:03:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4188BC6C83A;
	Mon, 13 Nov 2023 09:03:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E48F4C6B47D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Nov 2023 09:03:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AD5ppTE018418; Mon, 13 Nov 2023 10:03:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=+htHw4VibYlVEN5RDbBUraLfnuy9dj+7QUVlZ7eriRw=; b=0y
 Bd2e5ZGRU7+9RNJRvN8ZfI3pNg3ueoCCg5omEGjQUohCvfDnyJUZ6VpkBK5nQbq+
 nxIbXLw2mw/Wak6p6k0y4uVqCol6ictZFoXyAlbu2c7O4O4DJHA/pjscqmC2Vppz
 UABpiecZVfHArBJvRWUj1MeAleCWD4gB1dQ3oHwmDydkoQvnK0zAyxvYy7v2l9md
 KzRT3aLnLf3I+dPdLv+zrxHXZAoBpfatx/n6Ha1Yxq9eD1h8kl82ebUfwI+luPHm
 DnL+3JRp+2C8utxKse6hoz7w/ut+p0nAmY9/oySfVRmoqcaB/1k4k3wYoP6Y7Y0+
 xCfFM2uWsNYLQ/cz4GPA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1u1p2fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Nov 2023 10:03:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E736C10005B;
 Mon, 13 Nov 2023 10:03:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC0C720C8F6;
 Mon, 13 Nov 2023 10:03:06 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 13 Nov
 2023 10:03:06 +0100
Message-ID: <0626ef64-b2bb-4e8b-880f-5723dec80eb7@foss.st.com>
Date: Mon, 13 Nov 2023 10:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20231111104440.137117-1-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231111104440.137117-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 linux-amarula@amarulasolutions.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32f769-disco: rework ltdc
	node
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



On 11/11/23 11:44, Dario Binacchi wrote:
> With commit f479f5dbb7ac ("ARM: dts: stm32: add ltdc support on
> stm32f746 MCU"), which adds the 'ltdc' node in stm32f746.dtsi, we can
> simplify stm32f769-disco-uboot.dtsi and align stm32f769-disco.dtsi with
> the kernel version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  arch/arm/dts/stm32f769-disco-u-boot.dtsi | 23 +++++++++--------------
>  arch/arm/dts/stm32f769-disco.dts         |  4 ++++
>  2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> index 2c823cce98b4..add55c96e21f 100644
> --- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> @@ -70,22 +70,17 @@
>  				};
>  			};
>  		};
> +	};
> +};
>  
> -		ltdc: display-controller@40016800 {
> -			compatible = "st,stm32-ltdc";
> -			reg = <0x40016800 0x200>;
> -			resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
> -			clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
> -
> -			status = "okay";
> -			bootph-all;
> +&ltdc {
> +	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
> +	bootph-all;
>  
> -			ports {
> -				port@0 {
> -					dp_out: endpoint {
> -						remote-endpoint = <&dsi_in>;
> -					};
> -				};
> +	ports {
> +		port@0 {
> +			dp_out: endpoint {
> +				remote-endpoint = <&dsi_in>;
>  			};
>  		};
>  	};
> diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
> index 6f93fc7bcfcd..d63cd2ba7eb4 100644
> --- a/arch/arm/dts/stm32f769-disco.dts
> +++ b/arch/arm/dts/stm32f769-disco.dts
> @@ -86,6 +86,10 @@
>  	status = "okay";
>  };
>  
> +&ltdc {
> +	status = "okay";
> +};
> +
>  &rtc {
>  	status = "okay";
>  };

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
