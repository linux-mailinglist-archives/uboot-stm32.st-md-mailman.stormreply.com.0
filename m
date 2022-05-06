Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C4851DA7C
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 16:26:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCC52C628AB;
	Fri,  6 May 2022 14:26:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A53C1C628AA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:26:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246C58k4026494;
 Fri, 6 May 2022 16:26:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bc2nvzobjd7baTzz4/cC4VrESmZns78sI7GFj0gERL4=;
 b=x3Jxhrv2NvzUoR/lYuPAc7SG1LXY0PNk12wlKsnWOEH2vXs0rzidxZU4HHIw6GnCMtjF
 C1O74K4OxM41diz46S7aWpskbAO2/ngm5AoZVBBn9QBK/HNmP53aJnmGppNzHO7VVkdM
 g+wFBX9inpZvHmODX1WglGmZ69Ixzw8YnkJGBvJHclX2McMLptFqftziuH55yMchI8mH
 YCiOB2jQo6yhTbu8crCaeBuDJBOlF+N+C6viQqY7Wflop5GcyC3AXOvmnJCq+zXQF4fj
 pJ2jtxphnEx5jUcgfHuM7kV8tanSpO4EMm8cgs84hWT/1/UqXVCKTDkZKvpu0Dgje+BL VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt89bb56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:26:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13403100034;
 Fri,  6 May 2022 16:26:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0967D227893;
 Fri,  6 May 2022 16:26:30 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 6 May
 2022 16:26:29 +0200
Message-ID: <a212a76a-3042-7f55-c7e6-0c2e6ca74319@foss.st.com>
Date: Fri, 6 May 2022 16:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
 <20220426143736.3.Idf10564d4e488df57f60640bbe1f8a43e200b56f@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220426143736.3.Idf10564d4e488df57f60640bbe1f8a43e200b56f@changeid>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] clk: stm32mp: handle ck_usbo_48m
 clock provided by USBPHYC
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

On 4/26/22 14:37, Patrick Delaunay wrote:
> Handle the input clock of RCC USB_PHY_48, provided by USBPHYC
> and named "ck_usbo_48m".
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/clk/clk_stm32mp1.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index 83ab6b728e..a02921c43a 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -962,6 +962,24 @@ static ulong stm32mp1_read_pll_freq(struct stm32mp1_clk_priv *priv,
>  	return dfout;
>  }
>  
> +static ulong stm32mp1_clk_get_by_name(const char *name)
> +{
> +	struct clk clk;
> +	struct udevice *dev = NULL;
> +	ulong clock = 0;
> +
> +	if (!uclass_get_device_by_name(UCLASS_CLK, name, &dev)) {
> +		if (clk_request(dev, &clk)) {
> +			log_err("%s request", name);
> +		} else {
> +			clk.id = 0;
> +			clock = clk_get_rate(&clk);
> +		}
> +	}
> +
> +	return clock;
> +}
> +
>  static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
>  {
>  	u32 reg;
> @@ -1127,24 +1145,11 @@ static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
>  		break;
>  	/* other */
>  	case _USB_PHY_48:
> -		clock = 48000000;
> +		clock = stm32mp1_clk_get_by_name("ck_usbo_48m");
>  		break;
>  	case _DSI_PHY:
> -	{
> -		struct clk clk;
> -		struct udevice *dev = NULL;
> -
> -		if (!uclass_get_device_by_name(UCLASS_CLK, "ck_dsi_phy",
> -					       &dev)) {
> -			if (clk_request(dev, &clk)) {
> -				log_err("ck_dsi_phy request");
> -			} else {
> -				clk.id = 0;
> -				clock = clk_get_rate(&clk);
> -			}
> -		}
> +		clock = stm32mp1_clk_get_by_name("ck_dsi_phy");
>  		break;
> -	}
>  	default:
>  		break;
>  	}
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
