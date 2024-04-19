Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1D08AAE15
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:06:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16B91C6DD9A;
	Fri, 19 Apr 2024 12:06:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06B19C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:06:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9VDC9032319; Fri, 19 Apr 2024 14:06:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=CAHoE0Q3YWWVEddNjNSW0lNv2amNFcZ834SPWnhLXrk=; b=Sv
 Xbfh9vl3r3SGiDKDmO+XoM9HYfHBdEylAHsLQUnH5bu0pDraI7Y9sDd8o2Io12I1
 3/zeh0iiM2eTHxcWLZrOUp42sTA6LcgUEZ+niDx+F0sRSivyHHqmM7E7V9jBF30m
 tb0goBfrM0Z2A8JVhGHNQys4Cbhe9GZxeLAFKsou+zS8PP1zLJ1mp3NYJMrZajMK
 2uXKAgywowQ7eyh6E2QZymyWCweoBdnWLnmbA3IpnColUJCB0mF+i0UNPYpaFJ12
 HFzsOSLtrzNQ/LYFygWfnCEFyqJrs5OKy1ZeNjn1gx4yexBAoNWJFI3z4ZBQwQuc
 vKOJxvmxFNPBEZ/PHVbg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xgecyra3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:06:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 67E224004D;
 Fri, 19 Apr 2024 14:06:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18F5A21861A;
 Fri, 19 Apr 2024 14:05:51 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:05:50 +0200
Message-ID: <fde6d749-b667-4188-a359-2b50a4f0f875@foss.st.com>
Date: Fri, 19 Apr 2024 14:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-6-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240326120745.27581-6-marex@denx.de>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 05/11] net: dwc_eth_qos: Use FIELD_PREP
 for ETH_SEL bitfield
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
> Use FIELD_PREP to configure content of ETH_SEL bitfield in SYSCFG_PMCSETR
> register. No functional change.
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
>  drivers/net/dwc_eth_qos_stm32.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
> index d7ec0c9be36..7545026b158 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -26,6 +26,7 @@
>  #include <reset.h>
>  #include <syscon.h>
>  #include <wait_bit.h>
> +#include <linux/bitfield.h>
>  #include <linux/delay.h>
>  
>  #include "dwc_eth_qos.h"
> @@ -40,9 +41,9 @@
>  #define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
>  
>  #define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
> -#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
> -#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
> -#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
> +#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0x0
> +#define SYSCFG_PMCSETR_ETH_SEL_RGMII	0x1
> +#define SYSCFG_PMCSETR_ETH_SEL_RMII	0x4
>  
>  static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
>  {
> @@ -142,35 +143,33 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>  
>  	switch (interface_type) {
>  	case PHY_INTERFACE_MODE_MII:
> -		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
> -			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> +		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
> +				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
> +		value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>  		log_debug("PHY_INTERFACE_MODE_MII\n");
>  		break;
>  	case PHY_INTERFACE_MODE_GMII:
> +		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
> +				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
>  		if (eth_clk_sel_reg)
> -			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
> -				SYSCFG_PMCSETR_ETH_CLK_SEL;
> -		else
> -			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
> +			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>  		log_debug("PHY_INTERFACE_MODE_GMII\n");
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> +		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
> +				   SYSCFG_PMCSETR_ETH_SEL_RMII);
>  		if (eth_ref_clk_sel_reg)
> -			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
> -				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> -		else
> -			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
> +			value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>  		log_debug("PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
> +				   SYSCFG_PMCSETR_ETH_SEL_RGMII);
>  		if (eth_clk_sel_reg)
> -			value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
> -				SYSCFG_PMCSETR_ETH_CLK_SEL;
> -		else
> -			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
> +			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>  		log_debug("PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  	default:


Applied on u-boot-stm32/master 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
