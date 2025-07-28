Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B08EBB13727
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jul 2025 11:04:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71C65C36B2C;
	Mon, 28 Jul 2025 09:04:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5F2BC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 09:04:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S5AQ6p005322;
 Mon, 28 Jul 2025 11:04:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lKMzmyJGpIg6ytSHcBeICEpI5vBcjZkEufkutcxlo2g=; b=sjnrWCEbsk4ySd6w
 a869wJekSQccxGhuFaQizgp/9xJz6FCsODVyxkreV22u3VGPZAWLiE37VVU7tuak
 TyHh5m9JdiopVFS+MbuFb1gmHs8yRix6T2rjcFjwDU9S6yMUTjvXV0xjD7LcJ5pe
 E94ndptnj4cjH2RF4H8myDoVPhD3Nw/A0VBBCNhScveaTtMir96dx7R8zmC7BMDx
 S2xcGzdLLGxHt/ySNcYfmqL9h0CRAq8DI+bmzIZDHBgNjPvAfdV+KVnd/kf4rd92
 4KqmyQWtQvdHObIjbFMTSTKCaODuyoX6WOVYWsnQKqFzJhXbBx1KtM4GPi6LVR/z
 /ZGmSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484m58y5kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 11:04:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 800B940064;
 Mon, 28 Jul 2025 11:03:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DA9F6D8864;
 Mon, 28 Jul 2025 11:03:36 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 11:03:35 +0200
Message-ID: <9f26f5b8-8b6b-4c12-814c-349d7d1666c9@foss.st.com>
Date: Mon, 28 Jul 2025 11:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cheick Traore <cheick.traore@foss.st.com>, <u-boot@lists.denx.de>
References: <20250620155000.1258718-1-cheick.traore@foss.st.com>
 <20250620155000.1258718-3-cheick.traore@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250620155000.1258718-3-cheick.traore@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] pwm: stm32: add support for stm32mp25
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
> IPIDR register is used to check the hardware configuration register
> when available to gather the number of complementary outputs.
> 
> Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
> ---
> 
>  drivers/pwm/pwm-stm32.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index 5fa649b5903..a691f75e4a7 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -12,6 +12,7 @@
>  #include <asm/io.h>
>  #include <asm/arch/timers.h>
>  #include <dm/device_compat.h>
> +#include <linux/bitfield.h>
>  #include <linux/time.h>
>  
>  #define CCMR_CHANNEL_SHIFT	8
> @@ -157,7 +158,14 @@ static void stm32_pwm_detect_complementary(struct udevice *dev)
>  {
>  	struct stm32_timers_plat *plat = dev_get_plat(dev_get_parent(dev));
>  	struct stm32_pwm_priv *priv = dev_get_priv(dev);
> -	u32 ccer;
> +	u32 ccer, val;
> +
> +	if (plat->ipidr) {
> +		/* Simply read from HWCFGR the number of complementary outputs (MP25). */
> +		val = readl(plat->base + TIM_HWCFGR1);
> +		priv->have_complementary_output = !!FIELD_GET(TIM_HWCFGR1_NB_OF_DT, val);
> +		return;
> +	}
>  
>  	/*
>  	 * If complementary bit doesn't exist writing 1 will have no
> @@ -192,6 +200,7 @@ static const struct pwm_ops stm32_pwm_ops = {
>  
>  static const struct udevice_id stm32_pwm_ids[] = {
>  	{ .compatible = "st,stm32-pwm" },
> +	{ .compatible = "st,stm32mp25-pwm" },
>  	{ }
>  };
>  

Hi Cheick

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
