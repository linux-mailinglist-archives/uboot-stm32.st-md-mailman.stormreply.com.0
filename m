Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 626FB52E513
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A2D4C56630;
	Fri, 20 May 2022 06:33:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2749BC5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:33:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K6OGSF008866;
 Fri, 20 May 2022 08:32:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+xQG/Ia/4oVqcZvpECB3LkGKDkM/26lYYZIWyEvn4C4=;
 b=WK4Kcl63DGW426FrKR3Su4kD5hy75MOQu+Xg38AjqJXA44oocLLiLht2OYW8TDL6/LB+
 p+mT+5iByG2KVKIKDMDhZ7walEIFt5O21F7QziLM36rPkefGdvDwMjv/OCAAHCuDi6GB
 /7rJZXncwAVnEdpz9Dg+3Wem43xWu5fXB2Co8bJ82FseQD323Lq3K9kjJdWHmHMn4uwi
 RWh0/fQOhHMmtTbNdu8w1310XV6tZYADF8Li7uoFwSfEiLUTyv/mLSKgaLl5jqHjqoVj
 sqjXMyshU/GTRgU6z9iUw1qoC6OfqIOTEm1G04hD9LkFR+hQ730pDnHYbeBp8689QEy+ UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9egaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:32:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6D4210002A;
 Fri, 20 May 2022 08:32:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDACC211F15;
 Fri, 20 May 2022 08:32:56 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:32:56 +0200
