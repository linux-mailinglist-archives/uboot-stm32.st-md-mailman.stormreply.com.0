Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6D2338C75
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:14:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 039CDC57196;
	Fri, 12 Mar 2021 12:14:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CDD6C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:14:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CC75qd030990; Fri, 12 Mar 2021 13:14:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GnMQB+npiCoSe3QaokLb1/hNfbTAHuDyx5mCj+19EMU=;
 b=XpChOIutFNWdRe0LYHybhhK4Bdc+UbJOV+MGs9D3gM9dZDzqBMSI/0HhLR6Qokzuws+X
 J/hCqS484OzCRf0mHKeyMfOsv7vXEO2QvI2ZLup/OzkKXBweqE0BVX6YpOwv6kuVNxim
 R08yITaXVc8ueAVZAiAL4jCI3SwmdbQjoaEUNxu8ly0EgK0DdsTx+EvQTcYllOZEszDc
 lmT23PvWNL2X+qt/ZP6Q1vyUorTraxE1et8CFByKf/srJhZZIXJXUT/aUCX+D3vLbXtN
 PjfRgxVW/xvU3IkO5ux5S8AS0vNWIccGwQWQ/YRgJ64P1msDGzbqpIIP2FjtvpjMyJHI CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf5raf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:14:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B20710002A;
 Fri, 12 Mar 2021 13:14:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 707A523C76F;
 Fri, 12 Mar 2021 13:14:07 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:14:06 +0100
To: <u-boot@lists.denx.de>
References: <20210224123821.22848-1-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <b9dbbdd1-f097-401e-c117-da4dbdc1e4f6@foss.st.com>
Date: Fri, 12 Mar 2021 13:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224123821.22848-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>, Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: stm32: Remove
 BOARD_EARLY_INIT_F and BOARD_LATE_INIT for stm32 boards
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

On 2/24/21 1:38 PM, Patrice Chotard wrote:
> These flags was defined and callbacks linked to these flags are empty
> and only returning 0.
> Remove BOARD_EARLY_INIT_F and BOARD_LATE_INIT flags for these stm32 boards.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  configs/stm32f429-discovery_defconfig  | 1 -
>  configs/stm32f429-evaluation_defconfig | 1 -
>  configs/stm32f469-discovery_defconfig  | 1 -
>  configs/stm32f746-disco_defconfig      | 1 -
>  configs/stm32f769-disco_defconfig      | 2 --
>  configs/stm32h743-disco_defconfig      | 2 --
>  configs/stm32h743-eval_defconfig       | 2 --
>  7 files changed, 10 deletions(-)
> 
> diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
> index 99bf64ace5..a1721fddfd 100644
> --- a/configs/stm32f429-discovery_defconfig
> +++ b/configs/stm32f429-discovery_defconfig
> @@ -14,7 +14,6 @@ CONFIG_USE_BOOTARGS=y
>  CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
>  # CONFIG_DISPLAY_CPUINFO is not set
>  # CONFIG_DISPLAY_BOARDINFO is not set
> -CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_MISC_INIT_R=y
>  CONFIG_HUSH_PARSER=y
>  CONFIG_SYS_PROMPT="U-Boot > "
> diff --git a/configs/stm32f429-evaluation_defconfig b/configs/stm32f429-evaluation_defconfig
> index 4511ac85ce..55505ea378 100644
> --- a/configs/stm32f429-evaluation_defconfig
> +++ b/configs/stm32f429-evaluation_defconfig
> @@ -11,7 +11,6 @@ CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_BOOTDELAY=3
>  # CONFIG_USE_BOOTCOMMAND is not set
>  # CONFIG_DISPLAY_CPUINFO is not set
> -CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_MISC_INIT_R=y
>  CONFIG_SYS_PROMPT="U-Boot > "
>  CONFIG_CMD_IMLS=y
> diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
> index d13794e420..37603970c2 100644
> --- a/configs/stm32f469-discovery_defconfig
> +++ b/configs/stm32f469-discovery_defconfig
> @@ -11,7 +11,6 @@ CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_BOOTDELAY=3
>  # CONFIG_USE_BOOTCOMMAND is not set
>  # CONFIG_DISPLAY_CPUINFO is not set
> -CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_MISC_INIT_R=y
>  CONFIG_SYS_PROMPT="U-Boot > "
>  CONFIG_CMD_IMLS=y
> diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
> index 106ef28b83..e6585e5e9c 100644
> --- a/configs/stm32f746-disco_defconfig
> +++ b/configs/stm32f746-disco_defconfig
> @@ -18,7 +18,6 @@ CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel
>  # CONFIG_USE_BOOTCOMMAND is not set
>  # CONFIG_DISPLAY_CPUINFO is not set
>  # CONFIG_DISPLAY_BOARDINFO is not set
> -CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_BOARD_LATE_INIT=y
>  CONFIG_SYS_PROMPT="U-Boot > "
>  CONFIG_CMD_GPT=y
> diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
> index cc3fad603b..6dc9668326 100644
> --- a/configs/stm32f769-disco_defconfig
> +++ b/configs/stm32f769-disco_defconfig
> @@ -18,8 +18,6 @@ CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel
>  # CONFIG_USE_BOOTCOMMAND is not set
>  # CONFIG_DISPLAY_CPUINFO is not set
>  # CONFIG_DISPLAY_BOARDINFO is not set
> -CONFIG_BOARD_EARLY_INIT_F=y
> -CONFIG_BOARD_LATE_INIT=y
>  CONFIG_SYS_PROMPT="U-Boot > "
>  CONFIG_CMD_GPT=y
>  # CONFIG_RANDOM_UUID is not set
> diff --git a/configs/stm32h743-disco_defconfig b/configs/stm32h743-disco_defconfig
> index 788da28f55..4f4144c917 100644
> --- a/configs/stm32h743-disco_defconfig
> +++ b/configs/stm32h743-disco_defconfig
> @@ -15,8 +15,6 @@ CONFIG_AUTOBOOT_STOP_STR=" "
>  # CONFIG_USE_BOOTCOMMAND is not set
>  CONFIG_DEFAULT_FDT_FILE="stm32h743i-disco"
>  # CONFIG_DISPLAY_CPUINFO is not set
> -CONFIG_BOARD_EARLY_INIT_F=y
> -CONFIG_BOARD_LATE_INIT=y
>  CONFIG_SYS_PROMPT="U-Boot > "
>  CONFIG_CMD_GPT=y
>  CONFIG_CMD_MMC=y
> diff --git a/configs/stm32h743-eval_defconfig b/configs/stm32h743-eval_defconfig
> index d752f5e792..18124859e6 100644
> --- a/configs/stm32h743-eval_defconfig
> +++ b/configs/stm32h743-eval_defconfig
> @@ -15,8 +15,6 @@ CONFIG_AUTOBOOT_STOP_STR=" "
>  # CONFIG_USE_BOOTCOMMAND is not set
>  CONFIG_DEFAULT_FDT_FILE="stm32h743i-eval"
>  # CONFIG_DISPLAY_CPUINFO is not set
> -CONFIG_BOARD_EARLY_INIT_F=y
> -CONFIG_BOARD_LATE_INIT=y
>  CONFIG_SYS_PROMPT="U-Boot > "
>  CONFIG_CMD_GPT=y
>  CONFIG_CMD_MMC=y
> 

Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
