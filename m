Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D4552E5EC
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 09:11:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1FADC56630;
	Fri, 20 May 2022 07:11:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A98D2C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 07:11:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K36qoU024416;
 Fri, 20 May 2022 09:10:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zdAS0yDyAuNboXS0ZBoKID08fUgnoPmbUOvb4Gqu4mU=;
 b=RpoJbGI1z2YRAmywuLpoaT7h5ExWu35bqXL6TQEp47ATMTyTzHvsiLLr8YXIFY98RIWH
 kQf149txp1kTcK+mtjBhXUYq3xJ8oPTcnDHQypDZGaIQ1tbXCuwjUnmLreZcjFHVVKUZ
 AkCCpkCpc+65CIjwCgMQLR1RKJQCBnHjn5KVXhoXR1MgzAbaWFY5iA5g6fVcEkUy/gaQ
 0yQJmKFbMzmRVXYKFtEbp2bRDBmfzXxreH9v0d7KX46Aofxfbqwm2T7Yp4P2scwKGZZ1
 /yBFhow46ma0hixVYS5XYJUzCK2XDxZ6wqX6ZgiNaI27loeFTIFJS6RJpO+sgVDWvUv/ bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj6cd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:10:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E7CC100034;
 Fri, 20 May 2022 09:10:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07859212318;
 Fri, 20 May 2022 09:10:59 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 09:10:58 +0200
Message-ID: <ec822292-9c30-136b-0265-a5430f934b9c@foss.st.com>
Date: Fri, 20 May 2022 09:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.15.If62e8c985dd17697c445e229f7375013b22a8c0d@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.15.If62e8c985dd17697c445e229f7375013b22a8c0d@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 15/16] configs: add stm32mp13 defconfig
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

On 5/6/22 16:06, Patrick Delaunay wrote:
> Add a initial config for STM32M13x SOC family, using the stm32mp135f-dk
> device tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/MAINTAINERS |  1 +
>  configs/stm32mp13_defconfig   | 54 +++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 configs/stm32mp13_defconfig
> 
> diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
> index c9252e90f4..d5a09cdc39 100644
> --- a/board/st/stm32mp1/MAINTAINERS
> +++ b/board/st/stm32mp1/MAINTAINERS
> @@ -6,6 +6,7 @@ S:	Maintained
>  F:	arch/arm/dts/stm32mp13*
>  F:	arch/arm/dts/stm32mp15*
>  F:	board/st/stm32mp1/
> +F:	configs/stm32mp13_defconfig
>  F:	configs/stm32mp15_defconfig
>  F:	configs/stm32mp15_basic_defconfig
>  F:	configs/stm32mp15_trusted_defconfig
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> new file mode 100644
> index 0000000000..877c020b4a
> --- /dev/null
> +++ b/configs/stm32mp13_defconfig
> @@ -0,0 +1,54 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_STM32MP=y
> +CONFIG_TFABOOT=y
> +CONFIG_SYS_MALLOC_F_LEN=0x180000
> +CONFIG_ENV_OFFSET=0x900000
> +CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dk"
> +CONFIG_STM32MP13x=y
> +CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> +CONFIG_TARGET_ST_STM32MP13x=y
> +CONFIG_ENV_OFFSET_REDUND=0x940000
> +# CONFIG_ARMV7_NONSEC is not set
> +CONFIG_SYS_LOAD_ADDR=0xc2000000
> +CONFIG_SYS_MEMTEST_START=0xc0000000
> +CONFIG_SYS_MEMTEST_END=0xc4000000
> +CONFIG_DISTRO_DEFAULTS=y
> +CONFIG_FIT=y
> +CONFIG_BOOTDELAY=1
> +CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> +CONFIG_SYS_PROMPT="STM32MP> "
> +CONFIG_CMD_ADTIMG=y
> +CONFIG_CMD_ERASEENV=y
> +CONFIG_CMD_MEMINFO=y
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_CACHE=y
> +CONFIG_CMD_TIME=y
> +CONFIG_CMD_TIMER=y
> +CONFIG_CMD_LOG=y
> +CONFIG_OF_LIVE=y
> +CONFIG_ENV_IS_NOWHERE=y
> +CONFIG_ENV_IS_IN_MMC=y
> +CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_SYS_MMC_ENV_DEV=-1
> +CONFIG_CLK_SCMI=y
> +CONFIG_STM32_SDMMC2=y
> +CONFIG_DM_ETH=y
> +CONFIG_PINCONF=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_REGULATOR_GPIO=y
> +CONFIG_DM_REGULATOR_SCMI=y
> +CONFIG_RESET_SCMI=y
> +CONFIG_SERIAL_RX_BUFFER=y
> +CONFIG_SYSRESET_PSCI=y
> +CONFIG_TEE=y
> +CONFIG_OPTEE=y
> +# CONFIG_OPTEE_TA_AVB is not set
> +CONFIG_ERRNO_STR=y
> +# CONFIG_LMB_USE_MAX_REGIONS is not set
> +CONFIG_LMB_MEMORY_REGIONS=2
> +CONFIG_LMB_RESERVED_REGIONS=16
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
