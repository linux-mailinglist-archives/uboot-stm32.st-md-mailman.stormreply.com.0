Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A719A672
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 09:46:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DED3FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 07:46:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B592CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 07:46:41 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0317hsUu012254; Wed, 1 Apr 2020 09:46:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8BSAio9Jb6bj/PC3YLFmb5qpcFih+3N+6Qhx4V6f0cQ=;
 b=q9SFqedOvnIc/jP+4yc8O8Bm/Kpxl2eHs1DhJvvY7KP/UVKe/69hjpNC5F446AmCYoGP
 JHeKWt1JNDE7ZtLEKGVqWfJ3LCJzYMPWccUsqcSKf5/UBpJtApdtDm6akvyLKrGNc91n
 Trkjsc1zcW0+E9MwGyXxWEWYesHz09sNwFLeN2vEGxfaKhVD9SXV6xApkW/SQzE8T/8w
 MX7iX0R49iyIfni1Zcuk3zZ0Piq7FqkhJSDOP3B1fSAOuKPaUnjYovHAAXZRUUufI40/
 zI4ygXBYcBQvX8Rdi/2AEjPQ+h8hcAr9nfYfsxeL8MTkgGBpCzDfH0I1X/ESaSVVVrfQ Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w813ht8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 09:46:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD8EE100038;
 Wed,  1 Apr 2020 09:46:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D27D82123B3;
 Wed,  1 Apr 2020 09:46:38 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 09:46:38 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 09:46:32 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] configs: stm32mp1: replace STM32MP1_TRUSTED by TFABOOT
Thread-Index: AQHWB/Q4S03xiQjitEy+S/sPOXQYM6hjweGA
Date: Wed, 1 Apr 2020 07:46:32 +0000
Message-ID: <5d26c655-ba93-3e7b-4e94-7c2136b074fe@st.com>
References: <20200401090730.1.I8afbe46ade3ac297f6508f03fbcc643a260f54f7@changeid>
In-Reply-To: <20200401090730.1.I8afbe46ade3ac297f6508f03fbcc643a260f54f7@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <FA74AAAC3358264FBF65DE1118F8FD50@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: replace
	STM32MP1_TRUSTED by TFABOOT
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

