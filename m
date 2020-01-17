Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1B1409EA
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 13:45:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C808DC36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 12:45:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68E7CC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 12:45:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HCbSvh012168; Fri, 17 Jan 2020 13:45:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bZpNqONhLx32+Hob+YRLNMZgifMldpkO1xgCmt5LXwI=;
 b=h/IgYOJGUpa6jbql9dQ+9qacIMgL6owtfyJ/TJX6ax4PQxjuS0xRvxgnOkA912UaFOeQ
 cb6lcEY48w8uVQUvaMeOOgZonypuvHBVqMiIq2r7IyKe0qeggP/ciYFqCY7/Rga6TSKw
 57sbwLw9S5hM+/zbSn+GNh7dDF3Glmk8lcU2i0D0ASUznUKMe0RCL4ZU05VD2ByjzK67
 0nvJAjssamDL2Kw3sl947Nx+rK9ApKGWCcm7BSB7JPmTwrvsCgRD2fGWWvgsF8YY3D27
 YUVATjLGWATfyOE2CxuijGXIRTTh0XAWH3dOvJ0iRka8TnD+sPD2f/HiVu9Qf9DJiEcz 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0r7bkk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 13:45:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F258410002A;
 Fri, 17 Jan 2020 13:45:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5CED2B773F;
 Fri, 17 Jan 2020 13:45:43 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 17 Jan
 2020 13:45:43 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Jan 2020 13:45:43 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] stm32mp1: split board and SOC support for STM32MP15x
 family
Thread-Index: AQHVyhw7lt0XtNk0wU2ZpHvlnFlBpKfuwxIA
Date: Fri, 17 Jan 2020 12:45:43 +0000
Message-ID: <53f771f8-49d6-e1d2-d657-1c587dea63c0@st.com>
References: <20200113141742.28182-1-patrick.delaunay@st.com>
 <20200113141742.28182-4-patrick.delaunay@st.com>
