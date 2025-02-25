Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F11EA43BF2
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2025 11:41:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2517AC78F7D;
	Tue, 25 Feb 2025 10:41:22 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4721C78F65
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 10:41:20 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7vtvt003087;
 Tue, 25 Feb 2025 11:41:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 I9sbuxjO/ECXi3ZnJ33Lt5rgwwUrhVXZiEYlmn7UDfU=; b=FXfvKqRNSFerBLDt
 HWIGW/VvwQPWpaXEG7Zczti1KkhKlByACxLiq/6QuXc1Rd8KlO6dspZEb+hzSxBK
 XsCjBZASlXhCVOkejqLtoS1o9Z/Bdxk4ow3oJul1GzKWuygNnGsSvhWknN7jpMiI
 NWiy4TPggGfO5QZiFO0I3HiGa2fs14qzx9b3/qqASN4RWFliZWQ3wwu8jQNlO9+Z
 yYlh1fDyoDJZHBsBfwsDK6/OWnM3Sj8CB2u1fWmp9T9hELPylgooRCYDmzXVYMkG
 Iv90UByhFzeE65z3prN7OIbcPtG0PvBfnomn+YSvTyeqwXocNoQit2oVbRI67lJY
 d/bz8A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spae96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 11:41:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D89B400E1;
 Tue, 25 Feb 2025 11:40:27 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C9234A4383;
 Tue, 25 Feb 2025 10:52:30 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 10:52:30 +0100
Message-ID: <6aa61a85-3c16-4238-a2f0-d43fc4aba41c@foss.st.com>
Date: Tue, 25 Feb 2025 10:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20250224183931.313491-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250224183931.313491-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Vikas Manocha <vikas.manocha@st.com>, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] ARM: dts: stm32: drop "st,
	button1" compatible
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



On 2/24/25 19:39, Dario Binacchi wrote:
> It is pointless to use the custom compatible "st,button1" when
> stm32746g-eval.dts and stm32f769-disco.dts already contain the
> "gpio-keys" compatible, which is specifically used for button
> management.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v2:
> - Drop gpio-keys node from stm32f746-disco-u-boot.dtsi
> 
>  arch/arm/dts/stm32746g-eval-u-boot.dtsi    |  5 -----
>  arch/arm/dts/stm32f746-disco-u-boot.dtsi   |  5 -----
>  arch/arm/dts/stm32f769-disco-u-boot.dtsi   |  5 -----
>  board/st/stm32f746-disco/stm32f746-disco.c | 15 ---------------
>  4 files changed, 30 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32746g-eval-u-boot.dtsi b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
> index 1c288acec992..f64329287357 100644
> --- a/arch/arm/dts/stm32746g-eval-u-boot.dtsi
> +++ b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
> @@ -23,11 +23,6 @@
>  		spi0 = &qspi;
>  	};
>  
> -	button1 {
> -		compatible = "st,button1";
> -		button-gpio = <&gpioc 13 0>;
> -	};
> -
>  	led1 {
>  		compatible = "st,led1";
>  		led-gpio = <&gpiof 10 0>;
> diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> index 1b42d6cbbc19..a79fca261a2c 100644
> --- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> @@ -23,11 +23,6 @@
>  		spi0 = &qspi;
>  	};
>  
> -	button1 {
> -		compatible = "st,button1";
> -		button-gpio = <&gpioi 11 0>;
> -	};
> -
>  	led1 {
>  		compatible = "st,led1";
>  		led-gpio = <&gpioi 1 0>;
> diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> index add55c96e21f..a50fba64dcd2 100644
> --- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> @@ -23,11 +23,6 @@
>  		spi0 = &qspi;
>  	};
>  
> -	button1 {
> -		compatible = "st,button1";
> -		button-gpio = <&gpioa 0 0>;
> -	};
> -
>  	led1 {
>  		compatible = "st,led1";
>  		led-gpio = <&gpioj 5 0>;
> diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
> index 8966a09501ed..65a39d965c72 100644
> --- a/board/st/stm32f746-disco/stm32f746-disco.c
> +++ b/board/st/stm32f746-disco/stm32f746-disco.c
> @@ -94,21 +94,6 @@ int board_late_init(void)
>  		dm_gpio_set_value(&gpio, 1);
>  	}
>  
> -	/* read button 1*/
> -	node = fdt_node_offset_by_compatible(gd->fdt_blob, 0, "st,button1");
> -	if (node < 0)
> -		return -1;
> -
> -	gpio_request_by_name_nodev(offset_to_ofnode(node), "button-gpio", 0,
> -				   &gpio, GPIOD_IS_IN);
> -
> -	if (dm_gpio_is_valid(&gpio)) {
> -		if (dm_gpio_get_value(&gpio))
> -			puts("usr button is at HIGH LEVEL\n");
> -		else
> -			puts("usr button is at LOW LEVEL\n");
> -	}
> -
>  	return 0;
>  }
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
