Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC13569B85
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:28:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA2B1C0D2BF;
	Thu,  7 Jul 2022 07:28:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A6DEC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:28:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2670uw8C025692;
 Thu, 7 Jul 2022 09:28:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4WfdCIWE+C79ch4sERhIwJcZ0fWgnSoSIcOljCwRGsU=;
 b=Z8d2Xmr4CwG8QR4xvS2SN0sdhRB8qX7Ue3Zsx2N6bur6SeqfJX/VD9IKXvhDcn4p30N9
 2ZcQzL2jm+7M8pMmT1B/Lo6K+k6L2sJh6KV2BDZfn7RkXgjUU7wEjRlX+jEGuiypvRkm
 a1UpW4bGOWEEpoF91ZE/XGqI8wFbTojpDJ2AYgKVEO9sjdWgnw2hdialLHnHTvKl6wJp
 VWkIyc3du7mTn6REiC7u+yU2B4/AEOsNlzBH1gTrWvS0TRT5haShvTMhmFEb3vqF3fUZ
 P73AUNbzyxO0FRmA52wG7EvEER23prYDu2Moyx7n6JCKJ/UmErdEWiSUDd9ikqX/6rA3 oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h58bp6v76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:28:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B92FD100038;
 Thu,  7 Jul 2022 09:28:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABF58210F91;
 Thu,  7 Jul 2022 09:28:08 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:28:08 +0200
Message-ID: <1c10e93d-88d7-13c3-cf2b-63fefa756dd9@foss.st.com>
Date: Thu, 7 Jul 2022 09:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630100144.v2.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
 <20220630100144.v2.3.Ie868aca1e057629eb212dcc3c8f463c00d01ccb7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630100144.v2.3.Ie868aca1e057629eb212dcc3c8f463c00d01ccb7@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_05,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] mmc: stm32_sdmmc2: introduce
	of_to_plat ops
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

On 6/30/22 10:01, Patrick Delaunay wrote:
> Add the uclass ops of_to_plat to parse the device tree properties
> to respect the expected sequence by the driver model.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/mmc/stm32_sdmmc2.c | 95 ++++++++++++++++++++------------------
>  1 file changed, 50 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 41f375b9d32..bfce8a2e4a6 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -645,6 +645,47 @@ static const struct dm_mmc_ops stm32_sdmmc2_ops = {
>  	.host_power_cycle = stm32_sdmmc2_host_power_cycle,
>  };
>  
> +static int stm32_sdmmc2_of_to_plat(struct udevice *dev)
> +{
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
> +	struct mmc_config *cfg = &plat->cfg;
> +	int ret;
> +
> +	plat->base = dev_read_addr(dev);
> +	if (plat->base == FDT_ADDR_T_NONE)
> +		return -EINVAL;
> +
> +	if (dev_read_bool(dev, "st,neg-edge"))
> +		plat->clk_reg_msk |= SDMMC_CLKCR_NEGEDGE;
> +	if (dev_read_bool(dev, "st,sig-dir"))
> +		plat->pwr_reg_msk |= SDMMC_POWER_DIRPOL;
> +	if (dev_read_bool(dev, "st,use-ckin"))
> +		plat->clk_reg_msk |= SDMMC_CLKCR_SELCLKRX_CKIN;
> +
> +	cfg->f_min = 400000;
> +	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 | MMC_VDD_165_195;
> +	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
> +	cfg->name = "STM32 SD/MMC";
> +	cfg->host_caps = 0;
> +	cfg->f_max = 52000000;
> +	ret = mmc_of_parse(dev, cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_get_by_index(dev, 0, &plat->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_get_by_index(dev, 0, &plat->reset_ctl);
> +	if (ret)
> +		dev_dbg(dev, "No reset provided\n");
> +
> +	gpio_request_by_name(dev, "cd-gpios", 0, &plat->cd_gpio,
> +			     GPIOD_IS_IN);
> +
> +	return 0;
> +}
> +
>  static int stm32_sdmmc2_probe_level_translator(struct udevice *dev)
>  {
>  	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
> @@ -653,12 +694,6 @@ static int stm32_sdmmc2_probe_level_translator(struct udevice *dev)
>  	struct gpio_desc ckin_gpio;
>  	int clk_hi, clk_lo, ret;
>  
> -	/*
> -	 * Assume the level translator is present if st,use-ckin is set.
> -	 * This is to cater for DTs which do not implement this test.
> -	 */
> -	plat->clk_reg_msk |= SDMMC_CLKCR_SELCLKRX_CKIN;
> -
>  	ret = gpio_request_by_name(dev, "st,cmd-gpios", 0, &cmd_gpio,
>  				   GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE);
>  	if (ret)
> @@ -709,54 +744,23 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  {
>  	struct mmc_uclass_priv *upriv = dev_get_uclass_priv(dev);
>  	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
> -	struct mmc_config *cfg = &plat->cfg;
>  	int ret;
>  
> -	plat->base = dev_read_addr(dev);
> -	if (plat->base == FDT_ADDR_T_NONE)
> -		return -EINVAL;
> -
> -	if (dev_read_bool(dev, "st,neg-edge"))
> -		plat->clk_reg_msk |= SDMMC_CLKCR_NEGEDGE;
> -	if (dev_read_bool(dev, "st,sig-dir"))
> -		plat->pwr_reg_msk |= SDMMC_POWER_DIRPOL;
> -	if (dev_read_bool(dev, "st,use-ckin"))
> -		stm32_sdmmc2_probe_level_translator(dev);
> -
> -	ret = clk_get_by_index(dev, 0, &plat->clk);
> -	if (ret)
> -		return ret;
> -
>  	ret = clk_enable(&plat->clk);
> -	if (ret)
> -		goto clk_free;
> -
> -	ret = reset_get_by_index(dev, 0, &plat->reset_ctl);
> -	if (ret)
> -		dev_dbg(dev, "No reset provided\n");
> -
> -	gpio_request_by_name(dev, "cd-gpios", 0, &plat->cd_gpio,
> -			     GPIOD_IS_IN);
> -
> -	cfg->f_min = 400000;
> -	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 | MMC_VDD_165_195;
> -	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
> -	cfg->name = "STM32 SD/MMC";
> -
> -	cfg->host_caps = 0;
> -	cfg->f_max = 52000000;
> -	mmc_of_parse(dev, cfg);
> +	if (ret) {
> +		clk_free(&plat->clk);
> +		return ret;
> +	}
>  
>  	upriv->mmc = &plat->mmc;
>  
> +	if (plat->clk_reg_msk & SDMMC_CLKCR_SELCLKRX_CKIN)
> +		stm32_sdmmc2_probe_level_translator(dev);
> +
>  	/* SDMMC init */
>  	stm32_sdmmc2_reset(plat);
> -	return 0;
> -
> -clk_free:
> -	clk_free(&plat->clk);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int stm32_sdmmc2_bind(struct udevice *dev)
> @@ -778,5 +782,6 @@ U_BOOT_DRIVER(stm32_sdmmc2) = {
>  	.ops = &stm32_sdmmc2_ops,
>  	.probe = stm32_sdmmc2_probe,
>  	.bind = stm32_sdmmc2_bind,
> +	.of_to_plat = stm32_sdmmc2_of_to_plat,
>  	.plat_auto	= sizeof(struct stm32_sdmmc2_plat),
>  };
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
