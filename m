Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 249A93D5669
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Jul 2021 11:21:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C85A0C597BE;
	Mon, 26 Jul 2021 09:21:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58E23C597B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jul 2021 09:21:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16Q9BsFA000602; Mon, 26 Jul 2021 11:21:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=xeaeactgfW1hVlIy9HmiqjRdms/X4VdLjIlcOPakPw8=;
 b=ZeGemIRUiQnjPJswhECGMY+Z+2bqBNYXVlBOdpumu8JTfmQ+49DzbLQROVSM0rI8R9gN
 rvzm67STCgkjqHtXNsaywVlMEO6TwjsiKBX/Eb/DTZx9VAavQUSycJuCF+RDHHff66WR
 Kj7srtLGFu7Ecii4tPw0JaZziTzvBEiRzVjOUwtHOxx/M/72jInDLmvrtDqsutWP607K
 XmwlgE80fE6pxFklZJy4E3WeXW9s7ySdwnXJFVyUvcUlD2EmzpXNbmxx+CgLlB78VvRH
 0IEgQOHbFzgoXurxzsnfSM6S7ZCg/FySUMW+OUk2RNEM8zLCwbSnzyEgsBi7tENMhNWB xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a1sy1g52q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 11:21:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25A42100034;
 Mon, 26 Jul 2021 11:21:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0ADF214D2B;
 Mon, 26 Jul 2021 11:21:45 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Jul 2021 11:21:45
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Jul 2021 11:21:36 +0200
Message-ID: <20210726111931.v3.3.I6cfa5180734d90381a9349794ee79a4ecd7deb01@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726092138.53762-1-patrick.delaunay@foss.st.com>
References: <20210726092138.53762-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-26_05:2021-07-26,
 2021-07-26 signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 3/5] arm: stm32mp: add defconfig for
	trusted boot with FIP
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

Add TF-A FIP support for trusted boot on STM32MP15x,
when STM32MP15x_STM32IMAGE is not activated.

With FIP support the SSBL partition is named "fip" and its size is 4MB,
so the ENV partition name in device tree  (for SD card or eMMC)
or offset in defconfig (CONFIG_ENV_OFFSET / CONFIG_ENV_OFFSET_REDUND)
need to be modified.

With FIP the TEE MTD partitions are removed because the OP-TEE binray are
included in the FIP containers.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v2)

Changes in v2:
- synchronize defconfig with latest change

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |   6 +-
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |   6 +-
 board/st/common/Kconfig                  |  21 ++-
 board/st/common/stm32mp_mtdparts.c       |  31 +++--
 board/st/stm32mp1/MAINTAINERS            |   1 +
 configs/stm32mp15_defconfig              | 158 +++++++++++++++++++++++
 6 files changed, 207 insertions(+), 16 deletions(-)
 create mode 100644 configs/stm32mp15_defconfig

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 8b66dace37..460a14e8a9 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -15,13 +15,17 @@
 	config {
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
-		u-boot,mmc-env-partition = "ssbl";
+		u-boot,mmc-env-partition = "fip";
 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
 		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
 	};
 
 #ifdef CONFIG_STM32MP15x_STM32IMAGE
+	config {
+		u-boot,mmc-env-partition = "ssbl";
+	};
+
 	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index e5a1cb7084..69eb285bf7 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -15,12 +15,16 @@
 	config {
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
-		u-boot,mmc-env-partition = "ssbl";
+		u-boot,mmc-env-partition = "fip";
 		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
 	};
 
 #ifdef CONFIG_STM32MP15x_STM32IMAGE
+	config {
+		u-boot,mmc-env-partition = "ssbl";
+	};
+
 	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index ddcf33a122..2f57118bb2 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -8,18 +8,22 @@ config CMD_STBOARD
 
 config MTDPARTS_NAND0_BOOT
 	string "mtd boot partitions for nand0"
-	default "2m(fsbl),2m(ssbl1),2m(ssbl2)"
+	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15x_STM32IMAGE || \
+						  !TFABOOT
+	default "2m(fsbl),4m(fip1),4m(fip2)"
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the partitions of nand0 used to build mtparts dynamically
 	  for boot from nand0.
 	  Each partition need to be aligned with the device erase block size,
 	  512KB is the max size for the NAND supported by stm32mp1 platform.
+	  The fsbl partition support multiple copy of the same binary, one by
+	  erase block.
 
 config MTDPARTS_NAND0_TEE
 	string "mtd tee partitions for nand0"
 	default "512k(teeh),512k(teed),512k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
+	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
 	help
 	  This define the tee partitions added in mtparts dynamically
 	  when tee is supported with boot from nand0.
@@ -28,7 +32,9 @@ config MTDPARTS_NAND0_TEE
 
 config MTDPARTS_NOR0_BOOT
 	string "mtd boot partitions for nor0"
