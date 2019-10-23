Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2080E1573
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 11:12:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D56CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 09:12:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5694FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 09:12:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9N9AwwY001145; Wed, 23 Oct 2019 11:12:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Rv37HqkejKMDrqqSPZBSaWynqDB/fuj6KBieMohBA8Q=;
 b=PcaT7xHlaa7sFOhOuwtnn74wxWrpaKF43EHYw9zBYX0xVHt9l0PAjk6muolLHUt59r2Q
 tY5A7x31P6VydEdT90fbzC9jTIQQpvErIL2oTJ8gz71ya3/V4smce+Ibt4YJpUI8/Lku
 hHyMif3s44VsV0yLcZrfi7Td4DD1DRtOohgod1lSSGWHNTQ22Ii0KXj4QLHJEp1pXaSE
 /8IbfNF57HsyKxY9ynAjAH9BViheGLzoI0Lw10M6tpBrYbsNIp/5o4Y29N1fQEzKnnDD
 NLyNex75bBSS01RK5HsWpJePc9jZ19gqJzTKHMeFGIj+WgNKiFRfvDDO2M1+7XBdt/oo mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1jmfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 11:12:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7ABB110002A;
 Wed, 23 Oct 2019 11:12:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C0C52B28EA;
 Wed, 23 Oct 2019 11:12:15 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 23 Oct
 2019 11:12:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 23 Oct 2019 11:12:14 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v3 11/15] stm32mp1: activate DFU support
 and command MTD
Thread-Index: AQHViYH16fkivpMQT0yss4muts9B0A==
Date: Wed, 23 Oct 2019 09:12:14 +0000
Message-ID: <c1aaf080-84de-5510-7c2f-14383b7371a8@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
 <20191014072812.21843-12-patrick.delaunay@st.com>
In-Reply-To: <20191014072812.21843-12-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <FAD7FA10E3A44749B7CAC45379509E3E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_02:2019-10-22,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 11/15] stm32mp1: activate DFU support
 and command MTD
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

On 10/14/19 9:28 AM, Patrick Delaunay wrote:
> Add support of DFU for MMC, MTD, RAM and MTD command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  configs/stm32mp15_basic_defconfig   | 4 ++++
>  configs/stm32mp15_optee_defconfig   | 4 ++++
>  configs/stm32mp15_trusted_defconfig | 4 ++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index f6c68feb6f..cd4fc20ca5 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -34,6 +34,7 @@ CONFIG_CMD_GPIO=y
>  CONFIG_CMD_GPT=y
>  CONFIG_CMD_I2C=y
>  CONFIG_CMD_MMC=y
> +CONFIG_CMD_MTD=y
>  CONFIG_CMD_REMOTEPROC=y
>  CONFIG_CMD_SF=y
>  CONFIG_CMD_SPI=y
> @@ -62,6 +63,9 @@ CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_STM32_ADC=y
> +CONFIG_DFU_MMC=y
> +CONFIG_DFU_RAM=y
> +CONFIG_DFU_MTD=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
> diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
> index 177cbc7d5f..8d3d2e8508 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -23,6 +23,7 @@ CONFIG_CMD_GPIO=y
>  CONFIG_CMD_GPT=y
>  CONFIG_CMD_I2C=y
>  CONFIG_CMD_MMC=y
> +CONFIG_CMD_MTD=y
>  CONFIG_CMD_REMOTEPROC=y
>  CONFIG_CMD_SF=y
>  CONFIG_CMD_SPI=y
> @@ -49,6 +50,9 @@ CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_STM32_ADC=y
> +CONFIG_DFU_MMC=y
> +CONFIG_DFU_RAM=y
> +CONFIG_DFU_MTD=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 71ad1157ec..8da8c4e22a 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -22,6 +22,7 @@ CONFIG_CMD_GPIO=y
>  CONFIG_CMD_GPT=y
>  CONFIG_CMD_I2C=y
>  CONFIG_CMD_MMC=y
> +CONFIG_CMD_MTD=y
>  CONFIG_CMD_REMOTEPROC=y
>  CONFIG_CMD_SF=y
>  CONFIG_CMD_SPI=y
> @@ -48,6 +49,9 @@ CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_STM32_ADC=y
> +CONFIG_DFU_MMC=y
> +CONFIG_DFU_RAM=y
> +CONFIG_DFU_MTD=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
