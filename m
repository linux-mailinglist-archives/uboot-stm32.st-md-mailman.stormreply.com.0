Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1E25CE58
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Jul 2019 13:26:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A2E4C6A5F2
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Jul 2019 11:26:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3E7DC6A5EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2019 11:26:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62BQIKP002270; Tue, 2 Jul 2019 13:26:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=hlMxHYNtTynG4lQcEX7lax2L/L/VlVqgts5DI4b10vg=;
 b=wXcUqjzrn/XacuFUf2TQlfr/d/bQFGs7xXbafhZaDeCbv7mRmKsU7nHR9CAdZyBVK1L4
 xuavuyQPkqZRbfy7963b0XfQon2ju1G9/KIQJuGZJn05u0arb55UpWnxqeKbJ345Zfrm
 LKBZqAUDMgTYwMCwucAVfDZfH59x3AF52K1waO9BmWstzBiQyFot4dOPpCeBNmE1LPwA
 shM7eeHK7lFS1wf9K0f3rZnSeWZDxuukfiCx3VLYLnUFeJ+TJw4YF/PPQfhETnFVgsvo
 6dP7h+lVhum1btfDO8R+YqwS/q3bCS4LulrdcijM/G4c12C40VL+JYWn+TssdfeXPoHy iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdw49uun8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 13:26:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B57B23D;
 Tue,  2 Jul 2019 11:26:15 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99C5B27FF;
 Tue,  2 Jul 2019 11:26:15 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 13:26:15 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 13:26:14
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Jul 2019 13:26:06 +0200
Message-ID: <1562066767-8221-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
References: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/3] stm32mp1: add configuration op-tee
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

Add support of Trusted boot chain with OP-TEE
- reserved 32MB at the end of the DDR for OP-TEE

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/Kconfig     |  12 ++++-
 board/st/stm32mp1/MAINTAINERS     |   1 +
 board/st/stm32mp1/README          |  29 ++++++++---
 board/st/stm32mp1/stm32mp1.c      |   4 +-
 configs/stm32mp15_optee_defconfig | 103 ++++++++++++++++++++++++++++++++++++++
 include/configs/stm32mp1.h        |  13 +++++
 6 files changed, 153 insertions(+), 9 deletions(-)
 create mode 100644 configs/stm32mp15_optee_defconfig

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index d9ad6b4..a00c8ab 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -62,7 +62,17 @@ config STM32MP1_TRUSTED
 		Say Y here to enable boot with TF-A
 		Trusted boot chain is :
 		BootRom => TF-A.stm32 (clock & DDR) => U-Boot.stm32
-		TF-A monitor provides proprietary smc to manage secure devices
+		TF-A monitor provides proprietary SMC to manage secure devices
+
+config STM32MP1_OPTEE
+	bool "Support trusted boot with TF-A and OP-TEE"
+	depends on STM32MP1_TRUSTED
+	default n
+	help
+		Say Y here to enable boot with TF-A and OP-TEE
+		Trusted boot chain is :
+		BootRom => TF-A.stm32 (clock & DDR) => OP-TEE => U-Boot.stm32
+		OP-TEE monitor provides ST SMC to access to secure resources
 
 config SYS_TEXT_BASE
 	prompt "U-Boot base address"
diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
index 0a2eddb..3bf4c21 100644
--- a/board/st/stm32mp1/MAINTAINERS
+++ b/board/st/stm32mp1/MAINTAINERS
@@ -5,5 +5,6 @@ S:	Maintained
 F:	arch/arm/dts/stm32mp157*
 F:	board/st/stm32mp1
 F:	configs/stm32mp15_basic_defconfig
+F:	configs/stm32mp15_optee_defconfig
 F:	configs/stm32mp15_trusted_defconfig
 F:	include/configs/stm32mp1.h
diff --git a/board/st/stm32mp1/README b/board/st/stm32mp1/README
index b0c8325..583d92e 100644
--- a/board/st/stm32mp1/README
+++ b/board/st/stm32mp1/README
@@ -47,7 +47,7 @@ BootRom => FSBL in SYSRAM => SSBL in DDR => OS (Linux Kernel)
 with FSBL = First Stage Bootloader
      SSBL = Second Stage Bootloader
 
