Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EB04031AC
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28129C5A4F3;
	Tue,  7 Sep 2021 23:59:44 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02A5DC59783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:41 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id s15so361549qta.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/5oLk1HSYOJFxkYq5yPbtzVz/Rv5fc90Z31uHqyNUz4=;
 b=RdZ662BU6vLpQmBm65e9iRMkusHEkUD9A0mG7N92rKoySYGyjdQaRCFAz002fUqOjX
 2e1RYk0WHxC8vrdu4pl0rAn/b/NPs/g7FUINL39aKhjG+qtyN9hY9syIXU6v3nbfUrZk
 6jdjzCDSG1vRv5CWg1jttcCIl3rm14GSIlMIqLa2oIdfmLwsbXGecNlcIRhd2E9ODl5T
 NugL85I73bKt142dAV44sNtvI5CFsm8xl7nbaKolJJzfVcct1rSgRagKFUJz37XB4bwg
 2q79/yn2pTGU7qvG9KQeJKKn9zJS+v8cMCwJOQw7DVKl9XetjxJlNWSoqrEXP8CKMump
 xxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/5oLk1HSYOJFxkYq5yPbtzVz/Rv5fc90Z31uHqyNUz4=;
 b=V8mizia45PzSG71NOrNI5seNuQvTy7KCkUfRt1mLv2Re2h4IeWPut1kTS9qpF4l9fJ
 ILh3dUpFtVoJezQ42N3gY/ETeQ4HtMTp1Jjvf9zAIB68D0AH8HMReR/IrTnH/NPKheP4
 WY50uNujf0opnQIAjyGHl6a1ykhDNPbaGjoMoxabHJCfGipFX3B6KDIDsKXh6jDh43Ul
 3bPRUWWJv2J8qge8eR1kBku3N1h54pOlvtedIxIIkCz6A7tzW+GSkAnd1VIbHEXAKmrH
 lwqO+PPcXlb2sYMBXBrY0y/1Vy8K2JPhUDJritg1OAx6G3k4xe1HBnp7fZPVBMv0jfAq
 2iaw==
X-Gm-Message-State: AOAM532kLKsXhiH6wgR4M6O9VtMbbAR3fe0CgmNLa944CglbjRsVxn+b
 045VS3NyoDm1D9WfjBCCo6W9wuGbK0A=
X-Google-Smtp-Source: ABdhPJwGXcWlNvXTKn3Y4ggDUiNM9Ia4VAvL3+9vn0WREbq8693u8gLE8JZ33CMN4qgVtL1rt3vkQg==
X-Received: by 2002:ac8:5a53:: with SMTP id o19mr1033179qta.29.1631059179999; 
 Tue, 07 Sep 2021 16:59:39 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:39 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:25 -0500
Message-Id: <20210907235933.2798330-4-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 03/11] stm32mp1: Add support for falcon
	mode boot from SD card
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

Falcon mode requires a board-specific mechanism to select between
fast and normal boot. This is done via spl_start_uboot()

Use the USER2 button as the selection mechanism. This is connected to
GPIO PA13. This GPIO is already accessible via the "st,fastboot-gpios"
devicetree node, but is is also aliased as "u-boot,falcon-gpios". This
is the only button on DK2 which accessible simultaneously to the RESET
button. USER2 is too close, and I can't fit my fingers to press both.

The fact that USER2 is also used for android fastboot is of no
consequence. One can let go of USER2 after SPL but before being
sampled by u-boot. If that is missed, it's okay, u-boot tries to
initialize the ethernet, which can be stopped with a Ctr-C. This
conveniently opens up a u-boot shell.

Offsets for raw MMC loading are defined. These point to the partition
after "ssbl". Offsets for SPI are not defined, and thus SPL_LOAD_SPI
must be disabled to avoid a build failure. The only way to accommodate
this is to add a new defconfig, adventurously named stm32mp1_falcon.

The baudrate is set to 2 Mbaud, as the point of this config is to boot
fast. The default devicetree is set to -dk2. This is because EV1 does
not have a crypto-enabled CPU, and thus enabling ECDSA support would
have made far less sense. That and all the goodies with FIT in SPL
are enabled to give this config some continuous integration TLC.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |   2 +
 board/st/stm32mp1/spl.c                  |  39 +++++
 configs/stm32mp15_falcon_defconfig       | 181 +++++++++++++++++++++++
 3 files changed, 222 insertions(+)
 create mode 100644 configs/stm32mp15_falcon_defconfig

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 0101962ea5..b314ce2dac 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -16,6 +16,8 @@
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
 		u-boot,mmc-env-partition = "fip";
