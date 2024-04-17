Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7718A7F22
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Apr 2024 11:05:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11654C6DD67;
	Wed, 17 Apr 2024 09:05:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9021CC6DD66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:05:16 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43H7Ks4H006448; Wed, 17 Apr 2024 11:05:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=mlKr/8k+lbMDYNTOaK6MZChvJhN9imDbbkR/+foyVMQ=; b=uX
 XJtifNcav48lyfMjCi/DuoiIL73LRWAsK44b32ldDivbuVyGevMyuVbAu4m+Yb8l
 5MXgifAJsufplDOpzwb/o70PIqsXTQEoi7Rx2R7LrULj3zFZraU8rsSWZVN+RyVa
 /pEjh8PqKMFVzLA1wy1G7stSYW0uvwX95E0WKiQ4Tg/I3ZKZP/nv9zYA9dm4Oz7z
 RRyQGNyqjZe/RsBEZzc4/gCrFX2pH1mdlGApiJLxeWwymUY7dzszA/KSqVlbd8rv
 xAlADXfdtzZIoCG1b7BHz1M/NY8I7dnB+MCa4UwY7rL0Xyov4IWn1qV6ZbYjmkRx
 3cRwg9LWpi8/5wSmUJUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xffffh5xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2024 11:05:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B1FD94002D;
 Wed, 17 Apr 2024 11:05:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54D812105A9;
 Wed, 17 Apr 2024 11:04:50 +0200 (CEST)
Received: from [10.48.86.112] (10.48.86.112) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 11:04:49 +0200
Message-ID: <e7aaa53c-355c-4424-9826-cd706aa73e53@foss.st.com>
Date: Wed, 17 Apr 2024 11:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-6-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240409150215.2497778-6-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: Re: [Uboot-stm32] [PATCH v1 05/25] configs: stm32mp1: Enable
 BUTTON_GPIO flag for stm32mp13_defconfig
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

On 4/9/24 17:01, Patrice Chotard wrote:
> Enable BUTTON_GPIO flag for STM32MP15.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   configs/stm32mp13_defconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index db09e63100e..caaabf39ef3 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -52,6 +52,8 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
>   CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>   CONFIG_SYS_MMC_ENV_DEV=-1
>   CONFIG_ENV_MMC_USE_DT=y
> +CONFIG_BUTTON=y
> +CONFIG_BUTTON_GPIO=y
>   CONFIG_CLK_SCMI=y
>   CONFIG_SET_DFU_ALT_INFO=y
>   CONFIG_USB_FUNCTION_FASTBOOT=y


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
