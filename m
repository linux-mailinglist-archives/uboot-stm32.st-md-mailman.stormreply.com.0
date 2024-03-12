Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F946879472
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 13:48:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38246C6C855;
	Tue, 12 Mar 2024 12:48:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AA2FC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 12:48:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42CADiAj006703; Tue, 12 Mar 2024 13:48:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ODdthxUNQ0FDQZcycs9WbTR1BKFQxXdH/KVWW4ViAP8=; b=wB
 5SOlKWq0wWC+y7jfi5PFygFcivUR/GtzNWAvx8ZoZPFxNy9WCOV5f4rL6u3dAq8r
 pBdVolwDocwGD+cJyiB1kCYYbSC7imPzU68H5clT5VRMQNVmnCM2Rq0jhEPo+zvi
 JeA0R2vEhQdLodQiCmGXK55ROd4LTdOV8j2a0piKofuJ6xn8gDshewSubYclNOkD
 CR1j3+JeUfN2pj8mS1PXhVejgIfgPbJPq0Gs1PN5NkeYEjve25y8ON2hJbAK1628
 rk6QQA3ROnZFHRhEaGfvsFvZLCbDH2FY/fX4QONryvVE/vDw5xV8F2Tw+jjxpqGT
 TrwkX/G3hn8jSvTH2quw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wrg02nap0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 13:48:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 967564002D;
 Tue, 12 Mar 2024 13:48:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEA6E25F7C1;
 Tue, 12 Mar 2024 13:47:45 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Mar
 2024 13:47:45 +0100