-	default "256k(fsbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env)"
+	default "256k(fsbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env)" if STM32MP15x_STM32IMAGE || \
+								       !TFABOOT
+	default "256k(fsbl1),256k(fsbl2),4m(fip),512k(u-boot-env)"
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the partitions of nand0 used to build mtparts dynamically
@@ -40,24 +46,27 @@ config MTDPARTS_NOR0_BOOT
 config MTDPARTS_NOR0_TEE
 	string "mtd tee partitions for nor0"
 	default "256k(teeh),512k(teed),256k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
+	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
 	help
 	  This define the tee partitions added in mtparts dynamically
 	  when tee is supported with boot from nor0.
 
 config MTDPARTS_SPINAND0_BOOT
 	string "mtd boot partitions for spi-nand0"
-	default "2m(fsbl),2m(ssbl1),2m(ssbl2)"
+	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15x_STM32IMAGE || !TFABOOT
+	default "2m(fsbl),4m(fip1),4m(fip2)"
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the partitions of nand0 used to build mtparts dynamically
 	  for boot from spi-nand0,
 	  512KB is the max size for the NAND supported by stm32mp1 platform.
+	  The fsbl partition support multiple copy of the same binary, one by
+	  erase block.
 
 config MTDPARTS_SPINAND0_TEE
 	string "mtd tee partitions for spi-nand0"
 	default "512k(teeh),512k(teed),512k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
+	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
 	help
 	  This define the tee partitions added in mtparts dynamically
 	  when tee is supported with boot from spi-nand0,
diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
index f074fc189d..8b636d62fa 100644
--- a/board/st/common/stm32mp_mtdparts.c
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -11,7 +11,9 @@
 #include <log.h>
 #include <mtd.h>
 #include <mtd_node.h>
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 #include <tee.h>
+#endif
 #include <asm/arch/stm32prog.h>
 #include <asm/arch/sys_proto.h>
 #include <asm/global_data.h>
@@ -31,7 +33,9 @@ static void board_set_mtdparts(const char *dev,
 			       char *mtdids,
 			       char *mtdparts,
 			       const char *boot,
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 			       const char *tee,
+#endif
 			       const char *user)
 {
 	/* mtdids: "<dev>=<dev>, ...." */
@@ -55,10 +59,12 @@ static void board_set_mtdparts(const char *dev,
 		strncat(mtdparts, ",", MTDPARTS_LEN);
 	}
 
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	if (tee) {
 		strncat(mtdparts, tee, MTDPARTS_LEN);
 		strncat(mtdparts, ",", MTDPARTS_LEN);
 	}
+#endif
 
 	strncat(mtdparts, user, MTDPARTS_LEN);
 }
@@ -70,7 +76,10 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	static char parts[3 * MTDPARTS_LEN + 1];
 	static char ids[MTDIDS_LEN + 1];
 	static bool mtd_initialized;
-	bool tee, nor, nand, spinand, serial;
+	bool nor, nand, spinand, serial;
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
+	bool tee = false;
+#endif
 
 	if (mtd_initialized) {
 		*mtdids = ids;
@@ -78,7 +87,6 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		return;
 	}
 
-	tee = false;
 	nor = false;
 	nand = false;
 	spinand = false;
@@ -89,7 +97,9 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	case BOOT_SERIAL_USB:
 		serial = true;
 		if (CONFIG_IS_ENABLED(CMD_STM32PROG)) {
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 			tee = stm32prog_get_tee_partitions();
+#endif
 			nor = stm32prog_get_fsbl_nor();
 		}
 		nand = true;
@@ -108,9 +118,11 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		break;
 	}
 
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	if (!serial && CONFIG_IS_ENABLED(OPTEE) &&
 	    tee_find_device(NULL, NULL, NULL, NULL))
 		tee = true;
+#endif
 
 	memset(parts, 0, sizeof(parts));
 	memset(ids, 0, sizeof(ids));
