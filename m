Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B820A682CE8
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Jan 2023 13:47:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EB75C640E6;
	Tue, 31 Jan 2023 12:47:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01734C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Jan 2023 12:47:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VAS3TY002659; Tue, 31 Jan 2023 13:47:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iOTLlutVJiul2ZLX1EbmQ4DY3QTYLZNOOaMdr/5RomU=;
 b=ot0PB9fmwUFfcmd95eELDJ6N6DiwZcfurOjrtM8fxJZ8Q54k6JC9NSk2dvqZYGJRpra+
 IS8/j3HzMb36cFEdEJNHw9MGDvaD1QGibloHHaDK3uuWIh+BPCDfxABshdqHku3Iw6ba
 tprE5fkMfjPS+TAPw9H9XyMraF3AWJKA6c3L8F/HY4TVl8Dz2bjMperH2jqgIBym3Xq/
 +yAgNoIfr2ZgKuT3ff5qUOM/kSRBUxjzAf8711tw7A2f+4hhTHhomjy3TwavTBfrjUEw
 2Z5kJcmz8robz26veGc8/BBCsPlxDTuiTJ+UPwBLC/9ewswoG1t6J5018JdDpoAQmLgU Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nct0r2180-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 13:47:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61D0110002A;
 Tue, 31 Jan 2023 13:47:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53EAE215BEC;
 Tue, 31 Jan 2023 13:47:13 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 31 Jan
 2023 13:47:12 +0100
Message-ID: <9a4de518-9af1-e304-cd9e-5b3defa0b1f6@foss.st.com>
Date: Tue, 31 Jan 2023 13:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, <u-boot@lists.denx.de>
References: <20230123220031.3540724-1-sjg@chromium.org>
 <20230123220031.3540724-69-sjg@chromium.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230123220031.3540724-69-sjg@chromium.org>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_07,2023-01-31_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Fabio Estevam <festevam@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 William Zhang <william.zhang@broadcom.com>,
 Samuel Holland <samuel@sholland.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Lukasz Majewski <lukma@denx.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 68/88] arm: Rename STM32MP13x
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

Hi Simon

