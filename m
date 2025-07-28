Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F9EB13725
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jul 2025 11:04:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60D88C36B2C;
	Mon, 28 Jul 2025 09:04:09 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DFA7C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 09:04:08 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S8dejf008078;
 Mon, 28 Jul 2025 11:04:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lXT7nnHbKh2Ere2JDSZ4XUl/vCAfQrhfHAsMLjzYzdY=; b=1+0a7dDITrcwLsy3
 mjf2AMCJVxMLmhgEsTj8dRYqGjvYlI5n4bTS5oEs3uoCmnRJK3gJy3qMtegqpL7U
 MicfxIkzS653Ty8Wwf8/8JKm/yGZTroKZFgd8bW0B4R19bQ90B6x4b185YKzuJjq
 A/2D9UblrFJ4t5eVUALK1shpJqUW6Rdhaz1znGMOz+uEutzib4R3JAsikQvpMsLW
 Uogicr5c4fgb66bi9/JgRPPDO1t1IVLmkQCtl9P27hXe+hxcQWFb5RW4lMdapuXG
 lj0PBXaFNrLNZ5LPbou06mM8rfIKzlk5RCcn6MOFzX8s5HoXEY6Hdch1aGNGPkCD
 zadZdQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4859yncdu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 11:04:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6349440066;
 Mon, 28 Jul 2025 11:03:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F06F6C970C;
 Mon, 28 Jul 2025 11:03:09 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 11:03:09 +0200
Message-ID: <bd5c67ab-c33f-4b7e-b19e-f907f4eb1377@foss.st.com>
Date: Mon, 28 Jul 2025 11:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cheick Traore <cheick.traore@foss.st.com>, <u-boot@lists.denx.de>
References: <20250620155000.1258718-1-cheick.traore@foss.st.com>
 <20250620155000.1258718-2-cheick.traore@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250620155000.1258718-2-cheick.traore@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] arm: stm32mp2: add multifunction
 timer support for stm32mp25
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



On 6/20/25 17:49, Cheick Traore wrote:
> Add support for STM32MP25 SoC.
> Identification and hardware configuration registers allow to read the
> timer version and capabilities (counter width, ...).
> So, rework the probe to avoid touching ARR register by simply read the
> counter width when available. This may avoid messing with a possibly
> running timer.
> Also add useful bit fields to stm32-timers header file.
> 
> Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/include/mach/timers.h |  9 ++++++
>  arch/arm/mach-stm32mp/timers.c              | 34 ++++++++++++++++++++-
>  2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/include/mach/timers.h b/arch/arm/mach-stm32mp/include/mach/timers.h
> index a84465bb28e..8209dd84911 100644
> --- a/arch/arm/mach-stm32mp/include/mach/timers.h
> +++ b/arch/arm/mach-stm32mp/include/mach/timers.h
> @@ -29,6 +29,10 @@
>  #define TIM_DMAR	0x4C	/* DMA register for transfer */
>  #define TIM_TISEL	0x68	/* Input Selection         */
>  
> +#define TIM_HWCFGR2	0x3EC	/* hardware configuration 2 Reg (MP25)	*/
> +#define TIM_HWCFGR1	0x3F0	/* hardware configuration 1 Reg (MP25)	*/
> +#define TIM_IPIDR	0x3F8	/* IP identification Reg (MP25)		*/
> +
>  #define TIM_CR1_CEN	BIT(0)	/* Counter Enable	   */
>  #define TIM_CR1_ARPE	BIT(7)
>  #define TIM_CCER_CCXE	(BIT(0) | BIT(4) | BIT(8) | BIT(12))
> @@ -40,11 +44,16 @@
>  #define TIM_CCMR_M1	(BIT(6) | BIT(5))  /* Channel PWM Mode 1 */
>  #define TIM_BDTR_MOE	BIT(15)	/* Main Output Enable      */
>  #define TIM_EGR_UG	BIT(0)	/* Update Generation       */
> +#define TIM_HWCFGR2_CNT_WIDTH	GENMASK(15, 8)	/* Counter width */
> +#define TIM_HWCFGR1_NB_OF_DT	GENMASK(7, 4)	/* Complementary outputs & dead-time generators */
>  
>  #define MAX_TIM_PSC		0xFFFF
>  
> +#define STM32MP25_TIM_IPIDR	0x00120002
> +
>  struct stm32_timers_plat {
>  	void __iomem *base;
> +	u32 ipidr;
>  };
>  
>  struct stm32_timers_priv {
> diff --git a/arch/arm/mach-stm32mp/timers.c b/arch/arm/mach-stm32mp/timers.c
> index a3207895f40..1940ba42f74 100644
> --- a/arch/arm/mach-stm32mp/timers.c
> +++ b/arch/arm/mach-stm32mp/timers.c
> @@ -10,6 +10,7 @@
>  #include <asm/io.h>
>  #include <asm/arch/timers.h>
>  #include <dm/device_compat.h>
> +#include <linux/bitfield.h>
>  
>  static void stm32_timers_get_arr_size(struct udevice *dev)
>  {
> @@ -29,6 +30,33 @@ static void stm32_timers_get_arr_size(struct udevice *dev)
>  	writel(arr, plat->base + TIM_ARR);
>  }
>  
> +static int stm32_timers_probe_hwcfgr(struct udevice *dev)
> +{
> +	struct stm32_timers_plat *plat = dev_get_plat(dev);
> +	struct stm32_timers_priv *priv = dev_get_priv(dev);
> +	u32 val;
> +
> +	if (!plat->ipidr) {
> +		/* fallback to legacy method for probing counter width */
> +		stm32_timers_get_arr_size(dev);
> +		return 0;
> +	}
> +
> +	val = readl(plat->base + TIM_IPIDR);
> +	/* Sanity check on IP identification register */
> +	if (val != plat->ipidr) {
> +		dev_err(dev, "Unexpected identification: %u\n", val);
> +		return -EINVAL;
> +	}
> +
> +	val = readl(plat->base + TIM_HWCFGR2);
> +	/* Counter width in bits, max reload value is BIT(width) - 1 */
> +	priv->max_arr = BIT(FIELD_GET(TIM_HWCFGR2_CNT_WIDTH, val)) - 1;
> +	dev_dbg(dev, "TIM width: %ld\n", FIELD_GET(TIM_HWCFGR2_CNT_WIDTH, val));
> +
> +	return 0;
> +}
> +
>  static int stm32_timers_of_to_plat(struct udevice *dev)
>  {
>  	struct stm32_timers_plat *plat = dev_get_plat(dev);
> @@ -38,6 +66,7 @@ static int stm32_timers_of_to_plat(struct udevice *dev)
>  		dev_err(dev, "can't get address\n");
>  		return -ENOENT;
>  	}
> +	plat->ipidr = (u32)dev_get_driver_data(dev);
>  
>  	return 0;
>  }
> @@ -60,13 +89,16 @@ static int stm32_timers_probe(struct udevice *dev)
>  
>  	priv->rate = clk_get_rate(&clk);
>  
> -	stm32_timers_get_arr_size(dev);
> +	ret = stm32_timers_probe_hwcfgr(dev);
> +	if (ret)
> +		clk_disable(&clk);
>  
>  	return ret;
>  }
>  
>  static const struct udevice_id stm32_timers_ids[] = {
>  	{ .compatible = "st,stm32-timers" },
> +	{ .compatible = "st,stm32mp25-timers", .data = STM32MP25_TIM_IPIDR },
>  	{}
>  };
>  
Hi Cheick

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
