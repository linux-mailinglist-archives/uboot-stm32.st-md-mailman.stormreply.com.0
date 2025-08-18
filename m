Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 617EEB29A91
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Aug 2025 09:13:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05613C3F92D;
	Mon, 18 Aug 2025 07:13:23 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BB7AC3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 07:13:21 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I71Sse012331;
 Mon, 18 Aug 2025 09:13:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 54xFtXqDkxSujF1wM9IRkmci8f6G54xNXzvk13MWJIg=; b=I9uLVSeG1uY08gJi
 23ceLpI6/2eN/IcznMz7oYKpe9cOlpPUpaxNq+Fhvhg3Dj1VtrDNgfT31wROVMpb
 MfkPE1uXxGNTlos/lsc7NAuN4ufXQ9sKAeSJ33/wAE8hXDny9tNnd4HREwrTDQXC
 vwpRSsJb1Pzm0CTWKYMsVayJX/Bv0SryW/8V3GBUMLqI/LMNThbwUdPwxnms84tE
 OQiYK4Yeq9SLa9jTpVHjAUdTAqP9UXiOzzJVYiCfGZsfTAUGgMLl873qEvOKeOa0
 c2DrzveMFgcJZ2/uhBetZhZFX5fq/U7dQPCOaJYrNVVLNKWVj1OfragmcMbCUt8d
 ucMDjA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48k4xmjx0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Aug 2025 09:13:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C1D34004C;
 Mon, 18 Aug 2025 09:12:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 403246C5F88;
 Mon, 18 Aug 2025 09:11:58 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 09:11:57 +0200
Message-ID: <a8dad650-96b5-47bb-807d-27f38b0ab34f@foss.st.com>
Date: Mon, 18 Aug 2025 09:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250723170913.1.I20e0e3d5851ea2e4a22b20be372800fe059cc2d1@changeid>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250723170913.1.I20e0e3d5851ea2e4a22b20be372800fe059cc2d1@changeid>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
Cc: Marek Vasut <marex@denx.de>, Kongyang Liu <seashell11234455@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Peter Robinson <pbrobinson@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: fix reset logic in
	dwc2_core_reset
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



On 7/23/25 17:09, Patrick Delaunay wrote:
> Use GUSBCFG_FORCEHOSTMODE to detected the HOST forced mode as it is done
> in the Linux driver drivers/usb/dwc2/core.c:dwc2_core_reset().
> 
> The host polling must be executed only if the current mode is host,
> either due to the force HOST mode (which persists after core reset)
> or the connector id pin.
> 
> The GUSBCFG_FORCEDEVMODE bits is used to force the device mode (for
> example used on STM32MP1x platform) and when it is activated the DWC2 reset
> failed with the trace:
> "dwc2_core_reset: Waiting for GINTSTS_CURMODE_HOST timeout"
> 
> Fixes: c5d685b8993c ("usb: dwc2: Unify flush and reset logic with v4.20a support")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/usb/common/dwc2_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/common/dwc2_core.c b/drivers/usb/common/dwc2_core.c
> index 63062d5cc943..37007134e5b3 100644
> --- a/drivers/usb/common/dwc2_core.c
> +++ b/drivers/usb/common/dwc2_core.c
> @@ -17,7 +17,7 @@ int dwc2_core_reset(struct dwc2_core_regs *regs)
>  	bool host_mode = false;
>  
>  	if (!(readl(&regs->global_regs.gotgctl) & GOTGCTL_CONID_B) ||
> -	    (readl(&regs->global_regs.gusbcfg) & GUSBCFG_FORCEDEVMODE))
> +	    (readl(&regs->global_regs.gusbcfg) & GUSBCFG_FORCEHOSTMODE))
>  		host_mode = true;
>  
>  	/* Core Soft Reset */
Hi

tested on stm32mp157c-dk2

Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
