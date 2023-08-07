Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D21EF771BB1
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Aug 2023 09:42:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99736C6B45B;
	Mon,  7 Aug 2023 07:42:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C60EC6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 07:42:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3777ZU2R015838; Mon, 7 Aug 2023 09:42:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=rK59TFCkMuFpTwjDKkC4gLtrDypF12YbvzyLqdz5pzU=; b=AP
 r3Fvsjfnf5aCNoE0B14amengpyWPe7JPMPk91p80n0gRKxfp4tbvA2D86dtVLWIi
 lqbMvtCFLmGlR0PJTUmOBKlPm2n75qUH6zZJbPowoJ4B40PzVJPD9qWNUwOqcTsN
 RelHDE0BQ6KULnKeFKl3el0FWFfFpqId24WrpHUso0i/dfYeL1qHOvAFoEMYaZlu
 U+px2sdMBJ3qfeADDslKBASM5GzPQthQY6UK4CIwz/3lu6J//fl+k+rFGAkzDa7e
 V1HDqC84oHAIANzACRmdtiQn3velUgT0VG1IiJVjwZJG9nP4YjtND0nizObFMN8C
 9KTEzDtFvpCsfAgoNaPA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3savbsr1d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Aug 2023 09:42:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD70410005E;
 Mon,  7 Aug 2023 09:42:13 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4635215BD5;
 Mon,  7 Aug 2023 09:42:13 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 7 Aug
 2023 09:42:13 +0200
Message-ID: <51f41d60-a833-632f-71cb-8dd6928a9c22@foss.st.com>
Date: Mon, 7 Aug 2023 09:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230710133057.1.Ic435a20560fd2da410678dd019f7b2976a83a884@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230710133057.1.Ic435a20560fd2da410678dd019f7b2976a83a884@changeid>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_06,2023-08-03_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: add splash screen with
 stmicroelectronics logo
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



On 7/10/23 13:30, Patrick Delaunay wrote:
> Display the STMicroelectronics logo with features VIDEO_LOGO and
> SPLASH_SCREEN on STMicroelectronics boards.
> 
> With CONFIG_SYS_VENDOR = "st", the logo st.bmp is selected, loaded at the
> address indicated by splashimage and centered with "splashpos=m,m".
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  MAINTAINERS                           |   1 +
>  configs/stm32mp15_basic_defconfig     |   3 +++
>  configs/stm32mp15_defconfig           |   3 +++
>  configs/stm32mp15_trusted_defconfig   |   3 +++
>  include/configs/stm32mp15_st_common.h |   4 +++-
>  tools/logos/st.bmp                    | Bin 0 -> 18244 bytes
>  6 files changed, 13 insertions(+), 1 deletion(-)
>  create mode 100644 tools/logos/st.bmp
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d724b6467344..dfe9409bc7fe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -578,6 +578,7 @@ F:	include/dt-bindings/clock/stm32mp*
>  F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
>  F:	include/dt-bindings/reset/stm32mp*
>  F:	include/stm32_rcc.h
> +F:	tools/logos/st.bmp
>  F:	tools/stm32image.c
>  N:	stm
>  N:	stm32
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 424ae5dbdfaf..9ea5aaa7145a 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -171,6 +171,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
>  CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
>  CONFIG_USB_GADGET_DWC2_OTG=y
>  CONFIG_VIDEO=y
> +CONFIG_VIDEO_LOGO=y
>  CONFIG_BACKLIGHT_GPIO=y
>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
>  CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
> @@ -178,6 +179,8 @@ CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_DSI=y
>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>  CONFIG_VIDEO_STM32_MAX_YRES=800
> +CONFIG_SPLASH_SCREEN=y
> +CONFIG_SPLASH_SCREEN_ALIGN=y
>  CONFIG_BMP_16BPP=y
>  CONFIG_BMP_24BPP=y
>  CONFIG_BMP_32BPP=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index 2700b5c49910..4d0a81f8a871 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -147,6 +147,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
>  CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
>  CONFIG_USB_GADGET_DWC2_OTG=y
>  CONFIG_VIDEO=y
> +CONFIG_VIDEO_LOGO=y
>  CONFIG_BACKLIGHT_GPIO=y
>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
>  CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
> @@ -154,6 +155,8 @@ CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_DSI=y
>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>  CONFIG_VIDEO_STM32_MAX_YRES=800
> +CONFIG_SPLASH_SCREEN=y
> +CONFIG_SPLASH_SCREEN_ALIGN=y
>  CONFIG_BMP_16BPP=y
>  CONFIG_BMP_24BPP=y
>  CONFIG_BMP_32BPP=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 5b94e0c6d2e7..0a7d8624858d 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -147,6 +147,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
>  CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
>  CONFIG_USB_GADGET_DWC2_OTG=y
>  CONFIG_VIDEO=y
> +CONFIG_VIDEO_LOGO=y
>  CONFIG_BACKLIGHT_GPIO=y
>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
>  CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
> @@ -154,6 +155,8 @@ CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_DSI=y
>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>  CONFIG_VIDEO_STM32_MAX_YRES=800
> +CONFIG_SPLASH_SCREEN=y
> +CONFIG_SPLASH_SCREEN_ALIGN=y
>  CONFIG_BMP_16BPP=y
>  CONFIG_BMP_24BPP=y
>  CONFIG_BMP_32BPP=y
> diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
> index b45982a35b8c..60838cb0e3f0 100644
> --- a/include/configs/stm32mp15_st_common.h
> +++ b/include/configs/stm32mp15_st_common.h
> @@ -10,7 +10,9 @@
>  
>  #define STM32MP_BOARD_EXTRA_ENV \
>  	"usb_pgood_delay=2000\0" \
> -	"console=ttySTM0\0"
> +	"console=ttySTM0\0" \
> +	"splashimage=" __stringify(CONFIG_SYS_LOAD_ADDR) "\0" \
> +	"splashpos=m,m\0"
>  
>  #include <configs/stm32mp15_common.h>
>  
> diff --git a/tools/logos/st.bmp b/tools/logos/st.bmp
> new file mode 100644
> index 0000000000000000000000000000000000000000..f59d3c5cef6b8bce5213a1ef42a9cdaa3c5dbc58
> GIT binary patch
> literal 18244
> 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
> 
> literal 0
> HcmV?d00001
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
