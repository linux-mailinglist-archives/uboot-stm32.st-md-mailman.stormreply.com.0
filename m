Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C791896CF
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0588FC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A116AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8Illu024193; Wed, 18 Mar 2020 09:23:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8bZ2Bay4JMpzYkuXN1you1Lahg2Pl8DVLZNgOaxF4QM=;
 b=fT9Z62swZy5/hPuQGKK/q2Njir6NSTSUGST5B+jBjBSkpx4IND1+1AWEDE1piuZVd0xw
 saQzKbQACSpefHF9xeWa94+Bw4uyuk3A//4rTNAjPqB1JCVSkX+EehmjZUR4VptfRNyq
 eTb8LSt9amGURnwYgPy3bx8oonSRr3Frnh3XzQqc5zF7IsBkpdUFj+/n18wsaAfeY1Px
 5pBkabl4ojbt7UROOPSwIlwRml778B3dttMXef9wfGaQcDNj4XuSe5WabsC0W1NbqkCC
 Y4u00WVSinZumBsFZ3fHc50Wk29ooblwiRQ3kl0p6n+bC7cwNx8PErprdHKIhjQ7wGJ4 Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4w9stv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:23:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F262100034;
 Wed, 18 Mar 2020 09:23:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F3AF21CA91;
 Wed, 18 Mar 2020 09:23:05 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:23:04 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:51 +0100
Message-ID: <20200318082254.7522-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [Uboot-stm32] [PATCH 08/11] configs: stm32mp1: remove optee
	defconfig
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

As the op-tee presence is detected by U-boot, the stm32mp15_optee_defconfig
is identical to stm32mp15_trusted_defconfig and can be removed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/MAINTAINERS     |   1 -
 configs/stm32mp15_optee_defconfig | 134 ------------------------------
 doc/board/st/stm32mp1.rst         |  32 ++-----
 3 files changed, 7 insertions(+), 160 deletions(-)
 delete mode 100644 configs/stm32mp15_optee_defconfig

diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
index 2930947716..96c4559033 100644
--- a/board/st/stm32mp1/MAINTAINERS
+++ b/board/st/stm32mp1/MAINTAINERS
@@ -6,6 +6,5 @@ S:	Maintained
 F:	arch/arm/dts/stm32mp15*
 F:	board/st/stm32mp1/
 F:	configs/stm32mp15_basic_defconfig
