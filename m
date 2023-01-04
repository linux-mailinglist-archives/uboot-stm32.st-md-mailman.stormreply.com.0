Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C42565D05E
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Jan 2023 11:07:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8062C6905D;
	Wed,  4 Jan 2023 10:07:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6604DC6905B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jan 2023 10:07:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3047PIE6006262; Wed, 4 Jan 2023 11:07:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=js/jQJfWpv/WxWWFMyp9rNNEZNhtLRjMIvqBr2bWUAk=;
 b=NdDszcVmi9eSBX04FA3JWrO1M1jSjrr6cFzdHUyrcWeom7hwsujUPCcA8tpj7uhwKbUZ
 2RcC+5YaPoW732WAiU43zwNcDOFW9VO1q75+vbgGidZy4L5AkLkyAwUxfnSrnG39Tn7A
 FxK+8kSOoaRyM+ZeluVKYXLnIxMUW7/xkfSoRMGPOCikftWQEiourlxnUlQLLAuteTnq
 av3Lx//S3p1eTPM88rW6QRCugmwHy+OFqPpoBEO2eUKk/wloxjxeq0ah2Z9l5TIGxPt1
 WFg0lPf7xv1i4mch9GXk1ezvIwfLisDJtMgYiMIiJX2STKiYpIWKYDR6sk88HWzpyZGp IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtbcq255s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jan 2023 11:07:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A8DB10002A;
 Wed,  4 Jan 2023 11:07:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 539562171EA;
 Wed,  4 Jan 2023 11:07:45 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 4 Jan
 2023 11:07:44 +0100
Message-ID: <eafa9cac-bb89-a638-6f02-b441d58d992e@foss.st.com>
Date: Wed, 4 Jan 2023 11:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, <u-boot@lists.denx.de>
References: <20221215125058.1.I12616a161ad14b61957ff2da5357c1220bc0d77b@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221215125058.1.I12616a161ad14b61957ff2da5357c1220bc0d77b@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_06,2023-01-04_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] adc: stm32mp15: add calibration support
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

Hi Olivier

