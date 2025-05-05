Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B96D2AA9439
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 May 2025 15:19:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C3F7C78F63;
	Mon,  5 May 2025 13:19:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 689B3C78039
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:19:36 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5459XTd0006903;
 Mon, 5 May 2025 15:19:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 GG4zxWneL3W9iw1o51hpBXiQLtYQN88mBoDptYc9Lu0=; b=zxi3zuuh603KAP9m
 8yffAK1XWoXXGZ1nBywZ7BerjTUoonZ1+0q02KyTs4+xqNB8GRoegIrAfZ+yzAH0
 6Jw6E74PZrxZFmY9QzeHPBFY5CQG/I9byqTK6Ou4S6/63xuxQ8VW/p3mU2NY1XtZ
 1XGvGO3vlNhPakB+2PkWBNj7ttTXLeneFP6PdIPtHJgT/EPv21y8pJu9wIkfX8Wr
 GQ51Aw1xhiT6FM5n77zPVJzU5Qe9j53Jwwtg9OJa7CNiMT/SOmchRSM7OvC8vLf9
 ZZ+OZ0hEDj9YXLtzgG3L3UF26HwJpENhm2igrF8TNcvHB0o25pwGqnMgZLzbQpGf
 3MgScg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dvq3vtjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 15:19:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1CE2A40052;
 Mon,  5 May 2025 15:18:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A13BB1B97D;
 Mon,  5 May 2025 15:17:52 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 15:17:51 +0200
Message-ID: <a5323a97-cf20-4d15-9b3c-f5d87b84c8fe@foss.st.com>
Date: Mon, 5 May 2025 15:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
 <20250401070125.3705126-7-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250401070125.3705126-7-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/6] configs: stm32f769-disco: support
 FRD400B25025-A-CTK display
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



On 4/1/25 09:00, Dario Binacchi wrote:
> Support FRIDA FRD400B25025-A-CTK display on stm32f769-disco board.
> 
> As reported in the section 8.3 (i. e. Board revision history) of document
> UM2033 (i. e. Discovery kit with STM32F769NI MCU) these are the changes
> related to the board revision addressed by the patch:
> - Board MB1166 revision A-09:
> - LCD FRIDA FRD397B25009-D-CTK replaced by FRIDA FRD400B25025-A-CTK
> 
> This means that the MB1166-A09 is using an NT35510 panel controller,
> unlike the previous versions which use an OTM8009A controller.
> Therefore, let's add support for NT35510 panel handling to the
> stm32f769-disco board configurations.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ---
> 
> Changes in v2:
> - Replace board with configs in the commit title
> - Add Reviewed-by tag of Patrice Chotard
> 
>  configs/stm32f769-disco_defconfig     | 2 ++
>  configs/stm32f769-disco_spl_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
> index 5be221afd2fa..e50d62e93bd6 100644
> --- a/configs/stm32f769-disco_defconfig
> +++ b/configs/stm32f769-disco_defconfig
> @@ -52,12 +52,14 @@ CONFIG_DW_ALTDESCRIPTOR=y
>  CONFIG_MII=y
>  # CONFIG_PINCTRL_FULL is not set
>  CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
>  CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  CONFIG_STM32_QSPI=y
>  CONFIG_VIDEO=y
>  CONFIG_VIDEO_LOGO=y
>  CONFIG_BACKLIGHT_GPIO=y
> +CONFIG_VIDEO_LCD_NOVATEK_NT35510=y
>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
>  CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_DSI=y
> diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
> index 7d4bda440685..6229ee5089f5 100644
> --- a/configs/stm32f769-disco_spl_defconfig
> +++ b/configs/stm32f769-disco_spl_defconfig
> @@ -75,6 +75,7 @@ CONFIG_MII=y
>  # CONFIG_PINCTRL_FULL is not set
>  CONFIG_SPL_PINCTRL=y
>  CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
>  CONFIG_SPL_RAM=y
>  CONFIG_SPECIFY_CONSOLE_INDEX=y
>  CONFIG_SPI=y
> @@ -84,6 +85,7 @@ CONFIG_SPL_TIMER=y
>  CONFIG_VIDEO=y
>  CONFIG_VIDEO_LOGO=y
>  CONFIG_BACKLIGHT_GPIO=y
> +CONFIG_VIDEO_LCD_NOVATEK_NT35510=y
>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
>  CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_DSI=y
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