-F:	configs/stm32mp15_optee_defconfig
 F:	configs/stm32mp15_trusted_defconfig
 F:	include/configs/stm32mp1.h
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
deleted file mode 100644
index f0d524d344..0000000000
--- a/configs/stm32mp15_optee_defconfig
+++ /dev/null
@@ -1,134 +0,0 @@
-CONFIG_ARM=y
-CONFIG_ARCH_STM32MP=y
-CONFIG_SYS_MALLOC_F_LEN=0x3000
-CONFIG_ENV_SECT_SIZE=0x40000
-CONFIG_ENV_OFFSET=0x280000
-CONFIG_TARGET_ST_STM32MP15x=y
-CONFIG_ENV_OFFSET_REDUND=0x2C0000
-CONFIG_DISTRO_DEFAULTS=y
-CONFIG_FIT=y
-CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
-CONFIG_SYS_PROMPT="STM32MP> "
-# CONFIG_CMD_BOOTD is not set
-# CONFIG_CMD_ELF is not set
-# CONFIG_CMD_IMI is not set
-# CONFIG_CMD_XIMG is not set
-# CONFIG_CMD_EXPORTENV is not set
-# CONFIG_CMD_IMPORTENV is not set
-CONFIG_CMD_MEMINFO=y
-CONFIG_CMD_MEMTEST=y
-CONFIG_CMD_ADC=y
-CONFIG_CMD_CLK=y
-CONFIG_CMD_DFU=y
-CONFIG_CMD_FUSE=y
-CONFIG_CMD_GPIO=y
-CONFIG_CMD_GPT=y
-CONFIG_CMD_I2C=y
-CONFIG_CMD_MMC=y
-CONFIG_CMD_MTD=y
-CONFIG_CMD_REMOTEPROC=y
-CONFIG_CMD_SPI=y
-CONFIG_CMD_USB=y
-CONFIG_CMD_USB_MASS_STORAGE=y
-CONFIG_CMD_BMP=y
-CONFIG_CMD_CACHE=y
-CONFIG_CMD_TIME=y
-CONFIG_CMD_TIMER=y
-CONFIG_CMD_PMIC=y
-CONFIG_CMD_REGULATOR=y
-CONFIG_CMD_EXT4_WRITE=y
-CONFIG_CMD_MTDPARTS=y
-CONFIG_CMD_UBI=y
-CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
-CONFIG_ENV_IS_NOWHERE=y
-CONFIG_ENV_IS_IN_EXT4=y
-CONFIG_ENV_IS_IN_SPI_FLASH=y
-CONFIG_ENV_IS_IN_UBI=y
-CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
-CONFIG_ENV_EXT4_INTERFACE="mmc"
-CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
-CONFIG_ENV_EXT4_FILE="/uboot.env"
-CONFIG_ENV_UBI_PART="UBI"
-CONFIG_ENV_UBI_VOLUME="uboot_config"
-CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
-CONFIG_SYS_RELOC_GD_ENV_ADDR=y
-CONFIG_STM32_ADC=y
-CONFIG_DFU_MMC=y
-CONFIG_DFU_RAM=y
-CONFIG_DFU_MTD=y
-CONFIG_DFU_VIRT=y
-CONFIG_SET_DFU_ALT_INFO=y
-CONFIG_USB_FUNCTION_FASTBOOT=y
-CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
-CONFIG_FASTBOOT_BUF_SIZE=0x02000000
-CONFIG_FASTBOOT_USB_DEV=1
-CONFIG_FASTBOOT_FLASH=y
-CONFIG_FASTBOOT_FLASH_MMC_DEV=1
-CONFIG_DM_HWSPINLOCK=y
-CONFIG_HWSPINLOCK_STM32=y
-CONFIG_DM_I2C=y
-CONFIG_SYS_I2C_STM32F7=y
-CONFIG_LED=y
-CONFIG_LED_GPIO=y
-CONFIG_DM_MAILBOX=y
-CONFIG_STM32_IPCC=y
-CONFIG_DM_MMC=y
-CONFIG_SUPPORT_EMMC_BOOT=y
-CONFIG_STM32_SDMMC2=y
-CONFIG_MTD=y
-CONFIG_DM_MTD=y
-CONFIG_SYS_MTDPARTS_RUNTIME=y
-CONFIG_MTD_RAW_NAND=y
-CONFIG_NAND_STM32_FMC2=y
-CONFIG_MTD_SPI_NAND=y
-CONFIG_DM_SPI_FLASH=y
-CONFIG_SPI_FLASH_MACRONIX=y
-CONFIG_SPI_FLASH_SPANSION=y
-CONFIG_SPI_FLASH_STMICRO=y
-CONFIG_SPI_FLASH_WINBOND=y
-# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
-CONFIG_SPI_FLASH_MTD=y
-CONFIG_DM_ETH=y
-CONFIG_DWC_ETH_QOS=y
-CONFIG_PHY=y
-CONFIG_PHY_STM32_USBPHYC=y
-CONFIG_PINCONF=y
-CONFIG_PINCTRL_STMFX=y
-CONFIG_DM_PMIC=y
-CONFIG_PMIC_STPMIC1=y
-CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_REGULATOR_GPIO=y
-CONFIG_DM_REGULATOR_STM32_VREFBUF=y
-CONFIG_DM_REGULATOR_STPMIC1=y
-CONFIG_REMOTEPROC_STM32_COPRO=y
-CONFIG_DM_RNG=y
-CONFIG_RNG_STM32MP1=y
-CONFIG_DM_RTC=y
-CONFIG_RTC_STM32=y
-CONFIG_SERIAL_RX_BUFFER=y
-CONFIG_SPI=y
-CONFIG_DM_SPI=y
-CONFIG_STM32_QSPI=y
-CONFIG_STM32_SPI=y
-CONFIG_TEE=y
-CONFIG_OPTEE=y
-# CONFIG_OPTEE_TA_AVB is not set
-CONFIG_USB=y
-CONFIG_DM_USB=y
-CONFIG_DM_USB_GADGET=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_GENERIC=y
-CONFIG_USB_GADGET=y
-CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
-CONFIG_USB_GADGET_VENDOR_NUM=0x0483
-CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
-CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
-CONFIG_BACKLIGHT_GPIO=y
-CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
-CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
-CONFIG_VIDEO_STM32=y
-CONFIG_VIDEO_STM32_DSI=y
-CONFIG_VIDEO_STM32_MAX_XRES=1280
-CONFIG_VIDEO_STM32_MAX_YRES=800
-CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index b7a0fbfd03..7fccdfbb94 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -80,32 +80,16 @@ defconfig_file : stm32mp15_trusted_defconfig
     +             +-------------------------+------------+-------+
     |             |Trusted Firmware-A (TF-A)| U-Boot     | Linux |
     +-------------+-------------------------+------------+-------+
