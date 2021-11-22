Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0FF4589E6
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 08:37:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E408C5C83D;
	Mon, 22 Nov 2021 07:37:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BF90C5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 07:37:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM3kMw7013703;
 Mon, 22 Nov 2021 08:37:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=y3iOvuHu+m9bxf3oezQ/VE2sAZlCg7O0QXZZquU/3R0=;
 b=5lBiw9Wqe47MgUZuXof40iibztEREb8i+f/PshjufMDlFH7gyKl/0EjKOpJ2J4MgQdDQ
 NNozn5ehX3rkapRbGrZmeTWYU4XcwGGlQWIx25VD3FSU2dIFWSjYeOTcZbVam/OVY12+
 BCkY8L3Q6hJpPB19TGWnFDF6eoUScd96Y8MzKPiTGrjdw6bTFx3Ul6djtYQiAXZkzUOo
 8URekqdGUp9rXtP3aFBOrNEGApTxuYMUb6/Oyri41Ui6HGSVPI/AgUXfRyTwMNImLObg
 kKvAnBf9XQvFr7exW5xJKUG5IUf1aGtaLsO1tdD1C2W9Z8hW22X2Uz8hFSOn6JtcDt9H yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cfjepux9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:37:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25F2110002A;
 Mon, 22 Nov 2021 08:37:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DB9A2171F3;
 Mon, 22 Nov 2021 08:37:53 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 08:37:52 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
 <20211115163155.7.I6961b5f45435006f3c85e4f5dc7ec1feb219d964@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <3f699b7f-2047-49c4-c19b-0fbf091ecd69@foss.st.com>
Date: Mon, 22 Nov 2021 08:37:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115163155.7.I6961b5f45435006f3c85e4f5dc7ec1feb219d964@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_03,2021-11-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 7/7] board: stm32mp1: enable simple
 framebuffer node for splashscreen
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

On 11/15/21 4:32 PM, Patrick Delaunay wrote:
> Enable an existing simple framebuffer node in the Linux kernel device
> tree and the add the associated reserved memory node to preserved the
> resources (clock, memory) used by the stm32 video driver to display
> the splashscreen = background in exlinux.conf file.
> 
> These resources will be released by the Linux driver only when the
> associated driver is ready to avoid transition issues during the Linux
> kernel initialization between U-Boot splash screen and the final display.
> 
> See Linux documentation for details:
> Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c        | 4 ++++
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_defconfig         | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  4 files changed, 7 insertions(+)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 84592677e4..45f2ca81a6 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -13,6 +13,7 @@
>  #include <dm.h>
>  #include <env.h>
>  #include <env_internal.h>
> +#include <fdt_simplefb.h>
>  #include <fdt_support.h>
>  #include <g_dnl.h>
>  #include <generic-phy.h>
> @@ -914,6 +915,9 @@ int ft_board_setup(void *blob, struct bd_info *bd)
>  		if (IS_ENABLED(CONFIG_FDT_FIXUP_PARTITIONS))
>  			fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
>  
> +	if (CONFIG_IS_ENABLED(FDT_SIMPLEFB))
> +		fdt_simplefb_enable_and_mem_rsv(blob);
> +
>  	return 0;
>  }
>  #endif
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 2cc26d4066..c9ed2239ca 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -34,6 +34,7 @@ CONFIG_SPL_DM_SPI_FLASH=y
>  CONFIG_SPL_POWER=y
>  CONFIG_SPL_SPI_FLASH_MTD=y
>  CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
> +CONFIG_FDT_SIMPLEFB=y
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
>  CONFIG_CMD_ERASEENV=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index 4c6a52fc54..e10f4cedc8 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -19,6 +19,7 @@ CONFIG_SYS_LOAD_ADDR=0xc2000000
>  CONFIG_FIT=y
>  CONFIG_BOOTDELAY=1
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> +CONFIG_FDT_SIMPLEFB=y
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
>  CONFIG_CMD_ERASEENV=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index feca26e973..83bd93e3a1 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -20,6 +20,7 @@ CONFIG_SYS_LOAD_ADDR=0xc2000000
>  CONFIG_FIT=y
>  CONFIG_BOOTDELAY=1
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> +CONFIG_FDT_SIMPLEFB=y
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
>  CONFIG_CMD_ERASEENV=y
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
