Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC928AAE1A
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:06:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2664AC6DD9A;
	Fri, 19 Apr 2024 12:06:49 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2781C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:06:48 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9asf0005484; Fri, 19 Apr 2024 14:06:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=EeN2ePF1HDTIuSgOwJ3nxRBl099jMqWiKwKQCgG6kns=; b=g6
 SaxxbddLR1XS2RmPOl3nFqFv3+mzf0T9asDulohnMYgKY9c6OJc2oL+eqwS/lECh
 ZJPp8kLaqe3/VILgAF1rh1cJTN/9iZtv8uWlxjgOd3QOMdZQHGmFa92lUIxi3rK+
 YPxhMr5Wy6auqZ30wn3bj2d+44se34eHlygHDyMSjseKjU6shallZUtXFcBjzMlb
 fWNDSynk7geSTsNSMZDFWREQEfHHwdt+LdIo2S3Q7PcNUjX31U58dL8Df6f44SAy
 nRTry40chzIxY6D0kdVjzIHWTrZSFt9vr/I/fLaTp0xndOVy62n7L2namXluEWSI
 S5q0UhZuu8oDkKyA8ziw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50j9cr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:06:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A75F840044;
 Fri, 19 Apr 2024 14:06:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00326216857;
 Fri, 19 Apr 2024 14:06:08 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:06:07 +0200
Message-ID: <fa166be0-71ca-4687-a3e6-a655f88bf499@foss.st.com>
Date: Fri, 19 Apr 2024 14:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-8-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240326120745.27581-8-marex@denx.de>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 07/11] net: dwc_eth_qos: Use consistent
	logging prints
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



