Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 097307B7C32
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 11:34:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5280C6C832;
	Wed,  4 Oct 2023 09:34:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15A33C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 09:34:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3945jDGB022867; Wed, 4 Oct 2023 11:33:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=hoy2k+2RiKqJlSZsksZsYMfPHsB68dCPMLSLuTiLCWI=; b=3q
 Ll6rTw/AlN5Ms/OIZj7X7ydlK6pRCI5zvvow6UA5ECYk28gFSQm7rqAd0d2hLkvR
 QrwIeBLYLlYw0iQ+Spbdh+8WCZujL1SAqdHNhJIjb7NJ+SsDIij0yxgw1wBDsUzF
 X2q+5N8NXHcUtfClqZGTJtL1I8BhNXdNHCwTyUTKVjUkhPb458NxWdNFho59zNVC
 ZoIS4vUjh1rLq/zg9DcCjwq3ew6qW5ABCTSnj+3ddfaXry4NGPp4JdC7gCH0sxNC
 CIaLfnEHjMTP6rhqqOA3+KxxwcnOYbOOLErU8ozwqIavTfEz9VbdXtsbgNKCOG58
 sxW/dEFNitKlXvddgKYg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tggx34q7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 11:33:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 493D5100053;
 Wed,  4 Oct 2023 11:33:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40D7122AFEE;
 Wed,  4 Oct 2023 11:33:57 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 11:33:56 +0200
Message-ID: <d7b3fe1e-7f44-a7d4-088e-9c7cbf06495e@foss.st.com>
Date: Wed, 4 Oct 2023 11:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Anatolij Gustschin <agust@denx.de>, <u-boot@lists.denx.de>
References: <20230929113437.26081-1-agust@denx.de>
 <7fe15b9c-213c-3187-ec85-9e9d884c1c33@foss.st.com>
In-Reply-To: <7fe15b9c-213c-3187-ec85-9e9d884c1c33@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
Cc: patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 lukma@denx.de, seanga2@gmail.com
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32mp1: Add support for USART1
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



On 10/4/23 11:28, Patrice CHOTARD wrote:
> 
> 
> On 9/29/23 13:34, Anatolij Gustschin wrote:
>> Add USART1 clock parents and mux configuration. This allows
>> support for configuring the USART1 as the serial console in
>> SPL and U-Boot via device tree. Without this patch the SPL
>> with usart1 serial console enabled crashes because it can
>> not find the clock specified in the device tree for usart1.
>>
>> Signed-off-by: Anatolij Gustschin <agust@denx.de>
>> ---
>>  drivers/clk/stm32/clk-stm32mp1.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
>> index 6150287694..f3ac8c7583 100644
>> --- a/drivers/clk/stm32/clk-stm32mp1.c
>> +++ b/drivers/clk/stm32/clk-stm32mp1.c
>> @@ -72,6 +72,7 @@ DECLARE_GLOBAL_DATA_PTR;
>>  #define RCC_PLL2CSGR		0xA4
>>  #define RCC_I2C46CKSELR		0xC0
>>  #define RCC_SPI6CKSELR		0xC4
>> +#define RCC_UART1CKSELR		0xC8
>>  #define RCC_CPERCKSELR		0xD0
>>  #define RCC_STGENCKSELR		0xD4
>>  #define RCC_DDRITFCR		0xD8
>> @@ -317,6 +318,7 @@ enum stm32mp1_parent_sel {
>>  	_SPI45_SEL,
>>  	_SPI6_SEL,
>>  	_RTC_SEL,
>> +	_UART1_SEL,
>>  	_PARENT_SEL_NB,
>>  	_UNKNOWN_SEL = 0xff,
>>  };
>> @@ -557,6 +559,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 0, SPI6_K, _SPI6_SEL),
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 2, I2C4_K, _I2C46_SEL),
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 3, I2C6_K, _I2C46_SEL),
>> +	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 4, USART1_K, _UART1_SEL),
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 8, RTCAPB, _PCLK5),
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 16, BSEC, _UNKNOWN_SEL),
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 20, STGEN_K, _STGEN_SEL),
>> @@ -602,6 +605,8 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
>>  static const u8 i2c12_parents[] = {_PCLK1, _PLL4_R, _HSI_KER, _CSI_KER};
>>  static const u8 i2c35_parents[] = {_PCLK1, _PLL4_R, _HSI_KER, _CSI_KER};
>>  static const u8 i2c46_parents[] = {_PCLK5, _PLL3_Q, _HSI_KER, _CSI_KER};
>> +static const u8 uart1_parents[] = {_PCLK5, _PLL3_Q, _HSI_KER, _CSI_KER,
>> +					_PLL4_Q, _HSE_KER};
>>  static const u8 uart6_parents[] = {_PCLK2, _PLL4_Q, _HSI_KER, _CSI_KER,
>>  					_HSE_KER};
>>  static const u8 uart24_parents[] = {_PCLK1, _PLL4_Q, _HSI_KER, _CSI_KER,
>> @@ -659,6 +664,7 @@ static const struct stm32mp1_clk_sel stm32mp1_clk_sel[_PARENT_SEL_NB] = {
>>  	STM32MP1_CLK_PARENT(_RTC_SEL, RCC_BDCR, RCC_BDCR_RTCSRC_SHIFT,
>>  			    (RCC_BDCR_RTCSRC_MASK >> RCC_BDCR_RTCSRC_SHIFT),
>>  			    rtc_parents),
>> +	STM32MP1_CLK_PARENT(_UART1_SEL, RCC_UART1CKSELR, 0, 0x7, uart1_parents),
>>  };
>>  
>>  #ifdef STM32MP1_CLOCK_TREE_INIT
>> @@ -786,6 +792,7 @@ char * const stm32mp1_clk_parent_sel_name[_PARENT_SEL_NB] = {
>>  	[_SPI1_SEL] = "SPI1",
>>  	[_SPI45_SEL] = "SPI45",
>>  	[_RTC_SEL] = "RTC",
>> +	[_UART1_SEL] = "UART1",
>>  };
>>  
>>  static const struct stm32mp1_clk_data stm32mp1_data = {
> 
> 
> Hi Anatolij
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice

Apply on stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
