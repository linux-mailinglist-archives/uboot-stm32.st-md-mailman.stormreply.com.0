Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD725309B3
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 May 2022 09:00:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 281C1C0C921;
	Mon, 23 May 2022 07:00:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D894C0C920
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 07:00:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N6LB3h021597;
 Mon, 23 May 2022 09:00:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DKYlsD8fr4zVHJaPRTtsT8QeNHF4/uQcM0/EaiANaPk=;
 b=skDXMZKpwEdIUHng5titGM/0FV3iYv+kl0t+W6Cf5jaNf83iCcSVaBGUaYwr1f9FBj+G
 nSbmTlOmtZ73cWNLL4rL5xm+t7WwFskEyUnGaxYmvyp+i3t8sKBefOLyjVveLwqfHgv8
 fgG7CzV6CjVF0WO0OQLuK2P7RyDdiNJ8EM2dVAAfTXyvf7j19vAwUeeuWb8F7JKJM7yq
 z4GpY6+XoyF2nc0r95VaDkqT1fiEbrxI5l9BS8U6+Ul4HPBO5uwqvDQdK5FIC3mwsh0r
 1RkGK00LHwXiFEjGRQVpGePHHXQ+4ALpnTpl9v4Bq0+A1WOuT8IJdenBCr6p1fDQxwQI gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g6s0275gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 09:00:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1130610002A;
 Mon, 23 May 2022 09:00:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EDA6D2138C6;
 Mon, 23 May 2022 09:00:10 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 23 May
 2022 09:00:09 +0200
Message-ID: <df5afbb7-acdd-177f-b92c-175540c8f0de@foss.st.com>
Date: Mon, 23 May 2022 09:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
 <20220520182444.v2.8.I48a2a2211b9cf24a69030c1499ddeb0a507025d2@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220520182444.v2.8.I48a2a2211b9cf24a69030c1499ddeb0a507025d2@changeid>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_02,2022-05-20_02,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 08/16] arm: stm32mp: add support of
	STM32MP13x
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

