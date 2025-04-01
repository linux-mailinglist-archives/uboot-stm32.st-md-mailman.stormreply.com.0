Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F1A77BDD
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:17:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25EA3C78F90;
	Tue,  1 Apr 2025 13:17:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD0E8C78F8C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:17:18 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531BSIJI013210;
 Tue, 1 Apr 2025 15:17:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qYOQFPrC1mTAHO3yG//sTwRnD3WsxsRgL2dLZIPg8gw=; b=VhyiO4HCT4TBo12B
 PpEkFqSCO+Ij1Vqew+mZJd8srvPql7DdvmCvtNvtiG21ygfRM+I5uWY5MCIgOJOx
 h2mX+F+tbbkxTM3DfVF1wKd0SD1ccZhm3VVNvuf0UjKq/06Sxy38qOmtjROhOdXM
 0L7+TE3/eOZXPLMr63T/EwopKtMXD8V3SgL28DGBo4lVgGk9u+Z/gyUXo0hHoz6O
 gZKS0hM/9Hs7+YoZFXPPRPCg+rAcLk41bMF6yKstSqIIGuBplYMBtggWY2YD6CLi
 UKeQBCdcwJEwaDPluZMJjoypNr1bq9lm5URPdqPeN3DbRA0kxGKtrCX4nVwA9DK4
 c9LSnQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45pua7u2fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:17:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B180D40050;
 Tue,  1 Apr 2025 15:16:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60BF78A379E;
 Tue,  1 Apr 2025 15:14:39 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:14:39 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:14:11 +0200
Message-ID: <20250401131413.387139-12-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401131413.387139-1-patrice.chotard@foss.st.com>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH 11/13] stm32mp: fdt: remove ETZPC peripheral
	cleanup
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

From: Lionel Debieve <lionel.debieve@foss.st.com>

Due to feature domains management, there is no more
need to maintain the fdt cleanup.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig        |   8 -
 arch/arm/mach-stm32mp/stm32mp1/fdt.c | 258 ---------------------------
 2 files changed, 266 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 7ba928cf428..ad925201fca 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -129,14 +129,6 @@ config SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION_MMC2
 	  Partition on the second MMC to load U-Boot from when the MMC is being
 	  used in raw mode
 
-config STM32_ETZPC
-	bool "STM32 Extended TrustZone Protection"
-	depends on STM32MP15X || STM32MP13X
-	default y
-	imply BOOTP_SERVERIP
-	help
-	  Say y to enable STM32 Extended TrustZone Protection
-
 config STM32_ECDSA_VERIFY
 	bool "STM32 ECDSA verification via the ROM API"
 	depends on SPL_ECDSA_VERIFY
diff --git a/arch/arm/mach-stm32mp/stm32mp1/fdt.c b/arch/arm/mach-stm32mp/stm32mp1/fdt.c
index e1e4dc04e01..72474fa73f6 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/fdt.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/fdt.c
@@ -14,20 +14,6 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 #include <linux/io.h>
 
-#define ETZPC_DECPROT(n)	(STM32_ETZPC_BASE + 0x10 + 4 * (n))
-#define ETZPC_DECPROT_NB	6
-
-#define DECPROT_MASK		0x03
-#define NB_PROT_PER_REG		0x10
-#define DECPROT_NB_BITS		2
-
-#define DECPROT_SECURED		0x00
-#define DECPROT_WRITE_SECURE	0x01
-#define DECPROT_MCU_ISOLATION	0x02
-#define DECPROT_NON_SECURED	0x03
-
-#define ETZPC_RESERVED		0xffffffff
-
 #define STM32MP13_FDCAN_BASE	0x4400F000
 #define STM32MP13_ADC1_BASE	0x48003000
 #define STM32MP13_TSC_BASE	0x5000B000
@@ -42,204 +28,6 @@
 #define STM32MP15_GPU_BASE	0x59000000
 #define STM32MP15_DSI_BASE	0x5a000000
 
