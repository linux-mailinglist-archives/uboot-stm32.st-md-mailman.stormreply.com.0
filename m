Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A427AE911
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 11:27:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 285C0C6B473;
	Tue, 26 Sep 2023 09:27:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FC49C6B462
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 09:27:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38Q6glHW000762; Tue, 26 Sep 2023 11:27:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Z9xgbAumF/bHocsDF78l9yJXWwRReoUtiAhh+Te99ds=; b=v2
 2XB3ci6+B424eXH+BWjv1cBGVQfdwmKhSuasIg+VT6BEaETabiqi8paNwPvIVW3z
 7PbnlhGkgZQ9M8DHVAQoXuG3BwIdBg5AjtEsj57giShb+NbLj+JFg495nnhapAiB
 hSn1yAkGJUT743Chn2NdCn1ZR0XaGNkxI5/KX+7cRv/ve/b0V5LgZe5AGTFlRa+D
 MtjF5e4o/A07HDyBHka15E0E9jjSVbi6xG9vzEdQQIGSn6d6l98CHg7Dj8xDmd9c
 IxYkfy2gDlxOkcblyyfxg4Qgs+n3m8rIMxNS3UjGJIYvknOm9bKcO/AysB1CpRz1
 g6yF7lOTvJfblFmhq78g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9pwd44tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 11:27:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2BB6E100059;
 Tue, 26 Sep 2023 11:27:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2073B22FA49;
 Tue, 26 Sep 2023 11:27:03 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 11:27:02 +0200
Message-ID: <6a18fe20-8b13-e3ad-2aa8-eae51c6eeffa@foss.st.com>
Date: Tue, 26 Sep 2023 11:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230903203352.658691-1-dario.binacchi@amarulasolutions.com>
 <20230903203352.658691-2-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230903203352.658691-2-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 uboot-stm32@st-md-mailman.stormreply.com, linux-amarula@amarulasolutions.com,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] ARM: dts: stm32: add CAN support on
	stm32f429
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



On 9/3/23 22:33, Dario Binacchi wrote:
> commit 7355ad1950f41e755e6dc451834be3b94f82acd4 Linux upstream.
> 
> Add support for bxcan (Basic eXtended CAN controller) to STM32F429. The
> chip contains two CAN peripherals, CAN1 the primary and CAN2 the secondary,
> that share some of the required logic like clock and filters. This means
> that the secondary CAN can't be used without the primary CAN.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Link: https://lore.kernel.org/all/20230328073328.3949796-4-dario.binacchi@amarulasolutions.com
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> 
>  arch/arm/dts/stm32f429.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32f429.dtsi b/arch/arm/dts/stm32f429.dtsi
> index e5b13aca40c0..22225104fca8 100644
> --- a/arch/arm/dts/stm32f429.dtsi
> +++ b/arch/arm/dts/stm32f429.dtsi
> @@ -321,6 +321,35 @@
>  			status = "disabled";
>  		};
>  
> +		can1: can@40006400 {
> +			compatible = "st,stm32f4-bxcan";
> +			reg = <0x40006400 0x200>;
> +			interrupts = <19>, <20>, <21>, <22>;
> +			interrupt-names = "tx", "rx0", "rx1", "sce";
> +			resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
> +			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
> +			st,can-primary;
> +			st,gcan = <&gcan>;
> +			status = "disabled";
> +		};
> +
> +		gcan: gcan@40006600 {
> +			compatible = "st,stm32f4-gcan", "syscon";
> +			reg = <0x40006600 0x200>;
> +			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
> +		};
> +
> +		can2: can@40006800 {
> +			compatible = "st,stm32f4-bxcan";
> +			reg = <0x40006800 0x200>;
> +			interrupts = <63>, <64>, <65>, <66>;
> +			interrupt-names = "tx", "rx0", "rx1", "sce";
> +			resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
> +			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
> +			st,gcan = <&gcan>;
> +			status = "disabled";
> +		};
> +
>  		dac: dac@40007400 {
>  			compatible = "st,stm32f4-dac-core";
>  			reg = <0x40007400 0x400>;


Apply on stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
