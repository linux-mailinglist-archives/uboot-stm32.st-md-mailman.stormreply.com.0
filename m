Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1844E788CE6
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Aug 2023 18:00:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF5FCC6B444;
	Fri, 25 Aug 2023 16:00:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FC17C6B443
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Aug 2023 16:00:53 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37PEKOBM013884; Fri, 25 Aug 2023 18:00:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=gyfKoZqt1D1a7cSRWO1pRLU/YrGzxq9yM9fFyRW4DuI=; b=QO
 7/QO+uTLN3RROXt4r+4opzkFPcEBhpCJRGo0qajU1ZR076Dm+D60/ALHkY+gvQyd
 C4WaH1md50XCQ5ZClqM/AT7dYnpM7QJvmhSm4DgSY9S+zMJFQm96d0LvkC7kZZ65
 3sOGo7rKQ5lFhT+ySqG8oAZBiRd8abgSHUO9q5852Le3YVe3JQoaXmcLlH6XD1sS
 lRNp+F/ySEMFtj5xqB8oZ8tYkfjPu5KLh1JVsoK7nsFbBkfW+k8PVq7WuZz5jkB0
 Jq1UgDhMaJZosuoArek+BYZT2zthvK/7Ndq3tcb25k/BQBPsWmSiXPqKHGPXSbvA
 F2Pf8lUHGhocBFG/bQwA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3spmjvjmbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Aug 2023 18:00:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42AAD10004F;
 Fri, 25 Aug 2023 18:00:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35ADA23C6A0;
 Fri, 25 Aug 2023 18:00:51 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 25 Aug
 2023 18:00:50 +0200
Message-ID: <fe3a14ce-0221-faef-dd8c-d8adc19a22c0@foss.st.com>
Date: Fri, 25 Aug 2023 18:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230820162446.616442-1-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230820162446.616442-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_13,2023-08-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 yannick fertre <yannick.fertre@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] configs: stm32f746-disco: limit
	resolution to 480x272
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



On 8/20/23 18:24, Dario Binacchi wrote:
> The patch fixes the y-resolution, which was causing the creation of a
> framebuffer larger than actually needed, resulting in memory waste.
> 
> Fixes: cc1b0e7b8e55b ("board: Add display to STM32F746 SoC discovery board")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  configs/stm32f746-disco_defconfig     | 2 +-
>  configs/stm32f746-disco_spl_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
> index bb98ee307a6e..8403679d7fa6 100644
> --- a/configs/stm32f746-disco_defconfig
> +++ b/configs/stm32f746-disco_defconfig
> @@ -59,7 +59,7 @@ CONFIG_VIDEO=y
>  CONFIG_BACKLIGHT_GPIO=y
>  CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_MAX_XRES=480
> -CONFIG_VIDEO_STM32_MAX_YRES=640
> +CONFIG_VIDEO_STM32_MAX_YRES=272
>  CONFIG_SPLASH_SCREEN=y
>  CONFIG_SPLASH_SCREEN_ALIGN=y
>  CONFIG_VIDEO_BMP_RLE8=y
> diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
> index 84aaec1e3390..50c2a36784af 100644
> --- a/configs/stm32f746-disco_spl_defconfig
> +++ b/configs/stm32f746-disco_spl_defconfig
> @@ -85,7 +85,7 @@ CONFIG_VIDEO=y
>  CONFIG_BACKLIGHT_GPIO=y
>  CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_MAX_XRES=480
> -CONFIG_VIDEO_STM32_MAX_YRES=640
> +CONFIG_VIDEO_STM32_MAX_YRES=272
>  CONFIG_SPLASH_SCREEN=y
>  CONFIG_SPLASH_SCREEN_ALIGN=y
>  CONFIG_VIDEO_BMP_RLE8=y

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