In-Reply-To: <20200113141742.28182-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <342FFC63A1882849A49F6A72C1B118FF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
Cc: Michal Simek <michal.simek@xilinx.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] stm32mp1: split board and SOC support
 for STM32MP15x family
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
> Split the board and SOC support for STM32MP15x family and
> prepare the introduction of new boards with STM32MP15x.
>
> This path define the 2 configurations:
> - STM32MP15x: STM32MP15x soc support (new)
> - TARGET_ST_STM32MP15x: STMicroelectronics board support (choice)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/Makefile               |  2 +-
>  arch/arm/mach-stm32mp/Kconfig       | 32 +++++++++++++++++++++--------
>  board/st/common/Kconfig             |  3 ++-
>  board/st/stm32mp1/Kconfig           |  7 +------
>  board/st/stm32mp1/stm32mp1.c        |  2 +-
>  configs/stm32mp15_basic_defconfig   |  2 +-
>  configs/stm32mp15_optee_defconfig   |  2 +-
>  configs/stm32mp15_trusted_defconfig |  2 +-
>  8 files changed, 32 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 983e235f44..6aabdabdaa 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -856,7 +856,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += ast2500-evb.dtb
>  
>  dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
>  
> -dtb-$(CONFIG_TARGET_STM32MP1) += \
> +dtb-$(CONFIG_STM32MP15x) += \
>  	stm32mp157a-dk1.dtb \
>  	stm32mp157a-avenger96.dtb \
>  	stm32mp157c-dk2.dtb \
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index bf8a18a0c3..137178aa45 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -33,8 +33,8 @@ config SYS_MALLOC_LEN
>  config ENV_SIZE
>  	default 0x2000
>  
> -config TARGET_STM32MP1
> -	bool "Support stm32mp1xx"
> +config STM32MP15x
> +	bool "Support STMicroelectronics STM32MP15x Soc"
>  	select ARCH_SUPPORT_PSCI if !STM32MP1_TRUSTED
>  	select CPU_V7A
>  	select CPU_V7_HAS_NONSEC if !STM32MP1_TRUSTED
> @@ -45,19 +45,35 @@ config TARGET_STM32MP1
>  	select STM32_RESET
>  	select STM32_SERIAL
>  	select SYS_ARCH_TIMER
> +	imply SYSRESET_PSCI if STM32MP1_TRUSTED
> +	imply SYSRESET_SYSCON if !STM32MP1_TRUSTED
> +	help
> +		support of STMicroelectronics SOC STM32MP15x family
> +		STM32MP157, STM32MP153 or STM32MP151
> +		STMicroelectronics MPU with core ARMv7
> +		dual core A7 for STM32MP157/3, monocore for STM32MP151
> +		target all the STMicroelectronics board with SOC STM32MP1 family
> +
> +choice
> +	prompt "STM32MP15x board select"
> +	optional
> +
> +config TARGET_ST_STM32MP15x
> +	bool "STMicroelectronics STM32MP15x boards"
> +	select STM32MP15x
>  	imply BOOTCOUNT_LIMIT
>  	imply CMD_BOOTCOUNT
>  	imply CMD_CLS if CMD_BMP
>  	imply DISABLE_CONSOLE
>  	imply PRE_CONSOLE_BUFFER
>  	imply SILENT_CONSOLE
> -	imply SYSRESET_PSCI if STM32MP1_TRUSTED
> -	imply SYSRESET_SYSCON if !STM32MP1_TRUSTED
>  	help
> -		target STMicroelectronics SOC STM32MP1 family
> -		STM32MP157, STM32MP153 or STM32MP151
> -		STMicroelectronics MPU with core ARMv7
> -		dual core A7 for STM32MP157/3, monocore for STM32MP151
> +		target the STMicroelectronics board with SOC STM32MP15x
> +		managed by board/st/stm32mp1:
> +		Evalulation board (EV1) or Discovery board (DK1 and DK2).
> +		The difference between board are managed with devicetree
> +
> +endchoice
>  
>  config STM32MP1_TRUSTED
>  	bool "Support trusted boot with TF-A"
> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
> index 1824087afc..af01ca4891 100644
> --- a/board/st/common/Kconfig
> +++ b/board/st/common/Kconfig
> @@ -1,6 +1,7 @@
>  config CMD_STBOARD
>  	bool "stboard - command for OTP board information"
> -	default y
> +	depends on ARCH_STM32MP
> +	default y if TARGET_ST_STM32MP15x
>  	help
>  	  This compile the stboard command to
>  	  read and write the board in the OTP.
> diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
> index 89fc562746..c5ab7553d4 100644
> --- a/board/st/stm32mp1/Kconfig
> +++ b/board/st/stm32mp1/Kconfig
> @@ -1,4 +1,4 @@
> -if TARGET_STM32MP1
> +if TARGET_ST_STM32MP15x
>  
>  config SYS_BOARD
>  	default "stm32mp1"
> @@ -9,10 +9,5 @@ config SYS_VENDOR
>  config SYS_CONFIG_NAME
>  	default "stm32mp1"
>  
> -config TARGET_STM32MP157C_DK2
> -	bool "support of STMicroelectronics STM32MP157C-DK2 Discovery Board"
> -	default y
> -
>  source "board/st/common/Kconfig"
> -
>  endif
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 1d4a54c902..4e298dabcb 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -607,7 +607,7 @@ error:
>  
>  static bool board_is_dk2(void)
>  {
> -	if (CONFIG_IS_ENABLED(TARGET_STM32MP157C_DK2) &&
> +	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
>  	    of_machine_is_compatible("st,stm32mp157c-dk2"))
>  		return true;
>  
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 8f0c7e9339..bc84cd3506 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -5,7 +5,7 @@ CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_ENV_OFFSET=0x280000
>  CONFIG_SPL_MMC_SUPPORT=y
>  CONFIG_SPL=y
> -CONFIG_TARGET_STM32MP1=y
> +CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_SPL_SPI_FLASH_SUPPORT=y
>  CONFIG_SPL_SPI_SUPPORT=y
>  # CONFIG_ARMV7_VIRT is not set
> diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
> index b036bb738b..3bf62b4c64 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -3,7 +3,7 @@ CONFIG_ARCH_STM32MP=y
>  CONFIG_SYS_MALLOC_F_LEN=0x3000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_ENV_OFFSET=0x280000
> -CONFIG_TARGET_STM32MP1=y
> +CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_STM32MP1_OPTEE=y
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 956ba90153..f89f60ca4b 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -3,7 +3,7 @@ CONFIG_ARCH_STM32MP=y
>  CONFIG_SYS_MALLOC_F_LEN=0x3000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_ENV_OFFSET=0x280000
> -CONFIG_TARGET_STM32MP1=y
> +CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
