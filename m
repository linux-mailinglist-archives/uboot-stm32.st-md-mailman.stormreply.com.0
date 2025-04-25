Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D26CAA9C9F1
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Apr 2025 15:16:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96A53C78F8B;
	Fri, 25 Apr 2025 13:16:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A1D3C78F88
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 13:16:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7lA2K018475;
 Fri, 25 Apr 2025 15:16:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Y6nTfi8Fza2YRTQNu/a+/pUfvxNjMJtguoqSbyYk0u4=; b=FOhE4sgoAqOeoO4Q
 /s7VCUTB7d7PFUJeVSKx56M6jprNTNUAoTg80bofrSULhKFxkATyUlGWMFQNB2AI
 SdmplayETr8WbTRfjqquEpYDQ4v8zJbumLH6VVaju2My9a0kH5x27hevQzsFIQ8I
 vw+rzTX4EM+idnoXXCFIzgZpA3O3eLMmtmcTu3mtjYGYzoB2EGUG89GD8d4vf74p
 tzeKsEAogamrL2VNo4UmZWgT8tA3cgRUC3/2+xqtZs85reTPaxNcvW6WHFuDfEeu
 QplEnqi5zkbnjNmDhrMNbkXihg5P3Biwed6uUnkSI8NGV+JD3ktARRRTMxqK6TBF
 cxSXvA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjvc8yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 15:16:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7F5DD4005F;
 Fri, 25 Apr 2025 15:16:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C14C9118BB;
 Fri, 25 Apr 2025 15:15:39 +0200 (CEST)
Received: from localhost (10.252.18.92) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 15:15:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Apr 2025 15:15:14 +0200
Message-ID: <20250425131533.392747-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425131533.392747-1-patrice.chotard@foss.st.com>
References: <20250425131533.392747-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.18.92]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 03/22] arm: stm32mp: add boot_mode support
	for STM32MP25
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Add support of all the boot mode supported by STM32MP25x family
with information provided by TF-A in backup register

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/include/mach/stm32.h |  15 ++
 arch/arm/mach-stm32mp/stm32mp2/cpu.c       | 155 +++++++++++++++++++--
 configs/stm32mp25_defconfig                |   2 +
 3 files changed, 164 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 6eb85ba7233..156009f51e3 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -42,6 +42,9 @@ enum boot_device {
 
 	BOOT_FLASH_SPINAND = 0x70,
 	BOOT_FLASH_SPINAND_1 = 0x71,
+
+	BOOT_FLASH_HYPERFLASH = 0x80,
+	BOOT_FLASH_HYPERFLASH_1 = 0x81
 };
 
 #define TAMP_BOOT_MODE_MASK		GENMASK(15, 8)
@@ -158,8 +161,20 @@ enum forced_boot_mode {
 #endif /* CONFIG_STM32MP15X || CONFIG_STM32MP13X */
 
 #ifdef CONFIG_STM32MP25X
+#define STM32_USART2_BASE		0x400E0000
+#define STM32_USART3_BASE		0x400F0000
+#define STM32_UART4_BASE		0x40100000
+#define STM32_UART5_BASE		0x40110000
+#define STM32_USART6_BASE		0x40220000
+#define STM32_UART9_BASE		0x402C0000
+#define STM32_USART1_BASE		0x40330000
+#define STM32_UART7_BASE		0x40370000
+#define STM32_UART8_BASE		0x40380000
 #define STM32_RCC_BASE			0x44200000
 #define STM32_TAMP_BASE			0x46010000
+#define STM32_SDMMC1_BASE		0x48220000
+#define STM32_SDMMC2_BASE		0x48230000
+#define STM32_SDMMC3_BASE		0x48240000
 
 #define STM32_DDR_BASE			0x80000000
 
diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
index 9530aa8534b..7cb71c518bd 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
@@ -67,14 +67,6 @@ void enable_caches(void)
 	dcache_enable();
 }
 
