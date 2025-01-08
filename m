Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D1CA064EE
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2025 19:54:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F03C2C78F67;
	Wed,  8 Jan 2025 18:54:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71DB6C78F64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 18:54:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508DLJlI031975;
 Wed, 8 Jan 2025 19:54:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8NY3WfxurgrJuElA89WsNtv/fc3q/Tw+yOQ43PIhoc4=; b=MJFzxQWKwzmYiteM
 9kIQGW0e0zSzvlxfN4YbDEK4dAQiABP4+aMtGp8bMhV660x8uqn717gaqlft3Ti+
 2hsE7W2dLm/txD6TDr4O7k5bnqOMWVzEiIFr2cSYxSt9hmrAy536R6wIW8yX4bwn
 Gc6Np5yo+V15sUQGcUbcbdt3oP9q/SviDpuWW01p6Xa1R73lvPPILkN0OdApPzOx
 QRjOlALhXO6Lis21aRmcpKdAuCqFpZAYdibvVVyfKUX8CzC+xKcsFQ3fGIxOM+30
 Jorl9Q+SS4nNrtrtQv4fnbtigF1bqyddtusmYREh7KoGzf9gwLsG+NTjkJS8j8ow
 ocdUVg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441pu4t7vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 19:54:17 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8015640055;
 Wed,  8 Jan 2025 19:53:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0ED862A105C;
 Wed,  8 Jan 2025 19:53:20 +0100 (CET)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 19:53:19 +0100
Message-ID: <a6c8c93d-0f9f-41c4-9874-2c57544e4eac@foss.st.com>
Date: Wed, 8 Jan 2025 19:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20241211080936.1133105-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241211080936.1133105-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: stm32f769-disco: Set
 CYCLIC_MAX_CPU_TIME_US to 8000 for stm32f769-disco
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 12/11/24 09:09, Patrice Chotard wrote:
> Updating the framebuffer takes quite a long time on this slow patform,
> set CYCLIC_MAX_CPU_TIME_US to 8000 for stm32f769-disco to avoid
> following cyclic warning:
>
> "cyclic function video_init took too long: 7280us vs 5000us max"
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   configs/stm32f769-disco_defconfig     | 1 +
>   configs/stm32f769-disco_spl_defconfig | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
> index 1e09c224fc0..5be221afd2f 100644
> --- a/configs/stm32f769-disco_defconfig
> +++ b/configs/stm32f769-disco_defconfig
> @@ -21,6 +21,7 @@ CONFIG_USE_BOOTARGS=y
>   CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
>   CONFIG_SYS_PBSIZE=1050
>   # CONFIG_DISPLAY_CPUINFO is not set
> +CONFIG_CYCLIC_MAX_CPU_TIME_US=8000
>   CONFIG_SYS_PROMPT="U-Boot > "
>   CONFIG_CMD_GPT=y
>   CONFIG_CMD_MMC=y
> diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
> index 787571dba0c..7d4bda44068 100644
> --- a/configs/stm32f769-disco_spl_defconfig
> +++ b/configs/stm32f769-disco_spl_defconfig
> @@ -30,6 +30,7 @@ CONFIG_USE_BOOTARGS=y
>   CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
>   CONFIG_SYS_PBSIZE=1050
>   # CONFIG_DISPLAY_CPUINFO is not set
> +CONFIG_CYCLIC_MAX_CPU_TIME_US=8000
>   CONFIG_SPL_PAD_TO=0x9000
>   CONFIG_SPL_NO_BSS_LIMIT=y
>   CONFIG_SPL_BOARD_INIT=y


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