@@ -125,10 +137,11 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	if (nand) {
 		mtd = get_mtd_device_nm("nand0");
 		if (!IS_ERR_OR_NULL(mtd)) {
-			const char *mtd_tee = CONFIG_MTDPARTS_NAND0_TEE;
 			board_set_mtdparts("nand0", ids, parts,
 					   CONFIG_MTDPARTS_NAND0_BOOT,
-					   !nor && tee ? mtd_tee : NULL,
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
+					   !nor && tee ? CONFIG_MTDPARTS_NAND0_TEE : NULL,
+#endif
 					   "-(UBI)");
 			put_mtd_device(mtd);
 		}
@@ -137,10 +150,11 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	if (spinand) {
 		mtd = get_mtd_device_nm("spi-nand0");
 		if (!IS_ERR_OR_NULL(mtd)) {
-			const char *mtd_tee = CONFIG_MTDPARTS_SPINAND0_TEE;
 			board_set_mtdparts("spi-nand0", ids, parts,
 					   CONFIG_MTDPARTS_SPINAND0_BOOT,
-					   !nor && tee ? mtd_tee : NULL,
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
+					   !nor && tee ? CONFIG_MTDPARTS_SPINAND0_TEE : NULL,
+#endif
 					   "-(UBI)");
 			put_mtd_device(mtd);
 		}
@@ -148,10 +162,11 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 
 	if (nor) {
 		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
-			const char *mtd_tee = CONFIG_MTDPARTS_NOR0_TEE;
 			board_set_mtdparts("nor0", ids, parts,
 					   CONFIG_MTDPARTS_NOR0_BOOT,
-					   tee ? mtd_tee : NULL,
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
+					   tee ? CONFIG_MTDPARTS_NOR0_TEE : NULL,
+#endif
 					   "-(nor_user)");
 		}
 	}
diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
index fe8fc6f484..0e6d80fb45 100644
--- a/board/st/stm32mp1/MAINTAINERS
+++ b/board/st/stm32mp1/MAINTAINERS
@@ -5,6 +5,7 @@ T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
 F:	arch/arm/dts/stm32mp15*
 F:	board/st/stm32mp1/
+F:	configs/stm32mp15_defconfig
 F:	configs/stm32mp15_basic_defconfig
 F:	configs/stm32mp15_trusted_defconfig
 F:	include/configs/stm32mp1.h
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
new file mode 100644
index 0000000000..b11da7dc9f
--- /dev/null
+++ b/configs/stm32mp15_defconfig
@@ -0,0 +1,158 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_TFABOOT=y
+CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_SYS_MEMTEST_START=0xc0000000
+CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_ENV_OFFSET=0x480000
+CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
+CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_CMD_STM32KEY=y
+CONFIG_CMD_STM32PROG=y
+CONFIG_ENV_OFFSET_REDUND=0x4C0000
+CONFIG_TYPEC_STUSB160X=y
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_FIT=y
+CONFIG_BOOTDELAY=1
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_SYS_PROMPT="STM32MP> "
+CONFIG_CMD_ADTIMG=y
+CONFIG_CMD_ERASEENV=y
+CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_UNZIP=y
+CONFIG_CMD_ADC=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_DFU=y
+CONFIG_CMD_FUSE=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_REMOTEPROC=y
+CONFIG_CMD_SPI=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
+CONFIG_CMD_BMP=y
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_EFIDEBUG=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_RNG=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_PMIC=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_MTDPARTS=y
+CONFIG_CMD_LOG=y
+CONFIG_CMD_UBI=y
+CONFIG_OF_LIVE=y
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_IS_IN_UBI=y
+CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_UBI_PART="UBI"
+CONFIG_ENV_UBI_VOLUME="uboot_config"
+CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_SYS_MMC_ENV_DEV=-1
+CONFIG_STM32_ADC=y
+CONFIG_CLK_SCMI=y
+CONFIG_SET_DFU_ALT_INFO=y
+CONFIG_USB_FUNCTION_FASTBOOT=y
+CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
+CONFIG_FASTBOOT_BUF_SIZE=0x02000000
+CONFIG_FASTBOOT_USB_DEV=1
+CONFIG_FASTBOOT_FLASH=y
+CONFIG_FASTBOOT_FLASH_MMC_DEV=1
+CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
+CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
+CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
+CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
+CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
+CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
+CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
+CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
+CONFIG_GPIO_HOG=y
+CONFIG_DM_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_STM32F7=y
+CONFIG_LED=y
+CONFIG_LED_GPIO=y
+CONFIG_DM_MAILBOX=y
+CONFIG_STM32_IPCC=y
+CONFIG_STM32_FMC2_EBI=y
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_STM32_SDMMC2=y
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+CONFIG_SYS_MTDPARTS_RUNTIME=y
+CONFIG_MTD_RAW_NAND=y
+CONFIG_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NAND=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
+CONFIG_SPI_FLASH_MTD=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_ETH=y
+CONFIG_DWC_ETH_QOS=y
+CONFIG_PHY=y
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_PINCONF=y
+CONFIG_PINCTRL_STMFX=y
+CONFIG_DM_PMIC=y
+CONFIG_PMIC_STPMIC1=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_DM_REGULATOR_STM32_VREFBUF=y
+CONFIG_DM_REGULATOR_STPMIC1=y
+CONFIG_REMOTEPROC_STM32_COPRO=y
+CONFIG_RESET_SCMI=y
+CONFIG_DM_RNG=y
+CONFIG_RNG_STM32MP1=y
+CONFIG_DM_RTC=y
+CONFIG_RTC_STM32=y
+CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_STM32_QSPI=y
+CONFIG_STM32_SPI=y
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+# CONFIG_OPTEE_TA_AVB is not set
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_DM_USB_GADGET=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_GENERIC=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
+CONFIG_USB_GADGET_VENDOR_NUM=0x0483
+CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
+CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_DM_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
+CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
+CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
+CONFIG_VIDEO_STM32=y
+CONFIG_VIDEO_STM32_DSI=y
+CONFIG_VIDEO_STM32_MAX_XRES=1280
+CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
+CONFIG_ERRNO_STR=y
+CONFIG_FDT_FIXUP_PARTITIONS=y
+# CONFIG_LMB_USE_MAX_REGIONS is not set
+CONFIG_LMB_MEMORY_REGIONS=2
+CONFIG_LMB_RESERVED_REGIONS=16
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