Message-ID: <dcff1154-a4e8-4a64-9929-0e4fff6fe85f@foss.st.com>
Date: Tue, 12 Mar 2024 13:47:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-11-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240309021831.264018-11-marex@denx.de>
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
Subject: Re: [Uboot-stm32] [PATCH 10/11] net: dwc_eth_qos: Add DT parsing
 for STM32MP13xx platform
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
> From: Christophe Roullier <christophe.roullier@st.com>
> 
> Manage 2 ethernet instances, select which instance to configure with mask
> If mask is not present in DT, it is stm32mp15 platform.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> Signed-off-by: Marek Vasut <marex@denx.de> # Rework the code
> ---
> Cc: Christophe Roullier <christophe.roullier@st.com>
> Cc: Joe Hershberger <joe.hershberger@ni.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Ramon Fried <rfried.dev@gmail.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/net/dwc_eth_qos_stm32.c | 82 ++++++++++++++++++++++++++-------
>  1 file changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
> index 4db18130765..00bf6d45568 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -23,6 +23,7 @@
>  #include <net.h>
>  #include <netdev.h>
>  #include <phy.h>
> +#include <regmap.h>
>  #include <reset.h>
>  #include <syscon.h>
>  #include <wait_bit.h>
> @@ -33,11 +34,16 @@
>  
>  /* SYSCFG registers */
>  #define SYSCFG_PMCSETR		0x04
> -#define SYSCFG_PMCCLRR		0x44
> +#define SYSCFG_PMCCLRR_MP13	0x08
> +#define SYSCFG_PMCCLRR_MP15	0x44
> +
> +#define SYSCFG_PMCSETR_ETH1_MASK	GENMASK(23, 16)
> +#define SYSCFG_PMCSETR_ETH2_MASK	GENMASK(31, 24)
>  
>  #define SYSCFG_PMCSETR_ETH_CLK_SEL	BIT(16)
>  #define SYSCFG_PMCSETR_ETH_REF_CLK_SEL	BIT(17)
>  
> +/* STM32MP15xx specific bit */
>  #define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
>  
>  #define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
> @@ -45,6 +51,11 @@
>  #define SYSCFG_PMCSETR_ETH_SEL_RGMII	0x1
>  #define SYSCFG_PMCSETR_ETH_SEL_RMII	0x4
>  
> +/* CLOCK feed to PHY */
> +#define ETH_CK_F_25M		25000000
> +#define ETH_CK_F_50M		50000000
> +#define ETH_CK_F_125M		125000000
> +
>  static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
>  {
>  	struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
> @@ -130,34 +141,65 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>  {
>  	/* Ethernet 50MHz RMII clock selection */
>  	const bool eth_ref_clk_sel = dev_read_bool(dev, "st,eth-ref-clk-sel");
> +	/* SoC is STM32MP13xx with two ethernet MACs */
> +	const bool is_mp13 = device_is_compatible(dev, "st,stm32mp13-dwmac");
>  	/* Gigabit Ethernet 125MHz clock selection. */
>  	const bool eth_clk_sel = dev_read_bool(dev, "st,eth-clk-sel");
> -	u8 *syscfg;
> +	/* Ethernet PHY have no crystal */
> +	const bool ext_phyclk = dev_read_bool(dev, "st,ext-phyclk");
> +	struct eqos_priv *eqos = dev_get_priv(dev);
> +	struct regmap *regmap;
> +	u32 regmap_mask;
> +	ulong rate = 0;
>  	u32 value;
>  
> -	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
> -	if (!syscfg)
> -		return -ENODEV;
> +	regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscon");
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	regmap_mask = dev_read_u32_index_default(dev, "st,syscon", 2,
> +						 SYSCFG_PMCSETR_ETH1_MASK);
> +
> +	if (clk_valid(&eqos->clk_ck))
> +		rate = clk_get_rate(&eqos->clk_ck);
>  
>  	switch (interface_type) {
>  	case PHY_INTERFACE_MODE_MII:
>  		dev_dbg(dev, "PHY_INTERFACE_MODE_MII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
> -		value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> +		/*
> +		 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
> +		 * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
> +		 * acts as a selector between 0:GMII and 1:MII. As STM32MP13xx
> +		 * supports only MII, ETH_SELMII is not present.
> +		 */
> +		if (!is_mp13)	/* Select MII mode on STM32MP15xx */
> +			value |= SYSCFG_PMCSETR_ETH_SELMII;
>  		break;
> -	case PHY_INTERFACE_MODE_GMII:
> +	case PHY_INTERFACE_MODE_GMII:	/* STM32MP15xx only */
>  		dev_dbg(dev, "PHY_INTERFACE_MODE_GMII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
> -		if (eth_clk_sel)
> +		/*
> +		 * If eth_clk_sel is set, use internal ETH_CLKx clock from RCC,
> +		 * otherwise use external clock from IO pin (requires matching
> +		 * GPIO block AF setting of that pin).
> +		 */
> +		if (rate == ETH_CK_F_25M && (eth_clk_sel || ext_phyclk))
>  			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
>  		dev_dbg(dev, "PHY_INTERFACE_MODE_RMII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_RMII);
> -		if (eth_ref_clk_sel)
> +		/*
> +		 * If eth_ref_clk_sel is set, use internal clock from RCC,
> +		 * otherwise use external clock from ETHn_RX_CLK/ETHn_REF_CLK
> +		 * IO pin (requires matching GPIO block AF setting of that
> +		 * pin).
> +		 */
> +		if (rate == ETH_CK_F_50M && (eth_ref_clk_sel || ext_phyclk))
>  			value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
> @@ -167,7 +209,13 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>  		dev_dbg(dev, "PHY_INTERFACE_MODE_RGMII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_RGMII);
> -		if (eth_clk_sel)
> +		/*
> +		 * If eth_clk_sel is set, use internal ETH_CLKx clock from RCC,
> +		 * otherwise use external clock from ETHx_CLK125 pin (requires
> +		 * matching GPIO block AF setting of that pin).
> +		 */
> +		if ((rate == ETH_CK_F_25M || rate == ETH_CK_F_125M) &&
> +		    (eth_clk_sel || ext_phyclk))
>  			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>  		break;
>  	default:
> @@ -177,13 +225,15 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>  		return -EINVAL;
>  	}
>  
> -	/* clear and set ETH configuration bits */
> -	writel(SYSCFG_PMCSETR_ETH_SEL_MASK | SYSCFG_PMCSETR_ETH_SELMII |
> -	       SYSCFG_PMCSETR_ETH_REF_CLK_SEL | SYSCFG_PMCSETR_ETH_CLK_SEL,
> -	       syscfg + SYSCFG_PMCCLRR);
> -	writel(value, syscfg + SYSCFG_PMCSETR);
> +	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
> +	value <<= ffs(regmap_mask) - ffs(SYSCFG_PMCSETR_ETH1_MASK);
>  
> -	return 0;
> +	/* Update PMCCLRR (clear register) */
> +	regmap_write(regmap, is_mp13 ?
> +			     SYSCFG_PMCCLRR_MP13 : SYSCFG_PMCCLRR_MP15,
> +			     regmap_mask);
> +
> +	return regmap_update_bits(regmap, SYSCFG_PMCSETR, regmap_mask, value);
>  }
>  
>  static int eqos_probe_resources_stm32(struct udevice *dev)
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