-2 boot configurations are supported:
+3 boot configurations are supported:
 
 1) The "Trusted" boot chain (defconfig_file : stm32mp15_trusted_defconfig)
    BootRom => FSBL = Trusted Firmware-A (TF-A) => SSBL = U-Boot
@@ -56,7 +56,15 @@ with FSBL = First Stage Bootloader
    U-Boot is running in normal world and uses TF-A monitor
    to access to secure resources
 
-2) The "Basic" boot chain (defconfig_file : stm32mp15_basic_defconfig)
+2) The "Trusted" boot chain with OP-TEE
+   (defconfig_file : stm32mp15_optee_defconfig)
+   BootRom => FSBL = Trusted Firmware-A (TF-A) => SSBL = U-Boot
+   TF-A performs a full initialization of Secure peripherals and installs OP-TEE
+   from specific partitions (teeh, teed, teex).
+   U-Boot is running in normal world and uses OP-TEE monitor to access
+   to secure resources.
+
+3) The "Basic" boot chain (defconfig_file : stm32mp15_basic_defconfig)
    BootRom => FSBL = U-Boot SPL => SSBL = U-Boot
    SPL has limited security initialisation
    U-Boot is running in secure mode and provide a secure monitor to the kernel
@@ -109,6 +117,7 @@ the supported device trees for stm32mp157 are:
 
 	for example: use one output directory for each configuration
 	# export KBUILD_OUTPUT=stm32mp15_trusted
+	# export KBUILD_OUTPUT=stm32mp15_optee
 	# export KBUILD_OUTPUT=stm32mp15_basic
 
 4. Configure U-Boot:
@@ -116,6 +125,7 @@ the supported device trees for stm32mp157 are:
 	# make <defconfig_file>
 
 	- For trusted boot mode : "stm32mp15_trusted_defconfig"
+	- For trusted with OP-TEE boot mode : "stm32mp15_optee_defconfig"
 	- For basic boot mode: "stm32mp15_basic_defconfig"
 
 5. Configure the device-tree and build the U-Boot image:
@@ -129,20 +139,25 @@ the supported device trees for stm32mp157 are:
 	# make stm32mp15_trusted_defconfig
 	# make DEVICE_TREE=stm32mp157c-ev1 all
 
-  b) basic boot on ev1
+  b) trusted with OP-TEE boot on dk2
+	# export KBUILD_OUTPUT=stm32mp15_optee
+	# make stm32mp15_optee_defconfig
+	# make DEVICE_TREE=stm32mp157c-dk2 all
+
+  c) basic boot on ev1
 	# export KBUILD_OUTPUT=stm32mp15_basic
 	# make stm32mp15_basic_defconfig
 	# make DEVICE_TREE=stm32mp157c-ev1 all
 
-  c) basic boot on ed1
+  d) basic boot on ed1
 	# export KBUILD_OUTPUT=stm32mp15_basic
 	# make stm32mp15_basic_defconfig
 	# make DEVICE_TREE=stm32mp157c-ed1 all
 
-  d) basic boot on dk2
+  e) basic boot on dk1
 	# export KBUILD_OUTPUT=stm32mp15_basic
 	# make stm32mp15_basic_defconfig
-	# make DEVICE_TREE=stm32mp157c-dk2 all
+	# make DEVICE_TREE=stm32mp157a-dk1 all
 
   d) basic boot on avenger96
 	# export KBUILD_OUTPUT=stm32mp15_basic
@@ -157,7 +172,7 @@ the supported device trees for stm32mp157 are:
   So in the output directory (selected by KBUILD_OUTPUT),
   you can found the needed files:
 
-  a) For Trusted boot
+  a) For Trusted boot (with or without OP-TEE)
    + FSBL = tf-a.stm32 (provided by TF-A compilation)
    + SSBL = u-boot.stm32
 
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 7769293..d62d180 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -76,7 +76,9 @@ int checkboard(void)
 	const char *fdt_compat;
 	int fdt_compat_len;
 
