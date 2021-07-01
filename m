Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BAE3B8E27
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:26:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D93BC59783;
	Thu,  1 Jul 2021 07:26:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9DA9C59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:26:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617N7Qc010295; Thu, 1 Jul 2021 09:26:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wfohgwaX2M8Np4m8T0Pp9gJufpaHyf4twHMZCea8rO4=;
 b=XsjixQ1v5tLC0XA3bUL+MzJFXxIJsoCbjcBm7jOoNGNxA8bZAQTgjRvAtGQig7QcEraQ
 gYHA3HHLa8CJ1OwiCTKtxo7IiSPWmNdDlsS3wISapLE/pd4s3zl+InSghzF5/qE4Ti8C
 Pulwo2jdiPyej48VsbjgJjVbUeIanE2pPuMXkykHxm0NEjf7bhZD0fIa/AvWthSX25x6
 CFhCRr8iEsSPljzq0LWPfBKqpjR5VJn+Pzl0ITF1PUN/Z6egxwoEzyyJhlcxMbev/atT
 385LG0dUU5073QLlmYeSj7r5NtrGPpTxo2qxJEAj3fZh6VFXI1nBhaW08l+sFAf8V90o 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39gn11eu6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:26:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48240100038;
 Thu,  1 Jul 2021 09:26:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35DFB20E3D7;
 Thu,  1 Jul 2021 09:26:24 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:26:23 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210629120417.1.I711fb255292d0f086a2632041897c48c163403bd@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <42d0a698-f3e7-1a42-d5a3-9e9aa8f7ba00@foss.st.com>
Date: Thu, 1 Jul 2021 09:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629120417.1.I711fb255292d0f086a2632041897c48c163403bd@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] clk: stm32mp1: add support of SYSCFG
	clock
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

On 6/29/21 12:04 PM, Patrick Delaunay wrote:
> Add the support of SYSCFG clock used by syscon driver
> to prepare the clock management of STM32MP_SYSCON_SYSCFG.
> 
> This clock is already defined in kernel device tree,
> stm32mp151.dtsi but not yet supported in the syscon driver:
> 
> syscfg: syscon@50020000 {
> 	compatible = "st,stm32mp157-syscfg", "syscon";
> 	reg = <0x50020000 0x400>;
> 	clocks = <&rcc SYSCFG>;
> };
> 
> It is safe to support this clock in U-Boot driver with
> RCC_MC_APB3ENSETR, Bit 11 SYSCFGEN: SYSCFG peripheral clocks
> enable.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/clk/clk_stm32mp1.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index 0c0ef366a1..48c9514ba0 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -540,6 +540,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 13, USART6_K, _UART6_SEL),
>  
>  	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB3ENSETR, 13, VREF, _PCLK3),
> +	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB3ENSETR, 11, SYSCFG, _UNKNOWN_SEL),
>  
>  	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB4ENSETR, 0, LTDC_PX, _PLL4_Q),
>  	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB4ENSETR, 4, DSI_PX, _PLL4_Q),
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
