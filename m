Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E11D8B2A312
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Aug 2025 15:05:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 115ADC3F93B;
	Mon, 18 Aug 2025 13:05:58 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E082C3F93A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 13:05:56 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IBp5iC013848;
 Mon, 18 Aug 2025 15:05:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dQkNHWM62Iw1zqJdJdieze5oxNLBGk3TqZiB/cqQp/0=; b=hphlcPAyRkZzQUfu
 ZVwDS4TlVQphf/pkyiVuO3+nLPFyJ/0oA3kzy3K9yOpzzLKpUjbEiP2n12dcrpyW
 SXeHKReFp8bjuGBn+IarUjuGISMI4kl3Rsh85IzI5OzpR/qiLjisjahv/CloJgY4
 1KGZQ+pARpnBhsoeVdxyqWcHgLYqSI0ENglnNR9+YFYD7bhY2u9Ae3OipQQtkLiQ
 bxbbMlDflSkrSQOd+omOjAePNTR+F9mdglY4l5XiapfsYFE/YSPlFt1dnweGb0Sh
 3u/9RSpy5P0XxLfcmuBjAPnq4YM8yStu/nRbexrHRfM2gkPSEkY7ci0ioiNSsZn1
 Zu1AIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48k4xmm7ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Aug 2025 15:05:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11ABF40045;
 Mon, 18 Aug 2025 15:04:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C662772626D;
 Mon, 18 Aug 2025 15:04:35 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 15:04:35 +0200
Message-ID: <93f5f0db-ad74-467e-a68d-893504c45eb1@foss.st.com>
Date: Mon, 18 Aug 2025 15:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Kerello <christophe.kerello@foss.st.com>, <u-boot@lists.denx.de>
References: <20250812135526.268574-1-christophe.kerello@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250812135526.268574-1-christophe.kerello@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Peng Fan <peng.fan@nxp.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: avoid infinite while
	loop
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



On 8/12/25 15:55, Christophe Kerello wrote:
> Avoid unlimited while loop by adding a timeout. The timeout is
> calculated based on a minimal throughput of 256 KB/s.
> The timeout is set at least to 2 seconds.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
> 
>  drivers/mmc/stm32_sdmmc2.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 9483fb57daf..122690aef3e 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -385,15 +385,29 @@ static int stm32_sdmmc2_end_data(struct udevice *dev,
>  	u32 mask = SDMMC_STA_DCRCFAIL | SDMMC_STA_DTIMEOUT |
>  		   SDMMC_STA_IDMATE | SDMMC_STA_DATAEND;
>  	u32 status;
> +	unsigned long timeout_msecs = ctx->data_length >> 8;
> +	unsigned long start_timeout;
> +
> +	/* At least, a timeout of 2 seconds is set */
> +	if (timeout_msecs < 2000)
> +		timeout_msecs = 2000;
>  
>  	if (data->flags & MMC_DATA_READ)
>  		mask |= SDMMC_STA_RXOVERR;
>  	else
>  		mask |= SDMMC_STA_TXUNDERR;
>  
> +	start_timeout = get_timer(0);
>  	status = readl(plat->base + SDMMC_STA);
> -	while (!(status & mask))
> +	while (!(status & mask)) {
> +		if (get_timer(start_timeout) > timeout_msecs) {
> +			ctx->dpsm_abort = true;
> +			return -ETIMEDOUT;
> +		}
> +
> +		schedule();
>  		status = readl(plat->base + SDMMC_STA);
> +	}
>  
>  	/*
>  	 * Need invalidate the dcache again to avoid any

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