-    | TrustZone   |TF-A secure monitor                           |
+    | TrustZone   |secure monitor                                |
     +-------------+-------------------------+------------+-------+
 
 TF-A performs a full initialization of Secure peripherals and installs a
-secure monitor (BL32=SPMin).
+secure monitor, BL32:
 
-U-Boot is running in normal world and uses TF-A monitor to access
-to secure resources.
-
-The **Trusted** boot chain with **OP-TEE**
-``````````````````````````````````````````
-
-defconfig_file : stm32mp15_optee_defconfig
-
-    +-------------+-------------------------+------------+-------+
-    |  ROM code   | FSBL                    | SSBL       | OS    |
-    +             +-------------------------+------------+-------+
-    |             |Trusted Firmware-A (TF-A)| U-Boot     | Linux |
-    +-------------+-------------------------+------------+-------+
-    | TrustZone   |OP-TEE                                        |
-    +-------------+-------------------------+------------+-------+
-
-TF-A performs a full initialization of Secure peripherals and installs OP-TEE
-from specific partitions (teeh, teed, teex).
+  * SPMin provided by TF-A or
+  * OP-TEE from specific partitions (teeh, teed, teex).
 
-U-Boot is running in normal world and uses OP-TEE monitor to access
+U-Boot is running in normal world and uses the secure monitor to access
 to secure resources.
 
 The **Basic** boot chain
@@ -180,7 +164,6 @@ Build Procedure
    for example: use one output directory for each configuration::
 
    # export KBUILD_OUTPUT=stm32mp15_trusted
-   # export KBUILD_OUTPUT=stm32mp15_optee
    # export KBUILD_OUTPUT=stm32mp15_basic
 
    you can build outside of code directory::
@@ -194,7 +177,6 @@ Build Procedure
    with <defconfig_file>:
 
    - For **trusted** boot mode : **stm32mp15_trusted_defconfig**
-   - For **trusted** with OP-TEE boot mode : **stm32mp15_optee_defconfig**
    - For basic boot mode: stm32mp15_basic_defconfig
 
 5. Configure the device-tree and build the U-Boot image::
@@ -211,8 +193,8 @@ Build Procedure
 
   b) trusted with OP-TEE boot on dk2::
 
-      # export KBUILD_OUTPUT=stm32mp15_optee
-      # make stm32mp15_optee_defconfig
+      # export KBUILD_OUTPUT=stm32mp15_trusted
+      # make stm32mp15_trusted_defconfig
       # make DEVICE_TREE=stm32mp157c-dk2 all
 
   c) basic boot on ev1::
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