-	if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
+	if (IS_ENABLED(CONFIG_STM32MP1_OPTEE))
+		mode = "trusted with OP-TEE";
+	else if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
 		mode = "trusted";
 	else
 		mode = "basic";
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
new file mode 100644
index 0000000..f3e4ea6
--- /dev/null
+++ b/configs/stm32mp15_optee_defconfig
@@ -0,0 +1,103 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_TARGET_STM32MP1=y
+CONFIG_STM32MP1_OPTEE=y
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_FIT=y
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_SYS_PROMPT="STM32MP> "
+# CONFIG_CMD_BOOTD is not set
+# CONFIG_CMD_ELF is not set
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_XIMG is not set
+# CONFIG_CMD_EXPORTENV is not set
+# CONFIG_CMD_IMPORTENV is not set
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_ADC=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_DFU=y
+CONFIG_CMD_FUSE=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_GPT=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_SF=y
+CONFIG_CMD_SPI=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_PMIC=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_MTDPARTS=y
+CONFIG_CMD_UBI=y
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_IS_IN_UBI=y
+CONFIG_ENV_EXT4_INTERFACE="mmc"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
+CONFIG_ENV_EXT4_FILE="/uboot.env"
+CONFIG_ENV_UBI_PART="UBI"
+CONFIG_ENV_UBI_VOLUME="uboot_config"
+CONFIG_STM32_ADC=y
+CONFIG_USB_FUNCTION_FASTBOOT=y
+CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
+CONFIG_FASTBOOT_BUF_SIZE=0x02000000
+CONFIG_FASTBOOT_USB_DEV=1
+CONFIG_FASTBOOT_FLASH=y
+CONFIG_FASTBOOT_FLASH_MMC_DEV=1
+CONFIG_DM_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_STM32F7=y
+CONFIG_LED=y
+CONFIG_LED_GPIO=y
+CONFIG_DM_MMC=y
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_STM32_SDMMC2=y
+CONFIG_MTD=y
+CONFIG_NAND=y
+CONFIG_NAND_STM32_FMC2=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH=y
+CONFIG_SPI_FLASH_BAR=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
+CONFIG_SPI_FLASH_MTD=y
+CONFIG_DM_ETH=y
+CONFIG_DWC_ETH_QOS=y
+CONFIG_PHY=y
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_PINCONF=y
+CONFIG_PINCTRL_STMFX=y
+CONFIG_DM_PMIC=y
+CONFIG_PMIC_STPMIC1=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_DM_REGULATOR_STM32_VREFBUF=y
+CONFIG_DM_REGULATOR_STPMIC1=y
+CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_STM32_SERIAL=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_STM32_QSPI=y
+CONFIG_STM32_SPI=y
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
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 6626be7..d4805c2 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -28,6 +28,10 @@
 #define CONFIG_SYS_SDRAM_BASE			STM32_DDR_BASE
 #define CONFIG_SYS_INIT_SP_ADDR			CONFIG_SYS_TEXT_BASE
 
+#ifdef CONFIG_STM32MP1_OPTEE
+#define CONFIG_SYS_MEM_TOP_HIDE			SZ_32M
+#endif /* CONFIG_STM32MP1_OPTEE */
+
 /*
  * Console I/O buffer size
  */
@@ -125,10 +129,19 @@
 
 #include <config_distro_bootcmd.h>
 
+#ifdef CONFIG_STM32MP1_OPTEE
+/* with OPTEE: define specific MTD partitions = teeh, teed, teex */
+#define STM32MP_MTDPARTS \
+	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),256k(teeh),256k(teed),256k(teex),-(nor_user)\0" \
+	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),512k(teeh),512k(teed),512k(teex),-(UBI)\0"
+
+#else /* CONFIG_STM32MP1_OPTEE */
 #define STM32MP_MTDPARTS \
 	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),-(nor_user)\0" \
 	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0"
 
+#endif /* CONFIG_STM32MP1_OPTEE */
+
 #ifndef CONFIG_SYS_MTDPARTS_RUNTIME
 #undef STM32MP_MTDPARTS
 #define STM32MP_MTDPARTS
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