Message-ID: <87b4ee42-d527-2120-4d6c-8258d95aa305@foss.st.com>
Date: Fri, 20 May 2022 08:32:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.4.Ia90133663740dcf00ee2799a01f92f2acee683da@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.4.Ia90133663740dcf00ee2799a01f92f2acee683da@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 04/16] arm: stm32mp: move code for
	STM32MP15x
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
> Move code and defines only needed for CONFIG_STM32MP15x in stm32mp15x.c
> when low level init without TFABOOT is supported.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/Makefile                |   2 +
>  arch/arm/mach-stm32mp/cpu.c                   | 331 +----------------
>  arch/arm/mach-stm32mp/fdt.c                   |   8 +-
>  .../arm/mach-stm32mp/include/mach/sys_proto.h |  14 +-
>  arch/arm/mach-stm32mp/spl.c                   |   1 +
>  arch/arm/mach-stm32mp/stm32mp15x.c            | 345 ++++++++++++++++++
>  6 files changed, 377 insertions(+), 324 deletions(-)
>  create mode 100644 arch/arm/mach-stm32mp/stm32mp15x.c
> 
> diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
> index 391b47cf13..d362104fee 100644
> --- a/arch/arm/mach-stm32mp/Makefile
> +++ b/arch/arm/mach-stm32mp/Makefile
> @@ -8,6 +8,8 @@ obj-y += dram_init.o
>  obj-y += syscon.o
>  obj-y += bsec.o
>  
> +obj-$(CONFIG_STM32MP15x) += stm32mp15x.o
> +
>  ifdef CONFIG_SPL_BUILD
>  obj-y += spl.o
>  obj-y += tzc400.o
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 6f44c75515..b808964d3e 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -16,7 +16,6 @@
>  #include <misc.h>
>  #include <net.h>
>  #include <asm/io.h>
> -#include <asm/arch/bsec.h>
>  #include <asm/arch/stm32.h>
>  #include <asm/arch/sys_proto.h>
>  #include <asm/global_data.h>
> @@ -24,67 +23,6 @@
>  #include <dm/uclass.h>
>  #include <linux/bitops.h>
>  
> -/* RCC register */
> -#define RCC_TZCR		(STM32_RCC_BASE + 0x00)
> -#define RCC_DBGCFGR		(STM32_RCC_BASE + 0x080C)
> -#define RCC_BDCR		(STM32_RCC_BASE + 0x0140)
> -#define RCC_MP_APB5ENSETR	(STM32_RCC_BASE + 0x0208)
> -#define RCC_MP_AHB5ENSETR	(STM32_RCC_BASE + 0x0210)
> -#define RCC_BDCR_VSWRST		BIT(31)
> -#define RCC_BDCR_RTCSRC		GENMASK(17, 16)
> -#define RCC_DBGCFGR_DBGCKEN	BIT(8)
> -
> -/* Security register */
> -#define ETZPC_TZMA1_SIZE	(STM32_ETZPC_BASE + 0x04)
> -#define ETZPC_DECPROT0		(STM32_ETZPC_BASE + 0x10)
> -
> -#define TZC_GATE_KEEPER		(STM32_TZC_BASE + 0x008)
> -#define TZC_REGION_ATTRIBUTE0	(STM32_TZC_BASE + 0x110)
> -#define TZC_REGION_ID_ACCESS0	(STM32_TZC_BASE + 0x114)
> -
> -#define TAMP_CR1		(STM32_TAMP_BASE + 0x00)
> -
> -#define PWR_CR1			(STM32_PWR_BASE + 0x00)
> -#define PWR_MCUCR		(STM32_PWR_BASE + 0x14)
> -#define PWR_CR1_DBP		BIT(8)
> -#define PWR_MCUCR_SBF		BIT(6)
> -
> -/* DBGMCU register */
> -#define DBGMCU_IDC		(STM32_DBGMCU_BASE + 0x00)
> -#define DBGMCU_APB4FZ1		(STM32_DBGMCU_BASE + 0x2C)
> -#define DBGMCU_APB4FZ1_IWDG2	BIT(2)
> -#define DBGMCU_IDC_DEV_ID_MASK	GENMASK(11, 0)
> -#define DBGMCU_IDC_DEV_ID_SHIFT	0
> -#define DBGMCU_IDC_REV_ID_MASK	GENMASK(31, 16)
> -#define DBGMCU_IDC_REV_ID_SHIFT	16
> -
> -/* GPIOZ registers */
> -#define GPIOZ_SECCFGR		0x54004030
> -
> -/* boot interface from Bootrom
> - * - boot instance = bit 31:16
> - * - boot device = bit 15:0
> - */
> -#define BOOTROM_PARAM_ADDR	0x2FFC0078
> -#define BOOTROM_MODE_MASK	GENMASK(15, 0)
> -#define BOOTROM_MODE_SHIFT	0
> -#define BOOTROM_INSTANCE_MASK	 GENMASK(31, 16)
> -#define BOOTROM_INSTANCE_SHIFT	16
> -
> -/* Device Part Number (RPN) = OTP_DATA1 lower 8 bits */
> -#define RPN_SHIFT	0
> -#define RPN_MASK	GENMASK(7, 0)
> -
> -/* Package = bit 27:29 of OTP16
> - * - 100: LBGA448 (FFI) => AA = LFBGA 18x18mm 448 balls p. 0.8mm
> - * - 011: LBGA354 (LCI) => AB = LFBGA 16x16mm 359 balls p. 0.8mm
> - * - 010: TFBGA361 (FFC) => AC = TFBGA 12x12mm 361 balls p. 0.5mm
> - * - 001: TFBGA257 (LCC) => AD = TFBGA 10x10mm 257 balls p. 0.5mm
> - * - others: Reserved
> - */
> -#define PKG_SHIFT	27
> -#define PKG_MASK	GENMASK(2, 0)
> -
>  /*
>   * early TLB into the .data section so that it not get cleared
>   * with 16kB allignment (see TTBR0_BASE_ADDR_MASK)
> @@ -93,121 +31,6 @@ u8 early_tlb[PGTABLE_SIZE] __section(".data") __aligned(0x4000);
>  
>  struct lmb lmb;
>  
> -static void security_init(void)
> -{
> -	/* Disable the backup domain write protection */
> -	/* the protection is enable at each reset by hardware */
> -	/* And must be disable by software */
> -	setbits_le32(PWR_CR1, PWR_CR1_DBP);
> -
> -	while (!(readl(PWR_CR1) & PWR_CR1_DBP))
> -		;
> -
> -	/* If RTC clock isn't enable so this is a cold boot then we need
> -	 * to reset the backup domain
> -	 */
> -	if (!(readl(RCC_BDCR) & RCC_BDCR_RTCSRC)) {
> -		setbits_le32(RCC_BDCR, RCC_BDCR_VSWRST);
> -		while (!(readl(RCC_BDCR) & RCC_BDCR_VSWRST))
> -			;
> -		clrbits_le32(RCC_BDCR, RCC_BDCR_VSWRST);
> -	}
> -
> -	/* allow non secure access in Write/Read for all peripheral */
> -	writel(GENMASK(25, 0), ETZPC_DECPROT0);
> -
> -	/* Open SYSRAM for no secure access */
> -	writel(0x0, ETZPC_TZMA1_SIZE);
> -
> -	/* enable TZC1 TZC2 clock */
> -	writel(BIT(11) | BIT(12), RCC_MP_APB5ENSETR);
> -
> -	/* Region 0 set to no access by default */
> -	/* bit 0 / 16 => nsaid0 read/write Enable
> -	 * bit 1 / 17 => nsaid1 read/write Enable
> -	 * ...
> -	 * bit 15 / 31 => nsaid15 read/write Enable
> -	 */
> -	writel(0xFFFFFFFF, TZC_REGION_ID_ACCESS0);
> -	/* bit 30 / 31 => Secure Global Enable : write/read */
> -	/* bit 0 / 1 => Region Enable for filter 0/1 */
> -	writel(BIT(0) | BIT(1) | BIT(30) | BIT(31), TZC_REGION_ATTRIBUTE0);
> -
> -	/* Enable Filter 0 and 1 */
> -	setbits_le32(TZC_GATE_KEEPER, BIT(0) | BIT(1));
> -
> -	/* RCC trust zone deactivated */
> -	writel(0x0, RCC_TZCR);
> -
> -	/* TAMP: deactivate the internal tamper
> -	 * Bit 23 ITAMP8E: monotonic counter overflow
> -	 * Bit 20 ITAMP5E: RTC calendar overflow
> -	 * Bit 19 ITAMP4E: HSE monitoring
> -	 * Bit 18 ITAMP3E: LSE monitoring
> -	 * Bit 16 ITAMP1E: RTC power domain supply monitoring
> -	 */
> -	writel(0x0, TAMP_CR1);
> -
> -	/* GPIOZ: deactivate the security */
> -	writel(BIT(0), RCC_MP_AHB5ENSETR);
> -	writel(0x0, GPIOZ_SECCFGR);
> -}
> -
> -/*
> - * Debug init
> - */
> -static void dbgmcu_init(void)
> -{
> -	/*
> -	 * Freeze IWDG2 if Cortex-A7 is in debug mode
> -	 * done in TF-A for TRUSTED boot and
> -	 * DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE
> -	*/
> -	if (bsec_dbgswenable()) {
> -		setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
> -		setbits_le32(DBGMCU_APB4FZ1, DBGMCU_APB4FZ1_IWDG2);
> -	}
> -}
> -
> -void spl_board_init(void)
> -{
> -	struct udevice *dev;
> -	int ret;
> -
> -	dbgmcu_init();
> -
> -	/* force probe of BSEC driver to shadow the upper OTP */
> -	ret = uclass_get_device_by_driver(UCLASS_MISC, DM_DRIVER_GET(stm32mp_bsec), &dev);
> -	if (ret)
> -		log_warning("BSEC probe failed: %d\n", ret);
> -}
> -
> -/* get bootmode from ROM code boot context: saved in TAMP register */
> -static void update_bootmode(void)
> -{
> -	u32 boot_mode;
> -	u32 bootrom_itf = readl(BOOTROM_PARAM_ADDR);
> -	u32 bootrom_device, bootrom_instance;
> -
> -	/* enable TAMP clock = RTCAPBEN */
> -	writel(BIT(8), RCC_MP_APB5ENSETR);
> -
> -	/* read bootrom context */
> -	bootrom_device =
> -		(bootrom_itf & BOOTROM_MODE_MASK) >> BOOTROM_MODE_SHIFT;
> -	bootrom_instance =
> -		(bootrom_itf & BOOTROM_INSTANCE_MASK) >> BOOTROM_INSTANCE_SHIFT;
> -	boot_mode =
> -		((bootrom_device << BOOT_TYPE_SHIFT) & BOOT_TYPE_MASK) |
> -		((bootrom_instance << BOOT_INSTANCE_SHIFT) &
> -		 BOOT_INSTANCE_MASK);
> -
> -	/* save the boot mode in TAMP backup register */
> -	clrsetbits_le32(TAMP_BOOT_CONTEXT,
> -			TAMP_BOOT_MODE_MASK,
> -			boot_mode << TAMP_BOOT_MODE_SHIFT);
> -}
> -
>  u32 get_bootmode(void)
>  {
>  	/* read bootmode from TAMP backup register */
> @@ -277,25 +100,24 @@ static void early_enable_caches(void)
>   */
>  int arch_cpu_init(void)
>  {
> -	u32 boot_mode;
> -
>  	early_enable_caches();
>  
>  	/* early armv7 timer init: needed for polling */
>  	timer_init();
>  
> -	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
> -		security_init();
> -		update_bootmode();
> -	}
> -/* reset copro state in SPL, when used, or in U-Boot */
> -	if (!IS_ENABLED(CONFIG_SPL) || IS_ENABLED(CONFIG_SPL_BUILD)) {
> -		/* Reset Coprocessor state unless it wakes up from Standby power mode */
> -		if (!(readl(PWR_MCUCR) & PWR_MCUCR_SBF)) {
> -			writel(TAMP_COPRO_STATE_OFF, TAMP_COPRO_STATE);
> -			writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
> -		}
> -	}
> +	return 0;
> +}
> +
> +/* weak function for SOC specific initialization */
> +__weak void stm32mp_cpu_init(void)
> +{
> +}
> +
> +int mach_cpu_init(void)
> +{
> +	u32 boot_mode;
> +
> +	stm32mp_cpu_init();
>  
>  	boot_mode = get_bootmode();
>  
> @@ -324,122 +146,6 @@ void enable_caches(void)
>  	dcache_enable();
>  }
>  
> -static u32 read_idc(void)
> -{
> -	/* DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE */
> -	if (bsec_dbgswenable()) {
> -		setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
> -
> -		return readl(DBGMCU_IDC);
> -	}
> -
> -	if (CONFIG_IS_ENABLED(STM32MP15x))
> -		return CPU_DEV_STM32MP15; /* STM32MP15x and unknown revision */
> -	else
> -		return 0x0;
> -}
> -
> -u32 get_cpu_dev(void)
> -{
> -	return (read_idc() & DBGMCU_IDC_DEV_ID_MASK) >> DBGMCU_IDC_DEV_ID_SHIFT;
> -}
> -
> -u32 get_cpu_rev(void)
> -{
> -	return (read_idc() & DBGMCU_IDC_REV_ID_MASK) >> DBGMCU_IDC_REV_ID_SHIFT;
> -}
> -
> -/* Get Device Part Number (RPN) from OTP */
> -static u32 get_cpu_rpn(void)
> -{
> -	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
> -}
> -
> -u32 get_cpu_type(void)
> -{
> -	return (get_cpu_dev() << 16) | get_cpu_rpn();
> -}
> -
> -/* Get Package options from OTP */
> -u32 get_cpu_package(void)
> -{
> -	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
> -}
> -
> -static const char * const soc_type[] = {
> -	"????",
> -	"151C", "151A", "151F", "151D",
> -	"153C", "153A", "153F", "153D",
> -	"157C", "157A", "157F", "157D"
> -};
> -
> -static const char * const soc_pkg[] = { "??", "AD", "AC", "AB", "AA" };
> -static const char * const soc_rev[] = { "?", "A", "B", "Z" };
> -
> -static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
> -				   unsigned int *rev)
> -{
> -	u32 cpu_type = get_cpu_type();
> -	u32 ct = cpu_type & ~(BIT(7) | BIT(0));
> -	u32 cm = ((cpu_type & BIT(7)) >> 6) | (cpu_type & BIT(0));
> -	u32 cp = get_cpu_package();
> -
> -	/* Bits 0 and 7 are the ACDF, 00:C 01:A 10:F 11:D */
> -	switch (ct) {
> -	case CPU_STM32MP151Cxx:
> -		*type = cm + 1;
> -		break;
> -	case CPU_STM32MP153Cxx:
> -		*type = cm + 5;
> -		break;
> -	case CPU_STM32MP157Cxx:
> -		*type = cm + 9;
> -		break;
> -	default:
> -		*type = 0;
> -		break;
> -	}
> -
> -	/* Package */
> -	switch (cp) {
> -	case PKG_AA_LBGA448:
> -	case PKG_AB_LBGA354:
> -	case PKG_AC_TFBGA361:
> -	case PKG_AD_TFBGA257:
> -		*pkg = cp;
> -		break;
> -	default:
> -		*pkg = 0;
> -		break;
> -	}
> -
> -	/* Revision */
> -	switch (get_cpu_rev()) {
> -	case CPU_REV1:
> -		*rev = 1;
> -		break;
> -	case CPU_REV2:
> -		*rev = 2;
> -		break;
> -	case CPU_REV2_1:
> -		*rev = 3;
> -		break;
> -	default:
> -		*rev = 0;
> -		break;
> -	}
> -}
> -
> -void get_soc_name(char name[SOC_NAME_SIZE])
> -{
> -	unsigned int type, pkg, rev;
> -
> -	get_cpu_string_offsets(&type, &pkg, &rev);
> -
> -	snprintf(name, SOC_NAME_SIZE, "STM32MP%s%s Rev.%s",
> -		 soc_type[type], soc_pkg[pkg], soc_rev[rev]);
> -}
> -
>  /* used when CONFIG_DISPLAY_CPUINFO is activated */
>  int print_cpuinfo(void)
>  {
> @@ -645,15 +351,8 @@ static int setup_serial_number(void)
>  	return 0;
>  }
>  
> -static void setup_soc_type_pkg_rev(void)
> +__weak void stm32mp_misc_init(void)
>  {
> -	unsigned int type, pkg, rev;
> -
> -	get_cpu_string_offsets(&type, &pkg, &rev);
> -
> -	env_set("soc_type", soc_type[type]);
> -	env_set("soc_pkg", soc_pkg[pkg]);
> -	env_set("soc_rev", soc_rev[rev]);
>  }
>  
>  int arch_misc_init(void)
> @@ -661,7 +360,7 @@ int arch_misc_init(void)
>  	setup_boot_mode();
>  	setup_mac_address();
>  	setup_serial_number();
> -	setup_soc_type_pkg_rev();
> +	stm32mp_misc_init();
>  
>  	return 0;
>  }
> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
> index 91330a68a4..969e7d94e9 100644
> --- a/arch/arm/mach-stm32mp/fdt.c
> +++ b/arch/arm/mach-stm32mp/fdt.c
> @@ -309,16 +309,16 @@ int ft_system_setup(void *blob, struct bd_info *bd)
>  	}
>  
>  	switch (get_cpu_package()) {
> -	case PKG_AA_LBGA448:
> +	case STM32MP15_PKG_AA_LBGA448:
>  		pkg = STM32MP_PKG_AA;
>  		break;
> -	case PKG_AB_LBGA354:
> +	case STM32MP15_PKG_AB_LBGA354:
>  		pkg = STM32MP_PKG_AB;
>  		break;
> -	case PKG_AC_TFBGA361:
> +	case STM32MP15_PKG_AC_TFBGA361:
>  		pkg = STM32MP_PKG_AC;
>  		break;
> -	case PKG_AD_TFBGA257:
> +	case STM32MP15_PKG_AD_TFBGA257:
>  		pkg = STM32MP_PKG_AD;
>  		break;
>  	default:
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index dc98f0c5a4..8b61135aeb 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -36,10 +36,12 @@ u32 get_cpu_rev(void);
>  /* Get Package options from OTP */
>  u32 get_cpu_package(void);
>  
> -#define PKG_AA_LBGA448	4
> -#define PKG_AB_LBGA354	3
> -#define PKG_AC_TFBGA361	2
> -#define PKG_AD_TFBGA257	1
> +/* package used for STM32MP15x */
> +#define STM32MP15_PKG_AA_LBGA448	4
> +#define STM32MP15_PKG_AB_LBGA354	3
> +#define STM32MP15_PKG_AC_TFBGA361	2
> +#define STM32MP15_PKG_AD_TFBGA257	1
> +#define STM32MP15_PKG_UNKNOWN		0
>  
>  /* Get SOC name */
>  #define SOC_NAME_SIZE 20
> @@ -53,5 +55,9 @@ int setup_mac_address(void);
>  /* board power management : configure vddcore according OPP */
>  void board_vddcore_init(u32 voltage_mv);
>  
> +/* weak function */
> +void stm32mp_cpu_init(void);
> +void stm32mp_misc_init(void);
> +
>  /* helper function: read data from OTP */
>  u32 get_otp(int index, int shift, int mask);
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index 78fa9d7edd..19d9fe04e0 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -190,6 +190,7 @@ void board_init_f(ulong dummy)
>  	int ret;
>  
>  	arch_cpu_init();
> +	mach_cpu_init();
>  
>  	ret = spl_early_init();
>  	if (ret) {
> diff --git a/arch/arm/mach-stm32mp/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp15x.c
> new file mode 100644
> index 0000000000..800fad2f43
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/stm32mp15x.c
> @@ -0,0 +1,345 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright (C) 2021, STMicroelectronics - All Rights Reserved
> + */
> +
> +#define LOG_CATEGORY LOGC_ARCH
> +
> +#include <common.h>
> +#include <env.h>
> +#include <log.h>
> +#include <asm/io.h>
> +#include <asm/arch/bsec.h>
> +#include <asm/arch/stm32.h>
> +#include <asm/arch/sys_proto.h>
> +#include <dm/device.h>
> +#include <dm/uclass.h>
> +
> +/* RCC register */
> +#define RCC_TZCR		(STM32_RCC_BASE + 0x00)
> +#define RCC_BDCR		(STM32_RCC_BASE + 0x0140)
> +#define RCC_MP_APB5ENSETR	(STM32_RCC_BASE + 0x0208)
> +#define RCC_MP_AHB5ENSETR	(STM32_RCC_BASE + 0x0210)
> +#define RCC_DBGCFGR		(STM32_RCC_BASE + 0x080C)
> +
> +#define RCC_BDCR_VSWRST		BIT(31)
> +#define RCC_BDCR_RTCSRC		GENMASK(17, 16)
> +
> +#define RCC_DBGCFGR_DBGCKEN	BIT(8)
> +
> +/* DBGMCU register */
> +#define DBGMCU_IDC		(STM32_DBGMCU_BASE + 0x00)
> +#define DBGMCU_APB4FZ1		(STM32_DBGMCU_BASE + 0x2C)
> +#define DBGMCU_APB4FZ1_IWDG2	BIT(2)
> +
> +/* Security register */
> +#define ETZPC_TZMA1_SIZE	(STM32_ETZPC_BASE + 0x04)
> +#define ETZPC_DECPROT0		(STM32_ETZPC_BASE + 0x10)
> +
> +#define TZC_GATE_KEEPER		(STM32_TZC_BASE + 0x008)
> +#define TZC_REGION_ATTRIBUTE0	(STM32_TZC_BASE + 0x110)
> +#define TZC_REGION_ID_ACCESS0	(STM32_TZC_BASE + 0x114)
> +
> +#define TAMP_CR1		(STM32_TAMP_BASE + 0x00)
> +
> +#define PWR_CR1			(STM32_PWR_BASE + 0x00)
> +#define PWR_MCUCR		(STM32_PWR_BASE + 0x14)
> +#define PWR_CR1_DBP		BIT(8)
> +#define PWR_MCUCR_SBF		BIT(6)
> +
> +/* GPIOZ registers */
> +#define GPIOZ_SECCFGR		0x54004030
> +
> +/* DBGMCU register */
> +#define DBGMCU_IDC		(STM32_DBGMCU_BASE + 0x00)
> +#define DBGMCU_IDC_DEV_ID_MASK	GENMASK(11, 0)
> +#define DBGMCU_IDC_DEV_ID_SHIFT	0
> +#define DBGMCU_IDC_REV_ID_MASK	GENMASK(31, 16)
> +#define DBGMCU_IDC_REV_ID_SHIFT	16
> +
> +/* boot interface from Bootrom
> + * - boot instance = bit 31:16
> + * - boot device = bit 15:0
> + */
> +#define BOOTROM_PARAM_ADDR	0x2FFC0078
> +#define BOOTROM_MODE_MASK	GENMASK(15, 0)
> +#define BOOTROM_MODE_SHIFT	0
> +#define BOOTROM_INSTANCE_MASK	 GENMASK(31, 16)
> +#define BOOTROM_INSTANCE_SHIFT	16
> +
> +/* Device Part Number (RPN) = OTP_DATA1 lower 8 bits */
> +#define RPN_SHIFT	0
> +#define RPN_MASK	GENMASK(7, 0)
> +
> +/* Package = bit 27:29 of OTP16 => STM32MP15_PKG defines
> + * - 100: LBGA448 (FFI) => AA = LFBGA 18x18mm 448 balls p. 0.8mm
> + * - 011: LBGA354 (LCI) => AB = LFBGA 16x16mm 359 balls p. 0.8mm
> + * - 010: TFBGA361 (FFC) => AC = TFBGA 12x12mm 361 balls p. 0.5mm
> + * - 001: TFBGA257 (LCC) => AD = TFBGA 10x10mm 257 balls p. 0.5mm
> + * - others: Reserved
> + */
> +#define PKG_SHIFT	27
> +#define PKG_MASK	GENMASK(2, 0)
> +
> +static void security_init(void)
> +{
> +	/* Disable the backup domain write protection */
> +	/* the protection is enable at each reset by hardware */
> +	/* And must be disable by software */
> +	setbits_le32(PWR_CR1, PWR_CR1_DBP);
> +
> +	while (!(readl(PWR_CR1) & PWR_CR1_DBP))
> +		;
> +
> +	/* If RTC clock isn't enable so this is a cold boot then we need
> +	 * to reset the backup domain
> +	 */
> +	if (!(readl(RCC_BDCR) & RCC_BDCR_RTCSRC)) {
> +		setbits_le32(RCC_BDCR, RCC_BDCR_VSWRST);
> +		while (!(readl(RCC_BDCR) & RCC_BDCR_VSWRST))
> +			;
> +		clrbits_le32(RCC_BDCR, RCC_BDCR_VSWRST);
> +	}
> +
> +	/* allow non secure access in Write/Read for all peripheral */
> +	writel(GENMASK(25, 0), ETZPC_DECPROT0);
> +
> +	/* Open SYSRAM for no secure access */
> +	writel(0x0, ETZPC_TZMA1_SIZE);
> +
> +	/* enable TZC1 TZC2 clock */
> +	writel(BIT(11) | BIT(12), RCC_MP_APB5ENSETR);
> +
> +	/* Region 0 set to no access by default */
> +	/* bit 0 / 16 => nsaid0 read/write Enable
> +	 * bit 1 / 17 => nsaid1 read/write Enable
> +	 * ...
> +	 * bit 15 / 31 => nsaid15 read/write Enable
> +	 */
> +	writel(0xFFFFFFFF, TZC_REGION_ID_ACCESS0);
> +	/* bit 30 / 31 => Secure Global Enable : write/read */
> +	/* bit 0 / 1 => Region Enable for filter 0/1 */
> +	writel(BIT(0) | BIT(1) | BIT(30) | BIT(31), TZC_REGION_ATTRIBUTE0);
> +
> +	/* Enable Filter 0 and 1 */
> +	setbits_le32(TZC_GATE_KEEPER, BIT(0) | BIT(1));
> +
> +	/* RCC trust zone deactivated */
> +	writel(0x0, RCC_TZCR);
> +
> +	/* TAMP: deactivate the internal tamper
> +	 * Bit 23 ITAMP8E: monotonic counter overflow
> +	 * Bit 20 ITAMP5E: RTC calendar overflow
> +	 * Bit 19 ITAMP4E: HSE monitoring
> +	 * Bit 18 ITAMP3E: LSE monitoring
> +	 * Bit 16 ITAMP1E: RTC power domain supply monitoring
> +	 */
> +	writel(0x0, TAMP_CR1);
> +
> +	/* GPIOZ: deactivate the security */
> +	writel(BIT(0), RCC_MP_AHB5ENSETR);
> +	writel(0x0, GPIOZ_SECCFGR);
> +}
> +
> +/*
> + * Debug init
> + */
> +void dbgmcu_init(void)
> +{
> +	/*
> +	 * Freeze IWDG2 if Cortex-A7 is in debug mode
> +	 * done in TF-A for TRUSTED boot and
> +	 * DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE
> +	 */
> +	if (bsec_dbgswenable()) {
> +		setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
> +		setbits_le32(DBGMCU_APB4FZ1, DBGMCU_APB4FZ1_IWDG2);
> +	}
> +}
> +
> +void spl_board_init(void)
> +{
> +	struct udevice *dev;
> +	int ret;
> +
> +	dbgmcu_init();
> +
> +	/* force probe of BSEC driver to shadow the upper OTP */
> +	ret = uclass_get_device_by_driver(UCLASS_MISC, DM_DRIVER_GET(stm32mp_bsec), &dev);
> +	if (ret)
> +		log_warning("BSEC probe failed: %d\n", ret);
> +}
> +
> +/* get bootmode from ROM code boot context: saved in TAMP register */
> +static void update_bootmode(void)
> +{
> +	u32 boot_mode;
> +	u32 bootrom_itf = readl(BOOTROM_PARAM_ADDR);
> +	u32 bootrom_device, bootrom_instance;
> +
> +	/* enable TAMP clock = RTCAPBEN */
> +	writel(BIT(8), RCC_MP_APB5ENSETR);
> +
> +	/* read bootrom context */
> +	bootrom_device =
> +		(bootrom_itf & BOOTROM_MODE_MASK) >> BOOTROM_MODE_SHIFT;
> +	bootrom_instance =
> +		(bootrom_itf & BOOTROM_INSTANCE_MASK) >> BOOTROM_INSTANCE_SHIFT;
> +	boot_mode =
> +		((bootrom_device << BOOT_TYPE_SHIFT) & BOOT_TYPE_MASK) |
> +		((bootrom_instance << BOOT_INSTANCE_SHIFT) &
> +		 BOOT_INSTANCE_MASK);
> +
> +	/* save the boot mode in TAMP backup register */
> +	clrsetbits_le32(TAMP_BOOT_CONTEXT,
> +			TAMP_BOOT_MODE_MASK,
> +			boot_mode << TAMP_BOOT_MODE_SHIFT);
> +}
> +
> +/* weak function: STM32MP15x mach init for boot without TFA */
> +void stm32mp_cpu_init(void)
> +{
> +	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
> +		security_init();
> +		update_bootmode();
> +	}
> +
> +	/* reset copro state in SPL, when used, or in U-Boot */
> +	if (!IS_ENABLED(CONFIG_SPL) || IS_ENABLED(CONFIG_SPL_BUILD)) {
> +		/* Reset Coprocessor state unless it wakes up from Standby power mode */
> +		if (!(readl(PWR_MCUCR) & PWR_MCUCR_SBF)) {
> +			writel(TAMP_COPRO_STATE_OFF, TAMP_COPRO_STATE);
> +			writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
> +		}
> +	}
> +}
> +
> +static u32 read_idc(void)
> +{
> +	/* DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE */
> +	if (bsec_dbgswenable()) {
> +		setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
> +
> +		return readl(DBGMCU_IDC);
> +	}
> +
> +	return CPU_DEV_STM32MP15; /* STM32MP15x and unknown revision */
> +}
> +
> +u32 get_cpu_dev(void)
> +{
> +	return (read_idc() & DBGMCU_IDC_DEV_ID_MASK) >> DBGMCU_IDC_DEV_ID_SHIFT;
> +}
> +
> +u32 get_cpu_rev(void)
> +{
> +	return (read_idc() & DBGMCU_IDC_REV_ID_MASK) >> DBGMCU_IDC_REV_ID_SHIFT;
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
> +/* Get Package options from OTP */
> +u32 get_cpu_package(void)
> +{
> +	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
> +}
> +
> +static const char * const soc_type[] = {
> +	"????",
> +	"151C", "151A", "151F", "151D",
> +	"153C", "153A", "153F", "153D",
> +	"157C", "157A", "157F", "157D"
> +};
> +
> +static const char * const soc_pkg[] = { "??", "AD", "AC", "AB", "AA" };
> +static const char * const soc_rev[] = { "?", "A", "B", "Z" };
> +
> +static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
> +				   unsigned int *rev)
> +{
> +	u32 cpu_type = get_cpu_type();
> +	u32 ct = cpu_type & ~(BIT(7) | BIT(0));
> +	u32 cm = ((cpu_type & BIT(7)) >> 6) | (cpu_type & BIT(0));
> +	u32 cp = get_cpu_package();
> +
> +	/* Bits 0 and 7 are the ACDF, 00:C 01:A 10:F 11:D */
> +	switch (ct) {
> +	case CPU_STM32MP151Cxx:
> +		*type = cm + 1;
> +		break;
> +	case CPU_STM32MP153Cxx:
> +		*type = cm + 5;
> +		break;
> +	case CPU_STM32MP157Cxx:
> +		*type = cm + 9;
> +		break;
> +	default:
> +		*type = 0;
> +		break;
> +	}
> +
> +	/* Package */
> +	switch (cp) {
> +	case STM32MP15_PKG_AA_LBGA448:
> +	case STM32MP15_PKG_AB_LBGA354:
> +	case STM32MP15_PKG_AC_TFBGA361:
> +	case STM32MP15_PKG_AD_TFBGA257:
> +		*pkg = cp;
> +		break;
> +	default:
> +		*pkg = 0;
> +		break;
> +	}
> +
> +	/* Revision */
> +	switch (get_cpu_rev()) {
> +	case CPU_REV1:
> +		*rev = 1;
> +		break;
> +	case CPU_REV2:
> +		*rev = 2;
> +		break;
> +	case CPU_REV2_1:
> +		*rev = 3;
> +		break;
> +	default:
> +		*rev = 0;
> +		break;
> +	}
> +}
> +
> +void get_soc_name(char name[SOC_NAME_SIZE])
> +{
> +	unsigned int type, pkg, rev;
> +
> +	get_cpu_string_offsets(&type, &pkg, &rev);
> +
> +	snprintf(name, SOC_NAME_SIZE, "STM32MP%s%s Rev.%s",
> +		 soc_type[type], soc_pkg[pkg], soc_rev[rev]);
> +}
> +
> +static void setup_soc_type_pkg_rev(void)
> +{
> +	unsigned int type, pkg, rev;
> +
> +	get_cpu_string_offsets(&type, &pkg, &rev);
> +
> +	env_set("soc_type", soc_type[type]);
> +	env_set("soc_pkg", soc_pkg[pkg]);
> +	env_set("soc_rev", soc_rev[rev]);
> +}
> +
> +/* weak function called in arch_misc_init */
> +void stm32mp_misc_init(void)
> +{
> +	setup_soc_type_pkg_rev();
> +}
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
