Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 021EBA9C9F5
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Apr 2025 15:17:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB073C78F8B;
	Fri, 25 Apr 2025 13:17:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FC52C78F8C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 13:17:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PChs3P005380;
 Fri, 25 Apr 2025 15:17:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Q6UzFNucqan5iLTSt7oNBDMZtb7/qkG4OAIe32HFqtQ=; b=qRh1O1FzjczV0XFG
 VIjrmOzeTRu4uyJgiUS8JRf2ET8o9AzUoaRf7kF8XOlIVwI0L/6slalAF3ZK/PmB
 yWIA4VKcRBpl/NdSNyWXgHJghaqob09Ayoupkwx2xRVktc9C0Pv95EKIBhiNNI9T
 ttZCxs0NCX4WirH9EevBYmBdp8lyG3Mx70n2U2A9pOGxvlrCZ1D6RKg1aUrZ1zlL
 g+ql8dV+34QJxzLvJfb+szSFwZ319bAhWua6Ngp6UFYgNYt6N/gVyw51Q+pa/43Y
 BIgdWprU3gTeiWElWZpW7Lqr0EmYbJ29Fyd8cmmGnr4Ow6o34LcHamsmv5nlHB95
 rwD3qA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jk3mnyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 15:17:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7EBEC40063;
 Fri, 25 Apr 2025 15:16:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 802A790BF4E;
 Fri, 25 Apr 2025 15:15:45 +0200 (CEST)
Received: from localhost (10.252.18.92) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 15:15:45 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Apr 2025 15:15:20 +0200
Message-ID: <20250425131533.392747-10-patrice.chotard@foss.st.com>
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
 Jerome Forissier <jerome.forissier@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 09/22] configs: stm32mp25: add support of
	NAND and NOR boot
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

Add support of UBI boot and activate the needed
configuration for U-Boot environment in UBI volume for
NAND or in a MTD partition for NOR device, SPI Flash:
ENV_OFFSET, ENV_OFFSET_REDUND, ENV_SECT_SIZE is
aligned with the default MTD partition on NOR device
of the STMicroelectronics boards.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 board/st/stm32mp2/stm32mp2.c       | 13 +++++++++++++
 configs/stm32mp25_defconfig        | 13 +++++++++++++
 include/configs/stm32mp25_common.h | 11 +++++++++++
 3 files changed, 37 insertions(+)

diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
index 6e4f19b1664..2547f2e4bb7 100644
--- a/board/st/stm32mp2/stm32mp2.c
+++ b/board/st/stm32mp2/stm32mp2.c
@@ -138,6 +138,19 @@ enum env_location env_get_location(enum env_operation op, int prio)
 			return ENVL_MMC;
 		else
 			return ENVL_NOWHERE;
+
+	case BOOT_FLASH_NAND:
+	case BOOT_FLASH_SPINAND:
+		if (CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
+			return ENVL_UBI;
+		else
+			return ENVL_NOWHERE;
+
+	case BOOT_FLASH_NOR:
+		if (CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH))
+			return ENVL_SPI_FLASH;
+		else
+			return ENVL_NOWHERE;
 	default:
 		return ENVL_NOWHERE;
 	}
diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 3f765346904..0e515e4af65 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -3,11 +3,13 @@ CONFIG_ARCH_STM32MP=y
 CONFIG_SYS_MALLOC_F_LEN=0x400000
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x90000000
 CONFIG_ENV_OFFSET=0x900000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp257f-ev1"
 CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SYS_LOAD_ADDR=0x84000000
 CONFIG_STM32MP25X=y
 CONFIG_DDR_CACHEABLE_SIZE=0x10000000
+CONFIG_ENV_OFFSET_REDUND=0x940000
 CONFIG_TARGET_ST_STM32MP25X=y
 CONFIG_SYS_MEMTEST_START=0x84000000
 CONFIG_SYS_MEMTEST_END=0x88000000
@@ -33,9 +35,16 @@ CONFIG_CMD_RNG=y
 CONFIG_CMD_TIMER=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_LOG=y
+CONFIG_CMD_UBI=y
 CONFIG_OF_LIVE=y
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_IS_IN_UBI=y
+CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_UBI_PART="UBI"
+CONFIG_ENV_UBI_VOLUME="uboot_config"
+CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_MMC_ENV_DEV=-1
 CONFIG_NO_NET=y
 CONFIG_SYS_64BIT_LBA=y
@@ -50,6 +59,7 @@ CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_USE_SYS_MAX_FLASH_BANKS=y
+CONFIG_SPI_FLASH=y
 CONFIG_PINCONF=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
@@ -57,8 +67,11 @@ CONFIG_RAM=y
 # CONFIG_STM32MP1_DDR is not set
 CONFIG_DM_RNG=y
 CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
 # CONFIG_OPTEE_TA_AVB is not set
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_WDT_ARM_SMC=y
+# CONFIG_UBIFS_SILENCE_DEBUG_DUMP is not set
 CONFIG_ERRNO_STR=y
diff --git a/include/configs/stm32mp25_common.h b/include/configs/stm32mp25_common.h
index 542de8f068d..1c28ce1c1e9 100644
--- a/include/configs/stm32mp25_common.h
+++ b/include/configs/stm32mp25_common.h
@@ -35,8 +35,15 @@
 #define BOOT_TARGET_MMC2(func)
 #endif
 
+#ifdef CONFIG_CMD_UBIFS
+#define BOOT_TARGET_UBIFS(func)	func(UBIFS, ubifs, 0, UBI, boot)
+#else
+#define BOOT_TARGET_UBIFS(func)
+#endif
+
 #define BOOT_TARGET_DEVICES(func)	\
 	BOOT_TARGET_MMC1(func)		\
+	BOOT_TARGET_UBIFS(func)		\
 	BOOT_TARGET_MMC0(func)		\
 	BOOT_TARGET_MMC2(func)
 
@@ -44,6 +51,7 @@
  * default bootcmd for stm32mp25:
  * for serial/usb: execute the stm32prog command
  * for mmc boot (eMMC, SD card), distro boot on the same mmc device
+ * for NAND or SPI-NAND boot, distro boot with UBIFS on UBI partition
  * for other boot, use the default distro order in ${boot_targets}
  */
 #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
@@ -54,6 +62,9 @@
 		"run env_check;" \
 		"if test ${boot_device} = mmc;" \
 		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
+		"if test ${boot_device} = nand ||" \
+		  " test ${boot_device} = spi-nand ;" \
+		"then env set boot_targets ubifs0; fi;" \
 		"run distro_bootcmd;" \
 	"fi;\0"
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
