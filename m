Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4E4879408
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 13:20:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 569ACC6C855;
	Tue, 12 Mar 2024 12:20:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38169C6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 12:20:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42CANqnZ016940; Tue, 12 Mar 2024 13:20:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=QxJL9UhWPpbRug7GW7XIOe7C5dPLp30evpB28zxqM3w=; b=nS
 CVEpfPFkGrv6jfjlHKfb00TCT7x7AJPyYTXJvA/3Kh5ODF5UKe+b9WoI4uNT7e11
 82+oYYZ+NJ2pdEpJG1f47PMwXozZ7+gy+cdxmckn79zgsDEWJiExf4m6umhVo97g
 UMP+4jCRBdadRy4xYicHitcioot9R2Cr7Mocf3ROP5gnxT2b1Pz7BxcxhEhwIA5M
 C1TtiCWGvFhlDvbHO09pp+A2CqvpEoHE1uoSUNHkW3NSLYAc/p5Pk92v6ZOyXi58
 EaUJOvr11w6iypy0+j3sJfJVggLfMr8AFBSvmxEDHhODtVm+jSp3c84BhpGK4mpQ
 d5Shqc4IUZ3jLor6eb5g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wrds8n5n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 13:20:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A9A4740044;
 Tue, 12 Mar 2024 13:20:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10FDC2649E5;
 Tue, 12 Mar 2024 13:20:12 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Mar
 2024 13:20:11 +0100
Message-ID: <f466f670-4c40-45ef-949b-a29a5ad83f99@foss.st.com>
Date: Tue, 12 Mar 2024 13:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-3-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240309021831.264018-3-marex@denx.de>
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
Subject: Re: [Uboot-stm32] [PATCH 02/11] net: dwc_eth_qos: Rename
 eqos_stm32_config to eqos_stm32mp15_config
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
> The current glue code is specific to STM32MP15xx, the upcoming STM32MP13xx
> will introduce another entry specific to the STM32MP13xx. Rename the current
> entry to eqos_stm32mp15_config in preparation for STM32MP13xx addition. No
> functional change.
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
>  drivers/net/dwc_eth_qos.c       | 2 +-
>  drivers/net/dwc_eth_qos.h       | 2 +-
>  drivers/net/dwc_eth_qos_stm32.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 533c2bf070b..203bfc0848c 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -1507,7 +1507,7 @@ static const struct udevice_id eqos_ids[] = {
>  #if IS_ENABLED(CONFIG_DWC_ETH_QOS_STM32)
>  	{
>  		.compatible = "st,stm32mp1-dwmac",
> -		.data = (ulong)&eqos_stm32_config
> +		.data = (ulong)&eqos_stm32mp15_config
>  	},
>  #endif
>  #if IS_ENABLED(CONFIG_DWC_ETH_QOS_IMX)
> diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h
> index a6087f191ab..bafd0d339fb 100644
> --- a/drivers/net/dwc_eth_qos.h
> +++ b/drivers/net/dwc_eth_qos.h
> @@ -290,5 +290,5 @@ int eqos_null_ops(struct udevice *dev);
>  extern struct eqos_config eqos_imx_config;
>  extern struct eqos_config eqos_rockchip_config;
>  extern struct eqos_config eqos_qcom_config;
> -extern struct eqos_config eqos_stm32_config;
> +extern struct eqos_config eqos_stm32mp15_config;
>  extern struct eqos_config eqos_jh7110_config;
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
> index cfda757133e..fd29a604987 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -184,7 +184,7 @@ static struct eqos_ops eqos_stm32_ops = {
>  	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
>  };
>  
> -struct eqos_config __maybe_unused eqos_stm32_config = {
> +struct eqos_config __maybe_unused eqos_stm32mp15_config = {
>  	.reg_access_always_ok = false,
>  	.mdio_wait = 10000,
>  	.swr_wait = 50,

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