-static const u32 stm32mp13_ip_addr[] = {
-	0x50025000,		/* 0 VREFBUF APB3 */
-	0x50021000,		/* 1 LPTIM2 APB3 */
-	0x50022000,		/* 2 LPTIM3 APB3 */
-	STM32MP13_LTDC_BASE,	/* 3 LTDC APB4 */
-	STM32MP13_DCMIPP_BASE,	/* 4 DCMIPP APB4 */
-	0x5A006000,		/* 5 USBPHYCTRL APB4 */
-	0x5A003000,		/* 6 DDRCTRLPHY APB4 */
-	ETZPC_RESERVED,		/* 7 Reserved*/
-	ETZPC_RESERVED,		/* 8 Reserved*/
-	ETZPC_RESERVED,		/* 9 Reserved*/
-	0x5C006000,		/* 10 TZC APB5 */
-	0x58001000,		/* 11 MCE APB5 */
-	0x5C000000,		/* 12 IWDG1 APB5 */
-	0x5C008000,		/* 13 STGENC APB5 */
-	ETZPC_RESERVED,		/* 14 Reserved*/
-	ETZPC_RESERVED,		/* 15 Reserved*/
-	0x4C000000,		/* 16 USART1 APB6 */
-	0x4C001000,		/* 17 USART2 APB6 */
-	0x4C002000,		/* 18 SPI4 APB6 */
-	0x4C003000,		/* 19 SPI5 APB6 */
-	0x4C004000,		/* 20 I2C3 APB6 */
-	0x4C005000,		/* 21 I2C4 APB6 */
-	0x4C006000,		/* 22 I2C5 APB6 */
-	0x4C007000,		/* 23 TIM12 APB6 */
-	0x4C008000,		/* 24 TIM13 APB6 */
-	0x4C009000,		/* 25 TIM14 APB6 */
-	0x4C00A000,		/* 26 TIM15 APB6 */
-	0x4C00B000,		/* 27 TIM16 APB6 */
-	0x4C00C000,		/* 28 TIM17 APB6 */
-	ETZPC_RESERVED,		/* 29 Reserved*/
-	ETZPC_RESERVED,		/* 30 Reserved*/
-	ETZPC_RESERVED,		/* 31 Reserved*/
-	STM32MP13_ADC1_BASE,	/* 32 ADC1 AHB2 */
-	0x48004000,		/* 33 ADC2 AHB2 */
-	0x49000000,		/* 34 OTG AHB2 */
-	ETZPC_RESERVED,		/* 35 Reserved*/
-	ETZPC_RESERVED,		/* 36 Reserved*/
-	STM32MP13_TSC_BASE,	/* 37 TSC AHB4 */
-	ETZPC_RESERVED,		/* 38 Reserved*/
-	ETZPC_RESERVED,		/* 39 Reserved*/
-	0x54004000,		/* 40 RNG AHB5 */
-	0x54003000,		/* 41 HASH AHB5 */
-	STM32MP13_CRYP_BASE,	/* 42 CRYPT AHB5 */
-	0x54005000,		/* 43 SAES AHB5 */
-	0x54006000,		/* 44 PKA AHB5 */
-	0x54000000,		/* 45 BKPSRAM AHB5 */
-	ETZPC_RESERVED,		/* 46 Reserved*/
-	ETZPC_RESERVED,		/* 47 Reserved*/
-	0x5800A000,		/* 48 ETH1 AHB6 */
-	STM32MP13_ETH2_BASE,	/* 49 ETH2 AHB6 */
-	0x58005000,		/* 50 SDMMC1 AHB6 */
-	0x58007000,		/* 51 SDMMC2 AHB6 */
-	ETZPC_RESERVED,		/* 52 Reserved*/
-	ETZPC_RESERVED,		/* 53 Reserved*/
-	0x58002000,		/* 54 FMC AHB6 */
-	0x58003000,		/* 55 QSPI AHB6 */
-	ETZPC_RESERVED,		/* 56 Reserved*/
-	ETZPC_RESERVED,		/* 57 Reserved*/
-	ETZPC_RESERVED,		/* 58 Reserved*/
-	ETZPC_RESERVED,		/* 59 Reserved*/
-	0x30000000,		/* 60 SRAM1 MLAHB */
-	0x30004000,		/* 61 SRAM2 MLAHB */
-	0x30006000,		/* 62 SRAM3 MLAHB */
-	ETZPC_RESERVED,		/* 63 Reserved*/
-	ETZPC_RESERVED,		/* 64 Reserved*/
-	ETZPC_RESERVED,		/* 65 Reserved*/
-	ETZPC_RESERVED,		/* 66 Reserved*/
-	ETZPC_RESERVED,		/* 67 Reserved*/
-	ETZPC_RESERVED,		/* 68 Reserved*/
-	ETZPC_RESERVED,		/* 69 Reserved*/
-	ETZPC_RESERVED,		/* 70 Reserved*/
-	ETZPC_RESERVED,		/* 71 Reserved*/
-	ETZPC_RESERVED,		/* 72 Reserved*/
-	ETZPC_RESERVED,		/* 73 Reserved*/
-	ETZPC_RESERVED,		/* 74 Reserved*/
-	ETZPC_RESERVED,		/* 75 Reserved*/
-	ETZPC_RESERVED,		/* 76 Reserved*/
-	ETZPC_RESERVED,		/* 77 Reserved*/
-	ETZPC_RESERVED,		/* 78 Reserved*/
-	ETZPC_RESERVED,		/* 79 Reserved*/
-	ETZPC_RESERVED,		/* 80 Reserved*/
-	ETZPC_RESERVED,		/* 81 Reserved*/
-	ETZPC_RESERVED,		/* 82 Reserved*/
-	ETZPC_RESERVED,		/* 83 Reserved*/
-	ETZPC_RESERVED,		/* 84 Reserved*/
-	ETZPC_RESERVED,		/* 85 Reserved*/
-	ETZPC_RESERVED,		/* 86 Reserved*/
-	ETZPC_RESERVED,		/* 87 Reserved*/
-	ETZPC_RESERVED,		/* 88 Reserved*/
-	ETZPC_RESERVED,		/* 89 Reserved*/
-	ETZPC_RESERVED,		/* 90 Reserved*/
-	ETZPC_RESERVED,		/* 91 Reserved*/
-	ETZPC_RESERVED,		/* 92 Reserved*/
-	ETZPC_RESERVED,		/* 93 Reserved*/
-	ETZPC_RESERVED,		/* 94 Reserved*/
-	ETZPC_RESERVED,		/* 95 Reserved*/
-};
-
-static const u32 stm32mp15_ip_addr[] = {
-	0x5c008000,	/* 00 stgenc */
-	0x54000000,	/* 01 bkpsram */
-	0x5c003000,	/* 02 iwdg1 */
-	0x5c000000,	/* 03 usart1 */
-	0x5c001000,	/* 04 spi6 */
-	0x5c002000,	/* 05 i2c4 */
-	ETZPC_RESERVED,	/* 06 reserved */
-	0x54003000,	/* 07 rng1 */
-	0x54002000,	/* 08 hash1 */
-	STM32MP15_CRYP1_BASE,	/* 09 cryp1 */
-	0x5a003000,	/* 0A ddrctrl */
-	0x5a004000,	/* 0B ddrphyc */
-	0x5c009000,	/* 0C i2c6 */
-	ETZPC_RESERVED,	/* 0D reserved */
-	ETZPC_RESERVED,	/* 0E reserved */
-	ETZPC_RESERVED,	/* 0F reserved */
-	0x40000000,	/* 10 tim2 */
-	0x40001000,	/* 11 tim3 */
-	0x40002000,	/* 12 tim4 */
-	0x40003000,	/* 13 tim5 */
-	0x40004000,	/* 14 tim6 */
-	0x40005000,	/* 15 tim7 */
-	0x40006000,	/* 16 tim12 */
-	0x40007000,	/* 17 tim13 */
-	0x40008000,	/* 18 tim14 */
-	0x40009000,	/* 19 lptim1 */
-	0x4000a000,	/* 1A wwdg1 */
-	0x4000b000,	/* 1B spi2 */
-	0x4000c000,	/* 1C spi3 */
-	0x4000d000,	/* 1D spdifrx */
-	0x4000e000,	/* 1E usart2 */
-	0x4000f000,	/* 1F usart3 */
-	0x40010000,	/* 20 uart4 */
-	0x40011000,	/* 21 uart5 */
-	0x40012000,	/* 22 i2c1 */
-	0x40013000,	/* 23 i2c2 */
-	0x40014000,	/* 24 i2c3 */
-	0x40015000,	/* 25 i2c5 */
-	0x40016000,	/* 26 cec */
-	0x40017000,	/* 27 dac */
-	0x40018000,	/* 28 uart7 */
-	0x40019000,	/* 29 uart8 */
-	ETZPC_RESERVED,	/* 2A reserved */
-	ETZPC_RESERVED,	/* 2B reserved */
-	0x4001c000,	/* 2C mdios */
-	ETZPC_RESERVED,	/* 2D reserved */
-	ETZPC_RESERVED,	/* 2E reserved */
-	ETZPC_RESERVED,	/* 2F reserved */
-	0x44000000,	/* 30 tim1 */
-	0x44001000,	/* 31 tim8 */
-	ETZPC_RESERVED,	/* 32 reserved */
-	0x44003000,	/* 33 usart6 */
-	0x44004000,	/* 34 spi1 */
-	0x44005000,	/* 35 spi4 */
-	0x44006000,	/* 36 tim15 */
-	0x44007000,	/* 37 tim16 */
-	0x44008000,	/* 38 tim17 */
-	0x44009000,	/* 39 spi5 */
-	0x4400a000,	/* 3A sai1 */
-	0x4400b000,	/* 3B sai2 */
-	0x4400c000,	/* 3C sai3 */
-	0x4400d000,	/* 3D dfsdm */
-	STM32MP15_FDCAN_BASE,	/* 3E tt_fdcan */
-	ETZPC_RESERVED,	/* 3F reserved */
-	0x50021000,	/* 40 lptim2 */
-	0x50022000,	/* 41 lptim3 */
-	0x50023000,	/* 42 lptim4 */
-	0x50024000,	/* 43 lptim5 */
-	0x50027000,	/* 44 sai4 */
-	0x50025000,	/* 45 vrefbuf */
-	0x4c006000,	/* 46 dcmi */
-	0x4c004000,	/* 47 crc2 */
-	0x48003000,	/* 48 adc */
-	0x4c002000,	/* 49 hash2 */
-	0x4c003000,	/* 4A rng2 */
-	STM32MP15_CRYP2_BASE,	/* 4B cryp2 */
-	ETZPC_RESERVED,	/* 4C reserved */
-	ETZPC_RESERVED,	/* 4D reserved */
-	ETZPC_RESERVED,	/* 4E reserved */
-	ETZPC_RESERVED,	/* 4F reserved */
-	ETZPC_RESERVED,	/* 50 sram1 */
-	ETZPC_RESERVED,	/* 51 sram2 */
-	ETZPC_RESERVED,	/* 52 sram3 */
-	ETZPC_RESERVED,	/* 53 sram4 */
-	ETZPC_RESERVED,	/* 54 retram */
-	0x49000000,	/* 55 otg */
-	0x48004000,	/* 56 sdmmc3 */
-	0x48005000,	/* 57 dlybsd3 */
-	0x48000000,	/* 58 dma1 */
-	0x48001000,	/* 59 dma2 */
-	0x48002000,	/* 5A dmamux */
-	0x58002000,	/* 5B fmc */
-	0x58003000,	/* 5C qspi */
-	0x58004000,	/* 5D dlybq */
-	0x5800a000,	/* 5E eth */
-	ETZPC_RESERVED,	/* 5F reserved */
-};
-
 /* fdt helper */
 static bool fdt_disable_subnode_by_address(void *fdt, int offset, u32 addr)
 {
@@ -263,46 +51,6 @@ static bool fdt_disable_subnode_by_address(void *fdt, int offset, u32 addr)
 	return false;
 }
 
