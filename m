Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3652E5EA
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 09:10:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A498DC56630;
	Fri, 20 May 2022 07:10:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D59D2C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 07:10:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K1AChM022471;
 Fri, 20 May 2022 09:10:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1rsNS8+95vFIFx4MK0uqEmuD3jcNd2kmug1yrNmshHw=;
 b=NW3oDsPguYWnWKUjgN8M/Ff1jEZ7z+mrHCaVrs0T+5z3TGrmGceV6Ol0W6u0+zc4hNbZ
 qnsAHQM6xkN/AsTL+NZpJeLxC0B5NSRkJ8Yi9ztHvc1EG2nx1wDnvIrbI+9FxX0O0mLm
 TfmlyqXOLsMSr/hR+cgjdbwVIkSUvyEfueDVRsol2DSSHjj0MgbamA/zOuTa08R7zUyP
 shfIwSv1QcBln8QoI/9lnqZfUVkLO4HNyxLbj7LJy/PPx9nY2EVZ+M4iqNSA5zaFG3tS
 XoWsco20UnrdMTG69Z0hKyFpYAgEMdSzeSqd26fuQsw+3fzhEOx0qGfql37/h7OFlwpg rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9eqde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:10:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 468DC10002A;
 Fri, 20 May 2022 09:10:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DBA6212312;
 Fri, 20 May 2022 09:10:19 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 09:10:18 +0200
Message-ID: <33bcfc90-a5e5-7ee4-edfc-7ece0af7b6b5@foss.st.com>
Date: Fri, 20 May 2022 09:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.13.I39b69e8dc7b43b8e265e77388fb53f7c1fa2a007@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.13.I39b69e8dc7b43b8e265e77388fb53f7c1fa2a007@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 13/16] mmc: stm32_sdmmc2: make reset
	property optional
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

On 5/6/22 16:06, Patrick Delaunay wrote:
> Although not recommended, the reset property could be made optional.
> This way the driver will probe even if no reset property is provided
> in an sdmmc node in DT. This reset is already optional in Linux.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/mmc/stm32_sdmmc2.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 44bfc911af..81b07609a9 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -514,10 +514,12 @@ retry_cmd:
>   */
>  static void stm32_sdmmc2_reset(struct stm32_sdmmc2_priv *priv)
>  {
> -	/* Reset */
> -	reset_assert(&priv->reset_ctl);
> -	udelay(2);
> -	reset_deassert(&priv->reset_ctl);
> +	if (reset_valid(&priv->reset_ctl)) {
> +		/* Reset */
> +		reset_assert(&priv->reset_ctl);
> +		udelay(2);
> +		reset_deassert(&priv->reset_ctl);
> +	}
>  
>  	/* init the needed SDMMC register after reset */
>  	writel(priv->pwr_reg_msk, priv->base + SDMMC_POWER);
> @@ -735,7 +737,7 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  
>  	ret = reset_get_by_index(dev, 0, &priv->reset_ctl);
>  	if (ret)
> -		goto clk_disable;
> +		dev_dbg(dev, "No reset provided\n");
>  
>  	gpio_request_by_name(dev, "cd-gpios", 0, &priv->cd_gpio,
>  			     GPIOD_IS_IN);
> @@ -755,8 +757,6 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  	stm32_sdmmc2_reset(priv);
>  	return 0;
>  
> -clk_disable:
> -	clk_disable(&priv->clk);
>  clk_free:
>  	clk_free(&priv->clk);
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