On 4/1/20 9:07 AM, Patrick Delaunay wrote:
> Activate ARCH_SUPPORT_TFABOOT and replace the arch stm32mp
> specific config CONFIG_STM32MP1_TRUSTED by the generic CONFIG_TFABOOT
> introduced by the commit 535d76a12150 ("armv8: layerscape: Add TFABOOT
> support").
> This config CONFIG_TFABOOT is activated for the trusted boot chain,
> when U-Boot is loaded by TF-A.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/Kconfig                        |  1 +
>  arch/arm/mach-stm32mp/Kconfig           | 21 ++++++---------------
>  arch/arm/mach-stm32mp/bsec.c            | 18 +++++++++---------
>  arch/arm/mach-stm32mp/cpu.c             | 10 +++++-----
>  board/dhelectronics/dh_stm32mp1/board.c |  4 ++--
>  board/st/stm32mp1/stm32mp1.c            |  4 ++--
>  configs/stm32mp15_optee_defconfig       |  1 +
>  configs/stm32mp15_trusted_defconfig     |  1 +
>  drivers/clk/clk_stm32mp1.c              |  2 +-
>  drivers/ram/stm32mp1/stm32mp1_ram.c     |  2 +-
>  include/configs/stm32mp1.h              |  2 +-
>  11 files changed, 30 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 5d367888d8..54ff4557d4 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1583,6 +1583,7 @@ config ARCH_STI
>  config ARCH_STM32MP
>  	bool "Support STMicroelectronics STM32MP Socs with cortex A"
>  	select ARCH_MISC_INIT
> +	select ARCH_SUPPORT_TFABOOT
>  	select BOARD_LATE_INIT
>  	select CLK
>  	select DM
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index e4d621dee8..e42e9e2e82 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -35,9 +35,10 @@ config ENV_SIZE
>  
>  config STM32MP15x
>  	bool "Support STMicroelectronics STM32MP15x Soc"
> -	select ARCH_SUPPORT_PSCI if !STM32MP1_TRUSTED
> +	select ARCH_SUPPORT_PSCI if !TFABOOT
> +	select ARM_SMCCC if TFABOOT
>  	select CPU_V7A
> -	select CPU_V7_HAS_NONSEC if !STM32MP1_TRUSTED
> +	select CPU_V7_HAS_NONSEC if !TFABOOT
>  	select CPU_V7_HAS_VIRT
>  	select OF_BOARD_SETUP
>  	select PINCTRL_STM32
> @@ -45,8 +46,8 @@ config STM32MP15x
>  	select STM32_RESET
>  	select STM32_SERIAL
>  	select SYS_ARCH_TIMER
> -	imply SYSRESET_PSCI if STM32MP1_TRUSTED
> -	imply SYSRESET_SYSCON if !STM32MP1_TRUSTED
> +	imply SYSRESET_PSCI if TFABOOT
> +	imply SYSRESET_SYSCON if !TFABOOT
>  	help
>  		support of STMicroelectronics SOC STM32MP15x family
>  		STM32MP157, STM32MP153 or STM32MP151
> @@ -83,19 +84,9 @@ config TARGET_DH_STM32MP1_PDK2
>  
>  endchoice
>  
> -config STM32MP1_TRUSTED
> -	bool "Support trusted boot with TF-A"
> -	default y if !SPL
> -	select ARM_SMCCC
> -	help
> -		Say Y here to enable boot with TF-A
> -		Trusted boot chain is :
> -		BootRom => TF-A.stm32 (clock & DDR) => U-Boot.stm32
> -		TF-A monitor provides proprietary SMC to manage secure devices
> -
>  config STM32MP1_OPTEE
>  	bool "Support trusted boot with TF-A and OP-TEE"
> -	depends on STM32MP1_TRUSTED
> +	depends on TFABOOT
>  	default n
>  	help
>  		Say Y here to enable boot with TF-A and OP-TEE
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index 3b923f088e..0d5850b4a9 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -68,7 +68,7 @@ static bool bsec_read_lock(u32 address, u32 otp)
>  	return !!(readl(address + bank) & bit);
>  }
>  
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#ifndef CONFIG_TFABOOT
>  /**
>   * bsec_check_error() - Check status of one otp
>   * @base: base address of bsec IP
> @@ -273,7 +273,7 @@ static int bsec_program_otp(long base, u32 val, u32 otp)
>  
>  	return ret;
>  }
> -#endif /* CONFIG_STM32MP1_TRUSTED */
> +#endif /* CONFIG_TFABOOT */
>  
>  /* BSEC MISC driver *******************************************************/
>  struct stm32mp_bsec_platdata {
> @@ -282,7 +282,7 @@ struct stm32mp_bsec_platdata {
>  
>  static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
>  {
> -#ifdef CONFIG_STM32MP1_TRUSTED
> +#ifdef CONFIG_TFABOOT
>  	return stm32_smc(STM32_SMC_BSEC,
>  			 STM32_SMC_READ_OTP,
>  			 otp, 0, val);
> @@ -313,7 +313,7 @@ static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
>  
>  static int stm32mp_bsec_read_shadow(struct udevice *dev, u32 *val, u32 otp)
>  {
> -#ifdef CONFIG_STM32MP1_TRUSTED
> +#ifdef CONFIG_TFABOOT
>  	return stm32_smc(STM32_SMC_BSEC,
>  			 STM32_SMC_READ_SHADOW,
>  			 otp, 0, val);
> @@ -336,7 +336,7 @@ static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
>  
>  static int stm32mp_bsec_write_otp(struct udevice *dev, u32 val, u32 otp)
>  {
> -#ifdef CONFIG_STM32MP1_TRUSTED
> +#ifdef CONFIG_TFABOOT
>  	return stm32_smc_exec(STM32_SMC_BSEC,
>  			      STM32_SMC_PROG_OTP,
>  			      otp, val);
> @@ -349,7 +349,7 @@ static int stm32mp_bsec_write_otp(struct udevice *dev, u32 val, u32 otp)
>  
>  static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
>  {
> -#ifdef CONFIG_STM32MP1_TRUSTED
> +#ifdef CONFIG_TFABOOT
>  	return stm32_smc_exec(STM32_SMC_BSEC,
>  			      STM32_SMC_WRITE_SHADOW,
>  			      otp, val);
> @@ -362,7 +362,7 @@ static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
>  
>  static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
>  {
> -#ifdef CONFIG_STM32MP1_TRUSTED
> +#ifdef CONFIG_TFABOOT
>  	if (val == 1)
>  		return stm32_smc_exec(STM32_SMC_BSEC,
>  				      STM32_SMC_WRLOCK_OTP,
> @@ -473,7 +473,7 @@ static int stm32mp_bsec_ofdata_to_platdata(struct udevice *dev)
>  	return 0;
>  }
>  
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#ifndef CONFIG_TFABOOT
>  static int stm32mp_bsec_probe(struct udevice *dev)
>  {
>  	int otp;
> @@ -500,7 +500,7 @@ U_BOOT_DRIVER(stm32mp_bsec) = {
>  	.ofdata_to_platdata = stm32mp_bsec_ofdata_to_platdata,
>  	.platdata_auto_alloc_size = sizeof(struct stm32mp_bsec_platdata),
>  	.ops = &stm32mp_bsec_ops,
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#ifndef CONFIG_TFABOOT
>  	.probe = stm32mp_bsec_probe,
>  #endif
>  };
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 9aa5794334..74d03fa7dd 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -76,7 +76,7 @@
>  #define PKG_MASK	GENMASK(2, 0)
>  
>  #if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#ifndef CONFIG_TFABOOT
>  static void security_init(void)
>  {
>  	/* Disable the backup domain write protection */
> @@ -136,7 +136,7 @@ static void security_init(void)
>  	writel(BIT(0), RCC_MP_AHB5ENSETR);
>  	writel(0x0, GPIOZ_SECCFGR);
>  }
> -#endif /* CONFIG_STM32MP1_TRUSTED */
> +#endif /* CONFIG_TFABOOT */
>  
>  /*
>   * Debug init
> @@ -150,7 +150,7 @@ static void dbgmcu_init(void)
>  }
>  #endif /* !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD) */
>  
> -#if !defined(CONFIG_STM32MP1_TRUSTED) && \
> +#if !defined(CONFIG_TFABOOT) && \
>  	(!defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD))
>  /* get bootmode from ROM code boot context: saved in TAMP register */
>  static void update_bootmode(void)
> @@ -198,7 +198,7 @@ int arch_cpu_init(void)
>  
>  #if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
>  	dbgmcu_init();
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#ifndef CONFIG_TFABOOT
>  	security_init();
>  	update_bootmode();
>  #endif
> @@ -214,7 +214,7 @@ int arch_cpu_init(void)
>  	if ((boot_mode & TAMP_BOOT_DEVICE_MASK) == BOOT_SERIAL_UART)
>  		gd->flags |= GD_FLG_SILENT | GD_FLG_DISABLE_CONSOLE;
>  #if defined(CONFIG_DEBUG_UART) && \
> -	!defined(CONFIG_STM32MP1_TRUSTED) && \
> +	!defined(CONFIG_TFABOOT) && \
>  	(!defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD))
>  	else
>  		debug_uart_init();
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index b663696983..c39a4b193c 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -119,7 +119,7 @@ int checkboard(void)
>  
>  	if (IS_ENABLED(CONFIG_STM32MP1_OPTEE))
>  		mode = "trusted with OP-TEE";
> -	else if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
> +	else if (IS_ENABLED(CONFIG_TFABOOT))
>  		mode = "trusted";
>  	else
>  		mode = "basic";
> @@ -284,7 +284,7 @@ static void __maybe_unused led_error_blink(u32 nb_blink)
>  
>  static void sysconf_init(void)
>  {
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#ifndef CONFIG_TFABOOT
>  	u8 *syscfg;
>  #ifdef CONFIG_DM_REGULATOR
>  	struct udevice *pwr_dev;
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 07f5344ec9..6c884028d3 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -92,7 +92,7 @@ int checkboard(void)
>  
>  	if (IS_ENABLED(CONFIG_STM32MP1_OPTEE))
>  		mode = "trusted with OP-TEE";
> -	else if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
> +	else if (IS_ENABLED(TFABOOT))
>  		mode = "trusted";
>  	else
>  		mode = "basic";
> @@ -462,7 +462,7 @@ static int board_check_usb_power(void)
>  
>  static void sysconf_init(void)
>  {
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#ifndef CONFIG_TFABOOT
>  	u8 *syscfg;
>  #ifdef CONFIG_DM_REGULATOR
>  	struct udevice *pwr_dev;
> diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
> index 298611776d..6c17bd9b20 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -1,5 +1,6 @@
>  CONFIG_ARM=y
>  CONFIG_ARCH_STM32MP=y
> +CONFIG_TFABOOT=y
>  CONFIG_SYS_MALLOC_F_LEN=0x3000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_ENV_OFFSET=0x280000
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 6928e9a65c..7592f6fcc4 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -1,5 +1,6 @@
>  CONFIG_ARM=y
>  CONFIG_ARCH_STM32MP=y
> +CONFIG_TFABOOT=y
>  CONFIG_SYS_MALLOC_F_LEN=0x3000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_ENV_OFFSET=0x280000
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index 52bd8e96f3..50df8425bf 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -19,7 +19,7 @@
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#ifndef CONFIG_TFABOOT
>  #if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
>  /* activate clock tree initialization in the driver */
>  #define STM32MP1_CLOCK_TREE_INIT
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
> index b1e593f86b..7b1adc5b24 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ram.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
> @@ -177,7 +177,7 @@ static int stm32mp1_ddr_probe(struct udevice *dev)
>  
>  	priv->info.base = STM32_DDR_BASE;
>  
> -#if !defined(CONFIG_STM32MP1_TRUSTED) && \
> +#if !defined(CONFIG_TFABOOT) && \
>  	(!defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD))
>  	priv->info.size = 0;
>  	return stm32mp1_ddr_setup(dev);
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index 42717c167e..2ba4fb1305 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -10,7 +10,7 @@
>  #include <linux/sizes.h>
>  #include <asm/arch/stm32.h>
>  
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#ifndef CONFIG_TFABOOT
>  /* PSCI support */
>  #define CONFIG_ARMV7_PSCI_1_0
>  #define CONFIG_ARMV7_SECURE_BASE		STM32_SYSRAM_BASE

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