-int arch_misc_init(void)
-{
-	setup_serial_number();
-	setup_mac_address();
-
-	return 0;
-}
-
 /*
  * Force data-section, as .bss will not be valid
  * when save_boot_params is invoked.
@@ -97,3 +89,150 @@ void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
 
 	save_boot_params_ret();
 }
+
+u32 get_bootmode(void)
+{
+	/* read bootmode from TAMP backup register */
+	return (readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_MODE_MASK) >>
+		    TAMP_BOOT_MODE_SHIFT;
+}
+
+static void setup_boot_mode(void)
+{
+	const u32 serial_addr[] = {
+		STM32_USART1_BASE,
+		STM32_USART2_BASE,
+		STM32_USART3_BASE,
+		STM32_UART4_BASE,
+		STM32_UART5_BASE,
+		STM32_USART6_BASE,
+		STM32_UART7_BASE,
+		STM32_UART8_BASE,
+		STM32_UART9_BASE
+	};
+	const u32 sdmmc_addr[] = {
+		STM32_SDMMC1_BASE,
+		STM32_SDMMC2_BASE,
+		STM32_SDMMC3_BASE
+	};
+	char cmd[60];
+	u32 boot_ctx = readl(TAMP_BOOT_CONTEXT);
+	u32 boot_mode =
+		(boot_ctx & TAMP_BOOT_MODE_MASK) >> TAMP_BOOT_MODE_SHIFT;
+	unsigned int instance = (boot_mode & TAMP_BOOT_INSTANCE_MASK) - 1;
+	u32 forced_mode = (boot_ctx & TAMP_BOOT_FORCED_MASK);
+	struct udevice *dev;
+
+	log_debug("%s: boot_ctx=0x%x => boot_mode=%x, instance=%d forced=%x\n",
+		  __func__, boot_ctx, boot_mode, instance, forced_mode);
+	switch (boot_mode & TAMP_BOOT_DEVICE_MASK) {
+	case BOOT_SERIAL_UART:
+		if (instance > ARRAY_SIZE(serial_addr))
+			break;
+		/* serial : search associated node in devicetree */
+		sprintf(cmd, "serial@%x", serial_addr[instance]);
+		if (uclass_get_device_by_name(UCLASS_SERIAL, cmd, &dev)) {
+			/* restore console on error */
+			if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL))
+				gd->flags &= ~(GD_FLG_SILENT |
+					       GD_FLG_DISABLE_CONSOLE);
+			log_err("uart%d = %s not found in device tree!\n",
+				instance + 1, cmd);
+			break;
+		}
+		sprintf(cmd, "%d", dev_seq(dev));
+		env_set("boot_device", "serial");
+		env_set("boot_instance", cmd);
+
+		/* restore console on uart when not used */
+		if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) && gd->cur_serial_dev != dev) {
+			gd->flags &= ~(GD_FLG_SILENT |
+				       GD_FLG_DISABLE_CONSOLE);
+			log_info("serial boot with console enabled!\n");
+		}
+		break;
+	case BOOT_SERIAL_USB:
+		env_set("boot_device", "usb");
+		env_set("boot_instance", "0");
+		break;
+	case BOOT_FLASH_SD:
+	case BOOT_FLASH_EMMC:
+		if (instance > ARRAY_SIZE(sdmmc_addr))
+			break;
+		/* search associated sdmmc node in devicetree */
+		sprintf(cmd, "mmc@%x", sdmmc_addr[instance]);
+		if (uclass_get_device_by_name(UCLASS_MMC, cmd, &dev)) {
+			printf("mmc%d = %s not found in device tree!\n",
+			       instance, cmd);
+			break;
+		}
+		sprintf(cmd, "%d", dev_seq(dev));
+		env_set("boot_device", "mmc");
+		env_set("boot_instance", cmd);
+		break;
+	case BOOT_FLASH_NAND:
+		env_set("boot_device", "nand");
+		env_set("boot_instance", "0");
+		break;
+	case BOOT_FLASH_SPINAND:
+		env_set("boot_device", "spi-nand");
+		env_set("boot_instance", "0");
+		break;
+	case BOOT_FLASH_NOR:
+		env_set("boot_device", "nor");
+		if (IS_ENABLED(CONFIG_SYS_MAX_FLASH_BANKS))
+			sprintf(cmd, "%d", CONFIG_SYS_MAX_FLASH_BANKS);
+		else
+			sprintf(cmd, "%d", 0);
+		env_set("boot_instance", cmd);
+		break;
+	case BOOT_FLASH_HYPERFLASH:
+		env_set("boot_device", "nor");
+		env_set("boot_instance", "0");
+		break;
+	default:
+		env_set("boot_device", "invalid");
+		env_set("boot_instance", "");
+		log_err("unexpected boot mode = %x\n", boot_mode);
+		break;
+	}
+
+	switch (forced_mode) {
+	case BOOT_FASTBOOT:
+		log_info("Enter fastboot!\n");
+		env_set("preboot", "env set preboot; fastboot 0");
+		break;
+	case BOOT_STM32PROG:
+		env_set("boot_device", "usb");
+		env_set("boot_instance", "0");
+		break;
+	case BOOT_UMS_MMC0:
+	case BOOT_UMS_MMC1:
+	case BOOT_UMS_MMC2:
+		log_info("Enter UMS!\n");
+		instance = forced_mode - BOOT_UMS_MMC0;
+		sprintf(cmd, "env set preboot; ums 0 mmc %d", instance);
+		env_set("preboot", cmd);
+		break;
+	case BOOT_RECOVERY:
+		env_set("preboot", "env set preboot; run altbootcmd");
+		break;
+	case BOOT_NORMAL:
+		break;
+	default:
+		log_debug("unexpected forced boot mode = %x\n", forced_mode);
+		break;
+	}
+
+	/* clear TAMP for next reboot */
+	clrsetbits_le32(TAMP_BOOT_CONTEXT, TAMP_BOOT_FORCED_MASK, BOOT_NORMAL);
+}
+
+int arch_misc_init(void)
+{
+	setup_boot_mode();
+	setup_serial_number();
+	setup_mac_address();
+
+	return 0;
+}
diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 717724ff672..d11910f139f 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -44,6 +44,8 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
+CONFIG_MTD=y
+CONFIG_USE_SYS_MAX_FLASH_BANKS=y
 CONFIG_PINCONF=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
