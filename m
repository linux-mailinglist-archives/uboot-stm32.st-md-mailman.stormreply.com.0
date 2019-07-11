Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0465813
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jul 2019 15:47:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F16B1D265A9
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jul 2019 13:47:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E50A7D265A8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 13:47:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6BDfjGG002089; Thu, 11 Jul 2019 15:47:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=40IdXG5dXyLTG8BSYNVK7oBQOI5cKTnobwjU5mMtPco=;
 b=hG7/XrSgpX5p192ohmbDS/ge8r2mN+Ttk8Z/P60JLF5bkumdPbiBif77eWGyHEwnFe79
 iZOeVVtZlGFs+Lm62h3Y6PN4amsDujBSGpyyuHWBufS2rmo3MwiWjOfUuF0RrspbUFo0
 qUl7IuKczbqq9WvF6jaFnNlfSdAMF4+0Uhnc9L1b5FK+PlsWXimtRI5ViWnkwDlLfvWU
 AJOC4jizvpcZ9rhOnY0b/piOGIsf9ANwTtQZ6wbzXxZp4BYB6XjdI9aOoRtEdfRfKPyq
 nUPCsRlKTDH/t8KGbzq9W/Y/6GzLUxThf3D8zHlstacbYXdBlxNF39w6spnRXrHSMsB8 YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjjhj3f2g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 11 Jul 2019 15:47:36 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F50F31;
 Thu, 11 Jul 2019 13:47:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AEB14DAF;
 Thu, 11 Jul 2019 13:47:33 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 11 Jul
 2019 15:47:32 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 11 Jul 2019 15:47:32 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] env: Move CONFIG_ENV_UBI_VOLUME_REDUND in Kconfig
Thread-Index: AQHVIqEqR3UUm9P+g0uIS0zfZjS6DKbFl34Q
Date: Thu, 11 Jul 2019 13:47:32 +0000
Message-ID: <ce978a1108a24aa58ddb3e747a798259@SFHDAG6NODE3.st.com>
References: <1560510360-14446-1-git-send-email-patrick.delaunay@st.com>
 <1560510360-14446-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1560510360-14446-2-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_02:, , signatures=0
Cc: Markus Klotzbuecher <mk@mkio.de>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Alexey Brodkin <abrodkin@synopsys.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Michal Simek <michal.simek@xilinx.com>, Marek Vasut <marek.vasut@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 York Sun <york.sun@nxp.com>, Vipul Kumar <vipul.kumar@xilinx.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] env: Move
	CONFIG_ENV_UBI_VOLUME_REDUND in Kconfig
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 14 juin 2019 13:06
> <marek.vasut@gmail.com>; Michal Simek <michal.simek@xilinx.com>; York Sun
> <york.sun@nxp.com>; U-Boot STM32 <uboot-stm32@st-md-
> mailman.stormreply.com>; Vipul Kumar <vipul.kumar@xilinx.com>; Patrice
> CHOTARD <patrice.chotard@st.com>; Heinrich Schuchardt
> <xypron.glpk@gmx.de>; Alexey Brodkin <abrodkin@synopsys.com>
> Subject: [PATCH 1/2] env: Move CONFIG_ENV_UBI_VOLUME_REDUND in
> Kconfig
> Importance: High
> 
> Add support of CONFIG_ENV_UBI_VOLUME_REDUND in Kconfig as it is already
> done for CONFIG_ENV_UBI_VOLUME.
> 
> As this string is optional, the patch introduces the new boolean option
> CONFIG_USE_ENV_UBI_VOLUME_REDUND to activate the feature.
> 
> Only the stm32mp1 board is impacted.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

I drop this patch as it is superseded by http://patchwork.ozlabs.org/patch/1100049/ 

Merged in SHA1 ff4818cc3ec105a5a250188e6914ae233b75aa84  

PS: USE_ENV_UBI_VOLUME_REDUND is no more needed in this patchset

Patrick

> ---
> 
>  configs/stm32mp15_basic_defconfig   |  2 ++
>  configs/stm32mp15_trusted_defconfig |  2 ++
>  env/Kconfig                         | 11 +++++++++++
>  include/configs/stm32mp1.h          |  4 ----
>  4 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/stm32mp15_basic_defconfig
> b/configs/stm32mp15_basic_defconfig
> index 4aa184f..f4b42eb 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -52,6 +52,8 @@ CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
>  CONFIG_ENV_EXT4_FILE="/uboot.env"
>  CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
> +CONFIG_USE_ENV_UBI_VOLUME_REDUND=y
> +CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_STM32_ADC=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
> diff --git a/configs/stm32mp15_trusted_defconfig
> b/configs/stm32mp15_trusted_defconfig
> index 66361c8..91b450c 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -44,6 +44,8 @@ CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
>  CONFIG_ENV_EXT4_FILE="/uboot.env"
>  CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
> +CONFIG_USE_ENV_UBI_VOLUME_REDUND=y
> +CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_STM32_ADC=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
> diff --git a/env/Kconfig b/env/Kconfig
> index 5651685..676d6eb 100644
> --- a/env/Kconfig
> +++ b/env/Kconfig
> @@ -507,6 +507,17 @@ config ENV_UBI_VOLUME
>  	help
>  	  Name of the volume that you want to store the environment in.
> 
> +config USE_ENV_UBI_VOLUME_REDUND
> +	bool "Enable redunbant UBI volume"
> +	depends on ENV_IS_IN_UBI
> +
> +config ENV_UBI_VOLUME_REDUND
> +	string "UBI volume name, second copy"
> +	depends on USE_ENV_UBI_VOLUME_REDUND
> +	help
> +	  Name of the second volume that you want to store the redundant
> +	  environment in.
> +
>  endif
> 
>  config USE_DEFAULT_ENV_FILE
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h index
> 1d385e0..0ce2fcb 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -38,10 +38,6 @@
>   */
>  #define CONFIG_SYS_LOAD_ADDR			STM32_DDR_BASE
> 
> -#if defined(CONFIG_ENV_IS_IN_UBI)
> -#define CONFIG_ENV_UBI_VOLUME_REDUND		"uboot_config_r"
> -#endif
> -
>  #if defined(CONFIG_ENV_IS_IN_SPI_FLASH)
>  #define	CONFIG_ENV_SECT_SIZE			SZ_256K
>  #define	CONFIG_ENV_OFFSET			0x00280000
> --
> 2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
