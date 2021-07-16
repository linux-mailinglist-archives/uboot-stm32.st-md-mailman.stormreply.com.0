Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7523CB434
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:29:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 241B0C59783;
	Fri, 16 Jul 2021 08:29:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C69EC59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:29:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8SowT000951; Fri, 16 Jul 2021 10:29:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MoFbhHeldtZ2al2obtgnh8FtRhQTIOiH/8QyVytl0uM=;
 b=UYjejLK0H9iNR80d7+vlIV9yLAnG3TjJmQ0PGzattMAqLRqdrQddAW/JWa0fxnO35Ua4
 b1QdvyoREfRKHGpLVzFLTGvZLzdpo0ZcgT3/XtFVwuF3JejmmGkTS4wD4KjTEt7uGn+4
 mMEH2J6iQs1p2B+ePVeW3dYi1H5kq66YF2cbnsN0cyms9IfseDh+pgkAuYQVTQpdkgZo
 7dLIMrM2ayW3G6c2AgDCYjcFZcxGEsMHJjgq01ZwfMGNThjG8t/xqFfGVvqApUaj3fd/
 z3N72DCmopPcAiSXik4XaozOkNsTAdC0SZiI8K075OYON/EFZIVXI8ZgxSExlOlsj6RH 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1uamr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:29:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F24D810002A;
 Fri, 16 Jul 2021 10:29:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5064218CA3;
 Fri, 16 Jul 2021 10:29:32 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:29:32 +0200
To: <u-boot@lists.denx.de>
References: <20210629120417.1.I711fb255292d0f086a2632041897c48c163403bd@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <8175802b-23c2-e550-f4da-e657f0e3715a@foss.st.com>
Date: Fri, 16 Jul 2021 10:29:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629120417.1.I711fb255292d0f086a2632041897c48c163403bd@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

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
>   drivers/clk/clk_stm32mp1.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index 0c0ef366a1..48c9514ba0 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -540,6 +540,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
>   	STM32MP1_CLK_SET_CLR(RCC_MP_APB2ENSETR, 13, USART6_K, _UART6_SEL),
>   
>   	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB3ENSETR, 13, VREF, _PCLK3),
> +	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB3ENSETR, 11, SYSCFG, _UNKNOWN_SEL),
>   
>   	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB4ENSETR, 0, LTDC_PX, _PLL4_Q),
>   	STM32MP1_CLK_SET_CLR_F(RCC_MP_APB4ENSETR, 4, DSI_PX, _PLL4_Q),


Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
