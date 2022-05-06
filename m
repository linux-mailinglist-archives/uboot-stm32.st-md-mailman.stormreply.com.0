Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEDE51DA7F
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 16:28:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03DBEC628AB;
	Fri,  6 May 2022 14:28:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 590FEC628AA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:28:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246BV2Kl010829;
 Fri, 6 May 2022 16:28:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nHdP5n6qjXFUOkewnZc5evSrMAjCXwKWB5dq7jwu1Wk=;
 b=H1oBqFrL6VHvxOtqYLFHFFcqBuqb8pqzTU6Zutgo8a5cK7Yh51nkoEalC7d/JTh0bund
 UiPEOM29AdpXBVNr74n7kClyf1+Tf0/x422CToUxeJTzHb3P1SBcEAt2dnQnPeRgnvxB
 YBdEgjIiFncnifdJ/TxClc7BYeYRMwuzYotQHJWi6oJOwt9DeYKK2dl27u5GdGEV5Zzo
 z6+l2Eed3+NS5uuUyBJvrFDFWuGpWWRJ9dxYwpP6mFMWh222kDJfQNTJNhOjrN9qfJmt
 nQYx0t6ug4f6dK0YJxfzMszTzj/hU5L69d22e/mVO4BgKtponQrU9PTfB+ariGbzZQaF lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fvygu2gmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:28:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C881E10002A;
 Fri,  6 May 2022 16:28:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2AC322789A;
 Fri,  6 May 2022 16:28:18 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 6 May
 2022 16:28:18 +0200
Message-ID: <5d031591-b0b9-725c-4b92-866482929da7@foss.st.com>
Date: Fri, 6 May 2022 16:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220505142126.1.I46677af5f2426ff2eef1afa2365059a93019ed87@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220505142126.1.I46677af5f2426ff2eef1afa2365059a93019ed87@changeid>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Use CONFIG_TFTP_TSIZE on
 STMicroelectronics boards
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

On 5/5/22 14:21, Patrick Delaunay wrote:
> Long TFTP transfers lead to a wall of # characters on UART, which in
> the end may slow down the transfer itself. Use CONFIG_TFTP_TSIZE to
> print progress in fewer # characters.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_defconfig         | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 5d1b2e0fd7..1b1c255b98 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -80,6 +80,7 @@ CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_SYS_MMC_ENV_DEV=-1
>  # CONFIG_SPL_ENV_IS_NOWHERE is not set
>  # CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
> +CONFIG_TFTP_TSIZE=y
>  CONFIG_STM32_ADC=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index f6e7fc81b0..02b37e14ea 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -61,6 +61,7 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_SYS_MMC_ENV_DEV=-1
> +CONFIG_TFTP_TSIZE=y
>  CONFIG_STM32_ADC=y
>  CONFIG_CLK_SCMI=y
>  CONFIG_SET_DFU_ALT_INFO=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 855a394893..df31c0fbb1 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -62,6 +62,7 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_SYS_MMC_ENV_DEV=-1
> +CONFIG_TFTP_TSIZE=y
>  CONFIG_STM32_ADC=y
>  CONFIG_CLK_SCMI=y
>  CONFIG_SET_DFU_ALT_INFO=y

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
