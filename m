Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 268AB879458
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 13:44:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4EF3C6DD69;
	Tue, 12 Mar 2024 12:44:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4D57C6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 12:44:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42CAD5Sx019102; Tue, 12 Mar 2024 13:43:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Gq6kH2OGGP9BMy9EbfieGQfsh7zW0VtqE57mS1Kjygg=; b=5J
 D6hVz0724Eo2oaVCd5GyAtpNeAwYHc/ZnhawbXPtY89tcu8M5ALJt3z9J1fZmEDI
 RbHRaQQcivtlo5mVfBYW3vu2JJvETkK/1LyhOaaGGXT4L1jLL6FmOEJhzoY563yX
 mOSpVt5jhQdK/9G225OPLSTciRMtstUhWVEXn72a6x63EOMXm0NwAfnxGM7k4KD/
 FPb6HeTLjI/a4JYz9wzbkoHswIHuSlxFhuuefEr3rD2KBdDLCHU/Xd2thuVjdhnp
 mrEnID7eWxz/CpTDSxZkb25cpDGyfq705x7EBxU4wsooOX06g5+zAXRQkU1yEevA
 tDADqlijwVDnXWlo+ghA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wrds8n8f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 13:43:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 30FD74002D;
 Tue, 12 Mar 2024 13:43:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 90C64267821;
 Tue, 12 Mar 2024 13:43:20 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Mar
 2024 13:43:20 +0100
Message-ID: <d10d067d-ef53-490e-8383-b95f85234b6f@foss.st.com>
Date: Tue, 12 Mar 2024 13:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-10-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240309021831.264018-10-marex@denx.de>
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
Subject: Re: [Uboot-stm32] [PATCH 09/11] net: dwc_eth_qos: Request clk-ck
 earlier in probe on STM32
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
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Request the clk-ck earlier in probe in preparation for obtaining
> the clock rate from these clk-ck in eqos_probe_syscfg_stm32() in
> the follow up patch.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Cc: Christophe Roullier <christophe.roullier@st.com>
> Cc: Joe Hershberger <joe.hershberger@ni.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Ramon Fried <rfried.dev@gmail.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/net/dwc_eth_qos_stm32.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
> index 33477925ff1..4db18130765 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -201,6 +201,11 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>  		return -EINVAL;
>  	}
>  
> +	/* Get ETH_CLK clocks (optional) */
> +	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
> +	if (ret)
> +		dev_dbg(dev, "No phy clock provided %d", ret);
> +
>  	ret = eqos_probe_syscfg_stm32(dev, interface);
>  	if (ret)
>  		return -EINVAL;
> @@ -223,11 +228,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>  		goto err_probe;
>  	}
>  
> -	/*  Get ETH_CLK clocks (optional) */
> -	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
> -	if (ret)
> -		dev_warn(dev, "No phy clock provided %d\n", ret);
> -
>  	dev_dbg(dev, "%s: OK\n", __func__);
>  
>  	return 0;
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
