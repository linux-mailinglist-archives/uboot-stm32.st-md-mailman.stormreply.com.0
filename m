Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8CF1409E7
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 13:45:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A772C36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 12:45:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AADE1C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 12:45:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HCbDKs012625; Fri, 17 Jan 2020 13:45:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9wCc1uCFLCiQ9zaGJeFMGu3q6SUY10BZjrhiX300NDo=;
 b=VXSLpo54azG60b8xiNEGZvyGUC1mmhTeXi5PoYUp++I/VCJNIWHJNZAtuG238t3npePk
 COBOlEJVKghnmJ5c6nZa8lZss42+vJWFmfeWnKiJSzdCJwDm2QwcQFumsuw4m84CeiAq
 PhmzULKaU2ZLnKzV9wyeXcbFRys/4AC82fBJDu2xc9cLI2ViTmWDEtwRqc7UWCa96e+k
 6WSeGtgOpnOU7Heds51tSTj+vI/rSDyBhYlnwm6cl87Lr1lE5kBXM3q6xS3xxxgCdy5W
 iC0RCBqx7NQkS27MSTsXwENek3khDn+bZ+xI6pcsVhb4XJMcTQ4Z8yU9KYZ0TEnQF0Qx qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0r33kkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 13:45:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65F8B10002A;
 Fri, 17 Jan 2020 13:45:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DF832B773B;
 Fri, 17 Jan 2020 13:45:25 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jan
 2020 13:45:24 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Jan 2020 13:45:24 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/3] board: stm32mp1: move CONFIG_ENV_XXX
 in defconfig
Thread-Index: AQHVzTP8qJa4ny2sLUe1KA9FQ8nHSg==
Date: Fri, 17 Jan 2020 12:45:24 +0000
Message-ID: <8b520a1d-7cb9-c796-8e40-339a1ba47fd2@st.com>
References: <20200113141742.28182-1-patrick.delaunay@st.com>
 <20200113141742.28182-3-patrick.delaunay@st.com>
In-Reply-To: <20200113141742.28182-3-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <3BC03D4302C7F5459CD482159252D09D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] board: stm32mp1: move CONFIG_ENV_XXX
 in defconfig
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

Hi

On 1/13/20 3:17 PM, Patrick Delaunay wrote:
> Move CONFIG_ENV_SECT_SIZE and CONFIG_ENV_OFFSET in stm32mp15_*_defconfig
> for ST board with NOR support (STM32MP15xx-EV1 boards)
> - CONFIG_SECT_SIZE values = the max supported NOR erase size (256KB)
> - CONFIG_ENV_OFFSET = offset for NOR (ENV_IS_IN_SPI_FLASH)
>
> This Patch prepares the U-Boot support of boards with STM32MP15x SOC
> not provided by STMicroelectronics.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/Kconfig           | 6 ------
>  configs/stm32mp15_basic_defconfig   | 2 ++
>  configs/stm32mp15_optee_defconfig   | 2 ++
>  configs/stm32mp15_trusted_defconfig | 2 ++
>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
> index 9f985e5775..89fc562746 100644
> --- a/board/st/stm32mp1/Kconfig
> +++ b/board/st/stm32mp1/Kconfig
> @@ -9,12 +9,6 @@ config SYS_VENDOR
>  config SYS_CONFIG_NAME
>  	default "stm32mp1"
>  
> -config ENV_SECT_SIZE
> -	default 0x40000 if ENV_IS_IN_SPI_FLASH
> -
> -config ENV_OFFSET
> -	default 0x280000 if ENV_IS_IN_SPI_FLASH
> -
>  config TARGET_STM32MP157C_DK2
>  	bool "support of STMicroelectronics STM32MP157C-DK2 Discovery Board"
>  	default y
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 713a7e6c57..8f0c7e9339 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -1,6 +1,8 @@
>  CONFIG_ARM=y
>  CONFIG_ARCH_STM32MP=y
>  CONFIG_SYS_MALLOC_F_LEN=0x3000
> +CONFIG_ENV_SECT_SIZE=0x40000
> +CONFIG_ENV_OFFSET=0x280000
>  CONFIG_SPL_MMC_SUPPORT=y
>  CONFIG_SPL=y
>  CONFIG_TARGET_STM32MP1=y
> diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
> index f9161fd7d1..b036bb738b 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -1,6 +1,8 @@
>  CONFIG_ARM=y
>  CONFIG_ARCH_STM32MP=y
>  CONFIG_SYS_MALLOC_F_LEN=0x3000
> +CONFIG_ENV_SECT_SIZE=0x40000
> +CONFIG_ENV_OFFSET=0x280000
>  CONFIG_TARGET_STM32MP1=y
>  CONFIG_STM32MP1_OPTEE=y
>  CONFIG_DISTRO_DEFAULTS=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index a5ea528ae3..956ba90153 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -1,6 +1,8 @@
>  CONFIG_ARM=y
>  CONFIG_ARCH_STM32MP=y
>  CONFIG_SYS_MALLOC_F_LEN=0x3000
> +CONFIG_ENV_SECT_SIZE=0x40000
> +CONFIG_ENV_OFFSET=0x280000
>  CONFIG_TARGET_STM32MP1=y
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