On 12/15/22 13:51, Olivier Moysan wrote:
> Add support of offset and linear calibration for STM32MP15.
> The calibration is performed once at probe. The ADC is set in power on
> state for calibration. It remains in this state after calibration,
> to give to the kernel the opportunity to retrieve calibration data,
> directly from the ADC.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
> 
>  drivers/adc/stm32-adc.c | 134 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 116 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/adc/stm32-adc.c b/drivers/adc/stm32-adc.c
> index 85efc119dbf1..1fba707c6f7d 100644
> --- a/drivers/adc/stm32-adc.c
> +++ b/drivers/adc/stm32-adc.c
> @@ -33,8 +33,11 @@
>  #define STM32H7_ADRDY			BIT(0)
>  
>  /* STM32H7_ADC_CR - bit fields */
> +#define STM32H7_ADCAL			BIT(31)
> +#define STM32H7_ADCALDIF		BIT(30)
>  #define STM32H7_DEEPPWD			BIT(29)
>  #define STM32H7_ADVREGEN		BIT(28)
> +#define STM32H7_ADCALLIN		BIT(16)
>  #define STM32H7_BOOST			BIT(8)
>  #define STM32H7_ADSTART			BIT(2)
>  #define STM32H7_ADDIS			BIT(1)
> @@ -65,47 +68,72 @@ struct stm32_adc {
>  	const struct stm32_adc_cfg *cfg;
>  };
>  
> -static int stm32_adc_stop(struct udevice *dev)
> +static void stm32_adc_enter_pwr_down(struct udevice *dev)
>  {
>  	struct stm32_adc *adc = dev_get_priv(dev);
>  
> -	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADDIS);
>  	clrbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_BOOST);
>  	/* Setting DEEPPWD disables ADC vreg and clears ADVREGEN */
>  	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_DEEPPWD);
> -	adc->active_channel = -1;
> -
> -	return 0;
>  }
>  
> -static int stm32_adc_start_channel(struct udevice *dev, int channel)
> +static int stm32_adc_exit_pwr_down(struct udevice *dev)
>  {
> -	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
>  	struct stm32_adc_common *common = dev_get_priv(dev_get_parent(dev));
>  	struct stm32_adc *adc = dev_get_priv(dev);
>  	int ret;
>  	u32 val;
>  
> +	/* return immediately if ADC is not in deep power down mode */
> +	if (!(readl(adc->regs + STM32H7_ADC_CR) & STM32H7_DEEPPWD))
> +		return 0;
> +
>  	/* Exit deep power down, then enable ADC voltage regulator */
>  	clrbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_DEEPPWD);
>  	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADVREGEN);
> +
>  	if (common->rate > STM32H7_BOOST_CLKRATE)
>  		setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_BOOST);
>  
>  	/* Wait for startup time */
>  	if (!adc->cfg->has_vregready) {
>  		udelay(20);
> -	} else {
> -		ret = readl_poll_timeout(adc->regs + STM32H7_ADC_ISR, val,
> -					 val & STM32MP1_VREGREADY,
> -					 STM32_ADC_TIMEOUT_US);
> -		if (ret < 0) {
> -			stm32_adc_stop(dev);
> -			dev_err(dev, "Failed to enable vreg: %d\n", ret);
> -			return ret;
> -		}
> +		return 0;
> +	}
> +
> +	ret = readl_poll_timeout(adc->regs + STM32H7_ADC_ISR, val,
> +				 val & STM32MP1_VREGREADY,
> +				 STM32_ADC_TIMEOUT_US);
> +	if (ret < 0) {
> +		stm32_adc_enter_pwr_down(dev);
> +		dev_err(dev, "Failed to enable vreg: %d\n", ret);
>  	}
>  
> +	return ret;
> +}
> +
> +static int stm32_adc_stop(struct udevice *dev)
> +{
> +	struct stm32_adc *adc = dev_get_priv(dev);
> +
> +	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADDIS);
> +	stm32_adc_enter_pwr_down(dev);
> +	adc->active_channel = -1;
> +
> +	return 0;
> +}
> +
> +static int stm32_adc_start_channel(struct udevice *dev, int channel)
> +{
> +	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
> +	struct stm32_adc *adc = dev_get_priv(dev);
> +	int ret;
> +	u32 val;
> +
> +	ret = stm32_adc_exit_pwr_down(dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	/* Only use single ended channels */
>  	writel(0, adc->regs + STM32H7_ADC_DIFSEL);
>  
> @@ -162,6 +190,64 @@ static int stm32_adc_channel_data(struct udevice *dev, int channel,
>  	return 0;
>  }
>  
> +/**
> + * Fixed timeout value for ADC calibration.
> + * worst cases:
> + * - low clock frequency (0.12 MHz min)
> + * - maximum prescalers
> + * Calibration requires:
> + * - 16384 ADC clock cycle for the linear calibration
> + * - 20 ADC clock cycle for the offset calibration
> + *
> + * Set to 100ms for now
> + */
> +#define STM32H7_ADC_CALIB_TIMEOUT_US		100000
> +
> +static int stm32_adc_selfcalib(struct udevice *dev)
> +{
> +	struct stm32_adc *adc = dev_get_priv(dev);
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * Select calibration mode:
> +	 * - Offset calibration for single ended inputs
> +	 * - No linearity calibration. Done in next step.
> +	 */
> +	clrbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADCALDIF | STM32H7_ADCALLIN);
> +
> +	/* Start calibration, then wait for completion */
> +	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADCAL);
> +	ret = readl_poll_sleep_timeout(adc->regs + STM32H7_ADC_CR, val,
> +				       !(val & STM32H7_ADCAL), 100,
> +				       STM32H7_ADC_CALIB_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "calibration failed\n");
> +		goto out;
> +	}
> +
> +	/*
> +	 * Select calibration mode, then start calibration:
> +	 * - Offset calibration for differential input
> +	 * - Linearity calibration (needs to be done only once for single/diff)
> +	 *   will run simultaneously with offset calibration.
> +	 */
> +	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADCALDIF | STM32H7_ADCALLIN);
> +
> +	/* Start calibration, then wait for completion */
> +	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADCAL);
> +	ret = readl_poll_sleep_timeout(adc->regs + STM32H7_ADC_CR, val,
> +				       !(val & STM32H7_ADCAL), 100,
> +				       STM32H7_ADC_CALIB_TIMEOUT_US);
> +	if (ret)
> +		dev_err(dev, "calibration failed\n");
> +
> +out:
> +	clrbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADCALDIF | STM32H7_ADCALLIN);
> +
> +	return ret;
> +}
> +
>  static int stm32_adc_get_legacy_chan_count(struct udevice *dev)
>  {
>  	int ret;
> @@ -272,7 +358,7 @@ static int stm32_adc_probe(struct udevice *dev)
>  	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
>  	struct stm32_adc_common *common = dev_get_priv(dev_get_parent(dev));
>  	struct stm32_adc *adc = dev_get_priv(dev);
> -	int offset;
> +	int offset, ret;
>  
>  	offset = dev_read_u32_default(dev, "reg", -ENODATA);
>  	if (offset < 0) {
> @@ -287,7 +373,19 @@ static int stm32_adc_probe(struct udevice *dev)
>  	uc_pdata->vdd_microvolts = common->vref_uv;
>  	uc_pdata->vss_microvolts = 0;
>  
> -	return stm32_adc_chan_of_init(dev);
> +	ret = stm32_adc_chan_of_init(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = stm32_adc_exit_pwr_down(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = stm32_adc_selfcalib(dev);
> +	if (ret)
> +		stm32_adc_enter_pwr_down(dev);
> +
> +	return ret;
>  }
>  
>  static const struct adc_ops stm32_adc_ops = {

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
