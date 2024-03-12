Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D13A879406
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 13:19:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42695C6C855;
	Tue, 12 Mar 2024 12:19:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D149CC6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 12:19:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42CANqnK016940; Tue, 12 Mar 2024 13:19:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=mMBObfZPi/f/WMMrUNxsq7aToOyR449c6wPnPft8vg8=; b=S8
 MElz1D7MLATbGG5Ix4/dinRLlACXhQXnLzfCqw6looIfauDWdd23Dzr+rbLrQDFX
 uEysSoBIr3C8EdbNqWcPh+BeFvOYmpFcDyo0xEMQFV4bbp5w0f0f3/zSqYl4xCi/
 etGeTwKlCCBw87XjaJxcMAatnIp1hhtonAPJtD0vtN0dJ2NLDMq45DBA8ReYZi6/
 ZOnUj4MeslmYdojzVy0rRlI9aA1e737EnDAjmhT7bg8s+PZwunH/E3Srqwxi76XB
 wM1IZAJN7eMlZovXcZOha6vRp7+hOc+TNECgudV9aS0uB6zPF6d04tNyNvVbnuQ+
 Z2TDOUJ5bwiAmZh4qtHQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wrds8n5gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 13:19:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C163740047;
 Tue, 12 Mar 2024 13:19:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53E0126029E;
 Tue, 12 Mar 2024 13:19:14 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Mar
 2024 13:19:13 +0100
Message-ID: <06f0d211-8f15-47a7-954c-4894653475d2@foss.st.com>
Date: Tue, 12 Mar 2024 13:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-2-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240309021831.264018-2-marex@denx.de>
X-Originating-IP: [10.201.20.71]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-12_01,2023-05-22_02
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH 01/11] net: dwc_eth_qos: Split STM32 glue
 into separate file
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



