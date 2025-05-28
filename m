Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23756AC61EB
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 May 2025 08:28:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC19CC36B2B;
	Wed, 28 May 2025 06:28:45 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BF80C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 06:28:45 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S10sbE016682;
 Wed, 28 May 2025 08:28:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 5R1TZOaJf5APo8+s7u6bTCXXlvHlklSlpnfwkig8t2E=; b=ASmi/Kb/3hmo+Ejd
 xlD6Myw4rfK29Eir6m9vmJGVdEQrfx1MbavUyE8OfldvRJh0fC0RbRGFO1VFlPJh
 K98JhvCzJojwdzWK8ppQcjqLpa80FrPpb9PDOeTUr3p2e94elElfrS0YL4qYX6RJ
 1LwIcJfqmWjhAZ2zikI2/lcr/NIUPbfCk/S6sf4QsvGxrbFbZPgE5Rh18M60CQVk
 kwLQ8ViYNFCExE39ol1+CtAIcEL9XggpMXolblwG7z/8w5SULsk0DYR3MaSXurkj
 Y5e2VEfDfu/CXj3LCtkyiVVpdVd8dE6GtoTZ94YpnhTldAYFZ8RIT+Vi31fGLAx0
 NO1ZUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46w54hntvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 08:28:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 30AF740058;
 Wed, 28 May 2025 08:27:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97798B3E587;
 Wed, 28 May 2025 08:26:48 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 08:26:47 +0200
Message-ID: <a1a2554e-ce37-48bf-aed5-b9f6e4a7f009@foss.st.com>
Date: Wed, 28 May 2025 08:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-6-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250512172149.150214-6-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 05/10] ARM: stm32: Add STM32MP13xx debug
 UART initialization
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



On 5/12/25 19:21, Marek Vasut wrote:
> Add default STM32MP13xx debug UART initialization. This is similar
> to STM32MP15xx debug UART initialization, except the RCC registers
> are at different offsets and the UART pinmux pins are different.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Cheick Traore <cheick.traore@foss.st.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  board/st/stm32mp1/debug_uart.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/board/st/stm32mp1/debug_uart.c b/board/st/stm32mp1/debug_uart.c
> index 24e3f9f2201..4c2149e0480 100644
> --- a/board/st/stm32mp1/debug_uart.c
> +++ b/board/st/stm32mp1/debug_uart.c
> @@ -9,17 +9,32 @@
>  #include <asm/arch/stm32.h>
>  #include <linux/bitops.h>
>  
> +#if IS_ENABLED(CONFIG_STM32MP13X)
> +#define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0700)
> +#define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0768)
> +#elif IS_ENABLED(CONFIG_STM32MP15X)
>  #define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0A00)
>  #define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0A28)
> +#endif
>  
> +#define GPIOA_BASE 0x50002000
>  #define GPIOG_BASE 0x50008000
>  
>  void board_debug_uart_init(void)
>  {
> -	if (CONFIG_DEBUG_UART_BASE == STM32_UART4_BASE) {
> -		/* UART4 clock enable */
> -		setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
> +	if (CONFIG_DEBUG_UART_BASE != STM32_UART4_BASE)
> +		return;
>  
> +	/* UART4 clock enable */
> +	setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
> +
> +	if (IS_ENABLED(CONFIG_STM32MP13X)) {
> +		/* GPIOA clock enable */
> +		writel(BIT(0), RCC_MP_AHB4ENSETR);
> +		/* GPIO configuration for DH boards: Uart4 TX = A9 */
> +		writel(0xfffbffff, GPIOA_BASE + 0x00);
> +		writel(0x00000080, GPIOA_BASE + 0x24);
> +	} else if (IS_ENABLED(CONFIG_STM32MP15X)) {
>  		/* GPIOG clock enable */
>  		writel(BIT(6), RCC_MP_AHB4ENSETR);
>  		/* GPIO configuration for ST boards: Uart4 TX = G11 */
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