-static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
-{
-	const u32 *array;
-	int array_size, i;
-	int offset, shift;
-	u32 addr, status, decprot[ETZPC_DECPROT_NB];
-
-	if (IS_ENABLED(CONFIG_STM32MP13X)) {
-		array = stm32mp13_ip_addr;
-		array_size = ARRAY_SIZE(stm32mp13_ip_addr);
-	}
-
-	if (IS_ENABLED(CONFIG_STM32MP15X)) {
-		array = stm32mp15_ip_addr;
-		array_size = ARRAY_SIZE(stm32mp15_ip_addr);
-	}
-
-	for (i = 0; i < ETZPC_DECPROT_NB; i++)
-		decprot[i] = readl(ETZPC_DECPROT(i));
-
-	for (i = 0; i < array_size; i++) {
-		offset = i / NB_PROT_PER_REG;
-		shift = (i % NB_PROT_PER_REG) * DECPROT_NB_BITS;
-		status = (decprot[offset] >> shift) & DECPROT_MASK;
-		addr = array[i];
-
-		log_debug("ETZPC: 0x%08x decprot %d=%d\n", addr, i, status);
-
-		if (addr == ETZPC_RESERVED ||
-		    status == DECPROT_NON_SECURED)
-			continue;
-
-		if (fdt_disable_subnode_by_address(fdt, soc_node, addr))
-			log_notice("ETZPC: 0x%08x node disabled, decprot %d=%d\n",
-				   addr, i, status);
-	}
-
-	return 0;
-}
-
 /* deactivate all the cpu except core 0 */
 static void stm32_fdt_fixup_cpu(void *blob, char *name)
 {
@@ -481,12 +229,6 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 	if (soc < 0)
 		return soc;
 
-	if (CONFIG_IS_ENABLED(STM32_ETZPC)) {
-		ret = stm32_fdt_fixup_etzpc(blob, soc);
-		if (ret)
-			return ret;
-	}
-
 	/* MPUs Part Numbers and name*/
 	cpu = get_cpu_type();
 	get_soc_name(name);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