On 3/9/24 03:11, Marek Vasut wrote:
> Move STM32 glue code into separate file to contain the STM32 specific
> code outside of the DWMAC core code. No functional change.
> 
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
>  drivers/net/Makefile            |   1 +
>  drivers/net/dwc_eth_qos.c       | 165 ---------------------------
>  drivers/net/dwc_eth_qos.h       |   1 +
>  drivers/net/dwc_eth_qos_stm32.c | 196 ++++++++++++++++++++++++++++++++
>  4 files changed, 198 insertions(+), 165 deletions(-)
>  create mode 100644 drivers/net/dwc_eth_qos_stm32.c
> 
> diff --git a/drivers/net/Makefile b/drivers/net/Makefile
> index 6677366ebd6..dc3404519d6 100644
> --- a/drivers/net/Makefile
> +++ b/drivers/net/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_DWC_ETH_QOS_IMX) += dwc_eth_qos_imx.o
>  obj-$(CONFIG_DWC_ETH_QOS_ROCKCHIP) += dwc_eth_qos_rockchip.o
>  obj-$(CONFIG_DWC_ETH_QOS_QCOM) += dwc_eth_qos_qcom.o
>  obj-$(CONFIG_DWC_ETH_QOS_STARFIVE) += dwc_eth_qos_starfive.o
> +obj-$(CONFIG_DWC_ETH_QOS_STM32) += dwc_eth_qos_stm32.o
>  obj-$(CONFIG_E1000) += e1000.o
>  obj-$(CONFIG_E1000_SPI) += e1000_spi.o
>  obj-$(CONFIG_EEPRO100) += eepro100.o
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 9b3bce1dc87..533c2bf070b 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -295,58 +295,6 @@ err:
>  #endif
>  }
>  
> -static int eqos_start_clks_stm32(struct udevice *dev)
> -{
> -#ifdef CONFIG_CLK
> -	struct eqos_priv *eqos = dev_get_priv(dev);
> -	int ret;
> -
> -	debug("%s(dev=%p):\n", __func__, dev);
> -
> -	ret = clk_enable(&eqos->clk_master_bus);
> -	if (ret < 0) {
> -		pr_err("clk_enable(clk_master_bus) failed: %d", ret);
> -		goto err;
> -	}
> -
> -	ret = clk_enable(&eqos->clk_rx);
> -	if (ret < 0) {
> -		pr_err("clk_enable(clk_rx) failed: %d", ret);
> -		goto err_disable_clk_master_bus;
> -	}
> -
> -	ret = clk_enable(&eqos->clk_tx);
> -	if (ret < 0) {
> -		pr_err("clk_enable(clk_tx) failed: %d", ret);
> -		goto err_disable_clk_rx;
> -	}
> -
> -	if (clk_valid(&eqos->clk_ck) && !eqos->clk_ck_enabled) {
> -		ret = clk_enable(&eqos->clk_ck);
> -		if (ret < 0) {
> -			pr_err("clk_enable(clk_ck) failed: %d", ret);
> -			goto err_disable_clk_tx;
> -		}
> -		eqos->clk_ck_enabled = true;
> -	}
> -#endif
> -
> -	debug("%s: OK\n", __func__);
> -	return 0;
> -
> -#ifdef CONFIG_CLK
> -err_disable_clk_tx:
> -	clk_disable(&eqos->clk_tx);
> -err_disable_clk_rx:
> -	clk_disable(&eqos->clk_rx);
> -err_disable_clk_master_bus:
> -	clk_disable(&eqos->clk_master_bus);
> -err:
> -	debug("%s: FAILED: %d\n", __func__, ret);
> -	return ret;
> -#endif
> -}
> -
>  static int eqos_stop_clks_tegra186(struct udevice *dev)
>  {
>  #ifdef CONFIG_CLK
> @@ -365,22 +313,6 @@ static int eqos_stop_clks_tegra186(struct udevice *dev)
>  	return 0;
>  }
>  
> -static int eqos_stop_clks_stm32(struct udevice *dev)
> -{
> -#ifdef CONFIG_CLK
> -	struct eqos_priv *eqos = dev_get_priv(dev);
> -
> -	debug("%s(dev=%p):\n", __func__, dev);
> -
> -	clk_disable(&eqos->clk_tx);
> -	clk_disable(&eqos->clk_rx);
> -	clk_disable(&eqos->clk_master_bus);
> -#endif
> -
> -	debug("%s: OK\n", __func__);
> -	return 0;
> -}
> -
>  static int eqos_start_resets_tegra186(struct udevice *dev)
>  {
>  	struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -493,17 +425,6 @@ static ulong eqos_get_tick_clk_rate_tegra186(struct udevice *dev)
>  #endif
>  }
>  
> -static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
> -{
> -#ifdef CONFIG_CLK
> -	struct eqos_priv *eqos = dev_get_priv(dev);
> -
> -	return clk_get_rate(&eqos->clk_master_bus);
> -#else
> -	return 0;
> -#endif
> -}
> -
>  static int eqos_set_full_duplex(struct udevice *dev)
>  {
>  	struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -1415,57 +1336,6 @@ err_free_reset_eqos:
>  	return ret;
>  }
>  
> -static int eqos_probe_resources_stm32(struct udevice *dev)
> -{
> -	struct eqos_priv *eqos = dev_get_priv(dev);
> -	int ret;
> -	phy_interface_t interface;
> -
> -	debug("%s(dev=%p):\n", __func__, dev);
> -
> -	interface = eqos->config->interface(dev);
> -
> -	if (interface == PHY_INTERFACE_MODE_NA) {
> -		pr_err("Invalid PHY interface\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = board_interface_eth_init(dev, interface);
> -	if (ret)
> -		return -EINVAL;
> -
> -	ret = clk_get_by_name(dev, "stmmaceth", &eqos->clk_master_bus);
> -	if (ret) {
> -		pr_err("clk_get_by_name(master_bus) failed: %d", ret);
> -		goto err_probe;
> -	}
> -
> -	ret = clk_get_by_name(dev, "mac-clk-rx", &eqos->clk_rx);
> -	if (ret) {
> -		pr_err("clk_get_by_name(rx) failed: %d", ret);
> -		goto err_probe;
> -	}
> -
> -	ret = clk_get_by_name(dev, "mac-clk-tx", &eqos->clk_tx);
> -	if (ret) {
> -		pr_err("clk_get_by_name(tx) failed: %d", ret);
> -		goto err_probe;
> -	}
> -
> -	/*  Get ETH_CLK clocks (optional) */
> -	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
> -	if (ret)
> -		pr_warn("No phy clock provided %d", ret);
> -
> -	debug("%s: OK\n", __func__);
> -	return 0;
> -
> -err_probe:
> -
> -	debug("%s: returns %d\n", __func__, ret);
> -	return ret;
> -}
> -
>  static phy_interface_t eqos_get_interface_tegra186(const struct udevice *dev)
>  {
>  	return PHY_INTERFACE_MODE_MII;
> @@ -1484,12 +1354,6 @@ static int eqos_remove_resources_tegra186(struct udevice *dev)
>  	return 0;
>  }
>  
> -static int eqos_remove_resources_stm32(struct udevice *dev)
> -{
> -	debug("%s(dev=%p):\n", __func__, dev);
> -	return 0;
> -}
> -
>  static int eqos_probe(struct udevice *dev)
>  {
>  	struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -1633,35 +1497,6 @@ static const struct eqos_config __maybe_unused eqos_tegra186_config = {
>  	.ops = &eqos_tegra186_ops
>  };
>  
> -static struct eqos_ops eqos_stm32_ops = {
> -	.eqos_inval_desc = eqos_inval_desc_generic,
> -	.eqos_flush_desc = eqos_flush_desc_generic,
> -	.eqos_inval_buffer = eqos_inval_buffer_generic,
> -	.eqos_flush_buffer = eqos_flush_buffer_generic,
> -	.eqos_probe_resources = eqos_probe_resources_stm32,
> -	.eqos_remove_resources = eqos_remove_resources_stm32,
> -	.eqos_stop_resets = eqos_null_ops,
> -	.eqos_start_resets = eqos_null_ops,
> -	.eqos_stop_clks = eqos_stop_clks_stm32,
> -	.eqos_start_clks = eqos_start_clks_stm32,
> -	.eqos_calibrate_pads = eqos_null_ops,
> -	.eqos_disable_calibration = eqos_null_ops,
> -	.eqos_set_tx_clk_speed = eqos_null_ops,
> -	.eqos_get_enetaddr = eqos_null_ops,
> -	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
> -};
> -
> -static const struct eqos_config __maybe_unused eqos_stm32_config = {
> -	.reg_access_always_ok = false,
> -	.mdio_wait = 10000,
> -	.swr_wait = 50,
> -	.config_mac = EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_AV,
> -	.config_mac_mdio = EQOS_MAC_MDIO_ADDRESS_CR_250_300,
> -	.axi_bus_width = EQOS_AXI_WIDTH_64,
> -	.interface = dev_read_phy_mode,
> -	.ops = &eqos_stm32_ops
> -};
> -
>  static const struct udevice_id eqos_ids[] = {
>  #if IS_ENABLED(CONFIG_DWC_ETH_QOS_TEGRA186)
>  	{
> diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h
> index e3222e1e17e..a6087f191ab 100644
> --- a/drivers/net/dwc_eth_qos.h
> +++ b/drivers/net/dwc_eth_qos.h
> @@ -290,4 +290,5 @@ int eqos_null_ops(struct udevice *dev);
>  extern struct eqos_config eqos_imx_config;
>  extern struct eqos_config eqos_rockchip_config;
>  extern struct eqos_config eqos_qcom_config;
> +extern struct eqos_config eqos_stm32_config;
>  extern struct eqos_config eqos_jh7110_config;
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
> new file mode 100644
> index 00000000000..cfda757133e
> --- /dev/null
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024, Marek Vasut <marex@denx.de>
> + *
> + * This is code moved from drivers/net/dwc_eth_qos.c , which is:
> + * Copyright (c) 2016, NVIDIA CORPORATION.
> + */
> +
> +#include <common.h>
> +#include <asm/cache.h>
> +#include <asm/gpio.h>
> +#include <asm/io.h>
> +#include <clk.h>
> +#include <cpu_func.h>
> +#include <dm.h>
> +#include <dm/device_compat.h>
> +#include <errno.h>
> +#include <eth_phy.h>
> +#include <log.h>
> +#include <malloc.h>
> +#include <memalign.h>
> +#include <miiphy.h>
> +#include <net.h>
> +#include <netdev.h>
> +#include <phy.h>
> +#include <reset.h>
> +#include <wait_bit.h>
> +#include <linux/delay.h>
> +
> +#include "dwc_eth_qos.h"
> +
> +static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
> +{
> +#ifdef CONFIG_CLK
> +	struct eqos_priv *eqos = dev_get_priv(dev);
> +
> +	return clk_get_rate(&eqos->clk_master_bus);
> +#else
> +	return 0;
> +#endif
> +}
> +
> +static int eqos_start_clks_stm32(struct udevice *dev)
> +{
> +#ifdef CONFIG_CLK
> +	struct eqos_priv *eqos = dev_get_priv(dev);
> +	int ret;
> +
> +	debug("%s(dev=%p):\n", __func__, dev);
> +
> +	ret = clk_enable(&eqos->clk_master_bus);
> +	if (ret < 0) {
> +		pr_err("clk_enable(clk_master_bus) failed: %d", ret);
> +		goto err;
> +	}
> +
> +	ret = clk_enable(&eqos->clk_rx);
> +	if (ret < 0) {
> +		pr_err("clk_enable(clk_rx) failed: %d", ret);
> +		goto err_disable_clk_master_bus;
> +	}
> +
> +	ret = clk_enable(&eqos->clk_tx);
> +	if (ret < 0) {
> +		pr_err("clk_enable(clk_tx) failed: %d", ret);
> +		goto err_disable_clk_rx;
> +	}
> +
> +	if (clk_valid(&eqos->clk_ck) && !eqos->clk_ck_enabled) {
> +		ret = clk_enable(&eqos->clk_ck);
> +		if (ret < 0) {
> +			pr_err("clk_enable(clk_ck) failed: %d", ret);
> +			goto err_disable_clk_tx;
> +		}
> +		eqos->clk_ck_enabled = true;
> +	}
> +#endif
> +
> +	debug("%s: OK\n", __func__);
> +	return 0;
> +
> +#ifdef CONFIG_CLK
> +err_disable_clk_tx:
> +	clk_disable(&eqos->clk_tx);
> +err_disable_clk_rx:
> +	clk_disable(&eqos->clk_rx);
> +err_disable_clk_master_bus:
> +	clk_disable(&eqos->clk_master_bus);
> +err:
> +	debug("%s: FAILED: %d\n", __func__, ret);
> +	return ret;
> +#endif
> +}
> +
> +static int eqos_stop_clks_stm32(struct udevice *dev)
> +{
> +#ifdef CONFIG_CLK
> +	struct eqos_priv *eqos = dev_get_priv(dev);
> +
> +	debug("%s(dev=%p):\n", __func__, dev);
> +
> +	clk_disable(&eqos->clk_tx);
> +	clk_disable(&eqos->clk_rx);
> +	clk_disable(&eqos->clk_master_bus);
> +#endif
> +
> +	debug("%s: OK\n", __func__);
> +	return 0;
> +}
> +
> +static int eqos_probe_resources_stm32(struct udevice *dev)
> +{
> +	struct eqos_priv *eqos = dev_get_priv(dev);
> +	int ret;
> +	phy_interface_t interface;
> +
> +	debug("%s(dev=%p):\n", __func__, dev);
> +
> +	interface = eqos->config->interface(dev);
> +
> +	if (interface == PHY_INTERFACE_MODE_NA) {
> +		pr_err("Invalid PHY interface\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = board_interface_eth_init(dev, interface);
> +	if (ret)
> +		return -EINVAL;
> +
> +	ret = clk_get_by_name(dev, "stmmaceth", &eqos->clk_master_bus);
> +	if (ret) {
> +		pr_err("clk_get_by_name(master_bus) failed: %d", ret);
> +		goto err_probe;
> +	}
> +
> +	ret = clk_get_by_name(dev, "mac-clk-rx", &eqos->clk_rx);
> +	if (ret) {
> +		pr_err("clk_get_by_name(rx) failed: %d", ret);
> +		goto err_probe;
> +	}
> +
> +	ret = clk_get_by_name(dev, "mac-clk-tx", &eqos->clk_tx);
> +	if (ret) {
> +		pr_err("clk_get_by_name(tx) failed: %d", ret);
> +		goto err_probe;
> +	}
> +
> +	/*  Get ETH_CLK clocks (optional) */
> +	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
> +	if (ret)
> +		pr_warn("No phy clock provided %d", ret);
> +
> +	debug("%s: OK\n", __func__);
> +	return 0;
> +
> +err_probe:
> +
> +	debug("%s: returns %d\n", __func__, ret);
> +	return ret;
> +}
> +
> +static int eqos_remove_resources_stm32(struct udevice *dev)
> +{
> +	debug("%s(dev=%p):\n", __func__, dev);
> +
> +	return 0;
> +}
> +
> +static struct eqos_ops eqos_stm32_ops = {
> +	.eqos_inval_desc = eqos_inval_desc_generic,
> +	.eqos_flush_desc = eqos_flush_desc_generic,
> +	.eqos_inval_buffer = eqos_inval_buffer_generic,
> +	.eqos_flush_buffer = eqos_flush_buffer_generic,
> +	.eqos_probe_resources = eqos_probe_resources_stm32,
> +	.eqos_remove_resources = eqos_remove_resources_stm32,
> +	.eqos_stop_resets = eqos_null_ops,
> +	.eqos_start_resets = eqos_null_ops,
> +	.eqos_stop_clks = eqos_stop_clks_stm32,
> +	.eqos_start_clks = eqos_start_clks_stm32,
> +	.eqos_calibrate_pads = eqos_null_ops,
> +	.eqos_disable_calibration = eqos_null_ops,
> +	.eqos_set_tx_clk_speed = eqos_null_ops,
> +	.eqos_get_enetaddr = eqos_null_ops,
> +	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
> +};
> +
> +struct eqos_config __maybe_unused eqos_stm32_config = {
> +	.reg_access_always_ok = false,
> +	.mdio_wait = 10000,
> +	.swr_wait = 50,
> +	.config_mac = EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_AV,
> +	.config_mac_mdio = EQOS_MAC_MDIO_ADDRESS_CR_250_300,
> +	.axi_bus_width = EQOS_AXI_WIDTH_64,
> +	.interface = dev_read_phy_mode,
> +	.ops = &eqos_stm32_ops
> +};

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