+		/* This is the same as fastboot-gpios. This is on purpose */
+		u-boot,falcon-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
 		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index 8e4549a1b3..921d0190e0 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -8,6 +8,7 @@
 #include <init.h>
 #include <asm/io.h>
 #include <asm/arch/sys_proto.h>
+#include <asm/gpio.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include "../common/stpmic1.h"
@@ -29,6 +30,44 @@ int board_early_init_f(void)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SPL_OS_BOOT)
+int spl_start_uboot(void)
+{
+	ofnode node;
+	struct gpio_desc gpio;
+	int boot_uboot = 1;
+
+	node = ofnode_path("/config");
+	if (!ofnode_valid(node)) {
+		pr_warn("%s: no /config node?\n", __func__);
+		return 0;
+	}
+
+	if (gpio_request_by_name_nodev(node, "u-boot,falcon-gpios", 0, &gpio,
+				       GPIOD_IS_IN)) {
+		pr_warn("%s: could not find a /config/u-boot,falcon-gpios\n",
+			__func__);
+		return 1;
+	}
+
+	boot_uboot = dm_gpio_get_value(&gpio);
+	dm_gpio_free(NULL, &gpio);
+
+	return boot_uboot;
+}
+
+#if IS_ENABLED(CONFIG_ARMV7_NONSEC)
+/*
+ * A bit of a hack, but armv7_boot_nonsec() is provided by bootm.c. This is not
+ * available in SPL, so we have to provide an implementation.
+ */
+bool armv7_boot_nonsec(void)
+{
+	return 0;
+}
+#endif /* CONFIG_ARMV7_NONSEC */
+#endif /* CONFIG_SPL_OS_BOOT */
+
 #ifdef CONFIG_DEBUG_UART_BOARD_INIT
 void board_debug_uart_init(void)
 {
diff --git a/configs/stm32mp15_falcon_defconfig b/configs/stm32mp15_falcon_defconfig
new file mode 100644
index 0000000000..f86ef41589
--- /dev/null
+++ b/configs/stm32mp15_falcon_defconfig
@@ -0,0 +1,181 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_SYS_MEMTEST_START=0xc0000000
+CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_ENV_OFFSET=0x280000
+CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-dk2"
+CONFIG_SPL_TEXT_BASE=0x2FFC2500
+CONFIG_SPL_MMC_SUPPORT=y
+CONFIG_SPL=y
+CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_CMD_STM32KEY=y
+CONFIG_CMD_STM32PROG=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
+CONFIG_TYPEC_STUSB160X=y
+# CONFIG_ARMV7_VIRT is not set
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_FIT=y
+CONFIG_SPL_LOAD_FIT=y
+CONFIG_SPL_LOAD_FIT_APPLY_OVERLAY=y
+# CONFIG_USE_SPL_FIT_GENERATOR is not set
+CONFIG_BOOTDELAY=1
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_SPL_LOG=y
+CONFIG_BOARD_EARLY_INIT_F=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
+CONFIG_SPL_ENV_SUPPORT=y
+CONFIG_SPL_I2C=y
+CONFIG_SPL_MTD_SUPPORT=y
+CONFIG_SPL_OS_BOOT=y
+CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0x1422
+CONFIG_SPL_POWER=y
+CONFIG_SPL_OPTEE=y
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
+# CONFIG_SPL_DOS_PARTITION is not set
+CONFIG_OF_LIVE=y
+CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
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
+# CONFIG_SPL_ENV_IS_NOWHERE is not set
+# CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
+CONFIG_STM32_ADC=y
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
+# CONFIG_SPL_PINCTRL_FULL is not set
+CONFIG_PINCTRL_STMFX=y
+CONFIG_DM_PMIC=y
+# CONFIG_SPL_PMIC_CHILDREN is not set
+CONFIG_PMIC_STPMIC1=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_DM_REGULATOR_STM32_VREFBUF=y
+CONFIG_DM_REGULATOR_STPMIC1=y
+CONFIG_REMOTEPROC_STM32_COPRO=y
+CONFIG_DM_RNG=y
+CONFIG_RNG_STM32MP1=y
+CONFIG_DM_RTC=y
+CONFIG_RTC_STM32=y
+CONFIG_BAUDRATE=2000000
+CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_STM32_QSPI=y
+CONFIG_STM32_SPI=y
+CONFIG_SYSRESET_CMD_POWEROFF=y
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+CONFIG_USB=y
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
+CONFIG_ECDSA=y
+CONFIG_SPL_ECDSA_VERIFY=y
+CONFIG_ERRNO_STR=y
+CONFIG_FDT_FIXUP_PARTITIONS=y
+# CONFIG_LMB_USE_MAX_REGIONS is not set
+CONFIG_LMB_MEMORY_REGIONS=2
+CONFIG_LMB_RESERVED_REGIONS=16
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
