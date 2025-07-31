Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABB4B16E6E
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:21:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26D53C3F938;
	Thu, 31 Jul 2025 09:21:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3400C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:21:34 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V82TQs013143;
 Thu, 31 Jul 2025 11:20:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Xi5zLouMOT/GwIhYI6PZjMBf5nqph94TvFaQ6DBuyCI=; b=EnoOR44udPmK3bBg
 6DLXbSaU/1qHvgwa/kb/oN+dJ8CNwcMbanrT3Y1zHYieN5YQ/IKt4mHzJ1WiPgZ3
 wjRcB1F9nMv7K49PfOc3cl+qnj2YcqkoymZK40dKoL4qmGvReX65pZMRj6t14oQl
 a4yPFCE1bH2xOZFvWMlsDMpiGcjUSNCbxYKycMMIobYnN6z98cQI1KXewuOnLA7t
 8gJqvXgr9IdIgvl6j0QnguQQubG+1ALlV8BUlsc1ahDdtE4C7DdUfoCdp9FXPRyl
 6LZoORjf3XQ7MxAveSep3DAF3tBCpGABr0+HryXZQ9gu8KvKbf5X7xM/jhylQiQb
 Lfqs2A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484memxwpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:20:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 740D640047;
 Thu, 31 Jul 2025 11:19:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C177A6C973A;
 Thu, 31 Jul 2025 11:18:28 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:18:28 +0200
Message-ID: <1f2216f9-d12f-4ee5-9ed4-6cb638dec42f@foss.st.com>
Date: Thu, 31 Jul 2025 11:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250630001053.952342-1-marek.vasut@mailbox.org>
 <20250630001053.952342-5-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250630001053.952342-5-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
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
Subject: Re: [Uboot-stm32] [PATCH v2 05/10] ARM: stm32: Add STM32MP13xx
 debug UART initialization
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



On 6/30/25 02:10, Marek Vasut wrote:
> Add default STM32MP13xx debug UART initialization. This is similar
> to STM32MP15xx debug UART initialization, except the RCC registers
> are at different offsets and the UART pinmux pins are different.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
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
> V2: Add RB from Patrice and Patrick
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
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
