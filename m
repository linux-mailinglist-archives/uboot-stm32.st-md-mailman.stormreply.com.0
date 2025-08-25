Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E41DB341BA
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Aug 2025 15:50:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A282C3FAD8;
	Mon, 25 Aug 2025 13:50:16 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEE7CC3FAD7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 13:50:14 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PCDda2031111;
 Mon, 25 Aug 2025 15:50:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 e+11ucNjW+ErGfmFi3s9tKZ1t+h2/wb6ph9898clPf4=; b=Sb8RH1ezXKnsist/
 mTleouG6pXkQqJWI5Oqi1kk1SFfgWNoBmqyRX9Rn+99Wdi23bvFj7dYZGO5GEZ27
 Hfx1T5hbI7jmptTYdp6/X1OoDXy58PeSb90KS0EZk0LKHBGLDADbAO/wGDPD/e2B
 ZOkVjA/icymwBCVf8sasxnj9C7DQq6mB0E4Ii2OMRn1Am6tI8ARgbLZR/KaeaQ2F
 T6XPNA3dBx3U6FgIEQ1Nt5Kfn4G0TuH1B6ZhVxmTE5HB4tMlXtPIjU0yoqlkqHD8
 Bf+RbifchUOVaHPegmUeJQOeFO+JoUuWMbvyjrsl1IaX5bRVc7RLhAIBTbLw7mbJ
 QgHHOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmcmyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Aug 2025 15:50:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD5CD40045;
 Mon, 25 Aug 2025 15:49:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 988566C65D4;
 Mon, 25 Aug 2025 15:49:21 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 25 Aug
 2025 15:49:21 +0200
Message-ID: <ea10425f-0811-41a1-bc17-38b8a7377d33@foss.st.com>
Date: Mon, 25 Aug 2025 15:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>
References: <20250820-master-v1-0-fc76f18ab2fd@foss.st.com>
 <20250820-master-v1-8-fc76f18ab2fd@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250820-master-v1-8-fc76f18ab2fd@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 8/8] configs: stm32mp25: enable LVDS
	display support
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



On 8/20/25 18:17, Raphael Gallais-Pou wrote:
> Compile VIDEO_STM32 and VIDEO_STM32_LVDS by default.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  configs/stm32mp25_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
> index 14619ffd96c71028b508897c77f9c8a747166683..bb9bb935e2d427fc515b83fb32ed93cdcac34c1d 100644
> --- a/configs/stm32mp25_defconfig
> +++ b/configs/stm32mp25_defconfig
> @@ -76,6 +76,9 @@ CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  # CONFIG_OPTEE_TA_AVB is not set
> +CONFIG_VIDEO=y
> +CONFIG_VIDEO_STM32=y
> +CONFIG_VIDEO_STM32_LVDS=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  CONFIG_WDT_ARM_SMC=y
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