On 1/23/23 23:00, Simon Glass wrote:
> CONFIG options must not use lower-case letter. Convert this and related
> ones to upper case.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  arch/arm/dts/Makefile                      |  2 +-
>  arch/arm/mach-stm32mp/Kconfig              |  4 ++--
>  arch/arm/mach-stm32mp/Kconfig.13x          |  4 ++--
>  arch/arm/mach-stm32mp/Makefile             |  2 +-
>  arch/arm/mach-stm32mp/cmd_stm32key.c       | 10 +++++-----
>  arch/arm/mach-stm32mp/fdt.c                |  4 ++--
>  arch/arm/mach-stm32mp/include/mach/stm32.h |  6 +++---
>  board/st/common/Kconfig                    |  2 +-
>  board/st/stm32mp1/Kconfig                  |  2 +-
>  configs/stm32mp13_defconfig                |  4 ++--
>  drivers/clk/stm32/Kconfig                  |  2 +-
>  11 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index c184c802b45..dc8dcdff218 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -1215,7 +1215,7 @@ dtb-$(CONFIG_ASPEED_AST2600) += ast2600-evb.dtb
>  
>  dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
>  
> -dtb-$(CONFIG_STM32MP13x) += \
> +dtb-$(CONFIG_STM32MP13X) += \
>  	stm32mp135f-dk.dtb
>  
>  dtb-$(CONFIG_STM32MP15x) += \
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index db47baba6d1..cf3196b3b3a 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -37,7 +37,7 @@ choice
>  	prompt "Select STMicroelectronics STM32MPxxx Soc"
>  	default STM32MP15x
>  
> -config STM32MP13x
> +config STM32MP13X
>  	bool "Support STMicroelectronics STM32MP13x Soc"
>  	select ARM_SMCCC
>  	select CPU_V7A
> @@ -103,7 +103,7 @@ config SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION_MMC2
>  
>  config STM32_ETZPC
>  	bool "STM32 Extended TrustZone Protection"
> -	depends on STM32MP15x || STM32MP13x
> +	depends on STM32MP15x || STM32MP13X
>  	default y
>  	imply BOOTP_SERVERIP
>  	help
> diff --git a/arch/arm/mach-stm32mp/Kconfig.13x b/arch/arm/mach-stm32mp/Kconfig.13x
> index acc02a5a187..4d74b35055b 100644
> --- a/arch/arm/mach-stm32mp/Kconfig.13x
> +++ b/arch/arm/mach-stm32mp/Kconfig.13x
> @@ -1,10 +1,10 @@
> -if STM32MP13x
> +if STM32MP13X
>  
>  choice
>  	prompt "STM32MP13x board select"
>  	optional
>  
> -config TARGET_ST_STM32MP13x
> +config TARGET_ST_STM32MP13X
>  	bool "STMicroelectronics STM32MP13x boards"
>  	imply BOOTSTAGE
>  	imply CMD_BOOTSTAGE
> diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
> index a19b2797c8b..90c7c121ec4 100644
> --- a/arch/arm/mach-stm32mp/Makefile
> +++ b/arch/arm/mach-stm32mp/Makefile
> @@ -8,7 +8,7 @@ obj-y += dram_init.o
>  obj-y += syscon.o
>  obj-y += bsec.o
>  
> -obj-$(CONFIG_STM32MP13x) += stm32mp13x.o
> +obj-$(CONFIG_STM32MP13X) += stm32mp13x.o
>  obj-$(CONFIG_STM32MP15x) += stm32mp15x.o
>  
>  obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index 85be8e23bdb..96407cd9b18 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -18,7 +18,7 @@
>   * STM32MP13x: 0b111111 = 0x3F for OTP_SECURED closed device
>   */
>  #define STM32_OTP_CLOSE_ID		0
> -#define STM32_OTP_STM32MP13x_CLOSE_MASK	0x3F
> +#define STM32_OTP_STM32MP13X_CLOSE_MASK	0x3F
>  #define STM32_OTP_STM32MP15x_CLOSE_MASK	BIT(6)
>  
>  /* PKH is the first element of the key list */
> @@ -60,7 +60,7 @@ static u8 stm32key_index;
>  
>  static u8 get_key_nb(void)
>  {
> -	if (IS_ENABLED(CONFIG_STM32MP13x))
> +	if (IS_ENABLED(CONFIG_STM32MP13X))
>  		return ARRAY_SIZE(stm32mp13_list);
>  
>  	if (IS_ENABLED(CONFIG_STM32MP15x))
> @@ -69,7 +69,7 @@ static u8 get_key_nb(void)
>  
>  static const struct stm32key *get_key(u8 index)
>  {
> -	if (IS_ENABLED(CONFIG_STM32MP13x))
> +	if (IS_ENABLED(CONFIG_STM32MP13X))
>  		return &stm32mp13_list[index];
>  
>  	if (IS_ENABLED(CONFIG_STM32MP15x))
> @@ -78,8 +78,8 @@ static const struct stm32key *get_key(u8 index)
>  
>  static u32 get_otp_close_mask(void)
>  {
> -	if (IS_ENABLED(CONFIG_STM32MP13x))
> -		return STM32_OTP_STM32MP13x_CLOSE_MASK;
> +	if (IS_ENABLED(CONFIG_STM32MP13X))
> +		return STM32_OTP_STM32MP13X_CLOSE_MASK;
>  
>  	if (IS_ENABLED(CONFIG_STM32MP15x))
>  		return STM32_OTP_STM32MP15x_CLOSE_MASK;
> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
> index 3b4c05d7451..6b69542ecfc 100644
> --- a/arch/arm/mach-stm32mp/fdt.c
> +++ b/arch/arm/mach-stm32mp/fdt.c
> @@ -270,7 +270,7 @@ static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
>  	int offset, shift;
>  	u32 addr, status, decprot[ETZPC_DECPROT_NB];
>  
> -	if (IS_ENABLED(CONFIG_STM32MP13x)) {
> +	if (IS_ENABLED(CONFIG_STM32MP13X)) {
>  		array = stm32mp13_ip_addr;
>  		array_size = ARRAY_SIZE(stm32mp13_ip_addr);
>  	}
> @@ -491,7 +491,7 @@ int ft_system_setup(void *blob, struct bd_info *bd)
>  	cpu = get_cpu_type();
>  	get_soc_name(name);
>  
> -	if (IS_ENABLED(CONFIG_STM32MP13x))
> +	if (IS_ENABLED(CONFIG_STM32MP13X))
>  		stm32mp13_fdt_fixup(blob, soc, cpu, name);
>  
>  	if (IS_ENABLED(CONFIG_STM32MP15x)) {
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index c85ae6a34ee..1e1f694cb62 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -32,7 +32,7 @@
>  #define STM32_USART1_BASE		0x5C000000
>  #define STM32_USART2_BASE		0x4000E000
>  #endif
> -#ifdef CONFIG_STM32MP13x
> +#ifdef CONFIG_STM32MP13X
>  #define STM32_USART1_BASE		0x4c000000
>  #define STM32_USART2_BASE		0x4c001000
>  #endif
> @@ -130,7 +130,7 @@ enum boot_device {
>  #define TAMP_COPRO_STATE_CRASH		5
>  #endif
>  
> -#ifdef CONFIG_STM32MP13x
> +#ifdef CONFIG_STM32MP13X
>  #define TAMP_BOOTCOUNT			TAMP_BACKUP_REGISTER(31)
>  #define TAMP_BOOT_CONTEXT		TAMP_BACKUP_REGISTER(30)
>  #endif
> @@ -167,7 +167,7 @@ enum forced_boot_mode {
>  #define BSEC_OTP_MAC	57
>  #define BSEC_OTP_BOARD	59
>  #endif
> -#ifdef CONFIG_STM32MP13x
> +#ifdef CONFIG_STM32MP13X
>  #define BSEC_OTP_RPN	1
>  #define BSEC_OTP_SERIAL	13
>  #define BSEC_OTP_MAC	57
> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
> index aba3590866e..ba17d3158d1 100644
> --- a/board/st/common/Kconfig
> +++ b/board/st/common/Kconfig
> @@ -1,7 +1,7 @@
>  config CMD_STBOARD
>  	bool "stboard - command for OTP board information"
>  	depends on ARCH_STM32MP
> -	default y if TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13x
> +	default y if TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13X
>  	help
>  	  This compile the stboard command to
>  	  read and write the board in the OTP.
> diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
> index 6ab8f80fa45..7d0d41bfea0 100644
> --- a/board/st/stm32mp1/Kconfig
> +++ b/board/st/stm32mp1/Kconfig
> @@ -12,7 +12,7 @@ config SYS_CONFIG_NAME
>  source "board/st/common/Kconfig"
>  endif
>  
> -if TARGET_ST_STM32MP13x
> +if TARGET_ST_STM32MP13X
>  
>  config SYS_BOARD
>  	default "stm32mp1"
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index ab824808f9d..7b9718400e8 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -5,10 +5,10 @@ CONFIG_SYS_MALLOC_F_LEN=0x180000
>  CONFIG_ENV_OFFSET=0x900000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dk"
>  CONFIG_SYS_PROMPT="STM32MP> "
> -CONFIG_STM32MP13x=y
> +CONFIG_STM32MP13X=y
>  CONFIG_DDR_CACHEABLE_SIZE=0x10000000
>  CONFIG_CMD_STM32KEY=y
> -CONFIG_TARGET_ST_STM32MP13x=y
> +CONFIG_TARGET_ST_STM32MP13X=y
>  CONFIG_ENV_OFFSET_REDUND=0x940000
>  # CONFIG_ARMV7_NONSEC is not set
>  CONFIG_SYS_LOAD_ADDR=0xc2000000
> diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
> index 7a34ea23c38..7dbddd032b8 100644
> --- a/drivers/clk/stm32/Kconfig
> +++ b/drivers/clk/stm32/Kconfig
> @@ -31,7 +31,7 @@ config CLK_STM32MP1
>  config CLK_STM32MP13
>  	bool "Enable RCC clock driver for STM32MP13"
>  	depends on ARCH_STM32MP && CLK
> -	default y if STM32MP13x
> +	default y if STM32MP13X
>  	select CLK_STM32_CORE
>  	help
>  	  Enable the STM32 clock (RCC) driver. Enable support for

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