On 5/20/22 18:24, Patrick Delaunay wrote:
> Introduce the code in mach-stm32mp and the configuration file
> stm32mp13_defconfig for the new STM32MP family.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - fix several typo issue in comments reported by Patrice and Marek
> 
>  arch/arm/mach-stm32mp/Kconfig                 |  21 +++-
>  arch/arm/mach-stm32mp/Kconfig.13x             |  57 +++++++++
>  arch/arm/mach-stm32mp/Makefile                |   1 +
>  arch/arm/mach-stm32mp/cpu.c                   |   3 +
>  arch/arm/mach-stm32mp/fdt.c                   |   3 +
>  arch/arm/mach-stm32mp/include/mach/stm32.h    |  26 ++++
>  .../arm/mach-stm32mp/include/mach/sys_proto.h |  16 ++-
>  arch/arm/mach-stm32mp/stm32mp13x.c            | 115 ++++++++++++++++++
>  board/st/stm32mp1/Kconfig                     |  15 +++
>  board/st/stm32mp1/MAINTAINERS                 |   2 +
>  configs/stm32mp15_basic_defconfig             |   2 +-
>  configs/stm32mp15_defconfig                   |   2 +-
>  configs/stm32mp15_trusted_defconfig           |   2 +-
>  include/configs/stm32mp13_common.h            | 106 ++++++++++++++++
>  include/configs/stm32mp13_st_common.h         |  17 +++
>  include/configs/stm32mp15_common.h            |   4 +-
>  16 files changed, 385 insertions(+), 7 deletions(-)
>  create mode 100644 arch/arm/mach-stm32mp/Kconfig.13x
>  create mode 100644 arch/arm/mach-stm32mp/stm32mp13x.c
>  create mode 100644 include/configs/stm32mp13_common.h
>  create mode 100644 include/configs/stm32mp13_st_common.h
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 3b4936c326..db47baba6d 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -37,6 +37,24 @@ choice
>  	prompt "Select STMicroelectronics STM32MPxxx Soc"
>  	default STM32MP15x
>  
> +config STM32MP13x
> +	bool "Support STMicroelectronics STM32MP13x Soc"
> +	select ARM_SMCCC
> +	select CPU_V7A
> +	select CPU_V7_HAS_NONSEC
> +	select CPU_V7_HAS_VIRT
> +	select OF_BOARD
> +	select OF_BOARD_SETUP
> +	select PINCTRL_STM32
> +	select STM32_RCC
> +	select STM32_RESET
> +	select STM32_SERIAL
> +	select SYS_ARCH_TIMER
> +	imply CMD_NVEDIT_INFO
> +	help
> +		support of STMicroelectronics SOC STM32MP13x family
> +		STMicroelectronics MPU with core ARMv7
> +
>  config STM32MP15x
>  	bool "Support STMicroelectronics STM32MP15x Soc"
>  	select ARCH_SUPPORT_PSCI
> @@ -85,7 +103,7 @@ config SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION_MMC2
>  
>  config STM32_ETZPC
>  	bool "STM32 Extended TrustZone Protection"
> -	depends on STM32MP15x
> +	depends on STM32MP15x || STM32MP13x
>  	default y
>  	imply BOOTP_SERVERIP
>  	help
> @@ -108,6 +126,7 @@ config CMD_STM32KEY
>  		This command is used to evaluate the secure boot on stm32mp SOC,
>  		it is deactivated by default in real products.
>  
> +source "arch/arm/mach-stm32mp/Kconfig.13x"
>  source "arch/arm/mach-stm32mp/Kconfig.15x"
>  
>  source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
> diff --git a/arch/arm/mach-stm32mp/Kconfig.13x b/arch/arm/mach-stm32mp/Kconfig.13x
> new file mode 100644
> index 0000000000..5fc000986e
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/Kconfig.13x
> @@ -0,0 +1,57 @@
> +if STM32MP13x
> +
> +choice
> +	prompt "STM32MP13x board select"
> +	optional
> +
> +config TARGET_ST_STM32MP13x
> +	bool "STMicroelectronics STM32MP13x boards"
> +	imply BOOTSTAGE
> +	imply CMD_BOOTSTAGE
> +	imply CMD_CLS if CMD_BMP
> +	imply DISABLE_CONSOLE
> +	imply PRE_CONSOLE_BUFFER
> +	imply SILENT_CONSOLE
> +	help
> +		target the STMicroelectronics board with SOC STM32MP13x
> +		managed by board/st/stm32mp1.
> +		The difference between board are managed with devicetree
> +
> +endchoice
> +
> +config SYS_TEXT_BASE
> +	default 0xC0000000
> +
> +config PRE_CON_BUF_ADDR
> +	default 0xC0800000
> +
> +config PRE_CON_BUF_SZ
> +	default 4096
> +
> +config BOOTSTAGE_STASH_ADDR
> +	default 0xC3000000
> +
> +if BOOTCOUNT_GENERIC
> +config SYS_BOOTCOUNT_SINGLEWORD
> +	default y
> +
> +# TAMP_BOOTCOUNT = TAMP_BACKUP_REGISTER(31)
> +config SYS_BOOTCOUNT_ADDR
> +	default 0x5C00A17C
> +endif
> +
> +if DEBUG_UART
> +
> +# debug on UART4 by default
> +config DEBUG_UART_BASE
> +	default 0x40010000
> +
> +# clock source is HSI on reset
> +config DEBUG_UART_CLOCK
> +	default 48000000 if STM32_FPGA
> +	default 64000000
> +endif
> +
> +source "board/st/stm32mp1/Kconfig"
> +
> +endif
> diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
> index 0ffec6e02f..1db9057e04 100644
> --- a/arch/arm/mach-stm32mp/Makefile
> +++ b/arch/arm/mach-stm32mp/Makefile
> @@ -8,6 +8,7 @@ obj-y += dram_init.o
>  obj-y += syscon.o
>  obj-y += bsec.o
>  
> +obj-$(CONFIG_STM32MP13x) += stm32mp13x.o
>  obj-$(CONFIG_STM32MP15x) += stm32mp15x.o
>  
>  ifdef CONFIG_SPL_BUILD
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index b808964d3e..240960ada4 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -52,8 +52,11 @@ void dram_bank_mmu_setup(int bank)
>  	enum dcache_option option;
>  
>  	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
> +/* STM32_SYSRAM_BASE exist only when SPL is supported */
> +#ifdef CONFIG_SPL
>  		start = ALIGN_DOWN(STM32_SYSRAM_BASE, MMU_SECTION_SIZE);
>  		size = ALIGN(STM32_SYSRAM_SIZE, MMU_SECTION_SIZE);
> +#endif
>  	} else if (gd->flags & GD_FLG_RELOC) {
>  		/* bd->bi_dram is available only after relocation */
>  		start = bd->bi_dram[bank].start;
> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
> index 7412f0e029..687543e712 100644
> --- a/arch/arm/mach-stm32mp/fdt.c
> +++ b/arch/arm/mach-stm32mp/fdt.c
> @@ -259,6 +259,9 @@ int ft_system_setup(void *blob, struct bd_info *bd)
>  	u32 pkg, cpu;
>  	char name[SOC_NAME_SIZE];
>  
> +	if (IS_ENABLED(CONFIG_STM32MP13x))
> +		return 0;
> +
>  	soc = fdt_path_offset(blob, "/soc");
>  	/* when absent, nothing to do */
>  	if (soc == -FDT_ERR_NOTFOUND)
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index 47e88fc3dc..cdb58fd40e 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -17,7 +17,9 @@
>  #define STM32_RCC_BASE			0x50000000
>  #define STM32_PWR_BASE			0x50001000
>  #define STM32_SYSCFG_BASE		0x50020000
> +#ifdef CONFIG_STM32MP15x
>  #define STM32_DBGMCU_BASE		0x50081000
> +#endif
>  #define STM32_FMC2_BASE			0x58002000
>  #define STM32_DDRCTRL_BASE		0x5A003000
>  #define STM32_DDRPHYC_BASE		0x5A004000
> @@ -26,8 +28,14 @@
>  #define STM32_STGEN_BASE		0x5C008000
>  #define STM32_TAMP_BASE			0x5C00A000
>  
> +#ifdef CONFIG_STM32MP15x
>  #define STM32_USART1_BASE		0x5C000000
>  #define STM32_USART2_BASE		0x4000E000
> +#endif
> +#ifdef CONFIG_STM32MP13x
> +#define STM32_USART1_BASE		0x4c000000
> +#define STM32_USART2_BASE		0x4c001000
> +#endif
>  #define STM32_USART3_BASE		0x4000F000
>  #define STM32_UART4_BASE		0x40010000
>  #define STM32_UART5_BASE		0x40011000
> @@ -39,8 +47,10 @@
>  #define STM32_SDMMC2_BASE		0x58007000
>  #define STM32_SDMMC3_BASE		0x48004000
>  
> +#ifdef CONFIG_STM32MP15x
>  #define STM32_SYSRAM_BASE		0x2FFC0000
>  #define STM32_SYSRAM_SIZE		SZ_256K
> +#endif
>  
>  #define STM32_DDR_BASE			0xC0000000
>  #define STM32_DDR_SIZE			SZ_1G
> @@ -98,6 +108,8 @@ enum boot_device {
>  
>  /* TAMP registers */
>  #define TAMP_BACKUP_REGISTER(x)		(STM32_TAMP_BASE + 0x100 + 4 * x)
> +
> +#ifdef CONFIG_STM32MP15x
>  #define TAMP_BACKUP_MAGIC_NUMBER	TAMP_BACKUP_REGISTER(4)
>  #define TAMP_BACKUP_BRANCH_ADDRESS	TAMP_BACKUP_REGISTER(5)
>  #define TAMP_COPRO_RSC_TBL_ADDRESS	TAMP_BACKUP_REGISTER(17)
> @@ -111,6 +123,12 @@ enum boot_device {
>  #define TAMP_COPRO_STATE_CSTOP		3
>  #define TAMP_COPRO_STATE_STANDBY	4
>  #define TAMP_COPRO_STATE_CRASH		5
> +#endif
> +
> +#ifdef CONFIG_STM32MP13x
> +#define TAMP_BOOTCOUNT			TAMP_BACKUP_REGISTER(31)
> +#define TAMP_BOOT_CONTEXT		TAMP_BACKUP_REGISTER(30)
> +#endif
>  
>  #define TAMP_BOOT_MODE_MASK		GENMASK(15, 8)
>  #define TAMP_BOOT_MODE_SHIFT		8
> @@ -138,11 +156,19 @@ enum forced_boot_mode {
>  #define STM32_BSEC_LOCK(id)		(STM32_BSEC_LOCK_OFFSET + (id) * 4)
>  
>  /* BSEC OTP index */
> +#ifdef CONFIG_STM32MP15x
>  #define BSEC_OTP_RPN	1
>  #define BSEC_OTP_SERIAL	13
>  #define BSEC_OTP_PKG	16
>  #define BSEC_OTP_MAC	57
>  #define BSEC_OTP_BOARD	59
> +#endif
> +#ifdef CONFIG_STM32MP13x
> +#define BSEC_OTP_RPN	1
> +#define BSEC_OTP_SERIAL	13
> +#define BSEC_OTP_MAC	57
> +#define BSEC_OTP_BOARD	60
> +#endif
>  
>  #endif /* __ASSEMBLY__ */
>  #endif /* _MACH_STM32_H_ */
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 8b61135aeb..829b3feebf 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -3,7 +3,7 @@
>   * Copyright (C) 2015-2017, STMicroelectronics - All Rights Reserved
>   */
>  
> -/* ID = Device Version (bit31:16) + Device Part Number (RPN) (bit7:0) */
> +/* ID = Device Version (bit31:16) + Device Part Number (RPN) (bit15:0) */
>  #define CPU_STM32MP157Cxx	0x05000000
>  #define CPU_STM32MP157Axx	0x05000001
>  #define CPU_STM32MP153Cxx	0x05000024
> @@ -17,10 +17,24 @@
>  #define CPU_STM32MP151Fxx	0x050000AE
>  #define CPU_STM32MP151Dxx	0x050000AF
>  
> +#define CPU_STM32MP135Cxx	0x05010000
> +#define CPU_STM32MP135Axx	0x05010001
> +#define CPU_STM32MP133Cxx	0x050100C0
> +#define CPU_STM32MP133Axx	0x050100C1
> +#define CPU_STM32MP131Cxx	0x050106C8
> +#define CPU_STM32MP131Axx	0x050106C9
> +#define CPU_STM32MP135Fxx	0x05010800
> +#define CPU_STM32MP135Dxx	0x05010801
> +#define CPU_STM32MP133Fxx	0x050108C0
> +#define CPU_STM32MP133Dxx	0x050108C1
> +#define CPU_STM32MP131Fxx	0x05010EC8
> +#define CPU_STM32MP131Dxx	0x05010EC9
> +
>  /* return CPU_STMP32MP...Xxx constants */
>  u32 get_cpu_type(void);
>  
>  #define CPU_DEV_STM32MP15	0x500
> +#define CPU_DEV_STM32MP13	0x501
>  
>  /* return CPU_DEV constants */
>  u32 get_cpu_dev(void);
> diff --git a/arch/arm/mach-stm32mp/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp13x.c
> new file mode 100644
> index 0000000000..d5e3a787c2
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/stm32mp13x.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
> + */
> +
> +#define LOG_CATEGORY LOGC_ARCH
> +
> +#include <common.h>
> +#include <log.h>
> +#include <syscon.h>
> +#include <asm/io.h>
> +#include <asm/arch/stm32.h>
> +#include <asm/arch/sys_proto.h>
> +
> +/* SYSCFG register */
> +#define SYSCFG_IDC_OFFSET	0x380
> +#define SYSCFG_IDC_DEV_ID_MASK	GENMASK(11, 0)
> +#define SYSCFG_IDC_DEV_ID_SHIFT	0
> +#define SYSCFG_IDC_REV_ID_MASK	GENMASK(31, 16)
> +#define SYSCFG_IDC_REV_ID_SHIFT	16
> +
> +/* Device Part Number (RPN) = OTP_DATA1 lower 11 bits */
> +#define RPN_SHIFT	0
> +#define RPN_MASK	GENMASK(11, 0)
> +
> +static u32 read_idc(void)
> +{
> +	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
> +
> +	return readl(syscfg + SYSCFG_IDC_OFFSET);
> +}
> +
> +u32 get_cpu_dev(void)
> +{
> +	return (read_idc() & SYSCFG_IDC_DEV_ID_MASK) >> SYSCFG_IDC_DEV_ID_SHIFT;
> +}
> +
> +u32 get_cpu_rev(void)
> +{
> +	return (read_idc() & SYSCFG_IDC_REV_ID_MASK) >> SYSCFG_IDC_REV_ID_SHIFT;
> +}
> +
> +/* Get Device Part Number (RPN) from OTP */
> +static u32 get_cpu_rpn(void)
> +{
> +	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
> +}
> +
> +u32 get_cpu_type(void)
> +{
> +	return (get_cpu_dev() << 16) | get_cpu_rpn();
> +}
> +
> +void get_soc_name(char name[SOC_NAME_SIZE])
> +{
> +	char *cpu_s, *cpu_r;
> +
> +	/* MPUs Part Numbers */
> +	switch (get_cpu_type()) {
> +	case CPU_STM32MP135Fxx:
> +		cpu_s = "135F";
> +		break;
> +	case CPU_STM32MP135Dxx:
> +		cpu_s = "135D";
> +		break;
> +	case CPU_STM32MP135Cxx:
> +		cpu_s = "135C";
> +		break;
> +	case CPU_STM32MP135Axx:
> +		cpu_s = "135A";
> +		break;
> +	case CPU_STM32MP133Fxx:
> +		cpu_s = "133F";
> +		break;
> +	case CPU_STM32MP133Dxx:
> +		cpu_s = "133D";
> +		break;
> +	case CPU_STM32MP133Cxx:
> +		cpu_s = "133C";
> +		break;
> +	case CPU_STM32MP133Axx:
> +		cpu_s = "133A";
> +		break;
> +	case CPU_STM32MP131Fxx:
> +		cpu_s = "131F";
> +		break;
> +	case CPU_STM32MP131Dxx:
> +		cpu_s = "131D";
> +		break;
> +	case CPU_STM32MP131Cxx:
> +		cpu_s = "131C";
> +		break;
> +	case CPU_STM32MP131Axx:
> +		cpu_s = "131A";
> +		break;
> +	default:
> +		cpu_s = "????";
> +		break;
> +	}
> +
> +	/* REVISION */
> +	switch (get_cpu_rev()) {
> +	case CPU_REV1:
> +		cpu_r = "A";
> +		break;
> +	case CPU_REV1_1:
> +		cpu_r = "Z";
> +		break;
> +	default:
> +		cpu_r = "?";
> +		break;
> +	}
> +
> +	snprintf(name, SOC_NAME_SIZE, "STM32MP%s Rev.%s", cpu_s, cpu_r);
> +}
> diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
> index 89e97aec2b..6ab8f80fa4 100644
> --- a/board/st/stm32mp1/Kconfig
> +++ b/board/st/stm32mp1/Kconfig
> @@ -11,3 +11,18 @@ config SYS_CONFIG_NAME
>  
>  source "board/st/common/Kconfig"
>  endif
> +
> +if TARGET_ST_STM32MP13x
> +
> +config SYS_BOARD
> +	default "stm32mp1"
> +
> +config SYS_VENDOR
> +	default "st"
> +
> +config SYS_CONFIG_NAME
> +	default "stm32mp13_st_common"
> +
> +source "board/st/common/Kconfig"
> +
> +endif
> diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
> index d57a49820e..c9252e90f4 100644
> --- a/board/st/stm32mp1/MAINTAINERS
> +++ b/board/st/stm32mp1/MAINTAINERS
> @@ -9,5 +9,7 @@ F:	board/st/stm32mp1/
>  F:	configs/stm32mp15_defconfig
>  F:	configs/stm32mp15_basic_defconfig
>  F:	configs/stm32mp15_trusted_defconfig
> +F:	include/configs/stm32mp13_common.h
> +F:	include/configs/stm32mp13_st_common.h
>  F:	include/configs/stm32mp15_common.h
>  F:	include/configs/stm32mp15_st_common.h
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index c325e9c55b..8c3ad2d758 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -9,8 +9,8 @@ CONFIG_SPL_TEXT_BASE=0x2FFC2500
>  CONFIG_SPL_MMC=y
>  CONFIG_SPL=y
>  CONFIG_CMD_STM32KEY=y
> -CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_TYPEC_STUSB160X=y
> +CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
>  CONFIG_CMD_STM32PROG=y
>  CONFIG_SPL_SPI_FLASH_SUPPORT=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index b25cb2725b..cf05155ec2 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -7,8 +7,8 @@ CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_DDR_CACHEABLE_SIZE=0x10000000
>  CONFIG_CMD_STM32KEY=y
> -CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_TYPEC_STUSB160X=y
> +CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_ENV_OFFSET_REDUND=0x4C0000
>  CONFIG_CMD_STM32PROG=y
>  # CONFIG_ARMV7_NONSEC is not set
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 89e1b8ad86..db47d8b86b 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -7,9 +7,9 @@ CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_DDR_CACHEABLE_SIZE=0x10000000
>  CONFIG_CMD_STM32KEY=y
> +CONFIG_TYPEC_STUSB160X=y
>  CONFIG_STM32MP15x_STM32IMAGE=y
>  CONFIG_TARGET_ST_STM32MP15x=y
> -CONFIG_TYPEC_STUSB160X=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
>  CONFIG_CMD_STM32PROG=y
>  # CONFIG_ARMV7_NONSEC is not set
> diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
> new file mode 100644
> index 0000000000..acc19f496a
> --- /dev/null
> +++ b/include/configs/stm32mp13_common.h
> @@ -0,0 +1,106 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
> + *
> + * Configuration settings for the STM32MP13x CPU
> + */
> +
> +#ifndef __CONFIG_STM32MP13_COMMMON_H
> +#define __CONFIG_STM32MP13_COMMMON_H
> +#include <linux/sizes.h>
> +#include <asm/arch/stm32.h>
> +
> +/*
> + * Configuration of the external SRAM memory used by U-Boot
> + */
> +#define CONFIG_SYS_SDRAM_BASE		STM32_DDR_BASE
> +#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_TEXT_BASE + SZ_4M)
> +
> +/*
> + * Console I/O buffer size
> + */
> +#define CONFIG_SYS_CBSIZE		SZ_1K
> +
> +/*
> + * For booting Linux, use the first 256 MB of memory, since this is
> + * the maximum mapped by the Linux kernel during initialization.
> + */
> +#define CONFIG_SYS_BOOTMAPSZ		SZ_256M
> +
> +/* Extend size of kernel image for uncompression */
> +#define CONFIG_SYS_BOOTM_LEN		SZ_32M
> +
> +/*MMC SD*/
> +#define CONFIG_SYS_MMC_MAX_DEVICE	2
> +
> +/* NAND support */
> +#define CONFIG_SYS_MAX_NAND_DEVICE	1
> +
> +/*****************************************************************************/
> +#ifdef CONFIG_DISTRO_DEFAULTS
> +/*****************************************************************************/
> +
> +#ifdef CONFIG_CMD_MMC
> +#define BOOT_TARGET_MMC0(func)	func(MMC, mmc, 0)
> +#define BOOT_TARGET_MMC1(func)	func(MMC, mmc, 1)
> +#else
> +#define BOOT_TARGET_MMC0(func)
> +#define BOOT_TARGET_MMC1(func)
> +#endif
> +
> +#define BOOT_TARGET_DEVICES(func)	\
> +	BOOT_TARGET_MMC1(func)		\
> +	BOOT_TARGET_MMC0(func)
> +
> +/*
> + * default bootcmd for stm32mp13:
> + * for mmc boot (eMMC, SD card), distro boot on the same mmc device
> + */
> +#define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
> +	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
> +		"run env_check;" \
> +		"if test ${boot_device} = mmc;" \
> +		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
> +		"run distro_bootcmd;" \
> +	"fi;\0"
> +
> +#define STM32MP_EXTRA \
> +	"env_check=if env info -p -d -q; then env save; fi\0" \
> +	"boot_net_usb_start=true\0"
> +
> +#ifndef STM32MP_BOARD_EXTRA_ENV
> +#define STM32MP_BOARD_EXTRA_ENV
> +#endif
> +
> +#include <config_distro_bootcmd.h>
> +
> +/*
> + * memory layout for 32M uncompressed/compressed kernel,
> + * 1M fdt, 1M script, 1M pxe and 1M for overlay
> + * and the ramdisk at the end.
> + */
> +#define __KERNEL_ADDR_R     __stringify(0xc2000000)
> +#define __FDT_ADDR_R        __stringify(0xc4000000)
> +#define __SCRIPT_ADDR_R     __stringify(0xc4100000)
> +#define __PXEFILE_ADDR_R    __stringify(0xc4200000)
> +#define __FDTOVERLAY_ADDR_R __stringify(0xc4300000)
> +#define __RAMDISK_ADDR_R    __stringify(0xc4400000)
> +
> +#define STM32MP_MEM_LAYOUT \
> +	"kernel_addr_r=" __KERNEL_ADDR_R "\0" \
> +	"fdt_addr_r=" __FDT_ADDR_R "\0" \
> +	"scriptaddr=" __SCRIPT_ADDR_R "\0" \
> +	"pxefile_addr_r=" __PXEFILE_ADDR_R "\0" \
> +	"fdtoverlay_addr_r=" __FDTOVERLAY_ADDR_R "\0" \
> +	"ramdisk_addr_r=" __RAMDISK_ADDR_R "\0"
> +
> +#define CONFIG_EXTRA_ENV_SETTINGS \
> +	STM32MP_MEM_LAYOUT \
> +	STM32MP_BOOTCMD \
> +	BOOTENV \
> +	STM32MP_EXTRA \
> +	STM32MP_BOARD_EXTRA_ENV
> +
> +#endif /* ifdef CONFIG_DISTRO_DEFAULTS*/
> +
> +#endif /* __CONFIG_STM32MP13_COMMMON_H */
> diff --git a/include/configs/stm32mp13_st_common.h b/include/configs/stm32mp13_st_common.h
> new file mode 100644
> index 0000000000..ec64b12f7a
> --- /dev/null
> +++ b/include/configs/stm32mp13_st_common.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
> + *
> + * Configuration settings for the STMicroelectronics STM32MP13x boards
> + */
> +
> +#ifndef __CONFIG_STM32MP13_ST_COMMON_H__
> +#define __CONFIG_STM32MP13_ST_COMMON_H__
> +
> +#define STM32MP_BOARD_EXTRA_ENV \
> +	"usb_pgood_delay=1000\0" \
> +	"console=ttySTM0\0"
> +
> +#include <configs/stm32mp13_common.h>
> +
> +#endif
> diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
> index 6b40cdb017..adfb2898b0 100644
> --- a/include/configs/stm32mp15_common.h
> +++ b/include/configs/stm32mp15_common.h
> @@ -14,7 +14,7 @@
>   * Configuration of the external SRAM memory used by U-Boot
>   */
>  #define CONFIG_SYS_SDRAM_BASE			STM32_DDR_BASE
> -#define CONFIG_SYS_INIT_SP_ADDR			CONFIG_SYS_TEXT_BASE
> +#define CONFIG_SYS_INIT_SP_ADDR		CONFIG_SYS_TEXT_BASE
>  
>  /*
>   * Console I/O buffer size
> @@ -97,7 +97,7 @@
>  	BOOT_TARGET_PXE(func)
>  
>  /*
> - * default bootcmd for stm32mp1:
> + * default bootcmd for stm32mp15:
>   * for serial/usb: execute the stm32prog command
>   * for mmc boot (eMMC, SD card), distro boot on the same mmc device
>   * for nand or spi-nand boot, distro boot with ubifs on UBI partition
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
