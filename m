Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E494589D2
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 08:28:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56A77C5F1C1;
	Mon, 22 Nov 2021 07:28:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C439C5F1C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 07:28:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM3kPC8014943;
 Mon, 22 Nov 2021 08:27:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Z14enwx8Mc/YyrKHqUogtSFaEWKdp3B8rbWyqUxqj3w=;
 b=4s3ZkskyjJ+r/JhhWuTh8W51ZXGHaHzsNmT+5LiyJhbrg66ywnmh+6ZbVwBhQTcXnvdX
 m36xz5amNLpHxANYkB2AGNRibXU6HSMKGLElfMmzAbmR1MShRtQAQggixl7RxSkd3fm7
 BxMvjpmNPZRosvKgv0JxU6njYAsCpaAKRMLAYv71E4C8JSbneqf+rE9XcBZCm/+0gxCg
 oMQlLXwC8Fe5sEj315Su50n+jUTpr6AfcnK5oyeEh4uN3Gb09i3UgQfm7HtNUJkk/hvf
 zV6sTyuBSjLdQ55co0Hc56by4l2na1kGXFlycQKT9W+x3NjeWZwSaIBrzBI9nVYMct1q 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cfntjk7rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:27:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8ADAF10002A;
 Mon, 22 Nov 2021 08:27:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 565D2216EF7;
 Mon, 22 Nov 2021 08:27:55 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 08:27:54 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211119100728.1.I8482c13fb850207cc6b028072073f7f84ce1488c@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <7a4d61b1-d36d-d1b6-6819-37745da23dc3@foss.st.com>
Date: Mon, 22 Nov 2021 08:27:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119100728.1.I8482c13fb850207cc6b028072073f7f84ce1488c@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_02,2021-11-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, u-boot@dh-electronics.com,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp15: deactivate the
	CONFIG_STM32_IPCC
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

HI Patrick

On 11/19/21 10:07 AM, Patrick Delaunay wrote:
> The IPCC mailbox is only used for communication with M4 firmware but
> it is not used in the stm32 remoteproc driver; it was planed but the
> support of this mailbox in remoteproc for STM32MP15x is dropped.
> 
> So the associated drivers and config CONFIG_STM32_IPCC can be
> deactivated to reduce the U-Boot size; the CONFIG_DM_MAILBOX can be
> also deactivated as the mailbox UCLASS is no more used.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig          | 2 --
>  configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig         | 2 --
>  configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig | 2 --
>  configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig     | 2 --
>  configs/stm32mp15_basic_defconfig                           | 2 --
>  configs/stm32mp15_defconfig                                 | 2 --
>  configs/stm32mp15_dhcom_basic_defconfig                     | 2 --
>  configs/stm32mp15_dhcor_basic_defconfig                     | 2 --
>  configs/stm32mp15_trusted_defconfig                         | 2 --
>  9 files changed, 18 deletions(-)
> 
> diff --git a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> index adb8f10b17..11a2885a5c 100644
> --- a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> +++ b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> @@ -51,8 +51,6 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> -CONFIG_DM_MAILBOX=y
> -CONFIG_STM32_IPCC=y
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> diff --git a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> index dca35db014..7973e0f46f 100644
> --- a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> +++ b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> @@ -51,8 +51,6 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> -CONFIG_DM_MAILBOX=y
> -CONFIG_STM32_IPCC=y
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> index aa6a28e6a7..5eadd63100 100644
> --- a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> +++ b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> @@ -51,8 +51,6 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> -CONFIG_DM_MAILBOX=y
> -CONFIG_STM32_IPCC=y
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
> index 9abd1a100c..1dde46a0ce 100644
> --- a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
> +++ b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
> @@ -51,8 +51,6 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> -CONFIG_DM_MAILBOX=y
> -CONFIG_STM32_IPCC=y
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 2cc26d4066..055336c266 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -102,8 +102,6 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> -CONFIG_DM_MAILBOX=y
> -CONFIG_STM32_IPCC=y
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index 4c6a52fc54..d5bb4b27c2 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -84,8 +84,6 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> -CONFIG_DM_MAILBOX=y
> -CONFIG_STM32_IPCC=y
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
> index 84375589c5..8fbcef2699 100644
> --- a/configs/stm32mp15_dhcom_basic_defconfig
> +++ b/configs/stm32mp15_dhcom_basic_defconfig
> @@ -96,8 +96,6 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> -CONFIG_DM_MAILBOX=y
> -CONFIG_STM32_IPCC=y
>  CONFIG_I2C_EEPROM=y
>  CONFIG_SYS_I2C_EEPROM_ADDR=0x50
>  CONFIG_SUPPORT_EMMC_BOOT=y
> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
> index aa000effc4..c551a4c411 100644
> --- a/configs/stm32mp15_dhcor_basic_defconfig
> +++ b/configs/stm32mp15_dhcor_basic_defconfig
> @@ -92,8 +92,6 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> -CONFIG_DM_MAILBOX=y
> -CONFIG_STM32_IPCC=y
>  CONFIG_I2C_EEPROM=y
>  CONFIG_SYS_I2C_EEPROM_ADDR=0x53
>  CONFIG_SUPPORT_EMMC_BOOT=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index feca26e973..c0ac1ef319 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -85,8 +85,6 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> -CONFIG_DM_MAILBOX=y
> -CONFIG_STM32_IPCC=y
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
