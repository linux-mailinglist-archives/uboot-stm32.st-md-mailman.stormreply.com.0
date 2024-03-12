Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABE87944A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 13:40:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98F00C6C855;
	Tue, 12 Mar 2024 12:40:08 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62102C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 12:40:07 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42CAoeLO031753; Tue, 12 Mar 2024 13:39:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=X3+Fx7nPIkE/7p9tx2/pcrzWBdtLmAG1C1/6gTrCYVg=; b=hW
 KQyRfiwS/2OOw867OoQBZrAJGuneTisXTAhO5qkONhSjW5X3FYIE/hyW/TiZcnU/
 uRCVyhgNjWdfjabZtijvovCTIo/EJs4rqtvDRFSxMppFS+n8erhveYYTW+8Hxz1i
 HK/1SDrmzSpc6kR2R0O8zVPfLFKPxoQm0LQ0kla3NTEBSTBcT3cTpVSUxm4plERm
 gpOZCPyGaVIlY+4vQXzYWIEZh7PwNWS+KoXw7opMoYfAGcSfxtPSEOhxXuBtNcgC
 guQZDAspY96kQfVt1m3NkB6f/nDBILco/6mt5XzJqKkaah4LcmzSQw2iFRA0r2pE
 Ig5gML8KDLPHZ9/A/JAA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ws3kntcjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 13:39:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B4FE14002D;
 Tue, 12 Mar 2024 13:39:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DEC572676BF;
 Tue, 12 Mar 2024 13:39:27 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Mar
 2024 13:39:27 +0100
Message-ID: <a8b9ef7d-dd02-440c-a908-a9a3dc197329@foss.st.com>
Date: Tue, 12 Mar 2024 13:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-7-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240309021831.264018-7-marex@denx.de>
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
Subject: Re: [Uboot-stm32] [PATCH 06/11] net: dwc_eth_qos: Move log_debug
 statements on top of case block
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
> Move the log_debug() calls on top of the bit manipulation code.
> No functional change.
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
>  drivers/net/dwc_eth_qos_stm32.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
> index 7545026b158..38037c47954 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -143,34 +143,34 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>  
>  	switch (interface_type) {
>  	case PHY_INTERFACE_MODE_MII:
> +		log_debug("PHY_INTERFACE_MODE_MII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
>  		value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> -		log_debug("PHY_INTERFACE_MODE_MII\n");
>  		break;
>  	case PHY_INTERFACE_MODE_GMII:
> +		log_debug("PHY_INTERFACE_MODE_GMII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
>  		if (eth_clk_sel_reg)
>  			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
> -		log_debug("PHY_INTERFACE_MODE_GMII\n");
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> +		log_debug("PHY_INTERFACE_MODE_RMII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_RMII);
>  		if (eth_ref_clk_sel_reg)
>  			value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> -		log_debug("PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		log_debug("PHY_INTERFACE_MODE_RGMII\n");
>  		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>  				   SYSCFG_PMCSETR_ETH_SEL_RGMII);
>  		if (eth_clk_sel_reg)
>  			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
> -		log_debug("PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  	default:
>  		log_debug("Do not manage %d interface\n",

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
