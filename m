Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C151F458A9E
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 09:42:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A059C597BE;
	Mon, 22 Nov 2021 08:42:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2A24C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 08:42:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM7jC1M008853;
 Mon, 22 Nov 2021 09:42:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=eJPXN2YjOGQsT5o/YS4Hl/fAnx2tU9hkICu8OfnNdjc=;
 b=vhtSSCGUa3wSomtOAOk1QwudaYLe6LtUGf7aKu4aen/NZv0QRmZGlYjluCJ2RROb5HrE
 Z+HVXjtnXNuzNn4lkQnneJMzj4vI3hQf8lGLYY113Q8wovO5GVC13TFEsmDdVTGajvhQ
 /Q/8W/m/+dVMF9cl7MxdUdaT0XROPwFbvgFXY5NzuMtsN1zXhihOKsxd/g0EBiCJLa20
 xIbzps3ywiX4hAozZUHO3MYCjItfTijtlPZ9rnEs1gL8PWg2tiHy8QyDZwb2VSACZLKY
 e0ybwBI8HpVlg6qR3o8YDSR+R7lpJ3tyNZP+XEZmPGpjV7BoC+1bPBS/B21QYvG70StI yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cg73g0bje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 09:42:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94EAF10002A;
 Mon, 22 Nov 2021 09:42:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B1D121B52D;
 Mon, 22 Nov 2021 09:42:38 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 09:42:37 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
 <20211011075244.3.I99b10df5a77de56b3b37bf8f6e2dfcfd990726cf@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <69fe0120-7957-44d8-93f7-4fb6a1d040ab@foss.st.com>
Date: Mon, 22 Nov 2021 09:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211011075244.3.I99b10df5a77de56b3b37bf8f6e2dfcfd990726cf@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_04,2021-11-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Manuel Reis <mluis.reis@gmail.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 3/4] stm32mp15: replace CONFIG_TFABOOT
	when it is possible
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

