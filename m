Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE01B33B94
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Aug 2025 11:49:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97F15C36B2B;
	Mon, 25 Aug 2025 09:49:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF950C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 09:49:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8gPnO032702;
 Mon, 25 Aug 2025 11:49:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rf/40zNg4FFfuat2V2XYw0sHr3uU/UFr/V0Er57WC60=; b=0DX1/4YT8O6/Ct0b
 1/tKJjzCUiTIC81n6ypTexBb6EnYzkpPwVVkoAJ69W8VusTHatL9QgCaPN44jZhs
 CGFt43unMpaorUCiMHa3iy4HrRO2DJ9QmrEEAdEfZQKHd9CVvXxY/kgtjsZ+S35u
 S3rhYM4AWMjQ2J2FiAHhkjW7YEQNhghqjKg0YeWABKdt+yHULinS2hVls1DZLoGK
 G+/El6mv3CMtfNypYRh2tmKjfAJIP2953hVWrCIm9ZIzILvQy4UVZp/sv7/7vsql
 wLOZZVqBQZNK0CeaxpukvK0Si+W/OsGfsxwlwskEfQIWUycvsAq8M/XQtZcSU8uh
 yS6hbg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q5tspaeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Aug 2025 11:49:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 974C54002D;
 Mon, 25 Aug 2025 11:48:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBD325F0DA9;
 Mon, 25 Aug 2025 11:48:09 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 25 Aug
 2025 11:48:09 +0200
Message-ID: <d542e786-e52c-402b-8c53-ba84a38b452d@foss.st.com>
Date: Mon, 25 Aug 2025 11:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>
References: <20250820-master-v1-0-fc76f18ab2fd@foss.st.com>
 <20250820-master-v1-4-fc76f18ab2fd@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250820-master-v1-4-fc76f18ab2fd@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 4/8] video: stm32: ltdc: support new
 hardware version for STM32MP25 SoC
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



On 8/20/25 18:17, Raphael Gallais-Pou wrote:
> STM32MP2 SoCs feature a new version of the LTDC IP.  This new version
> features a bus clock, as well as a 150MHz pad frequency.  Add its
> compatible to the list of device to probe and handle quirks.  The new
> hardware version features a bus clock.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  drivers/video/stm32/stm32_ltdc.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
> index 0a062c8939dbe49b11aa50f5ca9701bdbe5c5b0b..d9ba5c4ef53558fe8b5565d47b022699d9e4ea0e 100644
> --- a/drivers/video/stm32/stm32_ltdc.c
> +++ b/drivers/video/stm32/stm32_ltdc.c
> @@ -262,6 +262,7 @@ static const u32 layer_regs_a2[] = {
>  #define HWVER_10300 0x010300
>  #define HWVER_20101 0x020101
>  #define HWVER_40100 0x040100
> +#define HWVER_40101 0x040101
>  
>  enum stm32_ltdc_pix_fmt {
>  	PF_ARGB8888 = 0,	/* ARGB [32 bits] */
> @@ -529,7 +530,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  	struct udevice *bridge = NULL;
>  	struct udevice *panel = NULL;
>  	struct display_timing timings;
> -	struct clk pclk;
> +	struct clk pclk, bclk;
>  	struct reset_ctl rst;
>  	ulong rate;
>  	int ret;
> @@ -540,7 +541,21 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  		return -EINVAL;
>  	}
>  
> -	ret = clk_get_by_index(dev, 0, &pclk);
> +	ret = clk_get_by_name(dev, "bus", &bclk);
> +	if (ret) {
> +		if (ret != -ENODATA) {
> +			dev_err(dev, "bus clock get error %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		ret = clk_enable(&bclk);
> +		if (ret) {
> +			dev_err(dev, "bus clock enable error %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_get_by_name(dev, "lcd", &pclk);
>  	if (ret) {
>  		dev_err(dev, "peripheral clock get error %d\n", ret);
>  		return ret;
> @@ -566,6 +581,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  		priv->pix_fmt_hw = pix_fmt_a1;
>  		break;
>  	case HWVER_40100:
> +	case HWVER_40101:
>  		priv->layer_regs = layer_regs_a2;
>  		priv->pix_fmt_hw = pix_fmt_a2;
>  		break;
> @@ -688,6 +704,7 @@ static int stm32_ltdc_bind(struct udevice *dev)
>  
>  static const struct udevice_id stm32_ltdc_ids[] = {
>  	{ .compatible = "st,stm32-ltdc" },
> +	{ .compatible = "st,stm32mp251-ltdc" },
>  	{ }
>  };
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
