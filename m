Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D33AC506C
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 May 2025 16:02:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02067C36B19;
	Tue, 27 May 2025 14:02:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35914C36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 14:02:09 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCp2Gb031311;
 Tue, 27 May 2025 16:02:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ps/nq+PBNy55XlzF8j1d8Id4DGrkrgM+rrZ+2hjVfQk=; b=X0XiHOkqSVXkKUuy
 A7lcbDhxXICXYK+6GElno+PDA0GaCJou4xjTJOh5xH+PyMRXPZJmjedFVL+a2V4Q
 lnJcJlefEooeImIb6oBGiPVvNPx9dQOybMBqFMfaGSNDrSHWPoEF+zYzZmRbodL9
 fiioDxUMTP6cKd1/puqQ2eXkUn5EUiS6FGTVnfdEao7OpJQhU8CmPWw7DZeRJH5P
 juiqyurXVbhXglZ4OrGb0jCw7rqb+0FE7kYWjUj3f5+88mu5dy3XoG//vRGL6zzw
 kYwq/xD7e4lFMLhEv2kBgqo9f3pVOuAi3sI6KVAYTl2qSfHkWw/ujkyzUiiGBBQN
 ABNeyA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4j9nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 16:02:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AD2EF40061;
 Tue, 27 May 2025 16:01:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C327AFB29E;
 Tue, 27 May 2025 16:01:13 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 16:01:12 +0200
Message-ID: <a1c78894-529d-4e46-8d4d-51fcee834fb3@foss.st.com>
Date: Tue, 27 May 2025 16:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Borneo <antonio.borneo@foss.st.com>, <u-boot@lists.denx.de>,
 Stefan Roese <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20250521122755.265760-1-antonio.borneo@foss.st.com>
 <20250523094658.299730-5-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250523094658.299730-5-antonio.borneo@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/4] watchdog: don't autostart watchdog
 on STM32MP architecture
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



On 5/23/25 11:46, Antonio Borneo wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> On STM32MP reference boards, the watchdog is started by a previous
> boot stage (e.g. bootrom or secure OS), so the config flag
> WATCHDOG_AUTOSTART is not required.
> It's preferable to rely on the DT properties "u-boot,autostart" or
> "u-boot,noautostart", if needed.
> 
> For backward compatibility on defconfigs that are based on SPL,
> thus cannot rely on a previous boot stage for starting the
> watchdog, enable WATCHDOG_AUTOSTART in their respective defconfig.
> The change in stm32mp15_dhsom.config is propagated to:
> - configs/stm32mp15_dhcom_basic.config
> - configs/stm32mp15_dhcor_basic.config
> and then to:
> - stm32mp15_dhcom_basic_defconfig
> - stm32mp15_dhcom_drc02_basic_defconfig
> - stm32mp15_dhcom_pdk2_basic_defconfig
> - stm32mp15_dhcom_picoitx_basic_defconfig
> - stm32mp15_dhcor_avenger96_basic_defconfig
> - stm32mp15_dhcor_basic_defconfig
> - stm32mp15_dhcor_drc_compact_basic_defconfig
> - stm32mp15_dhcor_testbench_basic_defconfig
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig          | 1 +
>  configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig         | 1 +
>  configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig | 1 +
>  configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig     | 1 +
>  configs/stm32mp15_basic_defconfig                           | 1 +
>  configs/stm32mp15_dhsom.config                              | 1 +
>  drivers/watchdog/Kconfig                                    | 1 +
>  7 files changed, 7 insertions(+)
> 
> diff --git a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> index fc095ac0de1..4c371c17334 100644
> --- a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> +++ b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> @@ -88,6 +88,7 @@ CONFIG_DM_RTC=y
>  CONFIG_RTC_STM32=y
>  CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_SYSRESET_SYSCON=y
> +CONFIG_WATCHDOG_AUTOSTART=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  # CONFIG_BINMAN_FDT is not set
> diff --git a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> index b243c45d690..7463eb5c95d 100644
> --- a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> +++ b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> @@ -88,6 +88,7 @@ CONFIG_DM_RTC=y
>  CONFIG_RTC_STM32=y
>  CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_SYSRESET_SYSCON=y
> +CONFIG_WATCHDOG_AUTOSTART=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  # CONFIG_BINMAN_FDT is not set
> diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> index e635c726459..e9f5bd32721 100644
> --- a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> +++ b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> @@ -88,6 +88,7 @@ CONFIG_DM_RTC=y
>  CONFIG_RTC_STM32=y
>  CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_SYSRESET_SYSCON=y
> +CONFIG_WATCHDOG_AUTOSTART=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  # CONFIG_BINMAN_FDT is not set
> diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
> index 9e7849ff8f0..aefb78935b0 100644
> --- a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
> +++ b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
> @@ -88,6 +88,7 @@ CONFIG_DM_RTC=y
>  CONFIG_RTC_STM32=y
>  CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_SYSRESET_SYSCON=y
> +CONFIG_WATCHDOG_AUTOSTART=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  # CONFIG_BINMAN_FDT is not set
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index e3090ec2a50..241c9402560 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -191,6 +191,7 @@ CONFIG_SPLASH_SCREEN_ALIGN=y
>  CONFIG_BMP_16BPP=y
>  CONFIG_BMP_24BPP=y
>  CONFIG_BMP_32BPP=y
> +CONFIG_WATCHDOG_AUTOSTART=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  # CONFIG_BINMAN_FDT is not set
> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
> index c84116482f6..565b49584e3 100644
> --- a/configs/stm32mp15_dhsom.config
> +++ b/configs/stm32mp15_dhsom.config
> @@ -76,3 +76,4 @@ CONFIG_PREBOOT="run dh_preboot"
>  CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
>  CONFIG_TARGET_DH_STM32MP1_PDK2=y
>  CONFIG_USE_SERVERIP=y
> +CONFIG_WATCHDOG_AUTOSTART=y
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 1bb67f50352..510330be8a5 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -15,6 +15,7 @@ config WATCHDOG_AUTOSTART
>  	bool "Automatically start watchdog timer"
>  	depends on WDT
>  	default n if ARCH_SUNXI
> +	default n if ARCH_STM32MP
>  	default y
>  	help
>  	  Automatically start watchdog timer and start servicing it during
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
