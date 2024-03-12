Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AEE879440
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 13:37:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63DFAC6C855;
	Tue, 12 Mar 2024 12:37:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B2A1C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 12:37:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42CB1VEq020493; Tue, 12 Mar 2024 13:37:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=IfXVnRQiWZEz9xYHYrDmZXBmlsnbZI043w5/BbXR3do=; b=oI
 7p8KxcC63/j3YH1BsQZCkVZIhYx9XYjYlPBV4axv1TGDH67kBacH9ftaGrKmaTyS
 3F2PNELBFaN3hO733TW+RZVz4Fb6bDMhkW7jatjr9BpQ5TRdP5zPYJ1AMsKaevvR
 klQKafHUcRkyiMGCANEXxHPVcId6Gd3+yHIFn52XSabg5ofEMkE3gy3yaFR3Eg0B
 9lQeyflhjBQNgFApUzE8wOXAMKhsTz+gJk6QD6GAAYhLqpZOIy8a9XDr9VzxNJNV
 Vg+FSaOz7uJremYX0D+AEKoPyYAY+ONoct0Qan5CzzeiAY6w/o9Zz0Pv1lyMMwJ4
 NdbdMnPdr+gU3gvRGsbQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wrds8n7f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 13:37:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7476F40044;
 Tue, 12 Mar 2024 13:37:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 028EE266D2A;
 Tue, 12 Mar 2024 13:36:45 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Mar
 2024 13:36:44 +0100
Message-ID: <ddb2922c-f619-41b1-abf6-10551fd600d1@foss.st.com>
Date: Tue, 12 Mar 2024 13:36:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-5-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240309021831.264018-5-marex@denx.de>
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
Subject: Re: [Uboot-stm32] [PATCH 04/11] net: dwc_eth_qos: Scrub ifdeffery
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
> Replace ifdef CONFIG_CLK with if (CONFIG_IS_ENABLED(CLK)) to improve code
> build coverage. Some of the functions printed debug("%s: OK\n", __func__);
> on exit with and without CLK enabled, some did not, make it consistent and
> print nothing if CLK is disabled.
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
>  drivers/net/dwc_eth_qos_stm32.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
> index 7520a136ed0..d7ec0c9be36 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -46,21 +46,22 @@
>  
>  static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
>  {
> -#ifdef CONFIG_CLK
> -	struct eqos_priv *eqos = dev_get_priv(dev);
> +	struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
> +
> +	if (!CONFIG_IS_ENABLED(CLK))
> +		return 0;
>  
>  	return clk_get_rate(&eqos->clk_master_bus);
> -#else
> -	return 0;
> -#endif
>  }
>  
>  static int eqos_start_clks_stm32(struct udevice *dev)
>  {
> -#ifdef CONFIG_CLK
> -	struct eqos_priv *eqos = dev_get_priv(dev);
> +	struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
>  	int ret;
>  
> +	if (!CONFIG_IS_ENABLED(CLK))
> +		return 0;
> +
>  	debug("%s(dev=%p):\n", __func__, dev);
>  
>  	ret = clk_enable(&eqos->clk_master_bus);
> @@ -89,12 +90,10 @@ static int eqos_start_clks_stm32(struct udevice *dev)
>  		}
>  		eqos->clk_ck_enabled = true;
>  	}
> -#endif
>  
>  	debug("%s: OK\n", __func__);
>  	return 0;
>  
> -#ifdef CONFIG_CLK
>  err_disable_clk_tx:
>  	clk_disable(&eqos->clk_tx);
>  err_disable_clk_rx:
> @@ -104,20 +103,20 @@ err_disable_clk_master_bus:
>  err:
>  	debug("%s: FAILED: %d\n", __func__, ret);
>  	return ret;
> -#endif
>  }
>  
>  static int eqos_stop_clks_stm32(struct udevice *dev)
>  {
> -#ifdef CONFIG_CLK
> -	struct eqos_priv *eqos = dev_get_priv(dev);
> +	struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
> +
> +	if (!CONFIG_IS_ENABLED(CLK))
> +		return 0;
>  
>  	debug("%s(dev=%p):\n", __func__, dev);
>  
>  	clk_disable(&eqos->clk_tx);
>  	clk_disable(&eqos->clk_rx);
>  	clk_disable(&eqos->clk_master_bus);
> -#endif
>  
>  	debug("%s: OK\n", __func__);
>  	return 0;


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