On 10/11/21 9:52 AM, Patrick Delaunay wrote:
> In some part of STM32MP15 support the CONFIG_TFABOOT can be replaced
> by other config: CONFIG_ARMV7_PSCI and CONFIG_ARM_SMCCC.
> 
> This patch also simplifies the code in cpu.c, stm32mp1_ram.c and
> clk_stml32mp1.c as execution of U-Boot in sysram (boot without SPL and
> without TFA) is not supported: the associated initialization code is
> present only in SPL.
> 
> This cleanup patch is a preliminary step to support SPL load of OP-TEE
> in secure world, with SPL in secure world and U-Boot in no-secure world.
> 
> Reported-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c        | 10 +++++-----
>  arch/arm/mach-stm32mp/cpu.c         | 20 +++++++-------------
>  board/st/stm32mp1/stm32mp1.c        |  6 +++++-
>  drivers/clk/clk_stm32mp1.c          |  4 +---
>  drivers/ram/stm32mp1/stm32mp1_ram.c | 13 ++++++-------
>  include/configs/stm32mp1.h          |  2 +-
>  6 files changed, 25 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index e517acdd01..27d1829501 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -295,7 +295,7 @@ static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
>  	u32 tmp_data = 0;
>  	int ret;
>  
> -	if (IS_ENABLED(CONFIG_TFABOOT))
> +	if (IS_ENABLED(CONFIG_ARM_SMCCC) && !IS_ENABLED(CONFIG_SPL_BUILD))
>  		return stm32_smc(STM32_SMC_BSEC,
>  				 STM32_SMC_READ_OTP,
>  				 otp, 0, val);
> @@ -326,7 +326,7 @@ static int stm32mp_bsec_read_shadow(struct udevice *dev, u32 *val, u32 otp)
>  {
>  	struct stm32mp_bsec_plat *plat;
>  
> -	if (IS_ENABLED(CONFIG_TFABOOT))
> +	if (IS_ENABLED(CONFIG_ARM_SMCCC) && !IS_ENABLED(CONFIG_SPL_BUILD))
>  		return stm32_smc(STM32_SMC_BSEC,
>  				 STM32_SMC_READ_SHADOW,
>  				 otp, 0, val);
> @@ -350,7 +350,7 @@ static int stm32mp_bsec_write_otp(struct udevice *dev, u32 val, u32 otp)
>  {
>  	struct stm32mp_bsec_plat *plat;
>  
> -	if (IS_ENABLED(CONFIG_TFABOOT))
> +	if (IS_ENABLED(CONFIG_ARM_SMCCC) && !IS_ENABLED(CONFIG_SPL_BUILD))
>  		return stm32_smc_exec(STM32_SMC_BSEC,
>  				      STM32_SMC_PROG_OTP,
>  				      otp, val);
> @@ -365,7 +365,7 @@ static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
>  {
>  	struct stm32mp_bsec_plat *plat;
>  
> -	if (IS_ENABLED(CONFIG_TFABOOT))
> +	if (IS_ENABLED(CONFIG_ARM_SMCCC) && !IS_ENABLED(CONFIG_SPL_BUILD))
>  		return stm32_smc_exec(STM32_SMC_BSEC,
>  				      STM32_SMC_WRITE_SHADOW,
>  				      otp, val);
> @@ -377,7 +377,7 @@ static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
>  
>  static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
>  {
> -	if (!IS_ENABLED(CONFIG_TFABOOT))
> +	if (!IS_ENABLED(CONFIG_ARM_SMCCC) || IS_ENABLED(CONFIG_SPL_BUILD))
>  		return -ENOTSUPP;
>  
>  	if (val == 1)
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 0263ffe96a..7421ea42a1 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -93,8 +93,7 @@ u8 early_tlb[PGTABLE_SIZE] __section(".data") __aligned(0x4000);
>  
>  struct lmb lmb;
>  
> -#if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
> -#ifndef CONFIG_TFABOOT
> +#if defined(CONFIG_SPL_BUILD)
>  static void security_init(void)
>  {
>  	/* Disable the backup domain write protection */
> @@ -154,7 +153,6 @@ static void security_init(void)
>  	writel(BIT(0), RCC_MP_AHB5ENSETR);
>  	writel(0x0, GPIOZ_SECCFGR);
>  }
> -#endif /* CONFIG_TFABOOT */
>  
>  /*
>   * Debug init
> @@ -166,7 +164,7 @@ static void dbgmcu_init(void)
>  	 * done in TF-A for TRUSTED boot and
>  	 * DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE
>  	*/
> -	if (!IS_ENABLED(CONFIG_TFABOOT) && bsec_dbgswenable()) {
> +	if (bsec_dbgswenable()) {
>  		setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
>  		setbits_le32(DBGMCU_APB4FZ1, DBGMCU_APB4FZ1_IWDG2);
>  	}
> @@ -184,10 +182,7 @@ void spl_board_init(void)
>  	if (ret)
>  		log_warning("BSEC probe failed: %d\n", ret);
>  }
> -#endif /* !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD) */
>  
> -#if !defined(CONFIG_TFABOOT) && \
> -	(!defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD))
>  /* get bootmode from ROM code boot context: saved in TAMP register */
>  static void update_bootmode(void)
>  {
> @@ -213,7 +208,7 @@ static void update_bootmode(void)
>  			TAMP_BOOT_MODE_MASK,
>  			boot_mode << TAMP_BOOT_MODE_SHIFT);
>  }
> -#endif
> +#endif /* defined(CONFIG_SPL_BUILD) */
>  
>  u32 get_bootmode(void)
>  {
> @@ -291,11 +286,12 @@ int arch_cpu_init(void)
>  	/* early armv7 timer init: needed for polling */
>  	timer_init();
>  
> -#if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
> -#ifndef CONFIG_TFABOOT
> +#if defined(CONFIG_SPL_BUILD)
>  	security_init();
>  	update_bootmode();
>  #endif
> +/* reset copro state in SPL, when used, or in U-Boot */
> +#if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
>  	/* Reset Coprocessor state unless it wakes up from Standby power mode */
>  	if (!(readl(PWR_MCUCR) & PWR_MCUCR_SBF)) {
>  		writel(TAMP_COPRO_STATE_OFF, TAMP_COPRO_STATE);
> @@ -308,9 +304,7 @@ int arch_cpu_init(void)
>  	if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) &&
>  	    (boot_mode & TAMP_BOOT_DEVICE_MASK) == BOOT_SERIAL_UART)
>  		gd->flags |= GD_FLG_SILENT | GD_FLG_DISABLE_CONSOLE;
> -#if defined(CONFIG_DEBUG_UART) && \
> -	!defined(CONFIG_TFABOOT) && \
> -	(!defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD))
> +#if defined(CONFIG_DEBUG_UART) && defined(CONFIG_SPL_BUILD)
>  	else
>  		debug_uart_init();
>  #endif
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 1d4d7b4b59..9391f483c5 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -664,7 +664,11 @@ int board_init(void)
>  	if (IS_ENABLED(CONFIG_DM_REGULATOR))
>  		regulators_enable_boot_on(_DEBUG);
>  
> -	if (!IS_ENABLED(CONFIG_TFABOOT))
> +	/*
> +	 * sysconf initialisation done only when U-Boot is running in secure
> +	 * done in TF-A for TFABOOT.
> +	 */
> +	if (IS_ENABLED(CONFIG_ARMV7_NONSEC))
>  		sysconf_init();
>  
>  	if (CONFIG_IS_ENABLED(LED))
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index 114192bb32..83ab6b728e 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -27,12 +27,10 @@
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> -#ifndef CONFIG_TFABOOT
> -#if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
> +#if defined(CONFIG_SPL_BUILD)
>  /* activate clock tree initialization in the driver */
>  #define STM32MP1_CLOCK_TREE_INIT
>  #endif
> -#endif
>  
>  #define MAX_HSI_HZ		64000000
>  
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
> index 26f0b4f1ea..98fa1f4f11 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ram.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
> @@ -202,17 +202,16 @@ static int stm32mp1_ddr_probe(struct udevice *dev)
>  
>  	priv->info.base = STM32_DDR_BASE;
>  
> -#if !defined(CONFIG_TFABOOT) && \
> -	(!defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD))
> -	priv->info.size = 0;
> -	ret = stm32mp1_ddr_setup(dev);
> +	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
> +		priv->info.size = 0;
> +		ret = stm32mp1_ddr_setup(dev);
> +
> +		return log_ret(ret);
> +	}
>  
> -	return log_ret(ret);
> -#else
>  	ofnode node = stm32mp1_ddr_get_ofnode(dev);
>  	priv->info.size = ofnode_read_u32_default(node, "st,mem-size", 0);
>  	return 0;
> -#endif
>  }
>  
>  static int stm32mp1_ddr_get_info(struct udevice *dev, struct ram_info *info)
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index 06cd153d13..f5c102a168 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -10,7 +10,7 @@
>  #include <linux/sizes.h>
>  #include <asm/arch/stm32.h>
>  
> -#ifndef CONFIG_TFABOOT
> +#ifdef CONFIG_ARMV7_PSCI
>  /* PSCI support */
>  #define CONFIG_ARMV7_SECURE_BASE		STM32_SYSRAM_BASE
>  #define CONFIG_ARMV7_SECURE_MAX_SIZE		STM32_SYSRAM_SIZE
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