On 3/26/24 13:07, Marek Vasut wrote:
> Use dev_*() only to print all the logs from this glue code,
> instead of mixing dev_*(), log_*(), pr_*() all in one code.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Christophe Roullier <christophe.roullier@st.com>
> Cc: Joe Hershberger <joe.hershberger@ni.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Ramon Fried <rfried.dev@gmail.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: Add RB from Patrice
> ---
>  drivers/net/dwc_eth_qos_stm32.c | 52 ++++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
> index 38037c47954..72f65f80540 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -63,36 +63,36 @@ static int eqos_start_clks_stm32(struct udevice *dev)
>  	if (!CONFIG_IS_ENABLED(CLK))
>  		return 0;
>  
> -	debug("%s(dev=%p):\n", __func__, dev);
> +	dev_dbg(dev, "%s:\n", __func__);
>  
>  	ret = clk_enable(&eqos->clk_master_bus);
>  	if (ret < 0) {
> -		pr_err("clk_enable(clk_master_bus) failed: %d", ret);
> +		dev_err(dev, "clk_enable(clk_master_bus) failed: %d\n", ret);
>  		goto err;
>  	}
>  
>  	ret = clk_enable(&eqos->clk_rx);
>  	if (ret < 0) {
> -		pr_err("clk_enable(clk_rx) failed: %d", ret);
> +		dev_err(dev, "clk_enable(clk_rx) failed: %d\n", ret);
>  		goto err_disable_clk_master_bus;
>  	}
>  
>  	ret = clk_enable(&eqos->clk_tx);
>  	if (ret < 0) {
> -		pr_err("clk_enable(clk_tx) failed: %d", ret);
> +		dev_err(dev, "clk_enable(clk_tx) failed: %d\n", ret);
>  		goto err_disable_clk_rx;
>  	}
>  
>  	if (clk_valid(&eqos->clk_ck) && !eqos->clk_ck_enabled) {
>  		ret = clk_enable(&eqos->clk_ck);
>  		if (ret < 0) {
> -			pr_err("clk_enable(clk_ck) failed: %d", ret);
> +			dev_err(dev, "clk_enable(clk_ck) failed: %d\n", ret);
>  			goto err_disable_clk_tx;
>  		}
>  		eqos->clk_ck_enabled = true;
>  	}
>  
> -	debug("%s: OK\n", __func__);
> +	dev_dbg(dev, "%s: OK\n", __func__);
>  	return 0;
>  
>  err_disable_clk_tx:
> @@ -102,7 +102,8 @@ err_disable_clk_rx:
>  err_disable_clk_master_bus:
>  	clk_disable(&eqos->clk_master_bus);
>  err:
> -	debug("%s: FAILED: %d\n", __func__, ret);
> +	dev_dbg(dev, "%s: FAILED: %d\n", __func__, ret);
> +
>  	return ret;
>  }
>  
> @@ -113,13 +114,14 @@ static int eqos_stop_clks_stm32(struct udevice *dev)
>  	if (!CONFIG_IS_ENABLED(CLK))
>  		return 0;
>  
> -	debug("%s(dev=%p):\n", __func__, dev);
> +	dev_dbg(dev, "%s:\n", __func__);
>  
>  	clk_disable(&eqos->clk_tx);
>  	clk_disable(&eqos->clk_rx);
>  	clk_disable(&eqos->clk_master_bus);
>  
> -	debug("%s: OK\n", __func__);
> +	dev_dbg(dev, "%s: OK\n", __func__);
> +
>  	return 0;
>  }
>  
> @@ -143,20 +145,20 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>  
>  	switch (interface_type) {
>  	case PHY_INTERFACE_MODE_MII:
> -		log_debug("PHY_INTERFACE_MODE_MII\n");
> +		dev_dbg(dev, "PHY_INTERFACE_MODE_MII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
>  		value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>  		break;
>  	case PHY_INTERFACE_MODE_GMII:
> -		log_debug("PHY_INTERFACE_MODE_GMII\n");
> +		dev_dbg(dev, "PHY_INTERFACE_MODE_GMII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
>  		if (eth_clk_sel_reg)
>  			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		log_debug("PHY_INTERFACE_MODE_RMII\n");
> +		dev_dbg(dev, "PHY_INTERFACE_MODE_RMII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_RMII);
>  		if (eth_ref_clk_sel_reg)
> @@ -166,15 +168,15 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
> -		log_debug("PHY_INTERFACE_MODE_RGMII\n");
> +		dev_dbg(dev, "PHY_INTERFACE_MODE_RGMII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_RGMII);
>  		if (eth_clk_sel_reg)
>  			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>  		break;
>  	default:
> -		log_debug("Do not manage %d interface\n",
> -			  interface_type);
> +		dev_dbg(dev, "Do not manage %d interface\n",
> +			interface_type);
>  		/* Do not manage others interfaces */
>  		return -EINVAL;
>  	}
> @@ -194,12 +196,12 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>  	phy_interface_t interface;
>  	int ret;
>  
> -	debug("%s(dev=%p):\n", __func__, dev);
> +	dev_dbg(dev, "%s:\n", __func__);
>  
>  	interface = eqos->config->interface(dev);
>  
>  	if (interface == PHY_INTERFACE_MODE_NA) {
> -		pr_err("Invalid PHY interface\n");
> +		dev_err(dev, "Invalid PHY interface\n");
>  		return -EINVAL;
>  	}
>  
> @@ -209,39 +211,41 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>  
>  	ret = clk_get_by_name(dev, "stmmaceth", &eqos->clk_master_bus);
>  	if (ret) {
> -		pr_err("clk_get_by_name(master_bus) failed: %d", ret);
> +		dev_err(dev, "clk_get_by_name(master_bus) failed: %d\n", ret);
>  		goto err_probe;
>  	}
>  
>  	ret = clk_get_by_name(dev, "mac-clk-rx", &eqos->clk_rx);
>  	if (ret) {
> -		pr_err("clk_get_by_name(rx) failed: %d", ret);
> +		dev_err(dev, "clk_get_by_name(rx) failed: %d\n", ret);
>  		goto err_probe;
>  	}
>  
>  	ret = clk_get_by_name(dev, "mac-clk-tx", &eqos->clk_tx);
>  	if (ret) {
> -		pr_err("clk_get_by_name(tx) failed: %d", ret);
> +		dev_err(dev, "clk_get_by_name(tx) failed: %d\n", ret);
>  		goto err_probe;
>  	}
>  
>  	/*  Get ETH_CLK clocks (optional) */
>  	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
>  	if (ret)
> -		pr_warn("No phy clock provided %d", ret);
> +		dev_warn(dev, "No phy clock provided %d\n", ret);
> +
> +	dev_dbg(dev, "%s: OK\n", __func__);
>  
> -	debug("%s: OK\n", __func__);
>  	return 0;
>  
>  err_probe:
>  
> -	debug("%s: returns %d\n", __func__, ret);
> +	dev_dbg(dev, "%s: returns %d\n", __func__, ret);
> +
>  	return ret;
>  }
>  
>  static int eqos_remove_resources_stm32(struct udevice *dev)
>  {
> -	debug("%s(dev=%p):\n", __func__, dev);
> +	dev_dbg(dev, "%s:\n", __func__);
>  
>  	return 0;
>  }

Applied on u-boot-stm32/master 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
